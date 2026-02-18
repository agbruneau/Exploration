### Chapitre 9 — Gouvernance IA et Shadow AI : le rôle pivot de l'architecte

<!-- Rôle argumentatif (PRD §3) : La gouvernance IA et la lutte contre le Shadow AI sont des territoires naturels de l'EA. -->

#### Introduction

Le chapitre 7 a établi les fondations architecturales nécessaires au déploiement de l'IA à l'échelle de l'organisation — architectures *AI-first*, plateformes de données, composabilité technique. Le chapitre 8 a démontré que l'architecte d'entreprise (AE) est le médiateur naturel du risque IA, capable de traduire les menaces techniques en décisions de gouvernance compréhensibles par les dirigeants. Ces deux chapitres convergent vers une question incontournable : comment gouverner efficacement l'IA dans une organisation où les employés adoptent massivement des outils d'intelligence artificielle sans attendre l'approbation formelle de la direction des systèmes d'information?

Le paradoxe est saisissant. D'un côté, 80 % des grandes organisations revendiquent des initiatives de gouvernance IA; de l'autre, moins de la moitié d'entre elles peuvent démontrer une maturité mesurable [1]. Simultanément, 78 % des employés utilisant l'IA au travail apportent leurs propres outils (*Bring Your Own AI*, BYOAI), souvent à l'insu de leur département informatique [2]. Ce double constat — une gouvernance déclarative qui masque un vide opérationnel, couplé à une adoption sauvage qui échappe au contrôle — dessine un territoire où l'architecte d'entreprise possède un avantage décisif. Sa vision transversale, sa maîtrise des cadres de référence et sa capacité à modéliser les interdépendances organisationnelles en font le professionnel le mieux positionné pour transformer la gouvernance IA d'un exercice de conformité en un levier d'innovation maîtrisée.

Ce chapitre examine successivement l'état des lieux de la gouvernance IA, ses piliers constitutifs, les modèles de maturité qui structurent sa progression, les cadres spécifiques à l'IA agentique, le rôle fondamental de la gouvernance des données, l'ampleur et les risques du *Shadow AI*, l'échec des approches d'interdiction, les stratégies de transformation du *Shadow AI* en innovation contrôlée, et enfin l'opérationnalisation concrète de la gouvernance dans les pipelines techniques.

---

#### 9.1 L'état des lieux : gouvernance déclarée contre maturité réelle

##### Le fossé entre l'ambition et la réalité

L'année 2025 marque un point d'inflexion dans la gouvernance de l'intelligence artificielle en entreprise. L'adoption de l'IA a connu une accélération sans précédent : selon les données consolidées par Gartner, 78 % des organisations utilisaient l'IA en 2024, contre 55 % en 2023 [3]. Pourtant, cette adoption rapide a systématiquement devancé la mise en place de cadres de gouvernance opérationnels. Une enquête Gartner de 2024 révèle que si 80 % des grandes organisations déclarent disposer d'initiatives de gouvernance IA, moins de la moitié peuvent démontrer une maturité mesurable dans l'application de ces cadres [1]. L'évaluation globale de maturité IA conduite par Trustible auprès de plus de 180 organisations confirme cette asymétrie : seulement 21 % des responsables de la gouvernance déclarent disposer des ressources, des outils et de l'expertise nécessaires pour atteindre leurs objectifs en matière d'IA [4].

Ce fossé entre gouvernance déclarée et maturité réelle se manifeste à plusieurs niveaux. Au niveau des politiques, les organisations possèdent des documents — chartes éthiques, politiques d'utilisation acceptable, principes directeurs — mais ces documents restent souvent déconnectés des processus opérationnels. Au niveau des contrôles techniques, les mécanismes de validation automatisée, de détection de biais et de surveillance de la dérive sont absents ou embryonnaires. Au niveau de la responsabilité, les rôles et les processus de décision en matière d'IA ne sont pas formalisés : personne n'est explicitement responsable de la conformité des modèles en production.

##### Les données qui révèlent l'écart

L'enquête PwC *Responsible AI Survey* (2025) apporte des données complémentaires qui quantifient cet écart. Seulement 11 % des organisations ont pleinement implanté les capacités fondamentales d'une IA responsable, alors que la quasi-totalité d'entre elles reconnaissent la nécessité d'une telle démarche [5]. Ce décalage entre la reconnaissance du besoin et la capacité d'exécution constitue précisément le terrain d'intervention de l'architecte d'entreprise.

Gartner observe que dans les organisations à haute maturité IA, près de 60 % des dirigeants ont centralisé leur stratégie IA, leur gouvernance, leurs données et leurs capacités d'infrastructure pour accroître la cohérence et l'efficacité [3]. Cette centralisation n'est pas un hasard : elle reflète la nécessité d'une vision transversale — celle que l'architecte d'entreprise est formé à fournir. À l'inverse, dans les organisations à faible maturité, seulement 20 % des initiatives IA restent en production plus de trois ans, contre 45 % dans les organisations matures [3]. L'absence de gouvernance opérationnelle n'est donc pas seulement un risque de conformité : c'est un facteur d'échec des investissements IA.

##### Le rôle de l'architecte dans la réduction de l'écart

L'architecte d'entreprise possède trois atouts structurels pour réduire cet écart. Premièrement, sa maîtrise des cadres méthodologiques (TOGAF, Zachman, ArchiMate) lui fournit une grammaire pour modéliser les politiques, les processus et les contrôles de gouvernance IA dans le langage de l'architecture d'entreprise. Deuxièmement, sa vision transversale lui permet d'identifier les interdépendances entre la gouvernance IA, la gouvernance des données, la sécurité de l'information et la conformité réglementaire — des interdépendances que les approches en silo ne perçoivent pas. Troisièmement, sa position à l'intersection du business et de la technologie lui permet de traduire les exigences de gouvernance en contrôles techniques sans perdre de vue les objectifs d'affaires.

---

#### 9.2 Les six piliers de la gouvernance IA

##### Un cadre structurant pour l'architecte

La gouvernance IA d'entreprise se définit comme « le cadre de politiques, de processus et de contrôles qui assure l'utilisation responsable, conforme et sécurisée de l'intelligence artificielle à travers l'organisation » [6]. Pour l'architecte d'entreprise, cette définition se décompose en six piliers interdépendants qui structurent l'ensemble du dispositif de gouvernance.

[Figure 9.1 — Les six piliers de la gouvernance IA et leurs interdépendances]

