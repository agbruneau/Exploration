### Chapitre 10 — Un nouveau modèle opérationnel pour l'EA

<!-- Rôle argumentatif (PRD §3) : Un nouveau modèle opérationnel rend cette transformation viable et pérenne. -->

#### Introduction

Les trois premières parties de ce livre blanc ont établi un diagnostic convergent. La Partie I a documenté le fossé entre l'ambition IA des dirigeants et la capacité d'exécution de leurs organisations — un fossé que les architectures existantes ne peuvent combler sans transformation structurelle. La Partie II a démontré que l'architecte d'entreprise (AE) est le professionnel le mieux positionné pour assumer le rôle de conseiller stratégique en IA, à condition d'acquérir un profil de compétences tri-dimensionnel couvrant les dimensions technique, business et influence. La Partie III a fourni les fondations nécessaires : architectures *AI-first*, médiation des risques et gouvernance. Mais un constat demeure : disposer de compétences individuelles et de fondations techniques ne suffit pas si le modèle opérationnel de l'architecture d'entreprise (AE) lui-même n'évolue pas. Un architecte doté des bonnes compétences, travaillant dans un modèle opérationnel conçu pour documenter des systèmes existants plutôt que pour conseiller la stratégie, restera confiné dans un rôle subalterne.

Le présent chapitre répond à cette lacune en proposant un nouveau modèle opérationnel pour l'architecture d'entreprise à l'ère de l'IA. Ce modèle repose sur trois pivots : le passage d'une posture réactive à une posture proactive et prédictive, l'intégration de l'AE dans les flux de changement organisationnel (*flow of change*), et le repositionnement de la fonction comme « système d'exploitation de l'entreprise digitale ». Ce chapitre examine les tendances structurantes identifiées par Gartner pour 2025, propose des mécanismes concrets d'intégration avec les cadres existants (TOGAF, Zachman, *capability-based planning*), définit les rôles, rituels et artefacts du nouveau modèle, établit des métriques de valeur mesurables et décrit la construction d'un centre d'excellence (*Center of Excellence*, CoE) orienté IA. L'objectif est de fournir aux responsables d'architecture d'entreprise un plan de transformation de leur propre fonction — une condition préalable à la transformation qu'ils sont appelés à piloter pour l'ensemble de l'organisation.

---

#### 10.1 Les trois tendances Gartner 2025 pour l'EA : modèle fédéré, rationalisation technologique, compétences élargies

##### Le contexte : des pressions convergentes sur la fonction EA

L'année 2025 marque un point d'inflexion pour l'architecture d'entreprise. Selon Gartner, les craintes récessionnistes persistantes, les menaces géopolitiques et les capacités disruptives de l'IA définissent conjointement le paysage dans lequel les responsables d'AE doivent opérer [1]. Ces pressions exogènes se conjuguent à une pression endogène : 62 % des leaders stratégiques constatent que leur modèle opérationnel *legacy* ne supporte plus leurs objectifs futurs [2]. Le modèle opérationnel de l'AE elle-même est soumis à cette même tension — conçu pour un monde de planification pluriannuelle et de gouvernance hiérarchique, il se révèle inadéquat face à la vélocité de l'IA.

Gartner identifie trois tendances majeures qui redéfinissent la stratégie de l'architecture d'entreprise en 2025, chacune adressant une dimension spécifique de cette inadéquation.

##### Première tendance : le modèle fédéré

La première tendance consiste à développer un nouveau modèle opérationnel pour l'AE qui soutient des conceptions organisationnelles fédérées et démocratisées [1]. Ce modèle reconnaît que dans une organisation où l'IA est déployée à travers de multiples unités d'affaires, de multiples équipes produit et de multiples flux de valeur (*value streams*), un modèle centralisé d'architecture d'entreprise devient un goulot d'étranglement.

Le modèle fédéré distribue l'expertise architecturale au sein des unités d'affaires tout en maintenant une coordination stratégique centrale. Forrester confirme cette orientation : les organisations lauréates du prix d'architecture d'entreprise 2025 intègrent des architectes principaux (*principal architects*) directement dans les équipes produit, soutenus par un conseil d'architecture global (*global architecture council*) qui assure la gouvernance en temps réel et l'alignement stratégique [3]. Cette structure permet de concilier la vitesse d'exécution des équipes décentralisées et la cohérence architecturale nécessaire à l'échelle de l'organisation.

Le modèle fédéré ne signifie pas l'absence de standards. Il implique une distinction nette entre ce qui est centralisé — les principes directeurs, les standards d'interopérabilité, les politiques de gouvernance des données et des modèles IA — et ce qui est décentralisé — les décisions d'implémentation, le choix des outils spécifiques, la priorisation des cas d'usage IA au sein de chaque domaine d'affaires.

##### Deuxième tendance : la rationalisation technologique

La deuxième tendance porte sur la modernisation et la rationalisation du portefeuille technologique par la réduction de la dette technique, l'adoption d'architectures composables et la mise à jour des applications [1]. Gartner observe que les dépendances techniques non anticipées constituent un facteur majeur de réduction des rendements des investissements numériques [1].

Dans le contexte de l'IA, la rationalisation technologique prend une dimension supplémentaire. Les organisations qui ont accumulé une dette technique significative dans leurs systèmes *legacy* se trouvent dans l'incapacité d'intégrer les capacités IA de manière cohérente. Les données nécessaires aux modèles sont emprisonnées dans des silos applicatifs, les interfaces d'intégration sont incompatibles avec les architectures événementielles requises par les systèmes temps réel, et la complexité du portefeuille empêche toute vision transversale.

LeanIX rapporte un retour sur investissement de 290 % sur trois ans et un délai de rentabilisation de cinq mois pour les organisations qui entreprennent une rationalisation systématique de leur portefeuille applicatif [4]. Ce chiffre illustre le rendement potentiel d'une approche disciplinée de rationalisation, mais il souligne aussi que l'investissement initial est significatif et nécessite un engagement soutenu de la direction.

##### Troisième tendance : les compétences élargies

La troisième tendance exige d'élargir et de renforcer les compétences des équipes d'AE pour inclure la modélisation et l'analyse financières ainsi que les compétences en IA [1]. Comme l'a détaillé le chapitre 6, Gartner observe que peu de pratiques d'architecture d'entreprise possèdent les compétences en modélisation financière nécessaires pour motiver les investissements technologiques et anticiper les sources de friction [1].

Cette tendance complète les deux précédentes : le modèle fédéré nécessite des architectes capables d'agir en autonomie dans les unités d'affaires, ce qui exige des compétences élargies au-delà de la technique pure. La rationalisation technologique nécessite la capacité de construire des cas d'affaires financiers convaincants pour justifier les investissements de modernisation. L'ensemble converge vers le profil de l'architecte stratégique IA décrit au chapitre 6 — un professionnel combinant compétences techniques, business et d'influence.

[Tableau 10.1 — Les trois tendances Gartner 2025 et leurs implications pour le modèle opérationnel EA]

| Tendance | Dimension adressée | Implication opérationnelle | Indicateur de maturité |
|---|---|---|---|
| Modèle fédéré | Structure organisationnelle | Architectes intégrés dans les équipes produit; conseil d'architecture global | Ratio architectes centraux / architectes intégrés |
| Rationalisation technologique | Portefeuille technologique | Réduction de la dette technique; architectures composables; données désilotées | Score de dette technique; taux de composabilité |
| Compétences élargies | Profil de compétences | Modélisation financière; littératie IA; *storytelling* exécutif | % de l'équipe EA certifiée IA/finance |

