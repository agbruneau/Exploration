# L'Entreprise Agentique — Table des matières

*Sous-titre : Architecture, gouvernance et opérations des systèmes d'IA agentique en entreprise.*
*Révision : mai 2026.*
*Principe de design : structure en 5 parties, 14 chapitres, ancrée sur les trois pivots 2026 — pile ouverte (MCP/A2A), AgentOps comme discipline distincte, redesign organisationnel.*

---

## Introduction — Pourquoi ce livre, pourquoi maintenant

- Du *copilot* au système agentique : la rupture de 2026
- Lexique opérationnel : *AI agent*, *agentic*, *agentic AI* (les trois ne sont pas synonymes)
- Comment lire ce livre selon le rôle (CIO, architecte, PO, *risk officer*)

---

## Partie 1 — Pourquoi l'entreprise agentique est urgente

### Chapitre 1 — De l'automatisation aux agents

- La boucle *decide–act–observe* avec mémoire persistante
- *RPA stateless* → agent *stateful* : ce qui change vraiment
- Pourquoi les architectures EDA et orientées événements deviennent le terrain naturel des agents

### Chapitre 2 — Le cas d'affaires de l'IA agentique

- *Unit economics* : du coût par token au coût par tâche réussie (*successful outcome*)
- FinOps agentique : budgets de *retry*, *escalation cost*, latence-coût
- Pourquoi 40 % des projets seront abandonnés d'ici 2027 (Gartner) — et comment éviter cette cohorte
- Les 12× : pourquoi les organisations *governance-first* livrent 12 fois plus en production

---

## Partie 2 — Trouver les bons cas d'usage

### Chapitre 3 — Cartographie des cas à fort impact

- Matrice de cadrage : autonomie × réversibilité × tolérance à l'erreur
- Patrons par fonction : *back-office* (clôture, P2P, support tier-1) vs *front-office* (agent commercial, SDR, support contextuel) vs *engineering* (code, ops, SRE)
- Anti-patrons : où les agents échouent prévisiblement

### Chapitre 4 — Évaluer ROI, risque et maturité (*readiness*)

- Le cadre d'évaluation à quatre piliers : LLM, *Memory*, *Tools*, *Environment*
- Métriques opérationnelles : *task success*, *tool correctness*, *retry budget*, *escalation quality*, *policy compliance*
- Décision *build / buy / borrow / wait* : critères et seuils
- *Readiness assessment* : données, processus, talents, gouvernance

---

## Partie 3 — La pile agentique

### Chapitre 5 — Protocoles et interopérabilité

- La pile à trois couches : **MCP** (outils), **A2A** (*agent-to-agent*), **WebMCP** (navigateur)
- Ce que MCP a changé depuis sa contribution à l'AAIF (décembre 2025)
- A2A en production : *capability discovery*, *task delegation*, orchestration pair-à-pair
- L'AAIF et la consolidation des standards ouverts

### Chapitre 6 — Orchestration, mémoire, outils

- Patrons d'orchestration : *supervisor*, *swarm*, *hierarchical*, *graph-based*, *mesh*
- *Memory engineering* : mémoire épisodique, sémantique, procédurale — et la dette de mémoire
- *Tool design* : idempotence, contrats d'effets de bord, schémas robustes

### Chapitre 7 — AgentOps : opérer des agents à longue durée d'exécution

- AgentOps vs MLOps : ce qui s'ajoute, ce qui se transforme
- Observabilité agentique : traces multi-étapes, *tool spans*, *memory diffs*
- Évaluation en production : régression continue, *replay*, *shadow runs*
- Cycle de vie : *promote*, *deprecate*, *roll back* d'un agent

---

## Partie 4 — Confiance, sécurité et durabilité

### Chapitre 8 — Construire des systèmes dignes de confiance

- Autonomie hiérarchique : assistance → supervisé → autonome borné → autonome
- *Human-in-the-loop* opérationnel : *humans set rules, agents execute, exceptions escalate*
- Auditabilité : *decision logs*, *justifiable actions*, conformité (EU AI Act, ISO 42001, OSFI E-23)

### Chapitre 9 — Sécurité agentique

- Modèle de menace propre aux agents : *prompt injection via tools*, *cross-tool exfiltration*, *jailbreak by delegation*
- Identité et accès pour agents : tokens *per-task*, *least-privilege* dynamique
- Défense en profondeur : *guardrails*, *sandboxing*, *kill switches*

### Chapitre 10 — Croître sans verrouillage

- Pile agentique ouverte vs plateformes propriétaires
- Portabilité par MCP/A2A : changer de fournisseur de modèle sans réécrire les agents
- Stratégie *multi-vendor* : routage par capacité, coût, latence, conformité

---

## Partie 5 — Piloter la transition

### Chapitre 11 — Redessiner le travail, pas l'augmenter

