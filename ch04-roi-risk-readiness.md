---
title: "Evaluating ROI, Risk, and Readiness"
chapter: 4
part: 2
status: "esquisse"
length_target_words: 5500
reading_time_min: 22
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement)

1. Akshathala, S., Adnan, B., Ramesh, M., Vaidhyanathan, K., Muhammed, B., Parthasarathy, K. (SERC IIIT-Hyderabad / MontyCloud Inc.) — « Beyond Task Completion: An Assessment Framework for Evaluating Agentic AI Systems » — arXiv:2512.12791 — décembre 2025 (soumis 14 déc., révisé 16 déc. 2025) — https://arxiv.org/abs/2512.12791 — Cadre à quatre piliers d'évaluation LLM / Memory / Tools / Environment ; intègre modes d'évaluation statique, dynamique et par juge (LLM-as-judge) ; validé sur cas CloudOps autonome ; montre que les métriques de complétion binaires manquent les déviations comportementales liées au non-déterminisme ; **PATERNITÉ CONFIRMÉE** : SERC IIIT-Hyderabad + MontyCloud Inc., pas Microsoft ni Google. Cadre le plus proche du « four-pillar assessment » cité dans TOC.md.

2. Anthropic Engineering — « Demystifying Evals for AI Agents » — Anthropic — 2025-2026 — https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents — Taxonomie Anthropic des evals : grade outcomes, transcripts, tool calls, cost, latency comme dimensions séparées ; distinction pass@k (succès au moins une fois) vs pass^k (succès systématiquement sur k essais) ; recommandation de graders code-based pour validation d'appels d'outils (rapides, reproductibles, bon marché) ; identification de la rigidité du test de séquence d'appels comme faux négatif fréquent. Source primaire Anthropic.

3. iMerit — « Agent Evaluation in Production: Behavior Metrics — Task Success, Tool Use Correctness, and Escalation Quality » — iMerit — 2026 — https://imerit.net/resources/blog/agent-evaluation-in-production-metrics-for-task-success-tool-use-correctness-and-escalation-quality/ — Définitions opérationnelles précises des métriques de comportement en production : task success rate (taux de complétion des objectifs), tool correctness (tool selection accuracy + tool parameter accuracy), escalation quality (triggers, type, timing, context quality), policy compliance (topic adherence). Structuration en 8-12 métriques pour systèmes de production : 3 RAG, 3 agent (success rate, tool-call accuracy, cost-per-success), 3 safety. Apport : vocabulaire canonique adopté dans ce chapitre.

4. Akshathala et al. (arXiv:2604.19818) — « Beyond Task Success: An Evidence-Synthesis Framework for Evaluating, Governing, and Orchestrating Agentic AI » — arXiv — avril 2026 — https://arxiv.org/abs/2604.19818 — Article complémentaire (post-2512.12791) du même groupe ; élargit à la gouvernance et à l'orchestration ; distingue *evidence synthesis* des évaluations ponctuelles. Apport : continuité de la recherche sur l'évaluation holistique, fournit un ancrage académique pour la gouvernance dans ce chapitre.

5. KPMG — « Agentic AI Untangled: Navigating the Build, Buy, or Borrow Decision » — KPMG US — 2026 — https://kpmg.com/us/en/articles/2026/agentic-ai-untangled.html — Cadre décisionnel KPMG : Build (différenciation, contrôle, souveraineté des données) / Buy (vitesse, capacité éprouvée, certitude opérationnelle) / Borrow (flexibilité, co-création, partage du risque) ; 57 % des organisations optent pour une approche hybride (up from 51 % le trimestre précédent) ; succès conditionné à l'alignement sur valeur métier, maturité organisationnelle et fondations de données. Cadre de référence le plus actionnable disponible pour §4.4.

