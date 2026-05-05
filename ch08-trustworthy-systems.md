---
title: "Building Trustworthy Systems"
chapter: 8
part: 4
status: "esquisse"
length_target_words: 5500
reading_time_min: 22
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement — 12 sources)

1. artificialintelligenceact.eu — « Implementation Timeline | EU Artificial Intelligence Act » — mai 2026 — https://artificialintelligenceact.eu/implementation-timeline/ — Chronologie officielle phased du règlement (UE) 2024/1689 : entrée en vigueur 1ᵉʳ août 2024 ; interdictions et obligations de littératie IA applicables 2 février 2025 ; règles GPAI applicables 2 août 2025 ; obligations systèmes haute-risque applicables 2 août 2026 (sauf systèmes intégrés dans produits réglementés : 2 août 2027) ; haute-risque pour autorités publiques : 2 août 2030. Source normative de référence pour la chronologie.

2. arxiv.org — Reuel et al. — « AI Agents Under EU Law: A Compliance Architecture for AI Providers » — arXiv:2604.04604 — avril 2026 — https://arxiv.org/html/2604.04604v1 — Analyse juridique directe sur comment l'EU AI Act s'applique aux agents IA : qualification du fournisseur vs déployeur, rôle de l'autonomie et du tool use dans la désignation de risque systémique GPAI, architecture de conformité pour les fournisseurs de systèmes agentiques. Source académique primaire pour la section conformité EU AI Act + agents.

3. iso.org — « ISO/IEC 42001:2023 — Artificial Intelligence Management Systems » — publication décembre 2023 — https://www.iso.org/standard/42001 — Standard international AIMS : cadre Plan-Do-Check-Act pour l'établissement, la mise en œuvre, la maintenance et l'amélioration continue d'un système de management de l'IA. Type-A — certifiable par tierce partie. Première vague de certifications (BSI, A-LIGN, Schellman, KPMG) établit les patterns de référence. Complément normative : ISO/IEC 42006:2025 — exigences pour les organismes de certification et d'audit AIMS.

4. iso.org — « ISO/IEC 42006:2025 — Requirements for AIMS audit and certification bodies » — 2025 — https://www.iso.org/standard/42006 — Complément de 42001 publié en 2025 : spécifie les exigences auxquelles les organismes de certification et d'audit doivent satisfaire pour certifier la conformité à ISO/IEC 42001. Importance : ferme la boucle gouvernance en rendant les audits AIMS opposables. Source primaire ISO.

5. nist.gov — CAISI — « Announcing the AI Agent Standards Initiative for Interoperable and Secure Innovation » — 17 février 2026 — https://www.nist.gov/news-events/news/2026/02/announcing-ai-agent-standards-initiative-interoperable-and-secure — Lancement officiel NIST Agent Standards Initiative (Centre for AI Standards and Innovation). Trois piliers : (1) leadership dans ISO/IEC JTC 1 ; (2) développement de protocoles open-source cofinancés NSF ; (3) recherche fondamentale en sécurité, identité et méthodes d'évaluation de l'interopérabilité. Profil d'interopérabilité AI Agent prévu Q4 2026 (*probable* — corroboré par sources secondaires, non explicité dans le texte NIST primaire). Apport : pilier NIST manquant dans le cadre HITL / auditabilité.

6. nvlpubs.nist.gov — NIST — « AI 600-1 — Artificial Intelligence Risk Management Framework: Generative Artificial Intelligence Profile » — juillet 2024 — https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf — Profil GenAI du NIST AI RMF 1.0 : identifie 12 risques propres ou exacerbés par l'IA générative, fournit 200+ actions suggérées de gestion du risque. Complément direct du RMF 1.0 pour les systèmes fondés sur LLM. Source primaire NIST confirmée.

