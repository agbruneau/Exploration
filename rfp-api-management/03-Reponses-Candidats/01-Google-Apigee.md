# Réponse RFP — Google Apigee (réponse simulée)

> **Avertissement :** réponse simulée à des fins d'évaluation comparative, ancrée sur les capacités réelles vérifiées en juin 2026. Les prix mentionnés sont indicatifs/illustratifs et non contractuels. Les mentions « à vérifier » signalent des éléments dont la confirmation contractuelle reste à obtenir auprès de Google Cloud.

---

## Sommaire exécutif

Google Apigee se positionne comme la plateforme de gestion des API la mieux établie du marché pour les institutions financières de grande envergure opérant en mode hybride. Désigné Leader au Magic Quadrant Gartner API Management pour la dixième année consécutive (2025) et classé le plus haut sur l'axe « Ability to Execute », Apigee offre au Groupe Financier Boréal (GFB) une combinaison rare : un plan de contrôle entièrement géré par Google Cloud (éliminant la charge opérationnelle de la couche de gestion) couplé à un plan d'exécution auto-géré que le GFB déploie sur ses propres clusters Kubernetes — qu'ils résident sur site, dans un nuage privé ou dans les régions canadiennes de Google Cloud (Montréal `northamerica-northeast1`, Toronto `northamerica-northeast2`).

Pour un acteur financier réglementé soumis aux exigences de résidence des données au Canada, cette architecture hybride (édition **Apigee hybrid**, v1.17.x mars 2026) répond directement aux impératifs de souveraineté : les données transactionnelles ne quittent jamais l'infrastructure contrôlée par le GFB. Les politiques de sécurité natives (mTLS, OAuth 2.0/OIDC, JWT, protection OWASP API Top 10) et le module **Advanced API Security** (détection d'abus par apprentissage automatique) renforcent une posture Zero Trust sans couche tierce. La proposition de valeur la plus différenciante pour 2026 est sans conteste la passerelle IA/LLM native : les politiques `LLMTokenQuota`, `SemanticCacheLookup` et **Model Armor** (anti-injection de prompt, anti-exfiltration) positionnent Apigee comme l'unique passerelle API du marché à intégrer nativement la gouvernance des flux agentiques et LLM.

---

## 1. Réponse aux cas d'usage

| # | Cas d'usage | Positionnement Apigee |
|---|---|---|
| **CU-01** | API partenaires / open banking | Plans de produits, portail développeur intégré, OAuth 2.0/OIDC natif, monétisation AppGroups (déc. 2025). Adapté aux flux FAPI/open banking. |
| **CU-02** | Façade cœur bancaire | Médiation protocolaire (REST, SOAP, gRPC), transformation JSON/XML, politiques de résilience (circuit-breaker via extension, timeout, retry). Couche d'abstraction éprouvée pour systèmes mainframe. |
| **CU-03** | Canaux numériques omnicanaux | Politiques de routage, versionnage d'API, SpikeArrest par canal; environnements Comprehensive autoscalés pour absorber les pics mobiles/web. |
| **CU-04** | Sécurité Zero Trust | mTLS nord/sud, OAuth 2.0/OIDC (serveur natif ou délégation IdP), JWT/JWS, JSON/XML Threat Protection, RegEx, Quota synchrone; Advanced API Security (ML) pour détection bots/abus en temps réel. |
| **CU-05** | Souveraineté & hybride | Architecture hybride stricte : plan d'exécution entièrement sous contrôle du client (K8s GKE, GKE on-prem/Bare Metal, EKS, AKS, OpenShift); CMEK via Cloud KMS/HSM/EKM; régions canadiennes. Résidence des données de trafic garantie côté client. Inclusion des régions CA dans la table DRZ Apigee : **à vérifier contractuellement**. |
| **CU-06** | Événementiel temps réel (Kafka) | Lacune relative documentée : pas de passerelle Kafka native. Intégration possible via Pub/Sub ou connecteurs REST-to-Kafka. Pour des pipelines événementiels intensifs, une couche complémentaire (ex. Confluent) reste recommandée. Support AsyncAPI dans le portail : **probable, à vérifier**. |
| **CU-07** | Gouvernance fédérée & catalogue | **API hub** (découverte automatique des spécifications, scores de sécurité, gouvernance des métadonnées); portail développeur avec flux d'approbation; OpenAPI 2.0/3.x natif. |
| **CU-08** | Passerelle IA/LLM & agentique | Point fort différenciateur : `LLMTokenQuota`, `PromptTokenLimit`, `SemanticCacheLookup/Populate` (Vertex AI Embeddings + Vector Search), **Model Armor** (anti-injection, anti-fuite), routage multi-modèles (Gemini, OpenAI, Anthropic via Bedrock), support MCP (exposer API REST/gRPC en serveurs MCP, OAuth 2.1/OIDC), intégration GKE Inference Gateway. |
| **CU-09** | Monétisation | Plans tarifaires natifs, frais récurrents et frais de mise en service (AppGroups, déc. 2025), rapports de facturation. Couverture fonctionnelle solide pour un FSI offrant des API commerciales à des tiers. |
| **CU-10** | Observabilité / SRE / FinOps | Cloud Monitoring/Trace/Logging; API Analytics (rétention 14 mois, module payant en PAYG); export BigQuery; intégrations Datadog (MessageLogging/syslog), Splunk (collecteur OTel), Dynatrace (Hub natif). Export OTel natif depuis le runtime : **à vérifier**. |