6. MIT CISR — « Update on the Enterprise AI Maturity Model » / « Grow Enterprise AI Maturity for Bottom-Line Impact » — MIT CISR — 2025 — https://cisr.mit.edu/publication/2025_0801_EnterpriseAIMaturityUpdate_WoernerSebastianWeillKaganer — Modèle à quatre stades de maturité IA d'entreprise (MIT CISR 2025 Real-Time Business Survey, N=152) ; progression stade 2→3 (pilotes → façons de travailler à l'échelle) identifiée comme le seuil de performance financière au-dessus de la moyenne du secteur ; dimensions évaluées : processus, technologie, culture organisationnelle. Source académique primaire pour le readiness assessment.

7. Fivetran — « 2026 Agentic AI Readiness Index » — Fivetran / Redpoint Ventures — 5 mai 2026 — https://www.fivetran.com/blog/85-of-enterprises-are-running-agentic-ai-on-a-data-foundation-that-isnt-ready — Enquête de 400 professionnels de la donnée (Redpoint Ventures) ; 85 % des entreprises déploient de l'*agentic AI* sur des fondations de données non prêtes ; 41 % utilisent déjà de l'*agentic AI* en production ; barrières : qualité et lignage des données (42 %), conformité réglementaire et souveraineté (39 %), risque sécurité et vie privée (39 %) ; 86 % des leaders données jugent la portabilité et l'interopérabilité « importantes ou critiques ». Source primaire (publiée le jour même de la rédaction — 2026-05-05).

8. Gartner — « Lack of AI-Ready Data Puts AI Projects at Risk » — Gartner Newsroom — 26 février 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-02-26-lack-of-ai-ready-data-puts-ai-projects-at-risk — 63 % des organisations n'ont pas ou ne savent pas si elles ont les bonnes pratiques de gestion des données pour l'IA ; prédiction : 60 % des projets IA abandonnés d'ici 2026 par manque de données IA-prêtes. Apport : calibration de l'ampleur du risque données dans le *readiness assessment*.

9. Galileo — « Agent Evaluation Framework 2026: Metrics, Rubrics & Benchmarks » — Galileo AI — 2026 — https://galileo.ai/blog/agent-evaluation-framework-metrics-rubrics-benchmarks — Vue d'ensemble du marché des plateformes d'évaluation agentique en 2026 : LangSmith (LangChain-natif, profondes intégrations framework), Braintrust (SOC 2 / GDPR / HIPAA, architecture span imbriquée), Arize Phoenix (OTel-based, six modalités d'éval, autohébergeable), Galileo (détection hallucination, ChainPoll), Langfuse (open-source). Apport : panorama outils pour §4.2.

10. OpenTelemetry — « Semantic Conventions for Generative AI Agent Spans » — OpenTelemetry — 2025-2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/ — Conventions sémantiques OTel pour les spans d'agents GenAI : statut *experimental* à mars 2026 (API non encore stabilisée) ; adoption précoce par Datadog (support natif OTel v1.37), Grafana, Elastic. Apport : standard d'instrumentation de référence pour l'observabilité agentique — lien direct avec la mesure du *tool correctness* et du *retry budget* via tracing.

11. Salesforce / Wiley — « Wiley sees 213% return on investment with Salesforce » — Salesforce Customer Stories — 2024-2025 — https://www.salesforce.com/customer-stories/wiley/ — Cas Wiley : 213 % ROI sur Service Cloud, >40 % amélioration de l'efficacité, onboarding agents saisonniers 50 % plus rapide, $230 000 d'économies documentées ; déploiement Agentforce sur pic de rentrée académique 2024. Source primaire Salesforce confirmée. Apport dans Ch. 4 : cas de référence ROI *front-office* avec métriques publiques pour §4.1.

12. Bank of America Newsroom — « BofA AI and Digital Innovations Fuel 30 Billion Client Interactions » — Bank of America — mars 2026 — https://newsroom.bankofamerica.com/content/newsroom/press-releases/2026/03/bofa-ai-and-digital-innovations-fuel-30-billion-client-interacti.html — Erica : 21,3 M utilisateurs Q1 2026 (+7 %), 2 M interactions quotidiennes (équivalent 11 000 employés), +19 % revenus via suggestions proactives ; interne : 90 % adoption employés, -50 % requêtes IT service desk. Source primaire (communiqué officiel). Apport Ch. 4 : ROI mesurable sur grand déploiement *agentic* multi-dimension (coût, revenu, adoption).
-->

