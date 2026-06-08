# Réponse RFP — IBM API Connect (réponse simulée)

> **Avertissement :** réponse simulée à des fins d'évaluation comparative, ancrée sur les capacités réelles vérifiées (juin 2026). Les prix indiqués sont indicatifs et illustratifs uniquement — ils ne constituent en aucun cas une offre commerciale contractuelle. Toute proposition ferme nécessite un engagement direct avec IBM Canada.

---

## Sommaire exécutif

IBM API Connect, composante centrale du Cloud Pak for Integration (CP4I), représente la plateforme de gestion d'API la plus éprouvée dans le secteur des services financiers à l'échelle mondiale : plus de 400 institutions financières dans 80 pays s'appuient sur la passerelle DataPower, dont la réputation en matière de sécurité et de conformité est sans équivalent dans l'industrie. Reconnu Leader au Magic Quadrant Gartner API Management 2025 pour la dixième fois consécutive — avec la position dominante dans cinq des six cas d'usage des Critical Capabilities — et Leader au Forrester Wave Q3 2024 avec le meilleur score de l'offre actuelle, IBM API Connect incarne aujourd'hui une plateforme repositionnée comme « agentic AI-powered API management ».

Pour le Groupe Financier Boréal (GFB), le modèle de déploiement hybride réel — plan de contrôle SaaS (Reserved Instance sur IBM Cloud, régions Toronto ou Montréal) couplé à des passerelles DataPower auto-gérées sur site en sol canadien — répond directement aux impératifs de souveraineté des données et de résidence canadienne (PIPEDA, Protected B). La convergence avec le portefeuille webMethods (acquis de Software AG, GA juin 2025) et la sortie d'API Connect V12 (GA 16 décembre 2025) consolident une feuille de route unifiée couvrant REST, événementiel AsyncAPI/Kafka, GraphQL et gouvernance agentique via DataPower Interact Gateway.

Les réserves à considérer : complexité opérationnelle élevée (OpenShift requis pour le déploiement auto-géré), modèle de licence CP4I en VPC potentiellement sur-dimensionné, et certains points de conformité spécifiques au SaaS canadien qui demandent confirmation auprès d'IBM.

---

## 1. Réponse aux cas d'usage (CU-01 à CU-10)

### CU-01 — API partenaires & Open Banking

IBM API Connect propose un portail développeur basé sur Drupal, entièrement personnalisable, exposant des catalogues multi-organisations avec contrôle d'accès RBAC granulaire. Le modèle Produit/Forfait (Plans) permet de segmenter les offres par partenaire (limites de débit, quotas, portées OAuth différenciés). La conformité aux standards Open Banking (FAPI 1.0/2.0, OAuth 2.0 Authorization Code + PKCE) est native via DataPower comme serveur OAuth/resource server. **Confirmé.** API Studio (GA décembre 2025) accélère la conception avec génération assistée par IA et intégration Git/CI-CD.

### CU-02 — Façade cœur bancaire

DataPower Gateway excelle dans ce rôle : transformation de protocoles (MQ, JMS, SOAP/XML, REST/JSON), médiation de messages complexes, et accélération matérielle (crypto, transformation XSLT). La politique de cache au niveau passerelle réduit la pression sur les systèmes de dépôt-noyau. Le versionnage explicite des API avec dépréciation planifiée protège la stabilité des intégrations back-end lors des migrations. **Confirmé.** Performance en débit brut : non publiée publiquement — IBM recommande un dimensionnement sur mesure.

### CU-03 — Canaux omnicanaux (mobile, web, succursale)

La topologie multi-passerelles d'API Connect V12 permet de déployer des DataPower Nano Gateways (<20 Mo RAM, démarrage sub-seconde) à la périphérie (edge) pour les canaux mobiles, tandis que les DataPower Gateways traditionnelles servent les canaux institutionnels à haut débit. Un seul plan de contrôle gouverne l'ensemble du parc. OpenTelemetry intégré nativement dans le Nano Gateway assure l'observabilité de bout en bout. **Confirmé.**

### CU-04 — Zero Trust

DataPower implémente mTLS bout en bout, OAuth 2.0/OIDC/JWT, TLS 1.2/1.3, protection contre les attaques XML/JSON, injection SQL, et filtrage IP. Le matériel DataPower physique dispose d'un HSM FIPS 140-2 niveau 3, secure boot avec TPM, et peut être positionné en DMZ. La politique GatewayScript permet des logiques d'autorisation contextuelle avancées. IBM Cloud for Financial Services fournit le cadre de contrôles supplémentaires pour les déploiements cloud. **Confirmé.** La micro-segmentation Zero Trust au niveau réseau reste sous la responsabilité de l'infrastructure GFB.

