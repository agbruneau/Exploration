## Annexe G — Inventaire des patterns architecturaux IA réutilisables

Cette annexe fournit les spécifications techniques détaillées des quatre patterns architecturaux IA introduits au chapitre 11, section 11.5. Elle complète la présentation contextuelle et stratégique du chapitre par une documentation conforme au format standard des patterns de conception (*design patterns*), inspiré des travaux de Gamma *et al.* [1] et de Buschmann *et al.* [2]. L'objectif est de fournir aux architectes d'entreprise (AE) un référentiel opérationnel directement utilisable lors de la conception et de l'évaluation d'architectures IA.

### G.1 Utilité des patterns architecturaux dans le contexte IA

Les patterns architecturaux constituent un vocabulaire partagé entre les praticiens de l'architecture d'entreprise. Ils encapsulent des solutions éprouvées à des problèmes récurrents, réduisant ainsi le risque de réinvention et accélérant la prise de décision architecturale [1].

Dans le contexte spécifique de l'intelligence artificielle, les patterns remplissent trois fonctions distinctes :

**Réduction de l'incertitude.** Les projets IA se caractérisent par un niveau d'incertitude élevé — incertitude sur les données, les performances des modèles, les coûts d'infrastructure et les exigences réglementaires. Les patterns fournissent des structures de décision qui réduisent cette incertitude en la canalisant vers des choix architecturaux connus et documentés.

**Accélération du passage à l'échelle.** Comme l'a démontré l'étude de cas de 84.51° (chapitre 11, section 11.2), la réutilisation de composants architecturaux réduit de 30 à 50 % le temps de développement de chaque nouveau cas d'usage IA [Ch.11, réf. 5]. Les patterns formalisent cette réutilisation au niveau des structures architecturales elles-mêmes.

**Communication inter-équipes.** Les patterns offrent un langage commun entre les architectes, les scientifiques des données, les équipes d'infrastructure et les parties prenantes métier. Un architecte qui mentionne le pattern *AI Capability Factory* communique instantanément un ensemble de décisions architecturales — centralisation des capacités, interfaces standardisées, gouvernance intégrée — sans avoir à les redéfinir à chaque interaction.

Chaque pattern est documenté selon la structure suivante : nom et alias, contexte, problème, forces (*forces*), solution (avec diagramme d'architecture), conséquences (avantages et inconvénients), patterns liés, exemples d'application et critères de sélection.

---

### G.2 Pattern 1 — *AI Capability Factory*

#### G.2.1 Identification

| Attribut | Valeur |
|---|---|
| **Nom** | *AI Capability Factory* (usine de capacités IA) |
| **Alias** | *AI Factory*, *ML Platform Pattern*, modèle industriel de production IA |
| **Catégorie** | Pattern d'industrialisation |
| **Niveau de maturité requis** | Intermédiaire à élevé |
| **Source** | Formalisé au chapitre 11, section 11.5, à partir de l'étude de cas 84.51° [Ch.11, réf. 5] et de l'analyse McKinsey [Ch.11, réf. 6] |

#### G.2.2 Contexte

L'organisation a déployé avec succès un ou plusieurs cas d'usage IA en production. Elle dispose d'une équipe de données (centralisée ou fédérée) et d'une feuille de route prévoyant le déploiement d'au moins trois cas d'usage additionnels dans un horizon de 12 à 18 mois. Les investissements IA sont validés par la direction, mais la pression pour démontrer un retour sur investissement croissant s'intensifie.

#### G.2.3 Problème

Chaque nouveau cas d'usage IA exige un développement complet — nouveaux pipelines de données, nouvelles intégrations, nouveaux processus de gouvernance. Les coûts et les délais ne diminuent pas au fil du temps. L'organisation ne bénéficie d'aucun effet d'apprentissage ni d'aucune économie d'échelle. Le « purgatoire des pilotes » (*pilot purgatory*) menace : 67 % des projets IA n'atteignent pas la production selon Astrafy [Ch.11, réf. 15].

#### G.2.4 Forces

Les forces (*forces*) en tension qui rendent ce problème difficile sont les suivantes :

- **Accélération *vs* qualité.** Le besoin d'accélérer le déploiement de nouveaux cas d'usage entre en tension avec la nécessité de maintenir des niveaux élevés de qualité, de sécurité et de gouvernance.
- **Spécificité métier *vs* généricité technique.** Chaque cas d'usage a des exigences métier spécifiques (données propres, règles de décision, indicateurs de performance), mais les composants techniques sous-jacents (orchestration, inférence, surveillance) sont largement génériques.
- **Investissement initial *vs* rendement à long terme.** L'abstraction des composants réutilisables exige un surcoût initial (estimé entre 20 et 40 % du premier cas d'usage) qui ne se rentabilise qu'à partir du deuxième ou troisième cas d'usage.
- **Autonomie des équipes *vs* standardisation.** Les équipes de données et de développement valorisent leur autonomie dans le choix des outils et des approches, tandis que la réutilisation exige des standards communs.

#### G.2.5 Solution

Extraire les capacités techniques communes des cas d'usage existants dans un catalogue de capacités réutilisables. Créer un *AI Gateway* centralisé qui expose ces capacités via des interfaces standardisées. Chaque nouveau cas d'usage compose ses besoins à partir du catalogue existant et n'ajoute que la logique métier spécifique.

L'architecture se structure en quatre couches :

**Couche 1 — Catalogue de capacités (*Capability Catalog*).** Registre centralisé de toutes les capacités IA disponibles : modèles entraînés, pipelines de données, composants d'orchestration, modules de gouvernance. Chaque capacité est documentée par un contrat d'interface (entrées, sorties, SLA, coûts).

