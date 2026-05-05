---
title: "Architecture Review Checklist — Systèmes Agentiques"
annexe: "A"
status: "rédigé"
length_target_words: 1500
reading_time_min: 6
last_updated: "2026-05-05"
---

> **Annexe A · Architecture Review Checklist · ~1 500 mots · lecture ≈ 6 min**

Artefact opérationnel destiné à l'architecte d'entreprise ou de solution qui doit valider — ou bloquer — le déploiement d'un système *agentic*. Position dans le cycle d'adoption : après le cadrage (Ch. 3/4) et la conception de la pile (Ch. 5/6), avant le déploiement opérationnel (Ch. 7). Structure le dialogue entre l'équipe produit, l'architecte, la sécurité et le bureau de risque.

Chaque item est booléen ou à seuil quantitatif. Un item non satisfait exige une décision de risque documentée avec délai d'assainissement. Les items **[bloquant]** sont des conditions minimales sans dérogation : leur absence est une non-conformité architecturale.

---

## Section 1 — Sécurité

*Source : [Ch. 9 §9.1–9.4](ch09-agentic-security.md) — Taxonomie OWASP ASI01–ASI10, défense en profondeur.*

### 1.1 Modèle de menace

- [ ] **[bloquant]** Un modèle de menace formel couvrant les 10 classes ASI (OWASP GenAI Security Project, déc. 2025) a été produit et révisé par l'équipe sécurité.
- [ ] Les trois familles de vecteurs sont adressées distinctement : injection/détournement d'objectifs (ASI01, ASI02, ASI06), délégation/chaînes de confiance (ASI03, ASI07, ASI08, ASI09), supply chain et exécution (ASI04, ASI05, ASI10).
- [ ] Les contenus ingérés (documents, courriels, résultats d'outils, pages web) sont traités comme non fiables — *LLM Scope Violation* (CVE-2025-32711, CVSS 9.3) documentée comme risque résiduel si aucune séparation d'espace de confiance n'est en place.

### 1.2 Identité d'agent

- [ ] **[bloquant]** Chaque agent possède une identité distincte — pas de clé API partagée entre agents. Exigence OSFI E-23 (inventaire des modèles, en vigueur mai 2027).
- [ ] Identité vérifiable : *Federated Identity Credentials* (Entra Agent ID), rôles IAM fins (AgentCore Identity), ou SPIFFE/SVID pour les flux M2M.
- [ ] Cycle de vie de l'identité (création, rotation, révocation) documenté et automatisé.

### 1.3 Scoped tokens et moindre privilège

- [ ] **[bloquant]** Tokens d'accès émis par tâche (*per-task token*) — pas de token de session longue partagé.
- [ ] *Tool-level scopes* OAuth 2.1 révocables indépendamment par outil (ex. : lecture contacts ≠ création contacts) ; *scope narrowing* RFC 8693 à chaque hop de délégation.
- [ ] Aucun agent worker ne dispose de permissions supérieures à sa sous-tâche.

### 1.4 Guardrails

- [ ] Guardrails I/O déployés en entrée et sortie (Llama Guard 4, NeMo Guardrails, Anthropic Constitutional Classifiers, Azure AI Content Safety + Prompt Shield, ou AWS Bedrock Guardrails).
- [ ] Limitation documentée au dossier risque : taux de contournement > 85 % en attaque adaptative isolée ([Ch. 9 §9.3](ch09-agentic-security.md)) — les guardrails seuls ne constituent pas une défense suffisante.
- [ ] **N3-N4** : stratégie de composition (guardrails + sandboxing + kill switches) spécifiée — les trois couches sont obligatoires.

### 1.5 Sandboxing

- [ ] Niveau d'isolation minimal selon le niveau d'autonomie :
  - N1-N2 : conteneur Docker acceptable.
  - N3 : gVisor ou équivalent.
  - **N4 [bloquant]** : Firecracker microVM (démarrage ≤ 150 ms) ou Kata Containers.
- [ ] Rotation systématique du sandbox après chaque tâche — pas de session longue durée accumulant l'état.

### 1.6 Kill switches

- [ ] **[bloquant]** Quatre modes de désactivation testés : par agent individuel, par outil, par périmètre de données, *dry-run mode* (lecture seule pour investigation forensique).
- [ ] Autorité d'activation et délais cibles documentés dans le RACI agentique ([Annexe D](annexe-D-governance-raci.md)).

### 1.7 Surface protocolaire

- [ ] MCP : serveurs tiers sur liste blanche vérifiée ; descriptions d'outils auditées contre le *tool poisoning* ; primitive *sampling* désactivée ou isolée ([Ch. 5 §5.8](ch05-protocols-interoperability.md)).
- [ ] A2A : mTLS ou OAuth 2.0 actif sur tous les canaux inter-agents ; Agent Cards signées ([Ch. 5 §5.4](ch05-protocols-interoperability.md)).
- [ ] Inventaire exhaustif des serveurs MCP et agents A2A déployés — aucun agent hors inventaire ne peut opérer (ASI10).

---

## Section 2 — Observabilité

*Source : [Ch. 7 §7.2–7.5](ch07-agentops.md) — Arbre de spans OTel, métriques canoniques, évaluation en production.*

### 2.1 OTel GenAI spans

- [ ] **[bloquant]** Quatre catégories de spans instrumentées : LLM spans, tool spans, memory spans, orchestration spans. Observabilité limitée aux outputs seuls : insuffisante — cause directe de l'incident Replit (juillet 2025 : 1 206 enregistrements supprimés malgré gel explicite).
- [ ] Attributs OTel SemConv 1.40.0 (`gen_ai.agent.id`, `gen_ai.agent.name`, `gen_ai.agent.version`) avec opt-in `OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental` ; spec en statut *Development* — abstraire derrière une bibliothèque interne.
- [ ] Plateforme d'observabilité supportant les traces multi-étapes avec arbre de spans hétérogènes.

### 2.2 Traces multi-étapes

- [ ] Chaque session tracée de bout en bout avec identifiant unique permettant la reconstruction complète de la trajectoire de décision.
- [ ] Tool spans : nom de l'outil, paramètres sérialisés, résultat/erreur, code de statut, retry count, timestamps — socle de *tool correctness*.
- [ ] Orchestration spans : décisions de délégation (sous-agent activé, sous-objectif, résultat retourné).

### 2.3 Memory diffs et eval gates

- [ ] Memory spans couvrant récupérations et écritures (épisodique, sémantique, procédurale) avec scores de pertinence ; *memory diff* calculé et archivé par session ([Ch. 6 §6.5](ch06-orchestration-memory-tools.md)).
- [ ] CI/CD gate bloquant les déploiements si les cinq métriques canoniques passent sous seuil : *task success*, *tool correctness*, *retry budget*, *escalation quality*, *policy compliance*.
- [ ] Seuils de dérive comportementale sur fenêtres glissantes de 7 jours définis et monitorés — pas seulement des règles d'alerte instantanée.

### 2.4 Replay et shadow runs

- [ ] *Replay* déterministe (golden file testing) disponible pour les sessions historiques.
- [ ] *Shadow runs* (nouvelle version en parallèle de production sans exposition utilisateur) supportés pour les promotions à fort risque.

---

## Section 3 — FinOps

*Source : [Ch. 2 §2.3](ch02-business-case.md) et [Ch. 7 §7.6](ch07-agentops.md) — Unit economics, retry budget, escalation cost.*

### 3.1 Retry budget et escalation cost

- [ ] **[bloquant]** *Retry budget* maximal défini par agent et par session, instrumenté dans le plan de contrôle ([Ch. 7 §7.6](ch07-agentops.md)) et visible dans les tool spans. Dépassement au-delà de P95 → alerte, pas seulement log.
- [ ] *Escalation cost* mesuré séparément du coût d'inférence nominal ; seuil par session défini — les dépassements sont examinés systématiquement.

### 3.2 Kill switches budgétaires et alerting

- [ ] Kill switch budgétaire configuré : dépassement du budget mensuel (tokens + appels API) déclenche suspension automatique ou mode dégradé ; budget révisé après chaque incident de coût non anticipé.
- [ ] Alerting distinguant dégradation aiguë (retry rate > seuil sur 1h) et dérive lente (task success rate −5 % sur 7 jours glissants).
- [ ] Tableau de bord FinOps (coût par tâche réussie, coût d'escalade, coût de retry) distinct du tableau de bord qualité.

---

## Section 4 — Conformité

*Source : [Ch. 8 §8.3–8.4](ch08-trustworthy-systems.md) — EU AI Act, ISO/IEC 42001, NIST AI RMF, OSFI E-23, Loi 25.*

### 4.1 EU AI Act (règlement UE 2024/1689)

- [ ] Qualification documentée : haute-risque (Art. 6, Annexe III — crédit, emploi, infrastructure critique, services essentiels), GPAI, ou hors périmètre.
- [ ] Systèmes haute-risque : surveillance humaine effective (Art. 14) démontrée architecturalement — log seul insuffisant en N4 (arXiv:2604.04604, avril 2026) ; dispositif HITL opérationnel requis.
- [ ] Obligations GPAI (Art. 52-55) vérifiées si modèle à usage général : transparence, marquage des contenus synthétiques. Délai haute-risque : **2 août 2026**.

### 4.2 ISO/IEC 42001 et NIST AI RMF

- [ ] Système *agentic* couvert par le périmètre AIMS (ISO/IEC 42001:2023) de l'organisation ou extension de périmètre documentée ; exigences d'audit tierce partie (ISO/IEC 42006:2025) anticipées.
- [ ] 12 risques GenAI (NIST AI 600-1, juillet 2024) évalués et actions de gestion documentées.
- [ ] Inventaire des agents conforme au concept paper NCCoE/NIST (fév. 2026) : ID, propriétaire, version, périmètre autorisé, limitations.

### 4.3 OSFI E-23 et Loi 25 Québec

- [ ] **[bloquant pour IFFés]** Inventaire des modèles incluant tous les agents *agentic* avec métadonnées E-23 : identifiant, propriétaire, version, date de déploiement, cote risque, usages approuvés, limitations, dépendances (modèles et données tiers via Ligne directrice B-10). Conformité : **1ᵉʳ mai 2027**.
- [ ] Agents N3-N4 : contrôles alternatifs documentés pour modèles « boîte noire » — exigence E-23 explicite pour systèmes à prise de décision autonome.
- [ ] Loi 25 art. 12.1 : si décision exclusivement automatisée affectant une personne → obligation d'information satisfaite, logique explicable, droit de révision humaine opérationnel. Pénalité max : 4 % des revenus mondiaux ou 25 M CAD.

### 4.4 Decision logs et justifiable actions

- [ ] **[bloquant]** Journaux de décision immuables (append-only, signés), horodatés, couvrant : déclencheur, raisonnement intermédiaire, outil invoqué, résultat, agent ayant agi, périmètre de permission actif.
- [ ] Chaque action irréversible justifiable depuis le journal seul, sans rejouer la session ([Ch. 8 §8.3](ch08-trustworthy-systems.md), FINOS Governance Framework MI-21).
- [ ] Durée de conservation alignée sur les exigences applicables (EU AI Act, E-23, Loi 25).

---

## Mode d'emploi

**Qui** : architecte d'entreprise ou de solution, avec CISO (ou délégué) et bureau de risque. IFFés : validation additionnelle par la conformité OSFI.

**Quand** : avant tout déploiement en production N2 ou supérieur. Systèmes N1 (lecture seule, aucun effet de bord) : sections 1.5, 1.6, 3.1–3.2 optionnelles.

1. Remplir section par section avec l'équipe technique en session de travail — ne pas déléguer sans revue architecturale.
2. Chaque item non satisfait → décision documentée : acceptation du risque (date de réévaluation), plan d'assainissement (délai), ou blocage.
3. Items **[bloquant]** non satisfaits → déploiement suspendu jusqu'à résolution ou décision explicite cosignée CISO + architecte responsable.
4. Checklist archivée avec le dossier d'architecture — pièce justificative pour audits EU AI Act et OSFI E-23.
5. **Réévaluation** : à chaque changement sur l'une des cinq composantes de l'artefact composite (prompt système, outils avec versions, configuration mémoire, périmètre de permission, seuils d'escalade).

---

## Renvois croisés

| Sujet | Référence |
|---|---|
| Surface d'attaque protocolaire MCP/A2A | [Ch. 5 §5.4, §5.8](ch05-protocols-interoperability.md) |
| Plan de contrôle AgentOps (kill switches, retry budget) | [Ch. 7 §7.6](ch07-agentops.md) |
| Métriques canoniques et évaluation en production | [Ch. 7 §7.4–7.5](ch07-agentops.md) |
| Niveaux d'autonomie N1-N4 et EU AI Act | [Ch. 8 §8.1, §8.4](ch08-trustworthy-systems.md) |
| Taxonomie OWASP ASI01–ASI10, défense en profondeur | [Ch. 9 §9.2–9.4](ch09-agentic-security.md) |
| Identité vérifiable d'agent | [Ch. 9 §9.4](ch09-agentic-security.md) |
| Maturity model AgentOps | [Annexe C](annexe-C-agentops-maturity.md) |
| RACI agentique (autorité kill switches) | [Annexe D](annexe-D-governance-raci.md) |
