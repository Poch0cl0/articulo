import http.client
import json
import threading
import tempfile
import unittest
from pathlib import Path

from motor.model import Config, Policy, simulate
from motor.ui import make_server, run_simulation


class InterfaceTests(unittest.TestCase):
    def test_interface_matches_engine(self):
        response=run_simulation({'config':{'horizon':60},'seed':42,'compare':True})
        expected=simulate(Config(horizon=60),Policy(),42,trace=True)
        self.assertEqual(response['result']['patients'],expected['patients'])
        self.assertEqual(response['result']['trace'],expected['trace'])
        self.assertEqual(len(response['comparisons']),4)
        for comparison in response['comparisons']:
            self.assertEqual(comparison['metrics']['arrivals'],expected['metrics']['arrivals'])

    def test_empty_demand_and_json_weights(self):
        response=run_simulation({'config':{'demand':0,'priority_weights':[4,2,1]},'compare':True})
        self.assertEqual(response['result']['patients'],[])
        self.assertIsNone(response['result']['metrics']['wait_censored'])
        json.dumps(response,allow_nan=False)

    def test_interactive_limits_and_schema(self):
        for payload in [[],{'seed':True},{'compare':'yes'},{'config':None},
                        {'config':{'horizon':1441}},{'config':{'dt':.001}},
                        {'config':{'demand':6}},{'config':{'doctors':201}},
                        {'policy':{'name':'unknown'}},{'config':{'beta':float('nan')}}]:
            with self.subTest(payload=payload),self.assertRaises(ValueError):
                run_simulation(payload)

    def test_http_routes_and_validation(self):
        temporary=tempfile.TemporaryDirectory()
        server=make_server(0,Path(temporary.name)/'hospital.sqlite3')
        thread=threading.Thread(target=server.serve_forever,daemon=True)
        thread.start()
        try:
            connection=http.client.HTTPConnection('127.0.0.1',server.server_port,timeout=10)
            for route in ['/', '/operations', '/operations?settings=1', '/simulation', '/simulator', '/simulation-shell.js',
                          '/app.js', '/hospital3d.js', '/style.css', '/api/defaults']:
                connection.request('GET',route)
                response=connection.getresponse()
                self.assertEqual(response.status,200)
                self.assertTrue(response.read())
            connection.request('GET','/../model.py')
            response=connection.getresponse();self.assertEqual(response.status,404);response.read()
            for body,status in [('{}',200),('{',400),('{"config":{"dt":0}}',400)]:
                connection.request('POST','/api/simulate',body,{'Content-Type':'application/json'})
                response=connection.getresponse();self.assertEqual(response.status,status)
                self.assertIsInstance(json.loads(response.read()),dict)
            connection.request('POST','/api/simulate','{}',{'Content-Type':'application/json','Origin':'https://example.com'})
            response=connection.getresponse();self.assertEqual(response.status,403);response.read()
            connection.close()
        finally:
            server.shutdown();server.server_close();thread.join();temporary.cleanup()


if __name__=='__main__':
    unittest.main()
