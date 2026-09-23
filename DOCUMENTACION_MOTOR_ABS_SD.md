# Documentación y especificación del motor híbrido ABS–SD

## Interfaz visual local — 16 de septiembre de 2026

### Acompañamiento 3D

La interfaz incluye una escena tridimensional esquemática (`motor/web/hospital3d.js`) que representa espera, atención general, UCI y salidas. Usa proyección ortográfica sobre Canvas, cámara giratoria, zoom, selección de pacientes, reproducción/pausa y velocidad expresada en minutos simulados por segundo. Los controles temporales de la escena y del gráfico comparten la misma frontera temporal del motor. Los indicadores globales superiores siguen describiendo la réplica completa.

Los estados se reconstruyen a partir de llegada, inicio y fin de cada paciente; no se recalcula la simulación en el navegador. Se asignan posiciones de cama visuales estables durante cada atención, liberándolas antes de reutilizarlas. Estas posiciones no son identificadores de camas del motor ni recorridos físicos modelados. Para conservar legibilidad se dibujan como máximo 80 pacientes en espera, 24 camas generales, 12 UCI y las 10 salidas más recientes; la interfaz declara esos límites cuando aplican y conserva todos los pacientes en sus conteos y tabla. La comprobación `node motor/test_hospital3d.cjs` verifica correspondencia de estados y exclusividad de camas visuales en 1.188 fronteras de cinco escenarios, además de liberación y admisión simultáneas.

El motor cuenta ahora con un panel web local en `motor/web/` y un servidor de biblioteca estándar en `motor/ui.py`. Se inicia con `python -m motor.ui` o con `Abrir interfaz.cmd`. Esta incorporación sustituye la exclusión histórica de interfaz gráfica que aparece en la sección 3.2; el resto del alcance científico se mantiene.

El panel permite editar escenarios, capacidades, parámetros SD, semilla, política y función objetivo; ejecuta el motor Python existente y presenta indicadores, trayectorias temporales, consulta de estados por minuto, ocupación, cobertura por prioridad y pacientes. Compara cuatro políticas sobre una población común generada una sola vez por solicitud. Es una comparación de una réplica, no una estimación estadística de superioridad. Los resultados pueden descargarse como JSON y los pacientes como CSV, sin modificar los artefactos del artículo.

El servidor escucha solo en `127.0.0.1`, no requiere dependencias externas y sirve únicamente los archivos de la interfaz. `POST /api/simulate` acepta `config`, `policy`, `seed` y `compare`; devuelve configuración, política, semilla, resultado y comparaciones. Valida las entradas y limita cada solicitud a 1440 minutos, 6000 pasos, demanda ×5 y 200 unidades por recurso. La API científica conserva sus límites originales. La suite completa contiene 31 pruebas, incluidas cuatro de integración de la interfaz. Instrucciones completas en `motor/README.md`.

## Actualización del motor — 16 de septiembre de 2026

Esta actualización implementa parte de las recomendaciones de la sección 17. Las cifras experimentales, auditorías, hashes y referencias a quince pruebas que aparecen más abajo describen la versión original del artículo; no se han regenerado sus resultados. Para los contratos del código actual prevalecen las precisiones siguientes:

- **Validación:** configuración y tiempos deben contener números finitos, sin booleanos. Capacidades, reserva e identificadores de pacientes son enteros no negativos; prioridades son enteros 0, 1 o 2; ventilación es booleana y solo se admite para P0. Se validan pacientes antes de ordenarlos. `generate` también valida la configuración. Los errores de estos contratos producen `ValueError`.
- **Políticas:** se admiten únicamente `fifo`, `priority`, `tuned` y `aging`. Los nombres desconocidos se rechazan. `aging_interval` es finito y positivo (60 minutos por defecto).
- **Envejecimiento opcional:** `aging` ordena por `max(0, priority - floor((t-arrival)/aging_interval))`, llegada e identificador. No modifica la prioridad almacenada ni la cama requerida. No interrumpe atenciones y sigue respetando las reservas. Puede adelantar P2 frente a P0 recién llegados; se debe comparar su efecto sobre todas las clases. No garantiza una espera máxima y no se incorpora automáticamente a los nueve candidatos históricos.
- **Objetivo configurable:** `Config.priority_weights` es una tupla de tres pesos positivos finitos (por defecto `(6, 3, 1)`). `Config.unfinished_penalty` es finita y no negativa (por defecto 60). Los pesos se aplican tanto al objetivo como al área ponderada de cola.
- **Asignación:** se calculan los identificadores libres y la ocupación una vez por frontera de asignación, actualizándolos por admisión. Se conserva la elección del menor identificador y el examen de pacientes compatibles cuando otro está bloqueado.
- **Horizonte:** `max_queue` incluye la cola terminal, incluso si un paciente solo se incorpora en la última frontera. Se mantiene la prohibición de iniciar atención en el horizonte.
- **Instantáneas:** `Shadow` exige un diccionario con `id` textual no vacío y `version` entera no negativa. Las nuevas instantáneas requieren mapas de capacidad y ocupación con claves textuales idénticas y conteos enteros no negativos, sin booleanos. Identificadores ya aceptados y versiones antiguas se descartan antes de validar el contenido del estado, como en la versión original. Un rechazo no modifica el estado aceptado.
- **API:** `from motor import Config, Policy, Patient, Shadow, generate, simulate`. El experimento admite `python -m motor.experiment`; importar su módulo no crea carpetas de resultados. No se ha añadido distribución instalable mediante pip.
- **Verificación:** la suite actual tiene 27 pruebas. Incluye entradas no finitas, envejecimiento, objetivo configurable, atomicidad de instantáneas, horizonte fraccionario y regresión exacta de tres casos históricos (FIFO, prioridad y reserva con demanda doble), excluyendo solo `runtime_s`.

Ejecución: `python -m unittest discover -s motor -v`. Los detalles de uso actualizados están en `motor/README.md`.

## 1. Propósito del documento

Este documento describe los requerimientos, el funcionamiento, las decisiones de diseño, las interfaces, las pruebas y la relación con el artículo **“Digital Twin-Driven Real-Time Optimization of Hospital Resource Allocation During Mass Casualty Events: A Hybrid Agent-Based and System Dynamics Model”**.

