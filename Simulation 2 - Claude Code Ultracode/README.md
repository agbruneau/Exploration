# Dossier d'appel d'offres — Plateforme unifiée de gestion des API d'entreprise (API Management)

**Commanditaire (fictif) : Banque Boréale du Québec (BBQ)** — institution financière fédérale sous charte, modèle de bancassurance (banque de détail, gestion de patrimoine, filiale d'assurance de dommages).
**Profil :** grande institution financière (FSI), déploiement **hybride strict**, **souveraineté des données au Canada**.
**Date du dossier :** juin 2026 *(jour exact non précisé — à vérifier)*.

---

## 1. Nature du dépôt

Ce dépôt consolide un **exercice complet d'appel d'offres (RFP)** portant sur la sélection d'une **plateforme unique d'entreprise de gestion des API**, depuis l'expression de besoin jusqu'au classement final des soumissionnaires.

Il s'agit d'un **exercice d'évaluation pédagogique et méthodologique**. À ce titre :

- l'**organisation cliente est entièrement fictive** ;
- les **réponses fournisseurs sont simulées** à partir de capacités produit publiques et vérifiées (juin 2026) ;
- les **prix éventuels sont indicatifs et non contractuels**.

> Le cadre d'intégrité complet est détaillé en **[section 9 — Avis et limites](#9-avis-et-limites)**. Il s'applique à l'ensemble des documents du dépôt.

L'objectif fonctionnel du RFP est de **consolider la gouvernance des API** internes, partenaires (B2B) et publiques (développeurs tiers / agrégateurs) sur une plateforme unique, tout en maîtrisant le **risque**, la **conformité** et la **souveraineté des données**, dans un contexte de modernisation (système bancaire ouvert canadien, paiements modernisés Paiements Canada/RTR, partenariats fintech).

---

## 2. Synthèse exécutive

Cinq plateformes ont été mises en concurrence et évaluées selon une grille pondérée multicritère (voir [section 6](#6-méthode-et-pondération)). Le classement final est le suivant :

| Rang | Solution | Note /100 |
|---:|---|---:|
| 1 | **Gravitee** | **75.4** |
| 2 | **Kong** | **73.0** |
| 3 | **WSO2** | **72.2** |
| 4 | **IBM** | **71.0** |
| 5 | **Google Cloud Apigee** | **61.6** |

**Recommandation :** finaliste de tête = **Gravitee (75.4/100)** ; second finaliste = **Kong (73.0/100)**. Compte tenu de l'écart resserré entre les deux têtes de classement, le **départage doit se faire par une preuve de concept (PoC)** portant sur les cas d'usage critiques (notamment Open Banking, paiements temps réel RTR/ISO 20022, survivabilité des gateways en mode déconnecté, et médiation IA/MCP). Les notes étant resserrées (les quatre premiers tiennent en **4,4 points**), **WSO2 et IBM restent en réserve** comme finalistes alternatifs.

> Les notes sont issues de la simulation et reposent sur des capacités produit publiques de juin 2026. Elles ne constituent pas un avis d'achat engageant — **à valider par PoC et diligence raisonnable** (voir [section 9](#9-avis-et-limites)).

---

## 3. Structure du dépôt

```
.
├── README.md                        Vous êtes ici (synthèse, méthode, avis)
│
├── 01-RFP/                          Dossier d'appel d'offres (pièces contractuelles)
│   ├── 00-RFP-Gestion-API-Entreprise.md   RFP principal (besoin, contexte, cas d'usage)
│   ├── A1-Grille-Ponderee.md              Grille d'évaluation pondérée (/100, seuils)
│   ├── A2-Matrice-Exigences.md            Matrice des exigences (EF/EA/ES/EC/EN)
│   └── A3-Modalites-Reponse.md            Modalités de réponse et recevabilité
│
├── 02-Analyse-Marche/               Étude de marché
│   └── Analyse-Marche-API-Management-2026.md   Analyse de marché (juin 2026)
│
├── 03-Reponses-Candidats/          Réponses simulées des soumissionnaires
│   ├── 01-Kong.md
│   ├── 02-IBM.md
│   ├── 03-Google-Cloud-Apigee.md
│   ├── 04-Gravitee.md
│   └── 05-WSO2.md
│
├── 04-Evaluation/                  Évaluation consolidée
│   ├── Rapport-Evaluation-Consolide.md    Rapport d'évaluation et classement
│   ├── Matrice-Scores.csv                 Détail des scores par critère (/5) et totaux
│   └── Journal-Verification.md            Vérification adversariale des réponses
│
└── docs/
    └── methodologie-notation.md     Méthode de notation et pondération
```

**Familles d'exigences** (référencées dans toute la matrice A2) :

| Code | Famille | Portée |
|---|---|---|
| **EF** | Fonctionnelles | Passerelle, portail, cycle de vie, médiation, IA/MCP, événementiel |
| **EA** | Architecture / hybride / déploiement | Topologie, control plane / data plane, survivabilité, multi-cloud, portabilité |
| **ES** | Sécurité | AuthN/AuthZ, mTLS, protection des menaces API, secrets, Zero Trust, chiffrement |
| **EC** | Conformité / souveraineté | Résidence des données, BYOK/HYOK, auditabilité, BSIF / Loi 25 / PCI-DSS / SOC 2, AMF |
| **EN** | Non fonctionnelles | Performance, disponibilité, RTO/RPO, observabilité, exploitabilité, support, TCO |

---

## 4. Parcours de lecture suggérés

Selon votre rôle, voici l'ordre de lecture recommandé.

### Décideurs (direction, comité d'investissement, commanditaire métier)
1. La présente **synthèse exécutive** ([section 2](#2-synthèse-exécutive)) — classement et recommandation.
2. `04-Evaluation/Rapport-Evaluation-Consolide.md` — justification du classement, forces/faiblesses par finaliste, risques.
3. `02-Analyse-Marche/Analyse-Marche-API-Management-2026.md` — tendances de marché et positionnement.
4. La [section 9 — Avis et limites](#9-avis-et-limites) — portée et précautions d'usage.

### Architectes / ingénierie (architecture, sécurité, exploitation)
1. `01-RFP/00-RFP-Gestion-API-Entreprise.md` — besoin, contexte technique, cas d'usage (UC1–UC10).
2. `01-RFP/A2-Matrice-Exigences.md` — exigences détaillées EF/EA/ES/EC/EN et niveaux de priorité.
3. `03-Reponses-Candidats/` — réponses simulées des cinq plateformes (à confronter à l'A2).
4. `04-Evaluation/Matrice-Scores.csv` — détail des scores par critère.

### Achats / conformité / risque (approvisionnement, conformité, gestion du risque tiers)
1. `01-RFP/A3-Modalites-Reponse.md` — modalités de réponse, grille de recevabilité, procédure de rejet.
2. `01-RFP/A2-Matrice-Exigences.md` — section conformité/souveraineté (**EC**) et cadre d'intégrité.
3. `01-RFP/A1-Grille-Ponderee.md` et `docs/methodologie-notation.md` — pondération, seuils éliminatoires, barème.
4. La [section 9 — Avis et limites](#9-avis-et-limites) — caractère fictif, simulé et indicatif des éléments.

---

## 5. Contexte du commanditaire et exigences directrices

**Profil (fictif) :** ~14 500 employés, ~3,2 M de clients particuliers et entreprises, actif sous gestion d'environ 220 G$ CA, siège social à Montréal, présence pancanadienne.

**Déploiement attendu — hybride strict :** plan de contrôle, portail développeur et analytique pouvant résider en **cloud souverain canadien** (Canada Central/Est) **ou** on-prem ; **plans de données (gateways)** déployés là où circulent les données réglementées (data centers privés Québec/Ontario pour PII, paiements, assurance ; cloud canadien pour les charges publiques/partenaires ; périphérie en succursales/DMZ). Exigences clés : **survivabilité des gateways** (mode dégradé/déconnecté du control plane), **chiffrement à clés gérées par le client (BYOK/HYOK)** et **portabilité multi-cloud**.

**Exigences directrices :**
- Souveraineté et résidence des données au Canada, contrôle des clés cryptographiques (BYOK/HYOK), garanties contractuelles contre l'accès extraterritorial (risque *Cloud Act*).
- Sécurité de bout en bout : OAuth2/OIDC/mTLS/FAPI, protection contre les menaces API (OWASP API Top 10), gestion des secrets, Zero Trust.
- Conformité démontrable et auditabilité : pistes d'audit immuables, rapports prêts pour le BSIF, attestations SOC 2 / PCI-DSS.
- Architecture hybride et survivabilité : un seul plan de gouvernance pour des gateways multi-environnements ; résilience et continuité (RTO/RPO) conformes aux attentes BSIF B-13/B-10.
- Maîtrise du TCO et du verrouillage fournisseur ; modèle de licence prévisible à l'échelle pancanadienne.
- Accélération de la mise en marché (Open Banking, paiements temps réel, partenariats fintech) via un portail développeur self-service gouverné.

**Cadre réglementaire de référence :** BSIF/OSFI **B-13** (risque technologique et cyber), **B-10** (risque tiers) et **B-2/E-21** (résilience opérationnelle) ; **Loi 25** (Québec) ; **LPRPDE / PIPEDA** ; **PCI-DSS v4.0** ; **SOC 2 Type II** ; résidence/souveraineté des données au Canada ; cadre canadien du **système bancaire ouvert** et normes **Paiements Canada (RTR / ISO 20022)** *(calendrier et contenu définitifs — à vérifier)* ; régulation en assurance (**AMF** — Autorité des marchés financiers du Québec) pour la filiale d'assurance.

---

## 6. Méthode et pondération

L'évaluation suit une démarche **objectivée et traçable** :

1. **Expression du besoin** dans le RFP principal et déclinaison en exigences atomiques (matrice A2), réparties en cinq familles (**EF / EA / ES / EC / EN**) et trois niveaux de priorité — **Obligatoire** (impérative, potentiellement éliminatoire si non satisfaite), **Importante** (forte valeur, feuille de route datée recevable), **Souhaitée** (différenciation).
2. **Recevabilité** : tout dossier franchit d'abord une **grille de recevabilité** (annexe A3) ; les soumissionnaires irrecevables sont écartés avec motif avant l'évaluation au fond.
3. **Notation pondérée multicritère** : chaque critère est noté sur une **échelle de maturité 0–5** ; la note finale sur 100 est `Σ (note/5 × poids)`, les poids totalisant 100. Les calculs sont effectués **par programme** (arithmétique vérifiée, arrondi final au dixième).
4. **Calibrage inter-candidats** par un « président de comité » (cohérence du sens des notes d'un candidat à l'autre), puis **analyse de sensibilité** (re-pondération) pour tester la robustesse du classement.

La pondération privilégie, conformément aux exigences directrices, la **conformité/souveraineté**, la **sécurité** et l'**architecture hybride/survivabilité**, devant les capacités fonctionnelles et le TCO :

| Code | Critère | Poids | Code | Critère | Poids |
|---|---|---:|---|---|---:|
| C1 | Sécurité | 12 | C7 | Observabilité & audit | 7 |
| C2 | Conformité & souveraineté | **13** | C8 | Événementiel & streaming | 6 |
| C3 | Architecture hybride & résilience | 12 | C9 | IA / agentique / passerelle LLM | 7 |
| C4 | Cœur fonctionnel | 11 | C10 | Expérience développeur | 8 |
| C5 | Gouvernance & catalogue | 9 | C11 | TCO, licence & écosystème | 8 |
| C6 | Performance | 7 | | **Total** | **100** |

> Souveraineté + sécurité + architecture hybride (**C1+C2+C3 = 37 %**) dominent, conformément au profil FSI. Le barème détaillé, les ancrages de notation et les **seuils éliminatoires** (souveraineté, survivabilité, auditabilité) figurent dans `01-RFP/A1-Grille-Ponderee.md` ; la méthode complète et ses limites dans `docs/methodologie-notation.md`.

Le classement final (voir [section 2](#2-synthèse-exécutive)) en est l'aboutissement, complété par une recommandation de **départage par PoC** sur les cas d'usage critiques.

---

## 7. Contexte de marché

Synthèse des tendances retenues par l'analyse de marché (juin 2026), qui ont orienté la pondération :

- **Passerelle IA/LLM et gouvernance du trafic agentique (MCP).** L'AI/MCP gateway devient le point de contrôle obligatoire pour router, sécuriser, tracer et facturer le trafic LLM et les workflows d'agents (10–50 appels par interaction) : *semantic caching*, *token rate-limiting*, garde-fous (*guardrails*) et attribution du coût par requête.
- **Convergence événementielle (event-native).** Absorption de l'asynchrone (Kafka, MQTT, WebSockets, AsyncAPI) dans l'API Management ; critère discriminant pour les paiements temps réel et les flux de marché (différenciant pour Gravitee).
- **Hybridation et souveraineté.** Bascule vers le modèle **plan de contrôle SaaS / plan de données auto-hébergé**, garantissant résidence des données et contrôle de la chaîne ; déploiement on-prem / air-gapped et indépendance juridictionnelle comme critères FSI centraux.
- **Sécurité API et Zero Trust.** OAuth2/OIDC/mTLS généralisés, détection d'anomalies, OWASP API Top 10, intégration WAF/WAAP et plateformes d'*API security* (*shadow*/*zombie APIs*) ; la passerelle comme point d'application de politique (PEP) intégré à l'IAM et au SIEM/SOC.
- **Conformité et résilience opérationnelle (DORA).** Le *Digital Operational Resilience Act* (applicable depuis le 17 janvier 2025) impose journalisation immuable, traçabilité de bout en bout, gestion du risque tiers ICT et reporting d'incident ; sanctions jusqu'à 2 % du CA mondial — en sus de PCI-DSS, PSD2, RGPD. *(Portée géographique : cadre européen ; pertinence pour BBQ à titre comparatif et pour les partenariats internationaux — à vérifier.)*
- **FinOps des API.** Maîtrise des coûts (l'IA en tête) via caching sémantique, budgets hiérarchiques, limitation par consommateur et attribution du coût par requête exposée à la finance et à l'ingénierie ; refacturation interne et observabilité du coût par produit API.

Le détail figure dans `02-Analyse-Marche/Analyse-Marche-API-Management-2026.md`.

---

## 8. Soumissionnaires évalués

| # | Solution | Réponse simulée |
|---|---|---|
| 1 | Kong | `03-Reponses-Candidats/01-Kong.md` |
| 2 | IBM | `03-Reponses-Candidats/02-IBM.md` |
| 3 | Google Cloud Apigee | `03-Reponses-Candidats/03-Google-Cloud-Apigee.md` |
| 4 | Gravitee | `03-Reponses-Candidats/04-Gravitee.md` |
| 5 | WSO2 | `03-Reponses-Candidats/05-WSO2.md` |

> **Numérotation des fichiers.** La numérotation 01–05 des fichiers de réponses reflète l'ordre de présélection (issu du *Magic Quadrant* Gartner), et **non** le rang final d'évaluation : pour le classement, voir la [synthèse de classement (section 2)](#2-synthèse-exécutive).

> **Présélection.** Shortlist établie à partir des Leaders du *Magic Quadrant* Gartner for API Management 2025 (oct. 2025), filtrés par adéquation au profil FSI hybride/souverain. Solutions écartées avec justification (MuleSoft, Boomi, Azure APIM, AWS, Postman, etc.) : voir l'analyse de marché.

---

## 9. Avis et limites

Ce dépôt est un **exercice d'évaluation**. Il doit être lu avec les précautions suivantes, qui en constituent le **cadre d'intégrité** et s'appliquent à **tous** les documents qu'il contient :

- **Organisation cliente fictive.** La « Banque Boréale du Québec (BBQ) » est un **profil de travail fictif** construit pour cadrer l'appel d'offres. Aucune donnée réelle d'un établissement nommé n'est utilisée ; toute ressemblance avec une institution existante est **fortuite**.
- **Réponses fournisseurs simulées.** Les caractérisations des produits (Kong, IBM, Google Cloud Apigee, Gravitee, WSO2) sont **simulées à partir de capacités produit publiques** (documentation éditeur, communiqués, analyses sectorielles) **vérifiées à la date de juin 2026**. Elles ne constituent **pas** des réponses formelles des éditeurs et **n'engagent pas** ces derniers.
- **Prix indicatifs et non contractuels.** Tout ordre de grandeur tarifaire est purement **indicatif**, soumis à négociation, et **non contractuel**.
- **Notes et classement à valider.** Le classement et la recommandation découlent de la simulation et de la pondération retenue ; ils sont **indicatifs** et doivent être confirmés par une **preuve de concept (PoC)** et une **diligence raisonnable** avant toute décision réelle. Une vérification adversariale interne des réponses est consignée dans `04-Evaluation/Journal-Verification.md`.
- **Mention « à vérifier ».** Les éléments sensibles au temps, incertains ou postérieurs à la connaissance consolidée de l'auteur sont marqués **(à vérifier)** — notamment : le **calendrier et le contenu définitifs** du cadre canadien du système bancaire ouvert et de la norme **RTR / ISO 20022** de Paiements Canada ; la **portée géographique de DORA** pour une institution canadienne ; et la **date exacte** du dossier (juin 2026).

---

*Document rédigé dans le cadre d'un exercice méthodologique d'appel d'offres — juin 2026 (à vérifier).*
