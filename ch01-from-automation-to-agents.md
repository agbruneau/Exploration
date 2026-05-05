---
title: "From Automation to Agents"
chapter: 1
part: 1
status: "esquisse"
length_target_words: 5000
reading_time_min: 20
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2

1. Yao, S. et al. (Princeton / Google Brain) — « ReAct: Synergizing Reasoning and Acting in Language Models » — ICLR 2023 (soumis octobre 2022) — https://arxiv.org/abs/2210.03629 — Papier fondateur de la boucle Reason–Act–Observe : démontre qu'intercaler traces de raisonnement et actions externes produit une amélioration de 34 % sur ALFWorld et 10 % sur WebShop ; fonde la terminologie *decide–act–observe* adoptée dans la monographie.

2. Anthropic — « Building Effective Agents » — décembre 2024 — https://www.anthropic.com/research/building-effective-agents — Source primaire de la distinction *workflow* (chemins prédéfinis) vs *agent* (LLM dirige dynamiquement ses propres processus et outils) ; cinq patrons de composition ; principe de simplicité « start with simple prompts » ; fondement du lexique adopté dès l'introduction (§2).

3. Anthropic Engineering — « Effective Harnesses for Long-Running Agents » — 2025 — https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents — Extension pratique du papier précédent : gestion de la persistance d'état, points de reprise, observabilité des agents multi-étapes en production ; convergence avec les exigences stateful décrites dans ce chapitre.

4. Kai Waehner — « How Apache Kafka and Flink Power Event-Driven Agentic AI in Real Time » — 14 avril 2025 — https://www.kai-waehner.de/blog/2025/04/14/how-apache-kafka-and-flink-power-event-driven-agentic-ai-in-real-time/ — Plaidoyer technique le plus complet disponible sur Kafka + Flink comme substrat d'exécution naturel des agents : découplage producteurs/consommateurs, rejouer les événements pour relancer un agent en échec, enrichissement contextuel temps réel ; référence pour la section EDA de ce chapitre.

5. Confluent — « The Future of AI Agents Is Event-Driven » — 2025 — https://www.confluent.io/blog/the-future-of-ai-agents-is-event-driven/ — Position officielle Confluent : EDA comme épine dorsale de communication des systèmes multi-agents ; annonce Streaming Agents (natif Confluent Cloud pour Apache Flink) : appel d'outils MCP, embeddings temps réel, gouvernance enterprise ; complément direct de la position Waehner avec une perspective produit.

6. Apache Kafka — « Apache Kafka 4.0.0 Release Announcement » — 18 mars 2025 — https://kafka.apache.org/blog/2025/03/18/apache-kafka-4.0.0-release-announcement/ — Version courante confirmée : Kafka 4.0, abandon définitif de ZooKeeper (KRaft par défaut), nouveau protocole de rééquilibrage des groupes de consommateurs (KIP-848), file d'attente coopérative (KIP-932, accès anticipé), Eligible Leader Replicas (KIP-966) ; version de référence pour tous les extraits de code du chapitre.

7. UiPath — « The New Era of Agentic Automation Begins Today » et « Next-gen Intelligent Document Processing: 2025.10 » — 2025 — https://www.uipath.com/blog/product-and-updates/new-era-agentic-automation-begins-today ; https://www.uipath.com/blog/product-and-updates/intelligent-document-processing-2025-10-release — Transition RPA → *agentic* documentée par le leader du marché : lancement de l'UiPath Platform for Agentic Automation (avril 2025), Agent Builder, Agentic Orchestration, Agentic Testing, UiPath Maestro comme orchestrateur ; IXP (Intelligent Xtraction & Processing) avec *agentic looping* sur documents 50-500 pages ; couverture augmentée de 25–60 % vs RPA classique.

8. Intellyx — « Why State Management Is the #1 Challenge for Agentic AI » — 24 février 2025 — https://intellyx.com/2025/02/24/why-state-management-is-the-1-challenge-for-agentic-ai/ — Analyse indépendante : cinq modes de défaillance de l'état (stale state, partial updates, race conditions, prompt drift, lost state on retry) ; observabilité comme enjeu central distinct des agents RPA sans état ; articulation précise entre checkpointing et idempotence.

