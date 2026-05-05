---
title: "Introduction — Why this book, why now"
chapter: "Introduction"
part: 0
status: "esquisse"
length_target_words: 2500
reading_time_min: 10
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archiver intégralement en Phase 3)

1. Anthropic — « Building Effective Agents » — décembre 2024 — https://www.anthropic.com/research/building-effective-agents — Source primaire définissant la distinction *workflow* (chemins prédéfinis) vs *agent* (LLM dirige dynamiquement ses propres processus et outils) ; taxonomy des cinq patrons de workflow + agent autonome ; principe de simplicité ("start with simple prompts").

2. Gartner — « 2026 Hype Cycle for Agentic AI » — 2026 — https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai — Position à la crête des attentes gonflées ; 17 % d'organisations en déploiement actuel, >60 % prévoyant de déployer dans les deux ans ; >40 % des projets agentiques abandonnés d'ici 2027 ; émergence de trois profils spécialisés : *agentic AI governance*, *agentic AI security*, *FinOps for agentic AI*.

3. Deloitte — « The agentic reality check: Preparing for a silicon-based workforce » (Tech Trends 2026) — 2026 — https://www.deloitte.com/us/en/insights/topics/technology-management/tech-trends/2026/agentic-ai-strategy.html — Concept de « silicon-based workforce » ; 15 % des décisions quotidiennes seront autonomes d'ici 2028 (Gartner via Deloitte) ; 33 % des applications d'entreprise incluront de l'agentique d'ici 2028 ; seulement 11 % en production aujourd'hui ; distinction copilot (assistance ponctuelle) vs agent (flux composite multi-domaine) ; recommandation : redesign vs automatisation des processus existants.

4. Writer / Workplace Intelligence — « Enterprise AI Adoption 2026 » — 2026 — https://writer.com/blog/enterprise-ai-adoption-2026/ — Enquête 2 400 répondants (1 200 employés non techniques, 1 200 C-suite) ; 54 % des C-suite déclarent que l'adoption de l'IA « déchire leur organisation » ; 79 % font face à des défis d'adoption ; seulement 23 % voient un ROI significatif des agents IA ; 36 % n'ont pas de plan formel de supervision des agents.

5. Palo Alto Networks Unit 42 — « Fooling AI Agents: Web-Based Indirect Prompt Injection Observed in the Wild » — 3 mars 2026 — https://unit42.paloaltonetworks.com/ai-agent-prompt-injection/ — Première documentation publique d'*indirect prompt injection* (IDPI) dans un système de revue publicitaire IA (déc. 2025) ; 22 techniques d'ingénierie de charge identifiées ; systèmes affectés : navigateurs, moteurs de recherche, processeurs de contenu, agents automatisés.

6. NIST — « AI Agent Standards Initiative » (Centre for AI Standards and Innovation) — 17 février 2026 — https://www.joneswalker.com/en/insights/blogs/ai-law-blog/nists-ai-agent-standards-initiative-why-autonomous-ai-just-became-washingtons-problem.html — Initiative formelle NIST en trois piliers : sécurité agent, interopérabilité, identité ; profil d'interopérabilité AI Agent prévu Q4 2026 ; s'appuie sur AI RMF existant + Cyber AI Profile (déc. 2025) + COSAiS à venir.

7. IBM — « The 2026 Guide to AI Agents » et « The trends that will shape AI and tech in 2026 » — 2026 — https://www.ibm.com/think/ai-agents — Définition IBM : agent IA = système capable d'exécuter des tâches de façon autonome en concevant son propre flux et en utilisant les outils disponibles ; système multi-agents = plusieurs agents coordonnés ; 2026 = passage des systèmes multi-agents du laboratoire à la production ; 70 % des systèmes multi-agents d'ici 2027 auront des agents à rôles étroits et spécialisés.

