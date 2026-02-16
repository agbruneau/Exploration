# Étude d'opportunité — Retrait et remplacement technologique

> **Objet :** Structure de référence pour évaluer l'opportunité de retirer une technologie existante et la remplacer par une solution répondant aux mêmes besoins.
>
> **Statut :** Brouillon | **Date :** AAAA-MM-JJ | **Auteur :** [Nom]

---

## 1. Résumé exécutif

Synthèse en une page : technologie visée, raison principale du retrait, solution de remplacement proposée, bénéfices attendus et recommandation.

---

## 2. Contexte et problématique

### 2.1 Technologie actuelle

- Nom, version, éditeur/communauté
- Date de mise en service et historique des évolutions majeures
- Périmètre fonctionnel couvert (capacités métier supportées)
- Positionnement dans l'architecture d'entreprise (couche applicative, intégration, données)
- Dépendances amont/aval (systèmes consommateurs, fournisseurs de données, APIs exposées)

### 2.2 Déclencheurs du retrait

- Fin de support éditeur (dates, roadmap officielle)
- Obsolescence technique (dette technique accumulée, incompatibilités, vulnérabilités connues)
- Inadéquation fonctionnelle (besoins métier non couverts ou mal couverts)
- Coûts croissants (licences, maintenance, compétences rares)
- Contraintes réglementaires ou de conformité
- Risques opérationnels identifiés (incidents récurrents, SLA non respectés)

### 2.3 Enjeux stratégiques

Alignement avec la stratégie d'entreprise, les objectifs d'architecture cible et la feuille de route technologique.

---

## 3. Analyse des besoins

### 3.1 Besoins fonctionnels

| ID | Besoin | Priorité (MoSCoW) | Couvert par techno actuelle | Commentaire |
|----|--------|-------------------|----------------------------|-------------|
| BF-01 | | Must / Should / Could / Won't | Oui / Partiel / Non | |

### 3.2 Besoins non fonctionnels

| Catégorie | Exigence | Niveau cible | Niveau actuel |
|-----------|----------|-------------|---------------|
| Performance | | | |
| Disponibilité | | | |
| Scalabilité | | | |
| Sécurité | | | |
| Observabilité | | | |
| Interopérabilité | | | |

### 3.3 Contraintes

- Contraintes d'intégration (protocoles, formats, patterns — ex. event-driven, API REST, messaging)
- Contraintes de données (migration, coexistence, intégrité référentielle)
- Contraintes organisationnelles (compétences disponibles, calendrier, dépendances inter-équipes)
- Contraintes réglementaires (rétention, souveraineté, auditabilité)

---

## 4. Analyse des solutions candidates

### 4.1 Critères d'évaluation

Définir les critères pondérés utilisés pour comparer les options (adéquation fonctionnelle, maturité, coût total, écosystème, communauté, facilité de migration, etc.).

### 4.2 Options évaluées

Pour chaque option (minimum 3, incluant le statu quo amélioré) :

#### Option A — [Nom de la solution]

- Description et positionnement
- Couverture des besoins fonctionnels et non fonctionnels
- Architecture d'intégration envisagée
- Forces et faiblesses
- Maturité et références dans le domaine

#### Option B — [Nom de la solution]

*(même structure)*

#### Option C — Statu quo amélioré

*(même structure — sert de baseline)*

### 4.3 Matrice de comparaison

| Critère | Poids | Option A | Option B | Option C (statu quo) |
|---------|-------|----------|----------|---------------------|
| | | /5 | /5 | /5 |
| **Score pondéré** | | | | |

---

## 5. Analyse d'impact

### 5.1 Impact sur l'architecture

- Cartographie des systèmes affectés (diagramme de contexte)
- Modifications requises sur les flux d'intégration
- Impact sur le modèle de données et la gouvernance des données
- Cohérence avec l'architecture cible (principes, standards, patterns)

### 5.2 Impact organisationnel

- Équipes impactées et effort de montée en compétences
- Changements de processus opérationnels
- Impact sur les contrats fournisseurs et licences
- Besoins en accompagnement du changement

### 5.3 Impact sur la sécurité et la conformité

- Analyse des risques de sécurité (delta entre ancien et nouveau)
- Conformité réglementaire (RGPD, sectoriel, etc.)
- Auditabilité et traçabilité

---

## 6. Analyse coûts-bénéfices

### 6.1 Coûts

| Poste de coût | Année 0 (projet) | Année 1 | Année 2 | Année 3 |
|---------------|------------------|---------|---------|---------|
| Licences / abonnements | | | | |
| Infrastructure | | | | |
| Migration et intégration | | | | |
| Formation | | | | |
| Accompagnement du changement | | | | |
| Coût de la double exploitation | | | | |
| **Total** | | | | |

### 6.2 Bénéfices

| Bénéfice | Type (quantifiable / qualitatif) | Estimation annuelle |
|----------|--------------------------------|---------------------|
| Réduction coûts de maintenance | Quantifiable | |
| Amélioration performance | Qualitatif | |
| Réduction du risque opérationnel | Qualitatif | |

### 6.3 ROI et délai de retour sur investissement

Calcul du ROI sur l'horizon défini. Seuil de rentabilité (break-even).

---

## 7. Risques et mesures d'atténuation

| ID | Risque | Probabilité | Impact | Stratégie d'atténuation |
|----|--------|-------------|--------|------------------------|
| R-01 | Perte de données lors de la migration | | | |
| R-02 | Résistance au changement | | | |
| R-03 | Dépassement de calendrier | | | |
| R-04 | Incompatibilité d'intégration non détectée | | | |

---

## 8. Stratégie de transition

### 8.1 Approche de migration

- Big bang vs migration progressive (strangler fig pattern, parallel run, etc.)
- Stratégie de coexistence pendant la transition
- Critères de bascule (go/no-go)

### 8.2 Plan de décommissionnement

- Étapes de retrait de la technologie actuelle
- Archivage des données et conservation réglementaire
- Résiliation des contrats et licences
- Nettoyage de l'infrastructure

### 8.3 Jalons clés

| Jalon | Date cible | Critère de validation |
|-------|-----------|----------------------|
| Proof of Concept validé | | |
| Migration pilote | | |
| Migration complète | | |
| Décommissionnement effectif | | |
| Clôture de projet | | |

---

## 9. Métriques de succès

| Métrique | Baseline (actuel) | Cible post-migration | Méthode de mesure |
|----------|-------------------|---------------------|-------------------|
| | | | |

---

## 10. Recommandation

Synthèse de l'analyse : option recommandée, justification, conditions de succès et prochaines étapes pour décision.

---

## Annexes

- A. Glossaire
- B. Cartographie d'architecture (AS-IS / TO-BE)
- C. Détail des flux d'intégration impactés
- D. Références (documentation éditeur, benchmarks, retours d'expérience)
- E. Parties prenantes consultées
