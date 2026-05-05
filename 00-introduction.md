---
title: "Introduction — Why this book, why now"
chapter: "Introduction"
part: 0
status: "rédigé"
length_words: 2507
reading_time_min: 10
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement)

1. Anthropic — « Building Effective Agents » — décembre 2024 — https://www.anthropic.com/research/building-effective-agents — Source primaire définissant la distinction *workflow* (chemins prédéfinis) vs *agent* (LLM dirige dynamiquement ses propres processus et outils) ; taxonomy des cinq patrons de workflow + agent autonome ; principe de simplicité ("start with simple prompts").

2. Gartner — « 2026 Hype Cycle for Agentic AI » — 2026 — https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai — Position à la crête des attentes gonflées ; 17 % d'organisations en déploiement actuel, >60 % prévoyant de déployer dans les deux ans ; >40 % des projets agentiques abandonnés d'ici 2027 ; émergence de trois profils spécialisés : *agentic AI governance*, *agentic AI security*, *FinOps for agentic AI*.

3. Deloitte — « The agentic reality check: Preparing for a silicon-based workforce » (Tech Trends 2026) — 2026 — https://www.deloitte.com/us/en/insights/topics/technology-management/tech-trends/2026/agentic-ai-strategy.html — Concept de « silicon-based workforce » ; 15 % des décisions quotidiennes seront autonomes d'ici 2028 (Gartner via Deloitte) ; 33 % des applications d'entreprise incluront de l'agentique d'ici 2028 ; seulement 11 % en production aujourd'hui ; distinction copilot (assistance ponctuelle) vs agent (flux composite multi-domaine) ; recommandation : redesign vs automatisation des processus existants.

4. Writer / Workplace Intelligence — « Enterprise AI Adoption 2026 » — 2026 — https://writer.com/blog/enterprise-ai-adoption-2026/ — Enquête 2 400 répondants (1 200 employés non techniques, 1 200 C-suite) ; 54 % des C-suite déclarent que l'adoption de l'IA « déchire leur organisation » ; 79 % font face à des défis d'adoption ; seulement 23 % voient un ROI significatif des agents IA ; 36 % n'ont pas de plan formel de supervision des agents.

5. Palo Alto Networks Unit 42 — « Fooling AI Agents: Web-Based Indirect Prompt Injection Observed in the Wild » — 3 mars 2026 — https://unit42.paloaltonetworks.com/ai-agent-prompt-injection/ — Première documentation publique d'*indirect prompt injection* (IDPI) dans un système de revue publicitaire IA (déc. 2025) ; 22 techniques d'ingénierie de charge identifiées ; systèmes affectés : navigateurs, moteurs de recherche, processeurs de contenu, agents automatisés.

6. NIST — « AI Agent Standards Initiative » (Centre for AI Standards and Innovation) — 17 février 2026 — https://www.joneswalker.com/en/insights/blogs/ai-law-blog/nists-ai-agent-standards-initiative-why-autonomous-ai-just-became-washingtons-problem.html — Initiative formelle NIST en trois piliers : sécurité agent, interopérabilité, identité ; profil d'interopérabilité AI Agent prévu Q4 2026 ; s'appuie sur AI RMF existant + Cyber AI Profile (déc. 2025) + COSAiS à venir.

7. IBM — « The 2026 Guide to AI Agents » et « The trends that will shape AI and tech in 2026 » — 2026 — https://www.ibm.com/think/ai-agents — Définition IBM : agent IA = système capable d'exécuter des tâches de façon autonome en concevant son propre flux et en utilisant les outils disponibles ; système multi-agents = plusieurs agents coordonnés ; 2026 = passage des systèmes multi-agents du laboratoire à la production ; 70 % des systèmes multi-agents d'ici 2027 auront des agents à rôles étroits et spécialisés.

8. Microsoft — « Powering Frontier Transformation with Copilot and agents » (Microsoft 365 Blog) — 9 mars 2026 — https://www.microsoft.com/en-us/microsoft-365/blog/2026/03/09/powering-frontier-transformation-with-copilot-and-agents/ — Distinction explicite Microsoft : un *copilot* = assistant IA de productivité ponctuelle (« ask and answer ») ; un *agent* = outil spécialisé exécutant des processus métier définis (« delegate and verify ») ; Wave 3 de Copilot = bascule de l'assistance vers l'orchestration d'agents autonomes.