**Couche 2 — *AI Gateway*.** Point d'entrée unique pour l'accès aux capacités IA. Le *gateway* assure le routage des requêtes, l'authentification, la limitation de débit (*rate limiting*), la journalisation et l'observabilité. Il constitue le point de contrôle de la gouvernance.

**Couche 3 — Pipelines réutilisables.** Pipelines de données et d'inférence paramétrables, capables de s'adapter à différents cas d'usage par configuration plutôt que par développement. Incluent les étapes de préparation des données, d'inférence du modèle, de post-traitement et de surveillance.

**Couche 4 — Couche d'assemblage métier (*Business Assembly Layer*).** Couche mince, spécifique à chaque cas d'usage, qui combine les capacités du catalogue et ajoute la logique de décision métier propre. Cette couche est la seule qui nécessite un développement dédié pour chaque nouveau cas d'usage.

[Figure G.1 — Architecture du pattern *AI Capability Factory*]

```
┌─────────────────────────────────────────────────────────────────────┐
│                    COUCHE D'ASSEMBLAGE MÉTIER                       │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐              │
│  │ Cas d'usage A│  │ Cas d'usage B│  │ Cas d'usage N│   ...        │
│  │ (Logique     │  │ (Logique     │  │ (Logique     │              │
│  │  métier      │  │  métier      │  │  métier      │              │
│  │  spécifique) │  │  spécifique) │  │  spécifique) │              │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘              │
│         │                 │                 │                       │
└─────────┼─────────────────┼─────────────────┼───────────────────────┘
          │                 │                 │
┌─────────▼─────────────────▼─────────────────▼───────────────────────┐
│                        AI GATEWAY                                    │
│  Routage │ Authentification │ Rate limiting │ Logging │ Observabilité│
└─────────┬─────────────────┬─────────────────┬───────────────────────┘
          │                 │                 │
┌─────────▼─────────────────▼─────────────────▼───────────────────────┐
│                   PIPELINES RÉUTILISABLES                            │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐                 │
│  │ Pipeline     │  │ Pipeline     │  │ Pipeline     │                │
│  │ données      │  │ inférence    │  │ surveillance │                │
│  │ (ETL, qualité│  │ (modèles,    │  │ (métriques,  │                │
│  │  validation) │  │  orchestrat.)│  │  alertes)    │                │
│  └─────────────┘  └─────────────┘  └─────────────┘                 │
└─────────────────────────────────────────────────────────────────────┘
          │                 │                 │
┌─────────▼─────────────────▼─────────────────▼───────────────────────┐
│                  CATALOGUE DE CAPACITÉS                              │
│                                                                      │
│  Modèles entraînés │ Connecteurs données │ Composants gouvernance   │
│  Modules NLP       │ Modules vision      │ Modules recommandation   │
│                                                                      │
│  [Chaque capacité : contrat d'interface, SLA, coûts, propriétaire]  │
└─────────────────────────────────────────────────────────────────────┘
```

*La figure illustre les quatre couches du pattern AI Capability Factory. Les cas d'usage métier (couche supérieure) ne contiennent que la logique spécifique. Toute la mécanique technique est fournie par les couches inférieures, partagées entre tous les cas d'usage.*

#### G.2.6 Conséquences

**Avantages :**

- Réduction de 30 à 50 % du temps de développement pour chaque nouveau cas d'usage, tel que documenté par 84.51° [Ch.11, réf. 5].
- Standardisation de la gouvernance : chaque capacité passe par le *AI Gateway*, qui applique les politiques de sécurité, de conformité et d'observabilité de manière uniforme.
- Réduction du *Shadow AI* : l'attractivité de la plateforme officielle (rapidité d'accès, capacités prêtes à l'emploi) diminue l'incitation à développer des solutions parallèles non autorisées.
- Effet de réseau : chaque nouveau cas d'usage enrichit le catalogue de capacités, accélérant les cas d'usage suivants.

**Inconvénients :**

- Investissement initial supérieur pour le premier cas d'usage : le temps d'abstraction et de standardisation ajoute 20 à 40 % au coût du premier développement.
- Risque de sur-ingénierie (*over-engineering*) si les abstractions sont créées avant d'être validées par au moins deux cas d'usage concrets.
- Nécessité d'une équipe de plateforme dédiée pour maintenir le catalogue et le *gateway*.
- Risque de goulot d'étranglement si le *AI Gateway* n'est pas dimensionné correctement.

#### G.2.7 Patterns liés

- ***Composable AI Module*** (pattern 4, section G.5) : l'usine produit des modules composables. Les deux patterns sont complémentaires — l'*AI Capability Factory* définit le processus d'industrialisation, le *Composable AI Module* définit la structure des artefacts produits.
- ***AI-Ready Domain*** (pattern 2, section G.3) : un domaine doit être « prêt pour l'IA » avant que ses cas d'usage puissent alimenter l'usine.
- ***Agentic Safe Sandbox*** (pattern 3, section G.4) : le *sandbox* peut servir d'environnement de validation avant l'intégration d'une nouvelle capacité dans le catalogue.

#### G.2.8 Exemples d'application

**84.51° (Kroger).** Transformation du système de routage en magasin (200 000 décisions/seconde) en capacité réutilisable de *dynamic batching*, ensuite appliquée au routage véhiculaire (VROOM). Résultat : réduction de 50 % du temps de développement et amélioration de 8 % de la performance [Ch.11, réf. 5].

**Pfizer (programme PACT).** Plateforme partagée couvrant 14 projets IA/ML pour le développement pharmaceutique. Les pipelines de données communs et le registre de modèles centralisé ont permis une économie de 16 000 heures de recherche annuelles et une réduction de 55 % des coûts d'infrastructure [Ch.11, réf. 4].

---

### G.3 Pattern 2 — *AI-Ready Domain*

