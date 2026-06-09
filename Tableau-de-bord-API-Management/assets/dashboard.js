/* =============================================================================
   dashboard.js — Livrable A (prompt §4)
   État 100 % en mémoire (aucun localStorage / sessionStorage). Aucun réseau.
   Sélecteurs : simulation active · scénario de pondération · focus (≤ 3).
============================================================================= */

/* ---- i18n (fr-CA par défaut ; bascule EN souhaitable, non bloquante §6) --- */
const I18N = {
  fr: {
    brandSub:"Tableau de bord exécutif — juin 2026",
    metaTab:"Vue méta", scenario:"Pondération", focus:"Focus (max 3)", landing:"Présentation",
    pRank:"Classement", pRadar:"Radar des critères", pHeat:"Carte de chaleur",
    pSens:"Analyse de sensibilité", pRes:"Réserves & PoC — à vérifier",
    recoTitle:"Recommandation du comité", recoHint:"Verdict décisif — profil souveraineté d'abord",
    recoWhy:"Pourquoi Kong", recoGates:"Départage par PoC — go / no-go",
    recoFlip:"Conditions qui renversent", recoShortlist:"Shortlist",
    seeCrit:"Voir les critères", hideCrit:"Masquer les critères", all:"Tous",
    tool:"Outil", client:"Client", winnerLbl:"Gagnant", scaleLbl:"Échelle",
    metaLead:"Le gagnant dépend du cadrage", why:"Pourquoi les verdicts diffèrent",
    nonComp:"Avertissement : Sim 3 est un exercice plus léger (3 candidats, 5 critères, points absolus) — à ne jamais mélanger aux notes /5 des Sim 1 et 2.",
    robust:"Classement de tête robuste", sensitive:"2ᵉ place sensible (Kong vs WSO2)",
    heatHint5:"Du neutre à l’orange selon la note /5",
    heatHintPts:"Du neutre à l’orange selon points / poids",
    radarHint5:"Polygones des candidats en focus — échelle 0–5",
    radarHintPts:"Points normalisés par poids — exercice léger",
    metaHint:"Rang par simulation — scores affichés mais jamais fusionnés",
    critere:"Critère", poids:"Poids", total:"Total / 100", rang:"Rang",
    noStore:"Aucune donnée n’est conservée par le navigateur (état en mémoire seulement).",
    leadSuffix:"mène ce cadrage"
  },
  en: {
    brandSub:"Executive dashboard — June 2026",
    metaTab:"Meta view", scenario:"Weighting", focus:"Focus (max 3)", landing:"Overview",
    pRank:"Ranking", pRadar:"Criteria radar", pHeat:"Heatmap",
    pSens:"Sensitivity analysis", pRes:"Reservations & PoC — to verify",
    recoTitle:"Committee recommendation", recoHint:"Decisive verdict — sovereignty-first profile",
    recoWhy:"Why Kong", recoGates:"PoC decision gates — go / no-go",
    recoFlip:"Conditions that flip the verdict", recoShortlist:"Shortlist",
    seeCrit:"Show criteria", hideCrit:"Hide criteria", all:"All",
    tool:"Tool", client:"Client", winnerLbl:"Winner", scaleLbl:"Scale",
    metaLead:"The winner depends on the framing", why:"Why the verdicts differ",
    nonComp:"Warning: Sim 3 is a lighter exercise (3 candidates, 5 criteria, absolute points) — never mix with the /5 scores of Sim 1 and 2.",
    robust:"Robust top ranking", sensitive:"2nd place is sensitive (Kong vs WSO2)",
    heatHint5:"Neutral → orange by /5 score",
    heatHintPts:"Neutral → orange by points / weight",
    radarHint5:"Focused candidates’ polygons — scale 0–5",
    radarHintPts:"Points normalised by weight — light exercise",
    metaHint:"Rank per simulation — scores shown but never merged",
    critere:"Criterion", poids:"Weight", total:"Total / 100", rang:"Rank",
    noStore:"No data is stored by the browser (in-memory state only).",
    leadSuffix:"leads this framing"
  }
};
const SIM_TABS = { sim1:"Sim 1 · GFB", sim2:"Sim 2 · BBQ", sim3:"Sim 3 · Gemini" };

/* ---- État ---------------------------------------------------------------- */
const state = { sim:"sim1", scenario:0, focus:[], lang:"fr", showCrit:false, resFilter:"all" };
const T = () => I18N[state.lang];
const simById = (id) => DATA.simulations.find(s => s.id === id);
const candByName = (sim, name) => sim.candidats.find(c => c.nom === name);
const isScored5 = (sim) => !!sim.candidats[0].notes;       // Sim 1/2 (notes /5) vs Sim 3 (points)