```
┌──────────────────────────────────────────────────────────────────┐
│                  GOUVERNANCE IA D'ENTREPRISE                      │
│                                                                    │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                        │
│  │    1.     │  │    2.     │  │    3.     │                       │
│  │POLITIQUES│◄►│ÉVALUATION │◄►│CONFORMITÉ │                       │
│  │          │  │ DES       │  │           │                        │
│  │ Chartes, │  │ RISQUES   │  │ EU AI Act,│                       │
│  │ normes,  │  │           │  │ RGPD,     │                       │
│  │ standards│  │ Biais,    │  │ ISO 42001 │                       │
│  │          │  │ sécurité, │  │           │                        │
│  │          │  │ fiabilité │  │           │                        │
│  └────┬─────┘  └─────┬────┘  └─────┬─────┘                       │
│       │              │              │                              │
│       ▼              ▼              ▼                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                        │
│  │    4.     │  │    5.     │  │    6.     │                       │
│  │CONTRÔLES │◄►│  ÉTHIQUE  │◄►│MONITORING │                       │
│  │TECHNIQUES│  │           │  │ CONTINU   │                        │
│  │          │  │ Équité,   │  │           │                        │
│  │ Accès,   │  │ transpa-  │  │ Dérive,   │                       │
│  │ DLP,     │  │ rence,    │  │ perfor-   │                       │
│  │ audit,   │  │ responsa- │  │ mance,    │                       │
│  │ validation│ │ bilité    │  │ incidents │                       │
│  └──────────┘  └──────────┘  └──────────┘                        │
│                                                                    │
│  L'architecte d'entreprise assure la cohérence transversale       │
│  entre les six piliers et leur intégration dans l'architecture    │
│  d'entreprise existante.                                          │
└──────────────────────────────────────────────────────────────────┘
```

*Les six piliers ne sont pas séquentiels mais interdépendants. Chaque pilier influence et contraint les autres. L'architecte d'entreprise est responsable de la cohérence de l'ensemble.*

##### Pilier 1 : Politiques et standards

Le premier pilier concerne l'établissement de politiques formelles qui définissent les règles d'utilisation de l'IA dans l'organisation. Ces politiques incluent les chartes d'utilisation acceptable, les standards de développement et de déploiement, les classifications des systèmes IA par niveau de risque et les processus d'approbation. L'architecte d'entreprise contribue à ce pilier en alignant les politiques IA sur l'architecture d'entreprise existante — en s'assurant que les classifications de risque IA sont cohérentes avec les classifications de données, que les processus d'approbation s'intègrent dans les processus de gouvernance technologique, et que les standards de développement IA sont compatibles avec les standards d'architecture applicatifs.

##### Pilier 2 : Évaluation des risques

Le deuxième pilier structure l'identification, l'analyse et la priorisation des risques spécifiques aux systèmes d'IA : biais algorithmique, hallucination, fuite de données, dérive des modèles, dépendance aux fournisseurs et vulnérabilités adversariales. Le cadre de gestion des risques de l'IA du NIST (*AI Risk Management Framework*) propose une structure en quatre fonctions — gouverner, cartographier, mesurer, gérer — que l'architecte d'entreprise peut adopter comme extension de ses pratiques existantes de gestion des risques [7]. L'architecte apporte ici sa capacité de modélisation systémique : il perçoit comment un risque dans un domaine — par exemple, une dégradation de la qualité des données — se propage en cascade à travers les couches de l'architecture.

##### Pilier 3 : Conformité réglementaire

Le troisième pilier intègre les exigences réglementaires dans les processus de gouvernance. L'*EU AI Act* (règlement européen sur l'intelligence artificielle), dont les dispositions relatives aux systèmes IA à haut risque entreront en application le 2 août 2026, impose des exigences de documentation, de traçabilité, de gestion de la qualité et de marquage CE pour les systèmes IA utilisés dans des domaines tels que l'emploi, le crédit, l'éducation et l'application de la loi [8]. Les sanctions pour non-conformité peuvent atteindre 35 millions d'euros ou 7 % du chiffre d'affaires annuel mondial pour les pratiques interdites [8]. L'architecte d'entreprise traduit ces exigences réglementaires en spécifications architecturales : quels systèmes doivent être classifiés à haut risque, quels mécanismes de traçabilité doivent être intégrés, quels processus de test et de validation doivent être automatisés.

##### Pilier 4 : Contrôles techniques

Le quatrième pilier concerne les mécanismes techniques qui implémentent les politiques de gouvernance. Cela inclut le contrôle d'accès basé sur les rôles (*Role-Based Access Control*, RBAC), les systèmes de prévention de la fuite de données (*Data Loss Prevention*, DLP), le filtrage des requêtes et des réponses, la journalisation exhaustive des interactions et la validation des modèles avant déploiement. L'architecte d'entreprise s'assure que ces contrôles sont intégrés dans l'architecture technique plutôt qu'ajoutés après coup — ce que le principe de *compliance by design* exige.

##### Pilier 5 : Éthique

Le cinquième pilier structure les principes éthiques qui guident l'utilisation de l'IA : équité, transparence, explicabilité, responsabilité et respect de la dignité humaine. La distinction entre éthique et gouvernance est importante : « l'éthique définit les valeurs (le pourquoi); la gouvernance les implémente (le comment) » [6]. L'architecte d'entreprise contribue à ce pilier en concevant les mécanismes architecturaux qui rendent les principes éthiques opérationnels — par exemple, les interfaces d'explicabilité qui permettent aux utilisateurs de comprendre les décisions de l'IA, ou les mécanismes de recours qui permettent de contester une décision algorithmique.

##### Pilier 6 : Monitoring continu

Le sixième pilier assure la surveillance permanente des systèmes IA en production. Il couvre la détection de la dérive des modèles (*model drift*), le suivi des métriques de performance, la détection des anomalies, la gestion des incidents et le rapport régulier aux instances de gouvernance. L'architecte d'entreprise conçoit l'architecture de surveillance — les flux de données de monitoring, les seuils d'alerte, les tableaux de bord, les processus d'escalade — et s'assure qu'elle s'intègre dans les pratiques de surveillance opérationnelle existantes de l'organisation.

---

#### 9.3 Le modèle de maturité en gouvernance IA : de la sensibilisation à la gouvernance autonome

##### Cinq niveaux de progression

La progression en matière de gouvernance IA suit un modèle de maturité en cinq niveaux qui permet aux organisations d'évaluer leur position actuelle et de planifier leur évolution. L'analyse croisée des cadres proposés par Dataversity, Liminal et les recherches de Gartner permet de proposer un modèle synthétique adapté au rôle de l'architecte d'entreprise [1] [6] [9].

[Tableau 9.1 — Modèle de maturité en gouvernance IA]

| Niveau | Désignation | Caractéristiques | Rôle de l'AE | Indicateurs clés |
|---|---|---|---|---|
| 1 | Ad hoc | Aucune politique formelle; initiatives isolées; gouvernance réactive | Sensibilisation de la direction; inventaire initial des usages IA | Nombre de systèmes IA inventoriés |
| 2 | Défini | Politiques documentées mais application inconsistante; rôles assignés | Formalisation des politiques dans l'architecture d'entreprise | Couverture des politiques; rôles formalisés |
| 3 | Opérationnalisé | Gouvernance intégrée dans les pipelines; automatisation partielle; lignage des données | Intégration des contrôles dans les architectures de référence | *Data Integrity Index*; taux d'automatisation des contrôles |
| 4 | Mesuré | Indicateurs clés de performance; tableaux de bord de conformité; audit systématique | Optimisation fondée sur les données; rapport au comité de direction | Temps de remédiation des biais; score de préparation à l'audit |
| 5 | Adaptatif | Boucles de rétroaction automatisées; conformité prédictive; gouvernance dynamique | Innovation en gouvernance; anticipation réglementaire | Temps de réponse aux changements réglementaires |

*Sources : Synthèse des auteurs à partir de [1], [6], [9]*

##### La progression typique

