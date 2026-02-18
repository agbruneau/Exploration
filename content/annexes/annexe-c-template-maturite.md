## Annexe C — Template d'évaluation de maturité gouvernance IA

### C.1 Introduction et objectif

La présente annexe fournit un outil d'évaluation structuré permettant à toute organisation de mesurer sa maturité en gouvernance de l'intelligence artificielle. Elle opérationnalise le modèle de maturité en cinq niveaux présenté au chapitre 9 (section 9.3) et s'articule avec l'auto-diagnostic de positionnement stratégique EA-IA du chapitre 13 (section 13.1).

**Objectif.** Permettre à l'architecte d'entreprise (AE) et aux parties prenantes de la gouvernance IA de :

- situer objectivement le niveau de maturité actuel de l'organisation en gouvernance IA;
- identifier les écarts prioritaires par pilier de gouvernance et par dimension;
- définir des cibles de progression alignées sur la feuille de route à 36 mois du chapitre 13;
- mesurer la progression à intervalles réguliers (cadence semestrielle recommandée).

**Périmètre.** L'évaluation couvre les six piliers de la gouvernance IA (chapitre 9, section 9.2) — politiques et standards, évaluation des risques, conformité réglementaire, contrôles techniques, éthique, et monitoring continu — évalués selon les trois dimensions transversales : données, processus et personnes (chapitre 9, section 9.3).

**Articulation avec les autres annexes.** L'Annexe C se combine avec l'Annexe B (référentiel de compétences EA-IA) pour l'évaluation de la dimension « personnes », avec l'Annexe E (template de classification des risques IA) pour le pilier « évaluation des risques », et avec la checklist d'auto-évaluation de la section 13.7 pour le positionnement stratégique global.

---

### C.2 Niveaux de maturité : définitions détaillées

Le modèle de maturité en gouvernance IA comprend cinq niveaux progressifs. Chaque niveau est défini par des caractéristiques observables, le rôle attendu de l'architecte d'entreprise et les indicateurs clés qui permettent de confirmer l'atteinte du niveau.

#### Niveau 1 — Ad hoc

**Définition.** L'organisation utilise l'IA sans cadre de gouvernance formel. Les initiatives sont isolées, portées par des équipes individuelles, sans coordination centrale. La gouvernance est réactive : les problèmes sont traités au cas par cas lorsqu'ils surviennent.

**Caractéristiques observables :**
- Aucune politique d'utilisation de l'IA documentée ou approuvée
- Aucun inventaire des systèmes et outils d'IA utilisés dans l'organisation
- Pas de classification des systèmes IA par niveau de risque
- L'utilisation du *Shadow AI* est répandue et non détectée
- Aucun rôle ni comité formellement responsable de la gouvernance IA

**Rôle de l'AE.** Sensibilisation de la direction aux risques; lancement de l'inventaire initial des usages IA; documentation de l'état des lieux.

**Indicateurs clés.** Nombre de systèmes IA inventoriés; existence d'un premier état des lieux documenté.

#### Niveau 2 — Défini

**Définition.** L'organisation a documenté des politiques de gouvernance IA, mais leur application demeure inconsistante. Des rôles sont assignés formellement, sans que les processus opérationnels soient systématiquement alignés.

**Caractéristiques observables :**
- Politiques d'utilisation de l'IA rédigées et approuvées par la direction
- Inventaire partiel des actifs IA (systèmes approuvés principalement)
- Classification initiale des risques réalisée, mais non maintenue
- Rôles de gouvernance assignés (responsable IA, comité éthique)
- Formation de sensibilisation déployée, mais non obligatoire
- Application des politiques dépendante de la bonne volonté des équipes

**Rôle de l'AE.** Formalisation des politiques dans l'architecture d'entreprise; intégration des classifications de risque IA dans les référentiels existants; structuration du comité de gouvernance.

**Indicateurs clés.** Couverture des politiques (% des domaines couverts); nombre de rôles de gouvernance formalisés; taux d'achèvement des formations de sensibilisation.

#### Niveau 3 — Opérationnalisé

**Définition.** La gouvernance est intégrée dans les processus opérationnels et les *pipelines* techniques. L'automatisation partielle des contrôles réduit la dépendance aux validations manuelles. Le lignage des données est documenté pour les systèmes IA critiques.

