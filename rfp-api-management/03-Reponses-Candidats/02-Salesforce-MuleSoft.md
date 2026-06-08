# Réponse RFP — Salesforce MuleSoft Anypoint Platform (réponse simulée)

> **Avertissement :** réponse simulée à des fins d'évaluation comparative, ancrée sur les capacités réelles vérifiées en juin 2026. Les prix, volumétries et conditions commerciales sont indicatifs/illustratifs et non contractuels. Toute décision d'acquisition doit faire l'objet d'une vérification directe auprès de Salesforce/MuleSoft.

---

## Sommaire exécutif

Salesforce MuleSoft Anypoint Platform est, depuis dix années consécutives, positionné Leader dans le Magic Quadrant Gartner « API Management » (2025). À la différence des plateformes spécialisées en gestion d'API, Anypoint est une proposition convergente : intégration d'entreprise (iPaaS, héritage direct de Mule ESB) et gestion du cycle de vie des API sur un plan de contrôle unifié. Pour le Groupe Financier Boréal (GFB), cet héritage constitue un avantage structurel pour le cas d'usage de façade du cœur bancaire (CU-02), où la médiation, la transformation de protocole et l'orchestration de services hérités sont des exigences de premier rang.

Sur le plan de la souveraineté canadienne — critère discriminant pour une institution soumise au BSIF —, la certification **Protected B (PBMM) de Hyperforce Canada, complétée le 12 mars 2026** (confirmé), positionne MuleSoft favorablement pour les charges réglementées hébergées en infonuagique géré avec résidence garantie au Canada. Les passerelles auto-gérées (**Omni Gateway** en mode Local, **Anypoint Runtime Fabric** sur Kubernetes) permettent un déploiement hybride robuste où les données ne quittent jamais les centres de données du GFB pendant l'exécution.

La plateforme répond directement à neuf des dix cas d'usage avec un niveau de maturité élevé. La principale réserve concerne le critère de coût total de possession : le modèle commercial basé sur l'usage (Flows + Messages), introduit en mars 2024, est réputé complexe à anticiper à l'échelle d'un portefeuille de 1 200 API à fort trafic (35 000 req/s, cible 60 000 req/s). Ce point exige une modélisation rigoureuse en collaboration avec le représentant Salesforce avant toute décision. La note d'autoévaluation globale est de **86,1 / 100**.

---

## 1. Réponse aux cas d'usage (CU-01 à CU-10)

### CU-01 — API partenaires & *open banking*

Anypoint Platform prend en charge nativement la gestion des plans d'API (API plans), la limitation de débit par partenaire et client, les contrats d'abonnement gérés depuis Anypoint Exchange et le portail développeur. La gestion du consentement *open banking* s'appuie sur l'intégration avec le fournisseur OIDC existant du GFB via les politiques OAuth 2.0/OIDC d'Anypoint Security, permettant une délégation de droits granulaire conforme aux normes d'API financières (FAPI 2.0, ISO 20022 mappé via DataWeave). L'**API Governance** (linting basé sur des règles configurables) garantit la conformité des contrats OpenAPI avant publication — utile pour les exigences normatives de l'open banking canadien.

### CU-02 — Façade d'API du cœur bancaire/assurantiel

C'est le point de force distinctif de MuleSoft. Le **Mule Runtime** (moteur d'intégration) offre des connecteurs natifs vers les systèmes mainframe (IBM MQ, AS/400, CICS via adaptateurs), les ERP et les applications patrimoniales. DataWeave, le langage de transformation propriétaire, gère la médiation entre protocoles hétérogènes (SOAP, ISO 8583, FIX, JSON/REST, XML) sans intermédiaire tiers. L'orchestration de services composites (agrégation, compensation, saga transactionnelle légère) est une capacité de premier rang absente de la plupart des passerelles d'API concurrentes. Pour le GFB, la façade du cœur bancaire (polices, comptes, paiements) peut être entièrement construite et gouvernée dans la même plateforme que les API exposées aux partenaires, sans rupture architecturale.

### CU-03 — Canaux numériques omnicanaux

Omni Gateway (basé sur Envoy Proxy) assure le routage à faible latence pour les canaux mobiles, web et agence, avec mise en cache de réponse configurable par politique, limitation de débit par canal et par identifiant client, et déchargement TLS. Les politiques de quota différencié par canal (application mobile vs. API partenaire vs. flux interne) sont appliquées uniformément, quel que soit le point d'exécution (plan de données géré CloudHub 2.0 ou Runtime Fabric auto-géré). La séparation stricte plan de contrôle / plan de données garantit que la latence d'exécution ne dépend pas de la connectivité vers le plan de contrôle Salesforce.