La documentación corresponde al código ejecutable ubicado en `motor/`. Su alcance es el núcleo experimental del modelo: generación sintética de pacientes, simulación híbrida ABS–SD, comparación de políticas, cálculo de métricas, recepción básica de instantáneas y reproducción de los experimentos del artículo.

El motor es una **prueba de concepto de investigación**. No es un dispositivo médico, un sistema clínico, un optimizador certificado ni un Digital Twin conectado a un hospital. No utiliza historias clínicas reales y sus parámetros no han sido calibrados con datos de una institución. Esta delimitación coincide con el artículo, que presenta los resultados como experimentación computacional sintética y no como validación clínica.

## 2. Resumen del motor

El motor simula la respuesta de un servicio hospitalario ante un evento de víctimas masivas, o MCE. Cada paciente llega en un instante determinado, posee una prioridad, requiere una cantidad de trabajo asistencial y compite por personal, camas y, en algunos casos, ventiladores.

El modelo combina dos perspectivas:

- **Agent-Based Simulation (ABS):** representa cada paciente de forma individual, conserva su identidad y administra sus transiciones entre espera, atención y finalización. También asigna médicos y personal de enfermería identificables.
- **System Dynamics (SD):** conserva los stocks agregados de pacientes y un índice dinámico de carga de trabajo. Este índice modifica la velocidad de atención y produce una retroalimentación entre ocupación y duración del servicio.

En términos operativos, el motor hace lo siguiente:

1. Recibe una configuración, una política y una semilla pseudoaleatoria.
2. Genera llegadas sintéticas o recibe una lista explícita de pacientes.
3. Avanza un reloj de simulación con paso configurable.
4. Finaliza episodios cuyo trabajo pendiente se agotó.
5. Incorpora las nuevas llegadas a la cola.
6. Ordena la cola según la política elegida.
7. Asigna los recursos requeridos cuando existe un conjunto factible.
8. Actualiza los stocks agregados y verifica sus invariantes.
9. Calcula la ocupación y la carga de trabajo.
10. Reduce el trabajo restante de los pacientes en atención.
11. Calcula métricas individuales y agregadas al terminar el horizonte.

El motor también ejecuta una búsqueda finita de políticas, compara escenarios, realiza un análisis de sensibilidad y exporta resultados reproducibles en CSV y JSON.

## 3. Alcance implementado

### 3.1. Funciones incluidas

La implementación actual incluye:

- generación de llegadas mediante procesos de Poisson por tramos;
- tres clases de prioridad experimentales: P0, P1 y P2;
- tiempos de servicio triangulares dependientes de la prioridad;
- pacientes con identidad y trayectoria individual;
- médicos y personal de enfermería con asignación exclusiva;
- camas generales, camas UCI y ventiladores con capacidad limitada;
- política FIFO;
- política de prioridad estricta;
- política de prioridad con reserva temporal de personal;
- stocks de pacientes en espera, atención y finalizados;
- retroalimentación SD de carga de trabajo sobre la velocidad de servicio;
- función objetivo ponderada por prioridad;
- búsqueda exhaustiva sobre nueve políticas candidatas;
- cinco escenarios experimentales;
- separación entre semillas de ajuste y evaluación;
- análisis de sensibilidad del paso temporal, la retroalimentación y el tiempo de servicio;
- intervalos de confianza Monte Carlo nominales;
- exportación de métricas, trayectorias, pacientes y metadatos;
- receptor básico de instantáneas versionadas para probar sincronización;
- quince pruebas automáticas y verificaciones internas durante la ejecución.

### 3.2. Funciones fuera del alcance actual

La implementación no incluye:

- conexión con EHR, HIS, IoT u otra fuente hospitalaria real;
- interoperabilidad mediante HL7 o FHIR;
- autenticación, autorización, cifrado o auditoría clínica;
- base de datos persistente;
- reconciliación de pacientes reales entre instantáneas;
- reinicio del simulador desde un estado hospitalario recibido;
- interfaz gráfica, panel de control o aplicación web;
- ejecución automática de recomendaciones en el entorno físico;
- triaje clínico completo;
- deterioro, cambio de prioridad, mortalidad o abandono;
- diagnóstico, cirugía, laboratorio, radiología o traslados entre áreas;
- turnos, descansos, especialidades o competencias diferenciadas del personal;
- calibración, validación externa o evaluación prospectiva;
- optimización matemática global;
- aprendizaje automático, aprendizaje profundo o aprendizaje por refuerzo.

Estas exclusiones son deliberadas. El objetivo actual es contar con un motor pequeño, reproducible y verificable que sustente la metodología del artículo. El software de operación hospitalaria se desarrollará posteriormente.

## 4. Requerimientos del motor

### 4.1. Requerimientos funcionales