*Source : Synthèse des auteurs à partir de Gartner (2025) [1]*

---

#### 10.2 Passer d'une EA réactive à une EA proactive et prédictive

##### Le diagnostic : une fonction historiquement réactive

Le modèle opérationnel traditionnel de l'architecture d'entreprise est fondamentalement réactif. L'AE intervient après que les décisions stratégiques ont été prises — pour documenter, pour évaluer la conformité, pour identifier les impacts techniques d'une décision déjà actée. Forrester décrit avec précision cette dynamique : « les processus d'AE traditionnels sont largement en boucle ouverte (*open-loop*), avec des propositions soumises, examinées des jours ou des semaines plus tard, délibérées en comité, et finalement approuvées — souvent sur la base d'informations obsolètes. À ce moment, l'initiative a peut-être pivoté ou l'environnement a changé » [5].

Cette posture réactive a deux conséquences structurelles. Premièrement, elle positionne l'AE comme un centre de coûts — une fonction de contrôle qui ralentit les initiatives plutôt qu'elle ne les accélère. Deuxièmement, elle prive l'AE de la crédibilité nécessaire pour participer aux décisions stratégiques, puisqu'elle intervient systématiquement en aval de ces décisions.

##### La cible : une AE proactive et prédictive

Le passage à une posture proactive et prédictive implique trois transformations fondamentales.

**De la documentation à la détection.** L'AE proactive ne se contente plus de documenter l'état actuel du système d'information. Elle surveille en continu l'environnement technologique, les tendances du marché et les signaux faibles pour anticiper les besoins architecturaux avant qu'ils ne se manifestent comme des urgences. BOC Group identifie cette évolution comme l'une des tendances majeures de l'AE pour 2026 : « l'IA permet aux organisations d'analyser de vastes quantités de données pour découvrir des motifs, prédire des résultats et prendre des décisions plus éclairées » [6]. L'AE qui intègre ces capacités d'analyse prédictive dans ses processus passe d'une posture d'archiviste à une posture de vigie.

**De l'approbation à la recommandation.** L'AE proactive ne se limite plus à approuver ou rejeter les demandes qui lui sont soumises. Elle formule des recommandations stratégiques — sur les opportunités d'adoption de l'IA, sur les risques émergents, sur les synergies entre initiatives — et les communique aux parties prenantes avant qu'elles ne les sollicitent. Selon ACL Digital, les analystes de l'industrie prévoient que d'ici 2026, la plupart des outils de gestion de l'architecture d'entreprise incluront des capacités d'IA intégrées, les pratiques d'AE passant « de la documentation à la simulation continue et à la gouvernance en temps réel » [7].

**De l'analyse ponctuelle à la surveillance continue.** L'AE prédictive exploite les jumeaux numériques d'organisation (*Digital Twins of Organizations*, DTO) pour simuler les transformations, optimiser les décisions d'investissement et fournir une vue holistique de l'entreprise — des processus et systèmes aux personnes et aux données [8]. Orbus Software souligne qu'en 2025, les DTO « gagnent significativement en traction, permettant aux entreprises de créer des répliques numériques de leurs opérations » en intégrant des données en temps réel incluant la performance applicative, les métriques financières, les interactions clients et les mouvements de chaîne d'approvisionnement [8].

##### Les mécanismes de la proactivité

La transition vers une AE proactive ne se décrète pas — elle se construit à travers des mécanismes opérationnels concrets :

**Le radar technologique institutionnel.** Un processus trimestriel d'analyse des technologies émergentes, alimenté par les équipes d'innovation, les retours de terrain des architectes fédérés et la veille sectorielle, qui produit des recommandations formalisées sur les technologies à adopter, à surveiller ou à éviter.

**Les revues d'architecture orientées risques.** Des revues périodiques qui n'évaluent pas seulement la conformité des projets aux standards, mais identifient les risques systémiques émergents — dette technique croissante, dépendances critiques non gérées, lacunes de compétences — et proposent des actions préventives.

**Les simulations d'impact.** L'utilisation de modèles prédictifs et de scénarios pour évaluer l'impact des décisions architecturales avant leur mise en œuvre, réduisant le risque de conséquences non anticipées.

Forrester décrit cette transformation comme l'émergence de « l'architecte augmenté » (*augmented architect*) : un professionnel dont les capacités sont amplifiées par des boucles de rétroaction fermées, des agents IA, des modèles de langage, des bases de données vectorielles et des systèmes dynamiques basés sur les graphes [5]. L'IA augmente l'architecte en « mettant continuellement à jour le référentiel pour n'exposer que des données fraîches, éliminant la nécessité de fouiller dans des wikis obsolètes ou d'envoyer des courriels à dix équipes pour obtenir des informations de base sur le cycle de vie d'un système » [5].

[Figure 10.1 — Évolution du modèle opérationnel EA : de réactif à prédictif]

```
    RÉACTIF                PROACTIF               PRÉDICTIF
    (passé)                (transition)           (cible)

┌──────────────┐    ┌──────────────────┐    ┌──────────────────┐
│ Documentation│    │ Détection et     │    │ Simulation et    │
│ post-décision│───►│ recommandation   │───►│ anticipation     │
│              │    │ pré-décision     │    │ continue         │
├──────────────┤    ├──────────────────┤    ├──────────────────┤
│ Approbation  │    │ Conseil          │    │ Co-décision      │
│ /rejet       │───►│ stratégique      │───►│ avec le C-suite  │
│              │    │                  │    │                  │
├──────────────┤    ├──────────────────┤    ├──────────────────┤
│ Revue        │    │ Revue orientée   │    │ Surveillance     │
│ périodique   │───►│ risques          │───►│ continue (DTO)   │
│ de conformité│    │                  │    │                  │
├──────────────┤    ├──────────────────┤    ├──────────────────┤
│ Centre de    │    │ Fonction         │    │ Levier de        │
│ coûts        │───►│ habilitante      │───►│ croissance       │
└──────────────┘    └──────────────────┘    └──────────────────┘

     Boucle ouverte        Boucle semi-          Boucle fermée
                           fermée                 augmentée par IA
```

*La figure illustre les trois stades de maturité du modèle opérationnel EA. Chaque colonne représente un stade avec ses pratiques caractéristiques. La progression de gauche à droite reflète le passage d'une fonction de contrôle à une fonction de création de valeur stratégique.*

---

#### 10.3 Intégrer l'EA dans le « flow of change » : produits, *value streams*, équipes pluridisciplinaires

##### Le problème : une AE isolée du changement

L'un des échecs les plus fréquents des pratiques d'architecture d'entreprise est leur isolement des flux de changement organisationnel. L'AE traditionnelle opère dans un espace séparé — un bureau d'architecture qui produit des artefacts (diagrammes, standards, évaluations de conformité) consommés par les équipes de livraison, mais sans participation directe aux activités de conception, de développement et de déploiement. Forrester diagnostique cette déconnexion avec clarté : « les parcours clients, les flux de valeur et les processus quotidiens sont les lieux où la valeur est créée, pourtant la plupart des équipes d'architecture d'entreprise continuent d'optimiser les systèmes IT en isolation » [9].

