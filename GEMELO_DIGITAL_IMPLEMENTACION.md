# Primera implementación del gemelo digital

## Disponible ahora

Se añadió una base local para recibir eventos operativos con un esquema limitado, guardarlos en SQLite y mantener un estado agregado de pacientes y recursos. La interfaz consulta ese estado cada 15 segundos. La base predeterminada se crea en `datos/gemelo/gemelo.sqlite3`; `make_server(..., twin_db=...)` permite indicar otra ruta local.

### API local

`GET /api/twin/status` devuelve el estado de conexión (`sin_fuentes`, `reciente` o `sin_actualizaciones_recientes`), conteos de entidades por estado, estadísticas de eventos y fuentes declaradas. La actividad se considera reciente durante cinco minutos. Las respuestas no enumeran identificadores de pacientes.

`POST /api/twin/events` recibe un evento por solicitud:

```json
{
  "source": "conector-hospital",
  "event": {
    "event_id": "evento-opaco-123",
    "entity_type": "patient",
    "entity_id": "episodio-pseudonimo-456",
    "version": 1,
    "occurred_at": "2026-09-23T10:00:00-05:00",
    "type": "patient_arrived",
    "data": {"priority": 2, "arrival_at": "2026-09-23T10:00:00-05:00"}
  }
}
```

`source` identifica la fuente declarada por el emisor. Cada combinación fuente y entidad debe comenzar en versión 1 y avanzar secuencialmente. Eventos duplicados son idempotentes; versiones repetidas se marcan obsoletas; una brecha queda pendiente y se puede reenviar con el mismo contenido e identificador una vez que llegue la versión faltante. Las transiciones incompatibles se rechazan y quedan registradas. Cada aceptación actualiza el historial y la proyección en una transacción SQLite.

Las marcas de tiempo requieren zona horaria, no admiten valores más de cinco minutos en el futuro y deben mantener el orden de las etapas ya proyectadas. Un evento válido que retrocede en el tiempo se registra como rechazado sin cambiar la proyección.

Tipos admitidos:

| Evento | Entidad | Datos permitidos | Transición |
|---|---|---|---|
| `patient_arrived` | `patient` | `priority`, `arrival_at` | Creación → `waiting` |
| `patient_triaged` | `patient` | `priority`, `triage_at` | `waiting` → `waiting` |
| `patient_started` | `patient` | `started_at` | `waiting` → `treating` |
| `patient_observed` | `patient` | `observed_at` | `treating` → `observation` |
| `patient_transferred` | `patient` | `transferred_at` | Activo → `transferred` |
| `patient_discharged` | `patient` | `discharged_at` | Espera/atención/observación → `discharged` |
| `resource_registered` | `resource` | `category`, `status`, `location` | Creación → estado informado |
| `resource_status_changed` | `resource` | `status` | Actualiza estado de recurso |

Prioridad admite 0, 1 o 2 conforme a la correspondencia local que el hospital configure. Categorías de recurso: `general_bed`, `icu_bed`, `ventilator`, `doctor` y `nurse`. Estados: `available`, `occupied`, `unavailable` y `maintenance`. Todas las fechas deben incluir zona horaria. No se admite texto clínico libre ni se incluyen campos de nombres, documentos o identificadores directos.

El emisor debe identificar episodios con claves seudónimas. El estado informa que la fuente se autodeclara y que su autenticación está pendiente; `source` no demuestra autenticidad. El servidor sigue limitado a loopback (`127.0.0.1`) y el origen web se comprueba. La conexión autenticada HIS/EHR, certificados, permisos y operación en red hospitalaria no están implementados.

## Integración pendiente

Esta primera etapa persiste y proyecta eventos recibidos, pero **todavía no importa el estado del gemelo en `simulate`**: la simulación inicia vacía y continúa en paralelo. Tampoco calcula ocupación por asignaciones paciente-recurso, ingiere instantáneas iniciales, recupera desconexiones desde una fuente real ni escribe decisiones de vuelta al HIS/EHR. El resumen del panel lo advierte. No registrar eventos sintéticos como si fueran una conexión real.

El conector del hospital deberá traducir sus eventos a este contrato, resolver versiones e identidad de episodios, establecer la escala local de prioridad, autenticar la fuente y acordar la retención del registro SQLite. Para cerrar la integración con la simulación hace falta ampliar el motor para inicializar pacientes en espera y atención, personal y recursos ocupados, trabajo restante estimado y sus incertidumbres. No se puede deducir ese trabajo de estancia total o espera; las asignaciones durante toda la atención y la UCI automática por prioridad del motor actual también deben revisarse contra el servicio real.
