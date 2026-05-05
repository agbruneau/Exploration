---
title: "The Business Case for Agentic AI"
chapter: 2
part: 1
status: "rédigé"
length_words: 5487
reading_time_min: 22
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement)

1. Gartner — « Gartner Predicts Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 » — Gartner Newsroom — 25 juin 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027 — Source primaire confirmée ; sondage janvier 2025 sur 3 412 participants à des webinaires Gartner ; causes citées : coûts escaladants, valeur métier floue, contrôles de risque insuffisants. Biais de sélection signalé : population déjà engagée dans l'IA. Statut paywall : communiqué de presse public, rapport complet paywall.

2. Databricks — « Enterprise AI Agent Trends: Top Use Cases, Governance + Evaluations and More » — Databricks Blog — 2026 — https://www.databricks.com/blog/enterprise-ai-agent-trends-top-use-cases-governance-evaluations-and-more — Source primaire du chiffre « 12× » : les entreprises ayant mis en place une gouvernance IA poussent 12 fois plus de projets en production ; rapport *State of AI Agents 2026*, 20 000+ organisations ; rapport complet : https://www.databricks.com/resources/ebook/state-of-ai-agents — *Confirmé* : Databricks, pas Gartner ni Deloitte.

3. Zendesk — « Zendesk First in CX Industry to offer Outcome-Based Pricing for AI Agents » — Zendesk Newsroom — 2025 — https://www.zendesk.com/newsroom/articles/zendesk-outcome-based-pricing/ — Première implémentation publique d'une tarification *outcome-based* : 1,50 $ par résolution engagée, 2,00 $ à la demande ; paliers dégressifs jusqu'à 1,00 $ au-delà de 5 001 résolutions ; référence de marché pour le passage coût-par-token → coût-par-résultat.

4. Waxell / InfoWorld — « FinOps for agents: Loop limits, tool-call caps and the new unit economics of agentic SaaS » — InfoWorld — 2026 — https://www.infoworld.com/article/4138748/finops-for-agents-loop-limits-tool-call-caps-and-the-new-unit-economics-of-agentic-saas.html — Fondements pratiques du *FinOps* agentique : plafonds de boucles, caps d'appels d'outils, seuils de coût en $ par run ; incident documenté : loop sans plafond → 47 000 $ de dépense non intentionnelle.

5. Adnan Masood / Medium — « AI FinOps: Managing Value and Cost in the Agentic Era » — Medium — mars 2026 — https://medium.com/@adnanmasood/ai-finops-managing-value-and-cost-in-the-agentic-era-37d364c25ec5 — Formalise les métriques *Cost per Successful Task* (CPST) et *infrastructure tax* (30-50 % du budget agentique) ; calibration de l'observabilité financière par tâche et par tenant.

6. Company of Agents / Digital Applied — « AI Agent Unit Economics: Scaling Your Agentic Fleet in 2026 » — companyofagents.ai — 2026 — https://www.companyofagents.ai/blog/en/ai-agent-unit-economics-scaling — Taxonomie complète des postes de coût agentique : inférence, mémoire, appels d'outils, orchestration, retries, escalade humaine ; multiplicateur de coût PoC → production documenté 1 500×–3 000× dans le pire des cas, 50×–300× en scénario typique.

7. SoftwareSeni — « Why Your AI Bill Exploded Between Pilot and Production » — softwareseni.com — 2026 — https://www.softwareseni.com/why-your-ai-bill-exploded-between-pilot-and-production-and-how-to-predict-the-real-cost/ — Cas concret : agent détection fraude fintech, 5 000 $/mois avec 50 utilisateurs (Q3 2025) → 15 000 $/mois avec 500 utilisateurs (janvier 2026) ; analyse des boucles Reflexion (50× tokens par rapport à une passe linéaire).

8. Klarna / Fortune / CX Dive — « Klarna Reverses AI Customer Service Replacement » — Fortune, 9 mai 2025 ; Customer Experience Dive, 2025 — https://fortune.com/2025/05/09/klarna-ai-humans-return-on-investment/ — Cas d'échec documenté : élimination de 700 postes (chiffre officiel Klarna 2024), baisse mesurable de la satisfaction client, réembauche d'agents humains en mode hybride « Uber » à partir de 2025 ; CEO : « We went too far ». Contre-exemple au ROI agentique naïf.

9. Gartner — « 2026 Hype Cycle for Agentic AI » — Gartner — 2026 — https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai — Positionne *agentic AI governance*, *agentic AI security* et *FinOps for agentic AI* comme profils émergents distincts sur le Hype Cycle 2026 ; AI agent development platforms au Pic des attentes gonflées, horizon 2–5 ans vers la productivité. Rapport complet paywall.

10. Deloitte — « AI Token Economics for CFOs » — Deloitte US — 2026 — https://www.deloitte.com/us/en/services/consulting/articles/cfo-guide-ai-token-economics.html — Guide financier Deloitte sur les modèles d'économie du token pour les directions financières ; formalise la distinction coût-par-token (métrique d'ingénierie) vs coût-par-résultat (métrique de décision CFO) ; source d'autorité comptable.

