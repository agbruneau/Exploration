## Annexe F — Canevas de cas d'usage IA

### F.1 Introduction

Le canevas de cas d'usage IA est l'outil de documentation opérationnel présenté dans le chapitre 5 (section 5.1, Tableau 5.1) et référencé dans le chapitre 11 (patterns réutilisables). Il permet à l'architecte d'entreprise (EA) de documenter de manière exhaustive et structurée chaque initiative IA candidate, depuis l'identification du problème métier jusqu'à la décision de lancement (*go/no-go*).

Ce canevas remplit trois fonctions :

1. **Fonction analytique.** Il structure la réflexion de l'EA et des parties prenantes en imposant une documentation systématique des dimensions métier, techniques, architecturales, de risque et de gouvernance de chaque cas d'usage IA.

2. **Fonction décisionnelle.** Il fournit à la direction et aux comités d'investissement un dossier standardisé qui permet de comparer les initiatives sur des critères homogènes et de prendre des décisions de priorisation éclairées. Le canevas alimente directement la matrice valeur/risque/délai de l'Annexe E.

3. **Fonction de traçabilité.** Il constitue le document de référence pour chaque initiative IA tout au long de son cycle de vie — de l'idéation à la mise en production — et assure la traçabilité des décisions prises.

Cette annexe fournit :

1. Un **template vierge** du canevas, directement utilisable par l'EA ;
2. Un **guide de remplissage** détaillant les attentes pour chaque section ;
3. Deux **exemples remplis** (fictifs mais réalistes) illustrant l'utilisation du canevas pour des cas d'usage de catégories différentes.

---

### F.2 Template vierge du canevas de cas d'usage IA

#### Section 1 — Identification

| Champ | Valeur |
|---|---|
| **Identifiant du cas d'usage** | CU-AAAA-NNN (ex. : CU-2026-001) |
| **Nom du cas d'usage** | |
| **Sponsor métier** | |
| **Domaine métier** | |
| **Catégorie d'usage IA** | [ ] Automatisation [ ] Augmentation [ ] Agent IA [ ] Produit digital |
| **Date de création** | |
| **Date de dernière révision** | |
| **Version** | |
| **Auteur (EA responsable)** | |

#### Section 2 — Problème métier

| Champ | Description |
|---|---|
| **Description du problème** | |
| **Impact actuel sur l'organisation** | |
| **Processus métier affectés** | |
| **Parties prenantes concernées** | |
| **Métriques actuelles (référence)** | |

[Tableau F.1 — Métriques de référence (*baseline*)]

| Métrique | Valeur actuelle | Source de la mesure | Date de la mesure |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

#### Section 3 — Solution IA proposée

| Champ | Description |
|---|---|
| **Type d'IA** | [ ] Automatisation [ ] Augmentation [ ] Agent IA [ ] Produit digital |
| **Description de la solution** | |
| **Modèles / technologies envisagés** | |
| **Niveau de supervision humaine** | [ ] Aucune (*fully automated*) [ ] *Human-on-the-loop* [ ] *Human-in-the-loop* [ ] Pilotée par l'humain |
| **Alternatives évaluées** | |
| **Justification du choix IA** | |

#### Section 4 — Architecture cible

| Champ | Description |
|---|---|
| **Composants applicatifs** | |
| **Intégrations SI requises** | |
| **Flux de données** | |
| **Infrastructure requise** | |
| **Exigences de performance** | |

[Tableau F.2 — Données requises]

| Jeu de données | Source | Format | Qualité actuelle (1-5) | Qualité requise (1-5) | Écart | Action de remédiation |
|---|---|---|---|---|---|---|
| | | | /5 | /5 | | |
| | | | /5 | /5 | | |
| | | | /5 | /5 | | |

[Tableau F.3 — Cartographie ambitions vs capacités (lien section 5.1 du chapitre 5)]

| Dimension | Score actuel (1-5) | Score requis (1-5) | Écart | Commentaire |
|---|---|---|---|---|
| Données | /5 | /5 | | |
| Plateformes technologiques | /5 | /5 | | |
| Processus métier | /5 | /5 | | |
| Talents et compétences | /5 | /5 | | |
| **Écart global** | | | | [ ] Faible [ ] Modéré [ ] Critique |

*Échelle : 1 = inexistant, 2 = initial, 3 = défini, 4 = géré, 5 = optimisé (cf. chapitre 5, section 5.1.2)*

#### Section 5 — Évaluation valeur / risque / délai

*Cette section alimente directement la matrice de l'Annexe E.*

[Tableau F.4 — Évaluation de la valeur métier]

| Sous-critère | Pondération (%) | Score (/5) | Score pondéré | Justification |
|---|---|---|---|---|
| Impact sur le chiffre d'affaires | 25 % | /5 | | |
| Réduction des coûts opérationnels | 20 % | /5 | | |
| Amélioration de l'expérience client | 20 % | /5 | | |
| Avantage concurrentiel | 15 % | /5 | | |
| Alignement stratégique | 20 % | /5 | | |
| **Valeur métier agrégée (V)** | **100 %** | | **/5** | |

[Tableau F.5 — Évaluation du risque]

| Dimension de risque | Pondération (%) | Score (/5) | Score pondéré | Justification |
|---|---|---|---|---|
| Risque technique (Rt) | 30 % | /5 | | |
| Risque réglementaire (Rr) | 25 % | /5 | | |
| Risque organisationnel (Ro) | 25 % | /5 | | |
| Risque de dépendance fournisseur (Rd) | 20 % | /5 | | |
| **Risque agrégé (R)** | **100 %** | | **/5** | |

[Tableau F.6 — Évaluation du délai]

| Composante du délai | Estimation (mois) | Score (/5) | Justification |
|---|---|---|---|
| Développement technique | | /5 | |
| Acquisition / formation des compétences | | /5 | |
| Intégration dans les processus métier | | /5 | |
| Déploiement et adoption | | /5 | |
| **Délai total estimé** | **mois** | **/5** | |

**Score de priorité : S = V / (R x D) = ___**

**Quadrant stratégique :** [ ] I — *Quick win* [ ] II — Levier majeur [ ] III — Initiative stratégique [ ] IV — Candidate à l'abandon

*Cf. Annexe E, sections E.3.3 et E.4 pour les seuils et la méthode de scoring.*

