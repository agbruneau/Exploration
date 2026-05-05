---
title: "AgentOps: Operating Long-Running Agents"
chapter: 7
part: 3
status: "esquisse"
length_target_words: 6500
reading_time_min: 26
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2

1. Joshi, S. — « LLMOps, AgentOps, and MLOps for Generative AI: A Comprehensive Review » — International Journal of Computer Applications Technology and Research, Vol. 14, Issue 07 — 2025 — https://ijcat.com/archieve/volume14/issue7/ijcatr14071001.pdf — Revue systématique de 100+ articles sur les trois disciplines (MLOps, LLMOps, AgentOps). Delta opérationnel précis : MLOps s'arrête à la frontière du modèle (entraînement, versionnage, qualité de prédiction) ; LLMOps ajoute la gestion du prompt, du contexte et de la dérive ; AgentOps étend à la surface d'exécution complète (raisonnement multi-étapes, invocation d'outils, mémoire persistante, délégation, budget). Source académique primaire pour le delta MLOps→AgentOps.

2. Intellibytes — « What is AgentOps? The Ultimate 2026 Guide to AI Agent Operations » — Medium — 2026 — https://medium.com/@Intellibytes/what-is-agentops-the-ultimate-2026-guide-to-ai-agent-operations-544876848ddd — Définition opérationnelle : « AgentOps governs AI that acts, not just AI that predicts or generates. » Différentiel MLOps vs AgentOps : MLOps s'arrête au modèle, AgentOps couvre l'exécution autonome — outils, mémoire, sessions, politique, budgets. Organisations avec les trois disciplines intégrées opèrent 30-40 % plus rapidement avec moins d'incidents (*à vérifier* — source secondaire, pas d'étude primaire citée). Apport : articulation la plus claire du delta disciplinaire disponible en 2026.

3. N-iX — « AI agent observability: The new standard for enterprise AI in 2026 » — N-iX Engineering Blog — 2026 — https://www.n-ix.com/ai-agent-observability/ — Observabilité agentique : traces reconstituant le chemin de décision complet (appels LLM, invocations d'outils, récupérations mémoire, décisions intermédiaires). Problème central : les agents empruntent des chemins d'exécution différents pour la même requête ; sans visibilité, impossible de distinguer divergence bénigne de divergence dangereuse. Chiffre : 89 % des organisations ont implémenté une forme d'observabilité agentique ; 62 % disposent d'un tracing étape par étape (*à vérifier* — source non identifiée dans l'article N-iX, probablement Datadog SoAE).

4. OpenTelemetry — « Semantic Conventions for GenAI agent and framework spans » — OpenTelemetry — état au 2026-05-05 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/ — Spec officielle des conventions sémantiques OTel pour agents GenAI. Statut : *Development* (labelisé explicitement) à OTel Semantic Conventions 1.40.0 (17 avril 2026) — pas encore *experimental*, donc instable. Attributs définis : gen_ai.agent.id, gen_ai.agent.name, gen_ai.agent.description, gen_ai.agent.version. Opérations : create_agent, invoke_agent. Variable d'opt-in : OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental. Note : dans le résultat de recherche Ch. 4, la version de mars 2026 était encore labelisée *experimental* ; la version d'avril 2026 a été rebaptisée *Development* — divergence de statut entre les deux vérifications, à noter. Adoption : Datadog (natif depuis OTel v1.37), Grafana (collecte traces LLM dans Loki), Elastic (*à vérifier*). Apport : référence normative primaire pour l'instrumentation OTel des agents.

5. earezki.com / Medium — « AI Agent Observability: Lessons from the Replit Production Data Loss Incident » — 18 mars 2026 — https://earezki.com/ai-news/2026-03-18-the-ai-agent-that-defied-a-code-freeze-deleted-1200-customer-records-and-then-lied-about-it/ — Incident Replit juillet 2025 : agent supprime 1 206 enregistrements de production malgré instruction de gel explicite en majuscules. Cause racine documentée : opération sans observabilité du raisonnement — les logs capturaient les sorties, pas les décisions ; dérive accumulée invisiblement ; absence de séparation dev/prod dans les permissions de l'agent. Réponse Replit : mode planning-only, séparation automatique dev/prod, amélioration des rollbacks. Fortune, 23 juillet 2025, confirme le fait (*confirmé* — source primaire journalistique). Apport : cas de production le plus documenté publiquement sur les conséquences d'une observabilité absente en 2025.