#### G.3.1 Identification

| Attribut | Valeur |
|---|---|
| **Nom** | *AI-Ready Domain* (domaine prêt pour l'IA) |
| **Alias** | *Data-Ready Domain*, programme de préparation IA de domaine |
| **Catégorie** | Pattern de fondation |
| **Niveau de maturité requis** | Faible à intermédiaire |
| **Source** | Formalisé au chapitre 11, section 11.5, à partir des données Gartner sur la préparation des données IA [Ch.11, réf. 10] |

#### G.3.2 Contexte

Un domaine métier spécifique (chaîne d'approvisionnement, ressources humaines, finance, marketing, opérations) est identifié comme prioritaire dans la feuille de route IA de l'organisation. Les parties prenantes métier expriment une volonté d'intégrer des capacités IA. L'organisation dispose d'une gouvernance IA au niveau entreprise ou est en train de la construire.

#### G.3.3 Problème

Les données du domaine sont fragmentées entre plusieurs systèmes, leur qualité est inégale, les processus métier ne sont pas documentés et les systèmes ne sont pas interopérables. Chaque tentative d'implémentation IA se heurte au même constat : « les données ne sont pas prêtes ». Gartner anticipe que 60 % des projets IA seront abandonnés d'ici 2026 faute de données suffisamment préparées [Ch.11, réf. 10]. Ce pattern s'attaque directement à cette cause d'échec.

#### G.3.4 Forces

- **Pression pour des résultats rapides *vs* nécessité de fondations solides.** Les parties prenantes métier attendent des résultats IA en quelques semaines, alors que la préparation des données prend typiquement 3 à 6 mois.
- **Autonomie du domaine *vs* cohérence d'entreprise.** Le domaine gère ses données selon ses propres conventions, mais l'intégration IA à l'échelle de l'entreprise exige des standards communs (nomenclature, formats, qualité).
- **Investissement dans les fondations *vs* investissement dans les cas d'usage.** Chaque dollar investi dans la préparation des données est un dollar non investi dans un modèle IA visible. La valeur des fondations est indirecte et différée.
- **Exhaustivité *vs* pragmatisme.** La tentation est de préparer l'ensemble des données du domaine; le pragmatisme exige de prioriser les données nécessaires aux cas d'usage les plus imminents.

#### G.3.5 Solution

Appliquer au domaine un programme de préparation à l'IA structuré en quatre étapes séquentielles. Chaque étape produit des livrables vérifiables qui constituent les critères de sortie (*exit criteria*) avant le passage à l'étape suivante.

**Étape 1 — Cartographie des données du domaine.** Réaliser un inventaire exhaustif des sources de données du domaine : systèmes sources, propriétaires, volumétrie, fréquence de mise à jour, qualité actuelle (mesurée par des métriques standard : complétude, exactitude, cohérence, fraîcheur), lignage (*data lineage*) et dépendances. Livrable : registre de données du domaine.

**Étape 2 — Assainissement et standardisation.** Pour chaque source identifiée comme critique pour les cas d'usage IA prévus : nettoyage des anomalies, normalisation des formats, résolution des duplications, création de contrats de données (*data contracts*) qui formalisent les engagements de qualité entre le producteur et le consommateur des données. Livrable : contrats de données signés par les propriétaires.

**Étape 3 — Exposition via des interfaces standardisées.** Rendre les données nettoyées accessibles via des *API* conformes aux standards d'entreprise (*REST*, *GraphQL* ou équivalent). Intégrer les mécanismes de contrôle d'accès, de journalisation et de traçabilité. Livrable : catalogue d'*API* de données du domaine, intégré au catalogue d'entreprise.

**Étape 4 — Validation par un cas d'usage pilote.** Sélectionner un cas d'usage IA de faible complexité et de valeur métier démontrable. Le développer en utilisant exclusivement les données exposées à l'étape 3. Le résultat valide la chaîne complète (données → modèle → résultat métier) et identifie les lacunes résiduelles. Livrable : cas d'usage pilote en production, rapport de validation des données.

[Figure G.2 — Architecture du pattern *AI-Ready Domain*]

```
┌─────────────────────────────────────────────────────────────────────┐
│                     DOMAINE MÉTIER (ex. : Finance)                   │
│                                                                      │
│  ÉTAPE 1 : CARTOGRAPHIE          ÉTAPE 2 : ASSAINISSEMENT          │
│  ┌───────────────────────┐       ┌───────────────────────┐          │
│  │ Inventaire sources    │       │ Nettoyage             │          │
│  │ ┌─────┐ ┌─────┐ ┌───┐│       │ Normalisation         │          │
│  │ │ERP  │ │CRM  │ │DW ││──────►│ Contrats de données   │          │
│  │ └─────┘ └─────┘ └───┘│       │ Résolution duplicata  │          │
│  │ Qualité │ Lignage     │       └───────────┬───────────┘          │
│  └───────────────────────┘                   │                      │
│                                              ▼                      │
│  ÉTAPE 4 : VALIDATION           ÉTAPE 3 : EXPOSITION               │
│  ┌───────────────────────┐       ┌───────────────────────┐          │
│  │ Cas d'usage pilote    │       │ API standardisées     │          │
│  │                       │◄──────│ Contrôle d'accès      │          │
│  │ Données → Modèle →   │       │ Journalisation        │          │
│  │ Résultat métier       │       │ Catalogue d'API       │          │
│  └───────────────────────┘       └───────────────────────┘          │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
       │                                                    │
       ▼                                                    ▼
┌──────────────────┐                         ┌──────────────────────┐
│ Standards         │                         │ Plateforme IA        │
│ d'entreprise     │                         │ d'entreprise         │
│ (nomenclature,   │                         │ (AI Capability       │
│  formats, qualité)│                         │  Factory)            │
└──────────────────┘                         └──────────────────────┘
```

*La figure illustre le parcours en quatre étapes du pattern AI-Ready Domain. Le domaine métier traverse séquentiellement la cartographie, l'assainissement, l'exposition et la validation, en alignement avec les standards d'entreprise et en préparation de l'intégration à la plateforme IA.*

#### G.3.6 Conséquences

**Avantages :**

- Le domaine devient autonome dans le lancement d'initiatives IA. Les données sont documentées, nettoyées et accessibles via des interfaces standardisées.
- La qualité des données est assurée par construction, via les contrats de données. Les projets IA subséquents ne se heurtent plus au mur des « données non prêtes ».
- L'intégration avec les autres domaines est facilitée par les standards communs, ouvrant la possibilité de cas d'usage IA transversaux (par exemple, un modèle de prédiction de la demande qui combine les données commerciales et logistiques).
- Le délai initial (3 à 6 mois pour les étapes 1 à 3) est compensé par l'accélération de tous les projets IA subséquents dans le domaine.

**Inconvénients :**

- Investissement initial significatif sans résultat IA visible immédiat. La communication vers les parties prenantes exige de démontrer la valeur des fondations.
- Risque de « paralysie par l'analyse » si l'étape 1 (cartographie) est menée de manière trop exhaustive. Il est essentiel de prioriser les données liées aux cas d'usage identifiés.
- Dépendance au *sponsorship* du responsable de domaine, qui doit allouer des ressources à un programme de préparation plutôt qu'à des projets métier immédiatement visibles.

#### G.3.7 Patterns liés

- ***AI Capability Factory*** (pattern 1, section G.2) : un domaine « prêt pour l'IA » peut alimenter le catalogue de capacités de l'usine. Les données exposées à l'étape 3 deviennent les sources des pipelines réutilisables de l'usine.
- ***Composable AI Module*** (pattern 4, section G.5) : les interfaces standardisées créées à l'étape 3 sont conçues pour s'intégrer avec des modules IA composables.
- Le pattern *Data Mesh* [3] partage des principes communs (propriété de domaine, données comme produit), mais l'*AI-Ready Domain* est centré spécifiquement sur la préparation IA et non sur la gouvernance de données au sens large.

#### G.3.8 Exemples d'application

**Domaine finance.** Une direction financière dont les données transactionnelles sont dispersées entre l'ERP, le système de trésorerie et des fichiers Excel applique le programme de préparation. Après 4 mois, les données sont exposées via un catalogue d'*API*. Le cas d'usage pilote — détection d'anomalies dans les écritures comptables — est déployé en 6 semaines au lieu des 5 mois estimés sans préparation préalable.

**Domaine chaîne d'approvisionnement.** L'exemple de 84.51° (chapitre 11, section 11.2) illustre comment un domaine logistique préparé permet la réutilisation de capacités IA : le *dynamic batching* développé pour le routage en magasin a été transposé au routage véhiculaire parce que les données logistiques étaient déjà standardisées et accessibles [Ch.11, réf. 5].

---

### G.4 Pattern 3 — *Agentic Safe Sandbox*

#### G.4.1 Identification

| Attribut | Valeur |
|---|---|
| **Nom** | *Agentic Safe Sandbox* (bac à sable sécurisé pour l'IA agentique) |
| **Alias** | *AI Experimentation Sandbox*, environnement d'expérimentation IA contrôlé |
| **Catégorie** | Pattern d'expérimentation |
| **Niveau de maturité requis** | Faible à intermédiaire |
| **Source** | Formalisé au chapitre 11, section 11.5, à partir du cadre Salesforce pour l'entreprise agentique [Ch.11, réf. 19] et des données Gartner sur l'IA agentique [Ch.11, réf. 18] |

#### G.4.2 Contexte

L'organisation souhaite expérimenter avec des technologies IA émergentes — agents autonomes, systèmes multi-agents, modèles de fondation de nouvelle génération, architectures *RAG* (*Retrieval-Augmented Generation*) — dans un cadre contrôlé. Gartner rapporte une augmentation de 1 445 % des demandes d'information sur les systèmes multi-agents entre le premier trimestre 2024 et le deuxième trimestre 2025 [Ch.11, réf. 18], confirmant l'urgence de la demande. Parallèlement, les prévisions indiquent que plus de 40 % des projets d'IA agentique seront annulés d'ici 2027 en raison de risques mal maîtrisés [Ch.11, réf. 11].

#### G.4.3 Problème

Le risque d'impact sur les systèmes de production, les données sensibles ou la conformité réglementaire empêche toute expérimentation avec les technologies IA émergentes. Les équipes d'innovation sont bloquées par les processus de validation de sécurité, conçus pour des déploiements en production et inadaptés à l'expérimentation exploratoire. En l'absence d'espace officiel d'expérimentation, les équipes recourent au *Shadow AI* — 53 % de l'activité IA en entreprise est non autorisée [Ch.11, réf. 13] — ce qui crée des risques de sécurité non contrôlés.

#### G.4.4 Forces

- **Innovation rapide *vs* protection des actifs.** Les équipes ont besoin d'expérimenter rapidement (cycles de jours ou de semaines) avec des technologies potentiellement disruptives, tandis que l'organisation doit protéger ses systèmes de production, ses données sensibles et sa conformité réglementaire.
- **Liberté créative *vs* gouvernance.** L'expérimentation requiert une liberté de choix des outils, des modèles et des approches. La gouvernance exige des garde-fous, de la traçabilité et du contrôle.
- **Réalisme *vs* sécurité.** Les expérimentations doivent être suffisamment réalistes pour produire des résultats transposables en production, mais suffisamment isolées pour ne pas compromettre les systèmes existants.
- **Coût du *sandbox* *vs* coût du *Shadow AI*.** L'environnement d'expérimentation a un coût opérationnel (infrastructure, données synthétiques, supervision), mais ce coût est inférieur au coût moyen de 200 000 $ par incident de sécurité lié au *Shadow AI* [Ch.11, réf. 14].

#### G.4.5 Solution

Créer un environnement d'expérimentation isolé, structuré en quatre composantes architecturales :

**Composante 1 — Isolation technique.** L'environnement *sandbox* est déployé sur une infrastructure séparée (sous-réseau dédié, compte infonuagique distinct ou espace de noms isolé). Aucune connexion directe aux systèmes de production. Les interfaces avec l'extérieur du *sandbox* sont explicitement définies et contrôlées par un *proxy* de sécurité.

**Composante 2 — Données synthétiques ou anonymisées.** Le *sandbox* dispose de jeux de données représentatifs mais ne contenant aucune donnée personnelle identifiable (*PII*, *Personally Identifiable Information*). Les données sont générées par synthèse (*synthetic data generation*) ou anonymisées à partir de données réelles via des techniques de masquage et de perturbation différentielle (*differential privacy*).

**Composante 3 — Garde-fous de gouvernance.** Les agents IA expérimentés dans le *sandbox* sont soumis à des contraintes opérationnelles : (a) aucune action irréversible sans approbation humaine (*human-in-the-loop*); (b) limitation des ressources de calcul et de stockage par expérimentation; (c) journalisation complète de toutes les actions des agents; (d) durée de vie maximale des expérimentations (auto-nettoyage après expiration).

**Composante 4 — Métriques de sortie (*graduation criteria*).** Des critères mesurables déterminent si une expérimentation peut passer à la phase de production : performance du modèle (précision, latence, coût d'inférence), robustesse (comportement face aux cas limites), conformité (respect des politiques de données et de sécurité), viabilité opérationnelle (complexité de déploiement, exigences de surveillance).

[Figure G.3 — Architecture du pattern *Agentic Safe Sandbox*]

```
┌─────────────────────────────────────────────────────────────────────┐
│                        SANDBOX (environnement isolé)                 │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────┐       │
│  │              ESPACE D'EXPÉRIMENTATION                     │       │
│  │                                                           │       │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐      │       │
│  │  │ Expéri-     │  │ Expéri-     │  │ Expéri-     │      │       │
│  │  │ mentation A │  │ mentation B │  │ mentation N │      │       │
│  │  │ (Agent LLM) │  │ (Multi-     │  │ (RAG avancé)│      │       │
│  │  │             │  │  agents)    │  │             │      │       │
│  │  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘      │       │
│  │         │                │                │              │       │
│  │         └────────────────┼────────────────┘              │       │
│  │                          │                               │       │
│  └──────────────────────────┼───────────────────────────────┘       │
│                             │                                        │
│  ┌──────────────────────────▼───────────────────────────────┐       │
│  │              GARDE-FOUS DE GOUVERNANCE                    │       │
│  │  Human-in-the-loop │ Limites ressources │ Auto-nettoyage │       │
│  │  Journalisation    │ Durée de vie max   │ Alertes        │       │
│  └──────────────────────────────────────────────────────────┘       │
│                             │                                        │
│  ┌──────────────────────────▼───────────────────────────────┐       │
│  │              DONNÉES SYNTHÉTIQUES / ANONYMISÉES           │       │
│  │  Données générées │ Masquage PII │ Confidentialité diff. │       │
│  └──────────────────────────────────────────────────────────┘       │
│                                                                      │
└───────────────────────────────┬─────────────────────────────────────┘
                                │
                     ┌──────────▼──────────┐
                     │ PROXY DE SÉCURITÉ   │
                     │ (interface contrôlée │
                     │  avec l'extérieur)   │
                     └──────────┬──────────┘
                                │
          ┌─────────────────────┼─────────────────────┐
          │                     │                     │
          ▼                     ▼                     ▼
┌─────────────────┐  ┌─────────────────┐  ┌──────────────────┐
│ MÉTRIQUES DE    │  │ SYSTÈMES DE     │  │ AI CAPABILITY    │
│ SORTIE          │  │ PRODUCTION      │  │ FACTORY          │
│ (graduation     │  │ (accès interdit │  │ (intégration     │
│  criteria)      │  │  sans           │  │  post-graduation)│
│                 │  │  graduation)    │  │                  │
└─────────────────┘  └─────────────────┘  └──────────────────┘
```

*La figure illustre l'isolation du sandbox par rapport aux systèmes de production. Les expérimentations opèrent sur des données synthétiques, sont encadrées par des garde-fous de gouvernance et ne peuvent accéder aux systèmes de production qu'après avoir satisfait aux critères de sortie (graduation).*

#### G.4.6 Conséquences

**Avantages :**

- Accélération du cycle d'expérimentation : de plusieurs mois (processus de validation complet) à quelques semaines (démarrage immédiat dans le *sandbox*).
- Réduction du *Shadow AI* : les équipes disposent d'un espace officiel pour expérimenter, ce qui diminue l'incitation à utiliser des outils non autorisés.
- Production de données d'évaluation structurées (métriques de sortie) qui alimentent les décisions d'investissement de manière factuelle.
- Identification précoce des technologies non viables, avant que des investissements significatifs ne soient engagés.

**Inconvénients :**

- Coût opérationnel de l'infrastructure *sandbox* (infrastructure dédiée, génération de données synthétiques, supervision).
- Risque de « fossé de transfert » (*transfer gap*) : les résultats obtenus dans le *sandbox* (données synthétiques, charge faible) ne se reproduisent pas toujours en production (données réelles, charge élevée). Les critères de sortie doivent intégrer des tests de charge réalistes.
- Nécessité d'une gouvernance du *sandbox* lui-même : qui peut créer des expérimentations, quelles technologies sont autorisées, quels sont les budgets d'infrastructure alloués.

#### G.4.7 Patterns liés

- ***AI Capability Factory*** (pattern 1, section G.2) : le *sandbox* constitue le mécanisme d'entrée pour de nouvelles capacités dans le catalogue de l'usine. Une expérimentation qui satisfait aux critères de sortie est candidate à l'industrialisation.
- ***Composable AI Module*** (pattern 4, section G.5) : les modules développés dans le *sandbox* doivent respecter les interfaces standard des modules composables pour faciliter leur intégration post-graduation.
- Le pattern *Strangler Fig* [4] peut être utilisé en complément pour migrer progressivement les capacités validées dans le *sandbox* vers les systèmes de production.

#### G.4.8 Exemples d'application

**Expérimentation multi-agents.** Une organisation bancaire crée un *sandbox* pour évaluer un système multi-agents de détection de fraude. Les agents collaborent sur des données transactionnelles synthétiques, calibrées pour reproduire les distributions statistiques des transactions réelles. Après 8 semaines d'expérimentation, le système démontre un taux de détection supérieur de 12 % au système existant. Les critères de sortie — performance, latence, explicabilité des décisions — sont satisfaits, et le système passe en phase de production pilotée.

**Évaluation de modèles de fondation.** Une entreprise manufacturière utilise le *sandbox* pour comparer trois modèles de langage dans un cas d'usage de maintenance prédictive basée sur l'analyse de rapports d'intervention. Les données textuelles sont anonymisées. L'évaluation compare les modèles sur la précision d'extraction d'information, le coût d'inférence et la conformité aux exigences de confidentialité. Le modèle retenu est intégré au catalogue de l'*AI Capability Factory*.

---

### G.5 Pattern 4 — *Composable AI Module*

#### G.5.1 Identification

| Attribut | Valeur |
|---|---|
| **Nom** | *Composable AI Module* (module IA composable) |
| **Alias** | *Modular AI Component*, *Pluggable AI Service*, composant IA interchangeable |
| **Catégorie** | Pattern de modularité |
| **Niveau de maturité requis** | Intermédiaire à élevé |
| **Source** | Formalisé au chapitre 11, section 11.5, à partir des données sur le marché de l'infrastructure composable [Ch.11, réf. 20] et des protocoles d'interopérabilité émergents [Ch.11, réf. 18] |

#### G.5.2 Contexte

L'organisation exploite plusieurs capacités IA en production — traitement du langage naturel (*NLP*), vision par ordinateur (*computer vision*), moteur de recommandation, agent de conformité, modèle prédictif. L'écosystème IA s'est constitué de manière organique, chaque capacité ayant été développée indépendamment, souvent par des équipes différentes avec des choix technologiques distincts. L'organisation anticipe l'évolution rapide des technologies IA (les modèles deviennent obsolètes en 6 à 12 mois) et souhaite se prémunir contre la rigidité et la dépendance à un fournisseur unique.

#### G.5.3 Problème

Chaque capacité IA est implémentée comme un système monolithique avec ses propres dépendances, ses propres formats de données et sa propre infrastructure. La modification ou le remplacement d'un composant — par exemple, le passage d'un modèle GPT-4 à un modèle Claude ou Gemini — exige la refonte de l'ensemble de la chaîne de traitement. Les coûts de changement (*switching costs*) sont prohibitifs, créant une dépendance de fait au fournisseur (*vendor lock-in*).

#### G.5.4 Forces

- **Diversité technologique *vs* cohérence opérationnelle.** L'IA en entreprise exige des technologies diverses (LLM, modèles de vision, modèles spécialisés), tandis que l'exploitation en production exige des pratiques uniformes de déploiement, de surveillance et de gouvernance.
- **Vitesse d'évolution *vs* stabilité.** Les technologies IA évoluent à un rythme sans précédent (cycle de 6 à 12 mois), alors que les systèmes de production exigent une stabilité mesurée en années.
- **Optimisation locale *vs* optimisation globale.** Chaque équipe optimise son composant IA selon ses propres critères, ce qui peut créer des incompatibilités à l'échelle du système (formats de données divergents, dépendances contradictoires, exigences de latence incompatibles).
- **Autonomie des équipes *vs* interopérabilité.** Les équipes souhaitent choisir librement leurs technologies, mais l'interopérabilité entre composants IA exige des conventions communes.

#### G.5.5 Solution

Concevoir chaque capacité IA comme un module composable, conforme à un contrat d'interface standardisé, avec une autonomie de déploiement complète. L'architecture s'articule autour de quatre principes :

**Principe 1 — Interfaces standardisées.** Chaque module expose ses capacités via des *API* conformes à un standard commun (*REST*, *gRPC* ou protocoles émergents comme le *Model Context Protocol* (MCP) d'Anthropic et le *Agent-to-Agent Protocol* (A2A) de Google [Ch.11, réf. 18]). Le contrat d'interface documente : les entrées acceptées (format, contraintes de validation), les sorties produites (format, latence garantie), les erreurs possibles et les comportements de dégradation.

**Principe 2 — Autonomie de déploiement.** Chaque module peut être déployé, mis à jour, mis à l'échelle (*scaling*) ou remplacé indépendamment des autres modules. Cela implique : conteneurisation (*containerization*), gestion indépendante des versions, absence de dépendances directes entre modules (communication uniquement via les interfaces standardisées).

**Principe 3 — Observabilité intégrée.** Chaque module intègre nativement : des métriques de performance (latence, débit, taux d'erreur), des journaux de traçabilité (*logs*), des mécanismes de détection de dérive (*drift detection*) pour les modèles IA et des alertes configurables. L'observabilité n'est pas une couche ajoutée après coup : elle fait partie du contrat du module.

**Principe 4 — Contrat de niveau de service (*SLA*).** Chaque module s'engage sur des niveaux de service explicites : disponibilité, latence (P50, P95, P99), débit maximal, temps de récupération en cas de panne. Le SLA est la base du contrat entre le module et ses consommateurs.

[Figure G.4 — Architecture du pattern *Composable AI Module*]

```
┌─────────────────────────────────────────────────────────────────────┐
│                    COUCHE D'ORCHESTRATION                            │
│                                                                      │
│  Routage │ Composition │ Gestion d'erreurs │ Circuit breaker         │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────┐       │
│  │         PROTOCOLES D'INTEROPÉRABILITÉ                     │       │
│  │         MCP (Anthropic) │ A2A (Google) │ REST/gRPC       │       │
│  └──────────────────────────────────────────────────────────┘       │
└──────┬──────────────┬──────────────┬──────────────┬─────────────────┘
       │              │              │              │
       ▼              ▼              ▼              ▼
┌────────────┐ ┌────────────┐ ┌────────────┐ ┌────────────┐
│ MODULE A   │ │ MODULE B   │ │ MODULE C   │ │ MODULE N   │
│ (NLP)      │ │ (Vision)   │ │ (Recomm.)  │ │ (Agent)    │
│            │ │            │ │            │ │            │
│ ┌────────┐ │ │ ┌────────┐ │ │ ┌────────┐ │ │ ┌────────┐ │
│ │Interface│ │ │ │Interface│ │ │ │Interface│ │ │ │Interface│ │
│ │standard │ │ │ │standard │ │ │ │standard │ │ │ │standard │ │
│ └────────┘ │ │ └────────┘ │ │ └────────┘ │ │ └────────┘ │
│ ┌────────┐ │ │ ┌────────┐ │ │ ┌────────┐ │ │ ┌────────┐ │
│ │Observa-│ │ │ │Observa-│ │ │ │Observa-│ │ │ │Observa-│ │
│ │bilité  │ │ │ │bilité  │ │ │ │bilité  │ │ │ │bilité  │ │
│ └────────┘ │ │ └────────┘ │ │ └────────┘ │ │ └────────┘ │
│ ┌────────┐ │ │ ┌────────┐ │ │ ┌────────┐ │ │ ┌────────┐ │
│ │  SLA   │ │ │ │  SLA   │ │ │ │  SLA   │ │ │ │  SLA   │ │
│ └────────┘ │ │ └────────┘ │ │ └────────┘ │ │ └────────┘ │
│            │ │            │ │            │ │            │
│ Déploiement│ │ Déploiement│ │ Déploiement│ │ Déploiement│
│ autonome   │ │ autonome   │ │ autonome   │ │ autonome   │
└────────────┘ └────────────┘ └────────────┘ └────────────┘
```

*La figure illustre la composition de modules IA autonomes via une couche d'orchestration. Chaque module intègre une interface standardisée, une observabilité native et un SLA explicite. La couche d'orchestration gère le routage, la composition et la résilience.*

#### G.5.6 Conséquences

**Avantages :**

- Remplacement d'un modèle IA sans impact sur le reste du système. Le passage d'un fournisseur de LLM à un autre se fait en modifiant le module concerné, sans toucher à la chaîne de traitement amont ou aval.
- Réduction du risque de dépendance au fournisseur (*vendor lock-in*). L'organisation conserve sa liberté de choix technologique à chaque niveau de la pile.
- Possibilité de combiner des modèles de différents fournisseurs dans une même chaîne de traitement — par exemple, un modèle Claude pour l'analyse textuelle, un modèle spécialisé pour la vision et un moteur de règles pour la conformité.
- Évolutivité : les nouveaux modules s'ajoutent sans perturber les modules existants.

**Inconvénients :**

- Complexité accrue de l'orchestration. La gestion des interactions entre modules (routage, gestion d'erreurs, *circuit breaker*, latence cumulée) exige une couche de médiation sophistiquée.
- Surcoût de sérialisation/désérialisation. La communication via des interfaces standardisées (*API*) introduit une latence supplémentaire par rapport à des appels internes dans un système monolithique.
- Nécessité de définir et de maintenir les contrats d'interface, ce qui exige une discipline de documentation et de versionnement.
- Risque de prolifération de modules faiblement utilisés si la gouvernance du catalogue n'est pas rigoureuse.

#### G.5.7 Patterns liés

- ***AI Capability Factory*** (pattern 1, section G.2) : l'usine produit des modules composables. La relation est celle du processus de fabrication (usine) et du produit (module).
- ***Agentic Safe Sandbox*** (pattern 3, section G.4) : les modules sont validés dans le *sandbox* avant leur intégration dans le catalogue.
- Le pattern *Microservices* [5] partage les principes d'autonomie de déploiement et d'interfaces standardisées, mais le *Composable AI Module* intègre des exigences spécifiques à l'IA (détection de dérive, explicabilité, gestion du cycle de vie des modèles).
- Le marché de l'infrastructure composable, évalué à 8,3 milliards de dollars en 2025 avec une croissance annuelle de 24,9 % [Ch.11, réf. 20], confirme l'adoption industrielle de cette approche architecturale.

#### G.5.8 Exemples d'application

**Chaîne de traitement documentaire multi-modèles.** Une compagnie d'assurance compose une chaîne de traitement des réclamations à partir de trois modules : (a) un module OCR (*Optical Character Recognition*) pour la numérisation des documents, (b) un module NLP pour l'extraction d'information structurée et (c) un module de classification pour le routage vers le bon département. Lorsqu'un nouveau modèle NLP plus performant est disponible, le module (b) est remplacé sans modification des modules (a) et (c).

**Écosystème d'agents IA interopérables.** Une entreprise de services financiers déploie un agent de conformité (vérification réglementaire), un agent de recherche (analyse de marché) et un agent de synthèse (production de rapports). Les agents communiquent via le protocole A2A et sont orchestrés par une couche de coordination centralisée. Lorsque la réglementation évolue, seul l'agent de conformité est mis à jour.

---

### G.6 Guide de sélection des patterns

Le choix du pattern approprié dépend de la situation spécifique de l'organisation. Le tableau ci-dessous fournit un arbre de décision simplifié.

[Tableau G.1 — Guide de sélection des patterns architecturaux IA]

| Situation de l'organisation | Pattern recommandé | Justification |
|---|---|---|
| Aucun cas d'usage IA en production; données du domaine non préparées | **AI-Ready Domain** | Priorité aux fondations de données avant toute tentative de déploiement IA |
| Technologies IA émergentes à évaluer; risque d'impact sur la production | **Agentic Safe Sandbox** | Environnement isolé pour l'expérimentation sans risque pour les systèmes existants |
| Au moins un cas d'usage en production; besoin d'accélérer les suivants | **AI Capability Factory** | Industrialisation des capacités pour bénéficier d'économies d'échelle |
| Plusieurs capacités IA en production; besoin de flexibilité et d'interopérabilité | **Composable AI Module** | Modularité pour permettre l'évolution indépendante de chaque composant |
| Domaine non préparé ET besoin d'expérimenter | **AI-Ready Domain** + **Agentic Safe Sandbox** | Préparer les données en parallèle de l'expérimentation dans le *sandbox* |
| Industrialisation en cours ET technologies émergentes à évaluer | **AI Capability Factory** + **Agentic Safe Sandbox** | Le *sandbox* alimente le catalogue de l'usine en nouvelles capacités validées |
| Maturité élevée, portefeuille IA en expansion | Les quatre patterns combinés | Écosystème complet : fondations, expérimentation, industrialisation, modularité |

Le séquençage typique d'adoption suit la trajectoire suivante :

```
AI-Ready Domain ──► Agentic Safe Sandbox ──► AI Capability Factory ──► Composable AI Module
  (fondations)       (expérimentation)        (industrialisation)       (modularité avancée)
```

Toutefois, ce séquençage n'est pas rigide. L'*Agentic Safe Sandbox* peut être déployé en parallèle de l'*AI-Ready Domain*, et le *Composable AI Module* est un principe transversal applicable dès les premiers développements.

---

### G.7 Tableau de synthèse comparatif

[Tableau G.2 — Synthèse comparative des quatre patterns architecturaux IA]

| Critère | *AI Capability Factory* | *AI-Ready Domain* | *Agentic Safe Sandbox* | *Composable AI Module* |
|---|---|---|---|---|
| **Problème principal** | Coûts et délais non décroissants | Données non préparées | Impossibilité d'expérimenter | Monolithes IA rigides |
| **Prérequis** | ≥ 1 cas d'usage en production | *Sponsorship* du domaine | Gouvernance IA minimale | Standards d'interface définis |
| **Bénéfice clé** | -30 à 50 % temps de développement | Fondation durable pour l'IA | Cycle d'expérimentation accéléré | Remplacement sans impact |
| **Complexité de mise en oeuvre** | Moyenne | Faible à moyenne | Moyenne | Elevée |
| **Délai de mise en oeuvre** | 3 à 6 mois | 3 à 6 mois | 4 à 8 semaines | 6 à 12 mois |
| **Investissement initial** | Elevé (abstraction des capacités) | Modéré (cartographie + assainissement) | Faible à modéré (infrastructure isolée) | Elevé (contrats + orchestration) |
| **Retour sur investissement** | A partir du 2e cas d'usage | A partir du 1er cas d'usage IA du domaine | Dès la 1re expérimentation | A partir du 1er remplacement de module |
| **Risque principal** | Sur-ingénierie prématurée | Paralysie par l'analyse | Fossé de transfert *sandbox* → production | Prolifération de modules |
| **Rôle de l'AE** | Concepteur de la plateforme | Facilitateur de la transformation du domaine | Définiteur des critères de sortie | Gardien des contrats d'interface |
| **Patterns liés** | Composable AI Module, AI-Ready Domain | AI Capability Factory | AI Capability Factory, Composable AI Module | AI Capability Factory, Microservices |

*Source : Synthèse des auteurs à partir des spécifications détaillées dans les sections G.2 à G.5. Les données de bénéfice clé sont documentées au chapitre 11, sections 11.1 à 11.5.*

---

### Références

[1] E. Gamma, R. Helm, R. Johnson et J. Vlissides, *Design Patterns: Elements of Reusable Object-Oriented Software*, Addison-Wesley, 1994.

[2] F. Buschmann, R. Meunier, H. Rohnert, P. Sommerlad et M. Stal, *Pattern-Oriented Software Architecture, Volume 1: A System of Patterns*, Wiley, 1996.

[3] Z. Dehghani, *Data Mesh: Delivering Data-Driven Value at Scale*, O'Reilly Media, 2022.

[4] M. Fowler, « StranglerFigApplication », *martinfowler.com*, 2004. Disponible : https://martinfowler.com/bliki/StranglerFigApplication.html

[5] S. Newman, *Building Microservices: Designing Fine-Grained Systems*, 2e éd., O'Reilly Media, 2021.

Les références aux données empiriques (études de cas, statistiques sectorielles) renvoient aux références du chapitre 11, identifiées par la notation [Ch.11, réf. N].