Cette isolation a des conséquences mesurables. Les décisions architecturales prises en chambre ne reflètent pas les contraintes réelles du terrain. Les standards imposés sans dialogue avec les équipes de livraison sont contournés plutôt qu'adoptés. Les artefacts produits sont obsolètes avant d'être publiés. Le résultat est une perte de pertinence qui alimente un cercle vicieux : moins l'AE est pertinente, moins elle est consultée, moins elle comprend le contexte, moins ses recommandations sont pertinentes.

##### La réponse : l'AE intégrée dans les flux de valeur

L'intégration de l'AE dans le *flow of change* repose sur trois principes structurants.

**Premier principe : l'AE se déplace vers les équipes, pas l'inverse.** Plutôt que de demander aux équipes de livraison de soumettre leurs travaux à une revue d'architecture centralisée, les architectes s'intègrent dans les équipes pluridisciplinaires — équipes produit, équipes de plateforme, équipes de données. CIO.com décrit cette évolution : « les architectes s'intègrent désormais directement dans les équipes de domaine ou de plateforme, participant au raffinement du *backlog* stratégique, aux revues d'incidents et aux sessions de conception en tant que pairs » [10]. Cette intégration permet une gouvernance « par conception » (*governance by design*) où les principes architecturaux sont intégrés dans les pratiques de travail quotidiennes plutôt qu'imposés par un processus de validation externe.

**Deuxième principe : l'AE s'organise autour des flux de valeur, pas des couches technologiques.** Le modèle traditionnel organise l'architecture par couches — infrastructure, application, données, sécurité. Le nouveau modèle organise l'architecture autour des flux de valeur (*value streams*) qui traversent ces couches. Forrester recommande explicitement de « créer une appropriation partagée (*shared ownership*) avec les opérations business, l'expérience client et les équipes produit via la cartographie des flux de valeur (*value-stream mapping*), des événements de type Kaizen et une priorisation fondée sur les données probantes » [9].

**Troisième principe : l'AE contribue directement aux livrables, pas seulement aux artefacts.** Dans le modèle intégré, l'architecte ne produit pas uniquement des diagrammes et des standards — il contribue directement à la conception des produits numériques, à la définition des interfaces, à l'évaluation des technologies candidates et à la résolution des problèmes techniques complexes. CIO.com observe que la livraison continue et la pensée de type *start-up* transforment la pratique de l'architecture d'entreprise : « les architectes s'associent à des équipes interfonctionnelles pour concevoir des tranches étroites (*narrow slices*) qui, une fois réussies, sont réutilisées et étendues, de sorte que l'architecture d'entreprise est continuellement « productisée » à travers les équipes » [10].

##### Le modèle d'intégration : architecture par produit et par flux de valeur

L'intégration concrète de l'AE dans le *flow of change* se manifeste à travers un modèle organisationnel qui distingue trois niveaux d'intervention :

**Niveau stratégique (conseil d'architecture).** Le conseil d'architecture global définit les principes directeurs, les standards d'interopérabilité et les politiques de gouvernance. Il ne prend pas de décisions d'implémentation — il fixe les garde-fous (*guardrails*) dans lesquels les équipes opèrent.

**Niveau tactique (architectes de domaine).** Les architectes de domaine sont affectés aux principaux flux de valeur de l'organisation. Ils traduisent les principes stratégiques en orientations spécifiques au contexte de leur domaine et assurent la cohérence entre les équipes produit au sein d'un même flux de valeur.

**Niveau opérationnel (architectes intégrés).** Les architectes intégrés participent directement aux équipes produit. Ils contribuent aux décisions de conception quotidiennes, identifient les opportunités de réutilisation entre équipes et remontent les signaux d'alerte architecturale.

> **En pratique — Intégrer un architecte dans une équipe produit IA chez un assureur**
>
> Un assureur de taille intermédiaire a restructuré sa pratique d'architecture en affectant un architecte de domaine dédié à son flux de valeur « souscription augmentée par l'IA ». L'architecte participe aux cérémonies agiles de l'équipe produit (planification de sprint, revues, rétrospectives), contribue directement à la conception de l'architecture RAG (*Retrieval-Augmented Generation*) utilisée pour l'analyse des risques, et rapporte au conseil d'architecture mensuel les décisions prises et les dérogations nécessaires. En six mois, cette intégration a permis de réduire de 40 % le délai entre la conception architecturale et le déploiement en production, tout en augmentant le taux de conformité aux standards de l'organisation de 65 % à 92 %. La clé du succès : l'architecte n'est plus un auditeur externe, mais un membre contributeur de l'équipe, doté du même mandat de livraison de valeur.

---

#### 10.4 L'EA comme « système d'exploitation de l'entreprise digitale » : orchestrer IA, *cloud* et créativité humaine

##### La métaphore du système d'exploitation

La métaphore du « système d'exploitation » (*operating system*) appliquée à l'architecture d'entreprise capture une réalité organisationnelle profonde. De même qu'un système d'exploitation informatique orchestre les ressources matérielles (processeurs, mémoire, stockage) et les met à disposition des applications de manière transparente, l'AE orchestre les ressources organisationnelles (données, capacités technologiques, compétences humaines) et les met à disposition des initiatives stratégiques.

Cette métaphore acquiert une pertinence accrue à l'ère de l'IA. Selon les analyses de Vamsi Talks Tech, « l'IA agentique émerge non pas simplement comme un outil d'automatisation de plus, mais comme le système d'exploitation intelligent qui orchestrera, coordonnera et exécutera les processus d'affaires à travers l'ensemble de la chaîne de valeur organisationnelle » [11]. Cette transformation « exige un repensement fondamental de l'architecture d'entreprise — un repensement qui positionne les agents IA comme le tissu auto-coordonné (*self-coordinating fabric*) connectant les systèmes, les flux de travail et les décideurs humains » [11].

##### Les trois couches du système d'exploitation EA

L'AE comme système d'exploitation de l'entreprise digitale opère à travers trois couches interdépendantes.

**La couche d'orchestration IA.** Cette couche gère le portefeuille de capacités IA de l'organisation — les modèles en production, les agents autonomes, les pipelines de données, les services d'inférence. Elle assure que ces capacités sont découvrables, réutilisables et gouvernées. Deloitte rapporte que 66 % des organisations interrogées pilotent ou explorent des options autour de l'architecture d'entreprise augmentée par l'IA [12]. L'AE qui assume cette fonction d'orchestration transforme les capacités IA isolées en un écosystème cohérent.

**La couche d'orchestration *cloud*.** Cette couche gère l'infrastructure nuagique (*cloud*) — les services de calcul, de stockage, de réseau et de sécurité — comme un ensemble de ressources partagées et élastiques. La convergence entre l'infrastructure locale (*on-premises*) et l'élasticité du nuage constitue, selon les analystes, « l'épine dorsale architecturale qui permet l'intelligence à l'échelle » [13]. L'AE assure que les décisions d'infrastructure soutiennent les exigences de performance, de sécurité et de coûts des capacités IA.

**La couche d'orchestration humaine.** Cette couche — souvent négligée dans les discussions sur l'architecture technique — gère la collaboration entre les équipes humaines et les systèmes automatisés. Deloitte formule cette convergence par l'équation « IA + IH = ICÉ » (*AI + HI = ECI*) : la combinaison de l'intelligence artificielle (IA) et de l'intelligence humaine (IH) pour atteindre une intelligence collaborative élevée (*Elevated Collaborative Intelligence*, ICÉ) [12]. L'AE qui intègre cette dimension dans son modèle opérationnel reconnaît que la valeur maximale de l'IA ne réside pas dans l'automatisation totale, mais dans l'orchestration intelligente entre les capacités humaines (créativité, jugement éthique, contextualisation) et les capacités artificielles (vitesse, reconnaissance de motifs, traitement à l'échelle).

