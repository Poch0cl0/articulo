import json
import math
import unittest
import http.client
import threading
from motor.ml import validate_profile, model_status, predict_profile, clean_features
from motor.ui import make_server


class MLTests(unittest.TestCase):
    def test_reject_invalid_or_leaking_fields(self):
        for profile in ({}, {'age': True}, {'age': float('nan')}, {'sex': 1.5},
                        {'triage': 7}, {'LOV': 30}, {'age': -9}):
            with self.subTest(profile=profile), self.assertRaises(ValueError):
                validate_profile(profile)
        self.assertTrue(math.isnan(validate_profile({'age': 40})['pulse']))

    def test_source_coding(self):
        import pandas as pd
        raw = pd.DataFrame(dict(AGE=[40,-9], SEX=[1,2], IMMEDR=[3,7], PULSE=[80,998],
            RESPR=[18,-9], BPSYS=[120,-9], BPDIAS=[80,998], PAINSCALE=[4,-8],
            TEMPF=[986,-9], ARREMS=[1,2], ARRTIME=['1430','2460']))
        x=clean_features(raw)
        self.assertAlmostEqual(x.temperature_c.iloc[0],37)
        self.assertEqual(x.arrival_hour.iloc[0],14.5)
        self.assertEqual(x.ambulance.tolist(),[1,0])
        self.assertTrue(x.loc[1,['age','triage','pulse','diastolic','pain','temperature_c','arrival_hour']].isna().all())

    @unittest.skipUnless(model_status()['available'], 'Train artifacts first')
    def test_artifacts_and_http_inference(self):
        report=model_status()['report']
        groups=[set(v['hospitals']) for v in report['split'].values()]
        self.assertFalse(groups[0]&groups[1] or groups[0]&groups[2] or groups[1]&groups[2])
        direct=predict_profile({'age':40,'triage':3})
        self.assertTrue(0<=direct['predictions']['hospitalization']['value']<=1)
        server=make_server(0)
        worker=threading.Thread(target=server.serve_forever,daemon=True);worker.start()
        try:
            connection=http.client.HTTPConnection('127.0.0.1',server.server_port,timeout=30)
            for body,status in [({'age':40,'triage':3},200),({'age':True},400),({},400)]:
                connection.request('POST','/api/ml/predict',json.dumps(body),{'Content-Type':'application/json'})
                response=connection.getresponse();self.assertEqual(response.status,status)
                data=json.loads(response.read())
                if status==200:self.assertEqual(data,direct)
            connection.request('GET','/api/ml/status')
            response=connection.getresponse();self.assertEqual(response.status,200)
            self.assertTrue(json.loads(response.read())['available'])
            connection.close()
        finally:
            server.shutdown();server.server_close();worker.join()


if __name__=='__main__':unittest.main()
