### Chapitre 2 — L'IA comme force de rupture architecturale

<!-- Rôle argumentatif (PRD §3) : L'IA amplifie le fossé en bouleversant les fondations architecturales existantes. -->

#### Introduction

Le chapitre 1 a établi un constat mesurable : un fossé de confiance sépare les dirigeants qui attendent une croissance portée par l'intelligence artificielle et les responsables technologiques qui mesurent quotidiennement la complexité de cette promesse. Plus de 80 % des PDG anticipent une contribution de l'IA à la croissance de leur chiffre d'affaires, alors que seulement 3 % des directeurs des systèmes d'information partagent cette perspective [1]. Ce décalage ne relève pas d'un simple malentendu de communication. Il trouve son origine dans une réalité technique que ce second chapitre se propose d'examiner : les architectures d'entreprise existantes n'ont pas été conçues pour supporter les exigences de l'intelligence artificielle à l'échelle de la production.

L'IA ne se contente pas de s'ajouter aux systèmes existants comme une couche logicielle supplémentaire. Elle impose des transformations profondes dans la façon dont les données circulent, dont les services s'intègrent, dont la sécurité se gouverne et dont les décisions se prennent en temps réel. Lorsqu'une organisation tente de passer d'un prototype d'IA (*proof of concept*, PoC) à un déploiement en production, elle se heurte à des insuffisances structurelles que ni l'investissement financier ni la bonne volonté organisationnelle ne suffisent à résoudre. Les recherches du Massachusetts Institute of Technology (MIT) indiquent que 95 % des programmes pilotes en IA générative ne parviennent pas à démontrer un impact mesurable sur les résultats financiers [2]. Ce taux d'échec ne reflète pas une défaillance de la technologie elle-même, mais une inadéquation fondamentale entre les fondations architecturales héritées et les contraintes opérationnelles de l'IA déployée à l'échelle.

Ce chapitre analyse les dimensions de cette rupture architecturale — du changement d'échelle entre pilote et production jusqu'aux exigences nouvelles de l'IA générative, de l'IA agentique, de la dette technique amplifiée et de la composabilité. L'objectif est de démontrer, données à l'appui, que l'architecture d'entreprise n'est pas un détail d'implémentation mais le facteur déterminant qui sépare les organisations capables de concrétiser leur stratégie IA de celles qui accumulent les prototypes sans résultat.

---

#### 2.1 De l'IA pilote à l'IA en production : un changement d'échelle que les architectures existantes ne supportent pas

##### Le mirage du prototype réussi

La trajectoire typique d'une initiative IA en entreprise suit un schéma désormais bien documenté. Une équipe de science des données développe un modèle prédictif ou génératif dans un environnement contrôlé — données nettoyées, infrastructure dédiée, périmètre limité. Les résultats sont prometteurs : le modèle atteint des métriques de précision satisfaisantes, les parties prenantes expriment leur enthousiasme, et la direction autorise le passage à l'échelle. C'est alors que le parcours se complique de manière systématique.

Selon l'enquête mondiale de McKinsey sur l'état de l'IA en 2025, la majorité des organisations demeurent aux stades de l'expérimentation ou du pilotage. Environ un tiers seulement déclarent avoir commencé à mettre à l'échelle leurs programmes d'IA [3]. Cette proportion stagne malgré l'augmentation continue des investissements. Les dépenses mondiales en infrastructure IA ont connu une hausse de 166 % en glissement annuel au deuxième trimestre de 2025, atteignant 82 milliards de dollars américains [4]. Pourtant, seuls 20 % des entreprises ont rapporté des bénéfices financiers attribuables à l'IA en 2024 [4]. Ce décalage entre investissement et rendement constitue le symptôme le plus visible d'un problème architectural profond.

Les données d'IDC confirment l'ampleur du phénomène : sur l'ensemble des prototypes d'IA observés, 88 % n'atteignent jamais le stade du déploiement à grande échelle. Pour 33 PoC lancés par une entreprise typique, seuls quatre franchissent le seuil de la production [5]. Cette statistique révèle un ratio de conversion d'environ 12 %, ce qui signifie que près de neuf prototypes sur dix représentent un investissement sans retour mesurable. Gartner estime qu'en moyenne, seuls 48 % des projets d'IA parviennent en production, et que le délai moyen entre le prototype et la production est de huit mois [6].

##### Les dimensions du changement d'échelle

Le passage du pilote à la production n'est pas une opération linéaire. Il implique des transformations qualitatives dans au moins cinq dimensions architecturales :

**La dimension des données.** Un prototype fonctionne avec un jeu de données statique et préparé manuellement. La production exige des pipelines de données (*data pipelines*) en temps réel, des mécanismes de validation de la qualité des données, une gestion du versionnement des jeux d'entraînement et une conformité aux réglementations sur la protection des données. Selon McKinsey, la qualité et la disponibilité des données constituent l'obstacle principal à la mise à l'échelle, cité par 43 % des organisations [3].

**La dimension de l'infrastructure.** Un modèle entraîné sur une machine dédiée avec un processeur graphique (*GPU*) doit, en production, être déployé sur une infrastructure capable de gérer des centaines de milliers de requêtes simultanées, avec des temps de latence prévisibles et une disponibilité continue. Les serveurs équipés d'accélérateurs représentent désormais 91,8 % des dépenses totales en infrastructure serveur pour l'IA [4].

**La dimension de l'intégration.** Le prototype fonctionne en isolation. La production exige l'intégration avec les systèmes existants — progiciels de gestion intégrée (*Enterprise Resource Planning*, ERP), systèmes de gestion de la relation client (*Customer Relationship Management*, CRM), entrepôts de données, couches d'orchestration. Chaque point d'intégration introduit de la complexité, de la latence et des risques de défaillance.

**La dimension de la gouvernance.** Le prototype n'a pas besoin de traçabilité des décisions, de mécanismes d'audit, de gestion des biais ou de conformité réglementaire. La production l'exige de manière non négociable, particulièrement dans les secteurs réglementés comme la finance et la santé.

**La dimension opérationnelle.** Le prototype ne nécessite pas de surveillance continue, de gestion de la dérive des modèles (*model drift*), de procédures de retour en arrière (*rollback*) ou de planification de capacité. La production requiert un cadre opérationnel complet que les pratiques *MLOps* (*Machine Learning Operations*) tentent de formaliser, mais qui dépasse largement les capacités des équipes de science des données isolées.