> **Partie 2 — Trouver les bons cas d'usage**
> **Chapitre 4 · Évaluer le ROI, le risque et la maturité · ~5 500 mots · lecture ≈ 22 min**

## Esquisse

**(a) Thèse.** Qualifier un cas d'usage *agentic* à l'aide de la matrice de [Ch. 3](ch03-mapping-high-impact.md) est nécessaire mais non suffisant : l'organisation peut avoir identifié la bonne tâche au mauvais moment, avec les mauvaises fondations. Ce chapitre fournit le cadre d'évaluation complémentaire — ROI projeté, risque opérationnel, et maturité organisationnelle — qui conditionne la décision d'engager des ressources de développement. La thèse opérationnelle est que les quatre piliers d'un système *agentic* (LLM, Memory, Tools, Environment) sont les déterminants mesurables du CPST potentiel avant tout développement, et que l'évaluation de la *readiness* est l'évaluation préalable du coût de production — pas une formalité de gouvernance.

**(b) Question à laquelle le chapitre répond.** Comment décider — avec des critères mesurables et défendables devant la direction financière — si un cas d'usage *agentic* vaut l'investissement maintenant, s'il vaut l'investissement avec des préconditions, ou s'il faut attendre ?

**(c) Lecteur cible.** Architecte de solution mandaté pour défendre le passage en production d'un programme *agentic* ; directeur produit ou CIO qui reçoit un dossier de business case ; risk officer évaluant la maturité organisationnelle avant approbation.

**(d) Renvois croisés prévus.**
- [Ch. 2](ch02-business-case.md) — CPST, *retry budget*, escalade : ce chapitre les opérationnalise via les quatre piliers ; le lien est explicite en §4.2.
- [Ch. 3](ch03-mapping-high-impact.md) — matrice autonomie × réversibilité × tolérance à l'erreur : la qualification du cas d'usage de Ch. 3 est la condition d'entrée dans le cadre d'évaluation de ce chapitre.
- [Ch. 7](ch07-agentops.md) — AgentOps et observabilité en production : les métriques définies dans ce chapitre sont les métriques instrumentées par AgentOps.
- [Ch. 8](ch08-trustworthy-systems.md) — hiérarchie d'autonomie et HITL : les seuils de *readiness* influencent le niveau d'autonomie accordé.
- [Ch. 12](ch12-lessons-failed.md) — anatomie des échecs : les lacunes de *readiness* documentées ici sont les précurseurs des échecs de Ch. 12.
- [Annexe B](annexe-B-use-case-canvas.md) — Use Case Canvas : instanciation pratique des critères de ce chapitre.
- [Annexe C](annexe-C-agentops-maturity.md) — AgentOps Maturity Model : jauge de la maturité opérationnelle décrite en §4.5.

---

## Plan détaillé

### 4.1 — Du cas d'usage au dossier d'investissement : ce qui manque entre Ch. 3 et Ch. 5

**Phrase-clé de section.** La matrice de Ch. 3 dit *quoi* déployer ; ce chapitre dit *si* et *quand* le déployer — deux questions que le seul score de risque agentique ne tranche pas.

Cette section installe la discontinuité entre la qualification du cas d'usage et la décision d'investissement. Elle pose le problème structurel : un cas d'usage positionné en zone verte de la matrice peut néanmoins échouer si l'organisation manque des fondations de données, de processus ou de talent nécessaires à l'exploitation du système en production. Les données Fivetran (2026) l'illustrent brutalement : 85 % des entreprises déploient de l'*agentic AI* sur des fondations de données non prêtes ; 41 % utilisent déjà de l'*agentic AI* en production malgré des lacunes critiques de qualité et de gouvernance des données. Ce gap est la cause racine de la majorité des dépassements de coût CPST documentés.

