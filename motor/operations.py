"""Local persistent operational records for the ABS–SD digital twin MVP."""
from datetime import datetime, timezone
import json
import sqlite3
import re

from .database import DEFAULT_DB, connect

SPECS = {
    'areas': {
        'table':'areas','fields': {'code':'text','name':'text','kind':'area_kind','active':'bool'},
        'required': {'code','name','kind'},
        'types': {'ed','icu','observation','support'},
    },
    'resources': {
        'table':'operational_resources','fields': {'code':'text','name':'text','category':'resource_kind','area_id':'fk_area','status':'resource_status'},
        'required': {'code','name','category','area_id'},
        'types': {'general_bed','icu_bed','ventilator','other'},
    },
    'staff': {
        'table':'staff','fields': {'code':'text','role':'staff_role','area_id':'fk_area','active':'bool'},
        'required': {'code','role'},
        'types': {'physician','nurse','technician','other'},
    },
    'shifts': {
        'table':'shifts','fields': {'staff_id':'fk_staff','starts_at':'timestamp','ends_at':'timestamp','status':'shift_status'},
        'required': {'staff_id','starts_at','ends_at'},
        'types': {'planned','on_duty','completed','absent'},
    },
    'episodes': {
        'table':'episodes','fields': {'patient_ref':'text','priority':'priority','state':'episode_state','area_id':'fk_area','arrived_at':'timestamp','triaged_at':'optional_timestamp','started_at':'optional_timestamp','ended_at':'optional_timestamp','source':'episode_source'},
        'required': {'patient_ref','priority','arrived_at'},
        'types': {'waiting','triaged','treating','observation','transferred','discharged'},
    },
}


def _db(path):
    return connect(path)


def _now():
    return datetime.now(timezone.utc).isoformat(timespec='seconds')


def _text(value, field, maximum=100):
    if not isinstance(value,str) or not value.strip() or len(value.strip())>maximum or any(ord(ch)<32 for ch in value):
        raise ValueError(f'{field}: texto requerido (máximo {maximum} caracteres).')
    return value.strip()


def _timestamp(value, field, optional=False):
    if value is None and optional:return None
    if not isinstance(value,str):raise ValueError(f'{field}: fecha ISO-8601 requerida.')
    try: parsed=datetime.fromisoformat(value.replace('Z','+00:00'))
    except ValueError as exc:raise ValueError(f'{field}: fecha ISO-8601 inválida.') from exc
    if parsed.tzinfo is None:raise ValueError(f'{field}: la fecha debe incluir zona horaria.')
    return parsed.astimezone(timezone.utc).isoformat(timespec='seconds')


def _normalize(key, kind, value, spec):
    if kind=='text':return _text(value,key,64 if key in ('code','patient_ref') else 100)
    if kind=='bool':
        if type(value) is not bool:raise ValueError(f'{key}: se requiere true o false.')
        return int(value)
    if kind.startswith('fk_'):
        if value is None and key=='area_id':return None
        if type(value) is not int or value<=0:raise ValueError(f'{key}: identificador inválido.')
        return value
    if kind in ('timestamp','optional_timestamp'):return _timestamp(value,key,kind=='optional_timestamp')
    if kind=='priority':
        if type(value) is not int or value not in (0,1,2):raise ValueError('priority debe ser 0, 1 o 2 según la escala local configurada.')
        return value
    if kind=='area_kind': allowed={'ed','icu','observation','support'}
    elif kind=='resource_kind':allowed=spec['types']
    elif kind=='resource_status':allowed={'available','unavailable','maintenance'}
    elif kind=='staff_role':allowed=spec['types']
    elif kind=='shift_status':allowed=spec['types']
    elif kind=='episode_state':allowed=spec['types']
    elif kind=='episode_source':allowed={'observed','synthetic'}
    else:raise ValueError('Campo no admitido.')
    if not isinstance(value,str) or value not in allowed:raise ValueError(f'{key}: valor no admitido.')
    return value


