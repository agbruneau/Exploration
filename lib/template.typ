// lib/template.typ — styles, mise en page, langue (cf. CLAUDE.md §6).
// Police par défaut de Typst (Libertinus Serif, fournie) — aucune dépendance externe.

#let conf(
  title: none,
  author: none,
  date: none,
  doc,
) = {
  set document(title: title)
  set text(lang: "fr", region: "CA", size: 11pt)
  set par(justify: true, leading: 0.72em, first-line-indent: 1.2em)
  set page(paper: "a4", margin: (x: 2.5cm, y: 2.8cm), numbering: "1", number-align: center)
  // Pas de numérotation auto : les titres portent déjà « PARTIE X » / « Ch. N » ;
  // certains chapitres numérotent leurs sections à la main (p. ex. « 15.2 »).
  set heading(numbering: none)

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    block(above: 1.6em, below: 1.0em, text(size: 1.5em, weight: "bold", it))
  }
  show heading.where(level: 2): it => block(above: 1.3em, below: 0.7em, text(size: 1.2em, weight: "bold", it))
  show heading.where(level: 3): it => block(above: 1.0em, below: 0.5em, text(size: 1.05em, weight: "bold", it))
  show raw.where(block: true): it => block(
    fill: rgb("#f5f5f5"), inset: 8pt, radius: 3pt, width: 100%, text(size: 0.9em, it),
  )

  // Page de titre minimale
  if title != none {
    set page(numbering: none)
    align(center + horizon)[
      #text(size: 1.9em, weight: "bold")[#title]
      #if author != none { v(1.2em); text(size: 1.1em)[#author] }
      #if date != none { v(0.6em); text(size: 0.95em, fill: gray)[#date] }
    ]
    pagebreak()
  }
  counter(page).update(1)
  doc
}
