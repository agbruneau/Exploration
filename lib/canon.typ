// lib/canon.typ — Glossaire verrouillé du corpus mère (cf. CLAUDE.md §2).
// Notation NORMATIVE : casse, accents et sémantique ne doivent pas dériver.
//
// NOTE DE TRAÇABILITÉ : ce fichier encode fidèlement CLAUDE.md §2. Le dépôt mère
// « InteroperabiliteAgentique » fait foi en dernier ressort (§11) ; si son propre
// lib/canon.typ existe, le réconcilier avec celui-ci et consigner tout écart dans
// docs/tracabilite.md. Macros volontairement minimales (cf. §2 « simplicité »).

// — Anglicisme technique sans équivalent établi → italique (§3) —
#let angl(t) = emph(t)

// — Opérateur τ (tau) : déplace l'instant de fixation du sens sans altérer g —
#let tau = $tau$
#let optau = [opérateur $tau$]
#let tfix = $t_("fix") (g)$
// Sortie de dispatch : Decision ∈ {Déterministe, Probabiliste, Refus}
#let decision = [Decision $in$ {Déterministe, Probabiliste, Refus}]
// Régime/sortie « Refus » de τ (raccourci : #tau-Refus serait lu comme une seule variable)
#let tauRefus = [$tau$-Refus]

// — Trois dimensions d'entrée de τ (§2) —
#let dsens = smallcaps[D-Sens]            // score sémantique [0,1]
#let dautorite = smallcaps[D-Autorité]    // autorité appelant × autorité requise cible
#let dinvariant = smallcaps[D-Invariant]  // état des invariants sur la trace

// — Calcul d'Intégration Agentique —
#let cia = [CIA]
#let ciaFull = [Calcul d'Intégration Agentique (CIA)]

// — Invariants réfutables I1–I5 : statut explicite OBLIGATOIRE (§2, §4) —
// statut ∈ {"Confirmé","Hypothèse","Réfuté"}. I4 = Hypothèse (campagne empirique non
// concluante) : ne JAMAIS le présenter comme acquis.
#let invariant(num, statut) = [I#num~#text(size: 0.82em, fill: gray)[(#statut)]]
#let i4 = invariant(4, "Hypothèse")

// — Trois ruptures conceptuelles couplées (la thèse est leur COUPLAGE, §2) —
#let ruptures = [déterministe→probabiliste, syntaxique→sémantique, composition→délégation]

// — Renvoi explicite au corpus mère : tout contenu formel à NE PAS fabriquer (§10).
//   Rend un encadré visible plutôt que d'inventer une construction du canon.
#let corpusTODO(body) = block(
  fill: rgb("#fff4e5"), stroke: (left: 3pt + rgb("#b8860b")), inset: 8pt, radius: 2pt, width: 100%,
  [#text(weight: "bold", fill: rgb("#8a6500"))[À reprendre du corpus mère] — #body],
)