[Figure 2.1 — Carte des dimensions du changement d'échelle entre PoC et production IA. Cinq axes sont représentés : données, infrastructure, intégration, gouvernance, opérations. Chaque axe illustre le saut qualitatif entre les exigences du prototype (faibles) et celles de la production (élevées). Le delta entre les deux états représente le « fossé architectural » que les organisations doivent combler.]

##### L'expérience Kroger : de l'atelier artisanal à l'usine IA

L'étude de cas de la société 84.51°, filiale analytique du distributeur Kroger, illustre concrètement ce changement d'échelle. Leur système de *Dynamic Batching* (traitement par lots dynamique) pour l'exécution des commandes en magasin traite 200 000 décisions par seconde dans près de 2 500 magasins, avec une réduction de 10 % des distances parcourues [7]. Le point significatif n'est pas la performance du modèle — c'est l'architecture sous-jacente. Lorsque Kroger a développé son second système, VROOM (*Vehicle Routing and Order Optimization Model*), le temps de développement a été réduit de 50 % (3 à 4,5 mois contre 6 à 9 mois) grâce à la réutilisation des composants architecturaux du premier système [7]. Cette réduction de 50 % du délai de mise en marché n'est pas le fruit d'une amélioration algorithmique : elle résulte d'une architecture modulaire conçue pour la réutilisation dès l'origine.

Le VROOM a livré une réduction de 8 % des distances parcourues, et ses bénéfices se sont étendus au-delà de l'efficience opérationnelle vers la flexibilité de la chaîne d'approvisionnement et la réduction de l'empreinte carbone [7]. L'organisation de Kristin Foster, qui dirige plus de 250 spécialistes des données chez 84.51°, a formalisé cette approche autour de cinq piliers de transformation : la conception modulaire, la reconnaissance de patrons, la mise à l'échelle efficiente, les opérations standardisées et la narration par les plans (*blueprint storytelling*) — cette dernière utilisant les succès antérieurs pour accélérer l'approbation de nouveaux pilotes par les partenaires métier [7].

Ce cas démontre un principe fondamental : la valeur à long terme ne réside pas dans le modèle d'IA individuel, mais dans l'architecture qui permet de déployer, d'opérer et de réutiliser des capacités IA de manière systématique. Les organisations qui traitent chaque initiative IA comme un projet isolé reproduisent indéfiniment le coût et le délai du premier prototype.

---

#### 2.2 Le fossé PoC-Production : pourquoi 95 % des implémentations IA échouent et le rôle de l'architecture dans cet échec

##### Les données du fossé

Le rapport « GenAI Divide: State of AI in Business 2025 » du MIT constitue l'une des analyses les plus rigoureuses du fossé entre prototype et production. Fondé sur 150 entretiens avec des dirigeants, un sondage auprès de 350 employés et l'analyse de 300 déploiements publics d'IA, le rapport conclut que 95 % des programmes pilotes en IA générative ne parviennent pas à générer une accélération mesurable des revenus [2]. Parmi les organisations ayant évalué des systèmes d'IA de qualité entreprise, 60 % ont procédé à une évaluation, mais seulement 20 % ont atteint le stade de pilote, et à peine 5 % ont atteint la production [2].

Ces données convergent avec d'autres sources. Gartner prévoit que 30 % des projets d'IA générative seront abandonnés après le stade de validation de concept d'ici la fin de 2025, principalement en raison de la mauvaise qualité des données, de l'escalade des coûts et de la valeur commerciale incertaine [6]. En parallèle, 42 % des entreprises ont abandonné la majorité de leurs initiatives IA en 2025, contre 17 % en 2024 [6] — une tendance qui signale non pas un désenchantement technologique mais un échec systémique de mise en œuvre.

Le *Remote Labor Index* (indice du travail à distance) de 2026 apporte une perspective complémentaire sur la maturité réelle des systèmes IA. Sur 240 emplois réels provenant de la plateforme Upwork, avec une valeur moyenne d'environ 630 dollars américains par tâche, le modèle Claude Opus 4.5, le plus performant, n'a atteint qu'un taux de succès de 3,75 %, tandis que GPT-5.3 Codex a obtenu 2,80 % et Gemini 2.0 Ultra 1,25 % [8]. Les catégories de défaillance identifiées — corruption de fichiers, travail incomplet, qualité insuffisante, incohérences internes — relèvent toutes de problèmes d'intégration et de mise en production, et non de capacités algorithmiques. L'étude note que « même lorsque les agents produisent un livrable complet, la qualité du travail est fréquemment insuffisante et ne répond pas aux standards professionnels » [8]. En revanche, la collaboration humain-IA a démontré des gains de productivité allant jusqu'à 70 % par rapport à l'IA fonctionnant de manière autonome [8], ce qui confirme que l'architecture d'intégration — et non la capacité brute du modèle — constitue le facteur déterminant de la valeur produite.

##### Les causes architecturales de l'échec

Le rapport MIT identifie plusieurs causes racines qui sont, dans leur essence, des défaillances architecturales :

**Des flux de travail fragiles.** Les systèmes IA déployés ne s'intègrent pas de manière fiable dans les processus opérationnels existants. Ils fonctionnent comme des îlots technologiques déconnectés du flux de travail quotidien des utilisateurs [2].

**L'absence d'apprentissage contextuel.** Les systèmes d'entreprise ne s'adaptent pas, ne retiennent pas les rétroactions et ne s'intègrent pas dans les processus métier. Ils deviennent des « projets scientifiques » statiques plutôt que des systèmes évolutifs [2]. Ce défaut pointe directement vers une absence de boucles de rétroaction (*feedback loops*) dans l'architecture.

**Le désalignement opérationnel.** Les solutions IA ne sont pas conçues en alignement avec les opérations quotidiennes. L'architecture ne prévoit pas les interfaces nécessaires entre le système IA et les systèmes de gestion existants.

**Le fossé de construction interne.** Le rapport MIT note que les achats de solutions auprès de fournisseurs spécialisés et la construction de partenariats réussissent environ 67 % du temps, tandis que les constructions internes ne réussissent qu'un tiers aussi souvent [2]. Cette observation suggère que la maturité architecturale des fournisseurs spécialisés — qui ont résolu les problèmes d'intégration, de mise à l'échelle et d'opérationnalisation — constitue un avantage déterminant.

McKinsey confirme ce diagnostic en identifiant le phénomène de « purgatoire des pilotes » (*pilot purgatory*) : l'expérimentation avec l'IA a engendré une prolifération de cas d'usage et d'expériences qui ne sont pas soutenus par les processus de bout en bout, les données, les personnes et les technologies nécessaires à la mise à l'échelle [3]. Seuls environ 40 % des entreprises rapportent un impact au niveau du bénéfice avant intérêts et impôts (*EBIT*) de leurs initiatives IA [3].

[Tableau 2.1 — Synthèse des taux d'échec IA selon les principales sources de recherche (2024-2026). Colonnes : Source | Métrique mesurée | Taux d'échec/abandon | Échantillon | Année. Lignes : MIT GenAI Divide | Pilotes sans impact P&L mesurable | 95 % | 300 déploiements | 2025 ; IDC | PoC n'atteignant pas le déploiement | 88 % | Enquête mondiale | 2025 ; Gartner | Projets GenAI abandonnés après PoC | 30 % | Enquête mondiale | 2025 ; Enquête sectorielle | Entreprises ayant abandonné la majorité des initiatives IA | 42 % (vs 17 % en 2024) | Panel d'entreprises | 2025 ; Remote Labor Index | Taux d'échec des livrables IA professionnels | 96,25 % | 240 emplois Upwork | 2026 ; McKinsey | Organisations sans impact EBIT de l'IA | 60 % | Enquête mondiale | 2025.]

##### L'architecture comme variable explicative

L'analyse croisée de ces sources permet d'identifier un schéma récurrent : les causes d'échec ne sont pas algorithmiques mais architecturales. La qualité des données (43 %), le manque de maturité technique (43 %) et la pénurie de compétences (35 %) constituent les trois principaux obstacles cités par les organisations [6]. Chacun de ces facteurs relève directement du domaine de l'architecture d'entreprise : l'architecture des données, l'architecture technique et la gouvernance des compétences sont des préoccupations centrales de la discipline.

L'article scientifique de Gupta (2025) publié sur arXiv formalise cette observation en proposant que la gestion de l'architecture d'entreprise (*Enterprise Architecture Management*, EAM), conceptualisée à travers les capacités dynamiques (détection, saisie, transformation), peut améliorer l'adoption de l'IA générative en renforçant l'alignement stratégique, les cadres de gouvernance et l'agilité organisationnelle [9]. L'étude, fondée sur 16 entretiens semi-structurés avec des experts industriels et une revue systématique de la littérature utilisant la méthodologie Gioia, conclut que les cadres d'architecture d'entreprise existants présentent des limites significatives pour répondre aux exigences spécifiques de l'IA générative [9]. La maturité faible en gouvernance des données, la tension entre la vélocité d'innovation et les exigences de conformité, et les écarts de préparation organisationnelle sont identifiés comme les obstacles principaux.

---

#### 2.3 L'IA générative et les LLM : nouvelles exigences sur les couches données, intégration et sécurité

##### Un changement de paradigme architectural

L'émergence des grands modèles de langage (*Large Language Models*, LLM) et de l'IA générative (*Generative AI*, GenAI) a introduit des exigences architecturales sans précédent dans l'histoire des systèmes d'information d'entreprise. Contrairement aux systèmes d'IA traditionnels — fondés sur des modèles d'apprentissage automatique (*machine learning*) entraînés sur des données structurées et déployés dans des contextes définis — les LLM opèrent sur des données non structurées, génèrent du contenu nouveau et interagissent avec les utilisateurs de manière conversationnelle. Ce changement de nature impose des transformations dans trois couches architecturales fondamentales : les données, l'intégration et la sécurité.

##### La couche données : de l'entrepôt au tissu de données

Les architectures de données traditionnelles, organisées autour d'entrepôts de données (*data warehouses*) et de lacs de données (*data lakes*), ne répondent pas aux besoins des LLM. Trois exigences nouvelles se manifestent :

**La gestion des données non structurées à grande échelle.** Les LLM consomment et produisent des volumes considérables de texte, d'images, de code et de données multimodales. Les architectures de données doivent évoluer vers des modèles de tissu de données (*data fabric*) ou de maillage de données (*data mesh*) capables de fédérer des sources hétérogènes. Gartner prévoit que d'ici 2026, plus de 60 % des entreprises orientées données adopteront une approche hybride combinant tissu de données et maillage de données pour une efficience optimale [10]. Les organisations utilisant l'automatisation pilotée par les métadonnées — une caractéristique centrale du tissu de données — constatent une livraison des données 30 % plus rapide que les systèmes patrimoniaux, tandis que celles ayant implémenté le maillage de données rapportent une amélioration de 50 % de la collaboration et du délai d'obtention des analyses [10]. La conversation sectorielle a évolué : en 2025, la question n'est plus « Quel modèle est le meilleur ? » mais « Comment intégrer les LLM de manière fiable avec des connaissances actualisées, une efficience des coûts et une sécurité adéquate ? » [11].

**La génération augmentée par la récupération (*Retrieval-Augmented Generation*, RAG).** Pour ancrer les réponses des LLM dans les données propriétaires de l'organisation, les architectures RAG sont devenues une pratique de référence. Elles introduisent cependant une complexité architecturale significative : bases de données vectorielles (*vector databases*), pipelines d'indexation sémantique (*embedding pipelines*), mécanismes de découpage et de chevauchement de documents (*chunking*), et gestion du cycle de vie des index. L'OWASP identifie les faiblesses des vecteurs et des plongements (*vector and embedding weaknesses*) comme l'un des dix principaux risques de sécurité des applications LLM en 2025, notant que « les vulnérabilités dans la génération, le stockage ou la récupération [des vecteurs] peuvent être exploitées pour injecter du contenu nuisible, altérer les sorties du modèle ou obtenir un accès non autorisé à des données sensibles » [12].

**La gouvernance des données d'entraînement et d'inférence.** La distinction entre données d'entraînement, données de réglage fin (*fine-tuning*) et données de contexte (*prompt context*) impose une traçabilité que les architectures de données traditionnelles ne gèrent pas. Gartner prévoit que d'ici 2027, plus de 40 % des violations de données liées à l'IA proviendront d'une utilisation inappropriée de l'IA générative à travers les frontières organisationnelles [11]. D'ici 2026, les deux tiers des entreprises investiront dans des initiatives d'observabilité automatisée des données pour détecter, résoudre et prévenir les problèmes de fiabilité des données [10] — un prérequis fondamental pour toute architecture IA de production.

##### La couche intégration : de l'interface ponctuelle à l'orchestration

L'intégration des LLM dans le système d'information de l'entreprise dépasse de loin l'appel à une interface de programmation d'applications (*Application Programming Interface*, API) externe. Elle requiert :

**Une couche d'orchestration.** Les applications fondées sur les LLM nécessitent des chaînes de traitement complexes : enrichissement du contexte, appel au modèle, post-traitement de la réponse, validation, journalisation. Cette orchestration doit être standardisée à l'échelle de l'entreprise pour éviter la prolifération d'intégrations artisanales.

**La gestion du contexte.** Chaque interaction avec un LLM s'inscrit dans un contexte organisationnel — permissions de l'utilisateur, données auxquelles il a droit d'accéder, historique de la conversation, règles métier applicables. L'architecture doit maintenir ce contexte de manière cohérente à travers les appels successifs.

**L'interopérabilité multi-modèles.** Les organisations utilisent de plus en plus plusieurs fournisseurs de modèles de langage simultanément. L'architecture doit permettre le routage intelligent des requêtes vers le modèle le plus approprié, la gestion des coûts par modèle et le remplacement d'un fournisseur sans impact sur les applications consommatrices. Plus de 85 % des organisations utilisent désormais une forme d'IA — gérée ou auto-hébergée — dans leurs environnements infonuagiques (*cloud*), et les services d'IA gérés sont utilisés par 74 % des organisations, contre 70 % l'année précédente [11].

##### La couche sécurité : un paradigme inédit

Les LLM introduisent des vecteurs d'attaque qui n'existent dans aucune autre catégorie de systèmes d'information. L'OWASP a publié en 2025 une mise à jour de son référentiel des dix principaux risques pour les applications LLM, qui constitue désormais le cadre de référence en matière de sécurité architecturale pour l'IA générative [12] :

1. **L'injection de requêtes (*prompt injection*).** Maintenue au premier rang, cette vulnérabilité permet à un attaquant de manipuler le comportement du LLM par des entrées malveillantes, pouvant mener à des accès non autorisés, des violations de données et des décisions compromises [12].

2. **La divulgation d'informations sensibles.** Un LLM peut révéler des informations confidentielles dans ses réponses. L'architecture doit inclure des mécanismes de filtrage des sorties et de classification de la sensibilité des données.

3. **La fuite des requêtes système (*system prompt leakage*).** La mise à jour 2025 de l'OWASP met en évidence ce risque émergent : les attaquants peuvent extraire les requêtes système et les utiliser pour manipuler les modèles vers des comportements non sécuritaires [12]. Ce vecteur impose une architecture de protection des configurations des modèles qui n'avait pas d'équivalent dans les systèmes traditionnels.

4. **Les vulnérabilités de la chaîne d'approvisionnement.** Les modèles pré-entraînés, les jeux de données et les extensions (*plugins*) provenant de tiers introduisent des risques de compromission.

5. **L'empoisonnement des données et des modèles.** Des données d'entraînement altérées peuvent compromettre le comportement du modèle de manière insidieuse.

6. **L'agentivité excessive (*excessive agency*).** Avec la montée des architectures agentiques, les LLM disposant de permissions non contrôlées représentent un risque croissant.

Le phénomène de l'IA fantôme (*Shadow AI*) aggrave ces risques. Des études estiment qu'un prompt sur douze soumis par les employés à des modèles publics contient des informations confidentielles [11]. Les risques liés aux LLM recoupent directement les obligations de conformité existantes : les problèmes de divulgation de données s'articulent avec le Règlement général sur la protection des données (RGPD), la loi HIPAA et les réglementations sectorielles, tandis que les risques systémiques plus larges s'alignent avec le Règlement européen sur l'intelligence artificielle (*EU AI Act*), le cadre de gestion des risques IA du NIST (*NIST AI RMF*) et les normes ISO [13]. L'architecture d'entreprise doit répondre à ce défi en intégrant des contrôles de sécurité directement dans la couche d'orchestration, plutôt qu'en les superposant après coup.

---

#### 2.4 L'IA agentique : architectures autonomes, boucles de rétroaction et gouvernance en temps réel

##### L'émergence d'un nouveau paradigme

L'IA agentique (*agentic AI*) représente le prochain saut de complexité architecturale. Contrairement aux systèmes d'IA traditionnels qui produisent une réponse à une requête, les agents IA sont des systèmes autonomes capables de planifier, d'exécuter des actions, d'observer les résultats et d'ajuster leur comportement en fonction des rétroactions. Gartner prévoit que 40 % des applications d'entreprise intégreront des agents IA spécialisés d'ici la fin de 2026, contre moins de 5 % en 2025 [14]. D'ici 2029, 70 % des entreprises déploieront l'IA agentique dans le cadre de leurs opérations d'infrastructure informatique, contre moins de 5 % en 2025 [14]. Le scénario le plus optimiste de Gartner projette que l'IA agentique pourrait représenter environ 30 % du chiffre d'affaires des logiciels d'application d'entreprise d'ici 2035, dépassant 450 milliards de dollars [14].

L'expérience rapportée par un directeur des technologies dans CIO.com illustre la vitesse de cette prolifération : une organisation est passée « d'une poignée d'agents pilotes à près de 2 000 instances d'agents IA couvrant plus de 40 types d'agents » [15]. Les tests en laboratoire ont montré des améliorations de productivité allant jusqu'à 90 %, tandis que les résultats en production, après prise en compte des courbes d'apprentissage, démontrent une amélioration d'environ 30 % [15]. L'écart entre le potentiel théorique (90 %) et le rendement réel (30 %) constitue en lui-même une illustration du fossé architectural : c'est l'infrastructure d'intégration, de gouvernance et d'opérations — et non la capacité de l'agent — qui détermine la valeur effectivement captée.

##### Les exigences architecturales de l'IA agentique

Le cadre de référence architecturale pour l'IA agentique publié par InfoQ en 2025 propose un modèle de progression en trois niveaux [16] :

**Le niveau fondation** établit une intelligence contrôlée à travers l'orchestration des outils, la transparence du raisonnement et la gouvernance des données. À ce niveau, les agents exécutent des tâches définies avec une supervision humaine directe. Ce niveau comprend trois piliers : l'orchestration des outils avec sécurité d'entreprise, la transparence du raisonnement avec évaluation continue, et la gouvernance du cycle de vie des données avec garde-fous éthiques [16].

**Le niveau flux de travail** implémente une autonomie structurée dans des zones contraintes. Cinq patrons d'orchestration sont identifiés comme essentiels [16] :
- *Prompt Chaining* (chaînage de requêtes) : séquences multi-étapes avec des portes de validation.
- *Routing* (routage) : classification des entrées avec des seuils de confiance et des critères d'équité.
- *Parallelization* (parallélisation) : traitement simultané de sous-tâches indépendantes.
- *Evaluator-Optimizer* (évaluateur-optimiseur) : raffinement itératif avec boucles d'autocorrection.
- *Orchestrator-Workers* (orchestrateur-travailleurs) : planification dynamique avec répartition de la charge.

**Le niveau autonome** active une intelligence dynamique avec planification dirigée par des objectifs, apprentissage adaptatif avec prévention des biais, et collaboration multi-agents avec résolution de conflits. Ce niveau exige une approbation réglementaire et une surveillance de sécurité complète [16].

Le cadre InfoQ souligne que « les organisations qui privilégient les fondations de gouvernance surpassent systématiquement celles qui poursuivent les capacités autonomes en premier » [16]. Cette observation constitue un argument central en faveur d'une approche architecturale progressive plutôt que d'un déploiement agentique précipité.

##### La gouvernance en temps réel : une exigence sans précédent

La gouvernance des systèmes agentiques diffère fondamentalement de la gouvernance des systèmes traditionnels. Un système conventionnel prend des décisions selon des règles prédéfinies et auditables a posteriori. Un agent IA prend des décisions en temps réel, sur la base de raisonnements probabilistes, dans des contextes variés et potentiellement imprévus. Cette réalité impose :

**Des architectures d'autonomie bornée (*bounded autonomy*).** Les organisations avancées mettent en œuvre des limites opérationnelles explicites, des chemins d'escalade vers les humains pour les décisions à fort enjeu, et des pistes d'audit exhaustives des actions des agents [17]. Les approches les plus sophistiquées incluent le déploiement d'« agents de gouvernance » qui surveillent d'autres systèmes IA pour détecter les violations de politiques, et d'« agents de sécurité » qui identifient les comportements anomaux des agents [17]. Le rôle humain évolue : au lieu de soutenir les décisions humaines, les systèmes agentiques sont de plus en plus chargés de prendre des décisions au sein de limites bien définies, tandis que les humains se concentrent sur la supervision, la gestion des exceptions et la direction stratégique [17].

**Des boucles de rétroaction intégrées.** Contrairement à un système transactionnel classique, un agent IA nécessite des mécanismes architecturaux permettant de capturer les résultats de ses actions, de les évaluer par rapport aux objectifs fixés et d'ajuster son comportement futur. L'architecture doit prévoir des circuits de rétroaction à plusieurs échelles temporelles : rétroaction immédiate (validation de chaque action), rétroaction à court terme (évaluation des séquences d'actions) et rétroaction à long terme (évolution des politiques de l'agent).

**La traçabilité décisionnelle.** L'article d'InfoQ souligne que « dans tous les secteurs d'activité, l'explicabilité surpasse systématiquement la performance brute pour déterminer le succès du déploiement » [16]. Pour les services financiers, cela implique des tests de biais, une vérification de l'équité et des points de contrôle humains. Pour la santé, le respect des normes relatives aux renseignements personnels sur la santé (*Protected Health Information*, PHI) et au standard *Fast Healthcare Interoperability Resources* (FHIR) est requis. Pour le commerce de détail, la vérification de l'équité démographique à travers les systèmes de personnalisation est nécessaire. Pour la fabrication, l'intégration de la sécurité entre les technologies opérationnelles et les technologies de l'information, accompagnée d'une évaluation de l'impact sur la main-d'œuvre, constitue un prérequis [16].

**La plateforme comme socle.** L'argument central de l'article de CIO.com est que le succès de l'IA agentique dépend moins du déploiement d'agents individuels que de « la construction (ou l'adoption) d'une plateforme qui standardise la manière dont les agents sont composés, gouvernés et font évoluer » [15]. Les composants standardisés de cette plateforme devraient inclure l'identité, la sécurité, l'orchestration, la journalisation, les patrons d'intégration, l'évaluation, l'application des politiques et la gestion du cycle de vie [15]. Sans cette plateforme, la prolifération des agents crée « des coûts cachés, des solutions redondantes, des contrôles incohérents, un accès aux données fragmenté et un fardeau de maintenance croissant » [15].

Gartner prévoit que plus de 40 % des projets d'IA agentique seront annulés d'ici 2027 en raison de l'escalade des coûts, d'une valeur commerciale incertaine ou de contrôles de risques inadéquats [14]. Cette prévision confirme que l'architecture n'est pas un facteur secondaire mais le déterminant principal du succès ou de l'échec des initiatives d'IA agentique. Les systèmes patrimoniaux ne pourront pas supporter les exigences d'exécution de l'IA moderne, et la gouvernance n'est plus une préoccupation secondaire — elle est devenue un prérequis au déploiement, particulièrement dans les environnements soumis à des exigences réglementaires, sécuritaires ou de protection des données [17].

---

#### 2.5 La dette technique amplifiée : quand le modèle opérationnel patrimonial ne supporte pas les objectifs futurs

##### La spirale de la dette technique à l'ère de l'IA

La dette technique (*technical debt*) — cet ensemble d'arbitrages passés qui réduisent la capacité d'un système à évoluer — existait bien avant l'IA. Mais l'IA agit comme un amplificateur de cette dette, exposant des fragilités structurelles qui restaient tolérables dans un contexte de systèmes transactionnels classiques.

Selon Gartner, 25 % du temps et du budget d'ingénierie sont consacrés à la gestion de la dette technique, tandis que moins de la moitié des organisations estiment le faire efficacement [18]. Par ailleurs, 40 % du temps des développeurs est consommé par la maintenance des systèmes patrimoniaux plutôt que par la construction de nouvelles capacités [18]. McKinsey estime que la dette technique peut représenter jusqu'à 40 % du patrimoine technologique dans les grandes entreprises, et que les organisations perdent collectivement jusqu'à 85 milliards de dollars américains annuellement en raison de la modernisation retardée et de la dette technique accumulée [19].

Ces chiffres, déjà préoccupants dans un contexte traditionnel, deviennent critiques lorsque l'organisation tente de déployer de l'IA. En effet, 60 % des dirigeants technologiques déclarent que la dette technique a augmenté de manière significative au cours des trois dernières années, particulièrement alors que les organisations se précipitent pour se moderniser en vue de l'IA, de l'analytique et de l'automatisation [19]. Les organisations qui gèrent activement leur dette technique libèrent leurs ingénieurs pour consacrer jusqu'à 50 % de temps supplémentaire à l'innovation, et livrent leurs services et solutions au moins 50 % plus rapidement [18].

##### Le cercle vicieux de l'IA patrimoniale

L'IA crée un cercle vicieux avec la dette technique existante. Ce phénomène se manifeste selon trois mécanismes :

**L'IA génère sa propre dette technique.** Les premiers adoptants de l'IA générative courent un risque accru de dette technique, selon Gartner [20]. La prolifération rapide de prototypes, de modèles entraînés sur des données de qualité variable, d'intégrations *ad hoc* et de pipelines non standardisés crée une nouvelle couche de dette technique qui se superpose à la dette existante. Gartner avertit qu'il ne suffit pas de « greffer l'IA générative sur une pile technologique ancienne pour rendre une application intelligente ou prête pour l'avenir » [20]. Plus inquiétant encore, Gartner prévoit que d'ici 2030, les intégrations non gérées de l'IA générative rivaliseront avec les systèmes patrimoniaux comme source majeure de dette technique et de retards de mise à niveau [20]. Cette projection signifie que les organisations qui déploient l'IA sans discipline architecturale construisent aujourd'hui les systèmes patrimoniaux de demain.

**La dette existante bloque le déploiement de l'IA.** Les systèmes patrimoniaux, conçus pour des interactions transactionnelles synchrones, ne supportent pas les exigences de l'IA en matière de flux de données asynchrones, de traitement en temps réel et d'intégration continue. Chaque tentative de déployer de l'IA sur une infrastructure patrimoniale nécessite des contournements (*workarounds*) qui ajoutent de la complexité et de la fragilité.

**L'accumulation de dette réduit la vélocité d'innovation.** McKinsey observe que les directeurs des systèmes d'information estiment que 10 % à 20 % de leur budget technique dédié aux nouveaux produits est détourné vers la résolution de problèmes liés à la dette technique [19]. Cette érosion budgétaire ralentit directement la capacité de l'organisation à développer et à déployer de nouvelles capacités IA.

##### Les modèles opérationnels patrimoniaux face à l'IA

Le problème dépasse la dette technique purement logicielle. Les modèles opérationnels informatiques patrimoniaux — structures organisationnelles, processus décisionnels, mécanismes de gouvernance — ne sont pas conçus pour l'ère de l'IA. Gartner affirme que « les modèles opérationnels informatiques patrimoniaux ne tiendront pas la promesse de valeur de l'IA pour l'entreprise » [20]. Pour rester pertinents à l'ère de l'IA, les directeurs des systèmes d'information doivent utiliser l'IA pour réviser l'approvisionnement et automatiser les processus informatiques internes, tout en concevant et en gérant une main-d'œuvre d'entreprise agentique, et en adoptant des modèles opérationnels avancés [20].

Une enquête récente de Gartner auprès de dirigeants révèle que 62 % des PDG placent la croissance en tête de leur liste de priorités d'affaires [1]. Pour répondre à cette priorité dans le contexte de l'IA, les responsables de l'architecture d'entreprise doivent développer un nouveau modèle opérationnel d'EA capable de livrer de la valeur aux organisations qui ont adopté des conceptions d'affaires fédérées [1]. Ce constat converge avec l'observation du chapitre 1 : le fossé entre les attentes des PDG et la réalité opérationnelle des équipes technologiques n'est pas seulement un problème de communication — c'est un problème de capacité structurelle.

##### Le coût de l'inaction

Les organisations qui ignorent la dette technique paient un prix croissant. Selon Gartner, les organisations qui négligent la dette technique dépensent jusqu'à 40 % de plus en maintenance que leurs pairs qui s'y attaquent précocement [18]. Gartner prévoit que d'ici 2028, les dirigeants qui utilisent des méthodes structurées pour gérer la dette technique rapporteront 50 % moins de systèmes obsolètes que ceux qui ne le font pas [18]. La promesse de l'IA ne peut se concrétiser sans un assainissement préalable des fondations architecturales. L'investissement dans la réduction de la dette technique n'est pas un coût — c'est un prérequis à la capture de valeur par l'IA.

---

#### 2.6 L'impératif de composabilité : architectures modulaires, API-first et event-driven comme prérequis IA

##### Pourquoi la composabilité est un prérequis

L'analyse des sections précédentes converge vers une conclusion : les architectures monolithiques et fortement couplées constituent le principal obstacle structurel au déploiement de l'IA à l'échelle. La réponse architecturale à ce défi porte un nom : la composabilité (*composability*). Il s'agit de concevoir les systèmes d'entreprise comme des assemblages de composants modulaires, faiblement couplés, qui peuvent être recombinés et réutilisés pour répondre à des besoins changeants.

McKinsey identifie cette approche comme le facteur déterminant de la mise à l'échelle de l'IA : « La clé de la mise à l'échelle en technologie est de maximiser la réutilisation. Permettre la réutilisation repose sur le développement d'une architecture ouverte et modulaire capable d'intégrer et de remplacer facilement des services et des capacités réutilisables » [3]. Les éléments constitutifs fondamentaux de cette architecture ouverte sont « l'infrastructure en tant que code (*infrastructure as code*) combinée avec les politiques en tant que code (*policy as code*), de sorte que les changements puissent facilement être effectués au cœur du système et adoptés rapidement et facilement par les solutions fonctionnant sur la plateforme » [3].

Le marché confirme cette tendance : le marché mondial de l'infrastructure composable s'élevait à 8,3 milliards de dollars américains en 2025 et devrait connaître une croissance annuelle de 24,9 % jusqu'en 2032 [21]. D'ici 2026, 60 % des entreprises adopteront des architectures composables pour permettre l'agilité pilotée par l'IA, et les organisations qui adoptent ces architectures surpasseront leurs concurrents de 80 % en vitesse d'implémentation de nouvelles fonctionnalités [21].

##### Les trois piliers de la composabilité pour l'IA

**L'approche API-first (interface d'abord).** L'adoption de l'approche *API-first* a atteint 83,2 % des répondants en 2025, bien que seulement 25 % opèrent comme des organisations pleinement *API-first* [22]. Cette approche consiste à concevoir chaque capacité métier ou technique comme un service exposé via une API standardisée avant toute considération d'interface utilisateur ou de logique applicative. Dans le contexte de l'IA, l'approche *API-first* permet :
- L'accès standardisé aux modèles d'IA depuis n'importe quelle application.
- La gestion centralisée des quotas, de la facturation et de la surveillance.
- Le remplacement transparent d'un fournisseur de modèle par un autre.
- La composition de services IA en chaînes de traitement complexes.

Les entreprises adoptant une approche *API-first* lancent de nouvelles fonctionnalités 30 à 50 % plus rapidement et atteignent une efficience des coûts de 20 à 30 % en minimisant la dette technique et en rationalisant les opérations [22]. Cependant, un défi émerge avec l'IA agentique : 89 % des développeurs utilisent l'IA, mais seulement 24 % conçoivent des API pour la consommation par des agents IA [22]. Les agents IA génèrent des appels d'API à volume élevé et adaptatifs, ce qui nécessite de nouveaux patrons de sécurité comme la limitation dynamique du débit et l'analyse comportementale.

**L'architecture événementielle (*event-driven architecture*, EDA).** L'architecture événementielle constitue un facilitateur critique de la composabilité [22]. Elle utilise des événements pour déclencher des actions et communiquer entre les composants, permettant un couplage faible et un traitement asynchrone. Dans le contexte de l'IA, l'EDA est particulièrement pertinente pour :
- Le déclenchement de modèles d'IA en réponse à des événements métier en temps réel.
- La distribution des résultats de l'IA vers de multiples consommateurs sans couplage direct.
- La construction de boucles de rétroaction entre les systèmes opérationnels et les modèles d'IA.
- L'intégration des agents IA dans des flux de travail événementiels complexes.

**La modularité des composants IA.** D'ici 2026, 70 % des organisations adopteront des technologies de plateforme d'expérience numérique (*DXP*) composable plutôt que des suites monolithiques traditionnelles, contre 50 % en 2023 [21]. L'expérience de Kroger/84.51° (section 2.1) illustre concrètement cette approche : la conception modulaire dès l'origine a permis une réduction de 50 % du temps de développement pour le second système IA [7]. Les cinq piliers de transformation identifiés par cette organisation — conception modulaire, reconnaissance de patrons, mise à l'échelle efficiente, opérations standardisées et narration par les plans (*blueprint storytelling*) — constituent un modèle de référence pour l'industrialisation des capacités IA [7].

[Figure 2.2 — Architecture composable pour l'IA d'entreprise. Trois couches horizontales sont représentées : (1) Couche de fondation — infrastructure en tant que code, politiques en tant que code, observabilité ; (2) Couche de services — services IA modulaires exposés via API standardisées, bus d'événements pour la communication asynchrone, services de gouvernance transversaux ; (3) Couche d'applications — applications métier composées à partir des services de la couche inférieure, agents IA orchestrés, interfaces utilisateurs. Des flèches bidirectionnelles entre les couches illustrent les interactions via API et événements. Des composants de sécurité et de gouvernance traversent les trois couches verticalement.]

##### La composabilité comme différenciateur économique

Les données économiques confirment l'impact de la composabilité. Les entreprises disposant de systèmes hautement interopérables atteignent une croissance des revenus jusqu'à 5 % supérieure à celle des organisations aux architectures monolithiques et cloisonnées, ce qui, pour une entreprise générant 10 milliards de dollars de revenus, représente 8 milliards de dollars supplémentaires sur cinq ans [21]. IBM affirme que les architectures composables « démocratisent le développement d'applications » en permettant à des équipes non spécialisées de combiner des composants préfabriqués pour créer de nouvelles solutions [23].

Pour l'IA en entreprise, la composabilité n'est pas un luxe architectural — c'est un prérequis opérationnel. Les organisations qui tentent de déployer de l'IA sur des architectures monolithiques reproduisent systématiquement le coût et le délai du premier prototype, tandis que celles qui investissent dans des fondations composables accélèrent de manière exponentielle leur capacité de déploiement.

---

#### 2.7 Pourquoi l'architecture devient le différenciateur entre PoC et IA en production à l'échelle

##### La convergence des preuves

Les sections précédentes de ce chapitre ont établi, de manière indépendante mais convergente, que l'architecture d'entreprise constitue le facteur déterminant du succès ou de l'échec des initiatives IA. Récapitulons les fils conducteurs :

Le changement d'échelle entre pilote et production (section 2.1) exige des transformations dans cinq dimensions — données, infrastructure, intégration, gouvernance, opérations — que seule une approche architecturale d'ensemble peut coordonner. Le fossé PoC-Production (section 2.2) trouve ses causes racines dans des défaillances architecturales — flux fragiles, absence de boucles d'apprentissage, désalignement opérationnel. L'IA générative (section 2.3) impose des exigences nouvelles sur les couches données, intégration et sécurité qui dépassent les capacités des architectures existantes. L'IA agentique (section 2.4) requiert des architectures d'autonomie bornée, de gouvernance en temps réel et de plateforme standardisée. La dette technique (section 2.5) amplifie chacun de ces défis en alourdissant le patrimoine technologique existant. Et la composabilité (section 2.6) constitue le principe architectural de réponse à cette convergence de pressions.

##### L'architecture comme capacité dynamique

L'article de Gupta (2025) sur arXiv propose un cadre théorique pour comprendre le rôle de l'architecture dans ce contexte. En conceptualisant la gestion de l'architecture d'entreprise comme une « capacité dynamique » au sens de Teece [9], l'auteur identifie trois fonctions :

- **La détection (*sensing*)** : la capacité de l'architecture d'entreprise à identifier les opportunités et les menaces liées à l'IA dans l'environnement technologique et concurrentiel.
- **La saisie (*seizing*)** : la capacité à concevoir et à mettre en œuvre les transformations architecturales nécessaires pour exploiter ces opportunités.
- **La transformation (*transforming*)** : la capacité à reconfigurer les ressources et les structures organisationnelles pour soutenir le changement continu.

Cette conceptualisation est significative parce qu'elle positionne l'architecture non pas comme un artefact statique — un diagramme, un standard, un cadre de référence — mais comme une capacité organisationnelle vivante qui s'adapte en permanence aux exigences de l'environnement.

##### Les tendances EA 2025-2026 comme réponse

L'analyse des tendances en architecture d'entreprise pour 2025-2026 confirme que la discipline s'adapte aux exigences de l'IA. BOC Group identifie sept tendances majeures qui structurent cette adaptation : l'architecture d'entreprise pilotée par l'IA (*AI-driven EA*), les architectures nativement infonuagiques (*cloud-native architectures*), les architectures orientées durabilité, la conception centrée sur l'humain, la planification stratégique avec feuilles de route agiles, la résilience et la sécurité, et la prise de décision fondée sur les données [24]. Le rapport note que « l'IA permet des analyses automatisées et la planification de scénarios, ce qui en fait un outil essentiel pour aligner les architectures avec les objectifs stratégiques » [24]. Cette convergence entre les capacités de l'IA et les méthodes de l'architecture d'entreprise crée un cercle vertueux : l'IA renforce la pratique de l'EA, et une EA solide est le prérequis au déploiement de l'IA.

##### Deux trajectoires organisationnelles

Les données empiriques permettent de distinguer deux trajectoires organisationnelles face à l'IA :

**La trajectoire centrifuge.** L'organisation multiplie les initiatives IA de manière décentralisée, sans coordination architecturale. Chaque équipe développe ses propres pipelines de données, choisit ses propres modèles, construit ses propres intégrations. McKinsey décrit ce phénomène : « L'expérimentation avec l'IA a engendré une prolifération de cas d'usage et d'expériences qui ne sont pas soutenus par les processus de bout en bout, les données, les personnes et les technologies nécessaires à la mise à l'échelle » [3]. Cette trajectoire mène au « purgatoire des pilotes » et à l'accumulation de dette technique spécifique à l'IA. CIO.com décrit les conséquences concrètes de cette approche : « des coûts cachés, des solutions redondantes, des contrôles incohérents, un accès aux données fragmenté et un fardeau de maintenance croissant » [15].

**La trajectoire plateforme.** L'organisation investit dans une plateforme architecturale partagée qui standardise l'accès aux données, l'orchestration des modèles, la gouvernance, la sécurité et l'observabilité. CIO.com affirme que « les entreprises qui captureront les retours de l'IA agentique la traiteront comme une transformation portée par la plateforme, et non comme une collection de pilotes déconnectés » [15]. Le cadre InfoQ confirme cette orientation en notant que « les organisations qui déploient avec succès des systèmes agentiques partagent un constat commun : elles privilégient des architectures simples et composables plutôt que des cadres complexes » [16]. L'approche plateforme requiert un investissement initial plus important mais génère un rendement croissant à mesure que les capacités IA se multiplient.

[Tableau 2.2 — Comparaison des trajectoires organisationnelles face à l'IA. Colonnes : Dimension | Trajectoire centrifuge | Trajectoire plateforme. Lignes : Gouvernance | Ad hoc, par équipe | Centralisée, par politiques en tant que code ; Données | Silos dupliqués | Tissu/maillage fédéré ; Intégration | Point à point, artisanale | API standardisées, événementielle ; Sécurité | Contrôles réactifs, fragmentés | Contrôles intégrés dans l'orchestration ; Coût marginal du N-ième déploiement | Constant (reproduit le premier PoC) | Décroissant (réutilisation des composants) ; Délai de mise en marché | 6-9 mois par initiative | 3-4,5 mois par initiative (réf. Kroger) ; Résultat typique | Purgatoire des pilotes, 95 % d'échec | Mise à l'échelle progressive, capture de valeur.]

##### Le rôle de l'architecte d'entreprise dans ce contexte

La fonction d'architecture d'entreprise est la seule discipline organisationnelle dont le mandat couvre simultanément les cinq dimensions du changement d'échelle identifiées dans ce chapitre : les données, l'infrastructure, l'intégration, la gouvernance et les opérations. Les équipes de science des données maîtrisent la dimension algorithmique mais pas l'intégration systémique. Les équipes d'infrastructure maîtrisent le déploiement mais pas l'alignement stratégique. Les équipes de sécurité maîtrisent la protection mais pas l'orchestration des flux de données.

L'architecte d'entreprise possède la vision transversale nécessaire pour coordonner ces dimensions. Mais, comme le souligne Gupta (2025), les cadres d'architecture d'entreprise existants présentent des limites significatives pour répondre aux exigences spécifiques de l'IA générative [9]. Les équipes d'architecture d'entreprise doivent acquérir des compétences liées aux architectures orientées données, à la modélisation des données et au développement et à l'intégration de solutions IA [1]. L'adaptation des cadres de référence existants — TOGAF, Zachman, Gartner — aux exigences spécifiques de l'IA constitue un impératif que les chapitres suivants de ce livre blanc aborderont en détail.

McKinsey souligne que pour soutenir à la fois l'innovation et la mise à l'échelle, les organisations doivent développer « une capacité d'IA générative distribuée afin que des dizaines, voire des centaines d'équipes à travers l'entreprise puissent accéder facilement et de manière sécurisée aux outils et aux services » [3]. Cette capacité distribuée mais gouvernée constitue précisément le domaine d'expertise de l'architecture d'entreprise — à condition que la fonction évolue pour répondre aux exigences nouvelles de l'IA.

---

#### Points clés à retenir

> **1. Le fossé PoC-Production est architectural, pas algorithmique.** 95 % des pilotes IA échouent à générer un impact financier mesurable (MIT, 2025) et 88 % des PoC n'atteignent jamais le déploiement à grande échelle (IDC). Les causes racines — qualité des données, intégration fragile, absence de gouvernance — relèvent de l'architecture d'entreprise, pas de la science des données.
>
> **2. L'IA générative et les LLM exigent des transformations dans trois couches.** La couche données doit évoluer vers des modèles de tissu ou de maillage de données (60 % des organisations adopteront une approche hybride d'ici 2026). La couche intégration doit passer de l'interface ponctuelle à l'orchestration standardisée. La couche sécurité doit adresser des vecteurs d'attaque inédits (injection de requêtes, fuite des requêtes système, agentivité excessive).
>
> **3. L'IA agentique multiplie les exigences architecturales.** Les architectures d'autonomie bornée, les boucles de rétroaction multi-échelles et la gouvernance en temps réel ne sont pas des options : elles sont des prérequis pour tout déploiement d'agents IA en production. Gartner prévoit que 40 % des projets agentiques seront annulés d'ici 2027 en raison de contrôles de risques inadéquats.
>
> **4. La dette technique est amplifiée par l'IA.** L'IA génère sa propre dette technique, elle est bloquée par la dette existante, et l'accumulation de dette réduit la vélocité d'innovation. Jusqu'à 40 % du patrimoine technologique des grandes entreprises est constitué de dette technique (McKinsey). D'ici 2030, les intégrations non gérées de GenAI rivaliseront avec les systèmes patrimoniaux comme source majeure de dette technique (Gartner).
>
> **5. La composabilité est le principe architectural de réponse.** Les architectures modulaires, API-first et événementielles permettent la réutilisation (réduction de 50 % du délai de développement chez Kroger), l'agilité et la mise à l'échelle. Le marché de l'infrastructure composable atteindra une croissance annuelle de 24,9 % jusqu'en 2032, confirmant que l'industrie converge vers cette approche.
>
> **6. L'architecture d'entreprise est le différenciateur.** Elle est la seule discipline dont le mandat couvre les cinq dimensions du changement d'échelle — données, infrastructure, intégration, gouvernance, opérations. La trajectoire plateforme surpasse la trajectoire centrifuge. Le repositionnement de l'EA vers les exigences de l'IA est un impératif stratégique.

