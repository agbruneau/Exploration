# Rapport d'évaluation consolidé — RFP-BBQ-APIM-2026

**Objet :** Évaluation comparative des soumissions pour l'acquisition d'une plateforme d'API Management d'entreprise en déploiement hybride strict
**Organisation cliente :** Banque Boréale du Québec (BBQ) — *organisation fictive*
**Référence du dossier :** RFP-BBQ-APIM-2026
**Phase :** Évaluation initiale sur dossier (préalable à la PoC des finalistes)
**Date :** Juin 2026
**Langue :** Français

---

## Avis d'intégrité et cadre de simulation

> **À lire avant toute exploitation de ce rapport.**
>
> - L'organisation cliente **Banque Boréale du Québec (BBQ)** est **entièrement fictive**. Aucune donnée réelle d'une institution nommée n'est utilisée. Tout profil, chiffre ou contexte la concernant est construit à des fins méthodologiques.
> - Les **réponses fournisseurs évaluées sont simulées**. Elles ont été rédigées à partir des **capacités produit publiques et vérifiées des éditeurs (Kong, IBM, Google Cloud Apigee, Gravitee, WSO2) en date de juin 2026**. Elles **n'engagent aucun éditeur** et ne constituent pas des déclarations officielles.
> - Les éléments de **prix, de TCO et de licence** cités sont **indicatifs et non contractuels**. Ils servent uniquement à la comparaison méthodologique et doivent être confirmés par devis officiel de chaque éditeur.
> - Tout élément **incertain, prospectif, sensible au temps ou postérieur à l'horizon de connaissance** (notamment : régions cloud canadiennes, versions exactes de certifications PCI-DSS v4.0 / SOC 2 Type II / Protected B, calendrier définitif de l'Open Banking canadien et des spécifications RTR / ISO 20022 de Paiements Canada, feuilles de route IA/MCP) est marqué **« à vérifier »** et devra être confirmé avec preuves lors de la PoC et de la due diligence B-10.
> - **Les preuves produites en PoC priment sur les déclarations sur dossier** (RFP §6.3). Le présent rapport conclut la phase d'évaluation **sur dossier** et fonde une recommandation de **liste restreinte**, non une décision d'attribution.
> - Les notes et les calculs présentés (classement, détail par critère, analyse de sensibilité) ont été **établis et vérifiés par programme**. Le présent document les **restitue fidèlement et les commente**, sans recalcul.

---

## Table des matières