La progression d'un niveau à l'autre suit une trajectoire typique de 18 à 36 mois avec un investissement soutenu [6]. Les organisations qui investissent dans la gouvernance dès le début de leur parcours IA atteignent le niveau 3 (opérationnalisé) significativement plus rapidement que celles qui tentent de rattraper un retard de gouvernance après avoir déployé de nombreux systèmes IA en production.

L'architecte d'entreprise joue un rôle différent à chaque niveau de maturité. Aux niveaux 1 et 2, il agit principalement comme un évangéliste et un structurant, en sensibilisant la direction aux risques et en formalisant les premiers cadres. Aux niveaux 3 et 4, il devient un intégrateur technique, en s'assurant que les contrôles de gouvernance sont automatisés et intégrés dans les pipelines de développement et de déploiement. Au niveau 5, il devient un innovateur en gouvernance, en anticipant les évolutions réglementaires et technologiques et en concevant des architectures de gouvernance adaptatives.

##### Les trois dimensions de la maturité

Dataversity identifie trois dimensions fondamentales qui sous-tendent la maturité en gouvernance IA : les données, les processus et les personnes [9].

**La dimension données** concerne la qualité, le lignage, le consentement et la traçabilité des données qui alimentent les systèmes IA. Les organisations matures disposent de systèmes de gestion des métadonnées (*master data management*) qui vérifient le lignage et l'historique du consentement de chaque jeu de données.

**La dimension processus** concerne l'intégration des politiques dans les flux de travail opérationnels. Les organisations matures disposent de points de contrôle automatisés à chaque étape du cycle de vie de l'IA — développement, entraînement, validation, déploiement et surveillance.

**La dimension personnes** concerne les structures organisationnelles qui portent la gouvernance. Les organisations matures disposent de comités d'éthique IA, de conseils de supervision (*steward councils*) et de comités de validation composés de représentants des fonctions techniques, juridiques, business et éthiques [9].

L'architecte d'entreprise est le professionnel qui perçoit et modélise les interdépendances entre ces trois dimensions — comment une amélioration de la qualité des données (dimension données) nécessite de nouveaux processus de validation (dimension processus) qui exigent de nouvelles compétences (dimension personnes).

---

#### 9.4 Le cadre à trois niveaux pour l'IA agentique : Fondation, Workflow, Autonomie

##### La spécificité de la gouvernance agentique

L'émergence de l'IA agentique (*agentic AI*) — des systèmes d'IA capables de planifier, de prendre des décisions et d'exécuter des actions de manière autonome — pose des défis de gouvernance qualitativement différents de ceux de l'IA traditionnelle. Contrairement aux modèles prédictifs classiques ou aux systèmes de génération de texte, les agents IA interagissent directement avec les systèmes d'entreprise, exécutent des transactions, modifient des données et déclenchent des processus sans intervention humaine à chaque étape. Cette autonomie exige un cadre de gouvernance spécifique.

Le cadre architectural proposé par InfoQ structure le déploiement de l'IA agentique en trois niveaux progressifs où « la confiance, la gouvernance et la transparence précèdent l'autonomie » [10]. Ce cadre offre à l'architecte d'entreprise une feuille de route structurée pour introduire l'IA agentique dans l'organisation sans sacrifier le contrôle.

##### Niveau 1 : Fondation — Établir la confiance

Le premier niveau établit l'infrastructure essentielle de confiance et de gouvernance. Il comprend trois composantes architecturales fondamentales.

**L'orchestration des outils avec sécurité d'entreprise.** Des passerelles sécurisées entre les systèmes d'IA et les applications d'entreprise, incluant des permissions basées sur les rôles, la détection des entrées adversariales, la validation de la chaîne d'approvisionnement logicielle, des passerelles *API* avec authentification et détection de menaces, et des disjoncteurs (*circuit breakers*) pour prévenir les défaillances en cascade [10].

**La transparence du raisonnement avec évaluation continue.** Des processus de prise de décision auditables avec détection intégrée des biais, surveillance des hallucinations, scoring de confiance et évaluation automatisée de la qualité. Comme le souligne InfoQ, « l'explicabilité l'emporte systématiquement sur la performance brute » dans le contexte de l'adoption en entreprise [10].

**La gouvernance du cycle de vie des données avec garde-fous éthiques.** La classification des données, le chiffrement, la limitation de la finalité, la protection des informations personnelles identifiables (*PII*) et des informations de santé protégées (*PHI*), l'application automatisée des règles de rétention et la gestion du consentement [10].

##### Niveau 2 : Workflow — Implanter l'autonomie structurée

Le deuxième niveau délivre l'automatisation métier à travers des interactions IA orchestrées tout en préservant la supervision. Il s'appuie sur deux composantes essentielles.

**Les zones d'autonomie contrainte (*Constrained Autonomy Zones*).** Des périmètres opérationnels sécurisés avec des contraintes prédéfinies, des points de contrôle obligatoires pour la validation et la conformité, des procédures d'escalade automatisées et une expansion graduelle de l'autonomie fondée sur des résultats mesurés [10].

**Les cinq patterns d'orchestration.** Le chaînage de requêtes (*prompt chaining*) avec des portes de validation entre les composants; le routage (*routing*) qui classifie les entrées en utilisant des seuils de confiance; la parallélisation (*parallelization*) avec agrégation des résultats; l'évaluateur-optimiseur (*evaluator-optimizer*) avec détection de convergence et contrôle des coûts; l'orchestrateur-travailleurs (*orchestrator-workers*) avec planification dynamique et rééquilibrage de charge [10].

##### Niveau 3 : Autonomie — Habiliter l'intelligence dynamique

Le troisième niveau permet aux systèmes IA de déterminer leurs stratégies d'exécution en fonction d'objectifs, mais uniquement après que l'infrastructure des deux niveaux précédents est mature. Il comprend la planification orientée objectifs dans des limites éthiques, l'apprentissage adaptatif avec prévention des biais et la collaboration multi-agents avec résolution de conflits [10].

