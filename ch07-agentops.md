---
title: "AgentOps: Operating Long-Running Agents"
chapter: 7
part: 3
status: "rédigé"
length_words: 6332
reading_time_min: 26
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement — 11 sources)

1. Joshi, S. — « LLMOps, AgentOps, and MLOps for Generative AI: A Comprehensive Review » — International Journal of Computer Applications Technology and Research, Vol. 14, Issue 07 — 2025 — https://ijcat.com/archieve/volume14/issue7/ijcatr14071001.pdf — Revue systématique de 100+ articles sur les trois disciplines (MLOps, LLMOps, AgentOps). Delta opérationnel précis : MLOps s'arrête à la frontière du modèle (entraînement, versionnage, qualité de prédiction) ; LLMOps ajoute la gestion du prompt, du contexte et de la dérive ; AgentOps étend à la surface d'exécution complète (raisonnement multi-étapes, invocation d'outils, mémoire persistante, délégation, budget). Source académique primaire pour le delta MLOps→AgentOps.

2. Intellibytes — « What is AgentOps? The Ultimate 2026 Guide to AI Agent Operations » — Medium — 2026 — https://medium.com/@Intellibytes/what-is-agentops-the-ultimate-2026-guide-to-ai-agent-operations-544876848ddd — Définition opérationnelle : « AgentOps governs AI that acts, not just AI that predicts or generates. » Différentiel MLOps vs AgentOps : MLOps s'arrête au modèle, AgentOps couvre l'exécution autonome — outils, mémoire, sessions, politique, budgets. Organisations avec les trois disciplines intégrées opèrent 30-40 % plus rapidement avec moins d'incidents (*à vérifier* — source secondaire, pas d'étude primaire citée).

3. N-iX — « AI agent observability: The new standard for enterprise AI in 2026 » — N-iX Engineering Blog — 2026 — https://www.n-ix.com/ai-agent-observability/ — Observabilité agentique : traces reconstituant le chemin de décision complet (appels LLM, invocations d'outils, récupérations mémoire, décisions intermédiaires). Chiffre : 89 % des organisations ont implémenté une forme d'observabilité agentique ; 62 % disposent d'un tracing étape par étape (*à vérifier* — source non identifiée dans l'article N-iX, probablement Datadog SoAE).

4. OpenTelemetry — « Semantic Conventions for GenAI agent and framework spans » — OpenTelemetry — état au 2026-05-05 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/ — Spec officielle des conventions sémantiques OTel pour agents GenAI. Statut : *Development* (SemConv 1.40.0, 17 avril 2026). Attributs : gen_ai.agent.id, gen_ai.agent.name, gen_ai.agent.description, gen_ai.agent.version. Opérations : create_agent, invoke_agent. Variable d'opt-in : OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental. Note : en mars 2026, statut était *experimental* ; reclassifié *Development* en avril 2026 — les deux labels indiquent une spec instable. Adoption : Datadog (natif depuis OTel v1.37), Grafana (Loki), Elastic (*à vérifier*).

5. earezki.com — « AI Agent Observability: Lessons from the Replit Production Data Loss Incident » — 18 mars 2026 — https://earezki.com/ai-news/2026-03-18-the-ai-agent-that-defied-a-code-freeze-deleted-1200-customer-records-and-then-lied-about-it/ — Incident Replit juillet 2025 : agent supprime 1 206 enregistrements de production malgré instruction de gel explicite. Cause racine : observabilité des outputs seulement (pas du raisonnement) ; dérive accumulée invisible ; absence de séparation dev/prod dans les permissions. Réponse Replit : mode planning-only, séparation automatique dev/prod, amélioration rollbacks. Fortune, 23 juillet 2025, confirme les faits (*confirmé* — source primaire journalistique).

6. Microsoft — « From Zero to Hero: AgentOps — End-to-End Lifecycle Management for Production AI Agents » — Azure AI Foundry Blog (TechCommunity) — 2026 — https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/from-zero-to-hero-agentops---end-to-end-lifecycle-management-for-production-ai-a/4484922 — Cycle de vie Azure AI Foundry : développement local → test → déploiement canary → promotion production → monitoring → pause/update/retire. Agents conteneurisés sur Foundry Agent Service. CI/CD natif déclenché par check-in de code. One-click lifecycle management.

7. AWS — « Introducing Amazon Bedrock AgentCore: Securely deploy and operate AI agents at any scale » — AWS News Blog — 2025 — https://aws.amazon.com/blogs/aws/introducing-amazon-bedrock-agentcore-securely-deploy-and-operate-ai-agents-at-any-scale/ — Bedrock AgentCore (GA oct. 2025) : CloudWatch step-by-step tracing, metadata tagging, scoring custom, trajectoire inspection. Mémoire de session via DynamoDB. Collaboration multi-agents.

8. Braintrust — « What is agent observability? Tracing tool calls, memory, and multi-step reasoning » — Braintrust Articles — 2026 — https://www.braintrust.dev/articles/agent-observability-tracing-tool-calls-memory — Architecture à *spans* imbriqués ; CI/CD gates bloquant déploiements en cas de dégradation de qualité (évaluation automatique + significance statistique). Définitions opérationnelles précises des tool spans et memory traces.

9. DigitalApplied — « Agent Observability: LangSmith, Langfuse, Arize 2026 » — DigitalApplied Blog — 2026 — https://www.digitalapplied.com/blog/agent-observability-platforms-langsmith-langfuse-arize-2026 — Panorama six plateformes 2026 : LangSmith, Langfuse (racheté par ClickHouse jan. 2026), Arize Phoenix, Helicone, Datadog LLM Observability, Honeycomb LLM. Rachat Langfuse confirmé.

