"""Small, local-first event ledger and projection for a future hospital connector.

This module only accepts a narrow operational allowlist. It is not a FHIR/HIS
connector and does not claim that an incoming source has been authenticated.
"""
from datetime import datetime, timezone, timedelta
import json
from pathlib import Path
from .database import DEFAULT_DB, connect as _connect

ROOT = Path(__file__).resolve().parents[1]
FRESH_FOR = timedelta(minutes=5)
MAX_EVENT_BYTES = 16_384

PATIENT_STATES = {'waiting', 'treating', 'observation', 'transferred', 'discharged'}
RESOURCE_CATEGORIES = {'general_bed', 'icu_bed', 'ventilator', 'doctor', 'nurse'}
RESOURCE_STATES = {'available', 'occupied', 'unavailable', 'maintenance'}
EVENT_SCHEMAS = {
    'patient_arrived': ('patient', {'priority', 'arrival_at'}),
    'patient_triaged': ('patient', {'priority', 'triage_at'}),
    'patient_started': ('patient', {'started_at'}),
    'patient_observed': ('patient', {'observed_at'}),
    'patient_transferred': ('patient', {'transferred_at'}),
    'patient_discharged': ('patient', {'discharged_at'}),
    'resource_registered': ('resource', {'category', 'status', 'location'}),
    'resource_status_changed': ('resource', {'status'}),
}


def _utcnow():
    return datetime.now(timezone.utc)


def _timestamp(value, label):
    if not isinstance(value, str) or len(value) > 40:
        raise ValueError(f'{label} debe ser una fecha ISO-8601 con zona horaria.')
    try:
        parsed = datetime.fromisoformat(value.replace('Z', '+00:00'))
    except ValueError as exc:
        raise ValueError(f'{label} debe ser una fecha ISO-8601 con zona horaria.') from exc
    if parsed.tzinfo is None or parsed.utcoffset() is None:
        raise ValueError(f'{label} debe incluir zona horaria.')
    if parsed > _utcnow() + timedelta(minutes=5):
        raise ValueError(f'{label} está más de cinco minutos en el futuro.')
    return parsed.astimezone(timezone.utc).isoformat()


def _identifier(value, label):
    if not isinstance(value, str) or not value.strip() or len(value) > 128:
        raise ValueError(f'{label} debe ser una cadena opaca de 1 a 128 caracteres.')
    return value


def validate_event(source, event):
    source = _identifier(source, 'source')
    if not isinstance(event, dict) or set(event) != {
            'event_id', 'entity_type', 'entity_id', 'version', 'occurred_at', 'type', 'data'}:
        raise ValueError('El evento requiere event_id, entity_type, entity_id, version, occurred_at, type y data.')
    event_id = _identifier(event['event_id'], 'event_id')
    entity_id = _identifier(event['entity_id'], 'entity_id')
    kind = event['type']
    if not isinstance(kind, str) or kind not in EVENT_SCHEMAS:
        raise ValueError('Tipo de evento no admitido.')
    expected_type, allowed_data = EVENT_SCHEMAS[kind]
    if event['entity_type'] != expected_type:
        raise ValueError('entity_type no corresponde al tipo de evento.')
    version = event['version']
    if type(version) is not int or version < 1:
        raise ValueError('version debe ser un entero positivo por entidad.')
    occurred_at = _timestamp(event['occurred_at'], 'occurred_at')
    data = event['data']
    if not isinstance(data, dict) or set(data) != allowed_data:
        raise ValueError(f'data debe contener únicamente: {", ".join(sorted(allowed_data))}.')

    if kind in ('patient_arrived', 'patient_triaged'):
        priority = data['priority']
        if type(priority) is not int or priority not in (0, 1, 2):
            raise ValueError('priority debe ser 0, 1 o 2 según la escala local acordada.')
        stamp_key = 'arrival_at' if kind == 'patient_arrived' else 'triage_at'
        data = {**data, stamp_key: _timestamp(data[stamp_key], stamp_key)}
    elif kind in ('patient_started', 'patient_observed', 'patient_transferred', 'patient_discharged'):
        stamp_key = {'patient_started':'started_at','patient_observed':'observed_at',
                     'patient_transferred':'transferred_at','patient_discharged':'discharged_at'}[kind]
        data = {stamp_key: _timestamp(data[stamp_key], stamp_key)}
    elif kind == 'resource_registered':
        if data['category'] not in RESOURCE_CATEGORIES or data['status'] not in RESOURCE_STATES:
            raise ValueError('Categoría o estado de recurso no admitido.')
        location = data['location']
        if location is not None and (not isinstance(location, str) or len(location) > 100):
            raise ValueError('location debe ser texto descriptivo de hasta 100 caracteres o null.')
    elif kind == 'resource_status_changed':
        if data['status'] not in RESOURCE_STATES:
            raise ValueError('Estado de recurso no admitido.')

    return {'source': source, 'event_id': event_id, 'entity_type': expected_type,
            'entity_id': entity_id, 'version': version, 'occurred_at': occurred_at,
            'type': kind, 'data': data}