[Figure 9.2 — Le cadre à trois niveaux pour la gouvernance de l'IA agentique]

```
┌────────────────────────────────────────────────────────┐
│           NIVEAU 3 : AUTONOMIE                          │
│                                                          │
│   Planification orientée objectifs │ Apprentissage       │
│   adaptatif │ Collaboration multi-agents                 │
│                                                          │
│   Prérequis : Niveaux 1 et 2 matures                   │
│   Contrôle : Surveillance continue, escalade,           │
│              approbation réglementaire                   │
├────────────────────────────────────────────────────────┤
│           NIVEAU 2 : WORKFLOW                            │
│                                                          │
│   Zones d'autonomie contrainte │ 5 patterns              │
│   d'orchestration │ Monitoring en temps réel             │
│                                                          │
│   Prérequis : Niveau 1 opérationnel                     │
│   Contrôle : Points de validation obligatoires,         │
│              escalade automatisée                        │
├────────────────────────────────────────────────────────┤
│           NIVEAU 1 : FONDATION                           │
│                                                          │
│   Orchestration sécurisée │ Transparence du              │
│   raisonnement │ Gouvernance du cycle de vie             │
│   des données                                            │
│                                                          │
│   Contrôle : RBAC, journalisation, chiffrement,         │
│              détection des hallucinations                │
└────────────────────────────────────────────────────────┘
```

*Le cadre à trois niveaux est progressif : chaque niveau s'appuie sur les fondations du précédent. L'architecte d'entreprise orchestre la progression et s'assure que les prérequis de chaque niveau sont satisfaits avant l'expansion de l'autonomie.*

##### Le rôle de l'architecte dans la progression

L'architecte d'entreprise est le gardien de la progression entre les niveaux. Sa responsabilité est de s'assurer que l'organisation ne saute pas d'étapes — que les fondations de confiance et de transparence sont solides avant d'accorder l'autonomie. InfoQ confirme cette approche : « les organisations qui priorisent les fondations de gouvernance surpassent systématiquement celles qui poursuivent d'abord les capacités autonomes » [10]. L'architecte traduit cette exigence en critères d'évaluation concrets — métriques de confiance, taux de couverture des contrôles, résultats d'audit — qui conditionnent le passage d'un niveau à l'autre.

---

#### 9.5 La gouvernance des données comme colonne vertébrale

##### Les données au cœur de la gouvernance IA

Toute gouvernance IA repose in fine sur la gouvernance des données. Un modèle d'IA ne peut être plus fiable que les données qui l'alimentent, et la qualité de la gouvernance des données détermine la qualité de la gouvernance IA. Comme le souligne Cloudera dans ses prédictions pour 2026, « on ne peut pas mettre l'IA à l'échelle sans ré-architecturer les données qui la sous-tendent » [11]. Cette affirmation place la gouvernance des données au centre de la stratégie de gouvernance IA — et l'architecte d'entreprise, qui gère traditionnellement les architectures de données, au centre du dispositif.

##### Les quatre composantes de la gouvernance des données pour l'IA

**La qualité des données.** La qualité des données d'entraînement, de référence et de contexte conditionne directement la performance et la fiabilité des systèmes IA. Les organisations matures implémentent des vérifications continues de qualité qui détectent les problèmes en temps réel et déclenchent automatiquement des actions correctives, souvent dans le cadre de pratiques *DataOps* intégrées [11]. L'architecte d'entreprise définit les standards de qualité, les métriques de surveillance et les processus de remédiation dans l'architecture de données.

**Le lignage des données (*data lineage*).** Le lignage — la capacité de tracer l'origine, les transformations et l'utilisation de chaque jeu de données — est une exigence fondamentale de la gouvernance IA, tant pour la conformité réglementaire que pour le diagnostic des problèmes de performance. Comme le note Atlan, « chaque jeu de données — structuré, non structuré, en temps réel ou généré par un modèle — doit porter sa propre sémantique, son lignage et ses garde-fous » [12]. L'architecte d'entreprise conçoit l'architecture de métadonnées qui rend ce lignage possible à l'échelle de l'organisation.

**Le contrôle d'accès.** Les données qui alimentent les systèmes IA sont souvent parmi les plus sensibles de l'organisation — données clients, données financières, données de santé. L'architecture de contrôle d'accès doit assurer que seuls les systèmes et les utilisateurs autorisés peuvent accéder à chaque catégorie de données, avec une granularité adaptée au contexte IA (accès en lecture pour l'entraînement vs accès en temps réel pour l'inférence, par exemple).

**L'audit et la traçabilité.** La capacité de démontrer, à tout moment, qui a accédé à quelles données, pour quel usage, avec quel résultat, est une exigence tant réglementaire (RGPD, *EU AI Act*) que de bonne gestion. Les métadonnées constituent « la colonne vertébrale de l'automatisation de la gouvernance, fournissant le contexte essentiel — source, format, lignage, propriétaire, fréquence d'utilisation » [11].

##### La convergence données-IA-gouvernance

L'année 2026 marque la transition de l'expérimentation à l'orchestration de l'intelligence — un moment où « l'IA, les données, l'infrastructure et la gouvernance convergent dans un modèle opérationnel unique » [11]. Pour l'architecte d'entreprise, cette convergence signifie que la gouvernance des données et la gouvernance IA ne peuvent plus être traitées comme des disciplines séparées. L'architecture de gouvernance doit être unifiée, avec des politiques communes, des contrôles partagés et des plateformes intégrées.

---

#### 9.6 Shadow AI — L'ampleur du phénomène

##### La définition et l'échelle

Le *Shadow AI* (IA fantôme) désigne l'utilisation non autorisée d'outils, de modèles ou de services d'intelligence artificielle au sein d'une organisation sans l'approbation du département informatique ou de l'équipe de sécurité [13] [14]. Analogie directe du *Shadow IT* (informatique fantôme) qui a accompagné l'adoption du *cloud computing*, le *Shadow AI* en diffère sur un point fondamental : là où le *Shadow IT* déplaçait principalement des données, le *Shadow AI* prend des décisions autonomes, génère du contenu et influence des processus métier [13].

L'ampleur du phénomène est documentée par des données convergentes. Le *Microsoft Work Trend Index 2025*, fondé sur des enquêtes auprès de dizaines de milliers de travailleurs du savoir dans 31 pays, établit que 78 % des utilisateurs d'IA apportent leurs propres outils au travail (*BYOAI*), un taux qui atteint 80 % dans les petites et moyennes entreprises [2]. Plus révélateur encore, 52 % des personnes qui utilisent l'IA au travail sont réticentes à admettre qu'elles l'utilisent pour leurs tâches les plus importantes [2]. Sans directive claire de la direction, les employés prennent les choses en main et dissimulent leur utilisation de l'IA — créant un angle mort de gouvernance massif.

L'ISACA confirme cette dynamique en décrivant « la prolifération d'outils et d'applications IA non autorisés qui s'infiltrent dans les entreprises » sans que les responsables de la sécurité en soient conscients [15]. L'accessibilité des outils d'IA générative — ChatGPT, Gemini, Claude, Copilot dans leurs versions gratuites — combinée à des interfaces intuitives, a accéléré l'adoption à travers toutes les catégories de travailleurs, indépendamment de leur niveau technique.

##### Les facteurs d'accélération

Plusieurs facteurs expliquent l'accélération du *Shadow AI* au-delà de ce que le *Shadow IT* avait connu.

**La facilité d'accès.** Contrairement au *Shadow IT* traditionnel qui nécessitait souvent l'installation de logiciels ou la souscription de services *cloud*, le *Shadow AI* ne requiert qu'un navigateur web et une adresse courriel. La barrière d'entrée est quasi nulle.

**La pression de productivité.** Les travailleurs perçoivent — souvent à juste titre — que les outils d'IA améliorent leur productivité. Face à des objectifs de performance croissants et à des processus d'approbation lents, le contournement devient une réponse rationnelle à un besoin réel.

**L'absence de solutions approuvées.** Dans de nombreuses organisations, le département informatique n'a pas fourni d'alternatives approuvées aux outils d'IA publics. Les employés ne contournent pas la gouvernance par malveillance : ils répondent à un besoin que l'organisation n'a pas comblé.

**La normalisation culturelle.** L'utilisation personnelle massive de l'IA générative — pour la rédaction, la recherche, l'assistance créative — crée une normalisation qui s'étend naturellement à l'environnement professionnel. Les frontières entre usage personnel et usage professionnel s'estompent.

[Tableau 9.2 — Comparaison Shadow IT et Shadow AI]

| Dimension | Shadow IT | Shadow AI |
|---|---|---|
| Nature | Stockage et traitement de données | Prise de décision et génération de contenu |
| Risque principal | Fuite de données | Fuite de données + décisions non contrôlées |
| Détectabilité | Relativement élevée (flux réseau) | Faible (requêtes textuelles via navigateur) |
| Impact potentiel | Opérationnel | Opérationnel, stratégique, réputationnel |
| Vitesse de propagation | Mois | Jours |
| Barrière d'entrée | Moyenne (installation, abonnement) | Quasi nulle (navigateur web) |

*Source : Synthèse des auteurs à partir de [13], [14], [15]*

---

#### 9.7 Les risques concrets du Shadow AI

##### L'exposition des données

Le risque le plus immédiat du *Shadow AI* est l'exposition de données sensibles. Lorsqu'un employé saisit des données clients, des informations financières, du code propriétaire ou des documents stratégiques dans un outil d'IA public, ces données quittent le périmètre de contrôle de l'organisation. CIO.com alerte : « les informations sensibles entrent dans des outils d'IA publics ou tiers sans protection adéquate, risquant la perte permanente du contrôle organisationnel à travers la journalisation, la mise en cache ou le réentraînement des modèles » [13].

Harmonic Security, après avoir analysé 22 millions de requêtes d'IA d'entreprise en 2025, confirme l'ampleur de cette exposition. Les données sensibles — informations personnelles identifiables, données financières, code source, documents confidentiels — sont régulièrement introduites dans des outils d'IA non approuvés par des employés qui ne mesurent pas les implications de leurs actions [16].

##### Le coût financier documenté

Le rapport IBM *Cost of a Data Breach 2025*, fondé sur l'analyse de 600 organisations par le Ponemon Institute, quantifie le coût financier du *Shadow AI*. Les organisations présentant un niveau élevé de *Shadow AI* — où les travailleurs téléchargent ou utilisent des outils IA non approuvés basés sur Internet — ont subi un surcoût de 670 000 $ US par rapport au coût moyen d'une brèche de données [17]. Le *Shadow AI* a été un facteur dans 20 % des brèches étudiées, exposant des quantités importantes d'informations personnelles identifiables [17].

Plus alarmant encore, 97 % des organisations ayant subi un incident de sécurité lié à l'IA déclarent ne pas avoir disposé de contrôles d'accès IA adéquats [17]. Parmi les 600 organisations étudiées, 63 % révèlent ne disposer d'aucune politique de gouvernance IA pour gérer l'IA ou prévenir l'utilisation du *Shadow AI* [17]. Ces chiffres illustrent un déficit de gouvernance systémique, pas un problème isolé.

##### L'autonomie non surveillée

Au-delà de la fuite de données, le *Shadow AI* introduit un risque d'autonomie non contrôlée. Comme le souligne CIO.com, les agents IA « exécutent des tâches indépendantes — réponses clients, approbations de transactions, modifications de flux de travail — brouillant les frontières entre l'intention et la responsabilité » [13]. Lorsque ces agents opèrent en dehors du périmètre de gouvernance, l'organisation perd la capacité de retracer les décisions, d'identifier les erreurs et de corriger les dérives.

##### Les déficits d'auditabilité

Les systèmes génératifs utilisés en mode *Shadow AI* ne disposent typiquement ni d'historiques de requêtes, ni d'enregistrements de versions, éliminant les pistes de preuve nécessaires à la revue des décisions et à la conformité réglementaire [13]. Pour une organisation soumise aux exigences de l'*EU AI Act*, du RGPD ou de réglementations sectorielles (HIPAA dans le domaine de la santé, directives de l'OCC dans le secteur bancaire), cette absence de traçabilité constitue un risque juridique majeur.

