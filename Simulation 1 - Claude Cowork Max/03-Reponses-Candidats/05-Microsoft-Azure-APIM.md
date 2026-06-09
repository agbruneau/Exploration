# Réponse RFP — Microsoft Azure API Management (réponse simulée)

> **Avertissement :** réponse simulée à des fins d'évaluation comparative, ancrée sur les capacités réelles vérifiées (juin 2026). Les prix indiqués sont indicatifs et illustratifs uniquement, non contractuels. Certaines affirmations sont marquées « [à vérifier] » lorsqu'une validation officielle reste requise.

---

## Sommaire exécutif

Microsoft Azure API Management (APIM) se positionne comme une plateforme de gestion d'API de classe entreprise, ancrée dans l'écosystème Azure et bénéficiant d'un portfolio d'intégration très large (Entra ID, Azure Monitor, Defender, AI Foundry, Arc). Pour le Groupe Financier Boréal (GFB), le scénario hybride repose obligatoirement sur le **palier Premium classique** : c'est le seul qui réunit la passerelle auto-gérée (self-hosted gateway, SHG), le déploiement multi-région, l'injection VNet et les contrôles de sécurité avancés requis par un établissement financier soumis aux lignes directrices OSFI et à la loi LPRPDE/Loi 25.

Les points forts structurels incluent : une intégration native Entra ID, une politique AI Gateway complète (quotas de jetons, cache sémantique, content safety), une gouvernance multi-passerelles via Azure API Center, et une double présence régionale canadienne (Canada Central – Toronto ; Canada East – Québec). Les réserves principales concernent la dépendance du plan de contrôle à Azure (pas d'option sur site), les lacunes des workspaces (pas de SHG, pas de Defender, pas de cache externe), et l'absence de connectivité air-gap permanente pour le SHG. Pour le GFB, ces contraintes sont gérables dans un modèle hybride bien architecturé, à condition de valider explicitement la résidence des données du plan de contrôle et l'inclusion d'APIM dans les certifications applicables au périmètre FSI canadien.

**Note d'autoévaluation sur la grille A1 : 82,9 / 100.**

---

## 1. Réponse aux cas d'usage (CU-01 à CU-10)

### CU-01 — API partenaires et open banking

APIM supporte nativement l'import OpenAPI 3.x, OAuth2/OIDC et la validation JWT (`validate-jwt`, `validate-azure-ad-token`). Le Developer Portal géré (refonte Fluent UI/React, 2025) offre un portail libre-service configurable pour les partenaires externes. Les produits et abonnements permettent de segmenter les accès par partenaire, avec quotas et plans différenciés. Entra ID B2B/B2C peut être utilisé pour les identités partenaires. Le Credential Manager centralise la gestion des tokens OAuth2 vers les back-ends sans exposition de clés. La passerelle SHG peut être déployée dans la DMZ de GFB pour intercepter les flux partenaires avant qu'ils n'atteignent le réseau interne. **Niveau de réponse : fort.**

### CU-02 — Façade cœur bancaire

Le pattern de façade APIM devant un cœur bancaire (CBS) repose sur la politique de transformation (set-body, rewrite-uri, set-header), le routage conditionnel et le basculement (retry, forward-request, circuit-breaker). Les back-ends WSDL/SOAP sont importables et transformables en REST. La passerelle SHG peut être co-localisée avec le CBS dans le segment réseau sécurisé. Le mTLS passerelle→back-end (`validate-client-certificate`, certificats dans Key Vault) assure l'authentification mutuelle. **Réserve :** la renégociation de certificat client n'est pas supportée sur le SHG [confirmé] — à prendre en compte si le CBS exige cette capacité spécifique. **Niveau de réponse : bon, avec une réserve mTLS SHG à qualifier.**

### CU-03 — Canaux omnicanaux

APIM sert de couche d'abstraction entre les canaux (mobile, web, succursale, centre d'appels) et les services back-end. Les révisions et versions API permettent de faire évoluer les contrats sans rupture. Le cache intégré et le cache externe Redis améliorent la latence pour les requêtes répétitives. WebSocket (WS/WSS) est supporté pour les canaux temps réel. GraphQL (passthrough et synthétique avec résolveurs HTTP/Azure) couvre les besoins des applications mobiles modernes. Le palier Premium classique permet le scaling horizontal multi-unités (~4 000 req/s/unité) et le déploiement multi-région pour la résilience. **Niveau de réponse : très fort.**

