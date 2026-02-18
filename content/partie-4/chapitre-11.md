### Chapitre 11 — Études de cas et patterns réutilisables

<!-- Rôle argumentatif (PRD §3) : Des cas réels et des patterns réplicables valident l'approche proposée. -->

#### Introduction

Les chapitres précédents ont construit un édifice théorique et méthodologique complet : architectures *AI-first* (chapitre 7), médiation du risque (chapitre 8), gouvernance et *Shadow AI* (chapitre 9), nouveau modèle opérationnel (chapitre 10). Cet édifice repose sur une prémisse centrale : l'architecture d'entreprise (AE) constitue le facteur différenciant entre les organisations qui pérennisent l'IA en production et celles qui accumulent les projets pilotes sans impact mesurable. Cette prémisse exige des preuves empiriques. Le présent chapitre les fournit.

L'analyse systématique de cas réels — succès et échecs — révèle un patron récurrent : les organisations qui réussissent le passage à l'échelle de l'IA sont celles qui disposent d'une maturité élevée en architecture d'entreprise. À l'inverse, les échecs les plus coûteux surviennent lorsque des investissements massifs en IA sont déployés sans fondations architecturales solides. McKinsey, dans son enquête mondiale *State of AI* (2025), confirme que 88 % des organisations déclarent utiliser l'IA dans au moins une fonction, mais que seulement 7 % ont atteint un déploiement à l'échelle [1]. Ce fossé entre expérimentation et industrialisation — le « purgatoire des pilotes » (*pilot purgatory*) — est précisément le territoire où l'architecte d'entreprise crée le plus de valeur.

Ce chapitre examine d'abord les cas de succès (section 11.1), puis le pattern « *AI Factory* » en action à travers l'étude de cas détaillée de 84.51° (section 11.2), avant d'analyser l'échec emblématique de VW Cariad (section 11.3) et les échecs récurrents liés à l'absence d'architecture (section 11.4). Il propose ensuite quatre patterns architecturaux réutilisables (section 11.5) et en tire des leçons transversales (section 11.6). Les patterns sont présentés ici dans leur logique d'application ; l'Annexe G en fournit les spécifications techniques détaillées.

---

#### 11.1 Cas de succès : organisations à forte maturité EA capables de pérenniser l'IA en production

##### Le lien empirique entre maturité EA et succès IA

Les données de l'industrie établissent une corrélation nette entre la maturité de l'architecture d'entreprise et la capacité à déployer l'IA en production de manière durable. Databricks, dans son rapport *State of Data + AI* (2025), observe une augmentation de 210 % du nombre d'organisations enregistrant des modèles pour un usage en production, accompagnée d'un gain d'efficience de 3x dans le ratio expérimentation/production — passé de 16 modèles expérimentaux pour chaque modèle en production à un ratio de 5 pour 1 [2]. Cette amélioration ne résulte pas d'une percée technologique ponctuelle : elle reflète la maturation des fondations architecturales — gouvernance des données, pipelines *MLOps*, registres de modèles, mécanismes de surveillance — que les organisations les plus avancées ont construites au fil du temps.

Menlo Ventures, dans son analyse *State of Generative AI in the Enterprise* (2025), rapporte que 52 % des organisations ayant adopté une approche structurée déclarent réaliser une valeur mesurable de l'IA, contre seulement 1 % n'ayant encore observé aucun résultat [3]. Ce chiffre, apparemment encourageant, masque une réalité plus nuancée : la majorité de cette valeur est concentrée dans quelques fonctions, et rares sont les organisations qui ont atteint un impact financier transversal à l'échelle de l'entreprise [1].

##### Pfizer : l'architecture au service de l'accélération pharmaceutique

Le programme PACT (*Pfizer Analytics and Compute Technology*) de Pfizer, développé en partenariat avec Amazon Web Services (AWS), illustre comment une architecture d'entreprise rigoureuse permet de multiplier les cas d'usage IA sans multiplier la complexité. Le programme couvre 14 projets d'IA et d'apprentissage automatique (*machine learning*, ML) intégrés dans le cycle de développement de médicaments [4].

Les résultats sont quantifiables : une économie de 16 000 heures de recherche annuelles et une réduction de 55 % des coûts d'infrastructure [4]. Ces gains ne sont pas le fruit de modèles individuels exceptionnels, mais d'une architecture de plateforme qui permet le partage de capacités entre les projets — pipelines de données communs, registre de modèles centralisé, gouvernance unifiée. L'architecture de Pfizer démontre le principe que le chapitre 7 a établi théoriquement : une plateforme d'IA bien architecturée génère des rendements croissants à mesure que le nombre de cas d'usage augmente.

##### Johnson & Johnson : jumeaux numériques et maintenance prédictive

Johnson & Johnson (*J&J*) utilise l'IA pour analyser les données vidéo chirurgicales et surveiller la performance des dispositifs médicaux à travers des jumeaux numériques (*digital twins*) [4]. L'intérêt de ce cas réside dans la sophistication architecturale requise : les données vidéo chirurgicales exigent des pipelines de traitement spécialisés, des modèles de vision par ordinateur (*computer vision*) entraînés sur des données médicales sensibles, et des mécanismes de gouvernance conformes aux réglementations sanitaires. Sans une architecture d'entreprise qui intègre ces exigences dès la conception, le passage du prototype à la production clinique serait impossible.

[Tableau 11.1 — Synthèse des cas de succès : facteurs architecturaux différenciants]

| Organisation | Domaine IA | Résultat mesuré | Facteur architectural clé |
|---|---|---|---|
| Pfizer (PACT) | Développement pharmaceutique | 16 000 h économisées/an; −55 % coûts infrastructure | Plateforme partagée, pipelines communs |
| Johnson & Johnson | Dispositifs médicaux, chirurgie | Maintenance prédictive, amélioration clinique | Jumeaux numériques, gouvernance données sensibles |
| 84.51° (Kroger) | Commerce de détail, logistique | −50 % temps de déploiement | Capacités modulaires réutilisables (voir 11.2) |

*Source : Synthèse des auteurs à partir de [2], [4], [5]*

##### Les caractéristiques communes des organisations performantes

L'analyse croisée de ces cas permet d'identifier quatre caractéristiques architecturales communes :

**La plateforme avant le projet.** Les organisations performantes investissent dans une plateforme d'IA partagée avant de lancer des cas d'usage individuels. Cette approche, documentée par McKinsey comme le modèle « *factory* » par opposition au modèle « *artisan* », permet de réduire les coûts marginaux de chaque nouveau déploiement [6].

**La gouvernance intégrée.** La gouvernance des données et des modèles n'est pas ajoutée après coup : elle est intégrée dans les pipelines de développement et de déploiement. Kroger, à travers sa filiale 84.51°, a développé un *AI Gateway* qui intègre la gouvernance et l'observabilité directement dans les processus d'intégration des modèles [5].

**L'architecture modulaire.** Les capacités IA sont conçues comme des modules réutilisables — et non comme des solutions monolithiques dédiées à un cas d'usage unique. Cette modularité est le facteur qui permet l'accélération documentée dans la section 11.2.