### CU-05 — Souveraineté & hybride (résidence Canada)

C'est le point fort différenciateur d'IBM pour le GFB. Le modèle Reserved Instance place le plan de contrôle (API Manager + Developer Portal) sur IBM Cloud Canada (Toronto, Montréal), avec les passerelles DataPower physiques ou conteneurisées sur site au Canada. Les données de transaction ne quittent jamais le périmètre canadien. Le déploiement air-gap (Software, Passport Advantage + Entitled Registry) est supporté pour les environnements à connectivité restreinte. V12 fédère également des runtimes tiers (AWS API Gateway, Azure APIM) sous gouvernance centralisée. **Confirmé pour la topologie.** Disponibilité de la région Canada spécifique pour Reserved Instance : **à vérifier directement avec IBM Canada.**

### CU-06 — Événementiel Kafka

IBM Event Endpoint Management (EEM, GA septembre 2024) s'intègre nativement à API Connect : les sources Kafka (IBM Event Streams ou Confluent) sont décrites en AsyncAPI, importées dans le catalogue API Connect, et exposées via l'Event Gateway qui applique contrôle d'accès et quotas sur les sujets Kafka. Le GFB obtient une gouvernance unifiée REST + événements dans un seul portail développeur. **Confirmé.** Support AsyncAPI 2.x/3.x : **à vérifier pour la version 3.x spécifiquement.**

### CU-07 — Gouvernance fédérée & catalogue

API Connect V12 innove ici : le plan de contrôle convergé (héritage webMethods) gouverne des API à travers des passerelles hétérogènes (DataPower, webMethods API Gateway, AWS API Gateway, Azure APIM). La taxonomie multi-organisations, multi-catalogues, avec RBAC multi-niveaux (super-admin, org-admin, product-manager, developer) est native. API Studio offre un IDE IA avec intégration Git pour la gouvernance du cycle de vie dès la conception. **Confirmé.** Intégration avec des registres de gouvernance tiers (Collibra, Informatica) : **à vérifier.**

### CU-08 — IA/LLM & agentique

DataPower Interact Gateway (GA décembre 2025) est la réponse IBM aux architectures agentiques : (1) **MCP Gateway** — convertit automatiquement des API REST existantes en outils compatibles Model Context Protocol, exposant le catalogue GFB aux agents LLM ; (2) **LLM Gateway** — gouverne les appels vers watsonx.ai, OpenAI, Gemini et Azure OpenAI avec rate limiting, caching sémantique, masquage de données sensibles (PII/PHI) et audit complet. API Studio génère des serveurs MCP. IBM ContextForge (open source) complète le dispositif pour les architectures MCP/A2A/REST hybrides. **Confirmé (décembre 2025).** Maturité en production dans les FSI : **à évaluer — technologie récente.**

### CU-09 — Monétisation

Le modèle Plans permet la définition de niveaux tarifaires (freemium, usage-based, prépayé) appliqués aux abonnements partenaires. L'intégration avec des passerelles de paiement ou des systèmes de facturation tiers nécessite un développement d'intégration custom via les extensions du portail Drupal. **Confirmé pour la mécanique de base.** Facturation automatisée temps réel avec Stripe ou Zuora : **à vérifier — non documenté nativement.**

### CU-10 — Observabilité/SRE/FinOps

Le composant Analytics dédié offre 90 jours de rétention en SaaS. IBM Instana dispose d'un capteur API Connect natif avec traces DataPower. Le Nano Gateway exporte nativement en OpenTelemetry vers Datadog, Grafana ou Dynatrace. L'offload vers SIEM (Splunk, QRadar) est supporté. Pour le FinOps, le suivi de consommation par VPC dans CP4I permet une imputation par BU. **Confirmé.** Intégration Datadog/Splunk en natif sans offload intermédiaire : **à vérifier.**

---

## 2. Conformité aux exigences

Légende : **N** = Non conforme | **C** = Conforme | **M** = Conforme avec configuration | **T** = Conforme via tiers | **R** = Roadmap confirmée | **X** = Non applicable

