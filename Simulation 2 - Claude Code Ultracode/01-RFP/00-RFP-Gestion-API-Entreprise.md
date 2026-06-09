# Appel d'offres — Plateforme d'API Management d'entreprise (déploiement hybride)

**Document principal du dossier d'appel d'offres (RFP)**

| Champ | Valeur |
|---|---|
| Organisation cliente | Banque Boréale du Québec (BBQ) — *organisation fictive* |
| Objet | Acquisition d'une plateforme unique d'**API Management d'entreprise** en **déploiement hybride strict** |
| Référence du dossier | RFP-BBQ-APIM-2026 |
| Type de marché | Acquisition de logiciel d'entreprise + services d'implantation et de support |
| Mode de déploiement visé | Hybride (control plane souverain/on-prem ; data planes multi-environnements) |
| Date d'émission | Juin 2026 *(indicative)* |
| Statut du document | Document principal — renvoie aux annexes A1, A2 et A3 |
| Langue | Français |

---

## Avis d'intégrité et cadre de simulation

> **À lire avant toute exploitation de ce document.**
>
> - L'organisation cliente **Banque Boréale du Québec (BBQ)** est **entièrement fictive**. Tout nom, chiffre, profil ou contexte la concernant est construit à des fins de simulation et ne désigne aucune institution réelle.
> - Les réponses fournisseurs qui seront produites dans le cadre de cet exercice sont **simulées**, à partir de **capacités produit publiques et vérifiées en date de juin 2026**. Elles ne constituent ni un engagement, ni une déclaration officielle d'un éditeur.
> - Les éléments de **prix, de TCO et de licence** mentionnés ou demandés sont **indicatifs et non contractuels**. Ils servent uniquement à la comparaison méthodologique.
> - Tout élément incertain, prospectif ou postérieur à l'horizon de connaissance retenu est explicitement marqué **« à vérifier »**. Les soumissionnaires (réels ou simulés) doivent confirmer ou infirmer ces éléments avec preuves à l'appui.
> - Ce document ne crée aucune obligation juridique. Il sert de **trame méthodologique** d'évaluation d'une plateforme d'API Management en contexte d'institution financière canadienne sous régime hybride et souverain.

---

## Table des matières

