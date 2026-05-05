# Glossaire — *The Agentic Enterprise*

> Termes techniques retenus, avec définition opérationnelle et politique de traduction. Ajouter une entrée à la première occurrence d'un terme dans un chapitre.

## Conventions
- **Anglais conservé** (italique à la première occurrence par chapitre) : *event-driven*, *idempotency*, *exactly-once*, *backpressure*, *circuit breaker*, *saga*, *agentic*, *prompt injection*, *tool calling*, *retry budget*, *escalation cost*.
- **Traduit** : *agent* → agent, *workflow* → flux de travail, *deployment* → déploiement.

### Convention éditoriale — terme « agentic »
Les sources primaires divergent (IBM : *agentic AI* = système multi-agents orchestré ; Anthropic : *agentic* = adjectif qualifiant tout LLM semi-autonome, y compris à agent unique). La monographie adopte une **convention hybride** :

- **« agentic »** (adjectif, italique) — qualifie tout système, comportement ou propriété d'un LLM exécutant la boucle *decide–act–observe* avec mémoire et outils, qu'il soit à agent unique ou multiple. Suivit Anthropic.
- **« *agentic AI* »** (nom, italique) — désigne spécifiquement un système composite multi-agents orchestré. Suivit IBM.
- **« agent »** (nom, romain) — entité unique dans la boucle.
- **« système multi-agents »** — explicite la pluralité ; synonyme de *agentic AI* dans cette monographie.

À introduire au §2 de l'introduction et à respecter dans tous les chapitres.

### Convention réglementaire — OSFI
La référence OSFI pertinente pour le contexte agentique en 2026 est **OSFI E-23** (*Model Risk Management*, en vigueur 1ᵉʳ mai 2027), pas E-21. Les sources primaires (BLG, Blakes) ne confirment que E-23 dans le périmètre IA.

## Entrées (alphabétique)

### A2A (Agent-to-Agent Protocol)
Protocole ouvert de coordination entre agents, sous Linux Foundation depuis juin 2025. Spec v1.0.0 (date de release officielle *à vérifier*). Quatre primitives : *Agent Card* (capability discovery), *Task* (cycle de vie SUBMITTED → WORKING → terminal/intervention HITL), *Message*, *Artifact*. Transports : JSON-RPC 2.0/HTTP, gRPC, REST. Adoption mai 2026 : 150+ organisations, déployé dans Azure AI Foundry, Copilot Studio, Bedrock AgentCore Runtime, Salesforce, SAP, ServiceNow.

### AAIF (Agentic AI Foundation)
*Directed fund* annoncé 9 décembre 2025 sous l'égide de la Linux Foundation. Membres Platinum fondateurs : AWS, Anthropic, Block, Bloomberg, Cloudflare, Google, Microsoft, OpenAI. MCP est projet fondateur. Distinction critique : MCP n'a pas été « donné à la Linux Foundation » au même titre que le noyau Linux — l'AAIF est l'entité de gouvernance, et Anthropic conserve l'autonomie technique des mainteneurs MCP.

### AgentOps
Discipline opérationnelle d'agents en production — distincte de MLOps et LLMOps par la nature de l'objet opéré : un système qui agit dans l'environnement réel, pas seulement un modèle qui prédit. Quatre composantes : (1) **observabilité multi-étapes** — arbre de *spans* hétérogènes (LLM spans, *tool spans*, *memory spans*, *orchestration spans*) ; (2) **évaluation continue** — *régression continue* (CI/CD gate), *replay* déterministe (golden file testing), *shadow runs* (parallèle de production sans exposition utilisateur) ; (3) **cycle de vie de l'artefact composite** — tuple (prompt système, outils avec versions, configuration mémoire, périmètres de permission, seuils d'escalade) versionné comme unité atomique (*promote/deprecate/roll back*) ; (4) **plan de contrôle** — *permission boundaries*, *rate limits*, *retry budgets*, *kill switches* — couche d'application distincte de l'observabilité. Standard d'instrumentation : OTel GenAI SemConv 1.40.0 (statut *Development*, attributs `gen_ai.agent.*`, API non stabilisée). Référence : [Ch. 7](ch07-agentops.md) ; modèle de maturité à 5 niveaux : [Annexe C](annexe-C-agentops-maturity.md).

### CPST (Cost per Successful Task)
Métrique économique unitaire centrale du livre : coût total (tokens d'inférence + outils + escalade humaine éventuelle + *retry*) divisé par le nombre de tâches **menées à terme avec succès** selon la définition opérationnelle du *successful outcome*. À distinguer du coût par appel ou par token. Référence : [Ch. 2 §2.2](ch02-business-case.md), [Ch. 4 §4.6](ch04-roi-risk-readiness.md). Composante *infrastructure tax* (orchestration, mémoire, escalade, *retry*) : 30 à 50 % du budget agentique réel selon les praticiens FinOps 2026.

### *Retry budget*
Plafond explicite — par tâche, par tenant ou par fenêtre temporelle — du nombre de tentatives qu'un agent peut consommer avant escalade ou abandon. Sans *retry budget* opposable, un agent en boucle peut générer un coût non borné (cas InfoWorld 2026 : 47 000 $ d'appels non plafonnés). À coupler à un *kill switch* financier dans le plan de contrôle AgentOps. Référence : [Ch. 2 §2.3](ch02-business-case.md), [Ch. 7 §7.6](ch07-agentops.md), [Annexe A](annexe-A-architecture-review.md).

### MCP (Model Context Protocol)
Protocole ouvert d'interfaçage entre LLM et outils/données, créé par Anthropic et **projet fondateur de l'AAIF** lors de la création de la fondation le 9 décembre 2025 (à distinguer d'une donation au sens d'un transfert complet de gouvernance technique : Anthropic conserve l'autonomie des mainteneurs). Quatre primitives : *Resources* (lecture), *Tools* (action), *Prompts* (templates), *Sampling* (LLM côté serveur). Architecture client-hôte-serveur. SDKs Tier 1 (TypeScript, Python, C#, Go) ; Tier 2 (Java, Rust) ; Tier 3 (Swift, Ruby, PHP) ; TBD (Kotlin). 110M+ téléchargements/mois de SDK mai 2026. Surface d'attaque documentée : *tool poisoning*, injection via *sampling* (Palo Alto Unit 42), RCE supply chain dans SDKs officiels (OX Security, avril 2026).

### WebMCP
Extension navigateur de MCP, statut W3C *Candidate Recommendation* (non ratifié, mai 2026). API : `navigator.modelContext`. Périmètre : *tools only* (pas *resources* ni *prompts*). Support : Chrome 146 stable, Edge 147 stable, Firefox 8-12 semaines (*à vérifier*), Safari sans engagement public. Co-développé Microsoft / Google via W3C WebML Working Group.