| ID | Requerimiento | Criterio de aceptación | Estado |
|---|---|---|---|
| RF-01 | El motor debe admitir una configuración explícita del horizonte, paso temporal, demanda, capacidades y parámetros SD. | Una instancia de `Config` controla esos valores. | Implementado |
| RF-02 | Debe generar llegadas reproducibles a partir de una semilla. | Dos ejecuciones con la misma configuración y semilla producen los mismos pacientes y resultados, excepto el tiempo de cómputo. | Implementado |
| RF-03 | Debe aceptar pacientes suministrados por el usuario para pruebas deterministas. | `simulate(..., patients=[...])` omite el generador sintético y copia la lista recibida. | Implementado |
| RF-04 | Debe representar por separado pacientes P0, P1 y P2. | Cada paciente tiene `priority` igual a 0, 1 o 2. | Implementado |
| RF-05 | Debe asignar como máximo un paciente simultáneo a cada médico y a cada persona de enfermería. | Las asignaciones activas tienen identificadores únicos por rol. | Implementado y verificado en ejecución |
| RF-06 | Debe respetar la capacidad de camas generales, UCI y ventiladores. | Toda ocupación permanece entre cero y su capacidad. | Implementado y verificado en ejecución |
| RF-07 | Un paciente P0 debe requerir UCI; si necesita ventilación, también debe existir un ventilador libre. | La factibilidad se comprueba antes del inicio de atención. | Implementado |
| RF-08 | Un paciente P1 o P2 debe requerir una cama general. | La atención solo inicia si existe capacidad general libre. | Implementado |
| RF-09 | Todos los pacientes atendidos deben recibir simultáneamente un médico y una persona de enfermería. | Si cualquiera de los dos roles no tiene disponibilidad, el episodio no comienza. | Implementado |
| RF-10 | El motor debe implementar FIFO y prioridad estricta. | FIFO ordena por llegada e identificador; prioridad ordena por clase, llegada e identificador. | Implementado |
| RF-11 | Debe permitir reservar temporalmente pares de personal para P0. | `reserve` y `release` condicionan el inicio de P1–P2 antes del tiempo de liberación. | Implementado |
| RF-12 | La asignación no debe interrumpir episodios ya iniciados. | No existe transición de atención a espera ni reasignación expropiativa. | Implementado |
| RF-13 | El motor debe mantener stocks agregados coherentes con los agentes. | `Q + A + D = N` en cada frontera temporal. | Implementado y verificado mediante aserciones |
| RF-14 | Debe existir retroalimentación entre la utilización y el ritmo de servicio. | El índice `fatigue` modifica `speed = 1 - beta * fatigue`. | Implementado |
| RF-15 | Debe calcular métricas de espera, cobertura, finalización, ocupación, saturación y tiempo de cómputo. | El resultado contiene el diccionario `metrics`. | Implementado |
| RF-16 | Debe penalizar la demanda pendiente al final del horizonte. | La función objetivo incorpora espera censurada y una penalización para episodios no finalizados. | Implementado |
| RF-17 | Debe ajustar una política sin utilizar las semillas de evaluación. | Las semillas 100–119 se usan para ajuste y 1000–1029 para evaluación. | Implementado y auditado |
| RF-18 | Debe evaluar escenarios de demanda y capacidad. | Se ejecutan cinco configuraciones predefinidas. | Implementado |
| RF-19 | Debe exportar los resultados de cada réplica y sus resúmenes. | Se generan archivos CSV y JSON en `resultados/`. | Implementado |
| RF-20 | Debe recibir instantáneas sintéticas versionadas, rechazar estados inconsistentes y detectar mensajes repetidos o antiguos. | La clase `Shadow` retorna `accepted`, `duplicate` o `stale`, o lanza `ValueError`. | Implementado como prototipo aislado |

### 4.2. Requerimientos de entrada y validación

La configuración debe satisfacer:

- `horizon > 0`;
- `dt > 0`;
- `tau >= dt`;
- `0 <= beta < 1`;
- `demand >= 0`;
- `service_scale > 0`;
- las capacidades deben ser números enteros no negativos;
- `reserve >= 0`;
- `release >= 0`.

Cada paciente suministrado debe satisfacer:

- identificador único;
- `0 <= arrival < horizon`;
- `service > 0`;
- prioridad perteneciente a `{0, 1, 2}`.

El receptor de instantáneas requiere un objeto equivalente a:

```python
{
    "id": "identificador-unico-del-evento",
    "version": 12,
    "state": {
        "capacity": {"beds": 12, "icu": 4},
        "occupancy": {"beds": 8, "icu": 3}
    }
}
```

Para aceptar la instantánea:

- `capacity` y `occupancy` deben contener exactamente las mismas claves;
- todos sus valores deben ser enteros no negativos;
- ninguna ocupación puede superar su capacidad;
- la versión debe ser mayor que la última versión aceptada;
- el identificador no debe haber sido aceptado anteriormente.

### 4.3. Requerimientos no funcionales

| ID | Requerimiento | Solución adoptada |
|---|---|---|
| RNF-01 | Reproducibilidad | Generador `random.Random(seed)`, semillas guardadas y exportación de configuración. |
| RNF-02 | Portabilidad | Python 3.10 o posterior y únicamente biblioteca estándar. |
| RNF-03 | Trazabilidad | CSV por réplica, JSON de política, resumen, hashes del código y manifiesto final. |
| RNF-04 | Verificabilidad | Pruebas unitarias y aserciones de invariantes en cada paso. |
| RNF-05 | Separación ajuste/evaluación | Conjuntos de semillas disjuntos. |
| RNF-06 | Comparación justa de políticas | Las mismas semillas producen las mismas llegadas y atributos para las políticas comparadas. |
| RNF-07 | Interpretación prudente | Métricas censuradas, cobertura por prioridad y límites explícitos. |
| RNF-08 | Rendimiento suficiente para experimentación | Una réplica de evaluación tardó en promedio 0,33 segundos en el equipo de prueba. |
| RNF-09 | Ausencia de datos sensibles | El motor utiliza únicamente datos sintéticos. |
| RNF-10 | Extensibilidad básica | Configuración, política, paciente, simulación y sincronización están separados en estructuras y funciones distintas. |

El tiempo registrado es una medición experimental local, no un requisito garantizado de tiempo real. Una futura integración deberá definir un presupuesto de latencia extremo a extremo que incluya captura, transporte, validación, simulación y revisión humana.

## 5. Arquitectura del código

### 5.1. Estructura de archivos

```text
motor/
├── model.py             # Entidades, generación, simulación y receptor Shadow
├── experiment.py        # Ajuste, evaluación, sensibilidad y exportación
├── test_model.py        # Quince pruebas automáticas
├── finish_article.py    # Auditoría de resultados e inserción en el manuscrito
└── README.md            # Instrucciones breves de ejecución

resultados/
├── ajuste.csv
├── evaluacion.csv
├── sensibilidad.csv
├── politica_ajustada.json
├── resumen.json
├── trayectoria_ejemplo.csv
├── pacientes_ejemplo.csv
├── pruebas.txt
├── auditoria_final.json
└── manifest_final.json
```

### 5.2. Componentes principales

#### `Config`

Objeto inmutable que contiene los parámetros generales:

| Campo | Significado | Valor de referencia |
|---|---|---:|
| `horizon` | Duración simulada | 480 min |
| `dt` | Paso de integración y decisión | 1 min |
| `demand` | Multiplicador de las tasas de llegada | 1,0 |
| `doctors` | Médicos disponibles | 8 |
| `nurses` | Personal de enfermería disponible | 12 |
| `beds` | Camas generales | 12 |
| `icu` | Camas UCI | 4 |
| `ventilators` | Ventiladores | 3 |
| `beta` | Intensidad de la retroalimentación | 0,25 |
| `tau` | Constante de ajuste de la carga | 60 min |
| `service_scale` | Multiplicador del trabajo asistencial | 1,0 |

#### `Policy`

Describe la regla de asignación:

- `name="fifo"`: orden por llegada e identificador;
- cualquier otro nombre, incluidos `priority` y `tuned`: orden por prioridad, llegada e identificador;
- `reserve`: cantidad de pares médico–enfermería reservados;
- `release`: minuto en que termina la reserva.

La aceptación de cualquier nombre distinto de `fifo` como prioridad es una simplificación de la implementación actual. Una versión de producción debería validar un conjunto cerrado de nombres para evitar errores de configuración silenciosos.

#### `Patient`

Representa a un paciente individual mediante:

- `id`: identificador interno;
- `arrival`: instante de llegada;
- `priority`: 0, 1 o 2;
- `service`: trabajo asistencial basal;
- `ventilation`: necesidad de ventilador;
- `remaining`: trabajo pendiente;
- `start`: instante de inicio o `None`;
- `finish`: instante de finalización o `None`;
- `doctor`: identificador del médico asignado;
- `nurse`: identificador del personal de enfermería asignado.

#### `generate(config, seed)`

Crea los pacientes sintéticos. Usa un proceso de Poisson no homogéneo aproximado por tres tramos constantes:

| Intervalo | Tasa base |
|---|---:|
| 0–120 min | 0,8 pacientes/min |
| 120–240 min | 0,3 pacientes/min |
| 240–480 min | 0,1 pacientes/min |

La tasa efectiva es la tasa base multiplicada por `demand`. En la referencia, la demanda esperada es:

```text
0,8 × 120 + 0,3 × 120 + 0,1 × 240 = 156 pacientes
```

La prioridad se genera con probabilidades 0,20 para P0, 0,35 para P1 y 0,45 para P2. El trabajo asistencial usa distribuciones triangulares:

- P0: mínimo 30, moda 60 y máximo 90 minutos;
- P1: mínimo 15, moda 30 y máximo 45 minutos;
- P2: mínimo 5, moda 15 y máximo 25 minutos.

Los pacientes P0 requieren ventilación con probabilidad 0,50. El valor generado y la necesidad de ventilación quedan fijados antes de aplicar cualquier política, lo cual evita que una política sea evaluada con pacientes diferentes.

#### `simulate(config, policy, seed, patients, trace)`

Es la función principal. Devuelve:

```python
{
    "metrics": {...},
    "patients": [...],
    "trace": [...]
}
```

Si `patients` es `None`, genera la demanda desde la semilla. Si se proporciona una lista, crea una copia limpia de cada paciente y reinicia su estado, permitiendo casos deterministas.

#### `Shadow`

Conserva la última instantánea sintética aceptada:

- `version`: última versión;
- `state`: copia independiente del estado;
- `seen`: identificadores ya aceptados.

La clase demuestra validación, idempotencia básica, rechazo de versiones antiguas y actualización atómica. No alimenta actualmente a `simulate`; esta separación evita afirmar una sincronización operativa que todavía no existe.

## 6. Funcionamiento detallado de una simulación

### 6.1. Preparación

Antes de iniciar el reloj, el motor:

1. valida la configuración y la política;
2. genera o copia los pacientes;
3. ordena los pacientes por llegada e identificador;
4. valida identidad, llegada, prioridad y trabajo;
5. crea las colecciones `waiting`, `active` y `finished`;
6. inicializa los stocks `[Q, A, D]` en cero;
7. inicializa la carga agregada `fatigue` en cero;
8. prepara acumuladores de ocupación y métricas.

### 6.2. Orden de eventos por paso

En cada instante `t`, el motor ejecuta este orden:

1. **Finalizaciones:** mueve a `finished` a los pacientes activos cuyo trabajo restante es menor o igual a cero.
2. **Llegadas:** incorpora a `waiting` todas las llegadas con tiempo menor o igual a `t`.
3. **Ordenamiento:** organiza la cola según FIFO o prioridad.
4. **Asignación:** examina los pacientes en ese orden e inicia todos los episodios factibles.
5. **Balances:** actualiza Q, A y D mediante los conteos de llegadas, inicios y finalizaciones.
6. **Verificación:** comprueba conservación y límites de capacidad.
7. **Registro opcional:** si `trace=True`, guarda el estado del instante.
8. **Integración:** acumula áreas de ocupación, calcula velocidad y reduce el trabajo pendiente.
9. **Actualización SD:** actualiza el índice de carga para el siguiente intervalo.

En `t = horizon` se registran las finalizaciones y llegadas correspondientes, pero no se inician nuevos episodios. Esta decisión impide comenzar una atención fuera de la ventana experimental.

### 6.3. Regla de factibilidad

Un paciente solo inicia si tiene simultáneamente:

- un médico libre;
- una persona de enfermería libre;
- una cama compatible;
- un ventilador libre si lo requiere;
- personal no bloqueado por una reserva activa.

Para P0 se comprueba UCI y, si corresponde, ventilador. Para P1 y P2 se comprueba cama general. El motor continúa examinando la lista cuando un paciente no es factible. De esta manera, la falta de un recurso específico para el primer paciente no impide utilizar otros recursos con un paciente compatible.

La política es no expropiativa. Una vez iniciada la atención, el paciente conserva sus recursos hasta finalizar el trabajo. Esta regla facilita la conservación y evita cambios clínicos implícitos no definidos por el artículo.

### 6.4. Componente SD

Los stocks son:

```text
Q(t): pacientes en espera
A(t): pacientes en atención
D(t): episodios finalizados
```

Los flujos son:

```text
dQ/dt = llegadas − inicios
dA/dt = inicios − finalizaciones
dD/dt = finalizaciones
```

La conservación exigida es:

```text
Q(t) + A(t) + D(t) = N(t)
```

