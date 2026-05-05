---
title: "Protocols and Interoperability"
chapter: 5
part: 3
status: "esquisse"
length_target_words: 6500
reading_time_min: 26
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement)

1. Linux Foundation / AAIF — « Linux Foundation Announces the Formation of the Agentic AI Foundation (AAIF) » — 9 décembre 2025 — https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation — Annonce officielle de la création de l'AAIF comme *directed fund* sous la Linux Foundation. Membres Platinum fondateurs : AWS, Anthropic, Block, Bloomberg, Cloudflare, Google, Microsoft, OpenAI. Trois projets fondateurs : MCP (Anthropic), goose (Block), AGENTS.md (OpenAI). Gouvernance : *AAIF Governing Board* pour les investissements stratégiques et l'approbation de nouveaux projets ; les projets maintiennent leur autonomie technique. Apport : clarification que « donation à la Linux Foundation » est une simplification — c'est la création d'une nouvelle fondation AAIF sous l'égide de la Linux Foundation, avec MCP comme projet fondateur.

2. AAIF — « MCP Is Now Enterprise Infrastructure: Everything That Happened at MCP Dev Summit North America 2026 » — AAIF Blog — avril 2026 — https://aaif.io/blog/mcp-is-now-enterprise-infrastructure-everything-that-happened-at-mcp-dev-summit-north-america-2026/ — Résultats du MCP Dev Summit NYC (2-3 avril 2026) : 110+ millions de téléchargements SDK par mois, AAIF atteint 170 organisations en moins de quatre mois (dépasse le rythme d'adoption de la CNCF à étape équivalente). Cas Uber : 5 000+ ingénieurs, 10 000+ services internes, 1 500+ agents actifs mensuels, 60 000+ exécutions hebdomadaires via MCP. Modèle de confiance à deux niveaux (serveurs internes vs tiers). Politique de cycle de vie des projets AAIF : trois stades (Growth, Impact, Emeritus). Apport : validation de la maturité opérationnelle de MCP à grande échelle en production enterprise.

3. modelcontextprotocol.io — « SDKs — Model Context Protocol » — documentation officielle — mai 2026 — https://modelcontextprotocol.io/docs/sdk — SDKs officiels classifiés en trois tiers : Tier 1 (TypeScript, Python, C#, Go — fonctionnalité complète + engagement de maintenance), Tier 2 (Java, Rust), Tier 3 (Swift, Ruby, PHP), TBD (Kotlin). Primitives exposées par un serveur MCP : resources (données accessibles en lecture), tools (fonctions invocables), prompts (modèles réutilisables), sampling (demande au client d'effectuer une complétion LLM). Transport : stdio (local) et SSE / HTTP (réseau). Apport : inventaire exact des primitives et de la hiérarchie des SDKs officiels.

4. Google Cloud Blog — « Agent2Agent protocol (A2A) is getting an upgrade » — 31 juillet 2025 — https://cloud.google.com/blog/products/ai-machine-learning/agent2agent-protocol-is-getting-an-upgrade — Version v0.3 livrée le 31 juillet 2025 : support gRPC, signature des Agent Cards, SDK Python étendu. Donation de A2A à la Linux Foundation en juin 2025. 150+ organisations au total. Cas production : Tyson Foods + Gordon Food Service (synchronisation d'agents de vente et d'approvisionnement inter-entreprises). Apport : chronologie confirmée — A2A lancé avril 2025, donné à la LF juin 2025, v0.3 juillet 2025.

5. a2a-protocol.org — « Agent2Agent (A2A) Protocol Specification » — version 1.0.0 — https://a2a-protocol.org/latest/specification/ — Spec officielle v1.0.0 (la plus récente au 2026-05-05). Quatre primitives : Agent Card (JSON décrivant identité, capacités, endpoint), Task (unité de travail avec cycle de vie : SUBMITTED → WORKING → COMPLETED / FAILED / CANCELED / REJECTED / INPUT_REQUIRED / AUTH_REQUIRED), Message (unités de communication multi-parts), Artifact (sorties de tâche). Transports : JSON-RPC 2.0 / HTTP, gRPC, HTTP+JSON/REST. Sécurité : API key, HTTP auth, OAuth 2.0, OpenID Connect, mTLS. Apport : référence normative unique pour les primitives A2A.