> **En pratique — Le coût caché du Shadow AI dans une institution financière**
>
> Une institution financière nord-américaine de taille moyenne a découvert, lors d'un audit interne, que 34 % de ses analystes utilisaient des outils d'IA générative publics pour accélérer la rédaction de rapports de conformité. Les analystes copiaient des extraits de données clients — incluant des numéros de compte et des historiques de transactions — dans des interfaces d'IA gratuites pour générer des résumés et des analyses. L'audit a révélé trois problèmes critiques : (1) les données clients avaient transité par des serveurs hors juridiction, en violation des obligations réglementaires de résidence des données; (2) aucune piste d'audit ne permettait de retracer les requêtes soumises ni les réponses obtenues; (3) les rapports générés contenaient des formulations standardisées qui masquaient des erreurs factuelles. La direction a estimé le coût de remédiation — notification aux clients, revue des rapports, mise en conformité des processus — à 1,2 million de dollars canadiens. L'architecte d'entreprise, impliqué après la crise, a conçu un programme en trois phases : inventaire exhaustif des usages IA (4 semaines), déploiement d'une plateforme IA approuvée avec contrôles de DLP intégrés (8 semaines) et refonte du processus de rédaction des rapports avec validation automatisée (6 semaines).

---

#### 9.8 Pourquoi l'interdiction ne fonctionne pas : l'approche « gouverner plutôt que bloquer »

##### L'échec documenté des interdictions

Face à l'ampleur du *Shadow AI*, la réaction initiale de nombreuses organisations a été l'interdiction pure et simple. Selon les données disponibles, 27 % des organisations ont tenté d'interdire totalement l'utilisation de l'IA générative [18]. Le résultat est sans appel : dans ces mêmes organisations, 48 % des employés continuent de coller des données sensibles dans des outils d'IA non contrôlés [18]. L'interdiction n'élimine pas le *Shadow AI* — elle le rend invisible.

Quatre raisons structurelles expliquent cet échec.

**L'impossibilité technique de l'application.** Les outils d'IA générative sont accessibles via un simple navigateur web. Bloquer tous les points d'accès — navigateurs, applications mobiles, extensions, *API* publiques — est techniquement impraticable sans paralyser l'activité normale de l'organisation.

**La suppression de l'innovation.** L'interdiction envoie un message négatif qui décourage l'exploration légitime de l'IA et freine l'adoption des outils approuvés lorsqu'ils sont finalement déployés. Les organisations qui interdisent créent une culture de méfiance envers l'IA qui peut mettre des années à surmonter.

**Le ressentiment et la résistance.** Les employés qui perçoivent — souvent à raison — que l'IA améliore leur productivité développent une résistance active aux politiques d'interdiction. L'IA passe alors clandestinement, rendant toute gouvernance impossible.

**La perte de visibilité.** Paradoxalement, l'interdiction aggrave le problème qu'elle prétend résoudre. Lorsque l'utilisation de l'IA est officiellement interdite, les employés dissimulent leurs pratiques, éliminant toute possibilité de surveillance, de formation et d'amélioration.

##### L'approche « gouverner plutôt que bloquer »

Le consensus des experts en 2025 est clair : « cessez de traiter l'IA comme une menace à contenir et commencez à la traiter comme une capacité à gouverner » [18]. Les organisations qui réussissent ne prohibent pas l'IA : elles la guident en maintenant la visibilité, en fournissant des outils d'entreprise qui rivalisent avec les alternatives grand public, en utilisant des réponses graduées proportionnelles au risque et en mesurant le succès à travers la réduction des risques et les gains de productivité [18].

