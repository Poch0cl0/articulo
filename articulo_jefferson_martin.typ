// Conversión íntegra de articulo_jefferson_martin.md.
// Archivo autónomo, sin paquetes externos. Compilación verificada con Typst 0.15.0.
// Para integrarlo en otro artículo, puede retirarse este preámbulo.
// Los números de sección y tabla se conservan de la fuente.
#set document(title: "Metodología y evaluación computacional: ABS–SD", author: ("Jefferson Miguel Peña Serrano", "Martin Aryan Robles Perez"))
#set page(paper: "a4", margin: (x: 22mm, y: 22mm), numbering: "1", number-align: center)
#set text(font: "Libertinus Serif", size: 11pt, lang: "es")
#set par(justify: true, leading: 0.7em, spacing: 0.85em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 16pt)
#show heading.where(level: 2): set text(size: 12.5pt)
#show heading.where(level: 3): set text(size: 11.5pt)
#show link: set text(fill: rgb("244b6b"))
#show math.equation.where(block: false): box
#set table(inset: 5pt, stroke: 0.35pt + rgb("b8bec5"), align: left + top)

= 3. Metodología y evaluación computacional

== 3.1. Diseño de la investigación

La investigación adoptó un enfoque cuantitativo, de finalidad aplicada y alcance exploratorio y explicativo dentro de un entorno computacional. Se empleó un diseño experimental de simulación para analizar la relación entre demanda asistencial, disponibilidad de recursos y políticas de asignación durante eventos de víctimas masivas (Mass Casualty Events, MCE). La unidad experimental fue una ejecución completa del modelo hospitalario bajo una configuración y una semilla pseudoaleatoria determinadas.

Se desarrolló un motor híbrido que combina simulación basada en agentes (Agent-Based Simulation, ABS) y dinámica de sistemas (System Dynamics, SD). El componente ABS representa los recorridos individuales y las asignaciones de recursos; el componente SD describe la acumulación de pacientes y la evolución de un índice agregado de carga de trabajo que modifica el ritmo de atención. La separación explícita de responsabilidades y de intercambios entre ambos componentes sigue la orientación metodológica de Nguyen et al. (2024) para conceptualizar modelos híbridos. #link("https://doi.org/10.1016/j.ejor.2024.01.027")[Nguyen et al. (2024)].

El procedimiento comprendió la delimitación del sistema, la definición de supuestos experimentales, la implementación del motor, su verificación automática, el ajuste de políticas mediante simulación y la evaluación con réplicas distintas de las utilizadas para el ajuste. La comparación se realizó con entradas aleatorias comunes entre políticas dentro de cada escenario, para controlar la variabilidad atribuible a diferentes conjuntos de pacientes.

El alcance corresponde a una prueba de concepto del núcleo de simulación de un Digital Twin. El documento de partida no proporciona registros hospitalarios, parámetros operativos calibrados ni un sistema ejecutable; por ello, los valores incorporados en esta fase son supuestos sintéticos de diseño experimental. No representan mediciones de un hospital de Trujillo ni resultados de una intervención clínica. La conexión hospitalaria en tiempo real y la interfaz de uso pertenecen a una fase posterior.

== 3.2. Definición del escenario de MCE

Se representó un servicio hospitalario simplificado que recibe una concentración inicial de pacientes seguida de una reducción progresiva de la demanda. Las llegadas siguen un proceso de Poisson por tramos, con tiempos entre llegadas exponenciales dentro de cada intervalo. La prioridad y el requerimiento de servicio se generan al crear cada paciente y permanecen iguales al comparar políticas.

Se definieron tres clases experimentales: P0, de mayor prioridad; P1, de prioridad intermedia; y P2, de menor prioridad. Estas clases permiten evaluar reglas de ordenamiento y no equivalen a un protocolo clínico de triaje validado. Como simplificación del circuito, P0 requiere una cama UCI y P1–P2 una cama general. Todos requieren simultáneamente un médico y una persona de enfermería. Una fracción de P0 necesita, además, un ventilador.

#block(sticky: true, below: 0.45em)[*Tabla 1. Parámetros del escenario sintético de referencia.*]

