### Chapitre 3 — L'évolution du rôle : de cartographe du SI à conseiller stratégique

<!-- Rôle argumentatif (PRD §3) : Le rôle EA évolue déjà vers le conseil stratégique (preuves Forrester, Gartner). -->

#### Introduction

Les deux premiers chapitres de ce livre blanc ont établi un double constat. Le chapitre 1 a mis en lumière un fossé de confiance de 77 points de pourcentage entre les CEO qui attendent de l'IA une contribution directe à la croissance du chiffre d'affaires et les CIO qui anticipent principalement des gains d'efficacité opérationnelle [1]. Le chapitre 2 a démontré que ce fossé est amplifié par une inadéquation structurelle entre les architectures d'entreprise héritées et les exigences de l'intelligence artificielle déployée à l'échelle de la production, avec un taux d'échec de 95 % au passage du prototype à la production [2]. Ces deux constats convergent vers une question centrale : qui, dans l'organisation, possède la vision transversale nécessaire pour réconcilier les ambitions stratégiques de la direction avec les réalités techniques de l'exécution?

Ce chapitre avance que l'architecte d'entreprise (AE) — ou *enterprise architect* (EA) — est précisément ce professionnel. Non pas dans sa posture historique de documentaliste du système d'information (SI), mais dans un rôle émergent de conseiller stratégique que les analyses récentes de Forrester, Gartner et McKinsey documentent avec une convergence remarquable. L'évolution n'est pas hypothétique : elle est déjà observable dans les organisations les plus matures et s'accélère sous la pression de l'IA. Ce chapitre retrace cette transformation en sept étapes — de la genèse historique du rôle jusqu'à la fonction de traducteur d'intentions *business* en systèmes IA-natifs — en s'appuyant sur des données empiriques, des cadres analytiques et des témoignages de praticiens.

#### 3.1 Perspective historique : l'EA comme fonction technique de documentation et de conformité

##### Les origines : de la planification des systèmes d'information à l'ontologie de Zachman

