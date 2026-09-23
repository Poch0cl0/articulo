from pathlib import Path
from contextlib import closing
import sqlite3
import tempfile
import unittest

from motor.database import MIGRATIONS, connect, migrate
from motor.demo_seed import seed_demo
from motor.operations import archive_record, list_records, restore_record, save_record


class DatabaseTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.path = Path(self.temp.name) / 'hospital.sqlite3'

    def tearDown(self):
        self.temp.cleanup()

    def test_new_database_and_persistent_crud(self):
        area = save_record('areas', {'code':'A1','name':'Emergencias','kind':'ed'}, path=self.path)
        save_record('areas', {'name':'Emergencias principal','active':False}, area['id'], self.path)
        self.assertEqual(list_records('areas',self.path)[0]['active'],0)
        archive_record('areas',area['id'],self.path)
        self.assertEqual(list_records('areas',self.path),[])
        restore_record('areas',area['id'],self.path)
        self.assertEqual(list_records('areas',self.path)[0]['name'],'Emergencias principal')
        conn=connect(self.path)
        try:
            self.assertEqual(conn.execute('SELECT COUNT(*) FROM schema_migrations').fetchone()[0],2)
            self.assertEqual(conn.execute('SELECT COUNT(*) FROM audit_log').fetchone()[0],4)
            self.assertEqual(conn.execute('PRAGMA foreign_key_check').fetchall(),[])
        finally:conn.close()

    def test_legacy_adoption_preserves_records_and_makes_backup(self):
        conn=sqlite3.connect(self.path)
        conn.executescript((MIGRATIONS/'001_initial.sql').read_text(encoding='utf-8'))
        conn.execute("INSERT INTO areas(code,name,kind,created_at,updated_at) VALUES('KEEP','Área existente','ed','2026-01-01','2026-01-01')")
        conn.commit();conn.close()
        for _ in range(2):connect(self.path).close()
        self.assertEqual(list_records('areas',self.path)[0]['code'],'KEEP')
        backups=list(self.path.parent.glob('*.bak'))
        self.assertEqual(len(backups),1)
        with closing(sqlite3.connect(backups[0])) as backup:
            self.assertEqual(backup.execute('SELECT code FROM areas').fetchone()[0],'KEEP')

    def test_failed_migration_rolls_back_schema_and_version(self):
        folder=Path(self.temp.name)/'migrations';folder.mkdir()
        (folder/'001_bad.sql').write_text('CREATE TABLE partial(id INTEGER);\nINVALID SQL;\n',encoding='utf-8')
        conn=sqlite3.connect(self.path)
        try:
            with self.assertRaises(sqlite3.Error):migrate(conn,self.path,folder)
            self.assertIsNone(conn.execute("SELECT name FROM sqlite_master WHERE name='partial'").fetchone())
            self.assertEqual(conn.execute('SELECT COUNT(*) FROM schema_migrations').fetchone()[0],0)
        finally:conn.close()

    def test_applied_migration_cannot_be_silently_changed(self):
        conn=connect(self.path)
        folder=Path(self.temp.name)/'changed';folder.mkdir()
        (folder/'001_initial.sql').write_text('CREATE TABLE injected(id INTEGER);\n',encoding='utf-8')
        (folder/'002_demo_installation.sql').write_text((MIGRATIONS/'002_demo_installation.sql').read_text(encoding='utf-8'),encoding='utf-8')
        try:
            with self.assertRaisesRegex(RuntimeError,'modificada'):migrate(conn,self.path,folder)
            self.assertIsNone(conn.execute("SELECT name FROM sqlite_master WHERE name='injected'").fetchone())
        finally:conn.close()

    def test_demo_seed_is_complete_and_runs_once(self):
        self.assertTrue(seed_demo(self.path))
        self.assertFalse(seed_demo(self.path))
        conn=connect(self.path)
        try:
            self.assertEqual(conn.execute('SELECT code FROM hospital').fetchone()[0], 'DEMO-ABS')
            self.assertEqual([conn.execute(f'SELECT COUNT(*) FROM {table}').fetchone()[0]
                              for table in ('areas','operational_resources','staff','shifts','episodes','assignments')],
                             [4,12,9,9,8,8])
            self.assertEqual(conn.execute("SELECT COUNT(*) FROM episodes WHERE source='synthetic'").fetchone()[0],8)
            self.assertEqual(conn.execute('PRAGMA foreign_key_check').fetchall(),[])
        finally:conn.close()

    def test_demo_seed_leaves_existing_hospital_alone(self):
        save_record('areas', {'code':'USER','name':'Área propia','kind':'ed'}, path=self.path)
        self.assertFalse(seed_demo(self.path))
        self.assertFalse(seed_demo(self.path))
        conn=connect(self.path)
        try:
            self.assertEqual(conn.execute('SELECT code FROM hospital').fetchone()[0], 'HOSP-LOCAL')
            self.assertEqual(conn.execute('SELECT code FROM areas').fetchone()[0], 'USER')
            self.assertEqual(conn.execute('SELECT status FROM demo_installation').fetchone()[0], 'skipped')
        finally:conn.close()


if __name__=='__main__':unittest.main()
