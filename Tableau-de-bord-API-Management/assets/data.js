/* =============================================================================
   data.js — SOURCE UNIQUE DE VÉRITÉ (prompt §2.6, reproduite verbatim)
   -----------------------------------------------------------------------------
   Règle absolue : n'utiliser QUE ces chiffres. Aucune extrapolation, aucune
   moyenne inter-simulations (échelles incomparables). Libellés condensés pour
   l'affichage data-viz (forme longue dans le RFP de chaque simulation).
   Chargé en <script> classique (pas de module ES) → fonctionne en file://.
============================================================================= */

/* ---- Jeu de données canonique (§2.6) ------------------------------------- */
const DATA = {
  "meta": {
    "titre": "Sélection d'une plateforme d'API Management — méta-analyse de trois évaluations",
    "date": "juin 2026",
    "constat": "Trois cadrages, trois verdicts. Kong jamais sous la 2e place.",
    "avertissement": "Organisation cliente fictive ; réponses fournisseurs simulées à partir de capacités produit publiques vérifiées (juin 2026) ; prix indicatifs et non contractuels ; éléments incertains marqués « à vérifier »."
  },
  "simulations": [
    {
      "id": "sim1", "outil": "Claude Cowork Max", "client": "Groupe Financier Boréal (GFB)",
      "echelle": "notes /5, total /100", "gagnant": "IBM API Connect",
      "criteres": [
        {"code":"C1","libelle":"Fonctionnel cœur","poids":15},
        {"code":"C2","libelle":"Architecture & hybride","poids":15},
        {"code":"C3","libelle":"Sécurité","poids":15},
        {"code":"C4","libelle":"Conformité & souveraineté","poids":12},
        {"code":"C5","libelle":"Performance","poids":8},
        {"code":"C6","libelle":"Observabilité","poids":6},
        {"code":"C7","libelle":"Événementiel & GraphQL","poids":6},
        {"code":"C8","libelle":"IA/LLM & agentique","poids":7},
        {"code":"C9","libelle":"Exp. dév & gouvernance","poids":6},
        {"code":"C10","libelle":"TCO & commercial","poids":6},
        {"code":"C11","libelle":"Écosystème & pérennité","poids":4}
      ],
      "candidats": [
        {"nom":"IBM API Connect","total":93.7,"rang":1,"notes":{"C1":5,"C2":5,"C3":5,"C4":5,"C5":4.5,"C6":4,"C7":4.5,"C8":4.5,"C9":4,"C10":3.5,"C11":5}},
        {"nom":"Kong Konnect","total":88.5,"rang":2,"notes":{"C1":4,"C2":5,"C3":4.5,"C4":3.5,"C5":5,"C6":4.5,"C7":4.5,"C8":5,"C9":4.5,"C10":4,"C11":4.5}},
        {"nom":"Google Apigee","total":87.4,"rang":3,"notes":{"C1":5,"C2":4.5,"C3":4.5,"C4":4,"C5":4.5,"C6":4.5,"C7":3,"C8":5,"C9":4,"C10":3.5,"C11":4.5}},
        {"nom":"Salesforce MuleSoft","total":86.1,"rang":4,"notes":{"C1":5,"C2":4.5,"C3":4,"C4":4.5,"C5":4,"C6":4,"C7":4.5,"C8":4,"C9":4.5,"C10":3,"C11":4.5}},
        {"nom":"Microsoft Azure APIM","total":82.9,"rang":5,"notes":{"C1":4,"C2":3.5,"C3":4.5,"C4":4.5,"C5":4,"C6":4.5,"C7":4,"C8":4.5,"C9":4,"C10":4,"C11":4.5}}
      ],
      "sensibilite": {
        "scenarios": ["Base","Cloud-first","Souveraineté max"],
        "valeurs": {
          "IBM API Connect":[93.7,91.5,94.6],
          "Kong Konnect":[88.5,88.4,88.0],
          "Google Apigee":[87.4,86.5,87.2],
          "Salesforce MuleSoft":[86.1,84.9,87.0],
          "Microsoft Azure APIM":[82.9,83.0,82.7]
        }
      }
    },
    {
      "id": "sim2", "outil": "Claude Code Ultracode", "client": "Banque Boréale du Québec (BBQ)",
      "echelle": "notes /5, total /100", "gagnant": "Gravitee",
      "criteres": [
        {"code":"C1","libelle":"Sécurité","poids":12},
        {"code":"C2","libelle":"Conformité & souveraineté","poids":13},
        {"code":"C3","libelle":"Architecture hybride","poids":12},
        {"code":"C4","libelle":"Fonctionnel cœur","poids":11},
        {"code":"C5","libelle":"Gouvernance & catalogue","poids":9},
        {"code":"C6","libelle":"Performance","poids":7},
        {"code":"C7","libelle":"Observabilité","poids":7},
        {"code":"C8","libelle":"Événementiel","poids":6},
        {"code":"C9","libelle":"IA/agentique","poids":7},
        {"code":"C10","libelle":"Expérience dév","poids":8},
        {"code":"C11","libelle":"TCO & écosystème","poids":8}
      ],
      "candidats": [
        {"nom":"Gravitee","total":75.4,"rang":1,"notes":{"C1":4,"C2":3,"C3":4,"C4":4,"C5":3,"C6":3,"C7":4,"C8":5,"C9":4,"C10":4,"C11":4}},
        {"nom":"Kong","total":73.0,"rang":2,"notes":{"C1":4,"C2":3,"C3":4,"C4":4,"C5":4,"C6":4,"C7":4,"C8":3,"C9":4,"C10":3,"C11":3}},
        {"nom":"WSO2","total":72.2,"rang":3,"notes":{"C1":3,"C2":4,"C3":4,"C4":4,"C5":4,"C6":3,"C7":3,"C8":3,"C9":3,"C10":4,"C11":4}},
        {"nom":"IBM","total":71.0,"rang":4,"notes":{"C1":4,"C2":4,"C3":4,"C4":4,"C5":4,"C6":3,"C7":3,"C8":4,"C9":3,"C10":3,"C11":2}},
        {"nom":"Google Cloud Apigee","total":61.6,"rang":5,"notes":{"C1":4,"C2":2,"C3":2,"C4":4,"C5":4,"C6":3,"C7":3,"C8":2,"C9":4,"C10":4,"C11":2}}
      ],
      "sensibilite": {
        "scenarios": ["Base","Souveraineté+","Coût & DX+"],
        "valeurs": {
          "Gravitee":[75.4,74.9,75.7],
          "Kong":[73.0,72.7,72.0],
          "WSO2":[72.2,72.0,72.8],
          "IBM":[71.0,71.8,69.4],
          "Google Cloud Apigee":[61.6,61.4,61.5]
        }
      }
    },
    {
      "id": "sim3", "outil": "Gemini Deep Think", "client": "Entreprise générique",
      "echelle": "points absolus par poids, total /100 — exercice plus léger, NON comparable aux Sim 1/2",
      "gagnant": "Kong Enterprise",
      "criteres": [
        {"code":"G1","libelle":"Architecture & multi-cloud","poids":25},
        {"code":"G2","libelle":"Sécurité, conformité & AI Gateway","poids":25},
        {"code":"G3","libelle":"Monétisation & portail dév.","poids":20},
        {"code":"G4","libelle":"APIOps & observabilité","poids":15},
        {"code":"G5","libelle":"TCO & modèle économique","poids":15}
      ],
      "candidats": [
        {"nom":"Kong Enterprise","total":94,"rang":1,"points":{"G1":25,"G2":25,"G3":16,"G4":14,"G5":14}},
        {"nom":"Apigee (Google)","total":85,"rang":2,"points":{"G1":18,"G2":23,"G3":20,"G4":14,"G5":10}},
        {"nom":"MuleSoft","total":72,"rang":3,"points":{"G1":16,"G2":19,"G3":15,"G4":13,"G5":9}}
      ]
    }
  ]
};