def _audit(conn, entity, entity_id, action, changes):
    conn.execute('INSERT INTO audit_log(entity,entity_id,action,changed_at,changes_json) VALUES(?,?,?,?,?)',
                 (entity,entity_id,action,_now(),json.dumps(changes,ensure_ascii=False,sort_keys=True)))


def _episode_transition(old,new):
    transitions={'waiting':{'waiting','triaged','transferred','discharged'},
                 'triaged':{'triaged','waiting','treating','transferred','discharged'},
                 'treating':{'treating','observation','transferred','discharged'},
                 'observation':{'observation','treating','transferred','discharged'},
                 'transferred':{'transferred'},'discharged':{'discharged'}}
    if new not in transitions.get(old,set()):raise ValueError(f'Transición de episodio no válida: {old} → {new}.')


def get_hospital(path=DEFAULT_DB):
    conn=_db(path)
    try:return dict(conn.execute('SELECT id,code,name,timezone,created_at,updated_at FROM hospital WHERE id=1').fetchone())
    finally:conn.close()


def update_hospital(payload,path=DEFAULT_DB):
    if not isinstance(payload,dict) or set(payload)-{'code','name','timezone'} or not {'code','name','timezone'}<=set(payload):
        raise ValueError('Se requieren code, name y timezone.')
    values={k:_text(payload[k],k,100) for k in ('code','name','timezone')}
    if not re.fullmatch(r'[A-Za-z_+-]+(?:/[A-Za-z0-9_+.-]+)+',values['timezone']):
        raise ValueError('timezone debe ser una zona horaria IANA, por ejemplo America/Lima.')
    conn=_db(path)
    try:
        now=_now();conn.execute('BEGIN IMMEDIATE')
        conn.execute('UPDATE hospital SET code=?,name=?,timezone=?,updated_at=? WHERE id=1',(*values.values(),now))
        _audit(conn,'hospital',1,'update',values);conn.commit()
        return get_hospital(path)
    finally:conn.close()


def list_records(entity,path=DEFAULT_DB,include_archived=False):
    if entity=='hospital':return [get_hospital(path)]
    if entity=='assignments':
        conn=_db(path)
        try:return [dict(r) for r in conn.execute(f'''SELECT a.*,e.patient_ref,r.code resource_code,r.category resource_category,
             s.code staff_code,s.role staff_role FROM assignments a JOIN episodes e ON e.id=a.episode_id
             LEFT JOIN operational_resources r ON r.id=a.resource_id LEFT JOIN staff s ON s.id=a.staff_id
             WHERE (? OR a.archived=0) ORDER BY a.assigned_at DESC,a.id DESC''',(int(include_archived),))]
        finally:conn.close()
    spec=SPECS.get(entity)
    if not spec:raise ValueError('Recurso de API no admitido.')
    conn=_db(path)
    try:
        rows=[dict(r) for r in conn.execute(f"SELECT * FROM {spec['table']} WHERE (? OR archived=0) ORDER BY id DESC",(int(include_archived),))]
        if entity=='episodes':
            for row in rows:
                row['assignments']=[dict(a) for a in conn.execute('''SELECT a.id,a.resource_id,a.staff_id,r.code resource_code,s.code staff_code
                  FROM assignments a LEFT JOIN operational_resources r ON r.id=a.resource_id LEFT JOIN staff s ON s.id=a.staff_id
                  WHERE a.episode_id=? AND a.released_at IS NULL AND a.archived=0''',(row['id'],))]
        return rows
    finally:conn.close()


