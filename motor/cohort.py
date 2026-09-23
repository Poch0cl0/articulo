"""Explicit replay inputs; never infer basal work from length of stay."""
import hashlib
import json
import math

from .model import Patient


def parse_cohort(document, config):
    if not isinstance(document, dict) or set(document) != {'version', 'name', 'kind', 'work_unit', 'patients'}:
        raise ValueError('Cohorte: se requieren version, name, kind, work_unit y patients, sin otros campos.')
    if type(document['version']) is not int or document['version'] != 1:
        raise ValueError('Versión de cohorte no compatible; usa version: 1.')
    if not isinstance(document['name'], str) or not 1 <= len(document['name'].strip()) <= 100:
        raise ValueError('El nombre de la cohorte debe tener entre 1 y 100 caracteres.')
    if document['kind'] not in ('synthetic', 'observed'):
        raise ValueError('kind debe ser synthetic u observed (procedencia declarada por el usuario).')
    if document['work_unit'] != 'basal_minutes':
        raise ValueError('service debe expresar trabajo basal en minutos; no estancia ni espera.')
    rows = document['patients']
    if not isinstance(rows, list) or not 1 <= len(rows) <= 1000:
        raise ValueError('La cohorte debe contener entre 1 y 1000 pacientes.')
    if len(rows) * math.ceil(config.horizon / config.dt) > 3_000_000:
        raise ValueError('La cohorte excede 3 millones de paciente-pasos; aumenta el paso temporal.')
    if config.demand != 1 or config.service_scale != 1:
        raise ValueError('La reproducción de cohorte requiere demanda y servicio ×1 para conservar los datos.')
    patients, seen = [], set()
    for i, row in enumerate(rows, 1):
        def fail(message):
            raise ValueError(f'Cohorte, fila {i}: {message}')
        if not isinstance(row, dict) or set(row) != {'id','arrival','priority','service','ventilation'}:
            fail('se requieren únicamente id, arrival, priority, service y ventilation.')
        if type(row['id']) is not int or not 0 <= row['id'] <= 2**53-1 or row['id'] in seen:
            fail('id debe ser entero único entre 0 y 9007199254740991.')
        for key in ('arrival','service'):
            if type(row[key]) not in (int,float) or not math.isfinite(row[key]):
                fail(f'{key} debe ser un número finito.')
        if not 0 <= row['arrival'] < config.horizon:
            fail('arrival debe estar entre 0 y el horizonte, sin incluir el extremo final.')
        if row['service'] <= 0:
            fail('service debe ser mayor que cero.')
        if type(row['priority']) is not int or row['priority'] not in (0,1,2):
            fail('priority debe ser P0, P1 o P2, representado por 0, 1 o 2.')
        if type(row['ventilation']) is not bool or (row['ventilation'] and row['priority'] != 0):
            fail('ventilation debe ser booleano y solo P0 puede necesitar ventilación.')
        seen.add(row['id'])
        patients.append(Patient(**row))
    canonical=json.dumps(document,sort_keys=True,separators=(',',':'),ensure_ascii=False,allow_nan=False)
    return patients, dict(mode='cohort',name=document['name'],kind=document['kind'],
                         provenance='user_declared',records=len(patients),
                         sha256=hashlib.sha256(canonical.encode('utf-8')).hexdigest(),
                         work_unit='basal_minutes',initial_state='empty')