/* ---- Palette data-viz (§3.4) — Kong toujours orange (fil conducteur) ------ */
const C = {
  Kong:"#F97316", IBM:"#60A5FA", Gravitee:"#34D399",
  Apigee:"#FBBF24", MuleSoft:"#A78BFA", WSO2:"#FB7185", Azure:"#22D3EE"
};

/* Les noms de candidats varient selon la simulation (« Kong Konnect », « Kong »,
   « Kong Enterprise »…). On rattache chaque nom à une couleur stable. */
function colorFor(nom){
  const n = (nom || "").toLowerCase();
  if (n.includes("kong"))     return C.Kong;
  if (n.includes("ibm"))      return C.IBM;
  if (n.includes("gravitee")) return C.Gravitee;
  if (n.includes("apigee"))   return C.Apigee;
  if (n.includes("mulesoft")) return C.MuleSoft;
  if (n.includes("wso2"))     return C.WSO2;
  if (n.includes("azure"))    return C.Azure;
  return "#9AA0AB";
}

/* ---- Bandeau de KPI (§4 / §5) -------------------------------------------- */
const KPIS = [
  { fr:["3","simulations"],            en:["3","simulations"] },
  { fr:["3","gagnants distincts"],     en:["3","distinct winners"] },
  { fr:["< 2ᵉ","Kong jamais en deçà"], en:["< 2nd","Kong never below"] },
  { fr:["PoC","arbitre final"],        en:["PoC","final arbiter"] }
];