/* ---- petite fabrique DOM ------------------------------------------------- */
function el(tag, attrs, kids){
  const e = document.createElement(tag);
  if (attrs) for (const k in attrs){
    const v = attrs[k];
    if (v == null) continue;
    if (k === "class") e.className = v;
    else if (k === "text") e.textContent = v;
    else if (k.startsWith("on") && typeof v === "function") e.addEventListener(k.slice(2).toLowerCase(), v);
    else e.setAttribute(k, v);
  }
  if (kids != null) [].concat(kids).forEach(c => { if (c == null) return; e.appendChild(typeof c === "string" ? document.createTextNode(c) : c); });
  return e;
}
const clear = (node) => { while (node.firstChild) node.removeChild(node.firstChild); };

/* ---- focus par défaut = 3 premiers (par rang) de la simulation ----------- */
function initFocus(sim){
  state.focus = [...sim.candidats].sort((a,b)=>a.rang-b.rang).slice(0,3).map(c=>c.nom);
}

/* =============================================================================
   Rendu — chrome (barre, KPI, sélecteurs, pied)
============================================================================= */
function renderChrome(){
  document.documentElement.lang = state.lang === "fr" ? "fr-CA" : "en";
  document.getElementById("brandSub").textContent = T().brandSub;
  document.getElementById("toLanding").textContent = T().landing;

  // Onglets de simulation
  const tabs = document.getElementById("simTabs"); clear(tabs);
  const tabDefs = [["sim1",SIM_TABS.sim1],["sim2",SIM_TABS.sim2],["sim3",SIM_TABS.sim3],["meta",T().metaTab]];
  tabDefs.forEach(([id,label]) => {
    const active = state.sim === id;
    tabs.appendChild(el("button", {
      class:"btn", "aria-pressed": active ? "true":"false",
      onclick:()=>{ if(state.sim===id) return; state.sim=id; state.scenario=0; state.showCrit=false; if(id!=="meta") initFocus(simById(id)); render(); }
    }, label));
  });

  // Bascule de langue
  const lt = document.getElementById("langToggle"); clear(lt);
  ["fr","en"].forEach(l => lt.appendChild(el("button", {
    class:"btn", "aria-pressed": state.lang===l ? "true":"false", style:"padding:7px 12px",
    onclick:()=>{ if(state.lang!==l){ state.lang=l; render(); } }
  }, l.toUpperCase())));

  // KPI
  const kpi = document.getElementById("kpiBand"); clear(kpi);
  KPIS.forEach((k,i) => {
    const [num,lbl] = k[state.lang];
    kpi.appendChild(el("div", { class:"card kpi reveal", style:`animation-delay:${i*60}ms` }, [
      el("div",{class:"num",text:num}), el("div",{class:"lbl",text:lbl})
    ]));
  });

  // Sélecteur de scénario (Sim 1/2 seulement)
  const sc = document.getElementById("scenarioCtrl"); clear(sc);
  if (state.sim !== "meta" && simById(state.sim).sensibilite){
    const sim = simById(state.sim);
    sc.appendChild(el("span",{class:"lbl",text:T().scenario}));
    sim.sensibilite.scenarios.forEach((name,idx)=>{
      sc.appendChild(el("button",{
        class:"chip", "aria-pressed": state.scenario===idx ? "true":"false",
        onclick:()=>{ state.scenario=idx; render(); }
      }, name));
    });
  }

  // Sélecteur de focus (Sim 1/2/3)
  const fc = document.getElementById("focusCtrl"); clear(fc);
  if (state.sim !== "meta"){
    const sim = simById(state.sim);
    fc.appendChild(el("span",{class:"lbl",text:T().focus}));
    sim.candidats.forEach(c=>{
      const on = state.focus.includes(c.nom);
      fc.appendChild(el("button",{
        class:"chip", "aria-pressed": on?"true":"false",
        onclick:()=>{
          if(on) state.focus = state.focus.filter(n=>n!==c.nom);
          else if(state.focus.length < 3) state.focus.push(c.nom);
          render();
        }
      }, [ el("span",{class:"dot",style:`background:${colorFor(c.nom)}`}), shortName(c.nom) ]));
    });
  }

  // Pied — avertissement d'intégrité (§7)
  const intg = document.getElementById("integrity"); clear(intg);
  intg.appendChild(el("p",{style:"margin:0 0 6px",text:DATA.meta.avertissement}));
  intg.appendChild(el("p",{style:"margin:0",html:""},[
    document.createTextNode(T().noStore + " "),
    el("a",{href:"index.html",text:T().landing})
  ]));
}

