# Réponse à l'appel d'offres RFP-BBQ-APIM-2026 — Candidat : Kong

**Plateforme d'API Management d'entreprise en déploiement hybride strict**
**Soumissionnaire (simulé) : Kong Inc.**
**Produits proposés : Kong Konnect (plan de contrôle), Kong Gateway Enterprise (plan de données), Kong AI Gateway, Kong Event Gateway, Developer Portal**
**Date de la réponse : juin 2026**

---

## Avis d'intégrité et cadre de simulation

> **À lire avant toute exploitation de ce document.**
>
> - L'organisation cliente **Banque Boréale du Québec (BBQ)** est **entièrement fictive**. Aucune donnée réelle d'une institution nommée n'est utilisée.
> - La présente réponse fournisseur est **simulée**. Elle a été rédigée à partir des **capacités produit publiques et vérifiées de Kong en date de juin 2026** (documentation éditeur, communiqués, analyses sectorielles, Magic Quadrant Gartner pour l'API Management du 7 octobre 2025). Elle **n'engage pas Kong Inc.** et ne constitue pas une déclaration officielle de l'éditeur.
> - Les éléments de **prix, de TCO et de licence** sont **indicatifs, non contractuels**, et reposent sur des hypothèses explicitées à la section 11. Le modèle de licence Kong Enterprise étant entièrement personnalisé (devis), les ordres de grandeur cités doivent être confirmés auprès de Kong.
> - Tout élément **incertain, prospectif ou postérieur à juin 2026** est explicitement marqué **« à vérifier »**. Les éléments les plus sensibles pour BBQ — notamment la **disponibilité d'une région de plan de contrôle Konnect géré au Canada**, les **certifications applicables au périmètre exact (PCI-DSS, SOC 2, FedRAMP, Protected B)**, et les **garanties contractuelles anti-extraterritorialité** — sont à confirmer formellement par Kong avec preuves à l'appui.
> - Cette réponse privilégie la **fidélité aux capacités réelles** à la surenchère marketing. Les limites et risques honnêtes sont consolidés en section 12.

---

## Table des matières

1. [Présentation de l'éditeur, de la solution et positionnement](#1-présentation-de-léditeur-de-la-solution-et-positionnement)
2. [Architecture et déploiement hybride / on-prem (point critique)](#2-architecture-et-déploiement-hybride--on-prem-point-critique)
3. [Sécurité — authentification, autorisation, mTLS, secrets, WAF API](#3-sécurité)
4. [Conformité et souveraineté (résidence Canada, certifications)](#4-conformité-et-souveraineté)
5. [Couverture fonctionnelle des 10 cas d'usage](#5-couverture-fonctionnelle-des-10-cas-dusage)
6. [Performance et scalabilité](#6-performance-et-scalabilité)
7. [Observabilité](#7-observabilité)
8. [Événementiel / streaming et GraphQL](#8-événementiel--streaming-et-graphql)
9. [IA / LLM et agentique (passerelle IA, MCP / A2A)](#9-ia--llm-et-agentique)
10. [Expérience développeur et gouvernance](#10-expérience-développeur-et-gouvernance)
11. [Tarification indicative et TCO 3 ans](#11-tarification-indicative-et-tco-3-ans)
12. [Références FSI et limites / risques honnêtes](#12-références-fsi-et-limites--risques-honnêtes)

---

## 1. Présentation de l'éditeur, de la solution et positionnement

### 1.1 Éditeur

Kong Inc. est un éditeur indépendant spécialisé dans la **connectivité d'API** (gateway, service mesh, AI gateway, event gateway). Son moteur de passerelle, **Kong Gateway**, repose sur un noyau open source largement déployé (issu de l'écosystème Nginx/OpenResty, plugins en Lua/WebAssembly), ce qui constitue un atout d'**anti-verrouillage** : le runtime de passerelle a une variante open source et des formats de configuration ouverts.

**Positionnement analyste.** Kong est positionné en **Leader** du *Gartner Magic Quadrant for API Management* publié le **7 octobre 2025**, pour la sixième année consécutive, et positionné le plus à droite sur l'axe « Completeness of Vision » pour la deuxième année. *(Source publique Kong/Gartner ; l'évaluation porte sur 17 fournisseurs. Le rapport reflète l'état d'octobre 2025 — à vérifier pour toute évolution postérieure.)*

### 1.2 Architecture produit proposée à BBQ

| Composant | Rôle dans la réponse BBQ |
|---|---|
| **Kong Gateway Enterprise** | Plan de données (data plane / gateway). Runtime déployé là où circulent les données réglementées. C'est le pilier de la souveraineté. |
| **Kong Konnect** | Plan de contrôle, analytique, catalogue, portail, gouvernance. Disponible en **SaaS géré par Kong** ou en **self-managed (on-prem)** via Kong Gateway Enterprise. |
| **Kong AI Gateway** | Passerelle LLM / MCP / A2A (UC10). Capacité intégrée au moteur de passerelle. |
| **Kong Event Gateway** | Gouvernance des flux Kafka et événementiels (UC8). |
| **Kong Developer Portal** | Portail développeur interne et partenaires (UC3, UC10). |
| **Insomnia** | Conception et test d'API (cycle de vie, design-first). |

### 1.3 Adéquation au besoin de BBQ — vue d'ensemble honnête

Kong répond fortement aux axes **sécurité (C1)**, **architecture hybride et survivabilité (C3)**, **cœur fonctionnel (C4)**, **performance/faible latence (C6)** et **IA/agentique (C9)** — ce dernier étant un différenciateur réel et récent. Le **point de vigilance principal** concerne la **souveraineté du plan de contrôle géré au Canada (C2)** : à ce jour, le SaaS Konnect géré est offert dans un nombre limité de régions (US, EU, Australie, Moyen-Orient/EAU, Inde) **sans région canadienne confirmée publiquement** (à vérifier). La réponse souveraine de Kong pour BBQ passe donc par le **déploiement self-managed du plan de contrôle on-prem ou en cloud souverain canadien**, ce qui est pleinement supporté mais déporte une part de l'exploitation chez le client. Ce point est traité sans détour en sections 2, 4 et 12.

---

## 2. Architecture et déploiement hybride / on-prem (point critique)

> **Critères couverts : C3 (12 pts), avec impact sur C2.** Exigences : EA-01 à EA-14, EX-02, EN-05 à EN-09.

### 2.1 Séparation plan de contrôle / plan de données (EA-01)

Kong sépare nativement et de longue date le **plan de contrôle** (configuration, gouvernance, analytique) du **plan de données** (les gateways qui traitent le trafic). Cette séparation est le mode de fonctionnement de référence (« hybrid mode ») : le plan de contrôle distribue la configuration aux gateways, qui appliquent les politiques sur le trafic réel. La communication CP↔DP est sécurisée par **mTLS sur le port 443**, la clé privée ne transitant pas sur le réseau. **Conformité : C (native).**

### 2.2 Liberté de placement du plan de contrôle (EA-02) — le point souverain

BBQ exige que le plan de contrôle puisse résider **soit en cloud souverain canadien, soit on-prem**. Deux options Kong :

1. **Konnect self-managed (on-prem ou cloud canadien).** Le plan de contrôle Kong est déployé et opéré par BBQ dans ses data centers (Québec/Ontario) ou en cloud canadien, sous contrôle exclusif du client. **C'est l'option recommandée pour la souveraineté de BBQ.** Conformité **CP** (conforme par déploiement self-managed ; exploitation à la charge de BBQ).
2. **Konnect SaaS géré par Kong.** Plus simple à exploiter, mais le plan de contrôle géré **n'est pas confirmé disponible dans une région canadienne** (régions actuelles : US, EU, Australie, EAU, Inde — **à vérifier** pour une région Canada). Pour BBQ, le SaaS géré conviendrait uniquement aux **métadonnées non réglementées** et aux charges non sensibles, sous réserve d'analyse de souveraineté.

> **Position franche.** Pour respecter strictement EX-01 (souveraineté) et EC-01/EC-02, BBQ devrait retenir le **plan de contrôle self-managed**. Aucune donnée réglementée ne transitant par un plan de contrôle hébergé hors Canada n'est alors en cause. La contrepartie est opérationnelle (BBQ exploite le control plane), à arbitrer en PoC-A.

### 2.3 Placement des gateways là où circulent les données (EA-03)

Le **plan de données Kong Gateway Enterprise** est déployable partout : data centers privés (Québec/Ontario) pour PII / paiements / assurance, cloud canadien pour les charges publiques/partenaires, et **périphérie** (succursales, DMZ) grâce à une empreinte légère. Les gateways traitent les données localement ; **seules la configuration et la télémétrie remontent au plan de contrôle**. Pour les zones les plus sensibles, la télémétrie peut être restreinte. **Conformité : C.**

### 2.4 Survivabilité / mode déconnecté (EA-04, EA-05, EX-02) — exigence critique

Kong répond **nativement** à la survivabilité, point souvent sous-estimé et ici obligatoire :

- Quand une gateway perd le plan de contrôle, elle **continue d'appliquer la dernière configuration reçue**, mise en cache localement (base LMDB `dbless.lmdb` sur disque en Gateway 3.x).
- Les gateways peuvent même **redémarrer en mode déconnecté** et recharger la configuration depuis le cache.
- Une **configuration de repli déclarative** (`declarative_config` YAML) sert de filet de sécurité additionnel.
- **Resynchronisation automatique** au rétablissement du lien.

**Réserve d'honnêteté (EA-05).** Kong garantit la **continuité d'application des politiques** sans limite de durée stricte tant que la gateway tourne (le cache persiste). En revanche, le comportement précis attendu par EA-05 — **durée maximale documentée et bascule fail-open / fail-closed configurable par politique** — dépend de la configuration retenue (validation de jeton hors-ligne, expiration des caches de jetons/JWKS, quotas distribués). **À démontrer en PoC-A** ; classé **CP** plutôt que C sans surenchère. La limitation de débit *distribuée* (synchronisée entre nœuds) peut basculer en mode local par nœud en cas de partition — comportement à valider.

### 2.5 Conteneurs, Kubernetes, air-gapped (EA-06)

Kong fournit une distribution conteneurisée, des charts Helm et le **Kong Gateway Operator** pour Kubernetes. Le déploiement **air-gapped** (sans Internet sortant) est supporté pour les zones sensibles, avec images et licences fournies hors-ligne. **Conformité : C.** *(Modalités exactes du provisioning de licence en air-gap à confirmer en PoC.)*

### 2.6 Portabilité multi-cloud et réversibilité (EA-07, EA-14)

Le runtime Kong Gateway s'exécute de façon identique sur tout Kubernetes/VM, on-prem ou multi-cloud, **sans dépendance à des services propriétaires non substituables**. La configuration est exportable/importable en YAML déclaratif (outil **decK**, GitOps), ce qui fournit une **stratégie de sortie crédible** : définitions d'API, politiques et consumers s'exportent dans des formats ouverts. **Conformité : C.** C'est un atout différenciant face aux passerelles purement cloud-natives mono-fournisseur.

### 2.7 Multi-région, HA, RTO/RPO (EA-08, EN-05 à EN-09)

- **Multi-région actif/actif ou actif/passif** au Canada : supporté en déployant des groupes de gateways par région avec configuration répliquée depuis le plan de contrôle.
- **Disponibilité du plan de données ≥ 99,99 %** : atteignable en architecture multi-nœuds/multi-région (sans SPOF), le plan de données étant sans état (stateless) côté trafic. **Conformité : CP — l'atteinte du SLA dépend de l'architecture déployée par BBQ ; Kong ne « vend » pas un SLA 99,99 % sur une gateway self-managed, c'est une cible d'architecture.**
- **RTO ≤ 1 h / RPO ≈ 0** (EN-07) : la configuration étant versionnée en Git (decK/GitOps) et répliquée, le RPO proche de zéro sur la configuration est réaliste ; le RTO dépend de l'automatisation de bascule BBQ. **CP, à valider en PoC.**

### 2.8 Synthèse C3

| Aspect | Conformité | Commentaire |
|---|---|---|
| Séparation CP/DP | C | Mode de référence |
| CP on-prem / cloud canadien | CP | Self-managed recommandé ; SaaS canadien à vérifier |
| Gateways multi-environnements | C | Y compris périphérie |
| Survivabilité déconnectée | C / CP | Continuité oui ; durée et fail-open/closed à démontrer |
| Air-gapped | C | |
| Portabilité multi-cloud / réversibilité | C | Atout fort (decK, YAML, OSS) |
| Multi-région / HA / RTO-RPO | CP | Cibles d'architecture à valider en PoC |

---

## 3. Sécurité

> **Critère couvert : C1 (12 pts).** Exigences : ES-01 à ES-19, EF-18, EF-22.

### 3.1 Authentification et autorisation (ES-01, ES-02, ES-04, ES-05)

- **OAuth2 / OIDC** : plugins natifs de validation de jetons (JWT et opaques par introspection), vérification de signature, expiration, émetteur (iss), audience (aud). **C.**
- **Autorisation fine par scopes et claims** : application par route/méthode/ressource via plugins (OIDC, JWT, ACL). **C.**
- **Intégration IAM d'entreprise** (SAML 2.0 pour l'admin, OIDC pour les consommateurs) avec les principaux IdP. **C.**
- **Zero Trust / PEP** : la gateway agit comme point d'application de politique à chaque appel ; pas de confiance implicite. **C.**
- **Autorisation externalisée (OPA / PDP)** (ES-07, souhaité) : intégration possible à un moteur de politiques externe (OPA) via plugin. **CP.**

### 3.2 mTLS et FAPI (ES-03, EF-18)

- **mTLS** côté consommateur et côté back-end, avec validation de chaîne de certificats. **C.**
- **FAPI / certificate-bound tokens** : Kong propose un **plugin FAPI** et le support des *certificate-bound access tokens* (liaison jeton-certificat), éléments requis par les profils Open Banking. **CP — alignement FAPI 2.0 et profil canadien définitif à confirmer en PoC ; le profil canadien d'Open Banking est lui-même « à vérifier ».**

### 3.3 Protection contre les menaces API / WAF-WAAP (ES-08 à ES-11, EF-22)

- **OWASP API Security Top 10** : couverture via combinaison de plugins (validation de schéma stricte de requête/réponse, rate limiting, ACL, contrôle de taille, bornage de ressources). **CP — la couverture BOLA/BFLA et l'abus de logique métier relève d'une configuration soignée (validation d'autorisation au niveau objet), pas d'un bouton unique ; à démontrer en PoC-D.**
- **WAF / WAAP API** : Kong intègre des capacités de protection (validation de schéma, plugins de sécurité) ; pour un WAF complet d'inspection de charge, l'intégration à un WAF/WAAP dédié ou à des partenaires reste courante. **CP — un WAF applicatif exhaustif peut nécessiter un composant tiers (T) selon le niveau d'inspection attendu.**
- **Limitation adaptative, géo-restriction, quarantaine** : rate limiting (y compris avancé), restriction d'IP/géo, et quarantaine des consommateurs par révocation/ACL. **C / CP.**
- **Détection d'anomalies comportementales** (ES-11, bourrage d'identifiants, scraping) : **CP / T — capacités via plugins et intégration SIEM/outils de détection ; la détection comportementale avancée s'appuie souvent sur l'écosystème (SIEM, bot detection). À vérifier le périmètre natif.**

### 3.4 SIEM, secrets, chiffrement, clés (ES-12 à ES-19)

- **Export SIEM** (ES-12) : journaux et événements exportables en JSON vers SIEM/SOC via plugins de logging (HTTP, Syslog, Kafka). **C.**
- **Chiffrement en transit** TLS 1.2 minimum / **TLS 1.3** supporté, suites configurables. **C.**
- **Chiffrement au repos** (configurations, secrets, journaux) AES-256 : **C** côté infrastructure ; les secrets de la gateway peuvent être chiffrés (keyring) et externalisés.
- **Gestion des secrets / KMS / HSM** (ES-17) : Kong supporte des **références de secrets** vers des coffres externes (HashiCorp Vault, AWS/GCP/Azure secret managers, variables d'environnement). Intégration HSM via le KMS/coffre d'entreprise. **C / CP.**
- **BYOK / HYOK** (ES-16) — **point sensible et honnête** : Kong n'est pas un système de gestion de clés ; il **consomme** les clés depuis le KMS/HSM/coffre de BBQ. Le **BYOK** (clés gérées par le client dans un KMS contrôlé par BBQ) est donc atteignable par architecture. Le **HYOK** (clés conservées et opérées entièrement hors de la plateforme) est cohérent avec un déploiement **self-managed** où BBQ maîtrise le KMS/HSM. **CP — il n'existe pas un « bouton BYOK/HYOK » produit unique ; la garantie repose sur l'architecture self-managed + KMS/HSM de BBQ. À cadrer précisément.**
- **Rotation automatisée** des secrets/certificats (ES-18) : supportée via le coffre et l'automatisation ; rotation sans interruption à valider. **CP.**
- **Post-quantique (PQC)** (ES-19, souhaité) : dépend du support TLS sous-jacent (OpenSSL) ; **feuille de route à vérifier**. **R / à vérifier.**

### 3.5 Synthèse C1 — verdict sans surenchère

Kong est **solide en authn/authz, mTLS et application Zero Trust à la gateway**. La couverture OWASP API Top 10 et WAAP est **bonne mais composite** (plusieurs plugins + parfois un tiers), et le BYOK/HYOK est une **propriété d'architecture** (KMS/HSM de BBQ) plutôt qu'une fonctionnalité packagée. À démontrer en PoC-D.

---

## 4. Conformité et souveraineté

> **Critère couvert : C2 (13 pts — le plus pondéré).** Exigences : EC-01 à EC-14, EX-01, EX-03.

### 4.1 Résidence des données au Canada (EC-01)

Avec le **plan de données self-managed déployé au Canada** (data centers Québec/Ontario ou cloud canadien), **les données réglementées ne quittent pas le périmètre canadien** : elles sont traitées localement par les gateways. C'est l'argument central de souveraineté de Kong et il est **techniquement solide**. **Conformité : C (sous architecture self-managed).**

**Nuance plan de contrôle.** Si BBQ utilisait le **Konnect SaaS géré**, des **métadonnées et de la télémétrie** (et non les charges utiles métier) remonteraient vers une région Konnect hors Canada (région canadienne **à vérifier**). Pour une conformité stricte, la recommandation reste le **plan de contrôle self-managed au Canada**, éliminant toute sortie de données. *(Voir section 12, risque R1.)*

### 4.2 Garanties anti-extraterritorialité / Cloud Act (EC-02)

En **déploiement self-managed sous contrôle exclusif de BBQ**, le **risque Cloud Act est fortement réduit** : aucune donnée réglementée n'est hébergée par Kong ; l'éditeur fournit le logiciel, pas l'hébergement. Les **garanties contractuelles** (notification de toute demande d'accès, localisation) doivent figurer au contrat. **CP — la posture technique est forte ; les garanties contractuelles formelles sont à négocier et à vérifier auprès de Kong.**

### 4.3 Pistes d'audit immuables (EC-03, EX-03)

Kong produit des journaux d'accès, de changement de configuration et de décision de politique, exportables vers SIEM et systèmes de stockage **append-only / WORM** côté BBQ. **L'immuabilité « infalsifiable à intégrité vérifiable » est généralement obtenue par l'export vers un stockage immuable du SIEM/SOC**, pas par une fonctionnalité de registre cryptographique interne à Kong. **CP — immuabilité atteinte par architecture (SIEM/WORM). À démontrer en PoC-F.**

### 4.4 Rapports de conformité, BSIF, PCI, SOC 2 (EC-04 à EC-08)

- **Rapports exploitables BSIF / SOC 2 / PCI** (EC-04) : Kong fournit l'analytique, les journaux et l'export d'évidences ; la production de rapports « prêts pour le BSIF » est un **assemblage** (analytique Kong + SIEM + tableaux de bord). **CP.**
- **Alignement BSIF B-13 / B-10 / B-2 / E-21** (EC-05, EC-06) : Kong peut **documenter** la couverture des attentes applicables à une plateforme d'APIM (gestion du changement, résilience, journalisation, tiers). **CP — documentation à fournir par Kong ; pas une « certification BSIF » (il n'en existe pas).**
- **SOC 2 Type II** (EC-07) : Kong publie un centre de conformité ; **l'attestation SOC 2 Type II du service Konnect est revendiquée publiquement** et les rapports sont communiqués sous NDA. **CP / à vérifier** pour le périmètre exact (Konnect SaaS vs composants self-managed — un logiciel self-managed n'est pas « SOC 2 » en soi ; c'est l'opération de BBQ qui l'est).
- **PCI-DSS v4.0** (EC-08) : Kong dispose d'un **Report on Compliance (RoC) / Attestation of Compliance** pour Kong Konnect (PCI QSA). **CP / à vérifier** la version exacte (v4.0) et le périmètre applicable à la passerelle dans le CDE de BBQ. La gateway aide à la conformité (segmentation, chiffrement, journalisation, contrôle d'accès) mais **n'absout pas** BBQ de son propre périmètre PCI.
- **FedRAMP / Protected B** : **non applicable directement / à vérifier.** FedRAMP est un cadre **états-unien** (peu pertinent pour la souveraineté canadienne) ; un équivalent **« Protected B » du gouvernement du Canada** pour Konnect SaaS **n'est pas confirmé** et serait, de toute façon, contourné par le déploiement self-managed. **À vérifier — ne pas présumer une homologation Protected B.**

### 4.5 Loi 25 / LPRPDE, consentement, classification (EC-09 à EC-13)

- **Consentement granulaire et révocable** (EF-19, EC-09) : Kong applique et trace l'autorisation au niveau de la gateway ; **la gestion du cycle de vie du consentement (registre, durée, révocation) Open Banking n'est pas un module produit dédié** et s'appuie sur un service de consentement (custom ou partenaire) orchestré derrière la gateway. **CP / T — Kong applique les politiques ; le « consent management system » est à intégrer.**
- **Classification des données et politiques par classification** (EC-10, EC-11) : la classification au niveau API (métadonnées, tags) et l'application automatique de politiques (résidence, masquage, journalisation) sont réalisables via le catalogue, les tags et le **policy-as-code (decK/GitOps + linting en CI/CD)**. **CP — conformité par conception atteignable, à configurer.**
- **Rétention / purge configurables** (EC-12) : gérée côté stockage de journaux/SIEM. **CP.**
- **Cloisonnement assurance / AMF** (EC-13) : via **control plane groups / multi-tenant** et séparation des gateways par unité d'affaires. **C / CP.**

### 4.6 Localisation du support (EC-14)

Présence et support de Kong au Canada **à vérifier** (équipes/accès opérés depuis le Canada pour les environnements sensibles). À confirmer dans la due diligence B-10. **À vérifier.**

### 4.7 Synthèse C2 — verdict honnête

Kong **peut atteindre une souveraineté forte** grâce au modèle self-managed (données réglementées 100 % au Canada, clés sous KMS/HSM de BBQ, risque Cloud Act réduit). Les **certifications (PCI RoC, SOC 2 Type II)** existent côté Konnect SaaS mais **leur portée sur un déploiement self-managed et la version v4.0 sont à vérifier**. Les briques « consentement Open Banking » et « audit immuable » sont des **assemblages** plutôt que des modules clés en main. C2 est le critère où BBQ doit exiger le plus de preuves contractuelles.

---

## 5. Couverture fonctionnelle des 10 cas d'usage

> **Critères couverts : C4 (11), C5 (9) et transverses.** Légende : **C** native · **CP** par configuration · **T** par tiers/module · **R** roadmap · **NC** non couvert.

### 5.1 Tableau de couverture des UC

| UC | Intitulé | Couverture | Justification synthétique |
|---|---|---|---|
| **UC1** | Open Banking gouverné (FAPI, consentement) | **CP** | FAPI / certificate-bound tokens via plugins (alignement profil canadien à vérifier). **Gestion du consentement = service à intégrer (T).** Traçabilité du partage : journaux + audit. |
| **UC2** | Paiements temps réel RTR / ISO 20022 | **CP** | Idempotence (clé d'idempotence), faible latence, rate limiting, validation de schéma stricte. **Connecteur RTR/ISO 20022 = médiation à construire ; specs RTR à vérifier.** |
| **UC3** | Portail partenaires / marketplace B2B | **C** | Developer Portal self-service, abonnements gouvernés, plans/quotas, cycle de vie des credentials, multi-tenant, branding bilingue. |
| **UC4** | Façade mainframe / cœur (REST⇄SOAP) | **C / CP** | Médiation REST⇄SOAP, transformation XML⇄JSON, cache, circuit breaker / fallback / bulkhead. **Connecteur mainframe natif = à valider selon protocole (souvent via SOAP/REST exposé) ; CP.** |
| **UC5** | AuthN / AuthZ centralisées | **C** | OAuth2/OIDC, mTLS, validation de jetons, scopes/claims, intégration IAM, Zero Trust à chaque appel. |
| **UC6** | Protection menaces et abus API | **CP** | Validation de schéma, rate limiting adaptatif, géo-restriction, quarantaine, export SIEM. **BOLA/BFLA et anomalies comportementales = configuration soignée + parfois tiers.** |
| **UC7** | Observabilité, traçabilité, audit | **C / CP** | OpenTelemetry (métriques/logs/traces), corrélation, export SIEM/APM. **Audit immuable = via stockage WORM du SIEM (CP).** |
| **UC8** | Événementiel / streaming / webhooks | **CP** | **Kong Event Gateway** (proxy Kafka, politiques, schémas). AsyncAPI au portail **« coming soon » / à vérifier**. Webhooks sortants gouvernés (DLQ, signature) : CP. |
| **UC9** | Gouvernance cycle de vie / conformité par conception | **C / CP** | Catalogue, versionnage, dépréciation, **linting OpenAPI**, CI/CD GitOps (decK), portes qualité/sécurité, policy-as-code. |
| **UC10** | Médiation IA / MCP / agents | **C / CP** | **Kong AI Gateway** : passerelle LLM multi-modèles, contrôle de jetons, **MCP Gateway**, garde-fous, **masquage PII (20 catégories, 9 langues)**, audit prompts/réponses, plafonds de coût. Différenciateur fort et récent. |

### 5.2 Détail des capacités cœur (C4)

- **Médiation de protocoles** : REST/JSON, HTTP/1.1, HTTP/2, **REST⇄SOAP**, transformation XML⇄JSON, mappage d'en-têtes et de champs par **politiques déclaratives** (plugins request/response transformer), sans recompilation. **C.**
- **gRPC** : proxy gRPC et transcodage gRPC⇄REST supportés. **C / CP.**
- **GraphQL** : Kong route et sécurise GraphQL (plugins rate-limiting GraphQL, proxy-cache) ; pour une **fédération/supergraph** complète, Kong se positionne en complément d'Apollo plutôt qu'en moteur de fédération natif. **CP — voir section 8.**
- **Cache** (EF-07) : proxy-cache avec TTL, invalidation, clés configurables. **C.**
- **Protection de charge** (EF-08) : circuit breaker, retry/fallback, limitation de concurrence vers l'amont. **C / CP.**
- **Idempotence** (EF-09) : gérable par clé d'idempotence / déduplication (plugin ou logique de politique). **CP.**
- **Rate limiting / quotas** (EF-10) : par consommateur, API, plan, clé, fenêtres glissantes, seuils différenciés. **C.**

### 5.3 Gouvernance du cycle de vie et catalogue (C5)

- **Catalogue d'entreprise** (EF-03) : **Service Catalog** Konnect recensant API internes/partenaires/publiques avec métadonnées et propriétaires. **C.**
- **Cycle de vie complet** (EF-04) : conception (Insomnia), publication, versionnage, dépréciation planifiée, retrait ; routage canary/blue-green. **C / CP.**
- **Linting OpenAPI** (EF-05) : règles de design appliquées en CI/CD, blocage de publication non conforme. **CP.**
- **CI/CD GitOps / API-as-code** (EF-06) : **decK** (configuration déclarative en Git), portes qualité/sécurité, conformité par conception. **C** — atout réel de Kong.

---

## 6. Performance et scalabilité

> **Critère couvert : C6 (7 pts).** Exigences : EN-01 à EN-04, EF-22.

- **Latence ajoutée faible** : le moteur Kong (Nginx/OpenResty) est reconnu pour une **latence additionnelle de l'ordre de quelques millisecondes** à charge nominale. Les cibles RFP (médiane ≤ 10 ms, p99 ≤ 30 ms) sont **réalistes** dans une configuration maîtrisée (peu de plugins lourds sur le chemin critique). **CP — à mesurer en PoC-B ; la latence p99 dépend du nombre et de la nature des plugins, du mTLS, de la validation de schéma.**
- **Débit** : Kong soutient des **dizaines de milliers de req/s par cluster** avec **montée en charge horizontale** quasi linéaire (gateways sans état). **CP — volumétrie précise à confirmer au PoC, sur l'infrastructure de BBQ.**
- **Charge de pointe paiements** (EN-03) : faible latence + idempotence tenables ; **délestage gracieux et priorisation du trafic critique** (EN-04) configurables (rate limiting, request-termination). **CP.**
- **Empreinte légère** : adaptée à la périphérie (succursale/DMZ).

**Verdict C6 — sans surenchère.** La performance est un **point fort réel** de Kong. Les chiffres exacts (latence p99, req/s) doivent être **produits en PoC-B sur l'environnement BBQ** et non promis sur dossier.

---

## 7. Observabilité

> **Critère couvert : C7 (7 pts).** Exigences : EN-10 à EN-13, EC-03.

- **OpenTelemetry natif** (EN-10) : émission de **métriques, journaux et traces distribuées** au standard OTel, avec **propagation d'un identifiant de corrélation** à travers les environnements hybrides. **C.**
- **Intégration outils d'entreprise** (EN-11) : export vers Prometheus/Grafana, Datadog, plateformes de traces/logs, et **SIEM** (formats ouverts). **C.**
- **Tableaux de bord** (EN-12) : analytique Konnect (trafic, erreurs, latence, sécurité, consommation par partenaire) + tableaux de bord externes (Grafana). **C / CP.**
- **Alerting** (EN-13) : seuils de latence, taux d'erreur, anomalies, dépassements de quota/budget vers les canaux d'exploitation. **CP.**
- **Pistes d'audit** : voir §4.3 (immuabilité par stockage WORM/SIEM).

**Verdict C7.** Observabilité **solide et standardisée (OTel)**, bien alignée avec une stack SIEM/APM d'entreprise. La corrélation cross-environnements hybrides est un point fort.

---

## 8. Événementiel / streaming et GraphQL

> **Critère couvert : C8 (6 pts).** Exigences : EF-23 à EF-26.

### 8.1 Kong Event Gateway

Kong a lancé **Kong Event Gateway**, proxy event-streaming qui s'intercale entre les clients et les **clusters Kafka**, permettant d'appliquer **authentification, chiffrement, autorisation et politiques** aux flux d'événements **via le même plan Konnect** que les API REST. **C / CP** pour la gouvernance Kafka.

- **Schémas** (EF-26, EF-22) : validation de schémas (Avro, JSON Schema, **AsyncAPI**) au point d'ingestion, rejet des messages malformés. **CP.**
- **AsyncAPI au portail** (EF-23) : support de la documentation AsyncAPI dans le Developer Portal annoncé **« coming soon »**. **R / à vérifier — non garanti disponible en juin 2026.**
- **Médiation MQTT / WebSockets / SSE** (EF-24, souhaité) : **CP / à vérifier** ; le cœur de l'Event Gateway vise Kafka.
- **Webhooks sortants gouvernés** (EF-25) : souscription, signature, retries, DLQ — réalisables, **CP** (souvent par configuration/composition).

### 8.2 GraphQL

Kong **route, sécurise et limite** GraphQL (plugins dédiés, cache). Pour la **fédération/supergraph** d'entreprise, Kong se positionne en **complément d'Apollo** (blueprint conjoint) plutôt qu'en moteur de fédération natif. **CP — adéquat pour exposer/sécuriser GraphQL en façade ; fédération avancée via partenaire.**

**Verdict C8.** Capacité **réelle et en progression** (Event Gateway pour Kafka), mais **plus récente et moins mature** que le cœur REST. AsyncAPI au portail et MQTT sont **à vérifier**. À tester en PoC si UC8 est prioritaire.

---

## 9. IA / LLM et agentique

> **Critère couvert : C9 (7 pts).** Exigences : EF-27 à EF-30. **Différenciateur fort de Kong.**

**Kong AI Gateway** est l'un des atouts les plus actuels de la solution :

- **Passerelle LLM multi-modèles** (EF-27) : routage vers plusieurs fournisseurs/modèles (dont **Amazon Bedrock**), **limitation par jetons (tokens)**, **mise en cache sémantique**, **attribution de coût par requête**. **C.**
- **Gouvernance MCP / agents** (EF-28) : **Kong Enterprise MCP Gateway** — exposition et gouvernance de serveurs **MCP** (génération de serveurs MCP à partir de REST, application de sécurité/observabilité), connectivité **LLM + MCP + A2A** par un seul plan. **C / CP — capacité récente, à éprouver en PoC-G.**
- **Garde-fous et DLP** (EF-29) : intégration de **guardrails** (p. ex. Lakera.ai, AWS Guardrails), filtrage de contenu, et **masquage / caviardage des PII** intégré (détection sur **20 catégories, 9 langues**). **C / CP.**
- **Audit prompts/réponses et plafonds budgétaires** (EF-30) : journalisation des invocations, audit, attribution de coût et **plafonds par application/équipe/clé** avec alerte au dépassement. **C / CP.**

**Verdict C9 — honnête.** Kong est **en avance** sur l'axe IA/agentique (AI Gateway, MCP Gateway, masquage PII multilingue). C'est un **différenciateur réel**. Réserve : ces capacités sont **récentes et en évolution rapide** ; leur robustesse en production réglementée (FSI) doit être **démontrée en PoC-G**, en particulier l'efficacité du masquage PII sur des données canadiennes bilingues et la prévention de fuite vers les modèles.

---

## 10. Expérience développeur et gouvernance

> **Critère couvert : C10 (8 pts).** Exigences : EF-12 à EF-17, EA-10, EN-14.

- **Portail développeur self-service** (EF-12) : découverte, **bac à sable / sandbox**, documentation interactive (OpenAPI), abonnement. **C.**
- **Abonnements gouvernés multi-niveaux** (EF-13) : workflow demande → revue → approbation → provisionnement. **C / CP.**
- **Cycle de vie des credentials partenaires** (EF-14) : clés API, secrets, **certificats mTLS** — émission, rotation, révocation, expiration en libre-service encadré. **C / CP.**
- **Plans de quota / tiers par partenaire** (EF-15) : différenciation fintech / courtier / agrégateur, application à la gateway. **C.**
- **Personnalisation, multi-tenant, bilingue FR/EN** (EF-16) : branding BBQ, thèmes, cloisonnement multi-organisation ; **bilinguisme FR/EN à vérifier** au niveau du portail packagé (la personnalisation du contenu le permet, le packaging bilingue natif est à confirmer). **CP.**
- **Monétisation / refacturation** (EF-17, souhaité) : mesure d'usage et rapports de consommation par partenaire ; monétisation avancée **CP / à vérifier**.
- **Génération de SDK** : **à vérifier** dans le portail packagé (souvent via OpenAPI generator / outillage tiers). **CP / T.**
- **API d'administration déclarative complète** (EA-10) : **decK** et l'API d'admin couvrent l'automatisation/IaC — **atout fort** pour la gouvernance GitOps. **C.**
- **Console unifiée multi-environnements** (EN-14) : Konnect gouverne l'ensemble des gateways depuis un **plan de gouvernance unique** (avec control plane self-managed pour BBQ). **C / CP.**

**Verdict C10.** Bonne expérience développeur, **forte orientation API-as-code/GitOps** (différenciateur pour des équipes plateforme matures). Réserves mineures : bilinguisme FR/EN packagé, génération de SDK, monétisation — **à vérifier**.

---

## 11. Tarification indicative et TCO 3 ans

> **Critère couvert : C11 (8 pts).** Exigences : EN-16, EA-14, EA-07. **Tous les montants ci-dessous sont INDICATIFS, NON CONTRACTUELS, et reposent sur des hypothèses publiques — à confirmer par devis Kong.**

### 11.1 Modèle de licence (faits publics, juin 2026)

- **Kong Enterprise** : licence **entièrement personnalisée (devis)**, négociée avec l'équipe commerciale Kong. Pas de tarif public ferme à l'échelle entreprise.
- **Kong Konnect** : modèle **hybride** combinant un **coût par service de gateway** (ordre de grandeur public **~105 $US/service/mois**) et un **coût à l'usage** (**~34 $US / million de requêtes**, ordre de grandeur public). *(à vérifier — barèmes susceptibles d'évoluer.)*
- Les **plugins IA / capacités avancées** peuvent relever d'un palier supérieur ou d'add-ons. *(à vérifier.)*

> **Risque de prévisibilité (EN-16).** BBQ exige un modèle **prévisible, indépendant d'une facturation à l'appel non maîtrisable**. Le modèle Konnect SaaS comporte une **composante par requête** qui, à l'échelle pancanadienne et avec les pics de paiements temps réel, peut **réduire la prévisibilité**. **Atténuation : une licence Kong Enterprise self-managed à base de capacité/cœurs/nœuds (négociée) offre une prévisibilité supérieure** et évite la facturation à l'appel. C'est la voie recommandée pour BBQ et cohérente avec la souveraineté. **À négocier explicitement.**

### 11.2 Hypothèses de l'estimation TCO (explicites)

| Hypothèse | Valeur retenue (simulation) |
|---|---|
| Modèle retenu | **Kong Enterprise self-managed** (souveraineté) + Konnect self-managed control plane |
| Volumétrie | Plusieurs dizaines de milliers de req/s en pointe, multi-région Canada |
| Empreinte | 2 régions actives (QC/ON) + périphérie ; clusters HA |
| Infra | Kubernetes on-prem / cloud canadien fourni par BBQ |
| Exploitation | Équipe plateforme BBQ (control plane self-managed) + support entreprise Kong |
| Horizon | **3 ans** (l'A2 demande 5 ans ; le présent gabarit demande 3 ans — voir note) |

> **Note de cohérence.** Le corps du RFP/A2 évoque un **TCO 5 ans** (EN-16) ; le présent gabarit de réponse demande un **TCO 3 ans**. Nous fournissons le **TCO 3 ans** demandé ici et signalons l'écart : une projection 5 ans devra être ajoutée au dossier de prix final.

### 11.3 Estimation TCO 3 ans (ordres de grandeur indicatifs)

| Poste | An 1 | An 2 | An 3 | Total 3 ans (indicatif) |
|---|---|---|---|---|
| Licences Kong Enterprise (capacité, négociée) | élevé (one-time + abonnement) | abonnement | abonnement | **fourchette large — à chiffrer par devis** |
| Services d'implantation (intégration, mainframe, IAM, SIEM, PoC) | significatif | résiduel | résiduel | **dépend du périmètre UC** |
| Infrastructure (Kubernetes, multi-région, périphérie) | à la charge de BBQ | idem | idem | **CAPEX/OPEX BBQ** |
| Exploitation (équipe plateforme, control plane self-managed) | OPEX continu | OPEX | OPEX | **OPEX BBQ** |
| Support entreprise Kong (24/7, TAM) | abonnement | abonnement | abonnement | **inclus/négocié** |

> **Refus de surenchère.** Nous **ne fournissons pas** de montant total ferme : le modèle Kong Enterprise étant sur devis, tout chiffre unique serait trompeur. À titre d'**ordre de grandeur sectoriel public**, des déploiements Konnect d'entreprise à fort volume sont cités entre **150 000 $US et 300 000 $US+/an** (hors infra et exploitation internes) — **à vérifier et non transposable tel quel** à une licence Enterprise self-managed négociée. Le TCO réel de BBQ doit être établi **après PoC et devis**.

### 11.4 Anti-verrouillage (atout TCO)

- Runtime de passerelle à **variante open source**, **configuration YAML ouverte (decK)**, **standards ouverts** (OpenAPI, AsyncAPI, OTel, OAuth2/OIDC).
- **Stratégie de sortie** crédible (export complet, formats ouverts), **portabilité multi-cloud** réelle.
- **Verdict** : Kong présente un **risque de verrouillage plus faible** que des passerelles 100 % propriétaires/cloud-mono-fournisseur — argument fort sur C11.

---

## 12. Références FSI et limites / risques honnêtes

### 12.1 Références FSI

Kong est largement adopté, y compris dans des **institutions financières réglementées** et de grandes entreprises. Des **références clients comparables** (FSI, contexte hybride/souverain) sont communicables **sous NDA** dans le cadre de la due diligence B-10. **Les références nommées et leur pertinence pour le contexte canadien hybride/souverain sont à vérifier et à fournir par Kong.**

### 12.2 Limites et risques honnêtes (registre transparent)

| # | Risque / limite | Gravité | Atténuation |
|---|---|---|---|
| **R1** | **Région Konnect SaaS au Canada non confirmée** (régions actuelles US/EU/AU/EAU/Inde). | Élevée pour C2 | **Plan de contrôle self-managed au Canada** (recommandé). Métadonnées maîtrisées. À vérifier auprès de Kong. |
| **R2** | **BYOK/HYOK** = propriété d'architecture (KMS/HSM de BBQ), pas un module produit unique. | Moyenne | Cadrage KMS/HSM en PoC-A ; self-managed. |
| **R3** | **Audit immuable** obtenu via stockage WORM/SIEM, pas un registre cryptographique interne Kong. | Moyenne | Architecture SIEM/WORM ; PoC-F. |
| **R4** | **Consentement Open Banking** et **connecteur RTR/ISO 20022** = à construire/intégrer (pas des modules clés en main). | Moyenne-Élevée (UC1/UC2) | Service de consentement + médiation dédiée ; specs canadiennes **à vérifier**. |
| **R5** | **Survivabilité** : continuité OK, mais **durée max et fail-open/closed par politique** à démontrer (EA-05) ; rate limiting distribué peut dégrader en partition. | Moyenne | PoC-A imposé. |
| **R6** | **OWASP API Top 10 / WAAP** = couverture composite (plugins + parfois tiers) ; BOLA/BFLA exige configuration soignée. | Moyenne | PoC-D ; éventuel WAF/WAAP tiers. |
| **R7** | **Événementiel** plus récent : **AsyncAPI au portail « coming soon »**, MQTT/SSE à vérifier. | Moyenne (C8) | PoC si UC8 prioritaire ; valider la roadmap. |
| **R8** | **Certifications** (PCI-DSS v4.0 exact, SOC 2 Type II) revendiquées côté **Konnect SaaS** ; portée sur **self-managed** différente. **Protected B / FedRAMP non confirmés**. | Élevée pour C2 | Exiger les attestations et le périmètre précis ; **à vérifier**. |
| **R9** | **Modèle de prix Konnect** comporte une **composante par requête** réduisant la prévisibilité à grande échelle. | Moyenne (C11) | Négocier une **licence Enterprise self-managed à capacité**. |
| **R10** | **IA/MCP** : capacités fortes mais **récentes** ; robustesse FSI à éprouver (masquage PII bilingue, anti-fuite). | Moyenne (C9) | PoC-G ; tests sur données canadiennes FR/EN. |
| **R11** | **Exploitation déportée** : le self-managed (recommandé pour souveraineté) **transfère une charge d'exploitation à BBQ** (control plane, mises à niveau, HA). | Moyenne | Support entreprise Kong + transfert de compétences (EN-18, FR/EN à vérifier). |

### 12.3 Synthèse de la candidature Kong

**Forces saillantes :** architecture hybride et **survivabilité** matures (C3) ; **souveraineté atteignable** par self-managed avec données réglementées 100 % au Canada (C2, sous conditions) ; **anti-verrouillage réel** (OSS, decK, standards ouverts, multi-cloud) (C11) ; **performance/faible latence** (C6) ; **leadership IA/MCP/AI Gateway** différenciant (C9) ; cœur fonctionnel et GitOps solides (C4/C5).

**Vigilances majeures :** **région Konnect SaaS canadienne et certifications par périmètre à vérifier** (C2) ; **BYOK/HYOK, audit immuable, consentement Open Banking, connecteur RTR/ISO 20022 = assemblages** plutôt que modules clés en main ; **événementiel et IA plus récents** (à éprouver en PoC) ; **prévisibilité tarifaire** dépendante du modèle de licence retenu ; **charge d'exploitation** accrue en self-managed.

**Recommandation de validation :** prioriser **PoC-A (souveraineté + survivabilité)**, **PoC-D (sécurité OWASP)**, **PoC-F (audit immuable)** et **PoC-G (IA/MCP/PII)** pour lever les réserves les plus pondérées (C2, C1, C7, C9).

---

*Fin de la réponse simulée du candidat Kong — RFP-BBQ-APIM-2026. Organisation cliente fictive ; réponse simulée à partir de capacités produit publiques de Kong vérifiées en juin 2026 (dont le Gartner Magic Quadrant for API Management du 7 octobre 2025) ; prix indicatifs et non contractuels ; éléments incertains ou postérieurs à juin 2026 marqués « à vérifier ». Cette réponse n'engage pas Kong Inc.*

### Sources publiques principales (juin 2026)

- Kong Docs — Hybrid mode, CP/DP communication, Network Resiliency, Dedicated Cloud Gateways, Event Gateway, AI Gateway.
- Kong Inc. — Blog/Press : Leader Gartner Magic Quadrant for API Management (7 oct. 2025, 6e année) ; Dedicated Cloud Gateways GA ; Enterprise MCP Gateway ; AI Gateway 3.13 ; Kong Event Gateway ; Konnect Middle East & India.
- Kong Inc. — Centre de conformité / PCI-DSS (RoC Konnect) ; pages produit Kong Gateway / AI Gateway / Event Gateway.
- Kong Inc. — Page Pricing Konnect (ordres de grandeur par service / par requête).

*(URLs détaillées disponibles ; certaines affirmations sensibles au temps — région Canada, version PCI v4.0, SOC 2 par périmètre, AsyncAPI au portail — restent marquées « à vérifier ».)*