8. Microsoft — « Powering Frontier Transformation with Copilot and agents » (Microsoft 365 Blog) — 9 mars 2026 — https://www.microsoft.com/en-us/microsoft-365/blog/2026/03/09/powering-frontier-transformation-with-copilot-and-agents/ — Distinction explicite Microsoft : un *copilot* = assistant IA de productivité ponctuelle (« ask and answer ») ; un *agent* = outil spécialisé exécutant des processus métier définis (« delegate and verify ») ; Wave 3 de Copilot = bascule de l'assistance vers l'orchestration d'agents autonomes.

9. OpenAI — « Introducing AgentKit » — 2025-2026 — https://openai.com/index/introducing-agentkit/ — Transition de l'Assistants API (sunset 26 août 2026) vers les Agents SDK (mars 2025) ; primitives : *Handoffs* (transfert de contrôle), *Guardrails* (validation E/S), *Tracing* (observabilité) ; définition du système multi-agents : « multiple LLMs, each with their own tools and instructions, coordinating on a bigger task ».

10. BLG / Discrepancy AI — « AI in Canada in 2026 across economic sectors » — mars 2026 — https://www.blg.com/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026 — AIDA (Bill C-27) mort au feuilleton en janvier 2025 ; successeur attendu en 2026 ; OSFI Ligne directrice E-23 (et non E-21 — à vérifier, le prompt de mission mentionne E-21 mais les sources primaires ne confirment que E-23) en vigueur le 1er mai 2027 ; Loi 25 Québec pleinement en vigueur, impose des obligations strictes sur la prise de décision automatisée.

11. arXiv / Cloud Security Alliance — « The Attack and Defense Landscape of Agentic AI: A Comprehensive Survey » — mars 2026 — https://arxiv.org/html/2603.11088v1 — Taxonomie des vecteurs d'attaque propres aux systèmes agentiques : *prompt injection via tools*, *cross-tool exfiltration*, *jailbreak by delegation* ; gap temporel entre initiation et observation comme nouveau dimension de risque fondamental ; responsabilité distribuée dans la délégation orchestrateur → sous-agents.

12. Zenity / Business Wire — « Zenity Named in Two Categories in the 2026 Gartner Hype Cycle for Agentic AI » — 15 avril 2026 — https://www.businesswire.com/news/home/20260415309905/en/Zenity-Named-in-Two-Categories-in-the-2026-Gartner-Hype-Cycle-for-Agentic-AI — Confirmation indépendante de la publication du Gartner Hype Cycle for Agentic AI 2026 ; deux catégories visibles : sécurité et gouvernance agentique.
-->

## Esquisse

**(a) Thèse.** L'introduction défend que 2026 marque une rupture qualitative — et non une simple accélération — dans l'adoption de l'IA en entreprise : le passage du copilot (assistant réactif, boucle humain-dans-la-boucle permanente) au système agentique (boucle decide–act–observe avec mémoire, outils et délégation) crée une classe inédite de risques, de coûts et d'opportunités que ni les architectures d'entreprise actuelles ni les cadres de gouvernance existants ne sont dimensionnés pour absorber.

**(b) Question.** Pourquoi les organisations qui déploient de l'IA en 2026 échouent-elles massivement à en tirer de la valeur — et qu'est-ce qu'un architecte d'entreprise, un CIO, un PO ou un risk officer doit maîtriser pour faire partie du tiers qui réussit ?

**(c) Lecteur cible.** CIO : comprend pourquoi la rupture 2026 exige une révision de la stratégie data et gouvernance, pas seulement un nouveau budget logiciel. Architecte d'entreprise : comprend la taxonomie opérationnelle (agent, agentique, multi-agents) et les implications sur les patrons d'intégration. PO : comprend comment cadrer un cas d'usage agentique avec des critères de succès mesurables. Risk officer : comprend le modèle de menace spécifique aux systèmes agentiques et les obligations réglementaires émergentes (OSFI E-23, Loi 25 Québec, UE AI Act, NIST AI RMF Agentic Profile).