def _clean_payload(entity,payload,existing=None):
    spec=SPECS[entity]
    if not isinstance(payload,dict) or not payload or set(payload)-set(spec['fields']):
        raise ValueError(f"Campos no admitidos para {entity}: {', '.join(sorted(set(payload or {})-set(spec['fields'])))}.")
    values={}
    merged={**(existing or {}),**payload}
    for key,value in payload.items():values[key]=_normalize(key,spec['fields'][key],value,spec)
    missing=spec['required']-set(merged)
    if missing:raise ValueError(f"Faltan campos obligatorios: {', '.join(sorted(missing))}.")
    if any(merged[key] is None for key in spec['required']):
        raise ValueError('Los campos obligatorios no pueden estar vacíos.')
    for fk,target in [('area_id','areas'),('staff_id','staff')]:
        if fk in merged and merged[fk] is not None:
            candidate=values.get(fk,merged[fk])
            if type(candidate) is not int or candidate<=0:raise ValueError(f'{fk} inválido.')
    if entity=='shifts':
        start=_timestamp(merged['starts_at'],'starts_at');end=_timestamp(merged['ends_at'],'ends_at')
        if datetime.fromisoformat(end)<=datetime.fromisoformat(start):raise ValueError('El fin del turno debe ser posterior al inicio.')
        values.update(starts_at=start,ends_at=end)
    if entity=='episodes':
        times=[merged.get(key) for key in ('arrived_at','triaged_at','started_at','ended_at')]
        parsed=[datetime.fromisoformat(_timestamp(value,key)) for key,value in zip(('arrived_at','triaged_at','started_at','ended_at'),times) if value is not None]
        if any(later<earlier for earlier,later in zip(parsed,parsed[1:])):raise ValueError('Las fechas del episodio deben respetar el orden llegada, triaje, atención y salida.')
        state=merged.get('state','waiting')
        if state in ('treating','observation') and not merged.get('started_at'):raise ValueError('Un episodio en atención u observación requiere started_at.')
        if state in ('transferred','discharged') and not merged.get('ended_at'):raise ValueError('Un episodio transferido o dado de alta requiere ended_at.')
        if state in ('triaged','treating','observation','transferred','discharged') and not merged.get('triaged_at'):
            raise ValueError('Este estado de episodio requiere triaged_at.')
    return values