Cette approche repose sur un changement de paradigme fondamental : la gouvernance comme facilitateur d'innovation plutôt que comme frein. CIO.com recommande de cadrer la supervision de l'IA comme un « empowerment responsable » plutôt que comme une restriction : « célébrer l'expérimentation responsable, encourager la divulgation transparente sans punition, et intégrer la gestion des risques IA dans les cadres de cybersécurité, de protection des données et de conformité existants » [13].

L'architecte d'entreprise est l'artisan naturel de ce changement de paradigme. Sa formation le prépare à concevoir des cadres qui équilibrent le contrôle et la flexibilité — c'est exactement ce que TOGAF appelle la tension entre la gouvernance et l'agilité. Son expérience du *Shadow IT* des années 2010 lui fournit un précédent direct : les organisations qui ont réussi la transition vers le *cloud* n'ont pas interdit le *cloud* — elles ont fourni des plateformes *cloud* gouvernées qui étaient plus attractives que les alternatives sauvages.

---

#### 9.9 Transformer le Shadow AI en innovation maîtrisée

##### L'inventaire des actifs IA

La première étape de la transformation du *Shadow AI* en innovation maîtrisée est la visibilité. L'ISACA recommande d'établir un « inventaire de base de l'IA, où chaque modèle approuvé, chaque intégration et chaque *API* est catalogué avec sa finalité, sa classification de données et son propriétaire » [15]. Cet inventaire est l'équivalent IA du référentiel d'applications que l'architecte d'entreprise gère traditionnellement.

L'inventaire doit couvrir trois catégories d'actifs :

**Les actifs IA approuvés.** Les modèles, les services et les plateformes officiellement déployés et gouvernés par l'organisation. L'architecte documente leur architecture, leurs flux de données, leurs contrôles de sécurité et leurs propriétaires.

**Les actifs IA détectés.** Les outils et services d'IA utilisés sans approbation formelle, identifiés par les mécanismes de détection (CASB, surveillance des points d'accès, analyse du trafic réseau). L'architecte évalue chaque outil détecté et le classe dans un processus d'intégration ou d'interdiction motivée.

**Les actifs IA potentiels.** Les outils et services d'IA disponibles sur le marché qui répondent à des besoins identifiés dans l'organisation. L'architecte maintient une veille et un catalogue de solutions pré-évaluées.

Des plateformes spécialisées facilitent désormais cette détection. JFrog propose un outil de détection du *Shadow AI* qui inventorie automatiquement tous les modèles IA internes et les passerelles *API* externes utilisés dans les environnements de développement. Palo Alto Networks offre une solution de sécurité d'accès IA avec un catalogue de milliers d'applications d'IA générative, une classification des risques et des contrôles de politiques [19].

##### Les plateformes approuvées

La deuxième étape consiste à fournir des alternatives approuvées qui rivalisent avec les outils publics en termes d'expérience utilisateur tout en intégrant les contrôles de gouvernance. Le principe est simple : si la plateforme approuvée est plus performante, plus simple et plus fiable que l'outil public, les employés l'adopteront naturellement.

Liminal identifie les capacités essentielles d'une plateforme de gouvernance IA d'entreprise : le support multi-modèles, le contrôle d'accès basé sur les rôles avec authentification unique (*SSO*) et authentification multifacteur (*MFA*), la journalisation exhaustive des audits, un moteur d'application des politiques, l'intégration DLP et un tableau de bord d'analytique pour les administrateurs [6].

L'architecte d'entreprise conçoit l'architecture de ces plateformes et s'assure de leur intégration dans le paysage applicatif existant. Il définit les standards d'interopérabilité, les flux de données, les mécanismes d'authentification et les niveaux de service.

##### Le comité cross-fonctionnel

La troisième étape est la mise en place d'un comité de gouvernance IA cross-fonctionnel. L'ISACA recommande d'établir « des équipes composées de professionnels de l'informatique, du juridique et de la conformité, des ressources humaines et de la cybersécurité pour assurer l'utilisation efficace et la conformité aux protocoles IA » [15]. Ce comité constitue l'instance de décision pour les questions de gouvernance IA qui dépassent le périmètre d'une seule fonction.

L'architecte d'entreprise joue un rôle pivot dans ce comité : il traduit les préoccupations juridiques en exigences architecturales, les contraintes techniques en compromis business et les objectifs d'innovation en cadres de gouvernance. Son positionnement transversal, décrit aux chapitres 4 et 6, en fait le facilitateur naturel de la coordination interfonctionnelle.

##### Les patterns de détection et d'intégration

La quatrième étape consiste à établir des processus systématiques pour détecter le *Shadow AI* résiduel et intégrer les usages légitimes. CIO.com propose un ensemble de mécanismes complémentaires [13] :

**Déployer des *Cloud Access Security Brokers* (CASB)** pour identifier les points d'accès IA non autorisés dans le trafic réseau.

**Surveiller l'activité des points d'accès** pour détecter les appels *API* inhabituels liés aux services de modèles IA.

**Construire des processus de divulgation fondés sur la confiance** plutôt que sur la sanction, permettant aux employés de déclarer leurs usages IA sans craindre de représailles.

**Identifier les déviations comportementales** par rapport aux modèles de base dans la transmission de données et l'utilisation des *API*.

L'architecte d'entreprise intègre ces mécanismes dans l'architecture de sécurité de l'information existante, en s'assurant qu'ils ne créent pas de redondance avec les contrôles de sécurité déjà en place.

[Figure 9.3 — Processus de transformation du Shadow AI en innovation maîtrisée]

```
┌─────────────────────────────────────────────────────────┐
│      TRANSFORMATION DU SHADOW AI EN INNOVATION          │
│                                                          │
│  Phase 1           Phase 2           Phase 3             │
│  INVENTAIRE         ALTERNATIVES      INTÉGRATION         │
│  (4-6 semaines)    (8-12 semaines)   (continu)           │
│                                                          │
│  ┌──────────┐     ┌──────────┐     ┌──────────┐        │
│  │ Détection│     │Plateforme│     │ Comité   │         │
│  │ CASB,    │────►│ approuvée│────►│ cross-   │         │
│  │ réseau   │     │ déployée │     │fonctionnel│        │
│  └──────────┘     └──────────┘     └──────────┘        │
│       │                │                │                │
│  ┌──────────┐     ┌──────────┐     ┌──────────┐        │
│  │ Catalogue│     │ Formation│     │ Monitoring│        │
│  │ des      │────►│ et       │────►│ continu  │         │
│  │ usages   │     │ adoption │     │ et       │         │
│  └──────────┘     └──────────┘     │ améliora-│        │
│                                     │ tion     │         │
│                                     └──────────┘        │
│                                                          │
│  Boucle de rétroaction continue :                       │
│  Monitoring → Détection → Évaluation → Intégration      │
│  ou interdiction motivée → Formation → Monitoring       │
└─────────────────────────────────────────────────────────┘
```

*Le processus est itératif, pas séquentiel. Après le déploiement initial, une boucle continue de détection, d'évaluation et d'intégration maintient la gouvernance en phase avec l'évolution des usages.*

---

#### 9.10 Opérationnaliser la gouvernance : intégrer les politiques dans les pipelines

##### De la politique au code

Le niveau de maturité le plus élevé de la gouvernance IA se caractérise par l'intégration des politiques directement dans les pipelines de développement, de déploiement et de surveillance des systèmes IA. L'approche *policy-as-code* (politique comme code) traduit les règles de gouvernance en validations automatisées qui s'exécutent à chaque étape du cycle de vie de l'IA, sans intervention humaine à chaque transaction [20].