#block(breakable: true)[
#set text(size: 9pt)
#set par(justify: false, leading: 0.5em)
#table(
  columns: (1.0fr, 1.15fr, 1.35fr),
  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },
  table.header([*Parámetro*], [*Valor experimental*], [*Interpretación*]),
  [Horizonte de simulación], [480 minutos], [Una ventana de observación de ocho horas],
  [Paso de actualización], [1 minuto], [Acoplamiento ABS–SD y decisiones de asignación],
  [Llegadas entre 0 y 120 minutos], [0,8 pacientes/minuto], [Concentración inicial del MCE],
  [Llegadas entre 120 y 240 minutos], [0,3 pacientes/minuto], [Demanda posterior a la concentración inicial],
  [Llegadas entre 240 y 480 minutos], [0,1 pacientes/minuto], [Disminución de la demanda],
  [Demanda total esperada], [156 pacientes], [Esperanza del proceso; no cantidad fija por réplica],
  [Proporciones P0, P1 y P2], [20 %, 35 % y 45 %], [Distribución sintética de prioridades],
  [Médicos], [8], [Agentes con identificador individual],
  [Personal de enfermería], [12], [Agentes con identificador individual],
  [Camas generales], [12], [Uso exclusivo por pacientes P1–P2],
  [Camas UCI], [4], [Uso exclusivo por pacientes P0],
  [Ventiladores], [3], [Recursos reutilizables durante el episodio],
  [Necesidad de ventilador en P0], [Probabilidad de 0,50], [Atributo fijo del paciente durante la réplica],
  [Trabajo asistencial P0], [Triangular: mínimo 30, moda 60, máximo 90 minutos], [Requerimiento basal de servicio],
  [Trabajo asistencial P1], [Triangular: mínimo 15, moda 30, máximo 45 minutos], [Requerimiento basal de servicio],
  [Trabajo asistencial P2], [Triangular: mínimo 5, moda 15, máximo 25 minutos], [Requerimiento basal de servicio],
  [Constante de ajuste de carga, τ], [60 minutos], [Memoria del componente SD],
  [Intensidad de retroalimentación, β], [0,25], [Reducción máxima del ritmo de servicio: 25 %],
  [Condición inicial], [Colas y ocupación nulas; carga acumulada igual a cero], [Inicio transitorio, sin calentamiento],
)
]


*Fuente:* supuestos establecidos para esta implementación experimental; no son datos empíricos ni valores extraídos de los antecedentes. Las camas generales y UCI son conjuntos separados, con 16 camas en total.

El tiempo de servicio efectivo puede superar el requerimiento basal por efecto de la carga acumulada y de la discretización temporal. El personal permanece asignado al mismo paciente durante todo el episodio. No se modelan turnos, traslados, cirugía, pruebas diagnósticas, mortalidad, abandono ni cambios de prioridad. Tampoco se representa por separado la duración del triaje. Estas decisiones delimitan un entorno reproducible para estudiar competencia por recursos, aunque simplifican la operación hospitalaria.

== 3.3. Arquitectura del Digital Twin

La arquitectura se organizó en tres capas: Physical Twin, sincronización y Digital Twin. Esta organización mantiene la distinción entre el estado observado y sus proyecciones, y sitúa las recomendaciones dentro de un proceso de decisión humana, de acuerdo con el planteamiento de Moyaux et al. (2023). #link("https://doi.org/10.3390/su15043412")[Moyaux et al. (2023)].

#block(sticky: true, below: 0.45em)[*Tabla 2. Componentes y alcance de la arquitectura.*]

#block(breakable: true)[
#set text(size: 9pt)
#set par(justify: false, leading: 0.5em)
#table(
  columns: (0.7fr, 1.45fr, 1.65fr),
  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },
  table.header([*Capa*], [*Función metodológica*], [*Alcance realizado*]),
  [Physical Twin], [Representar pacientes, personal, infraestructura y equipos del hospital], [Se sustituyó el entorno real por entradas y estados sintéticos de prueba],
  [Sincronización], [Recibir información, verificar su consistencia y mantener un estado observado actualizado], [Se implementó un receptor independiente de instantáneas versionadas de capacidad y ocupación],
  [Digital Twin], [Ejecutar ABS–SD, comparar políticas y calcular indicadores], [Se implementó un motor ejecutable, ajuste por simulación y exportación de resultados],
  [Apoyo a la decisión], [Presentar alternativas para evaluación del responsable hospitalario], [Se produjeron resultados tabulares; no se desarrolló una interfaz ni se ejecutaron decisiones en un hospital],
)
]


El flujo operativo previsto es: registros del hospital → comprobación y sincronización → estado digital observado → simulaciones alternativas → indicadores → revisión humana. En la implementación experimental, las entradas del motor proceden del generador sintético y los resultados se almacenan en archivos estructurados. Las pruebas del receptor de sincronización se ejecutan por separado; no constituyen una integración completa entre registros hospitalarios y simulación.