def save_record(entity,payload,record_id=None,path=DEFAULT_DB):
    spec=SPECS.get(entity)
    if not spec:raise ValueError('Recurso de API no admitido.')
    conn=_db(path)
    try:
        conn.execute('BEGIN IMMEDIATE')
        existing=None
        if record_id is not None:
            row=conn.execute(f"SELECT * FROM {spec['table']} WHERE id=? AND archived=0",(record_id,)).fetchone()
            if row is None:raise LookupError(f'{entity} no encontrado.')
            existing=dict(row)
        values=_clean_payload(entity,payload,existing)
        if entity=='episodes' and existing:_episode_transition(existing['state'],payload.get('state',existing['state']))
        for fk in ('area_id','staff_id'):
            if fk in values and values[fk] is not None:
                target_table='areas' if fk=='area_id' else 'staff'
                active_column='active' if fk=='area_id' else 'active'
                target=conn.execute(f'SELECT active,archived FROM {target_table} WHERE id=?',(values[fk],)).fetchone()
                if target is None or target['archived'] or not target[active_column]:raise ValueError(f'{fk}: selecciona un registro activo.')
        if entity=='episodes' and existing:
            if existing['state'] not in ('transferred','discharged') and values.get('state',existing['state']) in ('transferred','discharged'):
                active=conn.execute('SELECT COUNT(*) FROM assignments WHERE episode_id=? AND released_at IS NULL AND archived=0',(record_id,)).fetchone()[0]
                if active:raise ValueError('Libera primero las asignaciones activas del episodio.')
        if entity=='staff' and existing and values.get('active',existing['active'])==0:
            active=conn.execute('SELECT COUNT(*) FROM assignments WHERE staff_id=? AND released_at IS NULL AND archived=0',(record_id,)).fetchone()[0]
            if active:raise ValueError('Libera primero las asignaciones activas de esta persona.')
        if entity=='resources' and existing and values.get('status',existing['status'])!='available':
            active=conn.execute('SELECT COUNT(*) FROM assignments WHERE resource_id=? AND released_at IS NULL AND archived=0',(record_id,)).fetchone()[0]
            if active:raise ValueError('Libera primero la asignación activa del recurso.')
        if entity in ('resources','staff') and existing:
            old_area=existing.get('area_id')
            new_area=values.get('area_id',old_area)
            if old_area!=new_area:
                active=conn.execute('SELECT COUNT(*) FROM assignments WHERE '+('resource_id' if entity=='resources' else 'staff_id')+'=? AND released_at IS NULL AND archived=0',(record_id,)).fetchone()[0]
                if active:raise ValueError('Libera las asignaciones activas antes de cambiar el área.')
        if entity=='areas' and values.get('active',existing['active'] if existing else 1)==0:
            active=conn.execute('SELECT COUNT(*) FROM operational_resources WHERE area_id=? AND archived=0',(record_id,)).fetchone()[0] if record_id else 0
            staff=conn.execute('SELECT COUNT(*) FROM staff WHERE area_id=? AND archived=0',(record_id,)).fetchone()[0] if record_id else 0
            if active or staff:raise ValueError('Mueve o archiva los recursos y el personal antes de desactivar el área.')
        if entity=='shifts':
            staff_id=values.get('staff_id',existing['staff_id'] if existing else None)
            start=values.get('starts_at',existing['starts_at'] if existing else None)
            end=values.get('ends_at',existing['ends_at'] if existing else None)
            clash=conn.execute('SELECT id FROM shifts WHERE staff_id=? AND archived=0 AND id!=? AND starts_at<? AND ends_at>? LIMIT 1',
                               (staff_id,record_id or -1,end,start)).fetchone()
            if clash:raise ValueError(f'El turno se cruza con el turno {clash[0]} de la misma persona.')
        now=_now()
        if existing:
            updates={**values,'updated_at':now}
            assignments=', '.join(f'{key}=?' for key in updates)
            conn.execute(f"UPDATE {spec['table']} SET {assignments} WHERE id=?",[*updates.values(),record_id])
            _audit(conn,entity,record_id,'update',values)
            saved_id=record_id
        else:
            defaults={'areas':{'active':1},'resources':{'status':'available'},'staff':{'active':1},
                      'shifts':{'status':'planned'},'episodes':{'state':'waiting','area_id':None,'triaged_at':None,'started_at':None,'ended_at':None,'source':'observed'}}[entity]
            inserted={**defaults,**values,'created_at':now,'updated_at':now}
            columns=', '.join(inserted);marks=', '.join('?' for _ in inserted)
            cursor=conn.execute(f"INSERT INTO {spec['table']} ({columns}) VALUES ({marks})",list(inserted.values()))
            saved_id=cursor.lastrowid
            _audit(conn,entity,saved_id,'create',values)
        conn.commit()
    except Exception:
        conn.rollback();raise
    finally:conn.close()
    return next(row for row in list_records(entity,path) if row['id']==saved_id)