---

#### Transition vers le chapitre 3

Ce chapitre a démontré que l'IA amplifie le fossé documenté au chapitre 1 en imposant des exigences architecturales que les fondations existantes ne peuvent satisfaire. Le taux d'échec de 95 % des pilotes IA, l'émergence de vecteurs de complexité inédits (LLM, agents autonomes, dette technique amplifiée) et l'impératif de composabilité convergent vers un constat : sans transformation architecturale, les ambitions IA des organisations demeureront au stade de prototypes prometteurs mais inopérants.

Ce constat pose naturellement la question du rôle professionnel qui peut porter cette transformation. Le chapitre 3 examinera comment le rôle de l'architecte d'entreprise évolue déjà, sous l'impulsion des données empiriques de Forrester et de Gartner, d'une fonction de documentation et de conformité vers un rôle de conseil stratégique. Cette évolution n'est pas une aspiration théorique — elle est une réponse pragmatique aux défis architecturaux que ce chapitre a documentés.

---

#### Références

[1] Gartner, « 3 Trends Driving Enterprise Architecture Strategy in 2025 », Gartner Research, 2025. Disponible : https://www.gartner.com/en/articles/2025-trends-for-enterprise-architecture

[2] MIT Center for Information Systems Research, « GenAI Divide: State of AI in Business 2025 », Massachusetts Institute of Technology, 2025. Résumé disponible : https://complexdiscovery.com/why-95-of-corporate-ai-projects-fail-lessons-from-mits-2025-study/