Por tanto, el componente efectivamente evaluado es un modelo digital exploratorio con un prototipo de recepción de estados. Las funciones de Digital Shadow conectado y de Digital Twin sincronizado descritas en la propuesta general se conservan como arquitectura objetivo, sin atribuirles una implementación operativa en esta fase.

== 3.4. Modelo basado en agentes (ABS)

El modelo representa pacientes individuales y unidades identificables de personal. Las camas y los ventiladores se gestionan como recursos de capacidad finita, sin comportamiento autónomo. Esta distinción evita atribuir inteligencia o decisiones clínicas a objetos que únicamente restringen la atención.

#block(sticky: true, below: 0.45em)[*Tabla 3. Entidades, atributos y reglas de comportamiento.*]

#block(breakable: true)[
#set text(size: 9pt)
#set par(justify: false, leading: 0.5em)
#table(
  columns: (0.9fr, 1.65fr, 1.45fr),
  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },
  table.header([*Entidad*], [*Atributos principales*], [*Estados o reglas*]),
  [Paciente], [Identificador, llegada, prioridad, trabajo requerido, trabajo restante, necesidad de ventilación y tiempos de inicio y finalización], [Espera, atención y episodio finalizado],
  [Médico], [Identificador y paciente asignado], [Disponible u ocupado; atiende como máximo a un paciente simultáneamente],
  [Personal de enfermería], [Identificador y paciente asignado], [Disponible u ocupado; participa junto con un médico],
  [Cama general o UCI], [Categoría, capacidad y ocupación], [Se reserva al iniciar la atención y se libera al finalizar],
  [Ventilador], [Capacidad y ocupación], [Se exige únicamente cuando el atributo del paciente indica su necesidad],
)
]


El flujo de estados del paciente es:

*Llegada con prioridad conocida → espera por un conjunto factible de recursos → atención → episodio finalizado.*

La atención comienza únicamente cuando están disponibles todos los recursos requeridos. La asignación es no expropiativa: el ingreso de un paciente de mayor prioridad no interrumpe un episodio ya iniciado. Si el primer paciente de la lista no dispone del conjunto necesario, se examinan los siguientes, evitando bloquear recursos que podrían atender a otro paciente elegible.

Se implementaron una política FIFO entre pacientes elegibles, una política de prioridad estricta P0–P1–P2 y una política de prioridad con reserva temporal de personal. Dentro de una misma clase, los empates se resuelven por llegada y, después, por identificador. El personal disponible se selecciona de manera determinista; no se consideran diferencias individuales de productividad o competencia.

En cada intervalo, el trabajo pendiente disminuye según el ritmo proporcionado por SD. Cuando se agota, el paciente finaliza el episodio y libera conjuntamente sus recursos. Esta salida indica finalización computacional de la atención representada; no constituye una predicción de alta clínica o supervivencia.

== 3.5. Modelo de dinámica de sistemas (SD)

El componente SD representa los stocks de pacientes en espera, Q(t); en atención, A(t); y con episodio finalizado, D(t). Sus flujos son las llegadas, λ(t); los inicios de atención, a(t); y las finalizaciones, d(t), expresados en pacientes por minuto:

$ (dif Q)/(dif t) = lambda(t) - a(t) $

$ (dif A)/(dif t) = a(t) - d(t) $

$ (dif D)/(dif t) = d(t) $

En la implementación, los incrementos de estos stocks se calculan con los conteos efectivos de eventos de ABS en cada paso. No se generan pacientes mediante una segunda fuente SD. Con condiciones iniciales nulas, se verifica la identidad $Q(t) + A(t) + D(t) = N(t)$, donde N(t) es el número acumulado de llegadas incorporadas al reloj de simulación.

La disponibilidad de un recurso r se expresa como $R_r(t) = C_r - O_r(t)$, donde $C_r$ es su capacidad y $O_r$(t) su ocupación. La utilización del personal que alimenta el mecanismo de retroalimentación es $u(t) = A(t)/min(M, E)$, siendo M el número de médicos y E el de personal de enfermería. Si alguna de estas capacidades es cero, no se inicia atención y se define u(t) = 0.

Para representar una memoria agregada de la carga de trabajo se incorporó el stock adimensional F(t):

$ (dif F)/(dif t) = (u(t) - F(t))/tau; quad F(0) = 0. $

El stock se actualiza mediante Euler explícito:

$ F(t + Delta t) = F(t) + (Delta t)/tau [u(t) - F(t)]. $

