---
title: "Use Case Canvas — Qualification agentique"
annexe: "B"
status: "rédigé"
length_target_words: 1500
reading_time_min: 6
last_updated: "2026-05-05"
---

> **Annexe B · Use Case Canvas · ~1 500 mots · lecture ≈ 6 min**

Ce canvas est l'artefact opérationnel qui instancie, pour un cas d'usage unique, le double filtre décrit au [Ch. 3](ch03-mapping-high-impact.md) (matrice autonomie × réversibilité × tolérance à l'erreur) et au [Ch. 4](ch04-roi-risk-readiness.md) (CPST, métriques canoniques, readiness 4D, décision Build/Buy/Borrow/Wait). Il se remplit avant tout engagement de ressources de développement — l'équivalent d'un business case d'une page, mais structuré pour les propriétés spécifiques des systèmes *agentic*.

Trois rôles sont requis pour compléter le canvas : le **Product Owner (PO)** est responsable des sections 1, 3 et 6 (description, ROI, métriques) ; l'**architecte de solution** est responsable des sections 2 et 4 (cadrage 3D, piliers readiness) ; le **risk officer** co-signe la section 5 (décision quadrant et recommandation). Le canvas est réexaminé à chaque changement de volume mensuel, de version de modèle, ou de modification du périmètre d'outils — fréquence minimale recommandée : trimestrielle. Un canvas non révisé après six mois devient caduque : les seuils de métriques calibrés à l'initialisation ne reflètent plus la distribution réelle des inputs en production.

---

## Section 1 — Description du cas

| Champ | Valeur |
|---|---|
| **Intitulé** | `[Nom court du cas d'usage — ex. : « Agent rapprochement AP »]` |
| **Fonction métier** | `[Finance / Opérations / Service client / Engineering / Juridique / RH / Autre]` |
| **Propriétaire business** | `[Nom · Titre · Direction]` |
| **Propriétaire technique** | `[Nom · Titre · Équipe]` |
| **Description en une phrase** | `[L'agent fait X sur Y pour produire Z, dans le système S]` |
| **Hypothèse de gain** | `[Réduction de coût / Augmentation de revenu / Réduction de délai / Réduction de risque — choisir le primaire, quantifier si possible]` |
| **Processus cible documenté ?** | `[ ] Oui — référence doc : ___` · `[ ] Non → Stop : readiness D2 insuffisante (Ch. 4 §4.5)` |

---

## Section 2 — Cadrage 3D

### 2.1 Autonomie cible

Référence : niveaux N1–N4 du [Ch. 8 §8.1](ch08-trustworthy-systems.md).

| Niveau | Définition opérationnelle | Sélectionner |
|---|---|---|
| **N1 — Assistance** | L'agent suggère uniquement ; l'humain décide et agit | `[ ]` |
| **N2 — Supervisé** | L'agent exécute sur les cas nominaux ; l'humain approuve avant toute action à effet de bord | `[ ]` |
| **N3 — Autonomie bornée** | L'agent exécute de manière autonome dans un périmètre d'actions défini et avec un *kill switch* financier actif | `[ ]` |
| **N4 — Autonomie étendue** | L'agent opère sans supervision intermédiaire ; escalade seulement sur exception ou dépassement de budget | `[ ]` |

**Autonomie cible retenue :** `[ ] N1` · `[ ] N2` · `[ ] N3` · `[ ] N4`

**Justification** (pourquoi ce niveau est le minimum nécessaire pour atteindre la valeur métier, et pourquoi monter d'un niveau serait injustifié) :

> `[Texte libre — 2 à 4 phrases. Citer la politique de supervision ou la contrainte réglementaire si applicable — OSFI E-23, EU AI Act, Loi 25]`

---

### 2.2 Réversibilité de l'action

La réversibilité mesure si les effets de bord des actions de l'agent peuvent être annulés sans perte de valeur métier nette ([Ch. 3 §3.2](ch03-mapping-high-impact.md)).

| Niveau | Critère | Exemples typiques | Sélectionner |
|---|---|---|---|
| **Haute** | Toutes les actions sont annulables sans impact externe | Lecture seule, classification, brouillon non envoyé, écriture en base de staging | `[ ]` |
| **Moyenne** | Certaines actions sont partiellement annulables avec un coût de compensation | Courriel interne envoyé, réservation confirmée mais modifiable, écriture validée sans clôture | `[ ]` |
| **Basse** | Les actions produisent des effets irréversibles ou très coûteux à compenser | Transfert financier exécuté, courriel externe envoyé à un client, suppression de données de production, licenciement | `[ ]` |

**Réversibilité retenue :** `[ ] Haute` · `[ ] Moyenne` · `[ ] Basse`

**Exemples d'actions irréversibles identifiées dans ce cas :**

> `[Lister les 2 à 5 actions concrètes les plus irréversibles que l'agent pourrait déclencher]`

---

### 2.3 Tolérance à l'erreur

La tolérance à l'erreur mesure les conséquences métier, réglementaires et réputationnelles d'une erreur non détectée avant impact externe ([Ch. 3 §3.2](ch03-mapping-high-impact.md)).

| Niveau | Critère | Impact en cas d'échec non détecté | Sélectionner |
|---|---|---|---|
| **Haute** | Erreur détectable et corrigible avant tout impact externe | Révision manuelle possible, aucune conséquence irréversible | `[ ]` |
| **Moyenne** | Erreur partiellement détectable ; impact limité et compensable | Retouche client nécessaire, pénalité de délai, incident de service mineur | `[ ]` |
| **Basse** | Erreur difficilement détectable ; conséquences directes en termes réglementaires, financiers ou réputationnels | Amende réglementaire, perte client, incident de sécurité, données de production corrompues | `[ ]` |

**Tolérance à l'erreur retenue :** `[ ] Haute` · `[ ] Moyenne` · `[ ] Basse`

**Impact maximal d'un échec non détecté :**

> `[Description en 1 à 2 phrases de l'impact le plus grave plausible — quantifier si possible]`

---

## Section 3 — ROI prévisionnel

Référence : *Cost per Successful Task* (CPST) défini au [Ch. 2 §2.1](ch02-business-case.md).

| Paramètre | Valeur estimée | Base de l'estimation |
|---|---|---|
| **CPST cible** (coût par tâche réussie incluant inférence, orchestration, retry moyen, escalade attendue) | `___ $` | `[Benchmark interne / Pilot data / Estimation analogique]` |
| **CPST humain de référence** (coût actuel de la même tâche traitée par un opérateur humain ou par RPA) | `___ $` | `[Données RH / Finance / Fournisseur RPA actuel]` |
| **Volume mensuel attendu** (nombre de tâches par mois à maturité) | `___ tâches/mois` | `[Données historiques système source]` |
| **Taux de succès qualitatif cible** (seuil minimal acceptable — cf. [Ch. 4 §4.2](ch04-roi-risk-readiness.md) : 85 % en zone verte, *hypothèse maison*) | `___ %` | `[Aligné avec direction métier]` |
| **Économie nette mensuelle** (CPST humain − CPST cible) × volume × taux de succès | `___ $/mois` | `[Calcul automatique à compléter]` |
| **Coût de build / intégration** (incluant instrumentation eval + observabilité) | `___ $` | `[Estimation équipe + licences plateforme]` |
| **Horizon de retour** (mois pour amortir le coût de build sur l'économie nette) | `___ mois` | `[= Coût build / Économie nette mensuelle]` |

**Conditions de bascule ROI :** Si le taux de succès qualitatif mesuré en production est inférieur de plus de 10 points au taux cible, le CPST réel dépasse le CPST humain de référence et la décision de déploiement doit être réexaminée ([Ch. 4 §4.4](ch04-roi-risk-readiness.md)).

---

## Section 4 — Readiness 4D

Référence : cadre readiness du [Ch. 4 §4.5](ch04-roi-risk-readiness.md). Score 1 à 5 par dimension. Seuils décisionnels : ≥ 15/20 → déployer ; 10–14/20 → plan de remédiation ; < 10/20 → Wait.

### D1 — Données

| Score | Critère |
|---|---|
| 1 | Données sources sans lignage documenté, sans SLA de fraîcheur défini |
| 2 | Lignage partiel, fraîcheur non contractualisée, pas de pipeline actif |
| 3 | Lignage documenté sur les sources primaires, fraîcheur contractualisée mais non monitorée |
| 4 | Pipelines actifs, lignage *end-to-end*, conformité Loi 25 / OSFI E-23 vérifiée |
| 5 | Pipelines certifiés, portabilité et interopérabilité confirmées |

**Score D1 :** `___/5` · **Lacunes identifiées :** `[Texte libre]` · **Plan de remédiation :** `[Actions + délais]`

---

### D2 — Processus

| Score | Critère |
|---|---|
| 1 | Processus actuel non documenté ; cas de bord non listés |
| 2 | Processus actuel documenté ; processus *cible* non défini |
| 3 | Processus cible documenté ; exceptions formalisées pour les cas nominaux seulement |
| 4 | Processus cible documenté avec exceptions exhaustives ; critères de succès binaires définis |
| 5 | Processus optimisé (étapes éliminées, pas seulement automatisées) ; critères de succès qualitatifs définis et validés avec les parties prenantes |

**Score D2 :** `___/5` · **Lacunes identifiées :** `[Texte libre]` · **Plan de remédiation :** `[Actions + délais]`

---

### D3 — Talents

| Score | Critère |
|---|---|
| 1 | Aucune compétence *agentic* interne ; dépendance totale au fournisseur |
| 2 | Compétences LLM génériques (prompt engineering) ; pas de capacité eval ni d'observabilité agentique |
| 3 | Capacité à écrire des eval suites sur cas nominaux ; instrumentation OTel basique |
| 4 | Eval suites sur distribution réelle (cas de bord inclus) ; on-call *agentic* opérationnel |
| 5 | Responsable AgentOps identifié ; capacité *promote/deprecate/rollback* maîtrisée ([Ch. 7](ch07-agentops.md)) |

**Score D3 :** `___/5` · **Lacunes identifiées :** `[Texte libre]` · **Plan de remédiation :** `[Actions + délais]`

---

### D4 — Gouvernance

| Score | Critère |
|---|---|
| 1 | Aucun artefact de gouvernance ; pas de définition du *successful outcome* |
| 2 | *Successful outcome* défini en termes nominaux uniquement (succès binaire, pas qualitatif) |
| 3 | *Successful outcome* qualitatif défini ; *eval suite* automatisée sur cas nominaux ; *escalation policy* esquissée |
| 4 | Trois artefacts Databricks complets (*successful outcome* qualitatif, *eval suite* couvrant cas de bord, *escalation policy* documentée avec seuils chiffrés) |
| 5 | Trois artefacts Databricks + *retry budget policy* avec *kill switch* financier + RACI superviseur documenté (cf. [Annexe D](annexe-D-governance-raci.md)) |

**Score D4 :** `___/5` · **Lacunes identifiées :** `[Texte libre]` · **Plan de remédiation :** `[Actions + délais]`

---

### Tableau récapitulatif readiness

| Dimension | Score | Seuil minimal | Statut |
|---|---|---|---|
| D1 — Données | `___/5` | 3/5 | `[ ] OK` · `[ ] Remédiation` · `[ ] Bloquant` |
| D2 — Processus | `___/5` | 3/5 | `[ ] OK` · `[ ] Remédiation` · `[ ] Bloquant` |
| D3 — Talents | `___/5` | 3/5 | `[ ] OK` · `[ ] Remédiation` · `[ ] Bloquant` |
| D4 — Gouvernance | `___/5` | 3/5 | `[ ] OK` · `[ ] Remédiation` · `[ ] Bloquant` |
| **Total** | `___/20` | **≥ 15** pour déployer | `[ ] Déployer` · `[ ] Plan de remédiation` · `[ ] Wait` |

---

## Section 5 — Décision quadrant

La matrice suivante croise l'autonomie cible (N1–N4, lue comme axe d'autonomie croissante) et la réversibilité (haute / moyenne / basse). La tolérance à l'erreur modifie le quadrant : une tolérance basse décale d'un quadrant vers le rouge indépendamment de la position autonomie × réversibilité.

| | Réversibilité haute | Réversibilité moyenne | Réversibilité basse |
|---|---|---|---|
| **Autonomie N1–N2** | **Quadrant Sûr** — déployer avec garde-fous standard | **Quadrant Supervisé** — garde-fous renforcés requis | **Quadrant Risqué** — validation architecture obligatoire |
| **Autonomie N3** | **Quadrant Supervisé** — garde-fous renforcés requis | **Quadrant Risqué** — validation architecture obligatoire | **Quadrant Interdit** — réduire une dimension avant déploiement |
| **Autonomie N4** | **Quadrant Risqué** — validation architecture obligatoire | **Quadrant Interdit** — réduire une dimension avant déploiement | **Quadrant Interdit** — réduire une dimension avant déploiement |

**Quadrant résultant :** `[ ] Sûr` · `[ ] Supervisé` · `[ ] Risqué` · `[ ] Interdit`

**Ajustement tolérance à l'erreur basse :** `[ ] Applicable — décaler d'un quadrant vers Interdit`

**Quadrant final après ajustement :** `[ ] Sûr` · `[ ] Supervisé` · `[ ] Risqué` · `[ ] Interdit`

---

### Recommandation kill / pivot / scale

| Signal | Condition | Action |
|---|---|---|
| **Kill** | Quadrant Interdit sans possibilité de réduction de dimension, ou score readiness < 10/20 sans feuille de route de remédiation crédible | Abandonner le cas d'usage ; réallouer les ressources vers un cas en quadrant Sûr |
| **Pivot** | Quadrant Risqué ou Interdit, mais réductible par contrainte de l'autonomie (N4 → N2) ou par périmètre d'outils (exclusion des actions irréversibles) | Redéfinir le périmètre d'autonomie ou d'outils, refaire le cadrage 3D, réévaluer le quadrant |
| **Scale** | Quadrant Sûr ou Supervisé avec score readiness ≥ 12/20 et plan de remédiation documenté pour les dimensions < 3/5 | Engager le déploiement pilote zone verte ; programmer la revue trimestrielle |

**Recommandation retenue :** `[ ] Kill` · `[ ] Pivot` · `[ ] Scale`

**Justification et conditions de bascule :**

> `[En 2 à 4 phrases : pourquoi cette recommandation, quel événement ou résultat la ferait changer]`

**Décision Build / Buy / Borrow / Wait** (référence [Ch. 4 §4.4](ch04-roi-risk-readiness.md)) :

> `[ ] Build` · `[ ] Buy` · `[ ] Borrow` · `[ ] Wait` — Justification : `[1 phrase]`

---

## Section 6 — Métriques de validation

Référence : cinq métriques canoniques du [Ch. 4 §4.2](ch04-roi-risk-readiness.md). Les seuils ci-dessous sont des hypothèses de travail de cette monographie ; les ajuster au contexte métier lors du remplissage.

| Métrique | Définition pour ce cas | Seuil d'acceptation minimal | Fréquence de mesure | Responsable |
|---|---|---|---|---|
| **Task success rate** (qualitatif) | `[Définir le critère de succès qualitatif pour ce cas — ex. : facture réconciliée sans erreur de montant > 0,01 $]` | `≥ 85 %` (*hypothèse maison — à ajuster*) | Quotidienne en production | PO |
| **Tool correctness** | `[Définir les outils critiques et les paramètres clés à valider — selection accuracy + parameter accuracy séparément]` | `≥ 90 % selection / ≥ 88 % parameter` (*hypothèse maison*) | Par tâche, agrégé hebdomadaire | Architecte |
| **Retry budget** | `[Définir le budget maximum de retries par tâche et le seuil d'alerte sur la distribution — ex. : budget 5 retries, alerte si > 20 % des tâches consomment > 3 retries]` | `< 20 % des tâches dépassent 50 % du budget` (*seuil Ch. 4 §4.2*) | Par tâche, agrégé quotidien | Architecte |
| **Escalation quality** | `[Définir les critères de déclenchement d'escalade, le type de routage attendu, et la qualité minimale du contexte transmis]` | `Trigger accuracy ≥ 90 % / Context quality ≥ 80 %` (*hypothèse maison*) | Par escalade, agrégé hebdomadaire | Risk officer |
| **Policy compliance** | `[Définir les politiques applicables — périmètre topical, contraintes données, exigences réglementaires sectorielles OSFI E-23 / Loi 25 si applicable]` | `100 % — toute violation est un incident P1` | Par tâche, alertes temps réel | Risk officer |

**Instrumentation recommandée :** OTel GenAI Agent Spans (statut *experimental* à mai 2026 — [Ch. 4 §4.3](ch04-roi-risk-readiness.md)) comme couche de base ; plateforme d'évaluation branchée par-dessus selon le profil de conformité de l'organisation.

---

## Mode d'emploi

**Étape 1 — Initialisation (avant la décision d'investissement).** Le PO complète la Section 1 et une première estimation de la Section 3. L'architecte complète les Sections 2 et 4. Le risk officer co-signe la Section 5. Durée estimée : 2 à 4 heures pour un cas bien connu de l'équipe.

**Étape 2 — Porte de qualification.** Si le quadrant final est Interdit (Section 5) ou si le score readiness est < 10/20 (Section 4), la décision est Kill ou Pivot avant tout engagement de ressources. Aucune exception sans validation de la direction.

**Étape 3 — Pilote zone verte.** Pour les cas Sûr ou Supervisé, déployer un pilote limité (volume réduit, population test définie) et mesurer les cinq métriques de la Section 6 pendant 30 à 60 jours. Les seuils d'acceptation ne sont pas négociables en cours de pilote ; s'ils ne sont pas atteints, la décision est Pivot, pas extension du pilote.

**Étape 4 — Revue trimestrielle.** Relire le canvas complet tous les trois mois ou à chaque changement matériel (version de modèle, volume +/− 30 %, nouveau périmètre d'outils). Les seuils de métriques, le CPST projeté et le score readiness doivent être recalibrés sur les données de production réelles. Un canvas non révisé est invalide.

**Étape 5 — Décision scale.** Si les métriques de la Section 6 sont atteintes sur au moins deux cycles de revue consécutifs et si le score readiness est ≥ 15/20, engager le passage à l'échelle avec les garde-fous documentés dans la Section 5. Référencer l'[Annexe C](annexe-C-agentops-maturity.md) pour évaluer la maturité AgentOps avant tout passage à l'échelle.

---

## Renvois croisés

- [Ch. 3 §3.2](ch03-mapping-high-impact.md) — Matrice autonomie × réversibilité × tolérance à l'erreur (fondement des Sections 2 et 5)
- [Ch. 4 §4.2](ch04-roi-risk-readiness.md) — Cinq métriques canoniques (fondement de la Section 6)
- [Ch. 4 §4.4](ch04-roi-risk-readiness.md) — Décision Build/Buy/Borrow/Wait (Section 5)
- [Ch. 4 §4.5](ch04-roi-risk-readiness.md) — Readiness 4D et scoring (fondement de la Section 4)
- [Ch. 8 §8.1](ch08-trustworthy-systems.md) — Niveaux d'autonomie N1–N4 (fondement de la Section 2.1)
- [Annexe C](annexe-C-agentops-maturity.md) — Modèle de maturité AgentOps (évaluation post-déploiement complémentaire)
- [Annexe D](annexe-D-governance-raci.md) — Matrice RACI agentique (RACI superviseur Section 5)
