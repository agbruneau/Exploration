## Annexe E — Matrice valeur / risque / délai

### E.1 Introduction

La matrice valeur/risque/délai est l'instrument de priorisation central présenté dans la section 5.3 du chapitre 5. Elle permet à l'architecte d'entreprise (EA) de comparer rigoureusement les initiatives IA candidates au sein d'un portefeuille, en évaluant chacune selon trois axes orthogonaux : la valeur métier estimée, le risque agrégé (technique, réglementaire, organisationnel, dépendance fournisseur) et le délai de réalisation.

Cette annexe fournit :

1. Un **template vierge** de la matrice, directement utilisable en atelier de priorisation ;
2. Un **guide d'utilisation** détaillant les critères d'évaluation, les échelles de notation et la méthode de scoring ;
3. Un **exemple rempli** pour un portefeuille IA fictif de dix initiatives, illustrant les quatre quadrants stratégiques ;
4. La **méthode de scoring** pour calculer le score de priorité et arbitrer entre les initiatives.

L'EA adaptera ce *template* au contexte de son organisation en ajustant les pondérations et les critères selon les priorités stratégiques définies par la direction.

---

### E.2 Template vierge de la matrice

#### E.2.1 Tableau principal

| # | Initiative IA | Catégorie d'usage | Valeur métier (V) | Risque technique (Rt) | Risque réglementaire (Rr) | Risque organisationnel (Ro) | Risque dépendance (Rd) | Risque agrégé (R) | Délai (D) | Score de priorité (S) | Quadrant | Recommandation |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 2 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 3 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 4 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 5 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 6 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 7 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 8 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 9 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |
| 10 | | | /5 | /5 | /5 | /5 | /5 | /5 | /5 | | | |

#### E.2.2 Fiche de sous-critères de la valeur métier (V)

| Sous-critère | Pondération (%) | Score (/5) | Score pondéré |
|---|---|---|---|
| Impact sur le chiffre d'affaires (direct ou indirect) | 25 % | /5 | |
| Réduction des coûts opérationnels | 20 % | /5 | |
| Amélioration de l'expérience client | 20 % | /5 | |
| Avantage concurrentiel | 15 % | /5 | |
| Alignement avec la stratégie organisationnelle | 20 % | /5 | |
| **Valeur métier agrégée (V)** | **100 %** | | **/5** |

*Note : Les pondérations sont indicatives. L'EA les ajuste selon les priorités stratégiques de l'organisation.*

#### E.2.3 Fiche de sous-critères du risque agrégé (R)

| Dimension de risque | Pondération (%) | Score (/5) | Score pondéré |
|---|---|---|---|
| Risque technique (Rt) | 30 % | /5 | |
| Risque réglementaire (Rr) | 25 % | /5 | |
| Risque organisationnel (Ro) | 25 % | /5 | |
| Risque de dépendance fournisseur (Rd) | 20 % | /5 | |
| **Risque agrégé (R)** | **100 %** | | **/5** |

#### E.2.4 Fiche de sous-critères du délai (D)

| Composante du délai | Estimation (mois) | Score (/5) |
|---|---|---|
| Développement technique | | |
| Acquisition / formation des compétences | | |
| Intégration dans les processus métier | | |
| Déploiement et adoption | | |
| **Délai total estimé** | **mois** | **/5** |

---

### E.3 Guide d'utilisation

#### E.3.1 Échelles de notation

**Valeur métier (V) — Échelle de 1 à 5 (5 = valeur la plus élevée)**

| Score | Niveau | Critères |
|---|---|---|
| 5 | Transformationnelle | Crée un avantage concurrentiel durable ; impact direct sur le chiffre d'affaires > 5 % ; alignement parfait avec la stratégie |
| 4 | Élevée | Amélioration significative d'un processus critique ; réduction des coûts > 15 % dans le domaine ciblé ; fort alignement stratégique |
| 3 | Modérée | Gains d'efficacité mesurables sur un processus important ; réduction des coûts de 5 à 15 % ; alignement partiel avec la stratégie |
| 2 | Faible | Amélioration incrémentale d'un processus secondaire ; gains de productivité < 5 % ; alignement indirect |
| 1 | Marginale | Valeur démonstrative uniquement (*proof of concept*) ; aucun impact métier mesurable à court terme |

