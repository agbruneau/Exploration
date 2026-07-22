#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Assemble les 34 pièces du volume III en un seul Monographie.md prêt pour Pandoc.

Par pièce, on garde le titre (# ), la thèse (blockquote >) et le corps ;
on retire la table d'en-tête (métadonnées éditoriales) et le bloc ## Notes
(journaux de relecture). Un saut de page Typst sépare les pièces.

Rendu attendu (invocation directe, gabarit Typst par défaut — pas de pipeline
dédié, cf. PRDPlan §7, P5.4) :
    pandoc Monographie.md --pdf-engine=typst --toc -o Monographie.pdf
"""
import io
import glob
import os

ROOT = os.path.dirname(os.path.abspath(__file__))
MONO = os.path.join(ROOT, "monographie")

# Ordre de lecture : avant-propos, parties I à IX, annexes.
ORDER = (
    [os.path.join(MONO, "00-avant-propos.md")]
    + sorted(glob.glob(os.path.join(MONO, "0[1-9]-partie-*", "*.md")))
    + sorted(glob.glob(os.path.join(MONO, "90-annexes", "*.md")))
)

PAGEBREAK = "```{=typst}\n#pagebreak(weak: true)\n```"

HEADER = """---
title: "L'entreprise agentique"
subtitle: "Identité non humaine, délégation vérifiable, maillage d'agents et AgentOps"
author: "André-Guy Bruneau"
date: "22 juillet 2026"
lang: fr
mainfont: "New Computer Modern"
toc-title: "Table des matières"
---

::: {}
**VERSION DE TRAVAIL — NON PUBLIABLE.** Ce rendu assemble les trente-quatre
pièces rédigées et relues adversarialement du volume III au 22 juillet 2026.
La phase de finalisation (P5) est en cours : la revalidation temporelle et le
rejeu des motifs de balayage sont faits, mais **quinze remontées de gouvernance
demeurent ouvertes** (R-G-43 à R-G-57), dont plusieurs relèvent d'un arbitrage
d'auteur — notamment un vote adversarial dû sur deux entrées du socle, une
section sans socle, et le grain de deux critères d'acceptation. L'appareil
éditorial (tables d'en-tête, journaux de relecture, bilans de balayage) n'est
pas reproduit ici ; il vit dans les fichiers source sous `monographie/` et
`verification/`. *Un ouvrage complet n'est pas un ouvrage publiable.*
:::

"""


def extract(path):
    lines = io.open(path, encoding="utf-8").read().replace("\r\n", "\n").split("\n")
    idx_h1 = next(i for i, l in enumerate(lines) if l.startswith("# "))
    idx_sep = next(i for i in range(idx_h1 + 1, len(lines)) if lines[i].strip() == "---")
    idx_notes = next((i for i in range(len(lines)) if lines[i].startswith("## Notes")), len(lines))
    title = lines[idx_h1]
    thesis = [l for l in lines[idx_h1 + 1:idx_sep] if l.startswith(">")]
    body = lines[idx_sep + 1:idx_notes]
    parts = [title, ""]
    if thesis:
        parts += thesis + [""]
    parts.append("\n".join(body).strip())
    return "\n".join(parts).strip()


def main():
    chunks = [extract(p) for p in ORDER]
    doc = HEADER + ("\n\n" + PAGEBREAK + "\n\n").join(chunks) + "\n"
    out = os.path.join(ROOT, "Monographie.md")
    io.open(out, "w", encoding="utf-8", newline="\n").write(doc)
    print("assemblé : %d pièces -> %s" % (len(ORDER), out))
    for p in ORDER:
        print("  ", os.path.relpath(p, ROOT))


if __name__ == "__main__":
    main()
