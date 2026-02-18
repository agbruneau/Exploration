## Annexe B — Référentiel de compétences EA-IA détaillé

Cette annexe complète l'analyse du chapitre 6 en fournissant une matrice détaillée des compétences requises pour l'architecte d'entreprise (AE) dans son rôle de conseiller stratégique en intelligence artificielle. Le référentiel est structuré selon les trois dimensions du modèle tri-dimensionnel présenté à la section 6.1 : technique, business et influence.

Pour chaque compétence, le référentiel précise :
- **Description** : définition et périmètre de la compétence dans le contexte EA-IA
- **Niveau de maîtrise attendu** : fondamental, intermédiaire ou avancé
- **Méthode d'acquisition suggérée** : certifications, formations, pratique ou combinaison
- **Indicateurs de maîtrise** : critères observables permettant d'évaluer l'atteinte du niveau requis

Les niveaux de maîtrise se définissent comme suit :
- **Fondamental** : l'AE comprend les concepts, peut en discuter avec des spécialistes et intégrer les contraintes associées dans ses décisions architecturales.
- **Intermédiaire** : l'AE peut appliquer la compétence de manière autonome dans des contextes courants et guider des équipes techniques sur les implications architecturales.
- **Avancé** : l'AE maîtrise la compétence en profondeur, peut l'enseigner, innover dans son application et l'exercer dans des contextes inédits ou à haut risque.

---

### B.1 Dimension technique

Les compétences techniques permettent à l'architecte de comprendre, évaluer et orienter les choix technologiques liés à l'IA. Comme le souligne la section 6.2, l'objectif n'est pas que l'AE devienne un développeur de modèles, mais qu'il dispose de la compréhension nécessaire pour prendre des décisions architecturales éclairées.

#### B.1.1 Littératie IA (*AI Literacy*)

[Tableau B.1 — Compétence : Littératie IA]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de comprendre, d'évaluer et de communiquer sur les technologies d'intelligence artificielle. Inclut la distinction entre les types de modèles (supervisé, non supervisé, renforcement, modèles de fondation, modèles à réglage fin), la compréhension des phénomènes d'hallucination et des limites des LLM, ainsi que l'interprétation des métriques de performance (précision, rappel, F1-score, perplexité). Voir section 6.2 pour le détail. |
| **Niveau de maîtrise attendu** | **Intermédiaire à avancé** |
| **Méthode d'acquisition** | — Programmes de littératie IA accélérée (20 à 40 heures), tels que les parcours DataCamp pour professionnels non techniques [Ch.6, réf. 8] — Formations en ligne sur les fondamentaux du *machine learning* et des LLM (Coursera, edX, DeepLearning.AI) — Lecture régulière de la littérature technique (arXiv, IEEE, ACM) — Participation à des séminaires et conférences spécialisées |
| **Indicateurs de maîtrise** | — Peut expliquer les implications architecturales du choix entre un modèle de fondation et un modèle à réglage fin à un comité technique — Peut évaluer la pertinence d'un modèle pour un cas d'usage donné en analysant ses métriques de performance — Peut identifier les risques d'hallucination dans une architecture RAG et proposer des mécanismes d'atténuation — Peut communiquer les limites d'un LLM à des parties prenantes non techniques en termes compréhensibles |

#### B.1.2 Ingénierie des requêtes (*Prompt Engineering*)

[Tableau B.2 — Compétence : Ingénierie des requêtes]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de formuler des instructions précises et contextualisées pour les LLM, tant au niveau opérationnel (augmentation de la productivité personnelle) qu'au niveau stratégique (conception de systèmes intégrant des couches d'orchestration de requêtes). Inclut le chaînage de pensée (*chain-of-thought prompting*), la décomposition de tâches (*task decomposition*), le cadrage contextuel (*contextual framing*) et la génération augmentée par la récupération (RAG). Voir section 6.2 pour le détail. |
| **Niveau de maîtrise attendu** | **Intermédiaire** |
| **Méthode d'acquisition** | — Formations spécialisées en ingénierie des requêtes avancée (10 à 20 heures) — Pratique quotidienne avec différents LLM dans des contextes professionnels variés — Étude des guides techniques des fournisseurs de modèles (OpenAI, Anthropic, Google) — Formations en conception de systèmes d'orchestration de requêtes |
| **Indicateurs de maîtrise** | — Peut concevoir des modèles de requêtes (*prompt templates*) réutilisables pour des tâches architecturales courantes — Peut spécifier les exigences de versionnement, de test et de déploiement des requêtes à l'échelle organisationnelle — Peut évaluer et comparer la qualité des réponses de différents LLM pour un cas d'usage architectural donné — Peut former des collègues aux techniques de chaînage de pensée et de RAG |