donde `N(t)` es el número de pacientes que ya ingresaron al reloj. Esta igualdad se comprueba en cada paso contra un recuento independiente de las listas de agentes.

La utilización del personal es:

```text
u(t) = A(t) / min(médicos, enfermería)
```

Si alguna de las dos capacidades es cero, `u(t)` se define como cero porque no puede iniciarse atención.

La carga agregada `F(t)`, denominada `fatigue` en el código, evoluciona como:

```text
dF/dt = [u(t) − F(t)] / tau
```

La integración usa Euler explícito:

```text
F(t + dt) = F(t) + (dt / tau) [u(t) − F(t)]
```

El ritmo de trabajo es:

```text
v(t) = 1 − beta × F(t)
```

y el trabajo restante del paciente disminuye según:

```text
remaining(t + dt) = remaining(t) − v(t) × dt
```

Con `beta = 0,25`, la velocidad permanece entre 0,75 y 1 mientras se cumplan las condiciones del modelo. `F` es un índice matemático hipotético de carga sostenida. No mide fatiga humana ni permite inferir seguridad del personal.

## 7. Políticas y optimización por simulación

### 7.1. FIFO

Ordena por:

```text
(arrival, id)
```

Su propósito es proporcionar una referencia neutral respecto de la prioridad experimental.

### 7.2. Prioridad estricta

Ordena por:

```text
(priority, arrival, id)
```

Como P0 se representa con 0, aparece antes que P1 y P2. Dentro de cada prioridad se conserva el orden de llegada.

### 7.3. Prioridad con reserva temporal

Añade dos parámetros:

- `reserve`: pares de personal que deben permanecer libres para P0;
- `release`: tiempo hasta el cual se mantiene la reserva.

La reserva se aplica a nuevos inicios de P1–P2 antes de `release`, mientras exista capacidad UCI libre. No reserva camas UCI ni ventiladores y no interrumpe pacientes ya atendidos.

### 7.4. Espacio de búsqueda

El experimento evalúa nueve candidatas:

```text
(reserve=0, release=0)
(reserve=1, release=30)
(reserve=1, release=60)
(reserve=1, release=120)
(reserve=1, release=240)
(reserve=2, release=30)
(reserve=2, release=60)
(reserve=2, release=120)
(reserve=2, release=240)
```

La mejor candidata es la que obtiene el menor promedio de la función objetivo en cinco escenarios y veinte semillas de ajuste por escenario. El desempate favorece menor reserva y menor tiempo de liberación.

Este procedimiento se denomina optimización por simulación o búsqueda exhaustiva finita. No “entrena” un modelo predictivo. Solo selecciona la mejor configuración observada dentro del conjunto definido.

### 7.5. Función objetivo

Para cada paciente se calcula la espera censurada:

```text
Wᵢᴴ = min(inicioᵢ, H) − llegadaᵢ
```

Si no inició atención, se usa `H − llegada`. La pérdida es:

```text
J = Σ wᵢ [Wᵢᴴ + 60 × I(no finalizado al cierre)] / Σ wᵢ
```

Los pesos son:

- P0: 6;
- P1: 3;
- P2: 1.

La penalización de 60 minutos se aplica a cualquier paciente no finalizado, incluidos quienes están en atención y quienes siguen en cola.

Estos pesos no son una escala clínica validada. Son preferencias experimentales para hacer explícita la prioridad. El artículo reconoce que una menor `J` puede coexistir con peor cobertura de P2, mayor espera global y menos episodios finalizados.

## 8. Escenarios experimentales

| Escenario | Modificación | Propósito |
|---|---|---|
| Referencia | Configuración base | Establecer el comportamiento principal |
| Demanda al 150 % | `demand=1.5` | Evaluar mayor presión asistencial |
| Demanda al 200 % | `demand=2` | Evaluar sobrecarga intensa |
| Personal reducido | 6 médicos y 9 personas de enfermería | Examinar escasez de personal |
| Recursos críticos reducidos | 2 camas UCI y 1 ventilador | Examinar restricciones para P0 |

El resto de los parámetros permanece constante en cada modificación. Esto permite atribuir la diferencia al factor alterado, dentro de los límites de un experimento de sensibilidad unifactorial.

Las semillas se dividen así:

- ajuste: 100–119;
- evaluación: 1000–1029.

El experimento ejecuta:

- 900 simulaciones de ajuste: 9 políticas × 5 escenarios × 20 semillas;
- 450 simulaciones de evaluación: 3 políticas × 5 escenarios × 30 semillas;
- 150 simulaciones de sensibilidad: 5 variantes × 30 semillas.

Total: **1500 simulaciones**, además de las pruebas automáticas y una trayectoria ilustrativa.

## 9. Métricas producidas

| Campo | Descripción |
|---|---|
| `arrivals` | Número total de pacientes generados o suministrados |
| `started` | Pacientes que iniciaron atención antes del horizonte |
| `completed` | Episodios finalizados antes o en el horizonte |
| `waiting` | Pacientes aún en cola al cierre |
| `in_service` | Pacientes en atención al cierre |
| `wait_started` | Espera promedio solo entre quienes iniciaron |
| `wait_censored` | Espera promedio censurada de todas las llegadas |
| `objective` | Pérdida ponderada utilizada para seleccionar política |
| `max_queue` | Máximo número de pacientes esperando durante la simulación |
| `icu_saturation` | Fracción del horizonte con ocupación UCI igual a su capacidad |
| `fatigue_mean` | Promedio temporal del índice agregado de carga |
| `weighted_queue_area` | Área temporal de la cola con pesos 6/3/1 |
| `runtime_s` | Tiempo de ejecución local de la réplica |
| `wait_p0`, `wait_p1`, `wait_p2` | Espera censurada promedio por prioridad |
| `coverage_p0`, `coverage_p1`, `coverage_p2` | Proporción de cada prioridad que inició atención |
| `util_beds` | Utilización media de camas generales |
| `util_icu` | Ocupación media de UCI |
| `util_ventilators` | Utilización media de ventiladores |
| `util_doctors` | Utilización media de médicos |
| `util_nurses` | Utilización media de enfermería |