11. pecollective / CloudIDR — « Cross-Provider LLM API Pricing Comparison (April 2026) » — pecollective.com — avril 2026 — https://pecollective.com/blog/llm-pricing-comparison-2026/ et https://www.cloudidr.com/llm-pricing — Tarifs à vérifier en source primaire (openai.com/api/pricing, anthropic.com/pricing, cloud.google.com/vertex-ai/generative-ai/pricing) avant usage dans un calcul financier — volatilité élevée.

12. AWS — « Amazon Bedrock AgentCore Pricing » — AWS — 2026 — https://aws.amazon.com/bedrock/agentcore/pricing/ — Tarification Bedrock Agents : invocation API gratuite ; coûts réels par étape d'orchestration + tokens du modèle sous-jacent ; AgentCore : Search API 25 $/million, InvokeTool API 5 $/million. Référence pour calculs TCO *multi-cloud* agentique.
-->

> **Partie 1 — Pourquoi l'entreprise *agentic* est inévitable**
> **Chapitre 2 · Le cas d'affaires pour l'*agentic AI* · ~5 500 mots · lecture ≈ 22 min**

Le coût par token est une métrique d'ingénierie, pas une métrique de décision. L'arbitrage économique réel d'un programme *agentic* s'exprime en coût par résultat réussi — le *Cost per Successful Task* (CPST) — une unité qui intègre les retries, les escalades humaines, l'orchestration et l'infrastructure, et qui peut diverger de plusieurs ordres de grandeur entre le pilote et la production. Les organisations qui ignorent cette distinction construisent des dossiers d'investissement qui résistent à la démo et s'effondrent à l'échelle. Celles qui l'appliquent dès la phase de cadrage font partie du 60 % de projets qui survivront à 2027.

Ce chapitre traduit en termes financiers les exigences architecturales introduites au [Ch. 1](ch01-from-automation-to-agents.md). Il ne traite pas de la sélection des cas d'usage — c'est l'objet de [Ch. 3](ch03-mapping-high-impact.md) et [Ch. 4](ch04-roi-risk-readiness.md) — mais il fournit les métriques sans lesquelles cette sélection est impossible.

---

## 2.1 — La métrique trompeuse : du coût par token au coût réel d'exécution

La thèse de cette section est contre-intuitive en 2026 : le coût d'accès aux LLM (grands modèles de langage) a chuté de manière spectaculaire en deux ans, mais cette chute ne se traduit pas mécaniquement en réduction du coût total d'un programme *agentic*. La confusion entre les deux explique une fraction significative des dépassements de budget documentés.

Un token est l'unité de facturation des appels d'API LLM. Les fournisseurs publient des grilles tarifaires en dollars pour un million de tokens entrants (*input*) et sortants (*output*). Ces grilles changent régulièrement — parfois plusieurs fois par trimestre — et doivent être vérifiées en source primaire (openai.com/api/pricing, anthropic.com/pricing, cloud.google.com/vertex-ai/generative-ai/pricing) avant tout calcul financier. Le tableau ci-dessous présente la *structure* comparative sans fixer de chiffres ponctuels, car toute valeur serait périmée avant la fin du trimestre de publication :

| Fournisseur / Modèle | Positionnement | Coût relatif IN | Coût relatif OUT | Mécanisme de cache |
|---|---|---|---|---|
| Anthropic — modèles Sonnet | Performance / latence équilibrée | Moyen | Moyen-élevé | Cache prompt : réduction ~90 % sur tokens cachés (*à vérifier*) |
| Anthropic — modèles Opus | Qualité maximale | Élevé | Élevé | Cache prompt disponible |
| OpenAI — GPT-4.x | Performance générale | Moyen-élevé | Moyen-élevé | Prompt caching disponible sur certains modèles |
| Google — Gemini Flash | Vitesse / faible coût | Très bas | Bas | Caching contexte long |
| Google — Gemini Pro | Qualité / contexte long | Moyen | Moyen | Caching contexte long |
| Open-source auto-hébergé (Mistral, Llama) | Contrôle / conformité des données | Coût compute GPU variable | — | Selon implémentation |

*Sources à vérifier en direct sur les pages tarifaires officielles. Tous les prix marqués « à vérifier » car sujets à modification fréquente.*

Ce tableau illustre un fait structurel : les modèles les moins chers à l'appel (Flash, open-source) ne sont pas nécessairement les moins chers à la tâche accomplie, parce que le nombre d'appels nécessaires pour atteindre un résultat satisfaisant varie selon le modèle. Un agent qui appelle un modèle bas coût six fois pour atteindre la même qualité qu'un modèle premium en deux appels peut finir plus cher — et plus lent. Le CPST capture cette réalité ; le coût par token ne la capture pas.

