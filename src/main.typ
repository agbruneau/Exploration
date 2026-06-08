// src/main.typ — point d'entrée (cf. CLAUDE.md §5).
// Compilation : typst compile src/main.typ build/monographie.pdf
//
// PORTÉE DE L'ÉBAUCHE : les 7 parties / 20 chapitres sont esquissées. Les parties
// empiriques (III–V) et la majeure partie de I, II, VI, VII sont ancrées sur la base
// probante vérifiée docs/recherche/etat-de-lart-2026-06.md (juin 2026). Le noyau formel
// du canon (sémantique opératoire de τ, énoncés précis de I1–I5, algèbre CIA, Lean 4)
// n'est PAS fabriqué : il est déféré au corpus mère via les encadrés #corpusTODO (§2, §10).

#import "../lib/template.typ": conf

#show: conf.with(
  title: "L'Interopérabilité Agentique en Entreprise",
  author: "André-Guy Bruneau, M.Sc. — avec Claude (Anthropic)",
  date: "Ébauche complète (7 parties) — juin 2026",
)

#include "parties/p1-cadre.typ"
#include "parties/p2-fondements.typ"
#include "parties/p3-protocoles.typ"
#include "parties/p4-securite.typ"
#include "parties/p5-gouvernance.typ"
#include "parties/p6-validation.typ"
#include "parties/p7-perspectives.typ"

// Bibliographie consolidée (305 sources du dossier vérifié). Les chapitres citent encore
// en notes de bas de page ; le passage aux clés #cite reste un travail ultérieur (cf. §7).
#pagebreak()
#bibliography("../references.bib", full: true, title: [Bibliographie])