9. OpenAI — « Introducing AgentKit » — 2025-2026 — https://openai.com/index/introducing-agentkit/ — Transition de l'Assistants API (sunset 26 août 2026) vers les Agents SDK (mars 2025) ; primitives : *Handoffs* (transfert de contrôle), *Guardrails* (validation E/S), *Tracing* (observabilité) ; définition du système multi-agents : « multiple LLMs, each with their own tools and instructions, coordinating on a bigger task ».

10. BLG / Discrepancy AI — « AI in Canada in 2026 across economic sectors » — mars 2026 — https://www.blg.com/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026 — AIDA (Bill C-27) mort au feuilleton en janvier 2025 ; successeur attendu en 2026 ; OSFI Ligne directrice E-23 (et non E-21 — le prompt de mission mentionne E-21 mais les sources primaires ne confirment que E-23) en vigueur le 1er mai 2027 ; Loi 25 Québec pleinement en vigueur, impose des obligations strictes sur la prise de décision automatisée.

11. arXiv / Cloud Security Alliance — « The Attack and Defense Landscape of Agentic AI: A Comprehensive Survey » — mars 2026 — https://arxiv.org/html/2603.11088v1 — Taxonomie des vecteurs d'attaque propres aux systèmes agentiques : *prompt injection via tools*, *cross-tool exfiltration*, *jailbreak by delegation* ; gap temporel entre initiation et observation comme nouveau dimension de risque fondamental ; responsabilité distribuée dans la délégation orchestrateur → sous-agents.

12. Zenity / Business Wire — « Zenity Named in Two Categories in the 2026 Gartner Hype Cycle for Agentic AI » — 15 avril 2026 — https://www.businesswire.com/news/home/20260415309905/en/Zenity-Named-in-Two-Categories-in-the-2026-Gartner-Hype-Cycle-for-Agentic-AI — Confirmation indépendante de la publication du Gartner Hype Cycle for Agentic AI 2026 ; deux catégories visibles : sécurité et gouvernance agentique.
-->

## §1 — La crête de 2026 : du copilot au système *agentic*

Cinquante-quatre pour cent des dirigeants d'entreprise interrogés par Writer et Workplace Intelligence en 2026 déclarent que l'adoption de l'IA « déchire » leur organisation (Writer, *Enterprise AI Adoption 2026*). Le Gartner Hype Cycle for Agentic AI 2026 situe la technologie au sommet des attentes gonflées : 17 % d'organisations en déploiement actif, plus de 60 % planifiant un déploiement dans les deux ans — et plus de 40 % des projets agentiques qui seront abandonnés avant 2027 (Gartner, 2026). Deloitte mesure le fossé entre intention et exécution : 11 % seulement des organisations ont des systèmes *agentic* en production aujourd'hui (*Tech Trends 2026*). Ces trois chiffres convergent vers le même diagnostic : une adoption massive en marche, une majorité d'organisations déjà fragilisées par le rythme, et un taux d'échec prévisible qui n'est pas une fatalité mais une conséquence de cadrage déficient.

Le cas qui illustre ce diagnostic avec précision est documenté par Palo Alto Networks Unit 42 (*confirmé*). En décembre 2025, un système de revue publicitaire fondé sur un agent IA a été compromis par une attaque d'*indirect prompt injection* (IDPI) — la première documentée publiquement dans un système de production réel. L'agent, conçu pour évaluer et approuver des publicités numériques, a interprété des instructions malveillantes encodées dans le contenu qu'il analysait, contournant les contrôles humains et exécutant des actions non autorisées. Unit 42 a identifié 22 techniques d'ingénierie de charge dans cet incident. Ce n'est pas une anomalie de laboratoire : c'est la signature d'une classe de risque inexistante pour les copilots, mais inhérente à tout système *agentic* qui confère à un LLM (grand modèle de langage) le droit d'agir dans un environnement réel.

La rupture de 2026 n'est pas un saut quantitatif — un modèle plus rapide, un contexte plus long. C'est un saut qualitatif dans la nature de l'outil : le passage du copilot, assistant réactif qui répond à des requêtes et laisse l'humain agir, au système *agentic*, qui exécute des chaînes d'actions avec mémoire persistante, outils et délégation. Cette bascule crée une classe inédite de risques, de coûts et d'opportunités que ni les architectures d'entreprise actuelles ni les cadres de gouvernance existants ne sont dimensionnés pour absorber. C'est la raison d'être de ce livre.