Le multiplicateur est documenté : une boucle Reflexion à dix cycles consomme environ 50 fois les tokens d'une passe linéaire (SoftwareSeni, 2026 — *à vérifier sur données propres*). Pour un agent de débogage logiciel sans contrainte de retry, le coût par tâche peut atteindre 5 à 8 dollars dans les cas documentés (*à vérifier* — données issues de rapports de terrain non audités indépendamment). Au-delà de l'inférence pure, l'*infrastructure tax* représente entre 30 % et 50 % du budget agentique réel, selon Adnan Masood (mars 2026) : cette fraction couvre l'orchestration, la gestion de la mémoire, les appels d'outils, les retries et l'escalade humaine.

Le cas des plateformes managées illustre le piège du coût invisible. Sur Amazon Bedrock Agents (*confirmé* — page tarifaire AWS, accédée 2026-05-05), l'invocation de l'agent est gratuite, mais chaque étape d'orchestration consomme les tokens du modèle sous-jacent, et chaque appel d'outil via AgentCore est facturé séparément (Search API à 25 dollars par million d'appels, InvokeTool API à 5 dollars par million au moment de rédaction — *à vérifier*). Un agent qui exécute cent étapes d'orchestration avec vingt appels d'outils par tâche accumule un coût réel sans qu'aucune ligne de la facture ne soit libellée « coût par tâche ». L'illusion du « gratuit à l'invocation » est l'une des causes les plus fréquentes de dépassement budgétaire dans les premières semaines de production.

La transition vers la métrique décisionnelle correcte est donc non optionnelle : le CPST.

---

## 2.2 — L'unité économique réelle : le *Cost per Successful Task* (CPST)

Le *Cost per Successful Task* (CPST) est la seule métrique qui permet de comparer un agent à un humain, à une RPA (*robotic process automation*) déterministe, ou à un fournisseur SaaS (logiciel-service) proposant une tarification *outcome-based*. Sa formule est :

```
CPST = (coût total d'inférence + orchestration + outils + retries + escalades humaines)
       ────────────────────────────────────────────────────────────────────────────────
                          nombre de tâches réussies sur la période
```

Le dénominateur — le taux de succès — est la variable la plus sous-estimée dans les dossiers d'investissement agentique. Un taux de succès de 60 % double le CPST effectif par rapport à un taux de 100 %, à coût brut identique. Pour une tâche dont le coût brut est de 2 dollars et le taux de succès de 60 %, le CPST réel est de 3,33 dollars, soit 67 % de plus que l'estimation naïve. Cet écart est systématiquement absent des PoC (*proof of concept*) qui testent sur des jeux de données favorables.

Chaque poste du numérateur doit être modélisé avant le passage en production, pas découvert après :

- **Inférence** : coût direct des tokens × nombre d'appels par tâche × coût unitaire du modèle (voir §2.1). Seul poste visible dans les premières factures.
- **Orchestration** : frais de plateforme (Bedrock, Vertex AI Agent Builder, Azure AI Foundry) ou coût compute propre si auto-hébergé. De 5 % à 20 % du coût d'inférence selon l'architecture (*hypothèse* — aucune étude publiée ne généralise ce ratio à mai 2026).
- **Appels d'outils** : coût par appel d'API externe (bases de données, services tiers, appels de fonctions). Pour les agents à accès larges, ce poste peut dépasser l'inférence.
- **Retries** : coût marginal par retry = coût d'inférence de la tentative + coût de restauration de l'état intermédiaire + latence ajoutée. Si un agent tente trois fois avant succès, le coût brut est multiplié par un facteur entre 2 et 3 selon la part des retries qui recyclent l'état.
- **Escalades humaines** : coût de passage à un opérateur humain — salaire-minute × durée de traitement de l'exception. Ce poste est rarement quantifié dans les business cases initiaux parce qu'il appartient aux ressources humaines, pas à l'informatique. Il est pourtant le poste le plus variable : un agent avec un taux d'escalade de 15 % et un traitement humain de 8 minutes à 35 dollars l'heure génère un CPST d'escalade de 0,70 dollar par tâche, indépendamment des coûts d'inférence.

Le signal de marché le plus clair sur la convergence vers le CPST comme métrique de référence est la tarification *outcome-based* de Zendesk (*confirmé* — Zendesk Newsroom, 2025) : 1,50 dollar par résolution engagée, 2,00 dollars à la demande, avec paliers dégressifs jusqu'à 1,00 dollar au-delà de 5 001 résolutions mensuelles. Ce modèle transfère le risque de taux de succès du client vers le fournisseur — ce qui n'est possible que lorsque le fournisseur maîtrise suffisamment son CPST interne pour rester rentable.

**Recommandation : tarification *outcome-based* vs tarification *token-metered*.**

Compromis principal : la tarification *outcome-based* est économiquement favorable pour l'acheteur lorsque le taux de succès attendu est incertain ou inférieur à 80 %. Elle transfère le risque de performance au fournisseur, qui a une incitation directe à optimiser le CPST. La contrepartie : le fournisseur intègre une prime de risque dans le prix par résolution, ce qui rend la tarification *outcome-based* plus chère par transaction réussie que la tarification *token-metered* lorsque le taux de succès est élevé et stable.

Alternative crédible : tarification *token-metered* avec SLA de taux de succès contractualisé et pénalités — combinaison qui préserve l'avantage économique du token bas coût tout en contraignant le fournisseur sur la performance. Cette structure est plus complexe à négocier et à auditer.

Condition de bascule : si le taux de succès de la tâche est supérieur à 90 % en conditions de production stabilisées (après trois mois de run), la tarification *token-metered* devient préférable. Si le taux de succès est inférieur à 70 % ou incertain, la tarification *outcome-based* réduit le risque financier pour l'organisation acheteuse.

**Comparaison structurelle : RPA déterministe vs agent vs ressource humaine**

| Dimension | RPA déterministe | Agent *agentic* | Ressource humaine |
|---|---|---|---|
| Coût marginal à l'échelle | Quasi nul (scalabilité quasi linéaire) | Variable selon taux de retry et d'escalade | Linéaire (headcount) |
| Taux de succès sur tâches répétitives bien définies | Élevé (>95 %) si interface stable | Moyen-élevé (60-90 %) selon complexité | Élevé mais variable (fatigue, turnover) |
| Taux de succès sur tâches ambiguës ou non structurées | Faible (fragilité aux exceptions) | Moyen-élevé si bien outillé | Élevé |
| Observabilité du coût par tâche | Faible (coût amorti sur licence) | Possible si CPST instrumenté dès le design | Faible (coût RH indirect) |
| Conformité et auditabilité | Haute (déterministe, reproductible) | Variable selon gouvernance | Haute si processus documenté |
| Coût d'escalade | Faible (exception prévisible → script) | Élevé si mal borné | Intégré (gestion d'escalade humain-humain) |
| Condition préférable | Tâche structurée, séquence fixe, interface stable | Tâche ambiguë, séquence variable, contexte riche | Tâche à forte composante relationnelle ou éthique |