/* =============================================================================
   Panneaux par simulation
============================================================================= */
function panelShell(title, hint, bodyKids){
  return el("section",{class:"card panel reveal"},[
    el("header",{},[ el("h3",{text:title}), hint?el("span",{class:"hint",text:hint}):null ]),
    ...[].concat(bodyKids)
  ]);
}

function contextStrip(sim){
  const t=T();
  const item=(k,v,cls)=> el("div",{},[ el("div",{class:"lbl",style:"font-size:.72rem;text-transform:uppercase;letter-spacing:.05em;color:var(--text-muted)",text:k}),
    el("div",{style:"font-weight:600;margin-top:2px",text:v, class:cls||""}) ]);
  return el("section",{class:"card panel reveal span2",style:"display:flex;flex-wrap:wrap;gap:18px 40px;align-items:center"},[
    item(t.tool, sim.outil),
    item(t.client, sim.client),
    el("div",{},[ el("div",{class:"lbl",style:"font-size:.72rem;text-transform:uppercase;letter-spacing:.05em;color:var(--text-muted)",text:t.winnerLbl}),
      el("div",{style:"margin-top:4px"},[ el("span",{class:"badge badge-win",text:sim.gagnant}) ]) ]),
    item(t.scaleLbl, sim.echelle)
  ]);
}

/* Panneau 1 — Classement */
function panelRanking(sim){
  const t=T(), dec = isScored5(sim) ? 1 : 0;
  const items = rankingItems(sim, state.scenario);
  const lead = items[0];
  const hint = `${shortName(lead.name)} ${t.leadSuffix}`;
  const body = [ barChart({ items, max:100, decimals:dec, aria:`${t.pRank} — ${sim.outil}` }) ];

  // bouton voir les critères + table
  const btn = el("button",{class:"btn",style:"margin-top:14px",
    onclick:()=>{ state.showCrit=!state.showCrit; render(); }
  }, state.showCrit ? t.hideCrit : t.seeCrit);
  body.push(btn);
  if (state.showCrit) body.push(critTable(sim));

  const p = panelShell(t.pRank, hint, body);
  return p;
}
function rankingItems(sim, scenarioIdx){
  if (sim.sensibilite){
    const v = sim.sensibilite.valeurs;
    const arr = sim.candidats.map(c=>({ name:c.nom, value:v[c.nom][scenarioIdx] }));
    arr.sort((a,b)=>b.value-a.value);
    arr.forEach((it,i)=>{ it.rang=i+1; it.winner=(i===0); });
    return arr;
  }
  return [...sim.candidats].sort((a,b)=>a.rang-b.rang)
    .map(c=>({ name:c.nom, value:c.total, rang:c.rang, winner:c.rang===1 }));
}
function critTable(sim){
  const t=T(), scored5=isScored5(sim);
  const head = el("tr",{},[ el("th",{text:t.critere}), el("th",{text:t.poids}),
    ...sim.candidats.map(c=>el("th",{text:shortName(c.nom)})) ]);
  const rows = sim.criteres.map(cr=> el("tr",{},[
    el("td",{title:`${cr.code} — ${cr.libelle}`,text:cr.libelle}),
    el("td",{text:String(cr.poids)}),
    ...sim.candidats.map(c=>{ const v = scored5 ? c.notes[cr.code] : c.points[cr.code]; return el("td",{text:fmtCell(v)}); })
  ]));
  const totalRow = el("tr",{style:"font-weight:700"},[ el("td",{text:t.total}), el("td",{text:"100"}),
    ...sim.candidats.map(c=>el("td",{style:"color:var(--orange-bright)",text:frNum(c.total, scored5?1:0)})) ]);
  const rankRow = el("tr",{},[ el("td",{text:t.rang,style:"color:var(--text-muted)"}), el("td",{text:""}),
    ...sim.candidats.map(c=>el("td",{style:"color:var(--text-muted)",text:ordinal(c.rang)})) ]);
  return el("div",{class:"crit-table"},[ el("table",{class:"data"},[ el("thead",{},head), el("tbody",{},[...rows,totalRow,rankRow]) ]) ]);
}

