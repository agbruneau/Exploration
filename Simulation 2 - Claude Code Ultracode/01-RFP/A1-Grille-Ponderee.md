# Annexe A1 — Grille d'évaluation pondérée

**Dossier :** RFP-BBQ-APIM-2026 — Plateforme unifiée de gestion des API d'entreprise
**Commanditaire (fictif) :** Banque Boréale du Québec (BBQ) — institution financière, déploiement hybride strict, souveraineté des données au Canada
**Objet de l'annexe :** barème détaillé sur 100 points, éléments notés par critère, échelle de maturité, règle d'agrégation et seuils éliminatoires.

> **Précédence.** Pour la notation, la présente annexe **fait foi** (voir document principal, §7). Elle développe la synthèse pondérée du **§5 du RFP principal**. Les onze critères (C1 à C11) et leurs poids sont repris à l'identique.

---

## 1. Échelle de maturité (0 à 5)

Chaque critère est noté sur une **échelle de maturité de 0 à 5**, appréciant le niveau de capacité **démontrée** (sur dossier, puis confirmée en PoC pour les finalistes) au regard des exigences de la matrice A2.

| Note | Niveau | Signification |
|---:|---|---|
| **0** | Absent | Capacité non offerte ; exigence non couverte. |
| **1** | Très faible | Capacité marginale, par contournement lourd ou non soutenu. |
| **2** | Partiel | Capacité présente mais incomplète, par configuration importante ou module tiers non intégré. |
| **3** | Conforme | Capacité native couvrant l'exigence de manière standard et soutenue. |
| **4** | Fort | Capacité native robuste, au-dessus de l'attendu, éprouvée en contexte d'entreprise. |
| **5** | Best-in-class | Capacité distinctive de référence sur le marché, différenciante pour le profil FSI hybride. |

> Une note de **5** est **réservée** à une excellence distinctive ; en cas de capacités équivalentes entre plusieurs soumissionnaires, le plafond appliqué est **4** afin de préserver le pouvoir discriminant de l'échelle (règle de calibrage inter-candidats).

---

## 2. Règle d'agrégation

La note finale sur 100 est la **somme pondérée** des notes de maturité, chaque critère étant ramené à sa pondération :

```
Note finale (/100) = Σ ( note_critère / 5 × poids_critère )
```

avec Σ poids = 100. La contribution maximale d'un critère (note = 5) est donc égale à son **poids en points**. Les calculs sont effectués **par programme** (aucun arrondi intermédiaire ; arrondi final au dixième).

---

## 3. Grille pondérée — synthèse

| Code | Critère | Thème | Poids = points max |
|---|---|---|---:|
| **C1** | Sécurité des API et protection contre les menaces | Sécurité | **12** |
| **C2** | Conformité réglementaire et souveraineté des données | Conformité | **13** |
| **C3** | Architecture hybride, portabilité et résilience | Architecture | **12** |
| **C4** | Capacités fonctionnelles cœur de gestion des API | Fonctionnel | **11** |
| **C5** | Gouvernance du cycle de vie et catalogue d'entreprise | Fonctionnel | **9** |
| **C6** | Performance, scalabilité et faible latence | Performance | **7** |
| **C7** | Observabilité, monitoring et auditabilité opérationnelle | Observabilité | **7** |
| **C8** | Support de l'API événementielle et du streaming | Événementiel | **6** |
| **C9** | Capacités IA, agentique et passerelle LLM | IA | **7** |
| **C10** | Expérience développeur et portail self-service | Expérience dév. | **8** |
| **C11** | Coût total de possession, modèle de licence et écosystème | Coût | **8** |
| | **Total** | | **100** |

**Blocs de pondération.** Souveraineté/sécurité/architecture hybride (**C1+C2+C3 = 37**) ; cœur fonctionnel et gouvernance (**C4+C5 = 20**) ; qualités opérationnelles (**C6+C7 = 14**) ; différenciants émergents (**C8+C9 = 13**) ; expérience et coût (**C10+C11 = 16**).

---

## 4. Éléments notés par critère

Pour chaque critère, les **éléments évalués** (issus du §5.1 du RFP et de la matrice A2) et l'**ancrage** des notes 3 et 5.

