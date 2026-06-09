# Réponse à l'appel d'offres RFP-BBQ-APIM-2026 — Candidat : Gravitee

**Solution proposée :** Gravitee API Platform (déploiement self-hosted / hybride)
**Éditeur :** Gravitee.io (Gravitee Topco Limited)
**Référence du marché :** RFP-BBQ-APIM-2026 — Plateforme d'API Management d'entreprise (déploiement hybride strict)
**Organisation cliente :** Banque Boréale du Québec (BBQ) — *organisation fictive*
**Date de la réponse :** Juin 2026
**Identifiant candidat :** CAND4

---

## Avis d'intégrité et cadre de simulation

> **À lire avant toute exploitation de ce document.**
>
> - L'organisation cliente **Banque Boréale du Québec (BBQ)** est **entièrement fictive**. Le présent document est une **réponse simulée** produite à des fins méthodologiques de comparaison.
> - Les capacités décrites sont fondées sur la **documentation produit publique et les communications de l'éditeur Gravitee.io vérifiées à la date de juin 2026**. Cette réponse ne constitue ni un engagement, ni une déclaration officielle de Gravitee.io.
> - Les éléments de **prix, de TCO et de licence** sont **indicatifs et non contractuels**. Ils servent uniquement à la comparaison méthodologique et devraient être confirmés par un devis officiel de l'éditeur.
> - Tout élément **incertain, prospectif, sensible au temps ou postérieur à l'horizon de connaissance** retenu est explicitement marqué **« à vérifier »**. Les affirmations sensibles (certifications, régions cloud canadiennes, calendrier réglementaire) doivent être confirmées par preuves auprès de l'éditeur avant tout usage opérationnel.
> - Cette réponse n'est **pas un avis indépendant** : elle est rédigée du point de vue d'un soumissionnaire proposant Gravitee, tout en s'efforçant de signaler honnêtement les limites et les risques.

---

## Table des matières