**Risque — Échelle de 1 à 5 (5 = risque le plus élevé)**

| Score | Niveau | Critères — Technique (Rt) | Critères — Réglementaire (Rr) | Critères — Organisationnel (Ro) | Critères — Dépendance (Rd) |
|---|---|---|---|---|---|
| 5 | Critique | Modèle IA non éprouvé ; données inexistantes ou de très faible qualité ; intégration très complexe | Système à haut risque selon le *EU AI Act* ; secteur hautement réglementé ; aucune conformité en place | Résistance forte ; impact majeur sur les emplois ; culture non préparée | Fournisseur unique ; aucune portabilité ; risque de *vendor lock-in* total |
| 4 | Élevé | Complexité technique significative ; données partielles ; dépendances multiples | Obligations réglementaires nouvelles ; conformité partielle | Résistance modérée ; changement de rôles significatif | Peu d'alternatives ; portabilité limitée |
| 3 | Modéré | Technologie mature mais intégration non triviale ; données disponibles avec lacunes | Réglementations existantes applicables ; conformité en cours | Changement accepté mais nécessitant accompagnement | Alternatives disponibles ; portabilité possible avec effort |
| 2 | Faible | Technologie éprouvée ; données de bonne qualité ; intégration simple | Faible exposition réglementaire ; conformité acquise | Changement mineur ; adoption facilitée | Plusieurs fournisseurs ; standards ouverts |
| 1 | Minimal | Solution clé en main ; données excellentes ; intégration triviale | Aucune contrainte réglementaire spécifique | Aucun impact organisationnel notable | Composants interchangeables ; portabilité totale |

**Délai de réalisation (D) — Échelle de 1 à 5 (5 = délai le plus long)**

| Score | Niveau | Délai estimé | Caractéristiques |
|---|---|---|---|
| 5 | Très long | > 24 mois | Nécessite des capacités inexistantes ; construction de plateforme ; transformation organisationnelle |
| 4 | Long | 12-24 mois | Développement technique significatif ; acquisition de compétences ; intégration complexe |
| 3 | Moyen | 6-12 mois | Développement modéré ; compétences partiellement disponibles ; intégration planifiable |
| 2 | Court | 3-6 mois | Solution largement disponible ; compétences en place ; intégration légère |
| 1 | Très court | < 3 mois | Solution clé en main ; déploiement rapide ; aucune intégration complexe |

#### E.3.2 Processus de cotation en atelier

L'EA anime la session de cotation en suivant ces étapes :

