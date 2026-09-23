# Motor experimental ABS–SD

Prueba de concepto sintética para el artículo. No contiene datos de pacientes ni parámetros calibrados a un hospital. Implementa pacientes individuales, asignaciones exclusivas de médico/enfermería, camas generales, UCI, ventiladores y un stock agregado de carga de trabajo con retroalimentación sobre la velocidad del servicio.

Requiere Python 3.10 o posterior; usa exclusivamente la biblioteca estándar.

## Interfaz visual local

Haz doble clic en `Abrir interfaz.cmd`, en la raíz del proyecto, o ejecuta:

```powershell
python -m motor.ui
```

Se abrirá `http://127.0.0.1:8765` en el navegador, con la gestión hospitalaria como vista inicial. El sidebar lleva a **Simulación y gemelo 3D** en `/simulation` y permanece visible al cambiar de módulo. Mantén abierta la terminal mientras utilizas el panel; Ctrl+C detiene el servidor. Si el puerto está ocupado, puedes usar `python -m motor.ui --port 8766`. `--no-browser` inicia el servidor sin abrir otra pestaña.

La vista de simulación ejecuta un escenario de referencia al abrirse. Permite configurar demanda, capacidades, horizonte, paso, semilla, política, reserva, envejecimiento y parámetros del objetivo y de SD. Incluye evolución temporal con consulta por minuto, ocupación media, cobertura por prioridad, comparación emparejada de cuatro políticas, filtro de pacientes y descarga de JSON y CSV. El JSON incluye configuración, semilla, política, métricas, pacientes, trayectorias y comparaciones; el CSV contiene todos los pacientes de la política seleccionada, independientemente del filtro visual.

La comparación es una sola réplica por política, no el experimento estadístico completo. FIFO y prioridad estricta se comparan sin reserva; las alternativas usan la reserva y el envejecimiento indicados. No escribe en `resultados/`. Funciona sin bibliotecas externas ni conexión a Internet y escucha únicamente en el equipo local.

Para mantener acotadas las ejecuciones interactivas, la interfaz admite hasta 1440 minutos, 6000 pasos, demanda ×5 y 200 unidades por recurso. Estos límites no modifican la API científica `simulate`. La suite completa, incluyendo las cuatro pruebas de integración de la interfaz, se ejecuta con `python -m unittest discover -s motor -v` (31 pruebas).

## Mejoras de septiembre de 2026

### Cohortes importadas y acompañante ML

La interfaz permite seleccionar **Origen de pacientes → Reproducir cohorte JSON**, cargar un archivo o usar una demostración ficticia de ocho pacientes. Las llegadas y el trabajo basal alimentan directamente la simulación, las cuatro políticas y la vista 3D. Se conserva un hash de la entrada y su procedencia declarada. Consulta [formato, límites y condiciones de uso](../COHORTES_LOCALES.md); importar una cohorte no equivale a calibrar el hospital.

El módulo NHAMCS entrenado para estancia e ingreso sigue disponible en **Aprendizaje automático**; la espera utiliza una referencia constante seleccionada en validación. Consulta [el informe de entrenamiento](../INFORME_ML.md). La suite ampliada incluye 40 pruebas; las pruebas ML necesitan `requirements-ml.txt`.

La sección **Estado operativo / sincronización** y `GET /api/twin/status`, `POST /api/twin/events` añaden un primer registro persistente de eventos versionados en SQLite. Reglas de eventos, estados, datos admitidos y límites de la integración en [GEMELO_DIGITAL_IMPLEMENTACION.md](../GEMELO_DIGITAL_IMPLEMENTACION.md). Este receptor local aún no establece conexión HIS/EHR, no autentica sus fuentes ni carga ese estado en la simulación.

La pantalla **Gestión operativa** abre `/operations` y administra hospital, áreas, recursos, personal, turnos, episodios, asignaciones y tablero persistente. Tiene navegación lateral, formularios en un panel, búsqueda, paginación y restauración de archivados. En una base local sin registros operativos propios se instala una sola vez un hospital ficticio: 4 áreas, 12 recursos, 9 personas, 9 turnos, 8 episodios sintéticos y 8 asignaciones. Las bases que ya contienen registros o una configuración propia no se rellenan. Su contrato y límites están en [OPERACION_MVP.md](OPERACION_MVP.md). Los registros no inicializan todavía el estado del motor.

Los datos se guardan en `datos/gemelo/gemelo.sqlite3`. Al arrancar, el servidor aplica las migraciones SQL pendientes antes de aceptar solicitudes. También se pueden aplicar o consultar desde la raíz del proyecto con `python -m motor.database`. Si existe una base previa y hay una migración pendiente, se crea primero una copia `gemelo.sqlite3.before-*.bak` en el mismo directorio. La versión aplicada queda registrada en `schema_migrations`; para cambiar el esquema en adelante, añade un archivo nuevo en `motor/migrations/` en lugar de editar uno ya aplicado.
 