---

## 2. Conformité aux exigences

| Bloc | Critères | Niveau dominant | Commentaire synthétique |
|---|---|---|---|
| **EF** — Fonctionnel | CU-01 à CU-10 | **T** (Total, sauf CU-06 M) | Couverture quasi complète; lacune événementielle Kafka atténuée par intégration REST/Pub-Sub. |
| **EA** — Architecture hybride | Plan de contrôle géré / plan d'exécution auto-géré, K8s multi-plateformes, résilience hors-ligne partielle (Synchronizer) | **T** | Architecture hybride native et documentée v1.17.x. Air-gap véritable non supporté (plan de contrôle Google Cloud obligatoire). |
| **ES** — Sécurité | mTLS, OAuth, JWT, OWASP Top 10, détection ML, CMEK | **T** | Advanced API Security et Model Armor couvrent les exigences FSI avancées; CMEK/HSM/EKM confirmés. |
| **EC** — Conformité réglementaire | SOC 1/2/3 Type II, ISO 27001, PCI-DSS AOC, FedRAMP High, HIPAA, BSI C5; résidence Canada | **C** (Conforme) | Certifications confirmées; résidence des données dans régions canadiennes réalisable. Inclusion DRZ Canada : **à vérifier contractuellement**. |
| **EN** — Non-fonctionnel | SLA 99,9 %/99,99 %, autoscaling Comprehensive, rétention analytique 14 mois, FinOps via BigQuery | **T** | Niveaux de service robustes pour environnements Comprehensive; SLA hybride dépend de l'infrastructure K8s du client. |

*Niveaux : N = Non conforme, C = Conforme, M = Mineur écart, T = Total (dépassement), R = Réserve, X = Exclu.*

---

## 3. Architecture de référence hybride pour le GFB

L'architecture proposée repose sur la séparation stricte de deux plans indépendants :

**Plan de contrôle (Google Cloud — région CA)**
Le plan de contrôle Apigee réside dans les régions `northamerica-northeast1` (Montréal) et `northamerica-northeast2` (Toronto). Il héberge la console de gestion, l'API hub (catalogue et gouvernance), le portail développeur, les politiques, la configuration des environnements et les données analytiques agrégées. Ce plan communique avec le plan d'exécution via des canaux chiffrés mTLS.

**Plan d'exécution (infrastructure GFB — sur site ou nuage privé)**
Les composants runtime déployés sur les clusters Kubernetes du GFB comprennent : les **Message Processors** (traitement des requêtes API), le **Synchronizer** (cache de configuration locale assurant la continuité si le plan de contrôle est temporairement injoignable), **Cassandra** (état distribué des quotas et tokens) et la couche **Ingress** (terminaison TLS, routage entrant). Ce plan ne transmet jamais les charges utiles transactionnelles à Google Cloud.

**Plateformes K8s supportées par le GFB**
GKE on-prem / Google Distributed Cloud (Bare Metal), OpenShift, AKS ou EKS selon les environnements existants du GFB. Les versions mineures sont supportées 12 mois; un calendrier d'upgrades réguliers doit être intégré au plan d'exploitation.

**Flux de données sensibles**
Les données de trafic (corps de requêtes/réponses) restent exclusivement sur l'infrastructure GFB. Seules les métadonnées analytiques agrégées (latences, codes HTTP, identifiants de produits API) remontent vers le plan de contrôle — volume et granularité configurables selon la politique de classification du GFB.

