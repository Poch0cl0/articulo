/* Orthographic 3D scene, rendered locally without external dependencies. */
(function(root) {
  'use strict';
  const colors=['#ec7767','#efbd55','#43bdab'];
  function stateAt(patients,t) {
    const waiting=[],active=[],finished=[];
    for(const p of patients) {
      if(p.arrival>t) continue;
      if(p.finish!==null && p.finish<=t) finished.push(p);
      else if(p.start!==null && p.start<=t) active.push(p);
      else waiting.push(p);
    }
    return {waiting,active,finished};
  }
  // Visual slots only: retain a slot throughout care; discharge precedes admission.
  function bedSlots(patients) {
    const slots=new Map(), freeAt={general:[],icu:[]};
    for(const p of patients.filter(p=>p.start!==null).sort((a,b)=>a.start-b.start||a.id-b.id)) {
      const pool=freeAt[p.priority===0?'icu':'general'];
      let slot=pool.findIndex(end=>end<=p.start);
      if(slot<0) slot=pool.length;
      pool[slot]=p.finish??Infinity;
      slots.set(p.id,slot);
    }
    return slots;
  }
  class View {
    constructor(canvas,onTime) {
      this.canvas=canvas;this.ctx=canvas.getContext('2d');this.onTime=onTime;
      this.yaw=-.55;this.pitch=.68;this.zoom=1;this.index=0;this.playing=false;this.hits=[];
      this.el=id=>document.getElementById(id);
      this.el('play').addEventListener('click',()=>this.toggle());
      this.el('rewind').addEventListener('click',()=>{this.pause();this.onTime(0);});
      this.el('scene-time').addEventListener('input',()=>{this.pause();this.onTime(Number(this.el('scene-time').value));});
      this.el('camera-reset').addEventListener('click',()=>{this.yaw=-.55;this.pitch=.68;this.zoom=1;this.draw();});
      for(const [id,multiplier] of [['zoom-in',1.15],['zoom-out',1/1.15]]) this.el(id).addEventListener('click',()=>{this.zoom=Math.max(.6,Math.min(1.8,this.zoom*multiplier));this.draw();});
      canvas.addEventListener('pointerdown',e=>{this.drag={x:e.clientX,y:e.clientY,moved:0};canvas.setPointerCapture(e.pointerId);});
      canvas.addEventListener('pointermove',e=>{
        if(!this.drag)return;
        const dx=e.clientX-this.drag.x,dy=e.clientY-this.drag.y;
        this.drag.moved+=Math.abs(dx)+Math.abs(dy);this.drag.x=e.clientX;this.drag.y=e.clientY;
        this.yaw+=dx*.008;this.pitch=Math.max(.28,Math.min(1.3,this.pitch+dy*.006));this.draw();
      });
      canvas.addEventListener('pointerup',e=>{
        if(this.drag && this.drag.moved<5) this.pick(e);
        this.drag=null;
      });
      canvas.addEventListener('pointercancel',()=>{this.drag=null;});
      canvas.addEventListener('keydown',e=>{
        if(!['ArrowLeft','ArrowRight','ArrowUp','ArrowDown','+','=','-'].includes(e.key))return;
        e.preventDefault();
        if(e.key==='ArrowLeft')this.yaw-=.12;
        if(e.key==='ArrowRight')this.yaw+=.12;
        if(e.key==='ArrowUp')this.pitch=Math.min(1.3,this.pitch+.08);
        if(e.key==='ArrowDown')this.pitch=Math.max(.28,this.pitch-.08);
        if(e.key==='+'||e.key==='=')this.zoom=Math.min(1.8,this.zoom*1.1);
        if(e.key==='-')this.zoom=Math.max(.6,this.zoom/1.1);
        this.draw();
      });
      new ResizeObserver(()=>this.draw()).observe(canvas);
      document.addEventListener('visibilitychange',()=>{if(document.hidden)this.pause();});
    }
    load(data) {
      this.pause();this.data=data;this.slots=bedSlots(data.result.patients);this.selected=null;
      this.el('scene-time').max=data.result.trace.length-1;
      this.el('scene-selection').textContent='Selecciona una figura para ver el paciente. La tabla inferior conserva todos los pacientes.';
    }
    show(index) {
      if(!this.data)return;
      this.index=index;
      const r=this.data.result.trace[index];this.state=stateAt(this.data.result.patients,r.t);
      this.el('scene-time').value=index;this.el('scene-minute').textContent=r.t.toLocaleString('es-PE',{maximumFractionDigits:2});
      this.el('scene-counts').textContent=`En espera: ${r.queue} · En atención: ${r.active} · Finalizados: ${r.finished} · UCI: ${r.icu}/${this.data.config.icu} · Ventiladores: ${r.ventilators}/${this.data.config.ventilators} · Médicos: ${r.doctors}/${this.data.config.doctors} · Enfermería: ${r.nurses}/${this.data.config.nurses}`;
      const extra=[];
      if(r.queue>80) extra.push(`se muestran 80 de ${r.queue} pacientes en espera`);
      if(this.data.config.beds>24 || this.data.config.icu>12) extra.push('se muestran hasta 24 camas generales y 12 UCI');
      if(r.finished>10)extra.push(`se muestran las 10 salidas más recientes de ${r.finished}`);
      this.el('scene-note').textContent='Distribución esquemática: las posiciones y camas individuales son ilustrativas. '+(extra.length?extra.join('; ')+'. Los conteos incluyen a todos.':'Los estados corresponden a la frontera temporal seleccionada.');
      if(this.selected)this.describe(this.selected);
      this.draw();
    }
    pause() {
      this.playing=false;cancelAnimationFrame(this.frame);this.el('play').textContent='▶ Reproducir';
    }
    toggle() {
      if(!this.data)return;
      if(this.playing){this.pause();return;}
      if(this.index>=this.data.result.trace.length-1)this.onTime(0);
      this.playing=true;this.el('play').textContent='Ⅱ Pausar';this.last=null;
      this.clock=this.data.result.trace[this.index].t;
      const tick=now=>{
        if(!this.playing)return;
        if(this.last!==null)this.clock+=Math.min(.25,(now-this.last)/1000)*Number(this.el('play-speed').value);
        this.last=now;
        const trace=this.data.result.trace;let next=this.index;
        while(next<trace.length-1 && trace[next+1].t<=this.clock)next++;
        if(next!==this.index)this.onTime(next);
        if(next===trace.length-1){this.pause();return;}
        this.frame=requestAnimationFrame(tick);
      };
      this.frame=requestAnimationFrame(tick);
    }
    project(x,y,z) {
      const u=x*Math.cos(this.yaw)-z*Math.sin(this.yaw);
      const v=x*Math.sin(this.yaw)+z*Math.cos(this.yaw);
      return {x:this.width/2+u*this.scale,y:this.height*.56+(v*Math.sin(this.pitch)-y*Math.cos(this.pitch))*this.scale,
        depth:v*Math.cos(this.pitch)+y*Math.sin(this.pitch)};
    }
    box(x,y,z,w,h,d,color) {
      const pts=[[x,y,z],[x+w,y,z],[x+w,y,z+d],[x,y,z+d],
        [x,y+h,z],[x+w,y+h,z],[x+w,y+h,z+d],[x,y+h,z+d]].map(p=>this.project(...p));
      const faces=[[0,1,5,4,.72],[1,2,6,5,.84],[2,3,7,6,.91],[3,0,4,7,.77],[4,5,6,7,1.1]];
      for(const [a,b,c,d,shade] of faces) {
        const vertices=[pts[a],pts[b],pts[c],pts[d]];
        const rgb=color.match(/\w\w/g).map(v=>Math.min(255,Math.round(parseInt(v,16)*shade)));
        this.faces.push({vertices,depth:vertices.reduce((s,p)=>s+p.depth,0)/4,color:`rgb(${rgb.join(',')})`});
      }
    }
    person(p,x,z,y=0,lying=false) {
      const color=colors[p.priority];
      if(lying){this.box(x-.23,y,z-.35,.46,.22,.85,color);this.box(x-.16,y,z-.67,.32,.29,.3,'#f2d6bc');}
      else {
        this.box(x-.17,y+.35,z-.13,.34,.52,.28,color);
        this.box(x-.12,y+.9,z-.12,.25,.25,.25,'#f2d6bc');
        this.box(x-.15,y,z-.1,.11,.35,.2,'#35566b');this.box(x+.04,y,z-.1,.11,.35,.2,'#35566b');
      }
      this.hits.push({...this.project(x,y+(lying?.3:.8),z),p});
    }
    bed(x,z,p) {
      this.box(x-.42,.12,z-.67,.84,.32,1.27,'#7d9fac');
      this.box(x-.46,.44,z-.7,.92,.19,1.35,'#e2f0f0');
      this.box(x-.4,.63,z-.65,.8,.13,.3,'#ffffff');
      this.box(x-.48,.1,z-.79,.96,.87,.1,'#b6d1da');
      if(p){this.person(p,x,z,.67,true);
        this.box(x+.55,0,z-.6,.09,.85,.09,'#537e90');this.box(x+.43,.85,z-.7,.4,.35,.12,p.ventilation?'#ebae48':'#52bfc4');}
    }
    draw() {
      if(!this.state || !this.ctx)return;
      const rect=this.canvas.getBoundingClientRect();if(!rect.width)return;
      this.width=rect.width;this.height=rect.height;const dpr=Math.min(devicePixelRatio||1,2);
      if(this.canvas.width!==Math.round(rect.width*dpr)||this.canvas.height!==Math.round(rect.height*dpr)){
        this.canvas.width=Math.round(rect.width*dpr);this.canvas.height=Math.round(rect.height*dpr);
      }
      const ctx=this.ctx;ctx.setTransform(dpr,0,0,dpr,0,0);ctx.clearRect(0,0,this.width,this.height);
      this.scale=Math.min(this.width/28,this.height/20)*this.zoom;this.faces=[];this.hits=[];
      this.box(-11,-.4,-7,22,.35,14,'#395a70');
      this.paintFaces();this.faces=[];
      this.box(-10.6,-.04,-6.6,7,.08,12.8,'#b5ced6');
      this.box(-3,-.04,-6.6,7,.08,9.3,'#c9e0e5');
      this.box(4.6,-.04,-6.6,5.8,.08,9.3,'#9dbecb');
      this.box(-3,-.04,3.2,13.4,.08,3,'#b5d6cc');
      // Ground slabs must precede objects, regardless of their centroid depth.
      this.paintFaces();this.faces=[];
      // Low perimeter walls retain visibility from all camera angles.
      this.box(-11,0,-7,22,.55,.15,'#d4e3e9');this.box(-11,0,-7,.15,.55,14,'#c0d4dd');
      this.box(-3.4,0,-6.6,.12,.35,9.3,'#6d93a3');this.box(4.2,0,-6.6,.12,.35,9.3,'#6d93a3');
      const activeBySlot={general:new Map(),icu:new Map()};
      for(const p of this.state.active)activeBySlot[p.priority===0?'icu':'general'].set(this.slots.get(p.id),p);
      for(let i=0;i<Math.min(24,this.data.config.beds);i++)this.bed(-1.9+(i%4)*1.48,-5.8+Math.floor(i/4)*1.5,activeBySlot.general.get(i));
      for(let i=0;i<Math.min(12,this.data.config.icu);i++)this.bed(5.7+(i%3)*1.6,-5.4+Math.floor(i/3)*2,activeBySlot.icu.get(i));
      for(const [i,p] of this.state.waiting.slice(0,80).entries())this.person(p,-9.85+(i%8)*.73,-5.6+Math.floor(i/8)*1.08);
      const recent=this.state.finished.slice().sort((a,b)=>b.finish-a.finish||a.id-b.id).slice(0,10);
      for(const [i,p] of recent.entries())this.person(p,-1.9+i*1.12,4.65);
      this.paintFaces();
      for(const [text,x,z] of [['ESPERA',-7,6.5],['ATENCIÓN GENERAL',.5,-7.7],['UCI',7.5,-7.7],['SALIDAS',3.5,6.5]]) {
        const p=this.project(x,.2,z);ctx.font='600 12px Segoe UI';ctx.textAlign='center';
        const width=ctx.measureText(text).width;ctx.fillStyle='#102d3ae8';ctx.fillRect(p.x-width/2-9,p.y-15,width+18,23);
        ctx.fillStyle='#e3f4f8';ctx.fillText(text,p.x,p.y);
      }
      if(this.selected){const hit=this.hits.find(h=>h.p.id===this.selected.id);if(hit){ctx.beginPath();ctx.arc(hit.x,hit.y,12,0,Math.PI*2);ctx.strokeStyle='#ffffff';ctx.lineWidth=2;ctx.stroke();}}
    }
    paintFaces() {
      const ctx=this.ctx;
      this.faces.sort((a,b)=>a.depth-b.depth);
      for(const face of this.faces){ctx.beginPath();face.vertices.forEach((p,i)=>i?ctx.lineTo(p.x,p.y):ctx.moveTo(p.x,p.y));ctx.closePath();ctx.fillStyle=face.color;ctx.fill();}
    }
    pick(e) {
      const rect=this.canvas.getBoundingClientRect(),x=e.clientX-rect.left,y=e.clientY-rect.top;
      const hits=this.hits.filter(h=>Math.hypot(h.x-x,h.y-y)<Math.max(12,this.scale*.6)).sort((a,b)=>b.depth-a.depth);
      if(hits.length){this.selected=hits[0].p;this.describe(this.selected);this.draw();}
    }
    describe(p) {
      const t=this.data.result.trace[this.index].t;
      const status=p.arrival>t?'Aún no llegó':p.finish!==null&&p.finish<=t?'Finalizado':p.start!==null&&p.start<=t?'En atención':'En espera';
      const staff=status==='En atención'?` · Médico ${p.doctor} · Enfermería ${p.nurse}${p.ventilation?' · Con ventilador':''}`:'';
      this.el('scene-selection').textContent=`Paciente #${p.id} · P${p.priority} · ${status} · Llegada: ${p.arrival.toFixed(1)} min${staff}`;
    }
  }
  const api={stateAt,bedSlots,View};
  if(typeof module!=='undefined'&&module.exports)module.exports=api;
  else root.Hospital3D=api;
})(typeof window!=='undefined'?window:globalThis);