### CU-04 — Sécurité Zero Trust de bout en bout

La politique de sécurité Anypoint couvre : mTLS bidirectionnel sur l'ensemble des segments (client→passerelle, passerelle→*upstream*), validation OAuth 2.x/OIDC/JWT avec introspection ou validation locale, protection OWASP API Top 10 (injection, *broken object level authorization*, déni de service par volumétrie). La **tokenisation avec préservation de format (FPE) PCI** est disponible via Runtime Fabric (confirmé). L'intégration avec le fournisseur d'identité existant du GFB est réalisée via une politique OIDC standard. La gestion des secrets s'appuie sur des intégrations coffre (HashiCorp Vault, AWS Secrets Manager); l'intégration native CyberArk est à vérifier — prévoir un connecteur personnalisé ou l'API REST CyberArk. La conformité **FIPS 140-2** des modules cryptographiques est à vérifier pour le déploiement Kubernetes on-premises (statut courant non confirmé par la documentation publique de juin 2026).

### CU-05 — Souveraineté & déploiement hybride

C'est un pilier de la proposition MuleSoft pour le GFB. Trois niveaux de déploiement hybride coexistent :

1. **Anypoint Runtime Fabric (RTF)** : déploiement du Mule Runtime sur le cluster Kubernetes du GFB (EKS, AKS, GKE, OpenShift, Rancher) avec isolation par espace de noms, scaling horizontal multi-replica, et failover automatique. Les données de charge utile ne transitent jamais vers le plan de contrôle Salesforce.
2. **Omni Gateway en mode Local** : exécution quasi *air-gap* — le plan de données applique les politiques téléchargées sans dépendance au plan de contrôle pendant l'exécution. En cas de rupture de connectivité, la passerelle continue de traiter le trafic avec les politiques en cache local (confirmé par la documentation Omni Gateway Local Mode).
3. **Hyperforce Canada (Protected B, confirmé mars 2026)** : pour les composants de plan de contrôle ou les charges de trafic pouvant résider en infonuagique géré avec résidence canadienne garantie.

La résidence canadienne des données réglementées du GFB est assurée par la combinaison RTF on-premises (Québec, Ontario) et Hyperforce Canada. Les mises à niveau de la passerelle sont gérées de façon indépendante (cycle déconnecté du plan de contrôle), réduisant le risque opérationnel.

### CU-06 — Intégration événementielle temps réel (Kafka)

**Anypoint MQ** est le courtier de messagerie natif de la plateforme; pour les flux Kafka existants du GFB (400 sujets, paiements, anti-fraude), l'intégration s'effectue via le connecteur Kafka natif du Mule Runtime, avec découverte de sujets et gestion du contrôle d'accès via politiques Anypoint. La prise en charge **AsyncAPI** pour la documentation et la gouvernance des API événementielles est disponible dans Anypoint Exchange. La médiation entre protocoles synchrones (REST) et asynchrones (Kafka) est une force de l'héritage intégration de MuleSoft. **Point à vérifier :** l'emplacement du plan de données Anypoint MQ (région Canada disponible ou transit via régions US) — à confirmer avec l'équipe Salesforce pour les sujets réglementés.

### CU-07 — Gouvernance fédérée & catalogue à l'échelle

**Anypoint Exchange** est le catalogue central d'actifs réutilisables : API (OpenAPI, RAML, AsyncAPI, GraphQL), connecteurs, modèles de données, fragments. Il supporte les flux de publication design-first depuis Anypoint API Designer, le contrôle d'accès par équipe de domaine (RBAC), et la découvrabilité via portail développeur personnalisable. **Anypoint API Governance** applique des règles de conformité (linting) sur les contrats avant publication — les équipes de domaine publient en autonomie, sous les garde-fous définis centralement par l'équipe d'architecture du GFB. Ce modèle correspond exactement à la vision de gouvernance fédérée du RFP.

### CU-08 — Passerelle IA/LLM & agentique