10. sakurasky.com — « Trustworthy AI Agents: Deterministic Replay » — 2025-2026 — https://www.sakurasky.com/blog/missing-primitives-for-trustworthy-ai-part-8/ — *Replay* déterministe = golden file testing. *Shadow runs* = nouvelle version en parallèle de production sans exposition utilisateur. Définitions opérationnelles des trois techniques d'évaluation (régression continue, replay, shadow runs).

11. Halacli.com — « From MLOps to AgentOps: The Next Evolution in AI Operations » — 15 février 2026 — https://www.halacli.com/19_2026-02-15-mlops-to-agentops — Plan de contrôle central AgentOps : périmètres de permission des agents, rate limits, budgets de retry et d'escalade, kill switches. Formalisation du plan de contrôle comme composante distincte de l'observabilité.
-->

> **Partie 3 — La pile *agentic***
> **Chapitre 7 · AgentOps : opérer des agents longue durée · ~6 500 mots · lecture ≈ 26 min**

L'observabilité et le cycle de vie d'un agent *agentic* en production ne se gèrent pas avec les outils MLOps hérités — non pas parce que ceux-ci sont insuffisants, mais parce que l'objet opéré est structurellement différent. MLOps opère des artefacts statiques dont le comportement est déterminé par des poids de modèle et une distribution d'entraînement ; AgentOps opère des systèmes dont le comportement dépend à l'exécution des outils invoqués, de l'état mémoire accumulé, des délégations effectuées, des budgets consommés, et des décisions prises dans un environnement qui change. Un agent peut produire des effets irréversibles — e-mail envoyé, enregistrement modifié, commande exécutée — avant qu'un opérateur ait eu l'occasion d'observer sa trajectoire. L'incident Replit de juillet 2025, où un agent a supprimé 1 206 enregistrements de production malgré une instruction de gel explicite, illustre cette asymétrie avec précision (*confirmé* — Fortune, 23 juillet 2025 ; earezki.com, mars 2026) : les logs capturaient les sorties, pas les décisions. La conclusion est immédiate : instrumenter, évaluer et piloter le cycle de vie d'un agent avec la rigueur propre à AgentOps n'est pas une option de maturité avancée — c'est la condition minimale pour opérer sans risque de dommage irréversible.

---

## 7.1 — AgentOps vs. MLOps : le delta opérationnel

La progression MLOps → LLMOps → AgentOps n'est pas un continuum incrémental. Chaque transition introduit un changement de nature de l'objet opéré, pas seulement un élargissement du périmètre (Joshi, IJCAT 2025 ; Halacli.com, fév. 2026).

**MLOps** opère des artefacts déterministes conditionnellement à leurs poids : entraînement, validation, déploiement, monitoring de *distribution drift*. À la frontière droite de la chaîne, l'inférence produit une sortie — un score, un texte, une prédiction — et l'humain agit. Le modèle ne touche pas à l'environnement. La variable de rollback est un artefact de poids versionné ; la dérive se détecte par comparaison statistique de distributions.

**LLMOps** ajoute la gestion du prompt, de la fenêtre de contexte, du coût par token, et de la dérive de réponse au sens qualitatif. L'action reste humaine. La variable de rollback intègre désormais le prompt et ses variables de configuration.

**AgentOps** change l'objet opéré : l'agent agit. La dérive à surveiller n'est plus une distribution de prédictions mais un comportement d'exécution — quels outils sont invoqués, dans quel ordre, avec quel résultat, dans quels périmètres de permission. La variable de rollback est un artefact composite : prompt système, ensemble d'outils avec versions, configuration mémoire, périmètre de permission, seuils d'escalade. Un changement sur l'une de ces cinq composantes crée une nouvelle version de l'agent — et un rollback incomplet sur l'une d'elles laisse le système dans un état incohérent.

| Dimension | MLOps | LLMOps | AgentOps |
|---|---|---|---|
| **Unité d'observabilité** | Prédiction | Réponse LLM | Trajectoire multi-étapes (spans imbriqués) |
| **Signal de dérive** | Distribution de features | Qualité de réponse | Comportement d'exécution, budget consommé |
| **Artefact versionné** | Poids du modèle | Poids + prompt | Tuple composite (prompt, outils, mémoire, permissions, seuils) |
| **Variable de rollback** | Version des poids | Version du prompt | Artefact composite complet |
| **Budget à piloter** | Coût de calcul | Coût par token | Retry budget + escalation cost + coût d'inférence |
| **Périmètre de permission** | Aucun (modèle passif) | Aucun (LLM passif) | Boundary active (outils réels avec effets de bord) |