1. [Synthèse exécutive et recommandation](#1-synthèse-exécutive-et-recommandation)
2. [Méthode de notation](#2-méthode-de-notation)
3. [Tableau de classement](#3-tableau-de-classement)
4. [Détail des notes par critère](#4-détail-des-notes-par-critère)
5. [Analyse qualitative par candidat](#5-analyse-qualitative-par-candidat)
6. [Analyse de sensibilité et robustesse du classement](#6-analyse-de-sensibilité-et-robustesse-du-classement)
7. [Risques et conditions](#7-risques-et-conditions)
8. [Avis et limites](#8-avis-et-limites)

---

## 1. Synthèse exécutive et recommandation

### 1.1 Résultat de l'évaluation sur dossier

Cinq solutions ont été évaluées sur les **onze critères pondérés** du RFP (total 100 points), au regard des dix cas d'usage de BBQ et des exigences obligatoires de souveraineté (EX-01), de survivabilité (EX-02), d'auditabilité (EX-03), de standards ouverts (EX-04) et de conformité par conception (EX-05).

Le classement final sur dossier est le suivant :

1. **Gravitee — 75,4 / 100** (finaliste de tête)
2. **Kong — 73,0 / 100** (second finaliste)
3. **WSO2 — 72,2 / 100**
4. **IBM — 71,0 / 100**
5. **Google Cloud Apigee — 61,6 / 100**

### 1.2 Lecture d'ensemble

L'écart entre les **quatre premiers candidats est resserré (75,4 → 71,0, soit 4,4 points)**, ce qui traduit un marché mûr où plusieurs plateformes répondent solidement au besoin hybride et souverain de BBQ. Le **cinquième candidat (Apigee) décroche nettement (61,6)**, non par faiblesse fonctionnelle — il est au contraire fort sur le cœur, le portail et l'IA — mais en raison d'un **écart structurel sur les deux critères les plus pondérés** : son plan de contrôle n'est pas installable on-prem ni dans un cloud souverain tiers (C2, C3), ce qui heurte de front l'exigence de souveraineté stricte de BBQ.

Les trois critères prioritaires de BBQ — **C2 souveraineté/conformité (13), C1 sécurité (12), C3 architecture hybride (12), soit 37 points sur 100** — concentrent l'essentiel de la différenciation. C'est sur ce bloc que **Gravitee et Kong** se détachent grâce à un modèle 100 % self-hostable couplé à un fort anti-verrouillage, tandis qu'**Apigee** y perd le plus de terrain.

### 1.3 Recommandation

> **Retenir deux finalistes pour la phase de preuve de concept (PoC) :**
>
> - **Finaliste de tête : Gravitee (75,4).** Architecture hybride mature, modèle open source anti-verrouillage, leadership différenciant sur l'événementiel (C8) et l'IA/MCP (C9), FAPI 1 Advanced certifié pour l'Open Banking. Réserve principale : **certifications éditeur formelles (SOC 2 Type II, PCI-DSS, Protected B) non confirmées publiquement** sur le critère le plus pondéré (C2), à instruire impérativement.
> - **Second finaliste : Kong (73,0).** Architecture hybride et survivabilité matures, souveraineté atteignable par self-managed, anti-verrouillage réel (OSS, decK, standards ouverts), performance/faible latence et leadership IA/MCP. Réserve principale : **région Konnect SaaS canadienne et portée exacte des certifications par périmètre à vérifier**, BYOK/HYOK et audit immuable relevant de l'architecture plutôt que de modules clés en main.

**Décision proposée : départage par PoC** entre Gravitee et Kong, l'écart sur dossier (2,4 points) étant inférieur à l'incertitude résiduelle que seule la PoC peut lever. Les scénarios discriminants ci-dessous sont ceux **priorisés pour le départage Gravitee/Kong** ; l'ensemble complet (PoC-A à PoC-G) est défini au RFP §6.3, PoC-C (façade mainframe) et PoC-E (portail partenaires) y étant secondaires pour ce départage précis. Les scénarios à imposer aux deux finalistes sont :

- **PoC-A — Souveraineté + survivabilité** (EX-01, EX-02) : contrôle plane self-hosted au Canada, BYOK/HYOK avec HSM de BBQ, comportement réel en mode déconnecté (durée d'autonomie, fail-open/fail-closed par politique).
- **PoC-B — Paiements RTR / ISO 20022** (UC2) : latence ajoutée réelle et tenue sous charge de pointe sur l'infrastructure de BBQ.
- **PoC-D — Sécurité OWASP API Top 10** (UC6) : couverture BOLA/BFLA et identification des compléments tiers éventuels (WAAP).
- **PoC-F — Audit immuable** (EX-03) : intégrité vérifiable des pistes d'audit via la chaîne SIEM/WORM.
- **PoC-G — IA / MCP / masquage PII** (UC10) : robustesse du masquage PII bilingue (FR/EN) et prévention de fuite vers les modèles, **avec garde-fous résidant au Canada**.

**WSO2 (72,2) et IBM (71,0)** sont des **candidats crédibles à maintenir en réserve** : tous deux dépassent les premiers finalistes sur certains axes (souveraineté par self-hosting pour WSO2 ; sécurité DataPower, médiation mainframe et pérennité éditeur pour IBM). Ils devraient être réintégrés à la PoC si l'un des deux finalistes échouait à lever ses réserves majeures.

---

## 2. Méthode de notation

### 2.1 Barème et formule

L'évaluation est conduite sur **100 points** répartis entre **onze critères pondérés** (C1 à C11), conformément à la section 5 du RFP. Chaque critère reçoit une **note brute sur 5** attribuée par le comité d'évaluation au regard des réponses sur dossier et des preuves publiques mobilisées.

La **note finale pondérée** d'un candidat est obtenue par la formule :

> **Note finale = Σ ( (note_critère / 5) × poids_critère )**, les poids totalisant 100.

Autrement dit, chaque note brute sur 5 est convertie en proportion (note/5), multipliée par le poids du critère, et la somme des onze contributions donne le score sur 100. Une note de 4/5 sur un critère pondéré 12 contribue ainsi pour 4/5 × 12 = 9,6 points.

### 2.2 Échelle de notation (1 à 5)

| Note | Signification générale |
|---:|---|
| 5 | Excellence distinctive — capacité « au-dessus du lot », différenciante et démontrée |
| 4 | Conforme / solide — couverture native ou par configuration maîtrisée, sans réserve majeure |
| 3 | Satisfaisant avec réserves — couverture partielle, assemblage ou éléments à valider |
| 2 | Faible — écart structurel ou dépendance pénalisante au regard de l'exigence |
| 1 | Insuffisant / non couvert |

### 2.3 Pondération des critères (rappel)

| Code | Critère | Poids |
|---|---|---:|
| C1 | Sécurité des API et protection contre les menaces | 12 |
| C2 | Conformité réglementaire et souveraineté des données | 13 |
| C3 | Architecture hybride, portabilité et résilience | 12 |
| C4 | Capacités fonctionnelles cœur de gestion des API | 11 |
| C5 | Gouvernance du cycle de vie et catalogue d'entreprise | 9 |
| C6 | Performance, scalabilité et faible latence | 7 |
| C7 | Observabilité, monitoring et auditabilité opérationnelle | 7 |
| C8 | Support de l'API événementielle et du streaming | 6 |
| C9 | Capacités IA, agentique et passerelle LLM | 7 |
| C10 | Expérience développeur et portail self-service | 8 |
| C11 | Coût total de possession, modèle de licence et écosystème | 8 |
| | **Total** | **100** |

> **Note de calibrage.** Les notes brutes ont fait l'objet d'un **calibrage inter-candidats** par le comité (voir section 6.3), garantissant qu'une même note traduit un même niveau compétitif d'un candidat à l'autre. Deux ajustements ciblés ont été appliqués, sans refonte du barème.

---

## 3. Tableau de classement

> *Résultats vérifiés par programme — restitués verbatim.*

| Rang | Solution | Note /100 |
|---:|---|---:|
| 1 | **Gravitee** | **75.4** |
| 2 | **Kong** | **73.0** |
| 3 | **WSO2** | **72.2** |
| 4 | **IBM** | **71.0** |
| 5 | **Google Cloud Apigee** | **61.6** |

**Lecture.** Les quatre premiers se tiennent dans une fourchette de 4,4 points, signe d'une concurrence serrée entre plateformes self-hostables matures. Apigee se distingue de ce peloton par un retrait de ~9,4 points sur le quatrième, imputable au critère souveraineté (voir sections 5.3 et 6).

---

## 4. Détail des notes par critère

> *Notes brutes /5 par critère et note pondérée finale — vérifiées par programme, restituées verbatim.*

| Code | Critère | Poids | Kong | IBM | Google Cloud Apigee | Gravitee | WSO2 |
|---|---|---:|---:|---:|---:|---:|---:|
| C1 | Sécurité des API et protection contre les menaces | 12 | 4 | 4 | 4 | 4 | 3 |
| C2 | Conformité réglementaire et souveraineté des données | 13 | 3 | 4 | 2 | 3 | 4 |
| C3 | Architecture hybride, portabilité et résilience | 12 | 4 | 4 | 2 | 4 | 4 |
| C4 | Capacités fonctionnelles coeur de gestion des API | 11 | 4 | 4 | 4 | 4 | 4 |
| C5 | Gouvernance du cycle de vie et catalogue d'entreprise | 9 | 4 | 4 | 4 | 3 | 4 |
| C6 | Performance, scalabilité et faible latence | 7 | 4 | 3 | 3 | 3 | 3 |
| C7 | Observabilité, monitoring et auditabilité opérationnelle | 7 | 4 | 3 | 3 | 4 | 3 |
| C8 | Support de l'API événementielle et du streaming | 6 | 3 | 4 | 2 | 5 | 3 |
| C9 | Capacités IA, agentique et passerelle LLM | 7 | 4 | 3 | 4 | 4 | 3 |
| C10 | Expérience développeur et portail self-service | 8 | 3 | 3 | 4 | 4 | 4 |
| C11 | Coût total de possession, modèle de licence et écosystème | 8 | 3 | 2 | 2 | 4 | 4 |
| **Total** | **Note ponderee /100** | **100** | **73.0** | **71.0** | **61.6** | **75.4** | **72.2** |

### 4.1 Faits saillants de la matrice

- **C1 (Sécurité, 12) :** quatre candidats à 4/5 (Kong, IBM, Apigee, Gravitee), WSO2 à 3/5. La sécurité d'identité, de transport et de politique est mûre partout ; WSO2 est légèrement en retrait sur la détection comportementale / WAAP avancée (complément tiers probable).
- **C2 (Souveraineté/conformité, 13 — le plus pondéré) :** IBM et WSO2 mènent (4/5) grâce, respectivement, au cloud souverain canadien + on-prem et au self-hosting intégral porteur de certifications. Kong et Gravitee suivent (3/5), Apigee est seul à 2/5 — ancre basse cohérente (plan de contrôle opéré par Google).
- **C3 (Architecture hybride, 12) :** quatre candidats à 4/5, Apigee seul à 2/5 (plan de contrôle non installable hors Google Cloud, survivabilité partielle).
- **C8 (Événementiel, 6) :** **Gravitee est seul à 5/5** (leadership event-native / Kafka-native reconnu), IBM à 4/5 (apport webMethods), Kong/WSO2 à 3/5, Apigee à 2/5 (point faible relatif).
- **C11 (TCO/écosystème, 8) :** clivage net OSS / propriétaire — Gravitee et WSO2 à 4/5 (open source, anti-verrouillage), Kong à 3/5, IBM et Apigee à 2/5 (haut de gamme, modules additionnels, verrouillage partiel).

---

## 5. Analyse qualitative par candidat

Légende des niveaux de couverture cités : **C** natif/conforme · **CP** partiel ou par configuration · **T** par tiers/module · **R** feuille de route · **NC** non couvert.

### 5.1 Gravitee — 75,4 (rang 1, finaliste de tête)

**Profil.** Éditeur d'API Management à noyau open source (Apache 2.0) complété d'une Enterprise Edition, positionné Leader au Gartner MQ API Management 2025 *(à vérifier pour toute évolution postérieure à octobre 2025)*. Plateforme couvrant nativement le synchrone (REST/SOAP/GraphQL/gRPC), l'événementiel (Kafka, MQTT) et le trafic IA/agentique (LLM, MCP, A2A).

**Forces.**
- **Architecture hybride mature et documentée** (C3 = 4) : séparation control plane / data plane native, « bridge gateway » synchronisant les gateways de données avec les dépôts du plan de contrôle ; topologie « control plane souverain + data planes là où circulent les données » nativement supportée (EA-02/EA-03).
- **Anti-verrouillage open source réel** (C11 = 4) : même binaire de gateway quel que soit le substrat, formats ouverts (OpenAPI, AsyncAPI), repli OSS possible sur le cœur REST — stratégie de sortie crédible (EA-14).
- **Leadership différenciant sur l'événementiel** (C8 = 5, seul 5 du tableau) : gateway event-native / Kafka-native parlant le protocole Kafka, AsyncAPI au portail, médiation MQTT/WS/SSE, webhooks gouvernés (DLQ, signature), politiques au niveau message.
- **IA / MCP / A2A avancés** (C9 = 4) : AI Gateway (LLM proxy), MCP Tool Server / MCP Proxy, agent mesh A2A, IAM agentique.
- **FAPI 1 Advanced certifié** (C1 = 4) via Access Management (certificate-bound tokens, PAR, mTLS) — atout direct pour l'Open Banking (UC1).
- **Souveraineté par self-hosting** (C2 = 3) : en mode self-hosted intégral, aucune donnée réglementée ne transite par Gravitee Cloud.

**Faiblesses et réserves.**
- **Certifications éditeur formelles** : SOC 2 Type II, PCI-DSS v4.0 et Protected B **non confirmés publiquement** (à vérifier sous NDA). Gravitee détient ISO 27001 / ISO 27701 et FAPI, mais présente moins de garanties documentées que les hyperscalers sur le critère le plus pondéré (C2). Atout compensatoire : en self-hosted, c'est l'environnement certifié de BBQ qui porte l'essentiel des attestations.
- **Région cloud souveraine canadienne** non confirmée → recommandation : control plane auto-hébergé au Canada plutôt que Gravitee Cloud.
- **BYOK/HYOK et immuabilité d'audit** : propriétés d'architecture (KMS/HSM et SIEM/WORM de BBQ), à concevoir et démontrer (PoC-A, PoC-F).
- **Connecteurs clé en main** RTR / ISO 20022 (UC2) et mainframe / CICS (UC4) non natifs → intégration à prévoir.
- **C5 (gouvernance, note 3)** : légèrement en retrait du peloton (GitOps et linting présents mais à industrialiser ; voir calibrage §6.3).
- **Taille d'éditeur intermédiaire** : due diligence B-10 (pérennité, support localisé Canada) particulièrement importante.

**Adéquation FSI hybride.** Très bonne. Le couple « hybride mature + anti-verrouillage + différenciation événementiel/IA » colle au programme de modernisation de BBQ. Le point de vigilance se concentre sur les **preuves de conformité formelle** — précisément ce que la PoC et la due diligence doivent établir.

### 5.2 Kong — 73,0 (rang 2, second finaliste)

**Profil.** Éditeur indépendant spécialisé dans la connectivité d'API ; moteur Kong Gateway à variante open source (Nginx/OpenResty). Positionné Leader au Gartner MQ API Management 2025 *(à vérifier)*. Réponse articulée autour de Kong Gateway Enterprise (data plane), Konnect (control plane SaaS ou self-managed), AI Gateway, Event Gateway et Developer Portal.

**Forces.**
- **Architecture hybride et survivabilité matures** (C3 = 4) : « hybrid mode » de référence, communication CP↔DP en mTLS, cache local LMDB permettant la continuité d'application des politiques en mode déconnecté.
- **Performance / faible latence** (C6 = 4, meilleure note du tableau sur ce critère) : moteur reconnu pour une latence additionnelle de quelques millisecondes ; cibles RFP (médiane ≤ 10 ms, p99 ≤ 30 ms) réalistes (à mesurer en PoC-B).
- **Anti-verrouillage** (C11 = 3) : runtime OSS, configuration YAML ouverte (decK / GitOps), portabilité multi-cloud — stratégie de sortie crédible.
- **Leadership IA / MCP** (C9 = 4) : AI Gateway multi-modèles (dont Bedrock), Enterprise MCP Gateway, masquage PII (20 catégories, 9 langues), plafonds de coût.
- **Observabilité standardisée** (C7 = 4) : OpenTelemetry natif, corrélation cross-environnements hybrides.
- **Souveraineté atteignable** (C2 = 3) par déploiement self-managed (données réglementées 100 % au Canada, risque Cloud Act réduit).

**Faiblesses et réserves.**
- **Région Konnect SaaS au Canada non confirmée** (régions actuelles US/EU/AU/EAU/Inde) → control plane self-managed recommandé pour la souveraineté stricte (à vérifier).
- **BYOK/HYOK, audit immuable, consentement Open Banking, connecteur RTR/ISO 20022** : assemblages (KMS/HSM, SIEM/WORM, services à intégrer) plutôt que modules clés en main.
- **Certifications** (PCI RoC, SOC 2 Type II) revendiquées côté Konnect SaaS ; portée sur un déploiement self-managed différente ; Protected B / FedRAMP non confirmés (à vérifier).
- **Événementiel plus récent** (C8 = 3) : Event Gateway centré Kafka, AsyncAPI au portail « coming soon » (à vérifier), MQTT/SSE à valider.
- **Expérience développeur** (C10 = 3) : forte orientation API-as-code/GitOps, mais bilinguisme FR/EN packagé, génération de SDK et monétisation à vérifier.
- **Modèle de prix Konnect** : composante par requête réduisant la prévisibilité à grande échelle → négocier une licence Enterprise self-managed à capacité.

**Adéquation FSI hybride.** Très bonne. Profil techniquement homogène et performant, particulièrement adapté à des équipes plateforme matures (GitOps). Les réserves portent surtout sur la **souveraineté du plan de contrôle géré** et la **maturité de l'événementiel**, deux points à départager en PoC.

### 5.3 WSO2 — 72,2 (rang 3)

**Profil.** Éditeur d'intégration et d'API Management à socle open source (Apache 2.0) + souscription de support. Positionné **Visionnaire** (et non Leader) au Gartner MQ 2025, avec une réserve sur l'orientation « très technique » de l'offre. Réponse fondée sur l'API Platform auto-hébergée (API Manager + APK/Envoy), l'Identity Server, et l'AI/MCP Gateway ; SaaS (Choreo) explicitement écarté pour les charges réglementées.

**Forces.**
- **Souveraineté par auto-hébergement** (C2 = 4, à égalité avec IBM en tête) : 100 % des données sous contrôle de BBQ, **HYOK intrinsèque** (l'éditeur ne détient jamais les clés), anti-extraterritorialité structurelle pour les charges sensibles.
- **Anti-verrouillage / TCO de licence** (C11 = 4) : socle open source, standards ouverts (OpenAPI, AsyncAPI, OAuth2/OIDC, OpenTelemetry), réversibilité.
- **Médiation et intégration legacy/mainframe** (C4 = 4) : héritage ESB profond (Micro Integrator), atout pour UC4.
- **AuthN/AuthZ et identité** (C1 = 3) : Identity Server maison auto-hébergeable, OAuth2/OIDC/mTLS/FAPI, Zero Trust.
- **Portail et gouvernance du cycle de vie** (C5 = 4, C10 = 4) solides ; portail bilingue FR/EN, multi-tenant.

**Faiblesses et réserves.**
- **Certifications portées par l'exploitant, pas par l'éditeur** : SOC 2 / PCI de WSO2 couvrent ses offres SaaS, **pas l'instance auto-hébergée de BBQ** ; en auto-hébergé, BBQ porte la charge de conformité. Nuance déterminante à clarifier d'emblée.
- **Sécurité API avancée** (C1 = 3) : WAAP / détection comportementale partielles, complément tiers probable (PoC-D).
- **Masquage PII via guardrails IA tiers hébergés hors Canada** (C9 = 3) : risque de souveraineté → imposer des garde-fous résidents (PoC-G).
- **Exigence de maturité d'ingénierie** : plateforme « très technique » ; le TCO réel et le succès dépendent fortement des compétences internes / de l'intégrateur (risque d'exploitation).
- **Survivabilité déconnectée** : throttling distribué et introspection de jetons opaques peuvent dépendre de composants centraux (PoC-A).
- **Performance** (C6 = 3) et **événementiel** (C8 = 3) : plausibles mais à démontrer (latence dépendante des politiques ; profondeur des politiques par topic et DLQ à valider).

**Adéquation FSI hybride.** Bonne, surtout pour une institution qui **veut le contrôle** plutôt que déléguer la conformité. WSO2 est le plus fort du panel sur la souveraineté brute, mais transfère la charge de certification et d'exploitation vers BBQ. À maintenir en réserve proche des finalistes.

### 5.4 IBM — 71,0 (rang 4)

**Profil.** Éditeur d'envergure mondiale, présence canadienne établie (équipes, IBM Consulting, régions IBM Cloud Toronto/Montréal). Réponse fondée sur API Connect (v12) + webMethods Hybrid Integration, passerelles DataPower Gateway / DataPower Nano Gateway, AI Gateway/MCP + ContextForge. Leader au Gartner MQ 2025 *(à vérifier)*.

**Forces.**
- **Sécurité et médiation DataPower** (C1 = 4) matures, éprouvées en FSI ; WAF/WAAP natif, validation de schéma stricte (atout historique sur XML/JSON et ISO 20022).
- **Souveraineté canadienne crédible** (C2 = 4, en tête avec WSO2) : cloud CA Toronto/Montréal + on-prem + BYOK/HYOK (Key Protect / Hyper Protect Crypto Services, HSM FIPS jusqu'à 140-3 L4 *à vérifier*) + services et support locaux.
- **Façade mainframe / cœur** (C4 = 4) : **point fort distinctif** (connecteurs MQ, IMS, CICS, z/OS, médiation REST⇄SOAP sans réécriture) — UC4.
- **Événementiel mature** (C8 = 4) via l'apport webMethods (Kafka, AsyncAPI, webhooks gouvernés).
- **Pérennité et solidité de l'éditeur** : atout B-10 réel.
- **Offre IA/MCP réelle** (C9 = 3) : AI Gateway + ContextForge (open source).

**Faiblesses et réserves.**
- **TCO élevé et complexité de licence** (C11 = 2, à égalité basse avec Apigee) : IBM rarement l'option la moins chère ; modules additionnels (sécurité API avancée, IA) à isoler ; risque budgétaire.
- **Convergence API Connect / webMethods récente** : cible produit unifiée et feuille de route de fusion à clarifier contractuellement (B-10) — incertitude stratégique à 3-5 ans (à vérifier).
- **AI Gateway / MCP** : maturité production FSI et support contractuel de ContextForge (open source) à éprouver (PoC-G).
- **Risque Cloud Act résiduel** : IBM étant de droit américain, garantie anti-extraterritoriale absolue seulement par HYOK + on-prem ; clauses à négocier (EC-02).
- **Verrouillage applicatif** : politiques DataPower / GatewayScript non portables (la stratégie de sortie atténue sans éliminer).
- **Ergonomie DX** (C10 = 3) : portail historiquement perçu comme moins moderne (atténué par IBM API Studio, à vérifier).
- **Performance** (C6 = 3) et **observabilité** (C7 = 3) : solides mais corrélation hybride hétérogène à valider (PoC-B, PoC-F).

**Adéquation FSI hybride.** Solide, particulièrement forte sur la sécurité, la médiation mainframe et la souveraineté canadienne. Le frein principal est le **TCO/complexité de licence (C11 = 2)** et l'**incertitude de convergence produit**, qui pèsent face à des concurrents OSS plus économiques. À maintenir en réserve, réintégrable en PoC si un finaliste défaille.

### 5.5 Google Cloud Apigee — 61,6 (rang 5)

**Profil.** Plateforme de gestion d'API très mature (héritage Apigee, Google depuis 2016), Leader au Gartner MQ 2025 avec la plus haute Ability to Execute *(à vérifier)*. Topologie de référence évaluée : **Apigee hybrid** (plan de contrôle géré par Google ; plans de données auto-hébergés sur Kubernetes).

**Forces.**
- **Cœur fonctionnel et sécurité applicative** (C4 = 4, C1 = 4) très solides (OAuthV2, VerifyJWT, mTLS, validation de schéma).
- **Portail développeur et gouvernance du cycle de vie** (C10 = 4, C5 = 4) matures et éprouvés (API hub comme catalogue d'entreprise).
- **Passerelle IA / LLM** (C9 = 4) parmi les plus avancées : politiques de jetons LLM, cache sémantique, Model Armor (masquage PII, anti-jailbreak — *GA et résidence Canada à vérifier*).
- **Distribution des plans de données** flexible (runtime portable sur tout Kubernetes : on-prem, multi-cloud, périphérie) — atténue le verrouillage côté data plane.
- **Socle de certifications Google Cloud** (SOC 2, PCI-DSS, Protected B au niveau plateforme).

**Faiblesses et réserves — déterminantes pour le rang.**
- **Plan de contrôle non installable on-prem / non souverain** (C3 = 2, **écart majeur potentiellement éliminatoire**, EA-02 = NC) : opéré exclusivement par Google dans Google Cloud. C'est le facteur premier du décrochage au classement.
- **Souveraineté / conformité** (C2 = 2, **seule ancre basse du tableau**) : données du plan de contrôle chez Google ; **résidence Canada du plan de contrôle « à vérifier »** ; HYOK strict et garanties anti-extraterritorialité à instruire contractuellement. Le critère le plus pondéré est précisément le plus exposé.
- **Survivabilité partielle en mode déconnecté** (EA-04/05 = CP) : trafic existant maintenu, mais pas de déploiement ni de mise à jour de config hors-ligne, analytique abandonnée après quelques tentatives, **aucune durée d'autonomie garantie**, fail-open/fail-closed non natif.
- **Événementiel** (C8 = 2, **point faible relatif le plus bas du tableau**) : Apigee n'est pas un broker ; gouvernance native Kafka/AsyncAPI limitée — complémentaire d'une plateforme de streaming, pas substitut.
- **TCO** (C11 = 2) : dépendance à des modules payants (Advanced API Security, API hub, IA), coût d'exploitation du runtime auto-géré souvent sous-estimé, verrouillage partiel (code de proxy et plan de contrôle spécifiques).
- **Empreinte runtime en périphérie** et **air-gap total** : en tension avec le besoin de connectivité périodique au plan de contrôle Google.

**Adéquation FSI hybride.** Candidature solide sur le fonctionnel, le portail et l'IA, mais **fragilisée précisément là où BBQ pondère le plus** : souveraineté stricte et survivabilité pleine. Le modèle « plan de contrôle opéré par Google » est structurellement en tension avec l'exigence hybride stricte du RFP — d'où la 5ᵉ place malgré des qualités fonctionnelles réelles.

---

## 6. Analyse de sensibilité et robustesse du classement

> *Résultats calculés et vérifiés par programme — présentés et commentés ci-dessous.*

Pour tester la robustesse du classement face aux priorités stratégiques de BBQ, le comité a recalculé les scores sous deux pondérations alternatives, en plus de la pondération de base du RFP.

### 6.1 Pondération de base (RFP)

> **1. Gravitee (75,4) — 2. Kong (73,0) — 3. WSO2 (72,2) — 4. IBM (71,0) — 5. Google Cloud Apigee (61,6)**

C'est le classement officiel de la section 3.

### 6.2 Scénario « Souveraineté & conformité renforcées » (× 1,4 sur sécurité + conformité)

> **1. Gravitee (74,9) — 2. Kong (72,7) — 3. WSO2 (72,0) — 4. IBM (71,8) — 5. Google Cloud Apigee (61,4)**

**Commentaire.** En sur-pondérant la sécurité (C1) et la conformité/souveraineté (C2) — le scénario le plus proche des priorités déclarées de BBQ — **l'ordre est inchangé sur les cinq rangs** : Gravitee reste en tête, Kong second, WSO2 troisième, IBM quatrième, Apigee dernier. Effet notable : **IBM se rapproche fortement de WSO2** (71,8 contre 72,0, écart réduit à 0,2 point), bénéficiant de ses notes C1 = 4 et C2 = 4 ; Kong (72,7) conserve sa 2ᵉ place devant ce duo. Apigee demeure dernier et même légèrement en recul (61,4), son C2 = 2 étant amplifié. **Conclusion : le classement complet est robuste à un durcissement souveraineté ; seule la lutte WSO2/IBM pour la 3ᵉ place devient quasi indécise.**

### 6.3 Scénario « Coût & expérience développeur renforcés » (× 1,5 sur coût + DX)

> **1. Gravitee (75,7) — 2. WSO2 (72,8) — 3. Kong (72,0) — 4. IBM (69,4) — 5. Google Cloud Apigee (61,5)**

**Commentaire.** En sur-pondérant le TCO/écosystème (C11) et l'expérience développeur (C10), **Gravitee se renforce encore (75,7)** — il cumule C11 = 4 et C10 = 4. Changement de rang significatif : **WSO2 passe 2ᵉ (72,8) et dépasse Kong (72,0)**, porté par son C11 = 4 et son C10 = 4, là où Kong est à 3 sur les deux. **IBM recule (69,4)**, pénalisé par son C11 = 2. Apigee reste dernier malgré son C10 = 4, plombé par C11 = 2 et ses écarts de souveraineté. **Conclusion : la 2ᵉ place est sensible aux priorités de coût/DX** — c'est l'enseignement principal de la sensibilité.

### 6.4 Synthèse de robustesse

| Constat | Robustesse |
|---|---|
| **Gravitee 1ᵉʳ** dans les trois scénarios | **Très robuste** — leadership confirmé quelle que soit la pondération testée |
| **Apigee 5ᵉ** dans les trois scénarios | **Très robuste** — l'écart de souveraineté/architecture est structurel |
| **2ᵉ place (Kong vs WSO2)** | **Sensible** — Kong devant en base et en souveraineté ; WSO2 devant en coût/DX |
| **3ᵉ–4ᵉ place (WSO2 vs IBM)** | **Sensible** — quasi-égalité en souveraineté renforcée ; WSO2 décroche IBM en coût/DX |

**Implication pour la décision.** Le choix du **finaliste de tête (Gravitee) est stable** et peu discutable sur dossier. Le choix du **second finaliste mérite d'être tranché en PoC** : Kong est le choix de base, mais si BBQ privilégie in fine le coût et l'expérience développeur, WSO2 redevient un concurrent direct pour la 2ᵉ place. Cette sensibilité justifie de **conserver WSO2 (et IBM) en réserve proche** plutôt que de les écarter.

### 6.5 Note de calibrage inter-candidats du comité

Le comité a procédé à un **calibrage inter-candidats** : pour chaque critère, vérification que la même note traduit le même niveau compétitif d'un candidat à l'autre, en concentrant l'examen sur les critères à fort écart (spread ≥ 2 : C2, C3, C8, C11) où un 5/4/2 risquait de ne pas porter le même sens.

**Deux ajustements seulement (pas de refonte), tous deux sur CAND4 / Gravitee :**

- **Gravitee C2 : 2 → 3.** Correction d'une sous-notation de la souveraineté : un produit 100 % self-hostable était noté comme un SaaS, alors que WSO2 et IBM en self-host obtiennent 4. Effet : +1 cran pondéré 13.
- **Gravitee C3 : 5 → 4.** Correction d'une sur-notation : Gravitee était le seul 5 du critère alors que Kong, IBM et WSO2, aussi solides en hybride, plafonnent à 4 ; le 5 doit rester réservé à une excellence distinctive. Effet : −1 cran pondéré 12.

Les deux corrections tombent sur le profil de **plus forte amplitude (min = 2, max = 5)** — signe typique d'un évaluateur ayant utilisé une échelle plus étalée/contrastée que les autres. L'**effet net sur le score pondéré de Gravitee est quasi neutre** (+13/5 en C2, −12/5 en C3), mais le calibrage devient cohérent.

**Points vérifiés et jugés cohérents (non touchés) :**

- **C8 Gravitee = 5** : leadership event-native reconnu ; le 5 est homogène avec son sens « au-dessus du lot ».
- **C11** : OSS (Gravitee/WSO2 = 4, Kong = 3) hauts vs propriétaires (IBM/Apigee = 2) bas → calibrage logique.
- **C2 Apigee = 2** : SaaS public, souveraineté faible → 2 justifié, sert d'ancre basse cohérente.
- **C4 (tous = 4), C5, C6, C7, C9, C10, C1** : écart ≤ 1, aucune dérive de calibrage.

**Recommandation du comité.** La source des deux incohérences est l'usage plus contrasté de l'échelle par l'évaluateur de CAND4. Après ces deux ajustements, les bornes « 2 », « 4 » et « 5 » portent le même sens sur l'ensemble des candidats. **Aucune autre intervention n'est requise.**

---

## 7. Risques et conditions

### 7.1 Risques transverses au panel

Plusieurs réserves récurrentes traversent les candidatures et doivent être traitées indépendamment du finaliste retenu :

| # | Risque transverse | Candidats concernés | Condition / atténuation |
|---|---|---|---|
| RT1 | **Région cloud souveraine canadienne** du plan de contrôle géré non confirmée | Kong (Konnect), Gravitee (Cloud), Apigee (résidence CP) | Privilégier un **control plane self-hosted au Canada** ; à vérifier auprès de chaque éditeur |
| RT2 | **BYOK / HYOK** = propriété d'architecture (KMS/HSM de BBQ), pas un module unique | Kong, Gravitee, WSO2, Apigee (partiel) | Cadrage KMS/HSM en **PoC-A** ; IBM dispose d'une offre packagée (Key Protect / HPCS) |
| RT3 | **Immuabilité des pistes d'audit** obtenue par export SIEM/WORM, non native | Tous | Architecture SIEM/WORM ; **PoC-F** |
| RT4 | **Connecteur RTR / ISO 20022** et **consentement Open Banking** non clés en main | Kong, Gravitee, WSO2, Apigee (IBM plus fort sur ISO 20022) | Médiation/service de consentement à construire ; **specs RTR canadiennes à vérifier** |
| RT5 | **Survivabilité déconnectée** : durée max et fail-open/fail-closed par politique à démontrer | Tous (écart **Apigee** : survivabilité seulement partielle) | **PoC-A** imposé ; pour Apigee, risque potentiellement éliminatoire |
| RT6 | **Maturité IA / MCP** récente : robustesse FSI, masquage PII bilingue, anti-fuite | Tous | **PoC-G** sur données canadiennes FR/EN ; **garde-fous résidant au Canada** (critique pour WSO2) |
| RT7 | **Certifications par périmètre** (PCI-DSS v4.0, SOC 2 Type II, Protected B) | Tous, à des degrés divers | Exiger attestations et périmètre précis ; à vérifier |

### 7.2 Conditions spécifiques aux finalistes

**Gravitee (finaliste de tête) — conditions de levée de réserve :**
1. Production, sous NDA, des attestations **SOC 2 Type II et PCI-DSS** (ou démonstration que l'environnement self-hosted de BBQ les porte) — **condition C2 critique**.
2. Confirmation de l'absence/présence d'une **région cloud canadienne** ; à défaut, engagement sur un control plane self-hosted au Canada.
3. Démonstration en **PoC-A** du BYOK/HYOK avec HSM de BBQ et de la survivabilité (durée d'autonomie, fail-open/closed).
4. Due diligence **B-10** renforcée (pérennité de l'éditeur intermédiaire, support localisé Canada).

**Kong (second finaliste) — conditions de levée de réserve :**
1. Confirmation de la **région Konnect canadienne** ou validation du control plane self-managed au Canada — **condition C2 critique**.
2. Périmètre et version exacts des **certifications** (PCI-DSS v4.0, SOC 2 Type II) applicables au déploiement self-managed.
3. Démonstration en **PoC-A / PoC-D / PoC-F** : survivabilité, OWASP API Top 10 (BOLA/BFLA), audit immuable.
4. Négociation d'une **licence Enterprise self-managed à capacité** pour neutraliser la composante par requête (prévisibilité EN-16).

### 7.3 Conditions de réintégration des réservistes

WSO2 et IBM sont **réintégrables en PoC** si l'un des finalistes échoue à lever ses réserves majeures. Conditions préalables : pour WSO2, clarification que **BBQ porte la charge de conformité** en auto-hébergé et garde-fous IA résidents ; pour IBM, **clarification contractuelle de la trajectoire de convergence API Connect / webMethods** et isolation du coût des modules.

---

## 8. Avis et limites

### 8.1 Portée et statut du rapport

Ce rapport conclut la **phase d'évaluation sur dossier** du RFP-BBQ-APIM-2026. Il établit un classement, le commente et formule une recommandation de **liste restreinte (deux finalistes : Gravitee, Kong)**, à départager par preuve de concept. Il **ne constitue pas une décision d'attribution** : conformément au RFP (§6.3), **les preuves produites en PoC priment sur les déclarations sur dossier**, et la consolidation finale intègrera les résultats de PoC, l'analyse de TCO sur devis et la due diligence fournisseur (B-10).

### 8.2 Limites méthodologiques

- **Notes et calculs établis par programme.** Le présent document les restitue fidèlement et les commente, sans recalcul. Les éventuelles différences d'arrondi de l'analyse de sensibilité reflètent les sorties programmatiques.
- **Évaluation sur capacités déclarées et publiques.** L'estimation des niveaux de couverture (C/CP/T/R/NC) repose sur les réponses simulées et les sources publiques de juin 2026, non sur des tests indépendants. De nombreux éléments restent marqués **« à vérifier »** et doivent être confirmés par preuves.
- **TCO non chiffré fermement.** Tous les modèles de prix cités sont indicatifs et non contractuels ; les ordres de grandeur (jusqu'à plusieurs millions CAD sur 3 ans selon les candidats) ne sont pas comparables tels quels sans devis ni cadrage de périmètre. Le RFP demande par ailleurs un **TCO 5 ans** (EN-16) que les réponses devront compléter au-delà du présent gabarit 3 ans.
- **Horizon de connaissance.** Les positionnements analystes (Gartner MQ octobre 2025), régions cloud, versions de certifications et feuilles de route IA/MCP sont sensibles au temps et **« à vérifier »** pour toute évolution postérieure à juin 2026.

### 8.3 Cadre d'intégrité (rappel)

> L'organisation cliente **BBQ est fictive**. Les **réponses fournisseurs sont simulées** à partir de capacités produit publiques et vérifiées (juin 2026). Les **prix sont indicatifs et non contractuels**. Tout élément incertain ou postérieur à l'horizon de connaissance est marqué **« à vérifier »**. Ce rapport est une **trame méthodologique** d'évaluation et ne crée aucune obligation juridique ni aucun engagement d'un éditeur.

---

*Fin du rapport d'évaluation consolidé — RFP-BBQ-APIM-2026. Phase : évaluation sur dossier. Classement et calculs vérifiés par programme et restitués verbatim ; analyse qualitative fondée sur les cinq réponses candidates simulées (Kong, IBM, Google Cloud Apigee, Gravitee, WSO2). Organisation cliente fictive ; réponses simulées à partir de capacités publiques vérifiées en juin 2026 ; prix indicatifs et non contractuels ; éléments incertains marqués « à vérifier ».*