| Critère | Éléments notés | Note 3 (conforme) | Note 5 (best-in-class) |
|---|---|---|---|
| **C1 Sécurité** | OAuth2/OIDC/mTLS/FAPI/JWT, OWASP API Top 10, limitation adaptative, secrets, chiffrement transit/repos, **BYOK/HYOK**, Zero Trust | AuthN/Z standards + protection menaces native | FAPI avancé, WAAP/anomalies natifs, HYOK strict, PEP intégré IAM/SIEM |
| **C2 Conformité & souveraineté** | Résidence Canada, BSIF B-13/B-10, Loi 25, LPRPDE, PCI-DSS v4.0, SOC 2 II, audit immuable, anti-extraterritorialité | Résidence Canada possible + attestations clés | Souveraineté de bout en bout (self-host intégral), audit immuable natif, indépendance juridictionnelle démontrée |
| **C3 Architecture hybride** | Séparation control/data plane, gateways multi-environnements, **survivabilité déconnectée**, portabilité multi-cloud, HA, RTO/RPO | Hybride réel piloté par un plan unique | Survivabilité éprouvée + portabilité totale on-prem/air-gap |
| **C4 Cœur fonctionnel** | Médiation REST/SOAP/GraphQL/gRPC, routage, cache, composition, legacy/mainframe, versions, cycle de vie | Couverture complète des protocoles attendus | Médiation legacy avancée + orchestration riche |
| **C5 Gouvernance & catalogue** | Catalogue d'entreprise, linting OpenAPI, CI/CD GitOps, politiques as-code, dépréciations, dette d'API | Catalogue + intégration CI/CD standard | Gouvernance automatisée by-design, portes qualité/sécurité natives |
| **C6 Performance** | Débit, latence ajoutée, charge de pointe (paiements), scalabilité horizontale, empreinte | Performances conformes aux SLA visés | Latence faible démontrée à l'échelle pancanadienne |
| **C7 Observabilité** | Métriques/logs/traces (OpenTelemetry), corrélation cross-env, SIEM/APM, dashboards, alerting, audit | Télémétrie complète + intégration SIEM | Corrélation cross-environnements native + audit réglementaire prêt |
| **C8 Événementiel** | Kafka, AsyncAPI, MQTT, webhooks, catalogage/sécurisation des flux, politiques par topic | Gouvernance asynchrone présente | Plateforme event-native de référence (gateway événementielle) |
| **C9 IA / agentique** | Passerelle LLM (jetons/coûts, garde-fous, masquage PII), serveurs MCP, API d'agents, audit prompts | AI gateway fonctionnel + garde-fous | MCP/agentique + masquage PII natif résident, FinOps IA |
| **C10 Expérience développeur** | Portail interne/partenaires, doc interactive, bac à sable, onboarding gouverné, SDK, abonnements | Portail self-service complet | Expérience développeur de référence, onboarding gouverné fluide |
| **C11 TCO & écosystème** | TCO 5 ans, prévisibilité du prix à l'échelle, verrouillage, écosystème, pérennité | Modèle de coût prévisible + écosystème viable | TCO maîtrisé + faible verrouillage (portabilité/OSS) + écosystème mûr |

---

## 5. Seuils éliminatoires (exigences obligatoires)

Conformément au **§6.1 (étape 3)** du RFP, certaines exigences **Obligatoires** de la matrice A2 constituent des **seuils** : une note de maturité **inférieure à 2** sur l'un des critères porteurs ci-dessous entraîne un **examen d'élimination** (le soumissionnaire doit alors produire une feuille de route datée recevable, sous peine d'exclusion de la liste restreinte).

| Seuil | Critère porteur | Exigence minimale |
|---|---|---|
| **S1 — Souveraineté** | C2 | Résidence des données réglementées **au Canada** sur le plan de données, avec contrôle des clés (BYOK a minima). |
| **S2 — Survivabilité** | C3 | Continuité d'application des politiques par les gateways en **mode déconnecté** du plan de contrôle. |
| **S3 — Auditabilité** | C2 / C7 | Production d'une **piste d'audit immuable** exploitable pour un examen réglementaire (BSIF). |

> Les seuils sont **vérifiés en PoC** (scénarios PoC-A et PoC-F du §6.3) pour les finalistes : **les preuves produites en PoC priment sur les déclarations sur dossier**.

---

## 6. Articulation dossier / PoC

- **Évaluation sur dossier** : notation initiale C1–C11 selon la présente grille, à partir des réponses simulées (matrice A2 renseignée). C'est cette notation qui produit le classement consolidé du dépôt.
- **PoC des finalistes** : chaque scénario imposé (PoC-A à PoC-G, §6.3 du RFP) re-note les critères correspondants ; les notes PoC **remplacent** les notes sur dossier des critères concernés lors de l'évaluation finale.

---

## 7. Renvois

- Synthèse et description des critères : **`00-RFP-Gestion-API-Entreprise.md` §5**.
- Exigences détaillées notées : **`A2-Matrice-Exigences.md`**.
- Méthode, justification de la pondération, calibrage et limites : **`../docs/methodologie-notation.md`**.
- Résultats chiffrés : **`../04-Evaluation/Matrice-Scores.csv`** et **`../04-Evaluation/Rapport-Evaluation-Consolide.md`**.

---

*Annexe A1 — exercice méthodologique. Organisation cliente fictive ; notation établie à partir de capacités produit publiques vérifiées (juin 2026) ; éléments incertains marqués « à vérifier ».*
