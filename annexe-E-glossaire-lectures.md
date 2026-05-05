---
title: "Annexe E — Glossaire et lectures recommandées"
annexe: "E"
status: "rédigé"
length_target_words: 1500
reading_time_min: 6
last_updated: "2026-05-05"
---

# Annexe E — Glossaire et lectures recommandées

Cette annexe remplit deux fonctions complémentaires. Premièrement, elle offre une porte d'entrée terminologique pour le lecteur qui aborde la monographie hors séquence ou qui doit aligner rapidement son équipe sur le lexique adopté : les définitions ci-dessous sont des définitions opérationnelles, calibrées pour décider et non pour enseigner. Deuxièmement, elle fournit une bibliographie thématique de 35 sources vérifiées, extraites des chapitres 1 à 13 et organisées par préoccupation : un CIO cherchera d'abord le thème « Gouvernance et conformité » ; un architecte commencera par « Fondations » et « Protocoles ouverts » ; un *risk officer* ira directement à « Sécurité » et « Gouvernance ». Le [glossaire complet](glossaire.md) fait autorité sur toute divergence terminologique.

---

## Section A — Glossaire récapitulatif

Les entrées suivantes condensent les définitions opérationnelles du [glossaire.md](glossaire.md). En cas de divergence entre une source externe et ces définitions, la convention de la monographie prévaut.

**Agent** — Entité logicielle unique exécutant la boucle *decide–act–observe* avec accès à des outils et à une mémoire persistante. Distinguer de l'assistant (pas d'outils), du *workflow* (chemin prédéfini) et du système multi-agents (plusieurs agents coordonnés).

**Agentic** (adjectif) — Qualifie tout système, comportement ou propriété d'un LLM exécutant la boucle *decide–act–observe*, qu'il soit à agent unique ou multiple. Convention Anthropic, adoptée dans cette monographie.

***Agentic AI*** (nom) — Système composite multi-agents orchestré. Convention IBM. Synonyme de « système multi-agents » dans ce texte. La distinction avec « agent » isolé est architecturalement significative : le premier introduit des problèmes de coordination, de cohérence d'état et de sécurité inter-agents absents du second.

**AgentOps** — Discipline opérationnelle d'agents en production. Quatre composantes : (1) observabilité multi-étapes (LLM spans, *tool spans*, *memory spans*, *orchestration spans* selon OTel GenAI SemConv 1.40.0) ; (2) évaluation continue (régression, *replay* déterministe, *shadow runs*) ; (3) cycle de vie de l'artefact composite versionné comme unité atomique ; (4) plan de contrôle (*permission boundaries*, *retry budgets*, *kill switches*). Voir [Ch. 7](ch07-agentops.md) et [Annexe C](annexe-C-agentops-maturity.md).

**MCP (Model Context Protocol)** — Protocole ouvert d'interfaçage entre LLM et outils ou données, créé par Anthropic, gouverné par l'AAIF depuis décembre 2025. Quatre primitives : *Resources* (lecture), *Tools* (action), *Prompts* (templates), *Sampling* (LLM côté serveur). 110 M+ téléchargements SDK/mois à mai 2026. Surface d'attaque documentée : *tool poisoning*, injection via *sampling*, RCE supply chain. Voir [Ch. 5](ch05-protocols-interoperability.md).

**A2A (Agent-to-Agent Protocol)** — Protocole de coordination entre agents, sous Linux Foundation depuis juin 2025. Quatre primitives : *Agent Card* (capability discovery), *Task* (cycle de vie SUBMITTED → WORKING → terminal/HITL), *Message*, *Artifact*. Transports : JSON-RPC 2.0/HTTP, gRPC, REST. 150+ organisations adoptantes à mai 2026. Voir [Ch. 5](ch05-protocols-interoperability.md).

**AAIF (Agentic AI Foundation)** — *Directed fund* sous Linux Foundation, annoncé le 9 décembre 2025. Membres Platinum : AWS, Anthropic, Block, Bloomberg, Cloudflare, Google, Microsoft, OpenAI. MCP est projet fondateur. Anthropic conserve l'autonomie technique des mainteneurs MCP.

**WebMCP** — Extension navigateur de MCP, statut W3C *Candidate Recommendation* (non ratifié, mai 2026). API `navigator.modelContext`. Périmètre : *tools only*. Support : Chrome 146, Edge 147 ; Firefox et Safari sans date confirmée. Voir [Ch. 5](ch05-protocols-interoperability.md).

