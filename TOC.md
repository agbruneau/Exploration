# The Agentic Enterprise — Table of Contents

*Révision : mai 2026*
*Principe de design : structure en 5 parties, 13 chapitres, ancrée sur les trois pivots 2026 — stack ouvert (MCP/A2A), AgentOps comme discipline distincte, redesign organisationnel.*

---

## Introduction — Why this book, why now

- Du copilot au système agentique : la rupture de 2026
- Lexique opérationnel : *AI agent*, *agentic AI*, *multi-agent system* (les trois ne sont pas synonymes)
- Comment lire ce livre selon le rôle (CIO, architecte, PO, risk officer)

---

## Part 1 — Why the Agentic Enterprise Matters

### Chapter 1 — From Automation to Agents

- La boucle *decide–act–observe* avec mémoire persistante
- Stateless RPA → stateful agent : ce qui change vraiment
- Pourquoi les architectures EDA et orientées événements deviennent le terrain naturel des agents

### Chapter 2 — The Business Case for Agentic AI

- *Unit economics* : du coût par token au coût par *successful outcome*
- FinOps agentique : budgets de retry, *escalation cost*, latence-coût
- Pourquoi 40 % des projets seront abandonnés d'ici 2027 (Gartner) — et comment éviter cette cohorte
- Les 12× : pourquoi les organisations *governance-first* livrent 12 fois plus en production

---

## Part 2 — Finding the Right Use Cases

### Chapter 3 — Mapping High-Impact Applications

- Matrice de cadrage : autonomie × réversibilité de l'action × tolérance à l'erreur
- Patrons par fonction : *back-office* (close, P2P, support tier-1) vs. *front-office* (sales agent, SDR, support contextuel) vs. *engineering* (code, ops, SRE)
- Anti-patrons : où les agents échouent prévisiblement

### Chapter 4 — Evaluating ROI, Risk, and Readiness

- Le cadre d'évaluation à quatre piliers : LLM, Memory, Tools, Environment
- Métriques opérationnelles : *task success*, *tool correctness*, *retry budget*, *escalation quality*, *policy compliance*
- Décision *build / buy / wait* : critères et seuils
- *Readiness assessment* : données, processus, talents, gouvernance

---

## Part 3 — The Agentic Stack

### Chapter 5 — Protocols and Interoperability

- Le stack à trois couches : **MCP** (tools), **A2A** (agent-to-agent), **WebMCP** (web)
- Ce que MCP a changé depuis sa donation à la Linux Foundation (décembre 2025)
- A2A en production : capability discovery, task delegation, *peer-to-peer orchestration*
- L'AAIF et la consolidation des standards ouverts

### Chapter 6 — Orchestration, Memory, and Tools

- Patrons d'orchestration : *supervisor*, *swarm*, *hierarchical*, *graph-based*
- Memory engineering : *episodic*, *semantic*, *procedural* — et la dette de mémoire
- Tool design : idempotence, *side-effect contracts*, schémas robustes

### Chapter 7 — AgentOps: Operating Long-Running Agents

- AgentOps vs. MLOps : ce qui s'ajoute, ce qui se transforme
- Observabilité agentique : traces multi-étapes, *tool spans*, *memory diffs*
- *Evaluation in production* : régression continue, *replay*, *shadow runs*
- Cycle de vie : *promote*, *deprecate*, *roll back* d'un agent

---

## Part 4 — Trust, Security, and Sustainability

### Chapter 8 — Building Trustworthy Systems

- *Hierarchical autonomy* : assistance → supervisé → autonome borné → autonome
- Human-in-the-loop opérationnel : *humans set rules, agents execute, exceptions escalate*
- Auditabilité : *decision logs*, *justifiable actions*, conformité (UE AI Act, ISO 42001)

### Chapter 9 — Agentic Security

- Modèle de menace propre aux agents : *prompt injection via tools*, *cross-tool exfiltration*, *jailbreak by delegation*
- Identity and access pour agents : tokens *per-task*, *least-privilege* dynamique
- Défense en profondeur : *guardrails*, *sandboxing*, *kill switches*

### Chapter 10 — Scaling Without Lock-In

- *Open agentic stack* vs. plateformes propriétaires
- Portabilité par MCP/A2A : changer de fournisseur de modèle sans réécrire les agents
- Stratégie *multi-vendor* : routage par capacité, coût, latence, conformité

---

## Part 5 — Leading the Transition

### Chapter 11 — Redesigning Work, Not Augmenting It

- Pourquoi 54 % des C-suite disent que l'IA « déchire » l'entreprise (Deloitte 2026)
- Nouveaux rôles : *AI ops manager*, *human–AI interaction designer*, *quality steward*
- *Hybrid workflows* : combiner forces humaines et capacités agentiques sans calque
- *Change management* : 87 % des organisations priorisent upskilling — comment le faire vraiment

### Chapter 12 — Lessons from the 60 % That Failed

- Anatomie des échecs 2025-2026 : techniques, organisationnels, économiques
- Signaux faibles à surveiller dans son propre programme
- Critères de *kill / pivot / scale*

### Chapter 13 — The Road Ahead

- Hype Cycle Gartner 2026 : *agentic governance*, *agentic security*, FinOps agentique
- Horizons 2027–2030 : *autonomous teams*, *multi-org agentic supply chains*, intersection avec l'edge et le mainframe modernisé
- Position de l'architecte d'entreprise dans cinq ans

### Chapter 14 — Build Your Custom Agentic OS (Claude Code en pratique)

- Coda tactique : du cadre stratégique au harnais opérationnel
- Source primaire : YouTube « Build Your CUSTOM Claude Code Agentic OS (3 Steps) » — *transcript / notes à fournir*
- Trois étapes pour assembler un OS agentique personnalisé via Claude Code (skills, MCP servers, hooks, plugins)
- Cas concret de bout en bout : du dépôt vide à l'agent personnalisé déployé

---

## Annexes — Checklists, Templates, and Further Resources

- **A.** Architecture review checklist (sécurité, observabilité, FinOps)
- **B.** *Use case canvas* (autonomie × réversibilité × ROI)
- **C.** AgentOps maturity model (5 niveaux)
- **D.** Governance RACI agentique
- **E.** Glossaire et lectures recommandées

---

## Notes de design

**Compromis assumé** : 13 chapitres + annexes plutôt que 10. Si la cible est de rester à ~10 chapitres (livre court, ~250 pages), fusionner :

- Ch. 5 + Ch. 6 → un seul *« The Agentic Stack »*
- Ch. 9 absorbé dans Ch. 8 sous *« Trust & Security »*
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
