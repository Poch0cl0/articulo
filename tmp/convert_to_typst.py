from pathlib import Path
import re,json,sys
sys.stdout.reconfigure(encoding='utf-8')
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'articulo_jefferson_martin.md').read_text(encoding='utf-8')
equations={
 'dQ/dt = λ(t) − a(t)':'(dif Q)/(dif t) = lambda(t) - a(t)',
 'dA/dt = a(t) − d(t)':'(dif A)/(dif t) = a(t) - d(t)',
 'dD/dt = d(t)':'(dif D)/(dif t) = d(t)',
 'Q(t) + A(t) + D(t) = N(t)':'Q(t) + A(t) + D(t) = N(t)',
 'Rᵣ(t) = Cᵣ − Oᵣ(t)':'R_r(t) = C_r - O_r(t)',
 'u(t) = A(t)/min(M, E)':'u(t) = A(t)/min(M, E)',
 'dF/dt = [u(t) − F(t)]/τ; F(0) = 0.':'(dif F)/(dif t) = (u(t) - F(t))/tau; quad F(0) = 0.',
 'F(t + Δt) = F(t) + (Δt/τ)[u(t) − F(t)].':'F(t + Delta t) = F(t) + (Delta t)/tau [u(t) - F(t)].',
 'v(t) = 1 − βF(t).':'v(t) = 1 - beta F(t).',
 'bᵢ(t + Δt) = bᵢ(t) − v(t)Δt':'b_i(t + Delta t) = b_i(t) - v(t) Delta t',
 'Σᵢ aᵢᵣxᵢ(t) ≤ Cᵣ; xᵢ(t) ∈ {0, 1}.':'sum_i a_(i r) x_i(t) <= C_r; quad x_i(t) in {0, 1}.',
 'Wᵢᴴ = min(sᵢ, H) − tᵢ':'W_i^H = min(s_i, H) - t_i',
 'J(θ) = [Σᵢ wᵢ{Wᵢᴴ + 60·I(lᵢ > H)}]/Σᵢ wᵢ.':'J(theta) = (sum_i w_i {W_i^H + 60 dot I(l_i > H)})/(sum_i w_i).',
 'media ± 2,04523·s/√30':'"media" plus.minus 2.04523 dot s/sqrt(30)',
}
symbols={'aᵢᵣ':'a_(i r)','Wᵢᴴ':'W_i^H','sᵢ':'s_i','tᵢ':'t_i','lᵢ':'l_i','wᵢ':'w_i','xᵢ':'x_i','bᵢ':'b_i','tᵣ':'t_r','Cᵣ':'C_r','Oᵣ':'O_r','Rᵣ':'R_r'}
symbols.update({
 'Σ O_general(t)Δt / [C_general·H]':'(sum O_("general")(t) Delta t)/(C_("general") dot H)',
 'Σ O_UCI(t)Δt / [C_UCI·H]':'(sum O_("UCI")(t) Delta t)/(C_("UCI") dot H)',
 'Σ Oᵣ(t)Δt / [Cᵣ·H]':'(sum O_r(t) Delta t)/(C_r dot H)',
 'Σ I[O_UCI(t) = C_UCI]Δt/H':'(sum I[O_("UCI")(t) = C_("UCI")] Delta t)/H',
 'C_UCI > 0':'C_("UCI") > 0',
 'sᵢ − tᵢ':'s_i - t_i', 'sᵢ < H':'s_i < H', 'lᵢ ≤ H':'l_i <= H',
})
def escape(t):
    return re.sub(r'([\\#$@\[\]<>_*])',r'\\\1',t)
def plain(t):
    pat='('+ '|'.join(map(re.escape,sorted(symbols,key=len,reverse=True)))+')'
    return ''.join('$'+symbols[p]+'$' if p in symbols else escape(p) for p in re.split(pat,t))
def inline(t):
    pattern=r'\[([^\]]+)\]\(([^)]+)\)|\*\*(.+?)\*\*|\*([^*]+)\*'
    out=[]; last=0
    for m in re.finditer(pattern,t):
        out.append(plain(t[last:m.start()]))
        if m.group(1): out.append('#link('+json.dumps(m.group(2))+')['+plain(m.group(1))+']')
        elif m.group(3):
            val=m.group(3)
            out.append('$'+equations[val]+'$' if val in equations else '*'+plain(val)+'*')
        else: out.append('_'+plain(m.group(4))+'_')
        last=m.end()
    out.append(plain(t[last:])); return ''.join(out)

preamble='''// Conversión íntegra de articulo_jefferson_martin.md.
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

'''
lines=source.splitlines(); output=[]; i=0; tables=0
while i<len(lines):
    line=lines[i]
    if line.startswith('|'):
        block=[]
        while i<len(lines) and lines[i].startswith('|'):
            block.append([c.strip() for c in lines[i].strip('|').split('|')]); i+=1
        header=block[0]; rows=block[2:]; tables+=1
        widths={1:'(1.0fr, 1.15fr, 1.35fr)',2:'(0.7fr, 1.45fr, 1.65fr)',3:'(0.9fr, 1.65fr, 1.45fr)',
                4:'(0.85fr, 1.7fr, 1.45fr)',5:'(0.9fr, 1.25fr, 0.75fr, 1.2fr)',6:'(0.9fr, 1fr, 1.1fr, 1.15fr)',
                7:'(2fr, 0.7fr, 1.3fr)',8:'(1.1fr, 1.8fr, 1.1fr)'}[tables]
        table=['#block(breakable: true)[','#set text(size: 9pt)','#set par(justify: false, leading: 0.5em)',
               '#table(',f'  columns: {widths},','  fill: (x, y) => if y == 0 { rgb("e9edf1") } else { none },',
               '  table.header('+', '.join('[*'+inline(h)+'*]' for h in header)+'),']
        table += ['  '+', '.join('['+inline(c)+']' for c in row)+',' for row in rows]
        table+=[')',']','']; output.extend(table); continue
    if line.startswith('#'):
        m=re.match(r'(#+) (.*)',line); output.append('='*len(m.group(1))+' '+inline(m.group(2)))
    elif line.startswith('**Tabla '):
        output.append('#block(sticky: true, below: 0.45em)['+inline(line)+']')
    elif line.startswith('**') and line.endswith('**') and line[2:-2] in equations:
        output.append('$ '+equations[line[2:-2]]+' $')
    else: output.append(inline(line))
    i+=1
target=ROOT/'articulo_jefferson_martin.typ'
target.write_text(preamble+'\n'.join(output)+'\n',encoding='utf-8')
assert tables==8
sys.path.insert(0,str(ROOT/'tmp/typst_runtime'))
import typst
try:
    pages,warnings=typst.compile_with_warnings(str(target),format='png',ppi=90)
except typst.TypstError as e:
    print(e.diagnostic); raise
if isinstance(pages,bytes): pages=[pages]
qa=ROOT/'tmp/typst_qa'; qa.mkdir(exist_ok=True)
for n,page in enumerate(pages,1): (qa/f'page-{n:02d}.png').write_bytes(page)
print(json.dumps({'tables':tables,'pages':len(pages),'warnings':[str(w) for w in warnings]},ensure_ascii=False))
