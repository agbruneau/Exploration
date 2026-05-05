---
title: "The Business Case for Agentic AI"
chapter: 2
part: 1
status: "esquisse"
length_target_words: 5500
reading_time_min: 22
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2

1. Gartner — « Gartner Predicts Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 » — Gartner Newsroom — 25 juin 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027 — Source primaire confirmée ; sondage janvier 2025 sur 3 412 participants à des webinaires Gartner ; causes citées : coûts escaladants, valeur métier floue, contrôles de risque insuffisants. Statut paywall : communiqué de presse public, rapport complet paywall.

2. Databricks — « Enterprise AI Agent Trends: Top Use Cases, Governance + Evaluations and More » — Databricks Blog — 2026 — https://www.databricks.com/blog/enterprise-ai-agent-trends-top-use-cases-governance-evaluations-and-more — Source primaire du chiffre « 12× » : les entreprises ayant mis en place une gouvernance IA poussent 12 fois plus de projets en production ; rapport *State of AI Agents 2026*, 20 000+ organisations ; rapport complet : https://www.databricks.com/resources/ebook/state-of-ai-agents — *Confirmé* : Databricks, pas Gartner ni Deloitte.

3. Zendesk — « Zendesk First in CX Industry to offer Outcome-Based Pricing for AI Agents » — Zendesk Newsroom — 2025 — https://www.zendesk.com/newsroom/articles/zendesk-outcome-based-pricing/ — Première implémentation publique d'une tarification *outcome-based* : 1,50 $ par résolution engagée, 2,00 $ à la demande ; paliers dégressifs jusqu'à 1,00 $ au-delà de 5 001 résolutions ; référence de marché pour le passage coût-par-token → coût-par-résultat.

4. Waxell / InfoWorld — « FinOps for agents: Loop limits, tool-call caps and the new unit economics of agentic SaaS » — InfoWorld — 2026 — https://www.infoworld.com/article/4138748/finops-for-agents-loop-limits-tool-call-caps-and-the-new-unit-economics-of-agentic-saas.html — Fondements pratiques du *FinOps* agentique : plafonds de boucles, caps d'appels d'outils, seuils de coût en $ par run ; incident documenté : loop sans plafond → 47 000 $ de dépense non intentionnelle.

5. Adnan Masood / Medium — « AI FinOps: Managing Value and Cost in the Agentic Era » — Medium — mars 2026 — https://medium.com/@adnanmasood/ai-finops-managing-value-and-cost-in-the-agentic-era-37d364c25ec5 — Formalise les métriques *Cost per Successful Task* (CPST) et *infrastructure tax* (30-50 % du budget agentique) ; calibration de l'observabilité financière par tâche et par tenant.

6. Company of Agents / Digital Applied — « AI Agent Unit Economics: Scaling Your Agentic Fleet in 2026 » — companyofagents.ai — 2026 — https://www.companyofagents.ai/blog/en/ai-agent-unit-economics-scaling — Taxonomie complète des postes de coût agentique : inférence, mémoire, appels d'outils, orchestration, retries, escalade humaine ; multiplicateur de coût PoC → production documenté 1 500×–3 000× dans le pire des cas, 50×–300× en scénario typique.

7. SoftwareSeni — « Why Your AI Bill Exploded Between Pilot and Production » — softwareseni.com — 2026 — https://www.softwareseni.com/why-your-ai-bill-exploded-between-pilot-and-production-and-how-to-predict-the-real-cost/ — Cas concret : agent détection fraude fintech, 5 000 $/mois avec 50 utilisateurs (Q3 2025) → 15 000 $/mois avec 500 utilisateurs (janvier 2026) ; analyse des boucles Reflexion (50× tokens par rapport à une passe linéaire).

8. Klarna / Fortune / CX Dive — « Klarna Reverses AI Customer Service Replacement » — Fortune, 9 mai 2025 ; Customer Experience Dive, 2025 — https://fortune.com/2025/05/09/klarna-ai-humans-return-on-investment/ — Cas d'échec documenté : élimination de 700 postes (chiffre officiel Klarna 2024), baisse mesurable de la satisfaction client, réembauche d'agents humains en mode hybride « Uber » à partir de 2025 ; CEO : « We went too far ». Contre-exemple au ROI agentique naïf.

