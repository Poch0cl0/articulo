"""Insert measured results into the manuscript, and audit experiment outputs."""
from pathlib import Path
import json,csv,statistics as st,sys
sys.stdout.reconfigure(encoding='utf-8')

ROOT=Path(__file__).resolve().parents[1]
out=ROOT/'resultados'
s=json.loads((out/'resumen.json').read_text(encoding='utf-8'))
cfg=json.loads((out/'politica_ajustada.json').read_text(encoding='utf-8'))
a=s['aggregates']
rows=list(csv.DictReader((out/'evaluacion.csv').open(encoding='utf-8')))
assert len(rows)==450
assert set(cfg['train_seeds']).isdisjoint(cfg['test_seeds'])
for row in rows:
    assert int(row['arrivals'])==sum(int(row[x]) for x in ['completed','in_service','waiting'])
    for key,val in row.items():
        if key.startswith('util_') and val: assert 0<=float(val)<=1
for name,policies in a.items():
    for key,val in policies['priority'].items():
        if key!='runtime_s': assert val==policies['tuned'][key]

def n(x): return f'{x:.2f}'.replace('.',',')
def ci(x): return n(x['mean'])+' ± '+n(x['ci95'])
names={'referencia':'Referencia','demanda_150':'Demanda al 150 %','demanda_200':'Demanda al 200 %',
       'personal_reducido':'Personal reducido','criticos_reducidos':'Recursos críticos reducidos'}

adjustment=(f"La búsqueda seleccionó θ = ({cfg['policy']['reserve']}, {cfg['policy']['release']}), es decir, prioridad estricta sin reserva temporal. "
"Su pérdida media en las cien réplicas de ajuste fue de 227,79 minutos equivalentes, frente a 227,85–228,42 para las alternativas con reserva. "
"El ajuste no identificó una mejora sobre la política de prioridad ya incluida como referencia. Se conservaron los parámetros seleccionados sin modificarlos a partir de los resultados de evaluación.")

results='**Tabla 6. Pérdida ponderada en las réplicas de evaluación.**\n\n'
results+='| Escenario | FIFO: J, media ± semiancho IC 95 % | Prioridad y política seleccionada: J, media ± semiancho IC 95 % | Diferencia seleccionada − FIFO, IC 95 % |\n|---|---|---|---|\n'
for name,label in names.items():
    diff=s['paired_differences'][name]['fifo']['objective']
    results+=f"| {label} | {ci(a[name]['fifo']['objective'])} | {ci(a[name]['tuned']['objective'])} | {n(diff['mean'])} [{n(diff['mean']-diff['ci95'])}; {n(diff['mean']+diff['ci95'])}] |\n"
results+='\nLos valores de J se expresan en minutos equivalentes de la función objetivo. La política seleccionada y la prioridad sin reserva produjeron exactamente los mismos indicadores asistenciales en las treinta semillas de cada escenario; por ello se presentan juntas. Una diferencia negativa frente a FIFO favorece a la política seleccionada exclusivamente según J.\n\n'
results+='**Tabla 7. Indicadores del escenario de referencia: promedios de treinta réplicas.**\n\n| Indicador | FIFO | Prioridad y política seleccionada |\n|---|---|---|\n'
for key,label in [('arrivals','Llegadas'),('started','Pacientes con atención iniciada'),('completed','Episodios finalizados'),
 ('waiting','Pacientes en cola al cierre'),('wait_started','Espera de quienes iniciaron atención, min'),
 ('wait_censored','Espera censurada de todas las llegadas, min'),('wait_p0','Espera censurada P0, min'),
 ('wait_p1','Espera censurada P1, min'),('wait_p2','Espera censurada P2, min'),
 ('coverage_p0','Cobertura P0, %'),('coverage_p1','Cobertura P1, %'),('coverage_p2','Cobertura P2, %'),
 ('util_beds','Utilización de camas generales, %'),('util_icu','Ocupación media UCI, %'),
 ('util_doctors','Utilización de médicos, %'),('util_nurses','Utilización de enfermería, %'),
 ('util_ventilators','Utilización de ventiladores, %')]:
    factor=100 if key.startswith(('coverage','util_')) else 1
    results+=f"| {label} | {n(factor*a['referencia']['fifo'][key]['mean'])} | {n(factor*a['referencia']['tuned'][key]['mean'])} |\n"