6. Patrick Brosset (Microsoft Edge) — « WebMCP updates, clarifications, and next steps » — 23 février 2026 — https://patrickbrosset.com/articles/2026-02-23-webmcp-updates-clarifications-and-next-steps/ — Auteur : équipe Microsoft Edge, co-auteur avec Google. Spec développée via le Web Machine Learning Working Group du W3C. API : navigator.modelContext — provideContext(), registerTool(), unregisterTool(), agent.requestUserInteraction(). Relation à MCP : WebMCP adresse uniquement la couche primitives (tools) ; le navigateur traduit vers le format MCP en gérant les couches data et transport. Statut en date : Google Chrome a lancé une préversion anticipée (Chrome 146) ; Microsoft Edge a annoncé une prochaine intégration sans date précise. Apport : source primaire de l'auteur, clarification que WebMCP n'est PAS un protocole séparé de MCP mais une couche navigateur qui implémente les primitives MCP — distinction critique.

7. DEV Community / AI Agent Economy — « WebMCP in 2026: Which Browsers Support navigator.modelContext? » — 2026 — https://dev.to/ai-agent-economy/webmcp-in-2026-which-browsers-support-navigatormodelcontext-complete-compatibility-status-1oe4 — Statut navigateurs mai 2026 : Chrome 146 (stable, implémentation complète), Edge 147 (support ajouté mars 2026), Firefox (en développement dans Bugzilla, estimation 8-12 semaines pour stable), Safari/WebKit (participation W3C mais aucun engagement public de timeline — à vérifier). Spec W3C au stade « Candidate Recommendation » — stable pour implémentation mais non ratifiée formellement ; recommandation finale prévue Q3 2026. Apport : tableau de compatibilité navigateurs avec dates confirmées ou estimées.

8. NIST / CAISI — « Announcing the AI Agent Standards Initiative for Interoperable and Secure Innovation » — 17 février 2026 — https://www.nist.gov/news-events/news/2026/02/announcing-ai-agent-standards-initiative-interoperable-and-secure — Lancement officiel le 17 février 2026. Trois piliers : (1) leadership sectoriel dans les organismes de normalisation internationaux (ISO/IEC JTC 1) ; (2) développement de protocoles open-source co-investi avec la NSF ; (3) recherche fondamentale en sécurité, identité et méthodologies d'évaluation de l'interopérabilité. Livrables prévus à court terme : RFI sécurité agent (échéance 9 mars), concept paper Identity and Authorization (échéance 2 avril), sessions d'écoute sectorielles (à partir d'avril 2026). Profil d'interopérabilité AI Agent prévu Q4 2026 (confirmé dans d'autres sources secondaires, non explicité dans le texte primaire NIST). Apport : seule source primaire NIST disponible, à citer directement.

9. IBM Research — Agent Communication Protocol (ACP) — https://research.ibm.com/projects/agent-communication-protocol — ACP : standard open source HTTP-natif REST, conçu par IBM Research pour communication inter-agents multi-frameworks, multi-langages. Statut actuel (mai 2026) : ACP absorbé dans A2A sous gouvernance Linux Foundation — « ACP is now part of A2A under the Linux Foundation ». IBM maintient le BeeAI Framework et Platform comme implémentations primaires. Architecture : REST/HTTP, SSE pour streaming, multimodal (texte, images, embeddings, structured data), discovery par métadonnées. Apport : ACP n'est plus un protocole concurrent de A2A — il est devenu une extension/contribution au projet A2A ; la comparaison « MCP vs A2A vs ACP » dans le TOC doit être nuancée en conséquence.

10. DigitalApplied — « AI Agent Protocol Ecosystem Map 2026 » — mars 2026 — https://www.digitalapplied.com/blog/ai-agent-protocol-ecosystem-map-2026-mcp-a2a-acp-ucp — Carte à quatre protocoles complémentaires : MCP (accès outils/données), A2A (coordination agents), ACP (transactions open agent-to-agent), UCP (Universal Commerce Protocol, Google, transactions commerce IA). Architecture en couches : AI Model → Agent Runtime → Tool Access Layer (MCP) → Agent Coordination Layer (A2A) → Commerce Layer (ACP/UCP). MCP : 97M téléchargements mensuels au moment de l'article (mars 2026). Apport : la seule cartographie complète multi-protocoles disponible en source secondaire rigoureuse — fournit le cadre comparatif du §5.5.

