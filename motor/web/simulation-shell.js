fetch('/api/ops/hospital')
  .then(response => response.json())
  .then(hospital => {
    const name = document.getElementById('hospital-name');
    name.textContent = hospital.name;
    name.title = hospital.name;
    if (hospital.code === 'DEMO-ABS') {
      document.getElementById('demo-indicator').textContent = '● Datos de demostración';
    }
  })
  .catch(() => {});