#### Section 6 — Risques identifiés

[Tableau F.7 — Registre des risques]

| # | Catégorie | Description du risque | Probabilité (1-5) | Impact (1-5) | Score (P x I) | Stratégie de mitigation | Responsable |
|---|---|---|---|---|---|---|---|
| R1 | Technique | | /5 | /5 | | | |
| R2 | Technique | | /5 | /5 | | | |
| R3 | Métier | | /5 | /5 | | | |
| R4 | Humain | | /5 | /5 | | | |
| R5 | Réglementaire | | /5 | /5 | | | |

*Catégories de risque : Technique, Métier (*Business*), Humain, Réglementaire. Cf. chapitre 8 pour le cadre de médiation du risque IA.*

#### Section 7 — Gouvernance

| Champ | Description |
|---|---|
| **Classification réglementaire** | [ ] Risque minimal [ ] Risque limité [ ] Risque élevé [ ] Risque inacceptable (*EU AI Act*) |
| **Exigences de conformité applicables** | |
| **Exigences éthiques identifiées** | |
| **Mécanisme d'explicabilité** | |
| **Biais identifiés et mesures correctives** | |
| **Stratégie de *monitoring* en production** | |
| **Fréquence de réévaluation du modèle** | |
| **Responsable de la gouvernance** | |

*Cf. chapitre 9 pour le cadre de gouvernance IA et les stratégies de contrôle du Shadow AI.*

#### Section 8 — Métriques de succès

[Tableau F.8 — KPIs métier]

| KPI métier | Valeur de référence | Cible à 6 mois | Cible à 12 mois | Méthode de mesure |
|---|---|---|---|---|
| | | | | |
| | | | | |
| | | | | |

[Tableau F.9 — KPIs techniques]

| KPI technique | Valeur de référence | Cible | Seuil d'alerte | Méthode de mesure |
|---|---|---|---|---|
| | | | | |
| | | | | |
| | | | | |

#### Section 9 — Feuille de route

[Tableau F.10 — Phases de réalisation]

| Phase | Description | Livrables | Jalons | Durée estimée | Critères de passage |
|---|---|---|---|---|---|
| 1 — Cadrage | | | | | |
| 2 — *Proof of Concept* (PoC) | | | | | |
| 3 — Pilote | | | | | |
| 4 — Déploiement | | | | | |
| 5 — Exploitation et optimisation | | | | | |

#### Section 10 — Décision

| Champ | Valeur |
|---|---|
| **Décision** | [ ] Go [ ] Go conditionnel [ ] No-go [ ] Report |
| **Conditions (si Go conditionnel)** | |
| **Motif (si No-go ou Report)** | |
| **Prochaine étape** | |
| **Date de la décision** | |
| **Décideur(s)** | |
| **Date de réévaluation prévue** | |

---

### F.3 Guide de remplissage

Cette section détaille les attentes de l'EA pour chaque section du canevas et fournit des conseils pratiques pour un remplissage rigoureux.

#### F.3.1 Section 1 — Identification

L'identifiant suit la convention CU-AAAA-NNN (année-numéro séquentiel) pour assurer la traçabilité dans le portefeuille IA. Le **sponsor métier** est le dirigeant qui porte la responsabilité du résultat métier — pas le responsable technique. La **catégorie d'usage IA** est déterminée selon la typologie du chapitre 5, section 5.2.2 : automatisation (remplacement de tâches répétitives), augmentation (amplification des capacités humaines), agent IA (action autonome orientée objectif) ou produit digital (création de valeur nouvelle). Le choix de catégorie a des implications directes sur les exigences architecturales et le profil de risque.

#### F.3.2 Section 2 — Problème métier

L'EA veille à ce que le problème soit formulé en termes de résultat métier, pas en termes de solution technique. Un bon énoncé : « Le traitement manuel des réclamations clients nécessite 48 heures en moyenne, générant une insatisfaction mesurée à un NPS de 32. » Un mauvais énoncé : « Nous avons besoin d'un chatbot pour les réclamations. » Les **métriques de référence** (*baseline*) sont essentielles : elles constituent le point de comparaison sans lequel aucun retour sur investissement ne pourra être démontré.

#### F.3.3 Section 3 — Solution IA proposée