11. Palo Alto Networks Unit 42 — « New Prompt Injection Attack Vectors Through MCP Sampling » — 2025-2026 — https://unit42.paloaltonetworks.com/model-context-protocol-attack-vectors/ — Deux vecteurs d'attaque principaux via MCP : (1) tool poisoning — instructions malveillantes embedées dans les descriptions d'outils, invisibles à l'utilisateur mais visibles du modèle, permettant l'exfiltration cross-tool ; (2) injection via sampling — le serveur MCP contrôle à la fois le prompt et le traitement de la réponse LLM, permettant l'injection d'instructions persistantes. Aucune protection par le protocole : MCP ne définit pas de contrôles obligatoires sur les descriptions d'outils. Apport : documentation primaire des deux vecteurs d'attaque protocolaires les plus documentés, liés directement aux primitives MCP (tools, sampling).

12. OX Security — « The Mother of All AI Supply Chains: Critical, Systemic Vulnerability at the Core of Anthropic's MCP » — avril 2026 — https://www.ox.security/blog/the-mother-of-all-ai-supply-chains-critical-systemic-vulnerability-at-the-core-of-the-mcp/ — Vulnérabilité architecturale RCE affectant 150M+ téléchargements : non pas un bug de code mais une décision de design dans les SDK officiels MCP (Python, TypeScript, Java, Rust). 9 registres MCP sur 11 testés ont été compromis lors d'une injection d'essai. Anthropic a confirmé que le comportement est « by design » et a décliné de modifier le protocole. Apport : vulnérabilité la plus grave documentée à mai 2026 sur MCP, avec réponse officielle Anthropic — source critique pour §5.6 sur la sécurité des protocoles.

13. PRNewswire / A2A Project — « A2A Protocol Surpasses 150 Organizations, Lands in Major Cloud Platforms, and Sees Enterprise Production Use in First Year » — 2026 — https://www.prnewswire.com/news-releases/a2a-protocol-surpasses-150-organizations-lands-in-major-cloud-platforms-and-sees-enterprise-production-use-in-first-year-302737641.html — Bilan un an : 150+ organisations, intégration native Azure AI Foundry, Copilot Studio (Microsoft), Amazon Bedrock AgentCore Runtime (AWS). Production confirmée : Salesforce, SAP, ServiceNow. Apport : confirmation que Microsoft et AWS ont formellement adopté A2A — répond à la question ouverte du plan sur la « position Microsoft/AWS sur A2A ». DIVERGENCE : le blog Google Cloud (source 4) décrit v0.3 en juillet 2025 mais stellagent.ai décrit v1.0 comme la version production-grade de début 2026 — la spec a2a-protocol.org indique v1.0.0 comme version courante. À confirmer si « v1.0.0 » est une désignation officielle de release ou juste le numéro du schéma de la spec.
-->

## Esquisse

**Thèse.** En décembre 2025, la donation de MCP à l'Agentic AI Foundation (AAIF) sous la Linux Foundation et la convergence de A2A, ACP et WebMCP ont transformé l'interopérabilité agentique d'une promesse de laboratoire en contrainte architecturale réelle : tout système multi-agents d'entreprise déployé en 2026 doit choisir un empilement de protocoles, et ce choix détermine la portabilité, la sécurité et le coût de maintenance à 3-5 ans. Ce chapitre est le référentiel normatif de ce choix.

**Question centrale.** Comment un architecte d'entreprise choisit-il, combine-t-il et sécurise-t-il les protocoles d'interopérabilité agentique — MCP, A2A, WebMCP, ACP/UCP — en 2026, compte tenu de leur maturité différenciée, de leurs surfaces d'attaque protocolaires, et de l'évolution de la gouvernance via l'AAIF et le NIST ?

**Lecteur cible.** Architectes de solution et architectes d'entreprise évaluant ou déployant des systèmes multi-agents ; équipes de sécurité prenant en charge la surface d'attaque des protocoles ouverts ; responsables de gouvernance confrontés aux premières exigences de conformité sur l'interopérabilité agentique (NIST Q4 2026, ISO/IEC JTC 1).