#### B.1.3 Opérations de grands modèles de langage (*LLMOps*)

[Tableau B.3 — Compétence : LLMOps]

| Attribut | Détail |
|---|---|
| **Description** | Compréhension du cycle de vie complet des LLM en production : sélection, réglage fin, déploiement, surveillance, optimisation des coûts et gestion de la dérive. Inclut la connaissance de l'architecture de la pile *LLMOps* (quatre couches : traitement/gouvernance des données, entraînement/réglage fin, infrastructure de déploiement, sécurité/contrôle d'accès), les compromis coût-performance et les mécanismes de surveillance. Voir section 6.2 pour le détail. |
| **Niveau de maîtrise attendu** | **Fondamental à intermédiaire** |
| **Méthode d'acquisition** | — Certifications *MLOps*/*LLMOps* spécialisées (40 à 80 heures) [Ch.6, tableau 6.4] — Formations sur les plateformes infonuagiques (*cloud*) des fournisseurs (AWS, Azure, GCP) — Participation à des projets de déploiement de modèles en production en tant que partie prenante architecturale — Étude de cas de mises en production de LLM à l'échelle de l'entreprise |
| **Indicateurs de maîtrise** | — Peut dimensionner une infrastructure *LLMOps* en fonction des exigences de latence, de débit et de coût — Peut intégrer une pile *LLMOps* dans l'architecture d'entreprise existante sans créer de silos technologiques — Peut évaluer les options d'optimisation des coûts d'inférence (quantification, mise en cache sémantique, routage intelligent) — Peut définir les exigences de surveillance et d'alerte pour les modèles en production |

#### B.1.4 Gouvernance des modèles (*Model Governance*)

[Tableau B.4 — Compétence : Gouvernance des modèles]