Le **niveau de supervision humaine** doit être cohérent avec la catégorie d'usage IA et le profil de risque. Un agent IA autonome dans un processus financier réglementé exige au minimum un mode *human-on-the-loop* (surveillance humaine avec capacité d'intervention). Les **alternatives évaluées** documentent les options non retenues (solution sans IA, solution d'un fournisseur tiers, solution *open source*) et la justification du choix. Ce champ protège l'EA contre le biais « *AI solutionism* » — la tendance à proposer l'IA quand une solution plus simple suffirait.

#### F.3.4 Section 4 — Architecture cible

Le tableau de cartographie ambitions vs capacités (Tableau F.3) reprend directement le cadre de la section 5.1 du chapitre 5. Il force une évaluation structurée de l'écart entre les capacités actuelles de l'organisation et les capacités requises par le cas d'usage. Un écart global « Critique » signale que des investissements fondationnels sont nécessaires avant le lancement — et que le cas d'usage sera probablement classé en Quadrant III de la matrice de l'Annexe E. Le **tableau des données requises** (Tableau F.2) est le complément granulaire de la dimension « Données » : il identifie chaque jeu de données nécessaire, sa source, sa qualité actuelle et les actions de remédiation requises.

#### F.3.5 Section 5 — Évaluation valeur / risque / délai

Cette section reprend les grilles d'évaluation de l'Annexe E (sections E.2.2 à E.2.4 et E.3.1). La colonne **Justification** est obligatoire : chaque score doit être argumenté pour permettre la discussion en atelier de priorisation et la traçabilité des décisions. Le score de priorité **S = V / (R x D)** positionne le cas d'usage dans l'un des quatre quadrants stratégiques. L'EA consulte les seuils de l'Annexe E (section E.4.2) pour l'interprétation et applique les garde-fous de la section E.4.3 (effet de seuil réglementaire, synergies architecturales, score élevé mais impact marginal).

#### F.3.6 Section 6 — Risques identifiés

Le registre des risques doit couvrir les quatre catégories définies au chapitre 8 : technique (complexité du modèle, qualité des données, intégrabilité), métier (impact sur le chiffre d'affaires en cas d'échec, dépendance à un processus critique), humain (résistance au changement, impact sur les emplois, littératie IA des utilisateurs) et réglementaire (conformité *EU AI Act*, RGPD, Loi 25, réglementations sectorielles). Chaque risque est accompagné d'une stratégie de mitigation concrète et d'un responsable nommé.

#### F.3.7 Section 7 — Gouvernance

La **classification réglementaire** selon le *EU AI Act* est obligatoire pour toute initiative IA susceptible d'affecter des citoyens européens. Les systèmes classés « risque élevé » entraînent des obligations spécifiques en matière de documentation technique, de surveillance humaine et d'évaluation de conformité (cf. chapitre 9). Le **mécanisme d'explicabilité** décrit comment les résultats du modèle seront rendus compréhensibles aux utilisateurs et aux régulateurs. La **stratégie de monitoring** précise les indicateurs de dérive (*drift*) du modèle, les seuils d'alerte et les procédures de réentraînement.

#### F.3.8 Section 8 — Métriques de succès

Les KPIs métier mesurent l'impact sur les résultats de l'organisation (revenus, coûts, satisfaction client, conformité). Les KPIs techniques mesurent la performance du système IA (latence, précision, rappel, disponibilité). Les deux types de KPIs sont nécessaires : un modèle IA techniquement performant qui ne génère pas de valeur métier mesurable est un échec; un système qui génère de la valeur métier mais dont les performances techniques se dégradent n'est pas pérenne. Les cibles à 6 et 12 mois permettent un suivi progressif et des ajustements en cours de route.

#### F.3.9 Section 9 — Feuille de route

La feuille de route suit un cycle en cinq phases standardisées. Les **critères de passage** définissent les conditions objectives qui doivent être remplies pour passer d'une phase à la suivante — ils constituent les points de décision *go/no-go* intermédiaires. L'EA veille à ce que chaque phase produise des livrables vérifiables et que les jalons soient réalistes. Le chapitre 11 (section 11.3, leçons de Cariad) rappelle que le séquençage rigoureux est une compétence architecturale critique.

#### F.3.10 Section 10 — Décision

La décision **Go conditionnel** est la plus fréquente en pratique : elle autorise le lancement sous réserve de conditions spécifiques (par exemple : « Go conditionnel à la validation de la conformité RGPD par le DPO avant le 30 avril »). La **date de réévaluation** est obligatoire pour les décisions de report — elle empêche les initiatives de rester indéfiniment dans les limbes.

---

### F.4 Exemple 1 — Automatisation de la classification documentaire (services financiers)

#### Section 1 — Identification

| Champ | Valeur |
|---|---|
| **Identifiant du cas d'usage** | CU-2026-001 |
| **Nom du cas d'usage** | Classification automatique de documents réglementaires |
| **Sponsor métier** | Directrice de la conformité — Marie-Claude Tremblay |
| **Domaine métier** | Conformité et affaires réglementaires |
| **Catégorie d'usage IA** | [x] Automatisation |
| **Date de création** | 2026-01-15 |
| **Date de dernière révision** | 2026-02-10 |
| **Version** | 1.2 |
| **Auteur (EA responsable)** | Philippe Lavoie, architecte d'entreprise senior |

#### Section 2 — Problème métier

| Champ | Description |
|---|---|
| **Description du problème** | L'équipe de conformité traite manuellement 1 200 documents réglementaires entrants par mois (avis de l'AMF, directives BSIF, circulaires internes). Le tri, la classification et le routage vers les analystes compétents mobilisent 3 ETP et génèrent un délai moyen de traitement de 72 heures, avec un taux d'erreur de classification de 8 %. |
| **Impact actuel sur l'organisation** | Retards dans la prise en compte des nouvelles exigences réglementaires. Risque de non-conformité évalué à 2 incidents par trimestre. Coût opérationnel de 285 000 $ CA / an pour le tri manuel. |
| **Processus métier affectés** | Veille réglementaire, analyse d'impact réglementaire, mise à jour des politiques internes |
| **Parties prenantes concernées** | Direction de la conformité, analystes réglementaires, département juridique, direction des risques |
| **Métriques actuelles (référence)** | Voir Tableau F.1 ci-dessous |

[Tableau F.1 — Métriques de référence]

| Métrique | Valeur actuelle | Source de la mesure | Date de la mesure |
|---|---|---|---|
| Volume mensuel de documents | 1 200 documents/mois | GED (*Gestion Électronique de Documents*) | Janvier 2026 |
| Délai moyen de classification | 72 heures | Système de suivi des tâches | Q4 2025 |
| Taux d'erreur de classification | 8 % | Audit interne | Q4 2025 |
| Coût annuel du processus | 285 000 $ CA | Comptabilité analytique | 2025 |
| ETP dédiés au tri | 3 ETP | RH | Janvier 2026 |

#### Section 3 — Solution IA proposée

| Champ | Description |
|---|---|
| **Type d'IA** | [x] Automatisation |
| **Description de la solution** | Système de classification automatique utilisant un modèle de traitement du langage naturel (*NLP*) combiné à la reconnaissance optique de caractères (*OCR*) pour les documents numérisés. Le système classe chaque document entrant selon une taxonomie de 45 catégories réglementaires, extrait les métadonnées clés (émetteur, date d'effet, domaine d'application) et route automatiquement vers l'analyste compétent. |
| **Modèles / technologies envisagés** | Modèle de classification supervisé (*fine-tuned*) sur la base d'un modèle de fondation francophone. *OCR* pour les documents numérisés. Intégration via *API* REST avec la GED existante. |
| **Niveau de supervision humaine** | [x] *Human-on-the-loop* — validation par échantillonnage (10 % des classifications) et revue systématique des documents classés avec un score de confiance < 0,85 |
| **Alternatives évaluées** | (1) Embauche de personnel supplémentaire — rejeté pour raisons de coût et de délai. (2) Règles de classification par mots-clés — rejeté pour taux d'erreur trop élevé sur les documents complexes (> 20 %). (3) Solution SaaS spécialisée — rejeté pour raisons de souveraineté des données réglementaires. |
| **Justification du choix IA** | Le volume de documents (1 200/mois), la complexité de la taxonomie (45 catégories) et l'exigence de rapidité (< 24 h) rendent l'automatisation par IA nettement supérieure aux alternatives. Le *NLP* atteint des taux de précision > 92 % sur des tâches de classification documentaire comparables. |

