"""Download official public data, train with survey weights and evaluate held-out hospitals."""
import os
os.environ.setdefault('OMP_NUM_THREADS', '2')
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import platform
import urllib.request
import zipfile

import joblib
import numpy as np
import pandas as pd
import sklearn
from sklearn.ensemble import HistGradientBoostingRegressor, HistGradientBoostingClassifier
from sklearn.metrics import mean_absolute_error, mean_squared_error, roc_auc_score, average_precision_score, brier_score_loss, log_loss
from sklearn.model_selection import GroupShuffleSplit
from threadpoolctl import threadpool_limits

from .ml import ROOT, ARTIFACTS, FEATURES, clean_features

URL = 'https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/NHAMCS/stata/ed2022-stata.zip'
DATA = ROOT/'datos'/'nhamcs'/'ed2022-stata.zip'
SEED = 20260923


def download():
    DATA.parent.mkdir(parents=True, exist_ok=True)
    if not DATA.exists():
        request = urllib.request.Request(URL, headers={'User-Agent':'ABS-SD research data downloader'})
        with urllib.request.urlopen(request, timeout=120) as response:
            content = response.read()
        # Validate before saving a successful download.
        import io
        with zipfile.ZipFile(io.BytesIO(content)) as z:
            if z.testzip() is not None:
                raise ValueError('Archivo ZIP corrupto')
        DATA.write_bytes(content)
    with zipfile.ZipFile(DATA) as archive:
        members = [n for n in archive.namelist() if n.lower().endswith('.dta')]
        if len(members) != 1:
            raise ValueError('Se esperaba un único archivo Stata')
        with archive.open(members[0]) as file:
            return pd.read_stata(file, convert_categoricals=False)


def split_hospitals(raw):
    groups = raw.HOSPCODE
    trainval, test = next(GroupShuffleSplit(n_splits=1,test_size=.2,random_state=SEED).split(raw,groups=groups))
    a,b = next(GroupShuffleSplit(n_splits=1,test_size=.25,random_state=SEED+1).split(raw.iloc[trainval],groups=groups.iloc[trainval]))
    splits={'train':trainval[a], 'validation':trainval[b], 'test':test}
    sets=[set(groups.iloc[idx]) for idx in splits.values()]
    assert not (sets[0]&sets[1] or sets[0]&sets[2] or sets[1]&sets[2])
    return splits


def weighted_median(y,w):
    order=np.argsort(y);y=np.asarray(y)[order];w=np.asarray(w)[order]
    return float(y[np.searchsorted(w.cumsum(),w.sum()/2)])


def evaluate(y,pred,w,classification=False):
    if classification:
        return {'brier':float(brier_score_loss(y,pred,sample_weight=w)),
                'log_loss':float(log_loss(y,pred,sample_weight=w,labels=[0,1])),
                'roc_auc':float(roc_auc_score(y,pred,sample_weight=w)) if len(np.unique(y))>1 else None,
                'average_precision':float(average_precision_score(y,pred,sample_weight=w))}
    return {'mae_minutes':float(mean_absolute_error(y,pred,sample_weight=w)),
            'rmse_minutes':float(np.sqrt(mean_squared_error(y,pred,sample_weight=w))),
            'mae_unweighted_minutes':float(mean_absolute_error(y,pred))}