def create_assignment(payload,path=DEFAULT_DB):
    required={'episode_id','resource_id','staff_id'}
    if not isinstance(payload,dict) or set(payload)!=required:raise ValueError('Se requieren episode_id, resource_id y staff_id; uno de los dos últimos debe ser null.')
    episode_id=payload['episode_id'];resource_id=payload['resource_id'];staff_id=payload['staff_id']
    if type(episode_id) is not int or episode_id<=0:raise ValueError('episode_id inválido.')
    if (resource_id is None)==(staff_id is None):raise ValueError('Asigna exactamente un recurso o una persona.')
    if any(type(v) is not int or v<=0 for v in (resource_id,staff_id) if v is not None):raise ValueError('Identificador de asignación inválido.')
    conn=_db(path)
    try:
        conn.execute('BEGIN IMMEDIATE')
        episode=conn.execute('SELECT state FROM episodes WHERE id=? AND archived=0',(episode_id,)).fetchone()
        if episode is None:raise ValueError('Episodio no encontrado.')
        if episode['state'] not in ('treating','observation'):raise ValueError('El episodio debe estar en atención u observación para asignarle recursos.')
        if resource_id is not None:
            target=conn.execute('SELECT status FROM operational_resources WHERE id=? AND archived=0',(resource_id,)).fetchone()
            if target is None or target['status']!='available':raise ValueError('El recurso no existe o no está disponible.')
        else:
            target=conn.execute('SELECT active FROM staff WHERE id=? AND archived=0',(staff_id,)).fetchone()
            if target is None or target['active']!=1:raise ValueError('La persona no existe o está inactiva.')
            on_duty=conn.execute('''SELECT 1 FROM shifts WHERE staff_id=? AND archived=0 AND status='on_duty'
              AND starts_at<=? AND ends_at>? LIMIT 1''',(staff_id,_now(),_now())).fetchone()
            if on_duty is None:raise ValueError('La persona no tiene un turno activo ahora.')
        now=_now()
        cursor=conn.execute('INSERT INTO assignments(episode_id,resource_id,staff_id,assigned_at,created_at) VALUES(?,?,?,?,?)',
                            (episode_id,resource_id,staff_id,now,now))
        assignment_id=cursor.lastrowid
        _audit(conn,'assignments',assignment_id,'create',payload);conn.commit()
    except Exception:
        conn.rollback();raise
    finally:conn.close()
    return next(row for row in list_records('assignments',path) if row['id']==assignment_id)


def archive_record(entity,record_id,path=DEFAULT_DB):
    conn=_db(path)
    try:
        conn.execute('BEGIN IMMEDIATE');now=_now()
        if entity=='hospital':raise ValueError('El hospital principal no se puede archivar.')
        if entity=='assignments':
            row=conn.execute('SELECT * FROM assignments WHERE id=? AND archived=0',(record_id,)).fetchone()
            if row is None:raise LookupError('Asignación no encontrada.')
            conn.execute('UPDATE assignments SET released_at=COALESCE(released_at,?),archived=1 WHERE id=?',(now,record_id))
        else:
            spec=SPECS.get(entity)
            if not spec:raise ValueError('Recurso de API no admitido.')
            row=conn.execute(f"SELECT * FROM {spec['table']} WHERE id=? AND archived=0",(record_id,)).fetchone()
            if row is None:raise LookupError(f'{entity} no encontrado.')
            if entity=='areas':
                children=conn.execute('SELECT (SELECT COUNT(*) FROM operational_resources WHERE area_id=? AND archived=0)+(SELECT COUNT(*) FROM staff WHERE area_id=? AND archived=0)',(record_id,record_id)).fetchone()[0]
                if children:raise ValueError('Mueve o archiva los recursos y el personal antes de archivar el área.')
            if entity=='episodes':
                if row['state'] not in ('transferred','discharged'):
                    raise ValueError('El episodio debe transferirse o darse de alta antes de archivarlo.')
                active=conn.execute('SELECT COUNT(*) FROM assignments WHERE episode_id=? AND released_at IS NULL AND archived=0',(record_id,)).fetchone()[0]
                if active:raise ValueError('Libera primero las asignaciones activas del episodio.')
            if entity=='resources':
                active=conn.execute('SELECT COUNT(*) FROM assignments WHERE resource_id=? AND released_at IS NULL AND archived=0',(record_id,)).fetchone()[0]
                if active:raise ValueError('Libera primero la asignación activa del recurso.')
            if entity=='staff':
                active=conn.execute('SELECT COUNT(*) FROM assignments WHERE staff_id=? AND released_at IS NULL AND archived=0',(record_id,)).fetchone()[0]
                if active:raise ValueError('Libera primero las asignaciones activas de esta persona.')
                working=conn.execute("SELECT COUNT(*) FROM shifts WHERE staff_id=? AND archived=0 AND status='on_duty' AND starts_at<=? AND ends_at>?",(record_id,_now(),_now())).fetchone()[0]
                if working:raise ValueError('Cierra el turno activo antes de archivar a esta persona.')
            conn.execute(f"UPDATE {spec['table']} SET archived=1,updated_at=? WHERE id=?",(now,record_id))
        _audit(conn,entity,record_id,'archive',{});conn.commit()
    except Exception:conn.rollback();raise
    finally:conn.close()
    return {'id':record_id,'archived':True}