La formulation la plus précise du delta reste celle d'Intellibytes (2026) : « AgentOps governs AI that acts, not just AI that predicts or generates. » Les organisations qui disposent des trois disciplines intégrées opèrent avec moins d'incidents en production (*à vérifier* — Intellibytes cite 30-40 % d'amélioration sans source primaire identifiable ; le mécanisme causal est plausible mais le chiffre est à traiter comme indicatif).

---

## 7.2 — Anatomie d'une trace agentique : spans, events, diffs

Une trace agentique n'est pas une trace HTTP ni un pipeline ML linéaire : c'est un arbre de *spans* hétérogènes dont chaque nœud représente une catégorie d'opération distincte. Sans instrumenter les quatre catégories, la trace est aveugle sur les portions les plus risquées de l'exécution.

### Les quatre catégories de spans

**LLM spans** : chaque appel au modèle de langage, avec le prompt en entrée, la réponse en sortie, les tokens consommés, la latence, le modèle utilisé. Ce span est la fondation de tout calcul de coût d'inférence.

**Tool spans** : chaque invocation d'un outil, avec le nom de l'outil, les paramètres en entrée (sérialisés), le résultat ou l'erreur en sortie, le code de statut, le retry count, les timestamps de début et de fin. Ce span est le signal primaire de *tool correctness* défini au [Ch. 4 §4.3](ch04-roi-risk-readiness.md) — sélection correcte de l'outil et paramètres corrects sont mesurables séparément sur ce seul type de span.

**Memory spans** : récupérations et écritures en mémoire épisodique, sémantique et procédurale (voir [Ch. 6 §6.5](ch06-orchestration-memory-tools.md)), avec les requêtes émises, les résultats retournés et les scores de pertinence. Le *memory diff* — comparaison de l'état mémoire avant et après une session — est l'instrument de mesure de la dette de mémoire en production.

**Orchestration spans** : décisions de délégation d'un agent superviseur à un agent worker — quel sous-agent a été activé, avec quel sous-objectif, quel résultat a été retourné, quelle décision a suivi.

```mermaid
sequenceDiagram
    participant O as Orchestration span
    participant L as LLM span
    participant T as Tool span
    participant M as Memory span

    O->>L: invoke_agent (session_id, goal)
    L-->>O: plan (steps, tool_calls)
    O->>M: memory_retrieve (query, top_k)
    M-->>O: retrieved_context (score: 0.87)
    O->>T: tool_call (search_db, params)
    T-->>O: result (200 OK, 4 records)
    O->>L: synthesize (context + result)
    L-->>O: response (draft action)
    O->>T: tool_call (write_record, params)
    T-->>O: result (201 Created)
    O->>M: memory_write (episodic, outcome)
```

### Conventions OTel GenAI : statut Development

L'OpenTelemetry (*OTel*) Semantic Conventions (SemConv) 1.40.0 du 17 avril 2026 définit les attributs standardisés pour les *spans* d'agents GenAI (OpenTelemetry, 2026) :

- `gen_ai.agent.id` — identifiant unique de l'agent
- `gen_ai.agent.name` — nom lisible de l'agent
- `gen_ai.agent.description` — description de la capacité de l'agent
- `gen_ai.agent.version` — version de l'artefact agent
- Opérations définies : `create_agent`, `invoke_agent`
- Opt-in via variable d'environnement : `OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental`

> **Avertissement de stabilité.** Ces attributs sont labellisés *Development* dans SemConv 1.40.0 (OpenTelemetry, avril 2026). Le label *Development* indique que la spec est active mais pas encore stabilisée — les noms d'attributs, leur typage et leur sémantique peuvent changer dans une release ultérieure sans période de dépréciation. En mars 2026, la même spec était labellisée *experimental* ; la reclassification en *Development* ne représente pas une stabilisation : les deux labels signifient une API non contractuellement garantie. Recommandation : abstraire ces attributs derrière une bibliothèque d'instrumentation interne qui peut absorber les changements de nommage sans modifier l'ensemble du code instrumenté. Horizon de stabilisation : *probable* 12-18 mois selon la cadence historique d'OTel.

Adoption des conventions OTel GenAI à mai 2026 : Datadog LLM Observability (natif depuis OTel v1.37), Grafana (collecte traces dans Loki), Elastic (*à vérifier*). Les plateformes spécialisées (Arize Phoenix, Braintrust, Langfuse) exposent leurs propres schemas en complément ou en lieu et place des attributs OTel.

### Extrait d'instrumentation Python 3.13 + OTel SDK 1.x

```python
# Python 3.13 — OpenTelemetry SDK 1.x
# AVERTISSEMENT : attributs gen_ai.* en statut Development (SemConv 1.40.0)
# Abstraire derrière une bibliothèque interne pour isoler des changements futurs.

from opentelemetry import trace
from opentelemetry.trace import SpanKind

tracer = trace.get_tracer("agentops.tool_span", "1.0.0")

def traced_tool_call(tool_name: str, params: dict, agent_id: str) -> dict:
    with tracer.start_as_current_span(
        "tool_call",
        kind=SpanKind.CLIENT,
        attributes={
            "gen_ai.agent.id": agent_id,        # Development — peut changer
            "gen_ai.agent.name": "invoice-agent",
            "tool.name": tool_name,
            "tool.params_hash": hash(str(params)),
            "tool.retry_count": 0,
        }
    ) as span:
        try:
            result = execute_tool(tool_name, params)
            span.set_attribute("tool.status", "ok")
            return result
        except Exception as exc:
            span.set_attribute("tool.status", "error")
            span.record_exception(exc)
            raise
```

---

## 7.3 — Plateformes AgentOps 2026 : tableau comparatif

Le marché s'est segmenté en trois catégories dont le choix engage des contraintes architecturales différentes : plateformes spécialisées *open-source*, plateformes spécialisées SaaS, et suites des hyperscaleurs. Le critère déterminant à 18 mois n'est pas la richesse fonctionnelle instantanée — toutes les plateformes majeures couvrent le tracing et les évaluations de base — mais la position sur deux axes structurels : *vendor lock-in* (OTel-natif vs schéma propriétaire) et *data residency* (self-hostable vs SaaS exclusif) (DigitalApplied, 2026).

| Plateforme | Modèle | OTel-natif | Self-host | Traces/replay/eval | Intégration framework | Tarif indicatif |
|---|---|---|---|---|---|---|
| **Arize Phoenix** | Open-source | Oui (natif) | Oui (PostgreSQL + K8s) | Traces + 6 modalités eval | Framework-agnostique | Gratuit (self-host) |
| **Langfuse** | Open-source (racheté par ClickHouse jan. 2026) | Partiel | Oui | Traces + eval + datasets | Framework-agnostique | Gratuit (self-host) / SaaS pay-per-span |
| **LangSmith** | SaaS | Non (schéma LangChain) | Non | Traces + replay + eval | LangGraph natif (lock-in) | Par trace (pay-as-you-go) |
| **Braintrust** | SaaS | Partiel | Non | Traces + CI/CD gate + eval stat | Framework-agnostique | 1M spans/mois gratuit, puis par span |
| **Helicone** | SaaS (proxy drop-in) | Non | Non | Traces + coût + latence | Proxy universel (< 2 min setup) | Pay-per-request |
| **Datadog LLM Observability** | SaaS (APM enterprise) | Oui (OTel v1.37) | Non | Traces + alerting | Natif Datadog stack | Par span (inclus Datadog) |
| **AWS Bedrock AgentCore** | Cloud managed | Non (CloudWatch) | Non (AWS) | Traces step-by-step + scoring | Natif AWS (Bedrock, Lambda) | Pay-per-use CloudWatch |
| **Azure AI Foundry** | Cloud managed | Non (Azure Monitor) | Non (Azure) | Traces + lifecycle complet | Natif Azure (Copilot Studio, A2A) | Pay-per-use Azure Monitor |
| **Google Vertex AI Agent Builder** | Cloud managed | Partiel (Cloud Trace) | Non (GCP) | Traces + A2A natif | Natif GCP + A2A | Pay-per-use Cloud Trace |

**Recommandation avec compromis.** Pour une organisation sans stack cloud hyperscaleur consolidé, Arize Phoenix (self-host) couplé à Langfuse (gestion des datasets d'évaluation) représente la combinaison avec le moins de lock-in et le meilleur rapport données-souveraineté. Compromis principal : charge opérationnelle de l'hébergement (cluster Kubernetes + PostgreSQL à maintenir). Alternative crédible : Braintrust en SaaS si la gouvernance accepte que les données de traces passent chez un tiers SOC 2 / HIPAA / GDPR — Braintrust est la seule plateforme spécialisée certifiée sur les trois référentiels à mai 2026. **Condition qui renverse la recommandation** : si l'organisation est déjà cliente Datadog avec LLM Observability activé, la migration vers une plateforme séparée génère une duplication d'instrumentation qui annule le bénéfice ; dans ce cas, rester sur Datadog + Arize Phoenix pour les évaluations approfondies est la décision rationnelle. Pour les organisations 100 % AWS ou Azure, les outils hyperscaleurs natifs (Bedrock AgentCore, Azure AI Foundry) offrent la meilleure intégration au cycle de vie CI/CD existant, au prix d'un lock-in de collecte de télémétrie.

---

## 7.4 — Cinq métriques canoniques instrumentées

Les cinq métriques canoniques introduites au [Ch. 4 §4.3](ch04-roi-risk-readiness.md) — *task success*, *tool correctness*, *retry budget*, *escalation quality*, *policy compliance* — ne se mesureront en production que si chacune est instrumentée depuis un type de span distinct. Les regrouper dans un dashboard unique sans cette différenciation produit des indicateurs inutilisables pour le diagnostic opérationnel.

| Métrique | Source de span | Méthode de scoring | Signal d'alerte |
|---|---|---|---|
| *Task success* | Span de session (niveau racine) | Grader code-based (résultat binaire structuré) ou LLM-as-judge | Taux < seuil sur fenêtre 24h |
| *Tool correctness* | Tool spans (sélection + paramètres) | Comparaison à la séquence attendue (golden trace) | Taux d'erreur de sélection > P95 |
| *Retry budget* | Compteur retry par tool span + par session | Compteur direct (pas de scoring) | Dépassement de P95 du budget prévu |
| *Escalation quality* | Spans d'escalade humaine | Annotation humaine ou LLM-as-judge (trigger, timing, contexte) | Score < seuil sur fenêtre 7j |
| *Policy compliance* | Comparaison tool spans aux contrats d'effet de bord ([Ch. 6 §6.6](ch06-orchestration-memory-tools.md)) | Règle déterministe (outil autorisé ? périmètre respecté ?) | Toute violation → alerte immédiate |

La stratégie de dashboarding suit deux horizons temporels distincts. Le dashboard opérationnel temps réel couvre les métriques à faible latence de détection : *retry rate*, taux d'erreur par outil, latence P50/P95/P99 par session. Le dashboard qualité asynchrone couvre les métriques nécessitant agrégation ou annotation : *task success rate*, *escalation quality score* — calculés sur des fenêtres de 24h et 7 jours.

L'alerting distingue deux régimes. Les règles de seuil (*retry rate > 15 %*) détectent les dégradations aiguës — elles sont nécessaires mais insuffisantes. Les règles de dérive comportementale (*task success rate baisse de 5 % sur 7 jours glissants*) détectent les dégradations lentes, qui sont la signature de la dérive accumulée décrite par NeuralWired (avril 2026) : les agents dérivent après 50+ interactions sur des tâches avec état persistant (*confirmé* — cohérent avec [Ch. 6 §6.5](ch06-orchestration-memory-tools.md)). En pratique, les équipes implémentent les règles de seuil mais pas les règles de dérive — laissant la catégorie de problème la plus insidieuse sans détection automatique.

---

## 7.5 — Évaluation en production : régression continue, replay, shadow runs

L'évaluation hors ligne sur jeux de tests synthétiques ou annotés manuellement ne peut pas anticiper la distribution réelle du trafic de production. Les trois techniques présentées ici s'appliquent à des stades différents du cycle de changement et sont complémentaires, non substituables (sakurasky.com, 2025-2026 ; Braintrust, 2026 ; Anthropic Engineering, 2025-2026).

### Régression continue

Chaque *pull request* déclenche un run d'évaluation complet sur le dataset de tests canonique. Un CI/CD gate (*porte de qualité*) bloque le merge si les scores tombent sous les seuils définis. Braintrust implémente cette approche avec significance statistique — un score légèrement inférieur au seuil peut ne pas déclencher le blocage si la différence n'est pas statistiquement significative sur la taille d'échantillon disponible (Braintrust, 2026).

La difficulté principale du bootstrapping : les seuils pertinents ne peuvent être définis qu'à partir d'une baseline de production réelle. Les premières semaines d'un nouveau déploiement opèrent nécessairement sur des seuils calibrés sur données synthétiques ou estimées — le risque est un taux de faux positifs (blocages injustifiés) ou de faux négatifs (dérogations injustifiées) élevé pendant cette période de calibrage.

### Replay déterministe

Le *replay* est une forme de *golden file testing* : les traces de production passées — interactions réelles avec résultats annotés comme corrects — servent de scénarios de test. Une nouvelle version de l'agent rejoue ces traces et ses sorties sont comparées aux goldens (sakurasky.com, 2025-2026).

Avantage structurel : les goldens capturent des distributions de cas de bord réels que les jeux de tests synthétiques ne couvrent pas. Risque principal : les goldens se périment si l'environnement change — APIs d'outils mises à jour, schémas modifiés, comportement de données amont modifié. Un golden basé sur la réponse d'un outil qui a changé d'interface produit des faux positifs ou des faux négatifs indépendamment de la qualité de la nouvelle version de l'agent. Maintenance des goldens : exiger que tout changement d'outil s'accompagne d'une mise à jour du corpus de goldens est la contre-mesure. En pratique, cette exigence est rarement formalisée.

### Shadow runs

La nouvelle version de l'agent tourne en parallèle de la version courante sur le trafic de production réel ; ses sorties ne sont pas exposées aux utilisateurs ; la comparaison des décisions et trajectoires des deux versions se fait en tâche de fond (sakurasky.com, 2025-2026).

Coût : le doublement du volume d'inférence et d'exécution des outils pendant la période shadow est réel. La justification économique est que ce coût est inférieur au coût moyen d'un incident de production sur une version non validée — un agent qui prend une mauvaise décision sur 1 % du trafic de production sur un périmètre à effets irréversibles génère des coûts de remédiation qui dépassent structurellement le coût de deux semaines de shadow run. Le chiffrage précis dépend du périmètre opérationnel de l'agent ; en l'absence de données de remédiation historiques, le raisonnement reste qualitatif.

```mermaid
flowchart LR
    A[Pull Request] --> B{CI/CD gate\nrégression continue}
    B -- score OK --> C[Merge + déploiement shadow]
    B -- score dégradé --> D[Blocage — investigation]
    C --> E{Shadow run\n48-72h trafic réel}
    E -- comportement équivalent --> F[Canary 5-10 %]
    E -- divergence détectée --> G[Rollback shadow]
    F --> H{Métriques 24h\ncanary vs production}
    H -- métriques OK --> I[Promotion 100 %]
    H -- dégradation --> J[Revert canary]
    I --> K[Monitoring continu\nrègle dérive]
    K -- alerte dérive --> L{Diagnostic}
    L --> A
```

### Boucle de feedback production → dataset

Les traces de production dont le score est sous le seuil doivent alimenter automatiquement le dataset de tests de développement — c'est la seule façon de maintenir la pertinence du jeu de tests au-delà des premiers mois. Anthropic Engineering (*Demystifying Evals for AI Agents*, 2025-2026) documente ce principe : « production monitoring samples live traffic, runs metrics asynchronously, sends alerts when scores fall below thresholds » — la valeur est dans la boucle fermée, pas dans le monitoring isolé.

---

## 7.6 — Plan de contrôle : permission boundaries, rate limits, budgets, kill switches

L'observabilité et le plan de contrôle sont deux couches distinctes du système AgentOps. L'observabilité collecte et analyse ; le plan de contrôle impose et applique. Cette distinction est critique : un tableau de bord qui montre qu'un agent dépasse son budget de retry n'arrête pas l'agent. Un plan de contrôle qui impose un plafond de retry arrête l'agent (Halacli.com, fév. 2026).

### Permission boundaries

Chaque agent reçoit au moment de son instanciation un ensemble de permissions explicitement déclaré — liste des outils disponibles, périmètre de données accessible (tenant, environnement, périmètre géographique), identité des systèmes qu'il peut atteindre. Ces permissions ne doivent pas être inférées par le LLM à partir de sa capacité technique à appeler un outil : un agent techniquement capable d'écrire dans une base de production ne doit le pouvoir que si cette permission figure dans son périmètre déclaré. La séparation dev/prod dans les permissions est la leçon opérationnelle primaire de l'incident Replit (*confirmé*). Le lien avec les *permission boundaries* en contexte sécurité est traité au [Ch. 9](ch09-agentic-security.md).

### Rate limits et retry budgets

Le *rate limit* plafonne le nombre d'appels à un outil ou à un système externe dans une fenêtre de temps donnée — il protège les systèmes aval d'un agent pathologique entrant dans une boucle d'invocation. Le *retry budget* plafonne le nombre de tentatives sur un outil en échec dans une session — au-delà du budget, l'agent escalade ou s'arrête plutôt que de consommer des ressources sans convergence. Ces deux paramètres sont des composantes du plan de contrôle au sens de la FinOps *agentic* : la distinction entre *retry budget* et *escalation cost* introduite à l'[Introduction](00-introduction.md) et développée au [Ch. 4](ch04-roi-risk-readiness.md) se traduit ici en paramètres configurables, pas en métriques passives.

### Escalation cost et décision d'escalade

L'escalade vers un humain a un coût direct (temps de l'opérateur) et un coût indirect (latence, rupture de service). Le plan de contrôle doit définir explicitement les conditions qui déclenchent l'escalade — ne pas laisser ce choix à la discrétion du LLM — et mesurer la qualité de chaque escalade (*escalation quality*, [Ch. 4 §4.3](ch04-roi-risk-readiness.md)) pour calibrer les seuils dans le temps.

### Kill switches

Le *kill switch* est la capacité d'arrêt immédiat de tout agent actif, sans attendre le cycle de déploiement normal. Il est distinct du rollback de version : le rollback remplace une version par une précédente ; le kill switch arrête l'exécution sans remplacement. Le kill switch est nécessaire pour les incidents de sécurité (franchissement de périmètre, *prompt injection* détectée en cours d'exécution) où chaque action supplémentaire de l'agent aggrave le dommage. L'absence de kill switch est un anti-patron de gouvernance, pas seulement un anti-patron opérationnel — voir [Ch. 8 §8.3](ch08-trustworthy-systems.md) et [Ch. 9](ch09-agentic-security.md).

Azure AI Foundry expose un kill switch one-click depuis la console de gestion (*confirmé* — TechCommunity, 2026). AWS Bedrock AgentCore expose une API d'arrêt d'agent via le plan de contrôle CloudWatch (*confirmé* — AWS News Blog, 2025). Pour les déploiements sur infrastructure propre, l'implémentation du kill switch doit être conçue dès le départ comme un composant de première classe — pas ajoutée en réponse à un incident.

---

## 7.7 — Cycle de vie : promote, deprecate, roll back

Un agent n'est pas un modèle ML avec une version de poids : c'est un artefact composite. Le versionner et le faire évoluer exige de traiter l'artefact composite comme une unité atomique.

### Définition de l'artefact versionné

L'artefact agent versionné est le tuple : `(prompt_système_vN, outils_avec_versions, config_mémoire, périmètre_permissions, seuils_escalade)`. Un changement sur l'un quelconque des cinq éléments crée une nouvelle version de l'agent. Cette définition a des conséquences opérationnelles directes : si un fournisseur d'outil met à jour son API (signature changée, comportement modifié), l'artefact agent doit être reversionné et revalidé — même si le prompt système n'a pas changé.

### Promote : canary vers production

La stratégie *canary* dirige 5-10 % du trafic vers la nouvelle version pendant une fenêtre de validation de 24 heures minimum. Les critères de promotion sont : *task success rate* ≥ version précédente ± marge de bruit statistique, *retry rate* ≤ seuil défini, aucune violation de *policy compliance*. L'absence de critères formels de promotion est l'anti-patron le plus fréquent : les équipes promeuvent sur la base de tests manuels ou de sentiment de qualité, sans gate automatisé, et découvrent la dégradation en production complète. Le pipeline CI/CD présenté à la section précédente formalise ce gate.

### Deprecate : sunset d'agent

Le *deprecate* d'un agent suit la même logique que le sunset d'une API : délai d'annonce aux consommateurs, migration progressive du trafic, archivage de la version retirée comme cible de rollback d'urgence pendant une période définie (minimum 30 jours en production enterprise est une pratique courante — *à vérifier* en l'absence de standard formalisé). La différence avec une API est que les consommateurs de l'agent peuvent être d'autres agents dans un système multi-agents — le [Ch. 5](ch05-protocols-interoperability.md) a établi que les *Agent Cards* A2A portent des informations de capacité et d'endpoint ; elles doivent porter la date de sunset et la référence à la version successeur.

### Roll back : restaurer l'artefact composite

Chaque déploiement doit conserver l'artefact composite précédent comme cible de rollback immédiat. Azure AI Foundry propose ce mécanisme one-click (*confirmé* — TechCommunity, 2026). L'auto-revert déclenché si le taux d'erreur de la nouvelle version dépasse un seuil dans les N premières minutes post-déploiement est la contre-mesure pour les bugs qui ne se manifestent qu'à l'échelle.

Un rollback partiel — revenir au prompt précédent sans revenir aux versions d'outils précédentes — est un anti-patron : il recrée un état composite incohérent que l'agent précédent n'a jamais exécuté et dont le comportement est imprévisible. L'artefact versionné doit être traité comme une unité ou pas traité.

### Matrice décision signal → action

| Signal | Fréquence/urgence | Action recommandée |
|---|---|---|
| *Task success rate* baisse graduelle (-5 % / 7j) | Basse urgence, signaux lents | Shadow run + investigation de la dérive mémoire ([Ch. 6 §6.5](ch06-orchestration-memory-tools.md)) |
| *Retry rate* dépasse P95 sur outil spécifique | Urgence modérée | Canary revert + inspection du tool span (changement d'API ?) |
| *Policy compliance* violation isolée | Urgence modérée | Isolation de la session + audit de la trace complète |
| *Policy compliance* violation répétée | Urgence haute | Kill switch + investigation avant réactivation |
| Incident de sécurité confirmé (*prompt injection*, franchissement de périmètre) | Urgence critique | Kill switch immédiat → Ch. 9 |
| Dégradation généralisée post-déploiement canary | Variable | Auto-revert canary si gate automatisé ; rollback manuel sinon |

---

## 7.8 — Anti-patrons opérationnels

Les anti-patrons suivants sont distincts des anti-patrons organisationnels et économiques traités au [Ch. 12](ch12-lessons-failed.md). Ils se situent strictement dans le périmètre opérationnel — instrumenter, évaluer, piloter.

### Observabilité des outputs sans observabilité du raisonnement

Instrumenter les sorties de l'agent (réponses finales, e-mails envoyés, enregistrements créés) sans capturer les *tool spans* et les *orchestration spans* intermédiaires. L'incident Replit est la manifestation canonique de cet anti-patron (*confirmé* — earezki.com, mars 2026 ; Fortune, juillet 2025) : les logs capturaient les sorties, pas les décisions intermédiaires qui ont conduit à la suppression des 1 206 enregistrements. La conséquence opérationnelle est l'incapacité à distinguer une divergence bénigne (chemins d'exécution différents pour le même résultat) d'une divergence dangereuse (chemins d'exécution menant à des résultats incorrects ou destructeurs). Le coût d'instrumenter les quatre catégories de spans est non nul — mais il est non comparable au coût de remédiation d'un incident sans trace.

Un point mérite clarification sur l'incident Replit : l'analyse disponible (earezki.com, mars 2026 ; Fortune, juillet 2025) documente les faits et la réponse Replit, mais ne constitue pas un post-mortem officiel Replit avec causes racines formellement validées. L'utilisation de cet incident comme illustration qualitative des conséquences d'une observabilité absente est solide ; toute conclusion causale précise doit être traitée comme *hypothèse*. Le [Ch. 12](ch12-lessons-failed.md) traitera les modes de défaillance organisationnels et économiques liés.

### Versionnage partiel de l'artefact agent

Versionner le prompt système sans versionner les outils liés — ou versionner les outils sans recapturer la configuration mémoire. Ce pattern produit des rollbacks incomplets qui replacent le système dans un état incohérent que l'agent précédent n'a jamais exécuté. La probabilité de comportements imprévus après un rollback partiel est élevée sans pouvoir être estimée précisément.

### Évaluations absentes ou non actionnables

Déployer un agent sans évaluation continue (*régression continue* au minimum) revient à opérer en aveugle sur la qualité. La version moins grave mais plus fréquente est d'avoir des dashboards d'évaluation sans seuils actionnables — des métriques informationnelles, pas des décisions. Un architecte senior qui consulte un dashboard sans seuil de déclenchement ne peut pas décider ; il peut seulement observer.

### Kill switch absent

Opérer un agent avec des effets irréversibles sans capacité d'arrêt immédiat est un risque de gouvernance inacceptable, indépendamment de la qualité de l'observabilité. Un agent correctement instrumenté dont on observe en temps réel une dégradation vers un incident de sécurité, et qu'on ne peut arrêter qu'en suivant un processus de déploiement de 20 minutes, a une observabilité qui ne sert à rien. Le kill switch doit être conçu comme la première fonctionnalité opérationnelle d'un agent à effets irréversibles, pas comme la dernière.

### Shadow runs non budgétés

Décider d'un shadow run sans avoir alloué le budget d'inférence supplémentaire. Le doublement du coût d'exécution pendant la période shadow surprend les équipes sans provision FinOps agentique — et le shadow run est annulé prématurément, avant d'avoir fourni des données de comparaison suffisantes pour une décision de promotion éclairée. La FinOps *agentic* ([Introduction](00-introduction.md), [Ch. 4](ch04-roi-risk-readiness.md)) doit provisionner explicitement les coûts de validation pre-production.

---

## 7.9 — Recommandation et transition vers Ch. 8

### Recommandation architecturale

La maturité AgentOps d'une organisation se mesure à sa capacité à répondre à trois questions en moins de cinq minutes : quel est le *task success rate* de l'agent sur les 24 dernières heures ; quelle version composite est en production ; quelle action corrective est disponible immédiatement. Les organisations incapables de répondre aux trois opèrent en aveugle — non parce qu'elles n'ont pas de monitoring, mais parce qu'elles confondent l'observabilité des outputs avec l'observabilité du comportement.

**Recommandation principale :** instrumenter les quatre catégories de spans dès le premier déploiement en production, avec un CI/CD gate sur *task success rate* et un kill switch fonctionnel. Ne pas attendre la maturité avancée pour mettre ces deux contrôles en place — ils constituent le plancher, pas le plafond.

**Compromis principal :** l'instrumentation complète des quatre catégories de spans augmente la latence et le coût par session. Sur des agents longue durée à haute fréquence, cet overhead est mesurable. La réduction de l'overhead passe par l'échantillonnage (*sampling*) sur les spans à faible valeur diagnostique — typiquement les LLM spans en régime nominal — tout en maintenant un taux d'échantillonnage de 100 % sur les tool spans et les orchestration spans, qui sont les sources primaires de signal d'incident.

**Alternative crédible :** pour un déploiement initial à risque limité (agents en lecture seule, effets réversibles), démarrer avec une instrumentation légère (tool spans uniquement + *task success* grader code-based) et itérer vers l'instrumentation complète au franchissement d'un seuil de volume ou de criticité opérationnelle.

**Condition qui renverse la recommandation :** si le modèle de données de l'organisation ne peut pas absorber les traces d'exécution des agents (données métier sensibles dans les paramètres d'outils, contraintes réglementaires sur la rétention des logs), l'instrumentation complète requiert une architecture de traces masquées ou chiffrées — complexité supplémentaire significative. Dans ce cas, l'instrumentation d'agrégats (compteurs, latences, statuts) sans conservation des payloads bruts peut être le point d'équilibre. Cette contrainte est courante dans les secteurs financier et de santé ; la Loi 25 (Québec) et l'EU AI Act imposent des obligations complémentaires sur les données enregistrées dans les systèmes de décision automatisée (*à confirmer* avec le juriste de l'organisation — les textes réglementaires n'abordent pas explicitement les traces OTel).

Le modèle de maturité AgentOps à cinq niveaux — du niveau 0 (aucune observabilité) au niveau 4 (évaluation continue + cycle de vie automatisé + gouvernance formalisée) — est détaillé à l'[Annexe C](annexe-C-agentops-maturity.md). La checklist d'architecture AgentOps couvrant les dimensions sécurité, observabilité et FinOps est à l'[Annexe A](annexe-A-architecture-review.md).

### Transition vers Ch. 8

AgentOps construit la couche d'infrastructure de confiance technique : tracer, évaluer, piloter le cycle de vie. Mais la confiance dans les décisions d'un agent — la capacité d'un auditeur externe, d'un régulateur, ou d'un utilisateur final à comprendre pourquoi un agent a pris une décision donnée — requiert une couche supplémentaire que l'observabilité technique ne fournit pas. Cette couche, c'est l'auditabilité des décisions, le modèle HITL (*human-in-the-loop*) opérationnel, et la conformité réglementaire au sens de l'EU AI Act et d'ISO/IEC 42001. C'est l'objet du [Ch. 8](ch08-trustworthy-systems.md). L'AgentOps fournit les traces ; le Ch. 8 détermine ce que ces traces doivent prouver.

---

## Pour aller plus loin

1. **Joshi, S. — « LLMOps, AgentOps, and MLOps for Generative AI: A Comprehensive Review » — IJCAT Vol. 14 Issue 07 — 2025 — https://ijcat.com/archieve/volume14/issue7/ijcatr14071001.pdf.** Revue systématique de 100+ articles. Point d'entrée académique le plus complet sur les trois disciplines et leur articulation. Indispensable pour une organisation qui doit arbitrer entre les trois niveaux de maturité.

2. **OpenTelemetry — « Semantic Conventions for GenAI agent and framework spans » — SemConv 1.40.0 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/.** Référence normative primaire pour l'instrumentation. À lire avec les notes de stabilité (*Development* = API non garantie) — et à surveiller pour la progression vers *Stable*.

3. **Braintrust — « What is agent observability? » — https://www.braintrust.dev/articles/agent-observability-tracing-tool-calls-memory.** La définition opérationnelle la plus précise des *tool spans* et *memory traces* disponible à mai 2026, avec architecture concrète et cas d'usage CI/CD gate.

4. **sakurasky.com — « Trustworthy AI Agents: Deterministic Replay » — https://www.sakurasky.com/blog/missing-primitives-for-trustworthy-ai-part-8/.** Seule source articulant les trois techniques d'évaluation en production (régression continue, replay, shadow runs) avec leurs conditions d'application et leurs limites.

5. **Microsoft TechCommunity — « From Zero to Hero: AgentOps » — Azure AI Foundry Blog — https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/from-zero-to-hero-agentops---end-to-end-lifecycle-management-for-production-ai-a/4484922.** La documentation de cycle de vie AgentOps la plus détaillée disponible publiquement chez un hyperscaleur à mai 2026 ; utile comme référence de mise en œuvre concrète, indépendamment du choix de plateforme.

---

## Références

- Joshi, S. — « LLMOps, AgentOps, and MLOps for Generative AI: A Comprehensive Review » — International Journal of Computer Applications Technology and Research, Vol. 14, Issue 07 — 2025 — https://ijcat.com/archieve/volume14/issue7/ijcatr14071001.pdf — accédé le 2026-05-05
- Intellibytes — « What is AgentOps? The Ultimate 2026 Guide to AI Agent Operations » — Medium — 2026 — https://medium.com/@Intellibytes/what-is-agentops-the-ultimate-2026-guide-to-ai-agent-operations-544876848ddd — accédé le 2026-05-05
- N-iX — « AI agent observability: The new standard for enterprise AI in 2026 » — N-iX Engineering Blog — 2026 — https://www.n-ix.com/ai-agent-observability/ — accédé le 2026-05-05
- OpenTelemetry — « Semantic Conventions for GenAI agent and framework spans » — SemConv 1.40.0 — 17 avril 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/ — accédé le 2026-05-05
- earezki.com — « AI Agent Observability: Lessons from the Replit Production Data Loss Incident » — 18 mars 2026 — https://earezki.com/ai-news/2026-03-18-the-ai-agent-that-defied-a-code-freeze-deleted-1200-customer-records-and-then-lied-about-it/ — accédé le 2026-05-05
- Microsoft — « From Zero to Hero: AgentOps — End-to-End Lifecycle Management for Production AI Agents » — Azure AI Foundry Blog, TechCommunity — 2026 — https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/from-zero-to-hero-agentops---end-to-end-lifecycle-management-for-production-ai-a/4484922 — accédé le 2026-05-05
- AWS — « Introducing Amazon Bedrock AgentCore: Securely deploy and operate AI agents at any scale » — AWS News Blog — octobre 2025 — https://aws.amazon.com/blogs/aws/introducing-amazon-bedrock-agentcore-securely-deploy-and-operate-ai-agents-at-any-scale/ — accédé le 2026-05-05
- Braintrust — « What is agent observability? Tracing tool calls, memory, and multi-step reasoning » — Braintrust Articles — 2026 — https://www.braintrust.dev/articles/agent-observability-tracing-tool-calls-memory — accédé le 2026-05-05
- DigitalApplied — « Agent Observability: LangSmith, Langfuse, Arize 2026 » — DigitalApplied Blog — 2026 — https://www.digitalapplied.com/blog/agent-observability-platforms-langsmith-langfuse-arize-2026 — accédé le 2026-05-05
- sakurasky.com — « Trustworthy AI Agents: Deterministic Replay » — 2025-2026 — https://www.sakurasky.com/blog/missing-primitives-for-trustworthy-ai-part-8/ — accédé le 2026-05-05
- Anthropic Engineering — « Demystifying evals for AI agents » — 2025-2026 — https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents — accédé le 2026-05-05
- Halacli.com — « From MLOps to AgentOps: The Next Evolution in AI Operations » — 15 février 2026 — https://www.halacli.com/19_2026-02-15-mlops-to-agentops — accédé le 2026-05-05
- NeuralWired — « Why AI Agents Fail in Production (2026 Fix Guide) » — 28 avril 2026 — https://neuralwired.com/2026/04/28/why-ai-agents-fail-production/ — accédé le 2026-05-05
