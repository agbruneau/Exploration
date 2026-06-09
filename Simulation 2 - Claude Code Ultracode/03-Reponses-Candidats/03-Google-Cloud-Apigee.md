# Réponse à l'appel d'offres RFP-BBQ-APIM-2026

## Solution candidate : Google Cloud Apigee (Apigee hybrid)

| Champ | Valeur |
|---|---|
| Éditeur | Google LLC (Google Cloud) |
| Produit | Apigee — plateforme de gestion d'API ; topologie de référence pour ce dossier : **Apigee hybrid** |
| Modèle de déploiement évalué | Plan de contrôle géré par Google (cloud) + plans de données (runtime) auto-hébergés sur Kubernetes |
| Candidat (réf. interne) | CAND3 |
| Date de la réponse | Juin 2026 |
| Auteur | Réponse **simulée** à partir de capacités produit publiques |

---

## Avis d'intégrité et cadre de simulation

> **À lire avant toute exploitation de ce document.**
>
> - L'organisation cliente **Banque Boréale du Québec (BBQ)** est **entièrement fictive**. Aucune donnée réelle d'un établissement nommé n'est utilisée.
> - La présente réponse est **simulée**. Elle est construite à partir de **capacités produit publiques d'Apigee vérifiées en date de juin 2026** (documentation Google Cloud, notes de version, blogue produit, Gartner Magic Quadrant for API Management d'octobre 2025). Elle **n'engage ni Google, ni Apigee**, et ne constitue pas une soumission officielle de l'éditeur.
> - Les éléments de **prix, de TCO et de licence** sont **indicatifs, non contractuels** et fondés sur des hypothèses explicitées (section 11). Le modèle commercial réel d'Apigee est négocié au cas par cas et doit être confirmé auprès de Google Cloud.
> - Tout élément incertain, sensible au temps ou postérieur à l'horizon de connaissance est marqué **« à vérifier »**. BBQ doit exiger une confirmation contractuelle avec preuves (notamment sur la résidence du plan de contrôle au Canada, le calendrier Open Banking / RTR, et les certifications applicables au périmètre exact).
> - Cette réponse adopte un parti pris d'**honnêteté technique** : les écarts d'Apigee face aux exigences obligatoires du RFP — en particulier la **non-installabilité du plan de contrôle on-prem** et la **survivabilité partielle** en mode déconnecté — sont signalés explicitement et **non minimisés**.

---

## Sommaire

1. Présentation de l'éditeur, de la solution et du positionnement
2. Architecture et déploiement hybride / on-prem (point critique)
3. Sécurité (authn/authz, mTLS, gestion des secrets, WAF API)
4. Conformité et souveraineté (résidence Canada, certifications)
5. Couverture fonctionnelle des 10 cas d'usage (tableau)
6. Performance et scalabilité
7. Observabilité
8. Événementiel / streaming et GraphQL
9. IA / LLM et agentique (passerelle IA, MCP / A2A)
10. Expérience développeur et gouvernance
11. Tarification indicative et TCO 3 ans
12. Références FSI, limites et risques honnêtes

---

## 1. Présentation de l'éditeur, de la solution et positionnement

