'use strict';
const $ = id => document.getElementById(id);
const names = {fifo:'FIFO', priority:'Prioridad estricta', tuned:'Prioridad con reserva', aging:'Envejecimiento'};
const fmt = (n, digits=1) => n == null ? '—' : Number(n).toLocaleString('es-PE',{maximumFractionDigits:digits});
const percent = n => n == null ? '—' : `${fmt(n*100)} %`;
let current = null;
const hospital = new Hospital3D.View(document.getElementById('hospital'), index => {
  $('time').value=index;
  snapshot();
});
const specs = {
  'main-fields': [['horizon','Horizonte (min)',480,1,1440,1],['seed','Semilla',1000,0,4294967295,1],['demand','Demanda (×)',1,0,5,.1],['dt','Paso (min)',1,.01,60,.01]],
  'resource-fields': [['doctors','Médicos',8,0,200,1],['nurses','Enfermería',12,0,200,1],['beds','Camas generales',12,0,200,1],['icu','Camas UCI',4,0,200,1],['ventilators','Ventiladores',3,0,200,1]],
  'policy-fields': [['reserve','Pares reservados',0,0,200,1],['release','Liberar en (min)',0,0,1440,1],['aging_interval','Envejecer cada (min)',60,.1,1440,.1]],
  'advanced-fields': [['beta','Retroalimentación β',.25,0,.99,.01],['tau','Ajuste de carga (min)',60,.01,10000,.01],['service_scale','Servicio (×)',1,.01,10,.01],['unfinished_penalty','Penalización (min)',60,0,10000,1],['w0','Peso P0',6,.01,100,.01],['w1','Peso P1',3,.01,100,.01],['w2','Peso P2',1,.01,100,.01]]
};
for (const [target, fields] of Object.entries(specs)) {
  $(target).innerHTML = fields.map(([id,label,value,min,max,step]) => `<label id="label-${id}" for="${id}">${label}<input type="number" id="${id}" value="${value}" min="${min}" max="${max}" step="${step}" required></label>`).join('');
}
function policyFields() {
  const name = $('policy').value;
  for (const id of ['reserve','release']) $('label-'+id).hidden = name === 'fifo' || name === 'priority';
  $('label-aging_interval').hidden = name !== 'aging' && !$('compare').checked;
}
$('policy').addEventListener('change',policyFields);
$('compare').addEventListener('change',policyFields);
policyFields();
$('scenario').addEventListener('change', () => {
  const values = {demand:1,doctors:8,nurses:12,beds:12,icu:4,ventilators:3};
  Object.assign(values, {surge:{demand:1.5},double:{demand:2},staff:{doctors:6,nurses:9},critical:{icu:2,ventilators:1}}[$('scenario').value] || {});
  for(const [id,value] of Object.entries(values)) $(id).value=value;
});
function payload() {
  const config={};
  for(const key of ['horizon','dt','demand','doctors','nurses','beds','icu','ventilators','beta','tau','service_scale','unfinished_penalty']) config[key]=Number($(key).value);
  config.priority_weights=['w0','w1','w2'].map(id=>Number($(id).value));
  const name=$('policy').value;
  const reserveEnabled=['tuned','aging'].includes(name);
  const request = {config, seed:Number($('seed').value), compare:$('compare').checked,
    policy:{name,reserve:reserveEnabled?Number($('reserve').value):0,release:reserveEnabled?Number($('release').value):0,aging_interval:Number($('aging_interval').value)}};
  if($('population-mode').value==='cohort') {
    if(new TextEncoder().encode($('cohort-json').value).length>245760) throw new Error('El archivo de cohorte supera 240 KB.');
    try {request.cohort=JSON.parse($('cohort-json').value);} catch {throw new Error('La cohorte no contiene JSON válido. Carga un archivo o el ejemplo ficticio.');}
  }
  return request;
}
function populationControls() {
  const replay=$('population-mode').value==='cohort';
  $('cohort-controls').hidden=!replay;
  for(const id of ['demand','service_scale','seed','scenario']) $(id).disabled=replay;
  if(replay) {$('demand').value=1;$('service_scale').value=1;}
}
$('population-mode').addEventListener('change',populationControls);
$('cohort-file').addEventListener('change',async()=>{
  const file=$('cohort-file').files[0];if(!file)return;
  try {
    if(file.size>245760)throw new Error('El archivo de cohorte supera 240 KB.');
    $('cohort-json').value=await file.text();
    $('status').textContent='Cohorte cargada; ejecuta para validar sus datos y simular.';
  } catch(error) {$('cohort-json').value='';$('error').textContent=error.message;$('error').hidden=false;}
});
$('cohort-example').addEventListener('click',async()=>{
  try {
    const response=await fetch('/cohorte-ejemplo.json');if(!response.ok)throw new Error('No se pudo cargar el ejemplo.');
    $('cohort-json').value=await response.text();
    $('status').textContent='Ejemplo ficticio cargado. Ejecuta para reproducir sus ocho llegadas.';
  }catch(error){$('error').textContent=error.message;$('error').hidden=false;}
});
async function run(event) {
  event?.preventDefault();
  if (!$('form').reportValidity()) return;
  let request;
  try {request=payload();}catch(error){$('error').textContent=error.message;$('error').hidden=false;return;}
  hospital.pause();
  $('controls').disabled=true;
  $('export').disabled=true;
  $('csv').disabled=true;
  $('error').hidden=true;
  $('status').textContent='Ejecutando el motor y comparando políticas…';
  $('run').textContent='Simulando…';
  try {
    const response=await fetch('/api/simulate',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(request)});
    const data=await response.json();
    if(!response.ok) throw new Error(data.error || 'No se pudo ejecutar la simulación.');
    current=data;
    render();
    $('status').textContent=`Simulación completada · ${fmt(data.result.metrics.runtime_s,3)} s en el motor · ${data.population.mode==='cohort'?'Cohorte reproducida':`Semilla ${data.seed}`}`;
  } catch(error) {
    $('error').textContent=error.message;
    $('error').hidden=false;
    $('status').textContent=current?'La ejecución falló. Se conservan los resultados de la última simulación completada.':'No hay resultados. Revisa los parámetros e inténtalo de nuevo.';
  } finally {
    $('controls').disabled=false;
    $('export').disabled=!current;
    $('csv').disabled=!current;
    $('run').innerHTML='Ejecutar simulación <span>↗</span>';
  }
}
$('form').addEventListener('submit',run);
$('form').addEventListener('input', () => {
  if(current) $('status').textContent='Parámetros modificados · Ejecuta de nuevo para actualizar los resultados.';
});
function render() {
  const {config:c,policy:p,result:{metrics:m,trace}}=current;
  $('results').hidden=false;
  const pop=current.population;
  $('population-info').textContent=pop.mode==='cohort'
    ? `${pop.name} · ${pop.records} pacientes · ${pop.kind==='synthetic'?'Ejemplo sintético':'Datos observados, según declaración del usuario; procedencia no verificada'} · Hospital inicialmente vacío · SHA-256: ${pop.sha256}`
    : 'Población sintética generada por el motor.';
  $('run-info').textContent=`${names[p.name]} · Horizonte ${fmt(c.horizon)} min · Demanda ×${fmt(c.demand)} · Paso ${fmt(c.dt)} min`;
  $('metrics').innerHTML=[['Pérdida ponderada',fmt(m.objective),'Minutos equivalentes · menor es mejor'],['Pacientes recibidos',fmt(m.arrivals,0),`${m.started} iniciaron atención`],['Espera censurada',fmt(m.wait_censored)+' min',`Cola máxima: ${m.max_queue} pacientes`],['Episodios finalizados',fmt(m.completed,0),`${m.waiting} en espera · ${m.in_service} en atención`]].map(([label,value,note])=>`<article class="metric"><div class="label">${label}</div><strong>${value}</strong><small>${note}</small></article>`).join('');
  $('time').max=trace.length-1;
  $('time').value=trace.length-1;
  hospital.load(current);
  drawChart(); snapshot();
  $('resources').innerHTML=[['doctors','Médicos'],['nurses','Enfermería'],['beds','Camas'],['icu','UCI'],['ventilators','Ventiladores']].map(([key,label])=>`<div class="bar-row"><span>${label}</span><progress max="1" value="${m['util_'+key]??0}" aria-label="Ocupación de ${label}"></progress><span>${percent(m['util_'+key])}</span></div>`).join('');
  $('priorities').innerHTML=[0,1,2].map(k=>`<div class="priority-row"><span class="badge p${k}">P${k}</span><div><b>${percent(m['coverage_p'+k])}</b><small>Iniciaron atención</small></div><div><b>${fmt(m['wait_p'+k])} min</b><small>Espera censurada</small></div></div>`).join('');
  $('comparison-panel').hidden=!current.comparisons.length;
  $('comparisons').innerHTML=current.comparisons.map(({policy,metrics:x})=>`<tr class="${policy.name===p.name?'selected':''}"><td>${names[policy.name]}</td><td><b>${fmt(x.objective)}</b></td><td>${fmt(x.wait_p0)} min</td><td>${fmt(x.wait_censored)} min</td><td>${percent(x.coverage_p2)}</td><td>${x.completed}</td></tr>`).join('');
  $('comparison-note').textContent=`Reserva comparada: ${p.reserve} pares hasta el minuto ${p.release}. Envejecimiento cada ${p.aging_interval} min. FIFO y prioridad estricta se comparan sin reserva. — indica que no hubo pacientes de esa prioridad o que el recurso tiene capacidad cero.`;
  renderPatients();
}
function drawChart() {
  const trace=current.result.trace, max=Math.max(1,...trace.map(r=>Math.max(r.queue,r.active,r.finished)));
  const x=t=>48+t/current.config.horizon*806, y=v=>222-v/max*194;
  const lines=[0,.25,.5,.75,1].map(f=>`<line x1="48" x2="854" y1="${y(max*f)}" y2="${y(max*f)}" stroke="#e8eef1"/><text x="36" y="${y(max*f)+4}" text-anchor="end">${fmt(max*f,0)}</text>`).join('');
  const ticks=[0,.25,.5,.75,1].map(f=>`<text x="${x(current.config.horizon*f)}" y="251" text-anchor="middle">${fmt(current.config.horizon*f,0)}</text>`).join('');
  const paths=[['queue','#db8b33'],['active','#177d9f'],['finished','#009587']].map(([key,color])=>`<polyline points="${trace.map(r=>`${x(r.t).toFixed(2)},${y(r[key]).toFixed(2)}`).join(' ')}" fill="none" stroke="${color}" stroke-width="2.5" stroke-linejoin="round"/>`).join('');
  $('chart').innerHTML=`<svg viewBox="0 0 880 275" role="img" aria-label="Evolución temporal de pacientes en espera, en atención y finalizados. Usa el selector de minuto para consultar valores exactos.">${lines}${ticks}${paths}<line id="cursor" x1="854" x2="854" y1="20" y2="222" stroke="#183d48" stroke-dasharray="4 4"/><text x="854" y="273" text-anchor="end">Tiempo (min)</text></svg>`;
}
function snapshot() {
  if(!current) return;
  const r=current.result.trace[Number($('time').value)];
  hospital.show(Number($('time').value));
  $('time-value').textContent=fmt(r.t);
  $('snapshot').innerHTML=`<span><b>${r.queue}</b> en espera</span><span><b>${r.active}</b> en atención</span><span><b>${r.finished}</b> finalizados</span><span><b>${r.icu}/${current.config.icu}</b> camas UCI</span><span><b>${percent(r.fatigue)}</b> índice de carga</span>`;
  const x=48+r.t/current.config.horizon*806;
  $('cursor').setAttribute('x1',x);$('cursor').setAttribute('x2',x);
}
$('time').addEventListener('input',()=>{hospital.pause();snapshot();});
function renderPatients() {
  if(!current) return;
  const group=$('filter').value;
  const patients=current.result.patients.filter(p=>group==='all'||p.priority===Number(group));
  $('patient-count').textContent=`${patients.length} pacientes · Tiempos en minutos`;
  $('patients').innerHTML=patients.length?patients.map(p=>`<tr><td>#${String(p.id).padStart(3,'0')}</td><td><span class="badge p${p.priority}">P${p.priority}</span></td><td>${fmt(p.arrival)}</td><td>${fmt(p.start)}</td><td>${fmt(p.finish)}</td><td>${fmt((p.start??current.config.horizon)-p.arrival)}</td><td>${p.finish!==null?'Finalizado':p.start!==null?'En atención':'En espera'}</td></tr>`).join(''):'<tr><td colspan="7" class="empty">No hay pacientes para esta selección.</td></tr>';
}
$('filter').addEventListener('change',renderPatients);
function download(content,type,name) {
  const url=URL.createObjectURL(new Blob([content],{type}));
  const a=document.createElement('a');a.href=url;a.download=name;a.click();
  setTimeout(()=>URL.revokeObjectURL(url),1000);
}
$('export').addEventListener('click',()=>download(JSON.stringify(current,null,2),'application/json',`simulacion-${current.seed}.json`));
$('csv').addEventListener('click',()=>{
  const keys=['id','arrival','priority','service','ventilation','remaining','start','finish','doctor','nurse'];
  const rows=current.result.patients.map(p=>keys.map(k=>p[k]??'').join(','));
  download('\ufeff'+[keys.join(','),...rows].join('\r\n'),'text/csv;charset=utf-8',`pacientes-${current.seed}.csv`);
});
run();