9. Gartner — « 2026 Hype Cycle for Agentic AI » — Gartner — 2026 — https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai — Positionne *agentic AI governance*, *agentic AI security* et *FinOps for agentic AI* comme profils émergents distincts sur le Hype Cycle 2026 ; AI agent development platforms au Pic des attentes gonflées, horizon 2–5 ans vers la productivité. Rapport complet paywall.

10. Deloitte — « AI Token Economics for CFOs » — Deloitte US — 2026 — https://www.deloitte.com/us/en/services/consulting/articles/cfo-guide-ai-token-economics.html — Guide financier Deloitte sur les modèles d'économie du token pour les directions financières ; formalise la distinction coût-par-token (métrique d'ingénierie) vs coût-par-résultat (métrique de décision CFO) ; source d'autorité comptable.

11. pecollective / CloudIDR — « Cross-Provider LLM API Pricing Comparison (April 2026) » — pecollective.com — avril 2026 — https://pecollective.com/blog/llm-pricing-comparison-2026/ et https://www.cloudidr.com/llm-pricing — Tarifs confirmés mai 2026 : Claude Sonnet 4 : 3,00 $/1M tokens IN / 15,00 $/1M OUT ; Claude Opus 4.6 : 5,00/25,00 $ ; GPT-4.1 : 5,00/15,00 $ ; Gemini 2.5 Flash : 0,30/2,50 $ ; Gemini 3.1 Pro : 2,00/12,00 $ ; cache Anthropic : réduction 90 % sur tokens cachés (0,30 $ IN cachés sur Sonnet).

12. AWS — « Amazon Bedrock AgentCore Pricing » — AWS — 2026 — https://aws.amazon.com/bedrock/agentcore/pricing/ — Tarification Bedrock Agents : invocation API gratuite ; coûts réels par étape d'orchestration + tokens du modèle sous-jacent ; AgentCore : Search API 25 $/million, InvokeTool API 5 $/million. Référence pour calculs TCO *multi-cloud* agentique.
-->

## Esquisse

**(a) Thèse.** Le coût-par-token est une métrique d'ingénierie, pas une métrique de décision : le véritable arbitrage économique d'un programme *agentic* s'exprime en coût-par-résultat-réussi (*Cost per Successful Task*, CPST), une unité qui intègre retries, escalades, orchestration et infrastructure — et qui peut diverger de plusieurs ordres de grandeur entre le pilote et la production.

**(b) Question.** Comment un CIO, un CFO ou un responsable de portefeuille peut-il construire un dossier d'investissement agentique robuste — et éviter les trois pièges documentés (explosion de coût à l'échelle, abandon faute de valeur mesurable, gouvernance absente) qui condamneront plus de 40 % des projets avant fin 2027 ?

**(c) Lecteur cible.** CIO arbitrant des enveloppes de plateformes ; CFO exposé à des demandes de budget IA sans baseline économique solide ; Product Owner ou directeur programme portant un dossier de passage en production. Hypothèse : le lecteur a compris la boucle *decide–act–observe* ([Ch. 1](ch01-from-automation-to-agents.md)) et cherche maintenant les critères financiers et de gouvernance pour décider.

**(d) Renvois croisés prévus.** [Ch. 1](ch01-from-automation-to-agents.md) — *retry budget* et *escalation cost* annoncés ; [Ch. 3](ch03-mapping-high-impact.md) — matrice cadrage qui préqualifie les cas d'usage par valeur économique ; [Ch. 4](ch04-roi-risk-readiness.md) — cadre ROI à 4 piliers qui opérationnalise les métriques introduites ici ; [Ch. 7](ch07-agentops.md) — observabilité financière comme composante de l'AgentOps ; [Ch. 12](ch12-lessons-failed.md) — anatomie des échecs économiques.

---

## Plan détaillé

### 2.1 — La métrique trompeuse : pourquoi le coût par token ne suffit pas

**Phrase-clé :** Le coût par token chute régulièrement (Gemini 2.5 Flash à 0,30 $/1M tokens IN en mai 2026) mais le coût total d'un run agentique croît avec le nombre de retries, d'appels d'outils et de cycles d'orchestration — la confusion entre les deux a construit des business cases qui ne résistent pas à l'échelle.

