from dataclasses import asdict,replace
from pathlib import Path
import csv,json,statistics as st,math,time,platform,sys,hashlib
if __package__:
    from .model import Config,Policy,simulate
else:
    from model import Config,Policy,simulate

OUT=Path(__file__).resolve().parents[1]/'resultados'
BASE=Config()
SCENARIOS={'referencia':BASE,'demanda_150':replace(BASE,demand=1.5),
           'demanda_200':replace(BASE,demand=2), 'personal_reducido':replace(BASE,doctors=6,nurses=9),
           'criticos_reducidos':replace(BASE,icu=2,ventilators=1)}
TRAIN=list(range(100,120)); TEST=list(range(1000,1030))
CANDIDATES=[Policy('tuned',0,0)]+[Policy('tuned',r,t) for r in [1,2] for t in [30,60,120,240]]

def writecsv(name,rows):
    with (OUT/name).open('w',newline='',encoding='utf-8') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0])); w.writeheader(); w.writerows(rows)

def summary(values):
    values=[v for v in values if v is not None]
    if not values: return dict(mean=None,ci95=None)
    # t(29)=2.04523; all held-out groups contain 30 runs.
    return dict(mean=st.mean(values),ci95=2.04523*st.stdev(values)/math.sqrt(len(values)) if len(values)>1 else 0)

if __name__=='__main__':
    OUT.mkdir(exist_ok=True)
    tic=time.perf_counter(); tuning=[]
    for p in CANDIDATES:
        values=[simulate(c,p,s)['metrics']['objective'] for c in SCENARIOS.values() for s in TRAIN]
        tuning.append(dict(**asdict(p),mean_objective=st.mean(values)))
    best=min(tuning,key=lambda x:(x['mean_objective'],x['reserve'],x['release']))
    policy=Policy(best['name'],best['reserve'],best['release'])
    writecsv('ajuste.csv',tuning)
    print('Selected:',best,flush=True)
    (OUT/'politica_ajustada.json').write_text(json.dumps(dict(policy=asdict(policy),train_seeds=TRAIN,test_seeds=TEST,
      objective='weighted censored waiting + 60 * unfinished, weights 6/3/1',config=asdict(BASE),
      scenarios={n:asdict(c) for n,c in SCENARIOS.items()}),indent=2),encoding='utf-8')
    rows=[]; aggregates={}; comparisons={}
    for name,c in SCENARIOS.items():
        aggregates[name]={}; by_policy={}
        for p in [Policy('fifo'),Policy('priority'),policy]:
            runs=[simulate(c,p,s)['metrics'] for s in TEST]
            rows.extend(dict(scenario=name,policy=p.name,seed=s,**m) for s,m in zip(TEST,runs))
            by_policy[p.name]=runs
            aggregates[name][p.name]={k:summary([m[k] for m in runs]) for k in runs[0]}
        comparisons[name]={base:{k:summary([a[k]-b[k] for a,b in zip(by_policy['tuned'],by_policy[base])])
            for k in ['objective','wait_censored','wait_p0','completed']} for base in ['fifo','priority']}
        print(name, {p:round(a['objective']['mean'],2) for p,a in aggregates[name].items()},flush=True)
    writecsv('evaluacion.csv',rows)
    sens=[]
    variants=[('dt_05',replace(BASE,dt=.5)),('dt_025',replace(BASE,dt=.25)),
      ('sin_feedback',replace(BASE,beta=0)),('servicio_080',replace(BASE,service_scale=.8)),
      ('servicio_120',replace(BASE,service_scale=1.2))]
    for name,c in variants:
        sens.extend(dict(variant=name,seed=s,**simulate(c,policy,s)['metrics']) for s in TEST)
    writecsv('sensibilidad.csv',sens)
    sensitivity={n:{k:summary([r[k] for r in sens if r['variant']==n]) for k in ['objective','wait_censored','completed']} for n,c in variants}
    sample=simulate(BASE,policy,1000,trace=True)
    writecsv('trayectoria_ejemplo.csv',sample['trace']); writecsv('pacientes_ejemplo.csv',sample['patients'])
    output=dict(aggregates=aggregates,paired_differences=comparisons,sensitivity=sensitivity,
      runtime_total_s=time.perf_counter()-tic,python=sys.version,platform=platform.platform(),
      counts=dict(tuning=900,evaluation=450,sensitivity=150),
      hashes={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in Path(__file__).parent.glob('*.py')})
    (OUT/'resumen.json').write_text(json.dumps(output,indent=2),encoding='utf-8')
    print('Saved results. Seconds:',output['runtime_total_s'],flush=True)
