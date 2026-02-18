### Chapitre 6 — Les nouvelles compétences de l'architecte stratégique IA

<!-- Rôle argumentatif (PRD §3) : Les compétences à acquérir couvrent trois dimensions : technique, business et influence. -->

#### Introduction

Les chapitres précédents ont démontré que l'architecte d'entreprise (AE) est le professionnel le mieux positionné pour combler le fossé entre l'ambition IA des organisations et leur capacité d'exécution. Le chapitre 3 a retracé l'évolution du rôle, du cartographe du système d'information au conseiller stratégique. Le chapitre 4 a établi que l'AE se situe au centre de la stratégie IA en tant que traducteur entre la vision business et la réalité technique. Le chapitre 5 a fourni les cadres d'analyse concrets — matrices de priorisation, *capability-based planning*, cartes de chaleur — qui permettent à l'architecte d'exercer cette fonction de conseil. Mais disposer de cadres ne suffit pas : encore faut-il posséder les compétences pour les mobiliser dans un environnement où l'intelligence artificielle redéfinit simultanément les technologies, les modèles d'affaires et les modes de décision.

Le repositionnement stratégique de l'architecte d'entreprise à l'ère de l'IA exige une transformation profonde de son profil de compétences. Cette transformation ne se limite pas à l'acquisition de connaissances techniques en apprentissage automatique ou en grands modèles de langage (*Large Language Models*, LLM). Elle implique le développement simultané de trois familles de compétences : des compétences techniques en IA, des compétences business permettant de relier la technologie à la création de valeur, et des compétences d'influence nécessaires pour naviguer dans les dynamiques organisationnelles complexes. Le rapport *Future of Jobs Report 2025* du Forum économique mondial, fondé sur l'enquête auprès de plus de 1 000 employeurs représentant 14 millions de travailleurs, confirme cette triple exigence : l'IA et les mégadonnées (*big data*) figurent en tête des compétences les plus recherchées, suivies de la pensée créative, de la résilience et de la curiosité intellectuelle [1]. Ce chapitre examine ces trois dimensions, identifie les risques associés à une dépendance excessive à l'IA générative, et propose des parcours concrets de montée en compétences. L'Annexe B fournit un référentiel de compétences EA-IA détaillé qui complète l'analyse présentée ici.

---

#### 6.1 Le modèle de compétences élargi : technique + business + influence

##### Le constat d'un profil en mutation

Le profil de compétences traditionnel de l'architecte d'entreprise, tel qu'il a été formalisé par les cadres de référence TOGAF (*The Open Group Architecture Framework*) et Zachman, est historiquement centré sur la maîtrise des cadres méthodologiques, la modélisation des systèmes d'information et la conformité aux standards technologiques. Selon Gartner, l'expertise en cadres d'architecture d'entreprise, en particulier TOGAF, demeure la compétence technique la plus recherchée pour les architectes d'entreprise [2]. Cependant, ce socle technique ne suffit plus à assurer la pertinence stratégique du rôle.

L'analyse de Gartner sur les tendances de l'architecture d'entreprise pour 2025 identifie explicitement un déficit de compétences critique : les équipes d'architecture d'entreprise doivent acquérir des compétences en modélisation et analyse financière, ainsi qu'en IA — incluant les architectures orientées données, la modélisation de données, et le développement et l'intégration de solutions IA [3]. Gartner observe que peu de pratiques d'architecture d'entreprise possèdent les compétences en modélisation financière nécessaires pour motiver les investissements technologiques et anticiper les sources de friction [3]. Ce constat révèle que le fossé de compétences ne se situe pas uniquement du côté technique — il est tout autant présent du côté business.

Forrester, dans son rapport *The Future of the Enterprise Architect's Job* (2025), confirme cette évolution en décrivant le passage de l'architecte « auteur de documents » (*document author*) à l'architecte « ingénieur de décisions » (*decision engineer*) [4]. Ce glissement sémantique est révélateur : l'architecte ne produit plus principalement des artefacts documentaires (diagrammes, standards, matrices de conformité), mais contribue directement à la prise de décisions stratégiques en fournissant des analyses, des simulations et des recommandations fondées sur des données.

##### Le modèle tri-dimensionnel

L'analyse croisée des recherches récentes permet de proposer un modèle de compétences tri-dimensionnel qui structure les capacités requises de l'architecte stratégique IA autour de trois axes complémentaires :