### CU-04 — Zero Trust

L'architecture Zero Trust s'appuie sur Entra ID (RBAC plan de gestion, identités managées vers back-ends), `validate-jwt`, OAuth2/OIDC, et mTLS bidirectionnel. L'injection VNet (Premium classique et Premium v2) isole le plan de données dans le réseau privé de GFB. Le filtrage IP (`ip-filter`) complète les contrôles de couche réseau. **Defender for APIs** (détection de menaces sur le plan de données) est disponible — **réserve : Defender for APIs n'est pas disponible dans les workspaces** [confirmé]. Le WAF est délégué à Application Gateway ou Azure Front Door placé en amont (pattern recommandé, pas natif à APIM). L'intégration avec Microsoft Sentinel via Event Hubs/Log Analytics ferme la boucle SIEM. **Niveau de réponse : très fort, avec la délégation WAF à noter.**

### CU-05 — Souveraineté & déploiement hybride

C'est le cas d'usage le plus structurant pour le choix d'architecture. **Plan de contrôle : exclusivement Azure** — pas d'option sur site [confirmé]. Plan de données : SHG (conteneur Linux/Docker) déployable sur l'infrastructure GFB (K8s, AKS, Azure Arc sur clusters non-Azure, Container Apps, Helm). La synchronisation de configuration s'effectue toutes les 10 secondes via TCP/443 sortant vers Azure ; le heartbeat est toutes les minutes. En cas de perte de connectivité, le SHG opère en **fail-static** (configuration en mémoire/sauvegarde locale) — les API continuent de répondre, mais les mises à jour de politique et les nouvelles clés d'abonnement ne se propagent pas. **L'air-gap permanent n'est pas supporté** [confirmé] : une connectivité sortante vers Azure est structurellement requise. Les régions Canada Central (Toronto) et Canada East (Québec) assurent la résidence des données du plan de contrôle en territoire canadien. La résidence effective des données de journalisation et de configuration dans ces régions est à confirmer via le Service Trust Portal. PIPEDA/OSFI : à vérifier explicitement auprès de l'équipe conformité Microsoft Canada. **Niveau de réponse : bon, avec la dépendance plan de contrôle Azure comme contrainte structurelle.**

### CU-06 — Événementiel Kafka

APIM ne dispose pas de connecteur Kafka natif intégré à la passerelle. La médiation événementielle vers Kafka s'effectue via Azure Event Hubs (compatible protocole Kafka) ou Event Grid, avec des politiques de publication sortante. **Event Grid pour les événements du plan de gestion n'est pas disponible en v2** [confirmé]. Pour le GFB, l'architecture recommandée serait : APIM → Event Hubs (endpoint Kafka) → consommateurs Kafka internes, avec une politique `send-request` ou un back-end dédié. AsyncAPI est supporté pour l'import et la documentation dans le catalogue. **Réserve : ce n'est pas une passerelle événementielle native** — la médiation Kafka est possible mais via des intermédiaires, non de manière transparente. **Niveau de réponse : moyen, architecture de médiation requise.**

### CU-07 — Gouvernance fédérée & catalogue