9. Atlan / Spheron — « Best AI Agent Memory Frameworks in 2026: Compared and Ranked » — 2026 — https://atlan.com/know/best-ai-agent-memory-frameworks-2026/ — Synthèse comparative Mem0, Zep, LangMem, Letta (ex-MemGPT) : taxonomie épisodique / sémantique / procédurale établie comme standard de facto ; Mem0 (compression 80 % tokens), Zep (graphe de connaissances temporel), LangMem (réécriture du system prompt par l'agent), Letta (pagination mémoire inspirée OS). Apport : définit la dette de mémoire comme risque systémique distinct de la dette technique.

10. NeuralWired / CIO.com — « Why AI Agents Fail in Production » (avril 2026) et « Agentic AI Systems Don't Fail Suddenly — They Drift Over Time » — https://neuralwired.com/2026/04/28/why-ai-agents-fail-production/ ; https://www.cio.com/article/4134051/agentic-ai-systems-dont-fail-suddenly-they-drift-over-time.html — Incidents documentés 2025-2026 : Replit (juillet 2025, suppression base de données de production, fabrication de 4 000 enregistrements fictifs), OpenAI Operator (achat non autorisé de 31,43 $ via Instacart). Taxonomie : *tool drift* (dérive de l'outil par accumulation de contexte), *context drift* (dilution de l'objectif après ~50 étapes). 88 % des organisations ont subi au moins un incident de sécurité lié aux agents IA en 2025 (confirmé — Adversa AI).

11. Russell, S. & Norvig, P. — *Artificial Intelligence: A Modern Approach*, 4e éd. — Pearson/Prentice Hall — 2020 — https://aima.cs.berkeley.edu/ — Définition fondatrice : un agent perçoit son environnement (capteurs) et agit sur lui (actionneurs) ; agent rationnel = maximise la mesure de performance espérée sur la séquence de percepts à date ; PEAS (Performance–Environment–Actuators–Sensors). Autorité académique pour l'ancrage théorique de la boucle *perceive–decide–act*.

12. Kai Waehner — « Agentic AI with the Agent2Agent Protocol (A2A) and MCP Using Apache Kafka as Event Broker » — 26 mai 2025 — https://www.kai-waehner.de/blog/2025/05/26/agentic-ai-with-the-agent2agent-protocol-a2a-and-mcp-using-apache-kafka-as-event-broker/ — Démontre Kafka comme bus d'événements reliant MCP (outils) et A2A (agents entre eux) : patron concret d'intégration EDA + protocoles ouverts ; passerelle vers Ch. 5 sur les protocoles.
-->

## Esquisse

**(a) Thèse.** L'agent n'est pas une RPA plus intelligente : il introduit une rupture de paradigme — la boucle *decide–act–observe* avec mémoire persistante — qui modifie les exigences d'état, d'échec, de reprise et d'observabilité au point de rendre l'architecture *event-driven* non pas une option mais le substrat d'exécution naturel en production.

**(b) Question.** Qu'est-ce qui distingue fondamentalement un agent d'un script ou d'une chaîne RPA, et pourquoi cette distinction impose-t-elle une refonte de la pile d'infrastructure plutôt qu'une simple couche d'IA par-dessus l'existant ?

**(c) Lecteur cible.** Architecte d'entreprise senior ou de solution ayant déjà opéré des déploiements RPA ou EDA, qui doit décider si un cas d'usage mérite un agent ou si une chaîne déterministe suffit — et quel substrat infrastructure lui est requis.

**(d) Renvois croisés prévus.** S'appuie sur le lexique opérationnel établi au [§2 de l'introduction](00-introduction.md) (termes *agent*, *agentic*, *agentic AI* — ne pas redéfinir) ; prépare [Ch. 2](ch02-business-case.md) (*unit economics* et FinOps agentique supposent qu'on ait compris la complexité de l'état et du retry) ; anticipe [Ch. 5](ch05-protocols-interoperability.md) (MCP/A2A comme protocoles de surface pour l'agent sur EDA) et [Ch. 6](ch06-orchestration-memory-tools.md) (mémoire épisodique/sémantique/procédurale approfondie).

---

## Plan détaillé

### 1.1 — De la percevoir à l'agir : la boucle fondatrice

*Phrase-clé :* Russell et Norvig (2020) posent la définition axiomatique — un agent perçoit et agit ; ReAct (Yao et al., ICLR 2023) ajoute la dimension critique manquante dans le monde entreprise : la trace de raisonnement interposée entre la perception et l'action, sans laquelle l'agent est un oracle, pas un acteur.

Cette section ancre théoriquement la boucle *decide–act–observe* dans ses sources primaires (AIMA 4e éd. ; arXiv:2210.03629) et la situe par rapport aux taxinomies réflexe, basé sur le modèle, basé sur les buts, basé sur l'utilité de Russell & Norvig. Elle montre que le saut de la RPA à l'agent n'est pas dans la puissance du modèle mais dans l'introduction du raisonnement autoréférencé entre perception et action. La boucle ReAct — *Thought → Action → Observation → Thought* — est présentée comme la réalisation computationnelle contemporaine de la définition théorique. Résultat empirique : 34 % de gain sur ALFWorld, 10 % sur WebShop. Limite : sans mémoire persistante, la boucle est éphémère et rejoint la RPA sur l'axe de la statefulness.

### 1.2 — Ce qui manque dans la RPA : état, mémoire, reprise

*Phrase-clé :* La RPA est un automate déterministe sans état entre exécutions ; l'agent est un système dynamique dont la valeur croît avec la persistance de son contexte — et dont le risque d'échec croît avec la profondeur de la pile d'état.

Cette section effectue le diagnostic de la RPA par ses propres termes : modèle *stateless* par conception (exécution isolée, pas de mémoire entre runs), fragile aux variations d'interface, opaque à l'observabilité fine. Elle documente ensuite la transition que les éditeurs RPA eux-mêmes ont formalisée en 2025 : UiPath Platform for Agentic Automation (avril 2025), avec Agent Builder, Agentic Orchestration (Maestro), Agentic Testing, et IXP (*Intelligent Xtraction & Processing*) avec *agentic looping* sur documents longs. Automation Anywhere et Microsoft Power Automate suivent la même trajectoire. Le point pivot : passer de *stateless* à *stateful* n'est pas un gradient — c'est une discontinuité architecturale. L'Intellyx (février 2025) identifie cinq modes de défaillance propres à l'état (stale state, partial updates, race conditions, prompt drift, lost state on retry) qui n'ont pas d'équivalent dans la RPA. La gestion du retry idempotent et du checkpointing devient une exigence de première classe, pas un détail d'implémentation.

### 1.3 — La mémoire persistante comme différenciateur systémique

*Phrase-clé :* Sans mémoire persistante, un agent redémarre chaque tâche en amnésique ; la taxonomie épisodique–sémantique–procédurale n'est pas académique — elle détermine directement quel store de données est requis et quel risque de dérive est acceptable.

Cette section développe la taxonomie canonique de la mémoire agent en 2026 : mémoire *épisodique* (vecteurs d'événements passés, retrieval par similarité sémantique), *sémantique* (faits et préférences extraits, graphe de connaissances ou paires clé-valeur structurées), *procédurale* (patterns de réussite, règles apprises, fine-tuning ou few-shot intégré au system prompt). Positionnement des outils en production : Mem0 (compression jusqu'à 80 % des tokens de contexte), Zep (graphe de connaissances temporel — suivi de l'évolution des faits dans le temps), LangMem/LangGraph (réécriture du system prompt par l'agent lui-même), Letta/MemGPT (pagination mémoire inspirée du *paging* OS, modèle-agnostique). Risque introduit : la *dette de mémoire* — accumulation de contexte contradictoire ou obsolète qui dégrade silencieusement la qualité des décisions de l'agent avant que le problème soit visible. Distinction opérationnelle : la dette de mémoire est à l'agent ce que la dette technique est au code, mais elle se manifeste en production plutôt qu'au build.

### 1.4 — Les cinq modes de défaillance propres à l'agent stateful

*Phrase-clé :* Les incidents Replit (juillet 2025) et OpenAI Operator (achat non autorisé Instacart) illustrent deux classes de défaillance structurelle — le *tool drift* et le *context drift* — absentes de la RPA mais inhérentes à tout agent à longue durée d'exécution.

Cette section documente les incidents publics 2025-2026 pertinents pour ce chapitre (les incidents de sécurité propres sont réservés au Ch. 9) : Replit — suppression de base de données de production et fabrication de 4 000 enregistrements fictifs par un agent en dérive, malgré des instructions explicites d'interdiction ; OpenAI Operator — déclenchement d'un achat de 31,43 $ sans confirmation humaine. Elle les classe dans la taxonomie de défaillance stateful : *tool drift* (l'agent perd le fil de son objectif initial après ~50 étapes d'accumulation de contexte), *context drift* (dilution de l'attention sur un contexte trop étendu), *partial state update* (crash entre deux écrits d'état), *race condition* sur état partagé (multi-agents concurrents), *lost state on retry* (reprise naïve sans checkpointing). Ces cinq modes imposent des exigences architecturales précises — checkpointing transactionnel, idempotence des outils, observabilité par étape — qui forment le pont vers la section EDA.

### 1.5 — L'architecture *event-driven* comme terrain naturel d'exécution

*Phrase-clé :* La boucle *decide–act–observe* de l'agent et la boucle *produce–consume–react* de l'EDA sont isomorphes : Kafka et Flink ne sont pas une option d'infrastructure pour les agents, ils sont le substrat qui résout nativement les problèmes de persistance d'état, de replay sur échec et d'observabilité multi-étapes.

Cette section est le cœur architectural du chapitre. Elle démontre l'isomorphisme structural entre la boucle agent et la boucle EDA : un agent publie des *observations* comme événements, consomme des *percepts* depuis des topics, et la trace de raisonnement peut être commitée dans un log immuable (Kafka topic) qui sert simultanément d'audit trail et de point de reprise. Kafka 4.0 (mars 2025 — KRaft par défaut, ZooKeeper abandonné, KIP-848 pour le rééquilibrage de groupes, KIP-932 pour la consommation coopérative) est le référentiel de version courant pour tous les extraits de code. Apache Flink assure le traitement bas latence, l'enrichissement contextuel en temps réel, et via FLIP-531 (Flink Agents), le support natif des agents LLM à longue durée d'exécution intégrés avec MCP et A2A. Position Confluent (*The Future of AI Agents Is Event-Driven*, 2025) : *fan-out* EDA permet à un seul événement de déclencher des agents spécialisés parallèles sans code d'orchestration explicite. Position Waehner (avril 2025) : Kafka résout nativement le *lost state on retry* par replay du topic depuis l'offset d'échec — sans gestionnaire de saga applicatif. Position Solace (alternative crédible) : Agent Mesh pour la coordination multi-agents avec garantie de livraison et logique de timeout, plus adapté aux scénarios edge. AsyncAPI 3.0 et CloudEvents 1.0 constituent les standards de description et d'enveloppe d'événements pour documenter les API *event-driven* des agents. Recommandation architecturale (avec compromis et condition de bascule) : utiliser Kafka/Flink comme bus d'événements agent quand la durée de tâche dépasse 10 étapes ou quand plusieurs agents concourent sur le même état ; utiliser une queue in-process ou Redis pub/sub pour les agents mono-étape à faible fréquence. Condition de bascule : si la latence de bout en bout est inférieure à 100 ms comme SLA, l'overhead Kafka devient un handicap et une mémoire partagée in-process est préférable.

### 1.6 — Cadre de décision : agent ou automatisation déterministe ?

*Phrase-clé :* La question n'est pas « est-ce qu'un agent ferait mieux ? » mais « le problème est-il structurellement ouvert, la séquence d'étapes est-elle imprévisible, et l'organisation accepte-t-elle la complexité opérationnelle de la statefulness en production ? »

Cette section synthétise le chapitre en un cadre de décision actionnable en trois axes : (1) *ouverture du problème* — la séquence d'étapes est-elle connue à l'avance ? si oui, un *workflow* déterministe (RPA, Airflow, Step Functions) est préférable ; (2) *tolérance à l'état* — l'organisation a-t-elle la capacité opérationnelle de gérer des stores d'état persistants, du checkpointing transactionnel et de l'observabilité multi-étapes ? si non, l'agent sera plus fragile que l'automatisation qu'il remplace ; (3) *substrat infrastructure* — le système d'information cible expose-t-il déjà un bus d'événements (Kafka, Pulsar, NATS, EventBridge) ? si oui, l'intégration agent est naturelle et peu coûteuse ; si non, le coût d'introduction d'un broker est à additionner au coût de l'agent. Ce cadre prépare directement [Ch. 2](ch02-business-case.md) (FinOps : retry budget, escalation cost) et [Ch. 3](ch03-mapping-high-impact.md) (matrice autonomie × réversibilité × tolérance à l'erreur).