#### Section 4 — Architecture cible

| Champ | Description |
|---|---|
| **Composants applicatifs** | Module *OCR*, modèle *NLP* de classification, moteur de routage, tableau de bord de supervision, connecteur GED |
| **Intégrations SI requises** | GED (OpenText) via *API* REST, système de gestion des tâches (ServiceNow), annuaire des analystes (Active Directory) |
| **Flux de données** | Document entrant (GED) -> *OCR* -> texte brut -> modèle *NLP* -> classification + métadonnées -> routage -> notification analyste |
| **Infrastructure requise** | Serveur d'inférence (GPU modeste, 1x NVIDIA T4 ou équivalent infonuagique), stockage objet pour les documents traités, environnement *MLOps* pour le réentraînement périodique |
| **Exigences de performance** | Latence de classification < 30 secondes par document, disponibilité 99,5 %, précision ≥ 92 % |

[Tableau F.2 — Données requises]

| Jeu de données | Source | Format | Qualité actuelle | Qualité requise | Écart | Action de remédiation |
|---|---|---|---|---|---|---|
| Corpus de documents réglementaires historiques (3 ans) | GED | PDF, DOCX | 4/5 | 4/5 | 0 | Aucune |
| Taxonomie de classification (45 catégories) | Direction conformité | Tableur | 3/5 | 4/5 | 1 | Validation et normalisation par les analystes seniors |
| Historique de classification manuelle (étiquettes) | Système de tâches | CSV | 3/5 | 4/5 | 1 | Nettoyage des étiquettes incohérentes (estimé à 5 % du corpus) |

[Tableau F.3 — Cartographie ambitions vs capacités]

| Dimension | Score actuel | Score requis | Écart | Commentaire |
|---|---|---|---|---|
| Données | 4/5 | 4/5 | 0 | Corpus documentaire disponible et de bonne qualité |
| Plateformes technologiques | 3/5 | 3/5 | 0 | Infrastructure infonuagique existante suffisante |
| Processus métier | 4/5 | 4/5 | 0 | Processus de classification bien documenté |
| Talents et compétences | 3/5 | 3/5 | 0 | Équipe de données en place, compétences *NLP* disponibles |
| **Écart global** | | | | [x] Faible |

#### Section 5 — Évaluation valeur / risque / délai

[Tableau F.4 — Évaluation de la valeur métier]

| Sous-critère | Pondération | Score | Pondéré | Justification |
|---|---|---|---|---|
| Impact sur le chiffre d'affaires | 25 % | 2/5 | 0,50 | Impact indirect : réduction du risque de non-conformité |
| Réduction des coûts opérationnels | 20 % | 4/5 | 0,80 | Économie estimée de 190 000 $ CA/an (2 ETP réaffectés) |
| Amélioration de l'expérience client | 20 % | 2/5 | 0,40 | Impact indirect via la conformité accélérée |
| Avantage concurrentiel | 15 % | 3/5 | 0,45 | Positionnement comme institution proactive en conformité |
| Alignement stratégique | 20 % | 5/5 | 1,00 | Priorité 1 du plan stratégique : excellence réglementaire |
| **Valeur métier agrégée (V)** | **100 %** | | **3,15/5 arrondi à 4** | Score arrondi à 4 en raison de la valeur stratégique conformité |

[Tableau F.5 — Évaluation du risque]

| Dimension de risque | Pondération | Score | Pondéré | Justification |
|---|---|---|---|---|
| Risque technique (Rt) | 30 % | 1/5 | 0,30 | Technologie *NLP* mature, cas d'usage bien balisé |
| Risque réglementaire (Rr) | 25 % | 2/5 | 0,50 | Le système classe mais ne prend pas de décision autonome |
| Risque organisationnel (Ro) | 25 % | 1/5 | 0,25 | Équipe de conformité favorable au projet |
| Risque dépendance (Rd) | 20 % | 1/5 | 0,20 | Modèle entraîné en interne, pas de dépendance fournisseur critique |
| **Risque agrégé (R)** | **100 %** | | **1,25/5 arrondi à 1,3** | |

[Tableau F.6 — Évaluation du délai]

| Composante du délai | Estimation | Score | Justification |
|---|---|---|---|
| Développement technique | 6 semaines | 1/5 | Modèle pré-entraîné disponible, *fine-tuning* sur le corpus interne |
| Acquisition des compétences | 0 semaine | 1/5 | Compétences *NLP* disponibles en interne |
| Intégration processus métier | 3 semaines | 1/5 | Intégration GED via *API* existante |
| Déploiement et adoption | 3 semaines | 1/5 | Formation légère, supervision progressive |
| **Délai total estimé** | **3 mois** | **1/5** | |

**Score de priorité : S = V / (R x D) = 4 / (1,3 x 1) = 3,08**

**Quadrant stratégique :** [x] I — *Quick win*

#### Section 6 — Risques identifiés

[Tableau F.7 — Registre des risques]

| # | Catégorie | Description du risque | P (1-5) | I (1-5) | P x I | Stratégie de mitigation | Responsable |
|---|---|---|---|---|---|---|---|
| R1 | Technique | Précision du modèle insuffisante (< 92 %) sur les documents atypiques | 2/5 | 3/5 | 6 | Validation par échantillonnage de 10 %; boucle de réentraînement trimestrielle | Équipe *data science* |
| R2 | Technique | Documents numérisés de faible qualité réduisant la performance *OCR* | 2/5 | 2/5 | 4 | Filtre de qualité en amont; rejet automatique sous un seuil de lisibilité | Équipe *data science* |
| R3 | Réglementaire | Classification erronée d'un document à impact réglementaire majeur | 1/5 | 4/5 | 4 | Revue systématique des documents à score de confiance < 0,85; escalade automatique | Directrice conformité |
| R4 | Humain | Résistance des analystes percevant l'outil comme une menace | 1/5 | 2/5 | 2 | Communication sur la réaffectation vers des tâches d'analyse à valeur ajoutée | Gestionnaire du changement |

#### Section 7 — Gouvernance