**Anypoint AI Gateway**, mis en disponibilité générale en **mars 2026** (confirmé), est construit sur Omni Gateway (Envoy). Il offre : proxy LLM unifié vers OpenAI, Azure OpenAI, Google Gemini, Amazon Bedrock; contrôles de jetons (quotas, limitation de débit par modèle); **Prompt Guard** (filtrage des invites et des réponses malveillantes); routage sémantique (sélection du modèle selon le contexte de la requête); **MCP Bridge** (exposition d'API MuleSoft existantes comme outils MCP pour les agents); gouvernance agent-à-agent (A2A). La direction Salesforce/Agentforce intègre cette couche dans l'écosystème CRM/IA de l'entreprise — pertinent pour les scénarios d'agents IA bancaires du GFB. La gouvernance du trafic LLM non humain (traçabilité, quotas, garde-fous de contenu) est ainsi intégrée au même plan de contrôle que les API classiques.

### CU-09 — Monétisation & produits API

Anypoint Exchange supporte la définition de **produits API** (regroupement d'API en offres), de plans tarifés (freemium, quotas, tiers payants), et la mesure d'usage par abonnement. La génération de facturation et de refacturation interne (FinOps) s'appuie sur les métriques Anypoint Monitoring exportées. Pour une institution financière, la monétisation des API partenaires (open banking, fintechs) est ainsi entièrement gérée dans la plateforme, sans module tiers.

### CU-10 — Observabilité, SRE & FinOps

**Anypoint Monitoring** fournit métriques (débit, latence, taux d'erreur), journaux et traces corrélés par transaction. **Anypoint Visualizer** cartographie les dépendances applicatives en temps réel. La prise en charge **OpenTelemetry (OTel)** est disponible pour l'export vers des backends tiers. Les intégrations Datadog et Splunk (déjà en place au GFB) sont confirmées via export de journaux et métriques; la disponibilité d'un connecteur natif Datadog (vs. configuration manuelle d'export) est **à vérifier**. La rétention analytique et les SLO configurables sont disponibles dans Anypoint Monitoring; les seuils du SLA Titanium (niveau de support premium) sont **à vérifier** avec l'équipe commerciale Salesforce.

---

## 2. Conformité aux exigences

Légende : **N** = Non conforme | **C** = Conforme | **M** = Conforme avec modification mineure | **T** = Conforme via tiers | **R** = Roadmap confirmée | **X** = À vérifier

### Bloc EF — Exigences fonctionnelles

| Réf. | Exigence | Niveau | Commentaire |
|---|---|:---:|---|
| EF-01 | Conception design-first (OpenAPI 3.x, AsyncAPI, GraphQL) | C | API Designer natif; RAML et OpenAPI 3.x; AsyncAPI confirmé |
| EF-02 | Versionnage et gestion du cycle de vie | C | Anypoint Exchange; politiques de dépréciation gérées |
| EF-03 | Publication multi-environnement | C | Dev/QA/Prod via pipeline API Manager |
| EF-04 | Médiation et transformation de protocole | C | DataWeave; héritage iPaaS — point fort |
| EF-05 | Portail développeur libre-service | C | Portail personnalisable, console interactive, gestion des clés |
| EF-06 | Catalogue unifié multi-passerelles | C | Anypoint Exchange, découvrabilité, RBAC par domaine |
| EF-07 | Monétisation (produits, quotas tarifés, facturation) | C | Plans tarifés dans Exchange; export FinOps via métriques |
| EF-08 | Gouvernance GraphQL | M | DataGraph (GraphQL fédéré) disponible; déploiement on-premises à vérifier |
| EF-09 | Gouvernance AsyncAPI / événementielle | C | Connecteur Kafka natif; AsyncAPI dans Exchange |
| EF-10 | Passerelle IA/LLM (quotas jetons, garde-fous, MCP) | C | AI Gateway GA mars 2026; Prompt Guard; MCP Bridge confirmés |

### Bloc EA — Architecture & déploiement

| Réf. | Exigence | Niveau | Commentaire |
|---|---|:---:|---|
| EA-01 | Séparation plan de contrôle / plan de données | C | Architecture fondamentale MuleSoft |
| EA-02 | Passerelles auto-gérées sur Kubernetes (incl. OpenShift) | C | RTF sur EKS, AKS, GKE, OpenShift, Rancher — confirmé |
| EA-03 | Mode dégradé (résilience au découplage) | C | Omni Gateway Local Mode : quasi air-gap confirmé |
| EA-04 | Multi-nuage / multi-région | C | RTF déployable dans tout environnement K8s |
| EA-05 | Mises à niveau maîtrisées (cycle indépendant) | C | Mises à niveau RTF découplées du plan de contrôle |
| EA-06 | GitOps / APIOps | M | API Manager CLI; intégration CI/CD (Jenkins, GitHub Actions) — outillage natif limité vs. concurrents |

### Bloc ES — Sécurité

| Réf. | Exigence | Niveau | Commentaire |
|---|---|:---:|---|
| ES-01 | mTLS bidirectionnel | C | Confirmé sur tous les segments |
| ES-02 | OAuth 2.x / OIDC / JWT | C | Politiques Anypoint Security natives |
| ES-03 | Intégration IdP OIDC existant | C | Standard OIDC; configuration documentée |
| ES-04 | Protection OWASP API Top 10 | C | Politiques de sécurité Anypoint Security/edge |
| ES-05 | Gestion des secrets (coffre / HSM) | M | HashiCorp Vault, AWS Secrets Manager; CyberArk à vérifier |
| ES-06 | Tokenisation PCI (FPE) | C | Via RTF on-premises — confirmé |
| ES-07 | FIPS 140-2 (modules cryptographiques) | X | Statut courant non confirmé dans la documentation publique juin 2026 |
| ES-08 | Journaux d'audit immuables | C | Anypoint Monitoring; export SIEM |

### Bloc EC — Conformité & souveraineté

| Réf. | Exigence | Niveau | Commentaire |
|---|---|:---:|---|
| EC-01 | SOC 2 Type II | C | Trust Center MuleSoft (confirmé) |
| EC-02 | ISO/IEC 27001 | C | Trust Center MuleSoft (confirmé) |
| EC-03 | PCI-DSS | C | Trust Center MuleSoft (confirmé) |
| EC-04 | HIPAA | C | Trust Center MuleSoft (confirmé) |
| EC-05 | GDPR | C | Trust Center MuleSoft (confirmé) |
| EC-06 | Protected B / PBMM (Canada) | C | Hyperforce Canada certifié Protected B — 12 mars 2026 (confirmé) |
| EC-07 | Résidence données Canada | C | Hyperforce Canada + RTF on-premises Québec/Ontario |
| EC-08 | FedRAMP | C | MuleSoft Government Cloud — confirmé |
| EC-09 | PIPEDA / LPRPDE | M | Architecture souveraine conforme; attestation formelle à vérifier |

### Bloc EN — Non-fonctionnel (performance, observabilité, exploitation)

| Réf. | Exigence | Niveau | Commentaire |
|---|---|:---:|---|
| EN-01 | Débit >= 60 000 req/s | M | RTF scaling horizontal multi-replica; Mule Runtime plus lourd que passerelles légères concurrentes — dimensionnement K8s à valider par PoC |
| EN-02 | Latence P99 maîtrisée | M | Omni Gateway (Envoy) très performant; Mule Runtime : surcharge JVM à quantifier |
| EN-03 | HA >= 99,9 % / reprise après sinistre | C | Multi-replica RTF; failover automatique |
| EN-04 | OpenTelemetry natif | C | Support OTel confirmé |
| EN-05 | Intégration Datadog | M | Export confirmé; connecteur natif à vérifier |
| EN-06 | Intégration Splunk | M | Export confirmé; connecteur natif à vérifier |
| EN-07 | Rétention analytique >= 12 mois | X | Paramètre Anypoint Monitoring à confirmer |

---

## 3. Architecture de référence hybride pour le GFB

```
+---------------------------------------------------------------------+
|         PLAN DE CONTRÔLE — Anypoint Platform (Hyperforce CA)        |
|  API Designer | API Manager | Anypoint Exchange | API Governance    |
|  Anypoint Monitoring | AI Gateway Control | Anypoint Analytics       |
|  [Résidence : régions Canada — Protected B certifié, mars 2026]     |
+---------------------------+-----------------------------------------+
                            |
            Connectivité de gestion (chiffrée, non-données)
                            |
              +-------------+-------------+
              |                           |
+-------------v-----------+   +-----------v-----------+
|  PLAN DE DONNÉES — DC   |   |  PLAN DE DONNÉES — DC |
|  Québec (Production)    |   |  Ontario (DR/Active)  |
|                         |   |                       |
|  Anypoint RTF           |   |  Anypoint RTF         |
|  (OpenShift/K8s)        |   |  (OpenShift/K8s)      |
|  +-------------------+  |   |  +-------------------+|
|  |  Omni Gateway     |  |   |  |  Omni Gateway     ||
|  |  (Local Mode)     |  |   |  |  (Local Mode)     ||
|  |  mTLS · OAuth2    |  |   |  |  mTLS · OAuth2    ||
|  |  Prompt Guard     |  |   |  |  Prompt Guard     ||
|  +-------------------+  |   |  +-------------------+|
|  +-------------------+  |   |                       |
|  |  Mule Runtime     |  |   |  Mule Runtime         |
|  |  (Façade CB)      |  |   |  (replica)            |
|  |  DataWeave        |  |   |                       |
|  +-------------------+  |   |                       |
|  Kafka (400 sujets)     |   |  Kafka (répliqué)     |
|  Mainframe / Core       |   |                       |
+-------------------------+   +-----------------------+
              |
+-------------v------------------------------------------+
|  CONSOMMATEURS                                         |
|  Partenaires open banking (FAPI 2.0)                   |
|  Applications mobiles / web / agences                  |
|  Agents IA (MCP Bridge / A2A)                          |
|  Modèles LLM (AI Gateway proxy)                        |
+--------------------------------------------------------+
```

**Principes architecturaux clés :**

- **Isolation du plan de données :** les charges utiles (données bancaires, PII, données réglementées) ne transitent jamais vers le plan de contrôle Salesforce. Seules les métriques agrégées et les configurations de politique circulent vers Hyperforce Canada.
- **Résilience air-gap :** Omni Gateway en mode Local applique les politiques téléchargées en cache local. En cas de perte de connectivité vers le plan de contrôle, le trafic continue d'être traité avec les politiques en vigueur — sans interruption de service.
- **Façade bancaire unifiée :** Mule Runtime sur RTF assure la médiation vers le mainframe, le cœur bancaire et le système de polices d'assurance. DataWeave transforme ISO 8583 / SOAP / MQ en JSON/REST exposés aux canaux numériques, sans ETL tiers.
- **Gouvernance IA intégrée :** Anypoint AI Gateway (sur Omni Gateway/Envoy) applique les politiques de gouvernance LLM (quotas de jetons, Prompt Guard, routage sémantique) au même niveau que les politiques API classiques, sans couche supplémentaire.

---

## 4. Sécurité & conformité

### Posture de sécurité

MuleSoft applique un modèle de **responsabilité partagée** : Salesforce sécurise l'infrastructure du plan de contrôle (Hyperforce Canada); le GFB conserve la responsabilité opérationnelle du plan de données (RTF sur Kubernetes on-premises). Ce modèle est documenté et auditable, ce qui facilite les évaluations BSIF.

Les contrôles de sécurité disponibles sont les suivants : mTLS systématique sur tous les segments réseau; validation JWT avec introspection ou validation locale (réduction de la dépendance réseau); politiques de limitation de débit et de détection d'abus (seuils configurables par API, par client, par canal); **Prompt Guard** pour le filtrage du contenu IA entrant et sortant; tokenisation FPE PCI via RTF (données cartes isolées dans le plan de données on-premises).

### Conformité canadienne

La certification **Protected B / PBMM de Hyperforce Canada** (complétée le 12 mars 2026, confirmé) est le fait le plus significatif pour le GFB. Elle atteste de la conformité aux exigences de sécurité du gouvernement fédéral canadien pour les données à caractère protégé — niveau cohérent avec les exigences FSI réglementées par le BSIF. Les certifications SOC 2 Type II, ISO 27001, PCI-DSS et HIPAA sont maintenues et vérifiables sur le Trust Center MuleSoft / compliance.salesforce.com.

**Réserve FIPS 140-2 :** la conformité FIPS 140-2 des modules cryptographiques pour le déploiement Kubernetes on-premises n'est pas confirmée dans la documentation publique disponible en juin 2026. Le GFB doit obtenir une attestation formelle de Salesforce avant signature du contrat, notamment pour les segments manipulant des données PCI et des clés HSM.

---

## 5. Modèle commercial (indicatif)

> Les informations suivantes sont illustratives. Aucun prix de liste public n'est disponible. La négociation doit être conduite directement avec le représentant Salesforce Enterprise/FSI.

### Structure de licence (depuis mars 2024)

MuleSoft a migré vers un modèle **basé sur l'usage** articulé autour de deux métriques :

| Métrique | Description | Impact GFB |
|---|---|---|
| **Flows** | Nombre de flux d'intégration/API actifs déployés | Élevé (façade bancaire, intégrations nombreuses) |
| **Messages** | Volume de messages/transactions traités | Très élevé (35 000 req/s pointe, cible 60 000 req/s) |

### Composantes de coût estimées

| Poste | Indicatif | Note |
|---|---|---|
| Licence Anypoint Platform (Flows + Messages) | Négociation enterprise | Pas de liste public; contrat pluriannuel recommandé |
| Anypoint Runtime Fabric (par cluster K8s) | Inclus ou séparé selon édition | À clarifier selon le nombre de clusters |
| AI Gateway | Inclus dans Anypoint ou module additionnel | À vérifier selon le contrat |
| Support Titanium (premium SLA) | Supplément | Seuils de SLA à vérifier |
| Services d'implémentation (partenaire SI) | Variable | Intégrateurs certifiés disponibles au Canada |
| Formation et certification | Variable | MuleSoft Training disponible en français |

### Avertissement TCO

Le TCO de MuleSoft est réputé **élevé à l'échelle** dans les retours d'expérience du marché. Pour un portefeuille de 1 200 API à fort trafic (cible 60 000 req/s), le volume de Messages peut générer une facture significativement supérieure aux estimations initiales si la modélisation n'est pas rigoureuse. Le GFB est fortement conseillé de :

1. Obtenir une simulation chiffrée basée sur les volumétries réelles (req/s, nombre de Flows, saisonnalité).
2. Négocier un plafond de Messages annuel avec des clauses d'ajustement.
3. Comparer le TCO sur 3 ans avec au moins deux soumissionnaires concurrents avant décision finale.

---

## 6. Forces & réserves

### Forces

| # | Force | Pertinence pour le GFB |
|---|---|---|
| F1 | **Héritage iPaaS + API Management unifié** | Façade cœur bancaire (CU-02) sans rupture architecturale; médiation mainframe native |
| F2 | **Protected B Hyperforce Canada (mars 2026)** | Conformité réglementaire canadienne FSI; argument fort pour le BSIF |
| F3 | **Omni Gateway Local Mode (quasi air-gap)** | Résilience au découplage plan de contrôle; continuité de service garantie |
| F4 | **AI Gateway GA (mars 2026) + MCP Bridge** | Gouvernance IA/agentique intégrée; couverture complète CU-08 |
| F5 | **Anypoint Exchange + API Governance** | Catalogue et gouvernance fédérée matures; CU-07 couvert de façon native |
| F6 | **Leader Gartner 10e année consécutive** | Pérennité du fournisseur; écosystème de partenaires SI certifiés |
| F7 | **RTF sur OpenShift/K8s** | Déploiement hybride souverain dans les DC Québec/Ontario du GFB |

### Réserves

| # | Réserve | Niveau de risque | Mitigation |
|---|---|:---:|---|
| R1 | **TCO élevé à l'échelle** (modèle Messages) | Élevé | Modélisation rigoureuse; négociation plafond; clause de révision |
| R2 | **FIPS 140-2 on-premises non confirmé** | Moyen | Attestation formelle requise avant signature; risque PCI |
| R3 | **Mule Runtime — surcharge JVM** | Moyen | PoC de performance obligatoire à 60 000 req/s; dimensionnement K8s |
| R4 | **Intégrations Datadog/Splunk (connecteur natif à vérifier)** | Faible | Configuration d'export OTel disponible en attendant |
| R5 | **DataGraph on-premises (à vérifier)** | Faible | Impact CU-03/CU-07 GraphQL si non disponible on-premises |
| R6 | **Plan de données Anypoint MQ — région Canada** | Moyen | Utiliser le connecteur Kafka natif pour les sujets réglementés |

---

## 7. Autoévaluation alignée sur la grille A1

> Notes verrouillées sur les faits vérifiés fournis. Pondérations conformes à l'annexe A1 du RFP (GFB-RFP-APIM-2026-001).

| # | Critère | Pondération | Note /5 | Points obtenus | Commentaire |
|---|---|:---:|:---:|:---:|---|
| C1 | Capacités fonctionnelles cœur | 15 % | 5,0 | 15,0 | Cycle de vie complet, iPaaS + API management, DataWeave, Exchange |
| C2 | Architecture & déploiement hybride | 15 % | 4,5 | 13,5 | RTF + Omni Gateway Local Mode + Hyperforce CA; GitOps outillage limité |
| C3 | Sécurité | 15 % | 4,0 | 12,0 | mTLS, OAuth2, FPE PCI; FIPS 140-2 on-prem à confirmer |
| C4 | Conformité & souveraineté | 12 % | 4,5 | 10,8 | Protected B mars 2026 + SOC2/ISO27001/PCI; PIPEDA attestation à finaliser |
| C5 | Performance & scalabilité | 8 % | 4,0 | 6,4 | RTF scaling horizontal; surcharge JVM Mule — PoC requis |
| C6 | Observabilité & exploitation | 6 % | 4,0 | 4,8 | Anypoint Monitoring + OTel; connecteurs Datadog/Splunk à confirmer |
| C7 | Capacités événementielles & GraphQL | 6 % | 4,5 | 5,4 | Kafka natif + AsyncAPI + DataGraph; localisation MQ Canada à vérifier |
| C8 | Passerelle IA/LLM & agentique | 7 % | 4,0 | 5,6 | AI Gateway GA mars 2026; Prompt Guard; MCP Bridge — maturité récente |
| C9 | Expérience développeur & gouvernance fédérée | 6 % | 4,5 | 5,4 | Exchange + API Governance + portail développeur — forte maturité |
| C10 | Coût total de possession & modèle commercial | 6 % | 3,0 | 3,6 | Modèle Messages complexe; TCO élevé réputé; négociation indispensable |
| C11 | Écosystème, support & pérennité | 4 % | 4,5 | 3,6 | Leader Gartner 10 ans; SI certifiés Canada; Salesforce/Agentforce |
| | **Total** | **100 %** | — | **86,1** | |

**Note finale : 86,1 / 100**

---

## Sources

Les informations factuelles de ce document s'appuient sur les sources suivantes, vérifiées en juin 2026 :

1. **MuleSoft Documentation — Anypoint Runtime Fabric**
   `https://docs.mulesoft.com/runtime-fabric/latest/`
   Déploiement RTF sur Kubernetes, isolation, scaling, failover. Consulté juin 2026.

2. **MuleSoft Documentation — Omni Gateway (anciennement Flex Gateway)**
   `https://docs.mulesoft.com/gateway/latest/`
   Architecture Envoy, Local Mode (quasi air-gap), politiques de sécurité. Consulté juin 2026.

3. **MuleSoft Trust Center**
   `https://www.mulesoft.com/trust-center`
   Certifications ISO 27001, SOC 1, SOC 2, PCI-DSS, HIPAA, GDPR. Consulté juin 2026.

4. **Salesforce Compliance — MuleSoft**
   `https://compliance.salesforce.com/en/mulesoft`
   Détail des certifications par service et par région. Consulté juin 2026.

5. **Blog MuleSoft — Anypoint AI Gateway (disponibilité générale, mars 2026)**
   `https://blogs.mulesoft.com/`
   Annonce GA AI Gateway : proxy LLM, Prompt Guard, MCP Bridge, routage sémantique, gouvernance A2A. Mars 2026.

6. **Blog MuleSoft — Managed Flex Gateway / Omni Gateway**
   `https://blogs.mulesoft.com/`
   Transition Flex Gateway vers Omni Gateway; mode Local; support services non-Mule (Node.js, Python). Consulté juin 2026.

7. **Annonce Salesforce Hyperforce Canada — Protected B (PBMM)**
   Certification Protected B / PBMM complétée le **12 mars 2026** pour les régions canadiennes de Hyperforce.
   `https://compliance.salesforce.com/` — Voir entrée « Canada Protected B ». Mars 2026.

8. **Gartner Magic Quadrant for API Management, 2025**
   Positionnement Leader de MuleSoft (10e année consécutive). Rapport Gartner, 2025.
   *(Accès via abonnement Gartner ou résumé public MuleSoft.)*

---

*Fichier écrit : 02-Salesforce-MuleSoft.md*

Ce document constitue une réponse RFP simulée complète et ancrée sur les faits vérifiés (juin 2026) pour Salesforce MuleSoft Anypoint Platform, couvrant les dix cas d'usage du GFB avec une notation finale de 86,1/100 selon la grille A1 pondérée du RFP.
