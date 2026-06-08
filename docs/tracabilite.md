# Journal de traçabilité — écarts théorie ↔ implémentation

> Consigne les écarts, corrections et points de réconciliation (cf. `CLAUDE.md` §4, §8, §10).
> **Ne pas lisser** : un écart signalé vaut mieux qu'une affirmation fausse.

## 2026-06-08 — Passe « deep research » (dossier + ébauche III–V)

### Canon
- **T-01 — `lib/canon.typ` encode `CLAUDE.md` §2, non le corpus mère directement.** Le dépôt est greenfield ; aucun `lib/canon.typ` du corpus mère n'était disponible. Macros (`#tau`, `#optau`, `#tfix`, `#dsens`, `#dautorite`, `#dinvariant`, `#cia`, `#ciaFull`, `#invariant`, `#i4`, `#tauRefus`) dérivées du texte normatif de §2. **Action requise** : réconcilier avec le `lib/canon.typ` du corpus mère s'il existe (§11).
- **T-02 — `#i4` est figé à `Hypothèse`** dans le canon (campagne empirique non concluante, §2). Toute présentation de `I4` comme acquis est un écart à refuser.

### Fabrications interceptées par la révision adversariale (anti-fabrication, §10)
- **T-03 — Ch. 14 (Observabilité) : statuts d'invariants fabriqués.** L'agent rédacteur a affiché `I1=Confirmé … I5=Réfuté`. Le dossier (Ch. 14) ne mentionne jamais I1–I5 ; le canon ne verrouille que `I4=Hypothèse`. Le réviseur de fidélité a **neutralisé** ces statuts. *Leçon* : un statut d'invariant exige une justification empirique citée (§9) ; ne pas l'inférer en chapitre empirique.
- **T-04 — Ch. 13 (Menaces) : sur-généralisation NIST.** Affirmation que « aucun document NIST (AI 100-2, AI RMF 1.0, AI 600-1) n'emploie “confused deputy” ». Le dossier ne l'atteste que pour **AI 600-1**. Corrigé : claim restreint à AI 600-1 ; le reste marqué `à vérifier`.

### Défauts Typst corrigés
- **T-05 — Ch. 15** : parenthèse parasite après `table.header` (4 tableaux), `$10^25$` → `$10^(25)$` (seuil GPAI 10^25 FLOP), `$` non échappé dans une note (« 200 G\$ »). Corrigés par la révision.
- **T-06 — Ch. 16** : `#tau-Refus` lu par Typst comme une variable unique `tau-Refus`. Résolu par l'ajout de la macro `#tauRefus` (= `τ-Refus`) au canon et substitution.

### Portée et limites de la passe
- **T-07** — Seules les Parties **III–V** (terrain empirique/normatif daté) sont rédigées. Parties I, II, VI, VII et le noyau formel (τ, CIA, types de session, Lean 4) relèvent du corpus mère et de passes ultérieures.
- **T-08 — Datation des protocoles** : faits arrêtés au **8 juin 2026** (MCP 2025-11-25 + RC 2026-07-28, A2A v1.0 2026-03-12, EU AI Act « Omnibus » mai 2026, etc.). Re-vérifier à toute relance (§10, paysage mouvant).