| Champ | Description |
|---|---|
| **Classification réglementaire** | [x] Risque limité — le système assiste la classification mais ne prend pas de décision réglementaire autonome |
| **Exigences de conformité** | Traçabilité des classifications (conservation des scores de confiance et des décisions), conformité à la politique interne de gestion documentaire |
| **Exigences éthiques** | Aucun biais discriminatoire applicable (classification de documents, pas de personnes) |
| **Mécanisme d'explicabilité** | Score de confiance affiché pour chaque classification; possibilité pour l'analyste de consulter les termes clés ayant déterminé la classification |
| **Biais identifiés** | Biais potentiel vers les catégories surreprésentées dans le corpus d'entraînement. Mitigation : rééquilibrage du corpus et suivi de la distribution des classifications |
| **Stratégie de *monitoring*** | Tableau de bord de précision hebdomadaire; alerte si précision < 90 % sur une catégorie; audit trimestriel |
| **Fréquence de réévaluation** | Réentraînement trimestriel ou lors de modifications majeures de la taxonomie |
| **Responsable de la gouvernance** | Philippe Lavoie (EA) en coordination avec la directrice conformité |

#### Section 8 — Métriques de succès

[Tableau F.8 — KPIs métier]

| KPI métier | Référence | Cible à 6 mois | Cible à 12 mois | Méthode de mesure |
|---|---|---|---|---|
| Délai moyen de classification | 72 heures | < 4 heures | < 1 heure | Système de suivi des tâches |
| Taux d'erreur de classification | 8 % | < 5 % | < 3 % | Audit par échantillonnage mensuel |
| Coût annuel du processus | 285 000 $ CA | 190 000 $ CA | 145 000 $ CA | Comptabilité analytique |
| Incidents de non-conformité liés au délai de traitement | 2/trimestre | 0/trimestre | 0/trimestre | Registre des incidents |

[Tableau F.9 — KPIs techniques]

| KPI technique | Référence | Cible | Seuil d'alerte | Méthode de mesure |
|---|---|---|---|---|
| Précision du modèle (toutes catégories) | N/A | ≥ 92 % | < 90 % | Évaluation sur jeu de test étiqueté |
| Latence de classification | N/A | < 30 sec/document | > 60 sec | Monitoring applicatif |
| Disponibilité du service | N/A | 99,5 % | < 99 % | Monitoring infrastructure |
| Taux de documents rejetés (*OCR* illisible) | N/A | < 5 % | > 10 % | Logs applicatifs |

#### Section 9 — Feuille de route

[Tableau F.10 — Phases de réalisation]

| Phase | Description | Livrables | Jalons | Durée | Critères de passage |
|---|---|---|---|---|---|
| 1 — Cadrage | Validation du corpus, normalisation de la taxonomie, définition des *API* | Spécifications fonctionnelles, taxonomie validée, corpus nettoyé | Revue de cadrage (S+2) | 2 semaines | Taxonomie validée par les analystes seniors |
| 2 — PoC | *Fine-tuning* du modèle, tests de précision sur un échantillon | Modèle entraîné, rapport de performance | Démo PoC (S+5) | 3 semaines | Précision ≥ 90 % sur le jeu de test |
| 3 — Pilote | Déploiement sur un flux de 200 documents/mois (une catégorie réglementaire) | Système intégré à la GED, tableau de bord | Fin du pilote (S+8) | 3 semaines | Précision ≥ 92 %, adoption par 5 analystes |
| 4 — Déploiement | Extension à l'ensemble des 45 catégories et 1 200 documents/mois | Système en production, documentation | Mise en production (S+11) | 3 semaines | Précision ≥ 92 % sur toutes les catégories |
| 5 — Exploitation | Monitoring continu, réentraînement trimestriel, évolution de la taxonomie | Rapports de performance, modèles réentraînés | Revue trimestrielle | Continue | KPIs métier et techniques dans les cibles |

#### Section 10 — Décision

| Champ | Valeur |
|---|---|
| **Décision** | [x] Go |
| **Conditions** | N/A |
| **Motif** | Score de priorité S = 3,08 (Quadrant I). Écart de capacités faible. ROI démontrable à court terme. |
| **Prochaine étape** | Lancement de la Phase 1 (cadrage) — semaine du 3 mars 2026 |
| **Date de la décision** | 2026-02-18 |
| **Décideur(s)** | Marie-Claude Tremblay (sponsor), Philippe Lavoie (EA), Comité IA |
| **Date de réévaluation** | 2026-05-15 (fin du pilote) |

---

### F.5 Exemple 2 — Agent IA pour le traitement des réclamations (assurances)

#### Section 1 — Identification

| Champ | Valeur |
|---|---|
| **Identifiant du cas d'usage** | CU-2026-007 |
| **Nom du cas d'usage** | Agent IA autonome pour le traitement des réclamations IARD |
| **Sponsor métier** | Vice-président des opérations — Jean-François Bouchard |
| **Domaine métier** | Opérations d'assurance — indemnisation IARD (*Incendie, Accidents et Risques Divers*) |
| **Catégorie d'usage IA** | [x] Agent IA |
| **Date de création** | 2026-01-22 |
| **Date de dernière révision** | 2026-02-12 |
| **Version** | 0.9 (avant décision) |
| **Auteur (EA responsable)** | Sophie Gagnon, architecte d'entreprise |

#### Section 2 — Problème métier

