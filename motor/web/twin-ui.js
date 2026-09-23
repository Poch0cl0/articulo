(() => {
  const status = document.getElementById('twin-status');
  const counts = document.getElementById('twin-counts');
  const count = (data, key) => data[key] ?? 0;
  async function refresh() {
    try {
      const response = await fetch('/api/twin/status');
      if(!response.ok) throw new Error('El registro local no está disponible.');
      const data = await response.json();
      const labels = {sin_fuentes:'Sin fuentes hospitalarias registradas',
        reciente:'Eventos recientes recibidos; la fuente aún no está autenticada',
        sin_actualizaciones_recientes:'Hay fuentes registradas, pero no envían eventos recientes'};
      status.textContent=labels[data.connection] || 'Estado de sincronización desconocido';
      const patientText=Object.entries(data.patients).map(([state,n])=>`${state}: ${n}`).join(' · ') || 'Sin pacientes registrados';
      const resourceText=Object.entries(data.resources).map(([state,n])=>`${state}: ${n}`).join(' · ') || 'Sin recursos registrados';
      const sources=data.sources.length?data.sources.map(s=>`${s.source} (${s.accepted} aceptados, ${s.rejected} rechazados; último ${s.last_received_at})`).join(' · '):'Ninguna fuente';
      counts.replaceChildren();
      for(const value of [patientText,resourceText,`Eventos: ${count(data.events,'accepted')} aceptados · ${count(data.events,'rejected')} rechazados · ${count(data.events,'stale')} obsoletos`, `Fuentes: ${sources}`]) {
        const item=document.createElement('span');item.textContent=value;counts.append(item);
      }
    } catch(error) {status.textContent=error.message;}
  }
  refresh();
  window.setInterval(refresh,15000);
})();
