# ANNEXE A2 — MATRICE DES EXIGENCES

**RFP — Plateforme unifiée de gestion des API d'entreprise (API Management)**
**Commanditaire : Banque Boréale du Québec (BBQ) — institution financière fédérale sous charte, bancassurance**
**Profil : grande institution financière (FSI), déploiement hybride strict, souveraineté des données au Canada**
**Version : 1.0 — juin 2026**

---

## Cadre d'intégrité et avertissements

Le présent document est une annexe contractuelle de l'appel d'offres. Il est régi par le cadre d'intégrité suivant, à rappeler dans tout document dérivé ou toute réponse fournisseur :

- **Organisation cliente fictive.** La « Banque Boréale du Québec (BBQ) » est un profil de travail **fictif** construit pour cadrer l'appel d'offres. Aucune donnée réelle d'un établissement financier nommé n'est utilisée, et toute ressemblance avec une institution existante est fortuite.
- **Réponses fournisseurs simulées.** Lorsque la présente matrice ou ses annexes caractérisent les capacités d'un produit, ces caractérisations sont **simulées à partir de capacités produit publiques** (documentation éditeur, communiqués, analyses sectorielles) vérifiées à la date de **juin 2026**. Elles ne constituent pas des réponses formelles des éditeurs et n'engagent pas ces derniers.
- **Prix indicatifs et non contractuels.** Tout ordre de grandeur tarifaire éventuel est purement **indicatif**, soumis à négociation, et **non contractuel**.
- **Mention « à vérifier ».** Les éléments sensibles au temps, postérieurs à la connaissance consolidée de l'auteur, ou incertains — notamment le calendrier et le contenu définitif du **cadre canadien du système bancaire ouvert (Open Banking)** et de la norme **RTR / ISO 20022** de Paiements Canada — sont explicitement marqués **(à vérifier)**.
- **Portée de la matrice.** La présente annexe énonce les exigences. La pondération d'évaluation, la grille de notation et les seuils éliminatoires sont traités à l'annexe d'évaluation (hors A2). Les exigences obligatoires non satisfaites sont, sauf mention contraire au corps du RFP, **potentiellement éliminatoires**.

---

## 1. Mode d'emploi de la matrice

### 1.1 Familles d'exigences

| Code | Famille | Objet |
|---|---|---|
| **EF** | Fonctionnelles | Capacités de la plateforme : passerelle, portail, cycle de vie, médiation, IA/MCP, événementiel. |
| **EA** | Architecture / hybride / déploiement | Topologie, plan de contrôle / plan de données, survivabilité, multi-cloud, portabilité. |
| **ES** | Sécurité | Authentification, autorisation, mTLS, protection des menaces API, secrets, Zero Trust, chiffrement. |
| **EC** | Conformité / souveraineté | Résidence des données, BYOK/HYOK, auditabilité, exigences BSIF/Loi 25/PCI-DSS/SOC 2, AMF. |
| **EN** | Non fonctionnelles | Performance, disponibilité, RTO/RPO, observabilité, exploitabilité, support, TCO. |

### 1.2 Niveaux de priorité

| Niveau | Signification | Conséquence attendue |
|---|---|---|
| **Obligatoire** | Exigence impérative. La capacité doit être native ou contractuellement garantie à la mise en service. | Non-satisfaction = écart majeur, potentiellement éliminatoire. |
| **Importante** | Exigence à forte valeur. Attendue de série ; une feuille de route datée et engageante peut être recevable. | Non-satisfaction = écart pondéré significatif. |
| **Souhaitée** | Exigence de différenciation. Apporte un avantage concurrentiel sans être bloquante. | Non-satisfaction = écart mineur. |

### 1.3 Conventions de réponse fournisseur

Pour chaque exigence, le fournisseur indique un **niveau de conformité** : **C** (conforme nativement), **CP** (conforme partiellement / par configuration), **R** (sur feuille de route, avec date), **T** (par un tiers / module additionnel), **NC** (non conforme). Toute réponse C/CP/R/T doit renvoyer à une preuve (documentation, démonstration, référence client comparable, attestation). Les colonnes de réponse sont fournies à l'annexe A2-bis (gabarit de réponse) et omises ici pour la lisibilité.