[3] McKinsey & Company, « Overcoming Two Issues That Are Sinking Gen AI Programs » et « The State of AI in 2025: Agents, Innovation, and Transformation », McKinsey Global Institute, 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/overcoming-two-issues-that-are-sinking-gen-ai-programs

[4] IDC, « Artificial Intelligence Infrastructure Spending to Reach $758Bn USD Mark by 2029 », International Data Corporation, 2025. Disponible : https://my.idc.com/getdoc.jsp?containerId=prUS53894425

[5] IDC, « AI Projects Failure to Deploy at Scale », données citées dans CIO.com, 2025. Disponible : https://www.cio.com/article/3850763/88-of-ai-pilots-fail-to-reach-production-but-thats-not-all-on-it.html

[6] Gartner, enquêtes et prévisions mondiales sur l'IA, 2024-2025, compilées dans : « 200+ AI Statistics & Trends for 2025 », Fullview, 2025. Disponible : https://www.fullview.io/blog/ai-statistics

[7] K. Foster, « From AI Workshop to AI Factory: A Case Study in Reusable AI Capabilities », CDO Magazine, 2025. Disponible : https://www.cdomagazine.tech/opinion-analysis/from-ai-workshop-to-ai-factory-a-case-study-in-reusable-ai-capabilities

[8] Revolution in AI, « AI Performance Gap — 96% Failure Rate: Remote Labor Index 2026 », Revolution in AI, février 2026. Disponible : https://www.revolutioninai.com/2026/02/ai-fails-96-percent-remote-labor-index-2026.html

