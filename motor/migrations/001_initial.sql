
        CREATE TABLE IF NOT EXISTS events (
          source TEXT NOT NULL, event_id TEXT NOT NULL, entity_type TEXT NOT NULL,
          entity_id TEXT NOT NULL, version INTEGER NOT NULL, occurred_at TEXT NOT NULL,
          received_at TEXT NOT NULL, kind TEXT NOT NULL, data_json TEXT NOT NULL,
          disposition TEXT NOT NULL, detail TEXT,
          PRIMARY KEY(source,event_id));
        CREATE INDEX IF NOT EXISTS events_entity ON events(entity_type,entity_id,version);
        CREATE TABLE IF NOT EXISTS entities (
          entity_type TEXT NOT NULL, entity_id TEXT NOT NULL, source TEXT NOT NULL,
          version INTEGER NOT NULL, state TEXT NOT NULL, payload_json TEXT NOT NULL,
          occurred_at TEXT NOT NULL, updated_at TEXT NOT NULL,
          PRIMARY KEY(entity_type,entity_id));
        CREATE TABLE IF NOT EXISTS sources (
          source TEXT PRIMARY KEY, last_received_at TEXT NOT NULL,
          last_event_id TEXT NOT NULL, accepted INTEGER NOT NULL DEFAULT 0,
          rejected INTEGER NOT NULL DEFAULT 0);
    

    CREATE TABLE IF NOT EXISTS hospital (
      id INTEGER PRIMARY KEY CHECK(id=1), code TEXT NOT NULL, name TEXT NOT NULL,
      timezone TEXT NOT NULL, created_at TEXT NOT NULL, updated_at TEXT NOT NULL);
    INSERT OR IGNORE INTO hospital(id,code,name,timezone,created_at,updated_at)
      VALUES(1,'HOSP-LOCAL','Hospital local · configuración pendiente','America/Lima',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    CREATE TABLE IF NOT EXISTS areas (
      id INTEGER PRIMARY KEY, code TEXT NOT NULL UNIQUE, name TEXT NOT NULL,
      kind TEXT NOT NULL CHECK(kind IN ('ed','icu','observation','support')),
      active INTEGER NOT NULL DEFAULT 1 CHECK(active IN (0,1)), archived INTEGER NOT NULL DEFAULT 0,
      created_at TEXT NOT NULL, updated_at TEXT NOT NULL);
    CREATE TABLE IF NOT EXISTS operational_resources (
      id INTEGER PRIMARY KEY, code TEXT NOT NULL UNIQUE, name TEXT NOT NULL,
      category TEXT NOT NULL CHECK(category IN ('general_bed','icu_bed','ventilator','other')),
      area_id INTEGER NOT NULL REFERENCES areas(id),
      status TEXT NOT NULL CHECK(status IN ('available','unavailable','maintenance')),
      archived INTEGER NOT NULL DEFAULT 0, created_at TEXT NOT NULL, updated_at TEXT NOT NULL);
    CREATE TABLE IF NOT EXISTS staff (
      id INTEGER PRIMARY KEY, code TEXT NOT NULL UNIQUE,
      role TEXT NOT NULL CHECK(role IN ('physician','nurse','technician','other')),
      area_id INTEGER REFERENCES areas(id), active INTEGER NOT NULL DEFAULT 1 CHECK(active IN (0,1)),
      archived INTEGER NOT NULL DEFAULT 0, created_at TEXT NOT NULL, updated_at TEXT NOT NULL);
    CREATE TABLE IF NOT EXISTS shifts (
      id INTEGER PRIMARY KEY, staff_id INTEGER NOT NULL REFERENCES staff(id),
      starts_at TEXT NOT NULL, ends_at TEXT NOT NULL,
      status TEXT NOT NULL CHECK(status IN ('planned','on_duty','completed','absent')),
      archived INTEGER NOT NULL DEFAULT 0, created_at TEXT NOT NULL, updated_at TEXT NOT NULL);
    CREATE INDEX IF NOT EXISTS shifts_staff_time ON shifts(staff_id,starts_at,ends_at);
    CREATE TABLE IF NOT EXISTS episodes (
      id INTEGER PRIMARY KEY, patient_ref TEXT NOT NULL UNIQUE,
      priority INTEGER NOT NULL CHECK(priority IN (0,1,2)),
      state TEXT NOT NULL CHECK(state IN ('waiting','triaged','treating','observation','transferred','discharged')),
      area_id INTEGER REFERENCES areas(id), arrived_at TEXT NOT NULL, triaged_at TEXT,
      started_at TEXT, ended_at TEXT, source TEXT NOT NULL CHECK(source IN ('observed','synthetic')),
      archived INTEGER NOT NULL DEFAULT 0, created_at TEXT NOT NULL, updated_at TEXT NOT NULL);
    CREATE TABLE IF NOT EXISTS assignments (
      id INTEGER PRIMARY KEY, episode_id INTEGER NOT NULL REFERENCES episodes(id),
      resource_id INTEGER REFERENCES operational_resources(id), staff_id INTEGER REFERENCES staff(id),
      assigned_at TEXT NOT NULL, released_at TEXT, archived INTEGER NOT NULL DEFAULT 0,
      created_at TEXT NOT NULL, CHECK((resource_id IS NULL) != (staff_id IS NULL)));
    CREATE UNIQUE INDEX IF NOT EXISTS one_active_resource_assignment ON assignments(resource_id)
      WHERE resource_id IS NOT NULL AND released_at IS NULL AND archived=0;
    CREATE UNIQUE INDEX IF NOT EXISTS one_active_staff_assignment ON assignments(staff_id)
      WHERE staff_id IS NOT NULL AND released_at IS NULL AND archived=0;
    CREATE INDEX IF NOT EXISTS assignment_episode ON assignments(episode_id,released_at);
    CREATE TABLE IF NOT EXISTS audit_log (
      id INTEGER PRIMARY KEY, entity TEXT NOT NULL, entity_id INTEGER,
      action TEXT NOT NULL, changed_at TEXT NOT NULL, changes_json TEXT NOT NULL);
    