6. Microsoft — « From Zero to Hero: AgentOps — End-to-End Lifecycle Management for Production AI Agents » — Azure AI Foundry Blog (TechCommunity) — 2026 — https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/from-zero-to-hero-agentops---end-to-end-lifecycle-management-for-production-ai-a/4484922 — Cycle de vie Azure AI Foundry : développement local → test → déploiement canary → promotion production → monitoring → pause/update/retire (one-click lifecycle management). Architecture : agents hébergés = applications agentiques conteneurisées sur Foundry Agent Service. Déploiement déclenché par check-in de code (CI/CD natif). Apport : seule source hyperscaleur avec cycle de vie AgentOps formalisé en documentation publique à mai 2026 ; complémentaire à AWS Bedrock AgentCore.

7. AWS — « Introducing Amazon Bedrock AgentCore: Securely deploy and operate AI agents at any scale » — AWS News Blog — 2025 — https://aws.amazon.com/blogs/aws/introducing-amazon-bedrock-agentcore-securely-deploy-and-operate-ai-agents-at-any-scale/ — Bedrock AgentCore (lancé GA octobre 2025) : observabilité étape par étape via CloudWatch, métadonnées par span, scoring custom, inspection de trajectoire, filtres de débogage. Mémoire de session via DynamoDB. Collaboration multi-agents (agents délèguent des sous-tâches). Apport : implémentation hyperscaleur de référence pour l'observabilité + cycle de vie agents en production sur AWS.

8. Braintrust — « What is agent observability? Tracing tool calls, memory, and multi-step reasoning » — Braintrust Articles — 2026 — https://www.braintrust.dev/articles/agent-observability-tracing-tool-calls-memory — Définition opérationnelle complète : observabilité = capture de la requête de récupération émise par l'agent, des entrées retournées, des scores de pertinence ; traces = « call stack » de l'agent IA. Braintrust implémente architecture à *spans* imbriqués (SOC 2 / GDPR / HIPAA), CI/CD gates bloquant les déploiements en cas de dégradation de qualité (évaluation automatique des scorers + significance statistique). Apport : définition la plus précise des *tool spans* et *memory traces* ; cas d'usage CI/CD gate pour régression continue.

9. DigitalApplied — « Agent Observability: LangSmith, Langfuse, Arize 2026 » — DigitalApplied Blog — 2026 — https://www.digitalapplied.com/blog/agent-observability-platforms-langsmith-langfuse-arize-2026 — Panorama des six plateformes anchor 2026 : LangSmith (intégration LangGraph la plus profonde — diffs d'état nœud par nœud, graphes d'exécution, replay contre nouveaux modèles), Langfuse (open-source, racheté par ClickHouse jan. 2026, framework-agnostique, self-hostable), Arize Phoenix (OTel-natif, open-source, six modalités d'évaluation), Helicone (proxy drop-in, déploiement le plus rapide), Datadog LLM Observability (défaut enterprise pour clients Datadog), Honeycomb LLM (event-based deep tracing). Apport : tableau comparatif authoritaire le plus récent disponible à mai 2026.

10. sakurasky.com — « Trustworthy AI Agents: Deterministic Replay » — 2025-2026 — https://www.sakurasky.com/blog/missing-primitives-for-trustworthy-ai-part-8/ — *Replay* déterministe = forme de test de régression par instantané (*golden file*) : la sortie rejouée est comparée au comportement historique connu-bon. Les replays hors ligne doivent être conservés pour révision d'incident et régression, ensemencés avec des goldens et des scénarios red-team. *Shadow runs* : faire tourner la nouvelle version de l'agent en parallèle de la version courante sur le trafic de production réel, sans exposer ses sorties aux utilisateurs. Apport : définition opérationnelle précise des trois techniques d'évaluation en production (régression continue, replay, shadow runs) — seule source disponible articulant les trois ensemble.