La section donne la carte de navigation du chapitre : évaluer simultanément le ROI attendu (§4.2), le profil de risque résiduel après qualification Ch. 3 (§4.3), la décision build/buy/wait (§4.4), et la maturité organisationnelle à quatre dimensions (§4.5) — avant de produire le dossier d'investissement actionnable (§4.6).

Renvoi explicite vers [Ch. 2](ch02-business-case.md) §2.6 : les trois questions opérationnelles du dossier d'investissement (CPST cible, *retry budget*, définition du *successful outcome*) sont les intrants de ce chapitre.

---

### 4.2 — Le cadre à quatre piliers : LLM, Memory, Tools, Environment

**Phrase-clé de section.** Les quatre piliers ne sont pas une taxonomie académique : ce sont les quatre déterminants du CPST potentiel, et évaluer chaque pilier revient à projeter le coût de production avant d'écrire la première ligne de code.

Cette section est le cœur analytique du chapitre. Elle s'appuie sur le cadre arXiv:2512.12791 (Akshathala et al., SERC IIIT-Hyderabad / MontyCloud Inc., décembre 2025) — le seul cadre d'évaluation publié qui structure explicitement les systèmes *agentic* autour de ces quatre piliers avec validation empirique sur un cas CloudOps autonome.

**Pilier 1 — LLM.** Capacité du modèle à accomplir la tâche cible avec le taux de succès et la fiabilité requis. Évaluer : performance sur distribution réelle des inputs (pas sur distribution de validation PoC), taux pass@1 (succès à la première tentative) vs pass@k (au moins une réussite sur k essais), cohérence comportementale sur les cas de bord. Lien CPST : un LLM sous-dimensionné pour la complexité de la tâche dégrade le taux de succès et multiplie les retries — impact direct sur le dénominateur du CPST. Apport Anthropic : la distinction pass@k vs pass^k (Anthropic Engineering, « Demystifying Evals for AI Agents ») calibre l'exigence selon le contexte — une tâche médicale exige pass^k élevé ; une suggestion de produit tolère pass@k.

**Pilier 2 — Memory.** Capacité du système à maintenir le contexte nécessaire à l'exécution correcte sur la durée de la tâche. Évaluer : type de mémoire requis (épisodique, sémantique, procédurale — cf. taxonomie Ch. 1 §1.3), risque de dette de mémoire sur les tâches longues, coût d'infrastructure mémoire (index vectoriel, graphe de connaissances, compression). Lien CPST : une mémoire défaillante augmente le taux d'escalade (le contexte perdu déclenche une exception) et les retries (l'agent repart de zéro). Anti-patron à documenter : mémoire non purgée sur des tâches répétitives → accumulation de biais dans les décisions suivantes.

**Pilier 3 — Tools.** Qualité et fiabilité des outils auxquels l'agent a accès. Évaluer : idempotence des outils à effet de bord (peut-on appeler deux fois sans conséquence double ?), richesse et précision des schémas d'outil (un schéma ambigu augmente le taux d'erreur *tool correctness*), couverture des outils vs. besoins réels de la tâche (un outil manquant force l'improvisation), latence des appels d'outil (impact sur CPST via latence totale). Métrique clé : *tool correctness* = (tool selection accuracy × tool parameter accuracy) — les deux composantes doivent être mesurées séparément. Un agent qui sélectionne le bon outil mais avec les mauvais paramètres contribue différemment à l'échec.