- Pourquoi le redesign bat l'augmentation : la ligne de partage BCG/MIT SMR (n=2 102, novembre 2025)
- Nouveaux rôles : *AI ops manager*, *human-AI interaction designer*, *quality steward*
- *Hybrid workflows* : combiner forces humaines et capacités agentiques sans calque
- *Change management* : 53 % des organisations forment leur population, 48 % conçoivent un *upskilling* formel (Deloitte 2026) — comment le faire vraiment

### Chapitre 12 — Leçons des 60 % qui ont échoué

- Anatomie des échecs 2025-2026 : techniques, organisationnels, économiques
- Signaux faibles à surveiller dans son propre programme
- Critères *kill / pivot / scale*

### Chapitre 13 — La route devant

- *Hype Cycle* Gartner 2026 : gouvernance agentique, sécurité agentique, FinOps agentique
- Horizons 2027–2030 : *autonomous teams*, chaînes d'approvisionnement agentiques inter-organisations, intersection avec l'edge et le mainframe modernisé
- Position de l'architecte d'entreprise dans cinq ans

### Chapitre 14 — Construisez votre OS agentique sur mesure (Claude Code en pratique)

- Coda tactique : pourquoi assembler son OS agentique plutôt qu'adopter une plateforme clé en main (renvois Ch. 8, Ch. 10)
- **Trois étapes d'assemblage avec Claude Code** : (1) composer *skills* + sous-agents — la spécialisation par domaine ; (2) intégrer serveurs MCP + *hooks* — l'extension contrôlée des outils ; (3) déployer + observer — l'AgentOps minimaliste viable
- Cas concret méta : la monographie elle-même comme OS agentique de bout en bout
- Limites, compromis et conditions de bascule vers une plateforme propriétaire (renvois Ch. 7, Ch. 9, Ch. 10)
- Tableau comparatif Claude Code / Codex Agent / Cursor / Cline / harnais propriétaires
- Source d'inspiration : YouTube « Build Your CUSTOM Claude Code Agentic OS (3 Steps) » (chaîne Chase AI). Transcript non récupérable — les trois étapes sont une **reconstruction depuis la documentation officielle Claude Code** (mai 2026), explicitement signalée dans le chapitre.

---

## Annexes — Listes de contrôle, gabarits et ressources

- **A.** Liste de contrôle de revue d'architecture (sécurité, observabilité, FinOps)
- **B.** *Use case canvas* (autonomie × réversibilité × ROI)
- **C.** Modèle de maturité AgentOps (5 niveaux N1–N5)
- **D.** Gouvernance RACI agentique
- **E.** Glossaire et lectures recommandées

---

## Notes de design

**Compromis assumé** : 14 chapitres + annexes plutôt que 10. Si la cible est de rester à ~10 chapitres (livre court, ~250 pages), fusionner :

- Ch. 5 + Ch. 6 → un seul *« La pile agentique »*
- Ch. 9 absorbé dans Ch. 8 sous *« Confiance et sécurité »*
- Ch. 12 devient un encadré récurrent dans chaque chapitre plutôt qu'un chapitre

**Conditions qui renversent cette structure** : si l'essai vise un public exécutif (C-level) plutôt qu'architecte, supprimer le Ch. 5 (protocoles) et le Ch. 7 (AgentOps) — trop techniques — et renforcer Ch. 11 et Ch. 12 (organisationnel).

---

## Sources de référence

- [7 Agentic AI Trends to Watch in 2026 — MachineLearningMastery](https://machinelearningmastery.com/7-agentic-ai-trends-to-watch-in-2026/)
- [2026 Hype Cycle for Agentic AI — Gartner](https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai)
- [AI Agent Protocol Ecosystem Map 2026 — DigitalApplied](https://www.digitalapplied.com/blog/ai-agent-protocol-ecosystem-map-2026-mcp-a2a-acp-ucp)
- [MCP vs A2A: The Complete Guide 2026 — DEV Community](https://dev.to/pockit_tools/mcp-vs-a2a-the-complete-guide-to-ai-agent-protocols-in-2026-30li)
- [What is AgentOps? Ultimate 2026 Guide — Medium / Intellibytes](https://medium.com/@Intellibytes/what-is-agentops-the-ultimate-2026-guide-to-ai-agent-operations-544876848ddd)
- [AI agent observability — N-iX, 2026](https://www.n-ix.com/ai-agent-observability/)
- [Beyond Task Completion: Assessment Framework for Agentic AI — arXiv décembre 2025](https://arxiv.org/html/2512.12791v1)
- [State of AI in the Enterprise 2026 — Deloitte](https://www.deloitte.com/us/en/what-we-do/capabilities/applied-artificial-intelligence/content/state-of-ai-in-the-enterprise.html)
- [The agentic reality check: silicon-based workforce — Deloitte Tech Trends 2026](https://www.deloitte.com/us/en/insights/topics/technology-management/tech-trends/2026/agentic-ai-strategy.html)
- [Trends shaping AI and tech 2026 — IBM](https://www.ibm.com/think/news/ai-tech-trends-predictions-2026)
- [Enterprise AI adoption 2026 — Writer](https://writer.com/blog/enterprise-ai-adoption-2026/)
