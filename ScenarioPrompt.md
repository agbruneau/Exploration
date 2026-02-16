## Prompt pour l'identification des scénarios candidats viables

**Contexte** : Vous êtes architecte d'entreprise chargé d'identifier et de qualifier les scénarios de migration de Microsoft Host Integration Server vers une plateforme moderne. L'objectif est de produire un catalogue priorisé de cas d'usage candidats avec leur profil de risque et viabilité technique.

**Objectif** : Générer une matrice de scénarios candidats (10-15 pages) classifiant les flux et applications HIS selon leur potentiel de migration, avec critères d'éligibilité et recommandations par scénario.

## Structure méthodologique

## 1. Cadre d'évaluation des scénarios

**Dimensions d'analyse** :

* **Complexité technique** : Protocoles utilisés (LU6.2, APPC, DRDA), transformations de données (EBCDIC/ASCII), dépendances COBOL/RPG[[ijcesen](https://ijcesen.com/index.php/ijcesen/article/view/4782)]
* **Criticité métier** : Impact sur les opérations, SLA exigés (TAT, disponibilité), volume transactionnel[[arxiv](http://arxiv.org/pdf/2408.04230.pdf)]
* **Dette technique** : Âge du code, documentation disponible, compétences mainframe dans l'équipe[[ijcesen](https://ijcesen.com/index.php/ijcesen/article/view/4782)]
* **Valeur de modernisation** : ROI potentiel, alignement stratégique, opportunités d'amélioration[[lorojournals](https://lorojournals.com/index.php/emsj/article/view/1552)]

## 2. Taxonomie des patterns d'intégration HIS

Identifier et classifier chaque flux selon ces catégories:**techcommunity.microsoft**+1

## Pattern 1 : Synchronous Request-Response (CICS TI)

**Caractéristiques** :

* Transaction Integrator appelant des programmes CICS COBOL via LU6.2
* Timeout strict (<3s), couplage fort avec la logique métier mainframe
* Données structurées via COMMAREA/Channels[[ijfmr](https://www.ijfmr.com/research-paper.php?id=45864)]

**Critères d'éligibilité** :

* Volume < 10K transactions/jour : **Candidat prioritaire**
* Logique métier documentée et stable
* Possibilité d'exposer via REST API[[arxiv](http://arxiv.org/pdf/2408.04230.pdf)]

**Stratégie recommandée** : API Gateway + adaptateur mainframe (MuleSoft/Camel) ou modernisation via Java JCICS[[ijfmr](https://www.ijfmr.com/research-paper.php?id=45864)]

## Pattern 2 : Batch File Transfer (FTP/SFTP via HIS)

**Caractéristiques** :

* Transferts de fichiers VSAM/séquentiels, transformations EBCDIC[[techcommunity.microsoft](https://techcommunity.microsoft.com/blog/integrationsonazureblog/patterns-for-a-gradual-modernization-of-ibm-mainframes-and-midranges-using-azure/3919207)]
* Planification via schedulers Windows intégrés à HIS
* Faible latence requise (batch nocturne)

**Critères d'éligibilité** :

* Fichiers < 5GB : **Candidat immédiat**
* Formats standardisés (CSV, XML après transformation)
* Pas de dépendances GDG complexes

**Stratégie recommandée** : Metadata-driven ETL pipelines (Azure Data Factory, Apache NiFi) + connecteurs mainframe natifs[[ijsrcseit](https://ijsrcseit.com/index.php/home/article/view/CSEIT241061224)]

## Pattern 3 : Event-Driven Integration (MQ/HIS Bridge)

**Caractéristiques** :

* Messages asynchrones via IBM MQ transitant par HIS Gateway
* Patterns publish-subscribe, garantie de livraison MQPUT/MQGET
* Transformation de messages entre formats legacy et modernes[[aws.amazon](https://aws.amazon.com/blogs/migration-and-modernization/integration-architectures-between-mainframe-and-aws-for-coexistence/)]

**Critères d'éligibilité** :

* Architecture découplée existante : **Candidat stratégique**
* Latence tolérable (>500ms)
* Volume prévisible et bursty

**Stratégie recommandée** : Migration vers Apache Kafka + connecteurs MQ Source/Sink, pattern Strangler Fig pour transition progressive**ijsrcseit**+1

## Pattern 4 : Database Access (DB2 via DRDA)

**Caractéristiques** :

* Requêtes JDBC/ODBC vers DB2 z/OS via HIS OLE DB Provider
* Stored procedures COBOL/SQL PL, transactions distribuées[[aws.amazon](https://aws.amazon.com/blogs/migration-and-modernization/integration-architectures-between-mainframe-and-aws-for-coexistence/)]
* Lectures/écritures temps réel pour applications .NET/Java

**Critères d'éligibilité** :

* Procédures stockées sans logique métier critique : **Candidat conditionnel**
* Possibilité de refactoring vers microservices
* Performance acceptable avec latence réseau ajoutée

**Stratégie recommandée** : Direct JDBC à court terme, migration logique vers services REST/GraphQL à moyen terme[[lorojournals](https://lorojournals.com/index.php/emsj/article/view/1552)]

## Pattern 5 : Terminal Emulation/Screen Scraping (3270/5250)

**Caractéristiques** :

* Accès aux écrans CICS via émulation TN3270, navigation programmatique
* Extraction de données depuis interfaces utilisateur mainframe
* Haut couplage avec présentations BMS[[techcommunity.microsoft](https://techcommunity.microsoft.com/blog/integrationsonazureblog/patterns-for-a-gradual-modernization-of-ibm-mainframes-and-midranges-using-azure/3919207)]

**Critères d'éligibilité** :

* Usage limité (<5 écrans) : **Candidat différé**
* APIs mainframe inexistantes ou économiquement non viables
* Tolérance aux changements de layout

**Stratégie recommandée** : API-first modernization (exposer CICS via z/OS Connect), éviter screen scraping sauf contrainte absolue[[arxiv](http://arxiv.org/pdf/2408.04230.pdf)]

## 3. Grille de scoring et priorisation

Pour chaque scénario identifié, appliquer ce système de scoring :**orderstack**+1

| Critère                              | Poids | Score (1-5)                 |
| ------------------------------------- | ----- | --------------------------- |
| Simplicité technique                 | 25%   | 1=Très complexe, 5=Simple  |
| Impact métier faible en cas d'échec | 20%   | 1=Critique, 5=Négligeable  |
| ROI élevé                           | 20%   | 1=Faible ROI, 5=ROI>200%    |
| Documentation/Connaissance            | 15%   | 1=Absente, 5=Exhaustive     |
| Sponsor exécutif                     | 10%   | 1=Opposition, 5=Champion    |
| Conformité réglementaire            | 10%   | 1=Bloquant, 5=Non concerné |

**Score composite** = Σ(Poids × Score) → Prioriser scénarios >3.5/5

## 4. Matrice de décision par approche**ijcesen**+1

| Approche                         | Quand l'utiliser                  | Scénarios HIS cibles                   | Effort  | Risque  |
| -------------------------------- | --------------------------------- | --------------------------------------- | ------- | ------- |
| **Rehost/Lift-and-Shift**  | Migration urgente, budget limité | Tous patterns, aucune logique modifiée | Faible  | Moyen   |
| **Refactor/Strangler Fig** | Modernisation progressive         | Patterns 1,3,4 - APIs et événements   | Moyen   | Faible  |
| **Rewrite/Cloud-Native**   | Refonte stratégique              | Patterns 2,5 - Batch et UI obsolètes   | Élevé | Élevé |
| **Coexist/Hybrid**         | Phase de transition longue        | Tous patterns en parallèle HIS         | Faible  | Faible  |

## 5. Critères de qualification par scénario

Pour chaque flux HIS identifié, documenter :

**Fiche d'identité technique** :

* Composants HIS utilisés (TI, Data Integration, Network Integration)
* Protocoles et formats (SNA, TCP/IP, EBCDIC, COMMAREA)
* Volumétrie et patterns temporels (pic, batch, temps réel)
* Dépendances applicatives (upstream/downstream)[[figshare](https://figshare.com/articles/journal_contribution/Maintaining_Transactional_Context_A_Model_Problem/6575177/1/files/12061742.pdf)]

**Analyse de viabilité** :

* **Go** : Score >3.5, sponsor identifié, documentation >60%, POC faisable en <4 semaines
* **Conditional Go** : Score 2.5-3.5, nécessite reverse engineering ou refactoring limité[[ijcesen](https://ijcesen.com/index.php/ijcesen/article/view/4782)]
* **No-Go/Defer** : Score <2.5, criticité maximale, compétences absentes, report post-phase 2

**Estimation effort** :

* Complexité points (Fibonacci) : analyse (3-8), développement (13-21), tests (8-13), déploiement (3-5)
* Timeline : Pilote 8-12 semaines, Production 16-24 semaines par scénario

## 6. Livrables attendus

**Catalogue de scénarios** (Excel/Confluence) avec :

* Fiche par scénario : description, architecture actuelle/cible, diagramme de séquence
* Matrice de scoring et classement par priorité (Quick Wins, Strategic, Long-term)
* Dépendances inter-scénarios (prérequis techniques/organisationnels)
* Roadmap de migration par vague (Wave 1-3 sur 18-36 mois)[[techcommunity.microsoft](https://techcommunity.microsoft.com/blog/integrationsonazureblog/patterns-for-a-gradual-modernization-of-ibm-mainframes-and-midranges-using-azure/3919207)]

**Critères de succès** :

* 3-5 scénarios pilotes identifiés pour Wave 1 (complexité faible, ROI rapide)
* Couverture >80% des flux HIS dans le catalogue
* Validation par sponsors métier et équipes techniques
* Coûts estimés avec marge d'erreur <30%

**Approche de validation** :

* Atelier de 2 jours avec équipes mainframe, middleware et applications
* POC sur 1 scénario représentatif (8 semaines)
* Metrics de référence (baseline) : performance, disponibilité, coûts[[orderstack](https://orderstack.xyz/legacy-system-assessment-key-steps/)]
* Go/No-Go décision basée sur résultats POC et score composite

---

**Ton** : Analytique et factuel, orienté décision exécutive. Privilégier données quantifiables et critères objectifs. Éviter optimisme/pessimisme non justifié. Chaque recommandation doit être traçable à des critères explicites et mesurables.
