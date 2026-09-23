import unittest
import hashlib
import json
from dataclasses import replace
from motor.model import Config,Policy,Patient,simulate,Shadow,generate

class EngineTests(unittest.TestCase):
    def test_original_engine_regression(self):
        # Captured before refactoring; includes every patient and time-step trace.
        cases=[(Config(),Policy('fifo'),1000,'3851b91247328a16d94fe7f902b4697607f2beeb58b4adb0a4afb78cc4a5f7ea'),
               (Config(),Policy(),1000,'be80648ee588bc075ce278264201621e1f0bbe761d4b977e335b51f718402c69'),
               (Config(demand=2),Policy('tuned',2,60),1001,'d6bd70e258fb74508a30655a943b6693bc7cc28325a13f792b3728d26a5b6753')]
        for config,policy,seed,expected in cases:
            with self.subTest(policy=policy,seed=seed):
                result=simulate(config,policy,seed,trace=True)
                result['metrics'].pop('runtime_s')
                self.assertEqual(hashlib.sha256(json.dumps(result,sort_keys=True).encode()).hexdigest(),expected)
    def test_empty(self):
        m=simulate(Config(demand=0))['metrics']
        self.assertEqual(m['arrivals'],0); self.assertEqual(m['objective'],0)
    def test_zero_staff(self):
        m=simulate(Config(doctors=0))['metrics']
        self.assertEqual(m['started'],0); self.assertEqual(m['waiting'],m['arrivals'])
    def test_zero_beds(self):
        m=simulate(Config(beds=0,icu=0))['metrics']; self.assertEqual(m['started'],0)
    def test_analytic_single(self):
        p=Patient(0,0,2,5,False)
        r=simulate(Config(horizon=10,beta=0),patients=[p])
        self.assertEqual(r['patients'][0]['start'],0); self.assertEqual(r['patients'][0]['finish'],5)
    def test_priority(self):
        ps=[Patient(0,0,2,10,False),Patient(1,0,0,10,False)]
        r=simulate(Config(horizon=30,doctors=1,beta=0),patients=ps)
        self.assertEqual(r['patients'][1]['start'],0); self.assertEqual(r['patients'][0]['start'],10)
    def test_no_ventilator(self):
        r=simulate(Config(ventilators=0),patients=[Patient(0,0,0,10,True)])
        self.assertEqual(r['metrics']['started'],0)
    def test_reproducible(self):
        a=simulate(seed=99); b=simulate(seed=99)
        self.assertEqual(a['patients'],b['patients'])
        a['metrics'].pop('runtime_s'); b['metrics'].pop('runtime_s'); self.assertEqual(a,b)
    def test_high_load_conservation(self):
        r=simulate(Config(demand=5),seed=8,trace=True)
        m=r['metrics']; self.assertEqual(m['arrivals'],m['waiting']+m['in_service']+m['completed'])
    def test_feedback(self):
        ps=[Patient(i,0,2,50,False) for i in range(20)]
        a=simulate(Config(beta=0),patients=ps); b=simulate(Config(beta=.5),patients=ps)
        self.assertGreater(b['patients'][0]['finish'],a['patients'][0]['finish'])
    def test_invalid_parameters(self):
        for c in [Config(dt=0),Config(doctors=-1),Config(beta=1),Config(tau=.5)]:
            with self.assertRaises(ValueError): simulate(c)
    def test_horizon_censoring(self):
        m=simulate(Config(horizon=10,doctors=0),patients=[Patient(0,2,2,5,False)])['metrics']
        self.assertEqual(m['wait_censored'],8); self.assertIsNone(m['wait_started'])
    def test_reservation_release(self):
        p=[Patient(0,0,2,5,False)]
        r=simulate(Config(horizon=30,doctors=1,beta=0),Policy('tuned',1,10),patients=p)
        self.assertEqual(r['patients'][0]['start'],10)
    def test_sync_duplicate_and_stale(self):
        s=Shadow(); e=dict(id='a',version=1,state=dict(capacity={'beds':2},occupancy={'beds':1}))
        self.assertEqual(s.apply(e),'accepted'); self.assertEqual(s.apply(e),'duplicate')
        self.assertEqual(s.apply(dict(e,id='b',version=0)),'stale'); self.assertEqual(s.version,1)
    def test_sync_atomic_rejection(self):
        s=Shadow()
        with self.assertRaises(ValueError): s.apply(dict(id='x',version=1,state=dict(capacity={'beds':1},occupancy={'beds':2})))
        self.assertEqual(s.version,-1); self.assertIsNone(s.state)
    def test_sync_copy(self):
        s=Shadow(); e=dict(id='a',version=1,state=dict(capacity={'beds':2},occupancy={'beds':1}))
        s.apply(e); e['state']['occupancy']['beds']=0; self.assertEqual(s.state['occupancy']['beds'],1)

    def test_nonfinite_configuration(self):
        for field in ('horizon','dt','tau','demand','beta','service_scale','unfinished_penalty'):
            for value in (float('nan'),float('inf'),float('-inf'),True,'1'):
                with self.subTest(field=field,value=value), self.assertRaises(ValueError):
                    simulate(replace(Config(),**{field:value}))

    def test_capacity_types(self):
        for value in (1.0,True,-1,float('inf'),'2'):
            with self.subTest(value=value), self.assertRaises(ValueError):
                simulate(Config(doctors=value))

    def test_generate_validates(self):
        with self.assertRaises(ValueError): generate(Config(demand=-1),0)

    def test_policy_validation(self):
        for policy in (Policy('typo'),Policy(reserve=1.5),Policy(reserve=True),
                       Policy(release=float('nan')),Policy(aging_interval=0)):
            with self.subTest(policy=policy), self.assertRaises(ValueError):
                simulate(policy=policy)

    def test_patient_validation(self):
        base=Patient(0,0,2,5,False)
        for fields in ({'arrival':float('nan')},{'service':float('inf')},
                       {'id':[]},{'priority':True},{'ventilation':1},{'ventilation':True}):
            with self.subTest(fields=fields), self.assertRaises(ValueError):
                simulate(patients=[replace(base,**fields)])
        with self.assertRaises(ValueError): simulate(patients=[base,base])

    def test_aging_reduces_postponement_without_changing_resources(self):
        ps=[Patient(0,0,0,30,False),Patient(1,0,2,5,False),Patient(2,20,0,10,False)]
        c=Config(horizon=60,doctors=1,beta=0)
        strict=simulate(c,Policy(),patients=ps)
        aged=simulate(c,Policy('aging',aging_interval=10),patients=ps,trace=True)
        self.assertEqual(strict['patients'][1]['start'],40)
        self.assertEqual(aged['patients'][1]['start'],30)
        self.assertEqual(aged['patients'][1]['priority'],2)
        row=next(r for r in aged['trace'] if r['t']==30)
        self.assertEqual((row['beds'],row['icu']),(1,0))
        self.assertIsNone(ps[1].start)

    def test_configurable_objective(self):
        ps=[Patient(0,0,0,5,False),Patient(1,5,2,5,False)]
        c=Config(horizon=10,doctors=0,priority_weights=(2,1,1),unfinished_penalty=7)
        self.assertAlmostEqual(simulate(c,patients=ps)['metrics']['objective'],(2*17+12)/3)
        for weights in ((1,2),(1,0,1),(1,float('nan'),1)):
            with self.assertRaises(ValueError): simulate(replace(c,priority_weights=weights))

    def test_terminal_arrival_counts_in_max_queue(self):
        r=simulate(Config(horizon=1,dt=2),patients=[Patient(0,.5,2,1,False)],trace=True)
        self.assertEqual(r['metrics']['max_queue'],1)
        self.assertEqual(r['metrics']['started'],0)

    def test_fractional_last_interval(self):
        r=simulate(Config(horizon=2.5,dt=1,beta=0),patients=[Patient(0,0,2,2.5,False)])
        self.assertEqual(r['patients'][0]['finish'],2.5)

    def test_blocked_patient_does_not_block_compatible_patient(self):
        r=simulate(Config(ventilators=0),patients=[Patient(0,0,0,5,True),Patient(1,0,2,5,False)])
        self.assertIsNone(r['patients'][0]['start'])
        self.assertEqual(r['patients'][1]['start'],0)

    def test_snapshot_schema_and_atomicity(self):
        s=Shadow()
        good=dict(id='a',version=1,state=dict(capacity={'beds':2},occupancy={'beds':1}))
        s.apply(good)
        invalid=[None,{},dict(good,id=[]),dict(good,id=''),dict(good,version=True),
                 dict(good,id='b',version=2,state={}),
                 dict(good,id='b',version=2,state=dict(capacity={'beds':True},occupancy={'beds':0}))]
        for event in invalid:
            with self.subTest(event=event),self.assertRaises(ValueError): s.apply(event)
            self.assertEqual(s.version,1)
            self.assertEqual(s.state,good['state'])
            self.assertEqual(s.seen,{'a'})

if __name__=='__main__': unittest.main(verbosity=2)