**Renvois croisés prévus.**
- [Ch. 1 §1.5](ch01-from-automation-to-agents.md) — EDA comme substrat d'exécution ; Kafka comme bus d'événements reliant MCP et A2A (Waehner, 2025) → ce chapitre se concentre sur les protocoles applicatifs *au-dessus* de ce substrat, sans répliquer §1.5.
- [Ch. 4 §4.7](ch04-roi-risk-readiness.md) — le dossier d'investissement recommande MCP pour les outils, A2A pour l'orchestration multi-agents ; ce chapitre fournit la justification architecturale.
- [Ch. 6](ch06-orchestration-memory-tools.md) — les patrons d'orchestration (supervisor, swarm, hierarchical) s'appuient sur A2A pour la délégation inter-agents.
- [Ch. 9](ch09-agentic-security.md) — modèle de menace approfondi (tool poisoning, cross-tool exfiltration, jailbreak by delegation) ; ce chapitre introduit les vecteurs d'attaque protocolaires, Ch. 9 fournit la défense en profondeur.
- [Ch. 10](ch10-scaling-without-lockin.md) — portabilité par MCP/A2A comme condition du *scaling without lock-in*.

---

## Plan détaillé

### §5.1 — Le problème de l'interopérabilité agentique : pourquoi les APIs REST ne suffisent plus

**Phrase-clé :** Dans un système multi-agents, l'agent n'est plus un consommateur d'API — il est un orchestrateur dynamique dont le comportement à l'exécution dépend de la qualité sémantique et de la fiabilité des contrats protocolaires entre composants ; les APIs REST classiques ne définissent ni la découverte des capacités, ni le cycle de vie des tâches longues, ni l'identité des agents — lacunes que MCP et A2A comblent structurellement.

Sous-points :
- Limite structurelle des APIs REST pour les agents : absence de découverte de capacités, absence de cycle de vie de tâche avec états intermédiaires, modèle de sécurité conçu pour des humains authentifiés (OAuth pour utilisateurs) et non pour des agents machine-to-machine.
- La boucle *decide–act–observe* ([Ch. 1](ch01-from-automation-to-agents.md)) impose des contrats d'interface plus riches : l'agent doit pouvoir découvrir *ce qu'un outil fait* (pas seulement *comment l'appeler*), recevoir des résultats partiels sur des tâches longues, et déléguer à d'autres agents sans connaître leur implémentation interne.
- La fragmentation pré-2025 : avant MCP (novembre 2024), chaque éditeur d'agent définissait son propre format d'accès aux outils ; l'intégration d'un nouveau service imposait un adaptateur custom par paire (agent, outil). MCP résout ce problème N×M → N+M.

### §5.2 — MCP : architecture, primitives et gouvernance (décembre 2025 → mai 2026)

**Phrase-clé :** MCP est un standard JSON-RPC définissant quatre primitives (resources, tools, prompts, sampling) transportées via stdio ou HTTP/SSE, dont la donation à l'AAIF en décembre 2025 et l'atteinte de 110 millions de téléchargements mensuels en avril 2026 en font l'infrastructure de fait de l'accès aux outils agentiques — mais dont les primitives *sampling* et *resources* restent sous-exploitées dans la majorité des déploiements en production.

Sous-points :
- Architecture client-host-server : le *host* (ex. Claude Desktop, VS Code) héberge le *client* MCP qui maintient une connexion 1:1 avec chaque *server* ; les serveurs exposent des primitives, jamais n'appellent directement l'agent.
- Les quatre primitives en détail :
  - **Resources** : données exposées en lecture (fichiers, bases, flux temps réel), avec URI et type MIME, accessibles via `resources/read` et `resources/list`.
  - **Tools** : fonctions invocables avec schéma JSON décrivant les paramètres d'entrée et le format de sortie — la primitive la plus adoptée (quasi 100 % des déploiements).
  - **Prompts** : modèles de prompt réutilisables paramétrés, exposés par le serveur — primitive systématiquement sous-exploitée à mai 2026 (*à confirmer* via sondage communauté).
  - **Sampling** : le serveur demande au client d'effectuer une complétion LLM — primitive la plus sensible sur le plan sécurité (vecteur d'attaque Unit 42) et la plus récente dans l'implémentation des SDKs.