11. NeuralWired — « Why AI Agents Fail in Production (2026 Fix Guide) » — 28 avril 2026 — https://neuralwired.com/2026/04/28/why-ai-agents-fail-production/ — Causes de défaillance documentées en production 2026 : dérive accumulée invisible (prompt drift, stale state — voir Ch. 6 §6.5), absence d'observabilité du raisonnement, confusion dev/prod dans les permissions, outils non idempotents sans supervision. Chiffre : agents dérivent après 50+ interactions (*confirmé* — alignement avec Ch. 1 et Ch. 6). Lien AgentOps : alerting sur dérive comportementale comme contre-mesure primaire. Apport : corpus d'incidents 2026 distinct de Replit, corrobore les modes de défaillance documentés au Ch. 6.

12. Halacli.com — « From MLOps to AgentOps: The Next Evolution in AI Operations » — 15 février 2026 — https://www.halacli.com/19_2026-02-15-mlops-to-agentops — Transition structurelle MLOps → LLMOps → AgentOps : chaque transition = changement fondamental de ce qui est opéré (code déterministe → modèles probabilistes → systèmes autonomes). Plan de contrôle central AgentOps : périmètres de permission des agents, limites de débit (*rate limits*), budgets de retry et d'escalade, *kill switches* avec capacité d'arrêt immédiat. Apport : formalisation du plan de contrôle comme composante distincte de l'observabilité — essentiel pour la section cycle de vie.
-->

> **Partie 3 — La pile *agentic***
> **Chapitre 7 · AgentOps : opérer des agents longue durée · ~6 500 mots · lecture ≈ 26 min**

## Esquisse

**(a) Thèse.** AgentOps est une discipline opérationnelle distincte de MLOps — non pas une extension incrémentale, mais une rupture de surface : là où MLOps s'arrête à la frontière du modèle, AgentOps couvre l'exécution autonome complète, multi-étapes, multi-outils, avec mémoire persistante et cycle de vie propre. Les organisations qui instrumentent, évaluent et pilotent le cycle de vie de leurs agents avec cette rigueur sont les seules capables d'éviter la classe d'incidents — dérive invisible, corruption de données, franchissement de périmètres de sécurité — que la production de 2025-2026 a rendue systémique.

**(b) Question à laquelle répond le chapitre.** Comment opérer des agents *agentic* en production de manière à détecter leur dérive, mesurer leur qualité continue, et les promouvoir, rétrograder ou retirer sans rupture de service — et quels outils, standards et patrons sont disponibles à mai 2026 pour y parvenir ?

**(c) Lecteur cible précis.** Architectes d'entreprise et responsables de plateforme IA chargés de construire ou de valider la couche opérationnelle d'un programme agentique ; *AI ops managers* assumant la responsabilité des agents en production. Hypothèse : le lecteur a lu les Ch. 4–6 (métriques canoniques, protocoles, orchestration/mémoire/outils) et cherche la réponse opérationnelle à « comment on gère ça en production ? ».

**(d) Renvois croisés prévus.**
- [Ch. 4](ch04-roi-risk-readiness.md) : métriques canoniques (*task success*, *tool correctness*, *retry budget*, *escalation quality*, *policy compliance*) introduites ici, instrumentées au Ch. 7.
- [Ch. 6](ch06-orchestration-memory-tools.md) : *memory diffs* (§6.5) et *tool spans* (§6.6) comme signaux d'observabilité primaires au Ch. 7.
- [Ch. 8](ch08-trustworthy-systems.md) : HITL opérationnel et auditabilité — renvoi depuis les sections sur l'escalade et le rollback.
- [Ch. 9](ch09-agentic-security.md) : *kill switches* et isolation de permission — renvoi depuis le plan de contrôle AgentOps.
- [Annexe C](annexe-C-agentops-maturity.md) : modèle de maturité AgentOps à 5 niveaux.

---

## Plan détaillé

### 7.1 — AgentOps vs. MLOps : le delta opérationnel précis

**Phrase-clé :** MLOps opère des artefacts statiques (poids de modèle, pipeline de prédiction) ; AgentOps opère des systèmes dynamiques dont l'état évolue à l'exécution, dont le comportement dépend des outils invoqués et de la mémoire accumulée, et dont les effets se produisent dans l'environnement réel — pas seulement dans une couche d'inférence.

