# Entrenamiento del acompañante predictivo ABS–SD

Entrenamiento completado el 23 de septiembre de 2026 con 16.025 visitas de urgencias de NHAMCS 2022, publicadas por CDC/NCHS. Los archivos están descargados en `datos/nhamcs`; no se requieren credenciales. [Documentación oficial](https://www.cdc.gov/nchs/nhamcs/documentation/index.html) y [datos Stata](https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/NHAMCS/stata/ed2022-stata.zip).

## Resultado medido

| Objetivo | Método seleccionado en validación | Prueba | Referencia de entrenamiento |
|---|---|---:|---:|
| Estancia total LOV | Gradient boosting, 7 hojas | MAE 153,01 min | MAE 164,34 min |
| Espera WAITTIME | Mediana ponderada constante | MAE 27,65 min | MAE 27,65 min |
| Ingreso en el mismo hospital ADMITHOS | Gradient boosting, 7 hojas | Brier 0,07046 | Brier 0,08230 |

La estancia mejora el MAE un 6,9 % frente a la referencia, aunque su error sigue siendo grande (RMSE 345,02 min). Hospitalización obtiene ROC AUC 0,8154 y precisión media 0,3686. No se declara un modelo personalizado de espera: la referencia ganó en validación. Brier y MAE menores son mejores; AUC mayor indica mejor discriminación, no prueba calibración clínica.

## Diseño reproducible

- 112 hospitales / 9.196 registros de entrenamiento; 38 / 3.409 de validación; 38 / 3.420 de prueba. Los hospitales no se comparten. No hay identificador longitudinal: no se garantiza separación de personas repetidas.
- Variables de llegada y triaje: edad, sexo registrado, urgencia, temperatura, pulso, respiración, presión sistólica y diastólica, dolor, ambulancia y hora. No se incluyen disposición, tratamientos ni duración como entradas.
- Temperatura convertida desde décimas de °F; códigos especiales y mediciones fuera de rango tratados como ausentes. Los árboles admiten ausencias. Edad 0 representa menos de un año y 94 representa 94 o más.
- PATWT pondera entrenamiento, selección y evaluación. Estas métricas descriptivas no incluyen intervalos de confianza ajustados al diseño de encuesta.
- Se comparan referencia constante y dos modelos de boosting (7 y 15 hojas), con hiperparámetros y semilla fijados. Selección exclusivamente en validación, sin reajuste posterior con prueba.
- Etiquetas ausentes se excluyen por objetivo: prueba de estancia 3.296 visitas, espera 2.904 e ingreso 3.420. El informe JSON conserva todos los conteos, métricas y resultados por triaje.

## Uso

Desde la carpeta del proyecto, con Python 3.11 o superior (verificado con 3.13.9):

```powershell
python -m pip install -r requirements-ml.txt
python -m motor.train_ml
python -m motor.ui
```

La primera orden instala las dependencias; la segunda descarga si falta el ZIP y reproduce entrenamiento y evaluación. La interfaz incluye la sección **Aprendizaje automático**, con un perfil ficticio editable, resultados y comparación contra referencia. API: `GET /api/ml/status`; `POST /api/ml/predict` recibe un objeto con las variables de `motor/ml.py`, valores numéricos o null. Ejemplo: `{"age":40,"triage":3}`.

Artefactos en `resultados_ml`: `modelos.joblib`, `informe.json` y `predicciones_prueba.csv`. El informe incluye versiones, semilla, grupos hospitalarios y SHA-256 del ZIP, código, modelo y predicciones. Solo se carga el artefacto local cuyo hash coincide con el informe; no cargar modelos de terceros no confiables.

Pruebas: `python -m unittest discover -s motor -p "test_*.py"`. Las pruebas ML requieren las dependencias anteriores; no reentrenan durante la comprobación.

## Alcance

Este es un acompañante predictivo entrenado y accesible desde el motor. NHAMCS describe visitas estadounidenses de 2022; falta validación en Perú y en incidentes de víctimas masivas. La estancia LOV incluye espera y **no equivale al trabajo basal `service`**. Por ello, no reemplaza tiempos, asignaciones, prioridades ni la población sintética de la simulación 3D. No se han entrenado demanda temporal, necesidades de UCI ni ventilación. El triaje 1–5 de NHAMCS no tiene una equivalencia automática con P0–P2.

Los resultados originales del artículo en `resultados/` se conservan; este entrenamiento no los revalida. La siguiente calibración del simulador requiere datos locales de llegadas, inicio y fin de atención y utilización de recursos, con una definición compatible con sus variables.
