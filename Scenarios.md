# Matrice des Scenarios Candidats -- Migration Microsoft Host Integration Server

> **Document** : Identification et qualification des scenarios de migration HIS vers une plateforme moderne
> **Date** : 2026-02-16
> **Statut** : Draft v1.0
> **Auteur** : Equipe his-migration

---

## Resume executif

Ce document presente le catalogue priorise des scenarios candidats pour la migration de Microsoft Host Integration Server (HIS) vers une plateforme moderne. L'analyse couvre les 5 patterns d'integration HIS identifies, avec pour chacun des scenarios concrets, un scoring de viabilite et une strategie de migration recommandee.

**Synthese des resultats :**

| Pattern | Score | Verdict | Effort (Fibonacci) | Timeline |
|---|---|---|---|---|
| **Pattern 2** -- Batch File Transfer | **3.90 / 5.00** | **GO** | 29 points | 6-9 mois |
| **Pattern 3** -- Event-Driven MQ | **3.55 / 5.00** | Conditional Go | 47 points | 12-18 mois |
| **Pattern 1** -- Synchronous CICS TI | **3.25 / 5.00** | Conditional Go | 47 points | 10-15 mois |
| **Pattern 4** -- Database Access DB2 | **2.75 / 5.00** | Conditional Go (reserves) | 76 points | 18-24 mois |
| **Pattern 5** -- Terminal Emulation | **2.30 / 5.00** | Conditional Go (transitoire) | 61 points | 28-32 semaines |

**Recommandation de sequencage** : Demarrer par le Pattern 2 (Batch File Transfer), qui offre le meilleur rapport benefice/risque (score 3.90, effort faible), puis enchainer avec les Patterns 3 et 1 en parallele, et reporter les Patterns 4 et 5 aux vagues ulterieures.

**Scenarios pilotes Wave 1** : 5 scenarios identifies pour un demarrage sous 6 mois, avec un ROI mesurable des les premieres semaines.

---

## 1. Cadre d'evaluation des scenarios

### 1.1 Dimensions d'analyse

L'evaluation de chaque scenario repose sur quatre dimensions complementaires :

* **Complexite technique** : Protocoles utilises (LU6.2, APPC, DRDA), transformations de donnees (EBCDIC/ASCII), dependances COBOL/RPG
* **Criticite metier** : Impact sur les operations, SLA exiges (TAT, disponibilite), volume transactionnel
* **Dette technique** : Age du code, documentation disponible, competences mainframe dans l'equipe
* **Valeur de modernisation** : ROI potentiel, alignement strategique, opportunites d'amelioration

### 1.2 Grille de scoring

Pour chaque scenario identifie, le systeme de scoring suivant est applique :

| Critere | Poids | Score (1-5) |
|---|---|---|
| Simplicite technique | 25% | 1=Tres complexe, 5=Simple |
| Impact metier faible en cas d'echec | 20% | 1=Critique, 5=Negligeable |
| ROI eleve | 20% | 1=Faible ROI, 5=ROI>200% |
| Documentation/Connaissance | 15% | 1=Absente, 5=Exhaustive |
| Sponsor executif | 10% | 1=Opposition, 5=Champion |
| Conformite reglementaire | 10% | 1=Bloquant, 5=Non concerne |

**Score composite** = Sigma(Poids x Score) -- Prioriser scenarios >3.5/5

### 1.3 Criteres de qualification

* **Go** : Score >3.5, sponsor identifie, documentation >60%, POC faisable en <4 semaines
* **Conditional Go** : Score 2.5-3.5, necessite reverse engineering ou refactoring limite
* **No-Go/Defer** : Score <2.5, criticite maximale, competences absentes, report post-phase 2

---

## 2. Taxonomie des patterns d'integration HIS

---

## Pattern 1 : Synchronous Request-Response (CICS Transaction Integrator)

### 1.1 Description et caracteristiques

**Definition fonctionnelle**

Le Pattern 1 couvre les integrations synchrones ou Microsoft Host Integration Server (HIS) expose des programmes CICS COBOL du mainframe IBM z/OS comme des composants .NET via le Transaction Integrator (TI). Le client Windows/.NET invoque une methode sur un proxy TI, qui traduit l'appel en requete LU6.2 (SNA) ou TCP/IP vers le programme CICS cible, attend la reponse, et retourne le resultat au client.

**Caracteristiques techniques**

