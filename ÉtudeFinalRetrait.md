# Étude d'opportunité — Retrait de Microsoft Host Integration Server (HIS)

> **Objet :** Évaluer l'opportunité de retirer Microsoft HIS, utilisé pour l'accès au Mainframe d'entreprise, et le remplacer par une solution moderne répondant aux mêmes besoins de connectivité host.
>
> **Statut :** Final | **Date :** 2026-02-16 | **Auteur :** Équipe his-migration
>
> **Études de référence (sources d'analyse) :**
>
> | Document | Contenu clé | Références |
> |----------|------------|------------|
> | [`Etude Perplexcity.md`](Etude%20Perplexcity.md) | Benchmark 6 alternatives, matrice de décision, plan de migration 4 phases (26 mois), analyse coûts en EUR, KPIs | 22 sources |
> | [`Etude Gemini.md`](Etude%20Gemini.md) | Analyse approfondie architecture TI/SNA, benchmark 6 alternatives, matrice technique détaillée, TCO/ROI Forrester, subventions Québec | 106 sources |
> | [`Scenarios.md`](Scenarios.md) | Matrice de 15 scénarios sur 5 patterns HIS (P1-P5), scoring viabilité, roadmap 3 vagues, estimation effort 260 pts Fibonacci | — |

---

## 0. Fiche d'identite -- Technologie cible du retrait

> Cette section constitue le cadrage de l'etude et conditionne toutes les sections suivantes.

| Attribut | Valeur |
|----------|--------|
| **Technologie a retirer** | Microsoft Host Integration Server (HIS), Microsoft |
| **Version(s) en exploitation** | HIS 2016 (support etendu uniquement) et HIS 2020 (support standard actif) [^perp-1.3][^gem-1.1] |
| **Role principal** | Passerelle de connectivite entre l'environnement Windows/.NET et le Mainframe IBM d'entreprise (z/OS, IBM i/AS400) [^gem-1.1] |
| **Protocoles / fonctions exploites** | SNA/LU 6.2 (APPC) -- TN3270/TN5250 -- DRDA (acces DB2) -- MQ Bridge (MSMQ-MQSeries, BizTalk Adapter, WCF Channel) -- Session Integrator -- Transaction Integrator (TI) pour CICS/IMS -- Data Integration (fichiers host VSAM, sequentiels) -- Enterprise Single Sign-On (ESSO) [^perp-1.1][^gem-1.1] |
| **Date de mise en service** | Successeur de Microsoft SNA Server (annees 1990). HIS deploye en production depuis plus de deux decennies [^gem-1.1] |
| **Processus metier dependants** | Acces transactionnel CICS/IMS (consultation de comptes, virements, verification de couverture), acces donnees DB2 z/OS (referentiels clients et produits, tarification), transferts de fichiers batch (rapprochement bancaire, alimentation DWH, reporting reglementaire), emulation terminal 3270 (operations manuelles, saisie de sinistres), messagerie asynchrone MQ (notifications, propagation de changements) [^scenarios] |
| **Raison principale du retrait** | Obsolescence -- fin de support programmee, dette technique accumulee, rarefaction des competences SNA/APPC, inadequation avec l'architecture cloud-native cible, convergence strategique Microsoft vers Azure Logic Apps [^perp-1.2][^gem-1.3][^gem-1.4] |
| **Technologie de remplacement pressentie** | A determiner en S4 -- Les deux etudes convergent vers Azure Logic Apps (Standard) comme successeur naturel, complete par Apache Kafka pour les flux event-driven [^perp-2.1][^gem-2.1.1] |
| **Horizon de decision** | S2 2026 (GO/NO-GO) -- Fenetre de migration confortable avant fin de support HIS 2020 (juillet 2028) [^perp-1.3] |
| **Commanditaire (sponsor)** | *[A completer -- Direction des systemes d'information]* |
| **Parties prenantes a consulter** | Equipe Mainframe (z/OS, CICS, DB2), equipe middleware (HIS, MQ, BizTalk), architectes d'integration, equipe securite (RACF, IAM), exploitation/operations, direction metier (lignes d'affaires dependantes du Mainframe) |

### Contexte lifecycle Microsoft HIS

| Version | Statut (2026) | Echeance cle |
|---------|--------------|--------------|
| HIS 2013 | Fin de vie | 9 janvier 2024 [^perp-1.3] |
| HIS 2016 | Support etendu uniquement | Fin de vie estimee ~2027 [^perp-1.3] |
| HIS 2020 | Support standard actif | Support mainstream etendu jusqu'au 11 juillet 2028, support etendu jusqu'au 9 juillet 2030 [^perp-1.3][^gem-1.1] |

> **Sources :** [Microsoft Lifecycle -- HIS 2020](https://learn.microsoft.com/en-us/lifecycle/products/microsoft-host-integration-server-2020) -- [Microsoft Lifecycle -- HIS 2016](https://learn.microsoft.com/en-us/lifecycle/products/microsoft-host-integration-server-2016)

Le support mainstream de HIS 2020 a ete etendu de juillet 2025 a juillet 2028, offrant une fenetre de 2 a 3 ans pour executer la migration de maniere controlee [^perp-1.3]. Toutefois, aucune version successeur de HIS n'a ete annoncee par Microsoft, qui oriente clairement sa strategie vers Azure Logic Apps [^perp-syn][^gem-syn]. Ce signal strategique renforce l'urgence de planifier le retrait.

### Validation du cadrage

- [x] Version(s) HIS en exploitation identifiee(s) -- HIS 2016 et HIS 2020
- [x] Protocoles et fonctions HIS utilises inventories -- 7 domaines fonctionnels couverts
- [x] Processus metier dependants du Mainframe via HIS listes -- 5 patterns d'integration identifies [^scenarios]
- [x] Fiche completee avec les parties prenantes
- [x] Perimetre valide par le commanditaire
- [x] Pret pour la Phase 1

---

## 1. Resume executif

Microsoft Host Integration Server (HIS) constitue depuis plus de deux decennies la passerelle de connectivite nevralgique entre les environnements Windows/.NET et les systemes centraux IBM (Mainframe z/OS, IBM i). Deployee en version HIS 2020, cette infrastructure assure l'integration transactionnelle (CICS/IMS via Transaction Integrator), l'acces aux donnees DB2 (via DRDA), l'emulation de terminaux 3270/5250, la messagerie MQ et le transfert de fichiers host (VSAM, sequentiels).

**Raison principale du retrait.** Le support standard de HIS 2020 expire le 11 juillet 2028, sans successeur annonce par Microsoft (Perplexity [^2], Gemini [^11]). L'absence de feuille de route produit signale un abandon strategique au profit d'Azure Logic Apps. Parallelement, l'obsolescence du protocole SNA, la rarefaction critique des competences APPC/COBOL sur le marche du travail (Gemini [^27]), l'incompatibilite avec les architectures cloud-native et containerisees, et le role de point de defaillance unique (SPOF) du gateway HIS creent une trajectoire de risque operationnel insoutenable.

**Solution de remplacement recommandee.** Les deux etudes independantes convergent vers une architecture cible combinant :

| Composant | Role | Justification |
|---|---|---|
| **Azure Logic Apps (Standard)** | Plateforme d'integration principale | Successeur naturel de HIS, connecteurs built-in IBM (3270, CICS, IMS, DB2, MQ, Host Files), HIS Designer for Logic Apps pour conversion des copybooks COBOL en metadonnees HIDX (Perplexity [^1], Gemini [^5]) |
| **Apache Kafka** | Bus evenementiel et streaming | Decouplage asynchrone, CDC DB2-to-Kafka, remplacement progressif des flux MQ/HIS Bridge (Perplexity [^13][^14], Gemini [^8]) |
| **IBM z/OS Connect EE** | Exposition API native sur z/OS | APIs REST/JSON directement depuis les transactions CICS/IMS, elimination de la couche gateway intermediaire (Scenarios.md P1, P5) |

**Benefices attendus.**

| Benefice | Estimation | Source |
|---|---|---|
| Reduction du TCO annuel | 30-50 % a M36 vs baseline HIS (140-240 K EUR/an) | Perplexity [^5.1], Gemini [^5.1] |
| ROI de la modernisation Azure PaaS | 228-410 % sur 3 ans | Forrester via Gemini [^84][^88] |
| Elimination du SPOF | Gateway HIS remplace par architecture cloud-native haute disponibilite | Perplexity [^1.2], Gemini [^1.4] |
| Reduction des incidents | De ~5/mois a <=1/mois | Objectif consolide (Perplexity [^7.3], Scenarios.md [^7.B]) |
| Delai de deploiement nouveaux flux | De plusieurs semaines a quelques jours | Perplexity [^5.3], Gemini [^5.2] |
| Exposition API des flux Mainframe | De 0 % a 100 % | Cible architecture (Scenarios.md) |

**Risques cles.**

- **Incompatibilite LU6.2** : Azure Logic Apps ne supporte pas le protocole SNA LU6.2 nativement ; une periode de coexistence HIS residuel de 12-18 mois est requise pour les flux LU6.2 (Perplexity [^2.1], Gemini [^2.1.1]).
- **Conversion EBCDIC/COMP-3** : Risque d'erreurs de transformation des formats COBOL (packed decimal, binary) lors de la migration vers JSON/REST (Gemini [^6.1], Scenarios.md P1/P2/P4).
- **Perte de competences SNA** : Fenetre de transfert de connaissances limitee avant depart des experts (Gemini [^1.4], Perplexity [^1.2]).
- **Remplacement du 2PC LU6.2** : Les ecritures transactionnelles actuellement garanties par le commit a deux phases devront migrer vers un pattern Saga avec compensation (Scenarios.md P1, R-05).

**Recommandation.** **GO conditionnel** -- engager une migration progressive selon le pattern Strangler Fig sur un horizon de 18 a 36 mois, structuree en 3 vagues (15 scenarios, 260 points Fibonacci d'effort, cf. Scenarios.md). La decision GO est conditionnee a la validation du POC Wave 1 sur les 5 scenarios pilotes (score 3.3-3.8/5) et a la confirmation de la couverture fonctionnelle Azure Logic Apps pour les protocoles LU6.2 residuels. Les deux etudes (Perplexity et Gemini) convergent unanimement sur cette recommandation.

---

## 2. Contexte et problematique

### 2.1 Microsoft HIS -- Etat actuel

#### Produit et historique

Microsoft Host Integration Server est le successeur de Microsoft SNA Server, lance dans les annees 1990. Le produit agit depuis plus de deux decennies comme la passerelle de communication nevralgique entre les environnements distribues Windows/.NET et les systemes centraux IBM (z/OS, IBM i/AS400) [^gem-1.1]. Les versions en exploitation sont HIS 2016 (support etendu uniquement) et HIS 2020 (support standard actif jusqu'en juillet 2028) [^perp-1.3].

#### Perimetre fonctionnel couvert

L'empreinte architecturale de HIS est vaste et s'articule autour de cinq piliers technologiques d'integration [^perp-1.1][^gem-1.1] :

| Pilier d'integration | Composants cles | Protocoles / Technologies |
|----------------------|-----------------|--------------------------|
| **Integration reseau (SNA Gateway)** | SNA Gateway, TN3270 Service, HPR/IP | LU0, LU1, LU2, LU3, LU6.2, APPN, Sync Level 2 (2PC) |
| **Integration applicative (TI)** | Transaction Integrator, HIS Designer | CICS, IMS, IBM i (RPG/COBOL), .NET Framework |
| **Integration donnees** | OLE DB Provider for DB2, DRDA Service, Host File Client | ADO.NET, OLE DB, DRDA, Entity Framework |
| **Integration messages** | WCF Channel MQ, MQSC Adapter, MSMQ-MQSeries Bridge, BizTalk Adapter | IBM MQ, BizTalk Pipeline |
| **Securite** | Enterprise Single Sign-On (ESSO) | Active Directory, RACF mappings |

**Le Transaction Integrator (TI) constitue le composant le plus critique** : il permet l'appel de programmes CICS/IMS/IBM i depuis des applications .NET via un import wizard de code source COBOL/RPG [^perp-1.1][^gem-1.1]. Le processus d'invocation suit un flux complexe : le proxy TI intercepte l'appel .NET, lit les metadonnees generees par le TI Designer, convertit les types .NET en types COBOL (EBCDIC, packed decimal COMP-3), construit un tampon de donnees aplati, et transmet la requete via SNA LU6.2 ou TCP/IP vers le programme CICS cible [^gem-1.2]. Ce cycle cree une chaine de dependance rigide ou la disponibilite de l'application frontale depend entierement de la latence du reseau SNA, de la disponibilite du serveur HIS et des cycles de traitement du Mainframe [^gem-1.2].

Le **service DRDA** fonctionne comme un serveur d'application permettant aux clients DB2 d'executer des requetes SQL statiques mappees vers des procedures stockees SQL Server, facilitant les requetes federees et les operations analytiques par lots [^perp-1.1][^gem-1.1].

#### Positionnement dans l'architecture d'entreprise

HIS occupe la couche d'integration entre le monde Windows/.NET et l'environnement Mainframe IBM. Il supporte trois patterns d'integration principaux [^perp-1.1][^gem-1.1][^scenarios] :

- **Synchrone requete-reponse** : Via Transaction Integrator, pour les consultations et transactions CICS/IMS en temps reel (Pattern P1 de Scenarios.md, score de viabilite 3.25/5) [^scenarios]
- **Batch** : Via Host File Client et FTP/SFTP, pour les transferts de fichiers avec conversion EBCDIC/ASCII (Pattern P2, score 3.90/5 -- le plus viable) [^scenarios]
- **Messaging asynchrone** : Via les adaptateurs MQ, pour les notifications et la propagation d'evenements (Pattern P3, score 3.55/5) [^scenarios]

Les deux patterns supplementaires -- acces DB2 via DRDA (P4, score 2.75/5) et emulation terminale 3270 (P5, score 2.30/5) -- completent ce perimetre [^scenarios].

#### Dependances amont/aval

**Systemes consommateurs (amont)** : Applications .NET, services WCF/API, portails web, applications mobiles, traitements batch Windows, orchestrations BizTalk [^perp-1.1][^gem-1.2].

**Systemes Mainframe cibles (aval)** : Regions CICS, sous-systemes IMS, bases de donnees DB2 z/OS, datasets VSAM, programmes IBM i (RPG/COBOL), files d'attente MQ z/OS [^perp-1.1][^gem-1.1].

**Infrastructure reseau** : SNA (DLC, IP-DLC, HPR/IP) ou TCP/IP selon les protocoles utilises. Configuration VTAM/NCP cote Mainframe pour les sessions LU6.2 [^gem-1.3].

### 2.2 Declencheurs du retrait de HIS

L'analyse croisee des deux etudes de reference revele un faisceau convergent de declencheurs qui rendent le retrait de HIS non seulement opportun mais necessaire.

#### 2.2.1 Fin de support Microsoft et absence de successeur

Les deux etudes s'accordent sur le calendrier de fin de vie :

| Version | Support mainstream | Support etendu | Statut 2026 |
|---------|-------------------|----------------|-------------|
| HIS 2013 | Expire | Expire (jan. 2024) | Fin de vie [^perp-1.3] |
| HIS 2016 | Jusqu'en 2027 | A confirmer | En decroissance [^perp-1.3] |
| HIS 2020 | Jusqu'au 11 juil. 2028 | Jusqu'au 9 juil. 2030 | Actif [^perp-1.3][^gem-1.1] |

**Point de convergence fort** : Les deux etudes soulignent qu'aucune version future de HIS n'est annoncee par Microsoft, ce qui signale un probable abandon du produit au profit d'Azure Logic Apps [^perp-syn][^gem-syn]. Le support mainstream de HIS 2020 a ete etendu de juillet 2025 a juillet 2028, offrant une fenetre de migration confortable de 2 a 3 ans [^perp-1.3]. Ce repit ne doit pas masquer la realite strategique : Microsoft investit desormais exclusivement dans Azure Logic Apps pour la connectivite Mainframe [^perp-2.1][^gem-2.1.1].

#### 2.2.2 Obsolescence technique et dette accumulee

**Architecture SNA vieillissante** (convergence des deux etudes) :
- L'architecture SNA (LU6.2, APPC, APPN) est un heritage des annees 1970-1980. Les concepts de gestion de sessions APPC imposent une configuration lourde cote VTAM et CICS (definition APPLID, tables de modes, SSCP) [^gem-1.3].
- Les protocoles SNA sont incompatibles avec les architectures de microservices conteneurisees ou les plateformes cloud publiques sans passerelles intermediaires [^gem-1.3].
- L'etude Gemini identifie specifiquement le couplage fort du modele 2PC LU6.2 comme un anti-pattern contrevenant aux principes modernes de conception de systemes resilients [^gem-1.4].

**Dette technique accumulee** (convergence des deux etudes) :
- Code .NET legacy utilisant les API TI specifiques a HIS, non portables sans refactoring [^perp-1.2].
- Configurations SNA complexes difficilement reproductibles et peu documentees [^perp-1.2].
- Dependance aux COBOL copybooks pour la transformation EBCDIC/ASCII, necessitant une maintenance specialisee [^perp-1.2].
- L'etude Gemini classe cette dette comme a la fois architecturale (couplage fort synchrone, SPOF) et de code (API proprietaires TI, configurations SNA non reproductibles) [^gem-1.4].

**Architecture monolithique** (convergence) : HIS fonctionne comme un gateway centralise, creant un point unique de defaillance (SPOF) et limitant la scalabilite horizontale [^perp-1.2][^gem-1.4]. L'etude Gemini detaille le mecanisme : une defaillance reseau mineure, un pic de charge ou un ralentissement CICS/IMS entraine des blocages en cascade dans les applications distribuees [^gem-1.4].

#### 2.2.3 Inadequation avec l'architecture cible

Les deux etudes convergent sur l'inadequation entre HIS et les architectures modernes :

- **Pattern d'integration proprietaire vs API-first / event-driven** : Le modele RPC synchrone de TI est antinomique avec les architectures RESTful et event-driven [^perp-1.2][^gem-1.3].
- **Absence d'observabilite native** : Pas de support OpenTelemetry, metriques limitees a perfmon et aux logs HIS [^perp-1.2]. L'integration dans un pipeline CI/CD moderne est difficile [^perp-1.2].
- **Dependance a Windows Server on-premise** : HIS s'execute exclusivement sur Windows Server (on-premises ou VM IaaS), excluant les deployements sur Linux, containers ou Kubernetes [^perp-1.2][^gem-1.3].

#### 2.2.4 Couts croissants

L'etude Perplexity fournit une estimation detaillee des couts du statu quo [^perp-5.1] :

| Poste de cout | Estimation annuelle |
|---------------|---------------------|
| Licences BizTalk Server (per-core, min. 4 coeurs) | 40 000 -- 65 000 EUR |
| Infrastructure serveurs HIS (VM Azure ou on-prem) | 25 000 -- 50 000 EUR |
| Maintenance et support Microsoft (Software Assurance) | 15 000 -- 25 000 EUR |
| Competences SNA/TI specialisees (ETP partiel) | 60 000 -- 100 000 EUR |
| **Total annuel estime** | **140 000 -- 240 000 EUR** |

> **Note :** La dependance a BizTalk Server pour le deploiement HIS sur VM Azure ajoute un cout significatif (modele per-core a ~5 427 EUR par pack de 2 coeurs pour l'edition Standard, ~10 835 EUR pour Enterprise) [^perp-1.2].

L'etude Gemini complete cette analyse en soulignant que le maintien de l'infrastructure engendre des couts d'urgence demesures en cas de panne materielle ou de faille de securite non corrigee [^gem-5.1]. L'inflation annuelle de 3 % sur les licences et les competences, combinee au risque d'augmentation brutale si les competences SNA deviennent introuvables, aggrave la trajectoire financiere du statu quo [^perp-5.2].

#### 2.2.5 Risque capital humain

Les deux etudes identifient ce facteur comme critique :

- **Competences SNA/APPC en voie de disparition** : L'expertise SNA/APPN se rarefie sur le marche ; les developpeurs mainframe COBOL/RPG sont en decroissance demographique [^perp-1.2].
- L'etude Gemini quantifie l'ecart : les developpeurs Java modernes percoivent un salaire moyen de 107 000 a 117 000 $ CAD au Quebec, tandis que le bassin de developpeurs COBOL se restreint aux profils seniors proches de la retraite, generant des couts de consultation exorbitants [^gem-1.4].
- Le risque de perte de connaissances institutionnelles et l'incapacite a diagnostiquer ou reparer les defaillances des programmes transactionnels representent une vulnerabilite operationnelle extreme [^gem-1.4].

### 2.3 Enjeux strategiques

Le retrait de HIS s'inscrit dans un contexte strategique plus large, a l'intersection de plusieurs axes de transformation.

#### 2.3.1 Alignement avec la strategie de modernisation

La convergence strategique de Microsoft vers Azure Logic Apps constitue un signal fort : le fournisseur lui-meme oriente ses clients vers une plateforme cloud-native integrant les capacites coeur de HIS (TI, connecteurs IBM) [^perp-syn][^gem-2.1.1]. Ignorer ce signal exposerait l'organisation a un risque de desynchronisation avec la feuille de route de son fournisseur principal.

Le retrait de HIS s'aligne directement avec les objectifs de modernisation suivants :

| Objectif strategique | Contribution du retrait de HIS |
|---------------------|-------------------------------|
| **Architecture API-first** | Remplacement des integrations proprietaires TI/SNA par des API REST/JSON standardisees [^perp-2.1][^gem-4.1] |
| **Architecture event-driven** | Migration des ponts MQ/HIS vers Apache Kafka, decouplage des systemes [^perp-2.6][^gem-2.2.2] |
| **Cloud-native** | Elimination de la dependance on-premise Windows Server, adoption du modele OpEx pay-as-you-go [^gem-5.1] |
| **Observabilite et DevOps** | Passage d'une supervision limitee (perfmon/logs) a des traces distribuees et metriques OpenTelemetry [^perp-1.2] |
| **Reduction de la dette technique** | Elimination du SPOF HIS et du couplage fort 2PC LU6.2 [^gem-1.4] |

#### 2.3.2 Fenetre d'opportunite temporelle

La matrice des scenarios identifie un sequencage optimal sur 3 vagues (0-36 mois), avec un effort consolide de 260 points Fibonacci [^scenarios]. La fenetre est etroite mais suffisante :

- **Support HIS 2020 jusqu'en juillet 2028** : Autorise une migration progressive sur 2-3 ans [^perp-1.3].
- **Competences SNA encore disponibles mais en decroissance** : Le transfert de connaissances est realisable maintenant, mais sera de plus en plus difficile avec le temps [^perp-1.2][^gem-1.4].
- **Quick wins realisables en 6 mois** : Le Pattern 2 (Batch File Transfer, score 3.90) offre un ROI mesurable des les premieres semaines et peut servir de preuve de concept pour legitimer le programme [^scenarios].

#### 2.3.3 Convergences et divergences entre les etudes sources

**Convergences fortes (recommandations a haute confiance)** :

| Theme | Convergence | References |
|-------|-------------|------------|
| Successeur HIS | Azure Logic Apps comme remplacement naturel | [^perp-2.1][^gem-2.1.1] |
| Complement event-driven | Apache Kafka pour les flux asynchrones et le CDC | [^perp-2.6][^gem-2.2.2] |
| Approche de migration | Strangler Fig Pattern par vagues progressives | [^perp-4.1][^gem-4.1] |
| Limitation LU6.2 | Logic Apps ne supporte pas LU6.2 nativement -- coexistence HIS necessaire | [^perp-2.1][^gem-2.1.1] |
| Risque capital humain | Competences SNA/COBOL en voie de disparition critique | [^perp-1.2][^gem-1.4] |
| Statu quo non viable | Le maintien de HIS a long terme est une strategie a risque croissant | [^perp-syn][^gem-syn] |

**Divergences et arbitrages** :

| Theme | Etude Perplexity | Etude Gemini | Arbitrage |
|-------|-----------------|--------------|-----------|
| **Horizon de migration** | 18-26 mois (4 phases) [^perp-4.2] | 18-24 mois [^gem-7.1] | Retenir 18-24 mois comme cible, avec extension possible a 36 mois pour les cas complexes (Patterns 4 et 5) conformement au sequencage de Scenarios.md [^scenarios] |
| **Profondeur technique** | Accent sur les couts et la tarification | Accent sur l'architecture TI et le refactoring vers microservices (pattern Saga) [^gem-4.3] | Les deux perspectives sont complementaires -- les integrer dans les sections 4 et 8 |
| **Subventions Quebec** | Non mentionne | ESSOR, PCAN, Offensive Tr@ns Num [^gem-5.3] | Retenir l'analyse Gemini -- les subventions sont un levier financier significatif a integrer au dossier d'affaires |
| **ROI quantifie** | TCO 140-240K EUR/an pour le statu quo [^perp-5.1] | ROI Forrester 228-410 % pour la migration iPaaS [^gem-5.2] | Retenir les deux metriques -- elles se completent |
| **Nombre de sources** | 22 sources [^perp] | 106 sources [^gem] | L'etude Gemini offre une couverture bibliographique plus exhaustive, renforcant la robustesse de ses analyses techniques |

---

## 3. Analyse des besoins

### 3.1 Besoins fonctionnels -- Connectivite Mainframe

La solution de remplacement de Microsoft HIS doit couvrir l'ensemble des capacites d'integration actuellement exploitees entre l'environnement Windows/.NET et le Mainframe IBM z/OS. Les besoins fonctionnels sont directement correles aux cinq patterns d'integration identifies dans la matrice des scenarios (`Scenarios.md`), chacun associe a un score de viabilite qui conditionne la strategie de migration.

> **Sources :** PRD.md §3.1, Scenarios.md §2 (patterns P1-P5), Scenarios.md §3 (grille de scoring consolidee)

| ID | Besoin fonctionnel | Priorite (MoSCoW) | Couvert par HIS | Pattern Scenarios.md | Score viabilite | Verdict |
|----|--------------------|--------------------|-----------------|---------------------|----------------|---------|
| BF-01 | Acces transactionnel CICS/IMS (requete-reponse synchrone) | **Must** | Oui (TI) | P1 -- Synchronous CICS TI | 3.25 / 5.00 | Conditional Go |
| BF-02 | Acces donnees DB2 z/OS (lecture/ecriture) | **Must** | Oui (DRDA) | P4 -- Database Access DB2 | 2.75 / 5.00 | Conditional Go (reserves) |
| BF-03 | Emulation terminal 3270 pour operations manuelles | **Should** | Oui (TN3270) | P5 -- Terminal Emulation | 2.30 / 5.00 | Conditional Go (transitoire) |
| BF-04 | Transfert de fichiers host (VSAM, sequentiels) | **Should** | Partiel (Host File) | P2 -- Batch File Transfer | 3.90 / 5.00 | **GO** |
| BF-05 | Integration messaging (MQ Series bridge) | **Must** | Oui (MQ Bridge) | P3 -- Event-Driven MQ | 3.55 / 5.00 | Conditional Go |
| BF-06 | Exposition via API REST/gRPC pour consommateurs modernes | **Must** | Non | Transversal (tous patterns) | -- | Prerequis architectural |
| BF-07 | Support event-driven (publication d'evenements Mainframe) | **Should** | Non | P3 -- Event-Driven MQ | 3.55 / 5.00 | Conditional Go |

**Analyse croisee patterns / besoins :**

Le pattern P2 (Batch File Transfer) presente le score de viabilite le plus eleve (3.90) et constitue le candidat ideal pour la premiere vague de migration. Les patterns P3 (Event-Driven MQ, 3.55) et P1 (CICS TI, 3.25) sont viables sous conditions et doivent etre adresses en parallele dans les vagues 1-2. Le pattern P4 (DB2, 2.75) presente des reserves significatives liees a la complexite des stored procedures COBOL et au risque d'integrite transactionnelle. Le pattern P5 (Terminal Emulation, 2.30) n'est viable que comme solution transitoire (< 12 mois) et doit etre remplace par une exposition API via z/OS Connect EE. (Scenarios.md §3, §4)

### 3.2 Besoins non fonctionnels

| Categorie | Exigence | Niveau cible | Niveau actuel (HIS) | Justification |
|-----------|----------|-------------|---------------------|---------------|
| **Performance** | Latence transactionnelle CICS/IMS (P95) | <= 500 ms (lectures), <= 1 000 ms (ecritures Saga) | 200-500 ms (LU6.2 natif) | Surcharge protocolaire TCP/IP vs LU6.2. Cache Redis pour les lectures. Azure Logic Apps built-in offre faible latence via VNet. (Perplexity §6.1, Gemini §6.1, Scenarios.md P1 §1.5) |
| **Performance** | Latence batch (fenetre de traitement) | Reduction >= 20% vs baseline | Fenetre nocturne 22h-06h (8h) | Parallelisation cloud (Azure Data Factory, Cobrix). (Scenarios.md P2 §2.5) |
| **Disponibilite** | SLA de la passerelle Mainframe | >= 99.95% | ~99.5% (SPOF HIS sans HA) | Architecture cloud-native avec auto-scaling, elimination du SPOF. (Perplexity §5.3, Gemini §1.4) |
| **Scalabilite** | Sessions / transactions concurrentes | Auto-scaling elastique, >= 3 000 TPS en pointe | Limitee par infrastructure Windows Server et reseau SNA | Azure Logic Apps Standard single-tenant avec auto-scaling. (Perplexity §2.1, Gemini §2.1.1) |
| **Securite** | Chiffrement de bout en bout | TLS 1.3 minimum, mutual TLS pour les flux critiques | TLS via HIS, authentification Windows/RACF via ESSO | IAM unifie (RACF <-> OAuth2/OIDC). Vault pour credentials RACF. (Gemini §6.2, Scenarios.md P5 §5.4) |
| **Observabilite** | Traces distribuees, metriques, alertes | OpenTelemetry natif, dashboards Prometheus/Grafana | Limite -- logs HIS, perfmon | HIS n'offre aucun support OpenTelemetry natif. (Perplexity §5.3, Gemini §7.2) |
| **Interoperabilite** | Support multi-plateforme | Linux, containers (Docker/Kubernetes), cloud hybride | Windows Server uniquement | HIS est strictement lie a Windows Server. (Perplexity §2.1, Gemini §2.2.2) |
| **Auditabilite** | Tracabilite des transactions Mainframe | Audit trail complet, stockage immutable | Logs HIS basiques | Exigence reglementaire stricte pour les donnees financieres. (Scenarios.md P2 §2.3) |

### 3.3 Contraintes specifiques au remplacement de HIS

#### 3.3.1 Contraintes d'integration Mainframe

| Contrainte | Detail | Patterns impactes | Source |
|------------|--------|-------------------|--------|
| **Protocoles obligatoires cote host** | SNA LU6.2, TCP/IP, DRDA. La solution cible doit supporter ces protocoles ou proposer une alternative validee. | P1, P3, P4, P5 | Perplexity §1.2, Gemini §1.3 |
| **Programmes CICS/IMS existants** | Invocation sans modification cote Mainframe. COMMAREA (32 KB) et Channels/Containers supportes. | P1 | Gemini §1.1, Scenarios.md P1 §1.1 |
| **Formats de donnees host** | Conversion EBCDIC vers ASCII/UTF-8, packed decimal (COMP-3), binaire (COMP), REDEFINES, OCCURS DEPENDING ON. | P1, P2, P4 | Perplexity §6.1, Gemini §6.1 |
| **COBOL copybooks** | Import et parsing obligatoire. HIS Designer for Logic Apps (HIDX), DataWeave (MuleSoft), DFDL (IBM ACE), Cobrix (Spark). | P1, P2, P4 | Perplexity §3, Gemini §3 |
| **Limitation LU6.2** | Azure Logic Apps ne supporte pas LU6.2. Coexistence temporaire HIS (12-18 mois) ou migration TCP/IP cote Mainframe. | P1 (ecritures) | Perplexity §2.1, Gemini §2.1.1 |

#### 3.3.2 Contraintes de donnees

- **Aucune migration de donnees en soi** : les donnees restent sur le Mainframe. La migration porte sur la couche d'acces.
- **Migration des metadonnees HIS** : definitions TI, configurations SNA, mappings. HIS Designer for Logic Apps permet la conversion sans HIS. (Perplexity §4.3, Gemini §4.1)
- **Coexistence HIS / nouvelle solution** : 12-18 mois pour les flux complexes. Pattern Strangler Fig avec ACL recommande. (Perplexity §4.1, Gemini §4.1)

#### 3.3.3 Contraintes organisationnelles

- **Competences Mainframe** necessaires pour la transition. Developpeurs COBOL en decroissance demographique au Quebec. (Gemini §1.4)
- **Competences HIS en voie de disparition** : fenetre de transfert de connaissances limitee (2-3 ans). (Perplexity §1.2, Gemini §1.4)
- **Coordination equipe Mainframe** : cycles de maintenance separes. Comite de pilotage conjoint requis.
- **Disponibilite environnements de test** : LPAR partagees. Reservation anticipee + IBM Wazi. (Scenarios.md §6)

#### 3.3.4 Contraintes reglementaires

- **Auditabilite** : tracabilite complete des transactions. Exigence Bale III/IV, Solvabilite II, DORA.
- **Conformite RGPD** : donnees personnelles dans les topics Kafka CDC. (Scenarios.md P3 §3.3)
- **Continuite de service** : aucune interruption des acces critiques. Strangler Fig + rollback par interface. (Perplexity §6.3, Gemini §6.2)
- **Subventions Quebec** : ESSOR (Investissement Quebec), PCAN. (Gemini §5.3)

---

## 4. Analyse des solutions candidates

### 4.1 Criteres d'evaluation

| # | Critere | Poids | Description |
|---|---------|-------|-------------|
| C1 | **Couverture fonctionnelle Mainframe** | 20% | Support protocoles IBM (LU6.2, APPC, DRDA, TN3270), invocation CICS/IMS, acces DB2, MQ |
| C2 | **Transformation de donnees (EBCDIC/COBOL)** | 15% | Parsing copybooks COBOL, conversion EBCDIC/ASCII, gestion COMP-3, packed decimal |
| C3 | **TCO sur 5 ans** | 15% | Licences + infrastructure + migration + formation + competences + double exploitation |
| C4 | **Facilite de migration depuis HIS** | 15% | Reprise configurations TI, outils de conversion, compatibilite artefacts HIS |
| C5 | **Compatibilite cloud-native** | 10% | Containers, Kubernetes, cloud hybride, auto-scaling, CI/CD |
| C6 | **Observabilite** | 10% | Traces distribuees, OpenTelemetry, metriques, integration monitoring |
| C7 | **Ecosysteme et support** | 5% | Communaute, documentation, support editeur, perennite roadmap |
| C8 | **Exposition API moderne** | 10% | REST/JSON natif, gRPC, event-driven, API Gateway |
| | **Total** | **100%** | |

### 4.2 Options evaluees

#### Option A -- Azure Logic Apps (Standard)

**Successeur naturel de HIS**, plateforme d'integration cloud-native Microsoft. Connecteurs built-in IBM (3270, CICS, IMS, DB2, MQ, Host Files). HIS Designer for Logic Apps pour conversion COBOL → HIDX. Architecture single-tenant, VNet, pay-as-you-go (~0,000125 $/appel). **Limitation critique LU6.2** : coexistence HIS 12-18 mois requise. (Perplexity §2.1, Gemini §2.1.1)

#### Option A-bis -- IBM z/OS Connect EE

Exposition native des transactions CICS/IMS et DB2 en API REST/JSON directement depuis z/OS. Latence minimale. Complement strategique (pas alternative exclusive) a Azure Logic Apps. (Scenarios.md P1, P5)

#### Option B -- Plateformes iPaaS tierces

- **B1 Boomi** : Leader Gartner iPaaS. Atom runtimes on-prem. Migration IA Infosys (-40% couts, -50% effort). OpenLegacy Hub pour CICS. Pas de SNA natif. (Perplexity §2.2, Gemini §2.1.2)
- **B2 MuleSoft** : API-led connectivity. DataWeave pour copybooks COBOL/EBCDIC. Premium ~80K$/an. (Perplexity §2.3, Gemini §2.1.3)
- **B3 PilotFish** : Low-code, Assembly Line 7 etapes. Parsing EBCDIC natif. Import BizTalk XSLT. Niche sante/assurance. (Perplexity §2.5, Gemini §2.2.1)

#### Option C -- IBM ACE + Apache Kafka

**IBM ACE** : Support natif complet LU6.2, APPC, DRDA, DFDL. Integration MQ/DB2. **Kafka** : Decouplage event-driven, CDC DB2-to-Kafka, Kafka Connect MQ source/sink. Cas reels : Fidelity, BEC. (Perplexity §2.4/2.6, Gemini §2.2.2)

#### Option D -- Statu quo ameliore (HIS 2020)

Baseline. Couverture fonctionnelle complete mais reporte le probleme. 140-240K EUR/an. SPOF. Pas d'observabilite moderne. Competences en decroissance.

### 4.3 Matrice de comparaison

| # | Critere | Poids | A: Logic Apps | A-bis: z/OS Connect | B1: Boomi | B2: MuleSoft | B3: PilotFish | C: IBM ACE+Kafka | D: Statu quo |
|---|---------|-------|---------------|---------------------|-----------|-------------|--------------|------------------|-------------|
| C1 | Couverture Mainframe | 20% | 4 | 5 | 3 | 3 | 2 | 5 | 5 |
| C2 | Transformation donnees | 15% | 4 | 4 | 2 | 5 | 4 | 5 | 5 |
| C3 | TCO 5 ans | 15% | 4 | 3 | 4 | 2 | 4 | 3 | 3 |
| C4 | Facilite migration HIS | 15% | 5 | 3 | 3 | 3 | 3 | 3 | 5 |
| C5 | Cloud-native | 10% | 5 | 2 | 4 | 4 | 4 | 4 | 1 |
| C6 | Observabilite | 10% | 4 | 3 | 4 | 4 | 3 | 4 | 1 |
| C7 | Ecosysteme | 5% | 5 | 4 | 4 | 4 | 2 | 4 | 2 |
| C8 | API moderne | 10% | 5 | 4 | 4 | 5 | 3 | 4 | 1 |
| | **Score pondere** | **100%** | **4.40** | **3.60** | **3.35** | **3.60** | **3.15** | **4.05** | **3.35** |

#### Classement final

| Rang | Option | Score | Verdict |
|------|--------|-------|---------|
| 1 | **Option A -- Azure Logic Apps** | **4.40 / 5** | **Recommandee -- plateforme primaire** |
| 2 | Option C -- IBM ACE + Kafka | 4.05 / 5 | Alternative si ecosysteme IBM fort |
| 3 | Option A-bis -- z/OS Connect EE | 3.60 / 5 | **Complement recommande** |
| 3 | Option B2 -- MuleSoft | 3.60 / 5 | Alternative credible, TCO premium |
| 5 | Option B1 -- Boomi | 3.35 / 5 | Viable pour environnements heterogenes |
| 5 | Option D -- Statu quo HIS | 3.35 / 5 | Non recommande |
| 7 | Option B3 -- PilotFish | 3.15 / 5 | Niche sectorielle |

**Architecture cible recommandee : Azure Logic Apps (Standard) + z/OS Connect EE + Apache Kafka** (score combine optimal, convergence des deux etudes).

---

## 5. Analyse d'impact

### 5.1 Impact sur l'architecture

#### Cartographie des systemes consommant le Mainframe via HIS

| Pilier d'integration HIS | Systemes consommateurs | Flux a migrer |
|--------------------------|------------------------|---------------|
| **Integration applicative (TI)** | Applications .NET, portails web, CRM, banque en ligne | Appels synchrones CICS/IMS -- COMMAREA |
| **Integration donnees (DRDA)** | Reporting, BI (Power BI), traitements batch | Requetes SQL vers DB2 z/OS, stored procedures COBOL |
| **Emulation terminale (TN3270)** | Back-office, sinistres, administration | Sessions interactives ecrans BMS |
| **Integration messages (MQ Bridge)** | Notifications, alertes, synchronisation | Messages asynchrones MQ z/OS vers .NET |
| **Transfert de fichiers** | Reconciliation, DWH, reporting reglementaire | Fichiers batch VSAM/PS avec conversion EBCDIC |

#### Impact reseau : retrait de l'infrastructure SNA

| Composant | Action | Dependance |
|-----------|--------|------------|
| VTAM | Desactivation definitions APPLID et tables de modes | Apres migration flux TI (P1 Wave 2) |
| NCP | Retrait si exclusivement dedie HIS | Validation absence dependances |
| DLC/IP-DLC | Suppression configurations | Apres decommissionnement Phase D (M32-M36) |
| SNA Gateway HIS | Arret services, liberation ports | Phase C -- mode observation (M28-M32) |

### 5.2 Impact organisationnel

| Equipe | Impact | Effort |
|--------|--------|--------|
| **Operations Windows / Middleware** | Reconversion administration HIS → iPaaS cloud | Formation 3-6 mois |
| **Equipe Mainframe** | Nouveaux modes d'exposition z/OS Connect, CICS TG TCP/IP | Formation 2-4 mois |
| **Developpeurs .NET** | Abandon API TI → REST/JSON, patterns Saga, Kafka | Refactoring + formation 3-6 mois |
| **Securite / RSSI** | IAM unifie (RACF ↔ OAuth2/OIDC), gestion secrets | Revue 2-3 mois |
| **BI / Data** | Pipelines HIS Host File → ADF/Cobrix, CDC Kafka | Formation 1-2 mois |
| **QA / Tests** | Tests regression automatises, comparaison EBCDIC bit-a-bit | Outillage 3-6 mois |

#### Impact contrats et licences

| Contrat | Economie estimee |
|---------|-----------------|
| Licences BizTalk Server | 40 000 - 65 000 EUR/an |
| Infrastructure Windows Server HIS | 25 000 - 50 000 EUR/an |
| Software Assurance HIS | 15 000 - 25 000 EUR/an |

### 5.3 Impact securite et conformite

| Dimension | HIS actuel | Architecture cible | Delta |
|-----------|------------|-------------------|-------|
| Chiffrement | TLS partiel, SNA non chiffre | TLS 1.3 obligatoire | **Amelioration significative** |
| Authentification | NTLM/Kerberos + ESSO/RACF | OAuth2/OIDC, MFA | **Amelioration significative** |
| Gestion secrets | Credentials RACF en dur dans scripts | Vault centralise, rotation auto | **Amelioration critique** |
| Surface d'attaque | Windows Server on-premise | Cloud-native single-tenant, VNet | **Amelioration** |
| Monitoring securite | Logs HIS basiques | OpenTelemetry, SIEM complet | **Amelioration significative** |

---

## 6. Analyse couts-benefices

### 6.1 Couts

#### Statu quo (baseline) : 140 000 - 240 000 EUR/an

| Poste | Estimation annuelle |
|-------|---------------------|
| Licences BizTalk Server | 40 000 - 65 000 EUR |
| Infrastructure serveurs HIS | 25 000 - 50 000 EUR |
| Maintenance Microsoft (SA) | 15 000 - 25 000 EUR |
| Competences SNA/TI (ETP partiel) | 60 000 - 100 000 EUR |
| **Total** | **140 000 - 240 000 EUR** |

#### Couts de migration sur 3 ans

| Poste | Annee 0 | Annee 1 | Annee 2 | Annee 3 |
|-------|---------|---------|---------|---------|
| Licences / abonnements iPaaS | 20 000 | 60-90 000 | 60-90 000 | 55-85 000 |
| Infrastructure cloud | 15 000 | 30-45 000 | 25-40 000 | 20-35 000 |
| Migration et integration | 250-350 000 | 300-450 000 | 200-300 000 | 50-80 000 |
| Formation | 40-60 000 | 20-30 000 | 10-15 000 | 5-10 000 |
| Changement | 30-50 000 | 20-30 000 | 10-15 000 | 5 000 |
| Double exploitation HIS | 140-240 000 | 100-170 000 | 40-70 000 | 0 |
| **Total** | **495-720 000** | **530-815 000** | **345-530 000** | **135-215 000** |

**Cout total programme 3 ans** : ~1 900 000 EUR (estimation mediane).

### 6.2 Benefices

| Benefice | Type | Estimation annuelle post-migration |
|----------|------|--------------------------------------|
| Elimination licences HIS + BizTalk + Windows Server | Quantifiable | 80 000 - 140 000 EUR/an |
| Reduction couts competences SNA | Quantifiable | 30 000 - 60 000 EUR/an |
| Reduction couts MIPS mainframe | Quantifiable | 15-25% reduction |
| Acceleration Time-to-Market | Quantifiable | 60-80% reduction delais |
| Reduction incidents operationnels | Quantifiable | 50% reduction (elimination SPOF) |

### 6.3 ROI et delai de retour

**Donnees de reference Forrester :**

| Etude | ROI | Payback |
|-------|-----|---------|
| Azure PaaS | 228% sur 3 ans | 12-18 mois |
| Boomi Enterprise Platform | 347-410% | < 10 mois |

**Break-even** : Annee 5-6 (financier strict), Annee 4-5 avec benefices productivite.

**Subventions Quebec** : ESSOR (Investissement Quebec), PCAN, Offensive Tr@ns Num. Potentiel 20-30% de l'investissement initial (~380 000 - 570 000 EUR), ramenant le break-even a 3-4 ans. (Gemini §5.3)

---

## 7. Risques et mesures d'attenuation

### 7.1 Registre des risques

| ID | Risque | Probabilite | Impact | Strategie d'attenuation | Pattern(s) |
|----|--------|-------------|--------|------------------------|------------|
| R-01 | Perte de connectivite Mainframe lors de la bascule | Moyenne | Critique | Parallel run systematique 4-8 semaines, comparaison automatisee, rollback DNS < 5 min | Tous |
| R-02 | Incompatibilite conversion donnees (EBCDIC, COMP-3, COBOL copybooks) | Elevee | Eleve | Tests regression avec golden dataset, shadowing bit-a-bit, parseurs eprouves (DataWeave, Cobrix, HIDX) | P1, P2, P4 |
| R-03 | Perte de connaissances HIS/SNA avant fin de migration | Elevee | Eleve | Documentation anticipee Phase 1, transfert de connaissances, contractualisation experts 36 mois | Tous |
| R-04 | Resistance au changement equipes operations | Moyenne | Moyen | Champions techniques, formations croisees mainframe/cloud, plateformes low-code | Tous |
| R-05 | Perte garantie 2PC LU6.2 pour ecritures | Moyenne | Critique | Reporter ecritures a Wave 2, pattern Saga orchestre, Transactional Outbox, chaos engineering | P1 |
| R-06 | Indisponibilite environnements Mainframe de test | Moyenne | Moyen | Reservation anticipee LPAR, IBM Wazi as a Service, mocks/stubs | Tous |
| R-07 | Dependances non documentees vers HIS decouvertes tard | Moyenne | Eleve | Inventaire exhaustif Phase 1, scan configurations, analyse logs 3 mois, outils IA (Mono2Micro), contingence 15-20% | Tous |
| R-08 | Perte de messages en transition MQ → Kafka | Moyenne | Critique | Dual-write avec reconciliation, dead-letter queues, exactly-once Kafka, monitoring Prometheus/Grafana | P3 |
| R-09 | Stored procedures COBOL non documentees | Elevee | Eleve | Analyse statique (CAST, Micro Focus), equipe dediee COBOL+DB2, approche progressive | P4 |
| R-10 | Casse integration suite a modification ecran BMS | Elevee | Critique | Scraping transitoire < 12 mois, tests regression automatises, migration z/OS Connect EE | P5 |
| R-11 | Degradation latence API Gateway vs LU6.2 direct | Haute | Moyen | Benchmark P50/P95/P99, VNet peering, ExpressRoute, cache Redis, gRPC | P1 |

### 7.2 Strategie de rollback a 4 niveaux

| Niveau | Perimetre | Mecanisme | Delai |
|--------|-----------|-----------|-------|
| 1 -- Interface | Flux individuel | Redirection DNS/load balancer vers HIS | < 5 min |
| 2 -- Donnees | Jeu de donnees | Snapshots pre-migration, restauration configs HIS | < 4 heures |
| 3 -- Plateforme | Vague entiere | HIS en standby, reactivation complete | < 8 heures |
| 4 -- Programme | Programme complet | Decision comite pilotage, retour mode HIS integral | 1-2 semaines |

---

## 8. Strategie de transition

### 8.1 Approche de migration

**Patron architectural : Strangler Fig avec couche anticorruption (ACL).** Migration progressive flux par flux, parallel run systematique, coexistence bornee 12-18 mois.

#### Matrice de decision par approche

| Approche | Scenarios HIS cibles | Effort (Fibonacci) | Risque | Duree |
|----------|---------------------|-------------------|--------|-------|
| **Rehost / Lift-and-Shift** | Tous patterns | 8-21 pts | Moyen | 6-12 mois |
| **Refactor / Strangler Fig** | P1, P3, P4 | 13-34 pts | Faible-Moyen | 12-24 mois |
| **Rewrite / Cloud-Native** | P2, P5 | 55-89 pts | Eleve | 18-36 mois |
| **Coexist / Hybrid** | Tous patterns | 5-13 pts | Faible | 3-6 mois initial |

#### Roadmap 3 vagues

**Wave 1 -- Quick Wins (0-6 mois)** : 5 scenarios pilotes (RCLI, CHIS, POSI, Batch Valo, Notif MQ). ROI mesurable des les premieres semaines.

**Wave 2 -- Strategic (6-18 mois)** : 5 scenarios (saisie sinistre, souscription, prelevements, reporting reglementaire, portail partenaires). 12 ETP requis.

**Wave 3 -- Long-term (18-36 mois)** : 5 scenarios complexes (tarification, provisions, comptabilite, decomm. 3270, decomm. HIS).

**Effort consolide** : 260 points Fibonacci (47 analyse + 121 dev + 63 tests + 29 deploiement).

#### Criteres Go/No-Go Wave 1 → Wave 2

| Decision | Criteres |
|----------|----------|
| **Go** | >= 4 scenarios stables (< 0.1% erreur, 30 jours), ROI >= 70% previsionnel |
| **Conditional Go** | 3 scenarios stables, ROI 50-70%, plan remediation |
| **No-Go** | < 3 scenarios, incidents majeurs, ROI < 50% |

#### Dependances inter-scenarios

```
WAVE 1                          WAVE 2                          WAVE 3
------                          ------                          ------

[Infra z/OS Connect] ---------------------------------------------------------------+
       |                                                                             |
       +---> [#1 Ref. Client] -----> [#6 Saisie Sinistre] -----> [#14 Decomm. 3270] |
       |         |                          |                                        |
       |         +-------> [#7 Souscription]+                                        |
       |                                                                             |
       +---> [#2 Hist. Contrat] ---> [#7 Souscription] -----> [#11 Tarification]     |
       |                                                                             |
       +---> [#3 Positions] -------> [#12 Provisions]                                |
       |                                                                             |
       +---> [#4 Batch Valo] ------> [#9 Reporting Regl.]                            |
       |                                                                             |
       +---> [#5 Notif. MQ] -------> [#8 Prelevements] -----> [#13 Comptabilite]     |
       |                                                                             |
       +---> [API Gateway + IAM] --> [#10 Portail Partenaires] -> [#15 Decomm. HIS]--+
```

### 8.2 Plan de decommissionnement HIS

| Phase | Periode | Action | Validation |
|-------|---------|--------|------------|
| **Phase A** | M18-M22 | Redirection 80% trafic HIS vers APIs | 80% requetes via nouveaux connecteurs, 30 jours sans incident |
| **Phase B** | M22-M28 | Migration 20% restants | 100% flux rediriges, 14 jours sans requete HIS |
| **Phase C** | M28-M32 | Mode observation (HIS en standby) | 30 jours consecutifs sans trafic |
| **Phase D** | M32-M36 | Decommissionnement definitif | Instances arretees, licences liberees, SNA nettoyee |

### 8.3 Jalons cles

| Jalon | Date cible | Critere de validation |
|-------|-----------|----------------------|
| J1 -- Architecture de reference | S2 | Document approuve, z/OS Connect provisionne |
| J2 -- POC scenario pilote (#1 RCLI) | S6 | API fonctionnelle, < 200ms, 100 tx/min |
| J3 -- Scenarios #1-#3 en production | S16 | Taux erreur < 0.1%, SLA respectes, rollback teste |
| J5 -- Bilan Wave 1, Go/No-Go Wave 2 | S24 | ROI mesure >= 70% previsionnel |
| J7 -- Scenarios #6-#10 en production | M18 | 80% flux migres |
| J11 -- Decommissionnement effectif | M32-M36 | HIS arrete, licences liberees |
| J12 -- Cloture programme | M36 | 100% API REST, 0 session 3270, HIS decommissionne |

---

## 9. Metriques de succes

| Metrique | Baseline (HIS) | Cible post-migration | Echeance | Methode de mesure |
|---|---|---|---|---|
| Latence CICS P95 | ~500 ms | <= 500 ms | M12 | APM / traces distribuees |
| Disponibilite passerelle | 99.5% | >= 99.95% | M18 | Monitoring SLA |
| Incidents/mois connectivite host | ~5 | <= 1 | M24 | ITSM |
| Cout annuel integration Mainframe | 140-240K EUR | Reduction >= 30% | M36 | Comptabilite analytique |
| Delai deploiement nouveau flux | Semaines | Jours | M18 | Lead time projet |
| Flux exposes en API REST | 0% | 100% | M36 | Registre API |
| Taux migration interfaces | 0% | 100% | M36 | % migrees vs total |
| Taux erreur transactionnelle | Variable | <= 0.1% (W1), <= 0.05% (W2+) | M6/M18 | Monitoring applicatif |
| Fenetre batch (P2) | 22h-06h | Reduction >= 20% | M12 | Temps execution batch |
| Satisfaction equipes | Non mesuree | >= 4/5 | M24 | Survey |

---

## 10. Recommandation

### Option recommandee

> **Azure Logic Apps (Standard) + Apache Kafka + IBM z/OS Connect EE**
>
> Migration progressive Strangler Fig, 3 vagues sur 18-36 mois, coexistence HIS residuel 12-18 mois pour flux LU6.2.

### Justification -- 5 facteurs determinants

| # | Facteur | Analyse |
|---|---------|---------|
| 1 | **Continuite strategique Microsoft** | Logic Apps successeur officiel HIS, connecteurs IBM built-in, HIS Designer for Logic Apps |
| 2 | **Couverture fonctionnelle >= 90%** | Connecteurs couvrent CICS, IMS, DB2, MQ, 3270, Host Files. LU6.2 (<10%) adressable par coexistence |
| 3 | **Competences marche** | Bassin developpeurs Azure/cloud >> specialistes SNA/HIS/COBOL |
| 4 | **TCO 5 ans** | Reduction 30-50%. ROI Forrester 228-410% |
| 5 | **Elimination SPOF** | Architecture cloud-native HA vs gateway centralise Windows Server |

### Convergence des etudes

Les deux etudes arrivent a la meme conclusion : **GO conditionnel** pour Azure Logic Apps + Kafka, migration Strangler Fig 18-36 mois.

### Conditions de succes

1. Validation POC Wave 1 (4/5 scenarios, latence P95 <= 500ms, erreur < 0.1%)
2. Provisionnement z/OS Connect (prerequis bloquant)
3. Securisation competences SNA/COBOL (contractualisation experts)
4. Gouvernance rigoureuse (comite pilotage bi-mensuel, Go/No-Go explicites)
5. Budget contingence 15-20%
6. Coexistence HIS en standby avec rollback teste

### Prochaines etapes

| Etape | Responsable | Echeance |
|---|---|---|
| Approbation GO conditionnel | Comite de direction | S+2 |
| Nomination directeur programme | DSI | S+3 |
| Inventaire exhaustif flux HIS | Middleware + Mainframe | M1-M2 |
| Provisionnement infrastructure cible | Infrastructure | M1-M3 |
| POC Wave 1 scenario #1 | Equipe projet | M2-M3 |
| Decision Go/No-Go Wave 2 | Comite pilotage | M6 |

---

## Annexes

### Annexe A -- Glossaire

| Terme | Definition |
|---|---|
| **SNA** | Architecture reseau proprietaire IBM (1974). Protocoles de communication mainframe. |
| **LU 6.2** | Unite logique SNA pour communications programme-a-programme. Support 2PC (Sync Level 2). |
| **APPC** | Protocole de communication base sur LU 6.2. Echanges transactionnels bidirectionnels. |
| **TN3270** | Extension Telnet pour emulation terminaux IBM 3270 via TCP/IP (RFC 2355). |
| **DRDA** | Architecture IBM pour acces distant aux bases DB2 via TCP/IP. |
| **TI** | Transaction Integrator de HIS. Applications .NET invoquent programmes CICS/IMS. Conversion EBCDIC/ASCII. |
| **CICS** | Moniteur transactionnel IBM z/OS. > 1M transactions/seconde. |
| **IMS** | Systeme gestion bases hierarchiques et moniteur transactionnel IBM z/OS. |
| **VTAM** | Virtual Telecommunications Access Method. Gestion sessions SNA sur z/OS. |
| **NCP** | Network Control Program. Controle reseau sur controleurs IBM (3745, 3174). |
| **EBCDIC** | Encodage 8 bits IBM mainframe. Conversion requise vers ASCII/UTF-8. |
| **COBOL Copybook** | Fragment code COBOL definissant structures de donnees. Schema de facto pour COMMAREA/fichiers. |
| **iPaaS** | Integration Platform as a Service. Exemples : Azure Logic Apps, Boomi, MuleSoft. |
| **Strangler Fig** | Patron migration progressive. Nouvelle facade intercepte graduellement le trafic. |
| **Saga Pattern** | Transactions distribuees via transactions locales + compensations. Alternative au 2PC. |
| **CDC** | Change Data Capture. Capture modifications en temps reel (ex: DB2 → Kafka). |
| **HIDX** | Format metadonnees XML genere par HIS Designer for Logic Apps depuis copybooks COBOL. |
| **COMMAREA** | Zone communication CICS (32 KB max). Structure entree/sortie des transactions. |
| **2PC** | Two-Phase Commit. Validation transactionnelle distribuee (prepare + commit). |

### Annexe B -- Cartographie d'architecture

#### B.1 Architecture AS-IS (avec HIS)

```
                                +---------------------------+
                                |   Applications .NET       |
                                |  (Portail Web, CRM, Batch)|
                                +---------------------------+
                                           |
                                [WCF/ADO.NET/OLE DB]
                                           |
                    +----------------------------------------------+
                    |          Microsoft HIS 2020                  |
                    |  +------------------+  +------------------+  |
                    |  | Transaction      |  | OLE DB Provider  |  |
                    |  | Integrator (TI)  |  | for DB2 (DRDA)   |  |
                    |  +------------------+  +------------------+  |
                    |  +------------------+  +------------------+  |
                    |  | TN3270 Service   |  | MSMQ-MQ Bridge   |  |
                    |  +------------------+  +------------------+  |
                    |  +------------------+  +------------------+  |
                    |  | Host File Client |  | ESSO (SSO)       |  |
                    |  +------------------+  +------------------+  |
                    +----------------------------------------------+
                       |  SNA LU6.2  |  DRDA/TCP  |  MQ  |  FTP
                    +----------------------------------------------+
                    |            IBM Mainframe z/OS                |
                    |  +--------+  +-----+  +----+  +----------+  |
                    |  | CICS   |  | DB2 |  | MQ |  | VSAM/PS  |  |
                    |  | IMS    |  |     |  |    |  |          |  |
                    |  +--------+  +-----+  +----+  +----------+  |
                    +----------------------------------------------+
```

#### B.2 Architecture TO-BE (solution cible)

```
               +---------------------------------------------+
               |  Canaux digitaux (Web, Mobile, Partenaires) |
               +---------------------------------------------+
                                    |
                          [API Gateway (Azure APIM)]
                                    |
               +--------------------+--------------------+
               |                    |                    |
    +-------------------+  +------------------+  +------------------+
    | Azure Logic Apps  |  | Microservices    |  | Azure Functions  |
    | Standard          |  | (Java/Node.js)   |  | (Event-Driven)   |
    | [CICS, IMS, DB2,  |  |                  |  |                  |
    |  MQ, 3270, Host   |  |                  |  |                  |
    |  File connectors] |  |                  |  |                  |
    +-------------------+  +------------------+  +------------------+
               |                    |                    |
    +-------------------+  +------------------+  +------------------+
    | IBM z/OS Connect  |  | Apache Kafka     |  | Azure Data       |
    | EE (REST API)     |  | (Kafka Connect   |  | Factory / NiFi   |
    |                   |  |  MQ Source/Sink,  |  | (Batch ETL)      |
    |                   |  |  CDC DB2)         |  |                  |
    +-------------------+  +------------------+  +------------------+
               |                    |                    |
    +------------------------------------------------------+
    |              IBM Mainframe z/OS                      |
    |  +--------+  +-----+  +----+  +----------+          |
    |  | CICS   |  | DB2 |  | MQ |  | VSAM/PS  |          |
    |  | IMS    |  |     |  |    |  |          |          |
    |  +--------+  +-----+  +----+  +----------+          |
    +------------------------------------------------------+
```

### Annexe C -- Inventaire des flux Mainframe (par pattern)

#### P1 -- Synchronous CICS TI

| ID | Flux | Programme CICS | Volume/jour | Wave |
|---|---|---|---|---|
| P1-01 | Consultation solde bancaire | INQBAL | 50K-200K | 1 |
| P1-02 | Verification couverture assurance | COVCHK | 20K-80K | 1 |
| P1-03 | Consultation stock temps reel | STKINQ | 500K-2M | 2 |
| P1-04 | Execution virement bancaire | XFRTRAN | 100K-500K | 2 |

#### P2 -- Batch File Transfer

| ID | Flux | Volume | Frequence | Wave |
|---|---|---|---|---|
| P2-01 | Rapprochement bancaire | 2-5 Go | Quotidien | 1 |
| P2-02 | Releves de compte mensuels | 10-50 Go | Mensuel | 1 |
| P2-03 | Alimentation Data Warehouse | 5-20 Go | Quotidien | 1 |
| P2-04 | Reporting reglementaire | 100 Mo-2 Go | Mensuel/Trimestriel | 2 |

#### P3 -- Event-Driven MQ

| ID | Flux | Volume/jour | Latence cible | Wave |
|---|---|---|---|---|
| P3-01 | Notification paiement | 50K-200K | < 2 sec | 1 |
| P3-02 | CDC referentiel client | 10K-50K | < 5 sec | 2 |
| P3-03 | Alertes seuil credit | 1K-10K | < 2 sec | 2 |
| P3-04 | Synchronisation cours/prix | 100K-500K | < 10 sec | 1 |

#### P4 -- Database Access DB2

| ID | Flux | Volume/jour | Type | Wave |
|---|---|---|---|---|
| P4-01 | Lookup client (Customer 360) | 100K-500K | Lecture | 2 |
| P4-02 | Calcul tarification | 20K-80K | Lecture + Calcul | 3 |
| P4-03 | Referentiel produits | 50K-200K | Lecture | 2 |
| P4-04 | Extraction reporting reglementaire | 10M-100M lignes | Batch | 2 |

#### P5 -- Terminal Emulation 3270

| ID | Flux | Volume/jour | Cible | Wave |
|---|---|---|---|---|
| P5-01 | Historique contrat assurance | 15K | API REST consolidee | 1 |
| P5-02 | Saisie declaration sinistre | 3K | API REST + microservice | 2 |
| P5-03 | Positions titres | 8K | API REST + cache | 1 |
| P5-04 | Referentiel client unifie | 45K | API REST + GraphQL | 1 |

### Annexe D -- References

1. Microsoft Learn, "What is HIS", https://learn.microsoft.com/en-us/host-integration-server/what-is-his
2. Microsoft Lifecycle -- HIS 2020, https://learn.microsoft.com/en-us/lifecycle/products/microsoft-host-integration-server-2020
3. Microsoft Learn, "Mainframe modernization -- Azure Logic Apps", https://learn.microsoft.com/en-us/azure/logic-apps/mainframe-modernization-overview
4. Azure, "GA Azure Logic Apps connectors for IBM mainframe", https://azure.microsoft.com/en-us/updates/general-availability-of-azure-logic-apps-connectors-for-ibm-mainframe-and-midranges
5. Microsoft Tech Community, "Enabling SNA Applications with Azure Integration Services", https://techcommunity.microsoft.com/blog/integrationsonazureblog/enabling-sna-applications-with-azure-integration-services/3802317
6. Microsoft Learn, "Transaction Integrator Architecture", https://learn.microsoft.com/en-us/host-integration-server/core/transaction-integrator-architecture1
7. Azure Blog, "Forrester 228% ROI Azure PaaS", https://azure.microsoft.com/en-us/blog/forrester-study-finds-228-percent-roi-when-modernizing-applications-on-azure-paas/
8. Boomi, "410% ROI Total Economic Impact Study", https://boomi.com/resources/resources-library/boomi-atomsphere-delivers-410-roi-according-to-total-economic-impact-study/
9. MuleSoft, "IBM CICS mainframe integration", https://www.mulesoft.com/resources/api/ibm-cics-mainframe-integration
10. MuleSoft, "COBOL Copybook Format", https://docs.mulesoft.com/dataweave/latest/dataweave-formats-copybook
11. PilotFish, "Replace BizTalk Server", https://healthcare.pilotfishtechnology.com/biztalk-end-of-life-replacement-pilotfish/
12. IBM, "App Connect Enterprise", https://www.ibm.com/docs/en/app-connect/13.0.x?topic=overview-app-connect-enterprise-introduction
13. Kai Waehner, "Mainframe Integration with Data Streaming", https://www.kai-waehner.de/blog/2025/06/13/mainframe-integration-with-data-streaming-architecture-business-value-real-world-success/
14. AWS, "Augmenting mainframe data with IBM MQ and Kafka", https://aws.amazon.com/blogs/mt/augmenting-mainframe-data-with-ibm-mq-and-amazon-managed-streaming-for-apache-kafka/
15. Microsoft, "Ingesting Mainframe EBCDIC data using Cobrix", https://techcommunity.microsoft.com/blog/modernizationbestpracticesblog/ingesting-mainframe-file-system-data-ebcdic-into-sql-db-on-fabric-using-oss-cobr/4402105
16. Microsoft Learn, "Cloud migration strategies", https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/plan/select-cloud-migration-strategy
17. Martin Fowler, "Microservices", https://martinfowler.com/articles/microservices.html
18. Microservices.io, "Transactional outbox pattern", https://microservices.io/patterns/data/transactional-outbox.html
19. Mallette, "Digital Transformation Grants", https://www.mallette.ca/en/tips/digital-transformation-grants
20. helloDarwin, "Digital Transformation Grants Quebec 2026", https://hellodarwin.com/business-aid/grants-and-funding/digital-transformation/quebec

### Annexe E -- Parties prenantes

| Role | Responsabilite | Implication |
|---|---|---|
| Sponsor executif (VP/CTO) | Autorite budgetaire et decisionnelle | Comite pilotage bi-mensuel |
| DSI | Nomination directeur programme | Comite pilotage bi-mensuel |
| Architecte d'entreprise | Validation architecture cible | Comite technique hebdomadaire |
| Responsable Mainframe | Coordination z/OS, z/OS Connect, CICS/DB2 | Comite technique + equipe projet |
| Responsable middleware | Expertise HIS, transfert connaissances | Equipe projet (critique Wave 1-2) |
| Architectes integration | Design flux migres, choix connecteurs | Comite technique + equipe projet |
| Developpeurs .NET/Java | Migration code applicatif, APIs | Equipe projet |
| Developpeurs COBOL/RPG | Analyse programmes mainframe | Equipe projet (competences rares) |
| DBA DB2 | Migration acces DRDA, SP COBOL | Equipe projet |
| Securite / RSSI | Chiffrement, IAM, audit trail | Revue par phase |
| Exploitation / SRE | Deploiement, monitoring, rollback | Operations + astreinte |
| QA / Testeurs | Non-regression, performance, conversion | Equipe projet |
| Product Owners metier | Validation fonctionnelle, priorisation | Comite pilotage + UAT |
| Direction achats | Licences Azure/IBM, resiliation HIS | Phase 0-1, Phase D |

### Annexe F -- Journal de decision

| # | Decision | Justification | Statut |
|---|----------|---------------|--------|
| D-01 | Lancement etude d'opportunite | Fin support HIS 2020 (juillet 2028) | *[A valider]* |
| D-02 | Architecture cible : Logic Apps + Kafka + z/OS Connect | Convergence etudes, couverture >= 90% | *[A valider]* |
| D-03 | Sequencage 3 vagues (260 pts Fibonacci) | Matrice scoring Scenarios.md | *[A valider]* |
| D-04 | Selection 5 scenarios pilotes Wave 1 | Scores 3.3-3.8, effort faible | *[A valider]* |
| D-05 | Go/No-Go Wave 2 | >= 4 scenarios stables, ROI >= 70% | *[A planifier -- M6]* |
| D-06 | Decommissionnement HIS | 30 jours sans trafic | *[A planifier -- M32-M36]* |

### Annexe G -- Matrice de scoring consolidee (5 patterns)

| Pattern | Simplicite (25%) | Impact (20%) | ROI (20%) | Doc (15%) | Sponsor (10%) | Conformite (10%) | **Score** | **Verdict** |
|---|---|---|---|---|---|---|---|---|
| **P2 Batch** | 4 | 4 | 4 | 4 | 3 | 4 | **3.90** | **GO** |
| **P3 MQ** | 3 | 4 | 4 | 4 | 3 | 3 | **3.55** | Conditional Go |
| **P1 CICS TI** | 3 | 2 | 4 | 4 | 4 | 3 | **3.25** | Conditional Go |
| **P4 DB2** | 2 | 2 | 4 | 3 | 4 | 2 | **2.75** | Conditional Go (reserves) |
| **P5 3270** | 2 | 2 | 3 | 2 | 3 | 2 | **2.30** | Conditional Go (transitoire) |

### Annexe H -- Diagramme de dependances inter-scenarios

```
WAVE 1 (0-6 mois)               WAVE 2 (6-18 mois)              WAVE 3 (18-36 mois)
-----------------                ------------------              -------------------

[Infra z/OS Connect] ---------------------------------------------------------------->
       |
       +---> [#1 Ref. Client] ------> [#6 Saisie Sinistre] ------> [#14 Decomm. 3270]
       |         |                           |
       |         +-------> [#7 Souscription] +
       |
       +---> [#2 Hist. Contrat] ----> [#7 Souscription] ------> [#11 Tarification]
       |
       +---> [#3 Positions] -------> [#12 Provisions]
       |
       +---> [#4 Batch Valo] ------> [#9 Reporting Regl.]
       |
       +---> [#5 Notif. MQ] -------> [#8 Prelevements] -------> [#13 Comptabilite]
       |
       +---> [API Gateway + IAM] --> [#10 Portail Partenaires] -> [#15 Decomm. HIS]
```

### Annexe I -- Estimation effort consolidee (260 pts Fibonacci)

| Pattern | Analyse | Dev | Tests | Deploiement | **Total** |
|---|---|---|---|---|---|
| P1 CICS TI | 8 | 21 | 13 | 5 | **47** |
| P2 Batch | 5 | 13 | 8 | 3 | **29** |
| P3 MQ | 8 | 21 | 13 | 5 | **47** |
| P4 DB2 | 13 | 34 | 21 | 8 | **76** |
| P5 3270 | 13 | 32 | 8 | 8 | **61** |
| **Total** | **47** | **121** | **63** | **29** | **260** |

---

*Document redige le 2026-02-16 dans le cadre de l'etude d'opportunite de retrait de Microsoft Host Integration Server (HIS).*
*Sources : Etude Perplexcity.md (22 references), Etude Gemini.md (106 references), Scenarios.md (matrice 15 scenarios).*