| Attribut | Détail |
|---|---|
| **Description** | Maîtrise des politiques, processus et contrôles régissant le cycle de vie des modèles d'IA. Inclut la gestion du registre de modèles, l'évaluation des risques spécifiques (biais, hallucination, fuite de données, dépendance fournisseur), la conformité réglementaire (*EU AI Act*, NIST AI RMF) et l'explicabilité (SHAP, LIME, chaînes de raisonnement). Extension directe des compétences traditionnelles de l'AE en gouvernance. Voir section 6.2 pour le détail. |
| **Niveau de maîtrise attendu** | **Avancé** |
| **Méthode d'acquisition** | — Certifications en gouvernance IA (ISACA, cadre NIST) (20 à 40 heures) [Ch.6, tableau 6.4] — Formation approfondie sur l'*EU AI Act* et ses exigences de conformité — Mise en place et opération d'un registre de modèles IA dans l'organisation — Participation à des groupes de travail sur les standards de gouvernance (The Open Group, IASA Global) |
| **Indicateurs de maîtrise** | — Peut concevoir et opérer un registre de modèles IA complet (provenance, données d'entraînement, métriques, propriétaires) — Peut classifier les systèmes IA selon les niveaux de risque de l'*EU AI Act* et définir les exigences de conformité correspondantes — Peut spécifier les mécanismes d'explicabilité et de traçabilité requis pour chaque niveau de risque — Peut mener une évaluation de risques de biais algorithmique et recommander des mesures d'atténuation — Peut présenter un cadre de gouvernance IA au comité de direction |

#### B.1.5 Pensée systémique appliquée à l'IA

[Tableau B.5 — Compétence : Pensée systémique appliquée à l'IA]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de comprendre les interactions entre les composants d'un écosystème IA d'entreprise, d'identifier les boucles de rétroaction (*feedback loops*) et d'anticiper les effets émergents. Inclut la modélisation des interdépendances entre qualité des données, performance des modèles, confiance des utilisateurs, adoption et retour sur investissement. Couvre également la gouvernance des systèmes d'IA agentique. Voir section 6.4 pour le détail. |
| **Niveau de maîtrise attendu** | **Avancé** |
| **Méthode d'acquisition** | — Compétence historique de l'AE à renforcer par la pratique dans le contexte IA — Formations en dynamique des systèmes (*systems dynamics*) appliquée aux écosystèmes numériques — Exercices de modélisation de boucles de rétroaction sur des cas d'usage IA concrets — Revues d'architecture transversales impliquant les couches données, modèles, applications et gouvernance |
| **Indicateurs de maîtrise** | — Peut modéliser les boucles de rétroaction vertueuses et vicieuses d'un écosystème IA d'entreprise (cf. figure 6.2) — Peut identifier les points de levier où une intervention architecturale peut inverser une dynamique négative — Peut anticiper les effets de second ordre d'une décision architecturale sur l'ensemble de l'écosystème — Peut concevoir des architectures de gouvernance pour des systèmes d'IA agentique multi-agents |

#### B.1.6 Raisonnement par principes premiers (*First-Principles Reasoning*)

[Tableau B.6 — Compétence : Raisonnement par principes premiers]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de décomposer un problème complexe en ses composants fondamentaux et de reconstruire une solution à partir de vérités établies, plutôt que par analogie ou convention. Particulièrement critique dans un contexte d'évolution technologique rapide, de surabondance de discours marketing et d'absence de précédents pour certaines questions de gouvernance IA. Voir section 6.4 pour le détail. |
| **Niveau de maîtrise attendu** | **Avancé** |
| **Méthode d'acquisition** | — Pratique délibérée de déconstruction de problèmes architecturaux en contraintes fondamentales (qualité des données, coûts de calcul, exigences de gouvernance, maturité organisationnelle) — Exercices de raisonnement structuré sans recours à l'IA (cf. section 6.5 sur les contre-mesures à l'érosion cognitive) — Débats contradictoires structurés avec des pairs — Études de cas historiques de décisions architecturales dans des contextes d'incertitude |
| **Indicateurs de maîtrise** | — Peut distinguer les capacités réelles des promesses marketing d'un fournisseur d'IA en revenant aux contraintes techniques fondamentales — Peut construire un raisonnement architecturale solide pour des questions inédites (ex. : gouvernance d'agents autonomes) — Peut formuler et tester explicitement les hypothèses sous-jacentes à une recommandation architecturale — Peut résister à la pression de conformité et défendre une position contrariante lorsque les principes premiers le justifient |

#### B.1.7 Gestion du risque algorithmique

[Tableau B.7 — Compétence : Gestion du risque algorithmique]

| Attribut | Détail |
|---|---|
| **Description** | Extension des compétences traditionnelles de l'AE en gestion des risques aux spécificités des systèmes d'IA. Inclut l'évaluation du biais algorithmique, l'analyse d'impact des décisions algorithmiques, la modélisation des scénarios de défaillance (dérive de modèle, empoisonnement de données, attaques adversariales, fuites de contexte) et l'application du cadre NIST AI RMF (gouverner, cartographier, mesurer, gérer). Voir section 6.4 pour le détail. |
| **Niveau de maîtrise attendu** | **Intermédiaire à avancé** |
| **Méthode d'acquisition** | — Formation sur le cadre NIST AI Risk Management Framework [Ch.6, réf. 14] — Certifications en sécurité IA (SANS Institute) [Ch.6, réf. 23] — Participation à des exercices de *red teaming* sur des systèmes IA — Étude des cas documentés de biais algorithmique et de défaillances de systèmes IA |
| **Indicateurs de maîtrise** | — Peut mener une évaluation de biais algorithmique en identifiant les sources (données non représentatives, variables proxy, biais de confirmation) — Peut concevoir des mécanismes de traçabilité, d'explicabilité et de recours pour les systèmes IA décisionnels — Peut modéliser les scénarios de défaillance et concevoir des mécanismes de résilience adaptés — Peut appliquer les quatre fonctions du cadre NIST AI RMF aux systèmes IA de l'organisation |

#### B.1.8 Vigilance contre l'érosion cognitive

[Tableau B.8 — Compétence : Vigilance contre l'érosion cognitive par la GenAI]

| Attribut | Détail |
|---|---|
| **Description** | Conscience et gestion active du risque d'atrophie de la pensée critique lié à l'utilisation de l'IA générative. Inclut le maintien de la capacité de synthèse originale, de la vision systémique transversale et du jugement indépendant nécessaires à la responsabilité de conseil de l'AE. La recherche de Microsoft (CHI 2025) démontre la corrélation inverse entre la confiance dans l'IA et la pensée critique [Ch.6, réf. 25]. Voir section 6.5 pour le détail. |
| **Niveau de maîtrise attendu** | **Avancé** |
| **Méthode d'acquisition** | — Exercices réguliers de rédaction et d'analyse architecturale « sans IA » — Protocoles systématiques de vérification des sources et de contre-argumentation — Revues d'architecture transversales avec pairs humains — Participation à des débats contradictoires structurés — Alternance délibérée IA/non-IA dans les processus de décision |
| **Indicateurs de maîtrise** | — Peut construire un argument architectural complet et documenté sans l'aide d'un LLM — Peut identifier systématiquement les hypothèses non vérifiées dans une analyse produite avec l'aide de l'IA — Peut maintenir une vision transversale des interdépendances entre domaines sans se fier aux synthèses générées — Peut réussir des évaluations de compétences « sans IA » telles qu'anticipées par Gartner [Ch.6, réf. 26] |

---

### B.2 Dimension business

Les compétences business permettent à l'architecte de relier les capacités technologiques à la création de valeur organisationnelle. Comme l'a établi Gartner, cette dimension constitue l'une des lacunes les plus critiques dans les équipes d'architecture d'entreprise actuelles (cf. section 6.3).

#### B.2.1 Économie de plateforme

[Tableau B.9 — Compétence : Économie de plateforme]

| Attribut | Détail |
|---|---|
| **Description** | Compréhension des mécanismes fondamentaux de l'économie de plateforme et de leur application aux stratégies IA d'entreprise. Inclut les effets de réseau, les modèles de revenus de plateforme (frais de transaction, abonnements, modèles hybrides), la tension entre ouverture et contrôle, et la capacité de concevoir des architectures qui favorisent les effets de réseau tout en maintenant la gouvernance. McKinsey estime que les plateformes numériques représenteront 30 % du revenu mondial [Ch.6, réf. 16]. Voir section 6.3 pour le détail. |
| **Niveau de maîtrise attendu** | **Intermédiaire** |
| **Méthode d'acquisition** | — Formations en stratégie de plateforme et en modèles d'affaires numériques (MBA, formations exécutives) — Étude de cas de plateformes IA réussies et de leurs architectures — Analyse comparative des stratégies de plateforme des grands fournisseurs technologiques — Collaboration avec les équipes stratégie et développement des affaires |
| **Indicateurs de maîtrise** | — Peut analyser un modèle d'affaires de plateforme et identifier les effets de réseau exploitables — Peut recommander des choix architecturaux (API ouvertes vs fermées, données partagées vs propriétaires) en fonction de la stratégie de plateforme — Peut évaluer l'impact du degré d'ouverture d'une architecture sur le potentiel de monétisation — Peut présenter une analyse de positionnement plateforme au comité de direction |

#### B.2.2 Modélisation financière

[Tableau B.10 — Compétence : Modélisation financière]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de quantifier la valeur financière des initiatives IA et de construire des cas d'affaires convaincants. Inclut l'analyse coût-bénéfice (infrastructure, données, talent vs gains de productivité, revenus additionnels, réduction de risques), le calcul du coût total de possession (*TCO*) des plateformes IA, et la modélisation de la valeur par les flux de capacités (*value streams*). Gartner identifie cette compétence comme l'une des lacunes les plus critiques des équipes d'AE [Ch.6, réf. 3]. Voir section 6.3 pour le détail. |
| **Niveau de maîtrise attendu** | **Intermédiaire à avancé** |
| **Méthode d'acquisition** | — Formations spécialisées en modélisation financière pour architectes (10 à 20 heures) — Collaboration étroite avec la fonction finance (cf. section 6.7 sur les alliances) — Construction supervisée de cas d'affaires IA avec des directeurs financiers — Étude des structures de coûts des fournisseurs d'IA infonuagique |
| **Indicateurs de maîtrise** | — Peut construire un modèle financier complet pour une initiative IA intégrant tous les postes de coûts et de bénéfices — Peut calculer et comparer les TCO de différentes options architecturales (modèles propriétaires vs ouverts, infonuagique vs local) — Peut relier les capacités IA aux flux de valeur de l'organisation et au compte de résultats (*P&L*) — Peut présenter un cas d'affaires IA au comité d'investissement en utilisant le langage et les métriques de la finance |

#### B.2.3 *Storytelling* exécutif (narration fondée sur les données)

[Tableau B.11 — Compétence : Storytelling exécutif]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de construire et de présenter des récits convaincants fondés sur des données, reliant les décisions architecturales aux résultats business. Inclut la structuration narrative (contexte, tension, résolution, preuve, appel à l'action), la visualisation stratégique (cartes de chaleur, courbes de valeur, matrices de risques visuelles) et l'adaptation au public. Comme le rappelle Daniel Kahneman : « Personne n'a jamais pris une décision à cause d'un chiffre. Il faut un récit » [Ch.6, réf. 20]. Voir section 6.3 pour le détail. |
| **Niveau de maîtrise attendu** | **Avancé** |
| **Méthode d'acquisition** | — Formations en communication exécutive et en narration de données (*data storytelling*) — Pratique régulière de présentations au comité de direction, avec rétroaction structurée — Mentorat par des dirigeants expérimentés en communication stratégique — Étude des techniques de visualisation stratégique (Tufte, Few, Knaflic) |
| **Indicateurs de maîtrise** | — Peut construire un récit structuré (contexte-tension-résolution-preuve-action) pour une recommandation architecturale IA — Peut traduire une analyse technique en visualisations compréhensibles par des non-spécialistes — Peut adapter le niveau de détail, le vocabulaire et les métriques selon l'audience (comité de direction, équipe produit, équipe juridique) — Peut obtenir l'approbation d'un investissement IA par le comité de direction à la suite d'une présentation narrative |

#### B.2.4 Gestion du changement

[Tableau B.12 — Compétence : Gestion du changement]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de transformer les recommandations architecturales en pratiques organisationnelles adoptées. Inclut la cartographie des parties prenantes (sponsors, alliés, résistants, indécis), la conception de parcours d'adoption (gains rapides, puis transformations profondes), la gestion de la résistance avec des données et des cas comparables. McKinsey confirme que les entreprises dotées de cadres de collaboration interfonctionnelle obtiennent des gains de performance IA supérieurs de 40 % [Ch.6, réf. 21]. Voir section 6.3 pour le détail. |
| **Niveau de maîtrise attendu** | **Intermédiaire à avancé** |
| **Méthode d'acquisition** | — Certifications en gestion du changement (Prosci, ADKAR) ou formations équivalentes — Collaboration avec les équipes RH sur les parcours de transformation (cf. section 6.7) — Expérience de pilotage de programmes de transformation intégrant des composantes IA — Études de cas de réussites et d'échecs d'adoption IA dans des organisations comparables |
| **Indicateurs de maîtrise** | — Peut réaliser une cartographie complète des parties prenantes pour une initiative IA et définir une stratégie d'engagement pour chaque groupe — Peut concevoir un parcours d'adoption séquencé, commençant par des gains rapides démontrant la valeur — Peut anticiper et traiter les résistances techniques, organisationnelles et culturelles avec des réponses documentées — Peut mesurer le taux d'adoption et ajuster la stratégie en conséquence |

#### B.2.5 Analyse coût-bénéfice et calcul du retour sur investissement IA

[Tableau B.13 — Compétence : Analyse coût-bénéfice et ROI IA]

| Attribut | Détail |
|---|---|
| **Description** | Capacité d'évaluer rigoureusement le retour sur investissement des initiatives IA en intégrant les coûts directs et indirects, les bénéfices tangibles et intangibles, ainsi que les horizons temporels appropriés. L'enquête PwC auprès de 4 400 CEO révèle que 56 % d'entre eux n'ont constaté ni augmentation de revenus ni réduction de coûts grâce à l'IA [Ch.6, réf. 18], ce qui rend cette compétence particulièrement critique pour la crédibilité de l'AE. |
| **Niveau de maîtrise attendu** | **Intermédiaire** |
| **Méthode d'acquisition** | — Formations en analyse financière de projets technologiques — Co-construction de cas d'affaires avec la direction financière — Pratique sur des projets IA réels avec suivi post-déploiement du ROI — Benchmarking avec des données sectorielles (Gartner, Forrester, McKinsey) |
| **Indicateurs de maîtrise** | — Peut construire une analyse coût-bénéfice intégrant les coûts d'infrastructure, de données, de talent et de gouvernance — Peut évaluer les bénéfices intangibles (réduction de risques, amélioration de l'expérience client) en termes financiers — Peut présenter un calcul de ROI IA crédible avec des hypothèses explicites et des scénarios multiples — Peut suivre les indicateurs de valeur post-déploiement et ajuster les projections |

---

### B.3 Dimension influence

Les compétences d'influence permettent à l'architecte de faire adopter ses recommandations dans un environnement organisationnel complexe. Cette dimension, qui traverse les sections 6.3 et 6.7, est le levier sans lequel les compétences techniques et business restent inopérantes.

#### B.3.1 Leadership d'opinion

[Tableau B.14 — Compétence : Leadership d'opinion]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de se positionner comme une voix crédible et respectée sur les questions d'IA au sein de l'organisation et, le cas échéant, dans l'écosystème professionnel élargi. Inclut la publication de points de vue éclairés, la participation aux forums de décision et la construction d'une réputation d'expertise fondée sur des analyses rigoureuses plutôt que sur des opinions. Le passage de l'architecte « auteur de documents » à « ingénieur de décisions » (Forrester) [Ch.6, réf. 4] exige cette compétence. |
| **Niveau de maîtrise attendu** | **Intermédiaire à avancé** |
| **Méthode d'acquisition** | — Publication régulière d'analyses et de recommandations internes sur les enjeux IA — Participation active aux communautés de pratique (The Open Group, IASA Global) [Ch.6, section 6.6] — Présentations dans des conférences professionnelles et sectorielles — Mentorat de collègues sur les enjeux d'architecture IA |
| **Indicateurs de maîtrise** | — Est sollicité régulièrement par la direction pour des avis sur les initiatives IA — Peut influencer l'orientation stratégique IA de l'organisation par des analyses fondées — Contribue à des publications ou des événements professionnels reconnus — Est perçu par les pairs et les dirigeants comme une référence sur les questions EA-IA |

#### B.3.2 Négociation

[Tableau B.15 — Compétence : Négociation]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de négocier des compromis entre des exigences contradictoires — performance vs sécurité, ouverture vs contrôle, innovation vs stabilité, vitesse vs gouvernance — dans le contexte des architectures IA. Inclut la négociation de budgets, de priorités de feuille de route, de standards technologiques et de niveaux de risque acceptables avec des parties prenantes aux intérêts divergents. Voir la section 6.5 sur les arbitrages systémiques que l'AE doit conduire. |
| **Niveau de maîtrise attendu** | **Avancé** |
| **Méthode d'acquisition** | — Formations en négociation stratégique (Harvard, INSEAD ou équivalent) — Pratique délibérée de négociation dans des contextes interfonctionnels — Exercices de simulation de comités d'arbitrage architecturaux — Rétroaction de pairs et de dirigeants après des négociations clés |
| **Indicateurs de maîtrise** | — Peut mener une négociation entre parties prenantes aux intérêts divergents (ex. : équipe innovation vs équipe sécurité) et parvenir à un accord documenté — Peut structurer un compromis architectural qui satisfait les contraintes de plusieurs fonctions — Peut défendre une position architecturale face à une pression hiérarchique tout en préservant la relation — Peut obtenir l'adhésion des parties prenantes à un standard ou à une politique de gouvernance IA |

#### B.3.3 Construction de coalitions

[Tableau B.16 — Compétence : Construction de coalitions]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de construire des alliances stratégiques durables avec les fonctions clés de l'organisation — finance, RH, juridique, innovation, *data science* — pour soutenir les initiatives architecturales IA. Inclut l'identification de sponsors, la co-création de valeur, la participation aux rituels des fonctions partenaires et la construction d'un langage commun. Heidrick & Struggles confirme l'importance de cette collaboration interfonctionnelle [Ch.6, réf. 34]. Voir section 6.7 pour le détail. |
| **Niveau de maîtrise attendu** | **Avancé** |
| **Méthode d'acquisition** | — Pratique délibérée de co-création avec chaque fonction partenaire (cf. section 6.7 pour les mécanismes de collaboration) — Participation régulière aux comités et aux rituels des fonctions finance, RH, juridique, innovation et *data science* — Formation en intelligence organisationnelle et en gestion des parties prenantes — Construction progressive d'un réseau de confiance par des projets conjoints réussis |
| **Indicateurs de maîtrise** | — Dispose d'un réseau actif de contacts dans au moins quatre des cinq fonctions partenaires identifiées (finance, RH, juridique, innovation, *data science*) — Co-construit régulièrement des livrables interfonctionnels (cas d'affaires, référentiels de compétences, politiques de gouvernance) — Peut mobiliser rapidement une coalition de soutien pour une initiative architecturale stratégique — Participe régulièrement aux rituels des fonctions partenaires et y apporte une contribution reconnue |

#### B.3.4 Communication stratégique

[Tableau B.17 — Compétence : Communication stratégique]

| Attribut | Détail |
|---|---|
| **Description** | Capacité de communiquer les enjeux architecturaux IA de manière adaptée à chaque audience, en combinant rigueur technique et accessibilité. Distincte du *storytelling* exécutif (qui cible les décideurs), la communication stratégique couvre l'ensemble des interactions : équipes techniques, équipes métier, partenaires externes, régulateurs. Inclut la construction d'un langage commun entre les fonctions et la traduction bidirectionnelle entre vocabulaire technique et vocabulaire business. |
| **Niveau de maîtrise attendu** | **Avancé** |
| **Méthode d'acquisition** | — Pratique régulière de présentations à des audiences variées — Rédaction de documents de synthèse à différents niveaux de détail — Participation à des comités interfonctionnels où la traduction entre vocabulaires est requise — Rétroaction structurée sur la clarté et l'impact des communications |
| **Indicateurs de maîtrise** | — Peut expliquer un concept architectural IA de manière compréhensible à un public non technique sans sacrifier la rigueur — Peut rédiger un document de gouvernance IA qui satisfait simultanément les exigences du juridique, de la technique et du business — Peut faciliter une discussion productive entre des parties prenantes utilisant des vocabulaires distincts — Reçoit régulièrement des retours positifs sur la clarté de ses communications de la part de publics variés |

#### B.3.5 Cartographie et gestion des parties prenantes

[Tableau B.18 — Compétence : Cartographie et gestion des parties prenantes]

| Attribut | Détail |
|---|---|
| **Description** | Capacité d'identifier, de classifier et de gérer les relations avec l'ensemble des parties prenantes d'une initiative IA. Inclut l'identification des sponsors, alliés, résistants et indécis, la compréhension de leurs motivations et de leurs craintes, et la définition de stratégies d'engagement différenciées. Prérequis à la gestion du changement et à la construction de coalitions. Voir section 6.3 pour le détail. |
| **Niveau de maîtrise attendu** | **Intermédiaire à avancé** |
| **Méthode d'acquisition** | — Formation en analyse des parties prenantes (cadres de Mendelow, Mitchell-Agle-Wood) — Pratique sur des projets IA réels impliquant des parties prenantes multiples — Rétroaction de mentors expérimentés en politique organisationnelle — Études de cas de programmes de transformation technologique |
| **Indicateurs de maîtrise** | — Peut produire une cartographie complète des parties prenantes d'une initiative IA avec des stratégies d'engagement différenciées — Peut anticiper les réactions des parties prenantes clés à une recommandation architecturale — Peut adapter sa stratégie d'influence en temps réel en fonction des réactions observées — Peut transformer un résistant en allié par un engagement ciblé et une réponse documentée à ses préoccupations |

---

### B.4 Matrice de synthèse

Le tableau suivant offre une vue consolidée de l'ensemble des compétences du référentiel, permettant à l'AE d'évaluer rapidement son profil actuel et d'identifier ses priorités de développement.

[Tableau B.19 — Matrice de synthèse du référentiel de compétences EA-IA]

| # | Dimension | Compétence | Niveau attendu | Réf. Ch.6 |
|---|---|---|---|---|
| 1 | Technique | Littératie IA (*AI Literacy*) | Intermédiaire à avancé | §6.2 |
| 2 | Technique | Ingénierie des requêtes (*Prompt Engineering*) | Intermédiaire | §6.2 |
| 3 | Technique | *LLMOps* | Fondamental à intermédiaire | §6.2 |
| 4 | Technique | Gouvernance des modèles (*Model Governance*) | Avancé | §6.2 |
| 5 | Technique | Pensée systémique appliquée à l'IA | Avancé | §6.4 |
| 6 | Technique | Raisonnement par principes premiers | Avancé | §6.4 |
| 7 | Technique | Gestion du risque algorithmique | Intermédiaire à avancé | §6.4 |
| 8 | Technique | Vigilance contre l'érosion cognitive | Avancé | §6.5 |
| 9 | Business | Économie de plateforme | Intermédiaire | §6.3 |
| 10 | Business | Modélisation financière | Intermédiaire à avancé | §6.3 |
| 11 | Business | *Storytelling* exécutif | Avancé | §6.3 |
| 12 | Business | Gestion du changement | Intermédiaire à avancé | §6.3 |
| 13 | Business | Analyse coût-bénéfice et ROI IA | Intermédiaire | §6.3 |
| 14 | Influence | Leadership d'opinion | Intermédiaire à avancé | §6.3, §6.7 |
| 15 | Influence | Négociation | Avancé | §6.5, §6.7 |
| 16 | Influence | Construction de coalitions | Avancé | §6.7 |
| 17 | Influence | Communication stratégique | Avancé | §6.3, §6.7 |
| 18 | Influence | Cartographie et gestion des parties prenantes | Intermédiaire à avancé | §6.3, §6.7 |

---

### B.5 Guide d'utilisation du référentiel

Ce référentiel peut être utilisé de plusieurs manières complémentaires :

**Auto-évaluation individuelle.** L'architecte d'entreprise peut évaluer son niveau actuel pour chacune des 18 compétences en se comparant aux indicateurs de maîtrise, puis identifier les écarts prioritaires à combler. L'Annexe C (template de maturité) fournit un outil d'évaluation structuré qui peut être adapté à cet usage.

**Plan de développement professionnel.** En croisant l'auto-évaluation avec les méthodes d'acquisition suggérées, l'AE peut construire un plan de développement professionnel sur 12 à 24 mois, en priorisant les compétences dont l'écart est le plus critique et dont l'impact sur le rôle stratégique est le plus élevé.

**Recrutement et constitution d'équipes.** Les responsables d'équipes d'architecture peuvent utiliser le référentiel pour définir les profils de postes, évaluer les candidats et identifier les complémentarités nécessaires au sein de l'équipe. Il n'est pas nécessaire que chaque architecte maîtrise l'ensemble des 18 compétences au niveau attendu — la complémentarité des profils au sein d'une équipe est une stratégie légitime.

**Collaboration avec les ressources humaines.** Comme le recommande la section 6.7, le référentiel peut servir de base à une co-construction avec la fonction RH pour l'élaboration de parcours de formation, de grilles d'évaluation et de stratégies de rétention des talents EA-IA.