El ritmo de trabajo del siguiente intervalo depende del estado disponible al inicio de ese intervalo:

$ v(t) = 1 - beta F(t). $

Para un paciente i en atención, su requerimiento restante $b_i$ evoluciona como $b_i(t + Delta t) = b_i(t) - v(t) Delta t$. Un requerimiento no positivo desencadena la finalización en la siguiente frontera temporal. Con 0 ≤ u ≤ 1 y Δt ≤ τ, F permanece entre cero y uno; con β = 0,25, v permanece entre 0,75 y 1.

Este mecanismo introduce una relación causal explícita: mayor utilización sostenida eleva la carga acumulada, disminuye el ritmo de atención y prolonga la retención de recursos, lo que puede aumentar las colas. F es un índice hipotético de carga y no una medición de fatiga humana. Su ecuación, τ y β son supuestos del experimento, sin calibración clínica. El análisis de sensibilidad incluye la desactivación de esta retroalimentación.

== 3.6. Integración híbrida ABS–SD

El acoplamiento se realizó sobre un reloj compartido, con un intervalo principal de un minuto. ABS conserva la identidad y trayectoria de cada paciente; SD mantiene los balances agregados y la memoria de carga. El intercambio es bidireccional: los episodios individuales determinan la utilización y los flujos, mientras que el stock de carga modifica el progreso del trabajo individual.

#block(sticky: true, below: 0.45em)[*Tabla 4. Intercambio entre componentes.*]

#block(breakable: true)[
#set text(size: 9pt)
#set par(justify: false, leading: 0.5em)
#table(
  columns: (0.85fr, 1.7fr, 1.45fr),
  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },
  table.header([*Dirección*], [*Información intercambiada*], [*Uso*]),
  [ABS → SD], [Llegadas, inicios y finalizaciones por paso], [Actualizar Q, A y D],
  [ABS → SD], [Ocupación de camas, UCI, ventiladores y personal], [Obtener disponibilidad y utilización],
  [SD → ABS], [Ritmo v(t) derivado de F(t)], [Actualizar el trabajo restante de cada paciente],
  [ABS–SD → evaluación], [Trayectorias individuales y agregadas], [Calcular esperas, cobertura, utilización y función objetivo],
)
]


En cada frontera temporal se procesan las finalizaciones, se incorporan las llegadas ocurridas hasta ese instante y se asignan recursos a pacientes elegibles. Después se actualizan los stocks mediante los conteos de eventos, se verifican los balances y se integra el trabajo asistencial durante el intervalo. Finalmente se actualiza F para el paso siguiente. En el horizonte final se registran las salidas y las llegadas pendientes de incorporación, pero no se inician nuevos episodios.

La consistencia se verifica comparando los stocks con un recuento independiente de los agentes en cada estado. De este modo, una persona contabilizada por ABS no se convierte en una segunda persona en SD. La integración tampoco se limita a sumar resultados, pues el stock F modifica efectivamente la trayectoria temporal de los agentes. Se repitieron experimentos con pasos de 0,5 y 0,25 minutos para examinar la dependencia de los resultados respecto de la resolución temporal.

== 3.7. Sincronización Physical Twin–Digital Twin

La sincronización se definió como la actualización del estado digital observado a partir de información del entorno físico, manteniendo separadas las observaciones de las predicciones. Las fuentes previstas son registros de admisión y atención, sistemas de gestión de camas, disponibilidad de personal y registros de equipos. Los eventos relevantes comprenden llegadas, inicio y finalización de atención, cambios de prioridad, liberación de camas y modificaciones de capacidad.

Para probar una parte de este mecanismo sin un hospital conectado, se implementó un receptor de instantáneas sintéticas. Cada mensaje contiene un identificador, una versión y un estado con capacidad y ocupación por recurso. El procedimiento comprueba si el identificador ya fue procesado, descarta versiones anteriores o iguales a la aceptada y verifica que las capacidades y ocupaciones sean enteras no negativas. Una ocupación superior a la capacidad ocasiona el rechazo del mensaje.

La actualización es atómica: una instantánea inválida no modifica el estado aceptado. Además, el receptor conserva una copia independiente, evitando que cambios posteriores en el mensaje original alteren el estado digital. Las pruebas verificaron aceptación, duplicados, versiones desactualizadas, rechazo de sobreocupación y aislamiento de la copia almacenada.