def _initial_state(event):
    if event['type'] == 'patient_arrived':
        return 'waiting'
    if event['type'] == 'resource_registered':
        return event['data']['status']
    return None


def _next_state(event, current):
    kind = event['type']
    transitions = {
        'patient_triaged': {'waiting':'waiting'},
        'patient_started': {'waiting':'treating'},
        'patient_observed': {'treating':'observation'},
        'patient_transferred': {'waiting':'transferred','treating':'transferred','observation':'transferred'},
        'patient_discharged': {'waiting':'discharged','treating':'discharged','observation':'discharged'},
        'resource_status_changed': {s:s for s in RESOURCE_STATES},
    }
    allowed = transitions.get(kind, {})
    if current is None or current not in allowed:
        return None
    if kind == 'resource_status_changed':
        return event['data']['status']
    return allowed[current]


def ingest(event, source, path=DEFAULT_DB):
    parsed = validate_event(source, event)
    encoded = json.dumps(parsed['data'], ensure_ascii=False, sort_keys=True,
                         separators=(',', ':'), allow_nan=False)
    if len(encoded.encode('utf-8')) > MAX_EVENT_BYTES:
        raise ValueError('data supera el tamaño admitido.')
    received = _utcnow().isoformat()
    conn = _connect(path)
    try:
        conn.execute('BEGIN IMMEDIATE')
        previous = conn.execute('SELECT * FROM events WHERE source=? AND event_id=?',
                                (source, parsed['event_id'])).fetchone()
        pending_retry = previous and previous['disposition'] == 'pending'
        if previous and not pending_retry:
            conn.rollback()
            return {'disposition':'duplicate','event_id':parsed['event_id'],
                    'original_disposition':previous['disposition']}
        if pending_retry and (previous['entity_type'] != parsed['entity_type'] or
                previous['entity_id'] != parsed['entity_id'] or previous['version'] != parsed['version'] or
                previous['occurred_at'] != parsed['occurred_at'] or previous['kind'] != parsed['type'] or
                previous['data_json'] != encoded):
            conn.rollback()
            raise ValueError('event_id ya está pendiente con otro contenido.')
        entity = conn.execute('SELECT * FROM entities WHERE entity_type=? AND entity_id=?',
                              (parsed['entity_type'],parsed['entity_id'])).fetchone()
        detail = None
        disposition = 'accepted'
        next_state = None
        payload = {}
        if entity is None:
            next_state = _initial_state(parsed)
            if next_state is None or parsed['version'] != 1:
                disposition, detail = 'rejected', 'La entidad debe comenzar con su evento de creación y versión 1.'
            else:
                payload = dict(parsed['data'])
                if parsed['entity_type'] == 'patient':
                    payload['state'] = next_state
        elif entity['source'] != source:
            disposition, detail = 'rejected', 'La entidad pertenece a otra fuente; se requiere conciliación explícita.'
        elif parsed['version'] <= entity['version']:
            disposition, detail = 'stale', f"Versión obsoleta; la última aceptada es {entity['version']}."
        elif parsed['version'] != entity['version'] + 1:
            disposition, detail = 'pending', f"Falta versión {entity['version'] + 1}; reenvía este evento después de completar la anterior."
        else:
            next_state = _next_state(parsed, entity['state'])
            if next_state is None:
                disposition, detail = 'rejected', f"Transición no admitida desde el estado {entity['state']}."
            else:
                payload = json.loads(entity['payload_json'])
                event_time=datetime.fromisoformat(parsed['occurred_at'])
                previous_time=datetime.fromisoformat(entity['occurred_at'])
                if event_time < previous_time:
                    disposition, detail = 'rejected', 'occurred_at no puede retroceder respecto de la versión anterior.'
                else:
                    stamp_keys = {'patient_triaged':['triage_at'], 'patient_started':['started_at'],
                                  'patient_observed':['observed_at'], 'patient_transferred':['transferred_at'],
                                  'patient_discharged':['discharged_at']}.get(parsed['type'],[])
                    prior_stamps=[payload[key] for key in ('arrival_at','triage_at','started_at','observed_at') if key in payload]
                    if any(datetime.fromisoformat(parsed['data'][key]) < datetime.fromisoformat(old)
                           for key in stamp_keys for old in prior_stamps):
                        disposition, detail = 'rejected', 'La marca de tiempo del evento precede una etapa asistencial ya registrada.'
                    else:
                        payload.update(parsed['data'])
                        if parsed['entity_type'] == 'patient':
                            payload['state'] = next_state

        event_row=(source,parsed['event_id'],parsed['entity_type'],parsed['entity_id'],
                   parsed['version'],parsed['occurred_at'],received,parsed['type'],encoded,
                   disposition,detail)
        if pending_retry:
            conn.execute('''UPDATE events SET received_at=?,disposition=?,detail=?
              WHERE source=? AND event_id=?''',
                         (received,disposition,detail,source,parsed['event_id']))
        else:
            conn.execute('INSERT INTO events VALUES (?,?,?,?,?,?,?,?,?,?,?)',event_row)
        conn.execute('''INSERT INTO sources(source,last_received_at,last_event_id,accepted,rejected)
          VALUES(?,?,?,?,?) ON CONFLICT(source) DO UPDATE SET
          last_received_at=excluded.last_received_at,last_event_id=excluded.last_event_id,
          accepted=sources.accepted+excluded.accepted,rejected=sources.rejected+excluded.rejected''',
                     (source,received,parsed['event_id'],int(disposition=='accepted'),
                      int(disposition in ('rejected','stale'))))
        if disposition == 'accepted':
            conn.execute('''INSERT INTO entities VALUES (?,?,?,?,?,?,?,?)
              ON CONFLICT(entity_type,entity_id) DO UPDATE SET version=excluded.version,
              state=excluded.state,payload_json=excluded.payload_json,
              occurred_at=excluded.occurred_at,updated_at=excluded.updated_at''',
                         (parsed['entity_type'],parsed['entity_id'],source,parsed['version'],
                          next_state,payload and json.dumps(payload,ensure_ascii=False,sort_keys=True) or '{}',
                          parsed['occurred_at'],received))
        conn.commit()
        return {'disposition':disposition,'event_id':parsed['event_id'],
                'entity_type':parsed['entity_type'],'version':parsed['version'],'detail':detail}
    except Exception:
        conn.rollback()
        raise
    finally:
        conn.close()