| Champ | Description |
|---|---|
| **Description du problème** | Le traitement des réclamations IARD de faible complexité (bris de vitre, dégât d'eau mineur, vol simple) mobilise 40 % de la capacité des experts en sinistres pour des dossiers représentant 65 % du volume mais seulement 25 % de la valeur des indemnisations. Le délai moyen de traitement est de 14 jours pour ces réclamations simples, générant un NPS (*Net Promoter Score*) de 28 sur ce segment. |
| **Impact actuel sur l'organisation** | Saturation des experts en sinistres, qui consacrent trop de temps aux dossiers simples au détriment des dossiers complexes à forte valeur. Coût opérationnel estimé à 4,2 M$ CA/an pour le traitement des réclamations simples. Insatisfaction client mesurable (NPS 28). |
| **Processus métier affectés** | Réception des réclamations, évaluation de la couverture, estimation des dommages, approbation de l'indemnisation, paiement |
| **Parties prenantes concernées** | Direction des opérations, experts en sinistres, département juridique, direction de la conformité, service client, actuariat |
| **Métriques actuelles (référence)** | Voir Tableau F.1 ci-dessous |

[Tableau F.1 — Métriques de référence]

| Métrique | Valeur actuelle | Source de la mesure | Date de la mesure |
|---|---|---|---|
| Volume mensuel de réclamations simples | 3 400 dossiers/mois | Système de gestion des sinistres | Janvier 2026 |
| Délai moyen de traitement (réclamations simples) | 14 jours | Système de gestion des sinistres | Q4 2025 |
| Coût moyen de traitement par dossier simple | 103 $ CA | Comptabilité analytique | 2025 |
| NPS segment réclamations simples | 28 | Enquête satisfaction client | Q4 2025 |
| Taux de réouverture de dossiers simples | 6 % | Système de gestion des sinistres | Q4 2025 |
| ETP experts en sinistres (réclamations simples) | 18 ETP | RH | Janvier 2026 |

#### Section 3 — Solution IA proposée

| Champ | Description |
|---|---|
| **Type d'IA** | [x] Agent IA |
| **Description de la solution** | Agent IA capable de traiter de bout en bout les réclamations IARD de faible complexité : réception de la réclamation (formulaire ou conversation), vérification de la couverture contractuelle, analyse des pièces justificatives (photos, factures), estimation du montant d'indemnisation selon le barème applicable, génération de la proposition de règlement et envoi au client. L'agent opère de manière autonome pour les dossiers sous un seuil d'indemnisation de 5 000 $ CA et escalade automatiquement les dossiers complexes, ambigus ou au-dessus du seuil vers un expert humain. |
| **Modèles / technologies envisagés** | Modèle de fondation multimodal (texte + images) pour l'analyse des dossiers. Système de *Retrieval-Augmented Generation* (RAG) connecté aux conditions générales et particulières des contrats. Moteur de règles métier pour la vérification de couverture. Orchestration agentique via un *framework* multi-étapes. |
| **Niveau de supervision humaine** | [x] *Human-on-the-loop* — l'agent traite de manière autonome sous le seuil de 5 000 $ CA; supervision par échantillonnage (15 % des dossiers) et escalade automatique pour les cas hors périmètre |
| **Alternatives évaluées** | (1) Automatisation par règles (*RPA*) — rejeté car insuffisant pour l'analyse de pièces justificatives non structurées (photos). (2) Chatbot conversationnel sans capacité de décision — rejeté car ne réduit pas le délai de traitement (l'expert reste nécessaire pour la décision). (3) Externalisation du traitement des dossiers simples — rejeté pour raisons de coûts à moyen terme et de contrôle qualité. |
| **Justification du choix IA** | Le volume (3 400 dossiers/mois), la nature semi-structurée des données (formulaires + photos + contrats) et l'exigence de rapidité justifient un agent IA autonome. La catégorie « Agent IA » est retenue plutôt que « Automatisation » en raison de la capacité de raisonnement requise (analyse de couverture, estimation de dommages, gestion des exceptions). |

#### Section 4 — Architecture cible

| Champ | Description |
|---|---|
| **Composants applicatifs** | Portail de réclamation client, orchestrateur agentique, module de vérification de couverture (RAG + règles métier), module d'analyse de pièces justificatives (vision par ordinateur), module d'estimation des dommages, module de génération de propositions, *AI Gateway* centralisé |
| **Intégrations SI requises** | Système de gestion des sinistres (Guidewire), CRM (Salesforce), système de paiement, base documentaire des contrats, système de notification client |
| **Flux de données** | Réclamation client -> portail -> orchestrateur -> [vérification couverture + analyse photos + estimation] -> proposition de règlement -> validation (automatique si < 5 000 $ ou escalade) -> paiement -> notification client |
| **Infrastructure requise** | Cluster GPU pour l'inférence multimodale (2x NVIDIA A10G ou équivalent infonuagique), stockage objet pour les pièces justificatives, environnement *MLOps* complet, *sandbox* d'expérimentation (cf. pattern *Agentic Safe Sandbox*, chapitre 11, section 11.5) |
| **Exigences de performance** | Temps de traitement complet < 2 heures (réclamation simple), disponibilité 99,9 %, précision de l'estimation ≥ 95 % (écart < 5 % par rapport à l'estimation humaine) |

[Tableau F.2 — Données requises]

| Jeu de données | Source | Format | Qualité actuelle | Qualité requise | Écart | Action de remédiation |
|---|---|---|---|---|---|---|
| Historique des réclamations (5 ans) | Guidewire | Structuré (BD) | 4/5 | 4/5 | 0 | Aucune |
| Conditions générales et particulières | Base documentaire | PDF | 3/5 | 5/5 | 2 | Indexation, vectorisation pour le RAG |
| Photos de dommages avec estimations | Système de sinistres | Images + labels | 2/5 | 4/5 | 2 | Constitution d'un jeu de données étiqueté (3 000 images minimum) |
| Barèmes d'indemnisation | Actuariat | Tableur | 4/5 | 5/5 | 1 | Formalisation en règles métier exploitables par le moteur |
| Données clients (contrats actifs) | CRM | Structuré (BD) | 4/5 | 4/5 | 0 | Aucune |

[Tableau F.3 — Cartographie ambitions vs capacités]

| Dimension | Score actuel | Score requis | Écart | Commentaire |
|---|---|---|---|---|
| Données | 3/5 | 4/5 | 1 | Corpus de photos de dommages insuffisant pour l'entraînement |
| Plateformes technologiques | 2/5 | 4/5 | 2 | Pas d'infrastructure GPU ni de *framework* agentique en place |
| Processus métier | 3/5 | 4/5 | 1 | Processus documenté mais non standardisé pour toutes les catégories IARD |
| Talents et compétences | 2/5 | 4/5 | 2 | Pas de compétences en orchestration agentique ni en vision par ordinateur |
| **Écart global** | | | | [x] Critique |

#### Section 5 — Évaluation valeur / risque / délai

[Tableau F.4 — Évaluation de la valeur métier]

