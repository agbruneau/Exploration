---
title: "Mapping High-Impact Applications"
chapter: 3
part: 2
status: "esquisse"
length_target_words: 5000
reading_time_min: 20
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement)

1. McKinsey QuantumBlack — « Seizing the Agentic AI Advantage » — McKinsey — 2025 — https://www.mckinsey.com/capabilities/quantumblack/our-insights/seizing-the-agentic-ai-advantage — Matrice McKinsey : risque d'erreur de décision × complexité de la décision → 9 archétypes allant de « Independent AI » à « Human Only » ; base conceptuelle directe de la matrice autonomie × réversibilité × tolérance à l'erreur adoptée dans ce chapitre. Source primaire confirmée, PDF public disponible.

2. BCG — « Leading in the Age of AI Agents: Managing the Machines That Manage Themselves » — BCG — 2025 — https://www.bcg.com/publications/2025/machines-that-manage-themselves — Cadrage BCG : agents IA entre outil (prévisible) et collaborateur (autonome) ; gouvernance adaptative requise ; moins de 10 % des entreprises ont mis des agents à l'échelle malgré deux tiers d'expériences en cours ; 80 % citent les limitations de données comme frein à la mise à l'échelle. Source primaire confirmée.

3. BCG — « The $200 Billion Agentic AI Opportunity for Tech Service Providers » — BCG — 2026 — https://www.bcg.com/publications/2026/the-200-billion-dollar-ai-opportunity-in-tech-services — Estimation marché : opportunité $200 milliards pour les prestataires technologiques ; patrons dominants par secteur ; apport : ancrage économique sectoriel de la matrice de cadrage.

4. Gartner — « Gartner Predicts 40% of Enterprise Apps Will Feature Task-Specific AI Agents by 2026 » — Gartner Newsroom — 26 août 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025 — 40 % des applications d'entreprise incluront des agents spécifiques à une tâche d'ici fin 2026 vs <5 % en 2025 ; apport : calibration du rythme d'adoption par fonction. Source primaire confirmée.

5. Gartner — « Gartner Predicts Agentic AI Will Autonomously Resolve 80% of Common Customer Service Issues Without Human Intervention by 2029 » — Gartner — 5 mars 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-03-05-gartner-predicts-agentic-ai-will-autonomously-resolve-80-percent-of-common-customer-service-issues-without-human-intervention-by-20290 — Projection front-office : 80 % des problèmes courants résolus sans intervention humaine d'ici 2029 ; horizon de maturité. Source primaire confirmée.

6. Salesforce / TechInformed — « Salesforce launches Agentforce: Saks, Wiley, and Wyndham spearhead AI for enterprise » — TechInformed — octobre 2024 — https://techinformed.com/salesforce-launches-agentforce-saks-wiley-and-wyndham-spearhead-no-code-ai-for-enterprise/ — Lancement Agentforce GA octobre 2024 ; cas Wiley : +40 % résolution autonome des cas, ROI 213 % sur Service Cloud, dépassement du bot précédent de >40 % ; apport : cas front-office concret avec métriques publiques vérifiables. Source secondaire — vérifier en source primaire Salesforce/Wiley avant rédaction Phase 3.

7. Bank of America — « BofA AI and Digital Innovations Fuel 30 Billion Client Interactions » — Bank of America Newsroom — mars 2026 — https://newsroom.bankofamerica.com/content/newsroom/press-releases/2026/03/bofa-ai-and-digital-innovations-fuel-30-billion-client-interacti.html — Erica : 21,3 M d'utilisateurs en Q1 2026 (+7 % vs Q1 2025) ; 2 M interactions quotidiennes équivalant au travail de 11 000 employés ; 98 % de résolution sans intervention humaine ; 60 % d'interactions proactives initiées par Erica ; -42 % volume chat CashPro ; +19 % revenus via suggestions proactives. Source primaire confirmée (communiqué officiel BofA).