**La collaboration interfonctionnelle.** Les équipes de fusion (*fusion teams*), composées de leaders métier et de scientifiques des données, travaillent conjointement à tester et à mettre à l'échelle les initiatives IA, avec une gouvernance intégrée dès le départ [3]. L'architecte d'entreprise joue le rôle de facilitateur de cette collaboration, comme l'a établi le chapitre 10.

---

#### 11.2 Le pattern « AI Factory » en action : du workshop artisanal à la capacité industrielle

##### Le concept de l'*AI Factory*

Le concept d'*AI Factory* (*usine IA*) décrit la transformation d'une organisation qui traite chaque implémentation d'IA comme un projet artisanal isolé vers une organisation qui construit des capacités modulaires et réutilisables industrialisées. McKinsey formalise cette distinction à travers deux patterns complémentaires [6] :

**Le pattern *artisan*** déploie des outils d'IA générative à l'échelle comme assistants, augmentant le travail des ingénieurs expérimentés et des stratèges technologiques. Ce pattern est adapté aux tâches complexes, créatives et contextuelles.

**Le pattern *factory*** déploie des agents IA autonomes capables de collaborer et de naviguer des processus de bout en bout. Ce pattern est adapté aux processus prévisibles et routiniers — surveillance des journaux, mises à jour réglementaires, tests automatisés.

Les deux patterns ne sont pas exclusifs : les organisations performantes les combinent en fonction du type de tâche. La clé réside dans la capacité à basculer de l'un à l'autre grâce à une architecture modulaire qui permet la réutilisation des composants entre les deux modes [6].

##### L'étude de cas 84.51° : du routage en magasin à l'optimisation logistique

L'étude de cas de 84.51°, la filiale de science des données de Kroger (l'un des plus grands distributeurs nord-américains), constitue l'illustration la plus documentée du pattern *AI Factory*. Publiée dans *CDO Magazine* par Kristin Foster, vice-présidente principale de la science des données et de l'IA, cette étude retrace la transformation d'une équipe de plus de 250 scientifiques des données [5].

**Le point de départ : le routage dynamique en magasin.** L'innovation initiale consistait à optimiser l'exécution des commandes dans près de 2 500 magasins Kroger. Le système traite 200 000 décisions par seconde et a permis une réduction de 10 % de la distance parcourue par les préparateurs, avec un temps d'exécution des commandes inférieur à deux heures, y compris aux heures de pointe [5].

**La réutilisation : le routage véhiculaire (VROOM).** La percée n'est pas dans le premier système, mais dans sa réutilisation. L'équipe a appliqué la même architecture algorithmique — le *dynamic batching* (groupement dynamique) — au problème du routage des véhicules de livraison entre les centres de distribution et les magasins (*Vehicle Routing Optimization On-demand Method*, VROOM).

Les résultats de cette réutilisation sont significatifs :

- **Réduction de 50 % du temps de développement** : de 6 à 9 mois à 3 à 4,5 mois [5]
- **Performance supérieure aux attentes** : réduction additionnelle de 8 % de la distance parcourue
- **Bénéfices secondaires** : amélioration de la flexibilité de la chaîne d'approvisionnement et réduction de l'empreinte carbone

[Figure 11.1 — Transformation « Workshop → Factory » chez 84.51° : trajectoire de réutilisation]

```
PHASE 1 : WORKSHOP (artisan)          PHASE 2 : FACTORY (industriel)
┌─────────────────────────┐            ┌─────────────────────────┐
│ Routage en magasin      │            │ Capacité « Dynamic      │
│ (cas d'usage unique)    │            │ Batching » réutilisable │
│                         │            │                         │
│ • Conception sur mesure │───────────►│ • Module générique      │
│ • 6-9 mois développement│            │ • Interfaces standards  │
│ • Équipe dédiée         │            │ • Gouvernance intégrée  │
│ • 200K décisions/sec    │            │ • Monitoring centralisé │
└─────────────────────────┘            └────────┬────────────────┘
                                                │
                              ┌─────────────────┼─────────────────┐
                              │                 │                 │
                         ┌────▼────┐      ┌─────▼─────┐    ┌─────▼─────┐
                         │ VROOM   │      │ Prochaine │    │ Capacité  │
                         │ (routage│      │ application│    │  future   │
                         │véhicule)│      │           │    │           │
                         │         │      │           │    │           │
                         │-50% dév.│      │-50% dév.  │    │-50% dév.  │
                         │-8% dist.│      │(projeté)  │    │(projeté)  │
                         └─────────┘      └───────────┘    └───────────┘
```

