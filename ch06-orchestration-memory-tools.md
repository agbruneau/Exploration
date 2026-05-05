---
title: "Orchestration, Memory, and Tools"
chapter: 6
part: 3
status: "esquisse"
length_target_words: 6000
reading_time_min: 24
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement)

1. LangChain / LangGraph — « Multi-Agent Orchestration in LangGraph: Supervisor vs Swarm » — DEV Community / focused.io — 2025-2026 — https://dev.to/focused_dot_io/multi-agent-orchestration-in-langgraph-supervisor-vs-swarm-tradeoffs-and-architecture-1b7e — Définition opérationnelle des deux patrons natifs de LangGraph : *supervisor* (routage centralisé, LLM dédié à la décision de délégation) et *swarm* (transfert de contrôle décentralisé, chaque agent décide de passer la main). Cinq patrons complets décrits : Orchestrator-Worker, Swarm, Mesh, Hierarchical, Pipeline. Recommandation de démarrage : supervisor pour clarté du débogage ; swarm pour les tâches exploratoires où la prochaine étape dépend du résultat intermédiaire. Apport : terminologie canonique LangGraph, critères de sélection par patron, distinction latence vs précision de routage.

2. Microsoft Foundry Blog — « Introducing Microsoft Agent Framework: The Open-Source Engine for Agentic AI Apps » — Microsoft — avril 2026 — https://devblogs.microsoft.com/foundry/introducing-microsoft-agent-framework-the-open-source-engine-for-agentic-ai-apps/ — Annonce de Microsoft Agent Framework (MAF) 1.0, successeur de convergence entre AutoGen et Semantic Kernel (annonce octobre 2025, GA avril 2026). APIs stables, LTS confirmé. Cinq patrons d'orchestration : Sequential, Concurrent, Group Chat, Handoff, Magentic (manager avec task ledger dynamique). Graph-based Workflow typé routant données sur des arêtes ; exécuteurs activés quand les inputs sont prêts. AutoGen en maintenance seule depuis la transition vers MAF. Apport : version courante MAF 1.0 (avril 2026), terminologie Magentic Pattern (distinct de swarm), interopérabilité native A2A + MCP.

3. OpenAI — « New tools for building agents » + Agents SDK — OpenAI — mars 2025 — https://openai.com/index/new-tools-for-building-agents/ — Transition Swarm (octobre 2024, éducatif/expérimental) → Agents SDK (mars 2025, production). Primitives maintenues : *Handoffs* (transfert de contrôle entre agents = retour d'un Agent depuis un outil), *Guardrails* (validation entrées/sorties), *Tracing* (observabilité). En 2026, Swarm = référence de design pédagogique ; Agents SDK = chemin supporté. Assistants API en *sunset* le 26 août 2026 (*confirmé* — OpenAI). Apport : chronologie confirmée Swarm → Agents SDK, statut Assistants API.

4. CrewAI — Documentation v1.12 + gurusup.com « Best Multi-Agent Frameworks in 2026 » — 2026 — https://gurusup.com/blog/best-multi-agent-frameworks-2026 — CrewAI v1.12 : processus hiérarchique natif (manager automatique, délégation + validation des résultats), processus séquentiel, *Flows* (contrôle conditionnel Python). Ajouts v1.12 : *agent skills*, support providers OpenAI-compatible (OpenRouter, DeepSeek, Ollama, vLLM, Cerebras, Dashscope), backend mémoire Qdrant Edge, isolation mémoire hiérarchique. Google ADK (avril 2025) : arbre hiérarchique d'agents avec support natif A2A ; intégration Vertex AI / Gemini / GCP. Pydantic AI : framework léger centré validation typée et outputs structurés, pas un framework d'orchestration complet. Apport : versions courantes mai 2026, matrice comparative frameworks.

5. Hu, Y. et al. (47 auteurs) — « Memory in the Age of AI Agents: A Survey » — arXiv:2512.13564 — décembre 2025 — https://arxiv.org/abs/2512.13564 — Taxonomie unifiée de la mémoire agentique : trois formes dominantes (token-level, paramétrique, latente) ; taxonomie fonctionnelle affinée distinguant *factual*, *experiential*, *working memory*. Critique des taxonomies long-terme / court-terme comme insuffisantes pour capturer la diversité des systèmes contemporains. Couverture : formation, évolution, récupération de la mémoire ; benchmarks consolidés ; fronts de recherche (automatisation de la mémoire, intégration RL, mémoire multi-agents, trustworthiness). Apport : référence académique de taxonomie la plus récente et exhaustive à mai 2026 ; 47 auteurs = couverture communautaire large.