1. **Préparation (avant l'atelier).** L'EA prépare une fiche descriptive pour chaque initiative IA candidate, incluant : description du cas d'usage, résultat métier attendu, parties prenantes concernées, prérequis techniques identifiés.

2. **Cotation individuelle.** Chaque évaluateur (représentant métier, architecte technique, responsable conformité, gestionnaire du changement) remplit indépendamment la fiche de sous-critères pour chaque initiative. La méthode Delphi est recommandée pour réduire les biais (cf. chapitre 5, section 5.3.4).

3. **Convergence.** L'EA compile les scores individuels, identifie les écarts significatifs (écart-type > 1 sur un sous-critère) et anime une discussion ciblée sur ces points de divergence.

4. **Calcul du score de priorité.** Les scores consensuels sont reportés dans le tableau principal et le score de priorité est calculé selon la formule de la section E.4.

5. **Positionnement dans les quadrants.** Chaque initiative est positionnée dans l'un des quatre quadrants stratégiques (cf. section E.3.3).

6. **Formulation des recommandations.** L'EA formule une recommandation pour chaque initiative, cohérente avec son positionnement dans la matrice.

#### E.3.3 Les quatre quadrants stratégiques

Les quadrants sont définis par le croisement de la valeur métier (axe horizontal) et du risque agrégé (axe vertical), avec le délai comme troisième dimension (cf. chapitre 5, section 5.3.3) :

| Quadrant | Valeur | Risque | Action recommandée |
|---|---|---|---|
| **I — *Quick wins*** | Élevée (V ≥ 4) | Faible (R ≤ 2) | Lancer immédiatement. Délai court (D ≤ 2). Démontrer la valeur IA auprès des décideurs. |
| **II — Leviers majeurs** | Élevée (V ≥ 3) | Modéré (2 < R ≤ 3) | Cadrer techniquement et lancer un pilote sous 90 jours. Gérer activement les risques identifiés. |
| **III — Initiatives stratégiques** | Élevée (V ≥ 3) | Élevé (R > 3) ou délai long (D ≥ 4) | Investir dans les prérequis (données, conformité, compétences) avant le lancement. Planifier sur l'horizon 2-3. |
| **IV — Candidates à l'abandon** | Faible (V ≤ 2) | Élevé (R > 3) | Déprioritiser explicitement. Réexaminer si le contexte change (nouvelle réglementation, nouvelle technologie). |

---

### E.4 Méthode de scoring

#### E.4.1 Formule du score de priorité

Le score de priorité (S) est calculé comme suit :

**S = V / (R × D)**

Où :
- **V** = Valeur métier agrégée (1 à 5), calculée comme la moyenne pondérée des sous-critères de valeur (cf. fiche E.2.2)
- **R** = Risque agrégé (1 à 5), calculé comme la moyenne pondérée des quatre dimensions de risque (cf. fiche E.2.3)
- **D** = Délai de réalisation (1 à 5), déterminé par le délai total estimé (cf. fiche E.2.4)

Le score S produit des valeurs comprises entre 0,04 (pire cas : V=1, R=5, D=5) et 5,00 (meilleur cas : V=5, R=1, D=1). Plus le score est élevé, plus l'initiative est prioritaire.

#### E.4.2 Interprétation du score

| Plage de score | Interprétation | Action |
|---|---|---|
| S ≥ 2,00 | Priorité très élevée | Lancement immédiat — Quadrant I |
| 1,00 ≤ S < 2,00 | Priorité élevée | Cadrage et pilote — Quadrant II |
| 0,40 ≤ S < 1,00 | Priorité modérée | Investir dans les prérequis — Quadrant III |
| S < 0,40 | Priorité faible | Déprioritiser — Quadrant IV |

#### E.4.3 Limites et garde-fous

Le score de priorité est un outil d'aide à la décision, pas un substitut au jugement de l'EA. Trois garde-fous sont nécessaires :

1. **Effet de seuil réglementaire.** Une initiative avec un risque réglementaire de 5 (système à haut risque selon le *EU AI Act*) ne doit jamais être classée en Quadrant I, quel que soit son score global. L'EA applique un filtre disqualifiant : si Rr = 5, l'initiative est automatiquement classée en Quadrant III (prérequis de conformité à satisfaire avant lancement).

2. **Synergies architecturales.** Deux initiatives partageant une même plateforme de données ou un même composant d'infrastructure peuvent être regroupées en programme. Leur séquencement conjoint peut être plus efficient que ce que leurs scores individuels suggèrent (cf. chapitre 5, section 5.6.6).

3. **Score élevé, impact marginal.** Un score mathématiquement élevé n'implique pas nécessairement un impact stratégique significatif. Le chapitre 5 (Tableau 5.3) illustre ce cas avec un chatbot FAQ interne obtenant le score A-RICE le plus élevé malgré un impact stratégique marginal. L'EA doit valider que le résultat quantitatif est cohérent avec le jugement qualitatif.

---

### E.5 Exemple rempli : portefeuille IA fictif de dix initiatives

#### E.5.1 Contexte

L'exemple ci-dessous illustre un portefeuille IA fictif pour une entreprise de services financiers de taille intermédiaire (3 000 employés), en phase de déploiement IA. L'organisation a déjà réalisé quelques projets pilotes et souhaite structurer sa prochaine vague d'investissements IA. L'EA a animé un atelier de cotation avec huit parties prenantes (direction métier, architecture technique, conformité, gestion du changement).

#### E.5.2 Matrice remplie

| # | Initiative IA | Catégorie | V | Rt | Rr | Ro | Rd | R | D | S | Quadrant | Recommandation |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Classification automatique de documents réglementaires | Automatisation | 4 | 1 | 2 | 1 | 1 | 1,3 | 1 | 3,08 | I | Lancer immédiatement. ROI rapide, technologie mature (*NLP* + *OCR*). |
| 2 | Chatbot service client (FAQ et suivi de dossiers) | Augmentation | 4 | 2 | 2 | 2 | 2 | 2,0 | 2 | 1,00 | II | Cadrer le pilote. Prévoir la gestion des cas limites et l'intégration CRM. |
| 3 | Détection de fraude en temps réel | Automatisation | 5 | 3 | 3 | 2 | 2 | 2,5 | 3 | 0,67 | III | Forte valeur mais risque réglementaire et technique significatif. Investir dans la qualité des données transactionnelles d'abord. |
| 4 | Copilote de rédaction pour conseillers financiers | Augmentation | 3 | 2 | 2 | 2 | 2 | 2,0 | 2 | 0,75 | II | Pilote ciblé sur une unité d'affaires. Mesurer l'adoption et la qualité des résultats. |
| 5 | Automatisation de la conformité KYC (*Know Your Customer*) | Automatisation | 4 | 2 | 3 | 2 | 2 | 2,3 | 2 | 0,87 | II | Valeur réglementaire directe. Valider la conformité du modèle avec le département juridique avant lancement. |
| 6 | Plateforme analytique IA pour la gestion de portefeuille | Produit digital | 5 | 4 | 4 | 3 | 3 | 3,5 | 4 | 0,36 | III | Initiative stratégique majeure mais prérequis lourds. Construire la couche de gouvernance des données et obtenir l'aval réglementaire. |
| 7 | Agent IA autonome pour le traitement des réclamations | Agent IA | 4 | 4 | 3 | 4 | 3 | 3,5 | 4 | 0,29 | III | Potentiel élevé mais maturité technologique insuffisante. Planifier sur l'horizon 2 (12-24 mois). Prérequis : gouvernance agentique et garde-fous. |
| 8 | Génération automatique de rapports de conformité | Automatisation | 3 | 1 | 2 | 1 | 1 | 1,3 | 1 | 2,31 | I | *Quick win*. Technologie disponible, impact opérationnel direct sur les équipes de conformité. |
| 9 | Système de recommandation produits personnalisé | Augmentation | 3 | 3 | 2 | 2 | 3 | 2,5 | 3 | 0,40 | III | Valeur modérée, dépendance à la qualité des données clients et à l'intégration multicanal. Séquencer après l'initiative #3. |
| 10 | Outil de prédiction d'attrition client (*churn prediction*) | Automatisation | 4 | 2 | 2 | 2 | 2 | 2,0 | 2 | 1,00 | II | Bonne valeur métier. Données historiques disponibles. Cadrer un pilote sur un segment client prioritaire. |

*Échelle — V : 1 = marginale, 5 = transformationnelle. R et sous-composantes : 1 = minimal, 5 = critique. D : 1 = < 3 mois, 5 = > 24 mois. S = V / (R × D).*

#### E.5.3 Synthèse par quadrant

**Quadrant I — *Quick wins* (S ≥ 2,00) : 2 initiatives**

| # | Initiative | Score | Délai estimé |
|---|---|---|---|
| 1 | Classification automatique de documents réglementaires | 3,08 | < 3 mois |
| 8 | Génération automatique de rapports de conformité | 2,31 | < 3 mois |

Ces deux initiatives mobilisent des technologies matures (*NLP*, *OCR*, IA générative pour la rédaction), présentent un risque faible et génèrent une valeur opérationnelle immédiate. L'EA recommande leur lancement simultané pour créer un effet de démonstration rapide auprès de la direction.

**Quadrant II — Leviers majeurs (1,00 ≤ S < 2,00) : 3 initiatives**

| # | Initiative | Score | Délai estimé |
|---|---|---|---|
| 2 | Chatbot service client | 1,00 | 3-6 mois |
| 5 | Automatisation de la conformité KYC | 0,87 | 3-6 mois |
| 10 | Outil de prédiction d'attrition client | 1,00 | 3-6 mois |

*Note : L'initiative #4 (copilote rédaction, S = 0,75) se situe en zone intermédiaire entre les Quadrants II et III. L'EA la classe en Quadrant II en raison de son risque modéré et de son délai court, malgré un score légèrement inférieur au seuil.*

**Quadrant III — Initiatives stratégiques à cadrer (0,29 ≤ S < 1,00) : 4 initiatives**

| # | Initiative | Score | Prérequis identifiés |
|---|---|---|---|
| 3 | Détection de fraude en temps réel | 0,67 | Qualité des données transactionnelles, conformité réglementaire |
| 6 | Plateforme analytique IA | 0,36 | Gouvernance des données, aval réglementaire, infrastructure GPU |
| 7 | Agent IA autonome réclamations | 0,29 | Gouvernance agentique, garde-fous (*guardrails*), maturité technique |
| 9 | Système de recommandation produits | 0,40 | Données clients unifiées, intégration multicanal |

**Quadrant IV — Candidates à l'abandon : 0 initiative**

Aucune initiative du portefeuille actuel ne tombe dans le Quadrant IV. Cela reflète un travail de présélection déjà effectué en amont par l'EA. En pratique, les initiatives éliminées avant l'exercice de cotation (par exemple : « IA de trading autonome sans supervision humaine ») auraient été classées dans ce quadrant en raison de leur risque réglementaire rédhibitoire (Rr = 5).

#### E.5.4 Feuille de route séquencée

L'analyse du portefeuille produit la séquence d'investissement suivante, cohérente avec les trois horizons de la section 5.4.4 du chapitre 5 :

| Horizon | Période | Initiatives | Investissement capacitaire associé |
|---|---|---|---|
| Horizon 1 | 0-6 mois | #1, #8 (Quadrant I) puis #2, #10 (Quadrant II) | Plateforme *NLP*/*OCR* mutualisée ; infrastructure chatbot |
| Horizon 2 | 6-18 mois | #4, #5, #3 (Quadrants II-III) | Qualité des données transactionnelles ; conformité KYC ; formation des conseillers |
| Horizon 3 | 18-36 mois | #6, #7, #9 (Quadrant III) | Gouvernance agentique ; plateforme analytique ; données clients unifiées |

#### E.5.5 Visualisation recommandée

[Figure E.1 — Diagramme à bulles du portefeuille IA fictif]

La représentation visuelle recommandée est un diagramme à bulles (cf. chapitre 5, section 5.3.3) où :
- **Axe horizontal** : Valeur métier (V), de 1 (gauche) à 5 (droite)
- **Axe vertical** : Risque agrégé (R), de 5 (bas) à 1 (haut) — le risque faible est en haut
- **Taille de la bulle** : Délai (D) — petite bulle = délai court, grande bulle = délai long
- **Couleur de la bulle** : Quadrant — vert (I), bleu (II), orange (III), rouge (IV)
- **Étiquette** : Numéro de l'initiative

Ce diagramme permet à la C-suite de visualiser instantanément la structure du portefeuille et les arbitrages de priorisation.

---

### E.6 Conseils d'adaptation

**Ajustement des pondérations.** Les pondérations des sous-critères de valeur et de risque (sections E.2.2 et E.2.3) doivent être calibrées lors du premier atelier avec les parties prenantes. Une organisation en forte croissance pondérera davantage l'impact sur le chiffre d'affaires ; une organisation dans un secteur réglementé pondérera davantage le risque réglementaire.

**Fréquence d'actualisation.** La matrice doit être révisée au minimum trimestriellement, conformément à la recommandation de la section 5.3.4. Les événements déclencheurs d'une révision anticipée incluent : nouvelle réglementation, échec ou succès d'un pilote, changement de stratégie organisationnelle, évolution significative des capacités technologiques.

**Intégration avec les autres cadres.** La matrice valeur/risque/délai fournit une vue de portefeuille. Pour la priorisation opérationnelle des initiatives individuelles au sein d'un même quadrant, l'EA complète l'analyse avec les cadres RICE, A-RICE, MoSCoW ou ICE décrits dans la section 5.6 du chapitre 5. L'utilisation séquentielle recommandée est : matrice valeur/risque/délai pour la vue d'ensemble → A-RICE pour le classement fin → MoSCoW pour la décision finale.

**Lien avec la carte de chaleur *AI readiness*.** Avant de coter le délai (D), l'EA devrait consulter la carte de chaleur *AI readiness* (chapitre 5, section 5.5) pour les capacités métier concernées. Une initiative ciblant une capacité en zone rouge (AI-non prête) aura mécaniquement un délai plus long qu'une initiative ciblant une capacité en zone verte (AI-ready).
