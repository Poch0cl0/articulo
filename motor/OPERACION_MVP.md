# Primera entrega de gestión operativa

Desde **Gestión operativa** se abre `/operations`, la primera pantalla persistente de administración local del hospital. Es también la vista inicial en `/`. Comparte `datos/gemelo/gemelo.sqlite3` con el registro de eventos del gemelo. La navegación lateral abre los seis módulos y la vista `/simulation`; sigue visible al entrar al simulador. Cada listado permite buscar y paginar; un panel lateral reúne los formularios de alta y edición. La configuración del hospital tiene su propio formulario.

En una base local intacta, el arranque instala una sola vez el **Hospital demostrativo ABS–SD**: 4 áreas, 12 recursos, 9 personas con turnos, 8 episodios seudónimos sintéticos y 8 asignaciones. El encabezado identifica estos datos como demostración. La instalación se omite si existe un área, recurso, persona, turno, episodio o asignación, o si se configuró el hospital. `demo_installation` registra si se instaló o se omitió; los reinicios no duplican registros. Los turnos de ejemplo se calculan en relación con la fecha de instalación y su vigencia cambia con el tiempo.

CRUD disponible vía pantalla y API:

| Ruta | Registro |
|---|---|
| `/api/ops/hospital` | Configuración local del hospital; GET y POST para actualizar. |
| `/api/ops/areas` | Código, nombre, tipo y estado activo. |
| `/api/ops/resources` | Camas, UCI, ventiladores y recursos generales; área y disponibilidad. |
| `/api/ops/staff` | Código seudónimo, rol, área y estado. |
| `/api/ops/shifts` | Persona, inicio, fin y estado del turno; rechaza cruces simultáneos de turno. |
| `/api/ops/episodes` | Referencia seudónima, prioridad local, área, estado y etapas temporales. |
| `/api/ops/assignments` | Asignar un recurso o una persona a un episodio activo; conservar y liberar asignaciones. |
| `/api/ops/dashboard` | Conteos de episodios, disponibilidad registrada y personal de turno. |

Para catálogos: `GET` lista, `POST` crea, `PUT /{id}` edita y `DELETE /{id}` archiva sin borrar el registro histórico. `POST /{id}/restore` restaura un registro archivado. Las asignaciones se liberan mediante `POST /api/ops/assignments/{id}/release`. El selector **Mostrar archivados** expone las opciones de restauración. Cambios y transiciones se registran en la auditoría local.

Los códigos de pacientes y del personal deben ser seudónimos. El sistema no necesita nombres ni documentos. Los turnos se guardan en UTC y se muestran en hora local del navegador. El huso configurado en el hospital se conserva para su futura integración.

## Persistencia y migraciones

El servidor aplica `motor/migrations/001_initial.sql` y `002_demo_installation.sql` automáticamente al iniciar. La misma operación puede ejecutarse con `python -m motor.database` desde la raíz, o con `--path RUTA` para otra base. La migración inicial crea las tablas operativas, de eventos y auditoría; la segunda registra la instalación demostrativa. Ambas registran versión y checksum en `schema_migrations`. Si la base ya contenía tablas, se conserva su contenido y se crea antes una copia `*.before-*.bak` mediante el mecanismo de respaldo de SQLite. Cada migración pendiente se aplica junto con su registro de versión en una transacción; si falla, se revierte. Ejecutar solo `motor.database` aplica el esquema; el servidor o `python -m motor.demo_seed` instala los registros de ejemplo donde corresponda.

No edites una migración aplicada: el arranque detecta el cambio por checksum. Para evolucionar el esquema, añade `003_*.sql` (y versiones siguientes) en `motor/migrations/`. El archivo SQLite, sus archivos WAL/SHM y las copias locales se excluyen de Git. La copia se crea solamente cuando hay migraciones pendientes sobre una base que ya tiene tablas.

Límites deliberados de esta entrega: la aplicación escucha únicamente en `127.0.0.1`, no tiene autenticación multiusuario y no está preparada para datos clínicos identificables ni operación hospitalaria en red. La identidad de episodio y prioridad local requiere acuerdo con el servicio. Las asignaciones y el tablero son registros persistentes, pero todavía no se convierten en instantánea inicial de `simulate`; este sigue generando pacientes sintéticos o acepta cohortes independientes. La conexión HIS/EHR y la sincronización bidireccional continúan pendientes.
