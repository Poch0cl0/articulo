import copy
import http.client
import json
from pathlib import Path
import threading
import unittest

from motor.cohort import parse_cohort
from motor.model import Config, Patient, Policy, simulate
from motor.ui import make_server, run_simulation


EXAMPLE = Path(__file__).with_name('web') / 'cohorte-ejemplo.json'


class CohortTests(unittest.TestCase):
    def setUp(self):
        self.document=json.loads(EXAMPLE.read_text(encoding='utf-8'))

    def test_replay_matches_direct_engine_and_all_policies(self):
        before=copy.deepcopy(self.document)
        result=run_simulation({'cohort':self.document,'compare':True})
        patients=[Patient(**row) for row in self.document['patients']]
        expected=simulate(Config(),Policy(),patients=patients,trace=True)
        self.assertEqual(result['result']['patients'],expected['patients'])
        self.assertEqual(result['result']['trace'],expected['trace'])
        self.assertEqual(result['population']['records'],8)
        for entry in result['comparisons']:
            metrics=simulate(Config(),Policy(**entry['policy']),patients=patients)['metrics']
            self.assertEqual({k:v for k,v in entry['metrics'].items() if k!='runtime_s'},
                             {k:v for k,v in metrics.items() if k!='runtime_s'})
        self.assertEqual(before,self.document)

    def test_seed_independence_and_provenance_hash(self):
        a=run_simulation({'cohort':self.document,'seed':1})
        b=run_simulation({'cohort':self.document,'seed':999})
        self.assertEqual(a['result']['patients'],b['result']['patients'])
        self.assertEqual(a['population'],b['population'])
        self.document['patients'][0]['service']+=1
        _,changed=parse_cohort(self.document,Config())
        self.assertNotEqual(a['population']['sha256'],changed['sha256'])

    def test_reject_ambiguous_measurements_and_invalid_patients(self):
        for field,value in [('service',0),('service',float('nan')),('arrival',480),
                            ('arrival',-1),('priority',True),('priority',5),
                            ('ventilation',True),('id',2**53)]:
            bad=copy.deepcopy(self.document);bad['patients'][0][field]=value
            with self.subTest(field=field,value=value),self.assertRaises(ValueError):
                parse_cohort(bad,Config())
        for key,value in [('work_unit','length_of_stay'),('kind','NHAMCS'),('version',True),('patients',[])]:
            bad=copy.deepcopy(self.document);bad[key]=value
            with self.subTest(key=key),self.assertRaises(ValueError):parse_cohort(bad,Config())
        self.document['patients'][0]['name']='not allowed'
        with self.assertRaises(ValueError):parse_cohort(self.document,Config())

    def test_no_silent_drops_or_rescaling(self):
        for c in [Config(horizon=20),Config(demand=2),Config(service_scale=2)]:
            with self.assertRaises(ValueError):parse_cohort(self.document,c)
        self.document['patients'][1]['id']=0
        with self.assertRaises(ValueError):parse_cohort(self.document,Config())

    def test_resource_and_horizon_invariants(self):
        response=run_simulation({'cohort':self.document,'config':{'doctors':0},'compare':True})
        for row in response['result']['trace']:
            self.assertEqual(row['active'],0)
            self.assertEqual(row['finished'],0)
        self.assertEqual(response['result']['metrics']['waiting'],8)

    def test_http_cohort_and_extended_body_limit(self):
        server=make_server(0);worker=threading.Thread(target=server.serve_forever,daemon=True);worker.start()
        try:
            connection=http.client.HTTPConnection('127.0.0.1',server.server_port,timeout=30)
            connection.request('GET','/cohorte-ejemplo.json')
            response=connection.getresponse();self.assertEqual(response.status,200)
            self.assertEqual(json.loads(response.read()),self.document)
            body=json.dumps({'cohort':self.document})+' '*17000
            connection.request('POST','/api/simulate',body,{'Content-Type':'application/json'})
            response=connection.getresponse();self.assertEqual(response.status,200)
            self.assertEqual(json.loads(response.read())['population']['records'],8)
            self.document['patients'][0]['arrival']=480
            connection.request('POST','/api/simulate',json.dumps({'cohort':self.document}),{'Content-Type':'application/json'})
            response=connection.getresponse();self.assertEqual(response.status,400);response.read()
            connection.close()
        finally:server.shutdown();server.server_close();worker.join()


if __name__=='__main__':unittest.main()
