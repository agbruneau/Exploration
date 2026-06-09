# Annexe A1 — Grille d'évaluation pondérée

**Document de référence :** RFP-APIM-2026-001
**Objet :** Méthode de notation des soumissions sur 100 points

---

## 1. Méthode de notation

Chaque critère est évalué sur une **échelle de maturité de 0 à 5**, puis converti en points pondérés :

```
Points du critère = (note sur 5 ÷ 5) × pondération du critère
Note finale /100  = Σ (points de tous les critères)
```

**Échelle de maturité (0–5) :**

| Note | Signification |
|---|---|
| 5 | Référence du marché — capacité native, mature, éprouvée en contexte FSI |
| 4 | Forte — capacité native couvrant l'exigence avec réserves mineures |
| 3 | Adéquate — capacité présente mais partielle, ou exigeant configuration/modules |
| 2 | Faible — couverture limitée, contournements requis |
| 1 | Marginale — capacité embryonnaire ou via tiers |
| 0 | Absente |

Les demi-points (p. ex. 4,5) sont admis pour refléter des nuances documentées.

---

## 2. Critères, sous-critères et pondérations

### C1 — Capacités fonctionnelles cœur — 15 %
Cycle de vie complet (conception design-first, versionnage, révisions, dépréciation); passerelle d'exécution (médiation, transformation, routage par contenu); portail développeur (libre-service, console d'essai, abonnements); catalogue/inventaire; monétisation. *Couvre CU-01, CU-02, CU-03, CU-07, CU-09.*

### C2 — Architecture & déploiement hybride — 15 %
Séparation plan de contrôle/plan de données; passerelles auto-gérées sur Kubernetes/OpenShift; multi-nuage et sur site; résilience au découplage (mode dégradé/air-gap); maîtrise des mises à niveau; option d'appliance le cas échéant. *Couvre CU-05.*

### C3 — Sécurité — 15 %
mTLS bidirectionnel; OAuth 2.x/OIDC/JWT et intégration IdP; protection contre les menaces (OWASP API Top 10); détection d'abus/bots; gestion des secrets (coffre/HSM, CyberArk); RBAC fin; journaux d'audit. *Couvre CU-04.*

### C4 — Conformité & souveraineté — 12 %
Certifications (SOC 2 Type II, ISO/IEC 27001, PCI-DSS, FedRAMP); résidence canadienne des données; FIPS 140 (modules cryptographiques); cadres FSI (PIPEDA, *Protected B*, IBM Cloud for Financial Services, DORA); emplacement du plan de contrôle. *Couvre CU-05.*

### C5 — Performance & scalabilité — 8 %
Débit (cible ≥ 60 000 req/s) et latence P99; limitation de débit/quotas; mise en cache (incl. cache externe Redis); multi-région active-active; mise à l'échelle horizontale. *Couvre CU-03.*

### C6 — Observabilité & exploitation — 6 %
Métriques/journaux/traces; OpenTelemetry natif; intégrations Datadog et Splunk; rétention analytique; GitOps/APIOps et IaC; diagnostic. *Couvre CU-10.*

### C7 — Capacités événementielles & GraphQL — 6 %
Médiation Kafka/asynchrone; découverte AsyncAPI; contrôle d'accès aux sujets; GraphQL (passthrough/synthétique, fédération); WebSocket; gRPC. *Couvre CU-06.*

### C8 — Passerelle IA/LLM & agentique — 7 %
Quotas de jetons; cache sémantique; garde-fous de prompt et sécurité du contenu; routage multi-modèles; support MCP (exposition d'API aux agents); gouvernance agent-à-agent (A2A). *Couvre CU-08.*

### C9 — Expérience développeur & gouvernance fédérée — 6 %
Design-first et outillage; APIOps/GitOps (decK, Terraform, CLI); espaces de travail/fédération; application de normes (linting); autonomie des équipes sous garde-fous. *Couvre CU-07.*

### C10 — Coût total de possession & modèle commercial — 6 %
Transparence et prévisibilité tarifaire; structure de licence; coûts cachés (egress, modules, matériel); TCO sur 3–5 ans; risque de verrouillage; flexibilité contractuelle.

### C11 — Écosystème, support & pérennité — 4 %
Position des analystes (Gartner/Forrester); feuille de route et rythme d'innovation; qualité du support et services professionnels; santé de la communauté/écosystème; viabilité à long terme.

---

## 3. Tableau récapitulatif des pondérations

| Critère | Pondération | Cas d'usage couverts |
|---|---:|---|
| C1 — Capacités fonctionnelles cœur | 15 % | CU-01/02/03/07/09 |
| C2 — Architecture & déploiement hybride | 15 % | CU-05 |
| C3 — Sécurité | 15 % | CU-04 |
| C4 — Conformité & souveraineté | 12 % | CU-05 |
| C5 — Performance & scalabilité | 8 % | CU-03 |
| C6 — Observabilité & exploitation | 6 % | CU-10 |
| C7 — Capacités événementielles & GraphQL | 6 % | CU-06 |
| C8 — Passerelle IA/LLM & agentique | 7 % | CU-08 |
| C9 — Expérience développeur & gouvernance fédérée | 6 % | CU-07 |
| C10 — Coût total de possession & modèle commercial | 6 % | — |
| C11 — Écosystème, support & pérennité | 4 % | — |
| **Total** | **100 %** | |

---

## 4. Règles de décision

- **Seuil d'admissibilité** : toute note de 0 ou 1 sur un critère P1 (C1, C2, C3, C4) déclenche une revue d'élimination.
- **Écart non significatif** : un écart final ≤ 2,0 points entre candidats est considéré comme un quasi-égalité; le départage se fait par PoC et négociation commerciale.
- **Pondération de sensibilité** : l'évaluation finale inclut une analyse de sensibilité (variation des poids C2/C4) pour tester la robustesse du classement.