results+='\nEn el escenario de referencia, la prioridad redujo la espera censurada de P0, pero aumentó la espera global y la de P2, y produjo menos episodios finalizados que FIFO. '
results+=f"La cobertura de P2 descendió de {n(100*a['referencia']['fifo']['coverage_p2']['mean'])} % a {n(100*a['referencia']['tuned']['coverage_p2']['mean'])} %. "
results+='Este resultado evidencia la postergación del grupo de menor prioridad bajo sobrecarga y constituye una limitación de la regla evaluada. No se incorporó una restricción de espera máxima ni un mecanismo de envejecimiento de prioridad. Por ello, la menor pérdida ponderada no demuestra una mejora integral de la asignación ni permite recomendar esta política para uso clínico.\n'

sens='El análisis de sensibilidad conservó la política seleccionada. En el escenario de referencia, '
base=a['referencia']['tuned']['objective']['mean']
for key,label in [('dt_05','Δt = 0,5 minutos'),('dt_025','Δt = 0,25 minutos')]:
    val=s['sensitivity'][key]['objective']['mean']
    sens+=f"con {label} se obtuvo J = {n(val)}, una variación de {n(100*(val-base)/base)} % respecto del paso de un minuto; "
sens=sens.rstrip('; ')+'. '
sens+='Estas diferencias describen sensibilidad numérica del resultado agregado y no prueban convergencia de todas las trayectorias. '
sens+=f"Al desactivar la retroalimentación (β = 0), J fue {n(s['sensitivity']['sin_feedback']['objective']['mean'])}. "
sens+=f"Con requerimientos de servicio al 80 % y al 120 %, J fue {n(s['sensitivity']['servicio_080']['objective']['mean'])} y {n(s['sensitivity']['servicio_120']['objective']['mean'])}, respectivamente. "
sens+='La dependencia observada respecto del servicio y del mecanismo SD refuerza la necesidad de estimar estos parámetros con datos antes de trasladar los resultados a un hospital. No se evaluó sensibilidad a los pesos de prioridad ni a la penalización terminal; las comparaciones quedan condicionadas a esas preferencias.'

times=[float(r['runtime_s']) for r in rows]
timing=(f"El motor se ejecutó en Python {s['python'].split()[0]}, sobre Windows y un procesador AMD Ryzen 7 7840U. "
f"En las 450 ejecuciones de evaluación, el tiempo medio medido por réplica fue {n(st.mean(times))} segundos, "
f"con un intervalo observado de {n(min(times))} a {n(max(times))} segundos. "
f"El proceso experimental completo, incluyendo ajuste, evaluación, sensibilidad y exportación, tardó {n(s['runtime_total_s'])} segundos. "
"Estas mediciones corresponden al equipo y a la carga de ejecución utilizados; no son garantías de latencia en un sistema hospitalario. "
"Se conservaron la política seleccionada, semillas, configuración, resultados por réplica, una trayectoria de ejemplo y hashes del código para facilitar la reproducción.")

p=ROOT/'articulo_jefferson_martin.md'
text=p.read_text(encoding='utf-8')
for tag,value in [('AJUSTE',adjustment),('RESULTADOS',results),('SENSIBILIDAD',sens),('TIEMPO',timing)]:
    assert text.count('@@'+tag+'@@')==1
    text=text.replace('@@'+tag+'@@',value)
assert '@@' not in text
assert len([x for x in text.splitlines() if x.startswith('## 3.')])==11
p.write_text(text,encoding='utf-8')
(out/'auditoria_final.json').write_text(json.dumps(dict(evaluation_rows=len(rows),patient_conservation=True,
 resource_utilization_bounds=True,disjoint_seeds=True,selected_equals_priority=True,sections=11,
 manuscript_words=len(text.split())),indent=2),encoding='utf-8')
print(results); print(sens); print(timing)