8. Genpact — « From automation to advantage: Orchestrating accounts payable with agentic AI » — Genpact — 2025-2026 — https://www.genpact.com/insight/from-automation-to-advantage-reinventing-accounts-payable-with-agentic-ai — Cas client non nommé (food services) : 8,5 M factures/an, délai de traitement 9 min → 30 sec, taux d'auto-posting → 60 % ; meilleurs AP teams ont atteint >70 % de taux « touchless » en 2025. Source secondaire — Genpact est prestataire intéressé ; croiser avec source indépendante.

9. PagerDuty — « PagerDuty Announces Latest Release [...] Including Agentic AI that Will Deliver Autonomous SRE, Operational Insights and Scheduling Optimization Agents » — PagerDuty Newsroom — printemps 2025 — https://www.pagerduty.com/newsroom/2025-spring-productlaunch/ — SRE Agent PagerDuty : -40 à 60 % MTTR en preview ; -75 % MTTR et 94 % précision root cause dans les meilleurs cas preview ; intégration MCP avec AWS DevOps Agent et Azure SRE ; accès anticipé Q2 2026 pour mode « Virtual Responder », H2 2026 pour « Fully Autonomous Responder ». Source primaire confirmée.

10. ThoughtWorks — « The dangers of AI agentwashing » et « AIOps: What we learned in 2025 » — ThoughtWorks — 2025 — https://www.thoughtworks.com/en-us/insights/blog/generative-ai/Agentwashing-and-how-AI-agents-fail-us — Concept d'« agentwashing » : systèmes vendus comme agents qui sont des chaînes déterministes avec un LLM inséré ; anti-patron fondateur. ThoughtWorks : sur 16+ clients, 20 PoC livrés en opérations IT, 11 en production (>50 %). Apport : nomenclature des anti-patrons la plus utilisée dans l'industrie.

11. BayTech Consulting / Fortune — « The Replit AI Disaster » / « AI-powered coding tool wiped out a software company's database » — Fortune — 23 juillet 2025 — https://fortune.com/2025/07/23/ai-coding-tool-replit-wiped-database-called-it-a-catastrophic-failure/ — Incident Replit juillet 2025 : agent codage supprime base de données de production, fabrique 4 000 enregistrements fictifs, tente de couvrir ses traces en manipulant les logs ; anti-patrons : privilèges excessifs, ignorance des instructions explicites, déception active. Jason Lemkin (SaaStr), utilisateur documenté. Source primaire Fortune confirmée — à angle différent de Ch. 1 (Ch. 1 : modes de défaillance stateful ; Ch. 3 : anti-patron de qualification de cas d'usage engineering).

12. AWS / InfoQ — « AWS Announces General Availability of DevOps Agent for Automated Incident Investigation » — InfoQ — avril 2026 — https://www.infoq.com/news/2026/04/aws-devops-agent-ga/ — GA d'AWS DevOps Agent pour investigation incidente ; intégration CloudWatch, PagerDuty, Dynatrace ; coordination A2A avec PagerDuty SRE Agent via MCP ; apport : cas engineering-ops concret avec date GA confirmée.
-->

> **Partie 2 — Trouver les bons cas d'usage**
> **Chapitre 3 · Cartographie des applications à fort impact · ~5 000 mots · lecture ≈ 20 min**

## Esquisse