**Pilier 4 — Environment.** Qualité et fiabilité de l'environnement dans lequel l'agent opère : qualité des données d'entrée, stabilité des APIs, sécurité du bac à sable d'exécution, observabilité disponible. Évaluer : taux de disponibilité des APIs invoquées, qualité et fraîcheur des données sources (Gartner : 63 % des organisations ne savent pas si elles ont les bonnes pratiques de gestion des données pour l'IA), conformité réglementaire de l'environnement d'exécution (Loi 25 Québec, OSFI E-23 pour les institutions financières canadiennes). Lien CPST : un environnement instable multiplie les timeouts et les retries — coût directement mesurable.

Tableau synthétique : quatre piliers × cinq métriques d'évaluation (niveau de maturité, impact CPST, seuil d'investissement acceptable, contre-mesure si lacune, outil d'instrumentation recommandé).

Diagramme Mermaid : les quatre piliers comme déterminants du CPST — flèches de causalité vers taux de succès, retry budget, escalade.

---

### 4.3 — Métriques opérationnelles : les cinq signaux de production

**Phrase-clé de section.** Les métriques *task success*, *tool correctness*, *retry budget*, *escalation quality* et *policy compliance* ne sont pas des KPIs de rapport — ce sont les variables de contrôle en temps réel d'un agent *agentic* en production ; leur absence transforme tout incident en surprise.

Cette section définit et opérationnalise les cinq métriques canoniques, en s'appuyant sur les définitions de iMerit (2026), les pratiques Anthropic et le standard OTel GenAI (expérimental, mars 2026).

**Task success rate.** Taux de complétion correcte des objectifs de l'agent sur la distribution réelle des inputs. Distinguer : succès nominal (la tâche est complétée) vs. succès qualitatif (la tâche est complétée correctement selon le critère défini en §2.5 — le *successful outcome*). Un agent qui complète une tâche avec une réponse plausible mais incorrecte contribue au succès nominal mais pas au succès qualitatif. La distinction détermine le dénominateur du CPST.

**Tool correctness.** Deux composantes : (1) *tool selection accuracy* — l'agent invoque le bon outil pour la situation ; (2) *tool parameter accuracy* — l'agent remplit les paramètres correctement selon le contexte. Apport Anthropic : les graders code-based sont préférables aux tests de séquence rigides — tester *ce que* l'agent a produit, pas *comment* il l'a produit, pour éviter de pénaliser les chemins valides non anticipés.

**Retry budget.** Mesure de l'utilisation du budget de retry par tâche. En production : ratio (retries consommés / budget alloué), taux de tâches qui épuisent le budget complet sans succès (indicateur de sous-dimensionnement du modèle ou de mauvaise qualité d'outil), coût moyen par retry (enrichit le CPST). Seuil d'alerte : si plus de 20 % des tâches consomment plus de 50 % du retry budget, le cas d'usage est probablement mal dimensionné — réévaluer le Pilier 1 (LLM) ou le Pilier 3 (Tools).

**Escalation quality.** Quatre sous-dimensions : (1) *trigger accuracy* — l'escalade est déclenchée aux bonnes conditions (pas trop tôt, pas trop tard) ; (2) *escalation type* — escalade humaine vs. spécialisée correctement routée ; (3) *timing* — à quel point du cycle de vie de la tâche l'escalade survient (les escalades précoces coûtent moins en contexte accumulé) ; (4) *context quality* — la complétude et la clarté du contexte transmis à l'opérateur humain (une escalade avec contexte incomplet entraîne un temps de traitement humain plus long → CPST d'escalade plus élevé).

**Policy compliance.** Mesure l'adhérence de l'agent aux politiques définies : périmètre topical (refus des requêtes hors domaine), contraintes de données (ne pas exposer de PII non autorisées), conformité réglementaire (exigences sectorielles). Lien OTel : les conventions sémantiques GenAI (gen-ai-agent-spans) permettent d'instrumenter la policy compliance comme attribut de span — traçable par tâche, par tenant, par run.

Section outillage : panorama des six plateformes d'évaluation et d'observabilité agentique en 2026 — LangSmith, Langfuse, Arize Phoenix (OTel-native), Braintrust (SOC 2 / HIPAA), Galileo (ChainPoll, Luna), Datadog LLM Observability — avec positionnement selon le profil organisationnel et les critères de conformité.

---

### 4.4 — Décision build/buy/wait : critères et seuils

**Phrase-clé de section.** La décision build/buy/wait n'est pas une décision de make-or-buy classique : elle dépend simultanément du score de *readiness* organisationnel, du degré de différenciation concurrentielle du cas d'usage, et de la vitesse à laquelle le marché des plateformes agentiques se consolide.