7. osfi-bsif.gc.ca — OSFI — « Guideline E-23 — Model Risk Management (2027) » — en vigueur 1ᵉʳ mai 2027 — https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027 — Ligne directrice E-23 OSFI finalisée 2025, applicable à toutes les institutions financières fédérales canadiennes (IFFés). Périmètre : tous les modèles quelle que soit leur source (interne ou tiers). Définition « modèle » inclut explicitement AI/ML. Exige : inventaire des modèles à risque non négligeable, politiques MRM proportionnées, contrôles alternatifs pour modèles « boîte noire » ou autonomes. Applicabilité aux agents : confirmée — les modèles à auto-apprentissage dynamique et prise de décision autonome sont expressément visés. Source primaire OSFI.

8. rcgt.com — Raymond Chabot Grant Thornton — « Loi 25 : l'enjeu des décisions automatisées » — 2024-2026 — https://www.rcgt.com/fr/conseils/avis-d-experts/loi-25-enjeu-decisions-automatisees/ — Analyse de l'article 12.1 Loi 25 Québec (*Loi modernisant des dispositions législatives en matière de protection des renseignements personnels*, LQ 2021, c 25, pleinement en vigueur sept. 2023) : obligation d'informer la personne concernée lorsqu'une décision est prise exclusivement par traitement automatisé ; obligation d'expliquer la logique impliquée et les conséquences possibles ; droit de présenter des observations et de demander une révision par une personne. Pénalités : jusqu'à 4 % des revenus mondiaux ou 25 M CAD. Lien direct avec HITL opérationnel.

9. blg.com — BLG — « OSFI responds to the growing use of AI: key updates to Guideline E-23 » — novembre 2025 — https://www.blg.com/en/insights/2025/11/osfi-responds-to-the-growing-use-of-ai-key-updates-to-guideline-e-23 — Analyse juridique de la version finale E-23 : élargissement explicite du périmètre aux modèles AI/ML (y compris systèmes autonomes), obligation d'inventaire des modèles avec métadonnées (ID, propriétaire, version, date déploiement, cote risque, usages approuvés, limitations, dépendances), inclusion des modèles et données tiers via Ligne directrice B-10.

10. knightcolumbia.org — Knight First Amendment Institute — « Levels of Autonomy for AI Agents » — 2026 — https://knightcolumbia.org/content/levels-of-autonomy-for-ai-agents-1 — Cadre conceptuel sur les niveaux d'autonomie des agents IA, publié en lien avec un papier arXiv (2506.12469). Cinq niveaux définis par le rôle résiduel de l'humain : opérateur, collaborateur, consultant, approbateur, observateur. Ancrage théorique pour le modèle à quatre niveaux de ce chapitre (assistance → supervisé → autonome borné → autonome). Source académique de référence pour §8.1.

11. finos.org / air-governance-framework.finos.org — FINOS — « AI Governance Framework v2.0 » — 2026 — https://air-governance-framework.finos.org/mitigations/mi-21_agent-decision-audit-and-explainability.html — Cadre de gouvernance open-source pour services financiers, v2.0 : catalogue de risques agentiques, mitigation MI-21 « Agent Decision Audit and Explainability » — journaux de décision complets (facteurs, logique explicable, conformité réglementaire, immuabilité, reproductibilité), tableaux de bord de conformité en temps réel, rapports d'exception. Références croisées vers OWASP, MITRE, EU AI Act (7 frameworks). Apport : vocabulaire opérationnel pour §8.3 auditabilité.

12. ijctjournal.org — « Human-in-the-Loop (HITL) Orchestration for Agentic Use Cases » — avril 2026 — https://ijctjournal.org/wp-content/uploads/2026/04/Human-in-the-Loop-HITL-Orchestration-for-Agentic-Use-Cases.pdf — Papier académique sur les patterns d'orchestration HITL en contexte agentique : modèle d'intervention à trois niveaux (escalade sur seuil de confiance, escalade sur règle de conformité, escalade sur type d'action irréversible) ; distinction HITL-in-loop (intervention synchrone) vs HITL-on-loop (supervision asynchrone) vs HITL-over-the-loop (révision post-facto) ; conditions de bascule vers plus ou moins d'intervention humaine. Source académique primaire pour §8.2.
-->

## Esquisse