def status(path=DEFAULT_DB, now=None):
    now = now or _utcnow()
    conn = _connect(path)
    try:
        sources = [dict(row) for row in conn.execute('SELECT * FROM sources ORDER BY source')]
        patients = {row['state']:row['n'] for row in conn.execute(
            "SELECT state,COUNT(*) n FROM entities WHERE entity_type='patient' GROUP BY state")}
        resources = {f"{row['state']}:{row['category']}":row['n'] for row in conn.execute(
            "SELECT state,json_extract(payload_json,'$.category') category,COUNT(*) n "
            "FROM entities WHERE entity_type='resource' GROUP BY state,category")}
        newest = conn.execute("SELECT MAX(received_at) t FROM events WHERE disposition='accepted'").fetchone()['t']
        counts = {row['disposition']:row['n'] for row in conn.execute(
            'SELECT disposition,COUNT(*) n FROM events GROUP BY disposition')}
        if not sources:
            connection = 'sin_fuentes'
        else:
            latest = max(datetime.fromisoformat(s['last_received_at']) for s in sources)
            connection = 'reciente' if now - latest <= FRESH_FOR else 'sin_actualizaciones_recientes'
        return {'connection':connection,'freshness_limit_seconds':int(FRESH_FOR.total_seconds()),
                'last_accepted_event_at':newest,'patients':patients,'resources':resources,
                'events':counts,'sources':[{'source':s['source'],'last_received_at':s['last_received_at'],
                       'last_event_id':s['last_event_id'],'accepted':s['accepted'],
                       'rejected':s['rejected']} for s in sources],
                'identity':'Autodeclarada por el emisor; autenticación del HIS/EHR pendiente.'}
    finally:
        conn.close()