Les meilleures pratiques identifiées par les analyses de l'industrie en 2025 incluent l'ajout de portes de contrôle (*gates*) et de points de vérification (*checkpoints*) à chaque étape du cycle de vie *MLOps* : le développement nécessite une approbation de gouvernance; l'entraînement inclut des tests automatisés de biais et des validations de performance; le déploiement exige des vérifications de gouvernance; et la surveillance déclenche des alertes en cas de dérive et de comportements à risque [20].

Pour l'architecte d'entreprise, l'opérationnalisation de la gouvernance implique la conception de quatre couches d'automatisation intégrées dans l'architecture technique.

##### La validation automatisée pré-déploiement

La première couche automatise les validations qui conditionnent le déploiement d'un système IA en production. Ces validations incluent :

**La vérification de la conformité des données d'entraînement.** Contrôle automatisé du lignage, du consentement, de la classification de sensibilité et de la représentativité des jeux de données.

**La validation des métriques de performance.** Vérification que le modèle atteint les seuils de performance définis — précision, rappel, F1-score — sur les jeux de données de test, incluant des jeux de données représentatifs des sous-populations à risque de biais.

**La vérification de la documentation.** Contrôle que la documentation exigée par les politiques internes et les réglementations — carte de modèle (*model card*), évaluation d'impact, analyse de risques — est complète et à jour.

**La validation architecturale.** Vérification que le système IA s'intègre dans l'architecture de référence, respecte les standards de sécurité et utilise les composants approuvés (modèles, *API*, infrastructures).

##### La détection automatisée des biais

La deuxième couche intègre la détection des biais dans les pipelines de développement et de surveillance. Les organisations matures implémentent des tests de biais à trois moments du cycle de vie : avant l'entraînement (évaluation des données), après l'entraînement (évaluation du modèle) et en production (surveillance continue).

Dataversity propose un indicateur clé : le *Bias Remediation Time* — le temps entre la détection d'un biais et sa correction [9]. L'architecte d'entreprise intègre cet indicateur dans les tableaux de bord de gouvernance et définit les seuils d'alerte qui déclenchent les processus de remédiation.

##### Le monitoring de drift en production

La troisième couche assure la surveillance continue de la dérive des modèles en production. La dérive — le changement progressif des données d'entrée (*data drift*) ou de la relation entre les entrées et les sorties (*concept drift*) — est l'un des risques les plus insidieux des systèmes IA, car elle dégrade la performance de manière graduelle et souvent imperceptible.

L'architecte d'entreprise conçoit l'architecture de surveillance qui détecte la dérive en temps réel, en intégrant des systèmes de suivi des métadonnées et de la télémétrie qui identifient les changements de performance, de comportement ou de biais dans les systèmes IA [20]. Cette architecture inclut les flux de données de surveillance, les seuils d'alerte, les mécanismes d'escalade et les processus de remplacement de modèle (*model swap*) lorsque la dérive dépasse les tolérances définies.

##### Les tableaux de bord de gouvernance

La quatrième couche fournit la visibilité nécessaire aux instances de gouvernance. Liminal identifie les indicateurs clés de performance (*KPI*) d'une gouvernance IA opérationnelle : le taux d'adoption des outils IA approuvés, la fréquence des violations de politique (tendance décroissante attendue), le temps moyen de détection et de remédiation des incidents, le taux d'achèvement des formations, le score de préparation à la conformité réglementaire et le taux de remédiation des observations d'audit [6].

L'architecte d'entreprise conçoit l'architecture de données qui alimente ces tableaux de bord, en s'assurant que les métriques sont collectées automatiquement à partir des pipelines *MLOps*, des systèmes de surveillance et des plateformes de gouvernance.

