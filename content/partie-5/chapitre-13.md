### Chapitre 13 — Feuille de route pour l'élévation stratégique de l'EA

<!-- Rôle argumentatif (PRD §3) : Une feuille de route concrète permet de passer de la réflexion à l'action. -->

#### Introduction

Les douze chapitres précédents ont établi le diagnostic (Partie I), cartographié la transformation du rôle (Partie II), posé les fondations architecturales et de gouvernance (Partie III), proposé un modèle opérationnel renouvelé et des cas concrets (Partie IV), et esquissé l'horizon 2028 (chapitre 12). Ce parcours analytique serait incomplet sans une feuille de route actionnable qui permette à l'architecte d'entreprise (AE) — et aux dirigeants qui l'entourent — de passer de la compréhension à l'exécution. Le rapport *State of Enterprise Architecture 2025* de Bizzdesign, fondé sur une enquête auprès de plus de 500 architectes et leaders d'affaires, révèle que seulement 19 % des équipes d'architecture d'entreprise estiment que leur mission et leur valeur sont comprises par leurs collègues à travers l'organisation [1]. Ce chiffre illustre l'ampleur du chemin à parcourir : l'élévation stratégique de l'architecture d'entreprise n'est pas un acquis, c'est un projet qui exige une stratégie, des étapes et des indicateurs mesurables.

Le présent chapitre propose une feuille de route structurée en trois phases couvrant un horizon de 36 mois. Il commence par un auto-diagnostic de maturité qui permet à chaque architecte et à chaque équipe de situer leur point de départ sur l'axe opérationnel-stratégique. Il détaille ensuite les trois phases de la transformation — fondations, accélération et transformation — avec des actions concrètes, des livrables attendus et des critères de succès vérifiables. Il aborde les alliances interfonctionnelles à construire, les facteurs critiques de succès et les pièges à éviter, et se conclut par une checklist d'auto-évaluation et un appel à l'action à l'intention des architectes et des dirigeants. Ce chapitre est conçu pour être utilisé immédiatement par le persona principal du livre blanc : un architecte d'entreprise en milieu de carrière (8-15 ans d'expérience) qui cherche à repositionner sa fonction comme levier stratégique pour les initiatives IA de son organisation.

---

#### 13.1 Auto-diagnostic de maturité : où l'EA se situe sur l'axe opérationnel → stratégique

##### Le modèle de maturité EA-IA : cinq niveaux

Avant d'entreprendre toute transformation, il est essentiel de comprendre le point de départ. Le modèle *ITScore for Enterprise Architecture* de Gartner définit cinq niveaux de maturité — inexistant, réactif, fonctionnel, intégré et omniprésent — mesurés selon 26 activités réparties sur six objectifs [2]. Ce modèle générique constitue une fondation solide, mais il nécessite une adaptation au contexte spécifique de l'élévation stratégique dans le domaine de l'IA.

En croisant le modèle Gartner avec les quatre rôles émergents identifiés par Forrester — cartographe de valeur (*value mapper*), stratège du jumeau numérique (*digital twin strategist*), curateur de la connaissance d'entreprise (*enterprise knowledge curator*) et champion de la gouvernance agentique (*agentic governance champion*) [3] — et les tendances identifiées par ACL Digital pour 2026 [4], il est possible de proposer un modèle de maturité adapté à l'élévation stratégique EA-IA en cinq niveaux :