**Azure API Center** constitue la réponse principale : catalogue design-time multi-passerelles, linting, enregistrement d'API depuis n'importe quelle source (APIM, passerelles tierces), portail de découverte. Les **workspaces** (GA Premium v2 ; disponibles Basic/Standard v2 depuis avril 2026) permettent la délégation de la gestion des API à des équipes produit distinctes au sein du GFB, avec isolation des permissions. **Réserves workspaces à documenter** : absence de SHG, Defender for APIs, private endpoint, cache externe Redis, MCP, identité managée, GraphQL synthétique, hostname personnalisé dans les workspaces [confirmé]. La gouvernance fédérée est donc partielle : les équipes autonomes sur workspaces ne bénéficient pas de la même surface fonctionnelle que le plan de contrôle principal. **Niveau de réponse : bon, avec les lacunes workspaces à intégrer dans le modèle de gouvernance.**

### CU-08 — IA/LLM & agentique

C'est l'un des points forts différenciateurs d'APIM. La fonctionnalité **AI Gateway** (disponible sur tous les paliers) regroupe un ensemble de politiques natives :

- `llm-token-limit` : quotas de jetons par client/produit (TPM)
- `llm-emit-token-metric` : métriques de coût et chargeback pour tous types de jetons (prompt, completion, total) depuis Build 2026 [confirmé]
- `llm-semantic-cache` : cache sémantique via Azure Managed Redis + RediSearch
- `llm-content-safety` : filtrage via Azure AI Content Safety

Le load balancing et le circuit breaker multi-backends permettent de répartir les requêtes entre plusieurs endpoints LLM (priorité aux PTU, fallback sur pay-as-you-go). L'**Unified Model API** (préversion) unifie l'accès à OpenAI/Chat Completions, Anthropic (API v2), Google Vertex, Amazon Bedrock, Microsoft Foundry et LLM privés. Le support des **serveurs MCP** (exposer des API REST en endpoints MCP pour agents IA) est disponible — **réserve : MCP non disponible dans les workspaces** [confirmé]. L'intégration Microsoft Foundry (préversion) et les protocoles A2A complètent le tableau agentique. **Niveau de réponse : très fort, différenciateur.**

### CU-09 — Monétisation

APIM supporte la monétisation via les produits et abonnements : plans d'accès, quotas par produit, rate limiting différencié. La politique `quota-by-key` et `rate-limit-by-key` permettent une facturation à l'usage granulaire. Pour une intégration avec une plateforme de facturation externe (Stripe, Zuora, etc.), une architecture par événements (Event Hubs + Azure Functions) est recommandée. La politique `llm-emit-token-metric` étend la monétisation aux coûts LLM. Le Developer Portal peut présenter les plans tarifaires aux partenaires. **Réserve : pas de moteur de monétisation natif** — l'intégration avec un système de billing tiers est requise pour une facturation complète. **Niveau de réponse : bon, avec intégration billing externe requise.**

### CU-10 — Observabilité, SRE & FinOps

L'observabilité s'appuie sur Azure Monitor (métriques, 90 jours de rétention), Application Insights (traces distribuées, échantillonnage configurable), Log Analytics et Event Hubs (export vers SIEM). L'intégration Datadog est native à Azure [confirmé]. Splunk est supporté via Event Hubs et l'add-on Splunk. Azure Managed Grafana est disponible pour les tableaux de bord SRE. Le SHG envoie des métriques via OTel [confirmé]. **Réserve majeure : le SHG n'envoie pas les journaux de requêtes à Azure Monitor via le canal de gestion** [confirmé] — la centralisation des logs du SHG nécessite une architecture complémentaire (Event Hubs, OTel collector, sidecar). Pour le FinOps LLM, `llm-emit-token-metric` alimente le chargeback par équipe/produit. **Niveau de réponse : bon à très bon, avec l'architecture de collecte SHG à planifier.**

---

## 2. Conformité aux exigences

