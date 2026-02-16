# Étude d'opportunité — Retrait de Microsoft Host Integration Server (HIS)

> **Objet :** Évaluer l'opportunité de retirer Microsoft HIS, utilisé pour l'accès au Mainframe d'entreprise, et le remplacer par une solution moderne répondant aux mêmes besoins de connectivité host.
>
> **Statut :** Brouillon | **Date :** AAAA-MM-JJ | **Auteur :** [Nom]
>
> **Plan d'exécution associé :** [`PRDPlan.md`](PRDPlan.md)
>
> **Document final (livrable) :** [`ÉtudeFinalRetrait.md`](ÉtudeFinalRetrait.md) — L'étude d'opportunité rédigée, produite en suivant le PRDPlan.md et structurée selon ce gabarit.
>
> **Études de référence (sources d'analyse) :**
>
> | Document | Contenu clé | Références |
> |----------|------------|------------|
> | [`Etude Perplexcity.md`](Etude%20Perplexcity.md) | Benchmark 6 alternatives (Azure Logic Apps, Boomi, MuleSoft, IBM ACE, PilotFish, Kafka), matrice de décision, plan de migration 4 phases (26 mois), analyse coûts en EUR, KPIs | 22 sources |
> | [`Etude Gemini.md`](Etude%20Gemini.md) | Analyse approfondie architecture TI/SNA, benchmark 6 alternatives, matrice technique détaillée, refactorisation TI→microservices (pattern Saga), analyse TCO/ROI (Forrester), subventions Québec (ESSOR, PCAN), gouvernance | 106 sources |
> | [`Scenarios.md`](Scenarios.md) | Matrice de 15 scénarios concrets répartis sur 5 patterns d'intégration HIS (P1-P5), scoring de viabilité (2.30–3.90/5), roadmap 3 vagues (0-36 mois), estimation effort 260 pts Fibonacci, matrice de décision Rehost/Refactor/Rewrite/Coexist, diagramme de dépendances inter-scénarios | — |
>
> ⚠️ **Ces trois documents alimentent directement la rédaction de `ÉtudeFinalRetrait.md`.** Les convergences entre les études renforcent les recommandations ; les divergences doivent être analysées et arbitrées. La matrice des scénarios (`Scenarios.md`) fournit le plan opérationnel détaillé de migration par vagues.

---

## 0. Fiche d'identité — Technologie cible du retrait

> ⚠️ **Cette section doit être complétée en premier** (Phase 0 du PRDPlan.md).
> Elle constitue le cadrage de l'étude et conditionne toutes les sections suivantes.

| Attribut | Valeur |
|----------|--------|
| **Technologie à retirer** | Microsoft Host Integration Server (HIS), Microsoft |
| **Version(s) en exploitation** | _[HIS 2016 et/ou HIS 2020 — préciser]_ |
| **Rôle principal** | Passerelle de connectivité entre l'environnement Windows/.NET et le Mainframe IBM d'entreprise |
| **Protocoles / fonctions exploités** | _[Cocher les applicables : SNA/LU 6.2 · TN3270/TN5250 · DRDA (accès DB2) · MQ Bridge · Session Integrator · Transaction Integrator (TI) pour CICS/IMS · Data Integration (fichiers host)]_ |
| **Date de mise en service** | _[Année de déploiement initial]_ |
| **Processus métier dépendants** | _[Liste des capacités métier supportées via le Mainframe — ex. gestion des comptes, traitement batch, consultation de données de référence]_ |
| **Raison principale du retrait** | Obsolescence · _[Préciser : fin de support, dette technique, coût des compétences SNA, inadéquation avec l'architecture cloud-native cible]_ |
| **Technologie de remplacement pressentie** | _[À déterminer — sera évaluée en §4]_ |
| **Horizon de décision** | _[Date cible]_ |
| **Commanditaire (sponsor)** | _[Nom, rôle]_ |
| **Parties prenantes à consulter** | _[Liste noms/rôles — inclure : équipe Mainframe, équipe middleware, architectes d'intégration, sécurité, exploitation]_ |

### Contexte lifecycle Microsoft HIS

| Version | Statut (2026) | Échéance clé |
|---------|--------------|--------------|
| HIS 2013 | ❌ Fin de vie | 9 janvier 2024 |
| HIS 2016 | ⚠️ Support étendu uniquement | Fin de vie ~2027 |
| HIS 2020 | ✅ Support standard | Prolongé jusqu'au 11 juillet 2028 |

> **Source :** [Microsoft Lifecycle — HIS 2020](https://learn.microsoft.com/en-us/lifecycle/products/microsoft-host-integration-server-2020) · [Microsoft Lifecycle — HIS 2016](https://learn.microsoft.com/en-us/lifecycle/products/microsoft-host-integration-server-2016)

### Validation du cadrage

- [ ] Version(s) HIS en exploitation identifiée(s)
- [ ] Protocoles et fonctions HIS utilisés inventoriés
- [ ] Processus métier dépendants du Mainframe via HIS listés
- [ ] Fiche complétée avec les parties prenantes
- [ ] Périmètre validé par le commanditaire
- [ ] Prêt pour la Phase 1

---

## 1. Résumé exécutif

> _Rédiger en dernier (Phase 7 du PRDPlan.md)._

Synthèse en une page : technologie visée (**reprendre §0**), raison principale du retrait, solution de remplacement proposée, bénéfices attendus et recommandation.

---

## 2. Contexte et problématique

### 2.1 Microsoft HIS — État actuel

> _Approfondir la fiche d'identité (§0) avec les détails techniques._

- **Produit :** Microsoft Host Integration Server — **version(s) et CU en exploitation tel qu'identifié en §0**
- **Historique :** Successeur de Microsoft SNA Server. Évolutions majeures déployées (versions, cumulative updates)
- **Périmètre fonctionnel couvert via HIS** — **détailler les processus listés en §0** :
  - Accès transactionnel au Mainframe (CICS, IMS) via Transaction Integrator (TI)
  - Accès aux données DB2 via DRDA / Data Provider for DB2
  - Émulation de terminal 3270/5250 (TN3270, Session Integrator)
  - Connectivité SNA LU 6.2 (APPC)
  - Pont MQ Series (si applicable)
  - Intégration de fichiers host (VSAM, séquentiels)
- **Positionnement dans l'architecture d'entreprise :**
  - Couche d'intégration — passerelle entre le monde Windows/.NET et l'environnement Mainframe IBM (z/OS)
  - Rôle dans les patterns d'intégration en place (synchrone requête-réponse, batch, messaging)
- **Dépendances amont/aval :**
  - Systèmes consommateurs (applications .NET, services WCF/API, traitements batch Windows)
  - Systèmes Mainframe cibles (CICS regions, IMS, DB2 subsystems, VTAM/NCP)
  - Infrastructure réseau SNA (DLC, IP-DLC) ou TCP/IP

### 2.2 Déclencheurs du retrait de HIS

> _Développer factuellement la raison identifiée en §0 et documenter les déclencheurs secondaires._
> **Sources :** Perplexity §1.2-1.3 (contraintes, dette technique, cycle de vie) · Gemini §1.3-1.4 (contraintes technologiques, dette technique détaillée, risques capital humain)

- **Fin de support Microsoft :**
  - HIS 2016 : fin de support étendu ~2027
  - HIS 2020 : support standard jusqu'en juillet 2028 — absence de successeur annoncé par Microsoft
  - Aucune indication de version HIS future, signalant un possible abandon du produit
- **Obsolescence technique :**
  - Architecture SNA vieillissante — compétences SNA/APPC de plus en plus rares sur le marché
  - Dépendance à une infrastructure Windows Server on-premise pour le gateway
  - Incompatibilité avec les architectures cloud-native, containerisées et event-driven
  - Dette technique accumulée (configurations SNA, scripts de déploiement non standardisés)
- **Inadéquation avec l'architecture cible :**
  - Pattern d'intégration propriétaire vs API-first / event-driven
  - Absence d'observabilité native (pas de support OpenTelemetry, métriques limitées)
  - Difficulté à intégrer HIS dans un pipeline CI/CD moderne
- **Coûts croissants :**
  - Licences Windows Server dédiées au gateway HIS
  - Coût des compétences SNA et HIS (profils rares, taux journaliers élevés)
  - Maintenance opérationnelle de l'infrastructure SNA (VTAM, NCP si applicable)
- **Risques opérationnels :**
  - Point de défaillance unique (SPOF) si pas de haute disponibilité HIS configurée
  - Incidents récurrents liés à la connectivité SNA (documenter si applicable)
  - SLA non respectés (documenter si applicable)

### 2.3 Enjeux stratégiques

Alignement avec la stratégie d'entreprise, les objectifs d'architecture cible et la feuille de route technologique.

---

## 3. Analyse des besoins

### 3.1 Besoins fonctionnels — Connectivité Mainframe

> **Source scénarios :** Les 5 patterns d'intégration HIS identifiés dans `Scenarios.md` correspondent directement aux besoins fonctionnels ci-dessous. Chaque pattern est scoré (viabilité 1-5) et associé à des scénarios concrets de migration.

| ID | Besoin | Priorité (MoSCoW) | Couvert par HIS | Pattern Scenarios.md | Score viabilité |
|----|--------|-------------------|-----------------|---------------------|----------------|
| BF-01 | Accès transactionnel CICS/IMS (requête-réponse synchrone) | Must | Oui (TI) | P1 — Synchronous CICS TI | 3.25 (Conditional Go) |
| BF-02 | Accès données DB2 z/OS (lecture/écriture) | Must | Oui (DRDA) | P4 — Database Access DB2 | 2.75 (Conditional Go avec réserves) |
| BF-03 | Émulation terminal 3270 pour opérations manuelles | Should | Oui (TN3270) | P5 — Terminal Emulation | 2.30 (Conditional Go transitoire) |
| BF-04 | Transfert de fichiers host (VSAM, séquentiels) | Should | Partiel | P2 — Batch File Transfer | 3.90 (GO) |
| BF-05 | Intégration messaging (MQ Series bridge) | _[Must/Should/N/A]_ | _[Oui/Non/N/A]_ | P3 — Event-Driven MQ | 3.55 (Conditional Go) |
| BF-06 | Exposition via API REST/gRPC pour consommateurs modernes | Must | Non | Transversal (tous patterns) | — |
| BF-07 | Support event-driven (publication d'événements Mainframe) | Should | Non | P3 — Event-Driven MQ | 3.55 (Conditional Go) |

### 3.2 Besoins non fonctionnels

| Catégorie | Exigence | Niveau cible | Niveau actuel (HIS) |
|-----------|----------|-------------|---------------------|
| Performance | Latence transactionnelle CICS/IMS | _[< X ms]_ | _[Baseline]_ |
| Disponibilité | SLA de la passerelle Mainframe | _[99.9% / 99.99%]_ | _[Baseline HIS]_ |
| Scalabilité | Nombre de sessions concurrentes | _[Cible]_ | _[Capacité HIS actuelle]_ |
| Sécurité | Chiffrement de bout en bout (TLS), authentification intégrée | _[TLS 1.3, MFA]_ | _[TLS via HIS, auth Windows]_ |
| Observabilité | Traces distribuées, métriques, alertes | _[OpenTelemetry natif]_ | _[Limité — logs HIS, perfmon]_ |
| Interopérabilité | Support multi-plateforme (Linux, containers, cloud) | _[Multiplateforme]_ | _[Windows Server uniquement]_ |

### 3.3 Contraintes spécifiques au remplacement de HIS

- **Contraintes d'intégration Mainframe :**
  - Protocoles obligatoires côté host (SNA LU 6.2, TCP/IP pour TN3270, DRDA pour DB2)
  - Programmes CICS/IMS existants — toute solution doit pouvoir invoquer les transactions sans modification côté Mainframe
  - Formats de données host (EBCDIC, packed decimal, COBOL copybooks) — conversion requise
  - Patterns d'intégration en place (synchrone, batch, messaging) à maintenir ou migrer
- **Contraintes de données :**
  - Aucune migration de données en soi (les données restent sur le Mainframe)
  - Migration des métadonnées HIS : définitions TI, configurations SNA, mappings de données
  - Coexistence HIS / nouvelle solution pendant la transition
- **Contraintes organisationnelles :**
  - Compétences Mainframe (CICS, DB2, z/OS) nécessaires pour la transition
  - Compétences HIS en voie de disparition — fenêtre de transfert de connaissances limitée
  - Coordination avec l'équipe Mainframe (souvent gérée séparément)
  - Calendrier aligné sur les cycles de maintenance Mainframe
- **Contraintes réglementaires :**
  - Auditabilité des accès au Mainframe (traçabilité des transactions)
  - Conformité sectorielle pour les données transitant par la passerelle
  - Continuité de service pendant la transition (aucune interruption des accès Mainframe critiques)

---

## 4. Analyse des solutions candidates

### 4.1 Critères d'évaluation

Définir les critères pondérés utilisés pour comparer les options. Critères suggérés pour le remplacement de HIS.

> **Sources :** Perplexity §3 (matrice de décision technique, 6 critères) · Gemini §3 (matrice 6×6 avec protocoles, transformation, performance, déploiement)

| Critère | Description | Poids suggéré |
|---------|-------------|---------------|
| Couverture fonctionnelle Mainframe | Support des protocoles et transactions CICS/IMS/DB2 | Élevé |
| Maturité et références | Déploiements en production, cas d'usage similaires | Élevé |
| TCO sur 5 ans | Licences + infra + migration + compétences | Élevé |
| Compatibilité cloud-native | Containers, Kubernetes, cloud hybride | Moyen |
| Observabilité | Traces, métriques, intégration monitoring existant | Moyen |
| Facilité de migration depuis HIS | Reprise des configurations TI, mappings, effort de migration | Moyen |
| Écosystème et support | Communauté, documentation, support éditeur | Moyen |
| Exposition API moderne | REST, gRPC, event-driven natif | Moyen |

### 4.2 Options évaluées

Pour chaque option (minimum 3, incluant le statu quo amélioré).
Les pistes de remplacement typiques pour HIS dans un contexte Mainframe sont pré-identifiées ci-dessous — à valider et compléter.

> **Convergence des études :** Les deux études identifient Azure Logic Apps comme successeur naturel de HIS (convergence stratégique Microsoft). Elles recommandent toutes deux Apache Kafka en complément pour les flux event-driven. Boomi, MuleSoft, PilotFish et IBM ACE sont évalués dans les deux études.
>
> **Sources détaillées :** Perplexity §2.1-2.6 · Gemini §2.1-2.2

#### Option A — Azure Logic Apps (Standard) — *Recommandation convergente des deux études*

- Successeur naturel de HIS avec connecteurs built-in IBM (3270, CICS, IMS, DB2, MQ, Host Files)
- HIS Designer for Logic Apps : conversion des copybooks COBOL en métadonnées HIDX sans installer HIS
- Architecture single-tenant, faible latence, intégration VNet Azure
- **Limitation critique :** LU6.2 non supporté nativement — nécessite HIS résiduel temporaire (Perplexity §2.1, Gemini §2.1.1)
- Tarification pay-as-you-go (connecteur Standard ~0,000125 $/appel)

#### Option A-bis — IBM z/OS Connect EE (ou successeur)

- Exposition native des transactions CICS/IMS et données DB2 en API REST/JSON directement depuis z/OS
- Couverture des besoins fonctionnels et non fonctionnels
- Architecture d'intégration : appels API directs au Mainframe, suppression de la couche gateway Windows
- Forces et faiblesses
- Maturité et références dans le domaine

#### Option B — Plateforme iPaaS tierce (Boomi, MuleSoft, PilotFish)

- **Boomi :** iPaaS leader Gartner, Atom runtimes on-prem/cloud, connecteurs AS400/IBM i, migration IA Infosys (-40% coûts, -50% effort manuel). Pas de support SNA natif. (Perplexity §2.2, Gemini §2.1.2)
- **MuleSoft :** API-led connectivity, connecteur CICS via CTG, DataWeave pour copybooks COBOL/EBCDIC. Tarification premium ~80K$/an. (Perplexity §2.3, Gemini §2.1.3)
- **PilotFish :** Moteur low-code 7 étapes, parsing EBCDIC/fichiers plats, import XSLT BizTalk. Optimal pour santé/assurance. (Perplexity §2.5, Gemini §2.2.1)

#### Option C — IBM App Connect Enterprise (ACE) + Apache Kafka

- **IBM ACE :** Support natif complet des protocoles IBM (LU6.2, APPC, DRDA), parsing COBOL via DFDL, intégration MQ native. Voie de moindre résistance si écosystème IBM fort. (Perplexity §2.4, Gemini §2.2.2)
- **Apache Kafka :** Complément event-driven — offloading, intégration, remplacement progressif. Kafka Connect MQ source/sink. CDC DB2→Kafka. Cas réels : Fidelity, BEC. (Perplexity §2.6, Gemini §2.2.2)

#### Option D — Statu quo amélioré (maintien de HIS 2020)

- Conserver HIS 2020 avec support standard jusqu'en 2028
- Modernisation partielle (ajout d'une couche API devant HIS)
- Sert de **baseline** pour la comparaison
- Forces : aucun effort de migration, compétences existantes
- Faiblesses : reporte le problème, dette technique croissante, dépendance Windows

### 4.3 Matrice de comparaison

| Critère | Poids | Option A (z/OS Connect) | Option B (Gateway tierce) | Option C (Custom CTG) | Option D (Statu quo HIS) |
|---------|-------|------------------------|--------------------------|----------------------|--------------------------|
| Couverture fonctionnelle Mainframe | | /5 | /5 | /5 | /5 |
| Maturité et références | | /5 | /5 | /5 | /5 |
| TCO sur 5 ans | | /5 | /5 | /5 | /5 |
| Compatibilité cloud-native | | /5 | /5 | /5 | /5 |
| Observabilité | | /5 | /5 | /5 | /5 |
| Facilité de migration depuis HIS | | /5 | /5 | /5 | /5 |
| Écosystème et support | | /5 | /5 | /5 | /5 |
| Exposition API moderne | | /5 | /5 | /5 | /5 |
| **Score pondéré** | **100%** | | | | |

---

## 5. Analyse d'impact

### 5.1 Impact sur l'architecture

- Cartographie des systèmes consommant le Mainframe via HIS (diagramme de contexte)
- Modifications requises sur les flux d'intégration :
  - Remplacement des appels TI (Transaction Integrator) par le nouveau mécanisme
  - Migration des accès DRDA/DB2 vers le nouveau provider
  - Remplacement ou retrait des sessions TN3270 si applicable
  - Impact sur les traitements batch utilisant HIS
- Impact sur le réseau : retrait potentiel de l'infrastructure SNA (VTAM, NCP, DLC)
- Cohérence avec l'architecture cible (API-first, event-driven, cloud-native)

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

> **Sources :** Perplexity §5.1-5.3 (coûts statu quo 140-240K€/an, TCO 5 ans, bénéfices qualitatifs) · Gemini §5.1-5.3 (TCO comparatif CapEx→OpEx, ROI Forrester 228-410%, subventions Québec ESSOR/PCAN)

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

> **Sources :** Perplexity §6.1-6.3 (risques techniques et opérationnels, stratégie rollback 4 niveaux) · Gemini §6.1-6.2 (risques EBCDIC/COMP-3, latence APPC→TCP/IP, résistance au changement, spaghetti architecture) · **Scenarios.md** §1.4, §2.4, §3.4, §4.4, §5.4 (risques par pattern, scoring viabilité)

| ID | Risque | Probabilité | Impact | Stratégie d'atténuation | Pattern(s) |
|----|--------|-------------|--------|------------------------|------------|
| R-01 | Perte de connectivité Mainframe lors de la bascule | | Critique | Parallel run, rollback plan, déploiement blue-green | Tous |
| R-02 | Incompatibilité de conversion de données (EBCDIC, packed decimal, COBOL copybooks) | | Élevé | Tests de régression automatisés, jeux de données de référence | P1, P2, P4 |
| R-03 | Perte de connaissances HIS/SNA avant fin de migration | | Élevé | Documentation anticipée, transfert de connaissances, contractualisation experts | Tous |
| R-04 | Résistance au changement des équipes opérations Mainframe | | Moyen | Accompagnement du changement, implication précoce | Tous |
| R-05 | Perte de la garantie 2PC LU6.2 pour les transactions d'écriture | Moyenne | Critique | Reporter écritures à Wave 2, pattern Saga avec compensation | P1 |
| R-06 | Indisponibilité des environnements Mainframe de test | | Moyen | Réservation anticipée des LPAR de test | Tous |
| R-07 | Dépendances non documentées vers HIS découvertes tardivement | | Élevé | Inventaire exhaustif Phase 1, scan des configurations | Tous |
| R-08 | Perte de messages en transition MQ→Kafka | Moyenne | Critique | Dual-write avec réconciliation automatisée, dead-letter queues | P3 |
| R-09 | Stored procedures COBOL non documentées (reverse engineering requis) | Élevée | Élevé | Outils CAST/Micro Focus, équipe COBOL + DBA DB2 dédiée | P4 |
| R-10 | Casse intégration suite à modification écran BMS (screen scraping) | Élevée | Critique | Tests de régression automatisés, scraping transitoire < 12 mois | P5 |
| R-11 | Dégradation de latence API Gateway vs LU6.2 direct | Haute | Moyen | Benchmark comparatif, cache Redis pour lectures | P1 |

---

## 8. Stratégie de transition

### 8.1 Approche de migration

> **Sources :** Perplexity §4.1-4.3 (Strangler Fig par vagues Agile, 4 phases, priorités de migration MQ→DB2→TI→SNA) · Gemini §4.1-4.4 (Strangler Fig + ACL, refactorisation TI→Saga, migration MQ→Kafka, modernisation AS400 via API REST) · **Scenarios.md** §4 (matrice Rehost/Refactor/Rewrite/Coexist) + §5 (roadmap 3 vagues, 15 scénarios, dépendances)

- Big bang vs migration progressive — **recommandation : strangler fig pattern** pour HIS
  - Migrer les flux Mainframe un par un (par transaction CICS / dataset DB2 / flux batch)
  - Parallel run : nouveau connecteur et HIS en parallèle avec comparaison des résultats
- Stratégie de coexistence HIS / nouvelle solution pendant la transition
- Critères de bascule (go/no-go) par flux migré

#### Matrice de décision par approche (Scenarios.md §4)

| Approche | Scénarios HIS cibles | Effort | Risque | Durée |
|----------|---------------------|--------|--------|-------|
| **Rehost / Lift-and-Shift** | Tous patterns — code déplacé tel quel | Faible-Moyen (8-21 pts) | Moyen | 6-12 mois |
| **Refactor / Strangler Fig** | P1, P3, P4 — APIs et événements | Moyen (13-34 pts) | Faible-Moyen | 12-24 mois |
| **Rewrite / Cloud-Native** | P2, P5 — batch et UI obsolètes | Élevé (55-89 pts) | Élevé | 18-36 mois |
| **Coexist / Hybrid** | Tous patterns — mainframe reste opérationnel | Faible (5-13 pts) | Faible | 3-6 mois initial |

#### Roadmap 3 vagues (Scenarios.md §5)

- **Wave 1 — Quick Wins (0-6 mois)** : 5 scénarios pilotes (P2 Batch, P5→P1 Refactor, P3 MQ), ROI mesurable dès les premières semaines
- **Wave 2 — Strategic (6-18 mois)** : 5 scénarios (digitalisation sinistres, souscription en ligne, reporting réglementaire, portail partenaires), 12 ETP requis
- **Wave 3 — Long-term (18-36 mois)** : 5 scénarios complexes (moteur tarification, provisions, comptabilité, décommissionnement 3270, décommissionnement final HIS)

> **Effort consolidé** : 260 points Fibonacci (47 analyse + 121 développement + 63 tests + 29 déploiement) — cf. Scenarios.md §7.A

#### Dépendances inter-scénarios (Scenarios.md §6)

Prérequis techniques bloquants pour Wave 1 : z/OS Connect 3.0, API Gateway, connectivité sécurisée mainframe↔cloud, IAM unifié (RACF↔OAuth2/OIDC), CI/CD mainframe (IBM Wazi/DBB), environnements de test mainframe isolés.

### 8.2 Plan de décommissionnement de HIS

> **Source :** Scenarios.md §5 Wave 3 — plan de décommissionnement en 4 phases (M18-M36)

- Étapes de retrait de HIS :
  - **Phase A (M18-M22)** : Redirection 80% du trafic HIS vers APIs
  - **Phase B (M22-M28)** : Migration des 20% restants
  - **Phase C (M28-M32)** : Mode observation (HIS en standby, 30 jours sans trafic)
  - **Phase D (M32-M36)** : Décommissionnement définitif — arrêt instances, libération licences
- Archivage des configurations HIS (TI definitions, SNA configurations, connection strings)
- Résiliation des licences HIS et des licences Windows Server associées
- Nettoyage de l'infrastructure réseau SNA (VTAM, NCP, DLC)

### 8.3 Jalons clés

| Jalon | Date cible | Critère de validation |
|-------|-----------|----------------------|
| Architecture de référence validée (Wave 1 J1) | S2 | Document approuvé, z/OS Connect provisionné |
| POC scénario pilote (Wave 1 J2) | S6 | API fonctionnelle, < 200ms, 100 tx/min sans erreur |
| Scénarios pilotes en production (Wave 1 J3) | S16 | Taux erreur < 0.1%, SLA respectés, rollback testé |
| Bilan Wave 1, Go/No-Go Wave 2 (Wave 1 J5) | S24 | ROI mesuré vs prévisionnel, RETEX formalisé |
| Migration complète (Wave 2+3) | M28 | 100% flux migrés |
| Décommissionnement effectif (Wave 3 Phase D) | M32-M36 | HIS arrêté, licences libérées |
| Clôture de projet | M36 | Vision cible atteinte : 100% API, 0 session 3270, HIS décommissionné |

---

## 9. Métriques de succès

| Métrique | Baseline (HIS actuel) | Cible post-migration | Méthode de mesure |
|----------|----------------------|---------------------|-------------------|
| Latence transactionnelle CICS (P95) | _[ms]_ | _[ms]_ | APM / traces distribuées |
| Disponibilité passerelle Mainframe | _[%]_ | _[%]_ | Monitoring SLA |
| Nombre d'incidents/mois liés à la connectivité host | _[N]_ | _[Cible]_ | ITSM / registre incidents |
| Coût annuel de la couche d'intégration Mainframe | _[$]_ | _[$]_ | Comptabilité analytique |
| Délai moyen de mise en production d'un nouveau flux Mainframe | _[jours]_ | _[jours]_ | Mesure projet |
| Nombre de flux Mainframe exposés en API | _[0 ou N]_ | _[Cible]_ | Registre API |

---

## 10. Recommandation

Synthèse de l'analyse : option recommandée, justification, conditions de succès et prochaines étapes pour décision.

---

## Annexes

- A. Glossaire (SNA, LU 6.2, APPC, TN3270, DRDA, TI, CICS, IMS, VTAM, NCP, EBCDIC, COBOL copybook, etc.)
- B. Cartographie d'architecture (AS-IS avec HIS / TO-BE avec solution cible) — **inclure les diagrammes AS-IS/TO-BE des 15 scénarios de `Scenarios.md`**
- C. Inventaire des flux Mainframe passant par HIS (transaction CICS, dataset DB2, fichier host, session 3270) — **structurer selon les 5 patterns P1-P5 de `Scenarios.md`**
- D. Références (documentation Microsoft HIS, documentation solution cible, benchmarks, retours d'expérience)
- E. Parties prenantes consultées — **initialiser depuis §0**
- F. Journal de décision (décisions prises à chaque phase du PRDPlan.md)
- G. Matrice de scoring consolidée des 5 patterns (Scenarios.md §3) — grille 6 critères pondérés
- H. Diagramme de dépendances inter-scénarios (Scenarios.md §6) — prérequis techniques et organisationnels
- I. Estimation effort consolidée (Scenarios.md §7.A) — 260 pts Fibonacci, ventilation par pattern et par phase