**(d) Renvois croisés prévus.** La boucle decide–act–observe → [ch01-from-automation-to-agents.md] ; unit economics et taux d'abandon → [ch02-business-case.md] ; modèle de menace agentique → [ch09-agentic-security.md] ; cadres réglementaires → [ch08-trustworthy-systems.md] ; carte de lecture par rôle → [annexe-D-governance-raci.md].

---

## Plan détaillé

### 1. La crête de 2026 : du copilot au système agentique
**Phrase-clé :** Entre 2024 et 2026, la nature même de l'outil IA a changé — d'un assistant répondant à des requêtes à un système exécutant des chaînes d'actions avec mémoire persistante, outils et délégation — et la majorité des organisations n'ont pas encore ajusté leur architecture ni leur gouvernance à cette bascule.

Contenu : données Gartner (17 % en déploiement, >60 % planifient, >40 % abandonnent d'ici 2027) ; données Writer/Workplace Intelligence (54 % du C-suite : « ça déchire notre organisation ») ; données Deloitte (seulement 11 % en production) ; incident EchoLeak (CVE-2025-32711, Microsoft 365 Copilot, juin 2025) et incident IDPI sur système de revue publicitaire IA (déc. 2025) comme illustrations concrètes de l'urgence.

### 2. Lexique opérationnel : trois termes, trois réalités distinctes
**Phrase-clé :** *AI agent*, *agentic AI* et *multi-agent system* ne sont pas interchangeables — les confondre est la principale cause d'échec de cadrage des projets en 2026.

Contenu : définitions primaires — Anthropic (*workflow* prédéfini vs *agent* dirigeant dynamiquement ses propres processus et outils), IBM (agent IA = autonomie + flux auto-conçu ; système multi-agents = coordination de plusieurs agents), OpenAI (transition Assistants API → Agents SDK ; handoff, guardrails, tracing), Microsoft (copilot = assistance ponctuelle « ask and answer » ; agent = exécution déléguée « delegate and verify »). Signaler la divergence : IBM définit *agentic AI* comme un système *incorporant* plusieurs agents différents en orchestration, là où Anthropic utilise *agentic* comme adjectif qualifiant tout système LLM semi-autonome (même à agent unique). Cette divergence n'est pas tranchée par les sources primaires — arbitrage humain requis pour le positionnement éditorial du livre.

### 3. Pourquoi maintenant : la convergence de quatre pressions simultanées
**Phrase-clé :** La rupture de 2026 n'est pas due à un seul modèle plus puissant, mais à la convergence de la maturité des protocoles ouverts (MCP, A2A), du passage en production des systèmes multi-agents, des premières obligations réglementaires opposables, et d'un marché du travail qui commence à se restructurer autour des agents.

Contenu : (1) convergence protocolaire — MCP donné à la Linux Foundation décembre 2025, A2A en production (renvoi ch05) ; (2) passage en production — IBM : 2026 = l'année où les systèmes multi-agents sortent du lab ; Gartner : 33 % des applications d'entreprise incluront de l'agentique d'ici 2028 ; (3) pression réglementaire — NIST AI Agent Standards Initiative (17 fév. 2026), OSFI E-23 (en vigueur 1er mai 2027), Loi 25 Québec (plein effet), AIDA successor attendu en 2026 ; (4) restructuration du travail — Deloitte : workforce hybride humain + « silicon-based workforce » ; Writer : 60 % des C-suite planifient des licenciements pour non-adoption, 66 % réduisent l'embauche entrée de gamme (à vérifier date exacte du rapport).

### 4. Ce que ce livre n'est pas — et pour qui il est conçu
**Phrase-clé :** Ce livre ne porte ni sur les fondements des LLM ni sur la mise en œuvre de prompts — il s'adresse aux décideurs et architectes qui doivent concevoir, déployer et gouverner des systèmes agentiques en production dans un contexte d'entreprise réel.

Contenu : positionnement explicite contre les introductions grand public au « AI agent » ; hypothèse implicite : le lecteur connaît déjà EDA, microservices, patrons d'intégration ; déclaration du niveau de densité attendu (matière à décider, pas à apprendre les bases). Court paragraphe par rôle : CIO (stratégie et gouvernance), architecte d'entreprise (patrons d'intégration et stack), PO (cadrage et métriques de succès), risk officer (modèle de menace et conformité).

### 5. Carte de lecture par rôle
**Phrase-clé :** Chaque rôle trouvera dans ce livre un parcours de lecture optimisé — certains chapitres sont obligatoires pour tous, d'autres sont à lire selon les responsabilités.

Contenu : tableau de lecture par rôle (CIO, architecte, PO, risk officer) × parties du livre (I à V) ; signalétique des chapitres « fondamentaux » vs « spécialisés » ; renvoi à l'Annexe D (RACI agentique) pour les responsabilités transversales. Ce tableau sera la porte d'entrée que chaque lecteur utilisera pour naviguer un ouvrage de 13 chapitres.

---

## Sources clés

| # | Source | Justification (Phase 3) |
|---|---|---|
| 1 | Anthropic — « Building Effective Agents » — https://www.anthropic.com/research/building-effective-agents | Seule définition primaire publiée par un éditeur majeur distinguant formellement *workflow* de *agent* ; fondement du lexique du §2. |
| 2 | Gartner — « 2026 Hype Cycle for Agentic AI » — https://www.gartner.com/en/articles/hype-cycle-for-agentic-ai | Données d'adoption et de prévision d'abandon les plus citées du secteur en 2026 ; ancre l'urgence du §1 et le titre du Ch. 2. |
| 3 | Deloitte — « Tech Trends 2026 : agentic reality check » — https://www.deloitte.com/us/en/insights/topics/technology-management/tech-trends/2026/agentic-ai-strategy.html | Concept « silicon-based workforce » et statistiques de déploiement réel (11 % en production) ; ancre §3 et §4. |
| 4 | Writer / Workplace Intelligence — « Enterprise AI Adoption 2026 » — https://writer.com/blog/enterprise-ai-adoption-2026/ | Enquête 2 400 répondants ; 54 % C-suite « déchirés » ; chiffre le plus saillant pour ouvrir l'introduction. |
| 5 | IBM — « The 2026 Guide to AI Agents » — https://www.ibm.com/think/ai-agents | Définition IBM de l'agent et du système multi-agents ; divergence avec Anthropic sur *agentic AI* à signaler explicitement en §2. |
| 6 | Microsoft — « Powering Frontier Transformation with Copilot and agents » — https://www.microsoft.com/en-us/microsoft-365/blog/2026/03/09/powering-frontier-transformation-with-copilot-and-agents/ | Distinction copilot vs agent la plus nette disponible d'un éditeur majeur ; ancre l'axe narratif « du copilot au système agentique ». |
| 7 | Palo Alto Networks Unit 42 — « Fooling AI Agents: Web-Based Indirect Prompt Injection Observed in the Wild » — https://unit42.paloaltonetworks.com/ai-agent-prompt-injection/ | Incident documenté IDPI (déc. 2025, pub. mars 2026) ; ancre l'urgence §1 ; renvoi Ch. 9. |
| 8 | NIST / Jones Walker — « AI Agent Standards Initiative » — https://www.joneswalker.com/en/insights/blogs/ai-law-blog/nists-ai-agent-standards-initiative-why-autonomous-ai-just-became-washingtons-problem.html | Initiative NIST formalisée fév. 2026 ; ancre §3 (pression réglementaire) ; renvoi Ch. 8. |
| 9 | BLG — « AI in Canada in 2026 across economic sectors » — https://www.blg.com/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026 | Source primaire canadienne sur AIDA successor, OSFI E-23, Loi 25 ; ancre §3 pour lecteur canadien. |
| 10 | arXiv — « The Attack and Defense Landscape of Agentic AI: A Comprehensive Survey » (2603.11088v1) — https://arxiv.org/html/2603.11088v1 | Taxonomie arXiv mars 2026 des vecteurs d'attaque agentiques ; ancre §1 (urgence sécurité) et prépare Ch. 9. |