- SDK Tier 1 (production-grade, fonctionnalité complète) : TypeScript, Python, C#, Go. Tier 2 : Java, Rust. Tier 3 : Swift, Ruby, PHP. Kotlin : TBD (source : modelcontextprotocol.io/docs/sdk).
- Gouvernance AAIF : MCP reste sous contrôle technique des mainteneurs d'origine (Anthropic) avec processus SEP (*Specification Enhancement Proposal*) communautaire ; l'AAIF Governing Board gère les investissements et l'approbation de nouveaux projets mais ne dicte pas la direction technique.
- Transport et sécurité : stdio pour exécution locale ; HTTP/SSE pour accès réseau. Authentification : OAuth 2.1 + PKCE pour scénarios navigateur ; Client Credentials (machine-to-machine) réintroduits dans la spec novembre 2025 après retrait temporaire.

### §5.3 — A2A : l'orchestration pair-à-pair entre agents

**Phrase-clé :** A2A (v1.0.0 en mai 2026) définit un modèle de délégation structuré où un agent client découvre les capacités d'un agent distant via son *Agent Card*, lui délègue une *Task* avec un cycle de vie formel, et reçoit des mises à jour asynchrones — fournissant la couche de coordination inter-agents qui manquait à MCP, et que ni les APIs REST ni les appels de fonctions intra-agent ne peuvent remplir.