**Google Cloud Apigee** est l'une des plateformes de gestion d'API les plus matures du marché (héritage d'Apigee, acquis par Google en 2016). Google a été positionné **Leader** dans le *Gartner Magic Quadrant for API Management 2025* (publié octobre 2025), avec la position la plus haute sur l'axe **Ability to Execute** parmi les fournisseurs évalués — sa dixième reconnaissance consécutive en tant que Leader. *(à vérifier : la pérennité de ce positionnement dans l'édition suivante.)*

Apigee se décline en trois grandes topologies, dont la pertinence pour BBQ diffère nettement :

| Topologie | Description | Adéquation au RFP BBQ |
|---|---|---|
| **Apigee X** | Entièrement géré par Google dans Google Cloud (control plane **et** data plane dans GCP) | Non retenu : ne satisfait pas l'exigence d'auto-hébergement on-prem / DMZ des plans de données |
| **Apigee hybrid** | Plan de contrôle géré par Google (cloud) ; **plans de données (runtime) auto-hébergés** par le client sur Kubernetes (on-prem, GKE, autre cloud, périphérie) | **Topologie de référence de cette réponse** |
| **Apigee Edge for Private Cloud (OPDK)** | Déploiement intégralement on-prem hérité | **En fin de cycle / non recommandé** pour un nouveau marché ; Google oriente les nouveaux clients vers hybrid. *(à vérifier : statut exact du support OPDK à l'horizon du marché.)* |

**Positionnement honnête pour BBQ.** Apigee hybrid est une excellente réponse à la majorité des exigences fonctionnelles, de sécurité et d'observabilité. **En revanche, sur le critère le plus pondéré du RFP — C2 souveraineté/conformité (13 pts) — et sur C3 (architecture hybride, 12 pts), Apigee présente une contrainte structurelle de fond** : son **plan de contrôle n'est pas installable on-prem** ni dans un cloud souverain tiers. Il est opéré par Google. Ce point est développé en section 2 et conditionne l'évaluation.

---

## 2. Architecture et déploiement hybride / on-prem (POINT CRITIQUE)

### 2.1 Modèle réel d'Apigee hybrid

Apigee hybrid sépare clairement deux plans (ce qui satisfait **EA-01**) :

- **Plan de contrôle / management plane** : UI, API de gestion, traitement analytique, développement et stockage des proxys. **Hébergé et opéré par Google dans Google Cloud. Patché par Google.** Il **n'est pas déployable on-prem ni dans un cloud non-Google.**
- **Plan de données / runtime plane** : services conteneurisés (Message Processors, ingress, Cassandra, Synchronizer) **installés et maintenus par le client sur un cluster Kubernetes** de son choix (GKE, GKE on-prem/Anthos, Kubernetes sur d'autres clouds, ou on-prem). **Tout le trafic d'API et son traitement (application des politiques) se déroulent dans le runtime du client.**

Le **Synchronizer** récupère la configuration depuis le plan de contrôle et la stocke localement (« contract », fichier JSON sur le système de fichiers local) ; les Message Processors servent le trafic à partir de cette configuration locale.

### 2.2 Confrontation aux exigences d'architecture (EA)

| Exigence | Verdict | Commentaire honnête |
|---|---|---|
| **EA-01** Séparation control/data plane | **Conforme (C)** | Séparation native et nette. |
| **EA-02** Control plane **on-prem OU cloud souverain canadien, au choix** | **Non conforme (NC)** — **écart majeur** | Le plan de contrôle Apigee hybrid est **exclusivement opéré par Google dans Google Cloud**. Il n'est ni installable on-prem, ni hébergeable dans un cloud souverain tiers. **C'est l'écart le plus significatif de cette réponse face au RFP.** Une atténuation partielle existe via la **résidence des données** (section 4), mais l'**opération** du plan de contrôle reste chez Google. |
| **EA-03** Data planes là où circulent les données (privé QC/ON, cloud canadien, périphérie) | **Conforme (C)** | Le runtime s'installe où le client veut, y compris data centers privés et DMZ. C'est la principale force d'hybrid. |
| **EA-04 / EA-05** Survivabilité / mode déconnecté du control plane | **Conforme partiellement (CP)** — **réserve importante** | Les gateways **continuent de servir le trafic existant et d'appliquer les politiques** à partir de la configuration locale en cas de perte de lien vers le plan de contrôle (validation OAuth/JWT et quotas locaux poursuivis). **MAIS** : (a) **aucune nouvelle API ne peut être déployée** ; (b) les **mises à jour de configuration (KVM, KMS, environnements) sont bloquées** ; (c) l'**analytique est mise en tampon localement avec abandon après un nombre limité de tentatives** ; (d) **Google ne documente pas de durée maximale d'autonomie garantie** — la documentation indique que « les périodes hors-ligne prolongées peuvent dégrader la fonctionnalité ». Le comportement précis **fail-open / fail-closed configurable par politique exigé par EA-05 n'est pas un paramètre natif documenté** au sens du RFP. *(à vérifier en PoC-A : durée réelle d'autonomie et comportement des quotas distribués hors-ligne.)* |
| **EA-06** Conteneurs/K8s + **air-gapped** | **Conforme partiellement (CP)** | Runtime 100 % Kubernetes (Helm). **Mais un déploiement totalement air-gapped est contredit par le besoin de connectivité périodique au plan de contrôle Google** (Synchronizer, analytique, gestion). Un isolement total permanent n'est pas le mode de fonctionnement nominal d'hybrid. *(à vérifier.)* |
| **EA-07** Portabilité multi-cloud (≥2 clouds canadiens + on-prem) | **Conforme partiellement (CP)** | Le **runtime** est portable sur tout Kubernetes conforme (donc multi-cloud et on-prem : réel avantage anti-verrouillage côté data plane). **Mais le plan de contrôle reste lié à Google Cloud** : il n'y a pas de portabilité du control plane. |
| **EA-08** Multi-région actif/actif au Canada | **Conforme (C)** | Apigee supporte le multi-région ; la réplication Cassandra du runtime permet l'actif/actif. |
| **EA-09** Intégration legacy/mainframe sans réécriture | **Conforme (C)** | Médiation par proxy/politiques (voir UC4). |
| **EA-10** API d'administration déclarative complète | **Conforme (C)** | API de gestion complète + IaC (Config Connector / Terraform). |
| **EA-11** Multi-tenant (interne/partenaires/public, BU) | **Conforme partiellement (CP)** | Cloisonnement par **organisations et environnements** Apigee ; multi-tenant réalisable, à concevoir soigneusement. |
| **EA-12** Empreinte légère en périphérie | **Conforme partiellement (CP)** | Le runtime hybrid (Cassandra, MP, ingress) a une **empreinte non négligeable** ; un déploiement « léger » en succursale à ressources contraintes est **à dimensionner et à vérifier**. |
| **EA-13** Rolling upgrade sans interruption | **Conforme (C)** | Mises à jour glissantes du runtime documentées. |
| **EA-14** Réversibilité / export en formats ouverts | **Conforme (C)** | Proxys et configurations exportables (OpenAPI, bundles) ; le code de proxy reste néanmoins spécifique à Apigee. |

### 2.3 Conclusion d'architecture (honnête)

Apigee hybrid est **fort sur la distribution des plans de données** (EA-03, EA-08, EA-09) mais **structurellement en tension avec deux exigences obligatoires majeures** : l'option d'un **plan de contrôle on-prem/souverain (EA-02)** et la **survivabilité pleine et configurable (EA-04/05)**. BBQ doit considérer ces deux points comme des **risques d'écart potentiellement éliminatoires** à instruire en priorité lors de la PoC-A.

---

## 3. Sécurité (authn / authz, mTLS, gestion des secrets, WAF API)

Apigee est historiquement très solide sur la sécurité applicative des API.

| Exigence | Verdict | Commentaire |
|---|---|---|
| **ES-01** OAuth2 / OIDC, validation JWT et jetons opaques (introspection) | **Conforme (C)** | Politiques OAuthV2, VerifyJWT, validation émetteur/audience/expiration/signature natives. |
| **ES-02** Autorisation fine par scopes / claims | **Conforme (C)** | Décisions par méthode/ressource via politiques et conditions. |
| **ES-03** mTLS consommateur et back-end + **certificate-bound tokens (FAPI)** | **Conforme partiellement (CP)** | mTLS northbound/southbound supporté. Le profil **FAPI 2.0** et la **liaison jeton-certificat** sont réalisables par configuration/politiques ; **maturité exacte du profil FAPI canadien à vérifier** (EF-18). |
| **ES-04** Intégration IAM / IdP externes (SAML, OIDC) | **Conforme (C)** | Fédération via IdP d'entreprise. |
| **ES-05** Zero Trust / PEP à chaque appel | **Conforme (C)** | La gateway agit comme point d'application de politique sur chaque requête. |
| **ES-06** MFA + RBAC/ABAC admin, séparation des tâches | **Conforme (C)** | Via Google Cloud IAM pour l'administration du plan de contrôle. À noter : la **gouvernance des identités admin passe par Google Cloud IAM**, ce qui est un point d'attention souveraineté. |
| **ES-07** Autorisation externalisée (OPA/PDP) | **Conforme partiellement (CP)** | Réalisable par callout vers un PDP externe ; non « clé en main ». |
| **ES-08** OWASP API Top 10 (BOLA/BFLA, injection, etc.) | **Conforme partiellement (CP)** | Couverture par validation de schéma, quotas, mTLS, **Advanced API Security** (détection d'abus, scoring). Certaines protections (BOLA) exigent une **conception applicative** ; pas de couverture purement automatique. |
| **ES-09** WAF / WAAP API en bordure | **Conforme partiellement (CP)** | Validation de charge/schéma native ; un **WAF complet** s'appuie typiquement sur **Google Cloud Armor** (en topologie X) ou un WAF tiers devant le runtime hybrid. À architecturer. |
| **ES-10** Limitation adaptative, géo-restriction, quarantaine | **Conforme partiellement (CP)** | Rate limiting/quotas natifs ; détection d'abus et blocage via **Advanced API Security** ; « adaptatif » au sens strict à valider. |
| **ES-11** Détection d'anomalies / abus (credential stuffing, scraping) | **Conforme partiellement (CP)** | **Advanced API Security** (module Apigee) couvre la détection d'abus et le scoring de sécurité. *(à vérifier : disponibilité d'Advanced API Security en topologie hybrid et au Canada.)* |
| **ES-12** Intégration SIEM/SOC (export normalisé) | **Conforme (C)** | Export de logs/événements vers SIEM via formats ouverts. |
| **ES-13** Détection des shadow/zombie APIs | **Conforme partiellement (CP)** | Capacité d'Advanced API Security / API hub ; à confirmer sur le périmètre hybrid. |
| **ES-14** TLS 1.2 min / 1.3, suites configurables | **Conforme (C)** | Supporté. |
| **ES-15** Chiffrement au repos (AES-256) | **Conforme (C)** | Données runtime et plan de contrôle chiffrées. |
| **ES-16** **BYOK** et **HYOK** | **Conforme partiellement (CP)** — **réserve** | **BYOK/CMEK** est supporté via Cloud KMS pour les données du plan de contrôle, et le client gère le chiffrement de son propre runtime/K8s. **HYOK strict (clés conservées et opérées entièrement hors du périmètre Google, y compris pour le plan de contrôle) est à vérifier** et pourrait ne pas être pleinement satisfait pour les données résidant côté plan de contrôle Google. **Point sensible pour la souveraineté.** |
| **ES-17** Intégration HSM / KMS / coffre-fort | **Conforme partiellement (CP)** | Cloud KMS / Cloud HSM côté Google ; intégration à un HSM d'entreprise on-prem **à concevoir**. |
| **ES-18** Rotation automatisée des secrets/certs | **Conforme partiellement (CP)** | Rotation supportée ; automatisation complète sans interruption à valider par cas. |
| **ES-19** Feuille de route PQC | **À vérifier (R)** | Google investit dans la cryptographie post-quantique au niveau plateforme ; disponibilité spécifique Apigee **à vérifier**. |

**Synthèse sécurité (C1).** Apigee est **globalement solide** sur l'authentification, l'autorisation, le chiffrement en transit et la protection applicative. Les **réserves principales** portent sur le **HYOK strict** (ES-16) et sur la dépendance à des modules complémentaires (Advanced API Security, Cloud Armor) pour atteindre la couverture WAAP/anomalies attendue.

---

## 4. Conformité et souveraineté (résidence Canada, certifications)

C'est le critère **le plus pondéré (C2, 13 pts)** et le **plus exposé** pour Apigee hybrid.

### 4.1 Résidence des données

Apigee propose une fonctionnalité de **résidence des données (data residency / DRZ)** permettant de choisir, à la création de l'organisation, la **région de stockage des données du plan de contrôle** (proxys, target servers, keystores, données analytiques, etc.). Une fois choisie, la localisation **ne peut plus être modifiée**.

- **Données du plan de données (runtime)** : restent **dans le périmètre du client** (le runtime traite et stocke le trafic localement). **Résidence pleinement maîtrisable** → satisfait l'esprit d'**EC-01** pour les charges sensibles, **à condition** que le runtime soit déployé au Canada.
- **Données du plan de contrôle** : la résidence dépend de la **disponibilité d'une juridiction « Canada »** dans la liste des régions de résidence Apigee. **Cette disponibilité est « à vérifier ».** Les régions GCP **northamerica-northeast1 (Montréal)** et **northamerica-northeast2 (Toronto)** existent, mais **l'inscription du Canada dans la liste des juridictions de résidence du plan de contrôle Apigee doit être confirmée auprès de Google** avant tout engagement. **C'est le point de conformité #1 à instruire.**

> **Réserve majeure de souveraineté.** Même avec la résidence des données activée, le **plan de contrôle reste opéré par Google**. La maîtrise opérationnelle (qui administre, depuis où) n'équivaut pas à la résidence des données. Pour **EC-02 (garanties anti-extraterritorialité / risque Cloud Act)**, BBQ doit exiger des **engagements contractuels spécifiques** (notification d'accès, contrôle d'accès du personnel Google, localisation du support). **À vérifier au cas par cas.**

### 4.2 Certifications et alignement réglementaire

| Exigence | Verdict | Commentaire |
|---|---|---|
| **EC-01** Résidence données réglementées au Canada | **Conforme partiellement (CP)** | Maîtrisable pour le **runtime** ; pour le **plan de contrôle**, **conditionnée à la disponibilité d'une résidence Canada (à vérifier)**. |
| **EC-02** Garanties anti-accès extraterritorial (Cloud Act) | **Conforme partiellement (CP)** — **réserve** | Nécessite des engagements contractuels Google. Le plan de contrôle opéré par Google constitue un facteur de risque résiduel à documenter pour la due diligence B-10. |
| **EC-03** Pistes d'audit immuables (append-only, intégrité) | **Conforme partiellement (CP)** | Journalisation d'audit via Cloud Audit Logs + logs runtime ; **immuabilité/append-only stricte avec intégrité vérifiable à confirmer** sur le périmètre exact. |
| **EC-04** Rapports de conformité BSIF / SOC 2 / PCI-DSS | **Conforme partiellement (CP)** | Tableaux de bord et extraction d'évidences disponibles ; gabarits « prêts pour le BSIF » à construire. |
| **EC-05** Alignement BSIF B-13 | **Conforme partiellement (CP)** | Google peut documenter la couverture ; **responsabilité partagée** (le client opère le runtime). |
| **EC-06** Éléments B-10 / B-2 / E-21 (tiers, résilience) | **Conforme partiellement (CP)** | Google fournit attestations et documentation de sous-traitance ; **dépendance à un fournisseur étranger (Google) à pondérer dans l'évaluation B-10**. |
| **EC-07** SOC 2 Type II | **Conforme (C)** | Apigee / Google Cloud couverts par les audits SOC 1/2/3. Rapports sous NDA. *(périmètre exact Apigee hybrid à vérifier.)* |
| **EC-08** PCI-DSS v4.0 | **Conforme partiellement (CP)** | Google Cloud / Apigee disposent d'attestations **PCI-DSS** ; **conformité v4.0 et périmètre hybrid à vérifier**. La segmentation PCI du runtime relève du client. |
| **EC-09** Loi 25 / LPRPDE (consentement, minimisation) | **Conforme partiellement (CP)** | La plateforme fournit les briques (classification, consentement via politiques) ; conformité = **responsabilité partagée**. |
| **EC-10** Classification des données + politiques automatiques | **Conforme partiellement (CP)** | Réalisable via métadonnées API hub + politiques ; automatisation complète à concevoir. |
| **EC-11** Politiques appliquées avant mise en prod (policy-as-code) | **Conforme partiellement (CP)** | Via CI/CD + linting + portes de qualité ; à outiller. |
| **EC-12** Rétention / purge configurables | **Conforme (C)** | Configurable. |
| **EC-13** Cloisonnement données d'assurance (AMF) | **Conforme partiellement (CP)** | Via organisations/environnements séparés. |
| **EC-14** Localisation du support/exploitation au Canada | **À vérifier (R)** | Engagement à obtenir contractuellement ; non garanti par défaut. |

**Certifications Canada utiles à mentionner :** Google Cloud a obtenu la certification **Protected B** du gouvernement fédéral canadien et propose des **Assured Workloads / Data Boundary for Canada (Protected B)**. *(à vérifier : l'inclusion d'Apigee hybrid dans le périmètre Protected B et l'usage en contexte FSI privé, qui diffère du contexte gouvernemental.)*

**Synthèse conformité (C2).** Apigee dispose d'un **socle de certifications solide** (SOC 2, PCI-DSS, Protected B au niveau Google Cloud) et d'une **résidence runtime pleinement maîtrisable**. **Mais le modèle « plan de contrôle opéré par Google » crée une tension de fond avec l'exigence de souveraineté stricte de BBQ.** C'est le **point faible le plus important** de cette candidature et il touche le critère le plus pondéré.

---

## 5. Couverture fonctionnelle des 10 cas d'usage

Légende : **C** = natif/conforme · **CP** = partiel / par configuration · **R** = feuille de route · **NC** = non couvert · **T** = par tiers/module.

| UC | Intitulé | Couverture | Justification synthétique |
|---|---|:---:|---|
| **UC1** | Open Banking / consentement / FAPI | **CP** | FAPI réalisable, consentement granulaire via politiques + développement. **Profil canadien et calendrier Open Banking « à vérifier ».** Pas de module « consentement Open Banking » prêt-à-l'emploi au sens canadien. |
| **UC2** | Paiements temps réel (RTR / ISO 20022) | **CP** | Idempotence (EF-09), validation de schéma, faible latence, rate limiting natifs. **Connecteur RTR / ISO 20022 spécifique non natif** — médiation à construire. Résidence runtime au Canada OK. |
| **UC3** | Portail partenaires / marketplace B2B | **C** | Portail développeur, abonnements gouvernés, gestion de credentials, plans de quota : **point fort historique d'Apigee**. |
| **UC4** | Façade mainframe / cœur | **C** | Médiation REST⇄SOAP, transformation XML⇄JSON, cache, circuit breaker, protection de charge : **bien couvert nativement**. |
| **UC5** | AuthN / AuthZ centralisées | **C** | OAuth2/OIDC/mTLS/JWT, scopes/claims, Zero Trust : **fort**. |
| **UC6** | Protection des menaces et abus | **CP** | OWASP partiellement natif + **Advanced API Security** (module) ; WAF complet via Cloud Armor / tiers. |
| **UC7** | Observabilité, traçabilité, audit | **CP** | Métriques/traces/logs, OpenTelemetry ; **immuabilité d'audit stricte à confirmer**. |
| **UC8** | Événementiel / webhooks | **CP** | Webhooks et façade d'API asynchrones réalisables ; **gouvernance AsyncAPI / Kafka native limitée** (voir section 8). |
| **UC9** | Gouvernance du cycle de vie / conformité par conception | **C / CP** | Cycle de vie complet, versionnage, linting OpenAPI, CI/CD, **API hub** comme catalogue d'entreprise : bien couvert. Automatisation policy-as-code à outiller. |
| **UC10** | Médiation IA / MCP | **C / CP** | **Point fort émergent** : passerelle IA native, Model Armor, politiques de jetons LLM, cache sémantique (voir section 9). MCP/agentique en montée en charge. |

---

## 6. Performance et scalabilité (C6)

| Exigence | Verdict | Commentaire |
|---|---|---|
| **EN-01** Latence ajoutée médiane ≤ 10 ms / p99 ≤ 30 ms | **À valider (CP)** | Apigee est conçu pour une latence faible, mais la latence ajoutée dépend des politiques activées (OAuth, mTLS, transformation, validation de schéma). **Seuils à mesurer en PoC-B.** |
| **EN-02** Débit ≥ dizaines de milliers req/s, scalabilité horizontale | **Conforme (C)** | Le runtime Kubernetes monte horizontalement (ajout de Message Processors / pods). Débit élevé démontré à l'échelle. |
| **EN-03** Faible latence + idempotence sous charge de pointe (paiements) | **Conforme partiellement (CP)** | Idempotence native ; tenue sous pics à démontrer en PoC. |
| **EN-04** Dégradation contrôlée sous surcharge | **Conforme partiellement (CP)** | Circuit breaker, bulkhead, priorisation réalisables ; « délestage gracieux » à configurer. |

**Note d'honnêteté.** Apigee hybrid étant auto-hébergé, **la performance dépend fortement du dimensionnement du cluster Kubernetes du client** (CPU, réseau, Cassandra). Les chiffres ne sont pas garantis « hors-sol » ; ils doivent être établis sur l'infrastructure réelle de BBQ en PoC-B.

---

## 7. Observabilité (C7)

| Exigence | Verdict | Commentaire |
|---|---|---|
| **EN-10** Métriques/logs/**traces distribuées OpenTelemetry** corrélées | **Conforme partiellement (CP)** | Apigee émet métriques et traces ; **support OpenTelemetry en progression** — niveau exact de l'export OTel natif et de la corrélation cross-environnements **à vérifier en PoC-F**. |
| **EN-11** Intégration outils d'observabilité / SIEM (formats ouverts) | **Conforme (C)** | Export vers Cloud Logging/Monitoring et systèmes tiers. |
| **EN-12** Tableaux de bord conformité/exploitation | **Conforme (C)** | Analytique Apigee riche ; tableaux personnalisables. |
| **EN-13** Alerting configurable | **Conforme (C)** | Alertes sur latence, erreurs, sécurité, quotas. |

**Réserve.** L'analytique avancée s'appuie en partie sur le **plan de contrôle Google** (traitement analytique côté cloud). En mode déconnecté, la collecte analytique est **mise en tampon puis abandonnée après quelques tentatives** (cf. section 2.2). À considérer pour l'auditabilité continue exigée par EC-03/EC-04.

---

## 8. Événementiel / streaming et GraphQL (C8)

| Exigence | Verdict | Commentaire |
|---|---|---|
| **EF-23** Catalogage / gouvernance **AsyncAPI** | **Conforme partiellement (CP)** | **API hub** peut référencer des API asynchrones ; gouvernance AsyncAPI **moins mature que pour REST**. |
| **EF-24** Médiation/sécurisation flux Kafka (MQTT/WS souhaités) | **Conforme partiellement (CP)** — **point faible relatif** | Apigee n'est **pas un broker d'événements**. La gouvernance native de Kafka / streaming est **limitée** ; intégration via façade d'API ou outils tiers. **Écart par rapport à des plateformes spécialisées event-driven.** |
| **EF-25** Webhooks sortants gouvernés (signature, retry, DLQ) | **Conforme partiellement (CP)** | Réalisable, mais **DLQ et retry de niveau entreprise à construire** ; pas un module clé-en-main. |
| **EF-26** Mêmes contrôles sécurité/classification sur les flux | **Conforme partiellement (CP)** | Possible sur les façades synchrones ; couverture native des topics Kafka limitée. |

**GraphQL** (EF-11, souhaité) : Apigee prend en charge **GraphQL en façade** (politique GraphQL, validation, limitation de profondeur). **Conforme partiellement (CP).**

**Synthèse C8.** L'événementiel est un **point faible relatif** d'Apigee comparé à des plateformes orientées event-streaming. BBQ devrait considérer Apigee comme **complémentaire** d'une plateforme de streaming dédiée plutôt que comme son remplaçant.

---

## 9. IA / LLM et agentique (passerelle IA, MCP / A2A) (C9)

C'est un **différenciateur récent et réel** d'Apigee (mis en avant par Gartner 2025 comme « pont vers l'IA agentique »).

| Exigence | Verdict | Commentaire |
|---|---|---|
| **EF-27** Passerelle IA / LLM (routage multi-modèles, limite de jetons, cache sémantique, coût) | **Conforme (C)** | Apigee propose des **politiques de jetons LLM** (PromptTokenLimit), du **cache sémantique** (réutilisation par similarité), routage multi-modèles et attribution de coût. Capacités natives effectives en 2025-2026. |
| **EF-28** Gouvernance **MCP** / outils d'agents | **Conforme partiellement (CP)** — **émergent** | Apigee se positionne comme passerelle pour API d'agents et expose des capacités d'AI gateway intégrables aux frameworks d'agents (p. ex. ADK). **Support MCP « à vérifier »** quant à sa maturité de gouvernance (enregistrement, politiques par outil, journalisation des invocations). Domaine en évolution rapide. |
| **EF-29** Garde-fous (masquage PII, DLP, filtrage) | **Conforme (C)** | **Model Armor** (intégré à Apigee) : détection d'injection de prompt, anti-jailbreak, filtres IA responsable, **protection des données sensibles**. *(disponibilité en GA et au Canada à vérifier ; lancé en preview publique mi-2025.)* |
| **EF-30** Audit prompts/réponses + plafonds budgétaires | **Conforme partiellement (CP)** | Attribution de coût par clé/équipe et limites de jetons supportées ; audit complet des prompts/réponses à outiller. |

**A2A (Agent-to-Agent)** : Google promeut le protocole A2A ; son intégration formelle dans Apigee est **« à vérifier »** (émergent, juin 2026).

**Synthèse C9.** Apigee est **parmi les plus avancés du marché** sur la passerelle IA/LLM. **Réserve souveraineté** : Model Armor et certaines fonctions IA s'appuient sur des services Google ; **leur disponibilité en résidence Canada et leur compatibilité avec l'exigence de non-fuite vers des modèles hors-Canada sont « à vérifier »** — point sensible pour EF-29 dans un contexte FSI souverain.

---

## 10. Expérience développeur et gouvernance (C10, C5)

| Exigence | Verdict | Commentaire |
|---|---|---|
| **EF-12** Portail self-service (découverte, sandbox, doc interactive, abonnement) | **Conforme (C)** | **Portail développeur Apigee** mature (intégré + option Drupal/portail intégré). Force historique. |
| **EF-13** Abonnements gouvernés (workflow d'approbation) | **Conforme (C)** | Workflows d'approbation supportés. |
| **EF-14** Cycle de vie des credentials (clés, secrets, certs mTLS) | **Conforme (C)** | Émission/rotation/révocation natives. |
| **EF-15** Plans de quota / tiers par partenaire | **Conforme (C)** | Produits API + plans de quota. |
| **EF-16** Portail personnalisable + **bilingue FR/EN** | **Conforme partiellement (CP)** | Personnalisation marque/thème OK ; **bilinguisme FR/EN à valider** selon le portail retenu. |
| **EF-17** Monétisation / refacturation | **Conforme partiellement (CP)** | Capacités de monétisation disponibles ; profondeur à valider. |
| **EF-03/04/05/06** Catalogue, cycle de vie, linting OpenAPI, CI/CD | **Conforme (C / CP)** | **API hub** = catalogue d'entreprise ; versionnage, dépréciation, linting et intégration CI/CD (GitOps via API de gestion + Config Connector/Terraform) bien couverts. |

**Génération de SDK** : Apigee génère de la documentation interactive (OpenAPI/Swagger) ; la génération de SDK multi-langages est **réalisable via outillage OpenAPI** (CP).

**Synthèse C10.** **Point fort clair** d'Apigee : l'expérience développeur, le portail partenaires et la gouvernance du cycle de vie sont matures et éprouvés en contexte d'entreprise.

---

## 11. Tarification indicative et TCO 3 ans (NON contractuel)

> **Avertissement.** Les montants ci-dessous sont **indicatifs, non contractuels**, fondés sur des **hypothèses explicites**, et destinés à la seule comparaison méthodologique. Le modèle commercial réel d'Apigee est négocié avec Google Cloud et **doit être confirmé**. **Tous les chiffres sont « à vérifier ».**

### 11.1 Modèle de licence (compréhension publique)

Apigee se commercialise principalement par **abonnement** (paliers de capacité / volume d'appels d'API), avec des **modules additionnels facturés séparément** (notamment **Advanced API Security**, **API hub**, capacités IA avancées). Apigee hybrid ajoute le **coût de l'infrastructure Kubernetes auto-gérée** (calcul, stockage, exploitation) **à la charge de BBQ**.

### 11.2 Hypothèses de simulation

- Volume : plusieurs milliards d'appels d'API/an à terme (institution de ~3,2 M clients).
- Topologie : Apigee hybrid, runtime multi-région au Canada (≥2 sites) + périphérie.
- Modules : Advanced API Security + API hub + capacités IA activés.
- Périmètre : licences Apigee + infrastructure runtime + exploitation interne + services d'implantation initiale.
- Devise : CAD ; horizon : 3 ans.

### 11.3 TCO 3 ans — ordres de grandeur indicatifs (à vérifier)

| Poste | Hypothèse | Ordre de grandeur 3 ans (CAD) — **indicatif** |
|---|---|---|
| Licences/abonnement Apigee (paliers entreprise) | Volume élevé + modules | **Élevé** — fourchette à obtenir de Google (souvent **7 chiffres/an** pour ce profil). *(à vérifier)* |
| Modules additionnels (Advanced API Security, API hub, IA) | Activés | Surcoût significatif — **à chiffrer séparément** |
| Infrastructure runtime (K8s multi-région + périphérie) | Auto-hébergée par BBQ | **Substantielle** (calcul, Cassandra, réseau, DR) |
| Exploitation interne (équipes runtime, mises à jour, DR) | Hybrid = exploitation à la charge du client | **Non négligeable** — coût caché majeur d'hybrid |
| Services d'implantation / intégration mainframe / RTR | Implantation initiale | Projet pluriannuel |
| **Total 3 ans** | | **Élevé — TCO total à établir précisément en phase de cadrage. Fourchette plurimillionnaire CAD.** |

### 11.4 Lecture TCO honnête

- **Avantage** : modèle d'abonnement plus **prévisible** qu'une facturation purement à l'appel non maîtrisable (favorable à EN-16), **si** le palier est bien dimensionné.
- **Risque** : (a) **coût d'exploitation du runtime auto-géré** souvent sous-estimé ; (b) **modules payants** qui s'additionnent ; (c) **verrouillage partiel** : le runtime est portable mais le **code de proxy et le plan de contrôle restent spécifiques Apigee/Google**. EA-14 (réversibilité) atténue sans annuler ce risque.

---

## 12. Références FSI, limites et risques honnêtes

### 12.1 Références (à confirmer sous NDA)

Apigee est largement déployé dans le secteur financier mondial (banques, assureurs, fintechs) et dans des contextes Open Banking. **Des références FSI canadiennes comparables, en topologie hybrid souveraine, doivent être demandées sous NDA** (EN-19). *(à vérifier : références précises et comparables au profil BBQ.)*

### 12.2 Forces principales (honnêtes)

- **Maturité et position de Leader** (Gartner 2025, plus haute Ability to Execute).
- **Cœur fonctionnel et sécurité applicative** très solides (UC4, UC5, C1).
- **Portail développeur et gouvernance du cycle de vie** matures (UC3, C5, C10).
- **Distribution des plans de données** flexible (on-prem, multi-cloud, périphérie) — runtime portable sur tout Kubernetes (atténue le verrouillage côté data plane).
- **Passerelle IA / LLM (Model Armor, politiques de jetons, cache sémantique)** parmi les plus avancées du marché (C9).
- **Socle de certifications** Google Cloud (SOC 2, PCI-DSS, Protected B Canada).

### 12.3 Faiblesses et risques (honnêtes, non minimisés)

1. **Plan de contrôle non installable on-prem / non souverain (EA-02, NC).** **Écart majeur, potentiellement éliminatoire** face à l'exigence stricte de BBQ. Le plan de contrôle est opéré par Google dans Google Cloud. **Risque #1.**
2. **Survivabilité partielle en mode déconnecté (EA-04/05, CP).** Le trafic existant continue, mais **pas de déploiement ni de mise à jour de config hors-ligne**, abandon de l'analytique après quelques tentatives, **aucune durée d'autonomie garantie documentée**, et **fail-open/fail-closed configurable par politique non natif**. **Risque #2.**
3. **Souveraineté / HYOK strict (ES-16, EC-02, CP).** Données du plan de contrôle chez Google ; **HYOK strict et garanties anti-extraterritorialité à instruire contractuellement**. Touche le critère le plus pondéré (C2). **Risque #3.**
4. **Résidence Canada du plan de contrôle « à vérifier ».** Disponibilité d'une juridiction « Canada » pour la résidence du plan de contrôle Apigee **non confirmée dans cette réponse** — à valider en priorité absolue.
5. **Événementiel / streaming (C8, CP).** Gouvernance native Kafka/AsyncAPI **limitée** ; Apigee est complémentaire, pas substitut, d'une plateforme de streaming.
6. **Dépendance à des modules payants** (Advanced API Security, API hub, IA) pour atteindre la couverture attendue → **impact TCO et complexité contractuelle**.
7. **Empreinte runtime en périphérie (EA-12, CP).** Runtime hybrid relativement lourd ; déploiement en succursale contrainte à dimensionner.
8. **Air-gap total (EA-06, CP).** Contredit par le besoin de connectivité périodique au plan de contrôle Google.

### 12.4 Recommandation de PoC ciblée

Pour BBQ, les scénarios **les plus discriminants** à imposer en PoC sont :
- **PoC-A (souveraineté + survivabilité)** : valider la résidence Canada du plan de contrôle, le comportement hors-ligne réel et sa durée → **adressera directement les risques #1, #2, #3, #4**.
- **PoC-B (paiements RTR / ISO 20022)** : mesurer la latence ajoutée réelle sur l'infrastructure de BBQ.
- **PoC-G (passerelle IA)** : valider Model Armor / masquage PII **en résidence Canada**.

---

## Conclusion

Apigee hybrid est une **plateforme de gestion d'API de premier rang**, particulièrement forte sur le **cœur fonctionnel, la sécurité applicative, le portail développeur, la gouvernance du cycle de vie et la passerelle IA**. Elle répond bien à une **large majorité des cas d'usage** de BBQ.

**Cependant, sur les deux critères les plus structurants du RFP — la souveraineté/conformité (C2, 13 pts) et l'architecture hybride résiliente (C3, 12 pts) — Apigee présente des écarts de fond honnêtes et potentiellement éliminatoires** : un **plan de contrôle non souverain (opéré par Google)** et une **survivabilité hors-ligne partielle et non pleinement configurable**. Ces points doivent être **instruits en priorité absolue** (résidence Canada du plan de contrôle, garanties anti-extraterritorialité, durée d'autonomie réelle) avant tout engagement.

**Verdict synthétique : candidature solide sur le fonctionnel et l'IA, mais fragilisée précisément là où BBQ pondère le plus — la souveraineté stricte et la survivabilité.**

---

*Réponse simulée — CAND3 / Google Cloud Apigee. Organisation cliente fictive ; capacités produit publiques vérifiées (juin 2026) ; prix indicatifs et non contractuels ; éléments marqués « à vérifier » à confirmer avec preuves auprès de l'éditeur avant tout usage opérationnel. Sources principales : documentation Google Cloud Apigee (hybrid, data residency, AI/Model Armor, token policies), blogue Google Cloud, Gartner Magic Quadrant for API Management 2025 (octobre 2025), notes de version Apigee 2025.*
