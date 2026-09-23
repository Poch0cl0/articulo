"""Synthetic ABS-SD research engine. Not calibrated to a hospital."""
from dataclasses import dataclass, asdict
import copy
import heapq
import math, random, time

def _finite(value):
    return type(value) in (int, float) and math.isfinite(value)

def _count(value):
    return type(value) is int and value >= 0

@dataclass(frozen=True)
class Config:
    horizon: int = 480
    dt: float = 1.0
    demand: float = 1.0
    doctors: int = 8
    nurses: int = 12
    beds: int = 12
    icu: int = 4
    ventilators: int = 3
    beta: float = .25
    tau: float = 60.0
    service_scale: float = 1.0
    priority_weights: tuple[float, float, float] = (6, 3, 1)
    unfinished_penalty: float = 60.0

    def validate(self):
        if not all(_finite(getattr(self, key)) for key in
                   ('horizon', 'dt', 'demand', 'beta', 'tau', 'service_scale', 'unfinished_penalty')):
            raise ValueError('Configuration must contain finite numbers')
        if (self.horizon <= 0 or self.dt <= 0 or self.tau < self.dt or
                not 0 <= self.beta < 1 or self.demand < 0 or
                self.service_scale <= 0 or self.unfinished_penalty < 0):
            raise ValueError('Invalid numerical configuration')
        if not all(_count(getattr(self, key)) for key in
                   ('doctors', 'nurses', 'beds', 'icu', 'ventilators')):
            raise ValueError('Capacities must be nonnegative integers')
        if (not isinstance(self.priority_weights, tuple) or len(self.priority_weights) != 3 or
                not all(_finite(w) and w > 0 for w in self.priority_weights)):
            raise ValueError('priority_weights must be a tuple of three positive finite numbers')

@dataclass(frozen=True)
class Policy:
    name: str = 'priority'
    reserve: int = 0
    release: int = 0
    aging_interval: float = 60.0

    def validate(self):
        if self.name not in ('fifo', 'priority', 'tuned', 'aging'):
            raise ValueError('Unknown policy name')
        if (not _count(self.reserve) or not _finite(self.release) or self.release < 0 or
                not _finite(self.aging_interval) or self.aging_interval <= 0):
            raise ValueError('Invalid policy parameters')

    def queue_key(self, patient, t):
        if self.name == 'fifo':
            return (patient.arrival, patient.id)
        priority = patient.priority
        if self.name == 'aging':
            priority = max(0, priority - math.floor((t - patient.arrival) / self.aging_interval))
        return (priority, patient.arrival, patient.id)

@dataclass
class Patient:
    id: int
    arrival: float
    priority: int
    service: float
    ventilation: bool
    remaining: float = 0
    start: float | None = None
    finish: float | None = None
    doctor: int | None = None
    nurse: int | None = None

def generate(c, seed):
    """Piecewise Poisson arrivals; marks fixed before comparing policies."""
    c.validate()
    rng = random.Random(seed)
    result = []
    for lo, hi, rate in [(0,120,.8),(120,240,.3),(240,c.horizon,.1)]:
        hi = min(hi,c.horizon)
        if hi <= lo or c.demand == 0:
            continue
        t = lo
        while True:
            t += rng.expovariate(rate*c.demand)
            if t >= hi:
                break
            u = rng.random()
            k = 0 if u < .2 else 1 if u < .55 else 2
            work = rng.triangular(*[(30,90,60),(15,45,30),(5,25,15)][k])*c.service_scale
            result.append(Patient(len(result),t,k,work,k==0 and rng.random()<.5,work))
    return result