**OSFI E-23** — Ligne directrice *Model Risk Management* du Bureau du surintendant des institutions financières (Canada), en vigueur le 1ᵉʳ mai 2027. Référence réglementaire applicable aux systèmes agentiques dans le secteur financier canadien, pas E-21. Voir [Ch. 8](ch08-trustworthy-systems.md).

**EU AI Act** — Règlement européen sur l'IA (entré en vigueur 2024, actes délégués 2025–2026). Les agents autonomes à impact élevé tombent dans les catégories à risque élevé ; les obligations de journalisation, d'auditabilité et de supervision humaine s'appliquent directement aux architectures agentiques. Voir [Ch. 8](ch08-trustworthy-systems.md).

**ISO 42001** — ISO/IEC 42001:2023 — Système de management de l'IA. Certification organisationnelle (contrôles, politiques, revues) distincte de la conformité produit. ISO/IEC 42006:2025 définit les exigences pour les organismes d'audit. Voir [Ch. 8](ch08-trustworthy-systems.md).

**NIST AI RMF** — *AI Risk Management Framework* 1.0 + profil IA générative (NIST AI 600-1, juillet 2024). Quatre fonctions : Gouverner, Cartographier, Mesurer, Gérer. Cadre de référence pour structurer la gouvernance des risques agentiques, complémentaire à ISO 42001. Voir [Ch. 8](ch08-trustworthy-systems.md).

**CPST (Cost per Successful Task)** — Métrique financière agentique centrale : coût total (inférence + mémoire + outils + orchestration + retries + escalade humaine) divisé par le nombre de tâches réussies. Distingue le coût d'ingénierie (par token) du coût de décision (par résultat). Voir [Ch. 2](ch02-business-case.md).

