### Chapitre 8 — L'EA comme médiateur du risque IA

<!-- Rôle argumentatif (PRD §3) : L'EA est le médiateur naturel du risque IA (technique, business, humain, réglementaire). -->

#### Introduction

Le chapitre 7 a établi les fondations architecturales nécessaires au déploiement de l'IA à l'échelle de l'organisation — données, plateformes, composabilité, gouvernance technique. Mais construire des fondations solides ne suffit pas si les risques qui menacent les initiatives IA ne sont pas identifiés, évalués et gérés de manière systématique. L'intelligence artificielle introduit un spectre de risques qui dépasse largement le périmètre traditionnel de la gestion des risques technologiques. Ces risques sont simultanément techniques (défaillance des modèles, dépendance aux fournisseurs), business (retour sur investissement non démontré, cannibalisation des activités existantes), humains (érosion des compétences, résistance organisationnelle) et réglementaires (*EU AI Act*, *GDPR*, exigences sectorielles). Aucune fonction organisationnelle isolée — ni la sécurité informatique, ni la conformité, ni la gestion des risques d'entreprise — ne possède la vision transversale nécessaire pour appréhender cette constellation de risques dans sa globalité.

L'architecte d'entreprise (AE), par sa position à l'intersection des dimensions technique, business et organisationnelle, est le médiateur naturel du risque IA. Le rapport McKinsey *State of AI 2025*, fondé sur une enquête auprès de plus de 1 800 répondants, établit que 51 % des organisations utilisant l'IA ont constaté au moins une conséquence négative, et que le nombre moyen de risques IA activement gérés est passé de deux en 2022 à quatre en 2025 [1]. En parallèle, Gartner prédit que d'ici la fin de 2026, les réclamations juridiques liées à des décès attribuables à l'IA dépasseront les 2 000, en raison de garde-fous insuffisants [2]. Ce chapitre examine les quatre familles de risques IA, propose un cadre de médiation architecturale et décrit la construction d'une matrice de risques vivante, ancrée dans les flux de valeur (*value streams*) et les capacités d'entreprise.

---

#### 8.1 Risques techniques : robustesse, dérives de modèles, dépendance fournisseurs

##### La robustesse des systèmes IA en production

La robustesse — la capacité d'un système IA à maintenir des performances acceptables face à des variations dans les données d'entrée, les conditions d'exploitation et les environnements de déploiement — constitue le premier risque technique que l'architecte d'entreprise doit évaluer. Contrairement aux systèmes d'information traditionnels, où les défaillances sont généralement déterministes et reproductibles, les systèmes d'IA présentent des modes de défaillance stochastiques, souvent difficiles à anticiper et à diagnostiquer.

Le cadre de gestion des risques de l'IA du *National Institute of Standards and Technology* (NIST AI RMF 1.0), publié initialement en janvier 2023 puis mis à jour en 2024-2025, structure l'évaluation de la robustesse autour de quatre fonctions fondamentales : gouverner (*Govern*), cartographier (*Map*), mesurer (*Measure*) et gérer (*Manage*) [3]. La mise à jour de mars 2025 renforce les exigences relatives à la provenance des modèles (*model provenance*), à l'intégrité des données et à l'évaluation des modèles tiers, reconnaissant que la majorité des organisations s'appuient sur des composants IA externes ou en source ouverte [3]. Pour l'architecte d'entreprise, cette dépendance aux composants tiers implique que l'évaluation de la robustesse ne peut se limiter aux modèles développés en interne : elle doit englober l'ensemble de la chaîne d'approvisionnement IA.

Les risques de robustesse spécifiques que l'architecte doit intégrer dans ses évaluations architecturales incluent :

**Les attaques adversariales (*adversarial attacks*).** Des modifications subtiles et souvent imperceptibles des données d'entrée peuvent provoquer des erreurs de classification ou de prédiction. L'architecte doit prévoir des mécanismes de détection et de filtrage dans les couches d'ingestion de données.

**L'empoisonnement de données (*data poisoning*).** L'injection de données malveillantes dans les jeux d'entraînement ou de réglage fin peut corrompre le comportement d'un modèle. L'architecture doit prévoir des mécanismes de validation, de lignage (*lineage*) et de vérification d'intégrité des données tout au long du cycle de vie.

**Les hallucinations des grands modèles de langage (*LLM hallucinations*).** Les LLM génèrent régulièrement des contenus factuellement incorrects avec un degré de confiance élevé. L'architecte doit concevoir des architectures de validation — génération augmentée par la récupération (*Retrieval-Augmented Generation*, RAG), vérification croisée, supervision humaine dans la boucle (*human-in-the-loop*) — qui atténuent ce risque.

Le rapport IBM *Cost of a Data Breach 2025* révèle que 13 % des organisations ont subi des brèches impliquant leurs modèles ou applications IA, et que parmi celles-ci, 97 % ne disposaient pas de contrôles d'accès IA adéquats [4]. Ce chiffre illustre l'ampleur du déficit de robustesse dans les déploiements actuels. L'architecte d'entreprise, en sa qualité de gardien des standards architecturaux, est responsable de l'intégration de ces contrôles dans les architectures de référence.

##### La dérive de modèles (*model drift*)

La dérive de modèles — la dégradation progressive de la performance d'un modèle d'IA en production au fil du temps — constitue un risque technique insidieux car il est souvent invisible jusqu'à ce que ses conséquences deviennent significatives. Contrairement à une panne système, qui est immédiatement détectable, la dérive se manifeste par une érosion graduelle de la précision, de la pertinence ou de la fiabilité des prédictions.

Une étude de référence du *Massachusetts Institute of Technology* (MIT), examinant 32 jeux de données dans quatre secteurs industriels, a démontré que 91 % des modèles d'apprentissage automatique subissent une dégradation au fil du temps [5]. Plus préoccupant encore, 75 % des entreprises ont observé des baisses de performance de leurs systèmes IA sans disposer de mécanismes de surveillance adéquats, et plus de la moitié ont signalé des pertes de revenus mesurables attribuables à des erreurs IA non détectées [5]. Un rapport *LLMOps* de 2025 précise que les modèles laissés inchangés pendant six mois ou plus voient leurs taux d'erreur augmenter de 35 % sur de nouvelles données [5].

L'architecte d'entreprise doit intégrer la gestion de la dérive dans les architectures *LLMOps* à trois niveaux :

**La détection.** Prévoir des mécanismes de surveillance en temps réel qui comparent la distribution des données d'entrée actuelles avec la distribution des données d'entraînement (*data drift*), et qui mesurent en continu les métriques de performance du modèle (*concept drift*).

**L'alerte.** Définir des seuils de dérive qui déclenchent des alertes et des escalades avant que la dégradation n'atteigne un niveau impactant les processus business.

**La remédiation.** Concevoir des architectures qui permettent le remplacement à chaud des modèles (*model swap*), le réentraînement automatisé et le retour à des versions antérieures (*rollback*) sans interruption de service.

[Tableau 8.1 — Types de dérive et implications architecturales]

| Type de dérive | Description | Cause typique | Réponse architecturale |
|---|---|---|---|
| Dérive de données (*data drift*) | Changement dans la distribution statistique des données d'entrée | Évolution du marché, saisonnalité, changement de comportement des utilisateurs | Surveillance de distribution, réentraînement planifié |
| Dérive de concept (*concept drift*) | Changement dans la relation entre les variables d'entrée et la sortie | Évolution des règles d'affaires, changements réglementaires | Réévaluation des hypothèses du modèle, réentraînement ciblé |
| Dérive de performance (*performance drift*) | Dégradation des métriques de performance sans changement de données | Mises à jour de dépendances, changements d'infrastructure | Surveillance des métriques, tests de régression automatisés |

