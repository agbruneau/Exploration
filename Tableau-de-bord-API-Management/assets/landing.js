/* =============================================================================
   landing.js — Livrable B (prompt §5)
   Contenu narratif statique en HTML (fr-CA, imprimable sans JS) ; ce script
   ajoute : bascule FR/EN, bandeau KPI, cartes de simulation + mini-podiums,
   leviers, avertissement d'intégrité. Aucun réseau, aucun stockage.
============================================================================= */
let lang = "fr";

/* fabrique DOM minimale */
function el(tag, attrs, kids){
  const e = document.createElement(tag);
  if (attrs) for (const k in attrs){
    const v = attrs[k]; if (v == null) continue;
    if (k === "class") e.className = v;
    else if (k === "text") e.textContent = v;
    else if (k.startsWith("on") && typeof v === "function") e.addEventListener(k.slice(2).toLowerCase(), v);
    else e.setAttribute(k, v);
  }
  if (kids != null) [].concat(kids).forEach(c => { if (c == null) return; e.appendChild(typeof c === "string" ? document.createTextNode(c) : c); });
  return e;
}
const clear = (n) => { while (n.firstChild) n.removeChild(n.firstChild); };

/* Raison du verdict par simulation (FR / EN) */
const REASONS = {
  sim1: { fr:"Pondération chargée sur fonctionnel + architecture + sécurité (≈ 45 %) : la maturité FSI d'IBM/DataPower est récompensée. Tête de classement robuste en sensibilité.",
          en:"Weighting loaded on core + architecture + security (≈ 45%): IBM/DataPower FSI maturity is rewarded. Robust top ranking under sensitivity." },
  sim2: { fr:"Conformité et souveraineté au plus haut (C2 = 13), mais le TCO et l'expérience développeur départagent → avantage open source. 2ᵉ place (Kong vs WSO2) sensible.",
          en:"Compliance and sovereignty weighted highest (C2 = 13), but TCO and developer experience break the tie → open-source advantage. 2nd place (Kong vs WSO2) is sensitive." },
  sim3: { fr:"Architecture légère et IA chargées (50 % sur deux critères) → Kong domine. Exercice plus léger : 3 candidats, 5 critères, points absolus.",
          en:"Lightweight architecture and AI weighted heavily (50% on two criteria) → Kong dominates. Lighter exercise: 3 candidates, 5 criteria, absolute points." }
};

/* ---- i18n statique : applique data-fr / data-en ---------------------------*/
function applyStaticI18n(){
  document.documentElement.lang = lang === "fr" ? "fr-CA" : "en";
  document.querySelectorAll("[data-fr]").forEach(node => {
    const v = node.dataset[lang]; if (v != null) node.textContent = v;
  });
}

/* ---- Bandeau KPI ----------------------------------------------------------*/
function renderKpis(){
  const host = document.getElementById("kpiBand"); clear(host);
  KPIS.forEach((k, i) => {
    const [num, lbl] = k[lang];
    host.appendChild(el("div", { class:"card kpi reveal", style:`animation-delay:${i*60}ms` }, [
      el("div", { class:"num", text:num }), el("div", { class:"lbl", text:lbl })
    ]));
  });
}

/* ---- Cartes de simulation + mini-podium -----------------------------------*/
function renderSimCards(){
  const host = document.getElementById("simCards"); clear(host);
  DATA.simulations.forEach(sim => {
    const scored5 = !!sim.candidats[0].notes;
    const top3 = [...sim.candidats].sort((a,b)=>a.rang-b.rang).slice(0,3);
    const maxTotal = Math.max(...top3.map(c=>c.total));
    const winner = top3[0];

    // podium : ordre visuel 2 · 1 · 3
    const order = [top3[1], top3[0], top3[2]].filter(Boolean);
    const podium = el("div",{class:"podium"}, order.map(c=>{
      const h = 38 + (c.total / maxTotal) * 46;
      return el("div",{class:"col"},[
        el("div",{class:"pscore",text:frNum(c.total, scored5?1:0)}),
        el("div",{class:"bar",style:`height:${h}px;background:${colorFor(c.nom)};opacity:${c.rang===1?1:.68}`}),
        el("div",{class:"pname",text:shortName(c.nom)}),
        el("div",{class:"rk",text:ordinal(c.rang)})
      ]);
    }));

    const card = el("article",{class:"card simcard reveal"},[
      el("div",{class:"tool",text:`${sim.outil} · ${sim.client}`}),
      el("h3",{text:`Sim ${sim.id.slice(3)} — ${sim.gagnant}`}),
      el("div",{class:"winline"},[
        el("span",{class:"badge badge-win",text:lang==="fr"?"Gagnant":"Winner"}),
        el("span",{class:"score",text:frNum(winner.total, scored5?1:0)}),
        el("span",{class:"muted",style:"font-size:.8rem",text:"/ 100"})
      ]),
      el("p",{class:"reason",text:REASONS[sim.id][lang]}),
      podium
    ]);
    host.appendChild(card);
  });
}

/* ---- Leviers --------------------------------------------------------------*/
const LEVERS_EN = [
  { titre:"Weighting", texte:"Sim 1 loads core + architecture + security (≈ 45%) and favours IBM/DataPower FSI maturity. Sim 2 weights compliance/sovereignty highest (C2 = 13) but lets TCO and developer experience break the tie → open-source advantage (Gravitee, WSO2). Sim 3 loads lightweight architecture + AI (50% on two criteria) → Kong advantage." },
  { titre:"Shortlist",  texte:"Gravitee and WSO2 appear only in Sim 2; Azure only in Sim 1; Sim 3 keeps just 3 candidates. The pool decides the podium." },
  { titre:"Methodological rigour", texte:"Sim 1 and Sim 2 score 11 criteria with calibration and sensitivity analysis; Sim 3 is a lighter exercise (5 criteria, 3 candidates, absolute-point scores). The scales are not comparable across simulations." }
];
function renderLevers(){
  const host = document.getElementById("levers"); clear(host);
  const src = lang === "fr" ? LEVERS : LEVERS_EN;
  src.forEach((l,i) => host.appendChild(el("article",{class:"card lev reveal",style:`animation-delay:${i*60}ms`},[
    el("h3",{text:l.titre}), el("p",{text:l.texte})
  ])));
}

/* ---- Avertissement d'intégrité -------------------------------------------*/
function renderIntegrity(){
  document.getElementById("integrityBox").textContent = DATA.meta.avertissement;
}

/* ---- Bascule de langue ----------------------------------------------------*/
function renderLangToggle(){
  const lt = document.getElementById("langToggle"); clear(lt);
  ["fr","en"].forEach(l => lt.appendChild(el("button",{
    class:"btn", style:"padding:7px 12px", "aria-pressed": lang===l ? "true":"false",
    onclick:()=>{ if(lang!==l){ lang=l; renderAll(); } }
  }, l.toUpperCase())));
}

function renderAll(){
  applyStaticI18n();
  renderLangToggle();
  renderKpis();
  renderSimCards();
  renderLevers();
  renderIntegrity();
}
renderAll();
