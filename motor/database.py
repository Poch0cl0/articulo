"""Versioned SQLite migrations, preserving installations created before migrations."""
import argparse
from contextlib import closing
from datetime import datetime, timezone
import hashlib
from pathlib import Path
import sqlite3
import threading

DEFAULT_DB = Path(__file__).resolve().parents[1] / 'datos' / 'gemelo' / 'gemelo.sqlite3'
MIGRATIONS = Path(__file__).with_name('migrations')
_migration_lock = threading.RLock()


def migrate(conn, path, directory=MIGRATIONS):
    """DDL and version stamps commit together; existing records are never replaced."""
    with _migration_lock:
        conn.execute('CREATE TABLE IF NOT EXISTS schema_migrations '
                     '(version TEXT PRIMARY KEY, checksum TEXT NOT NULL, applied_at TEXT NOT NULL)')
        conn.commit()
        applied = dict(conn.execute('SELECT version,checksum FROM schema_migrations'))
        scripts = sorted(Path(directory).glob('*.sql'))
        known = {p.stem for p in scripts}
        if set(applied) - known:
            raise RuntimeError('La base usa migraciones que esta versión de la aplicación no conoce.')
        pending = []
        for script in scripts:
            sql = script.read_text(encoding='utf-8')
            checksum = hashlib.sha256(sql.encode('utf-8')).hexdigest()
            if script.stem in applied:
                if applied[script.stem] != checksum:
                    raise RuntimeError(f'La migración aplicada {script.stem} fue modificada.')
            else:
                pending.append((script.stem, sql, checksum))
        if not pending:
            return
        has_data = conn.execute("SELECT 1 FROM sqlite_master WHERE type='table' "
                                "AND name NOT IN ('schema_migrations','sqlite_sequence') LIMIT 1").fetchone()
        if has_data:
            stamp = datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%S%fZ')
            backup_path = Path(path).with_name(Path(path).name + f'.before-{stamp}.bak')
            with closing(sqlite3.connect(backup_path)) as backup:
                conn.backup(backup)
        try:
            conn.execute('BEGIN IMMEDIATE')
            # A different process may have migrated between the read and the lock.
            for version, sql, checksum in pending:
                previous = conn.execute('SELECT checksum FROM schema_migrations WHERE version=?', (version,)).fetchone()
                if previous:
                    if previous[0] != checksum:
                        raise RuntimeError(f'Checksum incompatible para {version}.')
                    continue
                statement = ''
                for line in sql.splitlines(keepends=True):
                    statement += line
                    if sqlite3.complete_statement(statement):
                        conn.execute(statement)
                        statement = ''
                if statement.strip():
                    raise RuntimeError(f'Sentencia SQL incompleta en {version}.')
                conn.execute('INSERT INTO schema_migrations VALUES(?,?,?)',
                             (version, checksum, datetime.now(timezone.utc).isoformat()))
            if conn.execute('PRAGMA foreign_key_check').fetchone():
                raise RuntimeError('La base contiene referencias inválidas; revisa los datos antes de migrar.')
            conn.commit()
        except Exception:
            conn.rollback()
            raise


def connect(path=DEFAULT_DB):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(path, timeout=15, isolation_level='IMMEDIATE')
    conn.row_factory = sqlite3.Row
    try:
        conn.execute('PRAGMA foreign_keys=ON')
        conn.execute('PRAGMA journal_mode=WAL')
        migrate(conn, path)
        return conn
    except Exception:
        conn.close()
        raise


def main():
    parser = argparse.ArgumentParser(description='Aplicar migraciones SQLite pendientes')
    parser.add_argument('--path', type=Path, default=DEFAULT_DB)
    args = parser.parse_args()
    conn = connect(args.path)
    try:
        for row in conn.execute('SELECT version,applied_at FROM schema_migrations ORDER BY version'):
            print(row['version'], row['applied_at'])
    finally:
        conn.close()


if __name__ == '__main__':
    main()