*Sources structurelles : Company of Agents 2026, Deloitte CFO Guide 2026, Masood 2026. Chiffres de taux de succès : fourchettes estimées — à calibrer sur données propres avant toute décision.*

---

## 2.3 — FinOps agentique : *retry budget*, coût d'escalade, observabilité financière

Le *FinOps* agentique n'est pas la gestion de factures cloud. C'est l'ingénierie de plafonds financiers par tâche et par tenant, intégrés dans l'architecture d'exécution de l'agent dès la phase de design — avant la première ligne de code production. L'absence de ces plafonds est la cause la plus documentée de dépassement de coût catastrophique dans les programmes *agentic* de 2025-2026.

L'incident fondateur est documenté par InfoWorld (2026) : un agent déployé sans plafond de boucle a accumulé 47 000 dollars de dépense non intentionnelle avant d'être détecté et arrêté. Ce n'est pas un cas marginal — c'est la conséquence prévisible d'un agent *stateful* avec accès à des outils payants et sans mécanisme de *kill switch* financier. Un incident de plus grande ampleur a été rapporté en avril 2026 dans un contexte Fortune 500 (fuite de coût cloud liée aux agents estimée à plusieurs centaines de millions de dollars — *à vérifier*, chiffre issu de sources secondaires non auditées).

Trois primitives de contrôle de coût doivent être conçues dès le design, pas ajoutées après incident :

**Primitive 1 — *Retry budget* (budget de retry)**

Le *retry budget* est le nombre maximal de tentatives autorisées par tâche, avec un coût marginal par retry explicitement modélisé et décisionnel. La décision de retenter ou d'escalader ne peut pas être laissée au LLM seul : elle doit être gouvernée par une politique externe qui compare le coût espéré du retry N à la probabilité de succès estimée P(succès | N). Si P(succès retry N) < seuil configuré (typiquement 0,3 à 0,5), l'escalade est déclenchée automatiquement. Sans ce seuil, l'agent optimise pour la complétion de la tâche — pas pour le coût de la complétion.