`wait_started` nunca debe interpretarse de forma aislada. Una política puede reducir esta métrica atendiendo a menos personas. Por eso el artículo presenta también `wait_censored`, cobertura, cola final y episodios finalizados.

Si no existen pacientes en un grupo, su espera y cobertura se devuelven como `None`. Si un recurso tiene capacidad cero, su utilización también se devuelve como `None` para evitar una división artificial por cero.

## 10. Archivos de salida

### `ajuste.csv`

Contiene las nueve candidatas con:

- nombre;
- reserva;
- liberación;
- pérdida promedio en ajuste.

### `politica_ajustada.json`

Conserva:

- política seleccionada;
- semillas de ajuste;
- semillas de evaluación;
- definición textual de la función objetivo;
- configuración base;
- configuración de los cinco escenarios.

### `evaluacion.csv`

Contiene 450 filas, una por combinación de escenario, política y semilla. Incluye todas las métricas de la réplica. Las políticas se comparan de forma emparejada porque comparten la misma semilla dentro del escenario.

### `sensibilidad.csv`

Contiene 150 ejecuciones para:

- `dt=0.5`;
- `dt=0.25`;
- `beta=0`;
- `service_scale=0.8`;
- `service_scale=1.2`.

### `resumen.json`

Contiene:

- medias y semianchos de intervalos del 95 %;
- diferencias emparejadas;
- resumen de sensibilidad;
- tiempo total;
- versión de Python y plataforma;
- cantidad de ejecuciones;
- hashes SHA-256 de los archivos Python existentes al ejecutar el experimento.

### `trayectoria_ejemplo.csv`

Contiene una fila por frontera temporal de la réplica de referencia con semilla 1000. Incluye cola, pacientes activos, finalizados, carga y ocupaciones.

### `pacientes_ejemplo.csv`

Contiene el estado final de cada paciente de la misma réplica: llegada, prioridad, trabajo, ventilación, trabajo restante, inicio, finalización y personal asignado.

### Archivos de verificación

- `pruebas.txt`: salida de las quince pruebas automáticas;
- `auditoria_final.json`: verificaciones de conservación, límites, semillas y correspondencia con el manuscrito;
- `manifest_final.json`: hashes de los principales artefactos finales.

## 11. Pruebas y criterios de aceptación

La suite usa `unittest` y contiene quince pruebas:

| Prueba | Propósito |
|---|---|
| `test_empty` | Verificar una simulación sin demanda |
| `test_zero_staff` | Verificar que sin médicos nadie inicia atención |
| `test_zero_beds` | Verificar que sin camas no se inicia atención |
| `test_analytic_single` | Comparar un caso simple con solución temporal exacta |
| `test_priority` | Confirmar que P0 precede a P2 bajo prioridad |
| `test_no_ventilator` | Impedir el inicio de un P0 ventilado sin ventilador |
| `test_reproducible` | Repetir exactamente pacientes y métricas con la misma semilla |
| `test_high_load_conservation` | Conservar pacientes bajo demanda extrema |
| `test_feedback` | Confirmar que mayor retroalimentación prolonga el episodio |
| `test_invalid_parameters` | Rechazar configuraciones numéricas inválidas |
| `test_horizon_censoring` | Calcular correctamente la espera censurada |
| `test_reservation_release` | Mantener y liberar una reserva temporal |
| `test_sync_duplicate_and_stale` | Detectar duplicados y versiones antiguas |
| `test_sync_atomic_rejection` | No modificar el estado si una instantánea es inválida |
| `test_sync_copy` | Evitar mutaciones externas del estado almacenado |

Las quince pruebas pasaron. Además, dentro de cada paso de cada simulación se comprueba:

```text
stocks == [len(waiting), len(active), len(finished)]
sum(stocks) == llegadas incorporadas
0 <= ocupación <= capacidad
un médico activo por paciente como máximo
una persona de enfermería activa por paciente como máximo
0 <= índice de carga <= 1
```

Estas comprobaciones respaldan la verificación del programa. No reemplazan una validación con datos clínicos.

## 12. Instalación y ejecución

### 12.1. Requisitos técnicos

- Python 3.10 o posterior;
- sistema operativo capaz de ejecutar Python;
- no requiere paquetes externos para el motor ni para sus pruebas;
- permisos de escritura en la carpeta `resultados/` para ejecutar el experimento.

### 12.2. Ejecutar pruebas

Desde la raíz del proyecto:

```powershell
python -m unittest discover -s motor -v
```

Resultado esperado:

```text
Ran 15 tests
OK
```

### 12.3. Ejecutar el experimento completo

```powershell
python motor/experiment.py
```

La ejecución sobrescribe los archivos experimentales con resultados nuevos producidos por el mismo código y las mismas semillas. El tiempo observado originalmente fue de aproximadamente 502 segundos para ajuste, evaluación, sensibilidad y exportación en un AMD Ryzen 7 7840U con Python 3.12.14 sobre Windows.

### 12.4. Ejemplo mínimo de uso

```python
from motor.model import Config, Policy, simulate

config = Config(
    horizon=480,
    doctors=8,
    nurses=12,
    beds=12,
    icu=4,
    ventilators=3,
)

policy = Policy(name="priority")
result = simulate(config, policy, seed=1000, trace=True)

print(result["metrics"])
print(result["patients"][0])
print(result["trace"][0])
```

Cuando se ejecuta desde fuera de la raíz o como paquete, puede ser necesario ajustar `PYTHONPATH`, porque el proyecto actual es un conjunto de scripts y no un paquete instalable formal.

## 13. Correspondencia con el artículo

### 13.1. Matriz de trazabilidad