*Source : Synthèse des auteurs à partir de [3], [5], [6]*

##### La dépendance fournisseurs (*vendor lock-in*)

La dépendance aux fournisseurs de services d'IA infonuagiques (*cloud AI*) constitue un risque stratégique que l'architecte d'entreprise est particulièrement bien positionné pour évaluer et atténuer. Contrairement à la dépendance fournisseur traditionnelle en informatique, la dépendance IA présente des caractéristiques spécifiques qui amplifient le risque.

Selon les analyses de l'*International Association of Privacy Professionals* (IAPP), les chaînes d'approvisionnement IA présentent une fragilité structurelle que les approches traditionnelles de gestion des risques fournisseurs ne parviennent pas à appréhender [7]. Les modèles de fondation (*foundation models*) sur lesquels reposent les applications IA d'entreprise sont développés par un nombre restreint de fournisseurs — OpenAI, Google, Anthropic, Meta — créant une concentration de risque sans précédent dans l'histoire des systèmes d'information.

Malgré le fait que 89 % des organisations aient adopté des stratégies multinuage (*multi-cloud*), beaucoup demeurent prisonnières d'arrangements rigides qui augmentent les coûts et limitent l'agilité [8]. Gartner prévoit que d'ici 2027, 35 % des pays seront enfermés dans des plateformes IA régionales utilisant des données contextuelles propriétaires, rendant la migration extrêmement difficile [2].

Les sources de dépendance IA que l'architecte doit évaluer incluent :

**La dépendance aux API propriétaires.** Les applications construites sur les API d'un fournisseur spécifique (par exemple, l'API d'OpenAI) créent un couplage fort qui rend le changement de fournisseur coûteux et risqué. L'architecte doit prévoir des couches d'abstraction — passerelles de modèles (*model gateways*), interfaces standardisées — qui découplent les applications des fournisseurs.

**La dépendance aux données d'entraînement et de réglage fin.** Les modèles réglés fin (*fine-tuned*) sur la plateforme d'un fournisseur ne sont généralement pas portables vers une autre plateforme. L'architecte doit s'assurer que les données d'entraînement et les configurations de réglage fin sont documentées et reproductibles indépendamment du fournisseur.

**La dépendance aux écosystèmes d'outils.** Les plateformes d'IA infonuagiques offrent des écosystèmes intégrés — surveillance, orchestration, *feature stores*, pipelines de données — qui créent des dépendances cumulatives. Comme le souligne le magazine *CTO Magazine*, choisir un écosystème IA infonuagique revient à choisir un cadre de contraintes pour les années à venir [8].

L'architecte d'entreprise dispose de leviers concrets pour atténuer cette dépendance : la conception d'architectures modulaires avec des interfaces standardisées, l'adoption de formats ouverts pour les modèles et les données, la diversification stratégique des fournisseurs et la négociation de clauses contractuelles de portabilité.

---

#### 8.2 Risques business : cannibalisation, désintermédiation, dette d'architecture IA, ROI non démontré

##### La cannibalisation des activités existantes

L'IA ne se contente pas de transformer les processus — elle peut fondamentalement remettre en question les modèles d'affaires existants, y compris ceux de l'organisation qui la déploie. Le risque de cannibalisation se manifeste lorsqu'une initiative IA érode les sources de revenus établies de l'organisation plus rapidement qu'elle ne génère de nouvelles sources de valeur.

Ce phénomène est déjà observable dans plusieurs secteurs. Les cabinets de préparation fiscale voient leurs flux de revenus diminuer à mesure que l'automatisation traite les déclarations courantes. Les cabinets d'avocats qui facturaient des heures de révision documentaire constatent que l'IA accomplit ces tâches en une fraction du temps, bouleversant leurs modèles d'affaires fondés sur les heures facturables [9]. Les conseillers en investissement qui facturaient des honoraires de gestion de portefeuille font face à la concurrence des conseillers-robots (*robo-advisors*) qui gèrent le rééquilibrage automatiquement [9]. Les banques traditionnelles perdent du terrain face aux entreprises de technologie financière (*fintech*) utilisant l'IA pour approuver des prêts en quelques minutes plutôt qu'en quelques semaines [9].

L'architecte d'entreprise doit évaluer systématiquement ce risque en cartographiant les flux de valeur de l'organisation et en identifiant ceux qui sont vulnérables à la disruption par l'IA — qu'elle soit déployée par l'organisation elle-même ou par ses concurrents. Cette cartographie est un préalable à toute décision d'investissement IA : elle permet de distinguer les initiatives qui créent de la valeur nette de celles qui déplacent simplement la valeur entre les unités d'affaires.

##### La désintermédiation

La désintermédiation — l'élimination d'intermédiaires dans une chaîne de valeur par l'IA — constitue un risque business symétrique à la cannibalisation. Si la cannibalisation est un risque interne (l'organisation érode ses propres revenus), la désintermédiation est un risque externe (un acteur tiers utilise l'IA pour éliminer le rôle de l'organisation dans la chaîne de valeur).

L'architecte d'entreprise doit analyser la position de l'organisation dans ses chaînes de valeur et évaluer la vulnérabilité de chaque maillon à la désintermédiation par l'IA. Les maillons les plus vulnérables sont ceux dont la valeur repose principalement sur l'agrégation, la transformation ou la distribution d'information — précisément les fonctions que l'IA excelle à automatiser.

##### La dette d'architecture IA

La dette d'architecture IA — l'accumulation de choix architecturaux sous-optimaux dans les déploiements IA — constitue un risque business à moyen terme qui compromet la capacité de l'organisation à faire évoluer, à maintenir et à mettre à l'échelle ses systèmes IA. Cette dette est l'équivalent IA de la dette technique traditionnelle, mais elle est amplifiée par la vitesse d'évolution des technologies IA et par la complexité des interactions entre les composants d'un système IA.

Les formes les plus courantes de dette d'architecture IA incluent :

**Les silos de modèles.** Des modèles développés indépendamment par différentes équipes, sans coordination architecturale, créent des redondances, des incohérences et des coûts d'infrastructure superflus.

**L'absence de gouvernance des données d'entraînement.** Des modèles entraînés sur des données non documentées, non versionnées et non gouvernées créent des risques de conformité et de reproductibilité.

**Le couplage fort avec des technologies immatures.** Des choix technologiques prématurés — frameworks, plateformes, fournisseurs — qui enferment l'organisation dans des impasses architecturales lorsque la technologie évolue.

L'étude MIT *The GenAI Divide: State of AI in Business 2025* révèle que 88 % des pilotes IA ne franchissent jamais le passage en production, signifiant que seul environ 1 prototype sur 8 devient une capacité opérationnelle [10]. Ce taux d'échec est en partie attribuable à la dette d'architecture IA : les prototypes sont construits en dehors des cadres architecturaux de l'organisation, rendant leur industrialisation prohibitivement coûteuse.

##### Le ROI non démontré

Le risque de retour sur investissement non démontré constitue probablement le risque business le plus immédiat pour les organisations qui investissent massivement dans l'IA. Les données sont éloquentes : selon le rapport MIT, 95 % des projets d'IA générative en entreprise n'ont pas démontré de retours financiers mesurables dans les six mois suivant leur déploiement [10]. Selon S&P Global, 42 % des entreprises ont abandonné la majorité de leurs initiatives IA en 2025, contre seulement 17 % l'année précédente [10]. Seuls 14 % des directeurs financiers (*Chief Financial Officers*, CFO) rapportent un ROI mesurable de l'IA, alors même que 66 % anticipent un impact significatif dans les deux prochaines années [10].