/* Panneau 2 — Radar */
function panelRadar(sim){
  const t=T(), scored5=isScored5(sim);
  const axes = sim.criteres.map(cr=>({code:cr.code,label:cr.libelle}));
  const series = sim.candidats.filter(c=>state.focus.includes(c.nom)).map(c=>{
    const norm=[], display=[];
    sim.criteres.forEach(cr=>{
      if (scored5){ const v=c.notes[cr.code]; norm.push(v/5); display.push(`${fmtCell(v)} / 5`); }
      else { const v=c.points[cr.code]; norm.push(v/cr.poids); display.push(`${v} / ${cr.poids} pts`); }
    });
    return { name:shortName(c.nom), color:colorFor(c.nom), norm, display };
  });
  const chart = series.length ? radarChart({axes,series,aria:`${t.pRadar} — ${sim.outil}`})
    : el("p",{class:"muted",text:"Sélectionnez au moins un candidat dans « Focus »."});
  const legend = el("div",{class:"legend"}, series.map(s=>el("span",{class:"item"},[
    el("span",{class:"sw",style:`background:${s.color}`}), s.name ])));
  return panelShell(t.pRadar, scored5?t.radarHint5:t.radarHintPts, [chart, legend]);
}

/* Panneau 3 — Heatmap */
function panelHeatmap(sim){
  const t=T(), scored5=isScored5(sim);
  const rows = sim.criteres.map(cr=>({code:cr.code,label:cr.libelle,poids:cr.poids}));
  const cols = [...sim.candidats].sort((a,b)=>a.rang-b.rang).map(c=>({name:c.nom}));
  const get = (code,name)=>{ const c=candByName(sim,name); return scored5 ? c.notes[code] : c.points[code]; };
  const chart = heatmap({
    rows, cols,
    value:(code,name)=>get(code,name),
    intensity:(code,name)=>{ const v=get(code,name); const cr=sim.criteres.find(x=>x.code===code); return scored5 ? v/5 : v/cr.poids; },
    display:(code,name)=>{ const v=get(code,name); const cr=sim.criteres.find(x=>x.code===code); return scored5 ? `${fmtCell(v)} / 5` : `${v} / ${cr.poids} pts`; },
    aria:`${t.pHeat} — ${sim.outil}`
  });
  return panelShell(t.pHeat, scored5?t.heatHint5:t.heatHintPts, [chart]);
}

/* Panneau 4 — Sensibilité (Sim 1/2) */
function panelSensitivity(sim){
  const t=T();
  const series = sim.candidats.map(c=>({
    name:c.nom, color:colorFor(c.nom),
    values:sim.sensibilite.valeurs[c.nom], emphasize:c.rang===1
  }));
  const chart = slopeChart({ scenarios:sim.sensibilite.scenarios, series, aria:`${t.pSens} — ${sim.outil}` });
  const note = sim.id==="sim1" ? t.robust : t.sensitive;
  return panelShell(t.pSens, null, [chart, el("div",{class:"annot",text:note})]);
}

/* =============================================================================
   Vue méta (§4) — l'écran le plus important
============================================================================= */
function panelMeta(){
  const t=T();
  const series = META_RANKS.map(m=>({ name:m.nom, color:colorFor(m.nom), ranks:m.ranks, scores:m.scores, emphasize:m.nom==="Kong" }));
  const chart = bumpChart({ cols:META_COLS, series, maxRank:5, aria:t.metaLead });

  // légende détaillée (désambiguïse le bump chart)
  const legend = el("div",{class:"legend",style:"margin-top:16px"}, META_RANKS.map(m=>{
    const parts = m.ranks.map((r,j)=> r==null ? "—" : `${ordinal(r)} (${m.scores[j]})`).join("  ·  ");
    return el("span",{class:"item",style:"flex-basis:100%;gap:9px"},[
      el("span",{class:"sw",style:`background:${colorFor(m.nom)}`}),
      el("b",{style:"color:var(--text);min-width:78px;display:inline-block",text:m.nom}),
      el("span",{text:parts})
    ]);
  }));

  const bump = panelShell(t.metaLead, t.metaHint, [chart, legend]);
  bump.classList.add("span2");

  // Pourquoi les verdicts diffèrent
  const why = panelShell(t.why, null, [
    el("div",{class:"why"}, LEVERS.map(l=> el("div",{class:"lever"},[
      el("b",{text:l.titre}), el("p",{text:l.texte}) ])))
  ]);
  why.classList.add("span2");

  // Avertissement de non-comparabilité
  const warn = el("section",{class:"card panel reveal span2"},[
    el("div",{class:"warnbox"},[ el("span",{class:"badge badge-warn",text:"Sim 3"}),
      el("span",{style:"margin-left:10px",text:T().nonComp}) ])
  ]);

  return [bump, why, warn];
}