Contenu :
- La chaîne MLOps classique : entraînement → validation → déploiement → monitoring de drift de distribution. Extrémité droite : l'inférence produit une sortie, l'humain agit. Le modèle ne touche pas à l'environnement.
- Ce qui s'ajoute avec LLMOps : gestion du prompt, de la fenêtre de contexte, du coût par token, de la dérive de réponse. L'action reste humaine.
- Ce qui se transforme avec AgentOps : l'agent agit. Les effets sont réels (e-mail envoyé, base modifiée, commande créée). La séquence d'actions est non déterministe. L'état s'accumule entre sessions. La définition du « bon comportement » ne se réduit pas à une distribution de prédictions — elle inclut les chemins d'exécution, les outils invoqués, le budget consommé, la politique respectée.
- Tableau comparatif sur 6 dimensions : unité d'observabilité, signal de dérive, artefact versionné, variable de rollback, budget à piloter, périmètre de permission.
- Référence primaire : Joshi, S. (IJCAT 2025) + Intellibytes 2026 + Halacli.com fév. 2026.

### 7.2 — Anatomie d'une trace agentique : spans, events, diffs

**Phrase-clé :** Une trace agentique n'est pas une trace de requête HTTP ni une trace de pipeline ML — c'est un arbre de spans hétérogènes : *LLM spans* (appels au modèle), *tool spans* (invocations d'outils avec entrées/sorties), *memory spans* (récupérations et écritures), *orchestration spans* (décisions de délégation) ; sans instrumenter les quatre catégories, la trace est aveugle sur la portion la plus risquée de l'exécution.

Contenu :
- Structure d'un *tool span* : timestamp de début et de fin, nom de l'outil, paramètres en entrée, résultat ou erreur en sortie, code de statut, retry count. Ce span est le signal primaire de *tool correctness* défini au Ch. 4 §4.3.
- *Memory diff* : comparaison de l'état mémoire avant et après une session — différence entre entrées épisodiques, modifications sémantiques, réécritures procédurales (voir Ch. 6 §6.5). Le memory diff est l'instrument de mesure de la dette de mémoire en production.
- *Orchestration span* : décision de délégation d'un supervisor à un worker — quel sous-agent a été activé, avec quel sous-objectif, quel résultat retourné.
- Conventions OTel GenAI : statut *Development* (Semantic Conventions 1.40.0, 17 avril 2026) — attributs gen_ai.agent.id, gen_ai.agent.name, gen_ai.agent.version ; opérations create_agent, invoke_agent ; opt-in via OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental. Note de stabilité : la spec était labellisée *experimental* en mars 2026 et a été reclassifiée *Development* en avril 2026 — API non encore stabilisée, adoption précoce à risque contrôlé.
- Adopters OTel GenAI : Datadog (natif depuis OTel v1.37), Grafana (Loki), Elastic (*à vérifier*).
- Divergence Ch. 4 : en mars 2026 le statut était *experimental* ; en avril 2026 *Development*. Les deux labels indiquent une spec instable — le risque est le même, le label a changé.
- Diagramme Mermaid : arbre de spans d'une session agentique typique (orchestration → LLM → tool → memory).

### 7.3 — Panorama des plateformes AgentOps (mai 2026)

**Phrase-clé :** Six plateformes d'observabilité agentique et trois hyperscaleurs structurent le marché en 2026 ; le choix entre eux est moins une décision de fonctionnalités qu'une décision d'architecture — vendor lock-in, OTel-natif, self-host, ou intégration cloud — dont les conséquences opérationnelles à 18 mois dépassent les avantages de convivialité à court terme.

Contenu :
- **Plateformes spécialisées** (tableau comparatif sur 5 critères : intégration framework, self-host, OTel, eval intégrée, CI/CD gate) :
  - *agentops.ai* : SDK-based, 12 % overhead mesuré 2026, 400+ frameworks, session replay, décorateur unique.
  - *LangSmith* : LangGraph-natif, diffs d'état nœud par nœud, replay contre nouveaux modèles, verrouillage LangChain, per-trace pricing.
  - *Langfuse* : open-source, racheté par ClickHouse jan. 2026 (code open-source maintenu), framework-agnostique, self-hostable, meilleure option data-residency.
  - *Arize Phoenix* : OTel-natif, six modalités d'évaluation, autohébergeable sur PostgreSQL + Kubernetes, open-source complet.
  - *Braintrust* : CI/CD gates avec significance statistique, SOC 2 / GDPR / HIPAA, 1M spans/mois tier gratuit, évaluation automation complète.
  - *Helicone* : proxy drop-in, install la plus rapide, cas d'usage coût et latence.
- **Hyperscaleurs** (colonne AgentOps dans le contexte de leur offre) :
  - *AWS Bedrock AgentCore* (GA oct. 2025) : CloudWatch step-by-step tracing, metadata tagging, scoring custom, trajectoire inspection.
  - *Azure AI Foundry* : agents conteneurisés sur Foundry Agent Service, CI/CD natif, one-click lifecycle (pause/update/retire), intégration Copilot Studio.
  - *Google Vertex AI Agent Builder* : A2A natif, Cloud Trace, unified surface (avantage vs Bedrock multi-surface).
- **APM enterprise** : Datadog LLM Observability (défaut enterprise Datadog, OTel v1.37 natif) ; New Relic AI monitoring (faible overhead, auto-instrumentation, SRE Agent pour incident investigation) ; Dynatrace (Davis AI, root cause automatique, minimal config).
- Recommandation avec compromis, alternative, condition de bascule.

### 7.4 — Instrumentation : de la métrique au dashboard à l'alerte

**Phrase-clé :** Les cinq métriques canoniques introduites au Ch. 4 ne se mesureront en production que si elles sont instrumentées explicitement — chacune exige un type de span différent, une source de données différente, et une stratégie d'alerting différente ; regrouper toutes les métriques dans un dashboard unique sans cette différenciation produit des indicateurs inutilisables.

Contenu :
- Correspondance métrique → source de span :
  - *Task success* ← span de niveau session (résultat final vs objectif déclaré) — grader code-based ou LLM-as-judge.
  - *Tool correctness* ← tool spans (selection accuracy + parameter accuracy mesurées séparément).
  - *Retry budget* ← compteur de retries par tool span + par session ; alerte sur dépassement de percentile P95.
  - *Escalation quality* ← spans d'escalade humaine (trigger, timing, contexte fourni) — nécessite annotation humaine pour le scoring.
  - *Policy compliance* ← comparaison des tool spans aux contrats d'effet de bord déclarés au Ch. 6 §6.6.
- Stratégie de dashboarding : deux niveaux — dashboard opérationnel temps réel (retry rate, error rate, latence P50/P95/P99) et dashboard qualité asynchrone (task success rate, escalation quality — agrégés sur 24h/7j).
- Alerting : règles de seuil vs règles de dérive comportementale. Une règle de seuil (*retry rate > 15 %*) détecte les pannes. Une règle de dérive (*task success rate baisse de 5 % en 7 jours*) détecte la dégradation lente. Les deux sont nécessaires ; les équipes n'implémentent généralement que les seuils.
- Snippet de code : Python 3.13 + OTel SDK, instrumentation d'un tool span avec attributs gen_ai.* et compteur retry.

### 7.5 — Évaluation en production : régression continue, replay, shadow runs

**Phrase-clé :** L'évaluation hors ligne ne peut pas anticiper la distribution réelle du trafic de production — évaluer en production n'est pas optionnel, c'est la seule façon de détecter les dégradations que les jeux de tests développement ne couvrent pas ; les trois techniques (régression continue, replay, shadow runs) s'appliquent à des stades différents du cycle de changement et sont complémentaires.

Contenu :
- **Régression continue** : chaque *pull request* déclenche un run d'évaluation complet sur le dataset de tests canonique ; un CI/CD gate bloque le merge si les scores tombent sous les seuils définis (approche Braintrust). La difficulté : définir des seuils pertinents sans évaluation préalable en production — le bootstrap est toujours sur données synthétiques ou annotées manuellement.
- **Replay** : forme de *golden file testing* — les traces de production passées (interactions réelles avec résultats annotés) servent de scénarios de test. Une nouvelle version de l'agent rejoue ces traces et compare les sorties aux goldens. Avantage : les goldens capturent des distributions de cas de bord réels. Risque : les goldens deviennent obsolètes si l'environnement change (APIs d'outils mises à jour, schémas modifiés).
- **Shadow runs** : la nouvelle version de l'agent tourne en parallèle de la version courante sur le trafic de production réel, ses sorties ne sont pas exposées aux utilisateurs. Comparaison des décisions et des chemins d'exécution des deux versions. Coût : doublement du coût d'inférence + d'exécution des outils pendant la période shadow. Justification économique : le coût du shadow run est inférieur au coût d'un incident de production sur une version non validée.
- Flux de feedback production → dataset de tests : les traces de production qui scored under threshold doivent alimenter automatiquement le dataset de test développement. Anthropic documente ce principe : « production monitoring samples live traffic, runs metrics asynchronously, sends alerts when scores fall below thresholds » (*Demystifying Evals*, 2025-2026).
- Diagramme Mermaid : pipeline évaluation (dev → CI/CD gate → shadow → canary → production → feedback loop).

### 7.6 — Cycle de vie de l'agent : promote, deprecate, roll back

**Phrase-clé :** Un agent n'est pas un modèle ML avec une version de poids : c'est un artefact composite (prompt système, outils liés, configuration mémoire, périmètre de permission) dont chaque composante peut évoluer indépendamment — le cycle de vie doit versionner l'artefact composite, pas ses composantes isolément, et la stratégie de rollback doit restaurer l'état composite précédent, pas seulement revenir à une version de prompt.

Contenu :
- **Définition de l'artefact agent versionné** : tuple (prompt système vN, ensemble d'outils avec versions, configuration mémoire, périmètre de permission, seuils d'escalade). Un changement sur l'un quelconque de ces cinq éléments crée une nouvelle version de l'agent.
- **Promote (canary → production)** : stratégie canary — 5-10 % du trafic sur la nouvelle version, comparaison des métriques sur 24 h minimum avant promotion complète. Critères de promotion : task success ≥ version précédente ± marge, retry rate ≤ seuil, aucune violation de policy compliance.
- **Deprecate** : plan de transition avec délai d'annonce aux consommateurs de l'agent, migration du trafic progressive, archivage de la version retirée comme cible de rollback d'urgence. Analogie avec le sunset d'API.
- **Roll back** : chaque déploiement doit conserver la version précédente comme cible de rollback immédiat. Auto-revert si le taux d'erreur de la nouvelle version dépasse un seuil dans les N premières minutes post-déploiement. Azure AI Foundry propose ce mécanisme one-click (*confirmé* — TechCommunity, 2026).
- **Kill switch** : capacité d'arrêt immédiat de tout agent actif, sans attendre le cycle de déploiement normal — nécessaire pour les incidents de sécurité (prompt injection, franchissement de périmètre). Le kill switch est un composant du plan de contrôle AgentOps, distinct du rollback de version.
- Tableau : matrice décision (signal → action recommandée) : dégradation lente → shadow run d'investigation ; dépassement de seuil → canary revert ; incident de sécurité → kill switch immédiat.
- Renvoi Ch. 9 pour le modèle de menace et les kill switches en contexte sécurité.

### 7.7 — Recommandation architecturale et transition vers Ch. 8

**Phrase-clé :** La maturité AgentOps d'une organisation se mesure à sa capacité à répondre à trois questions en moins de cinq minutes : quel est le taux de succès de l'agent sur les 24 dernières heures, quelle version est en production, et quelle action corrective est disponible immédiatement — les organisations qui ne peuvent pas répondre rapidement aux trois opèrent en aveugle.

Contenu :
- Recommandation principale avec compromis, alternative, condition de bascule.
- Anti-patrons documentés :
  - Observabilité des outputs uniquement (logs de sorties sans traces de raisonnement) — le cas Replit.
  - Métriques sans seuils (dashboards informatifs non actionnables).
  - Versionnage de prompt sans versionnage des outils liés (rollback partiel, état composite incohérent).
  - Shadow runs non budgétés (coût d'inférence doublé surprend les équipes sans provision).
- Transition vers Ch. 8 : l'observabilité et le cycle de vie constituent l'infrastructure de confiance technique — mais la confiance dans les décisions d'un agent requiert une couche supplémentaire : l'auditabilité des décisions, le modèle HITL opérationnel, et la conformité réglementaire. C'est l'objet du Ch. 8.

---

## Sources clés

1. **Joshi, S. — « LLMOps, AgentOps, and MLOps for Generative AI: A Comprehensive Review » — IJCAT Vol. 14 Issue 07 — 2025 — https://ijcat.com/archieve/volume14/issue7/ijcatr14071001.pdf** — Source académique primaire pour le delta MLOps→LLMOps→AgentOps. Revue systématique 100+ articles. Justification : seule revue académique publiée dans un journal indexé couvrant les trois disciplines en 2025.

2. **OpenTelemetry — « Semantic Conventions for GenAI agent and framework spans » — OTel SemConv 1.40.0 — avril 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/** — Standard normatif primaire pour l'instrumentation. Statut *Development* (instable, opt-in expérimental) confirmé à mai 2026.

3. **N-iX — « AI agent observability: The new standard for enterprise AI in 2026 » — 2026 — https://www.n-ix.com/ai-agent-observability/** — Article de référence sur les défis de l'observabilité multi-étapes, données chiffrées sur l'adoption (89 % / 62 % — *à vérifier*).

4. **Braintrust — « What is agent observability? Tracing tool calls, memory, and multi-step reasoning » — 2026 — https://www.braintrust.dev/articles/agent-observability-tracing-tool-calls-memory** — Définition opérationnelle précise des tool spans et memory traces ; cas d'usage CI/CD gate avec significance statistique.

5. **Microsoft TechCommunity — « From Zero to Hero: AgentOps — End-to-End Lifecycle Management » — Azure AI Foundry Blog — 2026 — https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/from-zero-to-hero-agentops---end-to-end-lifecycle-management-for-production-ai-a/4484922** — Seul hyperscaleur avec cycle de vie AgentOps documenté publiquement à ce niveau de détail ; one-click lifecycle management.

6. **AWS — « Introducing Amazon Bedrock AgentCore » — AWS News Blog — 2025 — https://aws.amazon.com/blogs/aws/introducing-amazon-bedrock-agentcore-securely-deploy-and-operate-ai-agents-at-any-scale/** — Implémentation AWS de l'observabilité et du cycle de vie agents en production ; GA octobre 2025.

7. **earezki.com — « AI Agent Observability: Lessons from the Replit Production Data Loss Incident » — 18 mars 2026 — https://earezki.com/ai-news/2026-03-18-the-ai-agent-that-defied-a-code-freeze-deleted-1200-customer-records-and-then-lied-about-it/** — Analyse post-mortem du cas Replit juillet 2025 (Fortune confirme les faits). Cas de production le plus documenté publiquement sur les conséquences d'observabilité absente.

8. **sakurasky.com — « Trustworthy AI Agents: Deterministic Replay » — 2025-2026 — https://www.sakurasky.com/blog/missing-primitives-for-trustworthy-ai-part-8/** — Seule source articulant les trois techniques (régression continue, replay, shadow runs) avec définitions opérationnelles précises.

9. **Anthropic Engineering — « Demystifying evals for AI agents » — 2025-2026 — https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents** — Source primaire Anthropic sur l'évaluation en production : feedback loop production → dataset de test ; distinction pass@k vs pass^k (déjà introduite Ch. 4, réutilisée ici dans le contexte opérationnel).

10. **DigitalApplied — « Agent Observability: LangSmith, Langfuse, Arize 2026 » — 2026 — https://www.digitalapplied.com/blog/agent-observability-platforms-langsmith-langfuse-arize-2026** — Tableau comparatif le plus récent des six plateformes anchor ; rachat Langfuse par ClickHouse jan. 2026 documenté.

11. **Halacli.com — « From MLOps to AgentOps: The Next Evolution in AI Operations » — 15 février 2026 — https://www.halacli.com/19_2026-02-15-mlops-to-agentops** — Formalisation du plan de contrôle central (permission boundaries, rate limits, budgets, kill switches) comme composante distincte de l'observabilité.
