### Chapitre 5 — Cadres d'analyse pour conseiller l'IA

<!-- Rôle argumentatif (PRD §3) : Des cadres d'analyse concrets permettent aux EA d'exercer ce rôle de conseil. -->

#### Introduction

Les chapitres précédents ont établi que l'architecte d'entreprise (EA) est le traducteur naturel entre l'ambition IA des organisations et leur capacité d'exécution. Mais affirmer ce positionnement ne suffit pas : encore faut-il disposer d'instruments analytiques rigoureux pour l'exercer. Le passage du rôle de documentaliste à celui de conseiller stratégique exige des cadres d'analyse structurés, reproductibles et communicables aux parties prenantes de la C-suite.

L'enjeu est considérable. Selon le rapport McKinsey *State of AI 2025*, 88 % des organisations utilisent l'IA dans au moins une fonction, mais seulement un tiers parviennent à la déployer à l'échelle de l'entreprise [1]. Le *Cisco AI Readiness Index 2025* révèle que seuls 13 % des organisations — les *Pacesetters* — génèrent une valeur mesurable de leurs investissements IA [2]. L'écart entre ambition et réalisation — souvent qualifié de « piège pilote-production » (*pilot-to-production trap*) — n'est pas un problème technique : c'est un problème organisationnel qui appelle des outils d'analyse structurels [3].

Ce chapitre présente six cadres d'analyse complémentaires que l'EA peut déployer pour transformer le conseil IA en une pratique systématique. De la cartographie des écarts entre ambitions et capacités (section 5.1) à la priorisation des initiatives par des cadres quantitatifs (section 5.6), chaque outil répond à une question stratégique précise. L'objectif est de fournir à l'EA un arsenal méthodologique concret — pas un catalogue théorique, mais des instruments directement applicables dans les comités d'investissement, les revues de portefeuille IA et les conversations avec la direction générale.

Les cadres détaillés sous forme de *templates* vierges et d'exemples remplis sont disponibles dans l'Annexe E (Matrice valeur/risque/délai) et l'Annexe F (Canevas de cas d'usage IA), qui constituent les compléments opérationnels de ce chapitre.

#### 5.1 Cartographie « ambitions IA » vs capacités actuelles (données, plateformes, processus, talents)

##### 5.1.1 L'écart ambition-exécution : un fossé structurel

Le premier cadre d'analyse que l'EA doit maîtriser est la cartographie systématique de l'écart entre les ambitions IA d'une organisation et ses capacités réelles. Ce n'est pas un exercice académique : selon une étude de Slalom portant sur 2 000 dirigeants, les organisations sont optimistes concernant l'IA — elles investissent davantage et accélèrent leurs projets —, mais les résultats ne suivent pas le rythme des ambitions [4]. Globalement, plus de 70 % des entreprises ont lancé des projets IA, mais moins d'un tiers ont réussi à les déployer à l'échelle [3].

L'EA est la seule fonction organisationnelle qui dispose d'une vision transversale simultanée sur les quatre dimensions constitutives de cette capacité : les données, les plateformes technologiques, les processus métier et les talents. Cette position lui confère un avantage distinctif pour réaliser ce diagnostic.

##### 5.1.2 Les quatre dimensions de la cartographie

La cartographie ambitions-capacités s'articule autour de quatre axes d'évaluation, chacun décomposé en sous-critères mesurables :

**Dimension 1 — Données.** L'évaluation porte sur la qualité des données (complétude, exactitude, fraîcheur), leur accessibilité (silos, fragmentation, gouvernance), leur lignage (*data lineage*) et leur conformité réglementaire. Le *Cisco AI Readiness Index* montre que 76 % des *Pacesetters* ont des données entièrement centralisées, contre seulement 19 % de l'ensemble des organisations [2]. La fragmentation des données reste l'obstacle le plus fréquemment cité dans les échecs de passage à l'échelle de l'IA [5].

**Dimension 2 — Plateformes technologiques.** L'EA évalue l'infrastructure de calcul (GPU, TPU, services infonuagiques), les plateformes *MLOps* et *LLMOps*, les capacités d'intégration (*API*, bus d'événements, *middleware*) et la flexibilité du réseau. Le même indice Cisco révèle que 71 % des *Pacesetters* disposent de réseaux entièrement flexibles et prêts pour l'IA, contre 15 % de l'ensemble des organisations [2].

**Dimension 3 — Processus métier.** Cette dimension évalue le niveau de maturité des processus candidats à l'automatisation ou à l'augmentation par l'IA : leur degré de standardisation, leur documentation, leur mesurabilité et leur potentiel de transformation. Un processus mal défini ou hautement variable ne peut pas être automatisé de manière fiable, quel que soit le modèle IA utilisé.

**Dimension 4 — Talents et compétences.** L'évaluation porte sur la *AI literacy* (littératie IA) de l'organisation, la disponibilité de compétences techniques spécialisées (*data science*, *ML engineering*, *prompt engineering*), et la capacité d'absorption organisationnelle du changement. Les *Pacesetters* de Cisco investissent massivement dans la formation IA, avec 75 % de leur personnel atteignant un niveau de maîtrise de l'IA, contre seulement 16 % chez les autres organisations [2].

##### 5.1.3 Méthode de cartographie en cinq étapes

L'EA peut déployer la cartographie ambitions-capacités en cinq étapes structurées :

1. **Inventaire des ambitions.** Recenser les cas d'usage IA identifiés par la direction, les unités d'affaires et les équipes technologiques. Chaque ambition est décrite en termes de résultat métier attendu, pas en termes de technologie.

2. **Évaluation des capacités actuelles.** Pour chaque dimension (données, plateformes, processus, talents), attribuer un score de maturité sur une échelle de 1 à 5, en utilisant des critères objectifs et vérifiables.

3. **Évaluation des capacités requises.** Pour chaque cas d'usage IA identifié, déterminer le niveau de capacité minimal requis sur chacune des quatre dimensions.