/* ---- Vue méta : cohérence inter-simulations sur les RANGS (§2.4) ---------- */
/* scores conservés comme libellés exacts (jamais fusionnés/moyennés). */
const META_RANKS = [
  { nom:"Kong",       ranks:[2, 2, 1],       scores:["88,5","73,0","94"] },
  { nom:"IBM",        ranks:[1, 4, null],    scores:["93,7","71,0",null] },
  { nom:"Apigee",     ranks:[3, 5, 2],       scores:["87,4","61,6","85"] },
  { nom:"MuleSoft",   ranks:[4, null, 3],    scores:["86,1",null,"72"] },
  { nom:"Gravitee",   ranks:[null, 1, null], scores:[null,"75,4",null] },
  { nom:"WSO2",       ranks:[null, 3, null], scores:[null,"72,2",null] },
  { nom:"Azure APIM", ranks:[5, null, null], scores:["82,9",null,null] }
];
const META_COLS = ["Sim 1 · GFB", "Sim 2 · BBQ", "Sim 3 · Gemini"];

/* ---- Les trois leviers de divergence (§1) -------------------------------- */
const LEVERS = [
  {
    titre:"La pondération",
    texte:"Sim 1 charge le bloc fonctionnel + architecture + sécurité (≈ 45 %) et favorise la maturité FSI d'IBM/DataPower. Sim 2 met conformité/souveraineté au plus haut (C2 = 13) mais laisse le TCO et l'expérience développeur départager → avantage open source (Gravitee, WSO2). Sim 3 charge architecture légère + IA (50 % sur deux critères) → avantage Kong."
  },
  {
    titre:"La shortlist",
    texte:"Gravitee et WSO2 n'existent que dans Sim 2 ; Azure que dans Sim 1 ; Sim 3 ne retient que 3 candidats. Le pool conditionne le podium."
  },
  {
    titre:"La rigueur méthodologique",
    texte:"Sim 1 et Sim 2 notent 11 critères avec calibrage et analyse de sensibilité ; Sim 3 est un exercice plus léger (5 critères, 3 candidats, scores en points absolus). Les échelles ne sont pas comparables entre simulations."
  }
];

/* ---- Réserves « à vérifier » par candidat (§2.5) ------------------------- */
const RESERVES = [
  { key:"IBM", nom:"IBM", points:[
    "Complexité d'exploitation (OpenShift).",
    "TCO / sur-licenciement CP4I (> 50 % observé).",
    "Convergence API Connect / webMethods récente.",
    "Région Reserved Instance Canada à confirmer.",
    "Maturité IA/MCP en production."
  ]},
  { key:"Kong", nom:"Kong", points:[
    "Région du plan de contrôle Konnect SaaS au Canada non confirmée (option self-managed recommandée).",
    "FIPS 140-2 non validé CMVP.",
    "SOC 2 / ISO 27001 à confirmer en source primaire.",
    "Pas de WAF natif.",
    "Prévisibilité tarifaire (composante par requête)."
  ]},
  { key:"Gravitee", nom:"Gravitee", points:[
    "SOC 2 Type II / PCI-DSS / Protected B non confirmés publiquement.",
    "Région cloud souveraine canadienne non confirmée.",
    "BYOK/HYOK et audit immuable = propriétés d'architecture.",
    "Taille d'éditeur intermédiaire (diligence B-10)."
  ]},
  { key:"Apigee", nom:"Apigee", points:[
    "Plan de contrôle non installable on-prem / souverain (écart majeur).",
    "Survivabilité hors-ligne partielle.",
    "Résidence Canada du plan de contrôle à vérifier.",
    "Événementiel natif faible."
  ]},
  { key:"MuleSoft", nom:"MuleSoft", points:[
    "TCO élevé / tarification opaque (Flows + Messages).",
    "Surcharge JVM.",
    "FIPS 140-2 on-prem à confirmer."
  ]},
  { key:"WSO2", nom:"WSO2", points:[
    "Certifications portées par l'exploitant (pas l'éditeur) en auto-hébergé.",
    "Sécurité API avancée partielle.",
    "Masquage PII via tiers potentiellement hors Canada.",
    "Forte exigence de maturité d'ingénierie interne."
  ]},
  { key:"Azure", nom:"Azure APIM", points:[
    "Self-hosted gateway limité au palier Premium classique.",
    "Plan de contrôle exclusivement Azure.",
    "Pas d'air-gap permanent.",
    "Lacunes des workspaces."
  ]}
];