[9] S. Gupta, « Enterprise Architecture as a Dynamic Capability for Scalable GenAI Adoption », arXiv:2505.06326, mai 2025. Disponible : https://arxiv.org/abs/2505.06326

[10] Gartner et analystes de données, prévisions sur l'adoption du tissu de données et du maillage de données, 2025-2026. Sources : https://www.alation.com/blog/data-mesh-vs-data-fabric/ ; https://www.trigyn.com/insights/data-engineering-trends-2026-building-foundation-ai-driven-enterprises

[11] Gartner, Clarifai, et OWASP, données consolidées sur la sécurité et l'adoption des LLM en entreprise, 2024-2025. Sources : https://www.clarifai.com/blog/llms-and-ai-trends ; https://www.lasso.security/blog/llm-data-privacy

[12] OWASP Foundation, « OWASP Top 10 for Large Language Model Applications 2025 », Open Worldwide Application Security Project, 2025. Disponible : https://genai.owasp.org/resource/owasp-top-10-for-llm-applications-2025/

[13] Invicti Security et analystes en cybersécurité, « OWASP Top 10 for LLMs 2025: Key Risks and Mitigation Strategies » et données de conformité réglementaire, 2025. Disponible : https://www.invicti.com/blog/web-security/owasp-top-10-risks-llm-security-2025

