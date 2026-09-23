// Run: node motor/test_hospital3d.cjs (Python must be available).
const assert=require('node:assert/strict');
const {spawnSync}=require('node:child_process');
const {stateAt,bedSlots}=require('./web/hospital3d.js');
const script=`import json
from dataclasses import asdict
from motor import Config, Policy, simulate
cases=[(Config(),Policy()),(Config(dt=.7,horizon=50.5),Policy('aging')),
       (Config(demand=0),Policy()),(Config(doctors=0,horizon=30),Policy()),
       (Config(demand=5,horizon=120),Policy('tuned',2,60))]
print(json.dumps([dict(config=asdict(c),result=simulate(c,p,42,trace=True)) for c,p in cases]))`;
const proc=spawnSync('python',['-c',script],{encoding:'utf8',cwd:require('node:path').resolve(__dirname,'..'),maxBuffer:10*1024*1024});
assert.equal(proc.status,0,proc.stderr);
let steps=0;
for(const {config,result} of JSON.parse(proc.stdout)) {
  const slots=bedSlots(result.patients);
  for(const row of result.trace.slice().reverse()) {
    const state=stateAt(result.patients,row.t);
    assert.equal(state.waiting.length,row.queue);
    assert.equal(state.active.length,row.active);
    assert.equal(state.finished.length,row.finished);
    for(const [critical,capacity] of [[true,config.icu],[false,config.beds]]) {
      const used=state.active.filter(p=>(p.priority===0)===critical).map(p=>slots.get(p.id));
      assert.equal(new Set(used).size,used.length);
      assert.ok(used.every(slot=>slot>=0&&slot<capacity));
    }
    steps++;
  }
}
const ps=[{id:0,priority:2,arrival:0,start:0,finish:5},{id:1,priority:2,arrival:1,start:5,finish:null}];
assert.equal(bedSlots(ps).get(0),bedSlots(ps).get(1));
assert.deepEqual(stateAt(ps,5).active.map(p=>p.id),[1]);
assert.deepEqual(stateAt(ps,5).finished.map(p=>p.id),[0]);
console.log('3D state and bed allocation verified against '+steps+' engine snapshots across five scenarios.');