[Tableau 9.3 — Matrice d'opérationnalisation de la gouvernance IA dans les pipelines]

| Étape du pipeline | Contrôle automatisé | Indicateur clé | Responsable |
|---|---|---|---|
| Développement | Approbation de gouvernance; validation des données | % de projets avec approbation formelle | Architecte + *data scientist* |
| Entraînement | Tests de biais automatisés; validation de performance | Couverture des tests de biais | Équipe MLOps |
| Déploiement | Vérification de conformité; validation architecturale | Temps de déploiement avec gouvernance | Architecte + DevOps |
| Production | Détection de dérive; monitoring de performance | *Bias Remediation Time*; taux de dérive | Équipe opérations IA |
| Décommissionnement | Archivage des artefacts; notification des parties prenantes | Conformité de la documentation d'archivage | Architecte |

*Source : Synthèse des auteurs à partir de [6], [9], [20]*

##### Le retour sur investissement de la gouvernance opérationnalisée

L'opérationnalisation de la gouvernance représente un investissement significatif — Liminal estime les coûts initiaux de mise en place à 0,5 % à 1 % du budget technologique IA, avec des coûts annuels récurrents de 0,3 % à 0,5 % [6]. Cependant, le retour sur investissement est substantiel : « la prévention d'un seul incident couvre typiquement de 10 à 100 fois l'investissement annuel en gouvernance » [6]. Lorsque l'on considère que le surcoût moyen d'une brèche liée au *Shadow AI* s'élève à 670 000 $ US [17], l'économie de la gouvernance opérationnalisée est défendable.

L'architecte d'entreprise est le professionnel le mieux positionné pour construire ce cas d'affaires de la gouvernance. Sa maîtrise de la modélisation financière (chapitre 6, section 6.3) et sa compréhension des risques architecturaux (chapitre 8) lui permettent de quantifier la valeur de la gouvernance en termes que le comité de direction comprend : coûts évités, risques atténués, conformité assurée.

---

#### Points clés à retenir

> **1. Le fossé entre gouvernance déclarée et maturité réelle est considérable.** 80 % des grandes organisations revendiquent des initiatives de gouvernance IA, mais moins de la moitié démontrent une maturité mesurable. Seulement 21 % des responsables de gouvernance disposent des ressources nécessaires. L'architecte d'entreprise est le professionnel le mieux positionné pour combler cet écart grâce à sa vision transversale et sa maîtrise des cadres méthodologiques.
>
> **2. La gouvernance IA repose sur six piliers interdépendants.** Politiques, évaluation des risques, conformité, contrôles techniques, éthique et monitoring continu forment un système dont l'architecte d'entreprise assure la cohérence. Aucun pilier ne peut être traité isolément sans compromettre l'ensemble.
>
> **3. L'IA agentique exige un cadre de gouvernance progressif à trois niveaux.** Le cadre Fondation-Workflow-Autonomie impose que la confiance, la transparence et les contrôles précèdent toute expansion de l'autonomie des agents IA. Les organisations qui priorisent les fondations surpassent celles qui poursuivent directement les capacités autonomes.
>
> **4. Le Shadow AI est massif et coûteux.** 78 % des utilisateurs d'IA apportent leurs propres outils au travail, 63 % des organisations n'ont aucune politique de gouvernance IA, et le surcoût moyen d'une brèche liée au Shadow AI s'élève à 670 000 $ US. L'interdiction est un échec documenté : 48 % des employés continuent d'utiliser l'IA malgré les interdictions.
>
> **5. La gouvernance doit être opérationnalisée dans les pipelines techniques.** La politique comme code (*policy-as-code*), la validation automatisée, la détection de biais intégrée et le monitoring continu de la dérive transforment la gouvernance d'un exercice de conformité en un contrôle opérationnel permanent. Le retour sur investissement est documenté : la prévention d'un seul incident couvre de 10 à 100 fois l'investissement annuel.

---

#### Transition

Ce chapitre a démontré que la gouvernance IA et la gestion du *Shadow AI* sont des territoires naturels de l'architecte d'entreprise — des domaines où sa vision transversale, sa maîtrise des cadres de référence et sa capacité de modélisation systémique créent un avantage décisif. Il a établi les six piliers de la gouvernance, le modèle de maturité qui structure la progression, le cadre spécifique à l'IA agentique, les stratégies de transformation du *Shadow AI* en innovation maîtrisée et les mécanismes d'opérationnalisation dans les pipelines techniques.

Mais la gouvernance, aussi rigoureuse soit-elle, ne prend effet que dans un modèle opérationnel adapté. Le chapitre 10 examine le nouveau modèle opérationnel que l'architecte d'entreprise doit concevoir et animer pour exercer son rôle de conseiller stratégique IA — incluant les structures organisationnelles, les processus de décision, les mécanismes de coordination interfonctionnelle et les indicateurs de performance qui permettent de mesurer l'impact de l'architecture d'entreprise sur les résultats de l'organisation. Si le présent chapitre a répondu à la question « Comment gouverner l'IA? », le chapitre 10 répond à la question « Comment s'organiser pour que cette gouvernance fonctionne? ».

---

#### Références

[1] Gartner, « AI Governance Survey 2024 », cité dans Dataversity, « Building a Practical Framework for AI Governance Maturity in the Enterprise », 2025. Disponible : https://www.dataversity.net/articles/building-a-practical-framework-for-ai-governance-maturity-in-the-enterprise/

[2] Microsoft, « Work Trend Index 2025: AI at Work Is Here. Now Comes the Hard Part », 2025. Disponible : https://www.microsoft.com/en-us/worklab/work-trend-index/ai-at-work-is-here-now-comes-the-hard-part

[3] Gartner, « Survey Finds 45% of Organizations With High AI Maturity Keep AI Projects Operational for at Least Three Years », juin 2025. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-06-30-gartner-survey-finds-forty-five-percent-of-organizations-with-high-artificial-intelligence-maturity-keep-artificial-intelligence-projects-operational-for-at-least-three-years

[4] Trustible, « Recognized in the 2025 Gartner Market Guide for AI Governance Platforms », 2025. Disponible : https://trustible.ai/post/trustible-recognized-in-the-2025-gartner-market-guide-for-ai-governance-platforms/

[5] PwC, « 2025 Responsible AI Survey: From Policy to Practice », 2025. Disponible : https://www.pwc.com/us/en/tech-effect/ai-analytics/responsible-ai-survey.html

[6] Liminal, « Enterprise AI Governance: Complete Implementation Guide 2025 », 2025. Disponible : https://www.liminal.ai/blog/enterprise-ai-governance-guide

[7] NIST, « AI Risk Management Framework (AI RMF 1.0) », janvier 2023. Disponible : https://www.nist.gov/itl/ai-risk-management-framework

[8] Commission européenne, « EU AI Act — Regulatory Framework for AI », 2024-2026. Disponible : https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai

[9] Dataversity, « Building a Practical Framework for AI Governance Maturity in the Enterprise », 2025. Disponible : https://www.dataversity.net/articles/building-a-practical-framework-for-ai-governance-maturity-in-the-enterprise/

[10] A. Ramanathan et al., « Agentic AI Architecture Framework for Enterprises », InfoQ, 2025. Disponible : https://www.infoq.com/articles/agentic-ai-architecture-framework/

[11] Cloudera, « 2026 Predictions: The Architecture, Governance, and AI Trends Every Enterprise Must Prepare For », 2025. Disponible : https://www.cloudera.com/blog/business/2026-predictions-the-architecture-governance-and-ai-trends-every-enterprise-must-prepare-for.html

[12] Atlan, « AI-Ready Data Lineage: Activate Trust & Context in 2025 », 2025. Disponible : https://atlan.com/know/ai-readiness/ai-ready-data-lineage/

[13] CIO.com, « Shadow AI: The Hidden Agents Beyond Traditional Governance », 2025. Disponible : https://www.cio.com/article/4083473/shadow-ai-the-hidden-agents-beyond-traditional-governance.html

[14] Architecture & Governance Magazine, « Shadow AI: Hidden Risks Behind Unapproved Innovation », 2025. Disponible : https://www.architectureandgovernance.com/elevating-ea/shadow-ai-hidden-risks-behind-unapproved-innovation/

[15] ISACA, « From Shadow IT to Shadow AI: Navigating the New Frontier of Enterprise Risk », 2025. Disponible : https://www.isaca.org/resources/news-and-trends/newsletters/atisaca/2025/volume-19/from-shadow-it-to-shadow-ai-navigating-the-new-frontier-of-enterprise-risk

[16] Harmonic Security, « What 22 Million Enterprise AI Prompts Reveal About Shadow AI in 2025 », 2025. Disponible : https://www.harmonic.security/resources/what-22-million-enterprise-ai-prompts-reveal-about-shadow-ai-in-2025

[17] IBM, « Cost of a Data Breach Report 2025 », 2025. Disponible : https://www.ibm.com/reports/data-breach

[18] IntelligenceX, « Shadow AI: The Growing Hidden Threat to Enterprise Security, Governance, and Compliance », 2025. Disponible : https://blog.intelligencex.org/shadow-ai-enterprise-risk-governance-2025

[19] ISACA, « The Rise of Shadow AI: Auditing Unauthorized AI Tools in the Enterprise », 2025. Disponible : https://www.isaca.org/resources/news-and-trends/industry-news/2025/the-rise-of-shadow-ai-auditing-unauthorized-ai-tools-in-the-enterprise

[20] Trigyn, « Enterprise MLOps: Scalable Pipelines & Governance », 2025. Disponible : https://www.trigyn.com/insights/mlops-best-practices-enterprise-ai

[21] ISO, « ISO/IEC 42001:2023 — Information technology — Artificial intelligence — Management system », 2023. Disponible : https://www.iso.org/standard/81230.html

[22] KPMG, « AI Governance for the Agentic AI Era », 2025. Disponible : https://kpmg.com/us/en/articles/2025/ai-governance-for-the-agentic-ai-era.html

[23] Palo Alto Networks, « A Complete Guide to Agentic AI Governance », 2025. Disponible : https://www.paloaltonetworks.com/cyberpedia/what-is-agentic-ai-governance

[24] Kiteworks, « How Shadow AI Costs Companies $670K Extra: IBM's 2025 Breach Report », 2025. Disponible : https://www.kiteworks.com/cybersecurity-risk-management/ibm-2025-data-breach-report-ai-risks/

[25] WEF, « AI Agents in Action: Foundations for Evaluation and Governance », 2025. Disponible : https://reports.weforum.org/docs/WEF_AI_Agents_in_Action_Foundations_for_Evaluation_and_Governance_2025.pdf