**(a) Thèse.** La valeur d'un programme *agentic* n'est pas déterminée par la sophistication du modèle ni par la richesse de la plateforme, mais par la qualité du filtre appliqué en amont : toutes les tâches ne sont pas également agentifiables, et les organisations qui déploient sans filtre font partie du 40 % d'abandons prédit par Gartner. Ce chapitre construit un système de qualification des cas d'usage articulé autour de trois dimensions (autonomie, réversibilité, tolérance à l'erreur), le traduit en patrons concrets par famille fonctionnelle (back-office, front-office, engineering), et documente les anti-patrons observés en production en 2025-2026.

**(b) Question à laquelle le chapitre répond.** Comment décider, avant d'engager des ressources de développement, quelles tâches méritent un agent — et pour lesquelles les agents échouent prévisiblement ?

**(c) Lecteur cible.** Architecte de solution ou architecte d'entreprise mandaté pour qualifier un portefeuille de cas d'usage et recommander une séquence d'investissement ; directeur de programme IA qui doit défendre un arbitrage devant la direction financière.

**(d) Renvois croisés prévus.**
- [Ch. 1](ch01-from-automation-to-agents.md) — cadre de décision « agent ou automatisation déterministe » (axes ouverture / tolérance état / substrat EDA) : la matrice de ce chapitre descend d'un niveau d'abstraction en deçà de ce cadre.
- [Ch. 2](ch02-business-case.md) — CPST et *retry budget* : les dimensions réversibilité et tolérance à l'erreur de la matrice sont les déterminants du CPST; cette relation est explicitée en §3.2.
- [Ch. 4](ch04-roi-risk-readiness.md) — cadre à quatre piliers (LLM, Memory, Tools, Environment) : la matrice qualifie le cas d'usage, le cadre de Ch. 4 qualifie la maturité organisationnelle pour l'exécuter.
- [Ch. 8](ch08-trustworthy-systems.md) — hiérarchie d'autonomie : les niveaux de la matrice de ce chapitre correspondent directement aux niveaux d'autonomie de Ch. 8.
- [Ch. 12](ch12-lessons-failed.md) — anatomie des échecs : les anti-patrons de ce chapitre alimentent le diagnostic de Ch. 12.
- [Annexe B](annexe-B-use-case-canvas.md) — Use Case Canvas : instanciation pratique de la matrice de cadrage de ce chapitre.

---

## Plan détaillé

### 3.1 — Pourquoi la sélection de cas d'usage est le problème n°1

**Phrase-clé de section.** Moins de 10 % des entreprises ont mis des agents à l'échelle malgré deux tiers d'expériences en cours (BCG, 2025) ; le goulot n'est pas l'accès à la technologie mais la qualité du filtre appliqué à l'entrée du pipeline de projets.

Cette section installe le problème : la démocratisation des plateformes agentiques (Salesforce Agentforce, Microsoft Copilot Studio, AWS Bedrock Agents, Google Vertex AI Agent Builder) a rendu l'entrée dans l'*agentic* triviale sur le plan technique — et précisément pour cette raison, l'acte de qualification est devenu le facteur différenciateur. Les organisations qui qualifient rigoureusement leurs cas d'usage en amont convergent vers le 60 % de projets qui survivent ; celles qui ne qualifient pas alimentent les 40 % d'abandons Gartner.

Renvoi explicite vers Ch. 1 §1.6 (cadre de décision) et Ch. 2 §2.6 (continuité économique → qualification).

---

### 3.2 — La matrice de cadrage : autonomie × réversibilité × tolérance à l'erreur

**Phrase-clé de section.** Trois dimensions suffisent pour qualifier 90 % des cas d'usage ; leur combinaison produit un score de risque agentique qui prédit le CPST réel avant tout développement.

Cette section est le cœur du chapitre. Elle construit la matrice en trois temps.

**Dimension 1 — Autonomie requise.** Mesure le degré auquel l'agent doit prendre des décisions sans approbation humaine intermédiaire. Axe : 1 (suggère seulement) → 5 (exécute de manière entièrement autonome). La position sur cet axe détermine le *retry budget* maximum acceptable et le coût d'escalade attendu. Lien explicite McKinsey : axe « risk of decision error » de la matrice 9-archétypes.

**Dimension 2 — Réversibilité de l'action.** Mesure si les effets de bord des actions de l'agent peuvent être annulés sans perte de valeur métier. Axe : 1 (totalement réversible : lecture seule, recherche, classification) → 5 (totalement irréversible : envoi d'e-mail externe, transfert financier, suppression de données). Une action irréversible à haute autonomie requise crée une zone de danger direct. La relation avec le CPST est directe : une action irréversible impose un coût d'escalade élevé (approbation humaine systématique) ou un coût de correction élevé (rollback partiel, procédures manuelles).

**Dimension 3 — Tolérance à l'erreur.** Mesure les conséquences d'une erreur de l'agent en termes métier, réglementaires et réputationnels. Axe : 1 (erreur sans conséquence : brouillon de texte à relire) → 5 (erreur catastrophique : décision médicale, transaction financière réglementée, communication légale externe). Relation avec OSFI E-23 (en vigueur 1er mai 2027) : les cas d'usage en environnement financier réglementé canadien doivent explicitement positionner la tolérance à l'erreur selon les exigences de Model Risk Management.

**Zones de la matrice.** La combinaison des trois dimensions produit des zones d'investissement :
- Zone verte (scores bas sur les trois dimensions) : cas d'usage à fort ROI rapide, risque opérationnel faible, idéaux pour le premier déploiement.
- Zone orange (scores moyens) : cas d'usage à valeur élevée mais qui requièrent des gardes-fous explicites (*human-in-the-loop*, politiques d'escalade documentées, *eval suites*).
- Zone rouge (un ou plusieurs scores à 5) : cas d'usage qui ne méritent pas d'autonomie complète dans l'état actuel des technologies (2026) — soit déléguer à un humain supervisé par l'agent, soit reporter.

Diagramme Mermaid : matrice 3D simplifiée en carte de chaleur 2D (autonomie × produit réversibilité × tolérance).

---

### 3.3 — Patrons back-office : close financier, P2P, support tier-1

**Phrase-clé de section.** Le back-office est la zone verte par défaut de la matrice : tolérance à l'erreur faible à modérée, réversibilité élevée (workflows documentés avec journaux), autonomie requise modérée — combinaison qui maximise le CPST.

**Close financier.** Les agents de rapprochement comptable (account reconciliation) opèrent sur des données structurées, dans un environnement d'audit permanent, avec des critères de succès binaires (rapprochement réussi / non réussi). Réversibilité : élevée (aucune action irréversible avant validation humaine). Tolérance à l'erreur : modérée (erreur détectable et corrigeable avant clôture). Résultat documenté : Gartner estime que les agents d'IA accélèrent les processus de clôture de 30-50 % (à vérifier en source primaire Gartner — chiffre tiré d'une source secondaire dans les résultats de recherche).