| Sous-critère | Pondération | Score | Pondéré | Justification |
|---|---|---|---|---|
| Impact sur le chiffre d'affaires | 25 % | 3/5 | 0,75 | Rétention client améliorée par la rapidité de traitement |
| Réduction des coûts opérationnels | 20 % | 4/5 | 0,80 | Économie estimée de 2,5 M$ CA/an (12 ETP réaffectés aux dossiers complexes) |
| Amélioration de l'expérience client | 20 % | 5/5 | 1,00 | Réduction du délai de 14 jours à < 2 heures; NPS cible > 60 |
| Avantage concurrentiel | 15 % | 4/5 | 0,60 | Différenciation significative sur le marché IARD canadien |
| Alignement stratégique | 20 % | 4/5 | 0,80 | Priorité 2 du plan stratégique : excellence opérationnelle |
| **Valeur métier agrégée (V)** | **100 %** | | **3,95/5 arrondi à 4** | |

[Tableau F.5 — Évaluation du risque]

| Dimension de risque | Pondération | Score | Pondéré | Justification |
|---|---|---|---|---|
| Risque technique (Rt) | 30 % | 4/5 | 1,20 | Orchestration agentique multimodale non éprouvée en interne |
| Risque réglementaire (Rr) | 25 % | 3/5 | 0,75 | Décisions financières automatisées; conformité AMF et OSBI à valider |
| Risque organisationnel (Ro) | 25 % | 4/5 | 1,00 | Résistance anticipée des experts en sinistres; transformation des rôles |
| Risque dépendance (Rd) | 20 % | 3/5 | 0,60 | Dépendance au fournisseur du modèle multimodal; portabilité limitée |
| **Risque agrégé (R)** | **100 %** | | **3,55/5 arrondi à 3,5** | |

[Tableau F.6 — Évaluation du délai]

| Composante du délai | Estimation | Score | Justification |
|---|---|---|---|
| Développement technique | 6 mois | 4/5 | Orchestration agentique, entraînement du modèle de vision, intégrations multiples |
| Acquisition des compétences | 3 mois | 3/5 | Recrutement ou formation en orchestration agentique et vision par ordinateur |
| Intégration processus métier | 3 mois | 3/5 | Refonte partielle du processus de réclamation |
| Déploiement et adoption | 6 mois | 4/5 | Déploiement progressif par catégorie IARD; gestion du changement |
| **Délai total estimé** | **18 mois** | **4/5** | |

**Score de priorité : S = V / (R x D) = 4 / (3,5 x 4) = 0,29**

**Quadrant stratégique :** [x] III — Initiative stratégique à cadrer

#### Section 6 — Risques identifiés

[Tableau F.7 — Registre des risques]

| # | Catégorie | Description du risque | P (1-5) | I (1-5) | P x I | Stratégie de mitigation | Responsable |
|---|---|---|---|---|---|---|---|
| R1 | Technique | Précision insuffisante de l'estimation des dommages sur photos, entraînant des indemnisations erronées | 3/5 | 4/5 | 12 | Seuil de confiance strict; escalade automatique vers un expert pour tout écart > 10 % avec le barème | Architecte IA |
| R2 | Technique | Hallucination du modèle *RAG* sur les conditions contractuelles, générant une couverture erronée | 3/5 | 5/5 | 15 | Double vérification par moteur de règles déterministe; tests adversariaux; garde-fous (*guardrails*) | Architecte IA |
| R3 | Métier | Indemnisation automatique frauduleuse (fausses réclamations non détectées) | 2/5 | 5/5 | 10 | Intégration d'un module de détection de fraude en amont; plafond automatique à 5 000 $ CA | Direction des risques |
| R4 | Humain | Résistance forte des experts en sinistres percevant l'agent IA comme un remplacement | 4/5 | 3/5 | 12 | Programme de gestion du changement; repositionnement des experts sur les dossiers complexes à haute valeur | VP Opérations + RH |
| R5 | Réglementaire | Non-conformité aux exigences de l'AMF sur les décisions automatisées en assurance | 2/5 | 5/5 | 10 | Consultation juridique préalable; classification *EU AI Act* risque élevé; documentation de conformité complète | Département juridique |

#### Section 7 — Gouvernance