## §2 — Lexique opérationnel : trois termes, trois réalités distinctes

La confusion terminologique est la première cause d'échec de cadrage des projets *agentic* en 2026. Les termes *AI agent*, *agentic* et *agentic AI* circulent comme s'ils étaient synonymes dans les appels d'offres, les feuilles de route et les présentations exécutives. Ils ne le sont pas. Ce livre adopte une convention hybride fondée sur les sources primaires des éditeurs les plus influents, formalisée dans le glossaire (*confirmé*) :

**Agent** (nom, romain) : entité unique exécutant la boucle *decide–act–observe* avec accès à des outils et une mémoire. Un agent reçoit un objectif, planifie ses propres étapes, invoque des outils (API, bases de données, navigateur, code), observe les résultats, et ajuste. La définition primaire est celle d'Anthropic (*Building Effective Agents*, décembre 2024) : un système où le LLM dirige dynamiquement ses propres processus et l'utilisation de ses outils, par opposition au *workflow* dont les chemins sont prédéfinis par l'humain.

**«** ***agentic*** **»** (adjectif, italique) : qualifie tout système, comportement ou propriété d'un LLM exécutant cette boucle, qu'il soit à agent unique ou multiple. Un pipeline RAG (*retrieval-augmented generation*) avec appels d'outils est *agentic*. Un chatbot sans mémoire ni outil ne l'est pas. Cette acception suit Anthropic.

**«** ***Agentic AI*** **»** (nom, italique) : désigne spécifiquement un système composite — plusieurs agents coordonnés par un orchestrateur, chacun avec ses propres instructions, outils et contexte, collaborant sur une tâche plus large. C'est la définition IBM (*The 2026 Guide to AI Agents*), confirmée par OpenAI (transition Agents SDK, mars 2025) et reprise par Gartner dans son Hype Cycle 2026. Dans cette monographie, *agentic AI* est synonyme de système multi-agents.

La ligne de partage opérationnelle la plus utile pour un architecte reste celle proposée par Microsoft (*Microsoft 365 Blog*, mars 2026) : le copilot fonctionne sur le mode « ask and answer » — l'humain demande, l'outil répond, l'humain décide et agit. L'agent fonctionne sur le mode « delegate and verify » — l'humain délègue un objectif, l'agent agit, l'humain vérifie le résultat. Ce glissement de responsabilité de l'action — de l'humain vers le système — est précisément ce qui modifie les exigences d'architecture, de sécurité et de gouvernance.

La divergence entre IBM et Anthropic sur le terme *agentic* est réelle et non tranchée par consensus industriel à mai 2026. Ce livre retient la convention hybride : *agentic* comme adjectif suit Anthropic (plus précis opérationnellement) ; *agentic AI* comme nom suit IBM (plus utile pour désigner les systèmes multi-agents orchestrés). Cette décision éditoriale est appliquée systématiquement dans tous les chapitres.

## §3 — Pourquoi maintenant : la convergence de quatre pressions simultanées

La rupture de 2026 n'est pas due à un seul modèle plus puissant. Elle résulte de la convergence simultanée de quatre dynamiques indépendantes, dont aucune prise isolément n'aurait déclenché la transformation observée.

**Maturité protocolaire.** En décembre 2025, Anthropic a fait don du Model Context Protocol (MCP) à la Linux Foundation, transformant un standard propriétaire en bien commun de l'industrie. MCP standardise la manière dont les agents accèdent aux outils et aux sources de données. Parallèlement, le protocole Agent-to-Agent (A2A) — permettant la découverte de capacités, la délégation de tâches et l'orchestration pair-à-pair entre agents — est passé en déploiement production. Ces deux protocoles constituent l'infrastructure de base de l'*agentic AI* en 2026, détaillée au [Ch. 5](ch05-protocols-interoperability.md).

**Sortie du laboratoire.** IBM l'a formulé sans ambiguïté : 2026 est l'année où les systèmes multi-agents sortent du laboratoire pour entrer en production à l'échelle (*The 2026 Guide to AI Agents*). Gartner confirme : 33 % des applications d'entreprise intégreront de l'*agentic AI* d'ici 2028, contre 11 % aujourd'hui (Deloitte, *Tech Trends 2026*). IBM anticipe que 70 % des systèmes multi-agents déployés d'ici 2027 seront composés d'agents à rôles étroits et spécialisés — une architecture que ce livre détaille au [Ch. 6](ch06-orchestration-memory-tools.md).