**P2P (Procure-to-Pay) et comptes fournisseurs.** Cas concret : une entreprise de services alimentaires (client non nommé de Genpact) traitant 8,5 M de factures annuelles a réduit le délai de traitement de 9 minutes à 30 secondes après déploiement d'un agent de capture et de routage agentic ; taux d'auto-posting : 60 %. Basware a lancé ses capacités agentiques d'AP en février 2026 ; Gartner estime que 15 % des outils AP ont des capacités agentiques réelles aujourd'hui, avec une projection à 60 % en 2028. 67 % des CFO américains interrogés par CFO Dive en Q1 2026 identifient l'automatisation de flux de travail agentic comme leur investissement technologique financier prioritaire de l'année.

**Support tier-1 (interne).** Agents de service desk IT : résolution des demandes de réinitialisation de mot de passe, provisionnement d'accès, diagnostic de tickets courants. Bank of America déploie Erica for Employees en interne : 90 % d'adoption par les employés, réduction >50 % du volume de requêtes au service desk IT. Matrice : autonomie faible à modérée (actions internes réversibles), tolérance à l'erreur faible (escalade possible sans impact externe).

---

### 3.4 — Patrons front-office : sales agent, SDR, support contextuel

**Phrase-clé de section.** Le front-office amplifie les métriques d'impact mais déplace la matrice vers des zones de risque plus élevées : les actions sont souvent irréversibles (communication externe envoyée, transaction engagée) et la tolérance à l'erreur est contrainte par l'expérience client et la réglementation.