4. **Calcul des écarts.** La différence entre capacité requise et capacité actuelle produit une carte d'écarts (*gap map*) qui révèle les zones de blocage structurel.

5. **Priorisation des investissements de remédiation.** Les écarts les plus critiques — ceux qui bloquent le plus grand nombre de cas d'usage à forte valeur — deviennent des priorités d'investissement.

[Tableau 5.1 — Exemple de cartographie ambitions IA vs capacités actuelles]

| Cas d'usage IA | Données (actuel/requis) | Plateformes (actuel/requis) | Processus (actuel/requis) | Talents (actuel/requis) | Écart global |
|---|---|---|---|---|---|
| Prévision de la demande | 3/4 | 2/4 | 4/4 | 2/3 | Modéré |
| Chatbot client GenAI | 2/4 | 1/5 | 3/3 | 1/4 | Critique |
| Détection de fraude | 4/5 | 3/4 | 4/4 | 3/4 | Faible |
| Agents IA autonomes | 1/5 | 1/5 | 2/5 | 1/5 | Critique |

*Échelle : 1 = inexistant, 2 = initial, 3 = défini, 4 = géré, 5 = optimisé.*

Ce tableau est une version simplifiée ; l'Annexe F fournit un canevas complet de documentation de cas d'usage, incluant les critères détaillés de chaque dimension.

##### 5.1.4 L'apport de l'EA dans l'exercice de cartographie

L'EA apporte une valeur unique dans cet exercice pour trois raisons. Premièrement, sa connaissance de l'architecture applicative et des flux de données lui permet d'évaluer la faisabilité technique avec un niveau de précision que ni la direction métier ni les équipes de *data science* ne possèdent isolément. Deuxièmement, sa compréhension des *value streams* (chaînes de valeur) lui permet de relier chaque cas d'usage à un résultat métier mesurable. Troisièmement, sa vision transversale permet d'identifier les dépendances entre cas d'usage : un investissement dans la qualité des données peut simultanément débloquer trois ou quatre initiatives IA, un effet de levier que seule une analyse systémique peut révéler.