**Composante IA/LLM**
Pour les flux agentiques et LLM (CU-08), le GFB peut exposer des points de terminaison de modèles (Gemini sur Vertex AI Canada, ou modèles internes) derrière Apigee hybrid. Les politiques `LLMTokenQuota` et `SemanticCacheLookup` s'exécutent dans le plan d'exécution local; Model Armor applique les contrôles de contenu avant transmission au modèle.

---

## 4. Sécurité & conformité

**Contrôles d'accès et d'identité**
Apigee hybrid supporte nativement OAuth 2.0 et OIDC, avec possibilité de déléguer l'émission de jetons à un IdP d'entreprise (Okta, Azure AD, Ping Identity) ou d'utiliser le serveur OAuth intégré. La validation JWT/JWS s'effectue dans le plan d'exécution sans dépendance réseau externe. Pour un FSI, la compatibilité FAPI (Financial-grade API) mérite une validation de configuration spécifique : **à confirmer selon le profil FAPI cible**.

**Chiffrement et gestion des clés**
CMEK (Customer-Managed Encryption Keys) via Cloud KMS, avec support HSM et External Key Manager (EKM) pour les clés hébergées hors de Google Cloud. Les secrets de configuration du plan d'exécution sont chiffrés au repos dans Cassandra avec les clés du client.

**Certifications**
SOC 1/2/3 Type II, ISO 27001, PCI-DSS (AOC fourni + guide de configuration), FedRAMP High, HIPAA, BSI C5 (confirmés, juin 2026). La couverture PCI-DSS s'applique à la passerelle elle-même; la responsabilité partagée s'étend à l'infrastructure K8s du GFB dans le plan d'exécution.

**Détection des menaces applicatives**
Le module **Advanced API Security** (payant, ~350 $US/1M appels) applique des modèles ML pour détecter les comportements anormaux, les attaques par bot et les abus de quota. Les politiques JSON/XML Threat Protection et RegEx couvrent l'injection et la manipulation de charge utile. La couverture OWASP API Security Top 10 est documentée dans les guides de configuration PCI d'Apigee.

---

## 5. Modèle commercial (indicatif)

> Tous les montants sont en dollars américains, indicatifs et non contractuels. Ils reflètent la page de tarification officielle de juin 2026 et sont soumis à négociation contractuelle.

Pour un déploiement hybride de l'envergure du GFB, **seule la piste Abonnement** (Standard / Enterprise / Enterprise Plus) est applicable — l'édition hybride n'est pas disponible en paiement à l'usage (PAYG). Les prix d'abonnement sont négociés directement avec Google Cloud et ne sont pas publiés.

| Poste | Modèle PAYG (référence) | Note |
|---|---|---|
| Appels API Standard | 20 $US / 1M appels (dégressif) | PAYG uniquement, référence de marché |
| Environnement Base | 365 $US / mois | 50 req/s, PAYG |
| Environnement Intermediate | 1 460 $US / mois | 100 req/s, PAYG |
| Environnement Comprehensive | 3 431 $US / mois / région | Autoscalé, PAYG |
| Advanced API Security | ~350 $US / 1M appels | Module payant, FSI recommandé |
| API Analytics | 20 $US / 1M appels | Rétention 14 mois, PAYG |
| Egress réseau Google Cloud | Variable | À intégrer au TCO — impact potentiellement significatif |

**Facteurs TCO à considérer pour le GFB :** frais d'egress réseau entre plan de contrôle et plan d'exécution (trafic de synchronisation de configuration), coût de l'infrastructure Kubernetes sur site (hors périmètre Apigee), licences Advanced API Security et Analytics, support Enterprise (tarification séparée).

---

## 6. Forces & réserves

**Forces confirmées**

- **Leadership de marché durable :** dixième désignation consécutive au Gartner MQ avec la meilleure note d'exécution — signal de stabilité et de feuille de route pour un FSI.
- **Architecture hybride mature :** séparation plan de contrôle / plan d'exécution clairement documentée, Synchronizer assurant la résilience locale, support multi-plateformes K8s couvrant l'existant typique d'un GFB.
- **Passerelle IA/LLM la plus avancée du marché :** politiques natives LLMTokenQuota, SemanticCacheLookup, Model Armor et support MCP sont sans équivalent direct chez les concurrents en juin 2026.
- **Sécurité de niveau FSI :** PCI-DSS AOC, CMEK/HSM/EKM, Advanced API Security ML, couverture OWASP API Top 10.
- **Écosystème Google Cloud :** intégration native BigQuery, Vertex AI, GKE Inference Gateway — synergies significatives pour un GFB déjà sur Google Cloud ou en cours de migration.

