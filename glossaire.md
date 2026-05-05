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

### MCP (Model Context Protocol)
Protocole ouvert d'interfaçage entre LLM et outils/données, créé par Anthropic et donné à l'AAIF en décembre 2025. Quatre primitives : *Resources* (lecture), *Tools* (action), *Prompts* (templates), *Sampling* (LLM côté serveur). Architecture client-hôte-serveur. SDKs Tier 1 (TypeScript, Python, C#, Go) ; Tier 2 (Java, Rust) ; Tier 3 (Swift, Ruby, PHP) ; TBD (Kotlin). 110M+ téléchargements/mois de SDK mai 2026. Surface d'attaque documentée : *tool poisoning*, injection via *sampling* (Palo Alto Unit 42), RCE supply chain dans SDKs officiels (OX Security, avril 2026).

### WebMCP
Extension navigateur de MCP, statut W3C *Candidate Recommendation* (non ratifié, mai 2026). API : `navigator.modelContext`. Périmètre : *tools only* (pas *resources* ni *prompts*). Support : Chrome 146 stable, Edge 147 stable, Firefox 8-12 semaines (*à vérifier*), Safari sans engagement public. Co-développé Microsoft / Google via W3C WebML Working Group.
