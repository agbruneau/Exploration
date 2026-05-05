---
title: "Lessons from the 60 % That Failed"
chapter: 12
part: 5
status: "esquisse"
length_target_words: 5000
reading_time_min: 20
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement — 12 sources)

### Divergence centrale : « 40 % » Gartner (Ch. 2) vs « 60 % » TOC Ch. 12

**Résolution confirmée après recherche Phase 2** : les deux chiffres coexistent et désignent des périmètres distincts.

- **40 % Gartner (agentic AI, juin 2025)** — Gartner Newsroom, 25 juin 2025 : « Over 40% of agentic AI projects will be canceled by end of 2027 » — enquête 3 412 participants webinaires Gartner, janvier 2025 — causes citées : coûts escaladants, valeur métier floue, contrôles de risque insuffisants. Périmètre : projets *agentic AI* uniquement. URL : https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027 — *confirmé, source primaire publique*.

- **60 % Gartner (AI + données, février 2025)** — Gartner Newsroom, 26 février 2025 : « Lack of AI-Ready Data Puts AI Projects at Risk » — « By end of 2026, organizations without AI-ready data will see over 60% of their AI projects fail or be abandoned » — analyste Roxane Edjlali, Senior Director Analyst, Gartner — enquête data management leaders, juillet 2024. Périmètre : projets IA en général (pas seulement agentic), cause spécifique : manque de données AI-ready. URL : https://www.gartner.com/en/newsroom/press-releases/2025-02-26-lack-of-ai-ready-data-puts-ai-projects-at-risk — *confirmé, source primaire publique, LinkedIn Alteryx confirme indépendamment*.

**Décision éditoriale** : le titre « 60 % That Failed » de la TOC correspond au chiffre Gartner février 2025 (données non AI-ready), qui est une cause transversale couvrant aussi les projets agentiques. La convergence avec le 40 % Gartner juin 2025 (agentic, toutes causes) est cohérente : le 60 % est une cause parmi d'autres, le 40 % est la prédiction globale d'abandon. Les deux sont cités en source primaire distincte et distinctement étiquetés. **Statut : confirmé**.

