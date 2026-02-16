# CLAUDE.md — Instructions projet

## Contexte du projet

Ce dépôt contient l'ensemble des livrables d'une **étude d'opportunité pour le retrait de Microsoft Host Integration Server (HIS)**, passerelle de connectivité entre les environnements Windows/.NET et le Mainframe IBM (z/OS).

### Documents du dépôt

| Document | Rôle |
|----------|------|
| [`PRD.md`](PRD.md) | Gabarit structuré de l'étude d'opportunité (sections 0-10 + annexes) |
| [`PRDPlan.md`](PRDPlan.md) | Plan d'exécution en 8 phases pour rédiger l'étude finale |
| [`Scenarios.md`](Scenarios.md) | Matrice de 15 scénarios sur 5 patterns HIS (P1-P5), scoring, roadmap 3 vagues |
| [`Etude Perplexcity.md`](Etude%20Perplexcity.md) | Étude source #1 — benchmark 6 alternatives, plan migration, coûts EUR (22 réf.) |
| [`Etude Gemini.md`](Etude%20Gemini.md) | Étude source #2 — analyse TI/SNA, TCO/ROI, subventions Québec (106 réf.) |

### Livrable final attendu

`ÉtudeFinalRetrait.md` — l'étude d'opportunité complète, produite en suivant le `PRDPlan.md` et structurée selon le `PRD.md`.

## Règles de rédaction

- **Langue** : Français. Termes techniques IBM/Microsoft en anglais (CICS, TI, LU6.2, DRDA, etc.).
- **Ton** : Analytique et factuel, orienté décision exécutive.
- **Sources** : Toute affirmation doit être traçable aux études sources (Perplexity, Gemini) ou à `Scenarios.md`. Citer explicitement.
- **Convergences/Divergences** : Identifier les points d'accord entre les études (recommandations fortes) et les divergences (à arbitrer).
- **Données quantitatives** : Privilégier les chiffres de `Scenarios.md` (scores, effort Fibonacci, volumétries, critères de succès).

## Règles de comportement LLM

**Tradeoff :** Ces consignes privilégient la prudence. Pour les tâches triviales, faire preuve de jugement.

### 1. Réfléchir avant d'agir

- Énoncer ses hypothèses explicitement. En cas de doute, demander.
- Si plusieurs interprétations existent, les présenter — ne pas choisir en silence.
- Si une approche plus simple existe, le dire. Pousser en retour quand c'est justifié.

### 2. Simplicité d'abord

- Minimum de contenu pour répondre au besoin. Rien de spéculatif.
- Pas d'ajouts non demandés, pas d'abstractions pour usage unique.
- Si 200 lignes peuvent être 50, réécrire.

### 3. Modifications chirurgicales

- Ne toucher que ce qui est nécessaire. Ne pas « améliorer » le code/texte adjacent.
- Respecter le style existant des documents.
- Chaque ligne modifiée doit être traçable à la demande de l'utilisateur.

### 4. Exécution orientée objectif

- Transformer chaque tâche en objectif vérifiable.
- Pour les tâches multi-étapes, énoncer un plan bref avec critères de validation.
