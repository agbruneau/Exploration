# L'Entreprise Agentique

*Architecture, gouvernance et opérations des systèmes d'IA agentique en entreprise.*

**Auteur :** André-Guy Bruneau
**Édition :** Mai 2026 — version révisée de bout en bout
**Format :** monographie technique professionnelle
**Lectorat cible :** architectes d'entreprise senior, architectes de solution, *risk officers*, CIO et *product owners* engagés dans des programmes agentiques

---

## Résumé (*abstract*)

Cette monographie traite la rupture de 2026 : le passage du *copilot* — assistant réactif qui répond et laisse l'humain agir — au système agentique — entité autonome qui exécute des chaînes d'actions avec mémoire persistante, outils et délégation. L'ouvrage est écrit pour des architectes seniors qui doivent **décider** et non apprendre les fondamentaux ; il suppose acquis EDA, microservices, Kafka, patrons d'intégration et principes de modernisation.

Le fil narratif est structuré en cinq parties répondant chacune à une décision précise. **Partie 1** — pourquoi agir maintenant : convergence de quatre pressions (maturité protocolaire MCP/A2A, sortie du laboratoire des systèmes multi-agents, pression réglementaire NIST/EU AI Act/OSFI E-23, restructuration du travail). **Partie 2** — quoi construire en premier : matrice de cadrage à trois dimensions (autonomie × réversibilité × tolérance à l'erreur), métriques canoniques (*Cost per Successful Task*, *retry budget*, *escalation quality*) et décision *build / buy / borrow / wait*. **Partie 3** — comment le construire : pile à trois couches (MCP, A2A, WebMCP), patrons d'orchestration (*supervisor*, *swarm*, *hierarchical*, *graph-based*, *mesh*), *memory engineering* et discipline AgentOps fondée sur OpenTelemetry GenAI SemConv 1.40.0. **Partie 4** — comment le faire durer : autorité hiérarchique, modèle de menace agentique (*prompt injection via tools*, *cross-tool exfiltration*, *jailbreak by delegation*), portabilité multi-fournisseurs sans verrouillage. **Partie 5** — comment piloter la transition humaine : redessin du travail, anatomie des 60 % de programmes qui échouent, prospective 2027-2030, et coda tactique sur l'assemblage d'un OS agentique sur mesure avec Claude Code.

La thèse centrale du livre est que **gouvernance et architecture doivent être conçues simultanément, dès le premier sprint, et non séquentiellement**. Les organisations *governance-first* livrent un ordre de grandeur de plus de systèmes agentiques viables que celles qui traitent la gouvernance comme une exigence de post-déploiement (Databricks, *State of AI Agents 2026*, n=20 000+).

L'ouvrage est densément référencé : chaque affirmation factuelle est tracée à une source primaire éditeur (Anthropic, OpenAI, Google, Microsoft, IBM, AWS), à un standard ouvert (RFC, ISO, OASIS, W3C), à une publication de recherche (arXiv, ACM, USENIX), ou à un rapport d'analyste, avec marqueur d'incertitude explicite (*confirmé / probable / hypothèse / à vérifier*). Les recommandations architecturales sont systématiquement accompagnées d'au moins une alternative crédible et de la condition qui les renverse.

---

## Table des matières

### Cadrage

- [Table des matières détaillée et notes de design](TOC.md)
- [Glossaire de termes techniques retenus](glossaire.md)
- [Bibliographie consolidée — index thématique](references.md)

### Introduction

- [Introduction — Pourquoi ce livre, pourquoi maintenant](00-introduction.md)

### Partie 1 — Pourquoi l'entreprise agentique est urgente

- [Chapitre 1 — De l'automatisation aux agents](ch01-from-automation-to-agents.md)
- [Chapitre 2 — Le cas d'affaires de l'IA agentique](ch02-business-case.md)

### Partie 2 — Trouver les bons cas d'usage

- [Chapitre 3 — Cartographie des cas à fort impact](ch03-mapping-high-impact.md)
- [Chapitre 4 — Évaluer ROI, risque et maturité](ch04-roi-risk-readiness.md)

### Partie 3 — La pile agentique

- [Chapitre 5 — Protocoles et interopérabilité](ch05-protocols-interoperability.md)
- [Chapitre 6 — Orchestration, mémoire, outils](ch06-orchestration-memory-tools.md)
- [Chapitre 7 — AgentOps : opérer des agents à longue durée d'exécution](ch07-agentops.md)

### Partie 4 — Confiance, sécurité et durabilité

- [Chapitre 8 — Construire des systèmes dignes de confiance](ch08-trustworthy-systems.md)
- [Chapitre 9 — Sécurité agentique](ch09-agentic-security.md)
- [Chapitre 10 — Croître sans verrouillage](ch10-scaling-without-lockin.md)

### Partie 5 — Piloter la transition

- [Chapitre 11 — Redessiner le travail, pas l'augmenter](ch11-redesigning-work.md)
- [Chapitre 12 — Leçons des 60 % qui ont échoué](ch12-lessons-failed.md)
- [Chapitre 13 — La route devant](ch13-road-ahead.md)
- [Chapitre 14 — Construire son OS agentique sur mesure (Claude Code)](ch14-build-your-agentic-os.md)

### Annexes

- [Annexe A — Liste de contrôle de revue d'architecture](annexe-A-architecture-review.md)
- [Annexe B — *Use case canvas*](annexe-B-use-case-canvas.md)
- [Annexe C — Modèle de maturité AgentOps (N1–N5)](annexe-C-agentops-maturity.md)
- [Annexe D — Gouvernance RACI agentique](annexe-D-governance-raci.md)
- [Annexe E — Glossaire et lectures recommandées](annexe-E-glossaire-lectures.md)

---

## Carte de lecture par rôle

| Rôle | Parcours recommandé |
|---|---|
| **CIO** | Intro → Partie 1 (Ch. 1-2) → Partie 5 (Ch. 11-14), retour aux Parties 3-4 selon décisions |
| **Architecte d'entreprise / solution** | Lecture linéaire complète ; appui particulier sur Parties 3-4 |
| **Product Owner** | Intro → Ch. 2-4 → Ch. 11 ; annexes B et D |
| ***Risk officer*** | Intro → Ch. 4 → Partie 4 (Ch. 8-10) → annexe D |
| **Praticien Claude Code / agent custom** | Ch. 14 directement ; renvois Ch. 7, Ch. 9, Ch. 10 selon le besoin |

---

## Conventions éditoriales

- **Langue** : français canadien. Anglais conservé en italique à la première occurrence pour les termes sans équivalent établi (*event-driven*, *idempotency*, *exactly-once*, *backpressure*, *circuit breaker*, *saga*, *agentic*, *prompt injection*, *tool calling*, *retry budget*, *escalation cost*).
- **Date de référence** : mai 2026.
- **Marqueurs d'incertitude** explicites : *confirmé / probable / hypothèse / à vérifier / inconnu*.
- **Pas de fabrication** : tout chiffre, citation directe, nom d'API, version, date est traçable à une source de Phase 2 ou marqué explicitement à vérifier.

---

## Compilation du PDF

Le livrable PDF (`monograph.pdf`) est produit à partir de `monograph.typ` via Typst :

```powershell
typst compile monograph.typ
```

Format : 8,5 × 11 pouces (US Letter), marges étroites (1,9 cm), texte justifié bilatéral, page titre incluse, table des matières automatique. Police principale : New Computer Modern (sérif, optimisée pour la lecture longue dense).

---

## Licence et redistribution

Document préparé à des fins éditoriales internes. Toute citation, redistribution ou adaptation doit conserver l'attribution complète à l'auteur, le marqueur d'incertitude des affirmations factuelles et la date de référence. Les sources primaires citées restent la propriété de leurs éditeurs respectifs.