L'architecte d'entreprise joue un rôle déterminant dans la gestion de ce risque à deux niveaux. Premièrement, en amont, par la conception d'architectures qui facilitent la mesure de la valeur — métriques de performance intégrées, traçabilité de la contribution IA aux résultats business, tableaux de bord de valeur reliant les capacités IA aux flux de valeur. Deuxièmement, en cours de programme, par l'identification des initiatives dont l'architecture rend le passage à l'échelle économiquement viable, permettant de concentrer les investissements sur les cas d'usage à fort potentiel de retour.

[Figure 8.1 — Cartographie des risques business IA et rôle de médiation de l'architecte d'entreprise]

```
┌─────────────────────────────────────────────────────────────────┐
│                   RISQUES BUSINESS IA                            │
│                                                                  │
│   ┌──────────────┐    ┌──────────────┐    ┌──────────────┐      │
│   │CANNIBALISATION│    │DÉSINTERMÉ-   │    │ DETTE        │      │
│   │               │    │DIATION       │    │ D'ARCHITECTURE│     │
│   │ Érosion des   │    │ Élimination  │    │ Choix sous-  │      │
│   │ revenus       │    │ du rôle dans │    │ optimaux     │      │
│   │ existants     │    │ la chaîne    │    │ cumulés      │      │
│   └──────┬───────┘    └──────┬───────┘    └──────┬───────┘      │
│          │                   │                    │               │
│          └───────────────────┼────────────────────┘               │
│                              │                                    │
│                    ┌─────────▼─────────┐                         │
│                    │   ARCHITECTE      │                         │
│                    │   D'ENTREPRISE    │                         │
│                    │                   │                         │
│                    │ • Cartographie    │                         │
│                    │   des flux de     │                         │
│                    │   valeur          │                         │
│                    │ • Analyse d'impact│                         │
│                    │ • Gouvernance     │                         │
│                    │   architecturale  │                         │
│                    └─────────┬─────────┘                         │
│                              │                                    │
│                    ┌─────────▼─────────┐                         │
│                    │   ROI NON         │                         │
│                    │   DÉMONTRÉ        │                         │
│                    │                   │                         │
│                    │ 95 % des pilotes  │                         │
│                    │ sans ROI mesuré   │                         │
│                    │ (MIT 2025)        │                         │
│                    └───────────────────┘                         │
└─────────────────────────────────────────────────────────────────┘
```

*La figure illustre les quatre familles de risques business IA et la position centrale de l'architecte d'entreprise comme médiateur. L'architecte traduit chaque risque en décisions architecturales concrètes : cartographie des flux de valeur pour la cannibalisation, analyse de la chaîne de valeur pour la désintermédiation, gouvernance des standards pour la dette d'architecture, et métriques de valeur intégrées pour le ROI.*

---

#### 8.3 Risques humains : érosion des compétences, acceptabilité, changements de rôles, résistance organisationnelle

##### L'érosion des compétences

Le chapitre 6 a documenté le risque d'érosion cognitive par l'IA générative. Ce risque se décline à l'échelle organisationnelle en un phénomène plus large : l'érosion des compétences opérationnelles. Lorsque l'IA automatise des tâches que des professionnels exécutaient manuellement, les compétences associées à ces tâches s'atrophient au fil du temps. Ce phénomène n'est pas limité aux rôles techniques : il touche l'ensemble de la chaîne de valeur.