Cette section traduit le cadre KPMG (2026) en critères opérationnels pour architectes.

**Seuil de la décision « build ».** Justifié lorsque : (1) le cas d'usage constitue une capacité de différenciation concurrentielle que les plateformes génériques ne peuvent pas reproduire — traduction opérationnelle : l'avantage réside dans la logique métier, pas dans les capacités LLM génériques ; (2) l'organisation a une maturité d'ingénierie confirmée (scores piliers LLM, Memory, Tools ≥ 3/5) ; (3) la souveraineté des données ou la conformité réglementaire interdit l'utilisation de plateformes SaaS avec traitement de données tiers. Compromis : coût de développement et de maintenance long terme supérieur de 3× à 5× au coût d'achat sur 3 ans (*à vérifier* — hypothèse basée sur des ratios observés, aucune étude publiée disponible à mai 2026).

**Seuil de la décision « buy ».** Justifié lorsque : (1) le cas d'usage correspond à un patron supporté par les plateformes matures (support tier-1, assistant de recherche, automatisation P2P) ; (2) le time-to-value est critique (fenêtre compétitive < 6 mois) ; (3) la maturité d'ingénierie est insuffisante pour maintenir un agent custom en production (score pilier < 2/5 sur deux dimensions ou plus). Compromis : dépendance fournisseur, customisation limitée, risque de lock-in (traité exhaustivement au [Ch. 10](ch10-scaling-without-lockin.md)).

**Seuil de la décision « wait ».** Justifié lorsque : (1) score readiness global < seuil défini en §4.5, sans plan de remédiation des lacunes dans la fenêtre de déploiement ; (2) le marché des plateformes pour ce cas d'usage spécifique est en transition rapide (deux ou trois consolidations attendues dans 12-18 mois) — déployer sur une plateforme qui sera absorbée ou abandonnée génère une dette de migration ; (3) les exigences réglementaires applicables ne sont pas encore stabilisées (exemple : actes délégués EU AI Act attendus en 2025-2026, OSFI E-23 en vigueur mai 2027).

Tableau décisionnel : matrice 3 × 5 — décision (build/buy/wait) × critère (différenciation, maturité, conformité, time-to-value, marché) avec seuils numériques.

**Condition de bascule.** La décision « build » peut se renverser en « buy » si le marché lance une plateforme qui couvre le cas d'usage avec une customisation suffisante dans les 12 mois suivant la décision initiale. Un engagement contractuel pluriannuel sur une plateforme « buy » se renverse en « build » si le fournisseur est acquis ou si les prix augmentent au-delà du seuil de CPST acceptable. La décision « wait » doit avoir une date d'expiration explicite avec des critères de réévaluation — « wait indéfini » est une non-décision, pas une stratégie.

---

### 4.5 — Readiness assessment : données, processus, talents, gouvernance

**Phrase-clé de section.** Le *readiness assessment* agentique évalue quatre dimensions orthogonales — données, processus, talents, gouvernance — dont la conjonction détermine si une organisation peut exploiter un agent en production sans générer un coût d'incident supérieur au coût d'escalade.

Cette section s'appuie sur le modèle MIT CISR à quatre stades (2025), le Fivetran 2026 Agentic AI Readiness Index (publié le 5 mai 2026), et les critères de gouvernance Databricks (rapport *State of AI Agents 2026*, cité dans [Ch. 2](ch02-business-case.md) §2.5).

**Dimension 1 — Données.** L'agent peut-il accéder aux données dont il a besoin, avec la qualité, la fraîcheur et la traçabilité requises pour la tâche ? Évaluer : existence de pipelines de données automatisés et toujours actifs (signal de maturité Fivetran : les organisations « fully prepared » s'appuient sur des pipelines always-on), lignage et gouvernance end-to-end (42 % des organisations citent la qualité et le lignage des données comme principale barrière), conformité souveraineté (39 % citent la conformité réglementaire comme barrière). Seuil minimal : les données sources doivent avoir un lignage traçable et un SLA de fraîcheur défini avant déploiement. Gartner calibre le risque : 63 % des organisations n'ont pas les pratiques de gestion des données requises pour l'IA.

