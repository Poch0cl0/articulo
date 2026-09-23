# Reproducción de cohortes en el motor

La interfaz permite ejecutar una población JSON fija en lugar del generador sintético. Las cuatro políticas utilizan las mismas llegadas y necesidades de trabajo; los resultados alimentan los indicadores, la tabla y la escena 3D. Esto permite estudiar escenarios con entradas locales cuando estén disponibles. No entrena ni recalibra por sí mismo los modelos NHAMCS.

## Uso

1. Abre la interfaz y selecciona **Origen de pacientes → Reproducir cohorte JSON**.
2. Carga un archivo local o pulsa **Cargar ejemplo ficticio**. También puedes editar el JSON directamente.
3. Configura el horizonte, los recursos, la política y los parámetros de carga. El horizonte debe incluir todas las llegadas.
4. Ejecuta la simulación y compara políticas. Exportar JSON conserva la procedencia declarada, el hash, los parámetros y todas las entradas de pacientes junto a sus resultados.

El archivo de demostración `motor/web/cohorte-ejemplo.json` tiene ocho pacientes inventados; sirve para verificar el circuito completo, no es una muestra hospitalaria. El archivo se procesa en el navegador y se envía al servidor local del motor, sin servicio externo. No se guarda automáticamente en disco; una exportación sí guarda los resultados cuando el usuario la solicita.

## Contrato de entrada, versión 1

```json
{
  "version": 1,
  "name": "Cohorte demostrativa ficticia",
  "kind": "synthetic",
  "work_unit": "basal_minutes",
  "patients": [
    {"id": 0, "arrival": 0, "priority": 2, "service": 15, "ventilation": false},
    {"id": 1, "arrival": 2, "priority": 0, "service": 60, "ventilation": true}
  ]
}
```

- `kind`: `synthetic` u `observed`. Es una declaración del usuario, no una certificación de procedencia. Usa un nombre descriptivo sin información personal.
- `id`: entero anónimo único, no negativo y representable exactamente en JavaScript (máximo 9007199254740991).
- `arrival`: minutos desde el inicio, mayor o igual a cero y menor que el horizonte. No se descartan silenciosamente pacientes fuera de la ventana.
- `priority`: 0, 1 o 2, según las categorías del motor. El triaje NHAMCS no se convierte automáticamente.
- `service`: minutos positivos de **trabajo basal**. No es LOV, tiempo de estancia, demora hasta atención ni tiempo transcurrido entre ingreso y alta. La carga del motor reduce la velocidad de ejecución de este trabajo, por lo que la atención simulada puede durar más.
- `ventilation`: verdadero/falso. Solo P0 puede requerir ventilación, de acuerdo con el modelo actual.

Se rechazan campos desconocidos, valores no finitos, identificadores repetidos y esquemas incompatibles. Máximo de interfaz: 1.000 pacientes, archivo de 240 KB y 3 millones de paciente-pasos. La API acepta hasta 256 KiB de solicitud completa. Los límites adicionales de horizonte, recursos y pasos siguen vigentes.

Demanda y escala de servicio deben ser ×1. La interfaz los fija explícitamente en este modo; la API rechaza otros valores. La semilla se conserva en el objeto de ejecución por compatibilidad, pero no afecta la cohorte. El orden del archivo no determina la atención: se aplican las reglas del motor y desempate por identificador. El SHA-256 identifica el documento JSON con claves ordenadas y sin espacios; conserva el orden de la lista de pacientes.

## Condiciones para usar datos observados

El hospital empieza vacío. Esta versión no importa pacientes ya presentes ni ocupación inicial. El motor supone que cada paciente retiene un médico y una enfermera durante todo el episodio y que P0 requiere UCI; una cohorte importada no cambia esos supuestos. También mantiene la retroalimentación de carga configurada.

Antes de preparar una cohorte real, se necesita definir una medida de trabajo compatible con esos supuestos, documentar su estimación y acordar la correspondencia de prioridades. **No es válido renombrar una columna de estancia como `service`.** Si solo se dispone de marcas de inicio/fin o de estancias totales, es necesario ajustar primero el modelo de recursos y validar la medición. Este importador ofrece trazabilidad y reproducción, no evidencia de validez clínica ni una calibración peruana terminada.

API: agrega `cohort` con este documento al cuerpo de `POST /api/simulate`, junto con `config`, `policy`, `seed` y `compare` habituales. Si omites `cohort`, se mantiene el generador sintético original. Un valor `null` se rechaza para evitar volver involuntariamente a datos generados.

Pruebas: `python -m unittest discover -s motor -p "test_*.py"`; incluyen equivalencia con la API científica, comparación de las cuatro políticas, independencia de semilla, hash, errores de entrada y conservación de pacientes con capacidad cero.