**Caractéristiques observables :**
- Politiques intégrées dans les processus de développement et de déploiement
- Contrôles automatisés dans les *pipelines* CI/CD (tests de biais, validation de données)
- Registre de modèles centralisé et maintenu à jour
- Lignage des données documenté pour les systèmes à haut risque
- Plateforme de gouvernance IA opérationnelle (contrôle d'accès, journalisation)
- Processus de détection et d'intégration du *Shadow AI* en place
- Comité cross-fonctionnel actif avec réunions régulières

**Rôle de l'AE.** Intégration des contrôles de gouvernance dans les architectures de référence; conception de l'architecture de la plateforme de gouvernance; coordination du comité cross-fonctionnel.

**Indicateurs clés.** *Data Integrity Index*; taux d'automatisation des contrôles de gouvernance; couverture du registre de modèles (% des modèles en production documentés).

#### Niveau 4 — Mesuré

**Définition.** La gouvernance est pilotée par des indicateurs de performance mesurés en continu. Des tableaux de bord de conformité alimentent les instances de direction. L'audit des systèmes IA est systématique et documenté.

**Caractéristiques observables :**
- Indicateurs clés de performance (KPI) de gouvernance définis et suivis
- Tableaux de bord de conformité IA présentés régulièrement au *C-suite*
- Audits systématiques des modèles en production (internes et externes)
- Temps de remédiation des biais mesuré et optimisé
- Évaluations d'impact algorithmique réalisées pour les systèmes à haut risque
- Métriques de coût de gouvernance et retour sur investissement documentés
- Processus d'amélioration continue fondé sur les données de gouvernance

**Rôle de l'AE.** Optimisation des processus de gouvernance fondée sur les données; rapport régulier au comité de direction; conception des tableaux de bord stratégiques.

**Indicateurs clés.** *Bias Remediation Time* (temps entre détection et correction); score de préparation à l'audit; taux de conformité des modèles en production; tendance des violations de politique (décroissante).

#### Niveau 5 — Adaptatif

**Définition.** La gouvernance opère de manière autonome, augmentée par l'IA elle-même. Les boucles de rétroaction sont automatisées, la conformité est prédictive et l'organisation anticipe les évolutions réglementaires et technologiques.

**Caractéristiques observables :**
- Surveillance automatisée des modèles par des agents IA dédiés
- Détection prédictive de la dérive et des risques émergents
- Adaptation dynamique des politiques en fonction de l'évolution réglementaire
- Gouvernance des systèmes d'IA agentique opérationnelle (cadre à trois niveaux du chapitre 9, section 9.4)
- Architecture continue (*continuous architecture*) alimentée par des données en temps réel
- Veille réglementaire automatisée avec évaluation d'impact proactive
- Mécanismes de gouvernance eux-mêmes audités et optimisés

**Rôle de l'AE.** Innovation en gouvernance; anticipation réglementaire; conception d'architectures de gouvernance adaptatives; pilotage de la gouvernance autonome.

**Indicateurs clés.** Temps de réponse aux changements réglementaires; taux de détection prédictive des risques; couverture de la gouvernance agentique.

[Tableau C.1 — Synthèse des cinq niveaux de maturité en gouvernance IA]

| Niveau | Désignation | Mot clé | Horizon typique |
|---|---|---|---|
| 1 | Ad hoc | Réactivité | Point de départ |
| 2 | Défini | Formalisation | 0-6 mois (Phase 1) |
| 3 | Opérationnalisé | Intégration | 6-18 mois (Phase 2) |
| 4 | Mesuré | Optimisation | 18-36 mois (Phase 3) |
| 5 | Adaptatif | Anticipation | 36 mois et au-delà |

*Sources : Adapté du modèle synthétique du chapitre 9 (section 9.3), à partir de Gartner [Ch. 9, réf. 1], Liminal [Ch. 9, réf. 6], Dataversity [Ch. 9, réf. 9]*

---

### C.3 Grille d'évaluation détaillée par pilier et par niveau

La grille suivante détaille, pour chacun des six piliers de la gouvernance IA, les critères observables à chaque niveau de maturité. Pour chaque pilier, les critères couvrent les trois dimensions transversales — données, processus et personnes — lorsqu'elles sont applicables.

L'évaluateur attribue le niveau correspondant aux critères qui décrivent le mieux la situation actuelle de l'organisation pour chaque pilier.

---

#### Pilier 1 — Politiques et standards

| Niveau | Critères observables |
|---|---|
| 1 — Ad hoc | Aucune politique d'utilisation de l'IA documentée. Pas de standards de développement IA. Les équipes définissent leurs propres règles de manière ad hoc. Aucune classification des systèmes IA par niveau de risque. |
| 2 — Défini | Charte d'utilisation acceptable de l'IA approuvée par la direction. Standards de développement IA documentés (mais non intégrés dans les outils). Classification initiale des systèmes IA par risque réalisée. Guide d'utilisation de l'IA générative diffusé. Processus d'approbation défini pour les nouveaux projets IA. |
| 3 — Opérationnalisé | Politiques IA intégrées dans les processus de gouvernance technologique existants. Standards de développement IA intégrés dans les *templates* de projet et les *pipelines*. Classification des risques IA maintenue à jour et alignée sur les classifications de données. Processus d'exception documenté et appliqué. Révision annuelle des politiques planifiée. |
| 4 — Mesuré | Taux de conformité aux politiques mesuré et rapporté (tableau de bord). Tendance des violations de politique suivie et analysée. Efficacité des politiques évaluée par des métriques (temps de mise en conformité, taux d'adoption). Politiques ajustées en fonction des données de conformité. Étalonnage (*benchmarking*) avec les pratiques de l'industrie. |
| 5 — Adaptatif | Politiques mises à jour dynamiquement en réponse aux évolutions réglementaires et technologiques. Système de veille automatisé identifiant les écarts entre politiques et nouvelles exigences. Politiques versionnées et traçables. Mécanismes de rétroaction des équipes intégrés dans le cycle de révision. |

---

#### Pilier 2 — Évaluation des risques

| Niveau | Critères observables |
|---|---|
| 1 — Ad hoc | Aucune évaluation formelle des risques IA. Les risques sont identifiés de manière réactive, après la survenance d'incidents. Pas de taxonomie des risques IA. |
| 2 — Défini | Taxonomie des risques IA établie (biais, hallucination, fuite de données, dérive, dépendance fournisseur). Évaluation des risques réalisée pour les projets majeurs. Registre des risques IA créé. Lien avec le cadre *AI RMF* du NIST ou équivalent documenté. |
| 3 — Opérationnalisé | Évaluation des risques systématique pour tout nouveau système IA avant déploiement. Évaluation d'impact algorithmique (*AIA*) réalisée pour les systèmes à haut risque. Risques IA intégrés dans le registre des risques d'entreprise. Processus de réévaluation périodique en place. Propagation des risques modélisée (impact en cascade entre couches architecturales). |
| 4 — Mesuré | Métriques de risque IA suivies en continu (probabilité, impact, vélocité). Indicateurs avancés (*leading indicators*) définis pour anticiper les risques. Efficacité des mesures d'atténuation mesurée. Rapport de risques IA présenté régulièrement au *C-suite*. Analyse de tendances des incidents IA. |
| 5 — Adaptatif | Évaluation prédictive des risques utilisant l'apprentissage automatique. Détection automatisée de nouveaux vecteurs de risque. Simulation de scénarios de risque (*stress testing*). Corrélation automatique entre risques IA, risques de données et risques opérationnels. |

---

#### Pilier 3 — Conformité réglementaire

| Niveau | Critères observables |
|---|---|
| 1 — Ad hoc | Aucune cartographie des exigences réglementaires applicables à l'IA. Conformité non vérifiée. Pas de lien entre les obligations réglementaires et les systèmes IA en production. |
| 2 — Défini | Cartographie des réglementations applicables réalisée (*EU AI Act*, RGPD, réglementations sectorielles). Classification des systèmes IA selon les catégories réglementaires de risque. Responsabilités de conformité assignées. Documentation de conformité amorcée pour les systèmes à haut risque. |
| 3 — Opérationnalisé | Processus de conformité intégré dans le cycle de vie des systèmes IA. Documentation de conformité systématique (cartes de modèle, évaluations d'impact). Mécanismes de traçabilité et d'explicabilité déployés pour les systèmes à haut risque. Vérifications de conformité intégrées dans les *pipelines* de déploiement. Collaboration structurée entre AE et direction juridique. |
| 4 — Mesuré | Score de préparation à la conformité mesuré et suivi. Audits de conformité réguliers (internes et externes) avec résultats documentés. Temps de remédiation des non-conformités mesuré. Couverture de la documentation de conformité suivie. Rapport de conformité IA présenté aux instances de gouvernance. |
| 5 — Adaptatif | Veille réglementaire automatisée avec évaluation d'impact proactive. Adaptation anticipée des systèmes IA aux évolutions réglementaires. Participation active aux consultations réglementaires. Conformité prédictive : identification des systèmes susceptibles de devenir non conformes. |

---

#### Pilier 4 — Contrôles techniques

| Niveau | Critères observables |
|---|---|
| 1 — Ad hoc | Aucun contrôle technique spécifique à l'IA. Contrôle d'accès aux outils IA non différencié. Pas de journalisation des interactions avec les systèmes IA. Pas de mécanisme de prévention des fuites de données (*DLP*) adapté à l'IA. |
| 2 — Défini | Contrôle d'accès basé sur les rôles (*RBAC*) défini pour les plateformes IA. Journalisation des interactions activée. Standards de sécurité IA documentés. Mécanismes de *DLP* identifiés mais non automatisés. Processus de validation des modèles défini (manuel). |
| 3 — Opérationnalisé | *RBAC* intégré avec authentification unique (*SSO*) et authentification multifacteur (*MFA*). *DLP* automatisé dans les plateformes IA approuvées. Filtrage des requêtes et des réponses opérationnel. Validation automatisée des modèles avant déploiement (tests de performance, biais, sécurité). Conformité par conception (*compliance by design*) intégrée dans les architectures de référence. Registre de modèles centralisé avec métadonnées complètes. |
| 4 — Mesuré | Taux de couverture des contrôles mesuré (% des systèmes IA sous contrôle). Efficacité des contrôles évaluée (taux de détection, taux de faux positifs). Temps de réponse aux incidents de sécurité IA mesuré. Indicateurs de sécurité IA intégrés dans les tableaux de bord de gouvernance. Tests de pénétration incluant les vecteurs d'attaque spécifiques à l'IA. |
| 5 — Adaptatif | Contrôles adaptatifs ajustant automatiquement leur sensibilité selon le contexte de risque. Détection automatisée des attaques adversariales. Architecture *Zero Trust* appliquée aux agents IA. Disjoncteurs (*circuit breakers*) automatisés pour les systèmes IA agentiques. Orchestration sécurisée multi-agents avec résolution de conflits. |

---

#### Pilier 5 — Éthique

| Niveau | Critères observables |
|---|---|
| 1 — Ad hoc | Aucune référence formelle à des principes éthiques dans l'utilisation de l'IA. Pas de processus d'évaluation de l'impact éthique. Aucune instance dédiée. |
| 2 — Défini | Principes éthiques IA définis (équité, transparence, explicabilité, responsabilité). Comité d'éthique IA constitué ou mandat éthique attribué à un comité existant. Lignes directrices éthiques documentées. Formation éthique IA planifiée. |
| 3 — Opérationnalisé | Évaluation de l'impact éthique intégrée dans le processus de développement des systèmes IA. Mécanismes d'explicabilité déployés (interfaces permettant aux utilisateurs de comprendre les décisions IA). Processus de recours opérationnel pour contester une décision algorithmique. Tests d'équité (*fairness testing*) intégrés dans les *pipelines*. Comité d'éthique actif avec mandat de révision des cas litigieux. |
| 4 — Mesuré | Métriques d'équité mesurées et suivies pour les systèmes IA en production. Résultats des évaluations d'impact éthique analysés et les tendances rapportées. Efficacité des mécanismes de recours évaluée. Satisfaction des utilisateurs concernant la transparence des systèmes IA mesurée. |
| 5 — Adaptatif | Veille éthique intégrée dans la gouvernance (détection de nouveaux enjeux éthiques liés à l'IA). Principes éthiques révisés dynamiquement en fonction des retours d'expérience et des évolutions sociétales. Éthique intégrée dans les garde-fous des systèmes agentiques (limites éthiques à la planification orientée objectifs). |

---

#### Pilier 6 — Monitoring continu

| Niveau | Critères observables |
|---|---|
| 1 — Ad hoc | Aucune surveillance spécifique des systèmes IA en production. Les problèmes de performance ou de comportement sont détectés par les utilisateurs finaux. Pas de processus d'escalade dédié à l'IA. |
| 2 — Défini | Métriques de performance de base définies pour les systèmes IA critiques. Processus de surveillance manuel en place (vérifications périodiques). Processus d'escalade et de gestion des incidents IA documenté. Seuils d'alerte définis pour les indicateurs principaux. |
| 3 — Opérationnalisé | Surveillance automatisée de la performance des modèles en production. Détection automatisée de la dérive des données (*data drift*) et de la dérive conceptuelle (*concept drift*). Alertes automatiques déclenchées au dépassement des seuils. Processus de remplacement de modèle (*model swap*) défini et testé. Tableau de bord opérationnel de surveillance IA en place. Intégration avec les pratiques de surveillance opérationnelle existantes. |
| 4 — Mesuré | Métriques de surveillance analysées en tendance (dégradation progressive, saisonnalité). Temps moyen de détection (*MTTD*) et temps moyen de remédiation (*MTTR*) mesurés et optimisés. Rapport d'incidents IA régulier avec analyse des causes racines. Indicateurs de surveillance intégrés dans le tableau de bord de gouvernance du *C-suite*. |
| 5 — Adaptatif | Surveillance prédictive utilisant l'apprentissage automatique pour anticiper les dégradations. Agents IA dédiés à la surveillance des modèles en production. Actions correctives automatisées (réentraînement déclenché, bascule de modèle). Corrélation automatique entre les signaux de surveillance et les indicateurs business. |

---

### C.4 Méthode de scoring

#### C.4.1 Processus d'évaluation

**Étape 1 — Constitution de l'équipe d'évaluation.** L'évaluation doit être conduite par une équipe pluridisciplinaire pour éviter les biais d'auto-évaluation. L'équipe comprend au minimum :

- L'architecte d'entreprise (AE) ou le responsable d'architecture — coordonnateur de l'évaluation
- Un représentant de la sécurité de l'information (CISO ou délégué)
- Un représentant de la direction juridique ou de la conformité
- Un représentant des équipes de science des données ou d'IA
- Un représentant des métiers utilisateurs de l'IA

**Étape 2 — Collecte des preuves.** Pour chaque pilier, l'équipe rassemble les preuves documentaires qui attestent du niveau de maturité : politiques approuvées, registres, rapports d'audit, tableaux de bord, comptes rendus de comités, résultats de tests automatisés, documentation de modèles.

**Étape 3 — Évaluation par pilier.** Chaque évaluateur attribue indépendamment un niveau (1 à 5) pour chaque pilier en se référant aux critères observables de la section C.3. Le niveau attribué est celui dont les critères sont *majoritairement satisfaits* — il n'est pas nécessaire que tous les critères soient remplis, mais les critères fondamentaux du niveau doivent l'être.

**Étape 4 — Consolidation et consensus.** L'équipe se réunit pour comparer les évaluations, discuter des divergences et établir un score consensuel par pilier. Les divergences supérieures à un niveau entre évaluateurs doivent faire l'objet d'une discussion approfondie.

**Étape 5 — Calcul du score global.** Le score global est la moyenne arithmétique des six scores de pilier, arrondie au dixième. Le niveau global de maturité est déterminé par le tableau de correspondance suivant :

| Score moyen | Niveau global |
|---|---|
| 1,0 – 1,4 | 1 — Ad hoc |
| 1,5 – 2,4 | 2 — Défini |
| 2,5 – 3,4 | 3 — Opérationnalisé |
| 3,5 – 4,4 | 4 — Mesuré |
| 4,5 – 5,0 | 5 — Adaptatif |

**Note importante.** Le score global fournit une indication synthétique, mais le profil par pilier est plus actionnable. Une organisation avec un score moyen de 3,0 peut présenter des piliers au niveau 4 et d'autres au niveau 2 — les actions prioritaires doivent cibler les piliers les plus faibles.

#### C.4.2 Fréquence et cadence

| Cadence | Activité |
|---|---|
| Semestrielle | Évaluation complète (six piliers, équipe pluridisciplinaire) |
| Trimestrielle | Revue des indicateurs clés et des tendances (AE et responsable gouvernance IA) |
| Continue | Collecte automatisée des métriques via la plateforme de gouvernance (à partir du Niveau 3) |

#### C.4.3 Règles d'application

- **Règle du maillon faible.** Le niveau effectif de gouvernance est limité par le pilier le plus faible pour les activités qui dépendent de ce pilier. Par exemple, un niveau 4 en monitoring est inopérant si les contrôles techniques (pilier 4) sont au niveau 1.
- **Règle de progression séquentielle.** Il est recommandé d'atteindre le niveau N pour l'ensemble des piliers avant de viser le niveau N+1 pour un pilier individuel, afin de maintenir la cohérence du dispositif de gouvernance.
- **Règle des preuves.** Tout niveau revendiqué doit être étayé par au moins une preuve documentaire vérifiable. L'auto-déclaration sans preuve entraîne la rétrogradation au niveau inférieur.

---

### C.5 Template vierge — Grille d'évaluation de maturité gouvernance IA

**Organisation :** ________________________________________

**Date de l'évaluation :** ____/____/________

**Évaluateurs :**

| Nom | Fonction | Signature |
|---|---|---|
| | | |
| | | |
| | | |
| | | |
| | | |

---

#### Évaluation par pilier

Inscrire le niveau attribué (1 à 5) et les preuves ou observations justificatives.

**Pilier 1 — Politiques et standards**

| Critère | Niveau attribué (1-5) | Preuves / observations |
|---|---|---|
| Existence et approbation des politiques IA | | |
| Standards de développement IA | | |
| Classification des systèmes par risque | | |
| Processus d'approbation des projets IA | | |
| Cycle de révision des politiques | | |
| **Score du pilier** | **____** | |

**Pilier 2 — Évaluation des risques**

| Critère | Niveau attribué (1-5) | Preuves / observations |
|---|---|---|
| Taxonomie des risques IA | | |
| Processus d'évaluation des risques | | |
| Intégration au registre des risques d'entreprise | | |
| Modélisation de la propagation des risques | | |
| Suivi et réévaluation périodique | | |
| **Score du pilier** | **____** | |

**Pilier 3 — Conformité réglementaire**

| Critère | Niveau attribué (1-5) | Preuves / observations |
|---|---|---|
| Cartographie des réglementations applicables | | |
| Classification réglementaire des systèmes IA | | |
| Documentation de conformité | | |
| Vérifications de conformité dans les *pipelines* | | |
| Veille réglementaire | | |
| **Score du pilier** | **____** | |

**Pilier 4 — Contrôles techniques**

| Critère | Niveau attribué (1-5) | Preuves / observations |
|---|---|---|
| Contrôle d'accès (*RBAC*, *SSO*, *MFA*) | | |
| Prévention des fuites de données (*DLP*) | | |
| Journalisation et audit des interactions | | |
| Validation automatisée des modèles | | |
| Sécurité des systèmes IA agentiques | | |
| **Score du pilier** | **____** | |

**Pilier 5 — Éthique**

| Critère | Niveau attribué (1-5) | Preuves / observations |
|---|---|---|
| Principes éthiques définis et communiqués | | |
| Instance éthique (comité ou mandat) | | |
| Évaluation d'impact éthique des systèmes IA | | |
| Mécanismes d'explicabilité et de recours | | |
| Tests d'équité (*fairness*) | | |
| **Score du pilier** | **____** | |

**Pilier 6 — Monitoring continu**

| Critère | Niveau attribué (1-5) | Preuves / observations |
|---|---|---|
| Surveillance de la performance des modèles | | |
| Détection de la dérive (*drift*) | | |
| Alertes et processus d'escalade | | |
| Tableau de bord de surveillance IA | | |
| Processus de remplacement de modèle | | |
| **Score du pilier** | **____** | |

---

#### Synthèse des résultats

| Pilier | Score (1-5) |
|---|---|
| 1. Politiques et standards | |
| 2. Évaluation des risques | |
| 3. Conformité réglementaire | |
| 4. Contrôles techniques | |
| 5. Éthique | |
| 6. Monitoring continu | |
| **Score moyen** | **____** |
| **Niveau global de maturité** | **____** |

---

#### Profil de maturité (diagramme radar)

Tracer le profil en reportant les scores sur les six axes. Le profil visuel permet d'identifier immédiatement les piliers en retard et les piliers en avance.

```
                    Politiques
                       5
                       │
                  4    │    4
                  │    │    │
             3    │    │    │    3
             │    │    │    │    │
   Monitoring 2───1────┼────1───2 Risques
   continu    │    │    │    │    │
             3    │    │    │    3
                  │    │    │
                  4    │    4
                       │
                       5
            Éthique         Conformité
                       │
                       5
                       │
                 Contrôles
                 techniques
```

*Reporter les scores sur chaque axe et relier les points pour visualiser le profil de maturité.*

---

#### Historique des évaluations

| Date | Score P1 | Score P2 | Score P3 | Score P4 | Score P5 | Score P6 | Moyenne | Niveau |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |

---

### C.6 Guide d'interprétation et plan d'action

Le guide suivant propose, pour chaque niveau de maturité constaté, les actions prioritaires à entreprendre et leur correspondance avec les phases de la feuille de route du chapitre 13.

#### Niveau 1 constaté — Actions immédiates (correspondance : début de Phase 1, 0-3 mois)

**Diagnostic.** L'organisation n'a pas encore formalisé sa gouvernance IA. L'utilisation de l'IA est non contrôlée et les risques ne sont pas identifiés. Il s'agit d'un niveau courant pour les organisations en début de parcours IA ou celles dont l'adoption a devancé la gouvernance.

**Actions prioritaires :**

| Priorité | Action | Livrable | Échéance cible |
|---|---|---|---|
| 1 | Réaliser l'inventaire des actifs IA (approuvés et *Shadow AI*) | Registre des actifs IA | 4 semaines |
| 2 | Rédiger et faire approuver une politique d'utilisation de l'IA générative | Guide d'utilisation GenAI | 6 semaines |
| 3 | Constituer un comité de gouvernance IA cross-fonctionnel | Mandat et composition du comité | 8 semaines |
| 4 | Réaliser une première classification des risques IA | Matrice de risques initiale | 10 semaines |
| 5 | Sensibiliser la direction aux enjeux de gouvernance IA | Briefing au *C-suite* | 12 semaines |

**Cible de progression.** Atteindre le niveau 2 (Défini) dans un délai de 3 à 6 mois.

---

#### Niveau 2 constaté — Formalisation et opérationnalisation (correspondance : Phase 1 avancée à Phase 2, 3-12 mois)

**Diagnostic.** L'organisation a posé les bases documentaires de la gouvernance, mais celles-ci restent largement déclaratives. L'enjeu principal est de transformer les politiques en contrôles opérationnels intégrés dans les processus.

**Actions prioritaires :**

| Priorité | Action | Livrable | Échéance cible |
|---|---|---|---|
| 1 | Intégrer les politiques dans les *pipelines* de développement IA | Contrôles automatisés dans les *pipelines* CI/CD | 3 mois |
| 2 | Déployer une plateforme de gouvernance IA (contrôle d'accès, journalisation, *DLP*) | Plateforme opérationnelle | 4 mois |
| 3 | Implémenter le lignage des données pour les systèmes IA critiques | Documentation de lignage | 4 mois |
| 4 | Mettre en place la surveillance automatisée des modèles en production | Alertes de dérive et de performance | 5 mois |
| 5 | Formaliser les processus de conformité réglementaire (documentation, traçabilité) | Cartes de modèle et évaluations d'impact | 6 mois |

**Cible de progression.** Atteindre le niveau 3 (Opérationnalisé) dans un délai de 6 à 12 mois.

---

#### Niveau 3 constaté — Mesure et optimisation (correspondance : Phase 2 avancée à Phase 3, 12-24 mois)

**Diagnostic.** La gouvernance est intégrée dans les processus et les *pipelines* techniques. L'enjeu est de passer d'une gouvernance fonctionnelle à une gouvernance pilotée par les données et en amélioration continue.

**Actions prioritaires :**

| Priorité | Action | Livrable | Échéance cible |
|---|---|---|---|
| 1 | Définir les indicateurs clés de performance de la gouvernance IA | Tableau de KPI de gouvernance | 2 mois |
| 2 | Construire les tableaux de bord de conformité pour le *C-suite* | Tableau de bord opérationnel | 4 mois |
| 3 | Instaurer un programme d'audit systématique des modèles | Calendrier et rapports d'audit | 6 mois |
| 4 | Mesurer et optimiser le *Bias Remediation Time* | Processus d'amélioration continue | 6 mois |
| 5 | Documenter le retour sur investissement de la gouvernance IA | Rapport ROI de gouvernance | 8 mois |

**Cible de progression.** Atteindre le niveau 4 (Mesuré) dans un délai de 8 à 12 mois.

---

#### Niveau 4 constaté — Vers la gouvernance adaptative (correspondance : Phase 3, 24-36 mois)

**Diagnostic.** La gouvernance est mesurée et optimisée en continu. L'enjeu est de la rendre autonome et prédictive, en intégrant l'IA elle-même dans les mécanismes de gouvernance.

**Actions prioritaires :**

| Priorité | Action | Livrable | Échéance cible |
|---|---|---|---|
| 1 | Implémenter la surveillance prédictive des modèles (détection anticipée de la dérive) | Système de surveillance prédictive | 4 mois |
| 2 | Déployer des agents IA pour la surveillance continue des modèles en production | Agents de monitoring autonomes | 6 mois |
| 3 | Mettre en place la veille réglementaire automatisée | Système de veille avec alertes | 6 mois |
| 4 | Opérationnaliser le cadre de gouvernance de l'IA agentique (trois niveaux) | Cadre Fondation-Workflow-Autonomie déployé | 8 mois |
| 5 | Passer à l'architecture continue (*continuous architecture*) | Architecture vivante alimentée en temps réel | 10 mois |

**Cible de progression.** Atteindre le niveau 5 (Adaptatif) dans un délai de 10 à 14 mois.

---

#### Niveau 5 constaté — Maintien et innovation

**Diagnostic.** L'organisation a atteint le niveau le plus avancé de maturité en gouvernance IA. L'enjeu est de maintenir ce niveau dans un contexte d'évolution rapide des technologies et des réglementations, et d'innover dans les pratiques de gouvernance.

**Actions de maintien :**

- Auditer régulièrement les mécanismes de gouvernance eux-mêmes
- Participer activement aux consultations réglementaires et aux groupes de normalisation (ISO/IEC 42001)
- Partager les pratiques avec la communauté (publications, conférences)
- Former les organisations partenaires et fournisseurs
- Anticiper les enjeux de gouvernance des prochaines générations technologiques (IA agentique avancée, IA multimodale, systèmes multi-agents)

---

#### Correspondance entre les niveaux de maturité et les phases de la feuille de route

[Tableau C.2 — Correspondance niveaux de maturité et phases de la feuille de route (Ch. 13)]

| Niveau de maturité | Phase correspondante | Horizon | Objectif principal |
|---|---|---|---|
| 1 → 2 | Phase 1 — Fondations | 0-6 mois | Formaliser les bases de la gouvernance IA; produire les *quick wins* (registre IA, matrice de risques, guide GenAI) |
| 2 → 3 | Phase 1 avancée / Phase 2 | 6-18 mois | Opérationnaliser la gouvernance dans les *pipelines*; déployer la plateforme de gouvernance IA |
| 3 → 4 | Phase 2 avancée / Phase 3 | 18-36 mois | Piloter la gouvernance par les données; démontrer le ROI; rapporter au *C-suite* |
| 4 → 5 | Phase 3 | 36 mois et au-delà | Atteindre la gouvernance autonome et prédictive; influence au niveau du conseil d'administration |

*Le rythme de progression dépend de la taille de l'organisation, de la maturité de ses fondations de données et du soutien de la direction. L'horizon typique de 18 à 36 mois pour atteindre le niveau 3 (Opérationnalisé) avec un investissement soutenu est confirmé par les analyses de l'industrie (Ch. 9, réf. 6).*