Le Forum économique mondial estime que 39 % des compétences fondamentales (*core skills*) requises dans les emplois actuels seront transformées d'ici 2030 [11]. Le *Fonds monétaire international* (FMI) confirme que les nouvelles compétences et l'IA remodèlent l'avenir du travail, avec des implications profondes pour les systèmes éducatifs et les programmes de requalification (*reskilling*) [12]. Plus préoccupant, une estimation de l'Institution Brookings identifie 6,1 millions de travailleurs (4,2 % de la main-d'œuvre américaine) qui font face simultanément à une exposition élevée à l'IA et à une faible capacité d'adaptation, ces travailleurs étant concentrés dans les rôles administratifs et de bureau [13].

Pour l'architecte d'entreprise, l'érosion des compétences est un risque architectural autant qu'un risque de ressources humaines. Les architectures IA qui automatisent des fonctions sans prévoir de mécanismes de maintien des compétences créent une vulnérabilité systémique : lorsque le système IA défaille — et il défaillera — l'organisation ne dispose plus des compétences humaines nécessaires pour assurer la continuité opérationnelle. L'architecte doit donc concevoir des architectures qui intègrent délibérément la supervision humaine (*human-in-the-loop*), non seulement comme garde-fou éthique, mais comme mécanisme de préservation des compétences organisationnelles.

##### L'acceptabilité et la confiance

L'acceptabilité des systèmes IA par les utilisateurs finaux — employés, clients, partenaires — conditionne directement le succès des déploiements. Un système IA techniquement performant mais rejeté par ses utilisateurs ne crée aucune valeur. L'enquête McKinsey *AI in the Workplace 2025* révèle que les entreprises disposant de cadres de collaboration interfonctionnelle et de préparation éthique robustes obtiennent des gains de performance liés à l'IA supérieurs de 40 % par rapport à leurs pairs [14]. Ce résultat démontre que l'acceptabilité n'est pas un facteur périphérique : elle est un déterminant central du retour sur investissement.

Les facteurs d'acceptabilité que l'architecte d'entreprise doit intégrer dans ses conceptions incluent :

**La transparence.** Les utilisateurs doivent comprendre quand et comment l'IA intervient dans leurs processus de travail. Les architectures opaques — où l'IA opère en arrière-plan sans visibilité — génèrent de la méfiance et de la résistance.

**L'explicabilité.** Les décisions ou recommandations de l'IA doivent être accompagnées d'explications compréhensibles par l'utilisateur final. L'architecte doit prévoir des couches d'explicabilité — SHAP (*SHapley Additive exPlanations*), LIME (*Local Interpretable Model-agnostic Explanations*), chaînes de raisonnement — dans les architectures des systèmes à impact décisionnel.

**Le contrôle.** Les utilisateurs doivent disposer de mécanismes pour corriger, contourner ou désactiver les recommandations de l'IA lorsqu'ils le jugent nécessaire. La conception de ces mécanismes relève directement de l'architecture des systèmes.

##### Les changements de rôles et la redéfinition des emplois

L'IA ne se contente pas d'automatiser des tâches : elle reconfigure les rôles professionnels en redistribuant les activités entre humains et machines. Le rapport du Forum économique mondial *Future of Jobs Report 2025* anticipe la création de 170 millions de nouveaux rôles et le déplacement de 92 millions de rôles existants d'ici 2030, pour un solde net positif de 78 millions d'emplois [11]. Toutefois, ce solde net masque des turbulences sectorielles et fonctionnelles considérables.

L'architecte d'entreprise est concerné par ces changements de rôles à deux titres. D'une part, il doit concevoir des architectures qui s'adaptent à l'évolution des rôles — des interfaces utilisateur qui reflètent les nouvelles répartitions de tâches, des flux de travail (*workflows*) qui intègrent les interactions humain-IA, des mécanismes de gouvernance qui s'adaptent aux nouveaux périmètres de responsabilité. D'autre part, comme le chapitre 6 l'a établi, le rôle de l'architecte d'entreprise lui-même est en pleine transformation, passant du créateur d'artefacts documentaires au curateur et validateur des productions de l'IA.

##### La résistance organisationnelle

La résistance organisationnelle au déploiement de l'IA est un phénomène multifactoriel qui ne peut être réduit à une simple « peur du changement ». Elle résulte de préoccupations légitimes — menace sur l'emploi, perte d'autonomie professionnelle, défiance envers la fiabilité des systèmes, inquiétude quant à la surveillance — que l'organisation doit adresser de manière structurée.

McKinsey observe que pour la majorité des organisations, l'utilisation de l'IA demeure en phase pilote, et que beaucoup d'entreprises n'ont pas encore réussi à faire passer la technologie à l'échelle de manière à produire des résultats tangibles [1]. Cette difficulté de mise à l'échelle est en partie attribuable à la résistance organisationnelle : les pilotes réussissent dans des environnements contrôlés avec des utilisateurs volontaires, mais échouent lors du déploiement à grande échelle face à des utilisateurs moins convaincus.

L'architecte d'entreprise contribue à la gestion de la résistance organisationnelle par la conception d'architectures de déploiement progressif — pilotes contrôlés, déploiements par vagues, mécanismes de rétroaction utilisateur, boucles d'amélioration continue — qui permettent d'intégrer les retours d'expérience et de construire la confiance progressivement.

> **En pratique — Concevoir un programme de déploiement IA centré sur l'humain**
>
> Une institution financière de taille intermédiaire déployant un système de détection de fraude augmenté par l'IA a structuré son approche en trois phases, sous la coordination de l'architecte d'entreprise :
>
> **Phase 1 — Mode observation (3 mois) :** Le système IA fonctionne en parallèle du processus existant, sans impact sur les décisions. Les analystes de fraude comparent les alertes de l'IA avec leurs propres analyses et fournissent des retours d'expérience. L'architecture prévoit un tableau de bord comparatif et un mécanisme de rétroaction structuré.
>
> **Phase 2 — Mode recommandation (3 mois) :** Le système IA présente ses recommandations aux analystes, qui conservent l'autorité décisionnelle. L'architecture intègre des explications pour chaque recommandation et des mécanismes de suivi des décisions acceptées et refusées.
>
> **Phase 3 — Mode assisté (continu) :** Le système IA traite automatiquement les cas à faible risque identifiés comme fiables par les phases précédentes. Les analystes se concentrent sur les cas complexes et supervisent les décisions automatisées. L'architecture prévoit des seuils de confiance paramétrables, des mécanismes de remontée (*escalation*) et un tableau de bord de performance comparée humain-IA.
>
> Cette approche progressive, pilotée par l'architecte d'entreprise, a permis d'obtenir l'adhésion des analystes en démontrant la valeur de l'IA avant de leur demander de modifier leurs pratiques. Le taux d'adoption final a atteint 87 %, contre une moyenne sectorielle de 45 % pour les déploiements de type « grand basculement » (*big bang*).

---

#### 8.4 Risques réglementaires : *EU AI Act*, *GDPR*, exigences sectorielles et rôle de l'EA dans la conformité

##### Le *EU AI Act* : un cadre réglementaire fondé sur les risques

Le règlement européen sur l'intelligence artificielle (*EU AI Act*), entré en vigueur le 1er août 2024, constitue le premier cadre réglementaire global spécifiquement dédié à l'IA. Son application progressive s'échelonne sur plusieurs années : les pratiques d'IA interdites et les obligations de littératie IA sont entrées en application le 2 février 2025, les règles de gouvernance et les obligations relatives aux modèles d'IA à usage général (*General-Purpose AI*, GPAI) depuis le 2 août 2025, tandis que les exigences complètes pour les systèmes IA à haut risque s'appliqueront à compter du 2 août 2026 [15].

Le *EU AI Act* adopte une approche de classification fondée sur les risques qui distingue quatre catégories de systèmes IA :

**Les systèmes interdits.** Les systèmes qui manipulent le comportement humain, exploitent les vulnérabilités, pratiquent la notation sociale (*social scoring*) ou utilisent la reconnaissance faciale en temps réel dans l'espace public (sauf exceptions limitées).

**Les systèmes à haut risque.** Les systèmes utilisés dans huit domaines sensibles : identification biométrique, infrastructures critiques, éducation et formation professionnelle, emploi, services publics et privés essentiels, application de la loi, migration et asile, administration de la justice [15]. Ces systèmes sont soumis aux obligations les plus strictes : évaluation de conformité, documentation technique exhaustive, surveillance post-déploiement, supervision humaine.

**Les systèmes à risque limité.** Les systèmes qui interagissent avec des personnes (agents conversationnels, systèmes de génération de contenu) sont soumis à des obligations de transparence.

**Les systèmes à risque minimal.** Les systèmes qui ne présentent pas de risque significatif ne sont soumis à aucune obligation spécifique.

Pour l'architecte d'entreprise, le *EU AI Act* impose une responsabilité architecturale directe : les systèmes IA à haut risque doivent être conçus dès l'origine (*compliance by design*) pour satisfaire les exigences de documentation, de traçabilité, de test contre les biais, de supervision humaine et de surveillance post-déploiement. L'architecte est responsable de l'intégration de ces exigences dans les architectures de référence et les standards de l'organisation.

ISACA observe que seulement 11 % des organisations se considèrent « pleinement prêtes » pour le *EU AI Act* [16]. Ce déficit de préparation crée un espace d'intervention naturel pour l'architecte d'entreprise, qui peut structurer l'effort de mise en conformité en s'appuyant sur ses compétences en cartographie des systèmes, en analyse d'impact et en conception de processus de gouvernance.

##### Le *GDPR* et la protection des données dans les systèmes IA

Le Règlement général sur la protection des données (*General Data Protection Regulation*, GDPR), en vigueur depuis 2018, s'applique pleinement aux systèmes d'IA qui traitent des données personnelles. L'intersection entre le GDPR et l'IA génère des défis de conformité spécifiques que l'architecte d'entreprise doit intégrer dans ses conceptions.

L'année 2025 a vu une intensification notable de l'application du GDPR aux systèmes IA. L'autorité italienne de protection des données (Garante) a infligé une amende de 15 millions d'euros à OpenAI pour ChatGPT, assortie d'une obligation de conduire une campagne de sensibilisation de six mois et de renforcer les protections de la vie privée [17]. Clearview AI a constitué une base de données de reconnaissance faciale à partir de plus de 30 milliards d'images collectées sur des sites publics sans notification ni consentement, démontrant les risques de non-conformité inhérents aux systèmes IA fondés sur la collecte massive de données [17]. Au total, 2 560 amendes ont été enregistrées en 2025, un record depuis l'entrée en vigueur du GDPR, avec des notifications quotidiennes de brèches dépassant pour la première fois les 400 par jour [17].

Les exigences du GDPR qui impactent directement l'architecture des systèmes IA incluent :

**La minimisation des données (article 5).** Les systèmes IA doivent être conçus pour collecter et traiter uniquement les données strictement nécessaires à leur fonction. L'architecte doit évaluer la proportionnalité des données utilisées par chaque modèle.

**Le droit à l'explication (article 22).** Les décisions entièrement automatisées produisant des effets juridiques ou significatifs sur les individus doivent pouvoir être expliquées et contestées. L'architecte doit intégrer des mécanismes d'explicabilité dans les systèmes décisionnels.

**La protection des données dès la conception et par défaut (article 25).** Les architectures IA doivent intégrer les principes de protection des données dès leur conception, et non comme un ajout ultérieur.

**Le droit à l'effacement (article 17).** Les systèmes IA doivent être capables de supprimer les données personnelles des individus qui en font la demande, ce qui pose des défis techniques considérables pour les modèles entraînés sur ces données (*machine unlearning*).

##### Les exigences sectorielles

Au-delà des cadres réglementaires horizontaux, des exigences sectorielles spécifiques s'appliquent aux systèmes IA dans des domaines réglementés :

**Le secteur financier.** Les régulateurs financiers (CFPB, SEC, EEOC aux États-Unis; AMF, ACPR en France; BSIF au Canada) imposent des exigences de transparence, d'explicabilité et de non-discrimination pour les systèmes IA utilisés dans l'octroi de crédit, la détection de fraude et la gestion des risques. Le NIST AI RMF note que les régulateurs sectoriels font de plus en plus référence à ses principes dans leurs attentes en matière de déploiement sécuritaire [3].

**Le secteur de la santé.** Les systèmes IA utilisés dans le diagnostic, le traitement ou la gestion des soins sont soumis aux réglementations relatives aux dispositifs médicaux (FDA aux États-Unis, règlement MDR en Europe) en plus des réglementations IA générales.

**Le secteur de l'assurance.** Les modèles actuariels fondés sur l'IA sont soumis à des exigences d'équité (*fairness*) et de non-discrimination qui imposent des tests de biais spécifiques.

##### Le rôle de l'EA dans la conformité

L'architecte d'entreprise joue un rôle pivot dans la conformité réglementaire IA en raison de sa position transversale dans l'organisation. Il est le seul professionnel qui dispose simultanément de la vision des systèmes (quels systèmes IA sont déployés, où et comment), de la compréhension des processus (quels processus business ces systèmes alimentent) et de la connaissance des cadres de gouvernance (quels standards et politiques s'appliquent).