Esta implementación comprueba la lógica básica de recepción de estados de recursos. No implementa reconciliación de historias individuales, transmisión IoT, interoperabilidad con EHR ni reanudación automática de una simulación desde el estado de un hospital. La sincronización de pacientes y la medición del retraso entre evento físico y actualización digital requieren una integración posterior. En consecuencia, no se reporta latencia hospitalaria ni funcionamiento en tiempo real como resultados demostrados.

== 3.8. Optimización de la asignación de recursos

Se implementó una búsqueda exhaustiva sobre un conjunto finito de políticas de prioridad con reserva temporal de personal. Esta decisión metodológica se incorpora en la presente fase, ya que la propuesta inicial no especificaba un algoritmo ejecutable. La búsqueda ajusta parámetros operativos mediante simulación y no constituye entrenamiento supervisado, aprendizaje por refuerzo ni calibración con datos clínicos.

La política se caracteriza por θ = (r, $t_r$), donde r es el número de pares médico–enfermería temporalmente reservados para P0 y $t_r$ es el instante de liberación de la reserva. Se evaluaron nueve alternativas: ausencia de reserva, θ = (0, 0), y las ocho combinaciones de r ∈ {1, 2} con $t_r$ ∈ {30, 60, 120, 240} minutos. La reserva opera antes de $t_r$ mientras existe alguna cama UCI libre. Limita nuevos inicios de P1–P2 cuando consumirían el personal reservado; no interrumpe episodios ni garantiza disponibilidad de ventiladores.

Para cada recurso r, la asignación respeta:

$ sum_i a_(i r) x_i(t) <= C_r; quad x_i(t) in {0, 1}. $

Aquí $x_i$(t) indica si el paciente i está en atención y $a_(i r)$ representa su requerimiento del recurso. Todo episodio requiere un médico, una persona de enfermería y una cama compatible; el ventilador se exige según el atributo individual. La disponibilidad física se mantiene como restricción dura durante toda la ejecución.

La función objetivo utiliza todos los pacientes llegados en la réplica. Sea H el horizonte, $s_i$ el inicio de atención y $l_i$ su finalización. Se define la espera observada hasta H como $W_i^H = min(s_i, H) - t_i$, tomando $s_i$ = ∞ si el episodio no comenzó y siendo $t_i$ la llegada. La pérdida de una política es:

$ J(theta) = (sum_i w_i {W_i^H + 60 dot I(l_i > H)})/(sum_i w_i). $

Los pesos $w_i$ son 6, 3 y 1 para P0, P1 y P2. Si el episodio no finalizó, se toma $l_i$ = ∞. La penalización terminal de 60 minutos equivalentes incorpora atención no completada al horizonte; no estima su duración futura. Los pesos y la penalización son preferencias experimentales explícitas, sin interpretación como utilidad clínica, probabilidad de supervivencia o protocolo de racionamiento. Para una réplica sin llegadas se define J = 0.

La política seleccionada minimiza el promedio de J en cinco escenarios y veinte semillas de ajuste por escenario. Todos los escenarios reciben el mismo peso. La búsqueda garantiza el menor promedio observado únicamente dentro de las nueve alternativas evaluadas; no demuestra un óptimo global de asignación ni superioridad fuera de la distribución sintética. La saturación se analiza como indicador complementario, no como término independiente de J.

La búsqueda seleccionó θ = (0, 0), es decir, prioridad estricta sin reserva temporal. Su pérdida media en las cien réplicas de ajuste fue de 227,79 minutos equivalentes, frente a 227,85–228,42 para las alternativas con reserva. El ajuste no identificó una mejora sobre la política de prioridad ya incluida como referencia. Se conservaron los parámetros seleccionados sin modificarlos a partir de los resultados de evaluación.

== 3.9. Escenarios experimentales

Se evaluó un escenario de referencia y cuatro modificaciones para representar variaciones de demanda o disponibilidad. Los factores se modificaron por separado, conservando los demás parámetros de la Tabla 1.

#block(sticky: true, below: 0.45em)[*Tabla 5. Diseño de escenarios.*]

#block(breakable: true)[
#set text(size: 9pt)
#set par(justify: false, leading: 0.5em)
#table(
  columns: (0.9fr, 1.25fr, 0.75fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },
  table.header([*Escenario*], [*Parámetro modificado*], [*Demanda esperada*], [*Propósito*]),
  [Referencia], [Configuración de la Tabla 1], [156 pacientes], [Establecer el comportamiento base],
  [Demanda al 150 %], [Todas las tasas de llegada × 1,5], [234 pacientes], [Evaluar mayor presión asistencial],
  [Demanda al 200 %], [Todas las tasas de llegada × 2], [312 pacientes], [Examinar sobrecarga intensa],
  [Personal reducido], [6 médicos y 9 personas de enfermería], [156 pacientes], [Examinar una reducción del 25 % del personal],
  [Recursos críticos reducidos], [2 camas UCI y 1 ventilador], [156 pacientes], [Analizar restricciones específicas de atención prioritaria],
)
]