[Tableau 13.1 — Modèle de maturité EA-IA : de l'opérationnel au stratégique]

| Niveau | Désignation | Caractéristiques | Interaction avec le *C-suite* | Contribution IA |
|---|---|---|---|---|
| 1 | Documentaire | L'AE produit des diagrammes et des standards techniques. Aucune implication dans les décisions d'investissement. | Indirecte, via le CIO | Aucune ou marginale |
| 2 | Réactif | L'AE est consulté sur des projets techniques. Les recommandations portent sur la conformité et l'infrastructure. | Ponctuelle, sur demande | Évaluation technique d'outils IA |
| 3 | Contributeur | L'AE participe aux revues de portefeuille et aux cas d'affaires. Il commence à quantifier la valeur. | Régulière, aux comités technologiques | Gouvernance IA formalisée; premiers *quick wins* |
| 4 | Partenaire stratégique | L'AE co-construit les stratégies d'investissement avec la finance et les métiers. Il influence les décisions au comité de direction. | Fréquente et bidirectionnelle | Plateforme de gouvernance IA; modèle opérationnel EA-IA |
| 5 | Conseiller stratégique | L'AE est un membre reconnu de l'équipe de leadership. Ses analyses alimentent directement les décisions du conseil d'administration. | Continue et structurelle | Gouvernance autonome; IA intégrée dans les *value streams* |

*Sources : Adapté de Gartner ITScore [2], Forrester [3], ACL Digital [4]*

##### L'outil d'auto-diagnostic

L'Annexe C fournit un template d'évaluation de maturité détaillé qui permet à chaque équipe EA de situer son niveau actuel de manière rigoureuse. L'auto-diagnostic doit être conduit selon les principes suivants :

**Impliquer des parties prenantes externes à l'équipe EA.** L'auto-évaluation uniquement interne produit systématiquement des résultats surévalués. Le rapport Bizzdesign révèle qu'un tiers des organisations ont une capacité « faible » ou « très faible » à analyser l'écart entre leurs capacités actuelles et celles requises pour atteindre leurs objectifs d'affaires [1]. L'implication de représentants du *C-suite*, des métiers et de la finance dans l'évaluation produit un diagnostic plus fidèle.

**Évaluer huit dimensions.** Le diagnostic doit couvrir : (1) le soutien des parties prenantes, (2) les ressources de l'équipe, (3) la méthode de développement d'architecture, (4) l'intégration organisationnelle, (5) les livrables, (6) la gouvernance EA, (7) les métriques et (8) la perception des parties prenantes [2]. Chaque dimension est évaluée sur une échelle de 1 à 5 correspondant aux cinq niveaux du modèle.

**Identifier les écarts prioritaires.** Le diagnostic produit un profil de maturité qui révèle les dimensions les plus avancées et les plus déficitaires. Les actions de la feuille de route doivent se concentrer sur les écarts les plus critiques pour l'élévation stratégique — typiquement l'intégration organisationnelle, les métriques de valeur et la perception des parties prenantes.

Le rapport Info-Tech *CIO Priorities 2026* quantifie précisément cet écart : les leaders TI évaluent l'importance de l'architecture d'entreprise à 8,7 sur 10, mais son efficacité n'atteint que 6,3 [5]. Cet écart de 2,4 points représente l'opportunité concrète que la feuille de route doit exploiter.

---

#### 13.2 Phase 1 — Fondations (0-6 mois) : audit des compétences, *quick wins* de gouvernance IA, alignement avec le *C-suite*

##### Objectif de la phase

La phase de fondations vise à établir la crédibilité de l'équipe EA comme interlocuteur légitime sur les questions d'IA, à démontrer une valeur tangible rapidement et à construire les bases relationnelles nécessaires aux phases suivantes. Le principe directeur est celui du *quick win* stratégique : des actions à fort impact et faible effort qui modifient la perception de l'architecture d'entreprise dans l'organisation.

##### Action 1 : Conduire l'audit de compétences EA-IA

L'audit des compétences constitue le premier acte concret de la transformation. Le référentiel de compétences EA-IA (Annexe B) fournit la grille d'évaluation. L'audit doit couvrir les trois dimensions identifiées au chapitre 6 : compétences techniques en IA, compétences business et compétences d'influence.

Selon le Forum économique mondial, 39 % des compétences fondamentales (*core skills*) seront transformées d'ici 2030, et 85 % des employeurs prévoient de prioriser la requalification et la montée en compétences de leur main-d'œuvre [6]. L'architecte d'entreprise ne peut pas se soustraire à cette transformation : il doit la piloter pour lui-même avant de la piloter pour l'organisation.

L'audit produit trois livrables : (1) une cartographie des compétences actuelles de l'équipe EA, (2) une analyse des écarts par rapport au profil cible de l'architecte stratégique IA, et (3) un plan de montée en compétences individualisé pour chaque membre de l'équipe.

> **En pratique — Audit de compétences en 30 jours**
>
> **Semaine 1-2 :** Auto-évaluation individuelle sur les trois dimensions (technique, business, influence) à l'aide de la grille de l'Annexe B. Chaque membre de l'équipe évalue ses compétences sur une échelle de 1 (notionnel) à 5 (expert).
>
> **Semaine 3 :** Évaluation croisée par les pairs (*peer assessment*) et consolidation des résultats. Identification des forces collectives et des lacunes critiques.
>
> **Semaine 4 :** Construction du plan de montée en compétences : formations prioritaires (littératie IA, modélisation financière, ingénierie des requêtes), certifications ciblées (TOGAF 10, IASA AI Architecture), et affectation à des communautés de pratique.

##### Action 2 : Lancer les *quick wins* de gouvernance IA

Les *quick wins* de gouvernance IA servent un double objectif : combler des lacunes de gouvernance réelles et démontrer la valeur de l'architecture d'entreprise de manière visible et mesurable. Trois *quick wins* ont démontré leur efficacité :

**Le registre des actifs IA.** L'inventaire de tous les modèles, outils et systèmes d'IA utilisés dans l'organisation — y compris les usages non sanctionnés (*Shadow AI*) — constitue un livrable à forte valeur perçue. Comme l'a établi le chapitre 9, 75 % des employés utilisent l'IA et 78 % le font avec leurs propres outils [7]. Un registre des actifs IA, maintenu par l'équipe EA, apporte une visibilité immédiate au *C-suite* sur l'exposition de l'organisation.

**La matrice de classification des risques IA.** En utilisant le cadre du chapitre 8 et le template de l'Annexe E, l'équipe EA peut produire une première classification des cas d'usage IA selon leur niveau de risque (faible, modéré, élevé, inacceptable) alignée sur les catégories de l'*EU AI Act*. Ce livrable positionne l'AE comme le médiateur naturel entre les exigences réglementaires et les capacités techniques.

**Le guide de bonnes pratiques pour l'utilisation de l'IA générative.** Un document concis (5-10 pages) qui définit les règles d'utilisation de l'IA générative dans l'organisation — données autorisées, outils approuvés, protocoles de vérification, obligations de confidentialité. Selon l'enquête PwC 2026, les organisations ayant établi des fondations solides en IA responsable (*Responsible AI frameworks*) sont trois fois plus susceptibles de rapporter des retours financiers significatifs [8].

##### Action 3 : Construire l'alignement avec le *C-suite*

L'alignement avec le *C-suite* ne se décrète pas : il se construit par des interactions structurées qui démontrent la pertinence stratégique de l'architecture d'entreprise. Trois mécanismes sont recommandés dans les six premiers mois :

**Le briefing IA mensuel.** Une présentation de 20 minutes au comité de direction qui résume l'état du portefeuille IA, les risques émergents et les opportunités identifiées. Selon McKinsey, près des deux tiers des entreprises les plus performantes déclarent que leurs leaders technologiques sont « très impliqués » dans l'élaboration de la stratégie d'entreprise, contre 52 % dans les autres organisations [9]. Le briefing IA mensuel est le véhicule par lequel l'AE construit cette implication.

**La co-construction du premier cas d'affaires IA.** Identifier une initiative IA à fort potentiel et construire son cas d'affaires en collaboration avec la direction financière. Ce travail conjoint démontre la capacité de l'AE à parler le langage de la valeur et établit le précédent d'une collaboration EA-finance sur les investissements IA.

**L'audit de l'écart ambitions-capacités.** En utilisant les outils du chapitre 5 (cartographie des capacités, cartes de chaleur), produire une analyse factuelle de l'écart entre les ambitions IA exprimées par la direction et les capacités réelles de l'organisation. Ce livrable cristallise le rôle de l'AE comme traducteur entre l'aspiration stratégique et la réalité opérationnelle.

[Tableau 13.2 — Livrables et indicateurs de la Phase 1 (0-6 mois)]

| Action | Livrable | Indicateur de succès | Échéance |
|---|---|---|---|
| Audit de compétences | Plan de montée en compétences EA-IA | 100 % de l'équipe évaluée; plan individualisé | Mois 1 |
| Registre des actifs IA | Inventaire des modèles et outils IA | ≥ 80 % des actifs IA inventoriés | Mois 2 |
| Matrice de risques IA | Classification des cas d'usage par risque | Matrice validée par le CISO et le juridique | Mois 3 |
| Guide GenAI | Politique d'utilisation de l'IA générative | Guide approuvé par le comité de direction | Mois 3 |
| Briefing IA mensuel | Présentation mensuelle au *C-suite* | ≥ 3 briefings réalisés en Phase 1 | Continu |
| Cas d'affaires IA | Business case co-construit avec la finance | ROI estimé et validé par le CFO | Mois 5 |
| Audit ambitions-capacités | Cartographie des écarts IA | Présentation au comité de direction | Mois 6 |

*Source : Synthèse des auteurs*

---

#### 13.3 Phase 2 — Accélération (6-18 mois) : nouveau modèle opérationnel EA, plateforme de gouvernance IA, premières victoires stratégiques

##### Objectif de la phase

La phase d'accélération capitalise sur la crédibilité acquise en Phase 1 pour transformer structurellement le fonctionnement de l'architecture d'entreprise. L'objectif est de passer du niveau 2 (réactif) ou 3 (contributeur) au niveau 4 (partenaire stratégique) du modèle de maturité. Cette phase requiert des investissements plus significatifs en ressources et en changement organisationnel.

##### Action 4 : Déployer le nouveau modèle opérationnel EA

Le chapitre 10 a décrit en détail le modèle opérationnel cible de l'architecture d'entreprise. La Phase 2 est le moment de le mettre en œuvre. Selon Gartner, les responsables d'architecture d'entreprise doivent actualiser leurs modèles de services internes et leur proposition de valeur, en envisageant une approche de « cabinet de conseil interne » avec un catalogue de services [10]. Trois transformations structurelles sont nécessaires :

**Le passage au modèle fédéré.** Le modèle centralisé traditionnel, où une équipe EA unique produit des artefacts pour l'ensemble de l'organisation, ne passe pas à l'échelle dans un contexte d'IA distribuée. Le modèle fédéré implante des architectes dans les équipes produit et les flux de valeur (*value streams*), tout en maintenant une coordination centrale pour la cohérence et la gouvernance. Gartner identifie le modèle fédéré comme l'une des trois tendances définissant la stratégie EA en 2025 [10].

**L'intégration dans le flux du changement.** L'architecture d'entreprise ne peut plus opérer en cycles trimestriels de gouvernance lorsque les équipes de livraison avancent à la cadence des sprints produit. Comme le note Forrester, l'architecte « augmenté » opère en temps réel, en utilisant les données d'architecture vivantes (*living architecture data*) pour formuler des recommandations continues plutôt que des revues périodiques [11]. Cette transformation implique l'adoption d'outils d'architecture en temps réel, l'intégration dans les rituels agiles (revues de sprint, planification de programme) et la production d'artefacts légers et évolutifs plutôt que de documents statiques.

**La création du catalogue de services EA.** Le catalogue de services formalise l'offre de l'équipe EA à l'organisation : évaluation de la faisabilité IA, analyse de l'impact architectural, co-construction de cas d'affaires, revue de conformité, cartographie des capacités. Chaque service est défini par ses entrées, ses sorties, ses délais et ses métriques de valeur. Ce catalogue transforme la perception de l'EA : d'une fonction de contrôle qui ralentit, elle devient un service qui accélère.

##### Action 5 : Construire la plateforme de gouvernance IA

La gouvernance IA ne peut pas reposer uniquement sur des politiques documentaires. Elle nécessite une plateforme opérationnelle qui intègre les politiques dans les *pipelines* de développement et de déploiement. Selon Cloudera, 2026 marque la transition de l'expérimentation à l'orchestration de l'intelligence, le moment où les entreprises commencent à opérationnaliser l'IA à l'échelle, de manière sécuritaire et avec un retour sur investissement mesurable [12].

Les composantes de la plateforme de gouvernance IA, dont l'architecture est décrite au chapitre 9, incluent :

**Le registre de modèles centralisé.** Extension du registre des actifs IA de la Phase 1, le registre de modèles centralisé documente chaque modèle en production — sa provenance, ses données d'entraînement, ses métriques de performance, son propriétaire, son niveau de risque et sa conformité réglementaire.

**Les garde-fous automatisés (*automated guardrails*).** Des contrôles intégrés dans les *pipelines* CI/CD qui vérifient automatiquement la conformité des modèles avant leur déploiement : détection de biais, validation de la qualité des données, vérification de la sécurité, contrôle de l'explicabilité.

**Le tableau de bord de gouvernance IA.** Un outil de visualisation en temps réel qui présente au *C-suite* l'état de la gouvernance IA — nombre de modèles en production, incidents de conformité, métriques de performance, coûts d'inférence. Ce tableau de bord est l'instrument par lequel l'AE rend visible sa contribution à la maîtrise des risques IA.

##### Action 6 : Remporter les premières victoires stratégiques

Les premières victoires stratégiques sont les événements qui ancrent la perception de l'architecture d'entreprise comme partenaire stratégique plutôt que comme fonction support. Elles se distinguent des *quick wins* de la Phase 1 par leur portée et leur visibilité.

**La première initiative IA menée de bout en bout avec l'EA.** Identifier un cas d'usage IA à fort impact business et piloter son implémentation de la conception à la production, en démontrant le rôle de l'architecture dans l'accélération du passage du prototype (*proof of concept*) à la production. Selon les analyses de l'industrie, les organisations performantes atteignent un retour sur investissement en 6 à 12 mois en combinant les architectures RAG (*Retrieval-Augmented Generation*), la gouvernance des coûts *LLMOps* et les contrôles humains dans la boucle (*human-in-the-loop*) [13].

**La rationalisation du portefeuille IA.** Utiliser le registre de modèles et la matrice de risques pour identifier les redondances, les investissements non performants et les opportunités de mutualisation dans le portefeuille IA de l'organisation. Ce travail d'optimisation produit des économies mesurables et démontre la valeur transversale de l'architecture d'entreprise.

**La contribution à une décision d'investissement majeure.** Produire une analyse architecturale qui influence directement une décision d'investissement significative — choix d'une plateforme IA, stratégie de *build vs buy*, architecture d'un nouvel écosystème de données. Selon l'enquête PwC 2026, les CEO dont les organisations ont établi des fondations IA solides — incluant des environnements technologiques favorisant l'intégration à l'échelle de l'entreprise — sont trois fois plus susceptibles de rapporter des retours financiers significatifs [8].

[Figure 13.1 — Progression de la Phase 2 : du contributeur au partenaire stratégique]

```
MOIS 6                    MOIS 12                   MOIS 18
  │                         │                         │
  ▼                         ▼                         ▼
┌────────────────┐  ┌────────────────────┐  ┌──────────────────────┐
│ MODÈLE         │  │ PLATEFORME DE      │  │ VICTOIRES            │
│ OPÉRATIONNEL   │  │ GOUVERNANCE IA     │  │ STRATÉGIQUES         │
│                │  │                    │  │                      │
│ • Modèle       │  │ • Registre de      │  │ • Initiative IA      │
│   fédéré       │  │   modèles          │  │   pilotée par l'EA   │
│ • Intégration  │  │ • Garde-fous       │  │ • Rationalisation    │
│   agile        │  │   automatisés      │  │   du portefeuille    │
│ • Catalogue    │  │ • Tableau de bord  │  │ • Influence sur      │
│   de services  │  │   C-suite          │  │   investissement     │
└────────────────┘  └────────────────────┘  └──────────────────────┘
        │                    │                        │
        ▼                    ▼                        ▼
  Niveau 3 →           Niveau 3-4 →            Niveau 4
  Contributeur         En transition           Partenaire stratégique
```

*La figure illustre la progression attendue au cours de la Phase 2. Chaque bloc d'actions contribue à l'élévation d'un niveau de maturité sur le modèle EA-IA.*

---

#### 13.4 Phase 3 — Transformation (18-36 mois) : EA comme conseiller stratégique établi, gouvernance autonome, influence au *board*

##### Objectif de la phase

La phase de transformation vise l'atteinte du niveau 5 du modèle de maturité : l'architecte d'entreprise est reconnu comme conseiller stratégique établi, la gouvernance IA opère de manière autonome et l'architecture d'entreprise influence directement les décisions au niveau du conseil d'administration. Cette phase consolide les acquis des deux phases précédentes et les institutionnalise.

##### Action 7 : Établir l'EA comme conseiller stratégique

L'établissement de l'architecture d'entreprise comme fonction de conseil stratégique requiert trois transformations :

**L'intégration formelle dans les processus de décision stratégique.** L'AE participe systématiquement aux comités d'investissement, aux revues stratégiques et aux sessions de planification. Selon le rapport Bizzdesign, les leaders en architecture d'entreprise sont deux fois plus susceptibles d'accroître leur engagement avec les dirigeants de niveau *C-suite* et les membres du conseil d'administration, comparativement aux retardataires [1]. Cette intégration doit être formalisée dans les mandats des comités de gouvernance.

**La production d'analyses stratégiques proactives.** L'AE ne se contente plus de répondre aux demandes : il anticipe les besoins en produisant des analyses de tendances technologiques, des évaluations d'impact des disruptions IA sur le modèle d'affaires, et des scénarios prospectifs qui alimentent la réflexion stratégique. Bizzdesign rapporte que la priorité numéro un des leaders EA est de « fournir davantage d'analyses stratégiques à la haute direction », choix exprimé par 47 % d'entre eux [1].

**La mesure et la communication de la valeur EA.** L'AE doit démontrer sa contribution en termes mesurables. Les métriques clés incluent : le temps de passage du *PoC* à la production pour les initiatives IA, le taux de réutilisation des capacités architecturales, la valeur business tracée aux recommandations EA, et la réduction des risques de non-conformité. Selon Gartner, les responsables EA doivent « communiquer continuellement la proposition de valeur évolutive de l'architecture d'entreprise » [10].

##### Action 8 : Opérationnaliser la gouvernance autonome

La gouvernance autonome (*AI-driven governance*) représente le stade de maturité le plus avancé, où les mécanismes de gouvernance sont eux-mêmes augmentés par l'IA. Gartner prévoit que 55 % des équipes d'architecture d'entreprise utiliseront une gouvernance autonome basée sur l'IA d'ici 2028 [14]. La Phase 3 doit poser les bases de cette gouvernance autonome :

**L'automatisation de la surveillance des modèles.** Des agents IA surveillent en continu la performance, la dérive et la conformité des modèles en production, déclenchant des alertes et des actions correctives automatiques lorsque des seuils sont dépassés.

**L'architecture continue (*continuous architecture*).** L'architecture n'est plus un artefact statique mis à jour périodiquement : elle est un système vivant, alimenté par des données en temps réel provenant des systèmes en production, des outils de développement et des plateformes de surveillance. Forrester décrit cette évolution comme le passage à « l'architecte augmenté » qui opère avec des « boucles de rétroaction en temps réel, des systèmes comportementaux et une gouvernance à haute vélocité » [11].

**La gouvernance prédictive.** Au-delà de la surveillance réactive, la gouvernance prédictive utilise les données historiques et les modèles d'apprentissage automatique pour anticiper les risques — dérive de modèle probable, saturation de capacité, obsolescence technologique — et recommander des actions préventives.

##### Action 9 : Construire l'influence au niveau du conseil d'administration

L'influence au niveau du conseil d'administration (*board-level influence*) est le marqueur ultime de l'élévation stratégique. Elle se construit progressivement :

**Alimenter les tableaux de bord du conseil en données architecturales.** Les administrateurs ont besoin de comprendre l'exposition de l'organisation aux risques IA, le retour sur les investissements technologiques et la maturité des fondations numériques. L'AE est le mieux placé pour produire ces analyses, à condition de les formuler dans le langage du conseil — risques, rendements, conformité — plutôt que dans le langage de l'architecture.

**Contribuer à la stratégie IA de l'organisation.** L'enquête McKinsey *Global Tech Agenda 2026* révèle que près d'un tiers des organisations les plus performantes prévoient de prioriser l'innovation de modèles d'affaires portée par la technologie au cours des deux prochaines années [9]. L'AE qui contribue activement à cette stratégie — en identifiant les opportunités, en évaluant les risques et en concevant les architectures nécessaires — s'impose naturellement comme conseiller stratégique.

**Devenir le gardien de la cohérence stratégique.** À mesure que l'IA se diffuse dans l'ensemble de l'organisation, le risque de fragmentation stratégique augmente. L'AE, par sa vision transversale, est le gardien naturel de la cohérence entre les initiatives IA des différentes unités d'affaires, les fondations technologiques et la stratégie globale de l'organisation.

---

#### 13.5 Alliances à construire : finance, RH, juridique, innovation, *data science*

##### Le principe de l'alliance stratégique

Le chapitre 6 a identifié les cinq alliances interfonctionnelles que l'architecte d'entreprise doit construire. Le présent chapitre les traduit en actions concrètes inscrites dans la feuille de route. Le principe directeur est celui de la co-création de valeur : chaque alliance doit produire des résultats tangibles pour les deux parties, et non se limiter à une déclaration d'intention.

Heidrick & Struggles confirme que « les leaders des fonctions technologie, ressources humaines et finance sont appelés à collaborer sur l'implantation de l'IA à l'échelle de l'entreprise. Pour ce faire efficacement, ils doivent comprendre à la fois comment l'IA affectera leurs fonctions individuelles et ce que cela signifie pour les autres fonctions et pour le modèle d'affaires de l'entreprise » [15].

##### Alliance avec la finance : le levier de crédibilité

L'alliance avec la direction financière est la plus critique pour l'élévation stratégique car elle confère à l'AE le vocabulaire et la légitimité nécessaires pour influencer les décisions d'investissement.

**Actions concrètes :**
- **Phase 1 :** Co-construire le premier cas d'affaires IA avec le contrôle de gestion. Apprendre à structurer un modèle financier incluant le *TCO* (*Total Cost of Ownership*), le ROI et les flux de valeur.
- **Phase 2 :** Participer systématiquement aux comités d'investissement technologique. Produire des analyses de *TCO* comparatives pour les plateformes IA (infonuagique vs sur site, modèles propriétaires vs ouverts).
- **Phase 3 :** Co-développer un tableau de bord de valeur IA qui relie les investissements architecturaux aux résultats financiers. Selon Forrester, moins d'un tiers des décideurs sont en mesure de relier la valeur de l'IA aux variations du résultat financier de leur organisation [16] — l'AE qui comble cette lacune se rend indispensable.

##### Alliance avec les ressources humaines : le levier de transformation

L'alliance avec les RH adresse deux enjeux fondamentaux : la transformation des compétences et la gestion du changement.

**Actions concrètes :**
- **Phase 1 :** Co-développer le référentiel de compétences IA de l'organisation (en s'appuyant sur l'Annexe B). Évaluer l'impact de l'IA sur les rôles et les emplois.
- **Phase 2 :** Co-concevoir les parcours de formation IA pour l'ensemble de l'organisation, de la littératie IA pour les dirigeants aux formations techniques pour les équipes de développement.
- **Phase 3 :** Co-piloter les programmes de gestion du changement associés aux transformations IA majeures. Selon McKinsey, les organisations disposant de cadres de collaboration interfonctionnelle et de préparation éthique robustes obtiennent des gains de performance liés à l'IA supérieurs de 40 % [17].

##### Alliance avec le juridique : le levier de conformité

L'entrée en vigueur progressive de l'*EU AI Act* et de réglementations sectorielles crée un impératif de collaboration.

**Actions concrètes :**
- **Phase 1 :** Réaliser conjointement la classification des systèmes IA selon les niveaux de risque réglementaire. Identifier les systèmes à haut risque nécessitant une documentation spécifique.
- **Phase 2 :** Co-concevoir les mécanismes de conformité intégrés dans la plateforme de gouvernance IA — traçabilité, explicabilité, audit des décisions algorithmiques.
- **Phase 3 :** Établir une veille réglementaire conjointe qui anticipe les évolutions et prépare l'organisation aux nouvelles exigences.

##### Alliance avec l'innovation : le levier de pertinence

L'alliance avec la fonction innovation évite le « purgatoire des pilotes » (*pilot purgatory*) en reliant l'expérimentation à l'industrialisation.

**Actions concrètes :**
- **Phase 1 :** Participer aux comités de sélection des projets d'innovation IA. Apporter les critères architecturaux de passage du prototype à la production.
- **Phase 2 :** Fournir des *patterns* architecturaux réutilisables (Annexe G) qui accélèrent l'industrialisation des prototypes. Construire le « bac à sable sécurisé » (*safe sandbox*) pour l'expérimentation IA.
- **Phase 3 :** Co-piloter l'*AI Factory* (chapitre 11) qui transforme l'innovation artisanale en capacité industrielle.

##### Alliance avec la *data science* : le levier technique

L'alliance avec les équipes de science des données est le substrat technique de toutes les autres alliances.

**Actions concrètes :**
- **Phase 1 :** Établir un protocole de collaboration pour l'évaluation des exigences de données des projets IA. Partager la cartographie des actifs de données de l'organisation.
- **Phase 2 :** Co-développer l'architecture de données IA de l'organisation — *data mesh*, *lakehouse*, gouvernance des données d'entraînement, lignage. Forrester identifie l'AE comme le « curateur de la connaissance d'entreprise » qui « gouverne les couches sémantiques et forme les équipes de données en RAG et en *GraphRAG* » [3].
- **Phase 3 :** Intégrer les équipes de science des données dans le modèle opérationnel EA fédéré, avec des architectes dédiés aux flux de données IA.

[Figure 13.2 — Chronologie des alliances stratégiques sur la feuille de route]

```
              Phase 1 (0-6 mois)    Phase 2 (6-18 mois)    Phase 3 (18-36 mois)
              ──────────────────    ───────────────────    ────────────────────
FINANCE       Premier cas           Comités investis.      Tableau de bord
              d'affaires IA         Analyses TCO           valeur IA
              ─────────────────────────────────────────────────────────────────
RH            Référentiel           Parcours formation     Gestion du
              compétences IA        IA organisation        changement IA
              ─────────────────────────────────────────────────────────────────
JURIDIQUE     Classification        Conformité intégrée    Veille réglementaire
              risques réglementaires  plateforme           proactive
              ─────────────────────────────────────────────────────────────────
INNOVATION    Comités sélection     Patterns réutilisables AI Factory
              projets IA            Safe sandbox           industrialisée
              ─────────────────────────────────────────────────────────────────
DATA SCIENCE  Protocole collab.     Architecture données   Intégration modèle
              Cartographie données  IA (mesh/lakehouse)    opérationnel fédéré
```

*La figure illustre le séquencement des actions d'alliance sur les trois phases de la feuille de route. Chaque alliance progresse d'actions fondatrices (Phase 1) vers des collaborations structurelles (Phase 2) puis vers une intégration institutionnalisée (Phase 3).*

---

#### 13.6 Facteurs critiques de succès et pièges à éviter

##### Les facteurs critiques de succès

L'analyse croisée de la littérature, des études de cas du chapitre 11 et des retours d'expérience des organisations performantes permet d'identifier sept facteurs critiques de succès pour l'élévation stratégique de l'architecture d'entreprise.

**1. Le soutien explicite d'un sponsor exécutif.** La transformation de l'architecture d'entreprise ne peut pas être un projet *bottom-up* exclusivement. Elle nécessite le soutien d'au moins un membre du *C-suite* — idéalement le CIO, mais potentiellement le CEO ou le CFO — qui légitime le repositionnement de la fonction et ouvre les portes des comités stratégiques. Le rapport Bizzdesign identifie le soutien de la direction comme l'un des facteurs les plus différenciants entre les leaders et les retardataires en architecture d'entreprise [1].

**2. La démonstration rapide de valeur mesurable.** La crédibilité de l'architecture d'entreprise se construit par des démonstrations concrètes de valeur, et non par des promesses de valeur future. Les *quick wins* de la Phase 1 sont essentiels pour établir la trajectoire. Selon McKinsey, les organisations réussissant leur transformation opérationnelle sont celles qui « équilibrent les gains rapides à court terme et les objectifs de transformation à long terme » [18].

**3. L'adoption du langage de la valeur business.** L'AE qui parle de couches, de composants et de standards ne sera jamais un interlocuteur stratégique. L'AE qui parle de risques, de rendements, de délais de mise en marché et de capacités concurrentielles l'est naturellement. Gartner note que les équipes EA doivent acquérir des « compétences en modélisation financière et en analyse pour motiver les investissements technologiques et prédire les sources de friction » [10].

**4. L'intégration dans le flux du changement plutôt que le contrôle à distance.** L'architecture d'entreprise qui opère en cycles trimestriels de gouvernance perd sa pertinence dans un monde agile. L'intégration dans les rituels de livraison — revues de sprint, planification de programme, rétrospectives — est un prérequis. L'étude CIO.com/Intelance note que l'EA moderne repose sur « la prise de propriété des résultats et des décisions, et non sur le théâtre des cadres de référence, la documentation interminable ou la gouvernance qui ne fait que bloquer la livraison » [19].

**5. Le développement continu des compétences.** La transformation du rôle exige une transformation parallèle des compétences. Les architectes qui investissent dans les compétences IA bénéficient d'une prime salariale de 25 à 50 % [20], confirmant que le marché valorise cette évolution. Le plan de montée en compétences de la Phase 1 doit être exécuté avec discipline tout au long des trois phases.

**6. La construction méthodique des alliances interfonctionnelles.** Comme l'a montré la section 13.5, l'architecte ne peut pas élever sa fonction seul. Les alliances avec la finance, les RH, le juridique, l'innovation et la *data science* sont des catalyseurs indispensables. Les organisations avec une forte collaboration interdépartementale obtiennent des gains de performance IA supérieurs de 40 % [17].

**7. La mesure continue de la progression.** L'auto-diagnostic de la section 13.1 doit être répété à intervalles réguliers — tous les six mois est une cadence recommandée — pour mesurer la progression, identifier les stagnations et ajuster la feuille de route. Ce qui ne se mesure pas ne se gère pas.

##### Les pièges à éviter

L'analyse des échecs documentés et des obstacles les plus fréquents permet d'identifier huit pièges qui menacent l'élévation stratégique de l'architecture d'entreprise.

**Piège 1 : Le « big bang » organisationnel.** Tenter de transformer l'ensemble du modèle opérationnel EA en une seule vague est une recette pour l'échec. McKinsey observe que les organisations échouent lorsqu'elles « tentent d'implémenter l'état cible complet sans investir dans les pratiques de développement, l'infrastructure et l'architecture nécessaires pour soutenir le développement distribué moderne » [18]. La feuille de route en trois phases est conçue pour éviter ce piège.

**Piège 2 : L'excès de documentation.** L'architecture d'entreprise traditionnelle souffre d'une réputation de machine à produire des documents que personne ne lit. L'élévation stratégique exige le mouvement inverse : moins de documents, plus d'analyses actionnables. BOC Group recommande une « documentation adaptative », réconciliation vivante entre la conception et le déploiement, où la documentation générée par machine est complétée par un contexte rédigé par l'humain [21].

**Piège 3 : L'isolement par rapport aux initiatives stratégiques.** L'architecture d'entreprise qui continue d'opérer dans un silo séparé des équipes portant le changement — équipes produit, équipes de données, cellules d'innovation — perd sa pertinence. L'intégration dans les flux de valeur est un impératif, et non une option.

**Piège 4 : La confusion entre gouvernance et contrôle.** La gouvernance IA efficace est un facilitateur qui accélère les projets en réduisant l'incertitude, et non un frein qui ralentit la livraison en ajoutant des étapes de validation. L'AE qui positionne la gouvernance comme un outil d'accélération plutôt que de contrôle gagne la confiance des équipes de livraison.

**Piège 5 : L'absence de métriques de valeur.** Une architecture d'entreprise qui ne peut pas démontrer sa contribution en termes mesurables est vulnérable aux coupes budgétaires. L'écart de 2,4 points entre l'importance perçue (8,7/10) et l'efficacité perçue (6,3/10) de l'architecture d'entreprise, mesuré par Info-Tech [5], reflète en partie cette incapacité à démontrer la valeur.

**Piège 6 : La dépendance excessive à un cadre unique.** TOGAF, Zachman, SABSA ou tout autre cadre de référence est un outil, pas une fin en soi. L'AE stratégique utilise les cadres de manière pragmatique, en combinant les éléments pertinents de chacun selon le contexte. Le chapitre 10 et l'Annexe D fournissent des orientations pour cette approche adaptative.

**Piège 7 : Sous-estimer la résistance au changement.** Environ 70 % des transformations organisationnelles échouent en raison d'un manque d'engagement des employés et d'une gestion du changement insuffisante [18]. L'élévation stratégique de l'EA implique des changements de rôles, de processus et de rapports hiérarchiques qui génèrent inévitablement de la résistance. L'alliance avec les RH et les compétences en gestion du changement sont des contre-mesures essentielles.

**Piège 8 : L'excès de dépendance à l'IA pour les analyses architecturales.** Comme l'a démontré le chapitre 6 (section 6.5), la confiance excessive dans l'IA générative est inversement corrélée à la pensée critique [22]. L'AE qui délègue systématiquement ses analyses à des outils d'IA sans exercer son jugement indépendant érode précisément la compétence qui fonde sa valeur stratégique.

[Tableau 13.3 — Synthèse : facteurs de succès vs pièges à éviter]

| Facteur de succès | Piège correspondant |
|---|---|
| Sponsor exécutif | *Big bang* sans soutien |
| Valeur mesurable rapide | Excès de documentation |
| Langage de la valeur business | Isolement des initiatives stratégiques |
| Intégration dans le flux | Confusion gouvernance/contrôle |
| Développement des compétences | Absence de métriques de valeur |
| Alliances interfonctionnelles | Dépendance à un cadre unique |
| Mesure continue | Sous-estimation de la résistance |
| — | Excès de dépendance à l'IA |

*Source : Synthèse des auteurs*

---

#### 13.7 Checklist d'auto-évaluation pour les leaders EA

La checklist suivante est conçue pour être utilisée immédiatement par un leader EA (responsable d'architecture d'entreprise, architecte principal ou CTO assumant la fonction EA) afin d'évaluer sa progression sur la feuille de route. Elle est structurée en quatre domaines : positionnement stratégique, compétences et ressources, gouvernance IA et alliances interfonctionnelles.

##### Domaine 1 — Positionnement stratégique

- [ ] L'équipe EA a réalisé un auto-diagnostic de maturité dans les 6 derniers mois (section 13.1, Annexe C)
- [ ] L'équipe EA dispose d'un sponsor exécutif identifié au niveau *C-suite*
- [ ] L'AE participe régulièrement (≥ mensuel) aux comités de direction ou aux comités d'investissement technologique
- [ ] L'AE a présenté au moins un briefing IA au *C-suite* dans le dernier trimestre
- [ ] L'AE a contribué à au moins une décision d'investissement majeure dans les 12 derniers mois
- [ ] La proposition de valeur de l'architecture d'entreprise est documentée et communiquée (catalogue de services EA)
- [ ] Des métriques de valeur EA sont définies, mesurées et rapportées (temps PoC→production, réutilisation, valeur business tracée)
- [ ] La priorité « fournir davantage d'analyses stratégiques à la haute direction » est inscrite dans les objectifs annuels de l'équipe

##### Domaine 2 — Compétences et ressources

- [ ] Un audit de compétences EA-IA a été réalisé dans les 12 derniers mois (Annexe B)
- [ ] Un plan de montée en compétences individualisé existe pour chaque membre de l'équipe
- [ ] Au moins un membre de l'équipe possède une certification IA ou est en cours de certification
- [ ] L'équipe maîtrise les fondamentaux de la modélisation financière (TCO, ROI, cas d'affaires)
- [ ] L'équipe pratique régulièrement le *storytelling* exécutif (visualisations stratégiques, narratifs fondés sur les données)
- [ ] Des exercices de pensée critique « sans IA » sont intégrés dans les pratiques de l'équipe
- [ ] L'équipe participe à au moins une communauté de pratique externe (The Open Group, IASA, conférences sectorielles)