1. [Présentation de l'éditeur, de la solution et positionnement](#1-présentation-de-léditeur-de-la-solution-et-positionnement)
2. [Architecture et déploiement hybride / on-prem (point critique)](#2-architecture-et-déploiement-hybride--on-prem-point-critique)
3. [Sécurité (AuthN/AuthZ, mTLS, secrets, WAF API)](#3-sécurité-authnauthz-mtls-secrets-waf-api)
4. [Conformité et souveraineté](#4-conformité-et-souveraineté)
5. [Couverture fonctionnelle des 10 cas d'usage](#5-couverture-fonctionnelle-des-10-cas-dusage)
6. [Performance et scalabilité](#6-performance-et-scalabilité)
7. [Observabilité](#7-observabilité)
8. [Événementiel / streaming et GraphQL](#8-événementiel--streaming-et-graphql)
9. [IA / LLM et agentique (passerelle IA, MCP / A2A)](#9-ia--llm-et-agentique-passerelle-ia-mcp--a2a)
10. [Expérience développeur et gouvernance](#10-expérience-développeur-et-gouvernance)
11. [Tarification indicative et TCO sur 3 ans](#11-tarification-indicative-et-tco-sur-3-ans)
12. [Références FSI, limites et risques honnêtes](#12-références-fsi-limites-et-risques-honnêtes)
13. [Synthèse de conformité à la matrice A2](#13-synthèse-de-conformité-à-la-matrice-a2)

---

## 1. Présentation de l'éditeur, de la solution et positionnement

### 1.1 L'éditeur

Gravitee.io est un éditeur de logiciels d'API Management fondé en 2015, dont le produit s'appuie sur un **noyau open source** (licence Apache 2.0) complété par une **Enterprise Edition** commerciale. L'entreprise est présente en Europe et en Amérique du Nord (siège historique en France, présence aux États-Unis et au Royaume-Uni). Sa singularité dans le marché de l'API Management est une **forte culture open source** et une architecture conçue pour gouverner non seulement les API REST synchrones, mais aussi les **API événementielles / streaming** (Kafka, MQTT) et, plus récemment, le **trafic IA / agentique** (LLM, MCP, A2A).

### 1.2 Positionnement marché

- Gravitee est **nommée « Leader » dans le Gartner® Magic Quadrant™ for API Management 2025** (deuxième année consécutive). *(Position de marché à la date d'octobre 2025 ; toute évolution ultérieure est « à vérifier ».)*
- Selon l'éditeur, Gravitee figure parmi les **cinq fournisseurs les mieux notés sur l'ensemble des six cas d'usage** du Gartner® Critical Capabilities for API Management 2025. *(Affirmation de l'éditeur — « à vérifier » par lecture directe du rapport Gartner.)*

### 1.3 Composants de la plateforme

| Composant | Rôle |
|---|---|
| **Gravitee API Management (APIM)** | Passerelle API, plan de contrôle (API Console / Management API), portail développeur, catalogue, cycle de vie |
| **Gravitee Access Management (AM)** | Serveur OAuth2 / OIDC / FAPI, gestion du consentement, IAM (incl. IAM agentique) |
| **Gravitee API Gateway** | Plan de données : médiation REST, SOAP, GraphQL, gRPC, WebSocket, SSE |
| **Gravitee Kafka Gateway / Event-native Gateway** | Médiation et gouvernance des flux Kafka natifs et événementiels |
| **Gravitee AI Gateway** | Passerelle LLM / MCP / A2A (gouvernance du trafic IA) |
| **Gravitee Alert Engine** | Moteur d'alerting (Enterprise Edition) |
| **Gravitee Cockpit / Cloud** | Console de gouvernance multi-environnements (« plan de gouvernance unique ») |

### 1.4 Adéquation au besoin de BBQ — synthèse

Gravitee répond bien aux priorités centrales de BBQ : **architecture hybride control plane / data plane mature**, **modèle open source réduisant le verrouillage fournisseur** (un atout direct pour le critère C11 et la stratégie de sortie EA-14), **passerelle FAPI certifiée** pertinente pour l'Open Banking (UC1), et **couverture native de l'événementiel et de l'IA / MCP** (UC8, UC10) — deux domaines où l'offre de Gravitee est particulièrement différenciée. Les zones de vigilance honnêtes concernent les **certifications attendues en contexte FSI canadien** (SOC 2 Type II, PCI-DSS, conformité opérationnelle BSIF) et la **présence d'une région cloud souveraine canadienne**, traitées en sections 4 et 12 avec mention « à vérifier ».

---

## 2. Architecture et déploiement hybride / on-prem (point critique)

> **Critère C3 (12 pts) — Architecture hybride, portabilité et résilience.** Famille EA. C'est un point fort structurel de Gravitee.

### 2.1 Séparation plan de contrôle / plan de données (EA-01, EA-02)

L'architecture de Gravitee sépare nativement :

- le **plan de contrôle** (Management API, API Console, portail développeur, analytique) ;
- le **plan de données** (les **Gateways**), qui traitent réellement le trafic d'API.

En **déploiement hybride**, le plan de contrôle peut résider dans Gravitee Cloud **ou être auto-hébergé (self-managed)**, tandis que les **Gateways sont déployées dans l'infrastructure de BBQ** (data centers privés, cloud canadien, périphérie). Le mécanisme s'appuie sur un **« bridge gateway »** : les Gateways de données se synchronisent avec les dépôts du plan de contrôle (MongoDB / JDBC / Redis) via un pont HTTP, sans exposer directement la base de données du control plane.

> **Important pour BBQ :** la topologie « control plane on-prem OU cloud souverain + data planes là où circulent les données » (EA-02, EA-03) est un **scénario nativement supporté et documenté** par Gravitee, pas une adaptation. **Conformité : C (native).**

### 2.2 Gateways multi-environnements pilotées par un plan unique (EA-03, EN-14)

Une même installation peut piloter des Gateways réparties sur plusieurs environnements (data centers Québec / Ontario, cloud canadien, succursales / DMZ), regroupées logiquement (par « environnement » et « organisation »). Gravitee **Cockpit / Cloud** offre une console de gouvernance multi-organisations / multi-environnements jouant le rôle de **plan de gouvernance unique** exigé (EN-14). **Conformité : C / CP (selon le périmètre de centralisation retenu).**

### 2.3 Survivabilité / mode déconnecté (EA-04, EA-05) — *point de vigilance honnête*

Les Gateways Gravitee chargent leur configuration (définitions d'API, plans, politiques) depuis le dépôt de configuration et **conservent en mémoire** la configuration synchronisée. En fonctionnement normal, elles interrogent périodiquement le dépôt pour détecter les changements.

- **Ce qui est solide :** une fois synchronisée, une Gateway **continue d'appliquer ses politiques** (authentification, autorisation, quotas) et de servir le trafic **même si le plan de contrôle / la Management API devient injoignable**. La Gateway n'a pas besoin de la console pour router le trafic. Cela couvre l'esprit de l'exigence de survivabilité (EX-02 / EA-04).
- **Ce qui demande validation en PoC :** la **durée maximale documentée de fonctionnement autonome** (EA-05), le comportement précis de **resynchronisation** après une coupure prolongée, et la configuration **fail-open / fail-closed par politique** doivent être démontrés dans le scénario **PoC-A**. Certains mécanismes (rafraîchissement de jetons OAuth via introspection, listes de révocation) supposent une connectivité vers AM / l'IdP ; il faut valider le comportement en cas d'indisponibilité de ces dépendances. **Conformité : CP — à démontrer en PoC.**

### 2.4 Conteneurs, Kubernetes et air-gapped (EA-06)

- Gravitee est distribuée en **conteneurs Docker** avec **charts Helm** et déploiement Kubernetes documenté.
- Un **déploiement air-gapped** (sans connectivité Internet sortante) est possible pour le **noyau auto-hébergé** : registres d'images privés, plugins installés localement. **Réserve :** la **Enterprise Edition exige une clé de licence** et certaines fonctions (résolution de licence, mises à jour de plugins) bénéficient d'une connectivité ; le mode air-gapped complet doit être **confirmé pour la version retenue (« à vérifier »)**. **Conformité : CP.**

### 2.5 Portabilité multi-cloud et réversibilité (EA-07, EA-14)

- Le moteur de Gateway est le **même binaire** quel que soit le substrat (on-prem, AWS, Azure, GCP, cloud canadien souverain). Il n'y a **pas de dépendance dure à un service propriétaire mono-cloud** pour le traitement du trafic. **Conformité : C.**
- Les définitions d'API sont exportables en **formats ouverts** (définition d'API Gravitee en JSON, OpenAPI, AsyncAPI). Le **noyau open source** constitue en lui-même une **stratégie de sortie crédible** : BBQ peut, en théorie, continuer d'exploiter le Gateway OSS sans licence. **C'est un avantage différenciant fort sur le critère anti-verrouillage (EA-14, C11).**

### 2.6 Multi-région et HA (EA-08, EN-05, EN-06, EN-09)

- Déploiement **multi-région actif/actif ou actif/passif** supporté ; les Gateways sont **sans état** (stateless) et se mettent à l'échelle horizontalement derrière un répartiteur de charge ; les composants à état (dépôts, Redis pour le rate limiting distribué) sont à rendre redondants par BBQ.
- Les **SLA de disponibilité ≥ 99,99 % (data plane)** et **≥ 99,9 % (control plane)** dépendent de l'architecture d'infrastructure déployée par BBQ ; ils sont **atteignables** avec une conception multi-région correcte mais **ne sont pas garantis par le produit seul** — à confirmer dans le dossier d'architecture et le PoC. **Conformité : CP.**

---

## 3. Sécurité (AuthN/AuthZ, mTLS, secrets, WAF API)

> **Critère C1 (12 pts) — Sécurité des API et protection contre les menaces.** Famille ES.

### 3.1 Authentification et autorisation (ES-01, ES-02, ES-04, ES-05)

- **OAuth2 et OpenID Connect** : validation de jetons JWT et **introspection** des jetons opaques ; vérification de signature, expiration, émetteur (`iss`), audience (`aud`). **Conformité : C.**
- **Autorisation fine** par **scopes** et **claims** via des politiques déclaratives (policy `JWT`, `OAuth2`, `Check scopes`, etc.). **Conformité : C.**
- **Intégration IAM d'entreprise** : Gravitee Access Management agit comme serveur d'autorisation, et la plateforme s'intègre à des **IdP externes via SAML 2.0 et OIDC**. **Conformité : C.**
- **Zero Trust** : la Gateway agit comme **point d'application de politique (PEP)**, vérifiant identité et politiques **à chaque appel**. **Conformité : C.**
- **Autorisation externalisée (OPA / PDP)** (ES-07, souhaitée) : possible via politique d'appel à un service de décision externe ; intégration native à un PDP type OPA **à valider selon la version (« à vérifier »)**. **Conformité : CP.**

### 3.2 mTLS et FAPI (ES-03)

- **mTLS** côté consommateur et côté back-end, avec validation de chaîne de certificats.
- **Gravitee Access Management est certifié FAPI 1 Advanced (Final), tous profils**, incluant **mutual TLS**, **certificate-bound access tokens** (liaison du jeton au certificat) et **Pushed Authorization Requests (PAR)** — exactement les mécanismes requis par les profils Open Banking (UC1, EF-18). **Conformité : C.**

> **Réserve « à vérifier » :** la certification publique connue porte sur le profil **FAPI 1 Advanced**. Le support d'un **FAPI 2.0 Security Profile** certifié et le **profil canadien définitif d'Open Banking** restent **à confirmer** auprès de l'éditeur (cohérent avec la note A2 sur EF-18).

### 3.3 Protection contre les menaces / WAF API (ES-08, ES-09, ES-10, ES-11)

- La Gateway applique **plus de 50 politiques** couvrant la protection contre l'**OWASP API Security Top 10** (BOLA/BFLA via autorisation fine au niveau objet, validation de schéma stricte, protection contre l'injection, limitation de consommation de ressources).
- **Validation de schéma JSON / XML / OpenAPI** stricte en bordure (EF-22). **Conformité : C.**
- **Limitation de débit / quotas** par consommateur, API, plan et clé, avec fenêtres glissantes (EF-10). **Conformité : C.**
- **Géo-restriction** et politiques de filtrage IP (allow/deny lists). **Conformité : C.**
- **Limitation adaptative et détection comportementale / mise en quarantaine automatique** (ES-10, ES-11) : la limitation est robuste, mais la **détection d'anomalies comportementales avancée** (bourrage d'identifiants, scraping par ML) relève davantage de l'intégration avec un **SIEM / WAAP partenaire** que d'un moteur ML natif. **Honnêteté : Gravitee n'est pas un produit de bot-management / API threat-detection par apprentissage automatique à la manière d'un acteur spécialisé.** **Conformité : CP — à compléter par intégration tierce (T) pour la détection comportementale avancée.**
- **Inspection WAF / WAAP avancée** (ES-09) : Gravitee assure validation de charge et de schéma ; pour une protection WAF de niveau réseau / signatures, BBQ devrait **chaîner un WAF / WAAP en amont** (intégration). **Conformité : CP / T.**

### 3.4 Gestion des secrets, chiffrement, BYOK / HYOK (ES-14 à ES-18, EX-01)

- **TLS 1.2 minimum, TLS 1.3 supporté**, suites cryptographiques configurables. **Conformité : C.**
- **Secret providers** : intégration native à **HashiCorp Vault** (plugin EE), **Kubernetes Secrets** et **AWS Secrets Manager**. Les secrets sont **stockés en mémoire off-heap et jamais écrits sur disque**, ce qui est un bon point de posture sécurité. **Conformité : C.**
- **Rotation des secrets / certificats** supportée via les secret providers et le renouvellement de credentials. **Conformité : C / CP.**
- **BYOK / HYOK (ES-16, EX-01) — point de vigilance :** le **chiffrement au repos** des dépôts (MongoDB / PostgreSQL) et le **BYOK** dépendent **du substrat de stockage et du KMS / HSM choisis par BBQ** (p. ex. chiffrement transparent de la base, intégration à un HSM/KMS via Vault). Gravitee **s'appuie sur l'infrastructure cryptographique du client** plutôt que de fournir un service BYOK/HYOK propriétaire intégré. Le modèle **HYOK** (clés opérées entièrement hors plateforme) est **atteignable par architecture self-hosted** mais doit être **conçu et démontré en PoC**. **Conformité : CP — architecture à valider.**
- **Cryptographie post-quantique (ES-19, souhaitée)** : feuille de route **à vérifier** auprès de l'éditeur. **Conformité : R / NC (à confirmer).**

---

## 4. Conformité et souveraineté

> **Critère C2 (13 pts — le plus pondéré) — Conformité réglementaire et souveraineté des données.** Famille EC. **C'est la zone où Gravitee doit être évaluée avec le plus de prudence et où les mentions « à vérifier » sont les plus nombreuses.**

### 4.1 Résidence des données au Canada (EC-01, EC-02, EA-02, EA-03)

- **Mécanisme de résidence : SOLIDE par conception.** Le déploiement **self-hosted / hybride** permet à BBQ de placer **les Gateways et les dépôts traitant les données réglementées entièrement dans son infrastructure canadienne** (data centers Québec / Ontario, cloud canadien). Dans ce modèle, **aucune donnée réglementée ne transite par Gravitee Cloud** : c'est l'argument central de souveraineté, et il est crédible. **Conformité : C (en mode self-hosted intégral).**
- **Région cloud souveraine canadienne pour le plan de contrôle géré (Gravitee Cloud) : À VÉRIFIER.** Les opérations cloud de Gravitee sont principalement en **Europe et Amérique du Nord** ; l'existence d'une **région Gravitee Cloud spécifiquement au Canada (Canada Central / Est)** avec garanties de résidence n'est **pas confirmée publiquement à juin 2026**. **Recommandation honnête : pour BBQ, privilégier un plan de contrôle auto-hébergé au Canada** afin de lever toute ambiguïté de souveraineté, plutôt que de dépendre d'une région Cloud canadienne non confirmée.
- **Garanties contractuelles anti-extraterritorialité / Cloud Act (EC-02) :** Gravitee.io est un **éditeur d'origine européenne** (ce qui réduit l'exposition directe au *Cloud Act* étatsunien par rapport à un hyperscaler américain), **mais** le risque résiduel dépend du substrat d'hébergement choisi et de la structure capitalistique de l'éditeur. **Les garanties contractuelles précises (notification de demande d'accès, contrôle exclusif) sont à négocier et « à vérifier ».**

### 4.2 Certifications et attestations (EC-04, EC-07, EC-08) — *transparence requise*

| Certification / cadre | Statut connu (juin 2026) | Conformité |
|---|---|---|
| **ISO/IEC 27001** | **Détenue** (certifiée) | C |
| **ISO/IEC 27701** (vie privée) | **Détenue** (certifiée) | C |
| **FAPI 1 Advanced (Final)** | **Certifiée** (Access Management) | C |
| **SOC 2 Type II** | **À VÉRIFIER** — non confirmée publiquement ; à demander sous NDA à l'éditeur | CP / à confirmer |
| **PCI-DSS v4.0** | **À VÉRIFIER** — Gravitee fournit des **contrôles techniques** (segmentation, chiffrement, journalisation, contrôle d'accès) utiles au périmètre PCI de BBQ, mais une **attestation PCI-DSS de l'éditeur lui-même** n'est pas confirmée | CP |
| **FedRAMP / Protected B (cadre fédéral canadien)** | **À VÉRIFIER** — pas d'autorisation FedRAMP ni de statut « Protected B » du Centre canadien pour la cybersécurité connu publiquement | NC / à confirmer |

> **Honnêteté requise vis-à-vis du critère C2 :** sur le plan des **attestations formelles attendues d'une institution financière canadienne** (SOC 2 Type II, PCI-DSS au niveau éditeur, Protected B), Gravitee présente **moins de garanties publiquement documentées** que certains concurrents hyperscalers. **Son atout compensatoire est le modèle self-hosted** : BBQ exploite la plateforme **dans son propre périmètre certifié**, et c'est l'environnement de BBQ (et non l'éditeur) qui porte l'essentiel des attestations SOC 2 / PCI-DSS. Cette nuance doit être explicitement pesée dans l'évaluation.

### 4.3 Pistes d'audit immuables et rapports de conformité (EC-03, EC-04, EX-03)

- Gravitee produit des **journaux d'audit** (accès, changements de configuration, décisions de politique) et des **logs d'API** exportables. **Conformité : C** pour la production des journaux.
- **Immuabilité / intégrité vérifiable / append-only (EC-03, EX-03) :** la garantie d'**immuabilité forte** (journaux infalsifiables, intégrité cryptographiquement vérifiable) **n'est pas une propriété native du produit** ; elle s'obtient en **exportant les journaux vers un SIEM / stockage WORM** (p. ex. via export en quasi-temps réel vers le SIEM). **Conformité : CP — l'immuabilité est obtenue par l'architecture d'export, à concevoir.**

### 4.4 Loi 25, LPRPDE, consentement, classification (EC-09, EC-10, EC-11, EC-13)

- **Gestion du consentement (UC1, EF-19)** : Gravitee Access Management offre un **module de gestion du consentement** (autorisations de partage, durée, périmètre, révocation), adapté aux exigences de la Loi 25. **Conformité : C / CP.**
- **Classification des données au niveau des API (EC-10)** : réalisable via **métadonnées / labels** dans le catalogue et **application de politiques conditionnelles** (masquage, journalisation renforcée). La **classification automatisée** (découverte de PII par inspection) est plus limitée nativement. **Conformité : CP.**
- **Conformité par conception / policy-as-code avant mise en production (EC-11, EX-05)** : Gravitee supporte le **GitOps / API-as-code** et l'intégration CI/CD ; les **portes de qualité et de sécurité** (linting, politiques bloquantes) sont configurables dans le pipeline. **Conformité : CP — à industrialiser.**
- **Cloisonnement de la filiale d'assurance / AMF (EC-13)** : assuré par le modèle **multi-organisations / multi-environnements**. **Conformité : C / CP.**

### 4.5 Alignement BSIF B-13 / B-10 / E-21 (EC-05, EC-06)

- Gravitee fournit les **éléments techniques** (gestion du changement, RBAC, journalisation, résilience) soutenant l'alignement **B-13**. La **documentation de couverture explicite des attentes BSIF** n'est pas un livrable standard de l'éditeur : elle est à **co-produire** en phase de cadrage. **Conformité : CP.**
- **B-10 (tiers)** : la due diligence portera sur la **localisation des équipes de support et d'exploitation** (EC-14). Gravitee dispose d'une présence Amérique du Nord, mais l'engagement d'un **support opéré depuis le Canada** pour les environnements sensibles est **« à vérifier »** et à contractualiser.

---

## 5. Couverture fonctionnelle des 10 cas d'usage

> Légende : **C** = conforme natif · **CP** = conforme partiel / par configuration · **R** = feuille de route · **T** = via tiers / module · **NC** = non conforme.

| UC | Cas d'usage | Couverture | Niveau | Commentaire honnête |
|---|---|---|---|---|
| **UC1** | Open Banking / consentement (FAPI) | Élevée | **C / CP** | **FAPI 1 Advanced certifié** + consentement via AM. Profil **FAPI 2.0** et **profil canadien** à vérifier. |
| **UC2** | Paiements temps réel (RTR / ISO 20022) | Bonne | **CP** | **Idempotence** (EF-09), rate limiting, validation de schéma : OK. **Connecteur RTR / ISO 20022 « clé en main » non fourni** — médiation à construire ; spécifications RTR « à vérifier ». |
| **UC3** | Portail partenaires / marketplace B2B | Élevée | **C** | Portail self-service, abonnements gouvernés, plans de quota, credentials. Monétisation (EF-17) : CP. |
| **UC4** | Façade mainframe / systèmes cœur | Bonne | **C / CP** | Médiation **REST ⇄ SOAP**, transformation XML⇄JSON, cache, **circuit breaker**. **Connecteur mainframe natif (ex. CICS / MQ) non standard** : passe par SOAP/HTTP/MQ ou intégration. |
| **UC5** | AuthN / AuthZ centralisées | Élevée | **C** | OAuth2/OIDC/mTLS, scopes/claims, Zero Trust PEP. Cœur de la solution. |
| **UC6** | Protection des menaces API | Bonne | **C / CP** | OWASP API Top 10, rate limiting adaptatif, validation schéma. **Détection comportementale ML avancée : via intégration tierce.** |
| **UC7** | Observabilité / audit | Bonne | **C / CP** | Métriques, logs, **traces OpenTelemetry**, export SIEM. **Immuabilité forte** via SIEM/WORM externe. |
| **UC8** | Événementiel / streaming / webhooks | **Élevée — différenciant** | **C** | **Kafka-native gateway**, AsyncAPI, MQTT/WS/SSE, webhooks sortants, politiques au niveau message. **Point fort de Gravitee.** EE requis. |
| **UC9** | Gouvernance du cycle de vie | Bonne | **C / CP** | Catalogue, versionnage, dépréciation, **linting OpenAPI**, GitOps / CI/CD. |
| **UC10** | Médiation IA / agents (LLM, MCP) | **Élevée — différenciant** | **C / CP** | **AI Gateway** (LLM proxy), **MCP** (tool server, proxy), **A2A / agent mesh**, IAM agentique, garde-fous. Domaine de pointe de Gravitee ; maturité à valider en PoC-G. |

**Lecture :** Gravitee couvre **les 10 cas d'usage**, avec une **force différenciante marquée sur UC8 (événementiel) et UC10 (IA / agents)**, une bonne couverture cœur (UC1, UC3, UC4, UC5, UC9), et des **réserves honnêtes** sur les connecteurs « clé en main » spécialisés (RTR/ISO 20022 pour UC2, mainframe pour UC4) et la détection comportementale avancée (UC6).

---

## 6. Performance et scalabilité

> **Critère C6 (7 pts).** Famille EN (EN-01 à EN-04).

- **Architecture Gateway sans état**, reposant sur un moteur réactif (Vert.x / Netty), conçue pour la **mise à l'échelle horizontale linéaire** derrière un répartiteur de charge. **Conformité : C** pour le modèle de scalabilité.
- **Latence ajoutée (EN-01 : médiane ≤ 10 ms, p99 ≤ 30 ms)** : atteignable pour un proxy simple avec un jeu de politiques léger, mais **fortement dépendante des politiques activées** (validation FAPI, mTLS, transformation, appels externes). **À mesurer en PoC-B** sur le profil de politiques réel de BBQ. **Conformité : CP — à valider.**
- **Débit (EN-02 : plusieurs dizaines de milliers de req/s par cluster)** : atteignable par ajout de nœuds de Gateway ; le **rate limiting distribué** s'appuie sur un magasin partagé (Redis) qui doit être dimensionné pour ne pas devenir un goulot. **Conformité : CP — à valider en charge.**
- **Idempotence et dégradation gracieuse (EN-03, EN-04)** : idempotence par clé (EF-09) et priorisation/délestage configurables. **Conformité : C / CP.**

> **Honnêteté :** Gravitee ne publie pas de **benchmarks normalisés indépendants** directement comparables (type req/s à p99 garanti). Les chiffres ci-dessus sont des **ordres de grandeur réalistes** pour ce type d'architecture, **à confirmer impérativement par le PoC** (les preuves PoC priment, conformément au §6.3 du RFP).

---

## 7. Observabilité

> **Critère C7 (7 pts).** Famille EN (EN-10 à EN-13).

- **OpenTelemetry** : émission de **traces distribuées** avec propagation d'un identifiant de corrélation, **métriques** et **logs**. **Conformité : C.**
- **Intégration aux outils d'entreprise** : export vers **Elasticsearch / OpenSearch, Prometheus, Datadog, et SIEM** (formats ouverts). **Conformité : C.**
- **Tableaux de bord** d'exploitation et de conformité (trafic, erreurs, latence, consommation par partenaire) dans l'API Console / l'analytique ; tableaux de bord avancés souvent **délégués à la pile d'observabilité de BBQ** (Grafana, etc.). **Conformité : C / CP.**
- **Alerting (EN-13)** : via le **Gravitee Alert Engine (Enterprise Edition)** et/ou la pile de monitoring de BBQ. **Conformité : C (EE).**
- **Corrélation cross-environnements hybrides (EN-10)** : la propagation OTel permet la corrélation de bout en bout ; **à valider en PoC-F** sur la topologie hybride réelle.

---

## 8. Événementiel / streaming et GraphQL

> **Critère C8 (6 pts).** Famille EF (EF-23 à EF-26). **Domaine de force différenciante de Gravitee.**

- **Gateway « event-native » / Kafka-native** : Gravitee est l'un des rares acteurs à proposer une **gouvernance native du protocole Kafka** (la Gateway parle Kafka, pas seulement HTTP), avec **contrôle d'accès, journalisation et mappage de topics**. **Conformité : C.**
- **AsyncAPI** : catalogage, versionnage et découverte des **API asynchrones au portail**, au même titre que les API REST via OpenAPI (EF-23). **Conformité : C.**
- **Médiation de protocoles événementiels** : exposition de ressources **Kafka, MQTT, Solace** en **REST, WebSocket, Webhook (avec DLQ / retry / signature), SSE** (EF-24, EF-25). **Conformité : C.**
- **Politiques au niveau message** et application des **mêmes contrôles de sécurité / classification / résidence** que sur le synchrone (EF-26). **Conformité : C.**
- **GraphQL** : la Gateway prend en charge **GraphQL en façade** (proxy, sécurité, rate limiting). L'orchestration / fédération GraphQL avancée reste limitée (Gravitee n'est pas un serveur de fédération GraphQL dédié). **Conformité : CP.**
- **gRPC** : supporté par la Gateway. **Conformité : C / CP.**

> **Réserve commerciale honnête :** l'**event-native / Kafka gateway est une fonctionnalité Enterprise Edition** (non disponible en édition open source). Cela influe sur le périmètre de licence (cf. §11) et sur la stratégie de sortie (le repli OSS ne couvrirait pas l'événementiel).

---

## 9. IA / LLM et agentique (passerelle IA, MCP / A2A)

> **Critère C9 (7 pts).** Famille EF (EF-27 à EF-30). **Second domaine de force différenciante de Gravitee.**

Gravitee a investi tôt et fortement dans la gouvernance du trafic IA. À juin 2026, la plateforme (versions 4.10 / 4.11+) propose :

- **AI Gateway / LLM proxy** : routage multi-modèles (OpenAI, Anthropic, etc.), **gouvernance des jetons (tokens)**, observabilité du trafic LLM. **Conformité : C.**
- **MCP (Model Context Protocol)** — trois capacités distinctes :
  - **MCP Tool Server** : transformer des API existantes en outils consommables par des agents ;
  - **MCP Proxy** : gouverner des serveurs MCP en amont (politiques, journalisation) ;
  - **APIM MCP Server** : piloter Gravitee en langage naturel.
  **Conformité : C** (capacité différenciante rare sur le marché).
- **A2A (Agent-to-Agent) / Agent Mesh** : gouvernance du trafic inter-agents. **Conformité : C / CP.**
- **IAM agentique** : autorisation fine standards-based pour l'accès des agents aux outils, dans Access Management. **Conformité : C / CP.**
- **Garde-fous / masquage des PII (EF-29, DLP)** : politiques de **caviardage / masquage** applicables aux prompts et réponses ; filtrage de contenu. **Le masquage PII de niveau « DLP entreprise »** (détection sémantique avancée) peut nécessiter une **intégration tierce**. **Conformité : CP.**
- **Audit des prompts / réponses et plafonds budgétaires (EF-30)** : journalisation des invocations et **attribution de coût / quotas par token / clé** ; alerte au dépassement. **Conformité : C / CP.**

> **Réserve « à vérifier » :** le domaine IA évolue très vite ; la **maturité opérationnelle réelle** (notamment le masquage PII de qualité production et la robustesse des garde-fous) doit être **éprouvée dans le scénario PoC-G**. Les déclarations marketing récentes ne valent pas preuve.

---

## 10. Expérience développeur et gouvernance

> **Critères C10 (8 pts) et C5 (9 pts).** Familles EF / EC.

**Expérience développeur (C10, UC3) :**

- **Portail développeur self-service** : découverte, **documentation interactive** (OpenAPI / AsyncAPI), **bac à sable (try-it-out)**, abonnement aux API. **Conformité : C.**
- **Workflow d'abonnement gouverné** multi-niveaux (demande → revue → approbation → provisionnement). **Conformité : C.**
- **Cycle de vie des credentials** (clés, secrets, certificats mTLS) en libre-service encadré. **Conformité : C.**
- **Plans de quota / tiers** différenciés par type de partenaire. **Conformité : C.**
- **Personnalisation de marque, multi-tenant, bilingue FR/EN** : le **nouveau portail développeur** est personnalisable (thèmes, branding) ; le **bilinguisme FR/EN du portail est à valider** selon la version (« à vérifier »). **Conformité : CP.**
- **Génération de SDK** : à partir d'OpenAPI ; **à confirmer** l'étendue native vs. outillage tiers (ex. OpenAPI Generator). **Conformité : CP.**

**Gouvernance du cycle de vie et catalogue (C5, UC9) :**

- **Catalogue d'entreprise** (API internes / partenaires / publiques) avec métadonnées et propriétaire. **Conformité : C.**
- **Linting OpenAPI** et **portes de qualité** bloquantes (EF-05). **Conformité : C / CP.**
- **GitOps / API-as-code** et intégration CI/CD (EF-06). **Conformité : CP.**
- **Versionnage, dépréciation planifiée, retrait, routage canary / blue-green** (EF-04). **Conformité : C / CP.**
- **Détection des shadow / zombie APIs (ES-13, souhaitée)** : capacité limitée nativement, à compléter. **Conformité : CP / NC.**

---

## 11. Tarification indicative et TCO sur 3 ans

> **Critère C11 (8 pts).** Famille EN (EN-16). **Tous les montants ci-dessous sont INDICATIFS, NON contractuels, et doivent être confirmés par un devis officiel de Gravitee.io.**

### 11.1 Modèle de licence

- **Édition open source (OSS, Apache 2.0)** : noyau Gateway + APIM + AM gratuits. **Exclut** l'événementiel (Kafka/AsyncAPI), le déploiement hybride avancé, l'Alert Engine, le SSO entreprise, l'AI Gateway et plusieurs fonctions EE.
- **Enterprise Edition** : tarification **sur devis** (custom), packagée en plusieurs niveaux. Pour BBQ, **l'Enterprise Edition est requise** (hybride, événementiel, IA, support entreprise).
- **Gravitee Cloud** : à titre indicatif, **à partir d'environ 2 500 USD / mois par gateway** *(repère public — « à vérifier » et non représentatif d'un déploiement self-hosted d'entreprise négocié)*.

### 11.2 Hypothèses du modèle TCO (explicites)

| Hypothèse | Valeur retenue |
|---|---|
| Déploiement | Hybride self-hosted, control plane + data plane au Canada, Enterprise Edition |
| Environnements | Prod multi-région (2 régions CA) + non-prod (dev/test/préprod) |
| Gateways | ~8 à 12 clusters de Gateway (sensibles on-prem, public/partenaire cloud CA, périphérie) |
| Support | Niveau entreprise 24/7 |
| Périmètre exclu du prix licence | Infrastructure (calcul, stockage, réseau), Kafka, HSM/Vault, SIEM — **à la charge de BBQ** |
| Devise | Dollars canadiens (CA$), ordres de grandeur |

### 11.3 Ordres de grandeur TCO sur 3 ans (indicatifs, CA$)

| Poste | An 1 | An 2 | An 3 | Commentaire |
|---|---|---|---|---|
| **Licences Enterprise Edition** | 0,9–1,8 M$ | 0,9–1,8 M$ | 0,9–1,8 M$ | **Sur devis** — fourchette large, à confirmer |
| **Implantation / services pro** | 0,5–1,0 M$ | 0,15–0,3 M$ | 0,15–0,3 M$ | Intégration, mainframe, FAPI, migration des passerelles héritées |
| **Infrastructure (calcul/stockage/réseau)** | 0,3–0,6 M$ | 0,3–0,6 M$ | 0,3–0,6 M$ | À la charge de BBQ ; varie selon multi-région |
| **Exploitation interne (FTE)** | 0,4–0,8 M$ | 0,4–0,8 M$ | 0,4–0,8 M$ | 2–4 ETP plateforme |
| **Total annuel indicatif** | **2,1–4,2 M$** | **1,75–3,5 M$** | **1,75–3,5 M$** | |
| **Total 3 ans indicatif** | | | **≈ 5,6–11,2 M$** | **Fourchette large — à resserrer par devis et PoC** |

> **Atout TCO / anti-verrouillage (C11) :** le **modèle open source** confère à Gravitee un **avantage anti-lock-in réel** : repli possible sur l'OSS pour le cœur REST, formats ouverts, pas de facturation propriétaire à l'appel. **Réserve honnête :** ce filet de sécurité **ne couvre pas** les fonctions Enterprise (événementiel, IA, hybride avancé) ; un repli OSS dégraderait significativement le périmètre. La fourchette de prix EE étant **opaque (sur devis)**, la **prévisibilité tarifaire (EN-16) reste à démontrer** par un devis ferme — c'est une vigilance pour BBQ.

---

## 12. Références FSI, limites et risques honnêtes

### 12.1 Références sectorielles

- Gravitee revendique des clients dans les **services financiers, l'assurance, le secteur public et la santé**, en Europe et Amérique du Nord, et sa **certification FAPI** témoigne d'une orientation Open Banking / FSI. **Les références clients d'institutions financières canadiennes comparables (contexte hybride / souverain) sont à demander sous NDA (EN-19) et « à vérifier ».**
- Position **Leader Gartner MQ API Management 2025** (2ᵉ année) — gage de solidité de l'offre. *(« à vérifier » pour toute mise à jour postérieure à octobre 2025.)*

### 12.2 Forces (honnêtes)

1. **Architecture hybride control plane / data plane mature et documentée** — adéquation directe au déploiement hybride strict de BBQ (C3).
2. **Modèle open source** → **avantage anti-verrouillage** et stratégie de sortie crédible (C11, EA-14).
3. **Événementiel / Kafka-native** différenciant et natif (C8, UC8).
4. **IA / MCP / A2A** parmi les offres les plus avancées du marché (C9, UC10).
5. **FAPI 1 Advanced certifié + AM intégré** → fort pour Open Banking et mTLS (C1, UC1, UC5).
6. **Souveraineté par self-hosting** : données réglementées entièrement dans le périmètre canadien de BBQ (C2).

### 12.3 Limites et risques (honnêtes, « à vérifier »)

1. **Certifications FSI canadiennes au niveau éditeur** : **SOC 2 Type II, PCI-DSS et Protected B non confirmés publiquement** — point faible relatif sur le critère le plus pondéré (C2). *(à vérifier auprès de l'éditeur sous NDA.)*
2. **Région cloud souveraine canadienne** : non confirmée → **recommander un control plane auto-hébergé au Canada** plutôt que Gravitee Cloud. *(à vérifier.)*
3. **BYOK / HYOK et chiffrement au repos** : **dépendants de l'infrastructure de BBQ**, pas d'un service BYOK propriétaire intégré → architecture à concevoir et démontrer (PoC-A).
4. **Immuabilité des pistes d'audit** : obtenue **par export vers SIEM / WORM**, non native → conception requise.
5. **Survivabilité / mode déconnecté** : robuste sur le trafic, mais **durée d'autonomie, resync et dépendances OAuth/AM** à démontrer en PoC-A (EA-05).
6. **Connecteurs « clé en main »** : **RTR / ISO 20022** (UC2) et **mainframe / CICS** (UC4) ne sont pas des connecteurs natifs prêts à l'emploi → intégration à prévoir.
7. **Détection comportementale / WAAP ML avancée** : à compléter par **intégration tierce** (UC6, ES-09, ES-11).
8. **Opacité tarifaire EE** : prix sur devis → **prévisibilité (EN-16) à prouver** par un devis ferme.
9. **Taille de l'éditeur** : acteur de taille intermédiaire vs. hyperscalers → **due diligence B-10** (pérennité, support localisé Canada) particulièrement importante (EC-14, EN-15).

> Tous les éléments ci-dessus marqués ou impliquant **« à vérifier »** doivent être confirmés par l'éditeur (preuves, attestations, démonstration PoC) avant toute décision. **Les preuves produites en PoC priment sur les déclarations** (RFP §6.3).

---

## 13. Synthèse de conformité à la matrice A2

| Famille A2 | Niveau global | Commentaire |
|---|---|---|
| **EF — Fonctionnelles** | **Bon à excellent** | Cœur API solide ; **événementiel et IA différenciants** ; réserves sur connecteurs RTR/mainframe et monétisation. |
| **EA — Architecture / hybride** | **Excellent** | **Point fort structurel** ; survivabilité et air-gapped à valider en PoC. |
| **ES — Sécurité** | **Bon** | OAuth2/OIDC/mTLS/FAPI solides ; détection comportementale et WAF avancé via tiers ; BYOK/HYOK à architecturer. |
| **EC — Conformité / souveraineté** | **Moyen à bon — vigilance** | **Souveraineté par self-hosting forte**, mais **certifications éditeur (SOC 2/PCI/Protected B) à confirmer** ; immuabilité par export. |
| **EN — Non fonctionnelles** | **Bon** | Scalabilité et observabilité solides ; perf et SLA à prouver en PoC ; **prévisibilité tarifaire à démontrer**. |

**Conclusion de soumission :** Gravitee constitue une **candidature crédible et différenciée** pour BBQ, particulièrement forte sur l'**architecture hybride**, l'**anti-verrouillage open source**, l'**événementiel** et l'**IA / agentique**, avec une **souveraineté assurée par le self-hosting**. Les **réserves déterminantes** portent sur les **certifications réglementaires formelles de l'éditeur** (critère C2, le plus pondéré) et sur plusieurs capacités **à éprouver en PoC** (survivabilité, BYOK/HYOK, performance, immuabilité d'audit). Une **due diligence B-10 soignée** et un **PoC ciblé sur les scénarios PoC-A, PoC-B et PoC-G** sont recommandés avant toute décision.

---

## Sources publiques mobilisées (vérification juin 2026)

- Gravitee — Documentation hybride (control plane / data plane, bridge gateway) : [documentation.gravitee.io/apim/hybrid-installation-and-configuration-guides](https://documentation.gravitee.io/apim/hybrid-installation-and-configuration-guides)
- Gravitee — Plateforme API Management : [gravitee.io/platform/api-management](https://www.gravitee.io/platform/api-management)
- Gravitee — Leader Gartner MQ API Management 2025 : [gravitee.io/blog/gravitee-named-a-leader-in-the-2025-gartner-magic-quadrant-for-api-management-report](https://www.gravitee.io/blog/gravitee-named-a-leader-in-the-2025-gartner-magic-quadrant-for-api-management-report)
- Gravitee — Critical Capabilities 2025 (top 5 tous cas d'usage) : [gravitee.io/blog/gravitee-ranked-top-5-across-all-6-use-cases-in-the-2025-gartner-critical-capabilities-for-api-management-report](https://www.gravitee.io/blog/gravitee-ranked-top-5-across-all-6-use-cases-in-the-2025-gartner-critical-capabilities-for-api-management-report)
- Gravitee — Certification FAPI : [gravitee.io/news/gravitee-is-fapi-certified](https://www.gravitee.io/news/gravitee-is-fapi-certified)
- Gravitee — ISO 27001 / ISO 27701 : [gravitee.io/news/gravitee-achieves-iso-27001-and-iso-27701-certification](https://www.gravitee.io/news/gravitee-achieves-iso-27001-and-iso-27701-certification)
- Gravitee — AI Gateway (LLM / MCP / A2A) : [gravitee.io/platform/ai-gateway](https://www.gravitee.io/platform/ai-gateway) ; [gravitee.io/blog/gravitee-4.10-one-control-point-to-secure-govern-ai-agents-mcp-and-llms](https://www.gravitee.io/blog/gravitee-4.10-one-control-point-to-secure-govern-ai-agents-mcp-and-llms)
- Gravitee — Kafka / Event-native Gateway : [gravitee.io/platform/kafka-gateway](https://www.gravitee.io/platform/kafka-gateway) ; [gravitee.io/blog/introducing-event-native-api-management](https://www.gravitee.io/blog/introducing-event-native-api-management)
- Gravitee — Secret providers (HashiCorp Vault, off-heap) : [documentation.gravitee.io/apim/using-the-product/using-the-gravitee-api-management-components/general-configuration/secret-providers](https://documentation.gravitee.io/apim/using-the-product/using-the-gravitee-api-management-components/general-configuration/secret-providers)
- Gravitee — OSS vs Enterprise Edition / pricing : [gravitee.io/pricing](https://www.gravitee.io/pricing) ; [documentation.gravitee.io/platform-overview/gravitee-platform/gravitee-offerings-ce-vs-ee/enterprise-edition-licensing](https://documentation.gravitee.io/platform-overview/gravitee-platform/gravitee-offerings-ce-vs-ee/enterprise-edition-licensing)

---

*Fin de la réponse candidat — Gravitee (CAND4) — RFP-BBQ-APIM-2026. Organisation cliente fictive ; réponse simulée à partir de capacités produit publiques vérifiées (juin 2026) ; prix indicatifs et non contractuels ; éléments incertains marqués « à vérifier ». Les preuves produites en PoC priment sur les déclarations sur dossier.*