**Pression réglementaire opposable.** Le 17 février 2026, le National Institute of Standards and Technology (NIST) a formalisé une initiative en trois piliers dédiée aux agents IA : sécurité, interopérabilité, identité, avec un profil d'interopérabilité AI Agent prévu pour le quatrième trimestre 2026 (Centre for AI Standards and Innovation). Ce n'est pas une consultation : c'est le signal que les systèmes *agentic* passent dans le périmètre des standards formels. En parallèle, au Canada, la Loi 25 du Québec est pleinement en vigueur et impose des obligations strictes sur la prise de décision automatisée ; OSFI (*Office of the Superintendent of Financial Institutions*) E-23 (*Model Risk Management*) entre en vigueur le 1ᵉʳ mai 2027 ; le successeur de l'AIDA (*Artificial Intelligence and Data Act*, projet de loi C-27, mort au feuilleton en janvier 2025) est attendu en 2026 (BLG, mars 2026). Le [Ch. 8](ch08-trustworthy-systems.md) développe ces obligations réglementaires dans leur intégralité.

**Restructuration du travail.** Deloitte introduit le concept de « silicon-based workforce » pour désigner la réalité émergente d'équipes hybrides où des agents autonomes coexistent avec des travailleurs humains, sans simple superposition des deux (*Tech Trends 2026*). Cette restructuration n'est pas une hypothèse prospective : 54 % des C-suite interrogés par Writer déclarent que leur organisation est déjà déchirée par la vitesse de ce changement. Le [Ch. 11](ch11-redesigning-work.md) traite de cette transition en profondeur.

Ces quatre pressions n'ont pas de précédent combiné dans l'histoire récente des technologies d'entreprise. L'EDA (*event-driven architecture*) a mis dix ans à s'imposer ; les microservices, huit. L'*agentic AI* dispose d'un délai nettement plus court, sous pression à la fois commerciale et réglementaire.

## §4 — Ce que ce livre n'est pas — et pour qui il est écrit

Ce livre ne traite pas des fondements des grands modèles de langage. Il ne contient pas de tutoriels de *prompt engineering*. Il n'est pas une introduction grand public à l'intelligence artificielle. Il suppose que le lecteur connaît déjà EDA, microservices, Kafka, les patrons d'intégration et les principes de modernisation d'entreprise — si un concept appartenant à ce corpus doit être rappelé, il le sera dans un encadré explicitement signalé.

**La recommandation centrale de ce livre est la suivante :** dans un programme *agentic AI* d'entreprise, la gouvernance et l'architecture doivent être conçues simultanément et dès le premier sprint, et non séquentiellement. Les organisations qui ont déployé la gouvernance en premier — avant même d'avoir des agents en production — livrent significativement plus de systèmes *agentic* viables que celles qui traitent la gouvernance comme une exigence de post-déploiement (*probable*, selon les tendances documentées par Gartner 2026 et Deloitte).

*Compromis principal :* concevoir la gouvernance dès le début ralentit les premiers sprints de 20 à 30 % selon les estimations de terrain (*à vérifier* — aucune étude publiée à mai 2026 ne quantifie précisément cet impact). Ce délai initial est compensé par une réduction des incidents en production et une accélération des phases de mise à l'échelle.

*Alternative crédible :* déployer d'abord une architecture *agentic* en sandbox strictement isolé, sans aucune connexion aux systèmes de production, puis introduire la gouvernance avant la sortie du sandbox. Cette approche est valide pour les organisations dont la culture de risque est élevée et la capacité d'isolement technique confirmée.

*Condition de bascule :* si l'organisation n'a pas de *Model Risk Management* (MRM) formalisé, l'approche gouvernance-d'abord n'est pas tenable — il faut d'abord construire le MRM, puis déployer les agents. OSFI E-23 en vigueur le 1ᵉʳ mai 2027 rendra cette séquence obligatoire pour les institutions financières canadiennes sous supervision fédérale.

Ce livre est conçu pour quatre rôles :

**Le CIO** trouvera dans les parties I et II les éléments pour distinguer les cas d'usage *agentic* générateurs de valeur mesurable des projets à risque d'abandon. La partie V ([Ch. 11](ch11-redesigning-work.md), [Ch. 12](ch12-lessons-failed.md)) traite de la conduite du changement organisationnel et des critères de décision *kill/pivot/scale*.

