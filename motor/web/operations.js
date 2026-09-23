(() => {
  const $=id=>document.getElementById(id);
  const labels={areas:'Áreas',resources:'Recursos',staff:'Personal',shifts:'Turnos',episodes:'Episodios',assignments:'Asignaciones'};
  const enums={
    areas:{kind:[['ed','Emergencias'],['icu','UCI'],['observation','Observación'],['support','Apoyo']],active:[['true','Activa'],['false','Inactiva']]},
    resources:{category:[['general_bed','Cama general'],['icu_bed','Cama UCI'],['ventilator','Ventilador'],['other','Otro']],status:[['available','Disponible'],['unavailable','No disponible'],['maintenance','Mantenimiento']]},
    staff:{role:[['physician','Médico'],['nurse','Enfermería'],['technician','Técnico'],['other','Otro']],active:[['true','Activo'],['false','Inactivo']]},
    shifts:{status:[['planned','Programado'],['on_duty','En turno'],['completed','Completado'],['absent','Ausente']]},
    episodes:{priority:[['0','P0'],['1','P1'],['2','P2']],state:[['waiting','En espera'],['triaged','Triaje'],['treating','En atención'],['observation','Observación'],['transferred','Transferido'],['discharged','Alta']],source:[['observed','Observado'],['synthetic','Sintético']]}
  };
  const schema={
    areas:[['code','Código','text',true],['name','Nombre','text',true],['kind','Tipo','enum',true],['active','Estado','enum',false]],
    resources:[['code','Código','text',true],['name','Nombre','text',true],['category','Categoría','enum',true],['area_id','Área','area',true],['status','Estado','enum',false]],
    staff:[['code','Código seudónimo','text',true],['role','Rol','enum',true],['area_id','Área','area',false],['active','Activo','enum',false]],
    shifts:[['staff_id','Personal','staff',true],['starts_at','Inicio','datetime-local',true],['ends_at','Fin','datetime-local',true],['status','Estado','enum',false]],
    episodes:[['patient_ref','Código seudónimo del episodio','text',true],['priority','Prioridad local','enum',true],['state','Estado','enum',false],['area_id','Área','area',false],['arrived_at','Llegada','datetime-local',true],['triaged_at','Triaje','datetime-local',false],['started_at','Inicio de atención','datetime-local',false],['ended_at','Fin / traslado','datetime-local',false],['source','Procedencia','enum',false]],
    assignments:[['episode_id','Episodio','episode',true],['resource_id','Recurso (deja vacío si asignas personal)','resource',false],['staff_id','Personal (deja vacío si asignas recurso)','staff',false]]
  };
  const columns={areas:['id','code','name','kind','active'],resources:['id','code','name','category','area_id','status'],staff:['id','code','role','area_id','active'],shifts:['id','staff_id','starts_at','ends_at','status'],episodes:['id','patient_ref','priority','state','area_id','arrived_at','source'],assignments:['id','patient_ref','resource_code','staff_code','assigned_at','released_at']};
  const display={ed:'Emergencias',icu:'UCI',observation:'Observación',support:'Apoyo',general_bed:'Cama general',icu_bed:'Cama UCI',ventilator:'Ventilador',other:'Otro',available:'Disponible',unavailable:'No disponible',maintenance:'Mantenimiento',physician:'Médico',nurse:'Enfermería',technician:'Técnico',planned:'Programado',on_duty:'En turno',completed:'Completado',absent:'Ausente',waiting:'En espera',triaged:'Triaje',treating:'En atención',transferred:'Transferido',discharged:'Alta',observed:'Observado',synthetic:'Sintético'};
  const cache={};let entity=Object.hasOwn(labels,location.hash.slice(1))?location.hash.slice(1):'areas',editing=null,editingRecord=null,page=1,busy=false,toastTimer;
  const meta={areas:['Áreas del hospital','Organiza los espacios donde ocurre la atención.','Directorio de áreas','⊞'],resources:['Recursos y equipos','Conoce la disponibilidad de camas y equipos por área.','Inventario de recursos','▤'],staff:['Equipo asistencial','Organiza el personal y su vinculación con las áreas.','Directorio de personal','♧'],shifts:['Planificación de turnos','Coordina la cobertura y disponibilidad del equipo.','Turnos del personal','▦'],episodes:['Episodios de atención','Sigue el recorrido de cada episodio y sus etapas.','Registro de episodios','♡'],assignments:['Asignaciones de atención','Vincula los recursos y el personal con la atención en curso.','Asignaciones de recursos','⇄']};
  const headings={id:'ID',code:'Código',name:'Nombre',kind:'Tipo de área',active:'Estado',category:'Categoría',area_id:'Área',status:'Estado',role:'Rol',staff_id:'Personal',starts_at:'Inicio',ends_at:'Fin',patient_ref:'Episodio',priority:'Prioridad',state:'Estado',arrived_at:'Llegada',source:'Origen',resource_code:'Recurso',staff_code:'Personal',assigned_at:'Asignación',released_at:'Liberación'};
  function showError(message){const target=$('record-dialog').open?$('form-error'):$('hospital-dialog').open?$('hospital-error'):$('ops-error');target.textContent=message;target.hidden=false;}
  function toast(message){$('toast').textContent=message;$('toast').hidden=false;clearTimeout(toastTimer);toastTimer=setTimeout(()=>$('toast').hidden=true,4000);}
  async function request(url,options={}){const response=await fetch(url,options);let data={};try{data=await response.json();}catch{}if(!response.ok)throw new Error(data.error||`No se pudo completar la solicitud (${response.status}).`);return data;}
  function option(select,value,label){select.add(new Option(label,value));}
  function clearErrors(){for(const id of ['ops-error','form-error','hospital-error'])$(id).hidden=true;}
  async function loadAll(){
    const names=Object.keys(labels);
    const [hospital,dashboard,...lists]=await Promise.all([request('/api/ops/hospital'),request('/api/ops/dashboard'),...names.map(name=>request(`/api/ops/${name}?archived=1`))]);
    Object.assign(cache,Object.fromEntries(names.map((name,i)=>[name,lists[i]])));cache.hospital=hospital;
    $('hospital-name').textContent=hospital.name;$('hospital-name').title=hospital.name;
    document.querySelector('.local-pill').textContent=hospital.code==='DEMO-ABS'?'● Datos de demostración':'● Registro local';
    renderDashboard(dashboard);renderTabs();renderRows();
  }
  function renderDashboard(data){
    const active=Object.values(data.episodes).reduce((a,b)=>a+b,0),total=data.resources.reduce((a,r)=>a+r.total,0),available=data.resources.reduce((a,r)=>a+r.available,0);
    const cards=[['Episodios activos',active,'En espera, atención y observación','♡'],['Recursos disponibles',`${available} / ${total}`,'Disponibilidad registrada','▤'],['Personal en turno',data.staff_on_duty,'Con turno vigente ahora','♧'],['Áreas registradas',(cache.areas||[]).filter(r=>!r.archived&&r.active).length,'Espacios activos del hospital','⊞']];
    $('ops-summary').replaceChildren(...cards.map(([title,value,note,glyph])=>{const card=document.createElement('article');card.className='metric';const t=document.createElement('div');t.className='label';t.textContent=title;const icon=document.createElement('span');icon.className='metric-icon';icon.textContent=glyph;icon.setAttribute('aria-hidden','true');t.append(icon);const strong=document.createElement('strong');strong.textContent=value;const small=document.createElement('small');small.textContent=note;card.append(t,strong,small);return card;}));
  }
  function choose(key){if(busy)return;entity=key;page=1;$('search').value='';clearErrors();history.replaceState(null,'',`#${key}`);renderTabs();renderRows();}
  function renderTabs(){
    $('module-title').textContent=meta[entity][0];$('module-description').textContent=meta[entity][1];$('list-title').textContent=meta[entity][2];$('breadcrumb-module').textContent=labels[entity];
    $('entity-tabs').replaceChildren(...Object.entries(labels).map(([key,label])=>{const button=document.createElement('button');button.type='button';button.className=key===entity?'selected':'';button.setAttribute('aria-current',key===entity?'page':'false');const icon=document.createElement('span');icon.className='nav-icon';icon.setAttribute('aria-hidden','true');icon.textContent=meta[key][3];const title=document.createElement('span');title.textContent=label;const count=document.createElement('span');count.className='nav-count';count.textContent=(cache[key]||[]).filter(r=>!r.archived).length;button.append(icon,title,count);button.addEventListener('click',()=>choose(key));return button;}));
  }
  function fillReference(input,type){
    option(input,'',type==='area'?'Seleccionar área…':type==='resource'?'Sin recurso':type==='staff'?'Seleccionar personal…':'Seleccionar episodio…');
    const rows=cache[{area:'areas',staff:'staff',resource:'resources',episode:'episodes'}[type]]||[];
    for(const row of rows){if(row.archived)continue;if(type==='area'&&!row.active)continue;if(type==='staff'&&!row.active)continue;if(type==='resource'&&row.status!=='available')continue;if(type==='episode'&&!['treating','observation'].includes(row.state))continue;
      option(input,String(row.id),type==='area'?`${row.code} · ${row.name}`:type==='staff'?`${row.code} · ${display[row.role]||row.role}`:type==='resource'?`${row.code} · ${display[row.category]||row.category}`:`${row.patient_ref} · ${display[row.state]||row.state}`);
    }
  }
  function localInput(date){const pad=n=>String(n).padStart(2,'0');return `${date.getFullYear()}-${pad(date.getMonth()+1)}-${pad(date.getDate())}T${pad(date.getHours())}:${pad(date.getMinutes())}:${pad(date.getSeconds())}`;}
  function openForm(record=null){
    clearErrors();editing=record?.id??null;editingRecord=record;const form=$('record-fields');form.replaceChildren();$('form-title').textContent=record?`Editar ${labels[entity].toLowerCase()} #${record.id}`:`Crear · ${labels[entity]}`;$('save-record').textContent=record?'Guardar cambios':entity==='assignments'?'Asignar':'Crear registro';
    for(const [key,label,type,required] of schema[entity]){const wrapper=document.createElement('label');wrapper.textContent=label+(required?' *':'');let input;
      if(type==='enum'){
        input=document.createElement('select');for(const [value,text] of enums[entity][key]||[])option(input,value,text);
        if(record)input.value=key==='active'?String(Boolean(record[key])):String(record[key]??'');
        else{const defaults={kind:'ed',category:'general_bed',role:'physician',priority:'2',state:'waiting',source:cache.hospital?.code==='DEMO-ABS'?'synthetic':'observed',status:entity==='shifts'?'planned':'available',active:'true'};input.value=defaults[key]??input.value;}
      }else if(['area','staff','resource','episode'].includes(type)){
        input=document.createElement('select');fillReference(input,type);const saved=record?.[key];if(saved!=null){if(![...input.options].some(o=>o.value===String(saved)))option(input,String(saved),`#${saved} · Registro actual no disponible`);input.value=String(saved);}
      }else{input=document.createElement('input');input.type=type;if(type==='text')input.maxLength=['code','patient_ref'].includes(key)?64:100;if(type==='datetime-local')input.step='1';if(type==='datetime-local'&&key==='arrived_at'&&!record)input.value=localInput(new Date());if(record&&record[key]!=null)input.value=type==='datetime-local'?localInput(new Date(record[key])):record[key];}
      input.name=key;input.required=required;wrapper.append(input);form.append(wrapper);
    }
    if(entity==='assignments'){const hint=document.createElement('p');hint.className='hint';hint.textContent='Selecciona un recurso o una persona por asignación. El personal necesita un turno vigente. El episodio debe estar en atención u observación.';form.append(hint);}
    if(!$('record-dialog').open)$('record-dialog').showModal();
  }
  function cellValue(record,key){let value=record[key];if(entity==='resources'&&key==='status'&&value==='available'&&(cache.assignments||[]).some(a=>!a.archived&&!a.released_at&&a.resource_id===record.id))return 'En uso';if(key==='active')return value?'Activo':'Inactivo';if(key==='priority')return `P${value}`;if(key==='area_id')return cache.areas?.find(r=>r.id===value)?.name??'Sin área';if(key==='staff_id')return cache.staff?.find(r=>r.id===value)?.code??'—';if(key.endsWith('_at')&&value)return new Date(value).toLocaleString('es-PE',{dateStyle:'short',timeStyle:'short'});return display[value]??value??'—';}
  function renderRows(){
    const cols=columns[entity];const head=document.createElement('tr');for(const key of [...cols,'Acciones']){const th=document.createElement('th');th.scope='col';th.textContent=headings[key]||key;head.append(th);}$('record-head').replaceChildren(head);
    const query=$('search').value.trim().toLocaleLowerCase('es');const filtered=(cache[entity]||[]).filter(r=>($('show-archived').checked||!r.archived)&&(!query||cols.some(k=>String(cellValue(r,k)).toLocaleLowerCase('es').includes(query))));
    const total=filtered.length,pages=Math.max(1,Math.ceil(total/10));page=Math.min(page,pages);$('record-count').textContent=`${total} ${total===1?'registro':'registros'}${query?' encontrados':''}`;$('page-info').textContent=total?`${(page-1)*10+1}–${Math.min(page*10,total)} de ${total} registros`:'Sin registros para mostrar';$('prev-page').disabled=page===1;$('next-page').disabled=page===pages;
    const body=$('record-body');body.replaceChildren();
    for(const record of filtered.slice((page-1)*10,page*10)){const row=document.createElement('tr');
      for(const key of cols){const td=document.createElement('td');const value=cellValue(record,key);if(['status','state','active','source','priority'].includes(key)){const badge=document.createElement('span');badge.className='badge'+(record.archived?' muted':value==='En uso'?' warn':['available','on_duty','completed','discharged',1,true].includes(record[key])?' good':['maintenance','waiting','absent',0,false].includes(record[key])?' warn':'');badge.textContent=record.archived&&key==='active'?'Archivado':value;td.append(badge);}else td.textContent=value;row.append(td);}
      const td=document.createElement('td'),actions=document.createElement('div');actions.className='row-actions';
      if(!record.archived&&entity!=='assignments'){const edit=document.createElement('button');edit.type='button';edit.textContent='Editar';edit.setAttribute('aria-label',`Editar registro ${record.id}`);edit.addEventListener('click',()=>openForm(record));actions.append(edit);}
      const action=document.createElement('button');action.type='button';action.textContent=record.archived?'Restaurar':entity==='assignments'&&!record.released_at?'Liberar':'Archivar';action.addEventListener('click',()=>changeRecord(record,record.archived?'restore':entity==='assignments'&&!record.released_at?'release':'archive',action));actions.append(action);td.append(actions);row.append(td);body.append(row);
    }
    if(!total){const row=document.createElement('tr'),cell=document.createElement('td');cell.colSpan=cols.length+1;cell.className='empty-cell';const icon=document.createElement('span');icon.className='empty-icon';icon.textContent=meta[entity][3];icon.setAttribute('aria-hidden','true');const title=document.createElement('strong');title.textContent=query?'No encontramos coincidencias':`Empieza a organizar ${labels[entity].toLowerCase()}`;const p=document.createElement('p');p.textContent=query?'Prueba con otro código, nombre o estado.':'Crea el primer registro para construir el estado operativo de tu hospital.';cell.append(icon,title,p);if(!query){const button=document.createElement('button');button.type='button';button.textContent='＋ Crear primer registro';button.addEventListener('click',()=>openForm());cell.append(button);}row.append(cell);body.append(row);}
  }
  async function changeRecord(record,action,button){if(busy)return;busy=true;button.disabled=true;clearErrors();const target=entity;try{await request(`/api/ops/${target}/${record.id}${action==='archive'?'':`/${action}`}`,{method:action==='archive'?'DELETE':'POST',headers:{'Content-Type':'application/json'},...(action==='archive'?{}:{body:'{}'})});toast(action==='archive'?'Registro archivado. Puedes restaurarlo desde «Incluir archivados».':action==='restore'?'Registro restaurado.':'Asignación liberada.');await loadAll();}catch(error){showError(error.message);}finally{busy=false;button.disabled=false;}}
  function closeForm(){if(!busy)$('record-dialog').close();}
  $('new-record').addEventListener('click',()=>{if(!busy)openForm();});$('cancel-edit').addEventListener('click',closeForm);$('discard-edit').addEventListener('click',closeForm);
  for(const id of ['record-dialog','hospital-dialog'])$(id).addEventListener('cancel',event=>{if(busy)event.preventDefault();});
  $('search').addEventListener('input',()=>{page=1;renderRows();});$('show-archived').addEventListener('change',()=>{page=1;renderRows();});$('prev-page').addEventListener('click',()=>{page--;renderRows();});$('next-page').addEventListener('click',()=>{page++;renderRows();});
  $('refresh').addEventListener('click',async()=>{const button=$('refresh');button.disabled=true;try{clearErrors();await loadAll();toast('Registros actualizados.');}catch(error){showError(error.message);}finally{button.disabled=false;}});
  $('hospital-settings').addEventListener('click',()=>{if(!cache.hospital)return;clearErrors();for(const key of ['code','name','timezone'])$('hospital-form').elements[key].value=cache.hospital[key];$('hospital-dialog').showModal();});$('close-hospital').addEventListener('click',()=>{if(!busy)$('hospital-dialog').close();});
  $('hospital-form').addEventListener('submit',async event=>{event.preventDefault();if(busy)return;busy=true;clearErrors();const button=event.currentTarget.querySelector('button[type=submit]');button.disabled=true;try{await request('/api/ops/hospital',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(Object.fromEntries(new FormData(event.currentTarget)))});$('hospital-dialog').close();toast('Configuración guardada.');await loadAll();}catch(error){showError(error.message);}finally{busy=false;button.disabled=false;}});
  $('record-form').addEventListener('submit',async event=>{
    event.preventDefault();if(busy)return;busy=true;clearErrors();$('save-record').disabled=true;
    try{const payload={};for(const [key,label,type] of schema[entity]){let value=event.currentTarget.elements[key].value;if(['area_id','staff_id','resource_id','episode_id','priority'].includes(key))value=value===''?null:Number(value);else if(key==='active')value=value==='true';else if(type==='datetime-local')value=value?new Date(value).toISOString():null;if(value==='')value=null;
      let old=editingRecord?.[key];if(key==='active'&&editingRecord)old=Boolean(old);if(type==='datetime-local'&&old)old=new Date(old).toISOString();if(!editing||value!==old)payload[key]=value;}
      if(editing&&!Object.keys(payload).length){$('record-dialog').close();toast('No hay cambios pendientes.');return;}
      await request(`/api/ops/${entity}${editing?`/${editing}`:''}`,{method:editing?'PUT':'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(payload)});$('record-dialog').close();toast(editing?'Cambios guardados.':'Registro creado.');editing=null;page=1;await loadAll();
    }catch(error){showError(error.message);}finally{busy=false;$('save-record').disabled=false;}
  });
  loadAll().then(()=>{if(new URLSearchParams(location.search).has('settings'))$('hospital-settings').click();}).catch(error=>showError(error.message));
})();