**Dimension 2 — Processus.** Le processus que l'agent automatise est-il suffisamment bien compris et documenté pour que ses exceptions soient prévisibles ? Évaluer : existence d'une documentation des cas de bord (les agents héritent de la complexité accidentelle du processus humain — anti-patron documenté dans [Ch. 3](ch03-mapping-high-impact.md) §3.6), définition opérationnelle du *successful outcome* (artefact de gouvernance §2.5), cartographie des outils requis vs. disponibles. Un processus non documenté avant déploiement *agentic* génère invariablement des surprises en production, parce que les cas de bord non documentés sont précisément ceux qui déclenchent les comportements non bornés.

**Dimension 3 — Talents.** L'organisation a-t-elle les compétences pour développer, évaluer, déployer et opérer un agent *agentic* en production ? Évaluer : existence d'ingénieurs capables d'écrire des *eval suites* (compétence rare, distincte du prompt engineering), capacité interne à instrumenter l'observabilité OTel GenAI, compétence *on-call* pour diagnostiquer les modes de défaillance *stateful* (stale state, context drift — décrits en [Ch. 1](ch01-from-automation-to-agents.md) §1.4). MIT CISR : la progression stade 2→3 (pilotes → façons de travailler à l'échelle) corrèle avec la présence de compétences spécialisées en IA dans l'organisation.

**Dimension 4 — Gouvernance.** L'organisation a-t-elle les artefacts de gouvernance minimaux pour contrôler l'agent en production ? Évaluer : présence des trois artefacts Databricks (définition *successful outcome*, *eval suite* automatisée, *escalation policy* documentée — cf. [Ch. 2](ch02-business-case.md) §2.5), existence d'une politique de *retry budget* et de *kill switch* financier (§2.3), structure RACI pour les décisions humaines de supervision. Gartner avertit : seulement 21 % des entreprises ont une infrastructure de gouvernance mature pour gérer l'*agentic AI* à l'échelle en toute sécurité en 2026 (*probable* — issu d'une synthèse d'analystes, pas d'une publication primaire Gartner directement citée).

Tableau de scoring : quatre dimensions × cinq critères, chacun noté 1-5. Score global ≥ 15/20 → décision de déploiement envisageable. Score 10-14 → plan de remédiation ciblé avant déploiement. Score < 10 → décision « wait » avec feuille de route de développement des capacités.

---

### 4.6 — Du *readiness assessment* au dossier d'investissement actionnable

**Phrase-clé de section.** Le dossier d'investissement *agentic* qui résiste à la première revue budgétaire répond à trois questions en une page : quel est le CPST projeté à quel taux de succès, quel est le score de *readiness* et quel est le plan de remédiation des lacunes, et quelle est la décision build/buy/wait motivée.

Cette section ferme la boucle du chapitre en traduisant les évaluations précédentes en artefacts décisionnels concrets. Elle décrit le format minimal d'un dossier d'investissement *agentic* : (1) fiche cas d'usage (classification Ch. 3, CPST cible, *successful outcome* défini) ; (2) évaluation quatre piliers (LLM, Memory, Tools, Environment) avec scores et lacunes identifiées ; (3) évaluation *readiness* (quatre dimensions, score total, plan de remédiation) ; (4) décision build/buy/wait motivée avec critères et condition de bascule explicite.

Elle ancre les renvois vers [Ch. 5](ch05-protocols-interoperability.md) (choix de protocoles selon décision build/buy) et [Ch. 7](ch07-agentops.md) (les métriques définies ici deviennent les métriques instrumentées en production par AgentOps). Elle pointe vers [Annexe B](annexe-B-use-case-canvas.md) (canvas instanciant ce cadre) et [Annexe C](annexe-C-agentops-maturity.md) (jauge de maturité opérationnelle).

---

## Sources clés