def train():
    raw=download()
    if len(raw)!=16025:
        raise ValueError('El archivo no corresponde a los 16025 registros esperados de 2022')
    x=clean_features(raw);splits=split_hospitals(raw)
    ARTIFACTS.mkdir(exist_ok=True)
    report={'source':{'name':'CDC/NCHS NHAMCS 2022','url':URL,
                     'documentation':'https://www.cdc.gov/nchs/nhamcs/documentation/index.html',
                     'sha256':hashlib.sha256(DATA.read_bytes()).hexdigest(),'records':len(raw)},
            'trained_utc':datetime.now(timezone.utc).isoformat(),'seed':SEED,
            'versions':{'python':platform.python_version(),'sklearn':sklearn.__version__,
                        'pandas':pd.__version__,'numpy':np.__version__,'joblib':joblib.__version__},
            'features':FEATURES,'feature_missing_fraction':x.isna().mean().to_dict(),
            'split':{name:{'records':len(idx),'hospitals':sorted(int(v) for v in raw.HOSPCODE.iloc[idx].unique())}
                     for name,idx in splits.items()}, 'targets':{},
            'method':'Hospital-disjoint 60/20/20 split; PATWT in training, selection and test metrics. '
                     'No patient ID is supplied: repeated people cannot be ruled out. '
                     'Models selected only on validation; test not used to tune or refit.',
            'limits':['Datos de visitas estadounidenses en 2022; sin validación local ni de víctimas masivas.',
                      'LOV incluye espera: no equivale a service ni a ocupación exclusiva de un médico.',
                      'Triaje NHAMCS 1–5 no se convierte automáticamente a P0/P1/P2.',
                      'Métricas ponderadas descriptivas; no son intervalos de encuesta ni garantías clínicas.',
                      'Ausencias y valores especiales se conservan como NaN; se excluyen etiquetas ausentes.',
                      'Hospitalización significa ingreso en el mismo hospital (ADMITHOS), no necesidad óptima de ingreso.']}
    bundle={}; exports=[]
    for target,column in [('visit_minutes','LOV'),('wait_minutes','WAITTIME'),('hospitalization','ADMITHOS')]:
        classification=target=='hospitalization'
        y=pd.to_numeric(raw[column],errors='coerce').to_numpy(dtype=float)
        weights=pd.to_numeric(raw.PATWT,errors='coerce').to_numpy(dtype=float)
        valid=np.isfinite(y)&np.isfinite(weights)&(weights>0)
        valid &= np.isin(y,[0,1]) if classification else (y>=0)
        idx={name:indices[valid[indices]] for name,indices in splits.items()}
        tr,va,te=[idx[k] for k in ['train','validation','test']]
        wtrain=weights[tr]/weights[tr].mean()
        constant=float(np.average(y[tr],weights=weights[tr])) if classification else weighted_median(y[tr],weights[tr])
        score='brier' if classification else 'mae_minutes'
        candidates=[{'name':'baseline_prevalence' if classification else 'baseline_weighted_median','model':None,'constant':constant}]
        for leaves in [7,15]:
            common=dict(max_iter=160,max_leaf_nodes=leaves,min_samples_leaf=50,
                        l2_regularization=10,learning_rate=.05,early_stopping=False,random_state=SEED)
            model=HistGradientBoostingClassifier(**common) if classification else HistGradientBoostingRegressor(loss='absolute_error',**common)
            model.fit(x.iloc[tr],y[tr],sample_weight=wtrain)
            candidates.append({'name':f'gradient_boosting_{leaves}_leaves','model':model,'constant':constant})
        def predict(candidate,indices):
            model=candidate['model']
            if model is None:return np.full(len(indices),constant)
            if classification:return model.predict_proba(x.iloc[indices])[:,1]
            return np.maximum(0,model.predict(x.iloc[indices]))
        for c in candidates:c['validation']=evaluate(y[va],predict(c,va),weights[va],classification)
        best=min(candidates,key=lambda c:c['validation'][score])
        pred=predict(best,te);baseline=predict(candidates[0],te)
        results={'label':column,'selected':best['name'],'eligible':int(valid.sum()),'excluded':int((~valid).sum()),
                 'counts':{k:len(v) for k,v in idx.items()},
                 'validation':{c['name']:c['validation'] for c in candidates},
                 'test_selected':evaluate(y[te],pred,weights[te],classification),
                 'test_baseline':evaluate(y[te],baseline,weights[te],classification),
                 'test_by_triage':{}}
        for level in range(1,6):
            mask=x.iloc[te].triage.to_numpy()==level
            if mask.any():results['test_by_triage'][str(level)]={'n':int(mask.sum()),**evaluate(y[te][mask],pred[mask],weights[te][mask],classification)}
        report['targets'][target]=results
        bundle[target]={k:best[k] for k in ['name','model','constant']}
        exports.append(pd.DataFrame({'record_index':te,'hospital':raw.HOSPCODE.iloc[te].to_numpy(),
                                     'target':target,'observed':y[te],'prediction':pred,'baseline':baseline,'weight':weights[te]}))
        print(target,json.dumps({'selected':best['name'],'test':results['test_selected'],'baseline':results['test_baseline']}),flush=True)
    joblib.dump(bundle,ARTIFACTS/'modelos.joblib',compress=3)
    report['model_sha256']=hashlib.sha256((ARTIFACTS/'modelos.joblib').read_bytes()).hexdigest()
    report['code_sha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),Path(__file__).with_name('ml.py')]}
    pd.concat(exports).to_csv(ARTIFACTS/'predicciones_prueba.csv',index=False)
    report['predictions_sha256']=hashlib.sha256((ARTIFACTS/'predicciones_prueba.csv').read_bytes()).hexdigest()
    (ARTIFACTS/'informe.json').write_text(json.dumps(report,ensure_ascii=False,indent=2,allow_nan=False),encoding='utf-8')
    print('Guardado en',ARTIFACTS,flush=True)


if __name__=='__main__':
    with threadpool_limits(limits=2):
        train()