*La figure illustre la transition du modèle artisanal (un cas d'usage = un développement complet) au modèle industriel (une capacité réutilisable = N applications). La réduction de 50 % du temps de développement est documentée par CDO Magazine [5].*

##### Les cinq piliers de l'approche *AI Factory*

L'analyse de 84.51° permet d'identifier cinq piliers qui structurent le pattern *AI Factory* [5] :

**1. La conception modulaire (*modular design*).** Les capacités sont conçues dès l'origine pour la réutilisation. Cela signifie que le premier développement est légèrement plus coûteux — il faut abstraire les éléments spécifiques au cas d'usage pour créer des interfaces génériques — mais chaque développement subséquent est significativement moins coûteux.

**2. La reconnaissance de patterns (*pattern recognition*).** L'identification de problèmes algorithmiques communs à travers des défis métier apparemment différents constitue une compétence clé. Le routage en magasin et le routage véhiculaire semblent distincts du point de vue métier, mais partagent un substrat algorithmique commun — le *dynamic batching* — que l'architecte et le scientifique des données peuvent identifier.

**3. La mise à l'échelle efficiente (*efficient scaling*).** La réutilisation du code et des pipelines réduit le temps de démarrage des preuves de concept (*proof of concept*, POC). Au lieu de repartir de zéro, chaque nouveau projet démarre avec une base validée en production.

**4. Les opérations standardisées (*standardized operations*).** Un cadre centralisé de surveillance, de gouvernance et de soutien permet de gérer un portefeuille croissant de capacités IA sans multiplier proportionnellement les équipes opérationnelles.

**5. Le *storytelling* de plan directeur (*blueprint storytelling*).** Les succès antérieurs servent de preuve pour accélérer l'approbation des nouveaux projets. L'architecte d'entreprise peut s'appuyer sur les métriques documentées — 50 % de réduction du temps de développement, 10 % de réduction des distances — pour construire les cas d'affaires des prochaines initiatives.

> **En pratique — Appliquer le pattern *AI Factory* dans votre organisation**
>
> **Contexte** : Une organisation qui a développé un premier cas d'usage IA en production (par exemple, un chatbot de service client ou un système de détection de fraude) souhaite accélérer le déploiement de nouveaux cas d'usage.
>
> **Étape 1 — Identifier les capacités réutilisables.** Analyser le premier cas d'usage pour extraire les composants génériques : pipeline de données, modèle de base, mécanisme d'orchestration, couche de gouvernance. Séparer ce qui est spécifique au cas d'usage (les données métier, les règles de décision) de ce qui est transversal (le traitement des requêtes, la surveillance, le *logging*).
>
> **Étape 2 — Abstraire et standardiser.** Créer des interfaces standards pour les composants réutilisables. Documenter les contrats d'API, les formats de données d'entrée/sortie, les métriques de performance attendues et les exigences de gouvernance.
>
> **Étape 3 — Valider par un deuxième cas d'usage.** Appliquer les composants réutilisables à un deuxième cas d'usage métier différent. Mesurer la réduction du temps de développement par rapport au premier cas. L'objectif est une réduction de 30 à 50 %, conformément aux résultats documentés par 84.51° [5].
>
> **Étape 4 — Industrialiser.** Une fois le pattern validé par deux cas d'usage, créer un catalogue de capacités IA réutilisables accessible aux équipes projet. Intégrer ce catalogue dans le processus de lancement des initiatives IA : chaque nouveau projet doit d'abord vérifier si des capacités existantes peuvent être réutilisées ou adaptées.
>
> **Mesure de succès** : Temps de déploiement du troisième cas d'usage ≤ 50 % du premier; taux de réutilisation des composants ≥ 60 %.

---

#### 11.3 Cas d'échec emblématique : VW Cariad — 7,5 milliards $ de pertes, le piège du « big bang » sans fondations architecturales

##### La genèse du projet

En 2019, le groupe Volkswagen (VW) lance *Car.Software Organisation*, une unité interne destinée à centraliser le développement logiciel de ses douze marques. En 2020, cette unité est rebaptisée *Cariad* avec une ambition explicite : devenir la plus grande entreprise de logiciels d'Europe après SAP [7]. L'investissement cumulé atteint 14 milliards d'euros [7]. La promesse est celle d'un système d'exploitation unifié, alimenté par l'IA, capable de piloter l'ensemble des véhicules électriques du groupe — de la Volkswagen ID.4 à la Porsche Taycan.

Le résultat est l'un des échecs technologiques les plus coûteux de l'histoire industrielle récente : plus de 7,5 milliards de dollars américains de pertes opérationnelles entre 2022 et 2024 [8] [9]. En 2024, les pertes opérationnelles de Cariad atteignaient 2,64 milliards de dollars [8]. Les lancements de la Porsche Macan Electric et de l'Audi Q6 e-tron ont été retardés de plus d'un an en raison de problèmes logiciels [8]. Plus de 1 600 postes ont été supprimés, soit environ un tiers de l'effectif [9].

##### L'analyse architecturale de l'échec

L'échec de Cariad n'est pas un échec technologique au sens strict — les algorithmes et les composants individuels fonctionnaient — mais un échec architectural systémique. L'analyse des sources disponibles permet d'identifier sept défaillances architecturales majeures [7] [9] :

**1. L'approche « *big bang* » sans fondations.** VW a tenté simultanément de remplacer les systèmes hérités (*legacy*), de développer une IA sur mesure et de concevoir des puces propriétaires — ce que NineTwoThree qualifie de triple erreur fatale [9]. L'architecte d'entreprise sait qu'une transformation de cette ampleur exige un séquençage rigoureux. Le chapitre 7 a établi le principe de la « couche minimale viable » (*Minimum Viable Architecture Layer*) : construire les fondations avant de bâtir les étages.

**2. L'absence d'autonomie architecturale.** Cariad employait plus de 6 000 personnes à son apogée, mais ne disposait pas de budget propre. Le financement provenait des marques — qui conservaient le pouvoir de décision [7]. Cette structure créait un conflit d'agence permanent : Cariad devait livrer mais ne pouvait pas décider. En termes architecturaux, la gouvernance opérationnelle était découplée de la gouvernance stratégique, une configuration que le chapitre 9 a identifiée comme un antipattern de gouvernance IA.

**3. L'héritage non maîtrisé.** Les plateformes 1.1 et 1.2, développées initialement par Audi et Porsche, ont été transférées à Cariad avec plus de 200 fournisseurs différents [7]. L'intégration de ces composants hétérogènes absorbait l'essentiel des ressources de calcul et de l'énergie des équipes, ne laissant que peu de capacité pour l'innovation. L'architecte d'entreprise reconnaît ici le pattern classique de la dette technique non gérée qui étouffe les initiatives de transformation.

**4. Le recrutement massif sans culture d'ingénierie.** En quelques mois, Cariad a recruté 6 000 employés — certains postes pourvus en 24 heures [7]. Cette croissance explosive a dilué la culture d'ingénierie. Selon les analyses internes, les développeurs passaient plus de temps à créer des présentations qu'à écrire du code, avec jusqu'à 17 réunions de suivi hebdomadaires par personne [7]. L'absence d'une architecture organisationnelle claire — rôles, responsabilités, processus de décision — a transformé une masse critique de talent en bureaucratie improductive.

**5. La compétition interne entre marques.** Les douze marques du groupe VW n'ont jamais véritablement accepté de céder leur autonomie logicielle à Cariad. Les conflits d'intérêts entre Volkswagen, Audi, Porsche et les autres marques ont persisté, chacune défendant ses propres exigences et ses propres fournisseurs [7]. L'architecture d'entreprise enseigne que toute plateforme partagée exige un mandat clair du sommet de l'organisation — ce que le chapitre 10 a formalisé comme le principe de l'*AI Center of Excellence* (CoE) avec autorité transversale.

**6. Le management automobile dans un contexte logiciel.** Les dirigeants de Cariad provenaient majoritairement de l'industrie automobile traditionnelle, non du développement logiciel [7]. Cette inadéquation entre la culture de management et la nature du produit a conduit à des pratiques de gestion inadaptées — cycles de validation longs, processus de décision hiérarchiques, métriques de performance orientées production plutôt que vélocité de développement.

**7. L'absence de boucles de rétroaction rapides.** L'architecture en cascade (*waterfall*), implicite dans la structure organisationnelle, ne permettait pas d'identifier et de corriger les problèmes rapidement. Les défauts logiciels n'étaient découverts qu'au moment de l'intégration dans les véhicules, des mois après leur introduction — trop tard pour les corriger sans impact sur les calendriers de lancement.

[Figure 11.2 — Anatomie de l'échec Cariad : cascade de défaillances architecturales]

```
DÉCISION INITIALE                     CONSÉQUENCES EN CASCADE
┌──────────────────┐
│ « Big bang »     │
│ transformation   │──────┐
│ simultanée       │      │
└──────────────────┘      │
                          ▼
┌──────────────────┐    ┌──────────────────────────────────┐
│ Pas de budget    │───►│ Conflit gouvernance :             │
│ propre           │    │ livrer sans décider               │
└──────────────────┘    └───────────────┬──────────────────┘
                                        │
┌──────────────────┐                    ▼
│ 200+ fournisseurs│───►┌──────────────────────────────────┐
│ hérités          │    │ Complexité d'intégration          │
└──────────────────┘    │ insurmontable                     │
                        └───────────────┬──────────────────┘
┌──────────────────┐                    │
│ 6 000 recrues    │                    ▼
│ en quelques mois │───►┌──────────────────────────────────┐
└──────────────────┘    │ Bureaucratie > Développement      │
                        │ (17 réunions/semaine/personne)    │
┌──────────────────┐    └───────────────┬──────────────────┘
│ 12 marques en    │                    │
│ compétition      │───►                ▼
└──────────────────┘    ┌──────────────────────────────────┐
                        │ RÉSULTAT : 7,5 Md$ de pertes,    │
                        │ retards > 1 an, 1 600 emplois    │
                        │ supprimés                         │
                        └──────────────────────────────────┘
```

*La figure illustre la cascade de défaillances architecturales qui a conduit à l'échec de Cariad. Chaque décision initiale (colonne de gauche) produit des conséquences systémiques (colonne de droite) qui s'amplifient mutuellement. L'absence d'architecte d'entreprise avec un mandat transversal et une autorité de gouvernance est le facteur commun à toutes les défaillances.*

##### Les leçons architecturales de Cariad

L'échec de Cariad fournit cinq leçons directement transposables :

**Petites équipes autonomes plutôt que grandes organisations bureaucratiques.** Les équipes performantes en développement logiciel et en IA sont petites (5-12 personnes), autonomes et dotées d'un mandat clair. L'architecture organisationnelle doit refléter l'architecture technique — le principe de la loi de Conway [7].

**Séparer l'innovation de l'héritage.** Les projets d'innovation IA ne doivent pas être soumis aux contraintes des systèmes hérités. L'architecture doit prévoir des mécanismes d'isolation — le pattern « *strangler fig* » (étranglement progressif) ou le bac à sable (*sandbox*) — qui permettent l'innovation sans être paralysé par la dette technique [7].

**Le mandat du sommet est non négociable.** Une plateforme IA transversale à plusieurs unités d'affaires exige un mandat explicite du CEO ou du comité de direction, avec une autorité budgétaire indépendante [7].

**Le séquençage avant l'ambition.** Le « *big bang* » est un antipattern. L'approche incrémentale — livrer une capacité minimale viable, valider, itérer — est la seule qui fonctionne à l'échelle d'une transformation de cette ampleur.

**La culture ne se décrète pas.** Recruter 6 000 personnes ne crée pas une culture d'ingénierie logicielle. La culture se construit par les pratiques, les rituels et les structures organisationnelles — pas par les effectifs.

---

#### 11.4 Cas d'échec récurrents : IA sans architecture (*shadow IT*, silos de données, « pilotitis »)

##### L'ampleur systémique des échecs IA

Au-delà de l'échec spectaculaire de Cariad, l'industrie fait face à un problème systémique d'échecs IA récurrents. Les données convergent vers un constat alarmant. Gartner prévoit que 30 % des projets d'IA générative seront abandonnés après la phase de preuve de concept d'ici la fin de 2025 [10]. En amont, 85 % des projets IA échouent en raison de la mauvaise qualité des données, et Gartner anticipe que 60 % des projets IA seront abandonnés d'ici 2026 faute de données suffisamment préparées [10]. Pour les systèmes d'IA agentique (*agentic AI*), les prévisions sont encore plus sévères : Gartner anticipe l'annulation de plus de 40 % des projets d'IA agentique d'ici la fin 2027, en raison de coûts croissants, d'une valeur business incertaine et de contrôles de risque inadéquats [11].

L'étude du *Remote Labor Index* (2026) pousse l'analyse plus loin : sur 240 tâches professionnelles réelles issues de la plateforme Upwork (valeur moyenne de 630 $ US par tâche), le modèle IA le plus performant (Claude Opus 4.5) n'atteint qu'un taux de succès de 3,75 % pour une livraison professionnelle de bout en bout, soit un taux d'échec de 96,25 % [12]. Cet écart entre les performances en conditions de laboratoire (*benchmark*) et les performances en conditions réelles illustre précisément le fossé que l'architecture d'entreprise doit combler.

##### Le pattern d'échec « *Shadow AI* »

Le *Shadow AI* (IA fantôme) — l'utilisation d'outils et d'applications d'IA sans l'approbation de l'équipe informatique ou des équipes de conformité — constitue le pattern d'échec le plus répandu et le plus insidieux. Selon le rapport *State of Shadow AI* de Reco (2025), les organisations gèrent en moyenne 490 applications SaaS (*Software as a Service*), dont seulement 47 % sont autorisées [13]. OpenAI ChatGPT représente à lui seul 53 % de l'activité *Shadow AI*, avec plus de 10 000 utilisateurs en entreprise non encadrés [13].

Les conséquences sont mesurables : 20 % des organisations déclarent avoir subi une brèche de sécurité liée au *Shadow AI*, avec un coût additionnel moyen de 200 000 $ US par incident [14]. Pour les petites organisations (11 à 50 employés), le risque est encore plus concentré : 27 % des employés utilisent des outils non autorisés [13].

Le *Shadow AI* échappe aux mécanismes de gouvernance de l'architecture d'entreprise — pas parce que ces mécanismes sont inadéquats, mais parce qu'ils n'ont jamais été appliqués. Les outils sont adoptés en dehors des processus de sélection technologique, les données transitent par des canaux non surveillés et les résultats ne sont soumis à aucune validation. Le chapitre 9 a proposé des stratégies de détection et d'encadrement du *Shadow AI*; les cas d'échec documentés ici confirment l'urgence de leur mise en œuvre.

##### Le pattern d'échec « silos de données »

Les silos de données — des ensembles de données isolés au sein de fonctions ou de systèmes distincts, inaccessibles aux autres parties de l'organisation — constituent la deuxième cause d'échec des projets IA. McKinsey identifie la qualité et la disponibilité des données comme l'obstacle principal à la mise à l'échelle de l'IA, cité par 43 % des organisations [1]. Gartner confirme que le manque de maturité technique est cité par un pourcentage équivalent (43 %), suivi du déficit de compétences et de littératie des données (35 %) [10].

Les silos de données produisent des effets en cascade sur les projets IA :

**Des modèles entraînés sur des données partielles.** Un modèle de prédiction de la demande qui n'a accès qu'aux données de vente d'un canal (en ligne) mais pas de l'autre (en magasin) produit des prédictions biaisées et incomplètes.

**Des duplications coûteuses.** Chaque équipe IA qui doit reconstruire ses propres pipelines de données parce que les données de l'organisation ne sont pas accessibles via une plateforme commune multiplie les coûts et les délais.

**Une gouvernance impossible.** Sans vue transversale sur les données utilisées par les différents modèles IA, la conformité réglementaire — traçabilité, explicabilité, protection des données personnelles — ne peut être assurée.

##### Le pattern d'échec « *pilotitis* » (purgatoire des pilotes)

La « *pilotitis* » — la multiplication de projets pilotes IA sans jamais atteindre la production — est le symptôme le plus visible d'une absence d'architecture d'entreprise IA. Selon les analyses d'Astrafy, seulement 33 % des projets IA atteignent la production, avec un délai moyen de 8 mois entre le prototype et le déploiement [15]. Les organisations les plus affectées accumulent des dizaines de preuves de concept (*POC*) qui démontrent des résultats prometteurs en laboratoire mais ne survivent pas au contact avec les systèmes de production, les exigences de sécurité, les contraintes de performance et les réalités organisationnelles.

L'article de CIO.com sur le renouveau de l'architecture d'entreprise identifie un fossé de perception révélateur : 80 % des CEO s'attendent à ce que l'IA contribue à la croissance du chiffre d'affaires, alors que seulement 3 % des CIO (*Chief Information Officer*) partagent cette attente [16]. Cet écart de perception reflète précisément l'absence de fondations architecturales qui permettraient de relier l'ambition stratégique à la capacité d'exécution — le rôle fondamental de l'architecte d'entreprise tel qu'il a été défini au chapitre 4.

[Tableau 11.2 — Taxonomie des patterns d'échec IA et remèdes architecturaux]

| Pattern d'échec | Fréquence | Coût typique | Cause racine architecturale | Remède architectural |
|---|---|---|---|---|
| *Shadow AI* | 53 % d'activité non autorisée [13] | +200 K$/incident [14] | Absence de gouvernance IA | Registre centralisé, *AI Gateway* |
| Silos de données | 43 % des organisations [1] | Duplication des coûts de données | Absence de *data mesh* / plateforme de données | Architecture de données unifiée |
| *Pilotitis* | 67 % des projets n'atteignent pas la production [15] | Investissements perdus | Absence de plateforme IA partagée | Pattern *AI Factory* (section 11.2) |
| *Big bang* (type Cariad) | Rare mais catastrophique | Milliards $ | Séquençage absent, gouvernance fragmentée | Approche incrémentale, mandat du sommet |

*Source : Synthèse des auteurs à partir de [1], [9], [10], [13], [14], [15]*

##### Le dénominateur commun : l'absence d'architecture d'entreprise

L'analyse transversale de ces patterns d'échec révèle un dénominateur commun : l'absence d'une architecture d'entreprise qui fournisse les fondations — gouvernance des données, plateforme partagée, standards d'intégration, mécanismes de passage à l'échelle — nécessaires au déploiement pérenne de l'IA. Les projets IA individuels peuvent réussir en isolation, dans un environnement contrôlé; ils échouent systématiquement lorsqu'ils doivent s'intégrer dans le système d'information existant, respecter les contraintes réglementaires et produire de la valeur à l'échelle de l'organisation.

Comme le synthétise Informatica, « la raison la plus surprenante pour laquelle la plupart des projets IA échouent » n'est pas technologique : c'est la qualité et la disponibilité des données, qui sont des responsabilités architecturales fondamentales [17].

---

#### 11.5 Patterns réutilisables : « *AI Capability Factory* », « *AI-Ready Domain* », « *Agentic Safe Sandbox* », « *Composable AI Module* »

##### Préambule : de l'observation à la formalisation

Les sections précédentes ont documenté les facteurs de succès et les causes d'échec. Cette section formalise quatre patterns architecturaux réutilisables qui encapsulent les leçons apprises. Ces patterns sont présentés ici dans leur logique d'application et leur contexte métier; l'Annexe G en fournit les spécifications techniques détaillées (diagrammes d'architecture, contrats d'interface, critères de décision).

Chaque pattern suit une structure standardisée : contexte et problème, forces en tension, solution, conséquences et critères d'applicabilité.

##### Pattern 1 : *AI Capability Factory*

**Contexte et problème.** L'organisation a déployé un ou plusieurs cas d'usage IA en production avec succès, mais chaque nouveau cas d'usage exige un développement complet — nouveaux pipelines de données, nouvelles intégrations, nouveau processus de gouvernance. Les coûts et les délais ne diminuent pas au fil du temps; l'organisation ne bénéficie d'aucun effet d'apprentissage.

**Forces en tension.** (a) Le besoin d'accélérer le déploiement de nouveaux cas d'usage vs (b) la nécessité de maintenir la qualité et la gouvernance; (c) la spécificité de chaque cas d'usage métier vs (d) la généricité des composants techniques sous-jacents.

**Solution.** Extraire les capacités techniques communes des cas d'usage existants — orchestration de données, inférence de modèles, surveillance, gouvernance — dans un catalogue de capacités réutilisables. Créer un *AI Gateway* centralisé qui expose ces capacités via des interfaces standardisées. Chaque nouveau cas d'usage compose ses besoins à partir du catalogue existant et n'ajoute que la logique métier spécifique.

**Conséquences.** Réduction de 30 à 50 % du temps de développement pour chaque nouveau cas d'usage (documenté par 84.51° [5]). Standardisation de la gouvernance. Réduction du *Shadow AI* par l'attractivité de la plateforme officielle. Investissement initial supérieur pour le premier cas d'usage (temps d'abstraction).

**Critères d'applicabilité.** L'organisation doit disposer d'au moins un cas d'usage IA en production et d'une équipe de données centralisée ou fédérée. Le catalogue n'a de sens que si l'organisation prévoit au moins trois cas d'usage IA dans les 12 à 18 mois suivants.

##### Pattern 2 : *AI-Ready Domain*

**Contexte et problème.** Un domaine métier (par exemple, la chaîne d'approvisionnement, les ressources humaines, la finance) souhaite intégrer des capacités IA, mais ses données sont fragmentées, ses processus ne sont pas documentés et ses systèmes ne sont pas interopérables. Chaque tentative d'implémentation IA achoppe sur le même constat : « les données ne sont pas prêtes ».

**Forces en tension.** (a) La pression métier pour des résultats IA rapides vs (b) la nécessité de fondations de données solides; (c) l'autonomie du domaine dans la gestion de ses données vs (d) la cohérence d'entreprise dans les standards de données.

**Solution.** Appliquer au domaine un programme de préparation à l'IA structuré en quatre étapes : (1) cartographie des données du domaine — inventaire, qualité, propriété, lignage; (2) assainissement et standardisation — nettoyage, normalisation, création de contrats de données (*data contracts*); (3) exposition des données via des *API* conformes aux standards d'entreprise; (4) validation de la préparation par un cas d'usage pilote de faible complexité.

**Conséquences.** Le domaine devient autonome dans le lancement d'initiatives IA. La qualité des données est assurée par construction. L'intégration avec les autres domaines est facilitée par les standards communs. Le délai initial (3 à 6 mois pour les étapes 1-3) est compensé par l'accélération de tous les projets IA subséquents.

**Critères d'applicabilité.** Ce pattern est prioritaire pour les domaines identifiés comme stratégiques dans la feuille de route IA de l'organisation et dont la maturité des données est insuffisante — ce qui, selon Gartner, concerne 60 % des organisations [10].

[Figure 11.3 — Les quatre patterns architecturaux IA et leur positionnement dans le cycle de vie]

```
         Maturité IA de l'organisation ──────────────────────────►
         Basse                                              Élevée

    ┌────────────────┐  ┌────────────────┐  ┌────────────────┐
    │ AI-READY       │  │ AGENTIC SAFE   │  │ AI CAPABILITY  │
    │ DOMAIN         │  │ SANDBOX        │  │ FACTORY        │
    │                │  │                │  │                │
    │ Préparer les   │  │ Expérimenter   │  │ Industrialiser │
    │ fondations     │  │ en sécurité    │  │ et réutiliser  │
    │ d'un domaine   │  │ les nouvelles  │  │ les capacités  │
    │ métier         │  │ technologies   │  │ IA             │
    └───────┬────────┘  └───────┬────────┘  └───────┬────────┘
            │                   │                    │
            └─────────┬─────────┘                    │
                      │                              │
              ┌───────▼──────────────────────────────▼───────┐
              │           COMPOSABLE AI MODULE                │
              │                                               │
              │ Assembler des modules IA interchangeables     │
              │ pour construire des solutions sur mesure       │
              │ (transversal à tous les niveaux de maturité)  │
              └───────────────────────────────────────────────┘
```

*La figure positionne les quatre patterns sur l'axe de maturité IA de l'organisation. Le pattern AI-Ready Domain s'adresse aux organisations en début de parcours, le Agentic Safe Sandbox aux organisations en phase d'expérimentation, le AI Capability Factory aux organisations en phase d'industrialisation. Le Composable AI Module est transversal et applicable à tous les niveaux.*

##### Pattern 3 : *Agentic Safe Sandbox*

**Contexte et problème.** L'organisation souhaite expérimenter avec des technologies IA émergentes — agents autonomes, systèmes multi-agents, modèles de fondation — mais le risque d'impact sur les systèmes de production, les données sensibles ou la conformité réglementaire empêche toute expérimentation. Gartner rapporte une augmentation de 1 445 % des demandes d'information sur les systèmes multi-agents entre le premier trimestre 2024 et le deuxième trimestre 2025 [18], confirmant l'urgence de la demande d'expérimentation.

**Forces en tension.** (a) Le besoin d'expérimenter rapidement avec des technologies émergentes vs (b) la nécessité de protéger les systèmes de production et les données sensibles; (c) la liberté créative des équipes d'innovation vs (d) la conformité réglementaire et la gouvernance.

**Solution.** Créer un environnement d'expérimentation isolé (*sandbox*) avec les caractéristiques suivantes : (1) isolation technique — les expérimentations n'ont pas accès aux systèmes de production ni aux données réelles non anonymisées; (2) données synthétiques ou anonymisées — des jeux de données représentatifs mais sans données personnelles identifiables; (3) garde-fous de gouvernance — les agents ne peuvent pas exécuter d'actions irréversibles sans approbation humaine dans la boucle (*human-in-the-loop*); (4) métriques de sortie — des critères mesurables qui déterminent si une expérimentation peut passer à la phase de production.

L'architecture de Salesforce pour l'entreprise agentique fournit un cadre de référence : « commencer par la solution la plus simple et efficace, en ajoutant de la complexité uniquement lorsqu'une valeur business claire justifie la charge opérationnelle et le risque supplémentaires » [19]. Le *sandbox* doit respecter ce principe de simplicité en offrant un environnement minimal mais suffisant pour valider les hypothèses.

**Conséquences.** Accélération du cycle d'expérimentation (semaines plutôt que mois). Réduction du risque de *Shadow AI* — les équipes disposent d'un espace officiel pour expérimenter. Production de données d'évaluation qui alimentent les décisions d'investissement. Coût opérationnel du *sandbox* à prévoir dans le budget de la plateforme IA.

**Critères d'applicabilité.** Ce pattern est pertinent dès que l'organisation envisage des technologies IA émergentes — en particulier l'IA agentique — et qu'elle dispose d'un minimum de gouvernance IA (registre de modèles, politique de données).

##### Pattern 4 : *Composable AI Module*

**Contexte et problème.** L'organisation utilise plusieurs capacités IA — modèle de traitement du langage naturel (*Natural Language Processing*, NLP), modèle de vision par ordinateur, moteur de recommandation, agent de conformité — mais chaque capacité est implémentée comme un système monolithique avec ses propres dépendances, ses propres données et sa propre infrastructure. La modification ou le remplacement d'un composant exige la refonte de l'ensemble.

**Forces en tension.** (a) La diversité des technologies IA requises vs (b) la nécessité de cohérence opérationnelle; (c) la vitesse d'évolution des technologies IA (les modèles deviennent obsolètes en 6 à 12 mois) vs (d) la stabilité attendue des systèmes de production.

**Solution.** Concevoir chaque capacité IA comme un module composable avec : (1) des interfaces standardisées (*API* REST ou *gRPC*, contrats de données documentés); (2) une autonomie de déploiement — chaque module peut être déployé, mis à jour ou remplacé indépendamment; (3) une observabilité intégrée — métriques de performance, journaux de traçabilité, alertes de dérive; (4) un contrat de niveau de service (*Service Level Agreement*, SLA) explicite.

Le marché de l'infrastructure composable, évalué à 8,3 milliards de dollars américains en 2025, connaît une croissance annuelle de 24,9 % [20], confirmant l'adoption industrielle de cette approche. Les protocoles émergents — le *Model Context Protocol* (MCP) d'Anthropic et le *Agent-to-Agent Protocol* (A2A) de Google — fournissent les standards d'interopérabilité qui permettent aux modules composables de communiquer [18].

**Conséquences.** Remplacement d'un modèle IA sans impact sur le reste du système. Réduction du risque de dépendance à un fournisseur (*vendor lock-in*). Possibilité de combiner des modèles de différents fournisseurs dans une même chaîne de traitement. Complexité accrue de l'orchestration, qui exige un investissement dans les couches de médiation.

**Critères d'applicabilité.** Ce pattern est transversal : il s'applique dès que l'organisation déploie plus d'un modèle ou d'un agent IA en production. Il est le complément naturel du pattern *AI Capability Factory* — l'usine produit des modules composables.

[Tableau 11.3 — Comparaison des quatre patterns architecturaux IA]

| Pattern | Problème résolu | Pré-requis | Bénéfice clé | Complexité |
|---|---|---|---|---|
| *AI Capability Factory* | Coûts et délais non décroissants | ≥ 1 cas d'usage en production | −30 à 50 % temps de développement | Moyenne |
| *AI-Ready Domain* | Données non préparées | Sponsorship du domaine métier | Fondation durable pour l'IA | Faible à moyenne |
| *Agentic Safe Sandbox* | Impossibilité d'expérimenter | Gouvernance IA minimale | Cycle d'expérimentation accéléré | Moyenne |
| *Composable AI Module* | Monolithes IA rigides | Standards d'interface définis | Remplacement sans impact | Élevée |

*Source : Synthèse des auteurs. Voir Annexe G pour les spécifications techniques détaillées.*

---

#### 11.6 Leçons transversales : pourquoi les leaders IA sont aussi des leaders en architecture

##### Le constat statistique

L'analyse croisée des cas de succès et d'échec présentés dans ce chapitre permet de formuler un constat qui transcende les études de cas individuelles : les organisations qui réussissent la mise à l'échelle de l'IA sont celles qui investissent dans l'architecture d'entreprise comme capacité stratégique, et non comme fonction de documentation. Ce constat est corroboré par les données quantitatives disponibles.

McKinsey distingue explicitement les « *high performers* » (organisations à haute performance IA) des autres [1]. Ces organisations se caractérisent par : (a) des architectures modulaires et ouvertes, (b) des pratiques de gouvernance intégrées dans les pipelines de développement, (c) des équipes de fusion interfonctionnelles, et (d) des mécanismes de mesure de la valeur IA reliés aux indicateurs financiers de l'organisation. Chacune de ces caractéristiques relève du mandat de l'architecte d'entreprise tel qu'il a été défini dans les chapitres précédents.

Databricks rapporte que les organisations les plus performantes ont mis 11 fois plus de modèles IA en production que l'année précédente [2]. Cette accélération n'est pas corrélée avec l'augmentation des budgets IA — elle est corrélée avec la maturité des fondations architecturales : pipelines de données automatisés, registres de modèles, mécanismes de déploiement continu.

##### Six leçons transversales

L'analyse consolidée des cas présentés dans ce chapitre permet de dégager six leçons transversales :

**Leçon 1 : L'architecture précède la technologie.** Chaque cas de succès démontre que les fondations architecturales — plateforme de données, mécanismes de gouvernance, standards d'intégration — ont été construites avant le déploiement des cas d'usage IA. Chaque cas d'échec confirme que l'absence de ces fondations est le facteur prédictif le plus fiable d'un échec, indépendamment du budget investi. VW Cariad a investi 14 milliards d'euros et a échoué; 84.51° a réussi avec un investissement incomparablement moindre mais des fondations architecturales solides.

**Leçon 2 : La réutilisation est le multiplicateur de valeur.** Le passage du modèle artisanal au modèle industriel — documenté par le pattern *AI Factory* — est le mécanisme principal par lequel l'IA génère des rendements croissants. La réduction de 50 % du temps de développement observée chez 84.51° se cumule à chaque nouveau cas d'usage, créant un avantage compétitif durable.

**Leçon 3 : La gouvernance est un accélérateur, pas un frein.** Le discours dominant présente la gouvernance comme un obstacle à l'innovation. Les cas de succès démontrent le contraire : la gouvernance intégrée (*built-in governance*) accélère le passage à la production en réduisant les cycles de validation et en éliminant les surprises réglementaires. Le *Shadow AI* — l'absence de gouvernance — est précisément ce qui ralentit les organisations en multipliant les risques et les reprises.

**Leçon 4 : Le séquençage est une compétence architecturale.** L'échec de Cariad est avant tout un échec de séquençage : tout a été tenté simultanément. Les succès démontrent un séquençage rigoureux — fondations d'abord, cas d'usage pilote ensuite, mise à l'échelle enfin. L'architecte d'entreprise est le professionnel le mieux formé pour définir ce séquençage, car il dispose de la vision transversale nécessaire pour identifier les dépendances et les points de levier.

**Leçon 5 : L'architecture organisationnelle est indissociable de l'architecture technique.** La loi de Conway — « les organisations conçoivent des systèmes qui reflètent leurs structures de communication » — est confirmée par chaque cas étudié. Cariad a échoué en partie parce que 12 marques en compétition ne pouvaient pas produire une plateforme unifiée. 84.51° a réussi parce qu'une équipe centralisée de science des données disposait de l'autonomie et du mandat nécessaires.

**Leçon 6 : La mesure est la condition de la pérennité.** Les organisations qui mesurent systématiquement la valeur créée par l'IA — en termes financiers, opérationnels et stratégiques — sont celles qui obtiennent les budgets de renouvellement et d'expansion. Pfizer mesure les heures économisées et les coûts d'infrastructure réduits. 84.51° mesure le temps de développement et la distance parcourue. Sans métriques, les initiatives IA sont vulnérables aux coupes budgétaires à chaque cycle de révision.

[Tableau 11.4 — Matrice de corrélation : facteurs architecturaux et résultats IA]

| Facteur architectural | Présent dans les cas de succès | Absent dans les cas d'échec | Niveau d'impact |
|---|---|---|---|
| Plateforme de données unifiée | Pfizer, 84.51°, J&J | Cariad, *Shadow AI*, *pilotitis* | Critique |
| Capacités IA modulaires et réutilisables | 84.51° | Cariad | Élevé |
| Gouvernance intégrée | Pfizer, 84.51° | *Shadow AI*, silos de données | Critique |
| Mandat exécutif clair | Pfizer, 84.51° | Cariad | Élevé |
| Métriques de valeur documentées | Pfizer, 84.51° | *Pilotitis* | Modéré à élevé |
| Architecture organisationnelle alignée | 84.51° | Cariad | Élevé |

*Source : Synthèse des auteurs à partir des cas analysés dans les sections 11.1 à 11.4*

##### La convergence entre leadership IA et leadership architectural

L'article de CIO.com sur le renouveau de l'architecture d'entreprise conclut que l'EA doit évoluer d'une documentation statique vers une « EA infusée » (*infused EA*) — une pratique architecturale intégrée directement dans les fonctions métier pour relier la stratégie à l'exécution [16]. Cette transformation est exactement celle que les cas de succès illustrent : l'architecte n'est pas un observateur extérieur qui produit des diagrammes — il est un acteur intégré qui façonne les décisions d'investissement, les architectures de données et les modèles de gouvernance qui déterminent le succès ou l'échec des initiatives IA.

Forrester confirme cette convergence en décrivant l'architecte d'entreprise comme un « champion de la gouvernance agentique » qui gère des écosystèmes d'agents IA, établit des garde-fous et assure l'alignement avec les objectifs business [21]. Ce rôle ne peut être exercé que par un professionnel qui combine la vision transversale de l'architecte d'entreprise, la compréhension technique de l'IA et la crédibilité stratégique auprès du comité de direction — le profil tri-dimensionnel décrit au chapitre 6.

Les données de McKinsey viennent clore la boucle argumentative : les organisations qui déploient l'IA à l'échelle sont celles qui développent des architectures modulaires ouvertes, des agents réutilisables et des pratiques de gouvernance intégrées [6]. Ce sont, par définition, des organisations où l'architecture d'entreprise est une capacité stratégique. Le lien entre leadership IA et leadership architectural n'est pas une corrélation fortuite : c'est une relation causale. L'architecture fournit les fondations sans lesquelles l'IA ne peut pas être déployée de manière pérenne; et l'IA fournit l'impératif qui force l'architecture d'entreprise à se réinventer comme fonction stratégique.

---

#### Points clés à retenir

> **1. Le lien entre maturité EA et succès IA est empiriquement établi.** Les organisations qui réussissent la mise à l'échelle de l'IA (7 % selon McKinsey) sont celles qui disposent de fondations architecturales solides : plateforme de données unifiée, capacités modulaires, gouvernance intégrée. Databricks rapporte une augmentation de 210 % des modèles en production chez les organisations architecturalement matures.
>
> **2. Le pattern *AI Factory* réduit les coûts et les délais de 30 à 50 %.** L'étude de cas de 84.51° (Kroger) démontre que la transformation du modèle artisanal vers le modèle industriel — capacités réutilisables, opérations standardisées, gouvernance centralisée — permet de réduire de moitié le temps de développement pour chaque nouveau cas d'usage IA.
>
> **3. L'échec de VW Cariad (7,5 Md$ de pertes) est un échec architectural, pas technologique.** L'approche « *big bang* » sans fondations, l'absence d'autonomie de gouvernance, l'héritage non maîtrisé et le recrutement massif sans culture d'ingénierie ont produit un échec systémique. Chaque défaillance correspond à un antipattern architectural identifié dans ce livre blanc.
>
> **4. Les échecs récurrents — *Shadow AI*, silos de données, *pilotitis* — partagent une cause commune : l'absence d'architecture d'entreprise.** 53 % de l'activité IA en entreprise est non autorisée (*Shadow AI*); 85 % des projets IA échouent en raison de la qualité des données; 67 % des projets n'atteignent jamais la production. Ces chiffres reflètent non pas un manque de technologie, mais un manque de fondations architecturales.
>
> **5. Quatre patterns réutilisables encapsulent les leçons apprises.** L'*AI Capability Factory* (industrialisation), l'*AI-Ready Domain* (préparation des données), l'*Agentic Safe Sandbox* (expérimentation sécurisée) et le *Composable AI Module* (modularité) offrent des réponses architecturales éprouvées aux défis récurrents du déploiement IA à l'échelle.

---

#### Transition

Ce chapitre a fourni les preuves empiriques — cas de succès, cas d'échec, patterns réutilisables — qui valident l'approche proposée dans l'ensemble de ce livre blanc. Les fondations architecturales (chapitres 7-8), la gouvernance (chapitre 9) et le modèle opérationnel (chapitre 10) ne sont pas des recommandations théoriques : ils sont les facteurs qui différencient les organisations qui pérennisent l'IA en production de celles qui accumulent les pilotes sans impact.

Le chapitre 12 projette cette analyse vers l'avenir. Si l'architecture d'entreprise est le facteur différenciant aujourd'hui, que devient-elle dans un horizon de trois à cinq ans? L'émergence de l'IA agentique, des systèmes multi-agents et de l'architecture composable redéfinit les compétences et les responsabilités de l'architecte d'entreprise. Le chapitre 12 — « L'EA de demain : horizon 2028 » — explore ces évolutions et propose une vision de l'architecte d'entreprise comme orchestrateur d'un écosystème hybride humain-IA.

---

#### Références

[1] McKinsey & Company, « The State of AI: Global Survey 2025 », mars 2025. Disponible : https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-state-of-ai

[2] Databricks, « State of AI: Enterprise Adoption & Growth Trends », 2025. Disponible : https://www.databricks.com/blog/state-ai-enterprise-adoption-growth-trends

[3] Menlo Ventures, « 2025: The State of Generative AI in the Enterprise », 2025. Disponible : https://menlovc.com/perspective/2025-the-state-of-generative-ai-in-the-enterprise/

[4] Nexgen Cloud, « 10 Most Popular Use Cases of AI in Enterprise in 2025 », 2025. Disponible : https://www.nexgencloud.com/blog/case-studies/10-most-popular-use-cases-of-ai-in-enterprise

[5] K. Foster, « From AI Workshop to AI Factory — A Case Study in Reusable AI Capabilities », *CDO Magazine*, 2025. Disponible : https://www.cdomagazine.tech/opinion-analysis/from-ai-workshop-to-ai-factory-a-case-study-in-reusable-ai-capabilities

[6] McKinsey & Company, « Enterprise Technology's Next Chapter: Four Gen AI Shifts That Will Reshape Business Technology », 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/enterprise-technologys-next-chapter-four-gen-ai-shifts-that-will-reshape-business-technology

[7] German Autopreneur, « CARIAD: The Real Story Behind VW's Software Disaster », 2025. Disponible : https://germanautopreneur.com/p/cariad-volkswagen-software-failure-lessons

[8] InsideEVs, « VW Group's Cariad Software Division Had A Bad Year. Again », 2024. Disponible : https://insideevs.com/news/753673/vw-group-cariad-billions-losses-2024/

[9] NineTwoThree, « The Biggest AI Fails of 2025: Lessons from Billions in Losses », 2025. Disponible : https://www.ninetwothree.co/blog/ai-fails

[10] Gartner, « Lack of AI-Ready Data Puts AI Projects at Risk », février 2025. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-02-26-lack-of-ai-ready-data-puts-ai-projects-at-risk

[11] Gartner, « Gartner Predicts Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 », juin 2025. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027

[12] Revolution in AI, « AI Fails: 96% — Remote Labor Index 2026 », février 2026. Disponible : https://www.revolutioninai.com/2026/02/ai-fails-96-percent-remote-labor-index-2026.html

[13] Reco, « 2025 State of Shadow AI Report », 2025. Disponible : https://www.reco.ai/state-of-shadow-ai-report

[14] CloudSphere, « Shadow AI: The Hidden Security Crisis Threatening Your Enterprise in 2025 », 2025. Disponible : https://cloudsphere.com/shadow-ai-the-hidden-security-crisis-threatening-your-enterprise-in-2025/

[15] Astrafy, « Scaling AI from Pilot Purgatory: Why Only 33% Reach Production and How to Beat the Odds », 2025. Disponible : https://astrafy.io/the-hub/blog/technical/scaling-ai-from-pilot-purgatory-why-only-33-reach-production-and-how-to-beat-the-odds

[16] CIO.com, « Data, Agents, and Governance: Why Enterprise Architecture Needs a New Playbook », 2025. Disponible : https://www.cio.com/article/3984410/data-agents-and-governance-why-enterprise-architecture-needs-a-new-playbook.html

[17] Informatica, « The Surprising Reason Most AI Projects Fail — And How to Avoid It at Your Enterprise », 2025. Disponible : https://www.informatica.com/blogs/the-surprising-reason-most-ai-projects-fail-and-how-to-avoid-it-at-your-enterprise.html

[18] Machine Learning Mastery, « 7 Agentic AI Trends to Watch in 2026 », 2026. Disponible : https://machinelearningmastery.com/7-agentic-ai-trends-to-watch-in-2026/

[19] Salesforce, « The Agentic Enterprise — The IT Architecture for the AI-Powered Future », 2025. Disponible : https://architect.salesforce.com/fundamentals/agentic-enterprise-it-architecture

[20] Dataversity, « Building the AI-Ready Enterprise: Composable Architecture, Data Mesh, and Digital Twin », 2025. Disponible : https://www.dataversity.net/articles/building-the-ai-ready-enterprise-composable-architecture-data-mesh-and-digital-twin/

[21] Forrester, « How Agentic AI Elevates The Enterprise Architect's Role », 2025. Disponible : https://www.forrester.com/blogs/the-future-of-the-enterprise-architects-job/

[22] A. Gupta, « Enterprise Architecture as a Dynamic Capability for Scalable and Sustainable Generative AI Adoption », arXiv:2505.06326, mai 2025. Disponible : https://arxiv.org/abs/2505.06326

[23] ISACA, « From Shadow IT to Shadow AI: Navigating the New Frontier of Enterprise Risk », 2025. Disponible : https://www.isaca.org/resources/news-and-trends/newsletters/atisaca/2025/volume-19/from-shadow-it-to-shadow-ai-navigating-the-new-frontier-of-enterprise-risk

[24] McKinsey & Company, « Proven Strategies for Building Gen AI Capability », 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/overcoming-two-issues-that-are-sinking-gen-ai-programs

[25] Quest Software, « The Hidden AI Tax: Why There's an 80% AI Project Failure Rate », 2025. Disponible : https://blog.quest.com/the-hidden-ai-tax-why-theres-an-80-ai-project-failure-rate/
