"""Install one clearly fictional hospital example on an untouched local database."""
from datetime import datetime, timedelta, timezone
import json

from .database import DEFAULT_DB, connect


def seed_demo(path=DEFAULT_DB):
    conn = connect(path)
    try:
        conn.execute('BEGIN IMMEDIATE')
        if conn.execute('SELECT 1 FROM demo_installation WHERE id=1').fetchone():
            conn.commit()
            return False
        tables = ('areas', 'operational_resources', 'staff', 'shifts', 'episodes', 'assignments')
        hospital = conn.execute('SELECT code FROM hospital WHERE id=1').fetchone()
        untouched = hospital and hospital['code'] == 'HOSP-LOCAL' and all(
            conn.execute(f'SELECT 1 FROM {table} LIMIT 1').fetchone() is None for table in tables
        )
        now = datetime.now(timezone.utc).replace(microsecond=0)
        iso = lambda when: when.isoformat(timespec='seconds')
        stamp = iso(now)
        if not untouched:
            conn.execute('INSERT INTO demo_installation VALUES(1,?,?)', ('skipped', stamp))
            conn.commit()
            return False

        conn.execute("UPDATE hospital SET code='DEMO-ABS', name='Hospital demostrativo ABS–SD', updated_at=? WHERE id=1", (stamp,))
        areas = [
            ('URG', 'Urgencias', 'ed'), ('OBS', 'Observación', 'observation'),
            ('UCI', 'Cuidados intensivos', 'icu'), ('APO', 'Servicios de apoyo', 'support'),
        ]
        area_ids = {}
        for code, name, kind in areas:
            area_ids[code] = conn.execute(
                'INSERT INTO areas(code,name,kind,created_at,updated_at) VALUES(?,?,?,?,?)',
                (code, name, kind, stamp, stamp),
            ).lastrowid

        resources = [
            *[(f'CAM-{i:02}', f'Cama de urgencias {i:02}', 'general_bed', 'URG', 'available') for i in range(1, 5)],
            *[(f'OBS-{i:02}', f'Cama de observación {i:02}', 'general_bed', 'OBS', 'available') for i in range(1, 4)],
            *[(f'UCI-{i:02}', f'Cama UCI {i:02}', 'icu_bed', 'UCI', 'available') for i in range(1, 3)],
            ('VEN-01', 'Ventilador 01', 'ventilator', 'UCI', 'available'),
            ('VEN-02', 'Ventilador 02', 'ventilator', 'UCI', 'maintenance'),
            ('MON-01', 'Monitor multiparámetro', 'other', 'URG', 'available'),
        ]
        resource_ids = {}
        for code, name, category, area, status in resources:
            resource_ids[code] = conn.execute(
                'INSERT INTO operational_resources(code,name,category,area_id,status,created_at,updated_at) VALUES(?,?,?,?,?,?,?)',
                (code, name, category, area_ids[area], status, stamp, stamp),
            ).lastrowid

        staff = [
            ('MED-01', 'physician', 'URG'), ('MED-02', 'physician', 'URG'),
            ('MED-03', 'physician', 'UCI'), ('ENF-01', 'nurse', 'URG'),
            ('ENF-02', 'nurse', 'URG'), ('ENF-03', 'nurse', 'OBS'),
            ('ENF-04', 'nurse', 'UCI'), ('TEC-01', 'technician', 'URG'),
            ('TEC-02', 'technician', 'APO'),
        ]
        staff_ids = {}
        for code, role, area in staff:
            staff_ids[code] = conn.execute(
                'INSERT INTO staff(code,role,area_id,created_at,updated_at) VALUES(?,?,?,?,?)',
                (code, role, area_ids[area], stamp, stamp),
            ).lastrowid
        for code, _, _ in staff:
            on_duty = code not in ('MED-02', 'ENF-04', 'TEC-02')
            start = now - timedelta(hours=2) if on_duty else now + timedelta(hours=2)
            end = now + timedelta(hours=6) if on_duty else now + timedelta(hours=10)
            conn.execute(
                'INSERT INTO shifts(staff_id,starts_at,ends_at,status,created_at,updated_at) VALUES(?,?,?,?,?,?)',
                (staff_ids[code], iso(start), iso(end), 'on_duty' if on_duty else 'planned', stamp, stamp),
            )

        episodes = [
            ('DEMO-001', 0, 'treating', 'URG', 65, 57, 48, None),
            ('DEMO-002', 1, 'observation', 'OBS', 95, 82, 70, None),
            ('DEMO-003', 2, 'waiting', 'URG', 24, None, None, None),
            ('DEMO-004', 1, 'triaged', 'URG', 38, 27, None, None),
            ('DEMO-005', 2, 'waiting', 'URG', 12, None, None, None),
            ('DEMO-006', 0, 'treating', 'UCI', 110, 101, 92, None),
            ('DEMO-007', 2, 'discharged', 'OBS', 220, 206, 190, 35),
            ('DEMO-008', 1, 'transferred', 'URG', 175, 160, 145, 40),
        ]
        episode_ids = {}
        for ref, priority, state, area, arrival, triage, start, end in episodes:
            episode_ids[ref] = conn.execute(
                '''INSERT INTO episodes(patient_ref,priority,state,area_id,arrived_at,triaged_at,
                   started_at,ended_at,source,created_at,updated_at) VALUES(?,?,?,?,?,?,?,?,?,?,?)''',
                (ref, priority, state, area_ids[area], iso(now-timedelta(minutes=arrival)),
                 iso(now-timedelta(minutes=triage)) if triage is not None else None,
                 iso(now-timedelta(minutes=start)) if start is not None else None,
                 iso(now-timedelta(minutes=end)) if end is not None else None,
                 'synthetic', stamp, stamp),
            ).lastrowid
        assignments = [
            ('DEMO-001', 'CAM-01', None), ('DEMO-001', None, 'MED-01'),
            ('DEMO-001', None, 'ENF-01'), ('DEMO-002', 'OBS-01', None),
            ('DEMO-002', None, 'ENF-03'), ('DEMO-006', 'UCI-01', None),
            ('DEMO-006', 'VEN-01', None), ('DEMO-006', None, 'MED-03'),
        ]
        for ref, resource, person in assignments:
            conn.execute(
                'INSERT INTO assignments(episode_id,resource_id,staff_id,assigned_at,created_at) VALUES(?,?,?,?,?)',
                (episode_ids[ref], resource_ids.get(resource), staff_ids.get(person), stamp, stamp),
            )
        conn.execute('INSERT INTO demo_installation VALUES(1,?,?)', ('seeded', stamp))
        conn.execute('INSERT INTO audit_log(entity,entity_id,action,changed_at,changes_json) VALUES(?,?,?,?,?)',
                     ('demo_installation', 1, 'seed', stamp,
                      json.dumps({'areas':4,'resources':12,'staff':9,'shifts':9,'episodes':8,'assignments':8})))
        conn.commit()
        return True
    except Exception:
        conn.rollback()
        raise
    finally:
        conn.close()


if __name__ == '__main__':
    print('Datos demostrativos instalados.' if seed_demo() else 'La base ya estaba inicializada; no se modificó.')