##### Domaine 3 — Gouvernance IA

- [ ] Un registre des actifs IA de l'organisation est en place et maintenu à jour
- [ ] Une matrice de classification des risques IA est opérationnelle (alignée sur l'*EU AI Act*)
- [ ] Un guide d'utilisation de l'IA générative est approuvé et diffusé
- [ ] Une plateforme de gouvernance IA est en cours de déploiement ou opérationnelle (registre de modèles, garde-fous, tableau de bord)
- [ ] Les politiques de gouvernance IA sont intégrées dans les *pipelines* de développement (conformité automatisée)
- [ ] Un processus de surveillance continue des modèles en production est opérationnel
- [ ] L'inventaire du *Shadow AI* a été réalisé et des actions de régularisation sont en cours

##### Domaine 4 — Alliances interfonctionnelles

- [ ] L'AE a un interlocuteur identifié dans la direction financière pour les sujets IA
- [ ] Au moins un cas d'affaires IA a été co-construit avec la finance
- [ ] L'AE collabore avec les RH sur les référentiels de compétences IA et les programmes de formation
- [ ] L'AE collabore avec le juridique sur la classification des risques et la conformité réglementaire IA
- [ ] L'AE participe aux comités de sélection des projets d'innovation IA
- [ ] L'AE a un protocole de collaboration établi avec les équipes de *data science*
- [ ] L'AE fournit des *patterns* architecturaux réutilisables aux équipes de livraison (Annexe G)

**Interprétation :**
- **0-8 cases cochées :** Niveau 1-2 (Documentaire/Réactif). La transformation n'est pas engagée. Concentrer les efforts sur les actions de la Phase 1.
- **9-16 cases cochées :** Niveau 2-3 (Réactif/Contributeur). Les fondations sont en place. Accélérer la Phase 2.
- **17-24 cases cochées :** Niveau 3-4 (Contributeur/Partenaire stratégique). La transformation est en cours. Consolider les acquis et viser la Phase 3.
- **25-29 cases cochées :** Niveau 4-5 (Partenaire stratégique/Conseiller stratégique). L'élévation stratégique est avancée. Focaliser sur l'institutionnalisation et la gouvernance autonome.

---

#### 13.8 Appel à l'action pour les EAs et pour les dirigeants

##### Pour les architectes d'entreprise : le moment est maintenant

L'architecture d'entreprise se trouve à un point d'inflexion qui ne se reproduira pas. La convergence de trois forces — la diffusion massive de l'IA dans les organisations, l'intensification des exigences réglementaires et la prise de conscience des dirigeants que la technologie est indissociable de la stratégie — crée une fenêtre d'opportunité unique pour le repositionnement stratégique de la fonction.

Les données sont sans ambiguïté. Le marché valorise cette transformation : les architectes possédant des compétences en IA bénéficient d'une prime salariale de 25 à 50 % et la demande pour ces profils a augmenté de 67 % [20]. Les organisations en ont besoin : l'écart entre l'importance perçue de l'architecture d'entreprise (8,7/10) et son efficacité (6,3/10) représente un mandat explicite de transformation [5]. L'enquête PwC 2026 auprès de 4 400 CEO confirme que 56 % n'ont constaté ni augmentation de revenus ni réduction de coûts grâce à l'IA [8] — preuve que l'exécution IA échoue là où les fondations architecturales sont absentes.

**Cinq actions immédiates pour tout architecte d'entreprise :**

**1. Réaliser l'auto-diagnostic.** Utiliser la checklist de la section 13.7 et le template de l'Annexe C pour évaluer votre position actuelle. Soyez honnête : le diagnostic est un outil d'action, pas un exercice de conformité.

**2. Identifier votre premier *quick win*.** Quel est le livrable à fort impact et faible effort que vous pouvez produire dans les 30 prochains jours? Un registre des actifs IA? Une matrice de risques? Un guide de bonnes pratiques GenAI? Choisissez-en un et lancez-le.

**3. Investir dans vos compétences.** Inscrivez-vous à une formation en modélisation financière, en littératie IA ou en ingénierie des requêtes. Le retour sur investissement est documenté : les travailleurs possédant des compétences en IA bénéficient d'une prime salariale de 56 % par rapport à leurs pairs [23].

**4. Construire votre première alliance.** Identifiez un directeur financier, un responsable RH ou un juriste avec qui vous pouvez co-construire un livrable IA dans les 60 prochains jours. La co-création est le fondement de la crédibilité interfonctionnelle.

**5. Demander un siège à la table.** Sollicitez une invitation au prochain comité d'investissement technologique ou à la prochaine revue stratégique. Préparez un briefing de 15 minutes sur l'état du portefeuille IA et les risques associés. Ce premier pas est le plus difficile — et le plus déterminant.

##### Pour les dirigeants : l'architecture d'entreprise est votre alliée

Les CEO, CIO et CFO qui lisent ces lignes font face à un paradoxe : ils exigent une exécution IA à l'échelle, mais sous-investissent dans la fonction qui a la capacité de la rendre possible. L'architecture d'entreprise n'est pas un coût opérationnel : c'est le mécanisme par lequel la stratégie IA se traduit en capacités, en systèmes et en résultats mesurables.

Le *McKinsey Global Tech Agenda 2026* démontre que les organisations les plus performantes sont celles où les leaders technologiques sont profondément impliqués dans l'élaboration de la stratégie d'entreprise [9]. La moitié des répondants prévoient d'augmenter leurs budgets technologiques de plus de 4 % en 2026, et 28 % des entreprises les plus performantes prévoient une augmentation de plus de 10 % [9]. Ces investissements ne produiront de résultats que s'ils sont guidés par une architecture cohérente.

**Cinq actions pour les dirigeants qui veulent maximiser le retour sur leurs investissements IA :**

**1. Donner un mandat stratégique à l'architecture d'entreprise.** Formaliser le rôle de l'AE dans la stratégie IA de l'organisation. Inscrire la participation de l'AE dans les mandats des comités d'investissement et des revues stratégiques.

**2. Investir dans les compétences de l'équipe EA.** Allouer un budget de formation dédié à la montée en compétences des architectes en IA, en modélisation financière et en *storytelling* exécutif. Le rapport du Forum économique mondial confirme que 85 % des employeurs prévoient de prioriser la requalification de leur main-d'œuvre [6].

**3. Exiger la mesure de la valeur EA.** Demander à l'équipe EA de définir et de rapporter des métriques de valeur concrètes : temps de passage PoC→production, économies réalisées par la rationalisation du portefeuille, risques de non-conformité évités.

**4. Faciliter les alliances interfonctionnelles.** Mandater explicitement la collaboration entre l'architecture d'entreprise et les fonctions finance, RH, juridique, innovation et science des données. Créer les structures de gouvernance qui formalisent cette collaboration.

**5. Utiliser l'AE comme garant de la cohérence IA.** Dans un contexte où les initiatives IA se multiplient à travers l'organisation, désigner l'architecture d'entreprise comme la fonction responsable de la cohérence architecturale, de la gouvernance des modèles et de l'alignement entre les initiatives et la stratégie globale.

L'ère de l'IA ne rend pas l'architecture d'entreprise obsolète — elle la rend indispensable. Mais cette indispensabilité n'est pas automatique. Elle exige une transformation délibérée du rôle, des compétences et du positionnement de l'architecte d'entreprise. Cette feuille de route en trace le chemin. L'exécution appartient à chaque architecte et à chaque dirigeant qui choisit d'investir dans l'élévation stratégique de la fonction architecturale.

---

#### Points clés à retenir

> **1. L'auto-diagnostic est le point de départ obligatoire.** Le modèle de maturité EA-IA en cinq niveaux — documentaire, réactif, contributeur, partenaire stratégique, conseiller stratégique — permet à chaque équipe de situer son point de départ. L'écart entre l'importance perçue de l'EA (8,7/10) et son efficacité (6,3/10) confirme que la transformation est un impératif, pas une option.
>
> **2. La feuille de route en trois phases structure la transformation sur 36 mois.** Phase 1 (0-6 mois) : fondations, audit de compétences, *quick wins* de gouvernance IA, alignement avec le *C-suite*. Phase 2 (6-18 mois) : nouveau modèle opérationnel, plateforme de gouvernance IA, premières victoires stratégiques. Phase 3 (18-36 mois) : conseiller stratégique établi, gouvernance autonome, influence au *board*.
>
> **3. Les *quick wins* de gouvernance IA sont le vecteur de crédibilité le plus puissant.** Le registre des actifs IA, la matrice de classification des risques et le guide d'utilisation de l'IA générative sont des livrables à fort impact et faible effort qui modifient immédiatement la perception de l'architecture d'entreprise.
>
> **4. Les cinq alliances interfonctionnelles — finance, RH, juridique, innovation, *data science* — sont des catalyseurs non négociables.** Chaque alliance doit être fondée sur la co-création de valeur concrète, et non sur des déclarations d'intention. Les organisations avec une forte collaboration interfonctionnelle obtiennent des gains de performance IA supérieurs de 40 %.
>
> **5. Les facteurs de succès et les pièges sont documentés et prévisibles.** Sponsor exécutif, valeur mesurable rapide, langage business, intégration dans le flux du changement, compétences continues, alliances et mesure sont les sept facteurs de succès. Les pièges — *big bang*, documentation excessive, isolement, confusion gouvernance/contrôle — sont évitables par une planification rigoureuse.
>
> **6. La checklist de 29 items fournit un outil d'évaluation actionnable.** Elle couvre quatre domaines — positionnement stratégique, compétences et ressources, gouvernance IA, alliances interfonctionnelles — et permet de mesurer la progression à intervalles réguliers.

---

#### Transition

Ce chapitre a fourni la feuille de route concrète qui transforme les analyses des douze chapitres précédents en plan d'action. De l'auto-diagnostic de maturité aux trois phases de transformation, des alliances à construire aux pièges à éviter, chaque élément est conçu pour être utilisé immédiatement par un architecte d'entreprise en milieu de carrière qui cherche à repositionner sa fonction.

La conclusion du livre blanc consolidera les enseignements de l'ensemble de l'ouvrage et formulera la thèse centrale dans sa forme définitive : à l'ère de l'IA, l'architecture d'entreprise n'est pas une fonction support — c'est le mécanisme par lequel les organisations traduisent leur ambition stratégique en capacités opérationnelles, leurs investissements en valeur mesurable et leur exposition aux risques en gouvernance maîtrisée. L'architecte d'entreprise qui emprunte le chemin décrit dans cette feuille de route ne se contente pas de préserver sa pertinence — il se positionne comme l'un des acteurs les plus déterminants de la transformation IA de son organisation.

---

#### Références

[1] Bizzdesign, « 2025 State of Enterprise Architecture Report — New Findings », 2025. Disponible : https://bizzdesign.com/blog/2025-state-enterprise-architecture-report-new-findings

[2] Gartner, « ITScore Overview for Enterprise Architecture », 2025. Disponible : https://www.gartner.com/en/documents/3092223

[3] Forrester, « How Agentic AI Elevates The Enterprise Architect's Role », 2025. Disponible : https://www.forrester.com/blogs/the-future-of-the-enterprise-architects-job/

[4] ACL Digital, « Top 6 Enterprise Architecture Trends for 2026 and Beyond », 2026. Disponible : https://www.acldigital.com/blogs/top-6-enterprise-architecture-trends-shaping-2026-and-beyond

[5] Info-Tech Research Group, « CIO Priorities 2026 — CIOs Refocus on Value as AI Scales Across the Enterprise », 2026. Disponible : https://www.newswire.ca/news-releases/cio-priorities-2026-cios-refocus-on-value-as-ai-scales-across-the-enterprise-says-info-tech-research-group-in-new-report-815677724.html

[6] World Economic Forum, « Future of Jobs Report 2025 », janvier 2025. Disponible : https://www.weforum.org/publications/the-future-of-jobs-report-2025/

[7] Microsoft, « 2025 Annual Work Trend Index », 2025. Cité au chapitre 9.

[8] PwC, « 29th Global CEO Survey — Leading Through Uncertainty in the Age of AI », janvier 2026. Disponible : https://www.pwc.com/gx/en/issues/c-suite-insights/ceo-survey.html

[9] McKinsey, « McKinsey Global Tech Agenda 2026: How CIOs Are Shaping Enterprise Strategy and Growth », 2026. Disponible : https://www.mckinsey.com/capabilities/mckinsey-technology/our-insights/mckinsey-global-tech-agenda-2026

[10] Gartner, « 3 Trends Driving Enterprise Architecture Strategy in 2025 », 2025. Disponible : https://www.gartner.com/en/articles/2025-trends-for-enterprise-architecture

[11] Forrester, « The Augmented Architect: Real-Time Enterprise Architecture in the Age of AI », 2025. Disponible : https://www.forrester.com/blogs/the-augmented-architect-real-time-enterprise-architecture-in-the-age-of-ai/

[12] Cloudera, « 2026 Predictions: The Architecture, Governance, and AI Trends Every Enterprise Must Prepare For », 2026. Disponible : https://www.cloudera.com/blog/business/2026-predictions-the-architecture-governance-and-ai-trends-every-enterprise-must-prepare-for.html

[13] Publicis Sapient, « AI in Enterprise Architecture: The Power Move CIOs Can't Afford to Ignore », 2025. Disponible : https://www.publicissapient.com/insights/ai-in-enterprise-architecture

[14] Gartner, « The Gartner Enterprise Architecture Services Predictions for 2025 and Beyond », 2025. Disponible : https://www.gartner.com/en/webinar/719451/1615594

[15] Heidrick & Struggles, « AI and Leadership: How Finance, HR, and Technology Leaders Are Collaborating to Make the Most of AI Across the Enterprise », 2025. Disponible : https://www.heidrick.com/en/insights/digital-leadership/ai-and-leadership_how-finance-hr-technology-leaders-collaborate

[16] Forrester, « AI Predictions 2026 », 2025-2026.

[17] McKinsey, « AI in the Workplace: A Report for 2025 — Superagency in the Workplace: Empowering People to Unlock AI's Full Potential at Work », 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/superagency-in-the-workplace-empowering-people-to-unlock-ais-full-potential-at-work

[18] McKinsey, « How to Get Your Operating Model Transformation Back on Track », 2025. Disponible : https://www.mckinsey.com/capabilities/people-and-organizational-performance/our-insights/how-to-get-your-operating-model-transformation-back-on-track

[19] Intelance, « What Is Enterprise Architecture in 2025? The Brutal Truth for CIOs and CTOs », 2025. Disponible : https://www.intelance.co.uk/enterprise-architecture-2025/

[20] Research.com, « 2026 Enterprise Architect Careers: Skills, Education, Salary & Job Outlook », 2026. Disponible : https://research.com/advice/enterprise-architect-careers-skills-education-salary-job-outlook

[21] BOC Group, « Enterprise Architecture Trends for 2026 — Key Outlook Shaping EA », 2025. Disponible : https://www.boc-group.com/en/blog/ea/ea-outlook-trends-2025/

[22] M. Lee et al., « The Impact of Generative AI on Critical Thinking: Self-Reported Reductions in Cognitive Effort and Confidence Effects From a Survey of Knowledge Workers », Proceedings of CHI 2025, ACM, 2025. Disponible : https://dl.acm.org/doi/full/10.1145/3706598.3713778

[23] BeingGuru, « Your Business Will Lose Millions by 2026 If You Make These AI-Era Skills Mistakes », 2025. Disponible : https://www.beingguru.com/upskilling-future-workforce/

[24] Gartner, « Top Predictions for IT Organizations and Users in 2026 and Beyond », Gartner IT Symposium/Xpo 2025, octobre 2025. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-10-21-gartner-unveils-top-predictions-for-it-organizations-and-users-in-2026-and-beyond

[25] Superblocks, « Enterprise Architecture Strategy: The Ultimate Guide for 2026 », 2026. Disponible : https://www.superblocks.com/blog/enterprise-architecture-strategy