/* =============================================================================
   Panneau Recommandation (consolidé dans la vue méta — écran exécutif)
============================================================================= */
function panelReco(){
  const t=T(), L=(o)=>o[state.lang], v=RECO.verdict;

  const verdict = el("div",{class:"verdict"},[
    el("div",{class:"pick"},[ document.createTextNode(v.pick), el("small",{text:L(v.tagline)}) ]),
    el("div",{class:"vbody"},[
      el("p",{class:"cond",text:L(v.condition)}),
      el("p",{class:"chal",text:L(v.challenger)}),
      el("span",{class:"basis",text:L(v.basis)})
    ])
  ]);

  const why = el("ul",{class:"reco-why"}, RECO.preuves.map(p=>el("li",{text:L(p)})));
  const tension = el("div",{class:"tension"},[ el("b",{text:L(RECO.tension.titre)}), L(RECO.tension.texte) ]);
  const gates = el("table",{class:"gate"},[ el("tbody",{}, RECO.gates.map(g=>el("tr",{},[
    el("td",{class:"cas",text:L(g.cas)}),
    el("td",{class:"nogo"},[ el("b",{text:"No-go — "}), L(g.nogo) ])
  ]))) ]);
  const flip = el("ul",{class:"flip"}, RECO.bascules.map(b=>el("li",{text:L(b)})));
  const shortlist = el("div",{class:"reco-pills"}, RECO.shortlist.map(s=>el("div",{class:"pill"},[
    el("div",{class:"nm"},[ el("span",{class:"dot",style:`background:${colorFor(s.nom)}`}), s.nom ]),
    el("div",{class:"rl",text:L(s.role)})
  ])));

  const cols1 = el("div",{class:"reco-cols"},[
    el("div",{},[ el("div",{class:"reco-h",text:t.recoWhy}), why, tension ]),
    el("div",{},[ el("div",{class:"reco-h",text:t.recoGates}), gates ])
  ]);
  const cols2 = el("div",{class:"reco-cols",style:"margin-top:8px"},[
    el("div",{},[ el("div",{class:"reco-h",text:t.recoFlip}), flip, el("p",{class:"reco-ecartes",text:L(RECO.ecartes)}) ]),
    el("div",{},[ el("div",{class:"reco-h",text:t.recoShortlist}), shortlist ])
  ]);

  const p = panelShell(t.recoTitle, t.recoHint, [
    el("p",{class:"muted",style:"max-width:74ch;margin:0 0 14px",text:L(RECO.noAbsolu)}),
    verdict, cols1, cols2
  ]);
  p.classList.add("span2");
  return p;
}

/* =============================================================================
   Panneau transversal — Réserves & PoC (§2.5)
============================================================================= */
function panelReserves(){
  const t=T();
  const chips = el("div",{class:"seg",style:"margin-bottom:14px"});
  const mk=(key,label)=> el("button",{class:"chip","aria-pressed":state.resFilter===key?"true":"false",
    onclick:()=>{ state.resFilter=key; render(); }}, label);
  chips.appendChild(mk("all", t.all));
  RESERVES.forEach(r=> chips.appendChild(mk(r.key, r.nom)));

  const shown = state.resFilter==="all" ? RESERVES : RESERVES.filter(r=>r.key===state.resFilter);
  const cards = el("div",{class:"res-grid"}, shown.map(r=> el("div",{class:"res-card"},[
    el("h4",{},[ el("span",{class:"badge badge-warn",text:"à vérifier"}), r.nom ]),
    el("ul",{}, r.points.map(p=>el("li",{text:p})))
  ])));

  const p = panelShell(t.pRes, null, [chips, cards]);
  p.classList.add("span2");
  return p;
}

/* =============================================================================
   Orchestration du rendu
============================================================================= */
function render(){
  renderChrome();
  const host = document.getElementById("panels"); clear(host);
  const grid = el("div",{class:"grid"});

  if (state.sim === "meta"){
    grid.appendChild(panelReco());
    panelMeta().forEach(p=>grid.appendChild(p));
    grid.appendChild(panelReserves());
  } else {
    const sim = simById(state.sim);
    grid.appendChild(contextStrip(sim));
    grid.appendChild(panelRanking(sim));
    grid.appendChild(panelRadar(sim));
    grid.appendChild(panelHeatmap(sim));
    if (sim.sensibilite){ const s=panelSensitivity(sim); s.classList.add("span2"); grid.appendChild(s); }
    grid.appendChild(panelReserves());
  }
  // délais d'apparition échelonnés (désactivés si prefers-reduced-motion via CSS)
  [...grid.querySelectorAll(".reveal")].forEach((n,i)=> n.style.animationDelay = (i*55)+"ms");
  host.appendChild(grid);
}

/* ---- Démarrage ----------------------------------------------------------- */
initFocus(simById(state.sim));
render();