[Tableau 8.2 — Matrice des obligations réglementaires et réponses architecturales]

| Exigence réglementaire | Source | Impact architectural | Réponse de l'AE |
|---|---|---|---|
| Classification des systèmes par niveau de risque | *EU AI Act* | Inventaire et catégorisation de tous les systèmes IA | Registre des modèles IA lié au référentiel applicatif |
| Documentation technique exhaustive | *EU AI Act* (haut risque) | Traçabilité du cycle de vie des modèles | Intégration dans les outils de gestion du portefeuille technologique |
| Surveillance post-déploiement | *EU AI Act* (haut risque) | Infrastructure de surveillance continue | Conception des pipelines *LLMOps* avec surveillance intégrée |
| Explicabilité des décisions automatisées | GDPR (art. 22) | Couches d'explicabilité dans les systèmes décisionnels | Standards architecturaux incluant des interfaces d'explicabilité |
| Minimisation des données | GDPR (art. 5) | Évaluation de la proportionnalité des données | Revues d'architecture intégrant l'analyse de proportionnalité |
| Protection dès la conception | GDPR (art. 25) | Intégration de la vie privée dans la conception | Principes de *privacy by design* dans les architectures de référence |

*Source : Synthèse des auteurs à partir de [3], [15], [16], [17]*

Le *Superviseur européen de la protection des données* (EDPS) a publié en novembre 2025 un guide sur la gestion des risques des systèmes d'IA, fournissant des recommandations pratiques pour identifier et atténuer les risques techniques associés aux systèmes IA [17]. Ce guide constitue une ressource directement utilisable par l'architecte d'entreprise pour structurer ses revues d'architecture.

---

#### 8.5 Le *framework* de médiation : comment l'EA traduit les risques techniques en décisions business et vice versa

##### Le problème de la traduction

Le défi fondamental de la gestion des risques IA dans les organisations est un problème de traduction. Les risques techniques — dérive de modèle, biais algorithmique, vulnérabilités adversariales — sont exprimés dans un vocabulaire spécialisé que les décideurs business ne maîtrisent pas. Inversement, les risques business — cannibalisation, perte de parts de marché, atteinte à la réputation — sont exprimés dans des termes que les équipes techniques ne parviennent pas à relier à des décisions architecturales concrètes. Cette asymétrie de langage crée des angles morts dans la gestion des risques : les comités de direction prennent des décisions d'investissement IA sans comprendre les risques techniques sous-jacents, tandis que les équipes techniques déploient des systèmes sans appréhender les conséquences business de leurs choix architecturaux.

L'architecte d'entreprise, par sa position à l'intersection des mondes technique et business, est le traducteur naturel entre ces deux univers. Le cadre de médiation proposé ici structure cette fonction de traduction autour de trois mécanismes complémentaires.

##### Mécanisme 1 : La traduction ascendante — des risques techniques aux décisions business

La traduction ascendante consiste à reformuler les risques techniques identifiés par les équipes de développement, de science des données et de sécurité en termes compréhensibles et actionnables par les décideurs business. Cette traduction opère sur trois dimensions :

**La dimension financière.** Chaque risque technique est traduit en impact financier potentiel — coût de remédiation, perte de revenus, amendes réglementaires, coûts de remplacement. Le rapport IBM *Cost of a Data Breach 2025* fournit des données de référence : le coût moyen d'une brèche de données est de 4,44 millions de dollars américains, mais les brèches impliquant l'IA non sanctionnée (*Shadow AI*) coûtent 670 000 dollars de plus que la moyenne [4]. L'architecte traduit le risque de « dérive de modèle » en « perte de revenus estimée à X $ par mois de dérive non détectée ».

**La dimension temporelle.** Chaque risque technique est associé à un horizon temporel — risque immédiat (en production maintenant), risque à court terme (matérialisation probable dans les 6 mois), risque à moyen terme (matérialisation probable dans les 12-24 mois). Cette temporalisation permet aux décideurs de prioriser les investissements en atténuation.

**La dimension de probabilité et de gravité.** L'architecte utilise les cadres de gestion des risques d'entreprise (matrices probabilité/impact) pour positionner chaque risque technique dans un cadre familier aux décideurs.

##### Mécanisme 2 : La traduction descendante — des préoccupations business aux exigences techniques

La traduction descendante consiste à convertir les préoccupations stratégiques exprimées par les dirigeants en exigences techniques que les équipes de développement et d'opérations peuvent mettre en œuvre. Lorsqu'un membre du comité de direction exprime une préoccupation — « Comment s'assurer que notre chatbot ne dira rien qui nuise à notre réputation? » — l'architecte traduit cette préoccupation en spécifications architecturales concrètes : filtres de contenu, garde-fous (*guardrails*), mécanismes de surveillance en temps réel, processus d'escalade, tests de robustesse.

Cette traduction descendante est particulièrement critique dans le contexte réglementaire. Lorsque le département juridique signale que l'organisation sera soumise aux exigences du *EU AI Act* pour ses systèmes à haut risque, l'architecte traduit ces exigences en composants architecturaux : registre des modèles, mécanismes de traçabilité, interfaces d'explicabilité, processus de surveillance post-déploiement.

##### Mécanisme 3 : La médiation latérale — entre les fonctions de l'organisation

La médiation latérale consiste à faciliter la communication et la coordination entre les différentes fonctions de l'organisation impliquées dans la gestion des risques IA. Le chapitre 6 (section 6.7) a identifié les alliances stratégiques que l'architecte doit construire avec la finance, les ressources humaines, le juridique, l'innovation et la science des données. Le cadre de médiation structure ces alliances autour de processus de risque partagés.

