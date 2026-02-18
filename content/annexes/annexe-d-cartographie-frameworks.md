## Annexe D — Cartographie des frameworks EA et leur adaptation à l'IA

### D.1 Introduction

La section 10.5 du chapitre 10 a établi un principe fondamental : l'adoption d'un nouveau modèle opérationnel pour l'architecture d'entreprise (AE) ne nécessite pas l'abandon des cadres méthodologiques existants, mais leur adaptation aux spécificités de l'intelligence artificielle. L'analyse de 147 engagements d'AE entre 2019 et 2025 révèle que 87 % des implémentations réussies utilisent des cadres hybrides plutôt qu'une adhésion méthodologique pure [1].

Cette annexe approfondit cette analyse en fournissant une cartographie structurée de quatre cadres (*frameworks*) d'architecture d'entreprise majeurs — TOGAF, Zachman, Gartner EA *Framework* et SAFe — dans le contexte spécifique de leur adaptation à l'IA. Pour chaque cadre, l'annexe présente l'origine et les principes fondateurs, les forces et les limites dans le contexte IA, les adaptations spécifiques requises et les recommandations d'usage. Un tableau comparatif de synthèse et un guide de sélection complètent l'analyse pour aider les architectes d'entreprise à choisir le cadre — ou la combinaison de cadres — le plus adapté à leur contexte organisationnel.

L'objectif n'est pas d'établir une hiérarchie entre les cadres, mais de fournir aux praticiens les éléments de décision nécessaires pour effectuer un choix éclairé. Comme le souligne Intelance, « la valeur des cadres réside dans leur application contextuelle, pas dans leur application dogmatique » [1].

---

### D.2 TOGAF (*The Open Group Architecture Framework*)

#### D.2.1 Description

TOGAF est un cadre d'architecture d'entreprise développé par *The Open Group* depuis 1995. Sa dixième édition, publiée en 2022, marque une évolution significative vers une structure modulaire, une compatibilité accrue avec les méthodologies agiles et une plus grande flexibilité d'application [2]. TOGAF est adopté par environ 60 % des entreprises du *Fortune* 500 [3] et constitue le cadre d'AE le plus largement utilisé au niveau mondial, avec un écosystème de certification de plus de 100 000 professionnels accrédités [2].

Le cœur de TOGAF est l'*Architecture Development Method* (ADM), un processus itératif structuré en huit phases (A à H) plus une phase préliminaire, qui guide le développement de l'architecture depuis la vision stratégique jusqu'à la gouvernance et la gestion du changement. TOGAF 10 introduit une structure modulaire qui sépare les concepts fondamentaux (*Fundamental Content*), les orientations (*Guidance*) et les références (*Reference*), permettant aux organisations d'adopter les éléments pertinents sans être contraintes par un cadre monolithique [2].

Les principes structurants de TOGAF incluent :

- **L'itérativité** : le cycle ADM est conçu pour être répété, chaque itération raffinant l'architecture en fonction des retours d'expérience.
- **Le continuum d'entreprise** (*Enterprise Continuum*) : une taxonomie qui organise les artefacts architecturaux du générique au spécifique, facilitant la réutilisation.
- **La gouvernance architecturale** : un cadre de gouvernance intégré qui assure la conformité des décisions aux principes et standards établis.
- **L'approche par capacités** (*capability-based planning*) : introduite dans les versions récentes, cette approche relie les investissements technologiques aux capacités métier requises.

#### D.2.2 Forces dans le contexte IA

**Processus structuré et adaptable.** L'ADM fournit un processus éprouvé pour gérer la complexité des initiatives IA, qui requièrent une coordination entre de multiples parties prenantes (science des données, ingénierie, métier, conformité, sécurité). Chaque phase de l'ADM se transpose naturellement au contexte IA : la Phase A intègre la vision IA, les Phases B à D modélisent les composants IA comme des éléments architecturaux de premier ordre, et les Phases G et H assurent la gouvernance continue des modèles en production [4].

**Écosystème mature et outillé.** TOGAF dispose d'un écosystème d'outils (LeanIX, Ardoq, Mega, *iServer*) et de compétences largement disponible sur le marché. Le marché mondial des outils d'AE, dont TOGAF est le cadre dominant, est estimé entre 0,7 et 1,7 milliard USD en 2025 [5]. ArchiMetric observe que « les moteurs d'analyse pilotés par l'IA automatisent la détection des écarts en comparant l'architecture de référence actuelle avec l'architecture cible proposée » [4], ce qui confirme que l'outillage TOGAF intègre progressivement des capacités IA natives.

