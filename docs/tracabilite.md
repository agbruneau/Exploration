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

## 2026-06-08 — Passe 2 (Parties I, II, VI, VII) : complétion de l'ébauche

### Fabrications interceptées par la révision adversariale (§10)
- **T-09 — Ch. 1 : statuts d'invariants fabriqués.** L'agent a stampé `I1/I2/I3/I5` comme `Confirmé`. Or §2 ne fixe QUE `I4=Hypothèse`. Rétrogradés à `Hypothèse` (placeholder conservateur) + énoncés précis déférés via `#corpusTODO`. *Même classe d'erreur que T-03 ; récurrence à surveiller.*
- **T-10 — Ch. 18 : `#invariant("I1", …)` mal formé.** Rendait « II1 » et fabriquait un statut. Corrigé en texte simple « I1, I2, I3, I5 » sans statut.
- **T-11 — Ch. 19 : sur-affirmation réglementaire.** Le « registre + cote de risque » de la LD IA AMF était présenté comme acquis ; le dossier le marque `probable` (page AMF en 403). Re-marqué `à confirmer`/`probable` en 3 endroits.

### Intégrité du noyau canonique
- **T-12 — Aucun formalisme fabriqué.** Ch. 3 (ruptures), Ch. 5 (τ), Ch. 6 (CIA) : la sémantique opératoire de τ, les énoncés précis de I1/I2/I3/I5, l'algèbre d'héritage de garanties et la mécanisation Lean 4 sont tous déférés via `#corpusTODO` (≈ 40 encadrés au total), jamais inventés. Le socle MPST (Ch. 6) provient du dossier vérifié (Partie II).
- **T-13 — Statuts I1/I2/I3/I5 = `Hypothèse` (placeholder).** Affichés `Hypothèse` faute de valeur canonique fournie ; **à remplacer par les statuts réels du corpus mère** (seul `I4=Hypothèse` est normatif). Ne pas lire ces placeholders comme des assertions.

### Hygiène / dépôt
- **T-14 — Markdown résiduel.** 4 `**gras**` (Ch. 1) convertis en `*gras*` Typst. Compilation finale : 0 erreur, 0 avertissement, ~138 pages.
- **T-15 — Fichiers parasites non supprimables.** Des agents ont laissé des harnais de test (`_ch4_*.typ`, `_ch09_check.*`) ; la suppression a été refusée par le mode permission. Contournés par `.gitignore` (`_*.typ`, `_*.mjs`) — exclus du dépôt, à effacer manuellement du disque.