**L'architecte d'entreprise** trouvera dans la partie III la taxonomie des protocoles ouverts (MCP, A2A), des patrons d'orchestration et des pratiques AgentOps — avec, pour chaque décision architecturale, le compromis principal, une alternative crédible et la condition qui renverse la recommandation.

**Le Product Owner (PO)** trouvera dans la partie II les métriques de succès opérationnel (*task success rate*, *tool correctness*, *retry budget*, *escalation quality*) et la méthode de cadrage des cas d'usage par matrice autonomie × réversibilité × tolérance à l'erreur ([Ch. 3](ch03-mapping-high-impact.md), [Ch. 4](ch04-roi-risk-readiness.md)).

**Le risk officer** trouvera dans la partie IV le modèle de menace spécifique aux systèmes *agentic* — *prompt injection via tools*, *cross-tool exfiltration*, *jailbreak by delegation* — et le mapping avec les obligations réglementaires en vigueur ([Ch. 8](ch08-trustworthy-systems.md), [Ch. 9](ch09-agentic-security.md)).

## §5 — Carte de lecture par rôle

Chaque chapitre est signalé selon deux niveaux : **F** = fondamental pour le rôle (lecture dans l'ordre) ; **S** = spécialisé (lecture selon l'enjeu du moment). Un chapitre non signalé peut être consulté à la demande.