##### La valeur du système d'exploitation EA

La valeur de cette approche réside dans sa capacité à transformer des ressources fragmentées en capacités organisationnelles cohérentes. Deloitte observe que la clé du succès des organisations performantes réside dans la « refonte des processus plutôt que dans l'automatisation des processus » [12] — une distinction fondamentale qui positionne l'AE non pas comme un intégrateur de technologies, mais comme un concepteur de modes de fonctionnement. Seul 1 % des directeurs informatiques interrogés par Deloitte rapportent qu'aucun changement majeur de modèle opérationnel n'est en cours [12], ce qui confirme l'ampleur de la transformation à l'œuvre.

[Figure 10.2 — L'EA comme système d'exploitation de l'entreprise digitale]

```
┌─────────────────────────────────────────────────────────────┐
│           SYSTÈME D'EXPLOITATION EA                          │
│                                                              │
│  ┌───────────────────────────────────────────────────────┐  │
│  │        COUCHE D'ORCHESTRATION HUMAINE                  │  │
│  │  Créativité │ Jugement éthique │ Contextualisation     │  │
│  │  Collaboration interfonctionnelle │ Gestion du         │  │
│  │  changement │ Décision stratégique                     │  │
│  └───────────────────────┬───────────────────────────────┘  │
│                          │                                   │
│  ┌───────────────────────▼───────────────────────────────┐  │
│  │        COUCHE D'ORCHESTRATION IA                       │  │
│  │  Modèles en production │ Agents autonomes │ Pipelines  │  │
│  │  de données │ Services d'inférence │ Gouvernance       │  │
│  │  des modèles │ Registre IA │ Métriques de performance  │  │
│  └───────────────────────┬───────────────────────────────┘  │
│                          │                                   │
│  ┌───────────────────────▼───────────────────────────────┐  │
│  │        COUCHE D'ORCHESTRATION CLOUD                    │  │
│  │  Calcul │ Stockage │ Réseau │ Sécurité │ Identité     │  │
│  │  Services managés │ Infrastructure hybride │ Coûts     │  │
│  └───────────────────────────────────────────────────────┘  │
│                                                              │
│  ┌───────────────────────────────────────────────────────┐  │
│  │  FONDATIONS : Données │ Standards │ Gouvernance │ API  │  │
│  └───────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

*Le diagramme illustre les trois couches d'orchestration du système d'exploitation EA. La couche humaine est positionnée au sommet pour refléter la primauté du jugement humain dans les décisions stratégiques. Les fondations (données, standards, gouvernance, API) soutiennent l'ensemble.*

---

#### 10.5 Intégration avec les cadres existants : TOGAF ADM adapté à l'IA, Zachman, *capability-based planning*

##### Le principe : adapter, pas remplacer

L'adoption d'un nouveau modèle opérationnel pour l'AE ne nécessite pas l'abandon des cadres méthodologiques existants. TOGAF (*The Open Group Architecture Framework*), le cadre Zachman et la planification par les capacités (*capability-based planning*) demeurent des fondations pertinentes — à condition d'être adaptées aux spécificités de l'IA. L'analyse de 147 engagements d'AE entre 2019 et 2025 révèle que 87 % des implémentations réussies utilisent des cadres hybrides plutôt qu'une adhésion méthodologique pure [14]. Cette donnée empirique confirme que la valeur des cadres réside dans leur application contextuelle, pas dans leur application dogmatique.

##### TOGAF ADM adapté à l'IA

Le cycle ADM (*Architecture Development Method*) de TOGAF fournit un processus itératif structuré qui se transpose naturellement au contexte de l'IA, moyennant des adaptations ciblées à chaque phase :

**Phase A — Vision architecturale.** La vision doit explicitement intégrer les ambitions IA de l'organisation, en utilisant les cadres de priorisation décrits au chapitre 5 (matrice valeur/risque/délai, *capability heat maps*) pour identifier les capacités IA cibles. ArchiMetric observe que « les moteurs d'analyse pilotés par l'IA automatisent la détection des écarts en comparant l'architecture de référence actuelle (*Baseline Architecture*) avec l'architecture cible (*Target Architecture*) proposée, identifiant les éléments manquants, les incohérences dans les relations et les décalages dans les capacités » [15].

**Phase B à D — Architectures métier, SI et technologique.** Ces phases doivent intégrer les composants IA comme des éléments architecturaux de premier ordre : les modèles IA, les pipelines de données, les services d'inférence, les agents autonomes. Les « modèles génératifs peuvent simuler des scénarios d'affaires basés sur des données réelles de l'entreprise — comme la modélisation de l'impact opérationnel et financier de la mise en œuvre de la maintenance prédictive, du service client intelligent ou de l'approvisionnement algorithmique — rendant les cas d'affaires plus convaincants et moins spéculatifs » [15].

**Phase E — Opportunités et solutions.** L'évaluation des solutions IA doit inclure les critères spécifiques identifiés aux chapitres 7 et 8 : maturité des données, gouvernance des modèles, explicabilité, risques de biais, coûts d'inférence à l'échelle.

**Phase F — Planification de la migration.** La feuille de route de migration doit séquencer les capacités IA en fonction de la maturité des fondations décrites au chapitre 7 (*Enterprise AI Fabric*, *data mesh*, *LLMOps*).

**Phase G et H — Gouvernance et gestion du changement.** Ces phases intègrent les mécanismes de gouvernance IA décrits au chapitre 9, incluant la surveillance de la dérive des modèles (*model drift*), la conformité réglementaire et la gestion du *Shadow AI*.

##### Le cadre Zachman enrichi

Le cadre Zachman, avec sa matrice bidimensionnelle croisant les perspectives des parties prenantes (du propriétaire à l'implémenteur) et les interrogations fondamentales (quoi, comment, où, qui, quand, pourquoi), offre une taxonomie exhaustive pour organiser les artefacts architecturaux. Sa valeur dans le contexte de l'IA réside dans sa capacité à « prévenir les angles morts » (*prevent blind spots*) en s'assurant que chaque dimension de l'architecture est considérée [14].

L'enrichissement du cadre Zachman pour l'IA implique l'ajout de questions spécifiques à chaque cellule de la matrice :

- **Quoi (données)** : Quelles sont les données d'entraînement? Quel est leur lignage? Quels biais potentiels contiennent-elles?
- **Comment (fonction)** : Quels modèles sont utilisés? Quels sont leurs paramètres de performance? Comment gère-t-on la dérive?
- **Où (réseau)** : Où s'exécute l'inférence? Quelles sont les contraintes de latence? Comment les données circulent-elles?
- **Qui (personnes)** : Qui est responsable de la gouvernance des modèles? Qui supervise les agents autonomes? Qui arbitre les conflits éthiques?
- **Quand (temps)** : Quand les modèles sont-ils réentraînés? Quelle est la fenêtre de validité des prédictions? Quels sont les délais de conformité réglementaire?
- **Pourquoi (motivation)** : Quelle valeur business le modèle crée-t-il? Comment cette valeur est-elle mesurée? Quel est le seuil d'acceptabilité du risque?

##### La planification par les capacités (*capability-based planning*) orientée IA

La planification par les capacités, déjà examinée au chapitre 5, constitue le mécanisme le plus naturel pour intégrer les initiatives IA dans la stratégie d'architecture d'entreprise. Elle permet de répondre à la question fondamentale : « Quelles capacités organisationnelles l'IA doit-elle créer ou améliorer pour réaliser la stratégie? »

Dans le nouveau modèle opérationnel, la planification par les capacités sert de pont entre le niveau stratégique (objectifs du C-suite) et le niveau opérationnel (projets et initiatives). Chaque capacité IA cible est définie en termes de résultat business attendu, de prérequis architecturaux, de niveau de risque et de métriques de succès. Cette approche garantit que les investissements IA sont justifiés par leur contribution aux capacités organisationnelles, et non par leur intérêt technologique intrinsèque.

[Tableau 10.2 — Intégration des cadres existants dans le modèle opérationnel EA orienté IA]

| Cadre | Force principale | Adaptation IA requise | Usage dans le nouveau modèle |
|---|---|---|---|
| TOGAF ADM | Processus itératif structuré | Intégrer les composants IA comme éléments de premier ordre à chaque phase | Gouvernance du cycle de vie des initiatives IA |
| Zachman | Taxonomie exhaustive anti-angles morts | Enrichir chaque cellule de questions IA spécifiques | Classification et complétude des artefacts IA |
| *Capability-based planning* | Lien stratégie-exécution | Définir les capacités IA en termes de résultats business | Priorisation et justification des investissements IA |

*Source : Synthèse des auteurs à partir de [14], [15], [16]*

---

#### 10.6 Rôles, rituels et artefacts : *roadmaps* de capacités IA, cartes de risques, canevas de cas d'usage

##### Les rôles du nouveau modèle opérationnel

Le nouveau modèle opérationnel de l'AE repose sur une structure de rôles qui reflète les trois niveaux d'intervention décrits à la section 10.3 et les trois couches d'orchestration décrites à la section 10.4.

**L'architecte en chef IA (*Chief AI Architect*).** Ce rôle assume la responsabilité de la vision architecturale IA globale, de l'alignement avec la stratégie d'entreprise et de la gouvernance des standards IA. Il siège au comité exécutif de la technologie et rapporte directement au directeur des technologies (CIO) ou au directeur des données (CDO). Selon Forrester, les architectes deviennent des « champions de la gouvernance agentique » qui « gèrent des fermes d'agents IA, établissent des garde-fous et des boucles de rétroaction pour assurer la responsabilité et l'alignement avec les objectifs business » [17].

**Les architectes de domaine IA.** Ces rôles sont affectés aux principaux flux de valeur de l'organisation. Ils traduisent la vision globale en architectures spécifiques à leur domaine, assurent la cohérence entre les équipes produit et identifient les opportunités de réutilisation des capacités IA entre les domaines.

**Les architectes intégrés.** Comme décrit à la section 10.3, ces architectes participent directement aux équipes produit. Ils apportent l'expertise architecturale au quotidien et remontent les besoins et les signaux d'alerte au niveau du domaine.

**Les spécialistes transversaux.** Des experts en gouvernance des données, en sécurité IA, en conformité réglementaire et en *MLOps*/*LLMOps* qui interviennent à la demande des architectes de domaine et des architectes intégrés pour traiter les questions spécialisées.

##### Les rituels du nouveau modèle

Les rituels — les réunions et processus récurrents — structurent le fonctionnement du modèle opérationnel et assurent la circulation de l'information entre les niveaux.

**Le conseil d'architecture IA mensuel.** Réunit l'architecte en chef, les architectes de domaine et les représentants des fonctions transversales (sécurité, données, conformité). Son mandat : valider les décisions architecturales majeures, arbitrer les conflits entre domaines, mettre à jour la feuille de route des capacités IA, examiner les métriques de valeur.

**La revue de portefeuille IA trimestrielle.** Réunit le conseil d'architecture et les parties prenantes business (directeurs de flux de valeur, directeurs financiers). Son mandat : évaluer la performance du portefeuille d'initiatives IA, réallouer les ressources, ajuster les priorités en fonction des résultats observés et des évolutions du contexte.

**Le radar technologique trimestriel.** Un processus structuré d'évaluation des technologies IA émergentes, produisant un radar visuel classifiant les technologies en quatre catégories : adopter, expérimenter, surveiller, éviter. Ce rituel alimente la proactivité de l'AE décrite à la section 10.2.

**Les revues d'architecture intégrées.** Dans chaque équipe produit, des sessions régulières (hebdomadaires ou bimensuelles) où l'architecte intégré présente les décisions architecturales, sollicite les retours de l'équipe et identifie les besoins d'escalade. Ces revues remplacent les revues d'architecture centralisées traditionnelles.

**La communauté de pratique EA-IA.** Un forum mensuel ouvert à tous les architectes (centraux et intégrés) pour partager les retours d'expérience, les leçons apprises, les nouveaux *patterns* et les défis émergents. Ce rituel soutient la montée en compétences et la cohésion de la communauté architecturale.

##### Les artefacts du nouveau modèle

Les artefacts — les documents et modèles produits — doivent évoluer pour refléter le nouveau modèle opérationnel. Trois artefacts sont fondamentaux.

**La feuille de route des capacités IA (*AI Capability Roadmap*).** Ce document stratégique cartographie les capacités IA cibles de l'organisation, séquencées dans le temps en fonction de la maturité des fondations, de la disponibilité des données, de la valeur business attendue et des dépendances techniques. Contrairement à une feuille de route de projets, la feuille de route de capacités est stable face aux changements de périmètre des projets individuels — les capacités persistent même lorsque les projets qui les construisent évoluent.

**La carte de risques IA (*AI Risk Map*).** Ce document opérationnel cartographie les risques IA de l'organisation — techniques (dérive de modèle, biais, hallucination), business (ROI non démontré, cannibalisation, dépendance fournisseur), humains (érosion des compétences, résistance organisationnelle) et réglementaires (conformité *EU AI Act*, protection des données). La carte est « vivante » : elle est mise à jour en continu à partir des données de surveillance et des retours des architectes intégrés, en lien avec les *value streams* et les capacités d'entreprise tels que décrits au chapitre 8.

**Le canevas de cas d'usage IA (*AI Use Case Canvas*).** Ce modèle standardisé structure l'évaluation des cas d'usage IA candidats en couvrant les dimensions essentielles : problème business, données requises, architecture cible, métriques de succès, risques identifiés, estimation des coûts, prérequis de gouvernance. L'Annexe F fournit un canevas vierge utilisable par les équipes.

---

#### 10.7 Métriques de valeur EA : temps de passage PoC à production, réutilisation de capacités, valeur business tracée

##### Le problème de la mesure de la valeur EA

L'incapacité historique de l'architecture d'entreprise à démontrer sa valeur constitue l'une des principales menaces à sa pérennité organisationnelle. Si l'AE ne peut quantifier sa contribution aux résultats de l'organisation, elle reste vulnérable aux réductions budgétaires et à la marginalisation. ExecViva observe que les indicateurs clés de performance (ICP, *Key Performance Indicators*, KPI) de l'AE doivent « connecter le plan directeur technologique aux résultats business » [18]. ServiceNow confirme que les métriques de l'AE doivent couvrir deux niveaux : les livrables (*outputs*) — feuilles de route, standards, artefacts — et les résultats (*outcomes*) — réduction de la duplication de systèmes, accélération des cycles d'intégration, amélioration de l'alignement des parties prenantes [19].

##### Les métriques du nouveau modèle opérationnel

Le nouveau modèle opérationnel de l'AE orienté IA repose sur trois familles de métriques qui couvrent les dimensions d'efficience, de réutilisation et de valeur business.

**Famille 1 : Métriques d'efficience opérationnelle**

- **Temps de passage PoC à production (*PoC-to-Production Time*).** Le délai moyen entre la validation d'un concept IA et son déploiement en production. Cette métrique est le reflet direct de la qualité des fondations architecturales et de l'efficacité du modèle opérationnel. Une réduction de ce délai démontre que l'AE accélère — plutôt qu'elle ne ralentit — la livraison de valeur IA.
- **Temps de résolution des décisions architecturales (*Architecture Decision Lead Time*).** Le délai moyen entre la soumission d'une demande de décision architecturale et sa résolution. Dans le modèle réactif, ce délai se mesure en semaines. Dans le modèle proactif, il se mesure en jours.
- **Taux de dérogation aux standards (*Standards Exception Rate*).** Le pourcentage de décisions architecturales qui dérogent aux standards établis. Un taux élevé indique soit des standards inadaptés, soit un déficit de communication.

**Famille 2 : Métriques de réutilisation et de composabilité**

- **Taux de réutilisation des capacités IA (*AI Capability Reuse Rate*).** Le pourcentage de nouvelles initiatives IA qui réutilisent des capacités existantes (modèles, pipelines de données, composants d'infrastructure) plutôt que de les reconstruire. SoftwareReviews souligne l'importance de mesurer « la réduction de l'effort de développement et d'intégration grâce aux blocs réutilisables d'architecture et aux *patterns* » [20].
- **Taux de composabilité du portefeuille (*Portfolio Composability Rate*).** Le pourcentage des systèmes du portefeuille qui exposent des *APIs* standardisées et sont intégrables dans des architectures composables.
- **Score de dette technique (*Technical Debt Score*).** Une mesure composite de la dette technique du portefeuille, incluant les dépendances obsolètes, les interfaces non standardisées et les systèmes en fin de vie.

**Famille 3 : Métriques de valeur business**

- **Valeur business tracée (*Traced Business Value*).** La valeur financière des résultats business directement attribuables aux décisions architecturales de l'AE — gains de productivité, revenus additionnels, coûts évités, risques atténués. Cette métrique exige une collaboration étroite avec la fonction finance, conformément à l'alliance décrite au chapitre 6.
- **Indice de satisfaction des parties prenantes (*Stakeholder Satisfaction Index*).** Une mesure périodique de la satisfaction des parties prenantes business et IT envers les services de l'AE — qualité des recommandations, réactivité, pertinence des artefacts.
- **Taux de participation aux décisions stratégiques (*Strategic Decision Involvement Rate*).** Le pourcentage des décisions stratégiques majeures de l'organisation (investissements technologiques, acquisitions, transformations de processus) auxquelles l'AE a contribué. Cette métrique mesure directement le positionnement stratégique de la fonction.

[Tableau 10.3 — Tableau de bord des métriques de valeur EA orienté IA]

| Famille | Métrique | Formule / méthode | Fréquence | Cible indicative |
|---|---|---|---|---|
| Efficience | Temps PoC → prod | Jours entre validation PoC et déploiement prod | Trimestrielle | Réduction de 30-50 % sur 18 mois |
| Efficience | Temps de décision architecturale | Jours entre demande et résolution | Mensuelle | < 5 jours ouvrables |
| Réutilisation | Taux de réutilisation IA | Initiatives réutilisant des capacités existantes / total | Trimestrielle | > 40 % |
| Réutilisation | Score de dette technique | Indice composite (0-100) | Trimestrielle | Amélioration continue |
| Valeur | Valeur business tracée | $ attribués aux décisions EA | Semestrielle | ROI positif démontrable |
| Valeur | Satisfaction parties prenantes | Enquête (1-10) | Semestrielle | > 7/10 |

*Source : Synthèse des auteurs à partir de [18], [19], [20]*

##### Le principe de recalibration continue

Victor Leung recommande que « les objectifs soient révisés et recalibrés trimestriellement plutôt qu'annuellement pour refléter les priorités en évolution » [21]. Ce principe de recalibration continue est particulièrement pertinent dans le contexte de l'IA, où le rythme d'évolution technologique rend les objectifs annuels rapidement obsolètes. Le tableau de bord des métriques doit être conçu comme un instrument vivant, ajusté à chaque revue de portefeuille trimestrielle en fonction des résultats observés et des changements de contexte.

---

#### 10.8 Construire un EA *Center of Excellence* orienté IA

##### La justification : pourquoi un CoE?

Le centre d'excellence (*Center of Excellence*, CoE) orienté IA constitue la structure organisationnelle qui institutionnalise le nouveau modèle opérationnel décrit dans ce chapitre. Gartner anticipe que d'ici 2025, plus de 75 % des entreprises réduiront leur attention sur l'expérimentation IA pour se concentrer sur son opérationnalisation — mais que sans cadre stratégique tel qu'un CoE, la plupart échoueront [22]. Oracle définit un CoE IA comme une « équipe interne d'experts qui pilotent des résultats IA réussis et créateurs de valeur dans une organisation » [23]. Microsoft, dans son cadre d'adoption du nuage (*Cloud Adoption Framework*), précise que le CoE IA « prévient l'adoption fragmentée ou non gouvernée de l'IA et établit une fondation solide pour les initiatives IA tout en fournissant une consultation technique et business qui soutient une intégration IA réussie » [24].

La spécificité du CoE EA orienté IA, par rapport à un CoE IA générique, est son ancrage dans les pratiques d'architecture d'entreprise. Il ne se contente pas de piloter les initiatives IA — il les inscrit dans une vision architecturale d'ensemble qui assure la cohérence, la réutilisabilité et la pérennité des investissements.

##### Le modèle de maturité du CoE

La construction du CoE suit une progression en trois phases qui reflète la maturité croissante de la pratique.

**Phase 1 : Centralisation (0-12 mois).** En début de parcours, un modèle centralisé consolide l'expertise et les pratiques fondamentales. Microsoft recommande cette approche pour les organisations « à un stade précoce de leur parcours IA, car la centralisation accélère l'adoption » [24]. Durant cette phase, le CoE définit les standards architecturaux IA, établit le registre de modèles, met en place les processus de gouvernance fondamentaux et forme les premiers architectes IA.

**Phase 2 : Hybride (12-24 mois).** À mesure que la maturité augmente, le CoE évolue vers un modèle hybride où l'expertise est progressivement distribuée dans les unités d'affaires tandis que le CoE central conserve la gouvernance stratégique, les standards et la formation. Appinventiv décrit ce modèle fédéré comme un modèle où « les talents IA et la prise de décision sont distribués aux unités d'affaires individuelles, avec une équipe centrale assumant un rôle nominal de stratégie » [25].

**Phase 3 : Consultatif (24+ mois).** Dans l'état de maturité avancée, le CoE central adopte un rôle consultatif : il définit la vision, maintient les standards, assure la formation continue et intervient sur les initiatives complexes. Les architectes intégrés dans les équipes produit possèdent les compétences et l'autonomie nécessaires pour prendre la plupart des décisions architecturales IA dans le respect des garde-fous établis.

##### La composition du CoE EA orienté IA

La composition de l'équipe du CoE doit couvrir les compétences nécessaires aux trois couches du système d'exploitation EA décrit à la section 10.4 :

**Rôles permanents :**
- Architecte en chef IA (direction et vision stratégique)
- Architectes de domaine IA (2-4 selon la taille de l'organisation)
- Spécialiste en gouvernance des données IA (qualité, lignage, conformité)
- Spécialiste en sécurité IA (risques, conformité réglementaire)
- Spécialiste *MLOps*/*LLMOps* (opérationnalisation des modèles)

**Rôles contributeurs (temps partiel) :**
- Représentant de la fonction finance (modélisation financière, cas d'affaires)
- Représentant des ressources humaines (gestion du changement, formation)
- Représentant juridique (conformité réglementaire, contrats)
- Scientifiques des données (*data scientists*) référents par domaine

Cette composition reflète les alliances interfonctionnelles décrites au chapitre 6 — le CoE est le lieu physique où ces alliances se matérialisent.

##### Les responsabilités du CoE

Le CoE EA orienté IA assume six responsabilités fondamentales :

**1. Définir et maintenir les standards architecturaux IA.** Les principes directeurs, les *patterns* de référence, les normes d'interopérabilité et les politiques de gouvernance qui encadrent toutes les initiatives IA de l'organisation.

**2. Opérer le registre de modèles et le registre de capacités IA.** Un inventaire vivant de tous les modèles IA en production, de toutes les capacités IA disponibles, de leurs propriétaires, de leurs métriques de performance et de leurs interdépendances.

**3. Évaluer et accompagner les initiatives IA.** Un processus structuré d'évaluation des nouveaux cas d'usage IA, utilisant le canevas de cas d'usage (section 10.6 et Annexe F), qui assure que chaque initiative est architecturalement viable, alignée sur la stratégie et gouvernée de manière appropriée.

**4. Piloter la feuille de route des capacités IA.** La planification, le suivi et l'ajustement de la feuille de route stratégique des capacités IA, en lien avec le conseil d'architecture et les parties prenantes business.

**5. Assurer la montée en compétences.** La formation continue des architectes et des équipes techniques en matière d'IA, de gouvernance et de nouvelles pratiques architecturales — conformément aux parcours décrits au chapitre 6.

**6. Mesurer et communiquer la valeur.** Le suivi des métriques décrites à la section 10.7 et la communication régulière de la valeur créée par la fonction AE aux parties prenantes — un levier essentiel de crédibilité stratégique.

C3 AI synthétise cet ensemble de responsabilités en observant que le CoE est « un centre d'excellence à structure répétable intégrant stratégie, talent et gouvernance » [26], et que ses quatre piliers fondamentaux sont la stratégie (alignement des initiatives IA avec les objectifs business), l'architecture (infrastructure évolutive, sécurité, préparation des données), la feuille de route (coordination des plans d'implémentation) et la culture (promotion de l'utilisation responsable, formation et collaboration) [26].

[Figure 10.3 — Structure et responsabilités du CoE EA orienté IA]

```
┌─────────────────────────────────────────────────────────────┐
│              CoE EA ORIENTÉ IA                               │
│                                                              │
│  DIRECTION                                                   │
│  ┌─────────────────────────────────────────────────────┐    │
│  │ Architecte en chef IA                                │    │
│  │ Vision stratégique │ Gouvernance │ Parties prenantes │    │
│  └──────────────────────┬──────────────────────────────┘    │
│                         │                                    │
│  ÉQUIPE PERMANENTE      │    CONTRIBUTEURS                   │
│  ┌──────────────────┐   │   ┌──────────────────────┐        │
│  │ Architectes de   │   │   │ Finance              │        │
│  │ domaine IA (2-4) │   │   │ RH                   │        │
│  │ Gouvernance      │◄──┼──►│ Juridique            │        │
│  │ données IA       │   │   │ Data scientists       │        │
│  │ Sécurité IA      │   │   │ référents            │        │
│  │ MLOps/LLMOps     │   │   └──────────────────────┘        │
│  └──────────────────┘   │                                    │
│                         │                                    │
│  RESPONSABILITÉS        │                                    │
│  ┌──────────────────────▼──────────────────────────────┐    │
│  │ 1. Standards  │ 2. Registres  │ 3. Évaluation       │    │
│  │ 4. Roadmap    │ 5. Formation  │ 6. Métriques/valeur │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                              │
│  MATURITÉ : Centralisé ──► Hybride ──► Consultatif          │
└─────────────────────────────────────────────────────────────┘
```

*La figure illustre la structure du CoE EA orienté IA, distinguant l'équipe permanente, les contributeurs interfonctionnels et les six responsabilités fondamentales. La progression de maturité en bas reflète l'évolution du CoE dans le temps.*

##### Les facteurs critiques de succès

L'expérience documentée par les analystes et les praticiens identifie quatre facteurs critiques de succès pour le CoE EA orienté IA :

**Le parrainage exécutif.** Appinventiv souligne que « tout CoE IA doit bénéficier d'un soutien ample de la direction, car le parrainage exécutif garantit un budget approprié, une visibilité et un suivi aligné sur les objectifs de l'entreprise » [25]. Sans ce parrainage, le CoE risque de devenir un exercice académique sans impact organisationnel.

**L'ancrage dans les résultats business.** Le CoE doit démontrer sa valeur rapidement — idéalement dans les six premiers mois — à travers des gains concrets et mesurables. Les métriques décrites à la section 10.7 fournissent le cadre nécessaire.

**L'évolution progressive.** Le CoE ne doit pas tenter de couvrir l'ensemble des responsabilités dès le premier jour. Une approche progressive, commençant par les fondamentaux (standards, registre, formation) et évoluant vers les responsabilités avancées (métriques de valeur, simulation), réduit le risque d'échec.

**L'intégration avec les structures existantes.** Microsoft recommande, si l'organisation opère déjà un centre d'excellence en infonuagique (*Cloud Center of Excellence*, CCoE), d'intégrer les pratiques IA dans cette équipe plutôt que de créer une structure parallèle [24]. Cette intégration évite la multiplication des structures de gouvernance et favorise la cohérence de l'architecture d'entreprise.

---

#### Points clés à retenir

> **1. Les trois tendances Gartner 2025 définissent le cadre de la transformation.** Le modèle fédéré, la rationalisation technologique et les compétences élargies constituent les trois piliers sur lesquels le nouveau modèle opérationnel doit être construit. Aucun des trois ne peut être négligé sans compromettre l'ensemble.
>
> **2. Le passage du réactif au prédictif est le pivot stratégique central.** L'AE traditionnelle opère en boucle ouverte — documentation post-décision, approbation différée, revue périodique. L'AE prédictive opère en boucle fermée — détection continue, recommandation proactive, simulation d'impact. Ce passage transforme l'AE d'un centre de coûts en un levier de croissance.
>
> **3. L'intégration dans les flux de valeur est une condition de pertinence.** L'AE qui reste isolée dans un bureau d'architecture perd sa pertinence. L'intégration des architectes dans les équipes produit, l'organisation autour des flux de valeur et la contribution directe aux livrables sont les mécanismes qui ancrent l'AE dans la création de valeur.
>
> **4. Les cadres existants sont adaptables, pas remplaçables.** TOGAF ADM, Zachman et la planification par les capacités restent des fondations pertinentes à condition d'être enrichis pour intégrer les spécificités de l'IA — composants IA comme éléments de premier ordre, questions IA spécifiques dans la taxonomie, capacités IA dans la planification stratégique.
>
> **5. Les métriques transforment la crédibilité de l'AE.** Le temps de passage PoC à production, le taux de réutilisation des capacités IA et la valeur business tracée sont les trois métriques fondamentales qui démontrent la contribution de l'AE aux résultats de l'organisation. Sans métriques, l'AE reste un acte de foi.
>
> **6. Le CoE EA orienté IA institutionnalise le nouveau modèle.** Le centre d'excellence est la structure qui transforme les principes décrits dans ce chapitre en pratiques organisationnelles pérennes. Sa construction progressive — centralisé, hybride, consultatif — réduit le risque d'échec tout en permettant une montée en maturité soutenue.

---

#### Transition

Ce chapitre a défini le modèle opérationnel qui rend viable et pérenne la transformation de l'architecte d'entreprise en conseiller stratégique IA. Les tendances Gartner 2025, le passage du réactif au prédictif, l'intégration dans les flux de valeur, l'adaptation des cadres existants, les métriques de valeur et le centre d'excellence constituent ensemble l'infrastructure organisationnelle sur laquelle repose le nouveau rôle de l'AE.

Mais un modèle opérationnel, aussi bien conçu soit-il, ne démontre sa valeur que dans la pratique. Le chapitre 11 examine cette dimension pratique à travers des études de cas et des *patterns* réutilisables. Il analyse des organisations qui ont réussi — et d'autres qui ont échoué — dans la mise en production de l'IA à l'échelle, et extrait de ces expériences des *patterns* architecturaux applicables. Le passage du chapitre 10 au chapitre 11 marque la transition du « comment s'organiser » au « comment cela fonctionne dans la réalité » — une transition qui ancre les principes théoriques dans l'évidence empirique et fournit aux architectes des modèles éprouvés pour guider leur propre transformation.

---

#### Références

[1] Gartner, « 3 Trends Driving Enterprise Architecture Strategy in 2025 », 2025. Disponible : https://www.gartner.com/en/articles/2025-trends-for-enterprise-architecture

[2] Gartner, « Redefining Enterprise Architecture: Strategies for Post-Digital Success », 2025. Disponible : https://www.gartner.com/en/information-technology/topics/enterprise-architecture

[3] Forrester, « Forrester's 2025 Enterprise Architecture Award Winner and Finalists for North America », 2025. Disponible : https://www.forrester.com/blogs/forresters-2025-enterprise-architecture-award-winner-and-finalists-for-north-america/

[4] LeanIX, « Enterprise Architecture Metrics: Prove Value and ROI », 2025. Disponible : https://www.leanix.net/en/wiki/ea/enterprise-architecture-metrics

[5] Forrester, « The Augmented Architect: Real-Time Enterprise Architecture in the Age of AI », 2025. Disponible : https://www.forrester.com/blogs/the-augmented-architect-real-time-enterprise-architecture-in-the-age-of-ai/

[6] BOC Group, « Enterprise Architecture Trends for 2026 — Key Outlook Shaping EA », 2025. Disponible : https://www.boc-group.com/en/blog/ea/ea-outlook-trends-2025/

[7] ACL Digital, « Top 6 Enterprise Architecture Trends Shaping 2026 and Beyond », 2025. Disponible : https://www.acldigital.com/blogs/top-6-enterprise-architecture-trends-shaping-2026-and-beyond

[8] Orbus Software, « Enterprise Architecture and Digital Transformation Trends for 2025 », 2025. Disponible : https://www.orbussoftware.com/resources/blog/post/enterprise-architecture-and-digital-transformation-trends-for-2025

[9] Forrester, « Architects Must Go Where Value Flows and Make Process Outcomes the Center of EA », 2025. Disponible : https://www.forrester.com/blogs/architects-must-go-where-value-flows-and-make-process-outcomes-the-center-of-ea/

[10] CIO.com, « How Enterprise Architecture and Start-up Thinking Drive Strategic Success », 2025. Disponible : https://www.cio.com/article/4120725/how-enterprise-architecture-and-start-up-thinking-drive-strategic-success.html

[11] Vamsi Talks Tech, « Agentic AI — The Enterprise Operating System Architecture », 2025. Disponible : https://www.vamsitalkstech.com/agentic-ai/agentic-ai-the-enterprise-operating-system-architecture/

[12] Deloitte, « The Great Rebuild: Architecting an AI-Native Tech Organization », Tech Trends 2026, 2025. Disponible : https://www.deloitte.com/us/en/insights/topics/technology-management/tech-trends/2026/ai-future-it-function.html

[13] Cloudera, « 2026 Predictions: The Architecture, Governance, and AI Trends Every Enterprise Must Prepare For », 2025. Disponible : https://www.cloudera.com/blog/business/2026-predictions-the-architecture-governance-and-ai-trends-every-enterprise-must-prepare-for.html

[14] Intelance, « The Ultimate Guide to Enterprise Architecture Frameworks (2026) », 2025. Disponible : https://www.intelance.co.uk/the-ultimate-guide-to-enterprise-architecture-frameworks/

[15] ArchiMetric, « How AI Accelerates TOGAF ADM for Enterprise Architecture », 2025. Disponible : https://www.archimetric.com/ai-powered-togaf-guide-through/

[16] Visual Paradigm, « Comprehensive Guide to Business Capability Planning in TOGAF », 2025. Disponible : https://togaf.visual-paradigm.com/2025/01/21/comprehensive-guide-to-business-capability-planning-in-togaf/

[17] Forrester, « How Agentic AI Elevates The Enterprise Architect's Role », 2025. Disponible : https://www.forrester.com/blogs/the-future-of-the-enterprise-architects-job/

[18] ExecViva, « Enterprise Architecture KPIs: The Executive Guide to Connecting Your Tech Blueprint to Business Outcomes », 2025. Disponible : https://execviva.com/executive-hub/enterprise-architecture-kpis

[19] ServiceNow, « Enterprise Architecture Business Outcomes & KPIs », 2025. Disponible : https://www.servicenow.com/community/enterprise-architecture-articles/enterprise-architecture-business-outcomes-amp-kpis/ta-p/3204850

[20] SoftwareReviews, « Prove the Value of Enterprise Architecture With SMART KPIs », 2025. Disponible : https://www.softwarereviews.com/research/prove-the-value-of-enterprise-architecture-with-smart-kpis

[21] V. Leung, « Enterprise Architect Goals and KPIs — Aligning Strategy, Outcomes, and Real Value », Continuous Improvement, novembre 2025. Disponible : https://victorleungtw.com/2025/11/07/kpi/

[22] Tredence, « How to Build Your AI Center of Excellence in 2025: A Guide », 2025. Disponible : https://www.tredence.com/blog/ai-center-of-excellence

[23] Oracle, « What Is an AI Center of Excellence (CoE)? », 2025. Disponible : https://www.oracle.com/artificial-intelligence/ai-center-excellence/

[24] Microsoft, « Establish an AI Center of Excellence — Cloud Adoption Framework », 2025. Disponible : https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/center-of-excellence

[25] Appinventiv, « AI Center of Excellence for Enterprises: Framework, Structure & ROI Guides », 2025. Disponible : https://appinventiv.com/blog/ai-center-of-excellence/

[26] C3 AI, « Best Practices for Governing the AI Application Lifecycle: The Center of Excellence », 2025. Disponible : https://c3.ai/what-is-enterprise-ai/best-practices-for-governing-the-ai-application-lifecycle-the-center-of-excellence/