| Ref | Exigence | Statut | Commentaire |
|-----|----------|--------|-------------|
| EF-01 | Résidence des données au Canada | **C** | IBM Cloud régions Toronto + Montréal; passerelles DataPower sur site CA |
| EF-02 | PIPEDA & loi 25 Québec | **C** | PIPEDA confirmé; IBM 27701 (vie privée); loi 25 : M (paramétrage DPA) |
| EF-03 | Protected B (GC) | **C** | *Protected B* via IBM Cloud (Toronto/Montréal) + IBM Cloud for Financial Services; FedRAMP High via IBM Cloud for Government — portée SaaS API Connect **à vérifier** |
| EF-04 | PCI-DSS v4 | **C** | Attestation IBM Cloud + DataPower HSM FIPS 140-2 L3 |
| EF-05 | DORA & EBA Guidelines | **C** | IBM Cloud for Financial Services + contrats DORA-ready |
| EA-01 | Déploiement hybride véritable | **C** | Reserved Instance + DataPower on-prem; air-gap supporté |
| EA-02 | HA multi-zone / multi-région | **C** | K8s/OpenShift HA; SLA SaaS 99,9 %, Reserved jusqu'à 99,95 % |
| EA-03 | Fédération passerelles hétérogènes | **C** | V12 : AWS APIM, Azure APIM, webMethods intégrés |
| EA-04 | Support OpenShift on-prem | **C** | CP4I natif OpenShift; déploiement opérateur |
| EA-05 | Air-gap / déconnecté | **C** | Software, Entitled Registry, Passport Advantage |
| ES-01 | mTLS bout en bout | **C** | Natif DataPower |
| ES-02 | OAuth 2.0 / OIDC / JWT | **C** | DataPower = serveur OAuth + resource server |
| ES-03 | HSM FIPS 140-2 | **C** | Niveau 3 (appliance physique), Niveau 1 (logiciel) |
| ES-04 | Protection menaces (OWASP) | **C** | XML/JSON threat, injection SQL, rate limiting, IP filtering |
| ES-05 | Zero Trust / micro-seg. réseau | **M** | Politique mTLS + RBAC; micro-seg. réseau = infrastructure GFB |
| EC-01 | Gouvernance multi-org / RBAC | **C** | Multi-niveaux natif V12 |
| EC-02 | Cycle de vie (versionnage, dépréc.) | **C** | Modèle Plans + dépréciation planifiée |
| EC-03 | Developer Portal personnalisable | **C** | Drupal, thème GFB, SSO intégrable |
| EC-04 | Catalogue API unifié REST+Event | **C** | API Connect + EEM + AsyncAPI |
| EC-05 | OpenAPI 3.1 | **M** | OpenAPI 3.0 confirmé; 3.1 : **à vérifier** |
| EN-01 | Observabilité OpenTelemetry | **C** | Nano Gateway natif OTel |
| EN-02 | Analytics 90 j+ | **C** | 90 j SaaS; extensible via offload |
| EN-03 | Intégration Instana / APM tiers | **C** | Instana natif; OTel vers Datadog/Dynatrace |
| EN-04 | Kafka / AsyncAPI (CU-06) | **C** | EEM + Event Gateway |
| EN-05 | IA/LLM Gateway (CU-08) | **C** | DataPower Interact Gateway GA déc. 2025 |

---

## 3. Architecture de référence hybride pour le GFB

```
┌─────────────────────────────────────────────────────────────────────┐
│  IBM CLOUD CANADA (Toronto / Montréal) — Plan de contrôle géré      │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐   │
│  │   API Manager    │  │ Developer Portal │  │    Analytics     │   │
│  │   (V12 SaaS      │  │   (Drupal GFB)   │  │   (90 j rét.)    │   │
│  │  Reserved Inst.) │  │                  │  │                  │   │
│  └────────┬─────────┘  └──────────────────┘  └────────┬─────────┘   │
│           │ Administration & politiques                │ Métriques   │
└───────────┼────────────────────────────────────────────┼─────────────┘
            │ (TLS 1.3 chiffré, tunnel sécurisé)         │
┌───────────┼────────────────────────────────────────────┼─────────────┐
│  DATACENTER GFB CANADA — Plan de données auto-géré     │             │
│           │                                            │             │
│  ┌────────▼───────────────────────────────────────┐   │             │
│  │         ZONE DMZ — Passerelles DataPower        │   │             │
│  │  ┌─────────────────────┐  ┌──────────────────┐  │   │             │
│  │  │  DataPower Gateway  │  │  DataPower Nano  │  │   │             │
│  │  │  (appliance physiq. │  │  Gateway (edge   │  │   │             │
│  │  │  HSM FIPS L3, mTLS) │  │  mobile/web API) │  │   │             │
│  │  └──────────┬──────────┘  └────────┬─────────┘  │   │             │
│  │             │                      │ OTel→Instana│───┘             │
│  │  ┌──────────▼──────────────────────▼─────────┐  │                 │
│  │  │   DataPower Interact Gateway (IA/LLM/MCP)  │  │                 │
│  │  └──────────────────────────────────────────┘  │                 │
│  └────────────────────────────────────────────────┘                 │
│                           │                                          │
│  ┌────────────────────────▼────────────────────────────────────┐     │
│  │              ZONE APPLICATIVE INTERNE GFB                    │     │
│  │  ┌──────────┐  ┌──────────┐  ┌────────────┐  ┌──────────┐  │     │
│  │  │ Cœur     │  │ Kafka    │  │ watsonx.ai │  │ Systèmes │  │     │
│  │  │ bancaire │  │(EEM Gov.)│  │ / LLM GFB  │  │ dépôt    │  │     │
│  │  └──────────┘  └──────────┘  └────────────┘  └──────────┘  │     │
│  └──────────────────────────────────────────────────────────────┘     │
└──────────────────────────────────────────────────────────────────────┘
```