6. Mem0 — « State of AI Agent Memory 2026 » — mem0.ai — 2026 — https://mem0.ai/blog/state-of-ai-agent-memory-2026 — État du marché mémoire agentique : marché à 6,27 G$ en 2026, projection 28,45 G$ en 2030 (TCAC 35 %). 50 000+ développeurs actifs sur Mem0. Comparatif Mem0 (compression 80 % tokens, extraction de faits en graphe) vs Zep (graphe de connaissances temporel, raisonnement sur l'évolution des faits) vs LangMem (réécriture du system prompt par l'agent — mémoire procédurale directe) vs Letta (blocs mémoire éditables, runtime stateful, pagination inspirée OS). Apport : chiffres de marché, différenciation produit 2026, validation des quatre outils prioritaires.

7. Mem0 — « Graph-Based Memory Solutions for AI Context: Top 5 Compared » — mem0.ai — janvier 2026 — https://mem0.ai/blog/graph-memory-solutions-ai-agents — Comparatif des solutions graphe pour la mémoire agentique. Zep : graphe temporel de connaissances, tracking des faits qui changent dans le temps, combinaison graphe + recherche vectorielle. Mem0 graphe : mémorisation relationnelle multi-sessions. Apport : différenciation technique entre Zep et Mem0 sur la dimension temporelle, cas d'usage production.

8. Anthropic Engineering — « Writing effective tools for AI agents » — Anthropic — 2025 — https://www.anthropic.com/engineering/writing-tools-for-agents — Pratiques de design d'outils pour agents : (1) les descriptions d'outils en texte libre guident le comportement de l'agent plus efficacement que le schéma JSON seul — ingénierie de prompt dans les descriptions ; (2) analyse des métriques d'appels d'outils (appels redondants, erreurs de paramètres) comme signal d'amélioration ; (3) réponses d'erreur structurées avec corrections actionnables, pas des codes opaques ; (4) découverte à la demande (*on-demand tool loading*) : charger seulement les outils pertinents pour la tâche courante ; (5) exemples d'utilisation des outils à inclure dans les définitions. Apport : source primaire Anthropic sur le design d'outils, complémentaire à « Building Effective Agents ».

9. Anthropic Engineering — « Effective context engineering for AI agents » — Anthropic — 2025 — https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents — Ingénierie du contexte pour les agents longue durée : gestion de la fenêtre de contexte comme ressource limitée ; stratégies de compression et de sélection ; relation entre contexte et qualité des décisions de l'agent. Apport : doctrine Anthropic sur la gestion du contexte, complément direct à la section mémoire.

10. NeurIPS 2025 — « Multi-Agent Collaboration via Evolving Orchestration » — arXiv:2505.19591 — 2025 — https://arxiv.org/html/2505.19591v1 — Paradigme *puppeteer* : orchestrateur centralisé entraîné par renforcement (RL) qui dirige dynamiquement les agents en réponse à l'évolution de l'état de la tâche. Performance supérieure avec coûts computationnels réduits vs orchestration statique. Apport : validation académique NeurIPS 2025 que l'orchestration dynamique RL-based surpasse les patrons statiques ; terminologie *puppeteer paradigm* distincte du supervisor classique.

11. IBM / Solving Context Window Overflow — recherche IBM 2025 — référencé dans sparkco.ai / mem0.ai — 2025 — Quantification de l'overflow : dans un flux Materials Science, les sorties d'outils atteignent 2M+ éléments ; approche directe = 20 822 181 tokens (échec) ; *Memory Pointer Pattern* = 1 234 tokens (succès). Réduction 16 800×. Apport : seule quantification publiée de l'ampleur du débordement de fenêtre de contexte en production ; valide la *memory debt* comme risque opérationnel mesurable.