| Sección del artículo | Afirmación metodológica | Implementación correspondiente | Evidencia |
|---|---|---|---|
| 3.1 Diseño | Enfoque cuantitativo y experimento de simulación híbrida | `simulate` y `experiment.py` | 1500 ejecuciones y resultados exportados |
| 3.2 Escenario MCE | Demanda por tramos, prioridades y capacidades | `generate` y `Config` | Parámetros iguales a la Tabla 1 |
| 3.3 Arquitectura | Physical Twin, sincronización y Digital Twin | entradas sintéticas, `Shadow` y motor | El artículo declara que la conexión real es futura |
| 3.4 ABS | Pacientes individuales, personal y recursos | `Patient`, colas y asignaciones | Trayectorias en `patients` y `trace` |
| 3.5 SD | Stocks, flujos y carga agregada | `stocks`, `fatigue`, `speed` | Aserciones y prueba de retroalimentación |
| 3.6 Integración | Intercambio bidireccional ABS–SD | utilización ABS → carga SD; velocidad SD → pacientes ABS | Ejecutado en cada paso del reloj |
| 3.7 Sincronización | Estados versionados y consistentes | clase `Shadow` | Pruebas de aceptación, duplicado, obsolescencia y atomicidad |
| 3.8 Optimización | Comparación de políticas bajo restricciones | candidatos, función objetivo y búsqueda exhaustiva | `ajuste.csv` y `politica_ajustada.json` |
| 3.9 Escenarios | Referencia y cambios de demanda o capacidad | `SCENARIOS` | 5 escenarios, 900 + 450 ejecuciones |
| 3.10 Validación | Verificación, réplicas y sensibilidad | pruebas, aserciones, evaluación y variantes | 15 pruebas y 150 ejecuciones de sensibilidad |
| 3.11 Métricas | Espera, cobertura, ocupación y cómputo | diccionario `metrics` | `evaluacion.csv` y `resumen.json` |

### 13.2. Por qué se utilizó ABS

El artículo necesita distinguir pacientes por prioridad, llegada, trabajo requerido y necesidad de ventilación. También necesita conservar qué recursos recibe cada persona y en qué momento. Un modelo exclusivamente agregado perdería estas diferencias y dificultaría representar las reglas de prioridad y factibilidad.

ABS permite:

- conservar heterogeneidad individual;
- registrar esperas por paciente;
- imponer requerimientos específicos;
- mantener asignaciones exclusivas;
- ordenar la cola mediante diferentes políticas;
- calcular cobertura por clase;
- reutilizar exactamente la misma población al comparar alternativas.

Por ello, ABS coincide con las secciones 3.4 y 3.6 del artículo.

### 13.3. Por qué se utilizó SD

El artículo también necesita explicar el comportamiento agregado: acumulación de colas, ocupación, finalizaciones y retroalimentación entre carga y servicio. SD ofrece una formulación explícita mediante stocks, flujos y una relación causal dinámica.

El índice `F(t)` evita que la capacidad de procesamiento permanezca artificialmente constante durante una utilización prolongada. Se eligió una ecuación de primer orden porque:

- es interpretable;
- conserva memoria temporal;
- requiere pocos parámetros;
- puede desactivarse con `beta=0`;
- puede someterse a sensibilidad;
- no pretende simular fisiología ni conducta clínica no observada.

Por ello, SD coincide con las secciones 3.5 y 3.6.

### 13.4. Por qué el acoplamiento usa un reloj común

Un reloj común permite que los estados individuales y agregados se actualicen en fronteras temporales conocidas. Esta decisión facilita:

- verificar conservación;
- interpretar el intercambio ABS–SD;
- repetir exactamente un experimento;
- cambiar `dt` para estudiar sensibilidad numérica;
- evitar dos calendarios independientes con eventos contradictorios.

El diseño coincide con el intercambio indicado en la Tabla 4 del artículo: ABS entrega flujos y ocupación; SD devuelve el ritmo de atención.

### 13.5. Por qué se usaron entradas sintéticas

El documento de partida no contenía un conjunto de datos hospitalario ni parámetros calibrados. Inventar valores y presentarlos como observaciones reales habría invalidado la trazabilidad científica. Se optó por declarar los valores como supuestos experimentales y construir una prueba de concepto reproducible.

Esta decisión permite terminar y probar el núcleo metodológico sin afirmar:

- representatividad de un hospital específico;
- precisión predictiva;
- beneficio clínico;
- sincronización en tiempo real;
- validez de los pesos de prioridad.

La delimitación aparece en las secciones 3.1, 3.2, 3.7 y 3.10 del artículo.

### 13.6. Por qué se separaron ajuste y evaluación

Usar las mismas realizaciones para escoger y evaluar la política produciría una estimación optimista. Por eso las semillas de evaluación no participan en el ajuste. La separación reduce el sesgo de selección dentro del universo sintético definido.

No obstante, las semillas nuevas provienen de los mismos generadores y escenarios. La evaluación mide generalización a nuevas realizaciones aleatorias, no a hospitales distintos ni a mecanismos de demanda desconocidos.

### 13.7. Por qué se usaron números aleatorios comunes

Dentro de cada escenario, las políticas se ejecutan con las mismas semillas. Así, una diferencia entre políticas no proviene de haber recibido por azar poblaciones distintas. Este emparejamiento reduce el ruido de la comparación y permite calcular diferencias por semilla.

### 13.8. Por qué se usa espera censurada

El horizonte termina mientras algunos pacientes continúan esperando. Excluirlos reduciría artificialmente la espera de políticas que atienden a pocas personas. Por eso se utiliza `H − llegada` para quienes no iniciaron.

Esta medida sigue siendo un límite inferior de su espera final, porque no simula cuánto esperarían después de `H`. El artículo la presenta junto con la cobertura y el número pendiente para evitar una interpretación incompleta.

### 13.9. Por qué la sincronización está separada

La clase `Shadow` prueba propiedades mínimas necesarias para una futura capa de sincronización: orden de versiones, idempotencia, consistencia de capacidad y atomicidad. Mantenerla separada de `simulate` hace visible que todavía falta convertir un estado físico completo en agentes y eventos del modelo.

Esta decisión coincide con la sección 3.7, que distingue entre la arquitectura prevista y el alcance realmente probado.

## 14. Resultados relevantes para interpretar el motor

La búsqueda seleccionó `reserve=0` y `release=0`. Por tanto, la política ajustada fue equivalente a la prioridad estricta. La reserva de personal no mejoró la función objetivo en las alternativas y escenarios evaluados.

En el escenario de referencia:

- FIFO obtuvo una pérdida promedio de 198,91;
- prioridad obtuvo una pérdida promedio de 181,20;
- la espera censurada de P0 bajó de 178,21 a 137,67 minutos;
- la espera censurada global subió de 174,78 a 211,86 minutos;
- la cobertura de P2 bajó de 67,71 % a 10,12 %;
- los episodios finalizados bajaron de 98,57 a 74,23.