**Flux de gouvernance :** les politiques d'API sont définies dans API Manager (cloud CA), publiées vers les passerelles DataPower sur site via un canal TLS 1.3 chiffré. Les données de transaction restent en tout temps dans le périmètre canadien. IBM Event Endpoint Management gouverne les topics Kafka exposés en AsyncAPI dans le même catalogue. DataPower Interact Gateway intercepte les appels LLM depuis les agents internes GFB, applique le masquage PII et l'audit avant de router vers watsonx.ai on-prem ou les LLM externes approuvés.

**Haute disponibilité :** passerelles DataPower en cluster actif-actif sur OpenShift (3 nœuds minimum par zone), plan de contrôle Reserved Instance avec SLA jusqu'à 99,95 %, réplication multi-zone IBM Cloud Canada.

---

## 4. Sécurité & conformité

IBM DataPower Gateway constitue la référence sectorielle pour la sécurité FSI. L'appliance physique intègre un HSM FIPS 140-2 niveau 3, le secure boot avec TPM, et peut être déployée en DMZ avec isolation réseau complète. Le logiciel DataPower (conteneur, virtuel) satisfait FIPS 140-2 niveau 1.

**Périmètre de conformité certifié (confirmé) :**

| Certification | Portée |
|---------------|--------|
| SOC 1 / 2 / 3 | IBM Cloud (plan de contrôle) |
| ISO 27001 / 27017 / 27018 / 27701 | IBM Cloud + services managés |
| PCI-DSS | IBM Cloud + DataPower (HSM) |
| FedRAMP High | IBM Cloud for Government |
| FIPS 140-2 L3 | Appliance DataPower physique |
| FIPS 140-2 L1 | DataPower logiciel/conteneur |
| GDPR | IBM Cloud (DPA disponible) |
| PIPEDA | IBM Cloud régions CA |
| Protected B (GC) | IBM Cloud for Financial Services |
| DORA / EBA | IBM Cloud for Financial Services |
| HIPAA | IBM Cloud (BAA disponible) |

**Note importante sur la portée :** les certifications cloud (SOC, ISO, FedRAMP) s'appliquent à IBM Cloud en tant que fournisseur. Pour le déploiement Software auto-géré sur infrastructure GFB, les certifications DataPower (FIPS, critères communs) s'appliquent à la passerelle elle-même, mais la certification globale de l'environnement d'hébergement relève de la responsabilité du GFB. **FedRAMP du SaaS API Connect spécifiquement (hors IBM Cloud for Government) : à vérifier auprès d'IBM.**

---

## 5. Modèle commercial (indicatif)

> Tous les prix ci-dessous sont illustratifs et non contractuels. IBM ne publie pas de tarifs publics pour API Connect. Une proposition formelle nécessite un engagement avec IBM Canada et une analyse de dimensionnement VPC.

| Modèle | Caractéristiques | Indicateur de coût |
|--------|-----------------|-------------------|
| **SaaS PAYG** | AWS, consommation à l'appel | Faible entrée; TCO élevé à volume |
| **SaaS Standard / Premium** | IBM Cloud, abonnement mensuel | À négocier selon volume |
| **Reserved Instance** | Plan de contrôle IBM Cloud CA + passerelles distantes | Recommandé pour GFB; engagement pluriannuel |
| **Software CP4I (VPC)** | OpenShift on-prem; licence VPC (MQ + App Connect + API Connect + DataPower + Event Streams) | TCO maîtrisé; sur-licenciement fréquent (>50 % observé) |
| **DataPower matériel** | Appliance physique; achat + S&S annuel | Capex séparé du CP4I |

