CREATE TABLE IF NOT EXISTS demo_installation (
  id INTEGER PRIMARY KEY CHECK(id=1),
  status TEXT NOT NULL CHECK(status IN ('seeded','skipped')),
  installed_at TEXT NOT NULL
);