12. OpenAPI Initiative — Spécification OpenAPI 3.2.0 — septembre 2025 — https://spec.openapis.org/oas/v3.2.0.html — OAS 3.2 (septembre 2025) : support natif SSE et JSON Lines pour le streaming, navigation par tags structurés pour les grands catalogues d'API, compatibilité JSON Schema complète (héritée de 3.1). Positionnement MCP : MCP représente un glissement vers des contrats AI-natifs standardisant comment les agents découvrent et invoquent les APIs. Apport : version courante OAS confirmée, lien MCP ↔ OpenAPI explicité.
-->

## Esquisse

**(a) Thèse.** Les protocoles MCP et A2A (Ch. 5) définissent les contrats d'interface de l'empilement agentique ; ce chapitre traite la couche au-dessus : comment orchestrer plusieurs agents en coordination, comment structurer la mémoire persistante pour éviter la dette de mémoire, et comment concevoir les outils pour l'idempotence et des contrats d'effet de bord prévisibles. Ces trois disciplines — orchestration, mémoire, design d'outils — forment ensemble le plan de construction interne d'un système *agentic* : sans elles, les protocoles sont des tuyaux vides.

**(b) Question.** Quels patrons d'orchestration choisir, quand et pourquoi ? Comment concevoir la mémoire d'un agent pour qu'elle reste opérationnelle à l'échelle enterprise sans accumuler de dette irrécouvrable ? Quelles propriétés un outil doit-il garantir pour qu'un agent puisse le réessayer sans risque ?

**(c) Lecteur cible.** Architecte de solution et architecte d'entreprise senior qui a lu Ch. 5 et connaît MCP/A2A ; qui doit maintenant choisir un *framework* d'orchestration (LangGraph, MAF, CrewAI, OpenAI Agents SDK) et concevoir la couche mémoire et les outils de son premier système multi-agents en production.

**(d) Renvois croisés prévus.**
- [Ch. 1 §1.1](ch01-from-automation-to-agents.md) — boucle *decide–act–observe* et mémoire persistante : ne pas répéter, y renvoyer explicitement dès §6.1.
- [Ch. 5](ch05-protocols-interoperability.md) — MCP tools, A2A Task lifecycle : transition directe, §6.1 doit reprendre la phrase de transition de fin de Ch. 5.
- [Ch. 7](ch07-agentops.md) — observabilité des traces d'orchestration (tool spans, memory diffs) : mentionner sans dupliquer.
- [Ch. 9](ch09-agentic-security.md) — side-effect contracts et idempotence comme défense contre les outils adversariaux : renvoi en §6.5.
- [Annexe A](annexe-A-architecture-review.md) — checklist de révision architecture pour orchestration + mémoire.

---

## Plan détaillé

### §6.1 — De la boucle à l'orchestration : ce que les protocoles ne prescrivent pas

**Phrase-clé :** MCP et A2A définissent *comment* invoquer un outil et déléguer une tâche ; ils ne prescrivent pas *dans quel ordre*, *par qui*, ni *selon quelle logique de reprise* — c'est le rôle de l'orchestrateur.

Contenu : délimitation précise de ce que Ch. 5 couvre vs ce que Ch. 6 couvre ; le problème de la composition (séquentiel, parallèle, conditionnel, cyclique) ; l'orchestrateur comme couche de contrôle au-dessus des protocoles ; transition narrative depuis Ch. 5 §5.9.

### §6.2 — Taxonomie des patrons d'orchestration

**Phrase-clé :** Cinq patrons couvrent 95 % des cas enterprise — supervisor, swarm, hierarchical, graph-based (pipeline inclus), et mesh — chacun optimisant un point différent du triangle latence / précision de routage / complexité opérationnelle.