Se compararon tres políticas: FIFO entre pacientes elegibles, prioridad estricta sin reserva y prioridad con los parámetros seleccionados. Para el ajuste se emplearon las semillas 100–119 y, para la evaluación, 1000–1029. Las semillas de evaluación no intervinieron en la selección. La separación corresponde a realizaciones aleatorias nuevas de los mismos cinco escenarios, por lo que no demuestra generalización a hospitales o clases de escenarios desconocidos.

Se ejecutaron 900 simulaciones de ajuste —nueve alternativas, cinco escenarios y veinte semillas— y 450 de evaluación —tres políticas, cinco escenarios y treinta semillas—. Además, se realizaron 150 simulaciones de sensibilidad sobre el escenario de referencia, con treinta semillas para cada una de cinco variantes: pasos de 0,5 y 0,25 minutos, β = 0 y requerimientos de servicio multiplicados por 0,8 y 1,2. En conjunto, el diseño comprendió 1500 ejecuciones experimentales, aparte de las pruebas automáticas y de una trayectoria ilustrativa conservada para inspección.

Las réplicas se iniciaron desde un hospital vacío, porque el interés fue estudiar el transitorio definido desde el inicio del MCE. Esta condición no representa la ocupación habitual previa de un hospital y puede modificar la magnitud de los resultados. No se extrapolaron los escenarios a frecuencias reales de desastres.

== 3.10. Validación del modelo

La evaluación distinguió verificación del programa, consistencia estructural y validación empírica. Se ejecutaron quince pruebas automáticas, todas satisfactorias, que cubrieron ausencia de pacientes, ausencia de personal o camas, indisponibilidad de ventilador, resolución analítica de un episodio sin retroalimentación, respeto de prioridad, reproducibilidad, conservación bajo sobrecarga, efecto del acoplamiento SD, rechazo de parámetros inválidos, censura al horizonte, liberación de la reserva y recepción consistente de instantáneas.

Durante todas las simulaciones se comprobaron adicionalmente la igualdad entre stocks y agentes, la conservación del número de pacientes, la ausencia de ocupación por encima de las capacidades y la exclusividad de las asignaciones de personal. Los criterios de aceptación funcional fueron coincidencia exacta en los casos deterministas y ausencia de violaciones de estas invariantes. La retroalimentación se verificó contrastando el momento de finalización de un mismo episodio con β = 0 y β \> 0.

La evaluación estadística utilizó treinta réplicas por combinación de escenario y política. Se calcularon medias e intervalos de confianza nominales del 95 % para la variabilidad entre réplicas, mediante $"media" plus.minus 2.04523 dot s/sqrt(30)$, donde s es la desviación estándar muestral. Las comparaciones de políticas utilizaron diferencias emparejadas por semilla. Estos intervalos expresan incertidumbre Monte Carlo condicionada a los supuestos; no incorporan incertidumbre de calibración, estructura o representatividad clínica. Las comparaciones múltiples se interpretan de forma exploratoria, sin corrección de multiplicidad.

#block(sticky: true, below: 0.45em)[*Tabla 6. Pérdida ponderada en las réplicas de evaluación.*]

#block(breakable: true)[
#set text(size: 9pt)
#set par(justify: false, leading: 0.5em)
#table(
  columns: (0.9fr, 1fr, 1.1fr, 1.15fr),
  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },
  table.header([*Escenario*], [*FIFO: J, media ± semiancho IC 95 %*], [*Prioridad y política seleccionada: J, media ± semiancho IC 95 %*], [*Diferencia seleccionada − FIFO, IC 95 %*]),
  [Referencia], [198,91 ± 7,47], [181,20 ± 8,27], [-17,71 \[-19,14; -16,29\]],
  [Demanda al 150 %], [264,93 ± 5,04], [252,43 ± 5,46], [-12,50 \[-13,42; -11,58\]],
  [Demanda al 200 %], [298,76 ± 4,01], [289,29 ± 4,32], [-9,48 \[-10,16; -8,79\]],
  [Personal reducido], [249,93 ± 6,10], [234,90 ± 6,97], [-15,03 \[-16,36; -13,69\]],
  [Recursos críticos reducidos], [206,94 ± 7,32], [193,61 ± 7,08], [-13,33 \[-14,47; -12,19\]],
)
]