| Champ | Description |
|---|---|
| **Classification réglementaire** | [x] Risque élevé — décision financière automatisée affectant les assurés |
| **Exigences de conformité** | Conformité AMF (décisions automatisées), Loi 25 (données personnelles des assurés), traçabilité complète des décisions (journal d'audit), documentation technique conforme au *EU AI Act* |
| **Exigences éthiques** | Équité dans le traitement des réclamations (pas de biais selon le profil du réclamant); transparence de la décision; droit à l'intervention humaine pour tout assuré |
| **Mécanisme d'explicabilité** | Génération automatique d'un résumé de la décision pour l'assuré : motifs de la couverture, éléments retenus pour l'estimation, calcul du montant. Traçabilité complète du raisonnement de l'agent dans le journal d'audit. |
| **Biais identifiés** | Biais potentiel lié à la qualité des photos (pénalisation des réclamants disposant d'un équipement photographique de moindre qualité). Biais potentiel lié à la surreprésentation de certaines catégories de dommages dans le corpus d'entraînement. |
| **Stratégie de *monitoring*** | Tableau de bord en temps réel : taux d'escalade, écart estimation agent vs estimation humaine, temps de traitement, NPS. Audit mensuel par échantillonnage (15 % des dossiers traités). Détection de dérive du modèle par comparaison avec les barèmes actuariels. |
| **Fréquence de réévaluation** | Mensuelle pendant les 6 premiers mois, trimestrielle ensuite. Réévaluation immédiate en cas de changement réglementaire ou de mise à jour des barèmes. |
| **Responsable de la gouvernance** | Sophie Gagnon (EA) en coordination avec le département juridique et la direction des risques |

#### Section 8 — Métriques de succès

[Tableau F.8 — KPIs métier]

| KPI métier | Référence | Cible à 6 mois | Cible à 12 mois | Méthode de mesure |
|---|---|---|---|---|
| Délai moyen de traitement (réclamations simples) | 14 jours | 3 jours (pilote) | < 2 heures | Système de gestion des sinistres |
| NPS segment réclamations simples | 28 | 45 (pilote) | > 60 | Enquête satisfaction client |
| Coût moyen par dossier simple | 103 $ CA | 85 $ CA | 45 $ CA | Comptabilité analytique |
| Taux de réouverture de dossiers simples | 6 % | 5 % | < 3 % | Système de gestion des sinistres |
| Taux de dossiers traités par l'agent (sans escalade) | 0 % | 40 % (pilote) | 70 % | Tableau de bord agentique |

[Tableau F.9 — KPIs techniques]

| KPI technique | Référence | Cible | Seuil d'alerte | Méthode de mesure |
|---|---|---|---|---|
| Précision de l'estimation des dommages | N/A | Écart < 5 % vs estimation humaine | Écart > 10 % | Comparaison agent vs expert sur échantillon |
| Taux d'escalade vers expert humain | N/A | < 30 % | > 50 % | Logs de l'orchestrateur |
| Latence de traitement complet | N/A | < 2 heures | > 4 heures | Monitoring applicatif |
| Disponibilité du service | N/A | 99,9 % | < 99,5 % | Monitoring infrastructure |
| Taux d'hallucination détectée (*RAG*) | N/A | < 1 % | > 3 % | Tests adversariaux automatisés |

#### Section 9 — Feuille de route

[Tableau F.10 — Phases de réalisation]

| Phase | Description | Livrables | Jalons | Durée | Critères de passage |
|---|---|---|---|---|---|
| 1 — Cadrage | Consultation juridique AMF, constitution du corpus de photos étiquetées, spécification des règles métier, définition du périmètre du *sandbox* | Avis juridique, corpus étiqueté (3 000 images), spécifications, architecture du *sandbox* | Revue de cadrage (M+2) | 2 mois | Avis juridique favorable (ou conditions identifiées); corpus constitué |
| 2 — PoC (*sandbox*) | Développement de l'agent dans le *sandbox* (cf. pattern *Agentic Safe Sandbox*) avec données anonymisées. Test sur 500 dossiers historiques. | Agent fonctionnel en *sandbox*, rapport de performance, analyse des cas d'escalade | Démo PoC (M+5) | 3 mois | Précision estimation ≥ 90 %; taux d'hallucination RAG < 2 % |
| 3 — Pilote | Déploiement sur une catégorie IARD (bris de vitre, ~800 dossiers/mois) avec supervision renforcée (15 % des dossiers revus) | Agent en production restreinte, tableau de bord de supervision, bilan du pilote | Fin pilote (M+9) | 4 mois | Précision ≥ 95 %; NPS pilote ≥ 45; aucun incident réglementaire |
| 4 — Déploiement | Extension progressive aux 3 catégories de réclamations simples. Réduction graduelle du taux de supervision. | Agent en production complète, programme de gestion du changement déployé | Production (M+15) | 6 mois | KPIs métier atteints; conformité validée; experts réaffectés |
| 5 — Exploitation | Monitoring continu, optimisation du modèle, extension potentielle aux réclamations de complexité moyenne | Rapports de performance, modèles optimisés, étude de faisabilité pour l'extension | Revue annuelle (M+18) | Continue | ROI positif démontré; taux de satisfaction interne ≥ 80 % |

#### Section 10 — Décision

| Champ | Valeur |
|---|---|
| **Décision** | [x] Go conditionnel |
| **Conditions** | (1) Avis juridique favorable de la direction juridique sur la conformité AMF des décisions automatisées en assurance IARD, avant le 30 avril 2026. (2) Validation du corpus de photos étiquetées (3 000 images minimum) par l'équipe actuariat, avant le 31 mai 2026. (3) Recrutement ou formation d'un spécialiste en orchestration agentique, avant le 30 juin 2026. |
| **Motif** | Score de priorité S = 0,29 (Quadrant III). Valeur métier élevée (V = 4) mais risque et délai significatifs (R = 3,5, D = 4). L'écart de capacités est critique sur les plateformes et les talents. L'investissement dans les prérequis est justifié par le potentiel de transformation opérationnelle (économie estimée de 2,5 M$ CA/an à plein régime). |
| **Prochaine étape** | Lancement de la Phase 1 (cadrage) sous réserve de la validation des trois conditions ci-dessus |
| **Date de la décision** | 2026-02-18 |
| **Décideur(s)** | Jean-François Bouchard (sponsor), Sophie Gagnon (EA), Comité IA, Direction juridique |
| **Date de réévaluation** | 2026-06-30 (fin de la Phase 1 de cadrage) |

---

### F.6 Conseils d'adaptation

**Calibrage du canevas.** Le canevas complet (10 sections) est conçu pour les initiatives de catégorie « Agent IA » ou « Produit digital » (Quadrants II et III). Pour les initiatives de catégorie « Automatisation » classées en Quadrant I (*quick wins*), l'EA peut utiliser une version allégée en fusionnant les sections 6 et 7 et en simplifiant la section 9 (trois phases au lieu de cinq).

**Intégration avec l'Annexe E.** Les scores de la section 5 alimentent directement la matrice valeur/risque/délai de l'Annexe E. L'EA maintient un dossier par initiative (le canevas) et une vue consolidée (la matrice). Le canevas fournit le détail; la matrice fournit la vue d'ensemble.

**Fréquence d'actualisation.** Le canevas est un document vivant. Il est mis à jour au minimum à chaque transition de phase (section 9) et lors de tout événement significatif (changement de périmètre, nouveau risque identifié, résultat de pilote). La version et la date de révision (section 1) assurent la traçabilité.

**Utilisation en atelier.** Le canevas peut être rempli collaborativement lors d'un atelier de deux à trois heures réunissant le sponsor métier, l'architecte d'entreprise, un représentant technique et un représentant de la conformité. Les sections 2 à 4 sont remplies en amont par l'EA et le sponsor; les sections 5 à 7 sont cotées collectivement en atelier; les sections 8 à 10 sont finalisées par l'EA après l'atelier.

**Lien avec les patterns du chapitre 11.** Pour chaque cas d'usage documenté, l'EA identifie les patterns architecturaux applicables (cf. chapitre 11, section 11.5). Un cas d'usage ciblant un domaine métier dont les données ne sont pas prêtes déclenche le pattern *AI-Ready Domain*. Un cas d'usage d'IA agentique déclenche le pattern *Agentic Safe Sandbox* pour la phase d'expérimentation. Un cas d'usage qui réutilise des capacités existantes s'inscrit dans le pattern *AI Capability Factory*.