### 1.4 Traçabilité aux cas d'usage

La colonne **UC** relie chaque exigence aux cas d'usage du corps du RFP : UC1 Open Banking ; UC2 Paiements temps réel (RTR/ISO 20022) ; UC3 Portail partenaires / marketplace B2B ; UC4 Façade mainframe / systèmes cœur ; UC5 AuthN/AuthZ centralisées ; UC6 Protection des menaces API ; UC7 Observabilité / audit ; UC8 Événementiel / webhooks ; UC9 Gouvernance du cycle de vie ; UC10 Médiation IA / MCP.

---

## 2. EF — Exigences fonctionnelles

### 2.1 Passerelle, médiation et cycle de vie

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EF-01 | La plateforme expose une **passerelle API (gateway)** prenant en charge REST/JSON, HTTP/1.1 et HTTP/2, et la médiation **REST ⇄ SOAP** sans réécriture du back-end. | Obligatoire | UC4 |
| EF-02 | La passerelle réalise la **transformation de protocole et de charge utile** (XML⇄JSON, en-têtes, mappage de champs) configurable par politique déclarative, sans recompilation. | Obligatoire | UC4 |
| EF-03 | La plateforme fournit un **catalogue d'entreprise** centralisé recensant l'ensemble des API (internes, partenaires, publiques), avec métadonnées de classification de données et propriétaire responsable. | Obligatoire | UC9 |
| EF-04 | La plateforme gère le **cycle de vie complet** d'une API : conception, publication, versionnage sémantique, dépréciation planifiée et retrait, avec gestion de plusieurs versions simultanées et stratégies de routage (canary, blue/green). | Obligatoire | UC9 |
| EF-05 | La plateforme applique des **standards de design** par **linting OpenAPI 3.x** (règles de nommage, sécurité, classification) bloquant la publication non conforme. | Importante | UC9 |
| EF-06 | La plateforme s'intègre aux pipelines **CI/CD** (GitOps, API-as-code) avec **portes de qualité et de sécurité** automatisées avant promotion en production. | Importante | UC9 |
| EF-07 | La passerelle assure la **mise en cache** de réponses (TTL, invalidation, clés de cache configurables) pour protéger les systèmes cœur fragiles. | Obligatoire | UC4 |
| EF-08 | La passerelle applique des mécanismes de **protection de charge** des back-ends : disjoncteur (circuit breaker), repli (fallback), cloisonnement (bulkhead), limitation de concurrence vers l'amont. | Obligatoire | UC4 |
| EF-09 | La plateforme prend en charge l'**idempotence** (clé d'idempotence, déduplication des requêtes) pour les opérations d'écriture, en particulier les initiations de paiement. | Obligatoire | UC2 |
| EF-10 | La passerelle impose **limitation de débit (rate limiting)** et **quotas** par consommateur, par API, par plan, et par clé/credential, avec fenêtres glissantes et seuils différenciés. | Obligatoire | UC2, UC3, UC6 |
| EF-11 | La plateforme prend en charge l'**agrégation / composition d'API** (orchestration légère, GraphQL en façade — souhaité) sans héberger de logique métier lourde. | Souhaitée | UC4 |