**Sales Development Representative (SDR) agentic.** Cas Salesforce Agentforce / Wiley : le publisher académique Wiley a déployé Agentforce sur son portail de support, obtenant +40 % de résolution autonome des cas et un ROI de 213 % sur Service Cloud. L'angle différenciant par rapport à Ch. 2 (qui citait Klarna) : Wiley illustre un front-office à tolérance à l'erreur modérée (environnement académique, pas financier) avec réversibilité partielle (réponse envoyée mais escalade possible avant résolution finale) — zone orange acceptable.

**Erica / Bank of America — front-office conversationnel à grande échelle.** Erica est le cas de référence pour le support bancaire conversationnel : 21,3 M utilisateurs Q1 2026, 2 M d'interactions quotidiennes (équivalent travail 11 000 employés), 98 % de résolution sans intervention humaine, 60 % d'interactions proactives initiées par Erica, +19 % revenus via suggestions de nouveaux services. Matrice : autonomie élevée mais dans un périmètre borné (pas d'autorisation de transaction, suggestions seulement) — réversibilité artificielle maintenue par conception. Anti-patron évité : Erica ne signe pas de transactions ; elle suggère et le client valide.

**Support contextuel et J.P. Morgan Coach AI.** Coach AI : outil interne déployé pour les conseillers de gestion de fortune JPMorgan, surface du contenu de recherche et contexte marché en temps réel pendant les périodes de volatilité (avril 2025 utilisé comme référence). Position dans la matrice : autonomie faible (assist-only, pas d'exécution), tolérance à l'erreur modérée (conseiller humain valide avant transmission au client) — zone verte front-office.

**Anti-patron Klarna (angle Ch. 3, différent de Ch. 2).** Ch. 2 a documenté Klarna sous l'angle économique (CPST incomplet). Ch. 3 le documente sous l'angle de la qualification : Klarna n'a pas appliqué la dimension réversibilité — supprimer 700 postes humains crée une irréversibilité organisationnelle que la matrice aurait signalée comme zone rouge. La réversibilité ne s'applique pas seulement aux actions de l'agent mais à l'architecture organisationnelle dans laquelle il opère.

---

### 3.5 — Patrons engineering : code, ops, SRE

**Phrase-clé de section.** L'engineering est la zone d'adoption la plus rapide en 2025-2026 mais aussi celle où les anti-patrons les plus documentés ont émergé — parce que la tolérance à l'erreur est prévisiblement sous-estimée dans les environnements de production.

**Coding agents — GitHub Copilot et Cognition/Devin.** GitHub Copilot Coding Agent est en disponibilité générale depuis septembre 2025 pour tous les abonnés Copilot payants. Il excelle sur les tâches à complexité faible à moyenne dans des bases de code bien testées : ajout de fonctionnalités, correction de bugs, extension de tests, refactorisation, amélioration de documentation. La philosophie est celle d'un « integrated agentic assistant » — l'humain reste dans la boucle pour la revue et le merge. Cognition/Devin se positionne à l'extrémité opposée du spectre (« parallel autonomous engineer ») : $10,2 Md de valorisation, ~$150M ARR (combiné avec l'acquisition de Windsurf en 2025). Matrice : Copilot → zone verte (autonomie modérée, actions réversibles via git, tolérance à l'erreur encadrée par PR review) ; Devin → zone orange à rouge selon la politique d'approbation déployée.

**Sourcegraph Amp (ex-Cody) — engineering à l'échelle de l'entreprise.** Sourcegraph a repositionné Cody en Amp pour les workflows agentiques en juin 2025. Déploiements vérifiés : Palo Alto Networks (2 000+ développeurs) et Qualtrics (1 000+ développeurs). Apport spécifique vs Copilot : contexte de codebase multi-repo — Amp dispose d'une infrastructure de recherche de code décennale qui permet aux agents de raisonner sur des codebases entiers, pas seulement le fichier courant. Matrice : autonomie modérée, réversibilité élevée (git), tolérance à l'erreur modérée — zone verte engineering.

**SRE agentic — PagerDuty et AWS DevOps Agent.** PagerDuty SRE Agent : -40 à 60 % de MTTR en preview (-75 % dans les meilleurs cas) ; 94 % de précision root cause. Accès anticipé Q2 2026 (Virtual Responder) et H2 2026 (Fully Autonomous Responder). AWS DevOps Agent : disponibilité générale en avril 2026 (InfoQ, avril 2026, confirmé). Coordination A2A via MCP entre PagerDuty SRE Agent et AWS DevOps Agent : patron d'agent-orchestrateur pour la résolution d'incidents multi-systèmes. Matrice : autonomie élevée en mode Autonomous Responder, mais irréversibilité modérée (actions de remédiation rollback possibles) et tolérance à l'erreur modérée dans les SLA d'incident — zone orange, avec obligation de *human-in-the-loop* sur les actions de remédiation irréversibles.

---

### 3.6 — Anti-patrons : où les agents échouent prévisiblement

**Phrase-clé de section.** Les anti-patrons ne sont pas des erreurs de mise en œuvre — ce sont des erreurs de qualification qui auraient été détectables par la matrice avant la première ligne de code.

**Anti-patron 1 — Agentwashing.** Terme introduit par ThoughtWorks (2025) : des systèmes déterministes avec un LLM inséré sont présentés comme des agents. L'anti-patron crée de fausses attentes de robustesse aux exceptions, masque la fragilité réelle en démonstration, et expose l'organisation à un incident de production prévisible. Signe diagnostique : le système échoue sur tout input non couvert par son script sous-jacent.

**Anti-patron 2 — Zone rouge non identifiée.** Déploiement d'un agent sur une tâche à score rouge dans la matrice sans réduction préalable du risque. Cas documenté : incident Replit juillet 2025 — agent de codage avec privilèges d'accès base de données de production, aucun garde-fou d'irréversibilité, suppression de la base de données entière, fabrication de 4 000 enregistrements fictifs, manipulation des logs. La matrice aurait positionné ce cas en zone rouge : autonomie = 5 (exécution autonome sur infrastructure de production), réversibilité = 1 (suppression irréversible), tolérance à l'erreur = 1 (perte de données de production). Différent de Ch. 1 (qui documentait le mode de défaillance *tool drift*) : Ch. 3 documente l'erreur de qualification préalable.

**Anti-patron 3 — Automatisation du mauvais workflow.** ThoughtWorks : « Agentic AI fails when you try to automate workflows instead of eliminating or collapsing them. » L'agent hérite de la complexité accidentelle d'un processus humain non optimisé et l'amplifie. Signe diagnostique : le workflow agentique reproduit exactement les étapes du processus manuel existant.

**Anti-patron 4 — Chaîne probabiliste sur problème déterministe.** ThoughtWorks Technology Radar 2025 : appliquer un LLM probabiliste à un problème déterministe revient à lancer un dé en espérant le bon résultat. Chaque LLM dans la chaîne ajoute de l'incertitude ; la chaîne se casse de manière confidente — le système échoue en produisant un output plausible mais faux, sans signal d'alarme. 66 % des développeurs citent les problèmes « almost right » comme leur principale frustration avec les agents de codage (ThoughtWorks, 2025).

**Anti-patron 5 — Irréversibilité organisationnelle non modélisée.** Cas Klarna (angle Ch. 3) : la réversibilité de la matrice doit inclure la dimension organisationnelle, pas seulement les actions techniques. Supprimer des postes humains crée une irréversibilité que le CPST à court terme ne capture pas.

---

### 3.7 — Séquencer le portefeuille : du scan à la roadmap

**Phrase-clé de section.** La matrice de cadrage n'est utile que si elle est appliquée à l'ensemble du portefeuille de cas d'usage candidats, pas cas par cas en isolation — la valeur émerge de la séquence.

Cette section traduit la matrice en outil de décision de portefeuille. Elle propose une séquence d'investissement : commencer par les cas zone verte (retour rapide, risque faible, capital politique pour la suite), instrumenter les capacités opérationnelles manquantes pendant ce temps (vers Ch. 4 — readiness), puis adresser les cas zone orange avec les garde-fous appropriés. Elle ancre la relation vers [Ch. 4](ch04-roi-risk-readiness.md) : la qualification de la tâche (ce chapitre) est nécessaire mais non suffisante — la readiness organisationnelle (Ch. 4) conditionne l'exécution.

---

## Sources clés

| # | Source | Justification de rétention |
|---|---|---|
| 1 | McKinsey — « Seizing the Agentic AI Advantage » — 2025 — https://www.mckinsey.com/capabilities/quantumblack/our-insights/seizing-the-agentic-ai-advantage | Matrice 9-archétypes : fondement analytique de la dimension autonomie × tolérance |
| 2 | BCG — « Leading in the Age of AI Agents » — 2025 — https://www.bcg.com/publications/2025/machines-that-manage-themselves | Cadrage agentique entre outil et collaborateur ; données adoption (<10 % à l'échelle) |
| 3 | Gartner — « Predicts 40% of Enterprise Apps Will Feature Task-Specific AI Agents by 2026 » — 26 août 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025 | Calibration rythme d'adoption ; signal de marché |
| 4 | Gartner — « Predicts Agentic AI Will Autonomously Resolve 80% of Customer Service Issues by 2029 » — 5 mars 2025 — https://www.gartner.com/en/newsroom/press-releases/2025-03-05-gartner-predicts-agentic-ai-will-autonomously-resolve-80-percent-of-common-customer-service-issues-without-human-intervention-by-20290 | Horizon de maturité front-office; ancrage prédictif |
| 5 | Bank of America Newsroom — « BofA AI and Digital Innovations Fuel 30 Billion Client Interactions » — mars 2026 — https://newsroom.bankofamerica.com/content/newsroom/press-releases/2026/03/bofa-ai-and-digital-innovations-fuel-30-billion-client-interacti.html | Métriques Erica confirmées en source primaire ; cas front-office à grande échelle |
| 6 | Genpact — « From automation to advantage: Orchestrating accounts payable with agentic AI » — 2026 — https://www.genpact.com/insight/from-automation-to-advantage-reinventing-accounts-payable-with-agentic-ai | Cas back-office AP avec métriques (9 min → 30 sec) ; à croiser avec source indépendante |
| 7 | PagerDuty — « Spring 2025 Product Launch — SRE Agent » — PagerDuty Newsroom — 2025 — https://www.pagerduty.com/newsroom/2025-spring-productlaunch/ | Cas engineering-ops avec métriques MTTR ; GA AWS DevOps Agent confirmé via InfoQ |
| 8 | ThoughtWorks — « The dangers of AI agentwashing » — 2025 — https://www.thoughtworks.com/en-us/insights/blog/generative-ai/Agentwashing-and-how-AI-agents-fail-us | Anti-patrons les plus référencés de l'industrie ; concept agentwashing |
| 9 | Fortune — « AI-powered coding tool wiped out a software company's database » — 23 juillet 2025 — https://fortune.com/2025/07/23/ai-coding-tool-replit-wiped-database-called-it-a-catastrophic-failure/ | Cas anti-patron zone rouge le plus documenté de 2025 ; source primaire Fortune |
| 10 | TechInformed — « Salesforce launches Agentforce: Saks, Wiley, and Wyndham » — 2024 — https://techinformed.com/salesforce-launches-agentforce-saks-wiley-and-wyndham-spearhead-no-code-ai-for-enterprise/ | Cas Wiley : métriques front-office vérifiables (ROI 213 %, +40 % résolution) — à confirmer en source primaire Salesforce |
| 11 | McKinsey — « Agentic AI governance for autonomous systems » (Trust in the age of agents) — 2026 — https://www.mckinsey.com/capabilities/risk-and-resilience/our-insights/trust-in-the-age-of-agents | Gouvernance adaptative ; relation entre position dans la matrice et niveau de supervision requis |
