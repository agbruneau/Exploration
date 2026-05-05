---
title: "Scaling Without Lock-In"
chapter: 10
part: 4
status: "esquisse"
length_target_words: 5000
reading_time_min: 20
last_updated: "2026-05-05"
---

<!-- Notes de recherche — Phase 2 (8-12 sources)

1. AWS Bedrock AgentCore 2026 — « Amazon Bedrock now offers OpenAI models, Codex, and Managed Agents (Limited Preview) » — AWS News Blog — avril 2026 — https://aws.amazon.com/about-aws/whats-new/2026/04/bedrock-openai-models-codex-managed-agents/ — Multi-vendor expansion : Bedrock ajoute modèles OpenAI et support d'agents gérés. Feature Supervisor with Routing Mode pour orchestration multi-agents. Apport : validation que Bedrock devient plus multi-fournisseur, mais resterait cloudlock au transport AWS.

2. Microsoft Azure AI Foundry — « Azure AI Foundry Agent Service Practical Guide: Enterprise Deployment Decisions for 2026 » — youngju.dev — avril 2026 — https://www.youngju.dev/blog/ai-platform/2026-04-12-azure-ai-foundry-agent-service-practical-guide.en — Azure-locked : agents tightly bound à subscriptions Azure, Entra ID, networking Azure. Soutient A2A, MCP pour interop. Apport : identification précise du lock-in Azure AI Foundry au niveau cloud/identity.

3. Google Vertex AI Agent Builder 2026 — « Google Cloud Next 2026: AI agents, A2A protocol, Workspace Studio » — thenextweb.com — mai 2026 — https://thenextweb.com/news/google-cloud-next-ai-agents-agentic-era — Vertex AI renommé Gemini Enterprise Agent Platform. A2A protocol natif. MCP support complet pour Google services (BigQuery, Maps, Compute Engine, Kubernetes Engine). Apport : Vertex AI comme first-mover A2A natif, avec edge vers portabilité inter-platforme.

4. IBM watsonx Orchestrate 2026 — « Manage all your AI agents in one place with watsonx Orchestrate | IBM » — IBM official announcement — 2026 — https://www.ibm.com/new/announcements/manage-all-your-ai-agents-in-one-place-with-watsonx-orchestrate — Agent Catalog : support agents IBM, Langflow, LangGraph, A2A. Framework-agnostic orchestration. 150+ enterprise connectors. Apport : IBM comme joueur openness-first, multi-framework interop.

5. Salesforce Agent Fabric 2026 — « Salesforce Advances Agent Fabric: New Guided Determinism and Governance Controls » — Salesforce Newsroom — 2026 — https://www.salesforce.com/news/stories/agent-fabric-control-plane-announcement/ — Multi-vendor control plane : découverte agents Bedrock, Foundry, GoDaddy. Agent Broker beta avril 2026. GA juin 2026. Limitation : full governance sur Agentforce seulement. Apport : cas de contrôle plan multi-vendor avec limites d'enforcement concrètes.

6. LiteLLM Gateway Patterns 2026 — « LLM Gateway Comparison 2026: OpenRouter, Cloudflare, LiteLLM, and RelayPlane » — relayplane.com — 2026 — https://relayplane.com/blog/llm-gateway-comparison-2026 — LiteLLM : open-source proxy MIT, Python, OpenAI-compatible, 100+ modèles. Stratégie : self-host, route anywhere, cost control. OpenRouter : SaaS managed. Apport : pattern de gateway multi-vendor comme alternative à lock-in propriétaire.

7. Vendor Lock-In Enterprise Agentic AI 2026 — « Enterprise Agentic AI Landscape 2026: Trust, Flexibility, and Vendor Lock-In » — Kai Waehner — avril 2026 — https://www.kai-waehner.de/blog/2026/04/06/enterprise-agentic-ai-landscape-2026-trust-flexibility-and-vendor-lock-in/ — Multi-model strategy pour éviter lock-in fournisseur. 86% enterprises multi-cloud. AI vendor lock-in = six-figure cost event single workload. Apport : chiffrage TCO migration, justification multi-cloud architecturale.