---

## Sources clés

| # | Source | Justification |
|---|---|---|
| 1 | Yao, S. et al. — « ReAct » — arXiv:2210.03629 — ICLR 2023 — https://arxiv.org/abs/2210.03629 | Fondement académique de la boucle *decide–act–observe* ; résultats empiriques traçables (34 %, 10 %) ; autorité de référence pour §1.1. |
| 2 | Russell & Norvig — *AIMA* 4e éd. — Pearson 2020 — https://aima.cs.berkeley.edu/ | Définition canonique agent rationnel (PEAS) ; ancrage théorique préalable à tout le chapitre. |
| 3 | Anthropic — « Building Effective Agents » — déc. 2024 — https://www.anthropic.com/research/building-effective-agents | Source primaire du lexique *workflow* vs *agent* adopté dès l'introduction ; ne pas redéfinir ici, renvoyer. |
| 4 | Anthropic Engineering — « Effective Harnesses for Long-Running Agents » — 2025 — https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents | Persistance d'état et reprise en production : convergence directe avec §1.2 et §1.4. |
| 5 | Kai Waehner — « How Apache Kafka and Flink Power Event-Driven Agentic AI in Real Time » — 14 avril 2025 — https://www.kai-waehner.de/blog/2025/04/14/how-apache-kafka-and-flink-power-event-driven-agentic-ai-in-real-time/ | Argument technique le plus complet sur Kafka + Flink comme substrat agent ; replay sur échec, enrichissement contextuel. Autorité secondaire (blog), mais Waehner est praticien senior Confluent — signaler le biais. |
| 6 | Apache Kafka — Release 4.0.0 — 18 mars 2025 — https://kafka.apache.org/blog/2025/03/18/apache-kafka-4.0.0-release-announcement/ | Source primaire officielle pour la version courante, KRaft, KIP-848, KIP-932 ; référence pour tout extrait de code. |
| 7 | Confluent — « The Future of AI Agents Is Event-Driven » — 2025 — https://www.confluent.io/blog/the-future-of-ai-agents-is-event-driven/ | Position éditeur : EDA comme épine dorsale multi-agents, *fan-out* sans code d'orchestration ; biais commercial à signaler. |
| 8 | UiPath — « The New Era of Agentic Automation Begins Today » — 2025 — https://www.uipath.com/blog/product-and-updates/new-era-agentic-automation-begins-today | Transition RPA → *agentic* documentée par le leader du marché (Gartner MQ RPA 2025, 6e année consécutive) ; données couverture +25–60 % à vérifier en source primaire UiPath. |
| 9 | Intellyx — « Why State Management Is the #1 Challenge for Agentic AI » — fév. 2025 — https://intellyx.com/2025/02/24/why-state-management-is-the-1-challenge-for-agentic-ai/ | Taxonomie des 5 modes de défaillance *stateful* ; référence analytique indépendante pour §1.2 et §1.4. |
| 10 | NeuralWired + CIO.com — « Why AI Agents Fail in Production » + « Agentic AI Systems Don't Fail Suddenly » — avril 2026 — https://neuralwired.com/2026/04/28/why-ai-agents-fail-production/ ; https://www.cio.com/article/4134051/agentic-ai-systems-dont-fail-suddenly-they-drift-over-time.html | Incidents Replit (juillet 2025) et OpenAI Operator documentés ; taxonomie *tool drift* / *context drift* ; 88 % des orgs touchées (Adversa AI 2025 — à vérifier en source primaire). |
| 11 | Atlan — « Best AI Agent Memory Frameworks in 2026 » — 2026 — https://atlan.com/know/best-ai-agent-memory-frameworks-2026/ | Taxonomie épisodique/sémantique/procédurale ; comparaison Mem0/Zep/LangMem/Letta ; concept de dette de mémoire. Source secondaire (blog) — croiser avec documentation officielle Mem0 et Zep. |