Contenu :
- **Supervisor** : un LLM centralisé reçoit la tâche et délègue aux agents workers ; routage explicite, débogage simple, goulot d'étranglement sur les tâches longues. Patron natif LangGraph (langgraph-supervisor-py).
- **Swarm** : chaque agent décide lui-même de transférer le contrôle (handoff) à un agent suivant via retour d'un Agent depuis un outil — paradigme OpenAI Swarm → Agents SDK. Adapté aux tâches exploratoires ; risque de cycles si mal borné.
- **Hierarchical** : arbre de superviseurs, chaque superviseur manage une équipe de workers ; seule option viable à 50+ agents multi-domaines. Google ADK (arbre d'agents natif), CrewAI v1.12 (processus hiérarchique avec manager automatique).
- **Graph-based** : nœuds = agents/fonctions, arêtes = flux de données avec conditions ; pipeline = cas dégénéré sans cycle. MAF 1.0 *Workflow* typé (arêtes explicites, exécuteurs activés quand inputs prêts) ; LangGraph *StateGraph* avec *reducers*.
- **Magentic** (variante MAF) : orchestrateur manager qui construit et affine dynamiquement un *task ledger* ; proche du paradigme NeurIPS 2025 *puppeteer* (RL-based dynamic orchestration — arXiv:2505.19591).

Tableau comparatif ≥ 2 dimensions : patron × (latence, précision routage, débogage, tolérance pannes, cas d'usage cible, framework représentatif). Recommandation avec compromis, alternative, condition de bascule.

### §6.3 — Panorama des frameworks (mai 2026)

**Phrase-clé :** LangGraph, Microsoft Agent Framework 1.0, CrewAI v1.12, OpenAI Agents SDK et Google ADK couvrent le marché des frameworks d'orchestration enterprise — ils ne sont pas interchangeables : chacun privilégie un patron et un écosystème.

Contenu (tableau comparatif) :
- LangGraph : StateGraph + checkpointing natif PostgreSQL/Redis, patron supervisor et swarm en bibliothèques séparées, forte intégration LangSmith (traces) ; version courante LangGraph 0.3.x (*à confirmer* — PyPI langgraph-checkpoint).
- Microsoft Agent Framework 1.0 : GA avril 2026, fusion AutoGen + Semantic Kernel, multi-provider natif, interopérabilité A2A + MCP, AutoGen en maintenance seule.
- CrewAI v1.12 : processus séquentiel / hiérarchique / Flows, multi-provider, Qdrant Edge pour mémoire, isolation hiérarchique. Marché PME à midmarket.
- OpenAI Agents SDK : succession Swarm (oct. 2024) → Agents SDK (mars 2025) ; Handoffs + Guardrails + Tracing ; Assistants API en sunset 26 août 2026. Verrouillage OpenAI.
- Google ADK : arbre hiérarchique natif, A2A-native, Vertex AI / Gemini ; lancement avril 2025.
- Pydantic AI : pas un framework d'orchestration — bibliothèque de validation typée des outputs d'agents ; utilisé *dans* les agents, pas à la place des frameworks ci-dessus.

### §6.4 — Memory engineering : taxonomie et implémentation

**Phrase-clé :** La taxonomie épisodique / sémantique / procédurale, héritée des sciences cognitives, n'est pas une convention pédagogique — c'est une grille de conception qui détermine le choix de backend, la stratégie d'éviction, et l'exposition aux risques de dérive.

Contenu :
- **Mémoire épisodique** : traces des interactions passées, séquentielles et datées — conversations, résultats d'outils, décisions prises. Backend : base vectorielle (Qdrant, pgvector, Pinecone). Risque : *context rot* (dégradation des performances à mesure que le contexte croît).
- **Mémoire sémantique** : faits, préférences, entités, relations — indépendants du temps. Backend : graphe de connaissances (Zep, Neo4j) ou base vectorielle avec chunking sémantique. Zep : graphe temporel, tracking des faits qui *changent* dans le temps — différenciation clé.
- **Mémoire procédurale** : instructions d'action, workflows, politiques — comment l'agent doit se comporter. LangMem : réécriture directe du system prompt par l'agent lui-même. Risque : dérive procédurale si les réécritures ne sont pas validées.
- Taxonomie académique (arXiv:2512.13564, Hu et al., déc. 2025) : token-level / paramétrique / latente ; fonctionnelle : *factual*, *experiential*, *working memory*. Mise en correspondance avec les trois catégories cognitives.

Panorama des outils (mai 2026) :
- **Mem0** : extraction de faits → compression 80 % tokens, 50 000+ développeurs, cloud + self-hosted. Cas fort : agents de support/personnalisation longue durée.
- **Zep Cloud** : graphe temporel de connaissances + recherche vectorielle hybride. Cas fort : entités d'entreprise avec relations évoluant dans le temps.
- **Letta (ex-MemGPT)** : blocs mémoire éditables, runtime stateful, pagination OS-inspired. Cas fort : agents avec identité persistante et forte contrainte sur la fenêtre de contexte.
- **LangMem** : intégration native LangGraph, réécriture du system prompt, self-hosted. Cas fort : équipes déjà sur LangGraph, budget infrastructure maîtrisé.
- **Amazon Bedrock AgentCore Memory / AgentCoreMemorySaver** : intégration native LangGraph via AWS, production-ready avec DynamoDB/S3.
- **OpenAI Memory** : mémoire native Claude (*à vérifier*) et GPT-4o (beta) — mémoire cross-sessions gérée par le fournisseur, pas un SDK ouvert. Hors périmètre pour les architectures multi-fournisseurs.

### §6.5 — La dette de mémoire : définition, mesure, remédiation

**Phrase-clé :** La dette de mémoire est le risque opérationnel systémique qui émerge quand la mémoire d'un agent croît sans stratégie d'éviction ni validation — elle se manifeste comme *context rot*, *stale state* et dérive de l'objectif, et elle est mesurable avant d'être fatale.

Contenu :
- Définition opérationnelle : dette de mémoire = écart cumulé entre ce que l'agent croit vrai et ce qui est vrai dans l'environnement, résultant de l'accumulation de mémoires non validées, contradictoires ou périmées.
- Quantification IBM (2025) : flux Materials Science, 2M+ éléments en sortie d'outils → 20 822 181 tokens (échec) vs 1 234 tokens avec *Memory Pointer Pattern* (réduction 16 800×). Seule quantification publiée à mai 2026 (*confirmé*).
- Cinq modes de défaillance (Intellyx, 2025 — déjà cité Ch. 1, renvoi) : *stale state*, *partial updates*, *race conditions*, *prompt drift*, *lost state on retry*.
- *Context rot* : dégradation des performances de récupération à mesure que le contexte croît — documenté sur les modèles leaders à fenêtre longue (*confirmé* — recherche indépendante 2025-2026).
- Stratégies de remédiation : éviction temporelle, compression sémantique (Mem0 80 % tokens), *memory pointer pattern*, isolation par session/thread, validation par second LLM.
- Lien avec Ch. 7 : les *memory diffs* de l'observabilité AgentOps sont l'instrument de mesure de la dette de mémoire en production.

### §6.6 — Tool design : idempotence, contrats d'effet de bord, schémas robustes

**Phrase-clé :** Un outil mal conçu transforme la tolérance aux pannes de l'orchestrateur en vecteur de corruption des données : idempotence, contrats d'effet de bord explicites et schémas validables ne sont pas des bonnes pratiques optionnelles — ce sont des propriétés de sûreté qui conditionnent la capacité de retry de l'agent.

Contenu :
- **Idempotence** : définition opérationnelle — appeler l'outil N fois avec les mêmes paramètres produit le même résultat que l'appeler une fois. Techniques : clé d'idempotence (*idempotency key*) dans le header ou le paramètre ; vérification d'état avant écriture (*check-then-act*) ; opérations upsert vs insert. Distinction GET (idempotent par définition REST) vs POST (à rendre idempotent par design).
- **Contrats d'effet de bord** (*side-effect contracts*) : déclaration explicite, dans la description de l'outil, de chaque effet non réversible — écriture en base, envoi d'e-mail, déclenchement de paiement, appel d'API externe facturée. L'agent doit savoir *avant* d'appeler si l'action est réversible. Format proposé : champ `side_effects` dans le schéma de description de l'outil.
- **Schémas robustes** : JSON Schema (inclus dans la spec MCP pour les *tools*) + OpenAPI 3.2 (septembre 2025, streaming SSE natif, navigation par tags). Pratiques Anthropic (*Writing effective tools for agents*, 2025) : descriptions textuelles guidant le comportement au-delà du schéma ; exemples d'usage inclus dans les définitions ; réponses d'erreur structurées avec corrections actionnables ; découverte à la demande des outils (*on-demand tool loading*).
- Extrait de code : schéma JSON d'outil avec `side_effects`, clé d'idempotence et description guidante (Python 3.13 ou TypeScript 5.6, à décider en Phase 3).
- Lien Ch. 9 : les contrats d'effet de bord sont aussi la première ligne de défense contre l'exploitation d'outils par *tool poisoning* — un agent qui connaît les effets de bord déclarés peut refuser d'exécuter une action dont les effets dépassent le contrat.

### §6.7 — Recommandation architecturale : composition des trois couches

**Phrase-clé :** L'architecture optimale combine un patron d'orchestration adapté à la topologie de la tâche, une stratégie mémoire alignée sur les types cognitifs requis, et des outils aux propriétés de sûreté vérifiables — ces trois couches doivent être conçues ensemble, pas séquentiellement.

Contenu : matrice de décision synthétique (taille du système × dynamicité × criticité des effets de bord → patron recommandé + outil mémoire + stratégie tool design) ; recommandation principale avec compromis, alternative, condition de bascule ; anti-patrons documentés (orchestrateur unique sur 50+ agents, mémoire sans éviction, outils sans idempotence en workflow de paiement) ; transition vers Ch. 7 (comment observer et opérer ce que Ch. 6 construit).

---

## Sources clés

1. **Hu, Y. et al. — « Memory in the Age of AI Agents: A Survey » — arXiv:2512.13564 — décembre 2025** — Taxonomie académique la plus exhaustive et récente de la mémoire agentique (47 auteurs). Référence normative pour §6.4. <https://arxiv.org/abs/2512.13564>

2. **Microsoft Foundry Blog — « Introducing Microsoft Agent Framework » — avril 2026** — Annonce GA de MAF 1.0, succession AutoGen → MAF, cinq patrons d'orchestration documentés, *Magentic Pattern* défini. Référence pour §6.2 et §6.3. <https://devblogs.microsoft.com/foundry/introducing-microsoft-agent-framework-the-open-source-engine-for-agentic-ai-apps/>

3. **LangChain / focused.io — « Multi-Agent Orchestration in LangGraph: Supervisor vs Swarm » — 2025-2026** — Définition opérationnelle des cinq patrons LangGraph avec critères de sélection. Référence pour §6.2. <https://focused.io/lab/multi-agent-orchestration-in-langgraph-supervisor-vs-swarm-tradeoffs-and-architecture>

4. **Anthropic Engineering — « Writing effective tools for AI agents » — 2025** — Doctrine Anthropic sur le design d'outils : descriptions guidantes, métriques d'appels, réponses d'erreur actionnables, on-demand loading. Référence pour §6.6. <https://www.anthropic.com/engineering/writing-tools-for-agents>

5. **Mem0 — « State of AI Agent Memory 2026 »** — Chiffres de marché et comparatif Mem0 / Zep / LangMem / Letta. Référence pour §6.4 et §6.5. <https://mem0.ai/blog/state-of-ai-agent-memory-2026>

6. **OpenAI — « New tools for building agents » (Agents SDK) — mars 2025** — Chronologie Swarm → Agents SDK, primitives Handoffs / Guardrails / Tracing, sunset Assistants API. Référence pour §6.3. <https://openai.com/index/new-tools-for-building-agents/>

7. **NeurIPS 2025 — « Multi-Agent Collaboration via Evolving Orchestration » — arXiv:2505.19591** — Paradigme *puppeteer* RL-based, validation académique de l'orchestration dynamique vs statique. Référence pour §6.2 (Magentic). <https://arxiv.org/html/2505.19591v1>

8. **OpenAPI Initiative — Spécification OAS 3.2.0 — septembre 2025** — Version courante, streaming natif SSE, compatibilité JSON Schema complète. Référence pour §6.6. <https://spec.openapis.org/oas/v3.2.0.html>

9. **Anthropic Engineering — « Effective context engineering for AI agents » — 2025** — Gestion de la fenêtre de contexte comme ressource limitée, stratégies de compression. Référence pour §6.5. <https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents>

10. **Mem0 — « Graph-Based Memory Solutions for AI Context: Top 5 Compared » — janvier 2026** — Différenciation technique Zep (graphe temporel) vs Mem0 (graphe relationnel multi-sessions). Référence pour §6.4. <https://mem0.ai/blog/graph-memory-solutions-ai-agents>