Le cadre TOGAF, dans sa phase B (*Business Architecture*) du cycle ADM (*Architecture Development Method*), prescrit explicitement la construction de cartes de capacités métier et l'analyse des écarts entre l'architecture de base (*baseline*) et l'architecture cible (*target*) [6]. L'exercice de cartographie ambitions-capacités IA s'inscrit naturellement dans cette démarche, en y ajoutant les dimensions spécifiques à l'IA (qualité des données pour l'apprentissage automatique, infrastructure GPU, compétences en ingénierie de modèles).

#### 5.2 Typologie des usages IA : automatisation, augmentation, agents, nouveaux produits digitaux

##### 5.2.1 Pourquoi une typologie est nécessaire

La deuxième contribution analytique de l'EA consiste à structurer la conversation autour des types d'usage IA. Sans cette structuration, les organisations tombent dans un piège courant : traiter tous les projets IA comme s'ils relevaient de la même catégorie, avec les mêmes exigences architecturales, les mêmes profils de risque et les mêmes horizons de valeur.

Gartner prédit que d'ici 2026, 40 % des applications d'entreprise intégreront des agents IA spécialisés, contre moins de 5 % en 2025 [7]. IDC anticipe que d'ici 2030, 45 % des organisations orchestreront des agents IA à l'échelle, les intégrant dans l'ensemble des fonctions métier [8]. Mais ces deux types d'usage — agents IA intégrés dans des applications existantes et agents autonomes orchestrés — posent des défis architecturaux fondamentalement différents. L'EA doit être capable de distinguer ces catégories et de conseiller en conséquence.

##### 5.2.2 Les quatre catégories d'usage IA

La typologie proposée distingue quatre catégories d'usage, chacune avec des exigences architecturales, des profils de risque et des horizons de retour sur investissement distincts :

**Catégorie 1 — Automatisation.** L'IA remplace des tâches répétitives, structurées et à faible variabilité. Exemples : classification automatique de documents, extraction de données de factures, routage intelligent de tickets de support. L'exigence architecturale principale est l'intégration dans les flux de processus existants via des *API* ou des connecteurs *RPA* (*Robotic Process Automation*). Le profil de risque est faible et le retour sur investissement rapide (3 à 6 mois). Gartner note que ce type d'usage représente la catégorie la plus mature et la plus largement déployée [9].

**Catégorie 2 — Augmentation.** L'IA amplifie les capacités humaines sans remplacer le jugement. Exemples : copilotes de rédaction, assistants de diagnostic, outils de synthèse documentaire, systèmes de recommandation. L'exigence architecturale porte sur l'intégration dans les interfaces utilisateur existantes et la gestion des boucles de rétroaction humaine (*human-in-the-loop*). Gartner recommande de prioriser l'utilisation de l'IA pour augmenter la productivité des employés plutôt que de se concentrer uniquement sur les réductions de coûts [9]. Le profil de risque est modéré, principalement lié à la qualité des réponses générées et à l'adoption par les utilisateurs.

**Catégorie 3 — Agents IA (*Agentic AI*).** Les agents IA sont proactifs, autonomes et orientés vers des objectifs. Forrester les distingue explicitement des assistants ou copilotes : un copilote est réactif et répond aux requêtes ; un agent IA est fondamentalement différent — il raisonne, planifie et utilise des « outils » pour atteindre des objectifs complexes en plusieurs étapes avec un minimum de supervision humaine [10]. L'exigence architecturale est considérablement plus élevée : orchestration multi-agents, gestion de la mémoire contextuelle, garde-fous de sécurité (*guardrails*), observabilité des chaînes de raisonnement. Forrester prédit que 75 % des entreprises qui tenteront de construire leurs propres systèmes agentiques échoueront [10]. Le profil de risque est élevé et le retour sur investissement est à moyen terme (12 à 24 mois).

**Catégorie 4 — Nouveaux produits et services digitaux.** L'IA n'optimise pas un processus existant : elle crée une proposition de valeur entièrement nouvelle. Exemples : services de personnalisation en temps réel, plateformes de génération de contenu, produits prédictifs vendus aux clients. L'exigence architecturale inclut des architectures de type plateforme (*platform architecture*), des capacités de mise à l'échelle (*scalability*), des modèles de monétisation et une gouvernance renforcée sur les droits de propriété intellectuelle. Le profil de risque est élevé — celui d'un lancement de produit — et le retour sur investissement est à long terme (18 à 36 mois).

[Tableau 5.2 — Typologie des usages IA : caractéristiques comparées]

| Critère | Automatisation | Augmentation | Agents IA | Produits digitaux |
|---|---|---|---|---|
| Rôle de l'IA | Remplacement de tâches | Amplification humaine | Action autonome | Création de valeur |
| Supervision humaine | Minimale | *Human-in-the-loop* | *Human-on-the-loop* | Variable |
| Complexité architecturale | Faible | Modérée | Élevée | Très élevée |
| Horizon ROI | 3-6 mois | 6-12 mois | 12-24 mois | 18-36 mois |
| Profil de risque | Faible | Modéré | Élevé | Élevé |
| Exigence données | Structurées | Mixtes | Multimodales | Massives |
| Maturité du marché (2025) | Élevée | Élevée | Émergente | Exploratoire |

##### 5.2.3 Implications pour l'EA

La typologie des usages a des implications directes sur le travail de l'EA :

**Portefeuille équilibré.** L'EA doit conseiller la direction de maintenir un portefeuille équilibré à travers les quatre catégories. Un portefeuille exclusivement composé de projets d'automatisation génère des gains rapides mais ne transforme pas l'organisation. Un portefeuille concentré sur les agents IA ou les nouveaux produits digitaux est trop risqué. La recommandation méthodologique issue de la littérature professionnelle suggère un mix de 70 % de *quick wins* (automatisation et augmentation), 20 % de leviers majeurs (agents IA ciblés) et 10 % d'explorations stratégiques (nouveaux produits) [11].

**Exigences architecturales différenciées.** Chaque catégorie impose des exigences architecturales spécifiques que l'EA doit anticiper. Un projet d'automatisation peut fonctionner avec l'infrastructure existante. Un projet d'agents IA exige une refonte partielle de l'architecture d'intégration, de sécurité et d'observabilité. L'EA qui confond ces niveaux d'exigence sous-estime systématiquement l'effort et le risque.

**Communication adaptée.** Face au CEO, l'EA présentera la typologie sous l'angle des horizons de valeur. Face au CIO, sous l'angle des exigences d'infrastructure. Face au CDO (*Chief Data Officer*), sous l'angle de la qualité et de la gouvernance des données requises. La typologie est un outil de traduction, pas seulement de classification.

Gartner anticipe que d'ici 2027, 50 % des décisions d'affaires seront augmentées ou automatisées par des agents IA pour l'intelligence décisionnelle (*decision intelligence*), combinant données, analytique et IA pour créer des flux de décision [9]. Cette projection renforce la nécessité pour l'EA de distinguer clairement les cas d'usage d'augmentation des cas d'usage d'automatisation complète, car leurs architectures de gouvernance sont fondamentalement différentes.

#### 5.3 Matrice valeur / risque / délai pour prioriser les investissements IA

##### 5.3.1 Le problème de la priorisation

Le troisième cadre d'analyse est un instrument de priorisation structuré : la matrice valeur/risque/délai. Son objectif est de répondre à la question qui paralyse la plupart des comités d'investissement IA : « Par où commencer ? »

Le problème n'est pas un manque d'idées. Les organisations disposent généralement de dizaines, voire de centaines, de cas d'usage IA potentiels. Le problème est l'absence de méthode pour les comparer de manière rigoureuse. Gartner rapporte que seulement une initiative IA sur cinq atteint un retour sur investissement positif, et une sur cinquante produit une transformation véritable [12]. Cette statistique reflète moins un échec technologique qu'un échec de priorisation : les organisations investissent dans des cas d'usage mal évalués ou mal séquencés.

##### 5.3.2 Construction de la matrice tridimensionnelle

La matrice valeur/risque/délai évalue chaque cas d'usage IA candidat selon trois axes orthogonaux :

**Axe 1 — Valeur métier.** La valeur est décomposée en sous-critères pondérés : impact sur le chiffre d'affaires (direct ou indirect), réduction des coûts opérationnels, amélioration de l'expérience client, avantage concurrentiel et alignement avec la stratégie organisationnelle. Chaque sous-critère est évalué sur une échelle de 1 à 5 et pondéré selon les priorités stratégiques de l'organisation.

**Axe 2 — Risque.** Le risque intègre quatre dimensions : risque technique (complexité du modèle, qualité des données disponibles, intégrabilité), risque réglementaire (conformité au *EU AI Act*, au RGPD, aux réglementations sectorielles), risque organisationnel (résistance au changement, impact sur les emplois) et risque de dépendance fournisseur (*vendor lock-in*). Le score de risque global est calculé comme la moyenne pondérée des quatre dimensions.

**Axe 3 — Délai de réalisation.** Le délai tient compte du temps de développement technique, du temps d'acquisition ou de formation des compétences, du temps d'intégration dans les processus métier existants et du temps de déploiement et d'adoption. L'EA doit être réaliste dans cette évaluation : McKinsey observe que les organisations qui suivent des indicateurs clés de performance (KPI) définis pour leurs projets IA génératifs obtiennent un impact financier significativement supérieur, mais moins de 20 % le font actuellement [1].

##### 5.3.3 Représentation et lecture de la matrice

La matrice peut être représentée visuellement sous la forme d'un diagramme à bulles tridimensionnel, où :
- L'axe horizontal représente la valeur métier (faible à élevée, de gauche à droite) ;
- L'axe vertical représente le risque (faible en haut à élevé en bas) ;
- La taille de la bulle représente le délai de réalisation (petite bulle = délai court, grande bulle = délai long).

[Figure 5.1 — Matrice valeur/risque/délai : représentation en diagramme à bulles]

La matrice produit quatre quadrants stratégiques :

**Quadrant I — *Quick wins* (valeur élevée, risque faible, délai court).** Ces initiatives doivent être lancées immédiatement. Elles démontrent la valeur de l'IA auprès des décideurs et génèrent l'élan organisationnel nécessaire pour des projets plus ambitieux. Exemples typiques : automatisation de la classification documentaire, chatbot FAQ interne.

**Quadrant II — Leviers majeurs (valeur élevée, risque modéré, délai moyen).** Ces initiatives justifient un cadrage technique approfondi et un pilote sous 90 jours. Elles nécessitent une attention particulière de l'EA pour la gestion des risques techniques et organisationnels. Exemples typiques : prévision de la demande, détection d'anomalies, copilote métier spécialisé.

**Quadrant III — Initiatives stratégiques à cadrer (valeur élevée, risque élevé ou délai long).** Ces initiatives nécessitent un travail préparatoire sur les données et la conformité avant de pouvoir être lancées. L'EA joue un rôle critique dans l'identification des prérequis architecturaux. Exemples typiques : agents IA autonomes, plateformes d'IA embarquées dans les produits.

**Quadrant IV — Candidates à l'abandon ou au report (valeur faible, risque élevé).** Ces initiatives doivent être explicitement déprioritisées. L'EA apporte ici une valeur en disant « non » de manière argumentée — une contribution souvent plus précieuse que l'enthousiasme.

##### 5.3.4 Le rôle de l'EA dans l'utilisation de la matrice

L'EA n'est pas seulement le constructeur de la matrice : il en est le gardien et l'interprète. Son rôle consiste à :

- **Animer les ateliers de scoring.** L'EA facilite les sessions de cotation en réunissant les parties prenantes métier, les équipes technologiques et les responsables de la conformité. La méthode Delphi — plusieurs évaluateurs cotent indépendamment, puis convergent vers un consensus — réduit les biais individuels [13].

- **Actualiser la matrice.** La matrice n'est pas un artefact statique. L'EA doit l'actualiser trimestriellement pour intégrer les changements de contexte : nouvelles réglementations, évolution des capacités techniques, retour d'expérience des projets en cours.

- **Communiquer les résultats.** La matrice est un outil de communication aussi puissant qu'un outil d'analyse. Une bulle rouge dans le quadrant IV est un argument visuel plus persuasif qu'un paragraphe de texte pour convaincre un dirigeant d'abandonner un projet sans valeur.

L'Annexe E fournit un *template* vierge de la matrice valeur/risque/délai ainsi qu'un exemple rempli pour un portefeuille IA fictif de dix cas d'usage.

#### 5.4 *Capability-based planning* appliqué à l'IA : identifier les capacités manquantes

##### 5.4.1 Du cas d'usage à la capacité

Le quatrième cadre d'analyse opère un changement de perspective fondamental : au lieu de partir des cas d'usage IA (« que voulons-nous faire ? »), il part des capacités métier (« de quoi avons-nous besoin pour le faire ? »). Le *capability-based planning* (planification fondée sur les capacités) est un pilier méthodologique du cadre TOGAF et une compétence historique de l'EA [6]. Son application à l'IA renforce la contribution stratégique de l'architecte en connectant les investissements technologiques aux capacités métier fondamentales.

Le principe directeur est simple : les cas d'usage IA ne créent de la valeur que s'ils s'appuient sur des capacités métier matures. Une capacité métier (*business capability*) est définie comme la combinaison de personnes, de processus, de technologies et d'informations qu'une organisation doit posséder pour produire un résultat métier spécifique [14]. Contrairement aux processus qui décrivent le « comment », les capacités décrivent le « quoi » — elles restent stables même lorsque les processus et les technologies évoluent.

##### 5.4.2 Architecture d'un modèle de capacités IA

L'EA construit un modèle de capacités IA en trois couches :

**Couche 1 — Capacités métier fondamentales.** Ce sont les capacités que l'organisation doit posséder indépendamment de l'IA : gestion de la relation client, gestion de la chaîne d'approvisionnement, gestion des risques, développement de produits, etc. Chaque capacité est décomposée en sous-capacités de niveau 2 et 3.

**Couche 2 — Capacités IA transversales.** Ce sont les capacités technologiques et organisationnelles nécessaires pour déployer l'IA, quel que soit le cas d'usage : gestion de la qualité des données, plateforme *MLOps*, gouvernance des modèles, gestion du changement IA, mesure de la valeur IA. Ces capacités sont des « multiplicateurs de force » : un investissement dans une capacité transversale débloque simultanément plusieurs cas d'usage.

**Couche 3 — Capacités IA spécifiques.** Ce sont les capacités requises par des cas d'usage particuliers : traitement du langage naturel (*NLP* — *Natural Language Processing*) pour les chatbots, vision par ordinateur pour l'inspection qualité, modélisation prédictive pour la prévision de la demande.

[Figure 5.2 — Modèle de capacités IA en trois couches]

##### 5.4.3 Analyse des écarts de capacités

L'analyse des écarts (*gap analysis*) est une technique prescrite par TOGAF dans sa phase E du cycle ADM (*Opportunities and Solutions*), où l'architecte compare l'architecture de base avec l'architecture cible pour identifier les éléments manquants, les incohérences et les inadéquations [6]. Appliquée à l'IA, cette technique prend la forme suivante :

1. **Inventorier les capacités actuelles.** Pour chaque capacité du modèle, évaluer le niveau de maturité actuel en utilisant une échelle standardisée (par exemple : inexistant, initial, reproductible, défini, géré, optimisé).

2. **Définir les capacités cibles.** Pour chaque cas d'usage IA prioritaire (issu de la matrice valeur/risque/délai de la section 5.3), identifier les capacités requises et le niveau de maturité minimal nécessaire.

3. **Calculer les écarts.** La différence entre le niveau cible et le niveau actuel produit une carte d'écarts de capacités.

4. **Identifier les investissements structurants.** Les capacités transversales (couche 2) présentant un écart critique deviennent des investissements prioritaires, car elles débloquent simultanément plusieurs cas d'usage. Par exemple, un investissement dans la qualité des données (couche 2) peut simultanément permettre la prévision de la demande, la détection de fraude et la personnalisation client — un effet de levier que seule une analyse par capacités permet de révéler.

L'IA générative peut elle-même accélérer cet exercice : les outils modernes d'architecture d'entreprise utilisent l'IA pour comparer l'architecture de base avec l'architecture cible, identifier les éléments manquants et recommander des plans d'action structurés avec des niveaux de priorité, des équipes responsables et des échéanciers [15].

##### 5.4.4 De l'analyse à la feuille de route

L'analyse des capacités manquantes se traduit en une feuille de route de développement de capacités (*capability roadmap*), séquencée en trois horizons :

- **Horizon 1 (0-6 mois) :** Développer les capacités transversales fondamentales — qualité des données, gouvernance des modèles, plateforme d'expérimentation.
- **Horizon 2 (6-18 mois) :** Construire les capacités IA spécifiques pour les *quick wins* et les leviers majeurs identifiés dans la matrice.
- **Horizon 3 (18-36 mois) :** Développer les capacités avancées pour les agents IA et les nouveaux produits digitaux.

Cette séquence est cohérente avec la feuille de route présentée au chapitre 13. La valeur ajoutée de l'approche par capacités est qu'elle justifie les investissements fondationnels — souvent difficiles à « vendre » à la direction — en démontrant leur effet multiplicateur sur le portefeuille de cas d'usage.

#### 5.5 *Business capability heat maps* et *AI readiness scoring*

##### 5.5.1 Visualiser la préparation IA de l'organisation

Le cinquième cadre d'analyse combine deux techniques de visualisation que l'EA maîtrise traditionnellement — les cartes de chaleur de capacités (*business capability heat maps*) — avec une dimension nouvelle : l'évaluation de la préparation à l'IA (*AI readiness scoring*).

Une carte de chaleur de capacités est un diagramme bidimensionnel qui colore chaque capacité métier selon un critère d'évaluation : maturité, performance, importance stratégique ou, dans notre cas, préparation à l'IA [13]. L'utilisation de couleurs (vert, jaune, orange, rouge) rend la complexité lisible d'un seul coup d'oeil — un avantage décisif pour la communication avec la direction générale.

SAP LeanIX décrit la carte de chaleur de capacités comme un artefact qui « évalue la force, la maturité et la pertinence stratégique de chaque capacité » et qui constitue un outil de communication privilégié avec les dirigeants [16]. Dans le contexte de l'IA, la carte de chaleur répond à la question : « Quelles zones de l'organisation sont prêtes pour l'IA, et lesquelles ne le sont pas ? »

##### 5.5.2 Construction d'un *AI Readiness Score*

Le *AI Readiness Score* est un indice composite calculé pour chaque capacité métier, intégrant les quatre dimensions identifiées dans la section 5.1 :

**Score de préparation IA = f(Données, Plateformes, Processus, Talents)**

Pour chaque capacité métier, l'EA calcule un score composite en évaluant et en pondérant les quatre dimensions. La pondération peut varier selon le type d'usage IA envisagé (la dimension « Données » pèse plus lourd pour un cas d'usage de prédiction que pour un cas d'usage d'automatisation de processus).

Le *Cisco AI Readiness Index* propose une méthodologie similaire à l'échelle de l'organisation, évaluant la préparation IA selon six piliers : stratégie, infrastructure, données, gouvernance, talent et culture [2]. L'apport de l'EA est de descendre cette évaluation au niveau de chaque capacité métier, offrant ainsi une granularité décisionnelle que les indices globaux ne fournissent pas.

Le score obtenu positionne chaque capacité dans l'une de quatre catégories :

- **AI-ready (score ≥ 4/5)** : la capacité peut accueillir des cas d'usage IA immédiatement. Couleur : vert.
- **AI-conditionnelle (score 3-3,9/5)** : la capacité nécessite des investissements ciblés avant le déploiement IA. Couleur : jaune.
- **AI-émergente (score 2-2,9/5)** : la capacité nécessite des investissements structurels significatifs. Couleur : orange.
- **AI-non prête (score < 2/5)** : la capacité n'est pas candidate à l'IA dans l'horizon de planification. Couleur : rouge.

##### 5.5.3 La carte de chaleur IA en pratique

[Figure 5.3 — Exemple de carte de chaleur *AI readiness* par domaine de capacité]

La carte de chaleur IA est construite en superposant le *AI Readiness Score* à la carte de capacités métier de l'organisation. Le résultat est une représentation visuelle qui répond simultanément à deux questions :

1. **Où l'IA peut-elle être déployée rapidement ?** Les zones vertes identifient les capacités métier où l'IA peut générer de la valeur à court terme, sans investissement préalable majeur.

2. **Où sont les obstacles structurels ?** Les zones rouges et orange identifient les capacités où des investissements fondationnels sont nécessaires avant tout déploiement IA.

L'EA utilise cette carte pour trois usages stratégiques :

**Alignement portefeuille-capacités.** En superposant les cas d'usage IA du portefeuille (section 5.3) sur la carte de chaleur, l'EA identifie immédiatement les projets qui reposent sur des capacités insuffisantes — et peut recommander leur report ou leur rééchelonnement.

**Communication avec la C-suite.** La carte de chaleur est, selon Capstera, « un artefact substantiel pour créer des vues convaincantes et colorées [...] qui constitue un outil précieux pour mettre en évidence les considérations essentielles auprès de la direction générale » [13]. Un CEO qui voit 70 % de ses capacités en rouge comprend immédiatement pourquoi l'IA « ne marche pas encore » — sans avoir besoin d'un rapport de 50 pages.

**Planification des investissements séquencés.** La carte de chaleur guide la séquence d'investissement : commencer par les capacités transversales en orange (couche 2 du modèle de capacités), puis les capacités spécifiques les plus stratégiques. L'objectif est de faire « verdir » progressivement la carte au fil des trimestres.

##### 5.5.4 Intégration avec les outils de *Strategic Portfolio Management*

Les outils modernes d'architecture d'entreprise intègrent nativement les cartes de chaleur de capacités. Bizzdesign, reconnu comme Leader dans le *Gartner Magic Quadrant 2025* pour les outils d'architecture d'entreprise et pour le *Strategic Portfolio Management*, offre désormais un accès piloté par l'IA aux données d'architecture d'entreprise via le *Model Context Protocol* [17]. SAP LeanIX, également Leader dans ce même quadrant, propose des évaluations de capacités métier automatisées avec visualisation par carte de chaleur [16].

L'EA doit exploiter ces outils non comme de simples instruments de documentation, mais comme des plateformes analytiques qui alimentent les conversations stratégiques. Le rapport BOC Group sur les tendances EA 2025-2026 note que l'architecture d'entreprise évolue d'un dépôt statique vers une « architecture vivante » enrichie en continu par des données en temps réel, avec une prise de décision fondée sur l'intelligence en temps réel de l'état de l'organisation [18].

#### 5.6 Comment l'EA aide le leadership à prioriser les initiatives IA (RICE, MoSCoW, ICE appliqués à l'IA)

##### 5.6.1 Au-delà de la matrice : des cadres de priorisation opérationnels

La matrice valeur/risque/délai (section 5.3) fournit une vue de portefeuille. Mais les comités d'investissement ont besoin de cadres de priorisation opérationnels pour comparer des initiatives individuelles et prendre des décisions de séquencement précises. L'EA peut mobiliser trois cadres de priorisation éprouvés — RICE, MoSCoW et ICE — en les adaptant aux spécificités de l'IA.

Une étude comparative publiée dans *Science Online* en 2025 conclut qu'il n'existe pas de méthode universellement supérieure parmi MoSCoW, ICE, RICE et WSJF (*Weighted Shortest Job First*) : l'efficacité de chaque méthode dépend du stade de développement de l'organisation, de la disponibilité des données, de la maturité organisationnelle et des priorités stratégiques [19]. L'EA, par sa connaissance du contexte organisationnel, est le mieux placé pour recommander le cadre approprié.

##### 5.6.2 RICE adapté à l'IA

Le cadre RICE (*Reach, Impact, Confidence, Effort*), développé par l'équipe produit d'Intercom, évalue chaque initiative selon quatre facteurs [20] :

- **Reach (Portée)** : Combien d'utilisateurs, de processus ou de flux de valeur seront affectés par cette initiative IA dans une période donnée ?
- **Impact (Impact)** : Quel sera l'effet sur les objectifs stratégiques de l'organisation ? (Échelle : 3 = massif, 2 = élevé, 1 = moyen, 0,5 = faible, 0,25 = minimal)
- **Confidence (Confiance)** : Quel est le niveau de certitude de l'évaluation ? Cette dimension est critique pour l'IA, où les estimations de performance des modèles sont souvent incertaines avant la phase de *proof of concept* (PoC).
- **Effort (Effort)** : Combien de personnes-mois sont nécessaires pour développer, déployer et maintenir l'initiative ?

**Score RICE = (Reach × Impact × Confidence) / Effort**

L'adaptation IA du cadre RICE a donné naissance au cadre A-RICE (*AI-RICE*), qui ajoute un cinquième facteur : la complexité IA (*AI Complexity*) [21]. Ce facteur capture l'effort spécifique au cycle de vie de l'IA — conception, entraînement et déploiement des modèles — en s'assurant que les défis propres à l'IA sont pondérés de manière adéquate. Chaque facteur est évalué sur une échelle de 1 à 5 :

**Score A-RICE = (Reach × Impact × Confidence) / (Effort × AI Complexity)**

[Tableau 5.3 — Exemple de scoring A-RICE pour un portefeuille IA]

| Initiative IA | Reach | Impact | Confidence | Effort | AI Complexity | Score A-RICE | Rang |
|---|---|---|---|---|---|---|---|
| Automatisation factures | 4 | 2 | 4 | 2 | 1 | 16,0 | 1 |
| Copilote rédaction | 5 | 2 | 3 | 3 | 2 | 5,0 | 3 |
| Détection anomalies | 3 | 3 | 3 | 3 | 3 | 3,0 | 5 |
| Agent service client | 5 | 3 | 2 | 4 | 4 | 1,9 | 6 |
| Prévision demande | 3 | 3 | 4 | 3 | 2 | 6,0 | 2 |
| Personnalisation temps réel | 5 | 2 | 2 | 4 | 3 | 1,7 | 7 |
| Chatbot FAQ interne | 4 | 1 | 5 | 1 | 1 | 20,0 | Non inclus* |

*\*Score élevé mais impact stratégique marginal — illustre la limite du scoring purement quantitatif.*

##### 5.6.3 MoSCoW adapté à l'IA

Le cadre MoSCoW (*Must have, Should have, Could have, Won't have*) est un cadre de priorisation catégorielle, plus simple que RICE mais puissant pour structurer les décisions de portefeuille IA [22] :

- **Must have (Doit avoir)** : Initiatives IA sans lesquelles l'organisation perd un avantage concurrentiel ou enfreint une obligation réglementaire. Exemple : mise en conformité avec le *EU AI Act* pour les modèles à haut risque.
- **Should have (Devrait avoir)** : Initiatives à forte valeur qui ne sont pas critiques à court terme. Exemple : optimisation de la chaîne d'approvisionnement par IA prédictive.
- **Could have (Pourrait avoir)** : Initiatives souhaitables si les ressources le permettent. Exemple : génération automatique de rapports analytiques.
- **Won't have (N'aura pas)** : Initiatives explicitement exclues de la période de planification actuelle. Exemple : agents IA autonomes dans les processus critiques avant la mise en place de la gouvernance adéquate.

L'adaptation IA du cadre MoSCoW exige de l'EA une attention particulière à la catégorie « Won't have ». Trop d'organisations évitent de dire « non » aux projets IA portés par des dirigeants enthousiastes. Le cadre MoSCoW formalise ce « non » en le positionnant comme une décision stratégique explicite — pas un rejet, mais un report justifié.

##### 5.6.4 ICE adapté à l'IA

Le cadre ICE (*Impact, Confidence, Ease*) est le cadre le plus léger des trois, adapté aux organisations en phase exploratoire ou aux décisions rapides [23] :

- **Impact** : Quel est l'effet attendu sur les objectifs métier ?
- **Confidence** : Quel est le degré de certitude de l'estimation ?
- **Ease (Facilité)** : Quelle est la facilité de mise en oeuvre ?

**Score ICE = Impact × Confidence × Ease**

L'avantage du cadre ICE est sa rapidité : une session de 90 minutes suffit pour évaluer et classer 15 à 20 cas d'usage IA. Son inconvénient est sa subjectivité accrue — l'absence de la dimension « Reach » (portée) peut conduire à surévaluer des initiatives à impact élevé mais à portée limitée.

L'étude comparative de 2025 recommande une utilisation séquentielle : ICE pour le filtrage initial (passer de 100 idées à 20), RICE pour la priorisation précise (passer de 20 à 10), et MoSCoW pour la décision finale du portefeuille (catégoriser les 10 retenues) [19].

##### 5.6.5 Synthèse : quel cadre utiliser quand ?

[Tableau 5.4 — Guide de sélection des cadres de priorisation IA]

| Critère | ICE | RICE | A-RICE | MoSCoW |
|---|---|---|---|---|
| Complexité d'utilisation | Faible | Modérée | Modérée | Faible |
| Objectivité | Faible | Modérée | Élevée | Faible |
| Adapté aux phases | Exploration | Planification | Planification IA | Décision portefeuille |
| Nombre d'initiatives | > 20 | 10-20 | 10-20 | < 10 |
| Temps requis | 1-2 heures | 3-4 heures | 4-5 heures | 1-2 heures |
| Intégration cycle EA | Ad hoc | Phase E TOGAF | Phase E TOGAF | Phase F TOGAF |
| Forces | Rapidité | Équilibre | Spécifique IA | Clarté catégorielle |
| Limites | Subjectivité | Complexité moyenne | Expertise requise | Non quantitatif |

##### 5.6.6 Le rôle de l'EA comme facilitateur de la priorisation

Le rôle de l'EA dans la priorisation ne se limite pas au choix et à l'application mécanique d'un cadre. L'EA apporte quatre contributions distinctives :

**Contextualisation architecturale.** L'EA enrichit les scores de priorisation avec sa connaissance des dépendances architecturales. Deux initiatives qui partagent une même plateforme de données peuvent être plus efficacement séquencées ensemble, même si leurs scores RICE individuels les classeraient différemment.

**Identification des synergies.** L'EA identifie les cas d'usage qui partagent des capacités communes (section 5.4) et recommande leur regroupement en programmes plutôt que leur traitement en initiatives isolées. Un programme « qualité des données + gouvernance des modèles + trois cas d'usage dépendants » est plus efficace que cinq initiatives indépendantes.

**Arbitrage des conflits.** Lorsque le scoring produit des égalités ou des résultats contre-intuitifs (comme le chatbot FAQ du tableau 5.3 qui obtient le score le plus élevé malgré un impact stratégique marginal), l'EA apporte le jugement contextuel nécessaire. Le scoring est un outil d'aide à la décision, pas un substitut au jugement.

**Actualisation continue.** L'EA maintient un *backlog* IA priorisé, actualisé à chaque cycle de planification (trimestriel ou semestriel). Les initiatives qui descendent dans le classement après réévaluation sont explicitement communiquées à la direction, avec les raisons du changement. Gartner rapporte que 95 % des *Pacesetters* suivent l'impact de leurs investissements IA — trois fois plus que les autres organisations [2]. La priorisation n'est pas un exercice ponctuel ; c'est une discipline continue.

#### Points clés à retenir

> **Cadre 1 — Cartographie ambitions vs capacités.** Évaluer systématiquement l'écart entre les ambitions IA de l'organisation et ses capacités réelles sur quatre dimensions (données, plateformes, processus, talents). Les *Pacesetters* de Cisco se distinguent par des scores élevés sur les quatre dimensions : 76 % de données centralisées, 71 % de réseaux flexibles, 75 % de personnel formé à l'IA [2].
>
> **Cadre 2 — Typologie des usages.** Distinguer quatre catégories d'usage IA (automatisation, augmentation, agents, produits digitaux), chacune avec des exigences architecturales, des profils de risque et des horizons de ROI distincts. Maintenir un portefeuille équilibré : 70 % *quick wins*, 20 % leviers majeurs, 10 % explorations stratégiques [11].
>
> **Cadre 3 — Matrice valeur/risque/délai.** Évaluer chaque cas d'usage IA selon trois axes (valeur métier, risque, délai) et positionner le portefeuille dans quatre quadrants stratégiques. Seulement une initiative IA sur cinq atteint un ROI positif [12] — la priorisation rigoureuse est la réponse.
>
> **Cadre 4 — *Capability-based planning*.** Passer de l'analyse par cas d'usage à l'analyse par capacités. Identifier les capacités transversales manquantes (qualité des données, gouvernance des modèles) dont le développement débloque simultanément plusieurs initiatives IA.
>
> **Cadre 5 — Cartes de chaleur *AI readiness*.** Visualiser la préparation IA de chaque domaine de capacité métier par un score composite et une carte de chaleur. Cet artefact est un outil de communication aussi puissant qu'un outil d'analyse.
>
> **Cadre 6 — Priorisation opérationnelle (RICE, MoSCoW, ICE).** Utiliser des cadres de priorisation adaptés à l'IA — notamment A-RICE qui intègre la complexité IA comme facteur de scoring — pour transformer les décisions de portefeuille en classements actionnables.
>
> **Le fil conducteur.** L'EA est la seule fonction organisationnelle qui combine la vision transversale, la connaissance architecturale et la maîtrise des cadres analytiques nécessaires pour exercer ce rôle de conseil. Les cadres présentés dans ce chapitre ne sont pas des instruments théoriques : ce sont les outils concrets du repositionnement stratégique.

#### Transition

Ce chapitre a équipé l'architecte d'entreprise de six cadres d'analyse pour exercer son rôle de conseiller stratégique en IA. Mais les cadres ne suffisent pas : encore faut-il disposer des compétences pour les déployer. La maîtrise des modèles de capacités, la facilitation d'ateliers de priorisation, la communication visuelle avec la C-suite — ces pratiques exigent un élargissement significatif du profil de compétences de l'EA. Le chapitre 6 détaille les trois dimensions de ce nouveau profil — technique, métier et influence — et propose un parcours de montée en compétences structuré pour chacune d'entre elles.

---

#### Références

[1] A. Singla, A. Sukharevsky et L. Yee, « The State of AI: How Organizations Are Rewiring to Capture Value », McKinsey & Company, mars 2025. [En ligne]. Disponible : https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-state-of-ai

[2] Cisco Systems, « Cisco AI Readiness Index 2025 », octobre 2025. [En ligne]. Disponible : https://www.cisco.com/c/m/en_us/solutions/ai/readiness-index.html

[3] Everest Group, « Turning AI Ambition into Enterprise-Scale Impact », 2025. [En ligne]. Disponible : https://www.everestgrp.com/report/egr-2025-21-v-7691/

[4] Slalom, « AI Research Outlook 2026: The Ambition-Execution Gap Is Widening », 2025. [En ligne]. Disponible : https://www.slalom.com/us/en/insights/ai-research-outlook-2026

[5] Atlan, « AI Readiness Assessment: Your 2026 Implementation Guide », 2026. [En ligne]. Disponible : https://atlan.com/know/ai-readiness/ai-ready-data/

[6] The Open Group, « TOGAF Standard — Business Capabilities » et « TOGAF 9.1 Gap Analysis », The Open Group Publications. [En ligne]. Disponible : https://pubs.opengroup.org/togaf-standard/business-architecture/business-capabilities.html

[7] Gartner, « Gartner Predicts 40% of Enterprise Apps Will Feature Task-Specific AI Agents by 2026 », communiqué de presse, 26 août 2025. [En ligne]. Disponible : https://www.gartner.com/en/newsroom/press-releases/2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025

[8] IDC, « FutureScape: Worldwide Artificial Intelligence and Automation Predictions », 2024-2025. [En ligne]. Disponible : https://www.idc.com

[9] Gartner, « Enterprise Guide to Generative AI: Expert Insights on ROI, Use Cases, and Cost Management », 2025. [En ligne]. Disponible : https://www.gartner.com/en/topics/generative-ai

[10] Forrester, « AI Agents Are Ready, People and Data Are Not » et « Agentic AI Is the Next Competitive Frontier », 2025. [En ligne]. Disponible : https://www.forrester.com/blogs/agentic-ai-is-the-next-competitive-frontier/

[11] MonFreelancer, « Priorisez vos automatisations IA : la matrice impact × faisabilité », 2025. [En ligne]. Disponible : https://monfreelancer.fr/automatisation-ia-en-eti/

[12] Gartner, « AI Roadmap: What It Is and How to Build One », 2025. [En ligne]. Disponible : https://www.gartner.com/en/articles/ai-roadmap

[13] Capstera, « Business Capability Heatmaps: Generate Heat Maps Using Capabilities », 2025. [En ligne]. Disponible : https://www.capstera.com/business-capability-heatmaps/

[14] Visual Paradigm, « Comprehensive Guide to Business Capability Planning in TOGAF », janvier 2025. [En ligne]. Disponible : https://togaf.visual-paradigm.com/2025/01/21/comprehensive-guide-to-business-capability-planning-in-togaf/

[15] Visual Paradigm, « How Generative AI Is Revolutionizing Enterprise Architecture with TOGAF and Visual Paradigm », 2025. [En ligne]. Disponible : https://www.go-togaf.com/generative-ai-and-togaf-architectural-transformation/

[16] SAP LeanIX, « Business Capability Assessment », 2025. [En ligne]. Disponible : https://www.leanix.net/en/wiki/ea/business-capability-assessment

[17] Bizzdesign, « AI-Driven Access to Enterprise Data with Model Context Protocol » et « Bizzdesign Enters 2026 with Strengthened Market Position and AI-Driven Vision », 2025-2026. [En ligne]. Disponible : https://bizzdesign.com/blog/empower-everyone-ai-driven-access-enterprise-data

[18] BOC Group, « EA Outlook: Trends 2025-2026 », 2025. [En ligne]. Disponible : https://www.boc-group.com/en/blog/ea/how-to-assess-your-business-capabilities/

[19] V. Kovalenko et al., « Comparative Analysis of Feature Prioritisation Methods: ICE, RICE, WSJF, MoSCoW and Their Applicability for Startups », *Science Online*, vol. 9, 2025. [En ligne]. Disponible : https://nauka-online.com/en/publications/economy/2025/9/06-29/

[20] S. McBride, « RICE: Simple Prioritization for Product Managers », Intercom Blog, 2025. [En ligne]. Disponible : https://www.intercom.com/blog/rice-simple-prioritization-for-product-managers/

[21] Atomicwork, « A-RICE Framework: An IT Leader's Guide to Evaluating AI Initiatives for Enterprise IT », 2025. [En ligne]. Disponible : https://www.atomicwork.com/blog/evaluating-ai-initiatives

[22] Plane, « Feature Prioritization Frameworks: RICE, MoSCoW, and Kano Explained », 2025. [En ligne]. Disponible : https://plane.so/blog/feature-prioritization-frameworks-rice-moscow-and-kano-explained

[23] ProductLift, « ICE Scoring Model: Overview, How It Works, Examples », 2025. [En ligne]. Disponible : https://www.productlift.dev/blog/prioritizing-with-ice-model
