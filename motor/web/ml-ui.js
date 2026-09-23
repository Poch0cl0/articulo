(() => {
  const el = id => document.getElementById(id);
  const n = value => Number(value).toLocaleString('es-PE', {maximumFractionDigits: 2});
  const fields = [
    ['age','Edad (94 = 94 o más)',40,0,94], ['sex','Sexo registrado',1,1,2],
    ['triage','Triaje NHAMCS',3,1,5], ['temperature_c','Temperatura (°C)',37,15,45],
    ['pulse','Pulso (lat/min)',80,0,350], ['respiration','Respiración (resp/min)',18,0,150],
    ['systolic','Presión sistólica (mmHg)',120,0,350], ['diastolic','Presión diastólica (mmHg)',80,0,250],
    ['pain','Dolor (0–10)',4,0,10], ['ambulance','Llegada en ambulancia',0,0,1],
    ['arrival_hour','Hora de llegada (14,5 = 14:30)',14,0,23.9999]
  ];
  for (const [key,label,value,min,max] of fields) {
    const wrapper = document.createElement('label'); wrapper.textContent = label;
    const options = key === 'sex' ? [[1,'Femenino'],[2,'Masculino']] : key === 'ambulance' ? [[0,'No'],[1,'Sí']] : null;
    const input = document.createElement(options ? 'select' : 'input');
    input.name = key;
    if(options) {
      for(const [val,text] of [['','Sin dato'],...options]) input.add(new Option(text,val));
    } else {input.type='number';input.min=min;input.max=max;input.step=key==='triage'?'1':'any';}
    input.value=value;wrapper.append(input);el('ml-fields').append(wrapper);
  }
  const titles = {visit_minutes:'Estancia total',wait_minutes:'Espera hasta atención',hospitalization:'Hospitalización en este centro'};
  async function predict(event) {
    if(event) event.preventDefault();
    el('ml-predict').disabled=true;
    el('ml-output').textContent='Calculando…';
    try {
      const profile=Object.fromEntries([...new FormData(el('ml-form'))].map(([key,value])=>[key,value===''?null:Number(value)]));
      const response=await fetch('/api/ml/predict',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(profile)});
      const data=await response.json();if(!response.ok) throw new Error(data.error);
      el('ml-output').replaceChildren();
      for(const [key,pred] of Object.entries(data.predictions)) {
        const p=document.createElement('p');
        p.textContent=`${titles[key]}: ${n(pred.value*(key==='hospitalization'?100:1))} ${key==='hospitalization'?'%':'min'}${pred.method.startsWith('baseline')?' · Referencia constante; no personalizada':''}.`;
        el('ml-output').append(p);
      }
      const note=document.createElement('p');note.className='hint';
      note.textContent=`Variables ausentes: ${data.missing_features.length}. Son estimaciones, no tiempos garantizados ni recomendaciones clínicas.`;el('ml-output').append(note);
    } catch(error) {el('ml-output').textContent=error.message;}
    finally {el('ml-predict').disabled=false;}
  }
  el('ml-form').addEventListener('submit',predict);
  fetch('/api/ml/status').then(r=>{if(!r.ok)throw new Error('No se pudo cargar el modelo.');return r.json();}).then(data=>{
    if(!data.available)throw new Error(data.message||'Modelo no disponible.');
    const report=data.report;
    el('ml-status').textContent=`Entrenamiento completado · ${n(report.source.records)} registros · ${report.split.test.hospitals.length} hospitales exclusivos de prueba.`;
    const table=document.createElement('table');
    table.innerHTML='<thead><tr><th>Resultado</th><th>Métrica de prueba ↓</th><th>Seleccionado</th><th>Referencia</th></tr></thead>';
    const tbody=document.createElement('tbody');
    for(const [key,t] of Object.entries(report.targets)) {
      const metric=key==='hospitalization'?'brier':'mae_minutes';
      const row=document.createElement('tr');
      for(const text of [titles[key],metric==='brier'?'Brier':'Error absoluto medio (min)',n(t.test_selected[metric]),n(t.test_baseline[metric])]) {const cell=document.createElement('td');cell.textContent=text;row.append(cell);}
      tbody.append(row);
    }
    table.append(tbody);el('ml-evaluation').append(table);el('ml-controls').disabled=false;predict();
  }).catch(error=>{el('ml-status').textContent=error.message;});
})();