Los valores de J se expresan en minutos equivalentes de la función objetivo. La política seleccionada y la prioridad sin reserva produjeron exactamente los mismos indicadores asistenciales en las treinta semillas de cada escenario; por ello se presentan juntas. Una diferencia negativa frente a FIFO favorece a la política seleccionada exclusivamente según J.

#block(sticky: true, below: 0.45em)[*Tabla 7. Indicadores del escenario de referencia: promedios de treinta réplicas.*]

#block(breakable: true)[
#set text(size: 9pt)
#set par(justify: false, leading: 0.5em)
#table(
  columns: (2fr, 0.7fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },
  table.header([*Indicador*], [*FIFO*], [*Prioridad y política seleccionada*]),
  [Llegadas], [157,30], [157,30],
  [Pacientes con atención iniciada], [106,33], [82,13],
  [Episodios finalizados], [98,57], [74,23],
  [Pacientes en cola al cierre], [50,97], [75,17],
  [Espera de quienes iniciaron atención, min], [155,84], [124,24],
  [Espera censurada de todas las llegadas, min], [174,78], [211,86],
  [Espera censurada P0, min], [178,21], [137,67],
  [Espera censurada P1, min], [170,15], [112,50],
  [Espera censurada P2, min], [176,14], [318,41],
  [Cobertura P0, %], [65,20], [81,26],
  [Cobertura P1, %], [70,13], [92,04],
  [Cobertura P2, %], [67,71], [10,12],
  [Utilización de camas generales, %], [40,07], [34,10],
  [Ocupación media UCI, %], [77,44], [95,35],
  [Utilización de médicos, %], [98,83], [98,83],
  [Utilización de enfermería, %], [65,89], [65,89],
  [Utilización de ventiladores, %], [50,79], [61,93],
)
]


En el escenario de referencia, la prioridad redujo la espera censurada de P0, pero aumentó la espera global y la de P2, y produjo menos episodios finalizados que FIFO. La cobertura de P2 descendió de 67,71 % a 10,12 %. Este resultado evidencia la postergación del grupo de menor prioridad bajo sobrecarga y constituye una limitación de la regla evaluada. No se incorporó una restricción de espera máxima ni un mecanismo de envejecimiento de prioridad. Por ello, la menor pérdida ponderada no demuestra una mejora integral de la asignación ni permite recomendar esta política para uso clínico.


El análisis de sensibilidad conservó la política seleccionada. En el escenario de referencia, con Δt = 0,5 minutos se obtuvo J = 180,04, una variación de -0,64 % respecto del paso de un minuto; con Δt = 0,25 minutos se obtuvo J = 179,45, una variación de -0,97 % respecto del paso de un minuto. Estas diferencias describen sensibilidad numérica del resultado agregado y no prueban convergencia de todas las trayectorias. Al desactivar la retroalimentación (β = 0), J fue 133,00. Con requerimientos de servicio al 80 % y al 120 %, J fue 132,55 y 215,52, respectivamente. La dependencia observada respecto del servicio y del mecanismo SD refuerza la necesidad de estimar estos parámetros con datos antes de trasladar los resultados a un hospital. No se evaluó sensibilidad a los pesos de prioridad ni a la penalización terminal; las comparaciones quedan condicionadas a esas preferencias.

El motor se ejecutó en Python 3.12.14, sobre Windows y un procesador AMD Ryzen 7 7840U. En las 450 ejecuciones de evaluación, el tiempo medio medido por réplica fue 0,33 segundos, con un intervalo observado de 0,10 a 0,73 segundos. El proceso experimental completo, incluyendo ajuste, evaluación, sensibilidad y exportación, tardó 501,81 segundos. Estas mediciones corresponden al equipo y a la carga de ejecución utilizados; no son garantías de latencia en un sistema hospitalario. Se conservaron la política seleccionada, semillas, configuración, resultados por réplica, una trayectoria de ejemplo y hashes del código para facilitar la reproducción.

La evidencia obtenida respalda la corrección de los mecanismos verificados y permite comparar políticas dentro del entorno definido. No constituye validación clínica, predictiva externa ni de sincronización hospitalaria. No se dispuso de registros reales para contrastar distribuciones de llegada, duración de atención, ocupación o trayectorias individuales; tampoco se realizó una revisión formal con especialistas clínicos. En consecuencia, la conclusión metodológica se limita a un motor ejecutable y verificado con experimentación sintética. La utilidad hospitalaria requiere calibración, revisión del circuito asistencial y evaluación externa posterior.