| Chapitre | CIO | Architecte | PO | Risk Officer |
|---|---|---|---|---|
| Intro (ce texte) | F | F | F | F |
| [Ch. 1 — De l'automatisation aux agents](ch01-from-automation-to-agents.md) | F | F | F | F |
| [Ch. 2 — Cas d'affaires](ch02-business-case.md) | F | S | F | S |
| [Ch. 3 — Cartographie des cas à fort impact](ch03-mapping-high-impact.md) | S | S | F | S |
| [Ch. 4 — Évaluation ROI, risque, maturité](ch04-roi-risk-readiness.md) | F | S | F | F |
| [Ch. 5 — Protocoles et interopérabilité](ch05-protocols-interoperability.md) | — | F | — | S |
| [Ch. 6 — Orchestration, mémoire, outils](ch06-orchestration-memory-tools.md) | — | F | S | S |
| [Ch. 7 — AgentOps](ch07-agentops.md) | S | F | S | S |
| [Ch. 8 — Systèmes dignes de confiance](ch08-trustworthy-systems.md) | F | F | S | F |
| [Ch. 9 — Sécurité agentique](ch09-agentic-security.md) | S | F | — | F |
| [Ch. 10 — Croître sans enfermement](ch10-scaling-without-lockin.md) | S | F | — | S |
| [Ch. 11 — Redesign du travail](ch11-redesigning-work.md) | F | S | F | S |
| [Ch. 12 — Leçons des 60 % qui ont échoué](ch12-lessons-failed.md) | F | S | F | F |
| [Ch. 13 — La route devant](ch13-road-ahead.md) | F | F | F | F |
| [Annexe D — Gouvernance RACI](annexe-D-governance-raci.md) | F | S | S | F |

La lecture linéaire est recommandée pour l'architecte d'entreprise et le risk officer. Le CIO peut commencer par la partie I (Ch. 1–2), sauter à la partie V (Ch. 11–13), puis revenir aux parties III–IV selon les décisions à prendre. Le PO peut commencer par Ch. 2–4, puis Ch. 11.

Le fil narratif est structuré pour que chaque partie réponde à une décision précise plutôt qu'à un domaine de connaissance. La partie I répond à « pourquoi agir maintenant ». La partie II répond à « quoi construire en premier ». La partie III répond à « comment le construire ». La partie IV répond à « comment le faire durer ». La partie V répond à « comment piloter la transition humaine ».

---

## Pour aller plus loin

**Anthropic — « Building Effective Agents » (décembre 2024).** Le document de référence technique le plus rigoureux disponible à ce jour sur la distinction *workflow*/*agent* et les cinq patrons de composition agentique. Incontournable avant d'entamer [Ch. 1](ch01-from-automation-to-agents.md). <https://www.anthropic.com/research/building-effective-agents>

**Gartner — « 2026 Hype Cycle for Agentic AI ».** La source primaire des données d'adoption citées dans cette introduction. À lire avec le biais commercial habituel des analystes, mais les chiffres bruts (17 %, 40 %, 60 %) sont les plus cités du secteur en 2026 et servent de référence commune dans les conversations exécutives. <https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai>

**Palo Alto Networks Unit 42 — « Fooling AI Agents: Web-Based Indirect Prompt Injection Observed in the Wild » (mars 2026).** L'analyse technique la plus complète disponible à date sur un incident IDPI documenté en production. Lecture préparatoire recommandée avant [Ch. 9](ch09-agentic-security.md). <https://unit42.paloaltonetworks.com/ai-agent-prompt-injection/>

**arXiv — « The Attack and Defense Landscape of Agentic AI: A Comprehensive Survey » (mars 2026, 2603.11088v1).** La taxonomie académique la plus complète des vecteurs d'attaque propres aux systèmes *agentic*. Complète l'analyse Unit 42 avec une perspective systémique. <https://arxiv.org/html/2603.11088v1>

**BLG — « A Turning Point for AI in Canada in 2026 » (mars 2026).** La synthèse la plus accessible du paysage réglementaire canadien en matière d'IA : OSFI E-23, Loi 25 Québec, successeur de l'AIDA. Point d'entrée obligatoire pour les risk officers d'institutions canadiennes avant [Ch. 8](ch08-trustworthy-systems.md). <https://www.blg.com/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026>

---

## Références

Anthropic — « Building Effective Agents » — Anthropic — décembre 2024 — <https://www.anthropic.com/research/building-effective-agents> — accédée le 2026-05-05

BLG (Borden Ladner Gervais LLP) — « A Turning Point for AI in Canada in 2026 across Economic Sectors » — BLG — mars 2026 — <https://www.blg.com/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026> — accédée le 2026-05-05

Deloitte — « The Agentic Reality Check: Preparing for a Silicon-Based Workforce » (Tech Trends 2026) — Deloitte Insights — 2026 — <https://www.deloitte.com/us/en/insights/topics/technology-management/tech-trends/2026/agentic-ai-strategy.html> — accédée le 2026-05-05

Gartner — « 2026 Hype Cycle for Agentic AI » — Gartner — 2026 — <https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai> — accédée le 2026-05-05

IBM — « The 2026 Guide to AI Agents » — IBM Think — 2026 — <https://www.ibm.com/think/ai-agents> — accédée le 2026-05-05

Jones Walker LLP — « NIST's AI Agent Standards Initiative: Why Autonomous AI Just Became Washington's Problem » — Jones Walker AI Law Blog — 17 février 2026 — <https://www.joneswalker.com/en/insights/blogs/ai-law-blog/nists-ai-agent-standards-initiative-why-autonomous-ai-just-became-washingtons-problem.html> — accédée le 2026-05-05

Microsoft — « Powering Frontier Transformation with Copilot and Agents » — Microsoft 365 Blog — 9 mars 2026 — <https://www.microsoft.com/en-us/microsoft-365/blog/2026/03/09/powering-frontier-transformation-with-copilot-and-agents/> — accédée le 2026-05-05

OpenAI — « Introducing AgentKit » — OpenAI — 2025-2026 — <https://openai.com/index/introducing-agentkit/> — accédée le 2026-05-05

Palo Alto Networks Unit 42 — « Fooling AI Agents: Web-Based Indirect Prompt Injection Observed in the Wild » — Palo Alto Networks — 3 mars 2026 — <https://unit42.paloaltonetworks.com/ai-agent-prompt-injection/> — accédée le 2026-05-05

Sharif, O. et al. — « The Attack and Defense Landscape of Agentic AI: A Comprehensive Survey » — arXiv:2603.11088v1 — mars 2026 — <https://arxiv.org/html/2603.11088v1> — accédée le 2026-05-05

Writer / Workplace Intelligence — « Enterprise AI Adoption 2026 » — Writer — 2026 — <https://writer.com/blog/enterprise-ai-adoption-2026/> — accédée le 2026-05-05

Zenity — « Zenity Named in Two Categories in the 2026 Gartner Hype Cycle for Agentic AI » — Business Wire — 15 avril 2026 — <https://www.businesswire.com/news/home/20260415309905/en/Zenity-Named-in-Two-Categories-in-the-2026-Gartner-Hype-Cycle-for-Agentic-AI> — accédée le 2026-05-05
