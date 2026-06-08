// src/main.typ — point d'entrée (cf. CLAUDE.md §5).
// Compilation : typst compile src/main.typ build/monographie.pdf
//
// PORTÉE DE L'ÉBAUCHE : seules les parties empiriques III–V sont rédigées à ce stade,
// ancrées sur la base probante vérifiée docs/recherche/etat-de-lart-2026-06.md (juin 2026).
// Le noyau théorique (τ, CIA, I1–I5, trois ruptures) provient du corpus mère (§2) et
// n'est pas (ré)écrit ici ; les chapitres y RÉFÈRENT via lib/canon.typ.

#import "../lib/template.typ": conf

#show: conf.with(
  title: "L'Interopérabilité Agentique en Entreprise",
  author: "André-Guy Bruneau, M.Sc. — avec Claude (Anthropic)",
  date: "Ébauche des parties empiriques — juin 2026",
)

#include "parties/p3-protocoles.typ"
#include "parties/p4-securite.typ"
#include "parties/p5-gouvernance.typ"