**a) Thèse.** La fiabilité d'un système *agentic* en entreprise n'est pas une propriété émergente de la qualité du modèle — c'est un résultat d'ingénierie qui s'obtient par la combinaison de quatre éléments structurants : un modèle d'autonomie hiérarchique explicite qui contraint le périmètre d'action à chaque niveau, un dispositif HITL (*human-in-the-loop*) opérationnel conçu autour de l'escalade des exceptions plutôt que de l'approbation de chaque action, une infrastructure d'auditabilité fondée sur des journaux de décision immuables et des actions justifiables, et une conformité alignée sur le corpus réglementaire 2024-2027 (EU AI Act, ISO/IEC 42001, NIST AI RMF, OSFI E-23, Loi 25 Québec). Ces quatre éléments ne sont pas indépendants : l'architecture d'autonomie détermine ce qui doit être escaladé, l'escalade produit les événements qui alimentent les journaux, et les journaux sont la preuve de conformité.

**b) Question.** Comment concevoir un système *agentic* d'entreprise qui peut agir de façon autonome là où le risque est acceptable, escalader là où il ne l'est pas, démontrer à un auditeur que chaque décision était justifiée, et satisfaire simultanément les exigences réglementaires de l'EU AI Act, d'ISO 42001, du NIST AI RMF, d'OSFI E-23 et de la Loi 25 Québec — sans que la gouvernance paralyse l'efficacité opérationnelle ?

**c) Lecteur cible.** Architecte d'entreprise senior responsable du design d'un système *agentic* devant passer une revue réglementaire ; *risk officer* qui doit définir les politiques de délégation et d'escalade ; *AI governance lead* qui construit le dossier de conformité.

**d) Renvois croisés prévus.**
- [Ch. 4 §4.3](ch04-roi-risk-readiness.md) — métriques *policy compliance* et *escalation quality* introduites là, opérationnalisées ici.
- [Ch. 7 §7.2 et §7.4](ch07-agentops.md) — infrastructure d'observabilité (traces, spans, plan de contrôle) réutilisée comme substrat de l'auditabilité ; distinction entre observabilité opérationnelle (Ch. 7) et gouvernance/conformité (ce chapitre).
- [Annexe A](annexe-A-architecture-review.md) — checklist de revue architecturale sécurité/observabilité/FinOps.
- [Annexe D](annexe-D-governance-raci.md) — RACI gouvernance agentique.

---

## Plan détaillé

### §8.0 — Accroche et thèse (ouverture de chapitre)

**Phrase-clé.** La confiance dans un système *agentic* n'est pas une attestation de l'éditeur du modèle — c'est une propriété architecturale que l'organisation déploie délibérément, ou qu'elle ne déploie pas du tout.

Structure : partir d'un cas concret (une organisation déploie un agent qui prend une décision erronée avec effet irréversible, et ne peut ni le prouver ni l'expliquer à l'auditeur) → formuler la thèse : les quatre éléments structurants (autonomie hiérarchique, HITL opérationnel, auditabilité, conformité) sont une seule architecture, pas quatre projets séparés → annoncer le plan.

---

### §8.1 — Hiérarchie d'autonomie : quatre niveaux, quatre périmètres de permission

**Phrase-clé.** Le choix du niveau d'autonomie pour une tâche n'est pas une décision de confiance dans le modèle — c'est une décision de risque opérationnel fondée sur la réversibilité de l'action et la tolérance à l'erreur.

**Contenu.**