def simulate(c=Config(), policy=Policy(), seed=0, patients=None, trace=False):
    c.validate()
    policy.validate()
    tic = time.perf_counter()
    source=generate(c,seed) if patients is None else patients
    ps=[Patient(p.id,p.arrival,p.priority,p.service,p.ventilation,p.service) for p in source]
    if any(not _count(p.id) or not _finite(p.arrival) or not 0 <= p.arrival < c.horizon or
           not _finite(p.service) or p.service <= 0 or type(p.priority) is not int or
           p.priority not in (0,1,2) or type(p.ventilation) is not bool or
           (p.ventilation and p.priority != 0) for p in ps):
        raise ValueError('Invalid patients')
    if len(set(p.id for p in ps))!=len(ps):
        raise ValueError('Invalid patients')
    ps.sort(key=lambda p:(p.arrival,p.id))
    waiting=[]; active=[]; finished=[]; ptr=0
    fatigue=0.0; stocks=[0,0,0]; rows=[]
    areas=dict(beds=0.,icu=0.,ventilators=0.,doctors=0.,nurses=0.)
    max_queue=0; weighted_queue=0.; saturation=0.; fatigue_area=0.
    steps=math.ceil(c.horizon/c.dt)
    for step in range(steps+1):
        t=min(step*c.dt,c.horizon)
        discharged=[p for p in active if p.remaining<=1e-9]
        for p in discharged:
            p.finish=t; active.remove(p); finished.append(p)
        arrivals=0
        while ptr<len(ps) and ps[ptr].arrival<=t:
            waiting.append(ps[ptr]); ptr+=1; arrivals+=1
        starts=0
        if t<c.horizon:
            ordered=sorted(waiting,key=lambda p: policy.queue_key(p,t))
            free_d=sorted(set(range(c.doctors))-{x.doctor for x in active})
            free_n=sorted(set(range(c.nurses))-{x.nurse for x in active})
            n_icu=sum(x.priority==0 for x in active)
            n_bed=len(active)-n_icu
            n_vent=sum(x.ventilation for x in active)
            admitted=set()
            for p in ordered:
                if not free_d or not free_n:
                    break
                reserve=policy.reserve if t<policy.release and n_icu<c.icu else 0
                feasible=bool(free_d and free_n)
                if p.priority==0:
                    feasible &= n_icu<c.icu and (not p.ventilation or n_vent<c.ventilators)
                else:
                    feasible &= n_bed<c.beds and min(len(free_d),len(free_n))>reserve
                if feasible:
                    p.start=t; p.doctor=heapq.heappop(free_d); p.nurse=heapq.heappop(free_n)
                    active.append(p); admitted.add(p.id); starts+=1
                    n_icu+=p.priority==0
                    n_bed+=p.priority!=0
                    n_vent+=p.ventilation
            waiting=[p for p in waiting if p.id not in admitted]
        # Flux bookkeeping independent of aggregate recount: no duplicated people.
        stocks[0]+=arrivals-starts
        stocks[1]+=starts-len(discharged)
        stocks[2]+=len(discharged)
        assert stocks==[len(waiting),len(active),len(finished)]
        assert sum(stocks)==ptr
        used_icu=sum(p.priority==0 for p in active)
        used={'beds':len(active)-used_icu,'icu':used_icu,
              'ventilators':sum(p.ventilation for p in active),'doctors':len(active),'nurses':len(active)}
        assert all(0<=n<=getattr(c,r) for r,n in used.items())
        assert len({p.doctor for p in active})==len(active)
        assert len({p.nurse for p in active})==len(active)
        assert 0<=fatigue<=1
        if trace:
            rows.append(dict(t=t,queue=len(waiting),active=len(active),finished=len(finished),fatigue=fatigue,**used))
        max_queue=max(max_queue,len(waiting))
        if t>=c.horizon:
            break
        h=min(c.dt,c.horizon-t)
        weighted_queue+=h*sum(c.priority_weights[p.priority] for p in waiting)
        for r,n in used.items(): areas[r]+=h*n
        saturation+=h*(used_icu==c.icu and c.icu>0)
        fatigue_area+=fatigue*h
        utilization=len(active)/min(c.doctors,c.nurses) if min(c.doctors,c.nurses)>0 else 0
        speed=1-c.beta*fatigue
        for p in active: p.remaining-=speed*h
        fatigue+=h*(utilization-fatigue)/c.tau
    started=[p for p in ps if p.start is not None]
    # Censored at horizon; includes actual arrival-to-grid delay, unlike grid queue integral.
    def wait(p): return (p.start if p.start is not None else c.horizon)-p.arrival
    total_weight=sum(c.priority_weights[p.priority] for p in ps)
    loss=sum(c.priority_weights[p.priority]*(wait(p)+c.unfinished_penalty*(p.finish is None)) for p in ps)/total_weight if total_weight else 0
    metrics=dict(arrivals=len(ps),started=len(started),completed=len(finished),waiting=len(waiting),
                 in_service=len(active),wait_started=sum(wait(p) for p in started)/len(started) if started else None,
                 wait_censored=sum(wait(p) for p in ps)/len(ps) if ps else None,
                 objective=loss,max_queue=max_queue,icu_saturation=saturation/c.horizon,
                 fatigue_mean=fatigue_area/c.horizon,weighted_queue_area=weighted_queue,
                 runtime_s=time.perf_counter()-tic)
    for k in range(3):
        group=[p for p in ps if p.priority==k]
        metrics[f'wait_p{k}']=sum(wait(p) for p in group)/len(group) if group else None
        metrics[f'coverage_p{k}']=sum(p.start is not None for p in group)/len(group) if group else None
    for r,a in areas.items(): metrics[f'util_{r}']=a/(getattr(c,r)*c.horizon) if getattr(c,r)>0 else None
    return dict(metrics=metrics,patients=[asdict(p) for p in ps],trace=rows)

class Shadow:
    """Versioned synthetic snapshot receiver, deliberately not a hospital connector."""
    def __init__(self):
        self.version=-1; self.state=None; self.seen=set()
    def apply(self,event):
        if (not isinstance(event, dict) or not isinstance(event.get('id'), str) or
                not event['id'].strip() or not _count(event.get('version'))):
            raise ValueError('Snapshot requires a nonempty string id and a nonnegative integer version')
        if event['id'] in self.seen: return 'duplicate'
        if event['version']<=self.version: return 'stale'
        state=event.get('state')
        if not isinstance(state, dict):
            raise ValueError('Invalid snapshot state')
        cap=state.get('capacity'); occupancy=state.get('occupancy')
        if not isinstance(cap, dict) or not isinstance(occupancy, dict):
            raise ValueError('Snapshot requires capacity and occupancy mappings')
        if (set(cap)!=set(occupancy) or any(not isinstance(k,str) or not k for k in cap) or
                any(not _count(v) for v in [*cap.values(),*occupancy.values()])):
            raise ValueError('Invalid snapshot')
        if any(occupancy[k]>cap[k] for k in cap): raise ValueError('Overcapacity')
        self.state=copy.deepcopy(state); self.version=event['version']; self.seen.add(event['id'])
        return 'accepted'