8. Open Agentic Stack vs Proprietary 2026 — « Top 5 AI Agent Frameworks 2026: LangGraph, CrewAI & More » — intuz.com — 2026 — https://www.intuz.com/blog/top-5-ai-agent-frameworks-2025 — LangGraph (stateful workflows), AutoGen (multi-agent), CrewAI (role teams), OpenAgents (finance), MetaGPT (software dev). Gap closed between open/proprietary sur coding benchmarks. Apport : paysage frameworks open-source com alternative.

9. A2A Protocol in Production — « Google Cloud Next 2026: AI agents, A2A protocol, Workspace Studio, and the full-stack bet against OpenAI and Anthropic » — thenextweb.com — mai 2026 — https://thenextweb.com/news/google-cloud-next-ai-agents-agentic-era — A2A : 150 organisations production, enabling scenarios Salesforce+Google+ServiceNow cross-vendor. Standard de fait pour multi-vendor orchestration. Apport : A2A maturité production, validation cross-vendor delegation.

10. MCP Adoption Across Platforms — « Multi-Agent AI Systems with Google Vertex AI, ADK, A2A, and MCP » — tietoevry.com — 2025-2026 — https://www.tietoevry.com/en/blog/2025/07/building-multi-agents-google-ai-services/ — MCP now available across Google, AWS (via bedrock), Azure (via Foundry). Standard de facto pour tool abstraction. Apport : MCP convergence multi-vendor validation.

11. Multi-Vendor Governance and Portability 2026 — « Salesforce Stakes Out Multi-Vendor Agent Control Plane—Determinism, Governance, Enforcement Remains the Test » — futurumgroup.com — 2026 — https://futurumgroup.com/insights/salesforce-stakes-out-multi-vendor-agent-control-plane-determinism-governance-enforcement-remains-the-test/ — Control plane architecture pour multi-vendor agents. Challenges : deterministic orchestration, governance parity, enforcement. Apport : technical challenges multi-vendor governance identifiés.

12. Open Source vs Proprietary Trade-Offs 2026 — « Best Open-Source AI Agents 2026 | AgentGavel » — agentgavel.com — 2026 — https://agentgavel.com/blog/best-open-source-ai-agents-2026 — Open-source : customization, privacy, no lock-in. Proprietary : faster deployment, vendor support, tighter integration. Framework choice lock-in vs transport layer lock-in. Apport : articulation explicite des trade-offs open vs proprietary au niveau framework vs infrastructure.

-->

> **Partie 4 — Confiance, sécurité, durabilité**
> **Chapitre 10 · Scaling Without Lock-In · ~5 000 mots · lecture ≈ 20 min**

## Esquisse

**Thèse :** la portabilité des systèmes multi-agents d'entreprise en 2026 ne s'obtient ni par le choix d'une plateforme propriétaire hyperscaleur (Bedrock AgentCore, Azure AI Foundry, Vertex AI Agent Builder, watsonx.ai, Agentforce) ni par l'adhésion exclusive à un framework open-source (LangGraph, CrewAI, AutoGen). Elle repose sur trois niveaux d'abstraction — MCP pour l'accès aux outils, A2A pour la coordination inter-agents, gateway patterns (LiteLLM, OpenRouter) pour le routage multi-fournisseur de modèles — qui permette un architecte de changer de fournisseur ou de combiner des agents de plusieurs plateformes sans réécrire les logiques métier. Les hyperscaleurs convergent vers ces standards ouverts (avril-mai 2026) : AWS ajoute support OpenAI et A2A natif à Bedrock ; Azure soutient MCP/A2A dans Foundry ; Google Vertex AI (renommé Gemini Enterprise Agent Platform) déploie A2A et MCP comme infrastructure natale ; IBM watsonx Orchestrate offre un control plane agnostique. Le coût réel de migration est documenté comme six figures (single workload) à sept figures (plateforme partagée) pour une organisation qui s'est verrouillée à un seul fournisseur sans abstraction.