Selon ISACA, la responsabilité de l'IA doit être partagée entre les fonctions business, technologie, risque et communications, chacune ayant des rôles spécifiques dans l'utilisation et la gouvernance de l'IA [16]. L'architecte d'entreprise orchestre cette gouvernance distribuée en s'assurant que chaque fonction contribue à l'évaluation des risques selon sa perspective, et que les résultats de ces évaluations sont consolidés dans une vue unifiée.

[Figure 8.2 — Le *framework* de médiation des risques IA par l'architecte d'entreprise]

```
┌─────────────────────────────────────────────────────────────────┐
│               FRAMEWORK DE MÉDIATION DES RISQUES IA             │
│                                                                  │
│   TRADUCTION ASCENDANTE        TRADUCTION DESCENDANTE           │
│   (technique → business)       (business → technique)            │
│                                                                  │
│   Risques techniques:          Préoccupations business:          │
│   • Model drift               • Réputation                      │
│   • Biais algorithmique       • Conformité réglementaire        │
│   • Vulnérabilités            • ROI des investissements IA      │
│   • Dépendance fournisseur    • Continuité d'activité           │
│         │                              │                         │
│         │    ┌────────────────────┐    │                         │
│         └───►│   ARCHITECTE       │◄───┘                         │
│              │   D'ENTREPRISE     │                              │
│              │                    │                              │
│              │  • Impact financier│                              │
│              │  • Horizon temporel│                              │
│              │  • Probabilité/    │                              │
│              │    gravité         │                              │
│              │  • Spécifications  │                              │
│              │    architecturales │                              │
│              └─────────┬──────────┘                              │
│                        │                                         │
│              MÉDIATION LATÉRALE                                  │
│              (entre fonctions)                                   │
│                        │                                         │
│         ┌──────────────┼──────────────┐                         │
│         │              │              │                          │
│    ┌────▼────┐   ┌─────▼─────┐  ┌────▼────┐                    │
│    │  Sécurité│   │ Juridique │  │   RH    │                    │
│    │  & IT    │   │& Conformité│  │& Change │                   │
│    └─────────┘   └───────────┘  └─────────┘                    │
└─────────────────────────────────────────────────────────────────┘
```

*Le framework illustre les trois mécanismes de médiation. La traduction ascendante convertit les risques techniques en impacts business quantifiés. La traduction descendante convertit les préoccupations business en exigences techniques. La médiation latérale coordonne les contributions des différentes fonctions à l'évaluation consolidée des risques.*

##### Les artefacts de médiation

Le cadre de médiation produit des artefacts spécifiques qui servent de supports à la communication entre les parties prenantes :

**Le tableau de bord des risques IA pour le comité de direction.** Un document synthétique qui présente les risques IA majeurs en termes d'impact financier, de probabilité et de statut de gestion, sans jargon technique.

**La cartographie technique des risques.** Un document détaillé qui relie chaque risque identifié aux composants architecturaux affectés, aux mécanismes de détection en place et aux plans de remédiation.

**Le registre des décisions de risque.** Un document qui consigne les décisions prises par les parties prenantes concernant l'acceptation, l'atténuation ou le transfert de chaque risque identifié, avec la traduction technique des actions décidées.

**Les fiches de risque bilingues.** Pour chaque risque significatif, une fiche présentant la description technique et la description business du risque, ses impacts potentiels dans les deux dimensions, et les actions d'atténuation dans les deux langages.

---

#### 8.6 Construire une matrice de risques IA vivante, liée aux *value streams* et aux capacités d'entreprise

##### De la matrice statique à la matrice vivante

Les matrices de risques traditionnelles — probabilité en ordonnée, impact en abscisse — sont des photographies statiques qui deviennent obsolètes dès leur publication. Dans le contexte de l'IA, où les risques évoluent à la vitesse des mises à jour de modèles, des changements réglementaires et des évolutions du marché, une matrice statique est un outil inadéquat. L'architecte d'entreprise doit concevoir et maintenir une matrice de risques IA vivante, dynamiquement liée aux flux de valeur et aux capacités d'entreprise.

Gartner observe que le cadre AI TRiSM (*AI Trust, Risk and Security Management*) structure la gestion des risques IA autour de quatre couches : la gouvernance IA, l'inspection et l'application en temps réel (*runtime inspection and enforcement*), la gouvernance de l'information et l'infrastructure de la pile technologique [18]. Ce cadre multicouche fournit une base pour la conception d'une matrice de risques vivante qui intègre des données provenant de chacune de ces couches.

La prédiction de Gartner selon laquelle les organisations qui opérationnalisent la transparence, la confiance et la sécurité de l'IA verront leurs modèles IA atteindre une amélioration de 50 % en termes d'adoption, d'objectifs business et d'acceptation par les utilisateurs d'ici 2026 [18] confirme la valeur d'une approche structurée et continue de la gestion des risques.

##### L'ancrage dans les flux de valeur (*value streams*)

Le premier principe de la matrice de risques vivante est son ancrage dans les flux de valeur de l'organisation. Chaque risque IA est évalué non pas en isolation, mais en fonction de son impact sur les flux de valeur qu'il traverse. Un risque de dérive de modèle sur un système de recommandation produit n'a pas le même impact selon qu'il affecte le flux de valeur « acquisition de nouveaux clients » (impact direct sur les revenus) ou le flux de valeur « gestion administrative interne » (impact sur la productivité).

Cet ancrage permet trois avantages :

**La priorisation contextuelle.** Deux risques de même probabilité et de même sévérité technique peuvent avoir des impacts business radicalement différents selon les flux de valeur qu'ils affectent. La matrice vivante permet une priorisation fondée sur l'impact business réel, pas sur la sévérité technique abstraite.

**La traçabilité de bout en bout.** Chaque risque est relié aux processus business, aux capacités d'entreprise et aux systèmes techniques qu'il impacte. Cette traçabilité permet d'évaluer rapidement les conséquences en cascade d'un risque matérialisé.

**La communication stratégique.** Les dirigeants comprennent les flux de valeur — c'est le langage de leur quotidien. Présenter les risques IA en termes d'impact sur les flux de valeur facilite la prise de décision et l'allocation des ressources.

##### Le lien avec les capacités d'entreprise (*business capabilities*)

Le second principe de la matrice de risques vivante est son lien avec la cartographie des capacités d'entreprise. Chaque système IA contribue à une ou plusieurs capacités d'entreprise, et chaque risque IA affecte potentiellement la performance de ces capacités.

McKinsey, dans son guide sur le déploiement sécuritaire de l'IA agentique, recommande de lancer une évaluation exhaustive pour identifier les vulnérabilités potentielles dans chacune des activités de l'entreprise, puis d'établir une structure de gouvernance robuste, de mettre en œuvre des mécanismes de surveillance et de contrôle en temps réel, et d'assurer la formation continue et le respect des exigences réglementaires [19]. L'ancrage dans les capacités d'entreprise traduit cette recommandation en une pratique architecturale concrète.

[Tableau 8.3 — Structure de la matrice de risques IA vivante]