### 2.2 Portail développeur, partenaires et marketplace

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EF-12 | La plateforme fournit un **portail développeur self-service** permettant la découverte, l'essai (bac à sable / sandbox), la documentation interactive et l'abonnement aux API. | Obligatoire | UC3 |
| EF-13 | Le portail prend en charge des **flux d'abonnement gouvernés** avec workflow d'approbation multi-niveaux (demande → revue → approbation → provisionnement). | Obligatoire | UC3 |
| EF-14 | La plateforme gère le **cycle de vie des credentials partenaires** (clés API, secrets client, certificats mTLS) : émission, rotation, révocation, expiration, avec libre-service encadré. | Obligatoire | UC3, UC5 |
| EF-15 | La plateforme définit des **plans de quota / niveaux de service (tiers)** différenciés par partenaire (fintech, courtier d'assurance, agrégateur) avec application au niveau de la passerelle. | Obligatoire | UC3 |
| EF-16 | Le portail est **personnalisable** (marque BBQ, thèmes, multi-organisation/multi-tenant pour cloisonner les partenaires) et **bilingue français/anglais**. | Importante | UC3 |
| EF-17 | La plateforme prend en charge des fonctions de **monétisation / refacturation** (plans tarifaires, mesure d'usage, rapports de consommation par partenaire), exploitables sans développement spécifique. | Souhaitée | UC3 |

### 2.3 Open Banking, consentement et paiements

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EF-18 | La plateforme permet l'**exposition d'API conformes au profil FAPI** (FAPI 2.0 / Security Profile) requis pour l'open banking. **(Le profil canadien définitif est à vérifier.)** | Obligatoire | UC1 |
| EF-19 | La plateforme prend en charge un **mécanisme de consentement client granulaire, explicite et révocable** (gestion des autorisations de partage, durée, périmètre de données), traçable conformément à la Loi 25. | Obligatoire | UC1 |
| EF-20 | La plateforme assure la **traçabilité du partage de données** (qui a consenti, à quel agrégateur, pour quelles données, sur quelle période) avec piste d'audit exploitable. | Obligatoire | UC1, UC7 |
| EF-21 | La passerelle prend en charge la médiation des **API d'initiation et de statut de paiement** raccordées au **Real-Time Rail (RTR)** de Paiements Canada et aux flux **ISO 20022**. **(Spécifications RTR définitives à vérifier.)** | Obligatoire | UC2 |
| EF-22 | La plateforme prend en charge la **validation de schéma** (request/response) stricte des messages ISO 20022 et OpenAPI, avec rejet des charges non conformes. | Obligatoire | UC2, UC6 |

### 2.4 Événementiel, streaming et webhooks

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EF-23 | La plateforme **catalogue et gouverne les API asynchrones** via le standard **AsyncAPI**, au même titre que les API REST (publication, versionnage, découverte au portail). | Importante | UC8 |
| EF-24 | La plateforme assure la **médiation et la sécurisation des flux événementiels** (Apache Kafka et, souhaité, MQTT / WebSockets / SSE) avec application de politiques (authz, débit, transformation). | Importante | UC8 |
| EF-25 | La plateforme gère des **webhooks sortants** gouvernés (souscription, signature des messages, nouvelles tentatives, file d'attente de lettres mortes / DLQ) pour notifications de transaction et alertes de fraude. | Importante | UC8 |
| EF-26 | La plateforme applique aux flux d'événements les mêmes **contrôles de sécurité et de classification de données** que les API synchrones (chiffrement, autorisation, journalisation, résidence). | Obligatoire | UC8 |

### 2.5 Médiation IA / MCP

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EF-27 | La plateforme fournit une **passerelle IA / LLM (AI gateway)** : routage multi-modèles, limitation par jetons (tokens), mise en cache sémantique, attribution de coût par requête. **(Maturité à confirmer par démonstration.)** | Importante | UC10 |
| EF-28 | La plateforme gouverne le **protocole MCP (Model Context Protocol)** et/ou l'exposition d'outils/API consommés par des agents : enregistrement, application de politiques, journalisation des invocations. **(à vérifier selon l'éditeur.)** | Importante | UC10 |
| EF-29 | La passerelle IA applique des **garde-fous (guardrails)** : masquage / caviardage des PII et données réglementées dans les prompts et réponses, filtrage de contenu, prévention de fuite de données (DLP). | Obligatoire | UC10 |
| EF-30 | La passerelle IA permet l'**audit des prompts et réponses** et l'**attribution de coût / plafonds budgétaires** par application, équipe ou clé, avec alerte au dépassement. | Importante | UC10 |

---

## 3. EA — Exigences d'architecture, d'hybridation et de déploiement

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EA-01 | La plateforme sépare nettement **plan de contrôle (control plane)** et **plans de données (data planes / gateways)**, déployables et exploités indépendamment. | Obligatoire | UC1–UC10 |
| EA-02 | Le **plan de contrôle, le portail et l'analytique** peuvent résider **soit en cloud souverain canadien** (régions Canada Central / Est), **soit on-premise**, au choix de BBQ, sans perte de fonctionnalité majeure. | Obligatoire | tous |
| EA-03 | Les **plans de données (gateways)** sont déployables **là où circulent les données** : data centers privés (Québec/Ontario) pour les charges sensibles (PII, paiements, assurance), cloud canadien pour les charges publiques/partenaires, et **périphérie** (succursales, DMZ). | Obligatoire | UC2, UC4, UC6 |
| EA-04 | Les gateways fonctionnent en **mode dégradé / déconnecté du plan de contrôle** (survivabilité) : application continue des politiques et du trafic en cas de perte de connectivité au control plane, avec resynchronisation automatique au rétablissement. | Obligatoire | UC2, UC4 |
| EA-05 | La plateforme garantit une **durée maximale documentée de fonctionnement autonome** des gateways sans plan de contrôle, et le comportement précis (fail-open / fail-closed) est **configurable par politique**. | Obligatoire | UC2 |
| EA-06 | La plateforme est déployable en **conteneurs / Kubernetes** (distribution certifiée, Helm/opérateur) et supporte un déploiement **air-gapped** (sans connectivité Internet sortante) pour les zones les plus sensibles. | Obligatoire | UC4 |
| EA-07 | La plateforme assure la **portabilité multi-cloud** (au moins deux fournisseurs cloud canadiens majeurs + on-prem) sans dépendance à des services propriétaires non substituables d'un seul cloud. | Importante | tous |
| EA-08 | La plateforme prend en charge un **déploiement multi-région actif/actif ou actif/passif** au Canada pour la résilience, avec réplication de configuration cohérente entre régions. | Obligatoire | UC2, UC7 |
| EA-09 | La plateforme s'intègre aux **systèmes hérités on-prem** (mainframe, core bancaire, polices d'assurance) via connecteurs ou médiation, **sans réécriture** des systèmes cœur. | Obligatoire | UC4 |
| EA-10 | La plateforme expose une **API d'administration / gestion déclarative complète** (tout ce qui est faisable à la console l'est par API/IaC) permettant l'automatisation et la reproductibilité des déploiements. | Importante | UC9 |
| EA-11 | La plateforme prend en charge un **modèle multi-tenant / multi-organisation** cloisonnant les environnements (interne, partenaires B2B, public) et les unités d'affaires (banque, patrimoine, assurance). | Importante | UC3 |
| EA-12 | Les empreintes de gateway sont **dimensionnables horizontalement** (mise à l'échelle élastique) et disposent d'une **empreinte légère** déployable en périphérie (succursale/DMZ) à ressources contraintes. | Importante | UC6 |
| EA-13 | La stratégie de **mise à niveau / patch** permet des mises à jour **sans interruption de service** (rolling upgrade) des gateways, et la compatibilité ascendante des politiques entre versions est documentée. | Importante | EN |
| EA-14 | La plateforme fournit une **stratégie de sortie / réversibilité** documentée (export des configurations, des définitions d'API et des données dans des formats ouverts) limitant le verrouillage fournisseur. | Importante | driver TCO |

---

## 4. ES — Exigences de sécurité

### 4.1 Authentification, autorisation et identité

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| ES-01 | La passerelle applique de façon centralisée **OAuth2** et **OpenID Connect (OIDC)** : validation de jetons (JWT et opaques via introspection), vérification de signature, d'expiration, d'émetteur et d'audience. | Obligatoire | UC1, UC5 |
| ES-02 | La passerelle applique l'**autorisation fine** par **scopes** et **claims** (attributs du jeton), avec décisions de politique par méthode et par ressource. | Obligatoire | UC5 |
| ES-03 | La passerelle prend en charge le **mTLS (TLS mutuel)** côté consommateur et côté back-end, incluant la validation de chaîne de certificats et la liaison de jeton au certificat (**certificate-bound tokens**, requis par FAPI). | Obligatoire | UC1, UC2, UC5 |
| ES-04 | La plateforme s'intègre à l'**IAM d'entreprise** et aux fournisseurs d'identité externes (SAML 2.0, OIDC) pour l'authentification des consommateurs et des administrateurs. | Obligatoire | UC5 |
| ES-05 | La plateforme applique le principe **Zero Trust** : aucune confiance implicite, vérification de l'identité et de la posture **à chaque appel**, la passerelle agissant comme point d'application de politique (PEP). | Obligatoire | UC5 |
| ES-06 | L'accès **administratif** à la plateforme impose **MFA**, un modèle **RBAC/ABAC** granulaire, la **séparation des tâches** et le moindre privilège. | Obligatoire | EC |
| ES-07 | La plateforme prend en charge l'**autorisation externalisée** (intégration à un moteur de politiques type OPA/PDP externe) pour les décisions d'autorisation complexes. | Souhaitée | UC5 |

### 4.2 Protection contre les menaces API

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| ES-08 | La plateforme protège contre l'ensemble des risques **OWASP API Security Top 10** (notamment BOLA/BFLA, injection, mauvaise configuration de sécurité, consommation illimitée de ressources, abus de logique métier). | Obligatoire | UC6 |
| ES-09 | La passerelle intègre des fonctions de type **WAF / WAAP API** : inspection des charges, protection contre l'injection, validation de schéma stricte, en bordure du trafic. | Obligatoire | UC6 |
| ES-10 | La plateforme applique une **limitation de débit adaptative**, la **géo-restriction** et la **mise en quarantaine** automatique des consommateurs malveillants. | Obligatoire | UC6 |
| ES-11 | La plateforme assure la **détection d'anomalies / d'abus comportementaux** (bourrage d'identifiants, scraping, exfiltration) avec signalement et réponse automatisée. | Importante | UC6 |
| ES-12 | La plateforme s'intègre aux **SIEM/SOC** d'entreprise (export d'événements de sécurité normalisés, p. ex. CEF/JSON, vers le SIEM) en quasi-temps réel. | Obligatoire | UC6, UC7 |
| ES-13 | La plateforme détecte les **API non gouvernées** (shadow / zombie APIs) et signale les écarts par rapport au catalogue d'entreprise. | Souhaitée | UC6, UC9 |

### 4.3 Chiffrement, secrets et clés

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| ES-14 | Toute communication est **chiffrée en transit** par **TLS 1.2 minimum, TLS 1.3 supporté**, avec suites cryptographiques configurables et conformes aux référentiels (désactivation des protocoles/algorithmes obsolètes). | Obligatoire | tous |
| ES-15 | Les **données au repos** gérées par la plateforme (configurations, secrets, journaux, données analytiques) sont **chiffrées** (AES-256 ou équivalent). | Obligatoire | EC |
| ES-16 | La plateforme prend en charge le **chiffrement avec clés gérées par le client (BYOK)** et, pour les charges les plus sensibles, le modèle **HYOK** (clés conservées et opérées hors de la plateforme/du cloud). | Obligatoire | driver souveraineté |
| ES-17 | La plateforme s'intègre à un **gestionnaire de secrets / HSM / KMS** d'entreprise (p. ex. coffre-fort de secrets, HSM certifié) pour le stockage et la rotation des secrets et des clés. | Obligatoire | UC5 |
| ES-18 | La plateforme assure la **rotation automatisée** des secrets, certificats et clés sans interruption de service, avec alerte avant expiration. | Importante | UC5 |
| ES-19 | La plateforme fournit une **feuille de route de cryptographie post-quantique (PQC)** ou la capacité de mise à jour des suites cryptographiques. **(Disponibilité à vérifier.)** | Souhaitée | EC |

---

## 5. EC — Exigences de conformité et de souveraineté

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EC-01 | La plateforme garantit la **résidence des données réglementées au Canada** : les données sensibles (PII, données de paiement, données d'assurance) et leurs traitements ne sortent pas des frontières canadiennes. | Obligatoire | UC1, UC2, UC4 |
| EC-02 | L'éditeur fournit des **garanties contractuelles contre l'accès extraterritorial** aux données (risque Cloud Act), incluant la notification obligatoire de toute demande d'accès et le déploiement sous contrôle exclusif de BBQ pour les charges sensibles. | Obligatoire | driver souveraineté |
| EC-03 | La plateforme produit des **pistes d'audit immuables** (journaux infalsifiables, horodatés, à intégrité vérifiable / append-only) couvrant accès, changements de configuration et décisions de politique. | Obligatoire | UC7 |
| EC-04 | La plateforme génère des **rapports de conformité exploitables** lors des examens du **BSIF** et des audits **SOC 2 / PCI-DSS** (extraction d'évidences, tableaux de bord de contrôle). | Obligatoire | UC7 |
| EC-05 | La solution s'aligne sur la **ligne directrice BSIF B-13** (gestion du risque lié aux technologies et au cyberrisque) : le fournisseur documente la couverture des attentes applicables à une plateforme d'API Management. | Obligatoire | drivers conformité |
| EC-06 | Le fournisseur fournit les éléments nécessaires à l'évaluation **BSIF B-10** (risque lié aux tiers) : sous-traitants, localisation, dépendances, plan de continuité, et soutient l'évaluation de résilience **B-2 / E-21**. | Obligatoire | drivers conformité |
| EC-07 | L'éditeur détient et maintient une **attestation SOC 2 Type II** et fournit les rapports sur demande sous NDA. | Obligatoire | drivers conformité |
| EC-08 | La plateforme prend en charge les exigences **PCI-DSS v4.0** applicables au traitement des données de carte transitant par la passerelle (segmentation, chiffrement, journalisation, contrôle d'accès). | Obligatoire | UC2 |
| EC-09 | La plateforme prend en charge les obligations de la **Loi 25 (Québec)** et de la **LPRPDE / PIPEDA** : minimisation, classification des renseignements personnels, gestion du consentement, traçabilité et capacité de réponse aux droits des personnes. | Obligatoire | UC1 |
| EC-10 | La plateforme permet la **classification des données** au niveau des API et l'application automatique de politiques en fonction de la classification (résidence, masquage, journalisation renforcée). | Obligatoire | UC1, UC9 |
| EC-11 | Les **politiques de gouvernance** (résidence, classification, conformité) sont **appliquées automatiquement avant toute mise en production** (policy-as-code, conformité par conception). | Obligatoire | UC9 |
| EC-12 | La plateforme prend en charge la **rétention et la purge configurables** des journaux et données (durées de conservation alignées sur les obligations réglementaires et les politiques internes). | Importante | UC7 |
| EC-13 | La plateforme soutient les exigences de la **filiale d'assurance (AMF)** : cloisonnement des données d'assurance, traçabilité et gouvernance distincte des API d'assurance. | Importante | UC4 |
| EC-14 | L'éditeur s'engage sur la **localisation du support et de l'exploitation** (équipes et accès opérés depuis le Canada pour les environnements sensibles) ou documente précisément toute exception. **(à vérifier selon l'éditeur.)** | Importante | driver souveraineté |

---

## 6. EN — Exigences non fonctionnelles

### 6.1 Performance et capacité

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EN-01 | La passerelle ajoute une **latence médiane additionnelle ≤ 10 ms** et une **latence p99 ≤ 30 ms** par appel proxifié (hors back-end), mesurée à charge nominale. **(Seuils cibles à valider lors du PoC.)** | Obligatoire | UC2 |
| EN-02 | La plateforme soutient un **débit cible** d'au moins **plusieurs dizaines de milliers de requêtes/seconde** par cluster de gateways, avec montée en charge horizontale linéaire démontrée. **(Volumétrie précise à confirmer au PoC.)** | Obligatoire | UC2, UC6 |
| EN-03 | La plateforme garantit le respect des contraintes de **faible latence et d'idempotence** spécifiques aux flux de paiement temps réel (UC2) sous charge de pointe. | Obligatoire | UC2 |
| EN-04 | La plateforme dégrade ses fonctions de manière **prévisible et contrôlée** sous surcharge (priorisation du trafic critique, délestage gracieux). | Importante | UC2, UC6 |

### 6.2 Disponibilité, résilience, RTO/RPO

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EN-05 | Le **plan de données (gateways)** atteint une **disponibilité ≥ 99,99 %** pour les services critiques (paiements, open banking), en configuration multi-région. | Obligatoire | UC2, UC1 |
| EN-06 | Le **plan de contrôle** atteint une **disponibilité ≥ 99,9 %**, sa défaillance n'interrompant pas le trafic des gateways (cf. EA-04 survivabilité). | Obligatoire | tous |
| EN-07 | La solution permet d'atteindre, pour les services critiques, un **RTO ≤ 1 heure** et un **RPO ≈ 0** (proche de zéro perte) pour la configuration et les données de politique, conformément aux attentes de résilience du BSIF (B-13 / B-2 / E-21). **(Cibles à confirmer par BBQ.)** | Obligatoire | drivers résilience |
| EN-08 | La plateforme prend en charge la **sauvegarde et la restauration** vérifiables de la configuration complète, et le **basculement / reprise** testables (exercices de bascule documentés). | Obligatoire | UC7 |
| EN-09 | Aucun **point unique de défaillance (SPOF)** dans l'architecture de référence ; les composants critiques sont redondés. | Obligatoire | EA |

### 6.3 Observabilité et audit

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EN-10 | La plateforme émet **métriques, journaux et traces distribuées** au standard **OpenTelemetry**, corrélés par appel d'API (identifiant de corrélation propagé) à travers les environnements hybrides. | Obligatoire | UC7 |
| EN-11 | La plateforme s'intègre aux outils d'observabilité d'entreprise (export vers les plateformes de métriques/traces/logs et SIEM, formats ouverts). | Obligatoire | UC7 |
| EN-12 | La plateforme fournit des **tableaux de bord de conformité et d'exploitation** (trafic, erreurs, latence, sécurité, consommation par partenaire) configurables. | Importante | UC7 |
| EN-13 | La plateforme prend en charge des **alertes** configurables (seuils de latence, taux d'erreur, anomalies de sécurité, dépassement de quota/budget) vers les canaux d'exploitation. | Importante | UC6, UC7 |

### 6.4 Exploitation, support et TCO

| ID | Énoncé (vérifiable) | Priorité | UC |
|---|---|---|---|
| EN-14 | La plateforme fournit une **console d'administration unifiée** gouvernant l'ensemble des gateways multi-environnements depuis un **plan de gouvernance unique**. | Obligatoire | EA, UC9 |
| EN-15 | Le fournisseur propose un **support de niveau entreprise** (SLA contractuels, support 24/7, escalade, gestionnaire de compte technique) avec interlocuteurs disponibles au Canada. | Obligatoire | drivers |
| EN-16 | Le fournisseur fournit un **modèle de licence prévisible et transparent** à l'échelle pancanadienne, **indépendant d'une facturation à l'appel** non maîtrisable, permettant une projection de **TCO** pluriannuelle. **(Tarifs indicatifs et non contractuels.)** | Obligatoire | driver TCO |
| EN-17 | Le fournisseur documente une **trajectoire produit (roadmap)** publique ou contractuelle couvrant open banking, paiements temps réel, IA/MCP et événementiel, avec engagements de support des standards (OpenAPI, AsyncAPI, ISO 20022, FAPI, OpenTelemetry). | Importante | tous |
| EN-18 | Le fournisseur fournit une **documentation complète** et un **programme d'habilitation / formation** (transfert de compétences aux équipes BBQ) en français et en anglais. | Importante | drivers |
| EN-19 | Le fournisseur démontre des **références clients comparables** (institutions financières réglementées, contexte hybride/souverain), communicables sous NDA. | Importante | drivers |
| EN-20 | La plateforme prend en charge une **gestion des environnements** (dév, test, pré-prod, prod) avec promotion contrôlée et isolation, alignée sur les pratiques de gestion du changement du BSIF B-13. | Importante | UC9 |

---

## 7. Synthèse de couverture

### 7.1 Décompte par famille et priorité

| Famille | Obligatoire | Importante | Souhaitée | Total |
|---|---|---|---|---|
| **EF** — Fonctionnelles | 19 | 9 | 2 | 30 |
| **EA** — Architecture / hybride | 8 | 6 | 0 | 14 |
| **ES** — Sécurité | 14 | 2 | 3 | 19 |
| **EC** — Conformité / souveraineté | 11 | 3 | 0 | 14 |
| **EN** — Non fonctionnelles | 13 | 7 | 0 | 20 |
| **Total** | **65** | **27** | **5** | **97** |

### 7.2 Couverture des cas d'usage

| UC | Intitulé | Exigences principales |
|---|---|---|
| UC1 | Exposition gouvernée d'API Open Banking | EF-18, EF-19, EF-20, ES-01, ES-03, EC-01, EC-09, EC-10 |
| UC2 | Passerelle de paiements temps réel (RTR / ISO 20022) | EF-09, EF-21, EF-22, EA-03, EA-04, EN-01, EN-03, EN-05, EC-08 |
| UC3 | Portail partenaires et marketplace B2B | EF-12, EF-13, EF-14, EF-15, EF-16, EA-11 |
| UC4 | Façade d'API devant le mainframe et le cœur | EF-01, EF-02, EF-07, EF-08, EA-09, EC-13 |
| UC5 | Sécurisation centralisée AuthN / AuthZ | ES-01, ES-02, ES-03, ES-04, ES-05, EF-14 |
| UC6 | Protection contre les menaces et abus | ES-08, ES-09, ES-10, ES-11, ES-12, EF-10 |
| UC7 | Observabilité, traçabilité et audit | EN-10, EN-11, EN-12, EC-03, EC-04, EF-20 |
| UC8 | API et streaming événementiels | EF-23, EF-24, EF-25, EF-26 |
| UC9 | Gouvernance du cycle de vie et conformité par conception | EF-03, EF-04, EF-05, EF-06, EC-10, EC-11 |
| UC10 | Médiation et gouvernance des API pour l'IA et les agents | EF-27, EF-28, EF-29, EF-30 |

### 7.3 Couverture des enjeux FSI directeurs

| Enjeu FSI | Exigences clés |
|---|---|
| mTLS | ES-03, ES-14 |
| OAuth2 / OIDC | ES-01, ES-02, ES-04 |
| WAF / WAAP API | ES-09, ES-08, ES-10 |
| Résidence des données au Canada | EC-01, EC-02, EA-02, EA-03 |
| Chiffrement (transit, repos, BYOK/HYOK) | ES-14, ES-15, ES-16, ES-17, ES-18 |
| Journalisation / audit immuable | EC-03, EC-04, EN-10, ES-12 |
| RTO / RPO et résilience | EN-05, EN-06, EN-07, EN-08, EN-09 |
| Multi-région / multi-cloud | EA-07, EA-08, EN-05 |
| Survivabilité / mode déconnecté | EA-04, EA-05 |
| Passerelle IA / MCP | EF-27, EF-28, EF-29, EF-30 |
| Événementiel | EF-23, EF-24, EF-25, EF-26 |
| Souveraineté / anti-extraterritorialité | EC-02, EC-14, ES-16, EA-06 |
| TCO / anti-verrouillage | EN-16, EA-14, EA-07 |

---

*Fin de l'ANNEXE A2 — Matrice des exigences. Document fictif à vocation d'aide à la décision ; réponses fournisseurs simulées ; prix indicatifs et non contractuels ; éléments marqués « (à vérifier) » à confirmer avant usage opérationnel.*