**Levier de négociation clé :** le bundle CP4I en VPC couvre plusieurs produits IBM (MQ, App Connect, Event Streams) en plus d'API Connect. Si le GFB n'utilise pas l'ensemble du portefeuille, le risque de sur-licenciement est réel et documenté (>50 % dans les déploiements observés). La négociation doit impérativement porter sur les plafonds VPC et les droits de conversion entre produits du bundle. Essai SaaS disponible 30 jours.

---

## 6. Forces & réserves

### Forces

**Sécurité FSI inégalée.** DataPower est la référence de facto pour les institutions financières exigeantes : HSM FIPS 140-2 niveau 3 en appliance physique, 400+ institutions dans 80 pays, déploiement DMZ éprouvé sur 25 ans de production bancaire.

**Hybride sans compromis.** Le modèle Reserved Instance avec passerelles distantes offre la souveraineté canadienne sans sacrifier la gestion centralisée. Le support air-gap complet distingue IBM des solutions purement SaaS.

**Couverture réglementaire la plus large.** IBM Cloud for Financial Services avec PIPEDA, Protected B, DORA, EBA, PCI-DSS, FIPS 140-2 — aucune autre plateforme n'agrège autant de certifications pertinentes pour un FSI canadien.

**Leadership analytique reconnu.** Dix fois consécutives Leader au Magic Quadrant, et premier dans cinq des six *Critical Capabilities* selon les annonces d'IBM citant Gartner (2025) — la profondeur fonctionnelle est validée par les analystes.

**Gouvernance agentique pionnière.** DataPower Interact Gateway (MCP + LLM Gateway) positionne IBM comme le seul fournisseur offrant une gouvernance native des architectures IA agentiques en production (GA décembre 2025).

**Bundle CP4I.** Si le GFB utilise également IBM MQ, App Connect ou Event Streams, le bundle CP4I représente une rationalisation commerciale et opérationnelle significative.

### Réserves

**Complexité opérationnelle.** OpenShift est prérequis pour le déploiement Software auto-géré; si le GFB ne dispose pas d'une pratique OpenShift mature, le coût de formation et d'outillage est substantiel. La courbe d'apprentissage de DataPower reste raide pour les équipes sans expérience IBM.

**Risque de sur-licenciement CP4I.** Le modèle VPC bundle est puissant mais opaque — plus de 50 % des déploiements CP4I sont en situation de sur-licenciement observée. Un audit VPC rigoureux et des plafonds contractuels sont indispensables avant signature.

**Convergence webMethods en cours.** L'acquisition de Software AG et l'intégration webMethods dans V12 apportent une richesse fonctionnelle, mais aussi une complexité de transition. Les clients IBM pre-V12 et les clients webMethods historiques opèrent en parallèle pendant la période de convergence — risque de dette technique.

**Tarification non transparente.** L'absence de prix publics complique l'évaluation du TCO sans engagement commercial avec IBM. Le cycle de vente IBM est typiquement plus long que celui des acteurs cloud-natifs.

**Certains points à vérifier.** Disponibilité Reserved Instance spécifiquement en région Canada, FedRAMP du SaaS API Connect (hors IBM Cloud for Government), OpenAPI 3.1, intégration Datadog/Splunk native, et fédération GraphQL Apollo — tous ces points nécessitent confirmation écrite d'IBM avant sélection finale.

---

## 7. Autoévaluation alignée sur la grille A1

| # | Critère | Note /5 | Pondération | Points |
|---|---------|---------|-------------|--------|
| C1 | Capacités fonctionnelles cœur | **5,0** | 15 | 15,0 |
| C2 | Architecture & déploiement hybride | **5,0** | 15 | 15,0 |
| C3 | Sécurité | **5,0** | 15 | 15,0 |
| C4 | Conformité & souveraineté | **5,0** | 12 | 12,0 |
| C5 | Performance & scalabilité | **4,5** | 8 | 7,2 |
| C6 | Observabilité & exploitation | **4,0** | 6 | 4,8 |
| C7 | Capacités événementielles & GraphQL | **4,5** | 6 | 5,4 |
| C8 | Passerelle IA/LLM & agentique | **4,5** | 7 | 6,3 |
| C9 | Expérience développeur & gouvernance fédérée | **4,0** | 6 | 4,8 |
| C10 | Coût total de possession & modèle commercial | **3,5** | 6 | 4,2 |
| C11 | Écosystème, support & pérennité | **5,0** | 4 | 4,0 |
| **Total** | | | **100** | **93,7** |