def release_assignment(record_id,path=DEFAULT_DB):
    conn=_db(path)
    try:
        conn.execute('BEGIN IMMEDIATE')
        row=conn.execute('SELECT released_at FROM assignments WHERE id=? AND archived=0',(record_id,)).fetchone()
        if row is None:raise LookupError('Asignación no encontrada.')
        if row['released_at'] is None:
            conn.execute('UPDATE assignments SET released_at=? WHERE id=?',(_now(),record_id))
            _audit(conn,'assignments',record_id,'release',{});conn.commit()
        else:conn.rollback()
    except Exception:conn.rollback();raise
    finally:conn.close()
    return next(row for row in list_records('assignments',path) if row['id']==record_id)


def restore_record(entity,record_id,path=DEFAULT_DB):
    conn=_db(path)
    try:
        conn.execute('BEGIN IMMEDIATE')
        if entity=='hospital':raise ValueError('El hospital principal no se puede archivar ni restaurar.')
        if entity=='assignments':
            row=conn.execute('SELECT archived FROM assignments WHERE id=?',(record_id,)).fetchone()
            table='assignments'
        else:
            spec=SPECS.get(entity)
            if not spec:raise ValueError('Recurso de API no admitido.')
            row=conn.execute(f"SELECT archived FROM {spec['table']} WHERE id=?",(record_id,)).fetchone()
            table=spec['table']
        if row is None:raise LookupError(f'{entity} no encontrado.')
        if not row['archived']:
            conn.rollback();return {'id':record_id,'archived':False}
        if entity=='assignments':
            conn.execute('UPDATE assignments SET archived=0 WHERE id=?',(record_id,))
        else:
            conn.execute(f"UPDATE {table} SET archived=0,updated_at=? WHERE id=?",(_now(),record_id))
        _audit(conn,entity,record_id,'restore',{});conn.commit()
    except Exception:conn.rollback();raise
    finally:conn.close()
    return {'id':record_id,'archived':False}


def dashboard(path=DEFAULT_DB):
    conn=_db(path)
    try:
        active=conn.execute("SELECT state,COUNT(*) count FROM episodes WHERE archived=0 AND state NOT IN ('transferred','discharged') GROUP BY state").fetchall()
        resources=conn.execute('''SELECT r.category,r.status,COUNT(*) total,
          SUM(CASE WHEN a.id IS NOT NULL THEN 1 ELSE 0 END) occupied
          FROM operational_resources r LEFT JOIN assignments a ON a.resource_id=r.id
          AND a.released_at IS NULL AND a.archived=0 WHERE r.archived=0 GROUP BY r.category,r.status''').fetchall()
        now=_now()
        on_duty=conn.execute('''SELECT COUNT(DISTINCT s.id) FROM staff s JOIN shifts h ON h.staff_id=s.id
          WHERE s.active=1 AND s.archived=0 AND h.archived=0 AND h.status='on_duty'
          AND h.starts_at<=? AND h.ends_at>?''',(now,now)).fetchone()[0]
        return {'hospital':dict(conn.execute('SELECT code,name,timezone FROM hospital WHERE id=1').fetchone()),
                'episodes':{r['state']:r['count'] for r in active},
                'resources':[{'category':r['category'],'status':r['status'],'total':r['total'],
                    'assigned':r['occupied'],'available':max(0,r['total']-r['occupied']) if r['status']=='available' else 0} for r in resources],
                'staff_on_duty':on_duty}
    finally:conn.close()