### Vista 3D sincronizada

El panel incluye un hospital esquemático con sala de espera, camas generales, UCI y salidas. Pulsa **Reproducir** para recorrer la simulación, selecciona una velocidad (minutos simulados por segundo) o mueve cualquiera de los dos controles temporales. Ambos se sincronizan con el gráfico y los conteos. **Inicio** vuelve al minuto cero; al reproducir desde el final se reinicia el recorrido.

Arrastra la escena para girar la cámara; usa los botones +/− para acercar o alejar y **Restablecer cámara** para recuperar la vista inicial. También admite flechas y +/− con el lienzo enfocado. Al seleccionar una figura se muestran identidad, prioridad, estado y personal asignado cuando está en atención.

La geometría 3D se proyecta sobre Canvas, sin instalaciones ni servicios externos. Representa los estados reales del resultado, no un modelo adicional de desplazamientos físicos. Las camas individuales son asignaciones visuales estables, derivadas de los intervalos de atención; el motor solo modela sus capacidades agregadas. La vista muestra hasta 80 pacientes en espera, 24 camas generales, 12 UCI y las 10 salidas más recientes; las limitaciones se indican en pantalla y los conteos siempre son completos. El panel de indicadores superior conserva las métricas globales de la réplica.

Verificación adicional: `node motor/test_hospital3d.cjs` compara estados y asignaciones visuales con todas las fronteras temporales de cinco escenarios del motor, incluyendo navegación hacia atrás y capacidad cero. Node solo es necesario para esta prueba, no para usar la interfaz.

- Validación de valores finitos, capacidades enteras, pacientes, políticas e instantáneas; las entradas inválidas producen `ValueError`.
- Asignación de recursos con colas de identificadores libres, evitando recalcular todos los recursos por cada paciente en espera.
- Política opcional `aging`: cada `aging_interval` minutos de espera reduce un nivel de prioridad **de ordenamiento**, hasta cero. Desempata por llegada e identificador; mantiene la prioridad original, los recursos requeridos y la reserva. No garantiza un límite máximo de espera.
- Pesos `Config.priority_weights` y penalización `Config.unfinished_penalty` configurables. Sus valores predeterminados siguen siendo `(6, 3, 1)` y `60`.
- Máximo de cola incluye el estado final del horizonte.
- API pública importable y ejecución mediante `python -m motor.experiment` o el script original.
- 27 pruebas, incluidas regresiones exactas de pacientes, métricas y trayectorias de tres casos de la versión anterior.

```python
from motor import Config, Policy, simulate

result = simulate(
    Config(priority_weights=(6, 3, 1), unfinished_penalty=60),
    Policy('aging', aging_interval=60),
    seed=1000,
    trace=True,
)
print(result['metrics'])
```

`aging` es una alternativa experimental explícita; la búsqueda original de nueve candidatos sigue usando `tuned`. Los resultados y hashes existentes en `resultados/` corresponden a la versión histórica: estas mejoras no regeneran los experimentos ni el manuscrito. La regresión comprueba equivalencia en tres casos, no revalida las 1500 ejecuciones del artículo.

Desde la raíz del proyecto:

```powershell
python -m unittest discover -s motor -v
python motor/experiment.py
```

El experimento enumera nueve políticas, las ajusta con semillas 100–119 en cinco escenarios y evalúa con semillas 1000–1029. Las llegadas, prioridades y requerimientos de servicio se generan antes de aplicar la política. La política seleccionada queda guardada en `resultados/politica_ajustada.json`. El ajuste es optimización por simulación, no entrenamiento clínico ni aprendizaje profundo.

`resultados/ajuste.csv` conserva la búsqueda; `evaluacion.csv` contiene 450 réplicas independientes entre semillas y emparejadas entre políticas; `sensibilidad.csv` contiene 150 ejecuciones; `resumen.json` conserva promedios, semianchos de intervalos t del 95 %, diferencias emparejadas, versiones y hashes del código. Los intervalos son nominales, sin corrección por comparaciones múltiples. El tiempo de ejecución depende del equipo y de la carga del sistema.

Supuestos importantes: hospital inicialmente vacío, episodio único de atención, clasificación conocida al llegar, personal homogéneo dentro de cada rol, un médico y una enfermera retenidos por paciente durante todo el episodio, pacientes prioritarios directamente en UCI y sin mortalidad ni deterioro. El receptor `Shadow` es una prueba independiente de instantáneas sintéticas de capacidad y ocupación; no conecta historias clínicas ni reinicia automáticamente el simulador desde un hospital real.

La interpretación del experimento debe incluir el sesgo potencial por estas simplificaciones, el carácter no clínico de los pesos de la función objetivo y la censura de las esperas al horizonte de 480 minutos. No hay garantía de óptimo global ni de superioridad de la política ajustada.