| Dimension | Éléments de la matrice | Source de données | Fréquence de mise à jour |
|---|---|---|---|
| Risque identifié | Description, catégorie (technique/business/humain/réglementaire), propriétaire | Revues d'architecture, audits, incidents | Continue |
| Probabilité | Score quantitatif ou qualitatif (1-5) | Données historiques, surveillance des modèles | Mensuelle |
| Impact business | Impact financier estimé, flux de valeur affectés, capacités impactées | Modélisation financière, cartographie des flux de valeur | Trimestrielle |
| Statut de gestion | Accepté / Atténué / Transféré / En cours de traitement | Registre des décisions de risque | Continue |
| Contrôles en place | Mécanismes de détection et de prévention déployés | Inventaire des contrôles, résultats d'audit | Mensuelle |
| Indicateurs avancés | Métriques de surveillance qui signalent une matérialisation imminente | Systèmes de surveillance *LLMOps*, alertes | Temps réel |
| Lien aux capacités | Capacités d'entreprise impactées, score de criticité | Cartographie des capacités | Trimestrielle |
| Lien aux flux de valeur | Flux de valeur traversés, contribution au chiffre d'affaires | Cartographie des flux de valeur | Trimestrielle |

*Source : Synthèse des auteurs à partir de [3], [18], [19]*

##### L'alimentation dynamique de la matrice

La matrice de risques vivante se distingue d'une matrice traditionnelle par son alimentation dynamique à partir de sources de données automatisées et manuelles :

**Sources automatisées.** Les pipelines *LLMOps* et *MLOps* génèrent en continu des données de performance des modèles — métriques de précision, indicateurs de dérive, alertes de seuil. Ces données alimentent directement la dimension « indicateurs avancés » de la matrice.

**Sources semi-automatisées.** Les systèmes de gestion des incidents, les outils de conformité et les plateformes de gouvernance des données fournissent des données sur les incidents, les non-conformités et les anomalies de données qui mettent à jour les dimensions « probabilité » et « statut de gestion ».

**Sources manuelles.** Les revues d'architecture périodiques, les audits de conformité et les évaluations d'impact fournissent des analyses qualitatives qui enrichissent les dimensions « impact business » et « lien aux capacités ».

L'architecte d'entreprise est responsable de la conception de l'architecture d'information qui intègre ces sources, de la définition des processus de mise à jour et de la gouvernance de la matrice elle-même. Cette responsabilité illustre parfaitement le rôle de médiateur : la matrice est l'artefact central qui relie les perspectives technique, business, humaine et réglementaire dans un cadre unifié.

##### Les rituels de gouvernance de la matrice

La matrice de risques vivante n'a de valeur que si elle est activement utilisée dans les processus de décision de l'organisation. L'architecte d'entreprise doit instituer des rituels de gouvernance qui ancrent la matrice dans le fonctionnement quotidien :

**La revue mensuelle des risques IA.** Une réunion d'une heure réunissant l'architecte d'entreprise, les responsables techniques des systèmes IA, le responsable de la sécurité de l'information et le responsable de la conformité. L'objectif est de mettre à jour les scores de probabilité et d'impact, de revoir les indicateurs avancés et d'identifier les risques émergents.

**La revue trimestrielle stratégique.** Une présentation au comité de direction qui synthétise l'état des risques IA en termes d'impact sur les flux de valeur et les capacités d'entreprise. Cette revue alimente les décisions d'investissement et de priorisation des initiatives IA.

**La revue annuelle d'architecture des risques.** Une analyse approfondie qui évalue l'adéquation de la matrice elle-même — les catégories de risques sont-elles toujours pertinentes? Les seuils sont-ils calibrés correctement? Les liens avec les flux de valeur sont-ils à jour? Cette revue peut intégrer les résultats d'audits externes et les évolutions réglementaires.

Gartner prédit que d'ici 2028, 25 % des grandes organisations disposeront d'équipes dédiées à la gouvernance IA, contre moins de 1 % en 2023 [18]. L'architecte d'entreprise qui met en place ces rituels de gouvernance dès aujourd'hui positionne son organisation en avance sur cette trajectoire.

[Figure 8.3 — Architecture de la matrice de risques IA vivante]

```
┌─────────────────────────────────────────────────────────────────┐
│           MATRICE DE RISQUES IA VIVANTE                         │
│                                                                  │
│   SOURCES AUTOMATISÉES          SOURCES MANUELLES               │
│   ┌─────────────────┐          ┌─────────────────┐             │
│   │ Pipelines MLOps │          │ Revues d'archi-  │             │
│   │ • Métriques     │          │ tecture          │             │
│   │ • Alertes drift │          │ • Évaluations    │             │
│   │ • Incidents     │          │ • Audits         │             │
│   └────────┬────────┘          └────────┬────────┘             │
│            │                            │                       │
│            └────────────┬───────────────┘                       │
│                         │                                        │
│              ┌──────────▼──────────┐                            │
│              │  MATRICE INTÉGRÉE   │                            │
│              │                     │                            │
│              │  Risque × Probabilité                            │
│              │  × Impact business                               │
│              │  × Flux de valeur                                │
│              │  × Capacités                                     │
│              └──────────┬──────────┘                            │
│                         │                                        │
│         ┌───────────────┼───────────────┐                       │
│         │               │               │                       │
│   ┌─────▼─────┐  ┌─────▼─────┐  ┌─────▼─────┐                │
│   │ Tableau de │  │ Revue     │  │ Décisions  │                │
│   │ bord COMEX │  │ mensuelle │  │ d'investis-│                │
│   │            │  │ opération-│  │ sement     │                │
│   │            │  │ nelle     │  │            │                │
│   └───────────┘  └───────────┘  └───────────┘                │
└─────────────────────────────────────────────────────────────────┘
```

*La figure illustre l'architecture de la matrice de risques IA vivante. Les sources automatisées (pipelines MLOps/LLMOps) et manuelles (revues d'architecture, audits) alimentent une matrice intégrée qui combine les dimensions de risque, de probabilité, d'impact business, de flux de valeur et de capacités. Cette matrice alimente trois processus de gouvernance : le tableau de bord pour le comité exécutif, la revue mensuelle opérationnelle et les décisions d'investissement.*

##### L'intégration avec les outils d'architecture d'entreprise

La matrice de risques IA vivante doit être intégrée aux outils d'architecture d'entreprise existants pour éviter de créer un silo d'information supplémentaire. Les plateformes modernes d'architecture d'entreprise — telles que BiZZdesign, Ardoq, LeanIX ou Mega — offrent des capacités de modélisation qui permettent de relier les risques IA aux référentiels d'applications, aux cartographies de processus et aux modèles de capacités. L'architecte doit exploiter ces capacités pour créer une vue unifiée qui relie les risques IA à l'ensemble du patrimoine informationnel de l'organisation.

Selon Ardoq, les tendances majeures de l'architecture d'entreprise en 2025 incluent le déplacement vers des systèmes d'intelligence architecturale en temps réel (*live architecture intelligence systems*) qui aident les conseils d'administration à gérer les risques de manière proactive [20]. La matrice de risques IA vivante s'inscrit dans cette évolution : elle transforme la gestion des risques IA d'un exercice périodique en une pratique continue, intégrée dans le flux de décision de l'organisation.

---

#### Points clés à retenir