| Code | Libellé | Statut | Commentaire |
|------|---------|--------|-------------|
| EF-01 | Déploiement hybride plan de contrôle sur site | N | Plan de contrôle exclusivement sur Azure — contrainte structurelle |
| EF-02 | Self-hosted gateway sur infrastructure GFB | C | SHG conteneur Linux/K8s/Helm — Premium classique uniquement |
| EF-03 | Multi-région canadienne (Canada Central + East) | C | Régions disponibles sur Premium classique |
| EF-04 | Fail-static en cas de perte connectivité Azure | C | Config en mémoire/sauvegarde locale ; air-gap permanent non supporté |
| EF-05 | Autoscaling passerelle | C | Premium classique (pas Developer) ; scaling manuel ou via HPA K8s pour SHG |
| EA-01 | OAuth2/OIDC & JWT | C | `validate-jwt`, `validate-azure-ad-token`, Credential Manager |
| EA-02 | mTLS bidirectionnel | M | Client→passerelle et passerelle→back-end ; renégociation cert NON supportée sur SHG |
| EA-03 | RBAC plan de gestion | C | Entra ID natif, identités managées |
| EA-04 | WAF applicatif | M | Via Application Gateway/Front Door en amont — non natif à APIM |
| EA-05 | Détection d'anomalies runtime | C | Defender for APIs (hors workspaces) |
| ES-01 | SOC 1/2/3 | C | Certifications Azure umbrella |
| ES-02 | ISO 27001 | C | Certifications Azure umbrella |
| ES-03 | PCI-DSS | C | Certifications Azure umbrella |
| ES-04 | FedRAMP High | C | Certifications Azure umbrella [confirmé] |
| ES-05 | PIPEDA / OSFI | À vérifier | À confirmer explicitement via équipe conformité Microsoft Canada |
| ES-06 | CMEK (clés gérées client) | À vérifier | À confirmer via Service Trust Portal |
| EC-01 | Catalogue API multi-passerelles | C | Azure API Center (design-time, linting, multi-source) |
| EC-02 | Gouvernance fédérée / workspaces | M | Workspaces disponibles mais lacunes fonctionnelles significatives |
| EC-03 | Versioning & révisions | C | Versions + révisions natifs |
| EC-04 | Developer Portal partenaires | C | Portail géré Fluent UI/React 2025 |
| EN-01 | Cache distribué externe | M | Redis externe supporté — mais pas dans les workspaces |
| EN-02 | GraphQL (passthrough + synthétique) | M | Passthrough C ; synthétique PAS dans workspaces |
| EN-03 | gRPC | À vérifier | Préversion sur SHG [à vérifier] |
| EN-04 | AsyncAPI | C | Import doc/catalogue supporté |
| EN-05 | WebSocket | C | WS/WSS natif |

*Légende : C = Confirmé | M = Mitigé (condition ou limitation) | N = Non disponible | T = Tiers requis | À vérifier = validation officielle requise*

---

## 3. Architecture de référence hybride pour le GFB

L'architecture recommandée pour le GFB articule trois couches distinctes :