L'architecture d'entreprise en tant que discipline formelle est relativement jeune. Ses origines remontent aux années 1960, lorsque IBM développe la méthodologie *Business Systems Planning* (BSP — planification des systèmes d'affaires), une approche descendante visant à aligner les systèmes d'information avec les objectifs stratégiques de l'organisation [3]. Toutefois, c'est la publication de John Zachman en 1987, intitulée « A Framework for Information Systems Architecture » dans le *IBM Systems Journal*, qui est généralement considérée comme l'acte fondateur de la discipline [3] [4]. Le cadre de Zachman propose une ontologie — et non une méthodologie — organisant les représentations descriptives de l'entreprise selon six interrogations primitives (qui, quoi, pourquoi, quand, où, comment) croisées avec six perspectives (contextuelle, conceptuelle, logique, physique, détaillée, opérationnelle) [4].

Le cadre de Zachman constitue une avancée intellectuelle considérable, mais il porte en lui une caractéristique qui marquera durablement la perception du rôle : il s'agit fondamentalement d'un outil de classification. L'architecte d'entreprise, dans cette conception inaugurale, est celui qui remplit les cases de la matrice — un cartographe méthodique dont la valeur réside dans l'exhaustivité et la précision de ses représentations du système d'information existant.

##### L'ère TOGAF : la méthodologie au service de la conformité

Les années 1990 et 2000 voient l'émergence de cadres méthodologiques complémentaires. *The Open Group Architecture Framework* (TOGAF), publié pour la première fois au milieu des années 1990 et devenu le standard le plus largement adopté en architecture d'entreprise, fournit un processus itératif — l'*Architecture Development Method* (ADM — méthode de développement architectural) — qui guide l'architecte à travers les phases de définition, de conception et de mise en œuvre de l'architecture cible [3] [5]. En parallèle, des cadres gouvernementaux comme le *Federal Enterprise Architecture Framework* (FEAF) aux États-Unis et le *Department of Defense Architecture Framework* (DoDAF) pour le ministère de la Défense américain ancrent la pratique dans un contexte de conformité réglementaire et de reddition de comptes [3].

Le langage de modélisation *ArchiMate*, introduit par The Open Group en 2009, complète l'écosystème en offrant un vocabulaire visuel unifié pour représenter les concepts d'architecture d'entreprise [3]. Ces outils et méthodologies contribuent à la professionnalisation du rôle, mais ils renforcent également une perception spécifique de l'architecte d'entreprise : un praticien dont les livrables principaux sont des diagrammes, des matrices de conformité, des standards techniques et des documents de gouvernance.

##### Le piège de la documentation : l'EA comme « grenier poussiéreux »

Cette orientation documentaire produit des résultats prévisibles. Au fil des décennies, de nombreuses pratiques d'architecture d'entreprise se calcifient dans un cycle de production d'artefacts qui perdent leur pertinence entre deux mises à jour. Forrester décrit le référentiel d'architecture typique comme un « grenier poussiéreux rempli de diagrammes obsolètes » (*a dusty attic of outdated diagrams*) [6], une métaphore qui résonne auprès de quiconque a travaillé dans une organisation dotée d'une fonction EA. Les cycles de revue, qui s'étalent sur plusieurs semaines, fonctionnent en boucle ouverte (*open-loop*) : l'architecte documente un état, propose une cible, puis attend le prochain cycle pour mesurer l'écart — un rythme fondamentalement incompatible avec la vélocité des transformations numériques contemporaines [6].

Cette perception de l'EA comme fonction de documentation et de conformité n'est pas une caricature. Elle reflète une réalité organisationnelle dans laquelle l'architecte d'entreprise est souvent positionné en aval des décisions stratégiques, chargé de valider la conformité technique de choix déjà effectués plutôt que de contribuer à leur formulation. Le résultat est un cercle vicieux : marginalisé dans les décisions stratégiques, l'EA se replie sur ses livrables documentaires; perçu comme un producteur de documentation, il est exclu des conversations stratégiques.

[Figure 3.1 — Évolution historique du rôle de l'architecte d'entreprise. Axe horizontal : périodes (1960-1987 : origines BSP/IBM; 1987-2000 : ère Zachman; 2000-2020 : ère TOGAF/conformité; 2020-2026 : ère IA/conseil stratégique). Axe vertical : positionnement organisationnel (de fonction technique à fonction stratégique). La courbe montre une stagnation prolongée dans la zone « documentation et conformité » suivie d'une inflexion marquée à partir de 2020-2023.]

#### 3.2 Le point d'inflexion : pourquoi l'IA force les conversations stratégiques

##### L'IA n'est pas un projet technologique ordinaire

Les technologies précédentes — *cloud computing* (infonuagique), mobilité, mégadonnées (*big data*), Internet des objets (IdO) — ont certes transformé les systèmes d'information, mais elles l'ont fait dans un cadre conceptuel que l'architecte d'entreprise pouvait traiter avec ses outils traditionnels. L'IA, en revanche, impose un changement de nature. Comme le chapitre 2 l'a démontré, l'IA bouleverse simultanément les cinq dimensions architecturales — données, infrastructure, intégration, gouvernance et opérations — et exige des fondations que les architectures héritées ne possèdent pas.

Mais le point d'inflexion le plus significatif n'est pas technique : il est organisationnel. L'IA est la première technologie dont l'impulsion stratégique provient directement du sommet de l'organisation. Les données du chapitre 1 le confirment : 86 % des CEO estiment que les bénéfices de l'IA surpassent ses risques [7], et les CEO qui mentionnent l'IA comme priorité technologique majeure sont passés de 4 % à 24 % en un an [7]. Lorsque le CEO exige une stratégie IA et que le CIO ne dispose pas des fondations architecturales pour la concrétiser, l'organisation a besoin d'un intermédiaire capable de traduire l'intention stratégique en capacités techniques réalisables. Cet intermédiaire, par sa position à l'intersection du *business* et de la technologie, est l'architecte d'entreprise.

##### Le fossé comme opportunité de repositionnement

Le fossé CEO-CIO documenté au chapitre 1 — 80 % des CEO anticipent une croissance par l'IA contre 3 % des CIO [1] — crée un espace vacant dans l'organisation. Gartner identifie cette situation comme une opportunité directe pour l'EA : « Surmonter cette déconnexion et exploiter un potentiel de croissance plus fort par l'IA peut être difficile si la pratique EA manque de crédibilité auprès du *business* et/ou de l'IT » [1]. En d'autres termes, le fossé ne se comblera pas de lui-même — il requiert un acteur organisationnel doté d'une double compétence *business* et technique, capable de naviguer entre les langages et les temporalités des deux mondes.

Trois facteurs structurels renforcent cette opportunité de repositionnement :

**L'IA rend les conversations architecturales inévitables au niveau de la direction.** Lorsqu'un CEO demande « pourquoi notre *chatbot* (agent conversationnel) ne fonctionne-t-il pas comme celui de notre concurrent? », la réponse implique nécessairement des considérations de qualité des données, d'intégration de systèmes, de gouvernance et de sécurité — des domaines dans lesquels l'architecte d'entreprise possède une expertise structurelle. L'IA, par sa complexité transversale, fait remonter les enjeux architecturaux au niveau stratégique.

**L'IA démocratise l'accès aux technologies, mais complexifie la gouvernance.** Avec la prolifération des outils d'IA générative accessibles à tout employé, la gouvernance architecturale ne peut plus être un exercice périodique mené par une équipe isolée. Elle doit devenir une capacité continue, intégrée dans les processus décisionnels de l'organisation — un territoire naturel de l'architecte d'entreprise.

**L'IA menace directement les activités historiques de l'EA.** L'automatisation par l'IA générative des tâches de documentation, de modélisation et de vérification de conformité — les activités centrales de l'EA traditionnel — crée une pression existentielle. Comme le note Forrester, les agents d'IA peuvent désormais « automatiser la validation des données, la cartographie des capacités et la création d'artefacts » [8], libérant les architectes pour se concentrer sur la stratégie et la transformation. L'architecte qui ne se repositionne pas vers le conseil stratégique voit son rôle historique absorbé par les outils qu'il est censé gouverner.

##### Les trois tendances Gartner qui accélèrent l'inflexion

Gartner identifie trois tendances qui redéfinissent la stratégie EA en 2025, chacune poussant l'architecte vers un rôle plus stratégique [1] [9] :

1. **Le développement d'un nouveau modèle opérationnel fédéré.** Les organisations adoptent des conceptions organisationnelles fédérées et démocratisées, où les investissements numériques migrent de la fonction IT vers les fonctions *business*. L'EA doit développer un nouveau modèle opérationnel pour soutenir cette décentralisation tout en maintenant la cohérence architecturale.

2. **La rationalisation et la modernisation du portefeuille technologique.** La dette technique accumulée et la prolifération des systèmes exigent un effort de rationalisation que seul l'architecte d'entreprise, avec sa vision transversale du paysage applicatif, peut mener de manière systématique.

3. **L'élargissement des compétences vers la modélisation financière et l'IA.** Gartner recommande explicitement que les équipes EA acquièrent des compétences en modélisation financière, en architectures *data-driven* (orientées données), en modélisation de données et en développement et intégration de solutions IA [1]. Cette recommandation consacre le passage d'un profil purement technique à un profil hybride *business*-technique.

Ces trois tendances convergent vers un repositionnement de l'EA : de gardien de la conformité technique à catalyseur de la création de valeur par l'IA.

#### 3.3 De « *architect-as-creator* » à « *architect-as-curator* » : un nouveau paradigme

##### La fin du contrôle total

Le paradigme historique de l'architecture d'entreprise repose sur un modèle de « création » (*architect-as-creator*) : l'architecte conçoit les solutions, définit les standards, dessine les diagrammes, prescrit les technologies. Ce modèle suppose un contrôle centralisé sur les décisions architecturales, une connaissance exhaustive du paysage technologique et un rythme de changement suffisamment lent pour permettre des cycles de révision de plusieurs semaines.

L'IA rend ce modèle intenable pour trois raisons. Premièrement, la vélocité du changement dépasse la capacité de conception manuelle de tout individu ou équipe. Deuxièmement, la démocratisation des outils d'IA signifie que des décisions architecturales de facto sont prises quotidiennement par des acteurs non architectes dans l'ensemble de l'organisation. Troisièmement, les outils d'IA eux-mêmes sont capables de générer des propositions architecturales, des modèles de données et des diagrammes à une vitesse qui rend la production manuelle obsolète.

##### Le paradigme du curateur

Le nouveau paradigme — *architect-as-curator* (l'architecte comme curateur) — transforme fondamentalement la posture de l'architecte. Au lieu de créer chaque artefact, l'architecte curate, sélectionne, valide et orchestre les contributions provenant de multiples sources : les équipes de développement, les outils d'IA, les fournisseurs de plateformes et les métiers eux-mêmes [6] [10].

Forrester décrit cette transition de manière particulièrement éclairante : les architectes deviennent des « curateurs, facilitateurs et penseurs critiques » (*curators, facilitators, and critical thinkers*) soutenus par des copilotes basés sur les grands modèles de langage (LLM — *Large Language Models*) [6]. Le rôle se déplace vers l'« ingénierie de la requête » (*prompt engineering*) plutôt que vers la modélisation manuelle, l'IA prenant en charge les recommandations, la reconnaissance de motifs (*pattern recognition*) et la conversion de diagrammes, tandis que l'humain maintient les garde-fous de gouvernance [6].

Ce changement n'est pas une diminution du rôle — c'est une élévation. Le curateur opère à un niveau d'abstraction supérieur au créateur. Il ne dessine plus chaque composant du système; il définit les principes selon lesquels le système se compose, il évalue la qualité des propositions générées par l'IA et les équipes, il arbitre les tensions entre les exigences concurrentes des parties prenantes. L'analyste de la société InfoQ résume cette évolution : « Le futur architecte dessinera peut-être moins de diagrammes, mais il concevra davantage de sens — décidant quand laisser la machine penser et quand penser pour la machine » [10].

##### Les trois boucles de collaboration humain-IA

Le cadre analytique proposé par Gregor Hohpe et ses collaborateurs dans InfoQ offre un modèle opérationnel pour cette nouvelle posture. Il identifie trois modes de collaboration entre l'architecte et l'IA [10] :

**L'architecte dans la boucle (*Architect In The Loop* — AITL).** L'architecte et l'IA travaillent en collaboration, l'humain conservant l'autorité décisionnelle finale. L'IA génère des options et analyse les compromis; l'architecte révise, contextualise et approuve. Ce mode convient aux décisions stratégiques à fort impact : stratégie d'entreprise, sélection de plateformes, considérations éthiques [10].

**L'architecte sur la boucle (*Architect On The Loop* — AOTL).** L'IA opère de manière autonome dans des limites prédéfinies, l'architecte supervisant et intervenant en cas de besoin. Ce modèle représente « l'architecte bionique » — une relation symbiotique dans laquelle l'architecte investigue les espaces problématiques en utilisant l'IA pour diverger et converger vers des solutions [10]. Ce mode convient aux décisions d'impact moyen et répétables : revue de conception, optimisation des coûts.

**L'architecte hors de la boucle (*Architect Out Of The Loop* — AOOTL).** L'IA gère le travail architectural de manière indépendante, l'architecte se concentrant sur le méta-*design* — la définition des règles d'auto-adaptation, des boucles de rétroaction et des seuils d'escalade vers l'humain [10]. Ce mode, qui offre l'efficacité maximale mais comporte le risque le plus élevé, s'applique aux décisions à faible impact et haute fréquence : mise à l'échelle automatique (*autoscaling*), détection d'anomalies, correction de la dérive.

[Tableau 3.1 — Les trois boucles de collaboration architecte-IA]

| Mode | Rôle de l'architecte | Rôle de l'IA | Applicabilité | Niveau de risque |
|---|---|---|---|---|
| Dans la boucle (AITL) | Décideur final | Génère des options et analyse les compromis | Décisions stratégiques à fort impact | Faible |
| Sur la boucle (AOTL) | Superviseur et intervenant | Opère dans des limites prédéfinies | Décisions répétables d'impact moyen | Moyen |
| Hors de la boucle (AOOTL) | Méta-concepteur de règles | Opère de manière autonome | Automatisations à haute fréquence | Élevé |

*Source : adapté de Hohpe et al., « Where Architects Sit in the Era of AI », InfoQ, 2025 [10]*

Ce cadre illustre comment le paradigme du curateur se traduit en pratique quotidienne : l'architecte ne disparaît pas — il calibre dynamiquement son niveau d'intervention en fonction de l'impact et de la complexité de chaque décision.

#### 3.4 Les quatre rôles émergents selon Forrester : cartographe de valeur, stratège du jumeau numérique, curateur de la connaissance d'entreprise, gardien de la gouvernance

##### Un nouveau mandat pour l'architecte d'entreprise

L'analyse publiée par Forrester en 2025, intitulée « How Agentic AI Elevates The EA's Role », constitue l'une des contributions les plus structurantes à la redéfinition du rôle de l'architecte d'entreprise à l'ère de l'IA. Le rapport identifie un changement de mandat fondamental : l'architecte passe de l'optimisation IT à la création de valeur *business* (*from IT optimization toward business value creation*), devenant un « conseiller stratégique orchestrant des écosystèmes intelligents » [8].

Ce nouveau mandat se décline en quatre rôles émergents, chacun répondant à une facette spécifique des défis posés par l'IA agentique.

##### 3.4.1 Cartographe de valeur centré client (*Customer-Centric Value Mapper*)

Le premier rôle transforme l'architecte en cartographe des expériences clients et employés au sein des flux de valeur (*value streams*). L'architecte construit des graphes de connaissances (*knowledge graphs*) reliant les décisions architecturales aux résultats *business* mesurables [8]. Ce rôle marque une rupture fondamentale avec la cartographie traditionnelle du SI, qui documente les systèmes existants sans les relier explicitement aux indicateurs de création de valeur.

Dans la pratique, le cartographe de valeur ne se contente plus de répondre à la question « quels systèmes avons-nous? ». Il répond à « comment nos choix architecturaux influencent-ils l'expérience client et les résultats financiers? ». Cette traduction directe entre architecture et valeur *business* est précisément ce que les CEO recherchent lorsqu'ils évaluent la compétence IA de leurs équipes — et précisément ce que le fossé CEO-CIO empêche actuellement.

##### 3.4.2 Stratège du jumeau numérique (*Digital Twin Strategist*)

Le deuxième rôle positionne l'architecte comme un stratège exploitant les jumeaux numériques (*digital twins*) alimentés par l'IA pour simuler les options architecturales. L'architecte utilise ces répliques numériques de l'organisation pour « répéter les choix stratégiques et révéler les compromis » [8] avant de les engager dans la réalité. Ce rôle transforme l'architecture d'entreprise d'une pratique rétrospective — documenter ce qui existe — en une pratique prospective — simuler ce qui pourrait exister.

Les jumeaux numériques d'organisation (*Digital Twins of Organizations* — DTO) sont identifiés par les analystes comme une tendance majeure pour 2025-2026, permettant aux entreprises de créer des répliques numériques de leurs opérations en intégrant les données en temps réel [11]. Pour l'architecte d'entreprise, cette capacité change la nature même du dialogue avec la direction : au lieu de présenter des diagrammes statiques et des recommandations argumentées, il peut démontrer par la simulation l'impact de différents scénarios architecturaux sur les résultats *business*.

##### 3.4.3 Curateur de la connaissance d'entreprise (*Enterprise Knowledge Curator*)

Le troisième rôle consacre l'architecte comme gardien des couches sémantiques de l'organisation. L'architecte « gouverne les couches sémantiques et forme les équipes de données à la génération augmentée par la récupération (*Retrieval-Augmented Generation* — RAG) et au *GraphRAG* pour s'assurer que les résultats de l'IA s'appuient sur un contexte fiable » [8]. Ce rôle est d'une importance critique à l'ère de l'IA générative, où la qualité des résultats dépend directement de la qualité et de la structuration des données d'entreprise que les modèles consomment.

Le curateur de la connaissance d'entreprise opère à l'intersection de l'architecture de données, de la gouvernance de l'information et de la stratégie IA. Il est le garant que les systèmes d'IA de l'organisation ne « hallucinent » pas à partir de données incohérentes, obsolètes ou non autorisées, mais génèrent des résultats ancrés dans la réalité organisationnelle. Ce rôle répond directement à l'un des facteurs d'échec les plus fréquemment documentés dans le passage du PoC à la production : la qualité et la gouvernance des données.

##### 3.4.4 Gardien de la gouvernance agentique (*Agentic Governance Champion*)

Le quatrième rôle positionne l'architecte comme le gestionnaire des « fermes d'agents IA » (*AI agent farms*), responsable de l'établissement des garde-fous et des boucles de rétroaction garantissant la responsabilité et l'alignement des agents autonomes avec les objectifs *business* [8]. Ce rôle est le plus prospectif des quatre, mais aussi le plus urgent : à mesure que les organisations déploient des agents IA autonomes capables de prendre des décisions sans intervention humaine directe, la question de la gouvernance de ces agents devient un enjeu architecturale de premier ordre.

Le gardien de la gouvernance agentique ne se contente pas de définir des politiques statiques. Il conçoit des systèmes de surveillance continue, des mécanismes de validation en temps réel et des protocoles d'escalade qui garantissent que les agents IA opèrent dans les limites définies par l'organisation. Forrester note que « l'IA agentique est désormais une fonctionnalité centrale de chaque outil EA majeur » [8], avec des plateformes comme Celonis, SAP Signavio et ServiceNow intégrant ces capacités pour soutenir les décisions dans les domaines *business*, données, applicatifs et technologiques.

[Tableau 3.2 — Les quatre rôles émergents de l'architecte d'entreprise selon Forrester]

| Rôle | Description | Compétence clé | Valeur pour l'organisation |
|---|---|---|---|
| Cartographe de valeur | Relie les décisions architecturales aux résultats *business* mesurables | Graphes de connaissances, analyse de flux de valeur | Traduction directe architecture → valeur |
| Stratège du jumeau numérique | Simule les scénarios architecturaux avant mise en œuvre | Jumeaux numériques d'organisation, simulation | Décisions éclairées par la preuve |
| Curateur de la connaissance | Gouverne les couches sémantiques pour l'IA d'entreprise | RAG, *GraphRAG*, gouvernance des données | Qualité et fiabilité des résultats IA |
| Gardien de la gouvernance | Gère les agents IA et leurs garde-fous | Gouvernance agentique, boucles de rétroaction | Responsabilité et alignement des agents |

*Source : adapté de Forrester, « How Agentic AI Elevates The EA's Role », 2025 [8]*

#### 3.5 L'architecte augmenté : architecture continue en temps réel (Forrester — *The Augmented Architect*)

##### De l'architecture épisodique à l'architecture continue

L'un des apports conceptuels les plus significatifs des analyses récentes de Forrester est le passage de l'architecture « épisodique » — caractérisée par des cycles de revue périodiques et des mises à jour ponctuelles des référentiels — à l'architecture « continue » (*continuous architecture*), dans laquelle le référentiel d'architecture est alimenté en temps réel par des signaux opérationnels provenant de l'environnement de production [6].

Dans le modèle épisodique traditionnel, l'architecture d'entreprise fonctionne comme un « système en boucle ouverte » : l'architecte recueille des informations, produit des analyses, formule des recommandations, puis attend le prochain cycle de revue pour évaluer leur mise en œuvre. Ce rythme, mesuré en semaines ou en mois, crée un décalage structurel entre l'état documenté de l'architecture et son état réel. Dans le modèle continu, le référentiel d'architecture se transforme en « système d'exploitation vivant du changement » (*a living operating system for change*), alimenté par l'intégration en temps réel avec les pipelines de déploiement, les interfaces de programmation (*API — Application Programming Interfaces*) infonuagiques et les plateformes d'observabilité [6].

##### Les agents d'intelligence architecturale

Forrester identifie cinq types d'agents spécialisés qui alimentent cette architecture continue [6] :

**Les agents de récolte (*harvesting agents*).** Ils surveillent les signaux numériques provenant de l'environnement de production et extraient les connaissances pertinentes dans les entrepôts d'information architecturale. Ces agents transforment les traces de déploiement, les journaux d'événements et les métriques opérationnelles en données architecturales exploitables.

**Les agents de dépendances (*dependency agents*).** Ils cartographient les interdépendances entre les composants du système d'information en analysant à la fois les traces techniques (appels de services, flux de données) et les données architecturales déclarées. Cette cartographie dynamique des dépendances est un prérequis à toute analyse d'impact fiable.

**Les agents de cycle de vie (*lifecycle-aware agents*).** Ils identifient les technologies vieillissantes et diagnostiquent la dette technique en analysant les indicateurs de cycle de vie des composants du portefeuille applicatif. Ces agents permettent une gestion proactive de l'obsolescence plutôt qu'une réaction aux pannes.

**Les agents de conformité (*conformance agents*).** Ils valident automatiquement les propositions architecturales contre les standards et les motifs (*patterns*) approuvés par l'organisation. Ces agents transforment la conformité architecturale d'un exercice de revue périodique en une vérification continue et systématique.

**Les agents de sécurité et de coûts (*security and cost agents*).** Ils tracent les implications en matière de risque, de conformité réglementaire et de dépenses de chaque décision architecturale. Ces agents permettent une évaluation multidimensionnelle en temps réel de l'impact des choix architecturaux.

##### L'architecte augmenté, pas remplacé

L'aspect fondamental du modèle de l'architecte augmenté est qu'il positionne explicitement l'IA comme un amplificateur des capacités humaines, et non comme un substitut. Forrester insiste sur le fait que les architectes « deviennent des curateurs, des facilitateurs et des penseurs critiques » [6] — des rôles qui requièrent un jugement humain que l'IA ne peut pas reproduire : la compréhension du contexte politique de l'organisation, l'évaluation des enjeux éthiques, la négociation entre parties prenantes aux intérêts divergents, la capacité à formuler des recommandations qui tiennent compte de l'histoire et de la culture organisationnelle.

Le modèle de l'architecte augmenté résout un dilemme qui préoccupe de nombreux praticiens : l'IA va-t-elle rendre l'architecte d'entreprise obsolète? La réponse de Forrester est sans équivoque : l'IA rend obsolète l'architecte-documentaliste, mais elle amplifie la valeur de l'architecte-conseiller. La distinction entre ces deux postures devient existentielle pour les praticiens qui doivent choisir leur trajectoire professionnelle.

##### La démocratisation comme conséquence

Le modèle de l'architecte augmenté produit un effet secondaire significatif : la démocratisation de l'intelligence architecturale. Lorsque le référentiel d'architecture est continuellement mis à jour et accessible via des interfaces en langage naturel, les non-architectes — gestionnaires de produits, analystes d'affaires, directeurs de départements — peuvent « interroger les impacts *business*, la posture de sécurité et les implications financières » [6] de leurs décisions. L'architecture cesse d'être « un sacerdoce » (*a priesthood*) et devient une « alphabétisation partagée de l'entreprise » (*shared enterprise literacy*) [6].

Cette démocratisation ne diminue pas la valeur de l'architecte — elle la transforme. L'architecte passe du rôle de gardien exclusif de la connaissance architecturale à celui de concepteur et de gouverneur du système qui rend cette connaissance accessible à l'ensemble de l'organisation.

#### 3.6 Du « *server room* » au « *boardroom* » : traduire l'intention *business* en *design* système

##### L'élévation organisationnelle de l'architecte

L'expression « du *server room* au *boardroom* » (de la salle des serveurs à la salle du conseil d'administration) synthétise l'une des transformations les plus visibles du rôle de l'architecte d'entreprise. Historiquement ancré dans les considérations techniques d'infrastructure, l'architecte est progressivement invité — parfois poussé par nécessité — à participer aux conversations stratégiques au niveau de la direction.

Plusieurs facteurs convergent pour accélérer cette élévation. L'enquête de CIO.com sur le rôle de l'architecte moderne identifie huit « personas » que l'architecte contemporain doit incarner, dont celui de « conseiller de confiance » (*trusted advisor*) « fournissant des orientations crédibles sur les tendances technologiques, les risques et les opportunités au leadership *business* » [12]. L'architecte ne se contente plus de répondre aux questions techniques — il formule des recommandations stratégiques qui influencent les décisions d'investissement et la direction *business* de l'organisation.

Gartner renforce cette analyse en observant que les conseils d'administration et les fonctions *business* absorbent une part croissante des budgets d'investissement numérique au détriment de la fonction IT [1] [9]. Dans ce contexte de décentralisation budgétaire, l'architecte d'entreprise qui reste cantonné à la fonction IT perd progressivement sa pertinence. Celui qui se positionne comme interface entre les investisseurs *business* et les capacités technologiques gagne en influence et en valeur.

##### Les compétences du *boardroom*

L'élévation vers le *boardroom* exige un ensemble de compétences que la formation traditionnelle de l'architecte d'entreprise ne couvre pas systématiquement. Gartner recommande explicitement l'acquisition de compétences en modélisation financière et en analyse [1], une prescription qui marque une rupture avec le profil historique de l'architecte. L'architecte qui siège aux comités stratégiques doit pouvoir dialoguer dans le langage de la direction : retour sur investissement (ROI — *Return on Investment*), coût total de possession (TCO — *Total Cost of Ownership*), valeur actualisée nette (VAN), flux de valeur (*value streams*) et capacités *business*.

David Jones, cité dans l'analyse de CIO.com, identifie le « stratège » comme l'une des personas fondamentales de l'architecte moderne : celui qui « aligne la technologie avec la vision *business* et l'avantage concurrentiel » [12]. Cette compétence de stratège n'est pas un ajout marginal au rôle technique — elle en devient le noyau. L'architecte qui ne peut pas articuler la valeur *business* de ses recommandations architecturales ne sera pas entendu dans le *boardroom*, quelle que soit la rigueur technique de ses propositions.

##### Le rôle multi-facettes de l'architecte moderne

L'analyse de CIO.com propose un modèle à huit rôles qui illustre la complexité et l'étendue du positionnement moderne de l'architecte [12] :

1. **Conseiller de confiance** — Fournit des orientations crédibles à la direction
2. **Stratège** — Aligne technologie et vision *business*
3. **Innovateur/expérimentateur** — Identifie les opportunités et conduit des expérimentations contrôlées
4. **Navigateur** — Guide l'organisation à travers la complexité technologique
5. **Concepteur** — Équilibre les besoins *business* et les contraintes techniques
6. **Assembleur (*Jenga builder*)** — Compose des systèmes réutilisables et remplaçables
7. **Observateur-optimiseur** — Surveille et affine les performances en continu
8. **Guerrier de l'écosystème** — Gère les fournisseurs, la conformité et les dépendances inter-organisationnelles

Ce modèle multi-facettes confirme que l'architecte d'entreprise contemporain ne peut plus se définir par une seule compétence ou un seul livrable. Il est simultanément un technologue, un stratège, un communicateur et un gestionnaire de risques — un profil qui le positionne naturellement comme médiateur du fossé CEO-CIO identifié au chapitre 1.

#### 3.7 L'EA comme traducteur d'intentions *business* en capacités et en systèmes IA-natifs

##### Le problème de la traduction

L'un des facteurs les plus persistants de l'échec des initiatives IA en entreprise est le déficit de traduction entre l'intention *business* et la réalisation technique. Lorsque le CEO déclare vouloir « utiliser l'IA pour personnaliser l'expérience client », cette intention, formulée dans le langage du *business*, doit être traduite en une cascade de décisions architecturales : quelles données client collecter et gouverner? quels modèles d'IA déployer? sur quelle infrastructure? avec quels garde-fous éthiques et réglementaires? comment intégrer les résultats dans les systèmes CRM existants? comment mesurer l'impact sur les indicateurs *business* visés?

Cette traduction n'est ni automatique ni triviale. Elle requiert une compréhension simultanée des objectifs stratégiques, des capacités organisationnelles, des contraintes techniques et des enjeux de gouvernance. L'article de Built In résume cette fonction de connexion : l'architecture d'entreprise constitue « le tissu connectif entre les efforts déconnectés », permettant « une approche composable qui encourage la réutilisation, évite la duplication et permet aux motifs réussis de passer à l'échelle » [13].

##### Les quatre fonctions de traduction

L'EA comme traducteur d'intentions *business* exerce quatre fonctions distinctes identifiées par Built In dans son analyse de l'EA comme « chaînon manquant de l'IA à l'échelle » [13] :

**L'alignement *business* (*Business Alignment*).** Chaque initiative IA est liée à des objectifs *business* mesurables. L'architecte traduit l'intention stratégique — « augmenter les revenus par client de 15 % » — en spécifications architecturales — « déployer un moteur de recommandation alimenté par les données transactionnelles, comportementales et contextuelles du client ». Cette traduction garantit que les investissements IA servent des objectifs quantifiables plutôt que des ambitions vagues.

**L'intégration des systèmes (*System Integration*).** L'architecte cartographie les interdépendances entre les systèmes existants pour que les solutions IA soient construites sur une infrastructure évolutive et résiliente. Cette cartographie permet d'anticiper les points de friction techniques avant qu'ils ne se manifestent en production.

**La conscience des processus (*Process Awareness*).** L'architecte modélise l'impact de l'IA sur les flux de travail, les rôles et les responsabilités à travers l'organisation. Cette modélisation est indispensable pour éviter les déploiements IA qui perturbent les opérations sans apporter de valeur nette.

**La gouvernance et la responsabilité (*Governance and Accountability*).** L'architecte définit les structures de propriété, les protocoles de gestion des risques et les mécanismes de conformité qui garantissent une utilisation responsable de l'IA. La traçabilité de « l'origine de la logique IA, de l'endroit où elle impacte les processus et de l'endroit où la gouvernance doit être appliquée » [13] devient critique à mesure que les réglementations comme le règlement européen sur l'IA (*EU AI Act*) approchent de leur mise en application prévue en août 2026.

##### De la traduction ponctuelle à la traduction continue

Le modèle traditionnel de l'EA comme traducteur fonctionne par projets : une initiative est lancée, l'architecte traduit les exigences, le système est construit. Le modèle émergent, rendu possible par l'architecture continue décrite à la section 3.5, transforme cette traduction en un processus continu. L'architecte ne traduit plus une intention en une conception figée — il maintient une « vue continuellement mise à jour et contextuelle des dépendances entre la technologie, les personnes et les processus *business* » [13] qui permet à l'organisation d'adapter ses capacités IA en temps réel aux changements de la stratégie *business*.

Cette évolution est particulièrement critique dans le contexte de l'IA, où les modèles, les données et les conditions opérationnelles changent à un rythme qui rend les conceptions statiques rapidement obsolètes. L'architecte comme traducteur continu garantit que l'alignement entre l'intention *business* et l'exécution technique n'est pas un événement ponctuel mais un état maintenu en permanence.

##### L'IA comme levier de valeur mesurable et répétable

La contribution la plus transformatrice de l'EA comme traducteur est de faire de l'IA « un moteur mesurable et répétable de valeur d'entreprise » [13] plutôt qu'une collection d'expérimentations isolées. Sans l'EA, chaque initiative IA est un projet autonome avec ses propres données, son infrastructure, sa gouvernance et ses métriques. Avec l'EA, les initiatives IA partagent des fondations communes — plateformes de données gouvernées, cadres d'intégration standardisés, motifs architecturaux réutilisables — qui réduisent le coût et le délai de chaque nouveau déploiement.

[Figure 3.2 — L'architecte d'entreprise comme traducteur d'intentions *business* en systèmes IA-natifs. Schéma en trois colonnes. Colonne gauche : « Intention *business* » (objectifs stratégiques, KPI, flux de valeur). Colonne centrale : « Traduction EA » (alignement, intégration, processus, gouvernance). Colonne droite : « Système IA-natif » (données gouvernées, modèles déployés, agents orchestrés, métriques *business*). Des flèches bidirectionnelles entre les colonnes illustrent le caractère continu et itératif de la traduction.]

Le chapitre 2 a démontré que l'architecture est le facteur déterminant du passage de l'IA du PoC à la production. La présente section précise le mécanisme : c'est la capacité de l'architecte d'entreprise à traduire continuellement les intentions *business* en capacités techniques — et à maintenir cet alignement dans la durée — qui constitue le différenciateur entre les organisations qui accumulent les prototypes et celles qui déploient l'IA à l'échelle de la production.

##### Les données du marché : une validation par les talents et les salaires

L'évolution du rôle EA décrite dans ce chapitre n'est pas seulement documentée par les analystes — elle est validée par les signaux du marché de l'emploi. Les données de 2025-2026 révèlent une transformation rapide des attentes et des rémunérations [14] :

- 73 % des architectes d'entreprise utilisent désormais des outils IA quotidiennement.
- Les offres d'emploi pour les architectes d'entreprise dotés de compétences IA ont augmenté de 67 %.
- Les architectes d'entreprise augmentés par l'IA perçoivent des salaires de 250 000 $ à 350 000 $ US, soit une prime de 40 % par rapport aux rôles traditionnels.
- Plus largement, les professionnels de l'architecture dotés de compétences IA bénéficient de primes salariales de 25 à 50 % par rapport aux rôles traditionnels.

Ces données confirment que le marché valorise déjà l'architecte d'entreprise qui a opéré la transition du rôle technique vers le rôle de conseiller stratégique augmenté par l'IA. L'évolution décrite dans ce chapitre n'est pas une projection théorique — elle est une réalité économique mesurable.

---

> #### Points clés à retenir
>
> - **L'architecture d'entreprise comme discipline est passée par trois phases** : la classification ontologique (Zachman, 1987), la méthodologie de conformité (TOGAF, années 1990-2000) et, à partir de 2020-2023, le conseil stratégique catalysé par l'IA.
>
> - **L'IA constitue un point d'inflexion unique** car elle est la première technologie dont l'impulsion provient directement du CEO, forçant les conversations architecturales au niveau stratégique et menaçant simultanément les activités historiques de documentation de l'EA.
>
> - **Le paradigme passe de « créateur » à « curateur »** : l'architecte ne dessine plus chaque composant mais définit les principes de composition, évalue les propositions générées par l'IA et calibre dynamiquement son intervention selon le cadre des trois boucles (dans, sur, hors de la boucle).
>
> - **Forrester identifie quatre rôles émergents** : cartographe de valeur, stratège du jumeau numérique, curateur de la connaissance d'entreprise et gardien de la gouvernance agentique — chacun répondant à un défi spécifique de l'ère IA.
>
> - **L'architecte augmenté** opère dans un modèle d'architecture continue alimentée par cinq types d'agents IA (récolte, dépendances, cycle de vie, conformité, sécurité/coûts), transformant le référentiel d'un « grenier poussiéreux » en système d'exploitation vivant.
>
> - **L'élévation vers le *boardroom*** requiert de nouvelles compétences (modélisation financière, analyse de flux de valeur, langage *business*) et un positionnement multi-facettes validé par les données du marché de l'emploi.
>
> - **La fonction de traduction** — de l'intention *business* en capacités IA-natives — est le mécanisme par lequel l'EA comble concrètement le fossé CEO-CIO documenté au chapitre 1.

---

#### Transition

Ce chapitre a établi que le rôle de l'architecte d'entreprise évolue — de manière documentée et mesurable — vers le conseil stratégique. Les preuves convergent : les analyses de Forrester, les tendances identifiées par Gartner, les cadres proposés par les praticiens et les signaux du marché de l'emploi dessinent le portrait d'un professionnel dont la valeur réside de moins en moins dans la production de diagrammes et de plus en plus dans la capacité à traduire l'intention *business* en design système.

Mais démontrer que l'évolution est en cours ne suffit pas. Il reste à préciser comment l'architecte d'entreprise exerce concrètement ce rôle de conseiller stratégique au centre de la stratégie IA de l'organisation. Le chapitre 4 aborde cette question en examinant les mécanismes par lesquels l'EA se positionne comme traducteur entre la vision du CEO et la feuille de route technologique, éclaireur du possible face aux promesses de l'IA, facilitateur d'alignement entre le *business*, l'IT et les données, et architecte de la confiance qui restaure la crédibilité du CIO en matière d'IA.

---

#### Références

[1] Gartner, « 3 Trends Driving Enterprise Architecture Strategy in 2025 », Gartner, 2025. [En ligne]. Disponible : https://www.gartner.com/en/articles/2025-trends-for-enterprise-architecture

[2] S. Ransbotham et al., « The GenAI Divide: State of AI in Business 2025 », MIT Sloan Management Review et Boston Consulting Group, 2025.

[3] Capstera, « Evolution of Enterprise Architecture: A Historical Perspective », Capstera, 2024. [En ligne]. Disponible : https://www.capstera.com/evolution-enterprise-architecture/

[4] The Open Group, « A Historical Look at Enterprise Architecture with John Zachman », The Open Group Blog, 2015. [En ligne]. Disponible : https://blog.opengroup.org/2015/01/23/a-historical-look-at-enterprise-architecture-with-john-zachman/

[5] The Open Group, *TOGAF Standard, Version 9.2*, The Open Group, 2018.

[6] Forrester Research, « The Augmented Architect: Real-Time Enterprise Architecture In The Age Of AI », Forrester Blogs, 2025. [En ligne]. Disponible : https://www.forrester.com/blogs/the-augmented-architect-real-time-enterprise-architecture-in-the-age-of-ai/

[7] Gartner, « 2024 Gartner CEO and Senior Business Executive Survey », Gartner, 2024.

[8] Forrester Research, « How Agentic AI Elevates The EA's Role », Forrester Blogs, 2025. [En ligne]. Disponible : https://www.forrester.com/blogs/the-future-of-the-enterprise-architects-job/

[9] Gartner, « Enterprise Architecture Operating Model Primer for 2025 », Gartner, 2025.

[10] G. Hohpe et al., « Where Architects Sit in the Era of AI », InfoQ, 2025. [En ligne]. Disponible : https://www.infoq.com/articles/architects-ai-era/

[11] QualiWare, « Key Trends Shaping the Enterprise Architect's Role », QualiWare Blog, 2025. [En ligne]. Disponible : https://www.qualiware.com/blogs/post/key-trends-shaping-the-enterprise-architect-s-role

[12] D. Jones, « How Today's Enterprise Architect Juggles Strategy, Tech and Innovation », CIO.com, 2025. [En ligne]. Disponible : https://www.cio.com/article/3961637/how-todays-enterprise-architect-juggles-strategy-tech-and-innovation.html

[13] Built In, « Why Enterprise Architecture Is the Missing Link in Scalable AI », Built In, 2025. [En ligne]. Disponible : https://builtin.com/articles/enterprise-architecture-scalable-ai

[14] askCraig, « AI-Powered Architecture Careers 2025: Which Role Fits You? », askCraig, 2025. [En ligne]. Disponible : https://askcraig.ai/articles/architecture/ai-powered-architect-careers

[15] ACL Digital, « Top 6 Enterprise Architecture Trends Shaping 2026 and Beyond », ACL Digital Blog, janvier 2026. [En ligne]. Disponible : https://www.acldigital.com/blogs/top-6-enterprise-architecture-trends-shaping-2026-and-beyond

[16] BOC Group, « Enterprise Architecture Trends for 2026 – Key Outlook Shaping EA », BOC Group Blog, 2025. [En ligne]. Disponible : https://www.boc-group.com/en/blog/ea/ea-outlook-trends-2025/

[17] CDO TIMES, « How Agentic AI Elevates The Enterprise Architect's Role – Forrester », CDO TIMES, septembre 2025. [En ligne]. Disponible : https://cdotimes.com/2025/09/09/how-agentic-ai-elevates-the-enterprise-architects-role-forrester/

[18] Planview, « Enterprise Architecture as a Proactive Value Creator », Planview Blog, 2025. [En ligne]. Disponible : https://blog.planview.com/moving-enterprise-architecture-from-reactive-cost-centre-to-proactive-value-creator/

[19] InfoQ, « Architecture in the Age of AI: Change and Opportunity », InfoQ Minibook, 2025. [En ligne]. Disponible : https://www.infoq.com/minibooks/architecture-age-ai-opportunity/

[20] Bizzdesign, « The Professional Revolution: The Role of Enterprise Architect », Bizzdesign Blog, 2025. [En ligne]. Disponible : https://bizzdesign.com/blog/what-is-enterprise-architect-job-role-and-responsibilities

[21] Stack AI, « AI in Enterprise Architecture: Strategy, Design & Impact (2026) », Stack AI Blog, 2026. [En ligne]. Disponible : https://www.stack-ai.com/blog/the-role-of-ai-in-enterprise-architecture

[22] Research.com, « 2026 Enterprise Architect Careers: Skills, Education, Salary & Job Outlook », Research.com, 2026. [En ligne]. Disponible : https://research.com/advice/enterprise-architect-careers-skills-education-salary-job-outlook