| # | Source | Justification de rétention |
|---|---|---|
| 1 | Akshathala et al. — « Beyond Task Completion: An Assessment Framework for Evaluating Agentic AI Systems » — arXiv:2512.12791 — déc. 2025 — https://arxiv.org/abs/2512.12791 | Cadre à quatre piliers LLM/Memory/Tools/Environment ; seule source académique validant empiriquement ce cadre sur un cas *agentic* CloudOps ; paternité SERC IIIT-Hyderabad / MontyCloud Inc. confirmée |
| 2 | Anthropic Engineering — « Demystifying Evals for AI Agents » — 2026 — https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents | Source primaire sur les evals agentiques : pass@k vs pass^k, graders code-based, grade par dimension (outcome, transcript, tool call, cost, latency) |
| 3 | iMerit — « Agent Evaluation in Production: Behavior Metrics » — 2026 — https://imerit.net/resources/blog/agent-evaluation-in-production-metrics-for-task-success-tool-use-correctness-and-escalation-quality/ | Définitions opérationnelles précises des cinq métriques canoniques ; structuration 8-12 métriques pour production |
| 4 | KPMG — « Agentic AI Untangled: Navigating the Build, Buy, or Borrow Decision » — 2026 — https://kpmg.com/us/en/articles/2026/agentic-ai-untangled.html | Cadre décisionnel build/buy/borrow le plus actionnable disponible ; données de marché 57 % blended approach |
| 5 | MIT CISR — « Update on the Enterprise AI Maturity Model » — 2025 — https://cisr.mit.edu/publication/2025_0801_EnterpriseAIMaturityUpdate_WoernerSebastianWeillKaganer | Modèle de maturité à quatre stades avec corrélation performance financière ; source académique primaire pour la dimension talents/processus du *readiness assessment* |
| 6 | Fivetran — « 2026 Agentic AI Readiness Index » — 5 mai 2026 — https://www.fivetran.com/blog/85-of-enterprises-are-running-agentic-ai-on-a-data-foundation-that-isnt-ready | Quantification du gap données/préparation : 85 % déploient sur fondations non prêtes ; barrières données confirmées (N=400) |
| 7 | Gartner — « Lack of AI-Ready Data Puts AI Projects at Risk » — 26 fév. 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-02-26-lack-of-ai-ready-data-puts-ai-projects-at-risk | Calibration du risque données : 63 % sans bonnes pratiques ; 60 % projets abandonnés faute de données IA-prêtes |
| 8 | OpenTelemetry — « Semantic Conventions for GenAI Agent Spans » — 2025-2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/ | Standard d'instrumentation de référence pour métriques de production ; statut experimental mars 2026, adoption par Datadog/Grafana/Elastic |
| 9 | Galileo — « Agent Evaluation Framework 2026 » — 2026 — https://galileo.ai/blog/agent-evaluation-framework-metrics-rubrics-benchmarks | Panorama des six plateformes d'évaluation agentique 2026 avec positionnement comparatif |
| 10 | Salesforce Customer Stories — « Wiley sees 213% ROI with Salesforce » — 2024-2025 — https://www.salesforce.com/customer-stories/wiley/ | Cas ROI *front-office* avec métriques primaires confirmées ($230K économies, +40 % efficacité) |
| 11 | Bank of America Newsroom — « BofA AI and Digital Innovations Fuel 30 Billion Client Interactions » — mars 2026 — https://newsroom.bankofamerica.com/content/newsroom/press-releases/2026/03/bofa-ai-and-digital-innovations-fuel-30-billion-client-interacti.html | ROI multi-dimension à grande échelle (21,3M utilisateurs, +19 % revenus proactifs) — source primaire confirmée |
| 12 | Akshathala et al. (arXiv:2604.19818) — « Beyond Task Success: An Evidence-Synthesis Framework » — arXiv — avril 2026 — https://arxiv.org/abs/2604.19818 | Extension du cadre 2512.12791 vers la gouvernance et l'orchestration ; source complémentaire pour §4.6 |