**Question centrale :** Comment architecturer un système d'agents capable de supporter plusieurs fournisseurs de modèles, plusieurs plateformes de déploiement et plusieurs frameworks d'orchestration sans dupliquer la logique métier ou créer des dettes d'intégration exponentielles ?

**Lecteur cible :** Architecte d'entreprise qui gère un portefeuille d'agents à l'échelle 10+, qui doit arbitrer entre coût, conformité géographique, performance latence et flexibilité future. CTO qui évalue l'investissement à 18-36 mois sur une stack d'agents.

**Renvois croisés prévus :** [Ch. 5](ch05-protocols-interoperability.md) (MCP/A2A comme couches, gouvernance AAIF), [Ch. 7](ch07-agentops.md) (observabilité et cycle de vie indépendant de la plateforme), [Ch. 8](ch08-trustworthy-systems.md) (auditabilité et conformité indépendantes de la plateforme), [Ch. 9](ch09-agentic-security.md) (sécurité protocolaire et supply chain). Renvois vers Annexes si checkpoints de décision.

---

## Plan détaillé

### 10.1 — Les trois formes de lock-in : plateforme, framework, modèle

**Phrase-clé :** Distinguer lock-in au transport/infrastructure vs lock-in aux primitives de programmation vs lock-in au fournisseur de modèle pour identifier à quel niveau investir dans la portabilité.

- Plateforme : données, identité, networking confinées à un hyperscaleur (Azure-locked, AWS-locked, GCP-locked). Coût de migration : 6-7 figures. Temps : 18-36 mois. Irréversibilité : données de production, contrats volumes. Exemples concrets 2026 : Azure AI Foundry (subscription lock), AWS Bedrock (credentials régionales), Vertex AI (GCP projects).

- Framework : logique d'orchestration, patrons d'agent, abstraction mémoire liées à un SDK (LangGraph-lock, AutoGen-lock, CrewAI-lock). Coût de réécriture : significatif mais < plateforme. Temps : 3-12 mois. Alternative : gateway abstraction layer ou wrapper de conversion.

- Modèle : fournisseur de LLM spécifique (OpenAI-only, Claude-only, Gemini-only). Coût : plus faible si abstraction API déjà en place. Temps : jours à semaines si LiteLLM/OpenRouter intégré. Flexibilité : la plus haute via gateway patterns.

**Tableau comparatif** : trois axes (coût réécriture, temps migration, urgence de mitigation pour 2026).

---

### 10.2 — État de convergence des hyperscaleurs (mai 2026)

**Phrase-clé :** Les trois majeurs (AWS, Azure, GCP) et les joueurs secondaires (IBM, Salesforce) adoptent MCP + A2A comme couches standards, ce qui transforme ces protocoles d'option technique en infrastructure de fait.

#### AWS Bedrock AgentCore
- Multi-vendor : support OpenAI models (avril 2026), agents gérés, orchestration supervisor+routing. Limitation : transport propriétaire CloudWatch, IAM AWS obligatoire. MCP standard via serveurs tiers.

#### Azure AI Foundry
- Soutient MCP, A2A, LangGraph, AutoGen, Semantic Kernel. Limitation : Entra ID et subscriptions Azure obligatoires. Avantage : interop réelle avec Copilot Studio (Microsoft Fabric).

#### Google Vertex AI Agent Builder (renommé Gemini Enterprise Agent Platform)
- A2A natif, MCP natif pour Google services (BigQuery, Maps, Compute Engine) et services tiers. ADK (Agent Development Kit) + Interactions API.

#### IBM watsonx Orchestrate
- Agent Catalog : agents IBM, LangFlow, LangGraph, A2A. Framework-agnostic. Apport : le plus « openness-first » des hyperscaleurs.

#### Salesforce Agentforce + Agent Fabric
- Control plane multi-vendor : découverte agents Bedrock, Foundry, GoDaddy. Agent Broker (GA juin 2026). Limitation : full governance sur Agentforce only.

---

### 10.3 — Portabilité par MCP et A2A : le modèle architectural

**Phrase-clé :** MCP + A2A constituent une couche d'abstraction qui permet un agent de changer de plateforme ou de fournisseur LLM en gardant ses outils et sa logique de coordination intact.

