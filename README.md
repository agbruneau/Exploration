# Étude d'opportunité — Retrait de Microsoft Host Integration Server (HIS)

Étude d'opportunité pour le retrait de **Microsoft Host Integration Server (HIS)** et son remplacement par une plateforme d'intégration moderne (iPaaS, event-driven, microservices) dans un contexte Mainframe IBM z/OS.

## Contexte

Microsoft HIS sert de passerelle entre les environnements Windows/.NET et le Mainframe IBM depuis plus de 20 ans. Avec la fin du support standard de HIS 2020 prévue en juillet 2028 et l'absence de successeur annoncé, ce dépôt documente l'analyse complète menant à une décision de retrait.

## Structure du dépôt

| Document | Description |
|----------|-------------|
| [`PRD.md`](PRD.md) | Gabarit de l'étude d'opportunité — structure en 10 sections (cadrage, contexte, besoins, solutions, impact, coûts, risques, transition, métriques, recommandation) |
| [`PRDPlan.md`](PRDPlan.md) | Plan d'exécution en 8 phases séquentielles pour rédiger l'étude finale, avec critères de validation par phase |
| [`Scenarios.md`](Scenarios.md) | Matrice de 15 scénarios concrets répartis sur 5 patterns d'intégration HIS (P1-P5), scoring de viabilité, roadmap 3 vagues (0-36 mois), estimation effort 260 pts Fibonacci |
| [`Etude Perplexcity.md`](Etude%20Perplexcity.md) | Étude source #1 — benchmark 6 alternatives, matrice de décision, plan de migration 4 phases (26 mois), analyse coûts EUR (22 sources) |
| [`Etude Gemini.md`](Etude%20Gemini.md) | Étude source #2 — analyse architecture TI/SNA, benchmark 6 alternatives, TCO/ROI Forrester, subventions Québec (106 sources) |
| [`CLAUDE.md`](CLAUDE.md) | Instructions projet pour assistants IA (contexte, règles de rédaction, comportement) |

## Résumé des analyses

### Patterns d'intégration HIS identifiés

| Pattern | Score | Verdict | Effort |
|---------|-------|---------|--------|
| P2 — Batch File Transfer | 3.90/5 | **GO** | 29 pts |
| P3 — Event-Driven MQ | 3.55/5 | Conditional Go | 47 pts |
| P1 — Synchronous CICS TI | 3.25/5 | Conditional Go | 47 pts |
| P4 — Database Access DB2 | 2.75/5 | Conditional Go (réserves) | 76 pts |
| P5 — Terminal Emulation | 2.30/5 | Conditional Go (transitoire) | 61 pts |

### Recommandation convergente des études

- **Plateforme cible** : Azure Logic Apps (Standard) + Apache Kafka
- **Approche** : Strangler Fig pattern — migration progressive par vagues sur 18-36 mois
- **Décision** : GO conditionnel — sous réserve de validation POC

### Alternatives évaluées

- Azure Logic Apps (Standard) — successeur naturel de HIS
- Boomi Enterprise Platform — iPaaS hybride avec migration IA
- MuleSoft Anypoint Platform — API-led connectivity
- IBM App Connect Enterprise (ACE) — affinité écosystème IBM
- PilotFish Integration Engine — low-code, secteurs réglementés
- Apache Kafka — complément event-driven

## Livrable final

`ÉtudeFinalRetrait.md` — étude d'opportunité complète, produite en suivant les phases du [`PRDPlan.md`](PRDPlan.md) et structurée selon le gabarit [`PRD.md`](PRD.md). Les deux études sources et la matrice des scénarios alimentent directement la rédaction.

## Séquencement de production

```
Phase 0 — Cadrage (inventaire HIS, validation sponsor)
Phase 1 — Contexte et problématique HIS
Phase 2 — Besoins de connectivité Mainframe
Phase 3 — Solutions de remplacement HIS
Phase 4 — Analyse d'impact
Phase 5 — Coûts-bénéfices
Phase 6 — Risques et transition
Phase 7 — Métriques, recommandation et finalisation
```