/* ---- Recommandation exécutive consolidée (issue de la méta-analyse) -------
   Verdict décisif pour le profil cible « FSI canadienne, souveraineté d'abord ».
   Bilingue (fr/en). Rendu à l'identique dans la landing (§7) et la vue méta. */
const RECO = {
  verdict: {
    pick: "Kong",
    tagline:   { fr:"Tête de file d'un PoC à deux finalistes", en:"Lead of a two-finalist PoC" },
    condition: { fr:"Recommandation conditionnelle — ne tient que si le PoC valide la résidence canadienne du plan de contrôle (option self-managed), la conformité (FIPS 140-2/CMVP, SOC 2/ISO 27001) et la couverture WAF.",
                 en:"Conditional recommendation — holds only if the PoC validates a Canada-resident control plane (self-managed option), compliance (FIPS 140-2/CMVP, SOC 2/ISO 27001) and WAF coverage." },
    basis:     { fr:"Seul candidat jamais sous la 2ᵉ place (2ᵉ · 2ᵉ · 1ᵉʳ) : choix de moindre regret.",
                 en:"The only candidate never below 2nd place (2nd · 2nd · 1st): the lowest-regret choice." },
    challenger:{ fr:"IBM API Connect — challenger « souveraineté prouvée ».",
                 en:"IBM API Connect — designated “proven-sovereignty” challenger." }
  },
  noAbsolu: { fr:"Il n'existe pas de « meilleur » absolu : trois cadrages désignent trois gagnants. Ce verdict vaut pour le profil cible et un budget de PoC donnés.",
              en:"There is no absolute “best”: three framings name three winners. This verdict holds for the target profile and a given PoC budget." },
  preuves: [
    { fr:"Meilleur plancher de rang : 2ᵉ (88,5) · 2ᵉ (73,0) · 1ᵉʳ (94). IBM et Gravitee ne gagnent que sous leur propre cadrage.",
      en:"Best rank floor: 2nd (88.5) · 2nd (73.0) · 1st (94). IBM and Gravitee win only under their own framing." },
    { fr:"Stable sous toutes les pondérations testées : Sim 1 88,5 / 88,4 / 88,0 ; Sim 2 73,0 / 72,7 / 72,0. Seule fragilité : la 2ᵉ place Sim 2 cède à WSO2 sous « Coût & DX+ » (WSO2 72,8 > Kong 72,0).",
      en:"Stable under every weighting tested: Sim 1 88.5 / 88.4 / 88.0; Sim 2 73.0 / 72.7 / 72.0. Only fragility: its Sim 2 2nd place yields to WSO2 under “Cost & DX+” (WSO2 72.8 > Kong 72.0)." },
    { fr:"Axes modernes en tête : architecture & hybride 5/5 (à égalité IBM), IA 5/5 (à égalité Apigee), Sim 3 = 94.",
      en:"Leads the modern axes: hybrid architecture 5/5 (tied with IBM), AI 5/5 (tied with Apigee), Sim 3 = 94." },
    { fr:"Risque résiduel vérifiable, non structurel : région Konnect, FIPS, SOC 2, WAF — adressables en PoC (mitigation self-managed nommée).",
      en:"Residual risk is verifiable, not structural: Konnect region, FIPS, SOC 2, WAF — addressable in a PoC (named self-managed mitigation)." }
  ],
  tension: { titre:{ fr:"Tension à arbitrer", en:"Tension to arbitrate" },
    texte:{ fr:"Sur le critère « souveraineté » lui-même, c'est IBM qui mène (Sim 1 C4 : IBM 5 vs Kong 3,5, le plus bas ; sous le scénario « Souveraineté max », IBM repasse 1ᵉʳ à 94,6 et Kong tombe à 88,0). Recommander Kong, c'est parier que son déficit souverain se comble en self-managed — un pari qui se tranche en PoC, pas sur dossier.",
            en:"On the “sovereignty” criterion itself, IBM leads (Sim 1 C4: IBM 5 vs Kong 3.5, the lowest; under the “Sovereignty max” scenario IBM returns to 1st at 94.6 while Kong drops to 88.0). Recommending Kong means betting its sovereignty gap is closed self-managed — a bet settled in a PoC, not on paper." } },
  gates: [
    { cas:{ fr:"Souveraineté & survivabilité hors-ligne", en:"Sovereignty & offline survivability" },
      nogo:{ fr:"le plan de contrôle ne peut résider/survivre au Canada hors-ligne (air-gap)", en:"the control plane cannot reside/survive in Canada offline (air-gap)" } },
    { cas:{ fr:"Conformité certifiée", en:"Certified compliance" },
      nogo:{ fr:"FIPS 140-2/CMVP, SOC 2 Type II / ISO 27001 non démontrables en source primaire", en:"FIPS 140-2/CMVP, SOC 2 Type II / ISO 27001 not demonstrable from primary sources" } },
    { cas:{ fr:"Sécurité OWASP", en:"OWASP security" },
      nogo:{ fr:"pas de couverture WAF démontrable", en:"no demonstrable WAF coverage" } },
    { cas:{ fr:"Paiements temps réel & événementiel", en:"Real-time payments & eventing" },
      nogo:{ fr:"SLA temps réel non tenu", en:"real-time SLA not met" } },
    { cas:{ fr:"Audit immuable & IA/MCP", en:"Immutable audit & AI/MCP" },
      nogo:{ fr:"la PII sort du Canada", en:"PII leaves Canada" } }
  ],
  bascules: [
    { fr:"→ IBM si la souveraineté résidente Canada devient une contrainte dure non négociable, ou si Kong échoue au no-go souveraineté/sécurité. Sous « Souveraineté max », IBM est déjà 1ᵉʳ (94,6).",
      en:"→ IBM if Canada-resident sovereignty becomes a hard, non-negotiable constraint, or if Kong fails the sovereignty/security no-go. Under “Sovereignty max”, IBM is already 1st (94.6)." },
    { fr:"→ Gravitee si le cadrage souveraineté-d'abord prime ET la diligence lève SOC 2 Type II / PCI-DSS / Protected B + région cloud souveraine.",
      en:"→ Gravitee if the sovereignty-first framing prevails AND diligence clears SOC 2 Type II / PCI-DSS / Protected B + a sovereign cloud region." },
    { fr:"→ WSO2 (défensif) si le cadrage Coût & DX prime ET la maturité d'ingénierie interne est avérée (WSO2 72,8 > Kong 72,0 sous Coût & DX+).",
      en:"→ WSO2 (defensive) if the Cost & DX framing prevails AND internal engineering maturity is proven (WSO2 72.8 > Kong 72.0 under Cost & DX+)." }
  ],
  ecartes: { fr:"Écartés : Apigee et Azure (plan de contrôle non souverain — structurel), MuleSoft (TCO), WSO2 (PII possiblement hors Canada).",
             en:"Ruled out: Apigee and Azure (non-sovereign control plane — structural), MuleSoft (TCO), WSO2 (PII possibly outside Canada)." },
  shortlist: [
    { nom:"Kong",     role:{ fr:"recommandé · tête de file PoC", en:"recommended · PoC lead" } },
    { nom:"IBM",      role:{ fr:"challenger · souveraineté prouvée", en:"challenger · proven sovereignty" } },
    { nom:"Gravitee", role:{ fr:"outsider · sous diligence B-10", en:"outsider · pending B-10 diligence" } }
  ]
};

/* ---- Helpers de calcul (vérification interne, §9) ------------------------ */
/* Sim 1/2 : total attendu = Σ (note/5 × poids). Sim 3 : somme des points.    */
function weightedTotal(sim, cand){
  if (cand.notes){
    return sim.criteres.reduce((s,c)=> s + (cand.notes[c.code]/5)*c.poids, 0);
  }
  return sim.criteres.reduce((s,c)=> s + cand.points[c.code], 0);
}