> **Note finale : 93,7 / 100**

**Commentaires par critère :**
- **C1 — Capacités fonctionnelles cœur (5,0) :** Cycle de vie complet (modèle Produit/Plans, versionnage, dépréciation), API Studio (IDE IA) et Developer Portal — couverture fonctionnelle mature.
- **C2 — Architecture & déploiement hybride (5,0) :** Hybride véritable (plan de contrôle SaaS/OpenShift + passerelles distantes), fonctionnement air-gap et appliance DataPower physique; multi-cloud.
- **C3 — Sécurité (5,0) :** DataPower = référence de sécurité d'API en FSI; mTLS, OAuth/OIDC/JWT, protection des menaces, HSM FIPS 140-2 niveau 3.
- **C4 — Conformité & souveraineté (5,0) :** Portefeuille le plus large : PIPEDA, *Protected B*, IBM Cloud for Financial Services, FIPS L3, PCI-DSS, DORA; 400+ références bancaires.
- **C5 — Performance & scalabilité (4,5) :** Accélération matérielle DataPower (haut débit, basse latence); HA multi-zone; benchmarks de débit à obtenir d'IBM.
- **C6 — Observabilité & exploitation (4,0) :** Analytics intégré + Instana natif + OTel (Nano Gateway); intégration Datadog/Splunk via offload à clarifier.
- **C7 — Capacités événementielles & GraphQL (4,5) :** EEM + AsyncAPI + Event Gateway (contrôle d'accès aux sujets Kafka); GraphQL; fédération Apollo à vérifier.
- **C8 — Passerelle IA/LLM & agentique (4,5) :** DataPower Interact Gateway (MCP Gateway + LLM Gateway) GA déc. 2025; maturité en production FSI à démontrer sur 12 mois.
- **C9 — Expérience développeur & gouvernance fédérée (4,0) :** RBAC multi-niveaux, API Studio, V12 fédère les runtimes hétérogènes; expérience développeur historiquement en rattrapage; dépendance OpenShift.
- **C10 — Coût total de possession & modèle commercial (3,5) :** Licence CP4I en VPC + matériel DataPower; TCO complexe; risque de sur-licenciement à négocier.
- **C11 — Écosystème, support & pérennité (5,0) :** IBM Corp., solidité maximale, Leader Gartner 10×, #1 dans 5/6 *Critical Capabilities*, continuité DataPower.

---

## Sources

1. IBM — IBM API Connect (produit & tarification) : [ibm.com/products/api-connect](https://www.ibm.com/products/api-connect) | [ibm.com/products/api-connect/pricing](https://www.ibm.com/products/api-connect/pricing)
2. IBM Documentation — API Connect 12.1.0 : [ibm.com/docs/en/api-connect/12.1.0](https://www.ibm.com/docs/en/api-connect/12.1.0)
3. IBM Documentation — DataPower Interact Gateway : [ibm.com/docs/en/api-connect](https://www.ibm.com/docs/en/api-connect) (section DataPower Interact Gateway, décembre 2025)
4. IBM — DataPower Gateway (produit) : [ibm.com/products/datapower-gateway](https://www.ibm.com/products/datapower-gateway)
5. IBM — Cloud Compliance & certifications : [ibm.com/cloud/compliance](https://www.ibm.com/cloud/compliance)
6. IBM Newsroom — Annonce API Connect V12 (16 décembre 2025) : [ibm.com/new/announcements](https://www.ibm.com/new/announcements)
7. IBM Newsroom — Annonce IBM Event Endpoint Management (septembre 2024) : [ibm.com/new/announcements](https://www.ibm.com/new/announcements)
8. IBM Newsroom — Reconnaissance Gartner MQ API Management Leader (octobre 2025) : [ibm.com/new/announcements](https://www.ibm.com/new/announcements)
9. IBM Documentation — Cloud Pak for Integration, licences VPC : [ibm.com/docs/en/cloud-paks/cp-integration](https://www.ibm.com/docs/en/cloud-paks/cp-integration)
10. Gartner — Magic Quadrant for API Managem