**Primitive 2 — *Escalation cost* (coût d'escalade)**

Le passage à l'humain a un coût unitaire calculable : salaire-minute de l'opérateur × durée médiane de traitement de l'exception. Ce coût doit être explicitement comparé au coût marginal d'un retry supplémentaire pour décider de la politique d'escalade. Cette comparaison produit un seuil d'escalade financièrement optimal — qui n'est jamais le seuil « jamais escalader » ni « toujours escalader à la première exception ». La politique d'escalade documentée, avec ses seuils, est l'un des trois artefacts de gouvernance minimaux requis pour passer en production (voir §2.4).

**Primitive 3 — *Tool-call cap* et *kill switch* financier**

Chaque appel d'outil à effet de bord (API externe payante, écriture en base de données, envoi de communication) doit être plafonné par run. Si le nombre d'appels franchit le seuil configuré, le run est suspendu et une approbation humaine est requise. Ce mécanisme est distinct du *retry budget* : il contrôle l'amplitude des effets de bord, pas le nombre de tentatives. Le *kill switch* financier est sa version radicale : si le coût accumulé par run franchit un seuil absolu (exemple : 50 dollars compute), le run est terminé et l'exception remontée.

Le diagramme suivant représente le flux décisionnel de la gestion du coût en cours d'exécution :

```mermaid
flowchart TD
    T[Tentative N] --> CB{Coût accumulé\n≥ kill switch ?}
    CB -- Oui --> KS([Kill switch\nterminaison forcée])
    CB -- Non --> ER{Résultat\nréussi ?}
    ER -- Oui --> OK([Tâche réussie\nCPST enregistré])
    ER -- Non --> RB{Retry budget\népuisé ?}
    RB -- Non --> PC{P(succès)\n≥ seuil ?}
    PC -- Oui --> T
    PC -- Non --> ESC
    RB -- Oui --> ESC([Escalade humaine\ncoût d'escalade enregistré])
    ESC --> AUD[(Audit trail\nobservabilité financière)]
    OK --> AUD
    KS --> AUD

    style KS fill:#fdecea,stroke:#c0392b
    style ESC fill:#fff3cd,stroke:#e67e22
    style OK fill:#d4edda,stroke:#27ae60
    style AUD fill:#e8f4f8,stroke:#2980b9
```

**Observabilité financière agentique**

L'observabilité financière est la capacité à connaître le CPST en temps réel, par tâche et par tenant, sans attendre la facture de fin de mois. Elle est distincte de l'observabilité technique ([Ch. 7 — AgentOps](ch07-agentops.md)) bien que les deux partagent la même infrastructure de traces. Une trace AgentOps contient les durées et les appels d'outils ; l'observabilité financière y ajoute les coûts unitaires pour produire un CPST par trace.

Pour les déploiements SaaS (*software as a service*) multi-locataires, la granularité par tenant est non négociable : sans elle, les locataires à comportement atypique (taux d'escalade élevé, boucles longues) subsidient les locataires efficaces, ce qui biaise toute décision tarifaire et détruit les marges unitaires. L'*infrastructure tax* de 30 à 50 % mentionnée par Masood (2026) est précisément la fraction du CPST que la granularité par tenant rend visible et pilotable.

La relation latence-coût mérite un traitement explicite : les modèles à qualité maximale sont généralement plus chers *et* plus lents que les modèles à faible coût. L'arbitrage latence / coût / qualité est une décision architecturale, pas une valeur par défaut. Pour les tâches de support client synchrone, la latence perceptible par l'utilisateur final contraint le modèle utilisable — et donc le plancher de coût. Pour les tâches de traitement de documents en arrière-plan, la latence est sans contrainte et l'optimisation de coût peut privilégier les modèles les moins chers au détriment de la vitesse. Cette décision doit être prise explicitement, par tâche, pas par programme.

La position du Gartner Hype Cycle 2026 est un signal de maturité calibrant : *FinOps for agentic AI* est identifié comme profil émergent distinct sur le Hype Cycle 2026 (Gartner, 2026 — *confirmé* via communiqué Zenity, Business Wire, 15 avril 2026). Cela signifie que la discipline est critique mais que les outils et les pratiques sont encore en formation. Les organisations qui attendent la maturité du marché pour instrumenter leur observabilité financière auront accumulé une dette de coût non mesurée pendant la phase de croissance.

---

## 2.4 — Les 40 % d'annulations : causalité, limites, leçons

La prédiction Gartner de juin 2025 est la plus citée du secteur en 2026, et la plus mal attribuée. Une mise au point sur la source et la méthodologie est nécessaire avant toute utilisation dans un dossier décisionnel.

**Source primaire.** Gartner, communiqué de presse public, 25 juin 2025 (*confirmé*) : « Gartner Predicts Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 ». La source est un communiqué de presse public, pas le rapport complet (paywall). La méthodologie est décrite dans le communiqué : sondage mené en janvier 2025, 3 412 participants recrutés parmi les participants à des webinaires Gartner. Le terme exact utilisé est *canceled* (annulés), pas « abandonnés » ni « mis en pause ». Anushree Verma, *Senior Director Analyst* chez Gartner, est citée : « Most agentic AI projects right now are early stage experiments or proof of concepts that are mostly driven by hype and are often misapplied. »

**Biais de sélection.** La population sondée est composée de participants à des webinaires Gartner — une population auto-sélectionnée qui présente un engagement préalable dans les technologies IA et une sensibilité aux messages Gartner. Cette population est probablement plus avancée dans ses projets *agentic* que la moyenne du marché, ce qui peut sous-estimer le taux d'annulation réel dans les organisations moins matures, ou le surestimer dans les organisations qui ont évité les pièges de cadrage. Le chiffre de 40 % est une prédiction, pas un constat rétrospectif — son statut épistémique est *probable*, pas *confirmé*.

**Décomposition causale.** Le communiqué identifie trois causes d'annulation :

1. *Coûts escaladants* : projets lancés sans modèle de CPST, dont le coût réel à l'échelle dépasse les estimations initiales d'un facteur documenté de 3× à 50× selon les cas (SoftwareSeni, 2026 ; Company of Agents, 2026 — *à vérifier sur données propres*). La lacune est précisément celle que §2.1–2.3 outille.

2. *Valeur métier floue* : projets lancés sans définition contractuelle du *successful outcome* — le CPST n'a pas de dénominateur parce que « succès » n'a pas été défini avant le pilote. L'absence de métrique de résultat rend toute évaluation de ROI (retour sur investissement) impossible et expose le programme à la première revue de portefeuille budgétaire.

3. *Contrôles de risque insuffisants* : projets déployés sans politique d'escalade documentée, sans *retry budget*, sans audit trail de décision — en contradiction directe avec les exigences de gouvernance qui prédisent le multiplicateur de production de §2.5. Le lien avec [Ch. 8](ch08-trustworthy-systems.md) est direct : les contrôles de risque insuffisants créent des incidents (Replit, OpenAI Operator décrits au [Ch. 1](ch01-from-automation-to-agents.md)) qui provoquent l'annulation politique, pas seulement économique.

Ces trois causes forment un système : un projet qui définit son *successful outcome* (cause 2) peut instrumenter son CPST (cause 1) et sa politique d'escalade (cause 3). Les trois lacunes disparaissent ensemble ou restent ensemble.

**Le cas Klarna comme illustration.**

Klarna a éliminé 700 postes de service client (chiffre officiel Klarna, 2024 — confirmé par Fortune, 9 mai 2025) en déployant un agent de service client *agentic*. La satisfaction client a chuté de manière mesurable. En 2025, Klarna a commencé à réembaucher des agents humains dans un modèle hybride décrit par le CEO comme une structure « Uber » — les agents humains opérant comme des prestataires flexibles selon la demande. Le CEO a déclaré publiquement : « We went too far. » (*confirmé* — Fortune, 2025).

L'échec n'était pas technique. L'agent fonctionnait. Le CPST était probablement favorable en coût d'inférence pur. L'échec était économique et opérationnel : le coût de la dégradation de la satisfaction client — *churn*, perte de valeur vie client, coût réputationnel — n'était pas dans le modèle de CPST initial. Un CPST complet aurait inclus ce coût externe. Cette omission est l'anti-patron de cadrage le plus fréquent dans les projets de remplacement d'interactions humaines : optimiser le coût direct sans modéliser le coût de la qualité d'expérience.

La variante 853 postes, circulant dans certaines sources secondaires, n'est pas confirmée par Klarna. La monographie retient 700 comme chiffre officiel.

**Ce que le chiffre de 40 % ne dit pas.**

Soixante pour cent des projets *agentic* ne seront pas annulés d'ici 2027. La question pertinente est : quel est le différenciateur entre les deux cohortes ? Les données disponibles convergent vers une réponse unique, que §2.5 documente.

---

## 2.5 — Les 12× : la gouvernance comme multiplicateur de production

La corrélation la plus structurante des données disponibles en mai 2026 est publiée par Databricks dans le rapport *State of AI Agents 2026* (*confirmé* — Databricks Blog, 2026 ; rapport complet sous enregistrement) : les entreprises ayant mis en place une gouvernance IA formelle poussent 12 fois plus de projets *agentic* en production que celles qui ne l'ont pas fait. L'échantillon est de plus de 20 000 organisations mondiales.

**Attribution.** Ce chiffre est attribué à Databricks *State of AI Agents 2026* — pas à Gartner, pas à Deloitte, pas à McKinsey. La confusion d'attribution est fréquente dans la littérature secondaire parce que les trois organisations ont publié des rapports sur des thèmes adjacents dans la même fenêtre de temps. L'utilisation du chiffre 12× sans attribution correcte à Databricks est une erreur de sourcing.

**Statut épistémique.** La corrélation est *confirmée* par le rapport Databricks (n=20 000+). La causalité — gouvernance → déploiements en production — est *probable* mais non démontrée par le rapport lui-même, qui ne détaille pas les mécanismes causaux. Le mécanisme *le plus plausible* est le suivant : une gouvernance formelle crée la confiance des parties prenantes internes (sécurité, conformité, direction financière) requise pour accorder le feu vert production ; sans cette confiance, les projets restent en PoC perpétuel, non pas pour des raisons techniques, mais pour des raisons de validation organisationnelle.

**Définition opérationnelle de la gouvernance dans ce contexte.**

La gouvernance au sens de Databricks n'est pas un comité d'approbation. C'est un ensemble d'artefacts techniques et organisationnels qui permettent à un agent de passer la porte de production. Sur la base des données du rapport et des pratiques documentées dans [Ch. 8](ch08-trustworthy-systems.md) et [Annexe D](annexe-D-governance-raci.md), trois artefacts sont minimalement requis :

**Artefact 1 — Définition contractuelle du *successful outcome* et seuil de CPST acceptable.** Ce document — une page ou moins — définit ce que compte comme succès pour cette tâche spécifique, le seuil de CPST au-delà duquel la tâche est économiquement non viable, et le taux de succès minimum en dessous duquel la politique d'escalade est révisée. Il est signé par la direction financière et la direction produit avant le premier run de production.

**Artefact 2 — *Eval suite* automatisée couvrant les cas de bord identifiés en PoC.** Une suite d'évaluations automatisées qui teste l'agent sur les scénarios les plus susceptibles d'échouer — pas les scénarios dans lesquels il excelle. Un agent qui réussit 95 % des cas nominaux et échoue sur 100 % des cas de bord n'a pas un taux de succès de 95 % en production réelle. L'*eval suite* mesure le taux de succès sur la distribution réelle des entrées, pas sur la distribution de validation du PoC. [Ch. 4](ch04-roi-risk-readiness.md) détaille la construction de cette suite.

**Artefact 3 — *Escalation policy* documentée avec seuils de coût et de confiance.** La politique qui gouverne quand le *retry budget* est épuisé, à quel seuil de P(succès) l'escalade est automatique, quel est le coût d'escalade unitaire modélisé, et qui est notifié. Ce document transforme les primitives FinOps de §2.3 en politique organisationnelle opposable.

**Pourquoi la gouvernance *accélère* plutôt qu'elle ne ralentit.**

L'argument habituel contre la gouvernance *dès le début* est qu'elle ralentit les premiers sprints de développement. Cet argument est factuellement inversé dans les données Databricks : les organisations *sans* gouvernance formelle ont 12 fois moins de projets en production, ce qui signifie que leurs sprints plus rapides aboutissent à des PoC qui ne franchissent jamais la porte de production. La vitesse sans gouvernance produit des projets en PoC perpétuel — ce n'est pas de la vitesse, c'est de l'activité sans résultat.

Le délai introduit par la gouvernance initiale — estimé à 20-30 % des premiers sprints dans l'*Introduction* (*à vérifier* — aucune étude publiée à mai 2026 ne quantifie précisément cet impact) — est compensé par l'élimination des cycles de validation tardifs, des blocages de sécurité en pré-production, et des annulations post-investissement que les 40 % de Gartner représentent.

**Position du Hype Cycle 2026.**

Gartner positionne *agentic AI governance* comme profil émergent distinct sur le Hype Cycle 2026 (*confirmé* — Zenity, Business Wire, 15 avril 2026), avant le Pic des attentes gonflées. Ce positionnement signifie que la discipline se structure mais que les pratiques ne sont pas encore standardisées. Les organisations qui attendent la standardisation pour implémenter la gouvernance paieront le prix de l'absence de gouvernance pendant la phase d'adoption la plus rapide — précisément la phase où les 40 % d'annulations se concentrent.

---

## 2.6 — De l'économie au cadrage : préparer Ch. 3 et Ch. 4

Un programme *agentic* économiquement sain est celui qui peut répondre, avant la première ligne de code production, à trois questions opérationnelles :

1. Quel est le CPST cible pour cette tâche, et à quel niveau le programme est-il économiquement non viable ?
2. Quel est le *retry budget* maximal par tâche, et quelle est la politique d'escalade quand ce budget est épuisé ?
3. Quel est le *successful outcome* de cette tâche, opérationnellement défini, et qui le valide ?

Ces trois questions sont des critères de sélection de cas d'usage — elles éliminent les tâches pour lesquelles aucune réponse n'est possible avant production (absence de données historiques, processus mal défini, parties prenantes non alignées). La matrice de cadrage de [Ch. 3](ch03-mapping-high-impact.md) (autonomie × réversibilité × tolérance à l'erreur) opère sur ces mêmes critères : une tâche à faible tolérance à l'erreur et haute réversibilité imposée aura un coût d'escalade élevé qui dégrade structurellement le CPST — la matrice détecte cette incompatibilité en amont du développement.

Les quatre piliers du cadre ROI de [Ch. 4](ch04-roi-risk-readiness.md) — LLM, Memory, Tools, Environment — sont les déterminants du CPST. Un environnement mal outillé (pilier *Tools*) multiplie les retries ; une mémoire défaillante (pilier *Memory*) augmente le taux d'escalade ; un LLM sous-dimensionné pour la complexité de la tâche (pilier *LLM*) dégrade le taux de succès. L'évaluation de *readiness* de Ch. 4 est donc une évaluation préalable du CPST potentiel avant engagement de ressources de développement.

La continuité narrative est intentionnelle : [Ch. 1](ch01-from-automation-to-agents.md) a posé les exigences architecturales de la boucle *decide–act–observe* ; ce chapitre les a traduites en métriques financières ; [Ch. 3](ch03-mapping-high-impact.md) et [Ch. 4](ch04-roi-risk-readiness.md) appliquent ces métriques à la sélection et à la qualification des cas d'usage spécifiques. Les pratiques d'observabilité financière convergent avec les pratiques AgentOps dans [Ch. 7](ch07-agentops.md). Les incidents économiques évitables — Klarna, l'agent à 47 000 dollars — alimentent l'anatomie des échecs de [Ch. 12](ch12-lessons-failed.md).

---

## Pour aller plus loin

**Databricks — *State of AI Agents 2026* (rapport complet, sous enregistrement).** La source primaire du multiplicateur 12× et la base empirique la plus large disponible à mai 2026 sur les pratiques de gouvernance et leur corrélation avec les déploiements en production. Lecture indispensable avant toute présentation exécutive sur le ROI d'un programme *agentic*. <https://www.databricks.com/resources/ebook/state-of-ai-agents>

**Gartner — « Gartner Predicts Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 » (25 juin 2025).** Le communiqué public qui fonde la prédiction des 40 %. À lire en source primaire pour comprendre exactement ce qui est mesuré, sur quel échantillon, et avec quels biais — avant de citer le chiffre dans un dossier décisionnel. <https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027>

**Zendesk — « Zendesk First in CX Industry to offer Outcome-Based Pricing for AI Agents » (2025).** Le signal de marché le plus concret sur la convergence du secteur vers la tarification par résultat. Les paliers tarifaires publiés offrent une référence pour calibrer un CPST cible dans le contexte du service client. <https://www.zendesk.com/newsroom/articles/zendesk-outcome-based-pricing/>

**Adnan Masood — « AI FinOps: Managing Value and Cost in the Agentic Era » (mars 2026).** La formalisation la plus complète disponible des métriques CPST et *infrastructure tax* pour les praticiens. Source secondaire — croiser avec les données propres de l'organisation. <https://medium.com/@adnanmasood/ai-finops-managing-value-and-cost-in-the-agentic-era-37d364c25ec5>

**Deloitte — « AI Token Economics for CFOs » (2026).** Le guide Deloitte est conçu pour les directeurs financiers qui reçoivent des demandes de budget IA sans base économique solide. Utile pour aligner le vocabulaire financier entre les équipes techniques (token, retry) et les directions financières (CPST, ROI, coût marginal). <https://www.deloitte.com/us/en/services/consulting/articles/cfo-guide-ai-token-economics.html>

---

## Références

Databricks — « Enterprise AI Agent Trends: Top Use Cases, Governance + Evaluations and More » — Databricks Blog — 2026 — <https://www.databricks.com/blog/enterprise-ai-agent-trends-top-use-cases-governance-evaluations-and-more> — accédée le 2026-05-05

Databricks — *State of AI Agents 2026* (rapport complet) — Databricks — 2026 — <https://www.databricks.com/resources/ebook/state-of-ai-agents> — accédée le 2026-05-05

Deloitte — « AI Token Economics for CFOs » — Deloitte US — 2026 — <https://www.deloitte.com/us/en/services/consulting/articles/cfo-guide-ai-token-economics.html> — accédée le 2026-05-05

Fortune — « Klarna Reverses AI Customer Service Replacement » — Fortune — 9 mai 2025 — <https://fortune.com/2025/05/09/klarna-ai-humans-return-on-investment/> — accédée le 2026-05-05

Gartner — « Gartner Predicts Over 40% of Agentic AI Projects Will Be Canceled by End of 2027 » — Gartner Newsroom — 25 juin 2025 — <https://www.gartner.com/en/newsroom/press-releases/2025-06-25-gartner-predicts-over-40-percent-of-agentic-ai-projects-will-be-canceled-by-end-of-2027> — accédée le 2026-05-05

Gartner — « 2026 Hype Cycle for Agentic AI » — Gartner — 2026 — <https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai> — accédée le 2026-05-05

InfoWorld — « FinOps for agents: Loop limits, tool-call caps and the new unit economics of agentic SaaS » — InfoWorld — 2026 — <https://www.infoworld.com/article/4138748/finops-for-agents-loop-limits-tool-call-caps-and-the-new-unit-economics-of-agentic-saas.html> — accédée le 2026-05-05

Masood, A. — « AI FinOps: Managing Value and Cost in the Agentic Era » — Medium — mars 2026 — <https://medium.com/@adnanmasood/ai-finops-managing-value-and-cost-in-the-agentic-era-37d364c25ec5> — accédée le 2026-05-05

Company of Agents — « AI Agent Unit Economics: Scaling Your Agentic Fleet in 2026 » — companyofagents.ai — 2026 — <https://www.companyofagents.ai/blog/en/ai-agent-unit-economics-scaling> — accédée le 2026-05-05

SoftwareSeni — « Why Your AI Bill Exploded Between Pilot and Production » — softwareseni.com — 2026 — <https://www.softwareseni.com/why-your-ai-bill-exploded-between-pilot-and-production-and-how-to-predict-the-real-cost/> — accédée le 2026-05-05

AWS — « Amazon Bedrock AgentCore Pricing » — Amazon Web Services — 2026 — <https://aws.amazon.com/bedrock/agentcore/pricing/> — accédée le 2026-05-05

Zendesk — « Zendesk First in CX Industry to offer Outcome-Based Pricing for AI Agents » — Zendesk Newsroom — 2025 — <https://www.zendesk.com/newsroom/articles/zendesk-outcome-based-pricing/> — accédée le 2026-05-05

Zenity — « Zenity Named in Two Categories in the 2026 Gartner Hype Cycle for Agentic AI » — Business Wire — 15 avril 2026 — <https://www.businesswire.com/news/home/20260415309905/en/Zenity-Named-in-Two-Categories-in-the-2026-Gartner-Hype-Cycle-for-Agentic-AI> — accédée le 2026-05-05