1. [Contexte et objectifs d'affaires](#1-contexte-et-objectifs-daffaires)
2. [Profil de l'organisation et contraintes](#2-profil-de-lorganisation-et-contraintes)
3. [Périmètre et cas d'usage](#3-périmètre-et-cas-dusage)
4. [Exigences (synthèse par familles)](#4-exigences-synthèse-par-familles)
5. [Critères d'évaluation et pondération](#5-critères-dévaluation-et-pondération)
6. [Calendrier indicatif et processus](#6-calendrier-indicatif-et-processus)
7. [Annexes](#7-annexes)

---

## 1. Contexte et objectifs d'affaires

### 1.1 Contexte stratégique

La Banque Boréale du Québec (BBQ) est une grande institution de services financiers à charte fédérale qui exerce, à la fois, des activités de banque de détail, de gestion de patrimoine et d'assurance de dommages (via une filiale dédiée). Elle est engagée dans un **programme pluriannuel de modernisation de son système d'information**, porté par plusieurs forces de transformation convergentes :

- l'arrivée prochaine du **cadre canadien du système bancaire ouvert (Open Banking)**, qui imposera l'exposition gouvernée de données et de services à des agrégateurs et fintechs accrédités, avec consentement client explicite ;
- la **modernisation des paiements** sous l'égide de Paiements Canada (Real-Time Rail / RTR, normalisation **ISO 20022**), qui exige des interfaces temps réel, idempotentes et résidentes au Canada ;
- le **virage omnicanal** et la multiplication des **partenariats fintech**, qui supposent une mise en marché beaucoup plus rapide d'API partenaires et publiques ;
- l'essor des **assistants IA et applications GenAI** internes, qui consomment des API et des outils (y compris des serveurs MCP) et qui introduisent de nouveaux risques de fuite de données réglementées.

### 1.2 Problème à résoudre

Le parc applicatif de BBQ mêle **mainframe et systèmes de paiement cœur** (on-prem), **microservices conteneurisés**, et un **patrimoine d'API REST/SOAP fragmenté** entre plusieurs passerelles héritées. Cette fragmentation engendre :

- une **gouvernance incohérente** des politiques de sécurité, de résidence et de conformité d'une passerelle à l'autre ;
- une **visibilité partielle** sur le trafic d'API et une auditabilité difficile à produire lors des examens réglementaires ;
- une **dette d'API** croissante (versions, doublons, dépréciations non maîtrisées) ;
- des **délais de mise en marché** trop longs pour les cas Open Banking, paiements temps réel et partenariats.

### 1.3 Objectif du présent appel d'offres

BBQ souhaite **consolider la gestion de l'ensemble de ses API sur une plateforme unique d'entreprise** capable de gouverner de façon cohérente :

- les **API internes** (entre domaines applicatifs et systèmes cœur) ;
- les **API partenaires (B2B)** (fintechs, courtiers d'assurance, agrégateurs) ;
- les **API publiques** (développeurs tiers, agrégateurs accrédités Open Banking) ;

tout en **maîtrisant le risque, la conformité et la souveraineté des données**, et en accélérant la mise en marché par un portail développeur self-service gouverné.

### 1.4 Objectifs d'affaires mesurables (cibles indicatives — *à confirmer en phase de cadrage*)

| # | Objectif d'affaires | Indicateur de résultat visé |
|---|---|---|
| OA1 | Unifier la gouvernance d'API | Un **plan de gouvernance unique** pilotant 100 % des gateways d'entreprise |
| OA2 | Garantir la souveraineté | 100 % des **données réglementées** traitées par des gateways résidentes au Canada, clés sous contrôle client (BYOK/HYOK) |
| OA3 | Accélérer la mise en marché | Réduction substantielle du délai de publication d'une API partenaire *(cible à chiffrer en PoC)* |
| OA4 | Renforcer la posture de sécurité | Couverture des contrôles **OWASP API Security Top 10** et application Zero Trust à chaque appel |
| OA5 | Démontrer la conformité | Production de **pistes d'audit immuables** et de tableaux de bord prêts pour le BSIF, SOC 2 et PCI-DSS |
| OA6 | Maîtriser le TCO | **Modèle de licence prévisible** à l'échelle pancanadienne et réduction du verrouillage fournisseur |

---

## 2. Profil de l'organisation et contraintes

### 2.1 Profil de l'organisation (données de simulation)

| Attribut | Valeur |
|---|---|
| Raison sociale | Banque Boréale du Québec (BBQ) — *fictive* |
| Secteur | Services financiers — bancassurance (banque de détail, gestion de patrimoine, filiale d'assurance de dommages) |
| Effectif | ~14 500 employés |
| Clientèle | ~3,2 M de clients particuliers et entreprises |
| Actif sous gestion | ~220 G$ CA |
| Siège social | Montréal, présence pancanadienne |
| Nature | Institution financière fédérale sous charte + activités d'assurance |

### 2.2 Contraintes d'architecture — déploiement hybride strict

Le déploiement attendu est **hybride strict**, avec une séparation nette entre plan de contrôle et plans de données :

- **Plan de contrôle (control plane), portail développeur et analytique** : peuvent résider dans un **cloud souverain canadien** (régions Canada Centre / Est) **OU** **on-prem**.
- **Plans de données (data planes / gateways)** : déployables **là où circulent les données réglementées** :
  - **data centers privés au Québec / Ontario** pour les charges sensibles (PII, données de paiement, données d'assurance) ;
  - **gateways en cloud canadien** pour les charges publiques / partenaires ;
  - **gateways en périphérie** (succursales, DMZ).
- **Survivabilité** : fonctionnement en **mode dégradé / déconnecté** du control plane (les gateways doivent continuer d'appliquer leurs politiques même si le plan de contrôle est injoignable).
- **Chiffrement avec clés gérées par le client** : **BYOK / HYOK** exigés.
- **Portabilité multi-cloud** : éviter le verrouillage à une infrastructure unique.

### 2.3 Contraintes réglementaires et de souveraineté

Le marché cible une institution financière canadienne. Les soumissionnaires doivent démontrer leur alignement avec le cadre réglementaire suivant :

| # | Cadre réglementaire / normatif | Portée pour le présent marché |
|---|---|---|
| R1 | **BSIF/OSFI — Ligne directrice B-13** | Gestion du risque lié aux technologies et au cyberrisque |
| R2 | **BSIF/OSFI — Ligne directrice B-10** | Gestion du risque lié aux tiers / fournisseurs |
| R3 | **BSIF/OSFI — B-2 / E-21** | Résilience opérationnelle (continuité, RTO/RPO) |
| R4 | **Loi 25 (Québec)** | Protection des renseignements personnels, consentement |
| R5 | **LPRPDE / PIPEDA** | Loi fédérale sur la protection des renseignements personnels |
| R6 | **PCI-DSS v4.0** | Données de cartes de paiement |
| R7 | **SOC 2 Type II** | Sécurité, disponibilité, confidentialité |
| R8 | **Résidence et souveraineté des données au Canada** | Contrôle d'accès extraterritorial / risque *Cloud Act* |
| R9 | **Cadre canadien du système bancaire ouvert + Paiements Canada** | Open Banking, RTR, ISO 20022 |
| R10 | **AMF — Autorité des marchés financiers du Québec** | Régulation de la filiale d'assurance |

> **Note d'intégrité.** L'interprétation opérationnelle de ces cadres (notamment l'horizon exact d'entrée en vigueur du système bancaire ouvert canadien et certaines modalités de mise en œuvre) est **« à vérifier »** au moment de la réponse. Les soumissionnaires doivent indiquer leurs sources et la date de validité de leurs affirmations.

### 2.4 Principes directeurs imposés au marché

1. **Souveraineté d'abord** : aucune donnée réglementée ne quitte le périmètre canadien sans contrôle ; clés cryptographiques sous maîtrise du client.
2. **Zero Trust par défaut** : authentification et autorisation vérifiées à chaque appel, sur l'ensemble du parc.
3. **Conformité par conception** : les politiques de résidence, de classification et de conformité sont appliquées automatiquement **avant** toute mise en production.
4. **Survivabilité opérationnelle** : un plan de contrôle indisponible ne doit jamais interrompre le trafic d'API critique.
5. **Portabilité et anti-verrouillage** : architecture multi-cloud, standards ouverts (OpenAPI, AsyncAPI, OpenTelemetry, OAuth2/OIDC).

---

## 3. Périmètre et cas d'usage

Le présent appel d'offres est **centré sur les dix cas d'usage suivants**. La solution proposée sera principalement évaluée à l'aune de sa capacité à les couvrir de bout en bout, dans le respect des contraintes hybrides et réglementaires de la section 2.

### UC1 — Exposition gouvernée d'API Open Banking / système bancaire ouvert

Publier des API conformes au futur cadre canadien d'open banking et aux normes d'agrégateurs / fintechs accréditées, avec **consentement client explicite et révocable**. La plateforme doit appliquer les **politiques de sécurité FAPI**, un **consentement granulaire** et la **traçabilité du partage de données** conformément à la Loi 25. Le périmètre inclut l'enregistrement des consommateurs accrédités, la gestion du cycle de vie du consentement et l'horodatage probant de chaque partage.

### UC2 — Passerelle de paiements temps réel (RTR / ISO 20022)

Médier et sécuriser les **API d'initiation et de statut de paiement** raccordées au **Real-Time Rail de Paiements Canada** et aux flux **ISO 20022**. La gateway doit garantir une **faible latence**, l'**idempotence** des requêtes, la **limitation de débit** et la **résidence des données de transaction au Canada**. Le comportement sous charge de pointe (pics de paiements) est un critère discriminant.

### UC3 — Portail partenaires et marketplace B2B pour fintechs et courtiers

Offrir un **portail développeur self-service** permettant aux partenaires (fintechs, courtiers d'assurance, agrégateurs) de **découvrir, demander et s'abonner** aux API avec **approbation gouvernée**. Le périmètre couvre la gestion du cycle de vie des accès, des **clés / credentials** et des **plans de quota par partenaire**, ainsi que la ségrégation contractuelle des environnements partenaires.

### UC4 — Façade d'API devant le mainframe et les systèmes cœur

Exposer de manière **sécurisée et standardisée (REST/JSON)** les fonctions des systèmes hérités (**mainframe, core bancaire, polices d'assurance**) **sans réécriture**. La plateforme doit assurer la **transformation de protocole**, la **mise en cache** et la **protection contre la surcharge** des systèmes cœur fragiles (limitation, circuit breaker, dégradation contrôlée).

### UC5 — Sécurisation centralisée de l'authentification et de l'autorisation des API

Centraliser l'application des politiques **OAuth2 / OIDC, mTLS, validation de jetons** et **autorisation fine** (scopes, claims) sur l'ensemble du parc d'API internes et externes. Le périmètre inclut l'**intégration à l'IAM d'entreprise** et l'application cohérente du **Zero Trust** à chaque appel, avec révocation et rotation maîtrisées.

### UC6 — Protection contre les menaces et détection d'abus sur les API

Détecter et bloquer les attaques de la catégorie **OWASP API Security Top 10** (injection, **BOLA**, abus de logique métier, **bourrage d'identifiants**). Le périmètre couvre la **limitation de débit adaptative**, la **géo-restriction**, la **détection d'anomalies** et la **mise en quarantaine** des consommateurs malveillants en bordure, avec remontée vers le SIEM.

### UC7 — Observabilité, traçabilité et audit de bout en bout

Collecter **métriques, journaux et traces distribuées (OpenTelemetry)** corrélés par appel d'API à travers les environnements hybrides. Le périmètre inclut la production de **pistes d'audit immuables** et de **tableaux de bord de conformité** exploitables lors des examens du BSIF et des audits **SOC 2 / PCI-DSS**, avec rétention conforme et intégrité démontrable.

### UC8 — API et streaming événementiels (event-driven / webhooks)

Gouverner les **API asynchrones et événementielles** (**Kafka, AsyncAPI, webhooks sortants**) pour les notifications de transactions, les alertes de fraude et la synchronisation inter-systèmes. La plateforme doit **cataloguer, sécuriser et appliquer des politiques** aux flux d'événements **au même titre que les API REST** (authentification, quotas, schéma, résidence).

### UC9 — Gouvernance du cycle de vie des API et conformité par conception

Imposer un **catalogue d'entreprise**, des **standards de design** (**linting OpenAPI**), des **portes de qualité et de sécurité** dans les pipelines **CI/CD**, et la **gestion des versions / dépréciations**. Les **politiques de gouvernance** (résidence, classification de données, conformité) sont **appliquées automatiquement avant toute mise en production**, en bloquant les non-conformités à la source.

### UC10 — Médiation et gouvernance des API pour l'IA et les agents

Exposer et sécuriser des **API et outils** (y compris **serveurs MCP / API d'agents**) consommés par des assistants IA internes et des applications GenAI, avec **passerelle LLM**, **contrôle des jetons**, **masquage des PII** et **limitation des coûts**. Le périmètre couvre l'application de **garde-fous**, l'**audit des prompts / réponses** et la **prévention de fuite de données réglementées** vers les modèles.

> **Couverture des cas d'usage.** La réponse devra présenter, pour chaque UC, le niveau de couverture (natif / par configuration / par développement / non couvert), les preuves publiques mobilisées et toute réserve marquée **« à vérifier »**.

---

## 4. Exigences (synthèse par familles)

Cette section résume les exigences par familles. **La matrice détaillée des exigences, avec niveaux d'obligation (Obligatoire / Important / Souhaité), constitue l'annexe A2.** En cas de divergence, l'annexe A2 fait foi.

| Famille | Réf. | Périmètre de la famille | UC principaux | Critère(s) lié(s) |
|---|---|---|---|---|
| Fonctionnelles (cœur API) | EF | Médiation/transformation REST, SOAP, GraphQL, gRPC ; routage ; cache ; composition/orchestration ; support legacy/mainframe ; versions ; cycle de vie complet (design → dépréciation) | UC4, UC5 | C4, C5 |
| Architecture / hybride | EA | Séparation control plane / data plane ; gateways multi-environnements (on-prem, cloud souverain, périphérie) pilotées par un plan unique ; **survivabilité déconnectée** ; portabilité multi-cloud ; HA ; **RTO/RPO** conformes B-13/B-10/E-21 | Tous | C3 |
| Sécurité | ES | OAuth2/OIDC/mTLS/FAPI/JWT ; OWASP API Top 10 ; limitation adaptative ; gestion des secrets ; chiffrement en transit et au repos ; **BYOK/HYOK** ; Zero Trust | UC1, UC5, UC6 | C1 |
| Conformité / souveraineté | EC | **Résidence des données au Canada** ; conformité démontrable BSIF (B-13, B-10), Loi 25, LPRPDE, PCI-DSS v4.0, SOC 2 Type II ; **pistes d'audit immuables** ; consentement ; classification ; garanties anti-extraterritorialité | UC1, UC2, UC7 | C2 |
| Performance | EP | Débit (req/s) ; latence ajoutée par la gateway ; comportement sous charge de pointe (paiements temps réel) ; scalabilité horizontale ; empreinte ressources ; tests reproductibles | UC2, UC4 | C6 |
| Observabilité | EO | Métriques/journaux/**traces distribuées (OpenTelemetry)** ; corrélation cross-environnements ; intégration SIEM/APM ; tableaux de bord temps réel ; alerting ; qualité des pistes d'audit | UC6, UC7 | C7 |
| Événementiel | EE | Gouvernance API asynchrones/événementielles (**Kafka, AsyncAPI, MQTT, webhooks sortants**) ; catalogage et sécurisation des flux ; politiques par topic ; intégration messagerie/streaming d'entreprise | UC8 | C8 |
| IA / agentique | EIA | **Passerelle LLM/AI** (contrôle jetons/coûts, garde-fous, masquage PII) ; support **serveurs MCP** et API d'agents ; audit prompts/réponses ; prévention de fuite ; assistance IA à la conception/découverte | UC10 | C9 |
| Expérience développeur | EDX | Portail développeur (interne et partenaires) ; documentation interactive ; **bac à sable** ; onboarding self-service gouverné ; génération de **SDK** ; gestion clés/abonnements ; ergonomie | UC3 | C10 |
| Exploitation / TCO | ETCO | **TCO 5 ans** (licences, infra, exploitation) ; prévisibilité et transparence du modèle de tarification ; risque de **verrouillage fournisseur** ; maturité de l'écosystème (connecteurs, support, communauté, pérennité) | Tous | C11 |

### 4.1 Exigences transversales obligatoires (extraits — voir A2 pour le détail)

- **EX-01 (Souveraineté).** Toute donnée classée réglementée doit être traitée exclusivement par des gateways résidentes au Canada, avec clés sous contrôle client (BYOK/HYOK). *Obligatoire.*
- **EX-02 (Survivabilité).** Les gateways doivent continuer d'appliquer authentification, autorisation et quotas en cas de perte du control plane, avec resynchronisation automatique au rétablissement. *Obligatoire.*
- **EX-03 (Auditabilité).** Les pistes d'audit doivent être immuables, horodatées et exportables vers le SIEM, avec intégrité vérifiable. *Obligatoire.*
- **EX-04 (Standards ouverts).** Support natif d'OpenAPI, AsyncAPI, OAuth2/OIDC, OpenTelemetry pour limiter le verrouillage. *Obligatoire.*
- **EX-05 (Conformité par conception).** Blocage automatisé, dans le pipeline CI/CD, de toute API non conforme aux politiques de résidence et de classification avant mise en production. *Obligatoire.*

> Le détail complet (identifiants d'exigence, libellés, niveaux d'obligation, modalités de preuve) figure en **annexe A2 — Matrice des exigences**.

---

## 5. Critères d'évaluation et pondération

L'évaluation est conduite sur **100 points**, répartis selon les onze critères ci-dessous. **La grille d'évaluation détaillée (barème /100, sous-critères et règles de notation) constitue l'annexe A1.** La présente section en donne la synthèse pondérée.

| Code | Critère | Thème | Pondération |
|---|---|---|---:|
| **C1** | Sécurité des API et protection contre les menaces | Sécurité | **12** |
| **C2** | Conformité réglementaire et souveraineté des données | Conformité | **13** |
| **C3** | Architecture hybride, portabilité et résilience | Architecture | **12** |
| **C4** | Capacités fonctionnelles cœur de gestion des API | Fonctionnel | **11** |
| **C5** | Gouvernance du cycle de vie et catalogue d'entreprise | Fonctionnel | **9** |
| **C6** | Performance, scalabilité et faible latence | Performance | **7** |
| **C7** | Observabilité, monitoring et auditabilité opérationnelle | Observabilité | **7** |
| **C8** | Support de l'API événementielle et du streaming | Événementiel | **6** |
| **C9** | Capacités IA, agentique et passerelle LLM | IA | **7** |
| **C10** | Expérience développeur et portail self-service | Expérience dév. | **8** |
| **C11** | Coût total de possession, modèle de licence et écosystème | Coût | **8** |
| | **Total** | | **100** |

### 5.1 Description des critères

- **C1 — Sécurité (12).** Robustesse de l'authentification/autorisation (OAuth2, OIDC, mTLS, FAPI, JWT), protection contre l'OWASP API Security Top 10, limitation de débit adaptative, gestion des secrets, chiffrement en transit et au repos, support **BYOK/HYOK**, alignement Zero Trust.
- **C2 — Conformité et souveraineté (13).** Résidence des données au Canada, conformité démontrable au BSIF (B-13, B-10), Loi 25, LPRPDE, PCI-DSS v4.0 et SOC 2 Type II, pistes d'audit immuables, gestion du consentement, classification des données, garanties contre l'accès extraterritorial. *(Critère le plus pondéré.)*
- **C3 — Architecture hybride (12).** Séparation plan de contrôle / plan de données, déploiement de gateways multi-environnements pilotées par un plan de gouvernance unique, **survivabilité en mode déconnecté**, portabilité multi-cloud, haute disponibilité, atteinte des RTO/RPO.
- **C4 — Cœur fonctionnel (11).** Richesse de la médiation/transformation (REST, SOAP, GraphQL, gRPC), routage, mise en cache, composition/orchestration, support du legacy/mainframe, gestion des versions, couverture complète du cycle de vie.
- **C5 — Gouvernance et catalogue (9).** Catalogue/registre d'entreprise, application de standards de design (linting OpenAPI), intégration CI/CD (GitOps, portes qualité/sécurité), automatisation des politiques de conformité par conception, contrôle des dépréciations et de la dette d'API.
- **C6 — Performance (7).** Débit (req/s), latence ajoutée par la gateway, comportement sous charge de pointe (paiements temps réel), scalabilité horizontale, empreinte ressources, tests reproductibles à l'échelle pancanadienne.
- **C7 — Observabilité (7).** Collecte de métriques/journaux/traces distribuées (OpenTelemetry), corrélation cross-environnements, intégration SIEM/APM, tableaux de bord temps réel, alerting, qualité des pistes d'audit.
- **C8 — Événementiel (6).** Gouvernance des API asynchrones/événementielles (Kafka, AsyncAPI, MQTT, webhooks sortants), catalogage et sécurisation des flux, politiques par topic, intégration messagerie/streaming.
- **C9 — IA / agentique (7).** Passerelle LLM/AI (contrôle jetons/coûts, garde-fous, masquage PII), support des serveurs MCP et API d'agents, audit prompts/réponses, prévention de fuite, assistance IA à la conception/découverte.
- **C10 — Expérience développeur (8).** Qualité du portail (interne et partenaires), documentation interactive, bac à sable, onboarding self-service gouverné, génération de SDK, gestion clés/abonnements, ergonomie.
- **C11 — TCO et écosystème (8).** TCO 5 ans (licences, infra, exploitation), prévisibilité/transparence de la tarification à l'échelle, risque de verrouillage, maturité de l'écosystème (intégrations, connecteurs, support, communauté, pérennité).

### 5.2 Lecture des pondérations

La pondération privilégie nettement les enjeux de **souveraineté/conformité (C2 — 13)**, de **sécurité (C1 — 12)** et d'**architecture hybride résiliente (C3 — 12)** : ces trois critères totalisent **37 points sur 100**, traduisant la priorité stratégique de BBQ pour le risque réglementaire et la maîtrise des données. Les capacités fonctionnelles cœur et de gouvernance (**C4 + C5 = 20**) constituent le deuxième bloc. Les critères différenciants émergents (**C9 — IA**, **C8 — événementiel**) sont pondérés à leur juste poids d'évolution sans dominer la décision.

> **Renvoi.** Le barème détaillé, la grille de notation par sous-critère et les règles de seuils éliminatoires figurent en **annexe A1 — Grille d'évaluation**.

---

## 6. Calendrier indicatif et processus

### 6.1 Processus d'acquisition

L'appel d'offres se déroule en **cinq étapes**, avec une **preuve de concept (PoC)** réservée aux finalistes :

1. **Émission du RFP et période de questions** — diffusion du dossier (document principal + annexes A1, A2, A3), recueil des questions des soumissionnaires et publication des réponses consolidées.
2. **Réception des réponses** — dépôt des réponses selon les **modalités de l'annexe A3** (matrice A2 renseignée, dossier technique, dossier de conformité, proposition de prix indicative).
3. **Évaluation initiale (sur dossier)** — notation selon la grille A1 ; vérification des seuils obligatoires (notamment souveraineté, survivabilité, auditabilité) ; établissement d'une **liste restreinte de finalistes**.
4. **Preuve de concept (PoC) des finalistes** — déploiement encadré sur un sous-ensemble représentatif des cas d'usage, en environnement hybride simulé, avec scénarios imposés (voir 6.3).
5. **Évaluation finale et recommandation** — consolidation des notes dossier + PoC, analyse du TCO, due diligence fournisseur (B-10), recommandation d'attribution.

### 6.2 Calendrier indicatif (*jalons à confirmer*)

| Jalon | Étape | Échéance indicative |
|---|---|---|
| J0 | Émission du RFP | Semaine 0 |
| J1 | Clôture de la période de questions | Semaine 2 |
| J2 | Publication des réponses aux questions | Semaine 3 |
| J3 | Clôture de réception des réponses | Semaine 6 |
| J4 | Communication de la liste restreinte | Semaine 8 |
| J5 | Fenêtre de PoC des finalistes | Semaines 9 à 13 |
| J6 | Évaluation finale et recommandation | Semaine 15 |
| J7 | Décision d'attribution | Semaine 16 |

> Toutes les échéances ci-dessus sont **indicatives** et **« à confirmer »** lors du cadrage final. BBQ se réserve le droit d'ajuster le calendrier.

### 6.3 Cadre de la preuve de concept (PoC) des finalistes

La PoC vise à **vérifier sur le terrain** les affirmations des soumissionnaires. Scénarios imposés (échantillon) :

- **PoC-A (Souveraineté + survivabilité, C2/C3).** Déployer un data plane résident au Canada avec BYOK/HYOK, puis simuler une coupure du control plane et démontrer la **continuité d'application des politiques** (mode déconnecté) et la resynchronisation.
- **PoC-B (Paiements temps réel, C2/C6).** Exposer une API d'initiation de paiement façon RTR/ISO 20022 et mesurer **latence ajoutée, idempotence et tenue sous charge de pointe**.
- **PoC-C (Façade mainframe, C4).** Médier un service legacy (SOAP/cœur) en REST/JSON avec transformation, cache et **protection contre la surcharge**.
- **PoC-D (Sécurité API, C1/C6).** Démontrer la couverture de scénarios **OWASP API Top 10** (dont BOLA et bourrage d'identifiants) et la limitation adaptative.
- **PoC-E (Portail partenaires, C10).** Onboarding self-service gouverné d'un partenaire fictif avec abonnement, quotas et **bac à sable**.
- **PoC-F (Observabilité + audit, C7/C2).** Corrélation OpenTelemetry cross-environnements et production d'une **piste d'audit immuable** exploitable pour un examen réglementaire.
- **PoC-G (Passerelle IA, C9).** Médiation d'une API/outil consommé par un assistant IA (serveur MCP) avec **masquage des PII**, garde-fous et audit des prompts/réponses.

Chaque scénario est noté selon les sous-critères correspondants de l'annexe A1. Les **preuves produites en PoC priment sur les déclarations sur dossier**.

### 6.4 Règles de transparence et d'intégrité du processus

- Les **prix communiqués** demeurent **indicatifs et non contractuels** dans le cadre de cette simulation.
- Tout élément de réponse **non vérifiable publiquement** ou **postérieur à juin 2026** doit être marqué **« à vérifier »** par le soumissionnaire.
- BBQ peut demander des **clarifications écrites** sans rouvrir la concurrence sur le fond.
- La **due diligence fournisseur** (conformité B-10 : sous-traitance, localisation, continuité, sécurité de la chaîne d'approvisionnement) est intégrée à l'évaluation finale.

---

## 7. Annexes

Le présent document principal est complété par trois annexes, qui en font partie intégrante :

| Annexe | Titre | Objet | Statut |
|---|---|---|---|
| **A1** | **Grille d'évaluation** | Barème détaillé /100, sous-critères et règles de notation des onze critères C1 à C11 (voir §5) | Référencée |
| **A2** | **Matrice des exigences** | Liste détaillée des exigences par familles (§4), avec identifiants, niveaux d'obligation (Obligatoire / Important / Souhaité) et modalités de preuve | Référencée |
| **A3** | **Modalités de réponse** | Format de dépôt, structure attendue de la réponse, pièces exigées, règles de marquage « à vérifier », calendrier de remise | Référencée |

> **Précédence documentaire.** En cas de divergence d'interprétation : pour les exigences, l'**annexe A2** fait foi ; pour la notation, l'**annexe A1** fait foi ; pour les modalités de dépôt, l'**annexe A3** fait foi. Le présent document principal prévaut pour le contexte, le périmètre et les principes directeurs.

---

*Fin du document principal — RFP-BBQ-APIM-2026. Organisation cliente fictive ; réponses simulées à partir de capacités produit publiques vérifiées (juin 2026) ; prix indicatifs et non contractuels ; éléments incertains marqués « à vérifier ».*
