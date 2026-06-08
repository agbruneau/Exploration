# L'Interopérabilité Agentique en Entreprise

Sources Typst d'une **monographie scientifique** sur l'interopérabilité dans l'entreprise agentique.
Auteur : **André-Guy Bruneau, M.Sc.** — co-auteur : **Claude (Anthropic)**, divulgation transparente (cf. `CLAUDE.md` §9).
Langue : **fr-CA**. Statut : **en rédaction** (ébauche des parties empiriques).

## État (8 juin 2026)

| Élément | État |
|---|---|
| `docs/recherche/etat-de-lart-2026-06.md` | **Dossier d'état de l'art vérifié** — 6 parties, 339 faits datés, 305 sources, vérification adversariale à 3 voix |
| `src/parties/p3–p5.typ` | **Ébauche** des Parties III–V (Ch. 8–16), ancrée sur le dossier |
| `lib/canon.typ`, `lib/template.typ` | *Scaffolding* — canon encodé fidèlement à `CLAUDE.md` §2 |
| Parties I, II, VI, VII ; noyau τ/CIA/I1–I5 | **Hors portée de cette passe** — proviennent du corpus mère (§2, §11) |

## Compilation

- **Typst fixé : `0.14.2`** (consigné ici conformément à `CLAUDE.md` §6 ; `typst --version` pour vérifier).
- Le `--root` est requis (les chapitres importent `lib/` hors de `src/`) :

```bash
typst compile --root . src/main.typ build/monographie.pdf
# Itération :
typst watch  --root . src/main.typ build/monographie.pdf
```

Sortie courante : ~122 pages.

## Structure

```
src/main.typ              point d'entrée (inclut p3–p5)
src/parties/p3–p5.typ     ébauche des chapitres empiriques
lib/canon.typ             glossaire verrouillé (§2) — macros τ, CIA, I1–I5, #angl
lib/template.typ          styles, mise en page, fr-CA
docs/plan.md              plan 7 parties / 20 chapitres
docs/recherche/           dossier d'état de l'art (base probante)
docs/tracabilite.md       journal des écarts théorie ↔ implémentation
```

## Notes

- **Citations** : l'ébauche utilise des notes de bas de page (titre — éditeur — date — URL) tirées du dossier. Une bibliographie `references.bib` (Hayagriva/BibTeX) reste à constituer.
- **Réconciliation du canon** : `lib/canon.typ` encode `CLAUDE.md` §2 ; si le corpus mère `InteroperabiliteAgentique` fournit son propre `lib/canon.typ`, le réconcilier et consigner tout écart dans `docs/tracabilite.md` (§11).
- L'ancrage théorique (τ, CIA, I1–I5) dans les chapitres empiriques est **par référence** aux Parties I–II ; ces concepts n'y sont pas (re)définis.