Définir les quatre niveaux opérationnels adaptés au contexte entreprise (distinct du modèle à cinq niveaux du Knight First Amendment Institute, qui adopte l'angle des rôles utilisateurs — ici l'angle est celui des *périmètres de permission* de l'agent) :

| Niveau | Désignation | Définition opérationnelle | Périmètre de permission |
|--------|-------------|--------------------------|------------------------|
| N1 | Assistance | L'agent produit une recommandation ; l'humain décide et agit. | Lecture seule. Aucune invocation d'outil avec effet de bord. |
| N2 | Supervisé | L'agent propose un plan et attend approbation humaine avant chaque action irréversible. | Lecture + écriture conditionnelle (gate humain sur actions irréversibles). |
| N3 | Autonome borné | L'agent exécute dans un périmètre d'action défini et délimité ; il escalade sur sortie de périmètre. | Lecture + écriture libre dans le périmètre ; blocage + escalade hors périmètre. |
| N4 | Autonome | L'agent agit sans contrainte dans le périmètre défini, avec obligation de journalisation post-facto et de revue périodique. | Lecture + écriture libre ; journalisation immuable obligatoire. |

Rattachement au cadre de classification publié par le Knight First Amendment Institute (2026) et à arXiv:2506.12469 — distinguer ce qui est une décision de *confiance* dans la qualité du modèle (évaluation interne, tests, evals) et ce qui est une décision de *risque opérationnel* (réversibilité, tolérance à l'erreur, obligation réglementaire). Le niveau d'autonomie suit la matrice de [Ch. 4 §4.1](ch04-roi-risk-readiness.md) : réversibilité × tolérance à l'erreur → niveau.

**Compromis principal** : autonomie N4 maximise l'efficacité opérationnelle et minimise la latence humaine, mais exige une infrastructure de journalisation et de revue post-facto irréprochable — le coût de la preuve est reporté sur l'audit, pas sur l'approbation. Autonomie N2 minimise le risque réglementaire mais peut annuler le gain de productivité si les gates deviennent des goulots.

**Alternative crédible** : modèle *adaptive autonomy* — le niveau est dynamique, ajusté au run-time selon le score de confiance de l'agent sur la tâche en cours (certains frameworks en 2026 l'implémentent via *confidence-driven escalation*, cf. source 12). Condition qui renverse la recommandation de niveau fixe : déploiements à volume élevé et actions fortement hétérogènes où un niveau fixe crée soit des gates trop fréquentes soit des zones non couvertes.

**Connexion EU AI Act** : les niveaux N3 et N4 dans des domaines haute-risque (crédit, emploi, infrastructure critique) tombent dans le périmètre des obligations applicables à partir du 2 août 2026. N4 dans ces domaines requiert surveillance humaine effective — non seulement journalisation.

---

### §8.2 — HITL opérationnel : humans set rules, agents execute, exceptions escalate

**Phrase-clé.** Un HITL efficace n'est pas un frein d'urgence activé après l'échec — c'est un mécanisme de délégation structurée où le domaine de l'agent et le domaine de l'humain sont définis a priori avec précision chirurgicale.

**Contenu.**

La formulation *humans set rules, agents execute, exceptions escalate* est la syntaxe opérationnelle du HITL d'entreprise. Elle distingue trois responsabilités non permutables :

1. **Humans set rules** — les politiques (périmètre d'action, seuils de confiance, types d'actions irréversibles, domaines interdits) sont définies par des humains avant déploiement. Ce travail n'est pas délégable à l'agent lui-même. C'est le produit de la collaboration entre l'architecte de solution, le *risk officer* et le *compliance lead* — formalisé dans une *agent policy* versionnée et auditée.

2. **Agents execute** — dans le périmètre défini par la *agent policy*, l'agent exécute sans intervention humaine. Toute intervention humaine dans ce périmètre est un coût pur sans bénéfice de sécurité. La discipline opérationnelle consiste à définir ce périmètre suffisamment précis pour que l'exécution autonome soit sûre, suffisamment large pour que la délégation soit utile.

3. **Exceptions escalate** — toute condition hors périmètre déclenche une escalade synchrone (HITL-in-loop) ou asynchrone (HITL-on-loop), selon l'urgence et la réversibilité de l'action concernée. Le papier IJCT (source 12) définit trois triggers d'escalade : seuil de confiance, règle de conformité, type d'action irréversible.

Présenter les trois patterns d'intervention humaine (source 12) :

- **HITL-in-loop** (synchrone) : l'agent s'arrête et attend une réponse humaine avant de continuer. Applicable pour actions irréversibles à fort impact (virement > seuil, modification d'un contrat actif, envoi de communication externe).
- **HITL-on-loop** (asynchrone) : l'agent continue, l'humain est notifié et peut intervenir dans une fenêtre de temps définie. Applicable pour actions réversibles à risque modéré.
- **HITL-over-the-loop** (post-facto) : l'agent exécute, les journaux sont revus périodiquement par un humain. Applicable pour actions en N4, avec journalisation immuable.

**Connexion Loi 25 Québec (article 12.1)** : toute décision prise « exclusivement par traitement automatisé » qui produit des effets juridiques ou affecte significativement la personne concernée impose une obligation d'information et un droit de révision par une personne. HITL-over-the-loop seul ne satisfait pas cette obligation pour les décisions individuelles visées — un mécanisme de demande de révision doit exister.

**Compromis principal** : HITL-in-loop garantit la conformité la plus stricte mais génère des goulots d'étranglement à volume élevé. **Alternative** : HITL-on-loop avec fenêtre d'intervention courte (ex. 15 minutes pour les cas à risque modéré). **Condition de bascule** : si le taux d'escalade dépasse un seuil opérationnel (ex. 5 % des transactions), le périmètre d'action de l'agent est mal calibré — le problème est dans la *agent policy*, pas dans le HITL.

---

### §8.3 — Auditabilité : journaux de décision, actions justifiables, immuabilité

**Phrase-clé.** Un journal de décision agentique n'est pas un log d'application — c'est la reconstruction complète et fidèle de la chaîne causale qui a produit une action, opposable à un auditeur humain.

**Contenu.**

Les cinq propriétés d'un journal de décision auditoire (FINOS AIGF v2.0, source 11 ; adapté de IJCT source 12) :

1. **Traçabilité** — toute action est reliée à un agent identifié, un objectif, une autorisation. Le journal capture : qui a décidé (agent ID + version), pourquoi (objectif et politique appliquée), avec quelle autorisation (périmètre de permission au moment de l'action), quels outils ont été invoqués (tool spans avec paramètres d'entrée et résultats), dans quel état mémoire (memory diff pré/post-action).

2. **Explicabilité** — la logique de décision est rendue lisible pour un humain non technique. Cela implique que le raisonnement intermédiaire de l'agent est journalisé, pas seulement l'output final. En 2026, cette exigence n'est pas automatiquement satisfaite par les LLM : les systèmes qui ne journalisent pas le raisonnement intermédiaire créent un déficit d'explicabilité documenté (ISACA, 2025).

3. **Immuabilité** — les journaux sont tamponnés avec horodatage cryptographique et stockés dans un système en écriture seule. Un journal modifiable n'est pas un journal d'audit.

4. **Autorisation vérifiable** — chaque action peut être confrontée à la *agent policy* en vigueur au moment de l'action. Le versionnement de la *agent policy* est une prérequis.

5. **Reproductibilité** — à partir des journaux, un auditeur doit pouvoir reconstituer le chemin de décision (technique du *replay* déterministe, mentionnée au [Ch. 7 §7.3](ch07-agentops.md) dans le contexte des evals en production — ici reprise pour sa valeur probatoire en audit).

**Distinction observabilité (Ch. 7) vs auditabilité (ce chapitre)** : l'observabilité opérationnelle (traces OTel, spans, dashboards) est instrumentée pour le diagnostic en temps réel par les opérateurs. L'auditabilité est instrumentée pour la preuve a posteriori par des auditeurs et des régulateurs. Les deux réutilisent la même infrastructure de journalisation (spans OTel GenAI SemConv 1.40.0), mais les politiques de rétention, d'immuabilité et d'accès sont différentes.

**Actions justifiables** : une action est *justifiable* si, pour tout auditeur, l'agent peut démontrer que l'action était (a) dans le périmètre autorisé, (b) cohérente avec l'objectif reçu, (c) proportionnée à l'information disponible au moment de l'action. La justifiabilité n'exige pas que l'action soit optimale — elle exige qu'elle soit défendable dans le cadre de la politique.

**Compromis** : journalisation complète du raisonnement intermédiaire alourdit la latence et multiplie le volume stocké. **Alternative** : journalisation sélective sur actions à risque élevé uniquement. **Condition de bascule** : si un incident survient sur une action non journalisée, le coût de l'enquête et de la preuve de conformité dépasse largement le coût de la journalisation préventive — la décision de journalisation sélective doit être documentée et revue périodiquement.

---

### §8.4 — Conformité : cartographie des obligations par cadre réglementaire

**Phrase-clé.** Un système *agentic* déployé par une institution financière canadienne au service de clients européens navigue simultanément dans quatre cadres réglementaires sans comité de coordination entre eux — la charge de l'alignement est entièrement sur l'organisation déployante.

**Contenu.**

Tableau de cartographie des cinq cadres réglementaires (non exhaustif — point de départ pour les organisations concernées) :

| Cadre | Périmètre applicabilité | Obligations principales pour systèmes agentiques | Date d'applicabilité |
|-------|------------------------|--------------------------------------------------|----------------------|
| **EU AI Act** (UE 2024/1689) | Systèmes déployés dans l'UE ou à des ressortissants UE | Surveillance humaine effective (Art. 14), transparence (Art. 13), journaux (Art. 12), interdiction systèmes inacceptables (Art. 5), obligations GPAI (Titre VIII) | 2 fév. 2025 (interdictions) ; 2 août 2025 (GPAI) ; 2 août 2026 (haute-risque) |
| **ISO/IEC 42001:2023** | Volontaire — certifiable par tierce partie | AIMS : politique IA, évaluation d'impact, contrôle des risques, audit annuel, recertification 3 ans | En vigueur — certification possible depuis 2024 ; ISO/IEC 42006:2025 pour les organismes d'audit |
| **NIST AI RMF 1.0 + GenAI Profile** | Volontaire — référence dominante aux USA et Canada | Fonctions GOVERN, MAP, MEASURE, MANAGE ; 12 risques GenAI + 200+ actions ; Profil Agent Q4 2026 (*probable*) | AI RMF 1.0 : janvier 2023 ; AI 600-1 : juillet 2024 |
| **OSFI E-23** | IFFés canadiennes (banques, assureurs, régimes de retraite) | Inventaire modèles AI/ML, politiques MRM, contrôles alternatifs pour modèles autonomes, gestion risque tiers (B-10) | 1ᵉʳ mai 2027 |
| **Loi 25 Québec** (Art. 12.1) | Organisations traitant des renseignements personnels de personnes au Québec | Information sur décision automatisée, droit de révision par une personne, pénalités 4 % revenus mondiaux ou 25 M CAD | Pleinement en vigueur depuis septembre 2023 |

**Canada — AIDA / Bill C-27** : le Bill C-27 incluant l'AIDA est mort au feuilleton le 5 janvier 2025 lors de la prorogation du Parlement. Aucun successeur législatif fédéral canadien sur l'IA n'est en vigueur à mai 2026. Le Canada opère sans cadre fédéral IA, ce qui transfère la charge de gouvernance sur les lignes directrices sectorielles (OSFI E-23 pour le secteur financier) et les cadres volontaires (NIST AI RMF). *Confirmé* — BLG, DLA Piper, janvier 2025.

**Divergence EU AI Act vs NIST AI RMF** : l'EU AI Act adopte une approche prescriptive fondée sur la classification du risque avec des obligations contraignantes par niveau — les organisations qui ne se conforment pas s'exposent à des amendes allant jusqu'à 35 M EUR ou 7 % du chiffre d'affaires mondial. Le NIST AI RMF est un cadre volontaire fondé sur des fonctions de gestion du risque, sans obligation légale directe. En pratique, les organisations qui opèrent des deux côtés de l'Atlantique utilisent le NIST AI RMF comme squelette de gouvernance interne et l'EU AI Act comme liste des obligations à satisfaire dans la couche de conformité externe. Cette complémentarité est productrice si elle est délibérée — elle est source de duplication si elle est traitée comme deux projets séparés.

---

### §8.5 — Architecture de la confiance : intégrer les quatre éléments

**Phrase-clé.** Les quatre éléments — autonomie hiérarchique, HITL opérationnel, auditabilité, conformité — ne s'additionnent pas : ils se conditionnent mutuellement, et leur intégration produit une architecture de confiance plus économique que leur empilement séquentiel.

**Contenu.**

Montrer la chaîne causale intégratrice :

1. La *agent policy* (périmètre d'autonomie par niveau) définit ce qui doit être escaladé → le HITL opérationnel n'est pas dimensionné sur « tout ce qui est incertain » mais sur « ce que la politique désigne ».
2. Les événements d'escalade sont des événements prioritaires dans le journal de décision → l'auditabilité n'est pas un add-on, elle est alimentée par les mêmes événements que le HITL.
3. La *agent policy* est elle-même un artefact soumis à gouvernance (versionnement, revue périodique, approbation) → ISO/IEC 42001 fournit le cadre de management ; OSFI E-23 exige l'inventaire ; EU AI Act exige la documentation technique.

Diagramme Mermaid : flux de gouvernance intégré (agent policy → autonomy layer → HITL triggers → decision log → compliance reporting → policy review cycle).

**Recommandation architecturale** : implémenter l'infrastructure de gouvernance en une seule passe, pas en trois projets séquentiels. La *agent policy* est l'artefact central — tout le reste en découle. Construire la *agent policy* d'abord, puis instrumenter le HITL sur ses triggers, puis configurer le journal de décision sur ses événements, puis mapper les sorties du journal aux exigences réglementaires.

**Compromis** : intégration monolithique de la gouvernance crée une dépendance forte entre les équipes (architecte, risk, compliance, ops). **Alternative** : interfaces entre composants (policy-as-code exposé via API, triggers HITL consommés par un bus d'événements, journaux vers un entrepôt de données d'audit indépendant). **Condition de bascule** : si l'organisation est multi-juridictionnelle avec des exigences réglementaires divergentes par entité, l'architecture modulaire avec interfaces est obligatoire — la *agent policy* centrale ne peut pas être uniforme.

---

### §8.6 — Pour aller plus loin

Sélection de 3-5 références commentées pour un architecte senior souhaitant approfondir.

---

## Sources clés

| # | Source | Apport pour Ch. 8 |
|---|--------|-------------------|
| S1 | artificialintelligenceact.eu — Implementation Timeline | Chronologie EU AI Act officielle, dates d'applicabilité par obligation |
| S2 | arXiv:2604.04604 — AI Agents Under EU Law | Analyse juridique agents IA sous EU AI Act, qualification fournisseur/déployeur, risque systémique |
| S3 | ISO/IEC 42001:2023 (iso.org) | Standard AIMS certifiable — Plan-Do-Check-Act pour gouvernance IA |
| S4 | ISO/IEC 42006:2025 (iso.org) | Exigences pour organismes d'audit AIMS — boucle de conformité opposable |
| S5 | NIST CAISI — AI Agent Standards Initiative (17 fév. 2026) | Trois piliers NIST pour agents : sécurité, identité, interopérabilité ; profil Q4 2026 |
| S6 | NIST AI 600-1 — GenAI Profile (juil. 2024) | 12 risques GenAI, 200+ actions — complément AI RMF 1.0 pour systèmes LLM |
| S7 | OSFI — Guideline E-23 (osfi-bsif.gc.ca) | Ligne directrice MRM canadienne — agents autonomes expressément visés, en vigueur mai 2027 |
| S8 | RCGT — Loi 25 décisions automatisées | Article 12.1 : obligation information + droit révision humaine, pénalités |
| S9 | BLG — OSFI E-23 key updates (nov. 2025) | Périmètre élargi AI/ML, inventaire modèles, tiers via B-10 |
| S10 | Knight First Amendment Institute — Levels of Autonomy for AI Agents | Cadre théorique niveaux d'autonomie — base du modèle à quatre niveaux de §8.1 |
| S11 | FINOS AIGF v2.0 — MI-21 Agent Decision Audit and Explainability | Vocabulaire opérationnel auditabilité : traçabilité, explicabilité, immuabilité, autorisation, reproductibilité |
| S12 | IJCT — HITL Orchestration for Agentic Use Cases (avr. 2026) | Patterns HITL-in-loop / on-loop / over-the-loop ; trois triggers d'escalade |