| Attribut | Detail |
|---|---|
| **Protocole** | SNA LU6.2 (APPC) ou TCP/IP (ELM/Link) |
| **Interface mainframe** | COMMAREA (jusqu'a 32 KB) ou Channels/Containers (CICS TS 3.1+) |
| **Modele d'interaction** | Requete-reponse synchrone, bloquant |
| **Timeout typique** | 1 a 3 secondes (configurable dans TI) |
| **Couplage** | Fort -- le client depend directement de la disponibilite et du schema du programme CICS |
| **Transaction** | Support 2PC (two-phase commit) via LU6.2 ; pas de 2PC en TCP/IP |
| **Conversion** | EBCDIC/ASCII automatique, conversion de types COBOL vers .NET (packed decimal, COMP-3, etc.) |
| **Debit** | CICS traite > 1 million de transactions/seconde globalement sur z/OS |

**Cas d'usage typiques en entreprise**

- **Banque** : Consultation de solde en temps reel, verification de credit, execution de virements
- **Assurance** : Verification de couverture police, tarification en ligne, consultation de sinistres
- **Retail** : Consultation de stock en temps reel, verification de prix, validation de commande
- **Telecommunications** : Activation de lignes, consultation de forfait, verification d'eligibilite

### 1.2 Scenarios candidats concrets

#### Scenario 1.2.1 : Consultation de solde bancaire en temps reel

**Description fonctionnelle**
Un portail web bancaire ou une application mobile interroge le mainframe pour obtenir le solde courant et les N dernieres operations d'un compte client.

**Architecture actuelle (avec HIS)**
```
[App Web .NET] --> [HIS Transaction Integrator] --LU6.2--> [CICS Region]
                                                              |
                                                         [Pgm COBOL INQBAL]
                                                              |
                                                         [DB2 Comptes]
```

**Architecture cible proposee**
```
[App Web/Mobile] --> [API Gateway (Azure APIM)] --> [Azure Logic Apps / Microservice Java]
                                                          |
                                                    [IBM CICS TG / z/OS Connect EE]
                                                          |
                                                    [CICS Region / Pgm COBOL INQBAL]
                                                          |
                                                    [DB2 Comptes]
```
- Phase 1 (Strangler Fig) : API Gateway facade devant HIS TI existant
- Phase 2 : Remplacement HIS TI par Azure Logic Apps CICS Connector ou MuleSoft IBM CTG Connector
- Phase 3 (optionnel) : Re-ecriture du programme COBOL en microservice Java/Spring Boot

**Volumetrie typique** : 50 000 a 200 000 requetes/jour, pics a 500 TPS, COMMAREA 2-4 KB

---

#### Scenario 1.2.2 : Verification de couverture assurance

**Description fonctionnelle**
Interrogation du mainframe pour verifier les garanties actives d'un contrat d'assurance, les plafonds restants et les exclusions applicables.

**Architecture actuelle (avec HIS)**
```
[CRM .NET / Portail Assure] --> [HIS TI] --LU6.2--> [CICS Region]
                                                          |
                                                     [Pgm COBOL COVCHK]
                                                          |
                                                     [VSAM Polices] + [DB2 Garanties]
```

**Architecture cible proposee**
```
[CRM / Portail] --> [API Gateway] --> [Microservice Couverture]
                                            |
                                      [Cache Redis (TTL 5min)]
                                            |
                                      [Azure Logic Apps CICS Connector / CTG]
                                            |
                                      [CICS COVCHK]
```

**Volumetrie typique** : 20 000 a 80 000 requetes/jour, pics a 150 TPS, COMMAREA 1.5 KB

---

#### Scenario 1.2.3 : Consultation de stock en temps reel (Retail)

**Description fonctionnelle**
Le site e-commerce et les caisses en magasin interrogent le mainframe pour connaitre la disponibilite d'un article.

**Architecture actuelle (avec HIS)**
```
[Site e-commerce / POS] --> [HIS TI] --TCP/IP ELM--> [CICS Region]
                                                          |
                                                     [Pgm COBOL STKINQ]
                                                          |
                                                     [VSAM Stocks]
```

**Architecture cible proposee**
```
[Site e-commerce / POS] --> [API Gateway] --> [Service Stock (Event-Driven)]
                                                    |
                                              [Event Store / CQRS]
                                                    |
                                              [CDC depuis VSAM --> Kafka --> Materialized View]
```
- Strategie CQRS : vue materialisee alimentee en quasi-temps reel via Change Data Capture. Elimine la dependance synchrone au mainframe pour les lectures.

**Volumetrie typique** : 500 000 a 2 000 000 requetes/jour (pics Black Friday), pics a 3 000 TPS

---

#### Scenario 1.2.4 : Execution de virement bancaire (ecriture)

**Description fonctionnelle**
Le client initie un virement entre deux comptes depuis l'application de banque en ligne. Le mainframe debite/credite atomiquement.

**Architecture actuelle (avec HIS)**
```
[App Banque en ligne] --> [HIS TI (2PC LU6.2)] --> [CICS Region]
                                                        |
                                                   [Pgm COBOL XFRTRAN]
                                                        |
                                                   [DB2 Comptes] (debit + credit atomique)
```

**Architecture cible proposee**
```
[App Banque] --> [API Gateway] --> [Service Virement (Saga Orchestrator)]
                                         |
                                   [CICS via z/OS Connect EE]    [Service Anti-Fraude]
                                         |                              |
                                   [DB2 Comptes]                 [ML Model Azure]
```
- Remplacement du 2PC LU6.2 par un pattern Saga orchestre. Migration la plus risquee du lot.

**Volumetrie typique** : 100 000 a 500 000 virements/jour, pics a 200 TPS

### 1.3 Scoring du pattern

| Critere | Poids | Score (1-5) | Justification |
|---|---|---|---|
| **Simplicite technique** | 25% | 3 | Modele bien compris mais gestion LU6.2/SNA, conversion COMMAREA et couplage fort ajoutent de la complexite. |
| **Impact metier faible en cas d'echec** | 20% | 2 | Transactions souvent sur chemin critique. Les lectures sont moins risquees que les ecritures (virement). |
| **ROI eleve** | 20% | 4 | Elimination licences HIS + SNA Gateway, reduction couts MIPS, ouverture API Economy/Open Banking. |
| **Documentation / Connaissance** | 15% | 4 | Documentation TI complete (Microsoft, IBM CICS TG, MuleSoft CTG). |
| **Sponsor executif** | 10% | 4 | Porte par les programmes de transformation digitale (PSD2, omnicanalite). |
| **Conformite reglementaire** | 10% | 3 | Exigences strictes (PSD2, Solvency II, RGPD) -- faisable mais attention requise. |

**Score composite = 0.75 + 0.40 + 0.80 + 0.60 + 0.40 + 0.30 = 3.25 / 5.00**

### 1.4 Analyse de viabilite

**Verdict : CONDITIONAL GO**

Le pattern est viable pour les scenarios en lecture seule (solde, stock, couverture) avec un risque maitrisable. Les scenarios en ecriture transactionnelle (virement) necessitent une validation approfondie du remplacement du 2PC LU6.2 par un pattern Saga.

**Risques techniques majeurs**

| # | Risque | Probabilite | Impact | Mitigation |
|---|---|---|---|---|
| R1 | Perte de la garantie 2PC pour les ecritures | Moyenne | Critique | Reporter ecritures a la vague 2. Pattern Saga avec compensation. |
| R2 | Degradation de latence via API Gateway vs LU6.2 direct | Haute | Moyen | Benchmark comparatif. Cache pour les lectures. |
| R3 | Perte de metadata TI lors de la conversion | Moyenne | Moyen | Export systematique des metadata HIS TI. Validation automatisee. |
| R4 | Indisponibilite mainframe durant la bascule | Faible | Critique | Deploiement blue-green avec rollback instantane. |

**Estimation effort (points Fibonacci)**

| Phase | Points |
|---|---|
| Analyse et design | 8 |
| Developpement | 21 |
| Tests | 13 |
| Deploiement | 5 |
| **Total** | **47** |

**Timeline** : Vague 1 (lectures) 4-6 mois, Vague 2 (ecritures) 6-9 mois supplementaires. Total : 10-15 mois.

### 1.5 Strategie de migration recommandee

**Approche : Strangler Fig avec API Gateway + Connecteur CICS moderne**

**Technologies cibles** :
- **Option A (Azure)** : Azure API Management + Azure Logic Apps CICS Connector
- **Option B (Hybride)** : Azure APIM + MuleSoft Anypoint avec IBM CTG Connector
- **Option C (IBM)** : Azure APIM + IBM z/OS Connect EE (REST natif sur z/OS)

**Etapes** :
1. **Inventaire et cartographie** (S1-S4) : Catalogue des integrations TI avec scoring
2. **Design API et POC** (S5-S10) : POC sur 1-2 integrations a faible risque
3. **Implementation facade API** (S11-S20) : Canary deployment progressif
4. **Decommissionnement HIS TI** (S21-S26) : Validation stabilite, decommissionnement
5. **Migration ecritures transactionnelles** (Mois 7-15) : Pattern Saga, tests de resilience

**Criteres de succes** :
- Latence P95 <= 500ms
- Disponibilite >= 99.95%
- Zero perte de donnees sur les ecritures
- Reduction 100% des licences HIS TI
- Reduction 15-25% des couts MIPS

---

## Pattern 2 : Batch File Transfer (FTP/SFTP via HIS)

### 2.1 Description et caracteristiques

Le Pattern 2 couvre les integrations par transfert de fichiers batch ou HIS assure le transfert, la conversion et la transformation de fichiers entre le mainframe IBM z/OS et les systemes Windows/distribues.

**Caracteristiques techniques**

| Attribut | Detail |
|---|---|
| **Protocole de transfert** | FTP/SFTP entre z/OS et serveur Windows HIS |
| **Formats source** | VSAM (KSDS, ESDS), fichiers sequentiels (PS), GDG |
| **Conversion** | EBCDIC vers ASCII via HIS Host File component + COBOL Copybook |
| **Planification** | Schedulers Windows (Task Scheduler, Control-M) integres a HIS |
| **Fenetre d'execution** | Batch nocturne typique : 22h-06h |
| **Volume** | De quelques Mo a plusieurs Go par fichier |

**Flux typique**

```
[Mainframe z/OS]                    [Serveur HIS Windows]              [Systeme cible]
     |                                      |                               |
[Job JCL produit fichier VSAM/PS]           |                               |
     |---FTP/SFTP (EBCDIC)--------------->  |                               |
                                    [HIS Host File Adapter]                 |
                                    [Conversion EBCDIC->ASCII]              |
                                            |---Fichier ASCII/CSV--------> [DB/DWH/App]
```

### 2.2 Scenarios candidats concrets

#### Scenario 2.2.1 : Rapprochement bancaire batch (reconciliation)

Chaque nuit, le mainframe produit un fichier de l'ensemble des transactions de la journee. Ce fichier est transfere vers le systeme de reconciliation distribue.

**Architecture actuelle**
```
[Mainframe z/OS] --FTP (EBCDIC)--> [HIS Conversion] --CSV--> [Import SQL Server] --> [Reconciliation]
```

**Architecture cible**
```
[Mainframe z/OS] --SFTP--> [Azure Blob Storage] --> [Azure Data Factory + Cobrix] --> [Synapse Analytics]
```

**Volumetrie** : 2 a 5 Go par fichier, 5 a 15 millions d'enregistrements, fenetre 23h-06h

---

#### Scenario 2.2.2 : Generation de releves de compte mensuels

En fin de mois, le mainframe genere les releves de compte pour l'ensemble des clients, transferes vers le systeme d'editique et le portail client.

**Architecture cible**
```
[Mainframe] --SFTP--> [Azure Data Lake] --> [ADF Conversion] --> [Service PDF Azure] + [API Portail Client]
```

**Volumetrie** : 10 a 50 Go par mois, 2 a 10 millions de releves

---

#### Scenario 2.2.3 : Alimentation du Data Warehouse / Data Lake

Chaque nuit, le mainframe exporte les donnees de reference et les mouvements vers le Data Warehouse pour le reporting et l'analyse BI.

**Architecture cible**
```
[Mainframe] --SFTP/Precisely--> [Azure Data Lake Gen2 (Raw)] --> [ADF / Apache NiFi] --> [Delta Lake / Synapse]
```

**Volumetrie** : 5 a 20 Go par nuit, 10-30 fichiers, SLA avant 07h

---

#### Scenario 2.2.4 : Transmission reglementaire (reporting regulateur)

Fichiers reglementaires (COREP, FINREP, Solvency II, declarations fiscales) transformes et transmis aux autorites de supervision.

**Architecture cible**
```
[Mainframe] --SFTP chiffre--> [Azure Blob Immutable] --> [ADF Validation] --> [Service XBRL/XML] --> [Regulateur]
```

**Volumetrie** : 100 Mo a 2 Go par run, frequence mensuelle a trimestrielle, zero erreur requis

### 2.3 Scoring du pattern

| Critere | Poids | Score (1-5) | Justification |
|---|---|---|---|
| **Simplicite technique** | 25% | 4 | Pattern bien maitrise. Outils de conversion EBCDIC matures (Cobrix, NiFi). |
| **Impact metier faible en cas d'echec** | 20% | 4 | Fenetres de rattrapage batch. Pas d'impact client temps reel. |
| **ROI eleve** | 20% | 4 | Elimination licences HIS + serveur Windows, pay-per-use cloud, parallelisation. |
| **Documentation / Connaissance** | 15% | 4 | COBOL Copybooks = documentation de facto. Outils bien documentes. |
| **Sponsor executif** | 10% | 3 | Moins visible que l'API Economy mais ROI reel. |
| **Conformite reglementaire** | 10% | 4 | Stockage immutable Azure, audit trail complet. |

**Score composite = 1.00 + 0.80 + 0.80 + 0.60 + 0.30 + 0.40 = 3.90 / 5.00**

### 2.4 Analyse de viabilite

**Verdict : GO**

Candidat ideal pour la premiere vague de migration. Complexite maitrisee, impact faible en cas d'echec, outils matures, ROI directement mesurable.

**Risques techniques majeurs**

| # | Risque | Probabilite | Impact | Mitigation |
|---|---|---|---|---|
| R1 | Copybooks COBOL complexes (REDEFINES, OCCURS DEPENDING ON) | Moyenne | Moyen | Validation avec jeux de donnees de reference. Cobrix/NiFi gerent nativement. |
| R2 | Fenetre batch insuffisante apres migration | Faible | Moyen | Benchmark SFTP vers Azure. Compression et parallelisation. |
| R3 | Perte de donnees lors du transfert | Faible | Critique | Checksums MD5/SHA256, retry automatique, stockage immutable. |
| R4 | Regression dans les transformations EBCDIC | Moyenne | Moyen | Execution parallele pendant 4-8 semaines. Comparaison automatisee. |

**Estimation effort** : 29 points Fibonacci. **Timeline** : 6-9 mois.

### 2.5 Strategie de migration recommandee

**Approche : Metadata-Driven ETL Pipelines avec execution parallele**

**Technologies** : Azure Data Factory + Apache NiFi EBCDICRecordReader + Azure Data Lake Gen2 + Cobrix

**Etapes** :
1. **Inventaire et metadata** (S1-S3) : Catalogue des fichiers batch
2. **Pipeline pilote** (S4-S8) : 2-3 fichiers simples, execution parallele, reconciliation
3. **Migration incrementale** (S9-S20) : Fichiers par lots de complexite croissante
4. **Fichiers reglementaires** (S21-S28) : Audit trail complet, validation compliance
5. **Decommissionnement** (S29-S34) : Suppression HIS, optimisation pipelines

**Criteres de succes** :
- Reconciliation 100% entre ancien et nouveau pipeline
- Fenetre batch reduite de >= 20%
- Elimination 100% des composants HIS
- Reduction couts operationnels >= 30%
- Taux de succes batch >= 99.5%

---

## Pattern 3 : Event-Driven Integration (MQ/HIS Bridge)

### 3.1 Description et caracteristiques

Le Pattern 3 repose sur l'integration par messages asynchrones entre les systemes mainframe et les applications modernes, en utilisant IBM MQ comme backbone de messagerie et Microsoft HIS comme passerelle d'integration.

**Composants cles :**
- **IBM MQ (WebSphere MQ)** : Middleware de messagerie avec livraison garantie via MQPUT/MQGET
- **HIS MSMQ-MQSeries Bridge** : Pont entre Microsoft MSMQ et IBM MQ
- **HIS BizTalk Adapter for MQ** : Orchestration BizTalk des flux MQ
- **WCF Channel for IBM MQ** : Canal WCF pour applications .NET
- **Microsoft Client for MQ** (HIS 2016+) : Client natif Windows

**Caracteristiques techniques**

| Caracteristique | Detail |
|---|---|
| Mode de communication | Asynchrone, decoupled |
| Garantie de livraison | At-least-once (persistent), at-most-once (non-persistent) |
| Patterns supportes | Point-to-point, Publish-Subscribe (MQ Topics) |
| Debit typique (persistent) | ~70K round trips/sec |
| Debit typique (non-persistent) | ~325K round trips/sec |
| Formats de messages | MQMD headers, COBOL copybook, XML, JSON, binary |

### 3.2 Scenarios candidats concrets

#### Scenario 3.2.1 : Notification de paiement en temps reel

Lorsqu'un paiement est traite sur le mainframe, un message de confirmation est emis vers les systemes aval (portail client, mobile banking, CRM).

**Architecture actuelle**
```
[CICS Payment] --> MQPUT --> [MQ z/OS] --> [MQ Windows] --> [HIS MSMQ Bridge] --> [.NET Consumers]
```

**Architecture cible**
```
[CICS Payment] --> MQPUT --> [MQ z/OS] --> [Kafka Connect MQ Source] --> [Kafka] --> [Microservices]
```

**Volumetrie** : 50 000 - 200 000 messages/jour, pics a 500/sec

---

#### Scenario 3.2.2 : Propagation de changements du referentiel client (CDC)

Toute modification des donnees client sur le mainframe est propagee en temps quasi-reel vers les systemes distribues.

**Architecture cible**
```
[DB2 z/OS] --> [Debezium CDC] --> [Kafka] --> [Kafka Streams enrichissement] --> [Elasticsearch, Data Lake, CRM]
```

**Volumetrie** : 10 000 - 50 000 evenements/jour, latence cible < 5 secondes

---

#### Scenario 3.2.3 : Alertes de seuil de credit et conformite

Le systeme mainframe de gestion des risques emet des alertes lors de depassements de seuils ou de transactions suspectes.

**Architecture cible**
```
[IMS Risk Engine] --> MQPUT --> [MQ z/OS] --> [Kafka Connect] --> [Kafka] --> [Azure Functions / PagerDuty]
```

**Volumetrie** : 1 000 - 10 000 alertes/jour, latence < 2 secondes pour alertes critiques

---

#### Scenario 3.2.4 : Synchronisation des cours de marche et prix de reference

Mises a jour de prix publiees depuis le mainframe vers les systemes de pricing, trading et reporting.

**Architecture cible**
```
[Pricing Engine] --> [Kafka Connect MQ Source] --> [Kafka compacted topic] --> [Schema Registry Avro] --> [Consumers]
```

**Volumetrie** : 100 000 - 500 000 messages/jour, pics a 2 000/sec

### 3.3 Scoring du pattern

| Critere | Poids | Score (1-5) | Justification |
|---|---|---|---|
| **Simplicite technique** | 25% | 3 | Migration MQ->Kafka bien documentee (connecteurs IBM). Complexite des schemas COBOL et garantie d'ordre. |
| **Impact metier faible en cas d'echec** | 20% | 4 | Asynchrone = rollback simple. Dual-write assure la continuite. |
| **ROI eleve** | 20% | 4 | Kafka : debit superieur, cout inferieur en open-source, debloque analytics temps reel. |
| **Documentation / Connaissance** | 15% | 4 | Connecteurs IBM officiels, documentation Azure/AWS, guides Confluent. |
| **Sponsor executif** | 10% | 3 | Aligne avec initiatives data-driven mais ROI moins immediatement visible. |
| **Conformite reglementaire** | 10% | 3 | Auditabilite adressable (retention Kafka, Schema Registry) mais attention GDPR/DORA. |

**Score composite = 0.75 + 0.80 + 0.80 + 0.60 + 0.30 + 0.30 = 3.55 / 5.00**

### 3.4 Analyse de viabilite

**Verdict : Conditional Go**

Pattern techniquement mature et bien supporte. Viable sous reserve de :
1. POC sur scenario a faible risque (synchronisation des prix)
2. Environnement de coexistence MQ/Kafka avec monitoring unifie
3. Sponsor executif cote metier identifie

**Risques techniques majeurs**

| Risque | Probabilite | Impact | Mitigation |
|---|---|---|---|
| Perte de messages en transition MQ->Kafka | Moyenne | Critique | Dual-write avec reconciliation automatisee, dead-letter queues |
| Incompatibilite schemas COBOL / Avro | Elevee | Moyen | Schema Registry avec evolution compatible, couche de transformation |
| Latence accrue par hop supplementaire | Faible | Moyen | Benchmarking, Kafka Connect distribue |
| Complexite operationnelle coexistence | Moyenne | Moyen | Runbook, monitoring unifie Prometheus/Grafana |
| Competences equipe insuffisantes Kafka | Moyenne | Moyen | Formation Confluent, expertise externe 6 mois |

**Estimation effort** : 47 points Fibonacci. **Timeline** : 6-9 mois (premier scenario), 12-18 mois (migration complete).

### 3.5 Strategie de migration recommandee

**Approche : Apache Kafka + Connecteurs MQ Source/Sink, Pattern Strangler Fig**

**Etapes** :
1. **Fondation** (S1-S6) : Deployer Kafka + Schema Registry + Kafka Connect + monitoring
2. **POC** (S7-S12) : Scenario 3.2.4 (synchronisation prix) -- haute volumetrie, faible criticite
3. **Migration flux metier** (S13-S30) : CDC client, puis notifications paiement, puis alertes credit
4. **Decommissioning** (S31-S40) : Desactivation consumers HIS, redirection producers vers Kafka

**Criteres de succes** :

| Critere | Cible |
|---|---|
| Perte de messages | 0 |
| Latence end-to-end | < 2 sec (alertes), < 5 sec (CDC), < 10 sec (prix) |
| Disponibilite | 99.95% |
| Throughput | >= MQ actuel + 20% marge |
| Rollback | < 30 min par scenario |
| Cout operationnel | Reduction 30% vs MQ/HIS a 24 mois |

---

## Pattern 4 : Database Access (DB2 via DRDA)

### 4.1 Description et caracteristiques

Le Pattern 4 couvre l'acces direct aux donnees DB2 z/OS depuis les applications distribuees (.NET, Java) via le protocole DRDA, en utilisant HIS comme couche d'abstraction.

**Composants cles :**
- **Microsoft OLE DB Provider for DB2** : Acces OLE DB via conversion DRDA
- **Microsoft Service for DRDA** : Application Server pour clients DRDA
- **ADO.NET Data Provider for DB2** : Provider manage .NET
- **Entity Framework Provider** : Support EF pour applications .NET modernes

**Caracteristiques techniques**

| Caracteristique | Detail |
|---|---|
| Protocole | DRDA sur TCP/IP |
| Types d'operations | SELECT, INSERT, UPDATE, DELETE, CALL (stored procedures) |
| Transactions | 2-phase commit via DTC |
| Stored Procedures | Support SP COBOL/SQL PL via DRDA CALL |
| Types de donnees | Mapping automatique EBCDIC <-> Unicode, packed decimal |

### 4.2 Scenarios candidats concrets

#### Scenario 4.2.1 : Lookup client en temps reel (Customer 360)

Applications front-office interrogeant le mainframe pour les informations client consolidees.

**Architecture cible (2 phases)** :
- Phase 1 : JDBC direct vers DB2 + Cache Redis (sans HIS)
- Phase 2 : Base distribuee (PostgreSQL/CosmosDB) + Sync CDC depuis DB2

**Volumetrie** : 100 000 - 500 000 requetes/jour, temps de reponse < 200ms

---

#### Scenario 4.2.2 : Calcul de tarification et eligibilite produit

Applications de souscription appelant des stored procedures mainframe complexes COBOL/SQL PL.

**Architecture cible** :
- Phase 1 : JDBC direct DB2 (appel SP existante)
- Phase 2 : Rules Engine moderne (Drools/OPA) avec regles extraites du COBOL

**Volumetrie** : 20 000 - 80 000 calculs/jour, 500+ regles COBOL

---

#### Scenario 4.2.3 : Acces au referentiel produits mainframe

Applications distribuees interrogeant le referentiel central de produits financiers sur DB2 z/OS.

**Architecture cible** :
- Phase 1 : JDBC direct + Cache Redis (TTL 15min)
- Phase 2 : PostgreSQL/MongoDB + Elasticsearch + Sync CDC/batch

**Volumetrie** : 50 000 - 200 000 lectures/jour, donnees stables

---

#### Scenario 4.2.4 : Reporting reglementaire et extraction de donnees

Extractions massives depuis DB2 z/OS pour rapports reglementaires (Bale III/IV, Solvabilite II, IFRS 9).

**Architecture cible** :
- Phase 1 : JDBC direct + Azure Synapse/Databricks
- Phase 2 : CDC -> Kafka -> Data Lake (Delta Lake/Iceberg) -> Power BI

**Volumetrie** : 10M - 100M lignes par extraction, fenetre batch 2-4 heures

### 4.3 Scoring du pattern

| Critere | Poids | Score (1-5) | Justification |
|---|---|---|---|
| **Simplicite technique** | 25% | 2 | Forte dependance SP COBOL, mapping types complexe, transactions distribuees 2PC. |
| **Impact metier faible en cas d'echec** | 20% | 2 | Acces DB2 souvent sur chemin critique (tarification, lookup client). |
| **ROI eleve** | 20% | 4 | Elimination licences HIS, reduction couts MIPS, acces API debloque innovation. |
| **Documentation / Connaissance** | 15% | 3 | Documentation HIS complete mais connaissance SP COBOL souvent limitee a quelques experts. |
| **Sponsor executif** | 10% | 4 | Reduction couts mainframe = argument executif fort. |
| **Conformite reglementaire** | 10% | 2 | Donnees personnelles et financieres critiques. Audits de migration complexes. |

**Score composite = 0.50 + 0.40 + 0.80 + 0.45 + 0.40 + 0.20 = 2.75 / 5.00**

### 4.4 Analyse de viabilite

**Verdict : Conditional Go (avec reserves significatives)**

Score de 2.75 refletant la complexite inherente. Viable mais necessite approche tres progressive, expertise COBOL/DB2 dediee, investissement significatif en tests.

**Conditions strictes pour le Go :**
1. Inventaire exhaustif des SP COBOL avec analyse de complexite
2. POC reussi sur referentiel produits (lecture seule, faible couplage)
3. Equipe dediee COBOL + Java/.NET + DB2 DBA
4. Plan de rollback teste et valide

**Risques techniques majeurs**

| Risque | Probabilite | Impact | Mitigation |
|---|---|---|---|
| Perte d'integrite transactionnelle (2PC) | Elevee | Critique | Migration progressive, tests exhaustifs |
| SP COBOL non documentees | Elevee | Eleve | Reverse-engineering assiste (Micro Focus, CAST) |
| Performance degradee | Moyenne | Eleve | Benchmarking, cache agressif |
| Mapping types incorrect | Elevee | Moyen | Tests de conversion automatises |
| Perte de competences COBOL | Moyenne | Eleve | Contractualisation experts, knowledge transfer |

**Estimation effort** : 76 points Fibonacci. **Timeline** : 9-12 mois (premier scenario), 18-24 mois (migration complete).

### 4.5 Strategie de migration recommandee

**Approche : 3 horizons**

**Horizon 1 -- Elimination HIS, JDBC direct (Mois 1-6)** :
- Driver IBM DB2 JDBC Type 4 (connexion directe, sans middleware)
- Connection pooling optimise (HikariCP)
- Cache Redis/Hazelcast pour lectures frequentes
- SP COBOL existantes maintenues

**Horizon 2 -- Services REST/GraphQL (Mois 6-15)** :
- APIs REST devant chaque scenario d'acces DB2
- API Gateway avec rate limiting, caching, authentication
- Pattern Backend for Frontend (BFF)

**Horizon 3 -- Microservices et bases modernes (Mois 15-24)** :
- Migration donnees referentiel vers PostgreSQL/MongoDB
- Portage regles tarification vers Rules Engine (Drools/OPA)
- Migration client vers base distribuee + CDC
- Reporting vers data lakehouse (Databricks/Synapse)

---

## Pattern 5 : Terminal Emulation / Screen Scraping (3270/5250)

### 5.1 Description et caracteristiques

Le Pattern 5 repose sur l'acces programmatique aux ecrans CICS via emulation TN3270/TN5250. Un middleware externe etablit une session terminal vers le mainframe, navigue dans les ecrans BMS, injecte des frappes et extrait les donnees affichees.

**Caracteristiques structurelles**

| Caracteristique | Detail |
|---|---|
| **Protocole** | TN3270E (RFC 2355) ou TN5250 sur TCP/IP |
| **Point d'acces** | Ecrans BMS generes par les programmes CICS (COBOL/PL-I) |
| **Couplage** | Tres eleve -- toute modification d'ecran casse l'integration |
| **Latence** | Elevee -- chaque interaction = aller-retour reseau complet |
| **Scalabilite** | Faible -- chaque session consomme une unite de travail CICS |
| **Securite** | Risque de credentials en clair dans les scripts |
| **Maintenabilite** | Tres faible -- scripts fragiles dependants des coordonnees (ligne, colonne) |

### 5.2 Scenarios candidats concrets

#### Scenario A : Consultation de l'historique d'un contrat d'assurance

Navigation de 4 a 6 ecrans BMS pour consulter garanties, avenants, sinistres passes, echeancier.

**Architecture cible** : API REST `/api/v1/contracts/{id}/history` via z/OS Connect EE, reponse JSON consolidant 6 ecrans en 1 payload.

**Volumetrie** : 15 000/jour, temps de reponse actuel 8-12s, cible < 500ms

---

#### Scenario B : Saisie d'une declaration de sinistre

Saisie sur 8 ecrans BMS avec controles de validite et appels croises entre transactions.

**Architecture cible** : API REST `/api/v1/claims` (POST) + orchestration microservice + file MQ pour les pieces justificatives.

**Volumetrie** : 3 000/jour (pics saisonniers x3-x5), temps de saisie actuel 12-15 min, cible 5-7 min

---

#### Scenario C : Acces aux positions titres

Tableau pagine avec codes ISIN, quantites, cours et plus/moins-values.

**Architecture cible** : API REST avec pagination serveur + enrichissement temps reel (Bloomberg, Refinitiv) + cache.

**Volumetrie** : 8 000/jour, temps de reponse actuel 5-20s, cible < 1s

---

#### Scenario D : Consultation du referentiel client unifie

Acces au referentiel client (identite, adresses, scoring, KYC/AML) via 5 ecrans BMS. Jusqu'a 200 utilisateurs simultanes.

**Architecture cible** : API REST + GraphQL via z/OS Connect + event-driven sync vers cache distribue.

**Volumetrie** : 45 000/jour, temps de reponse actuel 3-6s, cible < 200ms

### 5.3 Scoring du pattern

| Critere | Poids | Score (1-5) | Justification |
|---|---|---|---|
| **Simplicite technique** | 25% | 2 | Screen scraping intrinsequement fragile. Dependance coordonnees ecran. |
| **Impact metier faible en cas d'echec** | 20% | 2 | Erreurs silencieuses possibles. Risque d'injection de donnees corrompues pour les ecritures. |
| **ROI eleve** | 20% | 3 | Cout d'entree faible mais couts de maintenance recurrents erodent le benefice. ROI negatif > 18 mois. |
| **Documentation / Connaissance** | 15% | 2 | Mappings BMS peu documentes. Connaissance tacite chez les operateurs. |
| **Sponsor executif** | 10% | 3 | Percu comme solution rapide. Sponsoring s'erode avec les incidents. |
| **Conformite reglementaire** | 10% | 2 | Problemes d'auditabilite, credentials RACF dans scripts, tracabilite insuffisante. |

**Score composite = 0.50 + 0.40 + 0.60 + 0.30 + 0.30 + 0.20 = 2.30 / 5.00**

### 5.4 Analyse de viabilite

**Verdict : Conditional Go (usage transitoire uniquement)**

Viable uniquement comme solution transitoire (< 12 mois) quand :
- Le programme CICS n'a pas de COMMAREA/CHANNEL exploitable
- Le refactoring est impossible a court terme
- Le volume transactionnel est faible (< 500 tx/jour)

**Risques techniques majeurs**

| Risque | Probabilite | Impact | Mitigation |
|---|---|---|---|
| Casse integration suite a modification ecran BMS | Elevee | Critique | Tests de regression automatises, alerting |
| Degradation performance sous charge | Elevee | Majeur | Pool de connexions avec circuit breaker |
| Fuite de credentials RACF | Moyenne | Critique | Vault (CyberArk/HashiCorp), rotation automatique |
| Donnees extraites incorrectes | Moyenne | Majeur | Double validation, checksum champs critiques |
| Sessions CICS orphelines | Moyenne | Moyen | Timeout agressif, monitoring, garbage collection |

**Estimation effort** : 61 points Fibonacci pour 4 scenarios. **Timeline** : 28-32 semaines.

### 5.5 Strategie de migration recommandee

**Recommandation : API-first modernization via z/OS Connect**

**Le screen scraping ne doit pas etre la cible finale.**

**Principes directeurs** :
1. Jamais de screen scraping pour les transactions d'ecriture
2. Le CICS 3270 Bridge est toujours preferable au scraping externe
3. Chaque integration scraping est une dette technique avec date d'expiration
4. Monitoring proactif obligatoire

**Etapes** :
1. **Inventaire et classification** (S1-S4) : Classifier chaque transaction (Type A=COMMAREA, Type B=BMS Bridge, Type C=scraping transitoire)
2. **Modernisation z/OS Connect** (S5-S20) : Exposer les programmes Type A et B en REST/JSON -- cible 80%
3. **Screen scraping transitoire Type C** (S5-S16, parallele) : Duree de vie max 12 mois
4. **Decommissionnement scraping** (S20-S32) : Refactoring Type C, extinction des sessions

---

## 3. Grille de scoring consolidee

### Tableau recapitulatif

| Pattern | Simplicite (25%) | Impact (20%) | ROI (20%) | Doc (15%) | Sponsor (10%) | Conformite (10%) | **Score** | **Verdict** |
|---|---|---|---|---|---|---|---|---|
| **P2 Batch** | 4 | 4 | 4 | 4 | 3 | 4 | **3.90** | **GO** |
| **P3 MQ** | 3 | 4 | 4 | 4 | 3 | 3 | **3.55** | Conditional Go |
| **P1 CICS TI** | 3 | 2 | 4 | 4 | 4 | 3 | **3.25** | Conditional Go |
| **P4 DB2** | 2 | 2 | 4 | 3 | 4 | 2 | **2.75** | Conditional Go (reserves) |
| **P5 3270** | 2 | 2 | 3 | 2 | 3 | 2 | **2.30** | Conditional Go (transitoire) |

### Classification par priorite

**Quick Wins (Score > 3.5)** :
- Pattern 2 -- Batch File Transfer : Score 3.90, effort faible, candidat immediat

**Strategic (Score 2.5 - 3.5)** :
- Pattern 3 -- Event-Driven MQ : Score 3.55, effort moyen, fort potentiel strategique
- Pattern 1 -- Synchronous CICS TI : Score 3.25, effort moyen, ROI eleve

**Long-term (Score < 2.5 ou effort eleve)** :
- Pattern 4 -- Database Access DB2 : Score 2.75, effort eleve, reserves significatives
- Pattern 5 -- Terminal Emulation : Score 2.30, usage transitoire uniquement

---

## 4. Matrice de decision par approche

| Critere | **Rehost / Lift-and-Shift** | **Refactor / Strangler Fig** | **Rewrite / Cloud-Native** | **Coexist / Hybrid** |
|---|---|---|---|---|
| **Quand l'utiliser** | Contrainte de temps forte, fermeture datacenter, budget limite | Systeme complexe a forte valeur, modernisation progressive | Application en fin de vie, refonte strategique decidee | Pas de date butoir, systeme stable, modernisation progressive |
| **Scenarios HIS cibles** | Tous patterns -- code deplace tel quel | Patterns 1, 3, 4 -- APIs et evenements | Patterns 2, 5 -- batch et UI obsoletes | Tous patterns -- mainframe reste operationnel |
| **Effort** | Faible a Moyen (8-21 pts) | Moyen (13-34 pts) | Eleve (55-89 pts) | Faible (5-13 pts) |
| **Risque** | Moyen | Faible a Moyen | Eleve | Faible |
| **Duree typique** | 6-12 mois | 12-24 mois | 18-36 mois | 3-6 mois initial |
| **Avantages** | Rapidite, sortie hardware, reduction MIPS immediate, logique preservee | Sans disruption, ROI incremental, rollback granulaire, montee en competence | Elimination totale dette technique, architecture optimisee, independance | Risque minimal, quick wins rapides, continuite garantie, flexibilite |
| **Inconvenients** | Pas de modernisation applicative, dette conservee, dependance emulateur | Duree longue, complexite coexistence, double competences requises | Cout tres eleve, effet tunnel, perte logique non documentee | Pas de reduction dependance mainframe, couts maintenus, complexite croissante |

### Anti-patterns a eviter

- **Rehost** : Ne pas rehost d'applications couplees au hardware mainframe. Ne pas "lift-and-forget" sans plan de modernisation post-migration.
- **Strangler Fig** : Ne pas decouper trop fin (nano-services). Ne pas faire du dual-write sans reconciliation. Ne pas strangler sans decommissionner.
- **Rewrite** : Ne pas reecrire "a l'identique". Ne pas reecrire sans implication utilisateurs metier. Pas de big bang sans migration progressive.
- **Coexist** : Ne pas rester en hybride permanent sans trajectoire. Ne pas multiplier les technologies d'integration.

---

## 5. Roadmap de migration par vague

### Wave 1 : Quick Wins (0-6 mois)

**Scenarios pilotes selectionnes :**

| # | Scenario | Pattern | Score | Justification | Approche |
|---|---|---|---|---|---|
| 1 | Consultation referentiel client (RCLI) | P5 -> P1 | 3.8 | Volume eleve (45K/jour), COMMAREA existante, ROI immediat | Refactor -> z/OS Connect API |
| 2 | Consultation historique contrat (CHIS) | P5 -> P1 | 3.5 | 6 ecrans consolidables en 1 API, forte demande metier | Refactor -> z/OS Connect API |
| 3 | Consultation positions titres (POSI) | P5 -> P1 | 3.3 | Lecture seule, pagination convertible en API | Refactor -> z/OS Connect API |
| 4 | Exposition batch de valorisation titres | P2 | 3.6 | Batch stable, exposition resultats via API REST | Coexist / Hybrid |
| 5 | Notification sinistres via MQ | P3 | 3.7 | Infrastructure MQ en place, evenements deja produits | Coexist / Hybrid |

**Jalons cles :**

| Jalon | Semaine | Critere Go/No-Go |
|---|---|---|
| J1 -- Architecture de reference validee | S2 | Document approuve, z/OS Connect provisionne |
| J2 -- POC scenario #1 (RCLI) | S6 | API fonctionnelle, < 200ms, 100 tx/min sans erreur |
| J3 -- Scenarios #1 a #3 en production | S16 | Taux erreur < 0.1%, SLA respectes, rollback teste |
| J4 -- Scenarios #4 et #5 en production | S22 | Integrations operationnelles, monitoring en place |
| J5 -- Bilan Wave 1, Go/No-Go Wave 2 | S24 | ROI mesure vs. previsionnel, RETEX formalise |

**Criteres Go/No-Go pour Wave 2 :**
- **Go** : >= 4 scenarios en production stable (< 0.1% erreur, 30 jours), ROI >= 70% du previsionnel
- **Conditional Go** : 3 scenarios en production, ROI 50-70%, plan de remediation
- **No-Go** : < 3 scenarios, incidents majeurs non resolus, ROI < 50%

---

### Wave 2 : Strategic (6-18 mois)

**Scenarios cibles :**

| # | Scenario | Pattern source | Approche | Valeur ajoutee |
|---|---|---|---|---|
| 6 | Saisie declaration sinistre (DSIN) | P5 -> P1 | Refactor / Strangler Fig | Digitalisation parcours sinistre, reduction 60% temps saisie |
| 7 | Souscription contrat en ligne | P5 -> Rewrite | Rewrite / Cloud-Native | Nouveau parcours digital, signature electronique |
| 8 | Gestion prelevements/encaissements | P4 -> P3 | Refactor | Passage batch vers evenements temps reel |
| 9 | Reporting reglementaire (Solvency II, IFRS 17) | P2 | Refactor | Modernisation chaines batch, parallelisation |
| 10 | Portail partenaires (courtiers) | P1+P5 -> P1 | Refactor | API unifiee, remplacement acces 3270 dedies |

**Dependances avec Wave 1 :**
- Scenario #6 depend du #1 (referentiel client)
- Scenario #7 depend des #1 et #2 (referentiel client + historique contrat)
- Scenario #10 depend de l'API Gateway et du framework d'authentification Wave 1

**Ressources necessaires :**

| Profil | ETP |
|---|---|
| Architecte d'integration mainframe/cloud | 1 |
| Developpeur z/OS Connect / CICS | 2 |
| Developpeur back-end cloud (Java/Node.js) | 3 |
| Developpeur front-end | 2 |
| Ingenieur DevOps / SRE | 1 |
| Testeur / QA | 2 |
| Product Owner | 1 |
| **Total** | **12 ETP** |

---

### Wave 3 : Long-term (18-36 mois)

**Migrations complexes et critiques :**

| # | Scenario | Complexite | Approche | Enjeu |
|---|---|---|---|---|
| 11 | Migration du moteur de tarification | Tres elevee | Rewrite | Moteur cloud-native, regles externalisees, temps reel |
| 12 | Migration systeme de provisions | Elevee | Refactor | Double run ancien/nouveau pendant 6 mois minimum |
| 13 | Migration comptabilite auxiliaire | Elevee | Strangler Fig | Deport progressif ecritures comptables vers GL cloud |
| 14 | Decommissionnement ecrans 3270 residuels | Moyenne | Rewrite (UI) | Remplacement par interfaces web |
| 15 | Decommissionnement complet de HIS | Variable | Coexist -> Off | Extinction progressive HIS |

**Plan de decommissionnement HIS :**

| Phase | Mois | Action | Verification |
|---|---|---|---|
| Phase A | M18-M22 | Redirection 80% du trafic HIS vers APIs | Monitoring trafic HIS residuel |
| Phase B | M22-M28 | Migration des 20% restants | Tests non-regression par partenaire |
| Phase C | M28-M32 | Mode observation (HIS en standby) | 30 jours sans trafic |
| Phase D | M32-M36 | Decommissionnement definitif | Arret instances, liberation licences |

**Vision cible finale :**
- 100% des interactions mainframe via API REST/JSON
- Zero session TN3270 en production (hors administration)
- Zero integration par screen scraping
- HIS decommissionne, licences liberees
- Architecture hybride stabilisee : mainframe pour transactions critiques, cloud pour canaux digitaux
- Monitoring unifie mainframe + cloud

---

## 6. Dependances inter-scenarios

### Prerequisites techniques

| Prerequis | Wave | Bloquant pour |
|---|---|---|
| z/OS Connect 3.0 provisionne | Wave 1 (S1-S2) | Tous les scenarios API |
| API Gateway operationnel | Wave 1 (S1-S4) | Tous les scenarios exposes |
| Connectivite securisee mainframe <-> cloud | Wave 1 (S1-S4) | Scenarios hybrides |
| IAM unifie (RACF <-> OAuth2/OIDC) | Wave 1 (S4-S8) | Authentification externe |
| MQ / Kafka bridge operationnel | Wave 1 (S8-S12) | Scenarios evenementiels (P3) |
| CI/CD mainframe (IBM Wazi, DBB) | Wave 1 (S4-S10) | Modifications COBOL |
| Environnements de test mainframe isoles | Wave 1 (S1-S4) | Tests non-regression |

### Prerequisites organisationnels

| Prerequis | Responsable | Bloquant pour |
|---|---|---|
| Competences z/OS Connect | Direction technique | Wave 1 |
| Gouvernance API (standards, versionning) | Architecte d'entreprise | Wave 1+ |
| Change management operateurs | Direction metier | Wave 2 |
| Contrat support editeur (IBM, HostBridge) | Direction achats | Wave 1 |
| Validation reglementaire | Compliance / RSSI | Wave 2 |
| Comite de pilotage migration (mensuel) | Direction generale | Toutes waves |

### Diagramme de dependances

```
WAVE 1                          WAVE 2                          WAVE 3
------                          ------                          ------

[Infra z/OS Connect] ---------------------------------------------------------------►
       |
       +--► [#1 Ref. Client] ---► [#6 Saisie Sinistre] ---► [#14 Decomm. 3270]
       |         |                      |
       |         +---► [#7 Souscription] +
       |
       +--► [#2 Hist. Contrat] ---► [#7 Souscription] ---► [#11 Tarification]
       |
       +--► [#3 Positions] ---► [#12 Provisions]
       |
       +--► [#4 Batch Valo] ---► [#9 Reporting Regl.]
       |
       +--► [#5 Notif. MQ] ---► [#8 Prelevements] ---► [#13 Comptabilite]
       |
       +--► [API Gateway + IAM] ---► [#10 Portail Partenaires] ---► [#15 Decomm. HIS]
```

---

## 7. Annexes

### A. Estimation effort consolidee

| Pattern | Analyse | Dev | Tests | Deploiement | **Total** |
|---|---|---|---|---|---|
| P1 CICS TI | 8 | 21 | 13 | 5 | **47** |
| P2 Batch | 5 | 13 | 8 | 3 | **29** |
| P3 MQ | 8 | 21 | 13 | 5 | **47** |
| P4 DB2 | 13 | 34 | 21 | 8 | **76** |
| P5 3270 | 13 | 32 | 8 | 8 | **61** |
| **Total programme** | **47** | **121** | **63** | **29** | **260** |

### B. Criteres de succes du programme

- 3-5 scenarios pilotes identifies pour Wave 1 (complexite faible, ROI rapide)
- Couverture >80% des flux HIS dans le catalogue
- Validation par sponsors metier et equipes techniques
- Couts estimes avec marge d'erreur <30%

### C. Approche de validation

- Atelier de 2 jours avec equipes mainframe, middleware et applications
- POC sur 1 scenario representatif (8 semaines)
- Metrics de reference (baseline) : performance, disponibilite, couts
- Go/No-Go decision basee sur resultats POC et score composite

---

**Ton** : Analytique et factuel, oriente decision executive. Donnees quantifiables et criteres objectifs. Chaque recommandation est tracable a des criteres explicites et mesurables.

---

*Document genere le 2026-02-16 par l'equipe his-migration.*