[14] Gartner, « Gartner Predicts 40% of Enterprise Apps Will Feature Task-Specific AI Agents by 2026 » et « Gartner Predicts Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 », Gartner Newsroom, 2025. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025

[15] CIO.com, « Agentic AI Isn't About the Agents — It's About the Platform », CIO, 2025. Disponible : https://www.cio.com/article/4125864/agentic-ai-isnt-about-the-agents-its-about-the-platform.html

[16] InfoQ, « Agentic AI Architecture Framework », InfoQ, 2025. Disponible : https://www.infoq.com/articles/agentic-ai-architecture-framework/

[17] Deloitte et analystes divers, « Agentic AI Strategy » et données de marché sur la gouvernance agentique, 2025-2026. Sources : https://www.deloitte.com/us/en/insights/topics/technology-management/tech-trends/2026/agentic-ai-strategy.html ; https://www.cio.com/article/4105490/overcome-governance-and-trust-issues-to-drive-agentic-ai.html

[18] Gartner, « From Tech Debt to AI Agents: Lessons from the 2025 Gartner Application Innovation Summit » et « Assessing Technical Debt to Prioritize Modernization Investments », Gartner, 2025. Source : https://www.moderne.ai/blog/gartner-application-innovation-business-summit-2025-recap

[19] McKinsey & Company, « Technical Debt and Legacy Modernization », estimations compilées dans : https://www.itconvergence.com/blog/strategies-for-managing-technical-debt-in-legacy-software-systems/ et https://teamvoy.com/blog/tech-debt-avalanche-why-companies-are-modernizing-now-with-ai/