Sous-points :
- Chronologie : lancé par Google Cloud en avril 2025 avec 50+ partenaires (Salesforce, Accenture, SAP, Deloitte) ; donné à la Linux Foundation en juin 2025 ; v0.3 publiée juillet 2025 (gRPC, signed Agent Cards, Python SDK étendu) ; v1.0.0 version courante à mai 2026.
- Les quatre primitives A2A :
  - **Agent Card** : document JSON (typiquement servi à `/.well-known/agent.json`) décrivant identité, capacités/*skills*, endpoint, schémas d'authentification requis.
  - **Task** : unité de travail avec identifiant unique et cycle de vie formel (SUBMITTED → WORKING → COMPLETED / FAILED / CANCELED / REJECTED / INPUT_REQUIRED / AUTH_REQUIRED). Les états terminaux sont COMPLETED, FAILED, CANCELED, REJECTED.
  - **Message** : unités de communication multi-parts (texte, fichiers, données structurées) entre client et agent.
  - **Artifact** : sorties de la tâche, composées de Parts.
- Transport : JSON-RPC 2.0 / HTTP (binding principal), gRPC (ajouté v0.3), HTTP+JSON/REST. Streaming : Server-Sent Events pour mises à jour de progression et résultats partiels.
- Sécurité : OAuth 2.0, OpenID Connect, API key, HTTP auth, mTLS — multiples schémas supportés mais non imposés par le protocole (pas de sécurité obligatoire définie).
- Adoption confirmée : Microsoft (Azure AI Foundry, Copilot Studio), AWS (Amazon Bedrock AgentCore Runtime), Salesforce, SAP, ServiceNow en production. 150+ organisations au total. Cas production inter-entreprises : Tyson Foods + Gordon Food Service.
- Relation complémentaire avec MCP : un agent utilise MCP pour accéder à ses outils et données (couche tool), et A2A pour déléguer du travail à d'autres agents (couche coordination). L'architecture n'est pas un choix soit/soit.

### §5.4 — WebMCP : la couche navigateur (statut expérimental, mai 2026)

**Phrase-clé :** WebMCP n'est pas un protocole indépendant de MCP mais une couche d'exposition des primitives MCP (tools uniquement, dans la version actuelle) via l'API navigateur `navigator.modelContext`, permettant aux agents IA d'interagir avec les capacités d'une page web de manière structurée et consentie — statut : implémenté dans Chrome 146 (stable) et Edge 147 (mars 2026), spec W3C au stade *Candidate Recommendation* prévu Q3 2026, Safari sans engagement public à mai 2026.

Sous-points :
- Périmètre : WebMCP adresse uniquement la couche primitives (tools) ; le navigateur gère les couches data et transport, traduisant les outils WebMCP au format MCP. Conséquence : un serveur MCP existant ne devient pas automatiquement accessible via WebMCP — il faut une implémentation `navigator.modelContext`.
- API côté développeur web : `navigator.modelContext.provideContext()` (enregistrement en masse), `registerTool()` / `unregisterTool()` (gestion individuelle), `agent.requestUserInteraction()` (déclenchement d'une confirmation humaine avant action de l'agent). Design goal principal : maintenir le contrôle humain dans la boucle pour les interactions web.
- Développement co-porté par Microsoft Edge (Patrick Brosset) et Google Chrome, via le Web Machine Learning Working Group du W3C — ni Anthropic ni OpenAI ne sont cités comme co-auteurs.
- Recommandation architecturale : WebMCP est pertinent pour les agents qui naviguent sur le web (scraping structuré, actions sur applications SaaS exposant une interface web) mais ne concerne pas l'architecture des systèmes multi-agents d'entreprise *back-end*. Prématuré pour un déploiement enterprise sans polyfill (*à vérifier* : mcp-b/global polyfill mentionné mais maturité non confirmée par source primaire).
- Marqueur d'incertitude : Safari — pas de position publique WebKit à mai 2026. Le non-engagement d'Apple est documenté mais une adoption future n'est pas exclue.

### §5.5 — Cartographie comparative : MCP, A2A, ACP, UCP

**Phrase-clé :** Les quatre protocoles de l'écosystème agentique 2026 ne sont pas concurrents mais complémentaires — ils occupent des couches distinctes de la pile : MCP (accès outils/données), A2A (coordination agents), ACP (transactions inter-agents ouvertes), UCP (transactions commerce Google) — et la confusion entre ces couches est la source la plus fréquente d'erreur d'architecture dans les projets qui choisissent « MCP ou A2A » sans comprendre que la question est mal posée.

Sous-points :
- **ACP (Agent Communication Protocol, IBM → Linux Foundation) :** standard HTTP-natif REST pour communication inter-agents, multi-frameworks, multi-langages ; initialement développé par IBM Research, maintenant absorbé dans le projet A2A sous Linux Foundation. N'est plus un protocole indépendant à mai 2026 — le distinguer de A2A dans la comparaison est historiquement pertinent mais architecturalement dépassé.
- **UCP (Universal Commerce Protocol, Google) :** protocole de transactions IA à vocation commerce, conçu pour les agents opérant dans l'écosystème Google (Shopping graph, marchands intégrés) ; couvre pricing negotiation, offres, confirmation de paiement. Périmètre très spécifique — non pertinent pour les architectures enterprise généralistes hors e-commerce Google.
- Tableau comparatif (axes : couche, transport, primitives, gouvernance, maturité production, cas d'usage principal) — structure proposée pour §5.5.
- Recommandation : pour un système multi-agents d'entreprise standard (pas de commerce e-commerce Google), l'empilement minimal est MCP + A2A. ACP a été absorbé dans A2A. UCP est optionnel et très spécialisé. WebMCP est optionnel et uniquement pertinent si l'agent interagit avec des interfaces web.

### §5.6 — Surfaces d'attaque protocolaires : ce que MCP n'impose pas

**Phrase-clé :** Les vulnérabilités les plus graves de MCP à mai 2026 ne sont pas des bugs d'implémentation mais des choix de design dans la spec elle-même — l'absence de contrôles obligatoires sur les descriptions d'outils (vecteur tool poisoning), la permission accordée au serveur de contrôler à la fois le prompt et le traitement de la réponse via *sampling* (vecteur injection sampling), et l'absence de mécanisme de confiance entre serveurs (vecteur cross-tool exfiltration) — ce que la version courante ne corrige pas et que l'AAIF n'a pas encore sanctionné dans sa gouvernance.

Sous-points :
- **Tool poisoning (Invariant Labs, OWASP MCP Tool Poisoning) :** instructions malveillantes dans les descriptions d'outils, invisibles à l'utilisateur mais visibles au modèle. Permet d'exfiltrer les données d'un autre serveur MCP légitime sans infrastructure d'attaque complexe (démonstration académique : serveur météo volant données bancaires avec Python basique + webhook gratuit). OWASP a formalisé l'attaque dans sa liste communautaire à mai 2026.
- **Injection via sampling (Palo Alto Unit 42) :** le serveur MCP contrôle le prompt et le traitement de la réponse LLM via la primitive *sampling* — surface d'attaque absente si sampling n'est pas implémenté, critique s'il l'est. Vecteur distinct des injections classiques.
- **Vulnérabilité architecturale RCE (OX Security, avril 2026) :** affecte 150M+ téléchargements via les SDK officiels. Anthropic a confirmé que le comportement est « by design » et n'a pas annoncé de correction protocolaire. Le patch DNS rebinding (Jonathan Leitschuh, mentionné au MCP Dev Summit avril 2026) est une mitigation SDK, pas une correction protocolaire.
- **Supply chain MCP :** 9 registres sur 11 testés compromis lors d'injections d'essai (OX Security). Incidents documentés : Postmark (septembre 2025, BCC de tous les e-mails vers attaquants), Smithery supply chain attack (octobre 2025, 3 000+ applications et tokens API exposés).
- A2A : surface d'attaque différente — Signed Agent Cards (v0.3+) comme mitigation partielle de l'usurpation d'identité d'agents ; protocole *supports but does not enforce* la signature. OAuth 2.0 recommandé mais non imposé.
- Implication pour l'architecte : les décisions de sécurité protocolaires pour MCP et A2A ne peuvent pas être déléguées au protocole lui-même — elles doivent être prises au niveau de l'architecture (isolation des serveurs MCP tiers, vérification des Agent Cards, politique d'autorisation per-task). Ce chapitre introduit les vecteurs ; Ch. 9 fournit la défense en profondeur.

### §5.7 — AAIF, NIST et l'horizon de standardisation (mai 2026 → Q4 2026)

**Phrase-clé :** L'Agentic AI Foundation atteint 170 organisations en quatre mois avec une cadence de gouvernance qui dépasse celle de la CNCF à étape équivalente, mais la maturation du corpus normatif — profil d'interopérabilité NIST Q4 2026, recommandation formelle W3C WebMCP Q3 2026, cycle de vie de projets AAIF — signifie que les décisions d'architecture prises en 2026 seront les premières à être jugées à l'aune de standards qui n'existaient pas lors de leur conception.

Sous-points :
- AAIF (Agentic AI Foundation) : structure, gouvernance, projets, événements 2026. Distinction entre AAIF Governing Board (stratégie, membres, budget) et Technical Steering Committee (cycle de vie des projets : Growth, Impact, Emeritus). 146-170 membres selon les sources et la date (croissance rapide — *à vérifier* la date exacte du chiffre 170). Événements clés : MCP Dev Summit NYC (2-3 avril 2026), AGNTCon + MCPCon Europe (Amsterdam, 17-18 septembre 2026), AGNTCon + MCPCon North America (San Jose, 22-23 octobre 2026).
- NIST AI Agent Standards Initiative (lancée 17 février 2026) : trois piliers confirmés en source primaire. Profil d'interopérabilité AI Agent prévu Q4 2026 (confirmé en sources secondaires — *à vérifier* en source primaire NIST). Relation avec AI RMF et Cyber AI Profile : non explicitée dans le texte de lancement, *à confirmer* si COSAiS (mentionné dans l'introduction) est un livrable formel ou une référence informelle.
- ISO/IEC JTC 1 : pilier 1 de l'initiative NIST — leadership américain dans les organismes internationaux pour éviter la fragmentation géopolitique des standards (UE, Chine ont leurs propres initiatives). *À surveiller* pour Q4 2026.
- Recommandation prospective : instrumenter les systèmes dès aujourd'hui pour la conformité au profil NIST Q4 2026 — pas attendre la publication pour concevoir l'architecture. Le *readiness assessment* de [Ch. 4](ch04-roi-risk-readiness.md) doit intégrer la conformité protocolaire comme dimension Gouvernance (D4).

### §5.8 — Recommandation architecturale : construire sur l'empilement ouvert

**Phrase-clé :** La recommandation principale est d'adopter l'empilement MCP + A2A comme couches d'interopérabilité standards de tout système multi-agents d'entreprise déployé en 2026 — avec le compromis explicite que ces deux protocoles présentent des surfaces d'attaque non résolues au niveau du protocole, que la portabilité réelle dépend de la rigueur de l'implémentation et non de l'existence du standard, et que la condition de bascule vers une architecture propriétaire est une exigence de performance ou de sécurité non satisfaite par les SDKs Tier 1 actuels.

Sous-points :
- L'argument pour l'empilement ouvert : portabilité du fournisseur de modèle sans réécriture ([Ch. 10](ch10-scaling-without-lockin.md)), 110M+ téléchargements SDK MCP mensuels = masse critique d'intégrations disponibles, A2A en production sur les trois hyperscaleurs principaux = risque de lock-in minime.
- Compromis : standardisation ne garantit pas sécurité. MCP a une surface d'attaque connue et non entièrement résolue. A2A impose une complexité opérationnelle (gestion des Agent Cards, cycle de vie des tâches, authentification inter-agents) qui n'existe pas avec des RPC simples.
- Alternative crédible : framework propriétaire d'orchestration (AWS Bedrock Agents, Azure AI Foundry agents natifs, Google Vertex AI Agent Builder) — plus simple à déployer, moins d'exposition aux vulnérabilités protocolaires, mais lock-in fournisseur sur la logique d'orchestration et les intégrations d'outils.
- Condition de bascule : si le SLA de latence inter-agents est < 50ms et que les SDKs MCP Tier 1 ne peuvent pas l'atteindre dans le contexte d'exécution cible, ou si les exigences de conformité imposent un contrôle total de la couche transport non compatible avec la spec MCP actuelle.

---

## Sources clés

1. **Linux Foundation / AAIF** — « Formation of the Agentic AI Foundation » — 9 décembre 2025 — https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation — Source primaire de la donation MCP à l'AAIF, membres fondateurs, gouvernance.

2. **modelcontextprotocol.io** — Documentation SDK officielle — https://modelcontextprotocol.io/docs/sdk — Référence normative des primitives MCP et de la hiérarchie des SDKs officiels (Tier 1-3).

3. **a2a-protocol.org** — « A2A Protocol Specification v1.0.0 » — https://a2a-protocol.org/latest/specification/ — Référence normative des primitives A2A, cycle de vie des tâches, transports, sécurité.

4. **Google Cloud Blog** — « Agent2Agent protocol is getting an upgrade » — 31 juillet 2025 — https://cloud.google.com/blog/products/ai-machine-learning/agent2agent-protocol-is-getting-an-upgrade — Chronologie A2A (v0.3, donation LF juin 2025) et cas production.

5. **Patrick Brosset (Microsoft Edge)** — « WebMCP updates, clarifications, and next steps » — 23 février 2026 — https://patrickbrosset.com/articles/2026-02-23-webmcp-updates-clarifications-and-next-steps/ — Source primaire sur WebMCP : API, relation à MCP, statut W3C.

6. **NIST / CAISI** — « Announcing the AI Agent Standards Initiative » — 17 février 2026 — https://www.nist.gov/news-events/news/2026/02/announcing-ai-agent-standards-initiative-interoperable-and-secure — Source primaire des trois piliers NIST et de la chronologie des livrables.

7. **Palo Alto Networks Unit 42** — « New Prompt Injection Attack Vectors Through MCP Sampling » — https://unit42.paloaltonetworks.com/model-context-protocol-attack-vectors/ — Documentation primaire des vecteurs tool poisoning et injection sampling.

8. **OX Security** — « The Mother of All AI Supply Chains » — avril 2026 — https://www.ox.security/blog/the-mother-of-all-ai-supply-chains-critical-systemic-vulnerability-at-the-core-of-the-mcp/ — Vulnérabilité architecturale RCE MCP et réponse Anthropic.

9. **DigitalApplied** — « AI Agent Protocol Ecosystem Map 2026 » — mars 2026 — https://www.digitalapplied.com/blog/ai-agent-protocol-ecosystem-map-2026-mcp-a2a-acp-ucp — Cartographie multi-protocoles MCP / A2A / ACP / UCP, architecture en couches.

10. **IBM Research** — Agent Communication Protocol (ACP) — https://research.ibm.com/projects/agent-communication-protocol — Confirmation de l'absorption d'ACP dans A2A sous Linux Foundation.

11. **AAIF Blog** — « MCP Is Now Enterprise Infrastructure » — avril 2026 — https://aaif.io/blog/mcp-is-now-enterprise-infrastructure-everything-that-happened-at-mcp-dev-summit-north-america-2026/ — Données de production Uber (5 000+ ingénieurs, 60 000+ exécutions/semaine via MCP) et gouvernance AAIF.

12. **PRNewswire / A2A Project** — « A2A Protocol Surpasses 150 Organizations » — 2026 — https://www.prnewswire.com/news-releases/a2a-protocol-surpasses-150-organizations-lands-in-major-cloud-platforms-and-sees-enterprise-production-use-in-first-year-302737641.html — Adoption Microsoft (Azure AI Foundry, Copilot Studio) et AWS (Bedrock AgentCore Runtime) confirmée.