> **1. L'IA introduit quatre familles de risques interdépendantes.** Les risques techniques (robustesse, dérive, dépendance fournisseurs), business (cannibalisation, ROI non démontré, dette d'architecture), humains (érosion des compétences, résistance organisationnelle) et réglementaires (*EU AI Act*, GDPR, exigences sectorielles) forment un système de risques interconnectés qu'aucune fonction isolée ne peut gérer seule.
>
> **2. Les données quantifient l'urgence de la gestion des risques IA.** 91 % des modèles subissent une dégradation au fil du temps, 95 % des pilotes IA ne démontrent pas de ROI mesurable, 97 % des organisations victimes de brèches IA manquent de contrôles d'accès adéquats, et seulement 11 % des organisations se considèrent prêtes pour le *EU AI Act*.
>
> **3. L'architecte d'entreprise est le médiateur naturel du risque IA.** Sa position à l'intersection des dimensions technique, business et organisationnelle lui permet de traduire les risques techniques en décisions business (traduction ascendante), les préoccupations business en exigences techniques (traduction descendante) et de coordonner les contributions de toutes les fonctions (médiation latérale).
>
> **4. Le *framework* de médiation repose sur trois mécanismes.** La traduction ascendante (impact financier, horizon temporel, probabilité/gravité), la traduction descendante (spécifications architecturales, composants de conformité) et la médiation latérale (coordination interfonctionnelle) structurent le rôle de l'architecte comme pont entre les perspectives.
>
> **5. La matrice de risques IA vivante ancre la gestion des risques dans les flux de valeur.** Liée dynamiquement aux *value streams* et aux capacités d'entreprise, alimentée par des sources automatisées et manuelles, et gouvernée par des rituels réguliers, elle transforme la gestion des risques IA d'un exercice ponctuel en une pratique continue et stratégiquement alignée.

---

#### Transition

Ce chapitre a établi que l'architecte d'entreprise est le médiateur naturel du risque IA, capable de traduire les risques techniques en décisions business et inversement, et de coordonner l'ensemble des fonctions organisationnelles dans une gestion intégrée des risques. Le cadre de médiation proposé et la matrice de risques vivante fournissent les outils concrets pour exercer cette fonction.

Mais la gestion des risques ne peut se réduire à une matrice, aussi vivante soit-elle. Elle doit s'inscrire dans un cadre de gouvernance global qui englobe les politiques, les processus, les contrôles et la culture organisationnelle. Le chapitre 9 examine ce cadre de gouvernance en profondeur, en s'attaquant à un phénomène qui illustre parfaitement les limites d'une gouvernance insuffisante : le *Shadow AI* — l'utilisation non sanctionnée d'outils IA par les employés, dont IBM estime le surcoût à 670 000 dollars par incident de brèche [4]. Si le présent chapitre a répondu à la question « Quels risques l'IA introduit-elle et comment l'architecte les médie-t-il? », le chapitre 9 répond à la question « Comment l'architecte structure-t-il la gouvernance pour prévenir ces risques et transformer l'innovation non contrôlée en innovation maîtrisée? ».

---

#### Références

[1] McKinsey & Company, « The State of AI in 2025: Agents, Innovation, and Transformation », 2025. Disponible : https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-state-of-ai

[2] Gartner, « Strategic Predictions for 2026: How AI's Underestimated Influence Is Reshaping Business », 2025. Disponible : https://www.gartner.com/en/articles/strategic-predictions-for-2026

[3] NIST, « AI Risk Management Framework (AI RMF 1.0) », NIST AI 100-1, janvier 2023, mis à jour en 2024-2025. Disponible : https://www.nist.gov/itl/ai-risk-management-framework

[4] IBM, « Cost of a Data Breach Report 2025 », juillet 2025. Disponible : https://www.ibm.com/reports/data-breach

[5] Naitive Cloud / MIT Research, « AI Model Drift Detection: Best Practices for Enterprises », 2025. Disponible : https://blog.naitive.cloud/ai-model-drift-detection-best-practices-enterprises/

[6] IBM, « What Is Model Drift? », 2025. Disponible : https://www.ibm.com/think/topics/model-drift

[7] IAPP, « The Hidden Fragility of AI Supply Chains: Why Traditional Risk Management Falls Short », 2025. Disponible : https://iapp.org/news/a/the-hidden-fragility-of-ai-supply-chains-why-traditional-risk-management-falls-short

[8] CTO Magazine, « The Great AI Vendor Lock-In: How CTOs Can Avoid Getting Trapped by Big Tech », 2025. Disponible : https://ctomagazine.com/ai-vendor-lock-in-cto-strategy/

[9] Bain & Company, « New Diligence Challenge: Uncovering AI Risks and Opportunities », 2025. Disponible : https://www.bain.com/insights/new-diligence-challenge-uncovering-ai-risks-and-opportunities/

[10] MIT, « The GenAI Divide: State of AI in Business 2025 », août 2025. Disponible : https://fortune.com/2025/08/18/mit-report-95-percent-generative-ai-pilots-at-companies-failing-cfo/

[11] World Economic Forum, « Future of Jobs Report 2025 », janvier 2025. Disponible : https://www.weforum.org/publications/the-future-of-jobs-report-2025/

[12] Fonds monétaire international (FMI), « New Skills and AI Are Reshaping the Future of Work », janvier 2026. Disponible : https://www.imf.org/en/blogs/articles/2026/01/14/new-skills-and-ai-are-reshaping-the-future-of-work

[13] Brookings Institution, « Measuring US Workers' Capacity to Adapt to AI-Driven Job Displacement », 2025. Disponible : https://www.brookings.edu/articles/measuring-us-workers-capacity-to-adapt-to-ai-driven-job-displacement/

[14] McKinsey & Company, « AI in the Workplace: A Report for 2025 — Superagency in the Workplace », 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/superagency-in-the-workplace-empowering-people-to-unlock-ais-full-potential-at-work

[15] Commission européenne, « AI Act — Shaping Europe's Digital Future », 2024. Disponible : https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai

[16] ISACA, « AI Use Is Outpacing Policy and Governance », 2025. Disponible : https://www.isaca.org/about-us/newsroom/press-releases/2025/ai-use-is-outpacing-policy-and-governance-isaca-finds

[17] DLA Piper, « GDPR Fines and Data Breach Survey: January 2025 », 2025. Disponible : https://www.dlapiper.com/en/insights/publications/2025/01/dla-piper-gdpr-fines-and-data-breach-survey-january-2025

[18] Gartner, « Market Guide for AI Trust, Risk and Security Management (AI TRiSM) », février 2025. Disponible : https://www.gartner.com/en/documents/6185655

[19] McKinsey & Company, « Deploying Agentic AI with Safety and Security: A Playbook for Technology Leaders », 2025. Disponible : https://www.mckinsey.com/capabilities/risk-and-resilience/our-insights/deploying-agentic-ai-with-safety-and-security-a-playbook-for-technology-leaders

[20] Ardoq, « The Biggest Enterprise Architecture Trends in 2025 », 2025. Disponible : https://www.ardoq.com/blog/the-biggest-trends-in-ea

[21] ISACA, « Avoiding AI Pitfalls in 2026: Lessons Learned from Top 2025 Incidents », 2025. Disponible : https://www.isaca.org/resources/news-and-trends/isaca-now-blog/2025/avoiding-ai-pitfalls-in-2026-lessons-learned-from-top-2025-incidents

[22] Forrester, « How Agentic AI Elevates The Enterprise Architect's Role », 2025. Disponible : https://www.forrester.com/blogs/the-future-of-the-enterprise-architects-job/

[23] World Economic Forum, « Global Risks Report 2026 », janvier 2026. Disponible : https://www.weforum.org/publications/global-risks-report-2026/in-full/global-risks-report-2026-chapter-2/

[24] NIST, « Artificial Intelligence Risk Management Framework: Generative Artificial Intelligence Profile », NIST AI 600-1, juillet 2024. Disponible : https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf

[25] Gartner, « Top Predictions for IT Organizations and Users in 2026 and Beyond », octobre 2025. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-10-21-gartner-unveils-top-predictions-for-it-organizations-and-users-in-2026-and-beyond