**Compatibilité avec ArchiMate.** TOGAF est nativement compatible avec ArchiMate, le langage de modélisation d'architecture d'entreprise de *The Open Group*. Cette compatibilité permet de modéliser formellement les composants IA (modèles, pipelines de données, services d'inférence, agents) dans un langage standardisé et interopérable [6].

**Cadre de gouvernance intégré.** La gouvernance architecturale de TOGAF — principes, standards, processus de conformité, gestion des dérogations — se transpose directement à la gouvernance des modèles IA, incluant la surveillance de la dérive (*model drift*), la conformité réglementaire et la gestion du *Shadow AI* (cf. chapitre 9).

#### D.2.3 Limites dans le contexte IA

**Lourdeur processuelle.** TOGAF, dans son application complète, implique un processus relativement lourd qui peut entrer en conflit avec la vélocité requise par les initiatives IA. Les cycles d'expérimentation en IA (prototypage rapide, itérations de modèles, tests A/B) s'accommodent difficilement d'un processus ADM séquentiel complet [3]. TOGAF 10 atténue cette limite avec sa structure modulaire et sa compatibilité agile, mais l'adaptation reste nécessaire.

**Orientation documentaire.** Malgré les évolutions de la dixième édition, TOGAF conserve une orientation vers la production d'artefacts documentaires qui peut devenir un frein dans un contexte IA où la priorité est la mise en production rapide de modèles. Le risque est que l'AE produise des artefacts TOGAF exhaustifs mais déconnectés de la réalité opérationnelle des équipes de science des données [7].

**Absence de guidance IA native.** TOGAF ne contient pas, dans sa version actuelle, de guidance spécifique pour l'architecture IA : pas de *building blocks* dédiés aux modèles d'apprentissage automatique, pas de *patterns* de référence pour les pipelines *MLOps*/*LLMOps*, pas de taxonomie des composants d'IA agentique. Cette guidance doit être construite par chaque organisation ou importée de sources complémentaires [8].

**Faible couverture de la gestion du changement humain.** TOGAF offre une couverture limitée de la gestion du changement organisationnel — un aspect critique de l'adoption de l'IA, où la résistance humaine et la transformation des rôles constituent des facteurs d'échec majeurs [3].

#### D.2.4 Adaptation spécifique à l'IA

L'adaptation de TOGAF au contexte IA repose sur les enrichissements suivants, qui complètent l'analyse amorcée à la section 10.5 du chapitre 10 :

**Enrichissement du *Content Metamodel*.** Le métamodèle de contenu TOGAF doit être étendu pour inclure des entités spécifiques à l'IA :

- *AI Model* (type, version, données d'entraînement, métriques de performance, propriétaire)
- *Data Pipeline* (source, transformations, fréquence, qualité, lignage)
- *Inference Service* (modèle desservi, latence, coûts, SLA)
- *AI Agent* (autonomie, périmètre d'action, garde-fous, supervision humaine)
- *Feature Store* (entités, caractéristiques calculées, fraîcheur, réutilisation)

**Adaptation des phases ADM.**

| Phase ADM | Adaptation IA |
|---|---|
| Préliminaire | Définir les principes architecturaux IA; établir le registre de modèles; former l'équipe AE à la littératie IA |
| A — Vision | Intégrer les ambitions IA dans la vision; utiliser les *capability heat maps* IA (cf. chapitre 5); définir les garde-fous éthiques |
| B — Architecture métier | Cartographier les capacités métier augmentées par l'IA; identifier les processus candidats à l'automatisation intelligente |
| C — Architecture SI | Modéliser les composants IA (modèles, pipelines, *feature stores*) comme des éléments SI de premier ordre; définir les contrats d'interface IA |
| D — Architecture technologique | Concevoir l'infrastructure *MLOps*/*LLMOps*; dimensionner les ressources GPU/TPU; définir l'architecture de déploiement (nuage, périphérie, hybride) |
| E — Opportunités et solutions | Évaluer les solutions IA selon les critères de maturité des données, gouvernance des modèles, explicabilité, risques de biais, coûts d'inférence |
| F — Plan de migration | Séquencer les capacités IA en fonction de la maturité des fondations (*Enterprise AI Fabric*, *data mesh*) |
| G — Gouvernance | Intégrer la surveillance de la dérive des modèles, la conformité réglementaire (*EU AI Act*), la gestion du *Shadow AI* |
| H — Gestion du changement | Assurer le réentraînement planifié des modèles; gérer l'évolution des agents IA; piloter la transformation des rôles humains |

[Tableau D.1 — Adaptation des phases TOGAF ADM au contexte IA]

**Intégration de *building blocks* IA.** Créer une bibliothèque de *Architecture Building Blocks* (ABB) et de *Solution Building Blocks* (SBB) spécifiques à l'IA, incluant : *pattern* RAG (*Retrieval-Augmented Generation*), *pattern* d'orchestration d'agents, *pattern* de *fine-tuning* distribué, *pattern* de gouvernance de modèles en production.

#### D.2.5 Recommandation d'usage

TOGAF est recommandé dans les contextes suivants :

- **Grandes organisations** avec une pratique d'AE établie souhaitant intégrer l'IA dans leur cadre méthodologique existant.
- **Secteurs réglementés** (finance, santé, gouvernement) où la traçabilité architecturale et la gouvernance formelle sont des exigences critiques.
- **Initiatives IA à l'échelle de l'entreprise** nécessitant une coordination entre de multiples domaines et équipes.
- **Organisations cherchant une certification reconnue** pour leurs architectes (TOGAF *Certified*, TOGAF *Practitioner*).

TOGAF est moins adapté aux petites organisations ou aux équipes IA autonomes opérant en mode *start-up*, où la lourdeur processuelle peut freiner l'expérimentation rapide.

---

### D.3 Le cadre Zachman (*Zachman Framework*)

#### D.3.1 Description

Le cadre Zachman est une ontologie d'architecture d'entreprise créée par John A. Zachman en 1987, initialement chez IBM, et formalisée dans sa version 3.0 actuelle [9]. Contrairement à TOGAF, Zachman n'est pas une méthodologie — il ne prescrit pas de processus ni de séquence d'activités. Il s'agit d'un schéma de classification qui organise les artefacts architecturaux selon une matrice bidimensionnelle croisant six perspectives (lignes) et six interrogations fondamentales (colonnes) [10].

**Les six colonnes (interrogations) :**

| Colonne | Interrogation | Objet |
|---|---|---|
| 1 | Quoi (*What*) | Données, entités, relations |
| 2 | Comment (*How*) | Fonctions, processus, transformations |
| 3 | Où (*Where*) | Réseaux, localisations, distribution |
| 4 | Qui (*Who*) | Personnes, rôles, responsabilités |
| 5 | Quand (*When*) | Temps, cycles, événements |
| 6 | Pourquoi (*Why*) | Motivations, objectifs, stratégies |

[Tableau D.2 — Les six colonnes du cadre Zachman]

**Les six lignes (perspectives) :**

| Ligne | Perspective | Rôle |
|---|---|---|
| 1 | Contexte (*Scope*) | Planificateur stratégique |
| 2 | Conceptuel (*Business Concepts*) | Propriétaire métier |
| 3 | Logique (*System Logic*) | Concepteur de systèmes |
| 4 | Physique (*Technology Physics*) | Constructeur |
| 5 | Détaillé (*Tool Components*) | Implémenteur |
| 6 | Opérationnel (*Operations Instances*) | Opérateur |

[Tableau D.3 — Les six perspectives du cadre Zachman]

La matrice résultante de 36 cellules constitue une taxonomie exhaustive qui garantit qu'aucune dimension de l'architecture n'est omise. Zachman lui-même définit son cadre comme « une ontologie — une théorie de l'existence d'un ensemble structuré de composants essentiels d'un objet pour lequel les descriptions explicites sont nécessaires à la gestion de l'objet » [10].

#### D.3.2 Forces dans le contexte IA

**Exhaustivité taxonomique.** La force principale de Zachman dans le contexte IA est sa capacité à « prévenir les angles morts » (*prevent blind spots*) [1]. L'IA introduit des dimensions nouvelles (biais algorithmiques, dérive de modèles, responsabilité éthique, explicabilité) qui peuvent être omises dans une approche non systématique. La matrice Zachman force l'organisation à considérer chaque dimension — le « quoi » des données d'entraînement, le « comment » de l'inférence, le « qui » de la responsabilité, le « quand » du réentraînement, le « pourquoi » de la valeur métier — de manière explicite et structurée.

**Neutralité méthodologique.** Zachman ne prescrivant pas de méthodologie, il est compatible avec n'importe quel processus de développement — agile, SAFe, *DevOps*, TOGAF ADM. Cette neutralité permet de l'utiliser comme couche de classification au-dessus d'un processus existant, sans conflit méthodologique [11].

**Adaptabilité inhérente.** L'approche ontologique de Zachman est intrinsèquement adaptable aux nouvelles technologies. Les six interrogations fondamentales (quoi, comment, où, qui, quand, pourquoi) sont universelles et s'appliquent aux systèmes IA aussi naturellement qu'aux systèmes traditionnels. CIO.com observe que « le cadre se prête à l'enrichissement pour de nouvelles technologies à condition que chaque cellule soit revisitée avec les questions pertinentes au contexte » [11].

**Capacité d'audit et de conformité.** La structure matricielle de Zachman offre une traçabilité complète entre les perspectives et les dimensions, ce qui facilite les audits de conformité — un avantage significatif dans le contexte réglementaire de l'IA (*EU AI Act*, loi 25 au Québec, normes ISO/IEC 42001) [1].

#### D.3.3 Limites dans le contexte IA

**Absence de processus.** Zachman ne fournit aucune indication sur la manière de remplir la matrice, la séquence des activités ou la gouvernance du processus. L'organisation doit définir elle-même son processus ou l'emprunter à un autre cadre (typiquement TOGAF ADM). Cette absence de guidance processuelle est particulièrement pénalisante pour les organisations qui débutent leur pratique d'AE orientée IA [11].

**Complexité de la matrice complète.** La matrice de 36 cellules, si elle est remplie exhaustivement, peut générer un volume d'artefacts considérable. Dans un contexte IA où la vélocité est critique, cette exhaustivité risque de devenir un frein plutôt qu'un atout. Les praticiens rapportent que peu d'organisations complètent la matrice dans son intégralité — la plupart se concentrent sur les cellules pertinentes à leur contexte [10].

**Absence de liaison avec les outils de modélisation.** Contrairement à TOGAF qui est compatible avec ArchiMate, Zachman ne dispose pas de lien formel avec un langage de modélisation standardisé. Les artefacts produits restent descriptifs plutôt qu'exécutables, ce qui limite leur utilité opérationnelle pour les équipes d'ingénierie IA [3].

**Faible écosystème de certification.** Zachman ne dispose pas d'un programme de certification aussi développé que TOGAF, ce qui rend plus difficile le recrutement et la formation de praticiens qualifiés.

#### D.3.4 Adaptation spécifique à l'IA

L'adaptation de Zachman au contexte IA repose sur l'enrichissement de chaque cellule de la matrice avec des questions spécifiques à l'IA. Cet enrichissement, amorcé à la section 10.5 du chapitre 10, est détaillé ci-dessous pour les six colonnes.

**Enrichissement de la colonne « Quoi » (données) :**

- Quelles sont les données d'entraînement, de validation et de test?
- Quel est le lignage (*lineage*) des données? Quels biais potentiels contiennent-elles?
- Quelles données sont nécessaires à l'inférence en temps réel?
- Comment les données synthétiques sont-elles générées et validées?
- Quels *feature stores* centralisent les caractéristiques réutilisables?

**Enrichissement de la colonne « Comment » (fonction) :**

- Quels types de modèles sont utilisés (LLM, classification, régression, agents)?
- Quels sont les paramètres de performance cibles (précision, rappel, latence)?
- Comment la dérive des modèles est-elle détectée et corrigée?
- Quels pipelines *MLOps*/*LLMOps* assurent le cycle de vie des modèles?
- Comment l'orchestration des agents IA est-elle gérée?

**Enrichissement de la colonne « Où » (réseau) :**

- Où s'exécute l'entraînement (nuage, sur site, hybride)?
- Où s'exécute l'inférence (nuage, périphérie, embarqué)?
- Quelles sont les contraintes de latence et de souveraineté des données?
- Comment les modèles sont-ils distribués à travers les régions géographiques?

**Enrichissement de la colonne « Qui » (personnes) :**

- Qui est responsable de la gouvernance de chaque modèle (*model owner*)?
- Qui supervise les agents autonomes? Qui arbitre les conflits éthiques?
- Quels sont les rôles humains dans la boucle (*human-in-the-loop*)?
- Qui valide les résultats des modèles à haut risque?

**Enrichissement de la colonne « Quand » (temps) :**

- Quand les modèles sont-ils réentraînés? Selon quelle fréquence?
- Quelle est la fenêtre de validité des prédictions?
- Quels sont les délais de conformité réglementaire?
- Quels événements déclenchent un réentraînement non planifié (dérive détectée, changement de distribution des données)?

**Enrichissement de la colonne « Pourquoi » (motivation) :**

- Quelle valeur métier le modèle crée-t-il? Comment cette valeur est-elle mesurée?
- Quel est le seuil d'acceptabilité du risque pour ce cas d'usage?
- Quel est le coût total de possession (*TCO*) du modèle en production?
- Comment le ROI de l'initiative IA est-il calculé et suivi?

[Tableau D.4 — Matrice Zachman enrichie pour l'IA — exemples de questions par cellule (perspective « Conceptuel »)]

| | Quoi (Données) | Comment (Fonction) | Où (Réseau) | Qui (Personnes) | Quand (Temps) | Pourquoi (Motivation) |
|---|---|---|---|---|---|---|
| **Question IA** | Lignage des données d'entraînement? Biais documentés? | Type de modèle? Métriques de performance? | Lieu d'inférence? Souveraineté? | Propriétaire du modèle? Superviseur? | Fréquence de réentraînement? | Valeur métier tracée? ROI? |

#### D.3.5 Recommandation d'usage

Zachman est recommandé dans les contextes suivants :

- **Organisations nécessitant une gestion documentaire exhaustive** des artefacts IA pour des raisons de conformité, d'audit ou de réglementation.
- **Initiatives de gouvernance IA transversales** où l'exhaustivité taxonomique est nécessaire pour couvrir l'ensemble des dimensions (technique, humaine, réglementaire, éthique).
- **Utilisation conjointe avec un cadre méthodologique** (TOGAF, SAFe) pour structurer la classification des artefacts sans dupliquer le processus.
- **Organisations à forte culture de documentation** (gouvernement, défense, santé) où la traçabilité complète est une exigence.

Zachman est moins adapté aux organisations cherchant un cadre opérationnel « clé en main » ou aux équipes IA à la recherche d'orientations processuelle concrètes.

---

### D.4 Gartner EA *Framework*

#### D.4.1 Description

Le cadre d'architecture d'entreprise de Gartner n'est pas un cadre formalisé et publié au même titre que TOGAF ou Zachman. Il s'agit d'un ensemble de pratiques, de modèles et de recommandations issus de la recherche de Gartner, communiqués principalement à travers ses publications analytiques, ses modèles de maturité et ses conférences [12]. Gartner préfère le terme « pratique d'architecture d'entreprise » (*EA practice*) à celui de « cadre » (*framework*), soulignant que l'AE est une discipline évolutive plutôt qu'un artefact méthodologique statique [13].

Les composantes clés de l'approche Gartner incluent :

**La stratégie par couches de vélocité (*Pace-Layered Application Strategy*).** Ce modèle classifie les applications en trois couches selon leur rythme de changement : systèmes d'enregistrement (*Systems of Record*), systèmes de différenciation (*Systems of Differentiation*) et systèmes d'innovation (*Systems of Innovation*) [14]. Chaque couche requiert des pratiques de gouvernance, de développement et de gestion du changement différentes.

**Le modèle d'AE fédéré.** Comme détaillé à la section 10.1 du chapitre 10, Gartner recommande un modèle opérationnel fédéré qui distribue l'expertise architecturale dans les unités d'affaires tout en maintenant une coordination stratégique centrale [13].

**L'AE orientée résultats (*outcome-driven EA*).** Gartner insiste sur le fait que l'AE doit être évaluée non par ses livrables (artefacts, diagrammes, standards) mais par ses résultats métier (réduction des coûts, accélération de la mise en marché, atténuation des risques) [13].

**Le modèle de maturité EA.** Gartner propose un modèle de maturité en cinq niveaux qui évalue la progression de la pratique d'AE, de la documentation technique initiale à la co-décision stratégique avec le *C-suite* [12].

#### D.4.2 Forces dans le contexte IA

**Vision stratégique actualisée.** La force principale de Gartner réside dans la pertinence et l'actualité de ses recommandations. Les trois tendances Gartner 2025 pour l'AE — modèle fédéré, rationalisation technologique, compétences élargies (cf. section 10.1) — intègrent directement les enjeux IA [13]. Gartner prévoit que 40 % des applications d'entreprise intégreront des agents IA spécifiques à leurs tâches d'ici 2026, contre moins de 5 % en 2025 [15].

**Alignement métier natif.** L'orientation résultats de Gartner correspond directement aux exigences de l'IA, où la justification des investissements par la valeur métier est critique. La stratégie par couches de vélocité permet de positionner les initiatives IA selon leur nature : les modèles IA de productivité interne (couche d'enregistrement), les solutions IA de différenciation client (couche de différenciation) et les expérimentations IA disruptives (couche d'innovation) [14].

**Pragmatisme opérationnel.** Gartner privilégie les recommandations actionnables sur les modèles théoriques. Ses guides d'implémentation incluent des indicateurs de maturité, des jalons mesurables et des *patterns* organisationnels éprouvés qui permettent aux organisations de progresser par étapes sans être accablées par la complexité méthodologique.

**Recherche quantitative fondée sur des données.** Les recommandations de Gartner s'appuient sur des enquêtes à grande échelle auprès de dirigeants et de praticiens. Cette base empirique — par exemple, le constat que 62 % des leaders stratégiques estiment que leur modèle opérationnel actuel ne supporte plus leurs objectifs [16] — confère une crédibilité particulière aux diagnostics et aux orientations proposées.

#### D.4.3 Limites dans le contexte IA

**Cadre non formalisé.** L'absence d'un cadre formalisé et librement accessible rend difficile l'adoption standardisée. Les recommandations de Gartner sont distribuées à travers des centaines de publications qui évoluent constamment, ce qui complique la constitution d'un corpus méthodologique cohérent et stable [12].

**Dépendance à l'abonnement.** L'accès aux recommandations détaillées de Gartner nécessite un abonnement qui représente un coût significatif, particulièrement pour les organisations de taille intermédiaire. Cette barrière à l'entrée limite la diffusion et l'adoption du cadre.

**Absence de langage de modélisation.** Gartner ne propose pas de langage de modélisation standardisé (comme ArchiMate pour TOGAF). Les artefacts produits selon l'approche Gartner dépendent des outils choisis par chaque organisation, ce qui réduit l'interopérabilité.

**Prescriptions génériques.** Les recommandations de Gartner, destinées à un public large, peuvent manquer de spécificité pour des contextes organisationnels particuliers. L'adaptation au contexte est laissée à la responsabilité de chaque organisation.

#### D.4.4 Adaptation spécifique à l'IA

L'adaptation de l'approche Gartner au contexte IA s'articule autour de trois axes principaux :

**Axe 1 : Extension de la stratégie par couches de vélocité à l'IA.**

| Couche | Applications traditionnelles | Extension IA |
|---|---|---|
| Systèmes d'enregistrement | ERP, CRM, SIRH | Modèles IA intégrés aux processus cœur (scoring de risque, détection de fraude, prédiction de demande) |
| Systèmes de différenciation | Applications métier spécifiques | Solutions IA de différenciation (recommandation personnalisée, tarification dynamique, maintenance prédictive) |
| Systèmes d'innovation | Prototypes, expérimentations | Expérimentations IA disruptives (agents autonomes, IA générative, jumeaux numériques cognitifs) |

[Tableau D.5 — Extension de la stratégie par couches de vélocité à l'IA]

**Axe 2 : Intégration de l'IA dans le modèle fédéré.** Le modèle fédéré recommandé par Gartner (cf. section 10.1) doit expliciter la répartition des responsabilités IA entre le niveau central (principes directeurs IA, standards de gouvernance des modèles, politiques de données) et le niveau décentralisé (choix des modèles spécifiques, décisions d'implémentation, priorisation des cas d'usage IA par domaine). Cette distinction est particulièrement critique pour prévenir à la fois le *Shadow AI* (décentralisation sans gouvernance) et la paralysie décisionnelle (centralisation excessive).

**Axe 3 : Métriques de maturité IA.** Le modèle de maturité Gartner peut être enrichi d'une dimension IA qui évalue la progression de l'organisation sur des critères tels que : gouvernance des modèles en production, taux de réutilisation des capacités IA, couverture *MLOps*, intégration des considérations éthiques, et contribution mesurée de l'IA aux résultats métier.

#### D.4.5 Recommandation d'usage

Gartner EA *Framework* est recommandé dans les contextes suivants :

- **Organisations cherchant un cadrage stratégique** de leur pratique d'AE orientée IA, sans nécessairement adopter un cadre méthodologique formel.
- **Comités exécutifs et directions des technologies** nécessitant des repères de maturité et des recommandations actionnables fondées sur des données empiriques.
- **Organisations déjà abonnées à Gartner** qui peuvent capitaliser sur l'accès aux publications, aux modèles et aux analystes pour accélérer leur transformation.
- **Utilisation conjointe avec un cadre formel** (TOGAF ou SAFe) pour fournir la vision stratégique et les repères de maturité que le cadre formel ne couvre pas.

Gartner est moins adapté aux organisations cherchant un cadre méthodologique autonome et formalisé, ou aux praticiens nécessitant des guides d'implémentation technique détaillés.

---

### D.5 SAFe (*Scaled Agile Framework*)

#### D.5.1 Description

SAFe (*Scaled Agile Framework*) est un cadre de mise à l'échelle de l'agilité créé par Dean Leffingwell et maintenu par Scaled Agile, Inc. Sa version 6.0, publiée en 2023, est le cadre de mise à l'échelle agile le plus largement adopté, avec 53 % des organisations pratiquant l'agilité à l'échelle qui l'utilisent selon le *State of Agile Report* [17]. SAFe intègre les principes du *Lean*, de l'agilité et du *DevOps* dans un cadre organisationnel structuré autour de quatre niveaux : équipe, programme (*Agile Release Train*), solution et portefeuille.

La spécificité de SAFe dans le contexte de l'AE est sa compétence « *Enabling Agility with Enterprise Architecture* » (EAEA), qui intègre les pratiques d'architecture d'entreprise dans le contexte du *Lean Portfolio Management* [18]. Cette compétence définit le rôle de l'architecte d'entreprise dans SAFe, ses responsabilités et ses mécanismes d'interaction avec les équipes agiles.

Les principes structurants de SAFe pertinents pour l'AE incluent :

- **L'architecture intentionnelle (*Intentional Architecture*).** SAFe distingue l'architecture émergente (qui naît des décisions des équipes) et l'architecture intentionnelle (qui est définie par les architectes pour assurer la cohérence à l'échelle). Les deux sont nécessaires et complémentaires [18].
- **L'architecture comme *enabler*.** Dans SAFe, les initiatives architecturales sont modélisées comme des *enablers* — des éléments du *backlog* qui créent les fondations nécessaires aux fonctionnalités métier sans délivrer directement de valeur utilisateur.
- **Le *Lean Portfolio Management* (LPM).** L'AE est intégrée dans la gestion de portefeuille *Lean*, qui aligne les investissements technologiques sur la stratégie d'entreprise à travers des thèmes stratégiques, des *value streams* et un financement *Lean* (*Lean Budgeting*) [19].
- **Le *PI Planning*.** L'événement de planification d'incrément de programme (*Program Increment Planning*), qui réunit toutes les équipes d'un *Agile Release Train*, constitue un moment clé d'intégration des orientations architecturales.

#### D.5.2 Forces dans le contexte IA

**Intégration native dans les flux de livraison.** La force principale de SAFe dans le contexte IA est l'intégration de l'architecture dans les flux de livraison agile. Contrairement à TOGAF, où l'AE opère en parallèle des équipes de livraison, SAFe place les architectes directement dans les *Agile Release Trains*, les *PI Plannings* et les processus de gestion du *backlog* [18]. Cette intégration résout directement le problème d'isolement de l'AE décrit à la section 10.3 du chapitre 10.

**Mécanismes de priorisation explicites.** SAFe fournit des mécanismes de priorisation (WSJF — *Weighted Shortest Job First*) qui permettent de comparer objectivement les initiatives IA avec les autres initiatives du portefeuille. Les *enablers* architecturaux IA sont évalués selon les mêmes critères que les *features* métier, ce qui favorise la transparence et l'alignement stratégique [19].

**Scalabilité organisationnelle.** SAFe est explicitement conçu pour fonctionner à l'échelle de l'entreprise, avec des mécanismes de coordination entre les *value streams* et les *Agile Release Trains*. Cette scalabilité est pertinente pour les déploiements IA qui impliquent de multiples équipes, de multiples domaines et de multiples flux de valeur.

**Programme *AI-Native*.** Scaled Agile a lancé le programme *AI-Native*, une formation et certification autonome conçue pour les professionnels qui doivent combler le fossé d'adoption de l'IA en entreprise [20]. Ce programme, qui ne requiert pas de connaissance préalable de SAFe, constitue un complément direct pour les organisations SAFe souhaitant accélérer leur intégration de l'IA.

**Rythme de livraison structuré.** Les *Program Increments* (PI) de SAFe — cycles de 8 à 12 semaines — fournissent un rythme naturel pour les livraisons IA : entraînement et validation de modèles pendant le PI, mise en production à la fin du PI, rétrospective et ajustement au début du PI suivant.

#### D.5.3 Limites dans le contexte IA

**Couverture architecturale limitée.** SAFe, conçu comme un cadre de mise à l'échelle agile, offre une couverture architecturale moins profonde que TOGAF. La compétence EAEA fournit des principes directeurs mais pas de processus détaillé équivalent à l'ADM pour développer une architecture d'entreprise complète [18]. Les organisations qui nécessitent une gouvernance architecturale exhaustive doivent compléter SAFe avec un cadre dédié.

**Orientation livraison plutôt que vision.** SAFe est fondamentalement orienté vers la livraison de valeur à travers des incréments. Cette orientation peut minimiser le travail de vision architecturale à long terme nécessaire pour les transformations IA majeures — par exemple, la refonte d'une architecture de données ou la mise en place d'un *Enterprise AI Fabric* (cf. chapitre 7) [7].

**Complexité organisationnelle.** SAFe, dans sa configuration complète (*Full SAFe*), est un cadre organisationnel complexe qui requiert une transformation significative. Les organisations qui n'ont pas encore adopté SAFe pour leur livraison logicielle ne devraient pas l'adopter uniquement pour ses capacités d'AE.

**Prescriptions rigides.** Certains praticiens critiquent SAFe pour sa rigidité prescriptive, qui peut entrer en conflit avec la nature expérimentale des initiatives IA où l'adaptation rapide et les pivots fréquents sont la norme [7].

**Absence de taxonomie architecturale.** SAFe ne fournit pas de taxonomie d'artefacts architecturaux comparable à celle de TOGAF ou Zachman. Les organisations doivent définir elles-mêmes la structure de leurs livrables architecturaux.

#### D.5.4 Adaptation spécifique à l'IA

L'adaptation de SAFe au contexte IA repose sur les enrichissements suivants :

**Enrichissement du *backlog* avec des *enablers* IA.** Le *portfolio backlog* doit inclure des *enablers* architecturaux spécifiques à l'IA, classés par type :

| Type d'*enabler* IA | Exemples |
|---|---|
| Infrastructure | Plateforme *MLOps*, *feature store*, infrastructure GPU, *data lakehouse* |
| Exploration | *Spike* d'évaluation d'un modèle fondation, prototype RAG, évaluation d'un fournisseur IA |
| Conformité | Mise en conformité *EU AI Act*, audit de biais, documentation de lignage des données |
| Architecture | Définition des contrats d'interface IA, *pattern* d'orchestration d'agents, stratégie de déploiement |

[Tableau D.6 — Types d'*enablers* IA dans le *portfolio backlog* SAFe]

**Intégration de l'IA dans le *PI Planning*.** Le *PI Planning* doit explicitement inclure :

- La présentation de la vision architecturale IA pour le PI à venir.
- L'identification des dépendances IA entre les équipes (données partagées, modèles réutilisés, services d'inférence mutualisés).
- L'allocation de capacité pour les *enablers* IA (recommandation : 20-30 % de la capacité de l'*Agile Release Train* pour les *enablers*, dont une proportion significative pour l'IA).

**Extension du rôle de l'architecte d'entreprise SAFe.** Le rôle de l'AE dans SAFe doit être élargi pour inclure :

- La gestion du registre de modèles IA et la supervision du portefeuille de capacités IA.
- La participation aux revues de modèles (validation des métriques de performance, évaluation de la dérive, conformité éthique).
- La définition des garde-fous (*guardrails*) IA — les principes non négociables que toutes les équipes doivent respecter.
- La coordination de la réutilisation des capacités IA entre les *Agile Release Trains*.

**Métriques IA dans les *Inspect & Adapt*.** Les événements *Inspect & Adapt* (I&A) de SAFe doivent intégrer des métriques IA spécifiques : taux de réutilisation des modèles, temps de passage du prototype à la production, taux de dérive détectée, conformité aux garde-fous éthiques.

#### D.5.5 Recommandation d'usage

SAFe est recommandé dans les contextes suivants :

- **Organisations déjà engagées dans SAFe** souhaitant intégrer les initiatives IA dans leur cadre de livraison existant.
- **Programmes IA impliquant de multiples équipes** nécessitant une coordination structurée (data engineers, data scientists, ML engineers, équipes métier).
- **Organisations privilégiant la vélocité de livraison** et l'intégration de l'IA dans les flux de travail agiles existants.
- **Initiatives IA de taille intermédiaire** (au sein d'un *Agile Release Train*) où la coordination entre 5 à 12 équipes est nécessaire.

SAFe est moins adapté aux organisations cherchant une gouvernance architecturale exhaustive ou une vision à long terme de l'architecture IA de l'entreprise sans cadre complémentaire.

---

### D.6 Tableau comparatif de synthèse

Le tableau ci-dessous compare les quatre cadres sur neuf critères clés, évalués sur une échelle qualitative (Faible / Modéré / Élevé) pour faciliter la prise de décision.

| Critère | TOGAF | Zachman | Gartner EA | SAFe |
|---|---|---|---|---|
| **Type** | Méthodologie (processus ADM) | Ontologie (taxonomie) | Pratique analytique (recommandations) | Cadre de mise à l'échelle agile |
| **Maturité du cadre** | Élevée (30+ ans, v10) | Élevée (37+ ans, v3.0) | Modérée (évolutif, non formalisé) | Élevée (12+ ans, v6.0) |
| **Couverture IA native** | Faible (pas de *building blocks* IA) | Faible (pas de questions IA prédéfinies) | Modérée (recherche IA intégrée) | Modérée (programme *AI-Native*) |
| **Processus d'implémentation** | Élevé (ADM détaillé) | Faible (pas de processus) | Modéré (orientations, pas de processus formel) | Élevé (*PI Planning*, cérémonies SAFe) |
| **Intégration dans les flux de livraison** | Faible (parallèle aux équipes) | Faible (outil de classification) | Modérée (recommandations d'intégration) | Élevée (architectes dans les ART) |
| **Gouvernance formelle** | Élevée (cadre de gouvernance intégré) | Modérée (traçabilité par la matrice) | Modérée (modèle de maturité) | Modérée (*guardrails* et *enablers*) |
| **Complexité d'adoption** | Élevée (formation, certification, outillage) | Modérée (compréhension de l'ontologie) | Faible (recommandations actionnables) | Élevée (transformation organisationnelle) |
| **Écosystème (outils, certifications)** | Élevé (ArchiMate, outils, 100K+ certifiés) | Faible (peu d'outils dédiés) | Modéré (publications, analystes) | Élevé (*SAFe Architect*, outils agiles) |
| **Compatibilité avec d'autres cadres** | Élevée (complémentaire à Zachman, SAFe) | Élevée (superposable à tout cadre) | Élevée (compatible avec tout cadre) | Modérée (principes propres) |

[Tableau D.7 — Comparaison synthétique des quatre cadres EA dans le contexte IA]

---

### D.7 Guide de sélection

Le choix du cadre (ou de la combinaison de cadres) approprié dépend de quatre facteurs contextuels : la maturité de la pratique d'AE, la taille et la complexité de l'organisation, le niveau de réglementation sectorielle et l'avancement dans l'adoption de l'IA.

#### D.7.1 Arbre de décision

```
                        QUEL(S) CADRE(S) EA POUR L'IA?
                                    │
                    ┌───────────────┴───────────────┐
                    │                               │
            Organisation déjà              Organisation sans
            engagée dans SAFe?             pratique SAFe
                    │                               │
              ┌─────┴─────┐                   ┌─────┴─────┐
              │           │                   │           │
            OUI         NON             Grande org.   PME / équipe
              │           │             réglementée    IA autonome
              │           │                   │           │
        SAFe + TOGAF    Pratique EA     TOGAF (ADM      Gartner
        (complémentaire) existante?     + gouvernance)  (orientations
              │           │                   │         stratégiques)
              │     ┌─────┴─────┐        + Zachman      + TOGAF léger
              │     │           │        (conformité)   (phases clés)
              │   OUI         NON             │
              │     │           │              │
              │  TOGAF       Gartner          │
              │  (enrichi    (démarrage       │
              │   IA)        rapide)          │
              │                               │
              └───────────────┬───────────────┘
                              │
                    Toujours enrichir avec
                    les questions Zachman IA
                    pour assurer l'exhaustivité
```

[Figure D.1 — Arbre de décision pour la sélection des cadres EA dans le contexte IA]

*L'arbre de décision guide le choix du cadre principal en fonction du contexte organisationnel. La recommandation finale est toujours d'enrichir le cadre choisi avec les questions Zachman IA (section D.3.4) pour garantir l'exhaustivité de la couverture.*

#### D.7.2 Scénarios de sélection

**Scénario 1 — Grande entreprise réglementée débutant sa transformation IA.**
Profil : banque, assureur, organisme gouvernemental avec une pratique d'AE TOGAF existante.
Recommandation : **TOGAF ADM enrichi IA** (cadre principal) + **Zachman** (couche de classification pour l'exhaustivité et la conformité) + **Gartner** (repères de maturité et tendances).
Justification : la traçabilité architecturale et la gouvernance formelle de TOGAF sont essentielles dans un environnement réglementé. L'enrichissement Zachman assure que les dimensions éthiques, de conformité et de responsabilité ne sont pas omises.

**Scénario 2 — Organisation agile à grande échelle intégrant l'IA dans ses produits.**
Profil : entreprise technologique ou grande entreprise ayant adopté SAFe pour sa livraison.
Recommandation : **SAFe** (cadre de livraison) + **TOGAF léger** (vision et gouvernance de haut niveau) + **Gartner** (stratégie par couches de vélocité pour classer les initiatives IA).
Justification : l'intégration de l'IA dans les flux de livraison SAFe existants minimise la disruption organisationnelle. TOGAF fournit la structure de gouvernance que SAFe ne couvre pas en profondeur.

**Scénario 3 — Organisation de taille intermédiaire lançant ses premières initiatives IA.**
Profil : entreprise de 500 à 5 000 employés, sans pratique d'AE formelle.
Recommandation : **Gartner** (cadrage stratégique et repères de maturité) + **TOGAF léger** (phases A, E, G de l'ADM pour la vision, la sélection de solutions et la gouvernance).
Justification : commencer par un cadrage stratégique Gartner évite la surcharge méthodologique. Un TOGAF allégé fournit les fondations processuelles minimales.

**Scénario 4 — Équipe IA autonome au sein d'une grande organisation.**
Profil : laboratoire d'innovation IA, centre d'excellence data science, équipe produit IA autonome.
Recommandation : **SAFe** (si l'organisation est SAFe) ou **approche légère Gartner** + **questions Zachman IA** (checklist de complétude).
Justification : l'équipe a besoin de vélocité et d'autonomie. Les questions Zachman IA servent de checklist pour s'assurer que les dimensions de gouvernance, d'éthique et de conformité ne sont pas négligées dans la course à la livraison.

#### D.7.3 Principes directeurs pour l'approche hybride

L'analyse des quatre cadres confirme le constat de la section 10.5 : les implémentations réussies utilisent des cadres hybrides. Trois principes guident la construction d'une approche hybride :

**Principe 1 — Un processus, une taxonomie, une stratégie.** L'approche hybride combine idéalement un cadre de processus (TOGAF ADM ou SAFe), une taxonomie de classification (Zachman) et une stratégie d'orientation (Gartner). Cette combinaison couvre les trois dimensions nécessaires : le « comment faire » (processus), le « quoi couvrir » (taxonomie) et le « vers où aller » (stratégie).

**Principe 2 — Adapter la profondeur au risque.** Toutes les initiatives IA ne requièrent pas le même niveau de rigueur architecturale. Les initiatives IA à haut risque (santé, finance, sécurité) justifient l'application complète de TOGAF ADM et de la matrice Zachman. Les initiatives IA à faible risque (automatisation interne, productivité) peuvent se contenter d'un processus allégé.

**Principe 3 — Évoluer avec la maturité.** L'approche hybride n'est pas statique. Une organisation qui débute avec une approche Gartner + TOGAF léger peut progressivement enrichir sa pratique en ajoutant la profondeur de TOGAF et l'exhaustivité de Zachman à mesure que sa maturité IA augmente et que les exigences de gouvernance se complexifient.

---

### D.8 Références

[1] Intelance, « The Ultimate Guide to Enterprise Architecture Frameworks (2026) », 2025. Disponible : https://www.intelance.co.uk/the-ultimate-guide-to-enterprise-architecture-frameworks/

[2] The Open Group, « The TOGAF Standard, 10th Edition », 2022. Disponible : https://www.opengroup.org/togaf

[3] CIO.com, « What is TOGAF? What the Enterprise Architecture Methodology Means for Your Business », 2025. Disponible : https://www.cio.com/article/228328/what-is-togaf-an-enterprise-architecture-methodology-for-business.html

[4] ArchiMetric, « How AI Accelerates TOGAF ADM for Enterprise Architecture », 2025. Disponible : https://www.archimetric.com/ai-powered-togaf-guide-through/

[5] Grand View Research, « Enterprise Architecture Tools Market Size, Share Report 2030 », 2025. Disponible : https://www.grandviewresearch.com/industry-analysis/enterprise-architecture-tools-market-report

[6] ArchiMetric, « TOGAF 10 and ArchiMate Next: A Synergistic Evolution for Modern Enterprise Architecture (2026 Outlook) », 2025. Disponible : https://www.archimetric.com/togaf-10-and-archimate-next-a-synergistic-evolution-for-modern-enterprise-architecture-2026-outlook/

[7] Advance Agility, « Agile Beyond SAFe 6.0: AI, Machine Learning & 2027 Trends », 2025. Disponible : https://www.advanceagility.com/blogs/beyond-safe-6-ai-first-era

[8] A. Verma, « TOGAF in the Age of AI: Architecting for Machine Learning and Automation », Medium, 2025. Disponible : https://medium.com/@amitvsolutions/togaf-in-the-age-of-ai-architecting-for-machine-learning-and-automation-f989fc37d3d4

[9] J. A. Zachman, « A Framework for Information Systems Architecture », IBM Systems Journal, vol. 26, no. 3, pp. 276-292, 1987.

[10] The Enterprise Architecture Center of Excellence (EACOE), « The Zachman Framework (Zachman Ontology) », 2025. Disponible : https://www.eacoe.org/zachman-framework

[11] CIO.com, « What is the Zachman Framework? A Matrix for Managing Enterprise Architecture », 2025. Disponible : https://www.cio.com/article/193229/what-is-the-zachman-framework-a-matrix-for-managing-enterprise-architecture.html

[12] Gartner, « Enterprise Architecture Operating Model Primer for 2025 », 2025. Disponible : https://www.gartner.com/en/documents/6251651

[13] Gartner, « 3 Trends Driving Enterprise Architecture Strategy in 2025 », 2025. Disponible : https://www.gartner.com/en/articles/2025-trends-for-enterprise-architecture

[14] Gartner, « Accelerating Innovation by Adopting a Pace-Layered Application Strategy », 2025. Disponible : https://www.gartner.com/en/documents/1890915

[15] Gartner, « Gartner Predicts 40% of Enterprise Apps Will Feature Task-Specific AI Agents by 2026 », 2025. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025

[16] Gartner, « Redefining Enterprise Architecture: Strategies for Post-Digital Success », 2025. Disponible : https://www.gartner.com/en/information-technology/topics/enterprise-architecture

[17] Agilemania, « Why Scaled Agile Framework (SAFe) Is So Popular in 2026? », 2026. Disponible : https://agilemania.com/why-safe-is-popular-among-the-scaling-framework

[18] Scaled Agile, « Enabling Agility with Enterprise Architecture Competency », 2025. Disponible : https://framework.scaledagile.com/lean-portfolio-management-discipline/enabling-agility-with-enterprise-architecture-competency/

[19] Scaled Agile, « Extended Guidance — Enterprise Architect », 2025. Disponible : https://framework.scaledagile.com/enterprise-architect

[20] Scaled Agile, « Thriving in the Age of AI with Scaled Agile », 2025. Disponible : https://framework.scaledagile.com/blog/thriving-in-the-age-of-ai-with-scaled-agile/