**Couche de bordure (DMZ GFB)**
Le SHG est déployé sur un cluster Kubernetes interne (ou AKS Arc si l'infrastructure GFB est inscrite dans Azure Arc). Application Gateway ou Azure Front Door est positionné en amont du SHG pour assurer le WAF (OWASP CRS), la terminaison TLS et la géo-restriction. Le SHG écoute sur le segment DMZ et relaie les requêtes vers les back-ends internes via les politiques APIM. La connectivité sortante TCP/443 vers Azure (plan de contrôle) est acheminée via un proxy HTTPS ou un lien ExpressRoute dédié pour les flux de synchronisation de configuration.

**Plan de contrôle (Azure Canada Central / Canada East)**
Le plan de contrôle APIM Premium classique réside en région Canada Central (primaire) avec réplication de la configuration vers Canada East (secondaire). Azure API Center centralise le catalogue de l'ensemble des API du GFB, y compris celles gérées par des passerelles tierces éventuelles. Entra ID gère les identités du plan de gestion (opérateurs, développeurs, équipes produit). Key Vault centralise les certificats mTLS et les secrets. Log Analytics et Application Insights centralisent les métriques et traces du plan de gestion, tandis qu'un Event Hubs dédié collecte les journaux du SHG (via OTel collector ou sidecar Fluentd).

**Couche de données interne (réseau GFB)**
Les back-ends (CBS, services métier, LLM privés, Event Hubs pour Kafka) sont accessibles depuis le SHG via le réseau interne GFB. Le mTLS passerelle→back-end est configuré avec des certificats stockés dans Key Vault et synchronisés dans le SHG. Les résolveurs GraphQL synthétiques et les politiques de mediation événementielle sont définis dans le plan de contrôle et exécutés localement par le SHG.

**Flux de données IA/LLM**
Pour les cas d'usage IA, APIM joue le rôle de proxy intelligent entre les agents internes et les endpoints LLM (Azure OpenAI, Anthropic, LLM privés). Les politiques `llm-token-limit` et `llm-emit-token-metric` s'appliquent sur le SHG (métriques OTel) pour le chargeback par équipe. Le cache sémantique Redis est déployé dans l'infrastructure Azure Canada Central.

---

## 4. Sécurité & conformité

**Authentification et autorisation**
Entra ID est le fournisseur d'identité natif pour le plan de gestion (RBAC granulaire) et les back-ends (identités managées, sans clé stockée). Pour les consommateurs d'API partenaires, OAuth2/OIDC avec `validate-jwt` ou `validate-azure-ad-token` constitue le standard. Le Credential Manager gère les tokens OAuth2 vers les back-ends tiers sans les exposer dans les politiques. Le mTLS bidirectionnel (client→SHG, SHG→back-end) est configurable avec des certificats référencés dans Key Vault. La renégociation de certificat client n'est pas supportée sur le SHG [confirmé] — point à qualifier avec l'équipe CBS de GFB.

**Détection de menaces et WAF**
Defender for APIs assure la détection d'anomalies comportementales sur le plan de données (hors workspaces). Le WAF est délégué à Application Gateway (v2, WAF v2) ou Azure Front Door positionné en amont du SHG — ce pattern est recommandé par Microsoft pour les déploiements FSI. L'intégration avec Microsoft Sentinel via Event Hubs ferme la boucle de détection/réponse.

**Conformité et résidence des données**
Le portfolio de certifications Azure (SOC 1/2/3, ISO 27001, PCI-DSS, FedRAMP High, BSI C5, CSA STAR, HITRUST) couvre le plan de contrôle APIM. La présence en régions Canada Central et Canada East assure la résidence géographique des données du plan de contrôle. L'inclusion d'APIM dans le périmètre d'audit par certification est à vérifier via le Service Trust Portal [à vérifier]. La conformité explicite PIPEDA et aux lignes directrices OSFI B-10 est à valider avec l'équipe conformité Microsoft Canada [à vérifier]. Le CMEK (clés de chiffrement gérées par le client) pour APIM est à confirmer [à vérifier].

---

## 5. Modèle commercial (indicatif)

> Tous les prix sont indicatifs et illustratifs. Source : azure.microsoft.com/pricing/details/api-management. Non contractuels.

| Composant | Modèle de facturation | Indicateur de coût |
|-----------|----------------------|-------------------|
| APIM Premium classique | Tarif horaire par unité de capacité | ~$3,60 USD/h/unité (indicatif) |
| Self-Hosted Gateway | Facturé séparément, par déploiement de passerelle (nœuds illimités au palier Premium) | Gratuit au palier Developer (1 nœud, évaluation); tarif Premium : voir calculatrice Azure (**indicatif**) |
| Workspace gateways | Facturation séparée par workspace gateway | À consulter calculatrice Azure |
| Azure API Center | Inclus dans APIM Premium ou autonome | Tarification propre (à vérifier) |
| Azure OpenAI / LLM | Par token (PTU ou pay-as-you-go) | Distinct d'APIM |
| Application Gateway WAF | Par heure + par Go de données | Distinct d'APIM |

**Avantages du modèle :** la calculatrice Azure offre une prévisibilité relative par rapport aux modèles purement à l'usage. Le palier Premium classique avec SHG à nœuds illimités permet de scaler les passerelles on-premises sans surcoût linéaire par nœud. Le modèle Consumption (par appel, premier million gratuit/mois) peut être utilisé pour des environnements de développement ou de test à coût marginal.

**Points d'attention :** le palier Premium classique est significativement plus coûteux que les paliers v2, mais demeure le seul à réunir SHG, multi-région et toutes les fonctionnalités FSI. Les coûts indirects (Application Gateway, Redis, Event Hubs, Log Analytics, Defender) doivent être intégrés au TCO global.

---

## 6. Forces & réserves

### Forces

- **Écosystème Microsoft natif :** Entra ID, Key Vault, Defender, Sentinel, Azure Monitor — intégration sans friction dans un environnement GFB déjà Microsoft.
- **AI Gateway différenciateur :** politiques LLM natives (quotas de jetons, cache sémantique, content safety, chargeback), support MCP et A2A pour l'agentique — avance significative sur la concurrence.
- **Présence canadienne confirmée :** régions Canada Central et Canada East disponibles, résidence des données du plan de contrôle en territoire canadien.
- **Fail-static SHG :** continuité de service en cas de perte transitoire de connectivité Azure — résilience pour les sites distants.
- **Azure API Center :** gouvernance design-time multi-passerelles, linting, catalogue centralisé.
- **Portfolio de certifications :** SOC 1/2/3, ISO 27001, PCI-DSS, FedRAMP High — base solide pour les exigences FSI.
- **Developer Portal modernisé :** refonte Fluent UI/React 2025, expérience partenaires améliorée.

### Réserves

- **Plan de contrôle exclusivement Azure :** contrainte de souveraineté pour les organisations exigeant un plan de contrôle entièrement sur site — non adressable dans APIM. L'air-gap permanent n'est pas supporté.
- **Hybride = Premium classique obligatoire :** le SHG n'est pas disponible dans les paliers v2 [confirmé] — coût plus élevé, certaines fonctionnalités v2 non accessibles.
- **Lacunes workspaces :** la gouvernance fédérée via workspaces est fonctionnellement incomplète (pas de SHG, Defender, cache externe, MCP, GraphQL synthétique, hostname custom) — les équipes déléguées opèrent sur une surface réduite.
- **Logs SHG non centralisés nativement :** architecture complémentaire requise (OTel collector, Event Hubs, sidecar) pour centraliser les journaux du SHG dans Azure Monitor.
- **WAF non natif :** délégation à Application Gateway ou Front Door — complexité architecturale et coût additionnel.
- **Kafka non natif :** médiation via Event Hubs/Event Grid — pas une passerelle événementielle transparente.
- **Conformité PIPEDA/OSFI et CMEK :** validation explicite requise, non confirmée à date [à vérifier].
- **Renégociation mTLS SHG :** limitation potentiellement bloquante selon les exigences du CBS de GFB [confirmé].

---

## 7. Autoévaluation alignée sur la grille A1

| # | Critère | Note /5 | Pondération | Points |
|---|---------|---------|-------------|--------|
| C1 | Capacités fonctionnelles cœur | 4,0 | 15 % | 12,00 |
| C2 | Architecture & déploiement hybride | 3,5 | 15 % | 10,50 |
| C3 | Sécurité | 4,5 | 15 % | 13,50 |
| C4 | Conformité & souveraineté | 4,5 | 12 % | 10,80 |
| C5 | Performance & scalabilité | 4,0 | 8 % | 6,40 |
| C6 | Observabilité & exploitation | 4,5 | 6 % | 5,40 |
| C7 | Capacités événementielles & GraphQL | 4,0 | 6 % | 4,80 |
| C8 | Passerelle IA/LLM & agentique | 4,5 | 7 % | 6,30 |
| C9 | Expérience développeur & gouvernance fédérée | 4,0 | 6 % | 4,80 |
| C10 | Coût total de possession & modèle commercial | 4,0 | 6 % | 4,80 |
| C11 | Écosystème, support & pérennité | 4,5 | 4 % | 3,60 |
| | **Total** | | **100 %** | **82,9 / 100** |

**Commentaires par critère :**

- **C1 — Capacités fonctionnelles cœur (4,0/5)** : Import OpenAPI/GraphQL/gRPC/AsyncAPI, API Center (catalogue), Developer Portal modernisé; réserve : lacunes des *workspaces*.
- **C2 — Architecture & déploiement hybride (3,5/5)** : *Self-hosted gateway* robuste mais limité au palier Premium classique (exclu des v2); plan de contrôle exclusivement Azure; air-gap permanent non supporté.
- **C3 — Sécurité (4,5/5)** : Entra ID natif, mTLS, validate-jwt, Defender for APIs — arsenal Zero Trust complet; WAF délégué (App Gateway/Front Door); Defender absent des *workspaces*.
- **C4 — Conformité & souveraineté (4,5/5)** : Conformité Azure large (FedRAMP High, PCI-DSS, SOC/ISO), régions Canada Central/Est; périmètre d'audit APIM et PIPEDA/OSFI à vérifier.
- **C5 — Performance & scalabilité (4,0/5)** : ~4 000 req/s/unité, multi-région (Premium classique), autoscaling, cache externe Redis (hors *workspaces*).
- **C6 — Observabilité & exploitation (4,5/5)** : Azure Monitor, Application Insights, Datadog natif, OTel (SHG); réserve : centralisation des journaux du SHG.
- **C7 — Capacités événementielles & GraphQL (4,0/5)** : GraphQL (passthrough/synthétique), WebSocket, gRPC, AsyncAPI; médiation Kafka via Event Hubs (pas de broker natif); Event Grid hors v2.
- **C8 — Passerelle IA/LLM & agentique (4,5/5)** : Politiques GenAI complètes (token limit/metrics, cache sémantique, Content Safety), MCP, A2A, Foundry; absentes des *workspaces*.
- **C9 — Expérience développeur & gouvernance fédérée (4,0/5)** : API Center + *workspaces* (fédération) mais lacunes des *workspaces*; outillage Bicep/ARM.
- **C10 — Coût total de possession & modèle commercial (4,0/5)** : Modèle horaire par capacité, calculatrice Azure (prévisibilité); surcoût du Premium classique requis pour l'hybride.
- **C11 — Écosystème, support & pérennité (4,5/5)** : Microsoft, écosystème vaste, Leader iPaaS; position exacte au MQ API Management 2025 à vérifier (rapport sous licence).

---

## Sources

1. **Azure APIM — Paliers v2 (GA novembre 2025)**
   `learn.microsoft.com/azure/api-management/v2-service-tiers-overview`

2. **Self-Hosted Gateway — Architecture et déploiement**
   `learn.microsoft.com/azure/api-management/self-hosted-gateway-overview`

3. **AI Gateway / GenAI — Capacités et politiques LLM**
   `learn.microsoft.com/azure/api-management/genai-gateway-capabilities`

4. **Workspaces APIM — Fonctionnalités et limitations**
   `learn.microsoft.com/azure/api-management/workspaces-overview`

5. **Observabilité APIM — Azure Monitor, Application Insights, OTel**
   `learn.microsoft.com/azure/api-management/observability`

6. **Authentification et autorisation dans APIM**
   `learn.microsoft.com/azure/api-management/authentication-authorization-overview`

7. **Tarification Azure API Management (indicative, non contractuelle)**
   `azure.microsoft.com/pricing/details/api-management`

8. **Offres de conformité Azure — Certifications et périmètres**
   `learn.microsoft.com/azure/compliance/offerings`

9. **Tech Community