El resultado muestra que la función objetivo favorece fuertemente la prioridad de P0 y P1. No demuestra que la política sea mejor en todos los indicadores. En una evolución del motor se debería evaluar envejecimiento de prioridad, espera máxima o restricciones explícitas de equidad.

## 15. Limitaciones técnicas y científicas

### 15.1. Simplificaciones del flujo asistencial

- El hospital comienza vacío.
- El triaje ya está resuelto al llegar.
- Cada paciente tiene un único episodio.
- P0 usa directamente UCI.
- P1 y P2 usan cama general.
- Un médico y una persona de enfermería quedan retenidos durante todo el episodio.
- No hay transferencias entre áreas.
- No hay cambio de prioridad.
- No hay abandono, mortalidad ni desenlace clínico.

### 15.2. Simplificaciones de recursos

- Todo el personal de un rol es homogéneo.
- No existen especialidades ni competencias.
- No se modelan turnos o descansos.
- Camas y ventiladores son conteos de capacidad.
- No se modelan suministros consumibles.
- No hay fallos o mantenimiento de equipos.

### 15.3. Simplificaciones de demanda

- Las tasas son constantes dentro de tres intervalos.
- La prioridad es independiente del tiempo de llegada.
- El tiempo de servicio depende solo de la prioridad y de un multiplicador global.
- La necesidad de ventilador solo se genera para P0.
- No hay correlaciones clínicas entre atributos.

### 15.4. Límites de optimización

- Solo se prueban nueve políticas.
- La función objetivo usa pesos no calibrados.
- No existe garantía de óptimo global.
- No se optimiza equidad directamente.
- La penalización terminal es fija.
- No se realiza adaptación durante una réplica.

### 15.5. Límites de validación

- Las pruebas verifican lógica, no realismo clínico.
- No existe comparación con datos observados.
- No se estimaron parámetros.
- No hubo validación prospectiva.
- No hubo revisión formal de especialistas.
- Los intervalos reflejan variabilidad Monte Carlo, no incertidumbre estructural.
- No se aplicó corrección por comparaciones múltiples.

## 16. Requerimientos para convertirlo en un Digital Twin hospitalario

Antes de usar el motor en un hospital serían necesarios, al menos, los siguientes trabajos:

1. **Definir el proceso real:** mapear triaje, zonas, rutas, reglas clínicas y responsabilidades.
2. **Construir un modelo de datos:** identificar pacientes, episodios, recursos, estados, tiempos y procedencia de cada dato.
3. **Implementar interoperabilidad:** integrar EHR/HIS, camas, personal y equipos mediante interfaces institucionales.
4. **Reconciliar estado:** transformar una instantánea física en agentes consistentes, incluidos episodios en curso.
5. **Calibrar parámetros:** estimar llegadas, servicios, disponibilidad, transiciones y variabilidad con datos históricos.
6. **Validar:** realizar validación estructural con expertos, retrospectiva con datos no usados en calibración y pruebas prospectivas controladas.
7. **Añadir incertidumbre:** generar bandas predictivas y detectar situaciones fuera del dominio calibrado.
8. **Incorporar equidad:** añadir límites de espera, envejecimiento de prioridad y métricas acordadas clínicamente.
9. **Diseñar el human-in-the-loop:** presentar recomendaciones explicables que un responsable pueda aceptar, modificar o rechazar.
10. **Aplicar seguridad y gobernanza:** privacidad, control de acceso, cifrado, trazabilidad, retención y respuesta a incidentes.
11. **Definir disponibilidad:** recuperación, monitoreo, tolerancia a fallos y degradación segura.
12. **Evaluar desempeño:** medir latencia extremo a extremo bajo la carga real esperada.
13. **Controlar versiones:** versionar datos, modelo, parámetros, política, resultados y decisión humana.
14. **Desarrollar la interfaz:** separar monitoreo, escenarios exploratorios y recomendaciones operativas.

Hasta completar esas actividades, el término más preciso para la implementación actual es **motor experimental híbrido ABS–SD con receptor de sincronización sintético**.

## 17. Decisiones recomendadas para la siguiente versión

Las siguientes mejoras mantienen coherencia con el artículo y corrigen las limitaciones observadas:

- validar explícitamente `Policy.name`;
- representar recursos mediante objetos o pools especializados;
- separar triaje, espera, diagnóstico, tratamiento y salida;
- permitir cambios de prioridad y deterioro;
- incorporar envejecimiento para reducir postergación de P2;
- configurar pesos y penalizaciones fuera del código;
- añadir un esquema formal para eventos e instantáneas;
- conectar `Shadow` con un constructor de estado inicial del simulador;
- agregar registro estructurado y manejo explícito de errores;
- convertir `motor/` en un paquete instalable;
- documentar versiones mediante un archivo de entorno;
- añadir pruebas de propiedades y pruebas de regresión de resultados;
- analizar más valores de `dt` y criterios de convergencia;
- separar calibración, ajuste de política y evaluación externa;
- crear una API de simulación antes de desarrollar la interfaz visual.

## 18. Conclusión técnica

El motor cumple el objetivo inmediato del artículo: materializa un modelo híbrido donde los pacientes y las asignaciones se representan a nivel individual, mientras los balances y la carga de trabajo se representan a nivel agregado. Las dos perspectivas están acopladas durante la ejecución, no únicamente al finalizarla.

Su diseño privilegia reproducibilidad, claridad y verificación. La generación sintética evita atribuir datos inexistentes a un hospital; la separación de semillas reduce el sesgo de evaluación; las métricas censuradas evitan ocultar pacientes pendientes; y las aserciones protegen la conservación de agentes y capacidades.

La implementación coincide con las secciones 3.1–3.11 del artículo dentro del alcance declarado. Lo que demuestra es que el núcleo computacional puede ejecutarse, respetar sus reglas y producir comparaciones reproducibles. No demuestra precisión clínica ni operación como Digital Twin en tiempo real. Esa transición requiere datos, integración, calibración, validación y gobernanza adicionales.