**Réserves et limites**

- **Pas d'air-gap véritable :** le plan de contrôle Google Cloud est obligatoire en permanence (connectivité sortante requise). Les environnements de production totalement isolés du réseau Internet ne sont pas supportés en standard. Pour un FSI avec des exigences d'isolation maximale, ce point est non trivial.
- **Lacune événementielle Kafka :** aucune passerelle Kafka native. Les architectures événementielles intensives nécessitent une couche complémentaire, augmentant la complexité et le coût.
- **Upgrades imposés :** le support des versions mineures est limité à 12 mois. Un FSI doit intégrer un calendrier de mises à niveau régulières dans son modèle opérationnel, ce qui représente une charge non négligeable.
- **Verrouillage propriétaire partiel :** la couche IA (Vertex AI, Model Armor) et les intégrations natives (GKE Inference Gateway, BigQuery) créent une dépendance à l'écosystème Google. La portabilité vers un autre fournisseur est possible mais coûteuse.
- **Résidence DRZ Canada à vérifier :** l'inclusion formelle des régions canadiennes dans la table Data Residency Zone d'Apigee hybrid doit être confirmée contractuellement avant signature.
- **Coût total difficile à anticiper :** la combinaison des frais d'abonnement (non publics), d'Advanced API Security, d'Analytics, d'egress et des coûts d'infrastructure K8s rend le TCO sensible aux hypothèses de volumétrie. Une modélisation rigoureuse avec Google Cloud est indispensable.

---

## 7. Autoévaluation alignée sur la grille A1

| # | Critère | Pondération | Note /5 | Points |
|---|---|---|---|---|
| C1 | Capacités fonctionnelles cœur | 15 % | 5,0 | 15,00 |
| C2 | Architecture & déploiement hybride | 15 % | 4,5 | 13,50 |
| C3 | Sécurité | 15 % | 4,5 | 13,50 |
| C4 | Conformité & souveraineté | 12 % | 4,0 | 9,60 |
| C5 | Performance & scalabilité | 8 % | 4,5 | 7,20 |
| C6 | Observabilité & exploitation | 6 % | 4,5 | 5,40 |
| C7 | Capacités événementielles & GraphQL | 6 % | 3,0 | 3,60 |
| C8 | Passerelle IA/LLM & agentique | 7 % | 5,0 | 7,00 |
| C9 | Expérience développeur & gouvernance fédérée | 6 % | 4,0 | 4,80 |
| C10 | Coût total de possession & modèle commercial | 6 % | 3,5 | 4,20 |
| C11 | Écosystème, support & pérennité | 4 % | 4,5 | 3,60 |
| | **Total** | **100 %** | | **87,40** |

**Note finale : 87,4 / 100**

*Méthode de calcul : Points = (Note / 5) × Pondération (%). La note C7 (3,0/5) reflète l'absence de passerelle Kafka native — lacune documentée et assumée. La note C10 (3,5/5) reflète le coût de portabilité lié à l'écosystème Google Cloud.*

---

## Sources

| Libellé | URL | Date de référence |
|---|---|---|
| Apigee Pricing — page officielle Google Cloud | https://cloud.google.com/apigee/pricing | Juin 2026 |
| Apigee hybrid — documentation et notes de version (v1.17.x) | https://docs.cloud.google.com/apigee/docs/hybrid/latest/release-notes | Mars 2026 |
| Apigee Data Residency Zone (DRZ) — documentation | https://docs.cloud.google.com/apigee/docs/api-platform/get-started/drz | Consulté juin 2026 |
| Apigee CMEK — configuration et documentation | https://docs.cloud.google.com/apigee/docs/api-platform/security/cmek | Consulté juin 2026 |
| Apigee PCI-DSS — guide de configuration | https://docs.cloud.google.com/apigee/docs/api-platform/security/pci-dss | Consulté juin 2026 |
| Google Cloud Blog — Gartner Magic Quadrant API Management 2025 | https://cloud.google.com/blog/products/apigee/gartner-magic-quadrant-api-management-2025 | 2025 |
| Google Cloud Blog — Support MCP dans Apigee | https://cloud.google.com/blog/products/apigee/apigee-mcp-support | Consulté juin 2026 |
| InfoQ — Model Armor (anti-injection prompt, Apigee) | https://www.infoq.com/news/2025/07/google-model-armor-apigee/ | Juillet 2025 |