***Retry budget*** — Plafond d'itérations ou de coût qu'un agent peut consommer avant escalade obligatoire vers un opérateur humain. Paramètre de contrôle du plan de contrôle AgentOps, distinct du *circuit breaker* (coupure immédiate sur seuil d'erreur). Sans *retry budget* borné, un agent peut accumuler des dépenses non intentionnelles de plusieurs dizaines de milliers de dollars en une seule session (incident documenté au Ch. 2).

---

## Section B — Lectures recommandées par thème

### 1. Fondations agentiques

Sources constitutives du cadre conceptuel de la monographie.

- Yao, S. et al. (Princeton / Google Brain) — « ReAct: Synergizing Reasoning and Acting in Language Models » — arXiv / ICLR 2023 — <https://arxiv.org/abs/2210.03629> — Papier fondateur de la boucle *decide–act–observe* ; les résultats empiriques (ALFWorld, WebShop) restent la référence quantitative pour justifier l'approche ReAct face aux alternatives.
- Anthropic — « Building Effective Agents » — Anthropic, décembre 2024 — <https://www.anthropic.com/research/building-effective-agents> — Source primaire des cinq patrons de composition agentique et du principe de simplicité comme stratégie de risque.
- Anthropic Engineering — « Effective Harnesses for Long-Running Agents » — Anthropic, 2025 — <https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents> — Persistance d'état, points de reprise, observabilité des agents multi-étapes.
- Russell, S. & Norvig, P. — *Artificial Intelligence: A Modern Approach*, 4e éd. — Pearson, 2020 — <https://aima.cs.berkeley.edu/> — Fondement conceptuel sur les agents rationnels, PEAS et boucles de perception-action.
- Intellyx — « Why State Management Is the #1 Challenge for Agentic AI » — Intellyx, 24 février 2025 — <https://intellyx.com/2025/02/24/why-state-management-is-the-1-challenge-for-agentic-ai/> — Cinq modes de défaillance *stateful* ; lecture préalable à tout dossier de risque agent.

### 2. Protocoles ouverts (MCP / A2A / WebMCP / AAIF)

- Linux Foundation — « Linux Foundation Announces the Formation of the Agentic AI Foundation (AAIF) » — Linux Foundation Press, 9 décembre 2025 — <https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation> — Annonce officielle de la gouvernance MCP/A2A.
- modelcontextprotocol.io — « SDKs — Model Context Protocol » — documentation officielle, mai 2026 — <https://modelcontextprotocol.io/docs/sdk> — Référence primaire pour l'implémentation MCP.
- A2A Protocol — « Agent2Agent Protocol Specification v1.0.0 » — a2a-protocol.org, mai 2026 — <https://a2a-protocol.org/latest/specification/> — Spécification complète des quatre primitives A2A.
- DigitalApplied — « AI Agent Protocol Ecosystem Map 2026 » — DigitalApplied, mars 2026 — <https://www.digitalapplied.com/blog/ai-agent-protocol-ecosystem-map-2026-mcp-a2a-acp-ucp> — Cartographie comparative MCP / A2A / ACP / UCP ; source secondaire, croiser avec les spécifications primaires.
- Brosset, P. (Microsoft Edge) — « WebMCP updates, clarifications, and next steps » — patrickbrosset.com, 23 février 2026 — <https://patrickbrosset.com/articles/2026-02-23-webmcp-updates-clarifications-and-next-steps/> — État du support navigateur et roadmap W3C.
- NIST / CAISI — « Announcing the AI Agent Standards Initiative for Interoperable and Secure Innovation » — NIST, 17 février 2026 — <https://www.nist.gov/news-events/news/2026/02/announcing-ai-agent-standards-initiative-interoperable-and-secure> — Initiative de standardisation fédérale américaine ; signale la convergence réglementaire avec les protocoles ouverts.

### 3. AgentOps — opérations en production

- Joshi, S. — « LLMOps, AgentOps, and MLOps for Generative AI: A Comprehensive Review » — *International Journal of Computer Applications Technology and Research*, vol. 14 n° 7, 2025 — <https://ijcat.com/archieve/volume14/issue7/ijcatr14071001.pdf> — Seul article académique à jour sur le delta opérationnel MLOps → AgentOps.
- OpenTelemetry — « Semantic Conventions for GenAI agent and framework spans » — SemConv 1.40.0, 17 avril 2026 — <https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/> — Standard d'instrumentation de référence ; statut *Development*, API non stabilisée à mai 2026.
- Anthropic Engineering — « Demystifying evals for AI agents » — Anthropic, 2025-2026 — <https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents> — Régression continue et *replay* déterministe expliqués par les équipes de l'éditeur.
- N-iX — « AI agent observability: The new standard for enterprise AI in 2026 » — N-iX Engineering, 2026 — <https://www.n-ix.com/ai-agent-observability/> — Synthèse praticienne sur les outils d'observabilité (LangSmith, Langfuse, Arize).
- Microsoft — « From Zero to Hero: AgentOps — End-to-End Lifecycle Management for Production AI Agents » — Azure AI Foundry Blog, 2026 — <https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/from-zero-to-hero-agentops---end-to-end-lifecycle-management-for-production-ai-a/4484922> — Perspective plateforme (Azure) sur le cycle de vie *promote/deprecate/rollback*.

### 4. Sécurité agentique

- OWASP GenAI Security Project — « OWASP Top 10 for Agentic Applications for 2026 » — OWASP, décembre 2025 — <https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/> — Taxonomie de référence des vecteurs d'attaque ; lecture obligatoire pour tout architecte sécurité.
- Cloud Security Alliance — « The Attack and Defense Landscape of Agentic AI: A Comprehensive Survey » — arXiv:2603.11088, mars 2026 — <https://arxiv.org/html/2603.11088v1> — Revue systématique des mécanismes d'attaque et de défense, couvrant l'état de l'art de la recherche.
- Amit et al. (Aim Security) — « EchoLeak: The First Real-World Zero-Click Prompt Injection Exploit in a Production LLM System » — arXiv:2509.10540, septembre 2025 — <https://arxiv.org/abs/2509.10540> — Exploitation en conditions réelles ; démontre la viabilité des attaques indirectes à grande échelle.
- Palo Alto Networks Unit 42 — « New Prompt Injection Attack Vectors Through MCP Sampling » — Unit 42, 2025-2026 — <https://unit42.paloaltonetworks.com/model-context-protocol-attack-vectors/> — Vecteurs spécifiques à MCP ; indispensable pour toute architecture MCP en production.
- OX Security — « The Mother of All AI Supply Chains: Critical, Systemic Vulnerability at the Core of Anthropic's MCP » — OX Security, avril 2026 — <https://www.ox.security/blog/the-mother-of-all-ai-supply-chains-critical-systemic-vulnerability-at-the-core-of-the-mcp/> — RCE supply chain dans les SDKs officiels MCP ; source primaire de risque documenté.
- NCCoE / NIST — « Accelerating the Adoption of Software and AI Agent Identity and Authorization » (Concept Paper) — NIST, 5 février 2026 — <https://www.nccoe.nist.gov/sites/default/files/2026-02/accelerating-the-adoption-of-software-and-ai-agent-identity-and-authorization-concept-paper.pdf> — Cadrage fédéral sur l'identité des agents ; fondement des architectures *least-privilege* dynamique.
- IETF — « The OAuth 2.1 Authorization Framework » (draft-ietf-oauth-v2-1) — IETF, 2025-2026 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-v2-1/> — Draft en cours de ratification ; socle des schémas d'autorisation per-task pour agents.

### 5. Gouvernance et conformité

- ISO — « ISO/IEC 42001:2023 — Artificial Intelligence Management Systems » — ISO, décembre 2023 — <https://www.iso.org/standard/42001> — Norme de certification organisationnelle IA ; la plus opérationnelle pour les programmes agentiques d'entreprise.
- NIST — « AI 600-1 — Generative Artificial Intelligence Profile » — NIST, juillet 2024 — <https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf> — Extension du AI RMF 1.0 aux systèmes génératifs et agentiques ; quatre fonctions : Gouverner, Cartographier, Mesurer, Gérer.
- OSFI — « Guideline E-23 — Model Risk Management » — OSFI, en vigueur 1ᵉʳ mai 2027 — <https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027> — Référence réglementaire canadienne obligatoire pour le secteur financier.
- Reuel, A. et al. — « AI Agents Under EU Law: A Compliance Architecture for AI Providers » — arXiv:2604.04604, avril 2026 — <https://arxiv.org/html/2604.04604v1> — Traduction juridique de l'EU AI Act en exigences d'architecture ; la source académique la plus opérationnelle disponible à mai 2026.
- FINOS — « AI Governance Framework v2.0 — MI-21 Agent Decision Audit and Explainability » — FINOS, 2026 — <https://air-governance-framework.finos.org/mitigations/mi-21_agent-decision-audit-and-explainability.html> — Cadre sectoriel finance ; exigences d'auditabilité des décisions agentiques.
- Raymond Chabot Grant Thornton — « Loi 25 : l'enjeu des décisions automatisées » — RCGT, 2024-2026 — <https://www.rcgt.com/fr/conseils/avis-d-experts/loi-25-enjeu-decisions-automatisees/> — Application québécoise aux décisions prises par ou via des agents ; contexte canadien francophone.

### 6. Cas concrets et retours d'expérience

- Databricks — *State of AI Agents 2026* — Databricks, 2026 — <https://www.databricks.com/resources/ebook/state-of-ai-agents> — Source primaire du multiplicateur 12× (organisations *governance-first*) ; base empirique la plus large sur les pratiques de déploiement.
- Fortune — « Klarna Reverses AI Customer Service Replacement » — Fortune, 9 mai 2025 — <https://fortune.com/2025/05/09/klarna-ai-humans-return-on-investment/> — Contre-exemple documenté au ROI agentique naïf : élimination puis réembauche d'agents humains.
- Shah, M. B. et al. — « Characterizing Faults in Agentic AI: A Taxonomy of Types, Symptoms, and Root Causes » — arXiv:2603.06847, mars 2026 — <https://arxiv.org/abs/2603.06847> — Taxonomie académique des défaillances ; lecture structurante avant la définition d'un programme de tests de régression.
- Earezki.com — « AI Agent Observability: Lessons from the Replit Production Data Loss Incident » — mars 2026 — <https://earezki.com/ai-news/2026-03-18-the-ai-agent-that-defied-a-code-freeze-deleted-1200-customer-records-and-then-lied-about-it/> — Incident documenté de suppression de 1 200 enregistrements clients ; analyse causale sur l'absence de *kill switch* et de *retry budget*.
- InfoWorld — « FinOps for agents: Loop limits, tool-call caps and the new unit economics of agentic SaaS » — InfoWorld, 2026 — <https://www.infoworld.com/article/4138748/finops-for-agents-loop-limits-tool-call-caps-and-the-new-unit-economics-of-agentic-saas.html> — Incident documenté de 47 000 $ de dépense non intentionnelle par boucle sans plafond ; base pour calibrer un *retry budget*.

### 7. Dimension organisationnelle et travail

- Deloitte AI Institute — « The State of AI in the Enterprise 2026 » — Deloitte, mars 2026 — <https://www.deloitte.com/us/en/what-we-do/capabilities/applied-artificial-intelligence/content/state-of-ai-in-the-enterprise.html> — Enquête principale sur l'adoption agentique en entreprise, incluant les données sur la réorganisation du travail.
- BCG / MIT Sloan Management Review — « The Emerging Agentic Enterprise: How Leaders Must Navigate a New Age of AI » — MIT SMR + BCG, novembre 2025 — <https://sloanreview.mit.edu/projects/the-emerging-agentic-enterprise-how-leaders-must-navigate-a-new-age-of-ai/> — Cadre stratégique exécutif sur la transition organisationnelle ; perspective complémentaire à la dimension technique.
- Srinivasan, S. & Wei, V. — « To Thrive in the AI Era, Companies Need Agent Managers » — *Harvard Business Review*, 12 février 2026 — <https://hbr.org/2026/02/to-thrive-in-the-ai-era-companies-need-agent-managers> — Définit le rôle d'*AI ops manager* ; source de référence sur les nouveaux rôles organisationnels.
- Stanford HAI — « The 2026 AI Index Report » — Stanford Human-Centered AI, 2026 — <https://hai.stanford.edu/ai-index/2026-ai-index-report> — Panorama annuel quantitatif de l'adoption, de l'emploi et des politiques IA ; source secondaire de référence pour contextualisation macro.

### 8. Perspectives et horizon 2027–2030

- Gartner — « 2026 Hype Cycle for Agentic AI » — Gartner, 2026 — <https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai> — Positionnement de l'*agentic AI governance*, de l'*agentic AI security* et du *FinOps agentique* sur le cycle 2026.
- McKinsey — « Building the Foundations for Agentic AI at Scale » — McKinsey Technology, 2026 — <https://www.mckinsey.com/capabilities/mckinsey-technology/our-insights/building-the-foundations-for-agentic-ai-at-scale> — Cadre d'exécution à l'échelle ; biais commercial McKinsey à signaler, mais les checklists de préparation organisationnelle sont actionnables.
- Forrester — « How Agentic AI Elevates The Enterprise Architect's Role » — Forrester, 2025-2026 — <https://www.forrester.com/blogs/the-future-of-the-enterprise-architects-job/> — Repositionnement du rôle d'architecte d'entreprise face à l'*agentic AI* ; lecture recommandée pour les équipes d'architecture.
- Fujitsu — « Fujitsu develops multi-AI agent collaboration technology to optimize supply chains » — Fujitsu Global PR, décembre 2025 — <https://global.fujitsu/en-global/pr/news/2025/12/01-02> — Signal industriel : déploiement de coordination multi-agents en chaînes d'approvisionnement manufacturing.

---

## Mode d'emploi — Parcours par rôle

**Étape 1 — Identifier son rôle prioritaire** parmi les quatre profils du livre (CIO, architecte, *product owner*, *risk officer*). Chaque rôle a un point d'entrée différent dans cette annexe et dans la monographie.

- *CIO* : lire d'abord les thèmes 6 (cas concrets) et 7 (organisationnel), puis 5 (gouvernance). Les chapitres de référence sont [Ch. 2](ch02-business-case.md), [Ch. 11](ch11-redesigning-work.md) et [Ch. 13](ch13-road-ahead.md).
- *Architecte d'entreprise ou de solution* : commencer par les thèmes 1 (fondations) et 2 (protocoles), puis 3 (AgentOps). Les chapitres de référence sont [Ch. 1](ch01-from-automation-to-agents.md), [Ch. 5](ch05-protocols-interoperability.md), [Ch. 6](ch06-orchestration-memory-tools.md) et [Ch. 7](ch07-agentops.md).
- *Product owner* : aller directement aux thèmes 6 (cas concrets) et 8 (horizon), avec les chapitres [Ch. 3](ch03-mapping-high-impact.md) et [Ch. 4](ch04-roi-risk-readiness.md) comme base de priorisation.
- *Risk officer* : thèmes 4 (sécurité) et 5 (gouvernance) d'abord, puis 6 pour les incidents documentés. Chapitres de référence : [Ch. 8](ch08-trustworthy-systems.md), [Ch. 9](ch09-agentic-security.md) et [Ch. 12](ch12-lessons-failed.md).

**Étape 2 — Consulter le [glossaire.md](glossaire.md) complet** avant de lire les chapitres techniques (Ch. 5 à Ch. 9) : les conventions terminologiques — notamment la distinction *agent* / *agentic AI* et la convention réglementaire OSFI E-23 — conditionnent la lecture correcte des recommandations architecturales.

**Étape 3 — Tracer les renvois croisés** au fur et à mesure : chaque chapitre de la monographie contient une section « Pour aller plus loin » avec 3 à 5 sources sélectives commentées, et la section `## Références` complète. Les sources de la présente annexe en sont la synthèse transversale ; retourner au chapitre source pour le contexte complet de chaque citation.

---

*Renvois croisés : tous les chapitres ([Ch. 1](ch01-from-automation-to-agents.md) à [Ch. 13](ch13-road-ahead.md)), [Annexe A](annexe-A-architecture-review.md), [Annexe B](annexe-B-use-case-canvas.md), [Annexe C](annexe-C-agentops-maturity.md), [Annexe D](annexe-D-governance-raci.md), [glossaire.md](glossaire.md).*