Contenu à développer :
- Tableau comparatif des prix IN/OUT en mai 2026 : Claude Sonnet 4 (3,00/15,00 $), Claude Opus 4.6 (5,00/25,00 $), GPT-4.1 (5,00/15,00 $), Gemini 2.5 Flash (0,30/2,50 $), Gemini 3.1 Pro (2,00/12,00 $), open-source auto-hébergé (Mistral/Llama — coût compute variable selon GPU) — sources primaires avril-mai 2026.
- Mécanique du multiplicateur : une boucle Reflexion à 10 cycles consomme 50× les tokens d'une passe linéaire ; un agent multi-étapes de débogage logiciel documenté à 5–8 $/tâche non contrainte.
- Distinction coût direct (tokens) vs coût total (tokens + orchestration + mémoire + appels d'outils + retries + escalade) : l'*infrastructure tax* représente 30–50 % du budget agentique réel.
- Cas Bedrock Agents : invocation gratuite, mais chaque étape d'orchestration et chaque appel d'outil (AgentCore : Search 25 $/M, InvokeTool 5 $/M) s'accumulent ; illusion du « gratuit » à l'invocation.
- Transition narrative : pour décider, il faut une métrique qui capture l'ensemble — le CPST.

### 2.2 — L'unité économique réelle : le coût par résultat réussi (CPST)

**Phrase-clé :** Le *Cost per Successful Task* (CPST) = (coût total d'inférence + orchestration + outils + retries + escalades humaines) / nombre de tâches réussies — c'est l'unité qui permet de comparer un agent à un humain, à une RPA, ou à un fournisseur SaaS à tarification *outcome-based* comme Zendesk (1,50 $ par résolution).

Contenu à développer :
- Formule CPST et décomposition de chaque poste ; importance du dénominateur (taux de succès) — un taux de 60 % double le CPST effectif par rapport à 100 %.
- Exemple Zendesk Resolution Platform : 1,50 $/résolution engagée → 1,00 $/résolution à volume >5 001/mois ; tarification *outcome-based* comme signal de marché que le secteur converge vers cette unité.
- Deloitte CFO Guide : distinction opérationnelle coût-par-token (ingénierie) vs coût-par-résultat (direction financière) — le CFO n'achète pas des tokens, il achète des résultats.
- Comparaison avec le coût humain équivalent et la RPA déterministe : le CPST agentique n'est avantageux que lorsque la complexité de la tâche dépasse le seuil de faisabilité déterministe — quantifier ce seuil.
- Condition de bascule : en dessous de quelle complexité de tâche la RPA reste préférable même si le CPST agentique est inférieur (risque opérationnel + surcoût de gouvernance).

### 2.3 — FinOps agentique : *retry budget*, escalade, latence-coût

**Phrase-clé :** Le *FinOps* agentique n'est pas la gestion de factures cloud — c'est l'ingénierie de plafonds financiers *per-task* et *per-tenant* intégrés dans l'architecture d'exécution de l'agent, avant la première ligne de code production.

Contenu à développer :
- Incident fondateur : agent en boucle sans plafond → 47 000 $ de dépense non intentionnelle documentée sur Hacker News fin 2025 ; incident collectif Fortune 500 : 400 M$ de fuite de coût cloud liée aux agents en avril 2026.
- Trois primitives de contrôle de coût à concevoir dès le design :
  1. **Retry budget** : nombre maximal de tentatives par tâche, avec coût marginal par retry explicitement modélisé ; coût d'un retry = coût d'inférence + coût d'état restauré + latence ajoutée.
  2. **Escalation cost** : coût de passage à l'humain (salaire minute × durée de traitement) vs coût d'un retry supplémentaire ; seuil de décision automatique (ex. : si P(succès retry N) < 0,4 → escalade).
  3. **Tool-call cap** : plafond du nombre d'appels d'outils payants par run ; approbation humaine si le run franchit un seuil de coût (ex. : 50 $ compute).
- Observabilité financière agentique : granularité *per-task* (CPST en temps réel) et *per-tenant* (pour les déploiements SaaS multi-locataires) — lien avec [Ch. 7](ch07-agentops.md) sur les traces AgentOps.
- Latence-coût : la relation non linéaire entre vitesse de réponse et coût (modèles plus puissants = plus chers + souvent plus lents) ; arbitrage latence/coût/qualité comme décision architecturale explicite.
- Recommandation : position de la FinOps agentique dans le Gartner Hype Cycle 2026 comme profil émergent distinct — signal que la discipline est encore immature mais déjà critique.

### 2.4 — Le « 40 % d'abandon d'ici 2027 » : analyse causale

**Phrase-clé :** La prédiction Gartner de juin 2025 (communiqué public, sondage janvier 2025, n=3 412) identifie trois causes directes d'abandon — coûts escaladants, valeur métier floue, contrôles de risque insuffisants — qui correspondent exactement aux trois lacunes que les sections précédentes outillent.

Contenu à développer :
- Source primaire : Gartner Newsroom, 25 juin 2025 — communiqué public, rapport complet paywall. Méthodologie : sondage de participants à des webinaires Gartner (biais de sélection à signaler : population déjà engagée dans l'IA). Anushree Verma, Senior Director Analyst : « Most agentic AI projects right now are early stage experiments or proof of concepts that are mostly driven by hype and are often misapplied. »
- Décomposition causale des trois raisons d'abandon :
  1. *Coûts escaladants* → lacune CPST et FinOps (§2.1–2.3).
  2. *Valeur métier floue* → absence de métrique de résultat (CPST non défini avant lancement).
  3. *Contrôles de risque insuffisants* → lien avec la gouvernance (§2.5) et [Ch. 8](ch08-trustworthy-systems.md).
- Données complémentaires : S&P Global — 46 % des PoC IA abandonnés avant production en 2025 ; IDC — 92 % des entreprises déploient des agents avec dépassement de budget, 71 % sans visibilité sur les postes de coût.
- Cas Klarna comme illustration : élimination de 700 postes, baisse de satisfaction client mesurable, réembauche en mode hybride ; CEO en 2025 : « We went too far. » — l'échec n'était pas technique mais économique et opérationnel.
- Ce que le chiffre ne dit pas : 60 % des projets *ne* seront *pas* annulés — le différenciateur entre les deux cohortes est l'objet du §2.5.

### 2.5 — Les 12× : gouvernance comme multiplicateur de production

**Phrase-clé :** Le rapport Databricks *State of AI Agents 2026* (20 000+ organisations) établit que les entreprises ayant mis en place une gouvernance IA poussent 12 fois plus de projets en production — la gouvernance n'est pas un frein bureaucratique mais la variable la plus prédictive du passage à l'échelle.

Contenu à développer :
- Source primaire et méthodologie : Databricks *State of AI Agents 2026*, n=20 000+ organisations mondiales ; rapport disponible sous enregistrement. Attribution exacte : Databricks, *pas* Gartner ni Deloitte (erreur fréquente dans la littérature secondaire — signaler explicitement).
- Définition opérationnelle de la « gouvernance » dans ce contexte : évaluations (*evals*) automatisées, contrôles de qualité des outputs, traçabilité des décisions agent, politiques d'escalade documentées — pas simplement un comité d'approbation.
- Mécanisme causal proposé (à marquer *probable* — rapport ne détaille pas la causalité) : gouvernance → confiance des parties prenantes → feu vert production → apprentissage en production → amélioration continue → plus de déploiements. Sans gouvernance → blocage sécurité ou conformité → rester en PoC perpétuel.
- Lien avec le Hype Cycle Gartner 2026 : *agentic AI governance* identifié comme profil émergent distinct, positionné avant le Pic des attentes gonflées — signal que la discipline se structure mais reste immature.
- Recommandation architecturale : trois artefacts de gouvernance minimaux pour franchir la porte de production (définir ici, détailler en [Ch. 8](ch08-trustworthy-systems.md) et [Annexe D](annexe-D-governance-raci.md)) :
  1. Définition du *successful outcome* et seuil de CPST acceptable (contrat avec la direction financière).
  2. *Eval suite* automatisée couvrant les cas de bord identifiés en PoC.
  3. *Escalation policy* documentée avec seuils de coût et de confiance.

### 2.6 — Préparer les chapitres suivants : de l'économie au cadrage

**Phrase-clé :** Le CPST et le *retry budget* sont des outils de décision, pas des outils de sélection de cas d'usage — la matrice de [Ch. 3](ch03-mapping-high-impact.md) (autonomie × réversibilité × tolérance à l'erreur) et le cadre ROI à 4 piliers de [Ch. 4](ch04-roi-risk-readiness.md) appliquent les métriques de ce chapitre à la qualification des cas d'usage spécifiques.

Contenu à développer :
- Pont Ch. 2 → Ch. 3 : le CPST est la variable dépendante que la matrice de cadrage cherche à maximiser ; un cas d'usage à haute réversibilité et faible tolérance à l'erreur aura un coût d'escalade élevé qui dégrade le CPST — la matrice le détecte en amont.
- Pont Ch. 2 → Ch. 4 : les 4 piliers (LLM, Memory, Tools, Environment) sont les déterminants du CPST ; un environnement mal outillé (pilier *Tools*) multiplie les retries ; une mémoire défaillante (pilier *Memory*) augmente l'escalade.
- Signal de clôture : un programme *agentic* économiquement sain est celui qui peut répondre, avant la première ligne de production, à trois questions : Quel est notre CPST cible ? Quel est notre *retry budget* maximal par tâche ? Quelle est notre politique d'escalade et son coût unitaire ?

---

## Sources clés

| # | Source | URL | Statut | Apport |
|---|---|---|---|---|
| 1 | Gartner Newsroom — « Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 » — 25 juin 2025 | https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027 | Communiqué public confirmé ; rapport complet paywall | Source primaire du « 40 % » ; causes causales (coût, valeur, risque) ; méthodologie sondage n=3 412 |
| 2 | Databricks — « Enterprise AI Agent Trends » / *State of AI Agents 2026* | https://www.databricks.com/blog/enterprise-ai-agent-trends-top-use-cases-governance-evaluations-and-more | Confirmé, public | Source primaire du « 12× » — *Databricks, pas Gartner ni Deloitte* ; n=20 000+ |
| 3 | Zendesk — « Zendesk First in CX Industry to offer Outcome-Based Pricing » — 2025 | https://www.zendesk.com/newsroom/articles/zendesk-outcome-based-pricing/ | Confirmé, public | Référence de marché pour la tarification *outcome-based* ; 1,50 $/résolution |
| 4 | InfoWorld — « FinOps for agents: Loop limits, tool-call caps » — 2026 | https://www.infoworld.com/article/4138748/finops-for-agents-loop-limits-tool-call-caps-and-the-new-unit-economics-of-agentic-saas.html | Confirmé, public | Primitives FinOps agentique ; incident 47 000 $ documenté |
| 5 | Adnan Masood — « AI FinOps: Managing Value and Cost in the Agentic Era » — mars 2026 | https://medium.com/@adnanmasood/ai-finops-managing-value-and-cost-in-the-agentic-era-37d364c25ec5 | Source secondaire | Formalisation CPST et *infrastructure tax* (30-50 %) |
| 6 | Fortune / CX Dive — Klarna reversal, mai 2025 | https://fortune.com/2025/05/09/klarna-ai-humans-return-on-investment/ | Confirmé, public | Cas d'échec économique documenté ; réembauche humains 2025 |
| 7 | Deloitte — « AI Token Economics for CFOs » — 2026 | https://www.deloitte.com/us/en/services/consulting/articles/cfo-guide-ai-token-economics.html | Confirmé, public | Autorité financière sur distinction token/résultat pour direction financière |
| 8 | pecollective — « LLM API Pricing Comparison (April 2026) » | https://pecollective.com/blog/llm-pricing-comparison-2026/ | À croiser avec pages officielles fournisseurs | Tableau de prix comparatif mai 2026 (à vérifier sur pages tarifaires OpenAI, Anthropic, Google) |
| 9 | AWS — Amazon Bedrock AgentCore Pricing — 2026 | https://aws.amazon.com/bedrock/agentcore/pricing/ | Confirmé, public | Tarification Bedrock Agents ; mécanique coût par étape d'orchestration |
| 10 | Gartner — « 2026 Hype Cycle for Agentic AI » | https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai | Article public ; rapport complet paywall | Positionnement *agentic governance* + *FinOps agentique* comme profils émergents distincts |