- Mécanisme MCP : serveur MCP = contrat indépendant de la plateforme. Deux agents (l'un sur Bedrock, l'un sur Foundry) peuvent appeler le même serveur MCP sans adaptation.

- Mécanisme A2A : Agent Card = découverte de capacités agnostique. Un agent peut déléguer à un agent tiers (Salesforce, Google, AWS) sans connaître a priori son implémentation, pourvu que l'Agent Card soit signé et que les transports (JSON-RPC, gRPC) soient supportés.

- Condition de succès : les trois éléments (prompt système, ensemble d'outils MCP, configuration A2A) doivent être versionés comme unité (voir Ch. 7 §7.6). Un changement d'une composante = nouvelle version de l'agent.

---

### 10.4 — Stratégie multi-vendor : routage par capacité, coût, latence, conformité

**Phrase-clé :** Un architecte qui déploie 10+ agents peut acheter capacité (inference + orchestration) auprès de trois hyperscaleurs en parallèle, router dynamiquement selon coût courant, exigences de latence ou résidence de données, sans réécriture.

- **Routage par coût :** LiteLLM (self-host) ou OpenRouter (SaaS) comme couche devant les trois hyperscaleurs. Baseline quotidienne de prix. Script d'optimisation qui envoie la requête au fournisseur le moins coûteux pour le modèle + température + window size combinaison actuelle.

- **Routage par latence :** Mesure P50/P99 par hyperscaleur par région. Pour une tâche time-sensitive (agents client-facing), router vers région AWS closest. Pour tâche batch (batch conformité mensuelle), accepter latence pour conformité de résidence de données.

- **Routage par conformité :** UE AI Act impose résidence données EU. Agent peut router à Azure EU-West pour ce cas, Azure US pour autres. Statut mai 2026 : aucun hyperscaleur n'implémente ce routage nativement ; l'orchestrateur client doit l'implémenter.

- **Exemples 2026 documentés :** Bedrock AgentCore multi-region failover (AWS), Foundry A2A cross-subscription (Microsoft), Vertex AI + GDC (Google on-prem).

---

### 10.5 — Pièges de lock-in résiduels et patterns d'isolation

**Phrase-clé :** Même avec MCP + A2A, trois pièges courants verrouillent une organisation : données d'entraînement propriétaires du fournisseur, sérialisation de schémas, observabilité liée au transport.

- **Données d'entraînement :** Un agent Bedrock fine-tuné sur data propriétaire est verrouillé à Bedrock. Mitigation : garder données et modèle de base open-source (Llama, Mistral), fine-tuner localement, déployer partout. Coût : infrastructure locale.

- **Sérialisation de schémas :** Un outil retourne `application/vnd.aws-agent-result+json` ou `vnd.azure-agent-output` — format propriétaire de l'hyperscaleur. MCP résout ce problème pour outils, mais pas pour sorties d'agents. Mitigation : normer sur JSON-LD ou JSON Schema avec schéma gouvernance interne.

- **Observabilité cloudlock :** CloudWatch pour Bedrock, Azure Monitor pour Foundry, Cloud Trace pour Vertex. Pour portabilité, instrumenter OTel + backend neutre (Datadog, Prometheus, stack open-source). Voir [Ch. 7](ch07-agentops.md).

---

### 10.6 — Recommandation architecturale : modèle en couches isolées

**Phrase-clé :** Isoler la logique métier en trois couches — **Couche Agent** (stateless, orchestration), **Couche Abstraction** (MCP servers, A2A contracts), **Couche Plateforme** (AWS/Azure/GCP) — permet de changer la couche Plateforme sans toucher aux deux autres.

- Couche 1 — Agent : prompt système, rules de décision, cycle de vie. Framework-agnostique si implémenté en LLM + stateless orchestrator.
- Couche 2 — Abstraction : MCP servers (tools, resources, prompts), A2A Agent Cards, gateway patterns (LiteLLM). Indépendant de toute plateforme hyperscaleur.
- Couche 3 — Plateforme : déploiement, identité, monitoring. Cloudlock accepté ici, isolé.

**Compromis :** cette architecture ajoute une couche d'indirection (Couche 2) qui consomme latence et coûts en inférence. Pour agents latency-sensitive (< 100 ms P99), cette overhead peut être inacceptable.

**Alternative :** déployer Couche Agent + Couche 2 sur hyperscaleur cible, accepter lock-in à court terme (18-24 mois), réévaluer à 24 mois quand standards matérialisent et coûts des hyperscaleurs se stabilisent. Timing 2026 : **pas encore la date de réévaluation pour les nouveaux déploiements**. Timing 2027-2028 : début de fenêtre pour réévaluation portabilité.

**Condition de bascule :** si le coût de réplication de logique métier (tripliquer le code d'orchestration pour trois hyperscaleurs différents) dépasse le coût de lock-in 6 figures, accepter lock-in court terme et investir dans sortie de lock-in seulement si business outcome l'exige.

---

### 10.7 — Cas d'usage : migration Bedrock → Foundry

**Phrase-clé :** Illustration concrète d'une organisation qui doit migrer 5 agents production de Bedrock vers Foundry pour conformité géographique EU AI Act.

- **Jour 1-5 :** Audit des agents : prompts, ensemble outils, permissions, configuration mémoire. Résultat : agents sont tightly coupled à Bedrock SDK, CloudWatch logging, IAM AWS.

- **Jour 6-20 :** Extraction. Réécrire agents comme conteneurs Docker avec MCP servers wrappant outils Bedrock. Migrer logging vers OTel.

- **Jour 21-25 :** Tester sur Foundry. Modèles différents (Grok vs Claude vs Gemini) produisent trajectoires différentes même avec même prompt. Shadow run 72h.

- **Jour 26-30 :** Cutover. Coût réel : 3-5 FTE × 4-5 semaines = 12-25 FTE-semaines. Infrastructure nouvelle (Azure + K8s). Formation équipes.

- **Leçon :** Avec MCP + A2A depuis jour 1, cycle = 2-3 semaines au lieu de 4-5. Investissement initial haut, payoff rapide si changement nécessaire.

---

### 10.8 — Statut des protocoles : divergences entre sources et questions ouvertes

**Phrase-clé :** Documenter les incertitudes : gouvernance AAIF stabilité réelle, timing de convergence A2A dans hyperscaleurs, statut MCP supply chain post-OX Security.

- **Incertitude 1 — Stabilité A2A :** Spec affichée v1.0.0 à mai 2026, mais date de release officielle non documentée publiquement. Risque : version ultérieure (1.1, 2.0) pourrait introduire breaking changes. Mitigation : surveiller processus RFC public sur a2a-protocol.org.

- **Incertitude 2 — Adoption MCP supply chain post-audit :** OX Security (avril 2026) a documenté RCE architecturale. Anthropic a confirmé « by design ». Statut mai 2026 : 9 registres sur 11 restent composables sans isolation. Risque : une nouvelle vulnérabilité supply chain peut dégonfler adoption. Question : MCP survivra-t-il à un second incident grave ?

- **Incertitude 3 — Timing multi-vendor maturation :** IBM, Salesforce affichent multi-vendor support, mais enforcement parity non démontré. Salesforce Agent Fabric full GA juin 2026. Risque : GA peut révéler limitations architecales. Monitoring recommandé : post-GA incident reports, customer case studies.

- **Question ouverte :** Est-ce que la convergence MCP + A2A des hyperscaleurs mai 2026 survivera aux pressions tarifaires (vendor dumping pour gain de marché) et aux divergences réglementaires (EU AI Act vs US NIST vs Chine) ? Hypothèse de travail : 70 % de probabilité que les deux protocoles deviennent standards de fait d'ici 18 mois, 30 % que fragmentation émerge.

---

## Sources clés

1. **AWS Bedrock AgentCore (avril 2026)** — Soutien multi-vendor et orchestration supervisor+routing confirmé. Référence pour état hyperscaleur AWS.

2. **Azure AI Foundry Agent Service (2026)** — Documentation MCP/A2A interop et limitations Azure-lock. Référence pour état Azure.

3. **Google Vertex AI Agent Builder / Gemini Enterprise Agent Platform (mai 2026)** — A2A natif + MCP natif pour services Google. Référence pour état GCP.

4. **IBM watsonx Orchestrate (2026)** — Agent Catalog framework-agnostic. Référence pour approche IBM openness-first.

5. **Salesforce Agent Fabric Control Plane (2026)** — Multi-vendor discovery et governance parity issues. Référence pour patterns de control plane.

6. **LiteLLM & OpenRouter Gateway Patterns (2026)** — Self-host vs SaaS pour multi-vendor LLM routing. Référence pour patterns d'abstraction couche modèle.

7. **Kai Waehner : Enterprise Agentic AI Landscape 2026** — TCO lock-in, multi-cloud strategies, 86 % enterprises multi-cloud. Référence pour justification architecturale multi-vendor.

8. **Top 5 Agentic AI Frameworks 2026** — LangGraph, AutoGen, CrewAI, OpenAgents, MetaGPT avec cas d'usage distincts. Référence pour paysage frameworks open-source.

9. **A2A Protocol Production (mai 2026)** — 150 organisations production, cross-vendor delegation Salesforce+Google+ServiceNow. Référence pour maturité A2A production.

10. **MCP Across Platforms (2025-2026)** — MCP support convergence AWS, Azure, GCP. Référence pour adoption MCP hyperscaleur.

---

## Références

- AWS — « Amazon Bedrock now offers OpenAI models, Codex, and Managed Agents » — AWS News Blog — avril 2026 — https://aws.amazon.com/about-aws/whats-new/2026/04/bedrock-openai-models-codex-managed-agents/
- youngju.dev — « Azure AI Foundry Agent Service Practical Guide: Enterprise Deployment Decisions for 2026 » — 12 avril 2026 — https://www.youngju.dev/blog/ai-platform/2026-04-12-azure-ai-foundry-agent-service-practical-guide.en
- TheNextWeb — « Google Cloud Next 2026: AI agents, A2A protocol, Workspace Studio, and the full-stack bet against OpenAI and Anthropic » — mai 2026 — https://thenextweb.com/news/google-cloud-next-ai-agents-agentic-era
- IBM — « Manage all your AI agents in one place with watsonx Orchestrate » — IBM Announcement — 2026 — https://www.ibm.com/new/announcements/manage-all-your-ai-agents-in-one-place-with-watsonx-orchestrate
- Salesforce — « Salesforce Advances Agent Fabric: New Guided Determinism and Governance Controls to Scale Multi-Vendor AI Faster » — Salesforce Newsroom — 2026 — https://www.salesforce.com/news/stories/agent-fabric-control-plane-announcement/
- RelayPlane — « LLM Gateway Comparison 2026: OpenRouter, Cloudflare, LiteLLM, and RelayPlane » — 2026 — https://relayplane.com/blog/llm-gateway-comparison-2026
- Kai Waehner — « Enterprise Agentic AI Landscape 2026: Trust, Flexibility, and Vendor Lock-In » — 6 avril 2026 — https://www.kai-waehner.de/blog/2026/04/06/enterprise-agentic-ai-landscape-2026-trust-flexibility-and-vendor-lock-in/
- Intuz — « Top 5 AI Agent Frameworks 2026: LangGraph, CrewAI & More » — 2026 — https://www.intuz.com/blog/top-5-ai-agent-frameworks-2025
- TheNextWeb — « Google Cloud Next 2026 » (A2A production status) — mai 2026 — https://thenextweb.com/news/google-cloud-next-ai-agents-agentic-era
- Tietoevry — « Multi-Agent AI Systems with Google Vertex AI, ADK, A2A, and MCP » — 2025-2026 — https://www.tietoevry.com/en/blog/2025/07/building-multi-agents-google-ai-services/
- Futurum Group — « Salesforce Stakes Out Multi-Vendor Agent Control Plane » — 2026 — https://futurumgroup.com/insights/salesforce-stakes-out-multi-vendor-agent-control-plane-determinism-governance-enforcement-remains-the-test/
