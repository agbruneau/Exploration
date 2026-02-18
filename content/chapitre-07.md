### Chapitre 7 — Architectures IA-first et fondations nécessaires

<!-- Rôle argumentatif (PRD §3) : Les architectures AI-first sont le socle nécessaire — et l'EA est responsable de leur conception. -->

#### Introduction

Le chapitre précédent a cartographié les compétences que l'architecte d'entreprise doit acquérir pour exercer son rôle de conseiller stratégique en IA — compétences techniques, business et d'influence. Mais les compétences, aussi étendues soient-elles, restent inopérantes sans les fondations techniques sur lesquelles elles s'exercent. La Partie III du présent livre blanc marque le passage de la réflexion stratégique à l'exécution technique. Ce chapitre répond à une question fondamentale : que doit construire l'architecte d'entreprise pour que l'intelligence artificielle puisse se déployer à l'échelle de l'organisation de manière gouvernée, réutilisable et durable?

La réponse ne se résume pas à l'adoption d'une plateforme ou d'un outil. Selon Cloudera, 2026 représente la transition de l'expérimentation vers l'orchestration de l'intelligence — un moment où l'IA, les données, l'infrastructure et la gouvernance convergent dans un modèle opérationnel unifié [1]. Cette convergence exige une architecture pensée dès l'origine pour l'IA — une architecture *AI-first* (architecture priorisant l'IA) — plutôt qu'une architecture traditionnelle à laquelle on greffe des capacités d'IA après coup. Comme le confirme l'étude de Gupta (2025) sur arXiv, l'architecture d'entreprise, théorisée comme capacité dynamique — détection, saisie, transformation — peut améliorer l'adoption de l'IA générative en renforçant l'alignement stratégique, les cadres de gouvernance et l'agilité organisationnelle [2]. Mais les cadres existants nécessitent une adaptation aux défis spécifiques de l'IA générative, en particulier l'équilibre entre la vitesse d'innovation et les exigences de conformité.

Ce chapitre examine les sept piliers fondamentaux d'une architecture *AI-first* : les données comme substrat (section 7.1), les plateformes *MLOps*/*LLMOps* intégrées au système d'information (section 7.2), l'architecture de plateforme agentique (section 7.3), le concept d'*Enterprise AI Fabric* (section 7.4), l'architecture IA composable (section 7.5), le modèle *AI Factory* (section 7.6) et la gouvernance technique intégrée (section 7.7). Chaque section est abordée du point de vue de l'architecte d'entreprise : non pas en tant que développeur de modèles, mais en tant que concepteur des fondations qui permettent à l'organisation de produire, de déployer et de gouverner l'IA à l'échelle industrielle.

---

#### 7.1 Données : qualité, gouvernance, *data mesh* / *lakehouse*, lignage, MDM

##### Les données comme substrat de toute architecture IA

Aucune architecture IA ne peut fonctionner sans des données fiables, gouvernées et accessibles. Cette affirmation, qui relève de l'évidence, se heurte pourtant à une réalité organisationnelle persistante : selon Gartner, la mauvaise qualité des données coûte en moyenne 12,9 millions de dollars américains par an aux organisations [3]. McKinsey identifie la qualité et la disponibilité des données comme l'obstacle principal à la mise à l'échelle de l'IA, cité par 43 % des organisations [4]. L'architecte d'entreprise, responsable de la cohérence et de l'interopérabilité du système d'information, est naturellement le gardien de ce substrat.

La donnée, dans une architecture *AI-first*, ne peut plus être traitée comme un sous-produit des processus opérationnels. Comme le formule Abhas Ricky, directeur de la stratégie chez Cloudera, les organisations doivent « ré-architecturer les données qui sous-tendent l'IA » pour que chaque jeu de données porte « sa propre sémantique, son lignage et ses garde-fous » [1]. La donnée devient un « système de mémoire vivant, sémantique et gouverné » plutôt qu'un stockage passif. Ce renversement de perspective a des implications architecturales profondes.

##### Qualité des données : de l'hygiène au prérequis stratégique

La qualité des données pour l'IA va au-delà des dimensions traditionnelles de complétude, d'exactitude et de fraîcheur. Les modèles d'apprentissage automatique sont sensibles à des défauts que les systèmes transactionnels tolèrent : biais de représentation dans les données d'entraînement, incohérences sémantiques entre les sources, dérive temporelle des distributions. L'architecte d'entreprise doit concevoir des architectures de données qui intègrent des contrôles de qualité spécifiques aux exigences de l'IA.

Gartner prévoit que l'application de l'IA générative accélérera de 40 % le délai de retour sur investissement des programmes de gouvernance des données et de gestion des données de référence (*Master Data Management*, MDM) [3]. Cette prédiction souligne une dynamique vertueuse : l'IA exige des données de qualité, et l'IA peut contribuer à améliorer cette qualité — à condition que l'architecture prévoie les boucles de rétroaction nécessaires.

##### Gouvernance des données : le fondement non négociable

La gouvernance des données dans une architecture *AI-first* dépasse la conformité réglementaire. Elle englobe la classification des données selon leur sensibilité et leur exploitabilité par les modèles, les politiques d'accès différenciées entre les usages analytiques et les usages d'entraînement, la traçabilité de l'utilisation des données dans les pipelines de modèles, et les mécanismes de consentement et de retrait pour les données personnelles utilisées dans l'entraînement des modèles.

Les tendances d'architecture des données pour 2025 confirment que la gouvernance est désormais la norme par défaut : les fonctionnalités de suivi de lignage, d'application de politiques et de balisage de métadonnées sont attendues plutôt qu'optionnelles [5]. Pour l'architecte d'entreprise, cela signifie que la gouvernance des données doit être intégrée dans l'architecture comme un composant structurel — pas comme une couche de conformité ajoutée après coup.

##### *Data mesh* et *lakehouse* : deux paradigmes complémentaires

L'architecture des données pour l'IA repose aujourd'hui sur deux paradigmes qui, loin de s'opposer, se complètent : le *data mesh* (maillage de données) et le *data lakehouse* (lac de données transactionnel).

**Le *data mesh***, conceptualisé par Zhamak Dehghani, repose sur quatre principes : la propriété des données par les domaines, les données comme produit, l'infrastructure de données en libre-service et la gouvernance fédérée computationnelle. Pour l'IA, le *data mesh* offre un avantage fondamental : il rapproche les données de leur contexte métier, ce qui améliore la pertinence des modèles entraînés sur ces données. Selon Informatica, le *data mesh* « gouverne et connecte tout malgré son approche fédérée, déverrouillant véritablement les possibilités de l'analytique avancée et de l'IA et transformant les données en actif stratégique » [6].

**Le *data lakehouse*** combine les avantages du lac de données (*data lake*) — stockage à faible coût de données structurées et non structurées — avec les garanties transactionnelles de l'entrepôt de données (*data warehouse*). En 2025, le modèle *lakehouse* a mûri pour devenir une architecture éprouvée, avec des formats ouverts comme Apache Iceberg, Delta Lake et Apache Hudi fournissant des standards ouverts pour les données transactionnelles à grande échelle [7]. En 2026, le *lakehouse* s'étend pour alimenter l'analytique en temps réel, l'IA agentique et même l'inférence en périphérie (*edge inference*) [7].

L'architecte d'entreprise doit concevoir une stratégie de données qui utilise le *lakehouse* comme fondation technique et le *data mesh* comme modèle opérationnel — une approche que les analystes qualifient d'architecture hybride moderne [6].

[Figure 7.1 — Architecture de données hybride pour l'IA : *data mesh* + *lakehouse*]

```
┌─────────────────────────────────────────────────────────────────────┐
│                    GOUVERNANCE FÉDÉRÉE COMPUTATIONNELLE              │
│            Politiques, standards, contrôles de qualité, lignage      │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐              │
│  │  DOMAINE RH  │  │ DOMAINE      │  │ DOMAINE      │    ...       │
│  │              │  │ FINANCE      │  │ OPÉRATIONS   │              │
│  │ Produits de  │  │ Produits de  │  │ Produits de  │              │
│  │ données      │  │ données      │  │ données      │              │
│  │ (data mesh)  │  │ (data mesh)  │  │ (data mesh)  │              │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘              │
│         │                  │                  │                      │
│  ┌──────▼──────────────────▼──────────────────▼──────────────────┐  │
│  │               DATA LAKEHOUSE UNIFIÉ                           │  │
│  │  ┌───────────┐  ┌───────────────┐  ┌───────────────────┐     │  │
│  │  │ Données   │  │ Données       │  │ Données           │     │  │
│  │  │structurées│  │semi-structurées│  │ non structurées   │     │  │
│  │  └───────────┘  └───────────────┘  └───────────────────┘     │  │
│  │         Apache Iceberg / Delta Lake / Hudi                    │  │
│  │         Transactions ACID + stockage ouvert                   │  │
│  └───────────────────────────┬───────────────────────────────────┘  │
│                              │                                      │
│  ┌───────────────────────────▼───────────────────────────────────┐  │
│  │                COUCHE DE SERVICE IA                            │  │
│  │  Feature Store │ Entraînement │ Inférence │ RAG │ Évaluation  │  │
│  └───────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────┘
```

*La figure illustre l'architecture de données hybride recommandée. Les domaines métier possèdent et publient leurs produits de données selon les principes du data mesh. Le data lakehouse unifié assure le stockage et les transactions. La couche de service IA consomme les données pour l'entraînement, l'inférence et la génération augmentée par récupération (RAG).*

##### Lignage des données : la traçabilité comme exigence architecturale

Le lignage des données (*data lineage*) — la capacité de tracer l'origine, les transformations et la destination de chaque donnée — a basculé en 2025 d'une fonction technique à une capacité critique pour l'entreprise. Avec l'IA générative consommant des volumes massifs de données d'entreprise, le lignage doit être en temps réel, automatisé et intégré à la gouvernance [8]. Sans lignage adéquat, les organisations risquent de construire leur IA sur des données erronées ou non conformes — une erreur qui coûte déjà des milliards en amendes réglementaires [8].

Le marché des logiciels d'observabilité des données d'entreprise devrait passer de 1,5 milliard de dollars américains en 2025 à 2,3 milliards en 2030, porté par la complexité croissante des architectures de données modernes et l'adoption de l'analytique en temps réel [8]. L'architecte d'entreprise doit intégrer l'observabilité des données comme un composant structurel de l'architecture, au même titre que la surveillance des applications.

##### Gestion des données de référence (*MDM*) : le socle de cohérence

La gestion des données de référence (*Master Data Management*, MDM) prend une importance renouvelée dans le contexte de l'IA. Les modèles d'apprentissage automatique qui consomment des données provenant de multiples domaines — clients, produits, fournisseurs, employés — nécessitent une cohérence sémantique que seul un programme MDM mature peut garantir. Gartner prévoit que les marchés fragmentés de la gestion des données continueront de converger autour de plateformes écosystémiques, le MDM servant de discipline fondamentale intégrée dans toute stratégie de plateforme de données convergée [3].

Pour l'architecte d'entreprise, la MDM dans un contexte *AI-first* implique trois évolutions : l'enrichissement des référentiels maîtres avec des métadonnées exploitables par les modèles (descriptions sémantiques, taxonomies, ontologies), l'intégration du MDM avec les *feature stores* (entrepôts de caractéristiques) pour assurer la cohérence entre les données transactionnelles et les données de modélisation, et la mise en place de mécanismes de détection automatique des incohérences entre les sources.

---

#### 7.2 Plateformes : *MLOps*, *LLMOps*, intégration dans le SI

##### De l'artisanat des modèles à la plateforme industrielle

L'opérationnalisation des modèles d'IA — leur déploiement, leur surveillance et leur maintenance en production — constitue le défi technique qui distingue les organisations qui expérimentent de celles qui industrialisent. Les pratiques *MLOps* (*Machine Learning Operations*) et leur extension *LLMOps* (*Large Language Model Operations*) fournissent les cadres méthodologiques et outillés pour cette industrialisation. L'architecte d'entreprise est responsable de l'intégration de ces pratiques dans l'architecture du système d'information existant.

L'une des caractéristiques du paysage *MLOps* en 2025-2026 est la coexistence de solutions à code source ouvert et de solutions propriétaires. Les plateformes propriétaires offrent des fonctionnalités de classe entreprise, une sécurité renforcée et un soutien dédié [9]. Les outils ont mûri dans trois directions importantes : les *feature stores* et les intégrations avec les lacs de données/*lakehouses* sont devenus une infrastructure standard; le suivi d'expérimentations et de requêtes s'est étendu aux primitives d'observabilité pour l'IA générative; et les outils spécialisés pour les LLM et le RAG — magasins de vecteurs, contrôle de version des requêtes, diagnostics d'hallucination — sont entrés dans les piles *MLOps* grand public [9].

##### L'architecture de la pile *MLOps*/*LLMOps*

Une architecture *MLOps*/*LLMOps* de qualité production comprend typiquement quatre couches que l'architecte d'entreprise doit positionner dans le paysage applicatif :

**La couche de données et de gouvernance.** Elle assure l'ingestion, la transformation, le versionnement et la gouvernance des données d'entraînement et d'inférence. Cette couche se connecte au *data lakehouse* et au MDM décrits à la section 7.1.

**La couche d'entraînement et de réglage fin.** Elle fournit les environnements de calcul, les cadres d'expérimentation et les registres de modèles nécessaires au développement des modèles. Pour les LLM, elle inclut les capacités de réglage fin (*fine-tuning*), d'alignement par rétroaction humaine (*RLHF*) et d'évaluation systématique.

**La couche de déploiement et de service.** Elle gère le déploiement des modèles en production, l'inférence à grande échelle, la mise à l'échelle automatique et le routage intelligent entre modèles. KServe est devenu un standard de facto pour le service de modèles sur Kubernetes en 2025, offrant une mise à l'échelle automatique prête à l'emploi pour optimiser les coûts [10].

**La couche de surveillance et de sécurité.** Elle assure l'observabilité des modèles en production — détection de la dérive, surveillance de la performance, journalisation des requêtes, contrôle d'accès basé sur les rôles (*RBAC*). Arize Phoenix a émergé comme plateforme de référence pour l'observabilité et l'évaluation des applications LLM et agentiques [9].

[Tableau 7.1 — Couches de la pile *MLOps*/*LLMOps* et responsabilités de l'architecte d'entreprise]

| Couche | Composants clés | Responsabilité de l'AE |
|---|---|---|
| Données et gouvernance | Ingestion, versionnement, lignage, *feature store* | Intégration avec l'architecture de données existante |
| Entraînement et réglage fin | Environnements de calcul, registre de modèles, évaluation | Dimensionnement d'infrastructure, standards de métadonnées |
| Déploiement et service | Inférence, mise à l'échelle, routage de modèles | Intégration dans les flux applicatifs, SLA, résilience |
| Surveillance et sécurité | Observabilité, dérive, RBAC, journalisation | Conformité, audit, intégration avec le SOC |

*Source : Synthèse des auteurs à partir de [9], [10], [11]*

##### Intégration dans le système d'information : *API*, événementiel, sécurité

L'IA ne peut créer de valeur qu'en s'intégrant dans les processus métier existants. L'architecte d'entreprise joue un rôle critique dans cette intégration, qui mobilise trois paradigmes complémentaires.

**L'intégration par *API*.** Les modèles d'IA sont exposés comme des services via des *API* (*Application Programming Interfaces*) REST ou gRPC. L'architecte doit les intégrer dans la stratégie de gestion des *API* de l'organisation — passerelle d'*API*, portail de développeurs, gestion du cycle de vie, limitation de débit (*rate limiting*), versionnement. Les plateformes offrent désormais un contrôle d'accès intégré avec journalisation des requêtes, suivi des appels, limitation de débit et permissions basées sur les rôles au niveau de l'utilisateur, de l'équipe et du modèle [9].

**L'intégration événementielle.** Les systèmes d'IA, en particulier les systèmes agentiques, nécessitent une architecture événementielle (*event-driven architecture*) qui permet la réaction en temps réel aux événements métier. L'architecte doit concevoir les bus d'événements, les schémas de messages et les politiques de routage qui permettent aux agents IA de percevoir et de réagir aux événements du système d'information.

**La sécurité de l'intégration.** L'exposition de modèles d'IA via des *API* crée une surface d'attaque spécifique — injection de requêtes (*prompt injection*), extraction de données d'entraînement, attaques adversariales. L'architecte doit prévoir les mécanismes de protection adaptés : validation des entrées, détection d'anomalies, chiffrement de bout en bout, et isolation des environnements d'inférence.

---

#### 7.3 L'architecture de plateforme agentique : orchestration, identité, *logging*, patrons d'intégration réutilisables

##### L'émergence de l'IA agentique comme paradigme architectural

L'IA agentique (*agentic AI*) — des systèmes d'IA autonomes capables de planifier, d'exécuter et d'apprendre de manière itérative — représente un changement de paradigme qui exige une refonte de l'architecture d'entreprise. Selon Bain & Company, les organisations doivent transformer leurs systèmes par lots en capacités accessibles en temps réel par *API*, tout en veillant à ce que « l'IA agentique complète plutôt qu'elle ne remplace l'architecture existante » [12]. Cette transition n'est pas triviale : une organisation documentée par CIO.com est passée « d'une poignée d'agents pilotes à près de 2 000 instances d'agents IA réparties sur plus de 40 types d'agents » en un temps relativement court [13].

La productivité mesurée en laboratoire montre des améliorations « allant jusqu'à 90 %; en production, plus proche de ~30 % » [13]. Cet écart entre le laboratoire et la production souligne l'importance de la plateforme : ce n'est pas l'agent individuel qui crée la valeur, c'est l'infrastructure qui permet son déploiement, sa gouvernance et son évolution à l'échelle.

##### L'orchestration : le cerveau de la plateforme

L'orchestration des agents IA constitue le composant central de l'architecture agentique. Le cadre d'architecture agentique proposé par InfoQ identifie cinq patrons d'orchestration essentiels [14] :

**Le chaînage de requêtes (*prompt chaining*).** Des séquences de tâches en plusieurs étapes avec des portes de validation, des vérifications de précision et des évaluations de biais entre les composants.

**Le routage (*routing*).** La classification des entrées à l'aide de seuils de confiance, avec surveillance des disparités démographiques dans les décisions de routage.

**La parallélisation.** Le traitement simultané de sous-tâches indépendantes avec résolution de conflits lorsque les résultats convergent.

**L'évaluateur-optimiseur (*evaluator-optimizer*).** Des boucles d'auto-correction avec détection de convergence, permettant aux agents d'améliorer itérativement leurs productions.

**L'orchestrateur-travailleurs (*orchestrator-workers*).** La planification dynamique avec équilibrage de charge et replanification adaptative, où un agent maître distribue le travail à des agents spécialisés.

Le cadre propose trois niveaux de maturité progressifs : le niveau fondation (intelligence contrôlée avec orchestration d'outils et gouvernance des données), le niveau flux de travail (autonomie structurée dans des zones contraintes) et le niveau autonome (intelligence dynamique avec planification dirigée par les objectifs et apprentissage adaptatif) [14]. L'architecte d'entreprise est responsable de définir à quel niveau chaque cas d'usage doit opérer et de concevoir les garde-fous correspondants.

##### Identité et sécurité des agents

Les agents IA possèdent désormais des identités, des privilèges et un accès aux systèmes et aux données, ce qui en fait « un nouveau risque de sécurité avec une surface d'attaque entièrement non déterministe » [15]. L'architecture agentique doit intégrer une gestion de l'identité spécifique aux agents qui comprend :

**L'identité numérique de l'agent.** Chaque agent doit posséder une identité vérifiable, distincte de celle de l'utilisateur qui l'a déclenché. Cette identité permet la traçabilité des actions, l'application de politiques d'accès et l'audit.

**Les frontières de confiance.** L'architecture doit définir des périmètres de confiance (*trust boundaries*) à l'intérieur desquels les agents peuvent opérer. Un agent de service client n'a pas les mêmes droits d'accès qu'un agent d'analyse financière.

**L'authentification et l'autorisation.** Les protocoles OAuth et les configurations d'applications clientes externes doivent être adaptés aux agents, avec des mécanismes de délégation de droits qui limitent le périmètre d'action de chaque agent [16].

En 2026, des patrons émergent autour de moteurs de politiques unifiés, d'identité unifiée, de traçage unifié et de frontières de confiance unifiées [15]. L'architecte d'entreprise doit concevoir ces couches transversales comme des services partagés de la plateforme agentique.

##### Journalisation et observabilité : la transparence comme exigence

Puisque les agents IA sont intrinsèquement non déterministes, l'observabilité est primordiale pour assurer leur fonctionnement dans un cadre de confiance, de conformité et d'auditabilité avec supervision humaine [15]. En 2026, l'observabilité devient une « télémétrie comportementale » qui inclut des traces au niveau de chaque étape — raisonnement, appel d'outil, résultat, décision — et l'évaluation des résultats [15].

L'architecte d'entreprise doit concevoir l'architecture de journalisation sur trois plans :

**La journalisation opérationnelle.** Chaque action d'un agent — appel d'*API*, accès à une donnée, invocation d'un outil, prise de décision — doit être enregistrée avec horodatage, identité de l'agent, contexte et résultat. Salesforce permet désormais de décharger les journaux d'exécution vers des plateformes analytiques à haute ingestion, séparant le traitement transactionnel de la journalisation analytique [16].

**La journalisation de conformité.** Les systèmes agentiques opérant dans des domaines réglementés — services financiers, santé, ressources humaines — doivent produire des pistes d'audit (*audit trails*) conformes aux exigences sectorielles.

**La journalisation d'évaluation.** Les productions des agents doivent être évaluées de manière continue — pertinence, qualité, sécurité — avec des métriques automatisées et des revues humaines échantillonnées.

##### Patrons d'intégration réutilisables

L'intérêt fondamental d'une architecture de plateforme agentique, par opposition au déploiement d'agents individuels, réside dans la réutilisabilité. Comme le souligne John Wei dans CIO.com, « gagner avec l'IA agentique consiste moins à déployer des agents individuels qu'à construire (ou adopter) une plateforme qui standardise la manière dont les agents sont composés, gouvernés et font évoluer » [13].

Les patrons d'intégration réutilisables que l'architecte d'entreprise doit définir incluent :

**Le patron d'accès aux données.** Un mécanisme standardisé permettant aux agents d'accéder aux données de l'entreprise à travers le *data lakehouse*, avec application automatique des politiques d'accès et de confidentialité.

**Le patron d'appel d'outil.** Un cadre uniforme pour l'invocation d'outils externes — *API* internes, services tiers, fonctions de calcul — avec gestion des erreurs, des délais d'attente et des reprises.

**Le patron de mémoire partagée.** Un mécanisme permettant aux agents de partager du contexte et des résultats intermédiaires, essentiel pour les flux de travail multi-agents.

**Le patron de supervision humaine (*human-in-the-loop*).** Un mécanisme standardisé d'escalade vers un opérateur humain lorsque l'agent atteint les limites de son périmètre de confiance ou de sa compétence.

> **En pratique — Architecture agentique dans une institution financière**
>
> Une grande institution financière nord-américaine a déployé une plateforme agentique pour automatiser ses processus de conformité réglementaire. L'architecture repose sur trois couches : une couche d'orchestration centralisée (utilisant le patron orchestrateur-travailleurs), une couche de services partagés (identité, journalisation, politiques d'accès) et une couche d'agents spécialisés (agent de vérification documentaire, agent de détection d'anomalies, agent de rédaction de rapports). Chaque agent possède une identité numérique distincte, des droits d'accès limités à son domaine fonctionnel, et produit des pistes d'audit complètes. Le patron de supervision humaine intervient systématiquement avant toute action à impact financier ou réglementaire. Cette architecture a permis de réduire le temps de traitement des vérifications de conformité de 40 %, tout en améliorant la traçabilité — un résultat aligné avec les réductions de temps de cycle de 20 à 40 % documentées par GlobalLogic pour des flux de travail ciblés [17]. L'architecte d'entreprise a joué le rôle central dans la conception de cette plateforme, en s'assurant que les patrons d'intégration étaient réutilisables pour d'autres domaines fonctionnels de l'institution.

---

#### 7.4 L'*Enterprise AI Fabric* : une fondation gouvernée et réutilisable pour faire circuler l'intelligence à travers l'organisation

##### Du concept à l'architecture

Le concept d'*Enterprise AI Fabric* (tissu d'IA d'entreprise) émerge comme un paradigme architectural qui dépasse les plateformes d'IA isolées pour proposer une infrastructure connective, gouvernée et réutilisable permettant à l'intelligence de circuler à travers l'organisation comme l'électricité circule dans un bâtiment [18]. Ce concept répond à un constat : les organisations qui déploient l'IA en silos — une plateforme *MLOps* pour l'équipe de données, un outil *LLMOps* pour l'équipe d'innovation, des agents IA ponctuels pour les métiers — reproduisent les erreurs de l'ère pré-intégration des systèmes d'information.

GlobalLogic définit le *tissu agentique d'IA* comme « un environnement d'exécution fournissant une mémoire partagée, l'application de politiques et l'interopérabilité permettant à des agents spécialisés de collaborer de manière autonome à l'intérieur de frontières de politiques définies » [17]. Cette définition souligne que le *fabric* n'est pas un produit : c'est un patron d'architecture qui intègre l'orchestration, l'intégration, la gouvernance, l'observabilité et la réutilisation à l'échelle de l'entreprise.

##### Les composants du *fabric*

L'architecture d'un *Enterprise AI Fabric* repose sur cinq composants structurels que l'architecte d'entreprise doit concevoir et intégrer :

**Le tissu de connaissances unifié (*Unified Knowledge Fabric*).** Un système de connaissances dynamique de l'entreprise avec des relations multi-sauts, qui dépasse les simples bases de données pour devenir un graphe de connaissances vivant intégrant données structurées, documents, ontologies métier et contexte organisationnel [17]. Ce composant alimente les mécanismes de RAG et fournit aux agents le contexte nécessaire pour des réponses pertinentes.

**Les garde-fous comme code (*Guardrails as Code*).** Les politiques de gouvernance — accès aux données, limites d'autonomie des agents, règles de conformité — sont codifiées et appliquées en temps réel à travers l'ensemble des exécutions [17]. Cette approche garantit que la gouvernance n'est pas un processus manuel post-déploiement, mais un composant intégré de l'exécution.

**La boucle de valeur adaptative (*Adaptive Value Loop*).** Le système opère à travers un cycle continu en quatre phases : détecter (ingestion de données multi-domaines depuis les *API*, les capteurs IoT et la télémétrie), décider (raisonnement hybride combinant approches génératives, formelles et symboliques), agir et apprendre (exécution gouvernée par les politiques avec boucles de rétroaction continues), et améliorer (les résultats alimentent la base de connaissances partagée) [17].

**L'interopérabilité stratégique.** L'équilibre entre l'optimisation native de la plateforme et la portabilité, évitant l'enfermement technologique (*vendor lock-in*) tout en tirant parti des capacités spécifiques des fournisseurs [17]. Bain & Company recommande l'adoption de protocoles cohérents comme le *Model Context Protocol* (MCP) pour éliminer les silos entre les différents cadres d'agents [12].

**L'observabilité par défaut.** Une télémétrie unifiée à travers toutes les interactions des agents, intégrée dès la conception plutôt qu'ajoutée après coup [17].

[Figure 7.2 — Architecture conceptuelle de l'*Enterprise AI Fabric*]

```
┌─────────────────────────────────────────────────────────────────────┐
│                    ENTERPRISE AI FABRIC                              │
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐    │
│  │              GARDE-FOUS COMME CODE                          │    │
│  │     Politiques │ Conformité │ Limites d'autonomie           │    │
│  └─────────────────────────────────────────────────────────────┘    │
│                                                                      │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────────────┐   │
│  │ DÉTECTER │─►│ DÉCIDER  │─►│  AGIR &  │─►│    AMÉLIORER     │   │
│  │          │  │          │  │ APPRENDRE │  │                  │   │
│  │ API, IoT │  │Raisonne- │  │ Exécution│  │ Enrichissement   │   │
│  │Télémétrie│  │ment      │  │ gouvernée│  │ base de          │   │
│  │          │  │hybride   │  │          │  │ connaissances    │   │
│  └──────────┘  └──────────┘  └──────────┘  └────────┬─────────┘   │
│                                                       │             │
│  ┌────────────────────────────────────────────────────▼──────────┐  │
│  │              TISSU DE CONNAISSANCES UNIFIÉ                    │  │
│  │  Graphe de connaissances │ Ontologies │ Données │ Documents   │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │              OBSERVABILITÉ PAR DÉFAUT                         │   │
│  │  Traces │ Métriques │ Journaux │ Évaluation continue         │   │
│  └──────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────┘
```

*La figure illustre l'architecture conceptuelle de l'Enterprise AI Fabric. Les garde-fous comme code enveloppent l'ensemble du système. La boucle de valeur adaptative (détecter, décider, agir, améliorer) opère sur le tissu de connaissances unifié. L'observabilité par défaut traverse toutes les couches.*

##### Le rôle de l'architecte d'entreprise dans le *fabric*

L'architecte d'entreprise est le concepteur naturel de l'*Enterprise AI Fabric* pour trois raisons structurelles.

Premièrement, le *fabric* est par nature transversal : il traverse les domaines métier, les couches technologiques et les frontières organisationnelles. Seul l'architecte d'entreprise possède la vision systémique nécessaire pour concevoir cette transversalité.

Deuxièmement, le *fabric* exige un équilibre entre standardisation et flexibilité — exactement le type d'arbitrage que l'architecte d'entreprise pratique depuis des décennies dans la gouvernance des systèmes d'information.

Troisièmement, le *fabric* doit évoluer dans le temps sans rupture de continuité. L'architecte d'entreprise, habitué aux feuilles de route de transformation pluriannuelles, possède la méthodologie pour planifier cette évolution.

Les résultats mesurables des déploiements précoces sont encourageants : GlobalLogic documente des réductions de temps de cycle de 20 à 40 % dans les flux de travail ciblés et des réductions de coûts de 10 à 15 % dans les domaines opérationnels, avec 1 à 2 flux de travail structurés comme produits internes réutilisables [17].

---

#### 7.5 *Composable AI Architecture* : systèmes modulaires, *feature stores*, microservices, interfaces standardisées

##### Le principe de composabilité appliqué à l'IA

L'architecture IA composable (*Composable AI Architecture*) transpose à l'intelligence artificielle le principe de composabilité qui a transformé le développement logiciel avec les microservices : construire des systèmes à partir de composants modulaires, indépendants et réutilisables, assemblés dynamiquement pour répondre à des besoins métier spécifiques. Selon Tribe AI, les agents composables représentent « la révolution des microservices, mais pour l'IA » — des composants d'IA spécialisés travaillant ensemble [19].

Quatre facteurs rendent cette approche composable possible et nécessaire en 2025-2026 [19] :

**L'économie des modèles spécialisés.** Les modèles spécialisés s'avèrent plus rentables que l'exécution de grands modèles pour toutes les tâches. L'architecte d'entreprise doit concevoir des architectures qui permettent le routage intelligent entre modèles de tailles et de spécialisations différentes.

**Les places de marché d'agents.** Des écosystèmes émergents permettent aux développeurs de publier et de monétiser des agents spécialisés, créant une dynamique de plateforme.

**La maturité de l'utilisation d'outils.** Des cadres améliorés permettent aux agents d'exploiter des *API* externes de manière fiable.

**Les capacités multimodales.** Les modèles traitant texte, images, audio et vidéo nécessitent des systèmes d'orchestration sophistiqués.

Selon Gartner, d'ici 2026, les organisations adoptant des architectures composables surpasseront leurs concurrents de 80 % en vitesse d'implémentation de nouvelles fonctionnalités [20]. L'adoption sectorielle des architectures d'agents composables s'accélère : le commerce électronique et la vente au détail mènent avec 58 % de taux d'implémentation, suivis des services financiers (49 %), de la fabrication (44 %) et de la santé (37 %) [10].

##### Les *feature stores* : l'entrepôt de caractéristiques

Les *feature stores* (entrepôts de caractéristiques) constituent un composant central de l'architecture IA composable. Ils fournissent un registre centralisé de variables d'entrée (*features*) calculées, versionnées et partagées entre les modèles. En 2025-2026, les *feature stores* et les intégrations avec les *data lakes*/*lakehouses* sont devenus une infrastructure standard [9].

L'architecte d'entreprise doit positionner le *feature store* comme un service partagé de l'architecture de données, au même titre que le MDM ou le bus d'intégration. Cette position stratégique garantit que les caractéristiques calculées pour un modèle peuvent être réutilisées par d'autres modèles, évitant la duplication des pipelines de transformation et assurant la cohérence des données entre les modèles.

##### Les microservices IA et les interfaces standardisées

L'architecture IA composable repose sur des microservices IA — des services autonomes encapsulant une capacité d'IA spécifique (classification, extraction d'entités, génération de texte, détection d'anomalies) — exposés via des interfaces standardisées. Chaque microservice IA possède son propre cycle de vie de déploiement, sa propre politique de mise à l'échelle et ses propres métriques de performance.

L'architecte d'entreprise doit définir les standards d'interface qui permettent l'interchangeabilité des composants :

**Les contrats d'*API*.** Des spécifications OpenAPI ou gRPC qui définissent les entrées, les sorties, les codes d'erreur et les niveaux de service de chaque microservice IA.

**Les schémas de données.** Des formats de données partagés — en particulier pour les représentations vectorielles (*embeddings*) et les métadonnées de modèles — qui permettent l'assemblage de composants hétérogènes.

**Les protocoles de découverte.** Des mécanismes de registre de services qui permettent aux orchestrateurs de découvrir et d'invoquer dynamiquement les microservices IA disponibles.

[Tableau 7.2 — Comparaison des cadres d'orchestration pour l'architecture IA composable]

| Cadre | Approche | Forces | Défi principal |
|---|---|---|---|
| LangGraph | Graphes acycliques dirigés (DAG) avec schémas d'état | Suivi d'état granulaire, intégration LangSmith | Gestion d'état complexe pour les graphes volumineux |
| AutoGen (Microsoft) | Collaboration conversationnelle entre agents | Flexibilité, négociation entre agents | Prévisibilité des résultats |
| CrewAI | Rôles humains explicites, exécution séquentielle/parallèle | Approche la plus « inspirée de l'humain » | Rigidité des rôles |

*Source : Synthèse des auteurs à partir de [19]*

##### Quand ne pas composer

L'architecte d'entreprise doit également savoir quand la composabilité n'est pas la bonne réponse. Tribe AI met en garde : les tâches simples de questions-réponses, les tâches de récupération et les pipelines RAG basiques « restent mieux servis par des chaînes monolithiques — plus rapides, moins coûteuses et plus faciles à déboguer » [19]. Le principe de simplicité — commencer par la solution la plus simple et efficace, en ajoutant de la complexité uniquement lorsqu'une valeur métier claire justifie la charge opérationnelle et le risque supplémentaires [14] — doit guider les décisions de l'architecte.

---

#### 7.6 Le modèle « *AI Factory* » : de l'artisanat IA à la production industrialisée

##### Le constat de l'artisanat

La majorité des organisations pratiquent encore l'IA de manière artisanale : chaque projet développe ses propres pipelines de données, ses propres environnements de calcul, ses propres processus d'évaluation et de déploiement. Cette approche, acceptable pour quelques projets pilotes, devient un obstacle majeur à la mise à l'échelle. CDO Magazine documente la transformation d'une approche « atelier d'IA » (*AI workshop*) — où chaque solution est conçue individuellement — vers un modèle « usine d'IA » (*AI factory*) mettant l'accent sur les composants réutilisables et l'infrastructure partagée [21].

La métaphore de l'usine est éclairante : dans un atelier artisanal, chaque pièce est unique; dans une usine, les processus sont standardisés, les composants sont interchangeables et la qualité est contrôlée systématiquement. Pour l'IA, cette industrialisation signifie la standardisation des pipelines de données, la réutilisation des composants algorithmiques, la centralisation de la surveillance et de la gouvernance, et l'accélération des cycles de développement grâce aux patrons éprouvés.

##### Les cinq piliers de la transformation vers l'*AI Factory*

CDO Magazine identifie cinq piliers qui structurent cette transformation [21] :

**La conception modulaire.** Construire les capacités IA avec la réutilisation en tête dès l'inception. Chaque composant — pipeline de données, modèle, mécanisme d'évaluation — est conçu pour être réutilisable dans d'autres contextes.

**La reconnaissance de patrons.** Identifier les problèmes communs résolubles par des algorithmes similaires, permettant de capitaliser sur les solutions existantes plutôt que de réinventer chaque solution.

**La mise à l'échelle efficace.** Réduire le temps de développement des preuves de concept grâce à la réutilisation du code et des pipelines. Les données documentées sont éloquentes : le système VROOM (optimisation d'itinéraires de véhicules) a été développé en « la moitié du temps » comparé à la solution initiale qui avait requis 6 à 9 mois [21].

**Les opérations standardisées.** Centraliser la surveillance, la gouvernance et les cadres de soutien pour l'ensemble des modèles en production.

**L'accélération des cas d'usage futurs.** Les succès précédents servent de modèles (*blueprints*) pour les nouvelles initiatives, créant un effet de volant d'inertie (*flywheel*).

Comme le résume CDO Magazine : « La transformation de l'atelier vers l'usine ne consiste pas seulement à faire les choses plus vite — il s'agit de changer fondamentalement la manière dont nous abordons le développement de l'IA pour créer des solutions durables et évolutives » [21].

##### L'approche McKinsey : QuantumBlack et l'industrialisation

McKinsey, à travers sa division QuantumBlack, a formalisé cette approche industrielle en quatre objectifs : des données propres, organisées et précises à travers les sources internes et externes; des modèles IA évolutifs et reproductibles qui se construisent les uns sur les autres; une approche de type usine pour le développement et la surveillance des modèles; et une transparence de la performance qui permet des décisions rapides et fiables [22].

La suite QuantumBlack Horizon illustre cette industrialisation avec deux composants clés : Brix, un référentiel propriétaire conçu pour organiser les pipelines de code et favoriser la réutilisabilité, et ML Run, qui fournit l'orchestration de pipelines, l'intégration et le déploiement continus, l'automatisation sans serveur et un *feature store* intégré [22]. McKinsey souligne que la construction de technologies évolutives nécessite « une dorsale informatique conçue pour l'interopérabilité et un développement d'applications qui met l'accent sur les capacités réutilisables, avec une architecture minimale viable basée sur des produits de données communs, des interfaces ouvertes et des pipelines de grade industriel » [22].

##### Le rôle de l'architecte d'entreprise dans l'*AI Factory*

L'architecte d'entreprise est le concepteur de l'*AI Factory*. Son rôle ne consiste pas à développer les modèles — c'est la responsabilité des équipes de *data science* — mais à concevoir l'usine elle-même : les processus standardisés, les interfaces réutilisables, les mécanismes de gouvernance et les flux de production qui permettent la création industrielle de capacités IA.

Ce rôle implique trois responsabilités spécifiques :

**La conception de l'architecture de production.** Définir les standards de packaging, de déploiement et de surveillance des modèles qui permettent de passer du prototype à la production de manière systématique et reproductible.

**La gouvernance du catalogue de capacités.** Maintenir un catalogue des capacités IA réutilisables — modèles, pipelines, *features*, patrons — qui évite la duplication des efforts et accélère les nouveaux développements.

**L'optimisation des flux de production.** Mesurer et améliorer les métriques de l'usine — temps de cycle, taux de réutilisation, coût par modèle en production — de la même manière qu'un responsable de production mesure l'efficacité d'une chaîne de fabrication.

Les résultats mesurables de cette approche sont significatifs : CDO Magazine documente une réduction de distance pouvant atteindre 10 % sur environ 2 500 magasins Kroger grâce au traitement dynamique par lots, et une réduction de distance de livraison centre de distribution vers magasin pouvant atteindre 8 % grâce au système VROOM [21].

---

#### 7.7 Gouvernance technique intégrée : explicabilité, conformité, gestion des modèles tiers

##### La gouvernance technique comme composant architectural

La gouvernance technique de l'IA n'est pas une activité périphérique : c'est un composant intégré de l'architecture *AI-first*. Selon Wiz, d'ici 2026, la moitié des gouvernements du monde s'attendent à ce que les entreprises se conforment à des lois, des réglementations et des exigences de confidentialité des données garantissant l'utilisation sûre et responsable de l'IA [23]. En 2024 seulement, les agences fédérales américaines ont introduit 59 réglementations liées à l'IA, soit plus du double de l'année précédente, tandis que les mentions législatives de l'IA ont augmenté dans 75 pays [23].

L'architecte d'entreprise doit concevoir la gouvernance technique non pas comme une couche de contrôle superposée, mais comme une propriété émergente de l'architecture elle-même — ce que les praticiens appellent la « gouvernance par conception » (*governance by design*). Le cadre d'architecture agentique d'InfoQ confirme cette approche : les organisations qui déploient des systèmes agentiques avec succès priorisent les « fondations de gouvernance » avant d'étendre les capacités autonomes [14].

##### L'explicabilité (*explainability*) : rendre l'IA compréhensible

L'explicabilité des systèmes d'IA — la capacité de comprendre et de communiquer les raisons d'une décision ou d'une production — est à la fois une exigence réglementaire et un prérequis de confiance. Le *EU AI Act* impose des exigences d'explicabilité pour les systèmes d'IA à haut risque, avec des amendes pouvant atteindre 35 millions d'euros ou 7 % du chiffre d'affaires mondial annuel en cas de non-conformité [23].

L'architecte d'entreprise doit intégrer l'explicabilité dans l'architecture à trois niveaux :

**L'explicabilité du modèle.** Les techniques comme SHAP (*SHapley Additive exPlanations*) et LIME (*Local Interpretable Model-agnostic Explanations*) permettent d'expliquer les décisions individuelles des modèles. L'architecture doit prévoir les ressources de calcul et les *API* nécessaires pour générer ces explications à la demande.

**L'explicabilité du processus.** Pour les systèmes multi-agents, l'explicabilité va au-delà du modèle individuel : elle doit couvrir la chaîne de raisonnement complète — quel agent a fait quoi, avec quelles données, dans quel ordre, et pourquoi. Le cadre d'InfoQ souligne que « l'explicabilité et la surveillance continue comptent davantage que la performance brute dans l'adoption d'entreprise » [14].

**L'explicabilité métier.** Les explications techniques (scores SHAP, poids d'attention) doivent être traduites en explications compréhensibles par les parties prenantes métier et les régulateurs. L'architecture doit prévoir des couches de traduction qui transforment les explications techniques en narratifs accessibles.

##### La conformité réglementaire intégrée

Le cadre réglementaire de l'IA se structure autour de plusieurs instruments : le *EU AI Act* avec sa classification par niveaux de risque (minimal, limité, élevé, inacceptable), le *NIST AI Risk Management Framework* avec ses quatre fonctions (gouverner, cartographier, mesurer, gérer), et les réglementations sectorielles spécifiques (services financiers, santé, ressources humaines).

L'architecte d'entreprise doit concevoir une architecture de conformité qui :

**Classifie automatiquement les systèmes IA.** Un registre centralisé de tous les systèmes d'IA en production, avec leur classification de risque selon le *EU AI Act* et les réglementations sectorielles applicables. L'utilisation d'un *AI-BOM* (*AI Bill of Materials*) — un inventaire de tous les modèles, jeux de données, outils et services tiers — permet de suivre quels systèmes IA existent, d'où proviennent les données et comment les composants interagissent [23].

**Applique les contrôles proportionnels au risque.** Les systèmes à haut risque sont soumis à des tests de biais complets, une documentation technique exhaustive et une supervision humaine dans la boucle. Les systèmes à risque limité bénéficient de contrôles allégés.

**Génère la documentation réglementaire.** L'architecture doit automatiser la production des artefacts de conformité — fiches techniques de modèles (*model cards*), analyses d'impact (*impact assessments*), registres de traitement — plutôt que de compter sur la production manuelle.

##### La gestion des modèles tiers

L'une des spécificités de l'ère des LLM est la dépendance aux modèles tiers — modèles de fondation fournis par des fournisseurs externes (OpenAI, Anthropic, Google, Meta) qui sont intégrés dans les systèmes de l'organisation sans que celle-ci maîtrise leur fonctionnement interne. Cette dépendance crée des risques architecturaux spécifiques que l'architecte d'entreprise doit adresser.

**Le risque de modification unilatérale.** Les fournisseurs de modèles peuvent modifier le comportement de leurs modèles sans préavis, impactant les systèmes qui en dépendent. L'architecture doit prévoir des couches d'abstraction qui isolent les systèmes métier des changements de modèles sous-jacents.

**Le risque de disponibilité.** La dépendance à un modèle tiers crée un point unique de défaillance. L'architecture doit prévoir des mécanismes de basculement (*fallback*) vers des modèles alternatifs — y compris des modèles hébergés localement — en cas d'indisponibilité du fournisseur principal.

**Le risque de confidentialité.** L'envoi de données d'entreprise à des *API* de modèles tiers soulève des questions de confidentialité et de conformité. L'architecture doit prévoir des mécanismes de filtrage (*data masking*), d'anonymisation et de routage qui dirigent les données sensibles vers des modèles hébergés localement tout en permettant l'utilisation de modèles tiers pour les données non sensibles.

**Le risque de coût.** Les coûts d'inférence des modèles tiers peuvent croître de manière imprévisible avec l'augmentation des volumes. L'architecture doit intégrer des mécanismes de surveillance des coûts, de mise en cache sémantique et de routage intelligent qui optimisent le rapport coût-performance.

Les plateformes de gouvernance de l'IA répondent à ces défis en fournissant trois fonctions essentielles de gestion du cycle de vie des modèles : développement et déploiement, surveillance et maintenance, et retrait et archivage, assurant une protection de bout en bout de l'intégrité des modèles [24]. L'architecte d'entreprise doit s'assurer que ces fonctions sont intégrées dans la plateforme d'IA de l'organisation.

[Figure 7.3 — Architecture de gouvernance technique intégrée pour l'IA]

```
┌─────────────────────────────────────────────────────────────────────┐
│                  GOUVERNANCE TECHNIQUE INTÉGRÉE                      │
│                                                                      │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐  │
│  │   EXPLICABILITÉ   │  │   CONFORMITÉ     │  │ GESTION MODÈLES  │  │
│  │                   │  │                   │  │    TIERS          │  │
│  │ • SHAP / LIME     │  │ • Classification  │  │ • Abstraction     │  │
│  │ • Chaînes de      │  │   des risques     │  │ • Basculement     │  │
│  │   raisonnement    │  │ • AI-BOM          │  │ • Filtrage        │  │
│  │ • Traduction      │  │ • Documentation   │  │ • Surveillance    │  │
│  │   métier          │  │   automatisée     │  │   des coûts       │  │
│  └────────┬─────────┘  └────────┬─────────┘  └────────┬─────────┘  │
│           │                      │                      │            │
│  ┌────────▼──────────────────────▼──────────────────────▼─────────┐ │
│  │                    REGISTRE CENTRALISÉ                          │ │
│  │  Inventaire des modèles │ Métadonnées │ Métriques │ Politiques │ │
│  └────────────────────────────────────────────────────────────────┘ │
│                                                                      │
│  ┌────────────────────────────────────────────────────────────────┐  │
│  │              CADRES DE RÉFÉRENCE                                │  │
│  │  EU AI Act │ NIST AI RMF │ Réglementations sectorielles       │  │
│  └────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────┘
```

*La figure illustre l'architecture de gouvernance technique intégrée. Les trois piliers — explicabilité, conformité, gestion des modèles tiers — convergent vers un registre centralisé qui assure la traçabilité. Les cadres de référence réglementaires fournissent les exigences que l'architecture doit satisfaire.*

##### L'approche sectorielle de la gouvernance

La gouvernance technique ne peut être générique : elle doit être adaptée aux exigences sectorielles. Le cadre d'InfoQ identifie des approches spécifiques par secteur [14] :

**Services financiers.** Tests de biais complets et points de contrôle humain obligatoires en raison de la surveillance réglementaire. L'architecture doit prévoir des mécanismes de validation systématique avant chaque décision à impact financier.

**Santé.** Conformité PHI/FHIR et supervision clinique obligatoire. L'architecture doit intégrer des mécanismes de consentement patient et des pistes d'audit conformes aux réglementations sanitaires.

**Commerce de détail.** Validation de l'équité à travers les segments de clientèle. L'architecture doit surveiller les biais dans les recommandations et les prix dynamiques.

**Fabrication.** Intégration des protocoles de sécurité avec l'évaluation de l'impact sur la main-d'œuvre. L'architecture doit prévoir des mécanismes d'arrêt d'urgence pour les systèmes d'IA contrôlant des processus physiques.

---

#### Points clés à retenir

> **1. Les données sont le substrat non négociable de toute architecture *AI-first*.** La mauvaise qualité des données coûte en moyenne 12,9 millions de dollars par an aux organisations. L'architecte d'entreprise doit concevoir une architecture de données hybride combinant *data mesh* comme modèle opérationnel et *data lakehouse* comme fondation technique, avec un lignage automatisé et un MDM enrichi pour l'IA.
>
> **2. Les plateformes *MLOps*/*LLMOps* doivent être intégrées dans le système d'information existant.** L'architecte d'entreprise est responsable de cette intégration à travers trois paradigmes : *API*, événementiel et sécurité. Les *feature stores* et les intégrations *lakehouse* sont désormais une infrastructure standard.
>
> **3. L'architecture agentique est un enjeu de plateforme, pas d'agents individuels.** Gagner avec l'IA agentique consiste à construire une plateforme qui standardise l'orchestration, l'identité, la journalisation et les patrons d'intégration réutilisables. Les organisations ayant déployé jusqu'à 2 000 instances d'agents confirment que la productivité en production (~30 %) est significative mais inférieure aux tests en laboratoire (~90 %).
>
> **4. L'*Enterprise AI Fabric* est le patron d'architecture cible.** Il intègre l'orchestration, l'intégration, la gouvernance, l'observabilité et la réutilisation à l'échelle de l'entreprise. Les déploiements précoces documentent des réductions de temps de cycle de 20 à 40 % et des réductions de coûts de 10 à 15 %.
>
> **5. L'architecture IA composable surpasse les approches monolithiques en vitesse.** Gartner prévoit que les organisations adoptant des architectures composables surpasseront leurs concurrents de 80 % en vitesse d'implémentation. Cependant, le principe de simplicité doit guider : ne pas composer quand un pipeline simple suffit.
>
> **6. Le modèle *AI Factory* transforme l'approche de développement.** La réutilisation des composants peut réduire de moitié les temps de développement. L'architecte d'entreprise conçoit l'usine; les équipes de données produisent les modèles.
>
> **7. La gouvernance technique est un composant architectural, pas une activité périphérique.** D'ici 2026, la moitié des gouvernements du monde imposeront des exigences de conformité IA. L'architecture doit intégrer l'explicabilité, la conformité et la gestion des modèles tiers dès la conception. L'*AI-BOM* devient un outil essentiel de traçabilité.

---

#### Transition

Ce chapitre a posé les fondations techniques d'une architecture *AI-first* — des données gouvernées aux plateformes industrialisées, de l'orchestration agentique au *fabric* d'entreprise, de la composabilité modulaire à la gouvernance intégrée. L'architecte d'entreprise est le concepteur naturel de ces fondations, car elles exigent une vision transversale, un équilibre entre standardisation et flexibilité, et une capacité à planifier l'évolution sur le long terme.

Mais construire les fondations techniques ne suffit pas : il faut également gérer les risques que l'IA introduit dans l'organisation. Le chapitre 8 examine le rôle de l'architecte d'entreprise comme médiateur du risque IA — biais algorithmique, sécurité, conformité réglementaire, dette technique — et montre comment les fondations décrites dans ce chapitre fournissent les mécanismes nécessaires pour cette médiation. Si le présent chapitre a répondu à la question « Que doit construire l'architecte? », le chapitre 8 répond à la question « Comment l'architecte protège-t-il ce qu'il a construit? ».

---

#### Références

[1] Cloudera, « 2026 Predictions: The Architecture, Governance, and AI Trends Every Enterprise Must Prepare For », 2026. Disponible : https://www.cloudera.com/blog/business/2026-predictions-the-architecture-governance-and-ai-trends-every-enterprise-must-prepare-for.html

[2] A. Gupta, « Enterprise Architecture as a Dynamic Capability for Scalable and Sustainable Generative AI Adoption: Bridging Innovation and Governance in Large Organisations », arXiv:2505.06326, mai 2025. Disponible : https://arxiv.org/abs/2505.06326

[3] Gartner, « Master Data Management: Definition, Process, Framework and Template », 2025. Disponible : https://www.gartner.com/en/data-analytics/topics/master-data-management

[4] McKinsey, « The State of AI in 2025 », 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/

[5] Trigyn Technologies, « Data Engineering Trends 2026 for AI-Driven Enterprises », 2026. Disponible : https://www.trigyn.com/insights/data-engineering-trends-2026-building-foundation-ai-driven-enterprises

[6] Informatica, « Data Mesh for AI: Complete Guide to Modern Data Architecture », 2025. Disponible : https://www.informatica.com/resources/articles/ai-data-mesh.html

[7] Data Lakehouse Hub, « The 2025 & 2026 Ultimate Guide to the Data Lakehouse and the Data Lakehouse Ecosystem », 2025. Disponible : https://datalakehousehub.com/blog/2025-09-2026-guide-to-data-lakehouses/

[8] Future Market Insights, « Enterprise Data Observability Software Market: Global Market Analysis Report — 2035 », 2025. Disponible : https://www.futuremarketinsights.com/reports/enterprise-data-observability-software-market

[9] Neptune.ai, « MLOps Landscape in 2025: Top Tools and Platforms », 2025. Disponible : https://neptune.ai/blog/mlops-tools-platforms-landscape

[10] MDPI Information, « Composable AI Agents for Intelligent Automation in Multi-Domain Environments », vol. 16, no. 2, 2025. Disponible : https://eajournals.org/ejcsit/wp-content/uploads/sites/21/2025/06/Composable-AI-Agents.pdf

[11] SaM Solutions, « Enterprise LLM Architecture: Designing for Scale and Security », 2025. Disponible : https://sam-solutions.com/blog/enterprise-llm-architecture/

[12] Bain & Company, « Building the Foundation for Agentic AI: Technology Report 2025 », 2025. Disponible : https://www.bain.com/insights/building-the-foundation-for-agentic-ai-technology-report-2025/

[13] J. Wei, « Agentic AI Isn't About the Agents. It's About the Platform », CIO.com, 2025. Disponible : https://www.cio.com/article/4125864/agentic-ai-isnt-about-the-agents-its-about-the-platform.html

[14] InfoQ, « Agentic AI Architecture Framework », 2025. Disponible : https://www.infoq.com/articles/agentic-ai-architecture-framework/

[15] AI4Human, « 2026: The Year Agentic Architecture Gets the Operational Lift », Medium, décembre 2025. Disponible : https://medium.com/@aiforhuman/2026-the-year-agentic-architecture-gets-the-operational-lift-23faabadb5b7

[16] Salesforce Architects, « Enterprise Agentic Architecture and Design Patterns », 2025. Disponible : https://architect.salesforce.com/fundamentals/enterprise-agentic-architecture

[17] GlobalLogic, « Engineering the Agentic AI Fabric: A New Architecture for Enterprise Scale », 2025. Disponible : https://www.globallogic.com/insights/blogs/engineering-agentic-ai-fabric/

[18] R. Singh, « Why Enterprise AI Is Becoming a Fabric: From AI Agents to Services-as-Software », Medium, décembre 2025. Disponible : https://medium.com/@raktims2210/why-enterprise-ai-is-becoming-a-fabric-from-ai-agents-to-services-as-software-0fb9e1a4c53e

[19] Tribe AI, « Inside the Machine: How Composable Agents Are Rewiring AI Architecture in 2025 », 2025. Disponible : https://www.tribe.ai/applied-ai/inside-the-machine-how-composable-agents-are-rewiring-ai-architecture-in-2025

[20] Gartner, « Composable Architecture: Future-Proofing AI Expansion », cité dans TechTarget, 2025. Disponible : https://www.techtarget.com/searchdatacenter/tip/Composable-architecture-Future-proofing-AI-expansion

[21] CDO Magazine, « From AI Workshop to AI Factory: A Case Study in Reusable AI Capabilities », 2025. Disponible : https://www.cdomagazine.tech/opinion-analysis/from-ai-workshop-to-ai-factory-a-case-study-in-reusable-ai-capabilities

[22] McKinsey / QuantumBlack, « McKinsey Launches New Product Suite to Help Clients Scale AI », 2025. Disponible : https://www.mckinsey.com/about-us/new-at-mckinsey-blog/mckinsey-launches-its-new-product-suite-to-help-clients-scale-ai

[23] Wiz, « AI Compliance in 2026: Definition, Standards, and Frameworks », 2026. Disponible : https://www.wiz.io/academy/ai-security/ai-compliance

[24] Splunk, « The Best AI Governance Platforms in 2026 », 2026. Disponible : https://www.splunk.com/en_us/blog/learn/ai-governance-platforms.html

[25] BOC Group, « EA Outlook Trends 2025-2026 », 2025. Disponible : https://www.boc-group.com/en/blog/ea/ea-outlook-trends-2025/