[20] Gartner, « Predicts 2026: CIOs Must Restructure Their IT Operating Models to Capture AI Value » et « Early Generative AI Adopters at Higher Risk of Tech Debt », Gartner, 2025. Sources : https://www.gartner.com/en/documents/7189830 ; https://www.ciodive.com/news/generative-ai-tech-debt-complexity-gartner/710486/

[21] Données consolidées sur l'adoption des architectures composables et projections de marché, 2024-2026. Sources : https://www.techtarget.com/searchdatacenter/tip/Composable-architecture-Future-proofing-AI-expansion ; https://dotfusion.com/blogs/composable-architecture-enterprise-guide

[22] Données consolidées sur l'adoption API-first et l'architecture événementielle, 2024-2026. Sources : https://konghq.com/blog/engineering/api-a-rapidly-changing-landscape ; https://www.accio.com/business/trends-for-composable-application-architecture ; https://www.htcinc.com/insights/blogs/reinventing-it-adopting-mach-and-composable-architecture-for-enterprise-agility/

[23] IBM, « Composable Architectures Are Democratizing App Development », IBM Think, 2025. Disponible : https://www.ibm.com/think/insights/beyond-monoliths-composable-architectures

[24] BOC Group, « EA Outlook: Trends 2025-2026 », BOC Group, 2025. Disponible : https://www.boc-group.com/en/blog/ea/ea-outlook-trends-2025/

[25] Forrester Research, « The State of AI, 2025 » et « The State of Enterprise Architecture, 2025 », Forrester, 2025. Sources : https://www.forrester.com/report/the-state-of-ai-2025/RES189955 ; https://www.forrester.com/report/the-state-of-enterprise-architecture-2025/RES190870

[26] McKinsey & Company, « Charting a Path to the Data- and AI-Driven Enterprise of 2030 », McKinsey, 2025. Disponible : https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/charting-a-path-to-the-data-and-ai-driven-enterprise-of-2030
