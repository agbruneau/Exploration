// L'Entreprise Agentique — monographie technique
// Mise en page : US Letter 8,5 × 11 po, marges étroites, texte justifié bilatéral.
// Compilation : typst compile monograph.typ monograph.pdf

#set document(
  title: "L'Entreprise Agentique",
  author: "André-Guy Bruneau",
  keywords: ("agentic AI", "MCP", "A2A", "AgentOps", "architecture d'entreprise"),
  date: datetime(year: 2026, month: 5, day: 5),
)

#set page(
  paper: "us-letter",         // 8,5 × 11 po
  margin: (top: 1.9cm, bottom: 2.2cm, left: 1.9cm, right: 1.9cm),
  numbering: "1",
  number-align: center,
)

#set text(
  font: "New Computer Modern",
  size: 10pt,
  lang: "fr",
  region: "ca",
  hyphenate: true,
)

#set par(
  justify: true,            // justification bilatérale
  leading: 0.62em,
  first-line-indent: 0pt,
  spacing: 0.85em,
)

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  set text(size: 18pt, weight: "bold")
  block(above: 1.2em, below: 0.8em)[#it.body]
}
#show heading.where(level: 2): it => {
  set text(size: 13pt, weight: "bold")
  block(above: 1.0em, below: 0.4em)[#it.body]
}
#show heading.where(level: 3): it => {
  set text(size: 11pt, weight: "bold", style: "italic")
  block(above: 0.8em, below: 0.3em)[#it.body]
}
#show heading.where(level: 4): it => {
  set text(size: 10pt, weight: "bold")
  block(above: 0.6em, below: 0.2em)[#it.body]
}

// Liens en bleu sobre
#show link: it => text(fill: rgb("#0b3d91"))[#underline(stroke: 0.4pt)[#it]]

// Tableaux : ligne d'en-tête grasse, séparateurs fins
#set table(
  stroke: 0.4pt + gray,
  inset: 5pt,
)
#show table.cell.where(y: 0): set text(weight: "bold")

// Code : monospace + fond léger
#show raw.where(block: true): it => block(
  fill: rgb("#f6f6f6"),
  inset: 8pt,
  radius: 3pt,
  width: 100%,
  text(size: 8.5pt, font: "DejaVu Sans Mono")[#it]
)
#show raw.where(block: false): it => box(
  fill: rgb("#f0f0f0"),
  inset: (x: 2pt, y: 0pt),
  outset: (y: 1pt),
  radius: 1.5pt,
  text(size: 9pt, font: "DejaVu Sans Mono")[#it]
)

// ===========================================================================
// Page de titre
// ===========================================================================

#set page(numbering: none, header: none, footer: none)

#v(4cm)

#align(center)[
  #text(size: 12pt, tracking: 4pt, weight: "regular")[MONOGRAPHIE TECHNIQUE]
  #v(0.4cm)
  #line(length: 30%, stroke: 0.6pt)
  #v(2.5cm)
  #text(size: 36pt, weight: "bold")[L'Entreprise]
  #linebreak()
  #text(size: 36pt, weight: "bold")[Agentique]
  #v(1.0cm)
  #text(size: 14pt, style: "italic", fill: rgb("#444444"))[
    Architecture, gouvernance et opérations
    #linebreak()
    des systèmes d'IA agentique en entreprise
  ]
  #v(3.5cm)
  #line(length: 30%, stroke: 0.6pt)
  #v(0.6cm)
  #text(size: 13pt, weight: "bold")[André-Guy Bruneau]
  #v(0.3cm)
  #text(size: 10pt, fill: rgb("#666666"))[Édition de mai 2026 — révision de bout en bout]
]

#v(1fr)

#align(center)[
  #text(size: 9pt, fill: rgb("#888888"))[
    14 chapitres · 5 annexes · ~640 pages estimées
    #linebreak()
    Lectorat : architectes d'entreprise senior, architectes de solution, #emph("risk officers"), CIO
  ]
]

#pagebreak()

// ===========================================================================
// Avis éditorial / colophon
// ===========================================================================

#v(3cm)

#align(left)[
  #text(size: 9pt, fill: rgb("#444444"))[
    *L'Entreprise Agentique — Architecture, gouvernance et opérations des systèmes d'IA agentique en entreprise*

    #v(0.3cm)
    © 2026 André-Guy Bruneau. Tous droits réservés.

    #v(0.3cm)
    Édition de mai 2026, révisée de bout en bout. Date de référence des affirmations factuelles : mai 2026 sauf mention explicite. Marqueurs d'incertitude utilisés tout au long de l'ouvrage : *confirmé / probable / hypothèse / à vérifier / inconnu*.

    #v(0.3cm)
    Composition typographique : Typst 0.14, police New Computer Modern (sérif). Format US Letter (8,5 × 11 pouces), texte justifié bilatéral, marges étroites pour densité de lecture.

    #v(0.3cm)
    Conventions linguistiques : français canadien. Anglais conservé en italique à la première occurrence pour les termes sans équivalent établi. Voir glossaire en fin de volume.

    #v(0.3cm)
    Toute citation, redistribution ou adaptation doit conserver l'attribution complète à l'auteur, le marqueur d'incertitude des affirmations factuelles et la date de référence. Les sources primaires citées restent la propriété de leurs éditeurs respectifs.
  ]
]

#pagebreak()

// ===========================================================================
// Table des matières
// ===========================================================================

#set page(numbering: "i")
#counter(page).update(1)

#align(center)[
  #v(1cm)
  #text(size: 22pt, weight: "bold")[Table des matières]
  #v(0.5cm)
]

#outline(
  title: none,
  depth: 2,
  indent: 1.2em,
)

#pagebreak()

// ===========================================================================
// Corps — chapitres et annexes (généré par pandoc → body.typ)
// ===========================================================================

#set page(numbering: "1")
#counter(page).update(1)

#include "build/body.typ"