**Signal complémentaire S&P Global** : CIO Dive, 2025 — S&P Global Market Intelligence (enquête 1 006 IT et LOB professionals, Amérique du Nord et Europe) : 42 % des organisations ont abandonné la majorité de leurs initiatives IA avant production en 2025 (contre 17 % l'année précédente) ; 46 % des POC scrappés avant déploiement élargi. Coût, confidentialité des données et sécurité = obstacles principaux. URL : https://www.ciodive.com/news/AI-project-fail-data-SPGlobal/742590/ — *confirmé, source primaire*.

---

1. Gartner — « Lack of AI-Ready Data Puts AI Projects at Risk » — Gartner Newsroom — 26 février 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-02-26-lack-of-ai-ready-data-puts-ai-projects-at-risk — **Source primaire du « 60 % »** : par fin 2026, les organisations sans données AI-ready verront 60 % de leurs projets IA échouer ou être abandonnés. Analyste : Roxane Edjlali. Enquête : data management leaders, juillet 2024. Cause principale : incapacité à distinguer les exigences de données AI-ready des pratiques de data management traditionnelles. APPORT : fonde le titre du chapitre avec une source primaire Gartner distincte du 40 % agentic (juin 2025).

2. Gartner — « Gartner Predicts Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 » — Gartner Newsroom — 25 juin 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027 — Source primaire établie au Ch. 2 ; rappel ici pour articulation explicite avec le 60 %. Causes : escalating costs + unclear business value + inadequate risk controls. « Agent washing » documenté. Seuls ~130 des milliers de vendeurs agentiques ont des capacités réelles selon Gartner. APPORT : permet l'équation 40 % Gartner agentic (causes multiples) ⊂ 60 % Gartner données (cause spécifique) — les deux chiffres sont cohérents et non contradictoires.

3. S&P Global Market Intelligence — « AI Experiences Rapid Adoption, but with Mixed Outcomes » (VotE: AI & Machine Learning) — CIO Dive — 2025 — https://www.ciodive.com/news/AI-project-fail-data-SPGlobal/742590/ — Enquête 1 006 professionnels IT et LOB, Amérique du Nord et Europe. 42 % des organisations ont abandonné la majorité de leurs initiatives IA avant production (contre 17 % l'année précédente) ; 46 % des POC scrappés avant déploiement élargi. APPORT : corrobore l'ampleur des échecs avec une source d'analyste indépendante de Gartner ; quantifie le saut annuel de la mortalité des projets.

4. Shah, M. B. et al. — « Characterizing Faults in Agentic AI: A Taxonomy of Types, Symptoms, and Root Causes » — arXiv:2603.06847 — 6 mars 2026 — https://arxiv.org/abs/2603.06847 — Analyse qualitative de 385 fautes issues de 13 602 issues et pull requests de 40 dépôts open-source agentiques. Cinq dimensions architecturales de fautes, 13 classes de symptômes, 12 catégories de causes racines. Praticiens : 83,8 % estiment la taxonomie représentative des défaillances rencontrées (mean 3,97/5). APPORT : source académique primaire pour la section anatomie technique — outille la distinction drift d'outil / dette mémoire / dépendances externes.

5. Arize AI — « Why AI Agents Break: A Field Analysis of Production Failures » — Arize Blog — 29 janvier 2026 — https://arize.com/blog/common-ai-agent-failures/ — Analyse de traces LLM de déploiements en production. Quatre vecteurs documentés : (1) gestion de la fenêtre de contexte (« dump truck » sans structure → erreur Lost in the Middle), (2) conflit entre connaissance paramétrique et contextuelle, (3) défaillances d'API externes (changement de schéma Salesforce/HubSpot → raisonnement dégradé plutôt que crash propre), (4) attention decay sur longues conversations (system prompt dilué par tokens récents). APPORT : taxonomie technique la plus détaillée de terrain pour la section anatomie — distingue les symptômes des causes racines.

6. Databricks — « Enterprise AI Agent Trends: Top Use Cases, Governance + Evaluations and More » — Databricks Blog — janvier 2026 — https://www.databricks.com/blog/enterprise-ai-agent-trends-top-use-cases-governance-evaluations-and-more — Rapport *State of AI Agents 2026*, 20 000+ organisations. Résultats clés : organisations avec gouvernance IA → 12× plus de projets en production ; organisations utilisant des outils d'évaluation → 6× plus de déploiements en production réussis. Seulement 19 % des organisations ont déployé des agents à l'échelle. APPORT : quantifie l'impact de la gouvernance et des évaluations sur le taux de succès — pivot de la section critères kill/pivot/scale.

7. HBR — « Why Agentic AI Projects Fail—and How to Set Yours Up for Success » — Harvard Business Review — octobre 2025 — https://hbr.org/2025/10/why-agentic-ai-projects-fail-and-how-to-set-yours-up-for-success — Cadre en cinq parties pour structurer un projet agentique viable. Erreur principale diagnostiquée : assimiler le déploiement d'un agent à un déploiement logiciel alors que c'est un problème de gestion du changement organisationnel. Portée étroite (scope narrow) → 65 % livrés dans les délais, glissement médian 1,9 mois ; portée large → 16 % seulement dans les délais, glissement médian 9,6 mois. APPORT : source d'autorité pour la corrélation scope/échec et pour la catégorie organisationnelle des échecs.

8. HBR — « Organizations Aren't Ready for the Risks of Agentic AI » — Harvard Business Review — juin 2025 — https://hbr.org/2025/06/organizations-arent-ready-for-the-risks-of-agentic-ai — Enquête sur la préparation organisationnelle. Chiffres clés : 6 % seulement des organisations font pleinement confiance aux agents pour les processus métier cœur (Fortune, déc. 2025) ; 20 % disent leur infrastructure technologique « entièrement prête » ; 15 % disent idem pour leurs données ; 12 % pour leurs contrôles de risque et gouvernance. Prolifération non gouvernée d'agents (low-code/no-code) : agents redondants, fragmentés, non supervisés. Seulement 21 % des entreprises ont des modèles de gouvernance matures pour les agents autonomes. APPORT : données de préparation organisationnelle — source pour la section signaux faibles et gouvernance absente.

9. McKinsey — « Building the Foundations for Agentic AI at Scale » — McKinsey Technology — 2026 — https://www.mckinsey.com/capabilities/mckinsey-technology/our-insights/building-the-foundations-for-agentic-ai-at-scale — Critères de passage entre phases : « Is the model safe and stable enough to put in front of users? », « Are users actually adopting it in a real workflow? », « Is there a measurable operational and financial impact that justifies scaling? ». Recommandation de bibliothèques réutilisables de blueprints. Environ un tiers des organisations atteignent le niveau 3 de maturité en stratégie, gouvernance et gouvernance *agentic*. APPORT : fonde la section critères kill/pivot/scale avec une source analytique de premier plan.

10. Chanl AI — « Agent Drift: Why Your AI Gets Worse the Longer It Runs » — Chanl Blog — 2025 — https://www.chanl.ai/blog/agent-drift-silent-degradation — Trois types de dérive documentés. Mémoire : étude décembre 2025, échecs mémoire corrélés à la complexité — 0,67 échec/tâche simple, 2,33 moyen, 3,67 complexe (5,5× d'augmentation). Récupération mémoire : seulement 13,1 % de rappel en scénarios complexes malgré tâche complétée. APPORT : quantifie la dette mémoire comme vecteur d'échec silencieux — complémentaire à la taxonomie arXiv.

11. Agent Corps / AgentCorps.co — « Why Most Agentic AI Projects Fail (And How to Succeed in 2026) » — agentcorps.co — 2026 — https://agentcorps.co/blog/why-most-agentic-ai-projects-fail-and-how-to-succeed-in-2026 — Synthèse praticiens 2026. Erreur multi-agents prématurée : déployer 3-10 agents simultanément avant qu'un seul agent fonctionne de façon fiable en production propre au contexte. Recommandation de séquençage : single-agent first, scale ensuite. APPORT : source praticien pour la catégorie anti-patrons de séquençage — complémente HBR sur l'erreur de scope.

12. McKinsey — « State of AI Trust in 2026: Shifting to the Agentic Era » — McKinsey — 2026 — https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/tech-forward/state-of-ai-trust-in-2026-shifting-to-the-agentic-era — Environ un tiers des organisations rapportent un niveau de maturité ≥ 3/5 en stratégie, gouvernance et gouvernance agentique — le reste = maturité insuffisante pour piloter un programme agentique en production. Transition des métriques d'activité agents vers l'impact P&L en année 2. APPORT : cadre de maturité et bascule métriques — ancre les critères de scale sur l'impact P&L plutôt que sur le volume d'activité.
-->

## Esquisse

**(a) Thèse.** Les programmes agentiques ne meurent pas d'une défaillance technique soudaine — ils dérivent, s'accumulent une dette organisationnelle silencieuse, et s'effondrent quand les coûts dépassent la valeur mesurable. L'autopsie des 60 % abandonnés révèle une architecture causale tri-couche reproductible : technique (drift d'outil, dette mémoire, évaluations absentes), organisationnelle (gouvernance inexistante, ROI non défini), économique (coûts de retry non bornés). Chaque couche amplifie les deux autres.

**(b) Question centrale.** Quels signaux, présents dès les premières semaines de déploiement, distinguent un programme en trajectoire d'échec d'un programme en trajectoire de scale — et comment décider, à tout moment, de tuer, de pivoter ou d'investir ?

**(c) Lecteur cible.** Architecte d'entreprise et directeur de programme confronté à un portefeuille agentique en cours de déploiement ; responsable de la décision go/no-go avant que l'investissement devienne irréversible.

**(d) Renvois croisés prévus.** [Ch. 2](ch02-business-case.md) (40 % Gartner agentic, CPST, incident 47 000 $), [Ch. 7](ch07-agentops.md) (plan de contrôle AgentOps, dérive, observabilité), [Ch. 11](ch11-redesigning-work.md) (workslop, 29 % sabotage, change management), [Ch. 8](ch08-trustworthy-systems.md) (niveaux N1-N4 autonomie, HITL), [Annexe C](annexe-C-agentops-maturity.md) (modèle de maturité), [Annexe D](annexe-D-governance-raci.md) (RACI agentique).

---

## Plan détaillé

### 12.0 — Ouverture : deux chiffres, une seule réalité

*Phrase-clé :* Les 60 % de projets IA abandonnés par manque de données AI-ready (Gartner, fév. 2025) et les 40 % de projets agentiques annulés d'ici 2027 (Gartner, juin 2025) ne se contredisent pas — ils cartographient deux couches d'un même phénomène d'échec systémique, l'une causale (données), l'autre globale (toutes causes combinées).

Contenu : résolution explicite de la divergence 40 %/60 % ; articulation avec les 42 % S&P Global et la hausse annuelle (17 % → 42 %) ; thèse du chapitre posée dès l'ouverture ; transition vers la taxonomie.

---

### 12.1 — Anatomie technique : trois vecteurs de défaillance silencieuse

*Phrase-clé :* Les agents ne tombent pas en panne — ils dérivent, en silence, sur trois axes mesurables : le comportement des outils, l'intégrité de la mémoire, et la fidélité de l'évaluation.

**12.1.1 — Drift d'outil et attention decay**
- Définition opérationnelle du *tool drift* : accumulation de contexte → réinterprétation progressive des paramètres d'outils → erreur propagée par couches (Arize, jan. 2026).
- Attention decay : dilution du system prompt par les tokens récents dans les longues conversations — cause racine de l'ignorance d'instructions explicites (cf. incident Replit DROP TABLE, Ch. 7).
- Conflit paramétrique/contextuel : connaissance d'entraînement prime sur le contexte injecté → comportements non déterministes sur des outils à schéma évolutif (Salesforce, HubSpot).
- Taxonomie académique de référence : arXiv:2603.06847 — 5 dimensions architecturales, 13 classes de symptômes, 12 causes racines ; 83,8 % des praticiens confirment la représentativité.

**12.1.2 — Dette mémoire**
- Définition : dégradation cumulative de la qualité de récupération mémoire à mesure que la complexité des tâches augmente (Chanl AI, 2025).
- Données : 0,67 échec mémoire/tâche simple → 3,67 en tâche complexe (5,5× d'amplification) ; rappel de 13,1 % seulement en scénarios complexes malgré complétion de tâche apparente.
- Distinction critique : la tâche est complétée, mais l'agent opère sur une mémoire appauvrie — les évaluations de surface (tâche complétée = succès) masquent la dérive.
- Renvoi : dette de mémoire définie au [Ch. 6 §6.5](ch06-orchestration-memory-tools.md) ; instrumentation via memory spans au [Ch. 7 §7.2](ch07-agentops.md).

**12.1.3 — Évaluations absentes ou inadéquates**
- Évaluation ponctuelle (3-5 tours) : aveugle sur la dérive longitudinale — la dégradation commence après les 50 premières étapes (CIO.com).
- Absence de shadow runs et de replay déterministe : impossible de distinguer régression de variabilité naturelle sans golden files.
- Corrélation production : organisations utilisant des outils d'évaluation structurés → 6× plus de déploiements en production réussis (Databricks, jan. 2026, n=20 000+).
- Renvoi : techniques d'évaluation (régression continue, replay, shadow runs) au [Ch. 7 §7.3](ch07-agentops.md).

---

### 12.2 — Anatomie organisationnelle : gouvernance absente, ROI flou

*Phrase-clé :* La cause organisationnelle d'échec la plus fréquente n'est pas le manque de talent technique — c'est l'absence de structure décisionnelle avant que les agents opèrent en production.

**12.2.1 — Gouvernance absente et prolifération non contrôlée**
- Seulement 21 % des entreprises ont des modèles de gouvernance matures pour les agents autonomes (HBR, juin 2025).
- 12 % seulement estiment leurs contrôles de risque et gouvernance « entièrement en place ».
- Prolifération low-code/no-code : agents redondants, fragmentés, non supervisés — chaque équipe déploie ses propres agents sans catalogue, sans RACI, sans supervision.
- Anti-patron de séquençage : déploiement multi-agents (3-10 agents simultanément) avant qu'un agent unique soit prouvé fiable dans le contexte de production propre (AgentCorps, 2026 ; HBR oct. 2025).
- Renvoi : RACI agentique [Annexe D](annexe-D-governance-raci.md) ; plan de contrôle [Ch. 7 §7.5](ch07-agentops.md).

**12.2.2 — ROI flou et métriques de surface**
- Erreur systématique : projets jugés sur des métriques d'activité (nombre d'appels agents, tokens consommés) plutôt que sur l'impact P&L (McKinsey, 2026).
- 42 % des projets AI montrent un ROI nul — cause principale : scope trop large, absence de KPI liés à un résultat métier mesurable (Beam.ai).
- Portée étroite → 65 % livraison dans les délais ; portée large → 16 % seulement (HBR oct. 2025).
- Transition métriques : activité agents (année 1) → impact P&L (année 2) — McKinsey ; organisations sans cette bascule restent bloquées en phase expérimentale.
- Renvoi : CPST (Cost per Successful Task) [Ch. 2 §2.2](ch02-business-case.md).

**12.2.3 — Change management absent**
- 29 % des employés admettent avoir saboté des déploiements IA (Writer / Workplace Intelligence, avril 2026) — rappel Ch. 11 §11.4.
- Cause : incitations non restructurées, trajectoires de rôle non communiquées, agents déployés sans *AI ops manager* ni *quality steward* opérationnels.
- Conséquence : workslop (Ch. 11 §11.3) — agent en production sans pilote humain compétent = charge opérationnelle augmentée sans valeur ajoutée.

---

### 12.3 — Anatomie économique : coûts non bornés

*Phrase-clé :* L'architecture financière d'un programme agentique n'est pas celle d'un projet logiciel — les coûts de retry, d'escalade et d'orchestration peuvent diverger exponentiellement sans plafonds explicites.

- Rappel incident 47 000 $ (InfoWorld, Ch. 2) : boucle sans plafond → dépassement non intentionnel.
- Multiplicateur PoC → production : 50×-300× en scénario typique, 1 500×-3 000× dans le pire des cas (Company of Agents, 2026).
- *Infrastructure tax* : 30-50 % du budget agentique réel (orchestration, mémoire, appels d'outils, retries, escalade) — invisible dans les budgets token.
- Absence de FinOps agentique comme signal d'échec précoce : organisations sans loop limits, tool-call caps, et cost-per-run thresholds sont structurellement exposées.
- 46 % des POC scrappés avant déploiement élargi — raison principale : coût + confidentialité (S&P Global, 2025).
- Renvoi : FinOps agentique [Ch. 2 §2.3](ch02-business-case.md) ; budget de retry, kill switches [Ch. 7 §7.5](ch07-agentops.md).

---

### 12.4 — Signaux faibles : checklist d'alerte précoce

*Phrase-clé :* Les programmes agentiques qui échouent émettent des signaux mesurables dès les premières semaines — pas après le dépassement irréversible.

Checklist structurée en quatre familles, chaque item avec seuil observable et source :

**Famille A — Signaux techniques**
- Taux d'escalade en hausse sur 2+ semaines sans modification de scope (*tool drift* probable)
- Taux de rappel mémoire < 50 % sur les tâches complexes (Chanl AI)
- Tool spans montrant retry count > 3 sans résolution sur les outils critiques
- Évaluations uniquement ponctuelles (< 20 tours) → aveugle sur drift longitudinal
- System prompt diminue en influence relative sur la trajectoire (attention decay — Arize)

**Famille B — Signaux organisationnels**
- Absence de *AI ops manager* ou *quality steward* identifié pour les agents en production
- Agents déployés sans catalogue centralisé ni RACI agentique
- Prolifération > 5 agents sans audit de redondance
- Aucun gate humain documenté pour les décisions irréversibles (seuil non défini)
- Résistance active des équipes impactées sans programme de change management

**Famille C — Signaux économiques**
- Absence de loop limits et tool-call caps en production
- CPST non calculé ou non suivi (coût par token seulement)
- Dérive du coût par run > 20 % sur 4 semaines sans explication
- Budget de retry non borné sur les agents actifs
- Pas de ligne budgétaire dédiée à l'escalade humaine

**Famille D — Signaux de gouvernance**
- Pas de politique de version de l'artefact composite (prompt + outils + mémoire + permissions)
- Absence d'évaluation structurée avec golden files ou shadow runs
- Métriques de succès = activité (nombre d'appels) plutôt que résultat métier
- Aucun kill switch défini et testé
- Niveau de maturité AgentOps < 2/5 (Annexe C) au moment du déploiement en production

---

### 12.5 — Critères kill / pivot / scale

*Phrase-clé :* Kill, pivot et scale ne sont pas des réponses émotionnelles à des résultats décevants — ce sont des décisions structurées sur des critères définis avant le déploiement.

**Cadre de décision en trois niveaux** (inspiré de McKinsey, 2026 ; HBR oct. 2025) :

**KILL** — arrêt du programme :
- Critères de valeur : aucun résultat métier mesurable après 90 jours en production (pas seulement en pilote) ; CPST > 3× l'alternative humaine ou RPA sans trajectoire d'amélioration documentée.
- Critères de risque : signaux de sécurité non résolus (prompt injection actives, exfiltration cross-tool documentée) ; incidents irréversibles répétés sans remédiation.
- Critères de données : données sources < niveau AI-ready sans plan de remédiation < 6 mois (Gartner fév. 2025).
- Critère organisationnel : résistance structurelle sans programme de change management viable.

**PIVOT** — réorientation du périmètre ou de l'approche :
- Valeur métier identifiée mais sur un sous-périmètre différent de l'initial → réduire le scope (portée étroite → 65 % de succès).
- Agent multi-étapes instable → revenir à agent single-step sur une tâche bien définie.
- Gouvernance absente → suspendre le déploiement élargi, déployer la gouvernance, reprendre.
- Métriques d'activité positives mais impact P&L nul → redéfinir les KPI et le cas d'usage.

**SCALE** — investissement accéléré :
- Trois critères McKinsey séquentiels : (1) stable et sûr en production, (2) adoption réelle dans un flux de travail métier, (3) impact opérationnel et financier mesurable qui justifie l'extension.
- Gouvernance en place (RACI, catalogue, versionnage) : 12× plus de projets en production (Databricks, 2026).
- Évaluations structurées actives : 6× plus de déploiements réussis (Databricks, 2026).
- *AI ops manager* et *quality steward* opérationnels (Ch. 11 §11.2).
- Pas de signaux faibles actifs en famille A ou C.

**Recommandation architecturale** : définir les critères kill/pivot/scale avant le déploiement, pas après les premiers résultats. L'absence de ces critères ex ante transforme chaque décision en arbitrage politique plutôt qu'en décision structurée.

---

### 12.6 — Transition vers le Ch. 13

*Phrase-clé :* L'inventaire des échecs n'est pas une autopsie — c'est la carte qui permet d'anticiper le terrain du prochain cycle.

Les modes d'échec documentés dans ce chapitre sont transitoires : certains (dette mémoire, drift d'outil) seront partiellement atténués par des améliorations de runtime et d'évaluation dans les 18 mois qui viennent. D'autres (gouvernance absente, ROI flou) sont structurels et resteront des différentiateurs entre les organisations qui scale et celles qui ne scale pas. Le [Ch. 13](ch13-road-ahead.md) trace l'horizon 2027-2030 à la lumière de ces modes d'échec — et identifie quels investissements de 2026 constituent une assurance sur les trajectoires de valeur à venir.

---

## Sources clés

| Source | URL | Apport principal |
|---|---|---|
| Gartner — « Lack of AI-Ready Data Puts AI Projects at Risk » (fév. 2025) | https://www.gartner.com/en/newsroom/press-releases/2025-02-26-lack-of-ai-ready-data-puts-ai-projects-at-risk | **Source primaire du « 60 % »** — confirme le chiffre TOC ; périmètre données AI-ready ; analyste Roxane Edjlali |
| Gartner — « Over 40% of Agentic AI Projects Will Be Canceled » (juin 2025) | https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027 | Complément du Ch. 2 ; articulation explicite 40 % (agentique) / 60 % (données) |
| S&P Global Market Intelligence via CIO Dive (2025) | https://www.ciodive.com/news/AI-project-fail-data-SPGlobal/742590/ | 42 % abandon (vs 17 % an précédent) ; 46 % POC scrappés ; source indépendante |
| arXiv:2603.06847 — Shah et al. (mars 2026) | https://arxiv.org/abs/2603.06847 | Taxonomie académique primaire — 5 dim., 13 symptômes, 12 causes racines |
| Arize AI — « Why AI Agents Break » (jan. 2026) | https://arize.com/blog/common-ai-agent-failures/ | Taxonomie terrain production — drift outils, attention decay, conflits paramétriques |
| Databricks — *State of AI Agents 2026* (jan. 2026) | https://www.databricks.com/blog/enterprise-ai-agent-trends-top-use-cases-governance-evaluations-and-scale | 12× production (gouvernance) ; 6× production (évaluations) — fondement quantitatif des critères scale |
| HBR — « Why Agentic AI Projects Fail » (oct. 2025) | https://hbr.org/2025/10/why-agentic-ai-projects-fail-and-how-to-set-yours-up-for-success | Corrélation scope/échec ; 65 % vs 16 % ; anti-patron d'assimilation déploiement logiciel |
| HBR — « Organizations Aren't Ready for the Risks of Agentic AI » (juin 2025) | https://hbr.org/2025/06/organizations-arent-ready-for-the-risks-of-agentic-ai | 21 % gouvernance mature ; 12 % contrôles de risque prêts ; prolifération non gouvernée |
| McKinsey — « Building the Foundations for Agentic AI at Scale » (2026) | https://www.mckinsey.com/capabilities/mckinsey-technology/our-insights/building-the-foundations-for-agentic-ai-at-scale | Critères de scale gates séquentiels ; ~1/3 des organisations au niveau 3 de maturité |
| McKinsey — « State of AI Trust in 2026 » (2026) | https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/tech-forward/state-of-ai-trust-in-2026-shifting-to-the-agentic-era | Bascule métriques activité → P&L en année 2 ; maturité governance |
| Chanl AI — « Agent Drift » (2025) | https://www.chanl.ai/blog/agent-drift-silent-degradation | Données chiffrées dette mémoire — 5,5× amplification par complexité ; 13,1 % rappel |
| AgentCorps — « Why Most Agentic AI Projects Fail » (2026) | https://agentcorps.co/blog/why-most-agentic-ai-projects-fail-and-how-to-succeed-in-2026 | Anti-patron multi-agents prématuré ; séquençage single-agent first |