[Figure 6.1 — Modèle de compétences tri-dimensionnel de l'architecte stratégique IA]

```
                        INFLUENCE
                           ▲
                          / \
                         /   \
                        /     \
                       / Storytelling \
                      /  exécutif,    \
                     / gestion du     \
                    / changement,      \
                   / leadership         \
                  / d'opinion,           \
                 / négociation            \
                /___________________________\
               /\                          /\
              /  \    ARCHITECTE          /  \
             /    \   STRATÉGIQUE       /    \
            /      \     IA            /      \
           /        \                /        \
          / AI literacy,\          / Économie de  \
         / LLMOps, prompt\       / plateforme,     \
        / engineering,    \     / modélisation       \
       / model governance, \   / financière, pensée   \
      / pensée systémique   \ / systémique, gestion    \
     /________________________\/____du risque____________\
   TECHNIQUE ◄──────────────────────────────► BUSINESS
```

*Le modèle illustre les trois dimensions de compétences requises. L'intersection des trois axes définit le profil de l'architecte stratégique IA. Chaque dimension est nécessaire mais insuffisante isolément.*

**La dimension technique** englobe les connaissances et capacités liées aux technologies d'IA elles-mêmes : compréhension des modèles, des architectures de données, des plateformes *MLOps*/*LLMOps*, de la gouvernance des modèles et de la sécurité. Cette dimension est traitée en détail à la section 6.2.

**La dimension business** couvre les compétences permettant de relier les capacités technologiques à la création de valeur organisationnelle : économie de plateforme, modélisation financière, *storytelling* exécutif et gestion du changement. Cette dimension est développée à la section 6.3.

**La dimension influence** rassemble les compétences interpersonnelles et organisationnelles nécessaires pour faire adopter les recommandations architecturales : leadership d'opinion, négociation, construction de coalitions et communication stratégique. Cette dimension traverse les sections 6.3 et 6.7.

L'étude de Gupta (2025), publiée sur arXiv, offre un cadre théorique complémentaire en conceptualisant l'architecture d'entreprise comme une capacité dynamique (*dynamic capability*) pour l'adoption de l'IA générative. Ce cadre distingue trois fonctions — détection (*sensing*), saisie (*seizing*) et transformation (*transforming*) — qui se transposent naturellement sur le modèle tri-dimensionnel : la détection mobilise les compétences techniques (comprendre les technologies), la saisie mobilise les compétences business (évaluer les opportunités) et la transformation mobilise les compétences d'influence (conduire le changement) [5].

[Tableau 6.1 — Correspondance entre le modèle tri-dimensionnel et le cadre des capacités dynamiques]

| Dimension de compétences | Capacité dynamique (Gupta 2025) | Fonction dans le rôle stratégique |
|---|---|---|
| Technique | Détection (*sensing*) | Identifier et évaluer les technologies IA pertinentes |
| Business | Saisie (*seizing*) | Traduire les opportunités en investissements et en valeur |
| Influence | Transformation (*transforming*) | Piloter le changement organisationnel et l'adoption |

*Sources : Modèle proposé par les auteurs; cadre des capacités dynamiques adapté de Gupta (2025) [5]*

##### L'écart entre le profil actuel et le profil cible

Les données du marché de l'emploi illustrent l'ampleur de la transformation requise. Selon les analyses de Research.com pour 2026, les architectes d'entreprise possédant des compétences en IA bénéficient d'une prime salariale de 25 à 50 % par rapport aux profils traditionnels, et la demande pour ces profils augmentés a connu une hausse de 67 % [6]. Le salaire médian d'un architecte d'entreprise aux États-Unis se situe autour de 137 560 $ US par an, tandis que les architectes spécialisés en IA atteignent des fourchettes de 250 000 à 350 000 $ US [6] [7]. Ces écarts de rémunération reflètent la rareté des profils combinant les trois dimensions de compétences.

Le Forum économique mondial anticipe que 39 % des compétences fondamentales (*core skills*) seront transformées d'ici 2030, et que 85 % des employeurs prévoient de prioriser la requalification (*reskilling*) et la montée en compétences (*upskilling*) de leur main-d'œuvre [1]. Pour l'architecte d'entreprise, cette transformation est encore plus prononcée : les compétences en IA et en mégadonnées ne sont pas simplement ajoutées au profil existant — elles reconfigurèrent fondamentalement la manière dont les compétences traditionnelles sont exercées.

---

#### 6.2 Compétences IA essentielles : *AI literacy*, *prompt engineering*, *LLMOps*, *model governance*

##### La littératie IA (*AI literacy*) comme fondation

La littératie IA — la capacité de comprendre, d'évaluer et de communiquer sur les technologies d'intelligence artificielle — constitue le socle sur lequel reposent toutes les autres compétences techniques. Pour l'architecte d'entreprise, la littératie IA ne signifie pas la capacité de développer des modèles d'apprentissage automatique : elle signifie la capacité de comprendre les principes fondamentaux qui sous-tendent ces modèles afin de prendre des décisions architecturales éclairées.

DataCamp, dans son programme de formation en IA pour les entreprises, définit la littératie IA organisationnelle comme la capacité de chaque professionnel à « utiliser l'intelligence artificielle de manière efficace, sécuritaire et créative dans son travail quotidien » [8]. Pour l'architecte d'entreprise, cette définition se décline en capacités spécifiques :

**Comprendre les types de modèles et leurs implications architecturales.** L'architecte doit distinguer les modèles d'apprentissage supervisé, non supervisé et par renforcement, les modèles de fondation (*foundation models*), les modèles à réglage fin (*fine-tuned models*) et les modèles spécialisés. Chaque type implique des choix architecturaux distincts en matière d'infrastructure, de données et de gouvernance.

**Évaluer les capacités et les limites des LLM.** L'architecte doit comprendre les phénomènes d'hallucination, les limites de la fenêtre de contexte, les compromis entre précision et latence, et les implications de la taille des modèles sur les coûts d'inférence. Cette compréhension est nécessaire pour concevoir des architectures de génération augmentée par la récupération (*Retrieval-Augmented Generation*, RAG), dimensionner les infrastructures et définir les niveaux de service.

**Interpréter les métriques de performance des modèles.** Au-delà de la précision brute, l'architecte doit comprendre les métriques de rappel, de précision, de F1-score, de perplexité et de *BLEU score* afin d'évaluer la pertinence d'un modèle pour un cas d'usage donné et de communiquer cette évaluation aux parties prenantes business.

L'étude systématique de la littérature publiée sur arXiv par Calegari et al. (2025) sur l'impact de l'IA générative pour les architectes d'entreprise en environnement agile confirme que les architectes « opèrent de plus en plus comme curateurs et validateurs des productions de l'IA générative, plutôt que comme créateurs principaux d'artefacts de conception », ce qui exige « une reconfiguration des compétences architecturales fondamentales » [9].

##### L'ingénierie des requêtes (*prompt engineering*) pour l'architecte

L'ingénierie des requêtes (*prompt engineering*) — la capacité de formuler des instructions précises et contextualisées pour les LLM — est devenue une compétence transversale essentielle. Pour l'architecte d'entreprise, elle se manifeste à deux niveaux distincts.

**Au niveau opérationnel**, l'architecte utilise l'ingénierie des requêtes pour augmenter sa propre productivité : analyse de documentation existante, génération de diagrammes d'architecture, exploration de scénarios alternatifs, synthèse de la littérature technique. Comme le note le magazine *Architecture & Governance*, « l'ingénierie des requêtes est la couche critique entre la logique business et la capacité IA » [10]. L'architecte qui maîtrise cette compétence peut accélérer significativement son cycle d'analyse et de recommandation.

**Au niveau stratégique**, l'architecte doit comprendre les implications de l'ingénierie des requêtes sur l'architecture des systèmes. Les systèmes qui intègrent des LLM nécessitent des couches d'orchestration des requêtes (*prompt orchestration*), des mécanismes de gestion des modèles de requêtes (*prompt templates*), des systèmes de suivi des versions de requêtes et des mécanismes de test et de validation. L'architecture doit prévoir comment les requêtes sont construites, versionnées, testées et déployées à l'échelle de l'organisation.

Les techniques avancées que l'architecte doit connaître incluent le chaînage de pensée (*chain-of-thought prompting*), la décomposition de tâches (*task decomposition*), le cadrage contextuel (*contextual framing*) et la génération augmentée par la récupération. Selon les analyses de Dextra Labs, la maîtrise de ces techniques permet d'améliorer de 40 à 60 % la qualité des réponses des LLM en contexte d'entreprise [11].

##### Les opérations de grands modèles de langage (*LLMOps*)

Les *LLMOps* (*Large Language Model Operations*) représentent l'extension des pratiques *MLOps* (*Machine Learning Operations*) aux spécificités des LLM. Cette discipline englobe le cycle de vie complet des LLM en production : sélection, réglage fin, déploiement, surveillance, optimisation des coûts et gestion de la dérive.

L'architecte d'entreprise n'a pas besoin de maîtriser chaque aspect technique des *LLMOps*, mais il doit comprendre les décisions architecturales qu'elles impliquent :

**L'architecture de la pile *LLMOps*.** Selon les analyses de SaM Solutions, une architecture *LLMOps* de qualité production comprend typiquement quatre couches : traitement et gouvernance des données, entraînement et réglage fin des modèles, infrastructure de déploiement et de service, et sécurité avec contrôle d'accès basé sur les rôles [12]. L'architecte doit s'assurer que cette pile s'intègre dans l'architecture d'entreprise existante et ne crée pas de silos technologiques.

**Les compromis coût-performance.** Les coûts d'inférence des LLM peuvent devenir un facteur limitant à l'échelle. L'architecte doit comprendre les options d'optimisation — quantification des modèles, mise en cache sémantique (*semantic caching*), routage intelligent entre modèles de tailles différentes — et les intégrer dans les décisions architecturales.

**La surveillance et la gestion de la dérive.** Les LLM en production peuvent voir leur performance se dégrader au fil du temps en raison de changements dans les données d'entrée, de mises à jour des modèles par les fournisseurs ou d'évolutions des attentes des utilisateurs. L'architecte doit prévoir les mécanismes de surveillance et de remplacement (*model swap*) dans l'architecture.

La feuille de route *MLOps*/*LLMOps* proposée par Panda (2026) identifie quatre parcours de carrière dans ce domaine : l'ingénierie de plateforme (*platform engineering*), l'ingénierie d'apprentissage automatique (*ML engineering*), la sécurité et la fiabilité de l'IA (*AI safety and reliability*) et le leadership technique [13]. L'architecte d'entreprise se situe naturellement dans ce dernier parcours, avec une vision transversale des trois autres.

##### La gouvernance des modèles (*model governance*)

La gouvernance des modèles constitue le domaine où les compétences traditionnelles de l'architecte d'entreprise en matière de gouvernance et de conformité se transposent le plus directement au contexte de l'IA. Elle englobe les politiques, les processus et les contrôles qui régissent le cycle de vie des modèles d'IA au sein de l'organisation.

L'architecte d'entreprise doit acquérir des compétences spécifiques en :

**Gestion du registre de modèles.** Inventorier tous les modèles d'IA en production, leur provenance, leurs données d'entraînement, leurs métriques de performance et leurs propriétaires. Ce registre est l'équivalent IA du référentiel d'applications que l'architecte d'entreprise gère traditionnellement.

**Évaluation des risques spécifiques aux modèles.** Comprendre et évaluer les risques de biais algorithmique, d'hallucination, de fuite de données d'entraînement, de dépendance à un fournisseur (*vendor lock-in*) et de non-conformité réglementaire. Le cadre de gestion des risques de l'IA du *National Institute of Standards and Technology* (NIST) fournit une structure pour cette évaluation [14].

**Conformité réglementaire.** L'*EU AI Act* (règlement européen sur l'intelligence artificielle), entré en vigueur progressivement depuis 2024, impose des exigences de documentation, de traçabilité et de test pour les systèmes d'IA à haut risque. L'architecte d'entreprise doit intégrer ces exigences dans les architectures dès la conception (*compliance by design*). Selon les analyses de VodWorks, les régulateurs exigent désormais « des jeux de données testés contre les biais, statistiquement représentatifs, une documentation technique exhaustive et une supervision humaine dans la boucle (*human-in-the-loop*) pour tout système à haut risque » [15].

**Explicabilité et traçabilité.** L'architecte doit comprendre les techniques d'explicabilité — SHAP (*SHapley Additive exPlanations*), LIME (*Local Interpretable Model-agnostic Explanations*), chaînes de raisonnement (*reasoning chains*) — et prévoir les mécanismes architecturaux nécessaires pour les intégrer dans les systèmes en production. La recherche de Gupta (2025) identifie « l'opacité des systèmes d'IA générative fonctionnant comme des boîtes noires (*black boxes*) dont les processus de raisonnement internes sont inaccessibles » comme un défi technique majeur pour la gouvernance architecturale [5].

[Tableau 6.2 — Cartographie des compétences IA essentielles pour l'architecte d'entreprise]

| Compétence | Niveau requis pour l'AE | Application concrète | Risque si absente |
|---|---|---|---|
| Littératie IA | Intermédiaire à avancé | Évaluation et sélection de solutions IA | Décisions techniques non éclairées |
| Ingénierie des requêtes | Intermédiaire | Augmentation de productivité; conception de systèmes | Sous-utilisation des LLM; architectures inadaptées |
| *LLMOps* | Fondamental à intermédiaire | Dimensionnement d'infrastructure; intégration SI | Coûts non maîtrisés; systèmes fragiles |
| Gouvernance des modèles | Avancé | Registre de modèles; conformité réglementaire | Non-conformité; risques de biais non gérés |

*Source : Synthèse des auteurs à partir de [3], [4], [9], [12]*

---

#### 6.3 Compétences business critiques : économie de plateforme, modélisation financière, *storytelling* exécutif, gestion du changement

##### L'économie de plateforme : comprendre les modèles de valeur

L'IA ne crée pas de la valeur en isolation : elle s'insère dans des modèles d'affaires qui, de plus en plus, reposent sur des logiques de plateforme. Selon McKinsey, les plateformes numériques représenteront 30 % du revenu mondial d'ici 2025, soit 60 000 milliards de dollars américains [16]. Pourtant, seulement 3 % des entreprises disposent d'une stratégie de plateforme formalisée [16]. Cette asymétrie entre l'importance stratégique des plateformes et la faible maturité des organisations crée un espace naturel pour l'architecte d'entreprise.

L'architecte stratégique IA doit comprendre les mécanismes fondamentaux de l'économie de plateforme :

**Les effets de réseau.** La valeur d'une plateforme augmente de manière non linéaire avec le nombre de participants. L'architecte doit savoir concevoir des architectures qui favorisent ces effets de réseau — *APIs* ouvertes, modèles de données partagés, mécanismes d'intégration standardisés — tout en maintenant la gouvernance et la sécurité.

**Les modèles de revenus de plateforme.** Les plateformes monétisent par des frais de transaction, des abonnements, de la publicité ou des modèles hybrides. L'architecte doit comprendre comment les choix architecturaux — API ouvertes vs fermées, données partagées vs propriétaires, modèles centralisés vs fédérés — influencent directement le modèle de revenus.

**La tension entre ouverture et contrôle.** L'architecture de plateforme IA implique des décisions fondamentales sur le degré d'ouverture : quelles capacités sont exposées comme services, quelles données sont partagées, quels modèles sont accessibles à l'écosystème. Ces décisions relèvent autant de la stratégie business que de l'architecture technique.

Selon les projections de Platform Executive, le marché mondial de l'écosystème de plateformes, évalué à 7 300 milliards de dollars américains en 2024, devrait atteindre 13 700 milliards d'ici 2030, avec un taux de croissance annuel composé de 10,9 % [17]. L'architecte d'entreprise qui comprend cette dynamique peut positionner son organisation pour capturer une part de cette valeur plutôt que de la subir.

##### La modélisation financière : parler le langage de la direction

L'une des lacunes les plus critiques identifiées par Gartner dans les équipes d'architecture d'entreprise est l'absence de compétences en modélisation financière. Gartner observe que « peu de pratiques d'architecture d'entreprise possèdent les compétences en modélisation financière et en analyse nécessaires pour motiver les investissements technologiques et prédire les sources de friction » [3].

Cette lacune est particulièrement dommageable dans le contexte de l'IA, où les investissements sont considérables et les retours incertains. L'enquête PwC auprès de 4 400 CEO révèle que 56 % d'entre eux n'ont constaté ni augmentation de revenus ni réduction de coûts grâce à l'IA [18]. Face à ce constat, la capacité de l'architecte à modéliser la valeur financière des initiatives IA devient un levier de crédibilité stratégique.

Les compétences de modélisation financière que l'architecte stratégique IA doit acquérir incluent :

**L'analyse coût-bénéfice des initiatives IA.** Savoir construire un modèle financier qui intègre les coûts d'infrastructure (calcul, stockage, licences de modèles), les coûts de données (acquisition, nettoyage, gouvernance), les coûts de talent (développement, maintenance, surveillance) et les bénéfices attendus (gains de productivité, revenus additionnels, réduction de risques).

**Le coût total de possession (*Total Cost of Ownership*, TCO) des plateformes IA.** Comprendre les structures de coûts des fournisseurs d'IA infonuagique (*cloud AI*), les modèles de tarification à l'utilisation (*pay-per-use*) vs les engagements de capacité réservée, et les coûts cachés de l'intégration et de la gouvernance.

**La modélisation de la valeur par les flux de capacités (*value streams*).** Traduire les capacités IA en termes de contribution aux flux de valeur de l'organisation — et donc au compte de résultats. Selon Forrester, moins d'un tiers des décideurs sont en mesure de relier la valeur de l'IA aux variations du résultat financier (*P&L changes*) de leur organisation [19]. L'architecte qui sait construire ce lien dispose d'un avantage stratégique déterminant.

##### Le *storytelling* exécutif : l'art de la narration fondée sur les données

La capacité à construire et à présenter des récits convaincants fondés sur des données constitue l'une des compétences les plus sous-estimées de l'architecte d'entreprise. Gartner prédisait que les récits de données (*data stories*) deviendraient le mode de consommation d'analytique le plus répandu, et que les techniques d'analytique augmentée généreraient 75 % de ces récits [20]. Pour l'architecte stratégique IA, cette compétence se traduit par la capacité de construire des narratifs qui relient les décisions architecturales aux résultats business.

Comme le rappelait le lauréat Nobel Daniel Kahneman : « Personne n'a jamais pris une décision à cause d'un chiffre. Il faut un récit » [20]. Cette observation est particulièrement pertinente pour l'architecte d'entreprise qui présente des recommandations au comité de direction. Un diagramme d'architecture, aussi rigoureux soit-il, ne convainc pas un CEO. Un récit structuré qui démontre comment une décision architecturale permet de capturer un marché, de réduire un risque mesurable ou d'accélérer un délai de mise en marché a un pouvoir de persuasion incomparablement supérieur.

Les compétences de narration exécutive que l'architecte doit développer incluent :

**La structuration narrative.** Organiser les recommandations selon une structure narrative claire : contexte (le problème business), tension (le risque ou l'opportunité), résolution (la recommandation architecturale), preuve (les données et les cas comparables) et appel à l'action (la décision demandée).

**La visualisation stratégique.** Traduire les analyses architecturales en visualisations compréhensibles par des non-spécialistes — cartes de chaleur (*heat maps*) des capacités, courbes de valeur, matrices de risques visuelles — plutôt qu'en diagrammes techniques que seuls les architectes comprennent.

**L'adaptation au public.** Ajuster le niveau de détail, le vocabulaire et les métriques en fonction de l'audience — comité de direction, équipe produit, équipe de données, équipe juridique. L'architecte qui présente un *TCO* à un directeur financier et une carte des capacités à un directeur des opérations démontre une maîtrise de cette compétence.

##### La gestion du changement : de la recommandation à l'adoption

L'architecte d'entreprise produit des recommandations. La gestion du changement transforme ces recommandations en pratiques organisationnelles. Sans cette compétence, les architectures les plus élégantes restent des artefacts théoriques. Le rapport McKinsey *AI in the Workplace* (2025) confirme que les entreprises disposant de cadres de collaboration interfonctionnelle et de préparation éthique robustes obtiennent des gains de performance liés à l'IA supérieurs de 40 % par rapport à leurs pairs [21].

L'architecte stratégique IA doit acquérir des compétences spécifiques en :

**Cartographie des parties prenantes.** Identifier les sponsors, les alliés, les résistants et les indécis pour chaque initiative architecturale. Comprendre les motivations et les craintes de chaque groupe.

**Conception de parcours d'adoption.** Planifier la séquence d'introduction des changements architecturaux en commençant par les gains rapides (*quick wins*) qui démontrent la valeur avant de demander des transformations plus profondes.

**Gestion de la résistance.** Anticiper et traiter les objections — techniques, organisationnelles, culturelles — avec des réponses fondées sur des données et des cas comparables.

---

#### 6.4 Compétences analytiques : pensée systémique, raisonnement *first-principles*, gestion du risque algorithmique

##### La pensée systémique comme compétence fondamentale

La pensée systémique — la capacité de comprendre les interactions entre les composants d'un système complexe et d'anticiper les effets émergents — est une compétence historique de l'architecte d'entreprise. À l'ère de l'IA, elle acquiert une importance accrue pour trois raisons.

Premièrement, les systèmes d'IA introduisent des boucles de rétroaction (*feedback loops*) qui n'existaient pas dans les systèmes d'information traditionnels. Un modèle de recommandation qui influence le comportement des utilisateurs modifie les données qui servent à l'entraîner, créant des dynamiques non linéaires que seule une pensée systémique peut appréhender.

Deuxièmement, les systèmes d'IA agentique (*agentic AI*) — des agents autonomes qui prennent des décisions et exécutent des actions — introduisent des niveaux de complexité systémique sans précédent. Selon Forrester, les architectes deviennent des « champions de la gouvernance agentique » (*agentic governance champions*) qui « gèrent des fermes d'agents IA, établissent des garde-fous et des boucles de rétroaction pour assurer la responsabilité et l'alignement avec les objectifs business » [4]. Cette fonction de supervision systémique ne peut être exercée sans une pensée systémique rigoureuse.

Troisièmement, l'IA amplifie les interdépendances entre les couches de l'architecture d'entreprise. Une décision sur la qualité des données affecte la performance des modèles, qui affecte la confiance des utilisateurs, qui affecte l'adoption, qui affecte le retour sur investissement, qui affecte les futurs investissements en données. L'architecte doit percevoir et modéliser ces chaînes causales.

[Figure 6.2 — Boucles de rétroaction systémiques dans un écosystème IA d'entreprise]

```
┌─────────────────────────────────────────────────────────────────┐
│                  BOUCLES DE RÉTROACTION IA                      │
│                                                                  │
│   ┌──────────┐     ┌──────────┐     ┌──────────┐               │
│   │ Qualité  │────►│Performance│────►│ Confiance │              │
│   │ des      │     │ des       │     │ des       │              │
│   │ données  │     │ modèles   │     │utilisateurs│             │
│   └────▲─────┘     └──────────┘     └─────┬─────┘              │
│        │                                    │                    │
│        │    ┌──────────┐     ┌──────────┐  │                    │
│        │    │ Investis- │◄───│  ROI     │◄─┘                    │
│        └────│ sements   │    │  mesuré  │   Adoption            │
│             │ données   │    └──────────┘                        │
│             └──────────┘                                         │
│                                                                  │
│   Boucle vertueuse : haute qualité → haute performance →        │
│   haute confiance → forte adoption → ROI positif →              │
│   investissements accrus → qualité améliorée                    │
│                                                                  │
│   Boucle vicieuse : basse qualité → basse performance →         │
│   méfiance → faible adoption → ROI négatif →                    │
│   coupes budgétaires → qualité dégradée                         │
└─────────────────────────────────────────────────────────────────┘
```

*La figure illustre les boucles de rétroaction vertueuses et vicieuses dans un écosystème IA d'entreprise. L'architecte stratégique doit identifier les points de levier où une intervention architecturale peut inverser une boucle vicieuse ou amplifier une boucle vertueuse.*

##### Le raisonnement *first-principles*

Le raisonnement par principes premiers (*first-principles reasoning*) — la capacité de décomposer un problème complexe en ses composants fondamentaux et de reconstruire la solution à partir de vérités établies plutôt que d'analogies ou de conventions — est particulièrement précieux dans le contexte de l'IA. Trois caractéristiques de l'environnement actuel rendent cette compétence indispensable.

**La vitesse d'évolution technologique.** Les technologies d'IA évoluent à un rythme qui rend les analogies avec les cycles technologiques précédents potentiellement trompeuses. L'architecte qui raisonne par analogie (« le *cloud* s'est déployé de telle manière, donc l'IA se déploiera de la même manière ») risque de se fourvoyer. Le raisonnement par principes premiers permet de revenir aux contraintes fondamentales — qualité des données, coûts de calcul, exigences de gouvernance, maturité organisationnelle — et de construire des solutions adaptées au contexte spécifique.

**La surabondance de discours marketing.** L'IA est accompagnée d'un volume considérable de discours promotionnels de la part des fournisseurs, des cabinets de conseil et des médias. L'architecte doit être capable de distinguer les capacités réelles des promesses, en revenant systématiquement aux principes techniques et organisationnels sous-jacents. Comme le note l'approche d'architecture de Salesforce pour l'entreprise agentique, le principe fondamental est de « commencer par la solution la plus simple et efficace, en ajoutant de la complexité uniquement lorsqu'une valeur business claire justifie la charge opérationnelle et le risque supplémentaires » [22].

**L'absence de précédents.** Pour certaines questions — comme la gouvernance des agents autonomes ou l'architecture de systèmes où l'IA prend des décisions impactant des vies humaines — il n'existe pas de précédents établis. Le raisonnement par principes premiers est le seul outil disponible pour construire des réponses rigoureuses à des questions inédites.

##### La gestion du risque algorithmique

La gestion du risque algorithmique étend les compétences traditionnelles de l'architecte d'entreprise en matière de gestion des risques aux spécificités des systèmes d'IA. Selon les analyses du SANS Institute, la sécurisation de l'IA en 2025 exige une « approche fondée sur les risques pour les contrôles et la gouvernance de l'IA » [23].

Les compétences requises incluent :

**L'évaluation du biais algorithmique.** Comprendre les sources de biais — données d'entraînement non représentatives, variables proxy, biais de confirmation — et les méthodes de détection et d'atténuation. La recherche de Resultsense (2025) démontre que les LLM présentent des biais systématiques d'attribution basés sur la source, allant de 6 % à 24 % selon le modèle et le sujet [24]. L'architecte doit intégrer des mécanismes de test et de surveillance du biais dans les architectures.

**L'analyse d'impact des décisions algorithmiques.** Pour les systèmes IA qui prennent ou recommandent des décisions impactant des individus — approbation de crédit, tri de candidatures, diagnostic médical — l'architecte doit prévoir les mécanismes de traçabilité, d'explicabilité et de recours qui permettent à l'organisation de rendre des comptes.

**La modélisation des scénarios de défaillance.** L'architecte doit anticiper les modes de défaillance spécifiques aux systèmes IA — dérive de modèle (*model drift*), empoisonnement de données (*data poisoning*), attaques adversariales (*adversarial attacks*), fuites de contexte (*context leakage*) — et concevoir des mécanismes de résilience adaptés.

Le cadre NIST AI Risk Management Framework offre une structure en quatre fonctions — gouverner, cartographier, mesurer, gérer — que l'architecte d'entreprise peut adopter comme extension de ses pratiques de gestion des risques existantes [14]. Ce cadre traduit les principes de haut niveau — explicabilité, équité, sécurité — en activités pratiques et en niveaux de maturité.

---

#### 6.5 Le risque de l'excès de dépendance à la *GenAI* : érosion de la pensée critique et des arbitrages systémiques

##### Les données de l'érosion cognitive

L'un des paradoxes les plus aigus de la transformation des compétences de l'architecte d'entreprise à l'ère de l'IA est que l'outil même qui augmente ses capacités — l'IA générative — peut simultanément éroder les compétences cognitives qui fondent sa valeur stratégique. Ce risque n'est pas hypothétique : il est documenté par des recherches empiriques récentes.

L'étude de Microsoft Research, publiée par Lee et al. (2025) et présentée à la conférence CHI 2025 de l'ACM (*Association for Computing Machinery*), constitue l'une des analyses les plus rigoureuses de ce phénomène. Fondée sur une enquête auprès de 319 professionnels utilisant l'IA dans diverses occupations, avec 936 exemples concrets d'utilisation de l'IA générative dans des tâches professionnelles, l'étude établit deux constats fondamentaux [25] :

**Premièrement, la confiance dans l'IA générative est inversement corrélée à la pensée critique.** Les travailleurs qui expriment une confiance élevée dans les outils d'IA générative démontrent une pensée critique réduite, tandis que ceux qui maintiennent une confiance élevée en leurs propres compétences démontrent une pensée critique plus soutenue [25]. Ce résultat est particulièrement préoccupant pour les architectes d'entreprise, dont la valeur repose précisément sur leur capacité de jugement indépendant.

**Deuxièmement, l'IA générative transforme la nature de l'effort cognitif.** L'étude montre que l'utilisation de l'IA générative déplace l'effort de la collecte d'information vers la vérification d'information, de la résolution de problèmes vers l'intégration des réponses de l'IA, et de l'exécution de tâches vers la supervision de tâches [25]. Pour l'architecte d'entreprise, ce déplacement signifie que les compétences de synthèse originale et de construction d'arguments à partir de données brutes risquent de s'atrophier au profit de compétences de validation et d'édition de contenus générés.

L'étude identifie plusieurs barrières à la pensée critique lors de l'utilisation de l'IA générative : le manque de conscience de la nécessité de vérification, la motivation limitée due à la pression temporelle, et la difficulté à améliorer les réponses de l'IA dans des domaines non familiers [25]. Chacune de ces barrières est directement applicable au contexte de l'architecte d'entreprise qui utilise l'IA pour accélérer l'analyse d'architectures complexes.

##### La prédiction de Gartner : 50 % des organisations imposeront des évaluations « sans IA »

La portée de ce phénomène est telle que Gartner en a fait l'une de ses prédictions stratégiques majeures. Selon Daryl Plummer, vice-président distingué et responsable en chef de la recherche chez Gartner, « d'ici 2026, l'atrophie des compétences de pensée critique, due à l'utilisation de l'IA générative, poussera 50 % des organisations mondiales à exiger des évaluations de compétences « sans IA » (*AI-free skills assessments*) » [26]. Plummer note l'existence d'une « tension naturelle » croissante entre la volonté d'utiliser l'IA pour augmenter la productivité et la nécessité de maintenir les capacités de jugement indépendant [26].

Cette prédiction est complétée par une seconde : d'ici 2027, 75 % des processus de recrutement incluront des certifications et des tests de compétence en IA sur le lieu de travail [26]. L'architecte d'entreprise sera donc évalué à la fois sur sa capacité à utiliser l'IA et sur sa capacité à raisonner sans elle — une dualité qui exige un développement délibéré de ces deux ensembles de compétences.

L'Organisation de coopération et de développement économiques (OCDE) renforce ce diagnostic en mettant en garde contre ce qu'elle appelle le « mirage de la fausse maîtrise » (*mirage of false mastery*), où les productions impressionnantes générées par l'IA masquent le sous-développement des compétences essentielles [27]. Pour l'architecte d'entreprise, ce mirage se manifeste lorsqu'une analyse architecturale générée par l'IA est adoptée sans vérification approfondie, créant l'illusion d'une compréhension qui ne résiste pas à l'examen critique.

##### Les implications spécifiques pour l'architecte d'entreprise

Le risque d'érosion cognitive est particulièrement aigu pour l'architecte d'entreprise en raison de la nature même de ses responsabilités :

**L'arbitrage systémique.** L'architecte d'entreprise est responsable d'arbitrages complexes entre des exigences contradictoires — performance vs sécurité, ouverture vs contrôle, innovation vs stabilité, vitesse vs gouvernance. Ces arbitrages requièrent un jugement contextuel que les LLM ne peuvent pas reproduire fidèlement, car ils dépendent de la compréhension fine de la culture organisationnelle, de l'historique des décisions et des dynamiques politiques internes.

**La vision transversale.** La valeur distinctive de l'architecte d'entreprise réside dans sa capacité à percevoir les interdépendances entre les domaines de l'organisation. Un LLM peut analyser un domaine en profondeur, mais la synthèse transversale qui identifie les tensions, les synergies et les risques émergents entre les domaines reste une compétence fondamentalement humaine.

**La responsabilité de conseil.** Lorsque l'architecte d'entreprise recommande une décision d'investissement de plusieurs millions de dollars au comité de direction, il engage sa crédibilité professionnelle. La délégation non critique de cette analyse à un LLM crée un risque de réputation et de responsabilité qui dépasse le risque technique.

[Tableau 6.3 — Matrice risque/atténuation de l'érosion cognitive par la GenAI pour l'architecte d'entreprise]

| Risque identifié | Manifestation pour l'AE | Stratégie d'atténuation |
|---|---|---|
| Atrophie de la synthèse originale | Incapacité à construire un argument architectural sans l'aide d'un LLM | Exercices réguliers de rédaction et d'analyse « sans IA » |
| Érosion de la pensée critique | Adoption non vérifiée des recommandations de l'IA | Protocole systématique de vérification des sources et de contre-argumentation |
| Perte de vision systémique | Analyse par domaine sans perception des interdépendances | Revues d'architecture transversales avec pairs humains |
| Confiance excessive dans les données générées | Présentation de données non vérifiées au comité de direction | Double vérification systématique avec sources primaires |
| Homogénéisation du raisonnement | Convergence des analyses vers les mêmes conclusions génériques | Encouragement de la pensée divergente et des hypothèses contrariantes |

*Source : Synthèse des auteurs à partir de [25], [26], [27]*

##### Les contre-mesures organisationnelles

Face à ces risques, les organisations et les architectes d'entreprise doivent mettre en place des contre-mesures délibérées :

**L'alternance IA/non-IA dans les processus de décision.** Réserver certaines étapes de l'analyse architecturale — la formulation du problème, l'identification des hypothèses, la construction des critères de décision — à un travail strictement humain, en utilisant l'IA uniquement pour l'exploration de données et la génération d'alternatives.

**Les revues par les pairs (*peer reviews*) comme garde-fou.** Soumettre systématiquement les analyses produites avec l'aide de l'IA à une revue par des pairs qui évaluent non seulement les conclusions, mais aussi la rigueur du raisonnement sous-jacent.

**La formation continue à la pensée critique.** Intégrer des exercices de pensée critique — analyses de cas sans IA, débats contradictoires structurés, exercices de raisonnement par principes premiers — dans les programmes de développement professionnel des architectes.

Les recommandations de Microsoft Research vont dans le même sens : les outils d'IA devraient soutenir la pensée critique des travailleurs en fournissant « des explications de raisonnement, des critiques guidées et des références croisées » [25]. L'architecte d'entreprise doit exiger ces fonctionnalités dans les outils d'IA qu'il utilise et qu'il spécifie pour l'organisation.

---

#### 6.6 Parcours de montée en compétences : certifications, formations, communautés de pratique

##### Le paysage des certifications

Le marché des certifications pour les architectes d'entreprise connaît une transformation accélérée pour intégrer les compétences en IA. Plusieurs filières méritent l'attention de l'architecte en transition :

**TOGAF 10 et les nouvelles certifications de The Open Group.** La version 10 de TOGAF, publiée récemment, s'accompagne de trois nouvelles certifications : *TOGAF Enterprise Architecture Foundation*, *TOGAF Enterprise Architecture Practitioner* et *TOGAF Business Architecture Foundation* [28]. The Open Group a explicitement annoncé son intention de devenir « un facilitateur de confiance pour l'avenir des standards de pratique professionnelle dans le contexte des technologies alimentées par l'IA » [29]. Les architectes certifiés TOGAF bénéficient d'une prime salariale de 15 à 25 % par rapport aux non-certifiés [28].

**Les certifications IASA Global.** L'*International Association of Software Architects* (IASA Global) propose un programme de formation en architecture IA spécifiquement conçu pour les architectes informatiques. Ce programme couvre les cadres et les outils d'intelligence artificielle pour le développement d'architectures IA d'entreprise [30]. IASA Global a également établi un partenariat avec le réseau *AI, Data & Analytics Network* (ADA), créant un pont entre les communautés d'architectes d'entreprise et de professionnels de l'IA [30].

**Les certifications spécialisées en IA.** Au-delà des certifications d'architecture, l'architecte d'entreprise peut compléter son profil avec des certifications en IA proposées par les plateformes de formation en ligne — programmes *MLOps*/*LLMOps*, certifications en gouvernance de l'IA, formations spécialisées en ingénierie des requêtes. Andela, par exemple, prévoit de former 15 000 technologues d'ici 2026 à travers son académie d'IA, avec des parcours couvrant l'ingénierie LLM (RAG, ingénierie des requêtes, évaluation de modèles), l'ingénierie d'IA agentique (orchestration et utilisation d'outils) et l'IA en production (*MLOps*, déploiement, scalabilité, sécurité) [31].

**Les certifications de CIO.com.** L'analyse de CIO.com identifie 14 certifications pertinentes pour les architectes d'entreprise en 2026, combinant des certifications de cadres méthodologiques (TOGAF, Zachman), des certifications techniques (*AWS Solutions Architect*, *Azure Solutions Architect*) et des certifications en gouvernance et en sécurité [32].

[Tableau 6.4 — Cartographie des certifications pertinentes pour l'architecte stratégique IA]

| Filière de certification | Organisme | Pertinence pour l'AE stratégique IA | Durée estimée |
|---|---|---|---|
| TOGAF 10 EA Foundation + Practitioner | The Open Group | Socle méthodologique actualisé | 40-80 heures |
| IASA AI Architecture | IASA Global | Architectures IA d'entreprise | 40-60 heures |
| *AWS/Azure/GCP AI Solutions Architect* | Fournisseurs cloud | Compétences pratiques en plateformes IA | 80-120 heures |
| *MLOps/LLMOps* spécialisé | Diverses plateformes | Opérationnalisation des modèles IA | 40-80 heures |
| Gouvernance IA (ISACA, NIST) | Organismes de gouvernance | Conformité et gestion des risques IA | 20-40 heures |

*Source : Synthèse des auteurs à partir de [28], [29], [30], [32]*

##### Les formations ciblées

Au-delà des certifications formelles, des programmes de formation ciblés permettent à l'architecte d'entreprise de combler rapidement des lacunes spécifiques :

**La littératie IA accélérée.** Des programmes de 20 à 40 heures permettent d'acquérir les fondamentaux de l'apprentissage automatique, des LLM et de l'IA générative. DataCamp propose des parcours de formation en IA spécifiquement conçus pour les professionnels non techniques, avec un accent sur l'utilisation « efficace, sécuritaire et créative » de l'IA [8]. Les travailleurs possédant des compétences en IA bénéficient d'une prime salariale de 56 % par rapport à leurs pairs non qualifiés [33].

**La modélisation financière pour architectes.** Des formations spécialisées de 10 à 20 heures permettent d'acquérir les compétences en analyse coût-bénéfice, en modélisation de TCO et en calcul de ROI adaptées au contexte des investissements IA.

**L'ingénierie des requêtes avancée.** Des formations de 10 à 20 heures couvrant les techniques de chaînage de pensée, de RAG, d'orchestration d'agents et de validation systématique des productions de l'IA.

##### Les communautés de pratique

Les communautés de pratique constituent un vecteur de montée en compétences particulièrement efficace pour les architectes d'entreprise, car elles permettent l'apprentissage par les pairs, le partage d'expériences concrètes et l'accès à un réseau professionnel qualifié.

**The Open Group et l'*Association of Enterprise Architects* (AEA).** The Open Group, au-delà de ses certifications, anime une communauté mondiale d'architectes d'entreprise et a lancé des initiatives spécifiques sur l'IA, incluant le développement de standards de pratique professionnelle dans le contexte des technologies IA [29].

**IASA Global.** L'IASA anime des communautés régionales d'architectes et organise des conférences annuelles — dont la conférence annuelle IASA Japan 2025 et des événements en Asie-Pacifique — qui incluent désormais des volets dédiés à l'IA et à l'architecture [30].

**Les communautés sectorielles.** Des organisations comme *Architecture & Governance Magazine*, InfoQ et les forums spécialisés sur LinkedIn rassemblent des praticiens qui partagent des retours d'expérience sur l'intégration de l'IA dans les pratiques d'architecture d'entreprise.

**Les communautés internes.** Au sein des organisations, la création de communautés de pratique EA-IA permet de mutualiser les apprentissages, de partager les succès et les échecs, et de construire un référentiel de bonnes pratiques adapté au contexte spécifique de l'organisation.

L'étude de Calegari et al. (2025) souligne qu'en « l'absence d'investissements suffisants dans la montée en compétences, en particulier dans des domaines tels que l'ingénierie des requêtes, l'évaluation de l'IA générative et l'utilisation responsable de l'IA, les organisations risquent de ne pas réaliser les gains de productivité promis » [9]. Ce constat renforce la nécessité d'une approche structurée et soutenue de la formation, au-delà des certifications ponctuelles.

---

#### 6.7 Alliances à construire : finance, RH, juridique, innovation, *data science*

##### Pourquoi l'architecte ne peut pas agir seul

La transformation du rôle de l'architecte d'entreprise vers le conseil stratégique en IA ne peut se réaliser en isolation. L'IA touche simultanément les dimensions technologiques, financières, humaines, juridiques et innovatrices de l'organisation. L'architecte qui tente de couvrir l'ensemble de ces dimensions seul se condamne à la superficialité ou à l'épuisement. La construction d'alliances stratégiques avec les fonctions clés de l'organisation constitue donc une compétence à part entière — et un préalable à l'exercice effectif du rôle de conseiller stratégique.

Heidrick & Struggles, dans son analyse de 2025 sur la collaboration des leaders en matière d'IA, confirme que « les leaders des fonctions technologie, ressources humaines et finance sont appelés à collaborer sur l'implantation de l'IA à l'échelle de l'entreprise. Pour ce faire efficacement, ils doivent comprendre à la fois comment l'IA affectera leurs fonctions individuelles et ce que cela signifie pour les autres fonctions et pour le modèle d'affaires de l'entreprise » [34].

##### L'alliance avec la fonction finance

L'alliance avec la fonction finance est sans doute la plus critique pour la crédibilité stratégique de l'architecte d'entreprise. Comme l'a établi Gartner, l'absence de compétences en modélisation financière constitue l'une des lacunes les plus importantes des équipes d'architecture d'entreprise [3].

**Ce que l'architecte apporte à la finance :** une compréhension des capacités technologiques, une cartographie des actifs numériques, une évaluation des risques techniques et une modélisation des scénarios d'implémentation.

**Ce que la finance apporte à l'architecte :** une rigueur dans la quantification de la valeur, une crédibilité auprès du comité de direction, une méthodologie de calcul du retour sur investissement et un accès aux données financières nécessaires pour les cas d'affaires.

**Mécanismes de collaboration :** revues conjointes de cas d'affaires IA, co-construction de modèles de TCO, participation croisée aux comités d'investissement technologique, développement conjoint de tableaux de bord de valeur IA.

##### L'alliance avec les ressources humaines

L'IA transforme profondément les emplois, les compétences et les modes de travail. Selon le Forum économique mondial, 77 % des employeurs prévoient de prioriser la requalification et la montée en compétences de leur main-d'œuvre pour la collaboration avec les systèmes d'IA [1]. Cette transformation est un territoire partagé entre l'architecture d'entreprise et les ressources humaines.

**Ce que l'architecte apporte aux RH :** une compréhension de l'impact de l'IA sur les rôles et les processus, une cartographie des compétences techniques requises, une évaluation des besoins de formation liés aux nouvelles architectures.

**Ce que les RH apportent à l'architecte :** une expertise en gestion du changement, des données sur les compétences actuelles de l'organisation, des programmes de formation et de développement, et une compréhension de la dynamique humaine de l'adoption technologique.

**Mécanismes de collaboration :** co-développement de référentiels de compétences IA (dont l'Annexe B constitue un exemple), conception conjointe de parcours de formation, évaluation croisée de l'impact de l'IA sur les emplois, collaboration sur les stratégies de rétention des talents IA.

##### L'alliance avec la fonction juridique

L'entrée en vigueur progressive de l'*EU AI Act*, du *GDPR* (*General Data Protection Regulation* — Règlement général sur la protection des données) et de réglementations sectorielles crée un impératif de collaboration entre l'architecture et le juridique. L'architecte doit comprendre les exigences de conformité pour les intégrer dans les architectures dès la conception, et le juridique doit comprendre les implications techniques des obligations réglementaires.

**Ce que l'architecte apporte au juridique :** une traduction des exigences réglementaires en spécifications techniques, une évaluation de la faisabilité des contrôles de conformité, une cartographie des systèmes IA soumis à des obligations spécifiques.

**Ce que le juridique apporte à l'architecte :** une interprétation des textes réglementaires, une évaluation des risques juridiques des architectures IA, une veille réglementaire sur les évolutions à venir, et un cadre pour la gestion des litiges liés à l'IA.

**Mécanismes de collaboration :** classification conjointe des systèmes IA selon les niveaux de risque réglementaire, co-conception de politiques de gouvernance des données d'entraînement, revues juridiques des architectures IA avant déploiement.

##### L'alliance avec la fonction innovation

La fonction innovation — qu'elle prenne la forme d'un laboratoire d'innovation (*innovation lab*), d'une direction de la transformation numérique ou d'une cellule d'intrapreneuriat — est le terrain de l'expérimentation IA. L'alliance entre l'architecture et l'innovation est essentielle pour éviter le « purgatoire des pilotes » (*pilot purgatory*) décrit par McKinsey, où les expérimentations se multiplient sans jamais atteindre la production [35].

**Ce que l'architecte apporte à l'innovation :** des fondations architecturales qui permettent de passer du prototype à la production, des critères d'évaluation de la maturité des solutions, des patterns réutilisables qui accélèrent l'industrialisation.

**Ce que l'innovation apporte à l'architecte :** une veille technologique de terrain, des retours d'expérience sur les technologies émergentes, une connexion avec l'écosystème de *start-ups* et de fournisseurs, et une légitimité dans les conversations sur le futur.

##### L'alliance avec la *data science*

L'alliance avec les équipes de science des données (*data science*) est fondamentale car l'architecture des données et des modèles constitue le substrat technique de toute initiative IA. Selon McKinsey, la qualité et la disponibilité des données constituent l'obstacle principal à la mise à l'échelle de l'IA, cité par 43 % des organisations [35].

**Ce que l'architecte apporte à la *data science* :** des cadres de gouvernance des données, une architecture de données d'entreprise cohérente, des standards d'intégration et d'interopérabilité, des mécanismes de traçabilité et de lignage des données.

**Ce que la *data science* apporte à l'architecte :** une expertise dans la sélection et l'évaluation des modèles, des retours d'expérience sur les contraintes de production des modèles, une compréhension fine des exigences de données pour différents types de modèles.

Forrester identifie explicitement l'architecte d'entreprise comme un « curateur de la connaissance d'entreprise » (*enterprise knowledge curator*) qui « gouverne les couches sémantiques et forme les équipes de données en génération augmentée par la récupération (RAG) et en *GraphRAG* pour s'assurer que les productions de l'IA sont ancrées dans un contexte de confiance » [4]. Ce rôle de pont entre la gouvernance de l'architecture et l'expertise en science des données est au cœur de l'alliance à construire.

[Figure 6.3 — Carte des alliances stratégiques de l'architecte d'entreprise pour le conseil en IA]

```
                    ┌─────────────┐
                    │   COMITÉ DE  │
                    │  DIRECTION   │
                    └──────┬──────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                  │
    ┌────▼────┐     ┌──────▼──────┐    ┌─────▼─────┐
    │ FINANCE │     │ ARCHITECTE  │    │   RH      │
    │         │◄───►│ D'ENTREPRISE│◄──►│           │
    │ • TCO   │     │ STRATÉGIQUE │    │ • Change  │
    │ • ROI   │     │     IA      │    │ • Skills  │
    │ • P&L   │     │             │    │ • Talent  │
    └─────────┘     └──┬──────┬───┘    └───────────┘
                       │      │
              ┌────────▼┐    ┌▼────────────┐
              │JURIDIQUE│    │ DATA SCIENCE │
              │         │    │              │
              │• EU AI  │    │ • Modèles    │
              │  Act    │    │ • Données    │
              │• GDPR   │    │ • MLOps      │
              └────┬────┘    └──────┬───────┘
                   │                │
              ┌────▼────────────────▼────┐
              │      INNOVATION          │
              │                          │
              │ • Expérimentation        │
              │ • Veille technologique   │
              │ • Écosystème start-ups   │
              └──────────────────────────┘
```

*La carte illustre les cinq alliances stratégiques que l'architecte d'entreprise doit construire pour exercer son rôle de conseiller en IA. Chaque alliance est bidirectionnelle : l'architecte apporte et reçoit de la valeur. L'ensemble des alliances forme un réseau de compétences complémentaires qui couvre les dimensions technique, business, humaine, juridique et innovatrice de l'IA.*

##### Les principes de construction des alliances

La construction de ces alliances ne se décrète pas : elle se cultive à travers des pratiques délibérées :

**La co-création de valeur.** Chaque alliance doit être fondée sur un échange de valeur concret et mesurable — pas sur une déclaration d'intention. L'architecte qui co-développe un cas d'affaires IA avec la finance crée une alliance opérationnelle. Celui qui se contente de demander un accès aux données financières crée une relation de dépendance.

**La participation aux rituels des fonctions partenaires.** L'architecte qui assiste régulièrement aux comités d'investissement, aux revues de conformité, aux rétrospectives de projet et aux sessions de formation développe une compréhension fine des contraintes et des priorités de ses partenaires.

**La construction d'un langage commun.** Chaque fonction possède son vocabulaire, ses métriques et ses cadres de référence. L'architecte stratégique IA investit dans la compréhension de ces langages et construit des ponts terminologiques qui facilitent la communication interfonctionnelle.

Les données de la recherche confirment l'importance de cette approche collaborative. Selon les analyses du *AI Journal*, les entreprises avec une forte collaboration interdépartementale et une préparation éthique robuste obtiennent des « gains de performance liés à l'IA supérieurs de 40 % par rapport à leurs pairs » [21]. Pour Forrester, les architectes doivent « aller là où la valeur circule et faire des résultats de processus le centre de l'architecture d'entreprise » [36] — une injonction qui implique de sortir du périmètre traditionnel de l'IT pour s'ancrer dans les flux de valeur interfonctionnels.

---

#### Points clés à retenir

> **1. Le modèle de compétences de l'architecte stratégique IA est tri-dimensionnel.** Il combine des compétences techniques (littératie IA, *LLMOps*, gouvernance des modèles), des compétences business (économie de plateforme, modélisation financière, *storytelling* exécutif) et des compétences d'influence (gestion du changement, construction de coalitions). Chaque dimension est nécessaire mais insuffisante isolément.
>
> **2. Les données du marché confirment la prime de valeur des compétences IA.** Les architectes possédant des compétences en IA bénéficient d'une prime salariale de 25 à 50 % et d'une demande en hausse de 67 %. Le Forum économique mondial anticipe que 39 % des compétences fondamentales seront transformées d'ici 2030.
>
> **3. La gouvernance des modèles est le territoire naturel de l'architecte d'entreprise.** Le registre de modèles, l'évaluation des biais, la conformité réglementaire et l'explicabilité sont des extensions directes des compétences traditionnelles de l'architecte en matière de gouvernance et de conformité.
>
> **4. Le risque d'érosion cognitive par l'IA générative est documenté et significatif.** La recherche de Microsoft (CHI 2025) démontre que la confiance dans les outils d'IA est inversement corrélée à la pensée critique. Gartner prédit que 50 % des organisations imposeront des évaluations « sans IA » d'ici 2026.
>
> **5. Les alliances interfonctionnelles sont un prérequis, pas un luxe.** L'architecte stratégique IA doit construire des alliances opérationnelles avec la finance, les RH, le juridique, l'innovation et la *data science*. Les organisations avec une forte collaboration interfonctionnelle obtiennent des gains de performance IA supérieurs de 40 %.

---

#### Transition

Ce chapitre a cartographié les compétences que l'architecte d'entreprise doit acquérir pour exercer son rôle de conseiller stratégique en IA — compétences techniques, business et d'influence, complétées par une vigilance active contre l'érosion cognitive et un réseau d'alliances interfonctionnelles. L'Annexe B fournit un référentiel détaillé de ces compétences, avec des niveaux de maîtrise et des indicateurs de progression.

Mais les compétences, aussi étendues soient-elles, ne suffisent pas sans les fondations techniques qui permettent de les exercer. La Partie III du livre blanc aborde ces fondations. Le chapitre 7 examine les architectures *AI-first* — données, plateformes, composabilité, gouvernance technique — qui constituent le socle nécessaire à tout déploiement d'IA à l'échelle de l'organisation. Si le présent chapitre a répondu à la question « Que doit savoir l'architecte? », le chapitre 7 répond à la question « Que doit construire l'architecte? ». La transition entre la transformation du profil (Partie II) et la construction des fondations (Partie III) marque le passage de la réflexion stratégique à l'exécution technique — un passage que seul un architecte d'entreprise doté des compétences décrites dans ce chapitre peut orchestrer avec la rigueur et la vision transversale requises.

---

#### Références

[1] World Economic Forum, « Future of Jobs Report 2025 », janvier 2025. Disponible : https://www.weforum.org/publications/the-future-of-jobs-report-2025/

[2] Research.com, « 2026 Enterprise Architect Careers: Skills, Education, Salary & Job Outlook », 2026. Disponible : https://research.com/advice/enterprise-architect-careers-skills-education-salary-job-outlook

[3] Gartner, « 3 Trends Driving Enterprise Architecture Strategy in 2025 », 2025. Disponible : https://www.gartner.com/en/articles/2025-trends-for-enterprise-architecture

[4] Forrester, « How Agentic AI Elevates The Enterprise Architect's Role », 2025. Disponible : https://www.forrester.com/blogs/the-future-of-the-enterprise-architects-job/

[5] A. Gupta, « Enterprise Architecture as a Dynamic Capability for Scalable and Sustainable Generative AI Adoption: Bridging Innovation and Governance in Large Organisations », arXiv:2505.06326, mai 2025. Disponible : https://arxiv.org/abs/2505.06326

[6] Research.com, « 2026 Enterprise Architect Careers: Skills, Education, Salary & Job Outlook », 2026. Disponible : https://research.com/advice/enterprise-architect-careers-skills-education-salary-job-outlook

[7] Robert Half, « AI Architect Salary (Updated for 2026) », 2026. Disponible : https://www.roberthalf.com/us/en/job-details/ai-architect

[8] DataCamp, « AI Upskilling Across the Enterprise », 2025. Disponible : https://www.datacamp.com/business/ai-upskilling

[9] R. Calegari et al., « Impact and Implications of Generative AI for Enterprise Architects in Agile Environments: A Systematic Literature Review », arXiv:2510.22003, octobre 2025. Disponible : https://arxiv.org/abs/2510.22003

[10] Architecture & Governance Magazine, « The Next Frontier of Enterprise AI Architecture: How Open-Source LLMs and Prompt Engineering Drive Strategic Advantage », 2025. Disponible : https://www.architectureandgovernance.com/artificial-intelligence/the-next-frontier-of-enterprise-ai-architecture-how-open-source-llms-and-prompt-engineering-drive-strategic-advantage/

[11] Dextra Labs, « Prompt Engineering for LLMs | Best Technical Guide in 2025 », 2025. Disponible : https://dextralabs.com/blog/prompt-engineering-for-llm/

[12] SaM Solutions, « Enterprise LLM Architecture: Designing for Scale and Security », 2025. Disponible : https://sam-solutions.com/blog/enterprise-llm-architecture/

[13] S. Panda, « The Complete MLOps/LLMOps Roadmap for 2026: Building Production-Grade AI Systems », Medium, janvier 2026. Disponible : https://medium.com/@sanjeebmeister/the-complete-mlops-llmops-roadmap-for-2026-building-production-grade-ai-systems-bdcca5ed2771

[14] NIST, « AI Risk Management Framework ». Disponible : https://databrackets.com/blog/understanding-the-nist-ai-risk-management-framework/

[15] VodWorks, « AI Compliance in 2025: Global Regulations, Risks & Best Practices », 2025. Disponible : https://vodworks.com/blogs/ai-compliance/

[16] McKinsey / Autodesk, « Why All Roads of Industry Lead to a Platform Economy », 2025. Disponible : https://www.autodesk.com/design-make/articles/platform-economy

[17] Platform Executive, « Platform Ecosystem and Marketplace Dynamics (2025-2030) », 2025. Disponible : https://www.platformexecutive.com/insight/technology-research/platform-ecosystem-and-marketplace/

[18] PwC, « Global CEO Survey 2026 », janvier 2026.

[19] Forrester, « AI Predictions 2026 », 2025-2026.

[20] Gartner / MIT Sloan Management Review, « The Enduring Power of Data Storytelling in the Generative AI Era », 2025. Disponible : https://sloanreview.mit.edu/article/the-enduring-power-of-data-storytelling-in-the-generative-ai-era/

[21] McKinsey, « AI in the Workplace: A Report for 2025 », 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/superagency-in-the-workplace-empowering-people-to-unlock-ais-full-potential-at-work

[22] Salesforce, « The Agentic Enterprise — The IT Architecture for the AI-Powered Future », 2025. Disponible : https://architect.salesforce.com/fundamentals/agentic-enterprise-it-architecture

[23] SANS Institute, « Securing AI in 2025: A Risk-Based Approach to AI Controls and Governance », 2025. Disponible : https://www.sans.org/blog/securing-ai-in-2025-a-risk-based-approach-to-ai-controls-and-governance

[24] Resultsense, « AI Attribution Bias: Enterprise Deployment Implications », novembre 2025. Disponible : https://www.resultsense.com/insights/2025-11-12-llm-source-attribution-bias-systematic-framing-effects

[25] M. Lee et al., « The Impact of Generative AI on Critical Thinking: Self-Reported Reductions in Cognitive Effort and Confidence Effects From a Survey of Knowledge Workers », Proceedings of CHI 2025, ACM, 2025. Disponible : https://dl.acm.org/doi/full/10.1145/3706598.3713778

[26] Gartner, « Top Predictions for IT Organizations and Users in 2026 and Beyond », Gartner IT Symposium/Xpo 2025, octobre 2025. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-10-21-gartner-unveils-top-predictions-for-it-organizations-and-users-in-2026-and-beyond

[27] OCDE, « Warning over Uncritical AI Use in Education », janvier 2026. Disponible : https://www.rte.ie/news/education/2026/0119/1553973-ai-education/

[28] The Open Group, « TOGAF Certification Portfolio », 2025. Disponible : https://www.opengroup.org/certifications/togaf-certification-portfolio

[29] The Open Group, « AI Initiatives », 2025. Disponible : https://www.opengroup.org/architecture-form/ai-initiatives

[30] IASA Global, « IASA Architect AI Architecture Training Program », 2025. Disponible : https://www.iasaglobal.org/

[31] AI Journal, « Andela Scales AI Academy to Support Enterprise Upskilling and AI-Fluent Talent Pipelines », 2025. Disponible : https://aijourn.com/andela-scales-ai-academy-to-support-enterprise-upskilling-and-ai-fluent-talent-pipelines/

[32] CIO.com, « Top 14 Certifications for Enterprise Architects », 2026. Disponible : https://www.cio.com/article/222483/12-certifications-for-enterprise-architects.html

[33] BeingGuru, « Your Business Will Lose Millions by 2026 If You Make These AI-Era Skills Mistakes », 2025. Disponible : https://www.beingguru.com/upskilling-future-workforce/

[34] Heidrick & Struggles, « AI and Leadership: How Finance, HR, and Technology Leaders Are Collaborating to Make the Most of AI Across the Enterprise », 2025. Disponible : https://www.heidrick.com/en/insights/digital-leadership/ai-and-leadership_how-finance-hr-technology-leaders-collaborate

[35] McKinsey, « The State of AI in 2025 », 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/

[36] Forrester, « Architects Must Go Where Value Flows and Make Process Outcomes the Center of EA », 2025. Disponible : https://www.forrester.com/blogs/architects-must-go-where-value-flows-and-make-process-outcomes-the-center-of-ea/