== 3.11. Métricas de evaluación

Las métricas diferencian inicio de atención, finalización del episodio y espera pendiente. Para evitar que una política parezca favorable por atender únicamente a una fracción de la demanda, se reporta la espera entre quienes iniciaron atención junto con una medida censurada que incluye todas las llegadas.

#block(sticky: true, below: 0.45em)[*Tabla 8. Indicadores de evaluación.*]

#block(breakable: true)[
#set text(size: 9pt)
#set par(justify: false, leading: 0.5em)
#table(
  columns: (1.1fr, 1.8fr, 1.1fr),
  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },
  table.header([*Indicador*], [*Cálculo e interpretación*], [*Orientación*]),
  [Espera promedio de quienes iniciaron atención], [Promedio de $s_i - t_i$ entre pacientes con $s_i < H$], [Minimizar, interpretando la cobertura conjuntamente],
  [Espera promedio censurada al horizonte], [Promedio de $W_i^H$ entre todas las llegadas], [Minimizar; no equivale a la espera final de quienes siguen en cola],
  [Espera censurada por prioridad], [Promedio de $W_i^H$ calculado por separado para P0, P1 y P2], [Reducir y examinar diferencias entre grupos],
  [Pacientes con atención iniciada], [Número de pacientes asignados a un conjunto de recursos antes de H], [Maximizar sujeto a prioridad y capacidad],
  [Episodios finalizados], [Número de pacientes con $l_i <= H$], [Maximizar; no se interpreta como supervivencia],
  [Cobertura por prioridad], [Pacientes de la clase con atención iniciada / llegadas de esa clase], [Maximizar y reportar por separado para cada prioridad],
  [Cola y atención pendientes al cierre], [Q(H) y A(H)], [Reducir y distinguir demanda no iniciada de episodios en curso],
  [Utilización de camas generales], [$(sum O_("general")(t) Delta t)/(C_("general") dot H)$], [Interpretar con espera y capacidad de respuesta],
  [Ocupación media de UCI], [$(sum O_("UCI")(t) Delta t)/(C_("UCI") dot H)$], [Equilibrar uso y disponibilidad; no maximizar indiscriminadamente],
  [Utilización de personal], [$(sum O_r(t) Delta t)/(C_r dot H)$, por separado para médicos y enfermería], [Identificar recursos limitantes y holgura],
  [Utilización de ventiladores], [Tiempo acumulado de ocupación / capacidad-tiempo disponible], [Interpretar según la demanda compatible],
  [Fracción temporal de saturación UCI], [$(sum I[O_("UCI")(t) = C_("UCI")] Delta t)/H$, con $C_("UCI") > 0$], [Reducir bajo demanda comparable],
  [Pérdida ponderada J], [Espera censurada y penalización por episodios no finalizados, según la sección 3.8], [Minimizar dentro del conjunto de políticas],
  [Tiempo computacional de una réplica], [Tiempo de reloj transcurrido durante la ejecución del simulador], [Minimizar preservando la corrección],
)
]


Cuando una clase no presenta llegadas, su cobertura y espera se consideran no definidas. Del mismo modo, la utilización de un recurso con capacidad cero no se expresa como porcentaje. Estas convenciones evitan divisiones por cero e interpretaciones artificiales de los casos extremos.

El tiempo desde llegada hasta inicio de atención funciona como indicador de respuesta asistencial exclusivamente dentro del escenario simulado. No se calcula tiempo hasta triaje, porque el triaje no constituye una etapa independiente. Tampoco se reporta latencia extremo a extremo del Digital Twin: el tiempo computacional local no incluye captura de información, transmisión, reconciliación del estado ni revisión humana. Las métricas de mortalidad y desenlaces clínicos quedan fuera del alcance del modelo.

=== Referencias citadas en esta sección

Moyaux, T., Liu, Y., Bouleux, G., & Cheutet, V. (2023). An Agent-Based Architecture of the Digital Twin for an Emergency Department. _Sustainability, 15_(4), 3412. #link("https://doi.org/10.3390/su15043412")[https://doi.org/10.3390/su15043412]

Nguyen, L. K. N., Howick, S., & Megiddo, I. (2024). A framework for conceptualising hybrid system dynamics and agent-based simulation models. _European Journal of Operational Research, 315_(3), 1153–1166. #link("https://doi.org/10.1016/j.ejor.2024.01.027")[https://doi.org/10.1016/j.ejor.2024.01.027]
