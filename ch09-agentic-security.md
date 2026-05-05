---
title: "Agentic Security"
chapter: 9
part: 4
status: "esquisse"
length_target_words: 6000
reading_time_min: 24
last_updated: "2026-05-05"
---

<!--
## Notes de recherche — Phase 2 (archivé intégralement — 12 sources)

1. OWASP GenAI Security Project — « OWASP Top 10 for Agentic Applications for 2026 » — décembre 2025 — https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/ — Liste ASI01 à ASI10 peer-reviewée par 100+ experts. ASI01 Agent Goal Hijack (redirection des objectifs via injection), ASI02 Tool Misuse & Exploitation (chaînes d'outils non sécurisées), ASI03 Agent Identity & Privilege Abuse (exploitation de la délégation de confiance), ASI04 Agentic Supply Chain Compromise (agents, plugins, registres tiers compromis), ASI05 Unexpected Code Execution, ASI06 Memory & Context Poisoning (corruption RAG/mémoire épisodique), ASI07 Insecure Inter-Agent Communication (spoofing A2A), ASI08 Cascading Failures, ASI09 Human-Agent Trust Exploitation, ASI10 Rogue Agents. Distinct du LLM Top 10 v2 (orienté modèle unique) : la liste Agentic se concentre sur les risques propres à l'autonomie, l'intégration d'outils, la coordination multi-agents, et l'état persistant. Apport : taxonomie de référence pour le modèle de menace du chapitre ; nomenclature ASI à adopter.

2. OWASP GenAI Security Project — « Agentic AI — Threats and Mitigations » v1.1 — février 2025, mise à jour synchronisée décembre 2025 — https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/ — Premier document de taxonomie des menaces agentiques publié (avant le Top 10). Couvre le cycle de vie complet : threat modelling, développement sécurisé, gouvernance, paysage produit. Référencé par AWS et Microsoft dans leurs propres documentations sécurité. Apport : fond conceptuel derrière le Top 10 ; permet de situer *prompt injection via tools*, *cross-tool exfiltration*, et *jailbreak by delegation* dans la taxonomie OWASP.

3. NVD / Aim Security — « CVE-2025-32711 (EchoLeak) — Microsoft 365 Copilot » — patch juin 2025 — https://nvd.nist.gov/vuln/detail/cve-2025-32711 — Première exploitation zero-click documentée dans un système LLM de production. CVSS 9.3 (critique). Mécanisme : *LLM Scope Violation* — contenu masqué dans un courriel Outlook (champ invisible, métadonnées) contient des instructions d'injection de prompt ; Copilot les exécute sans interaction utilisateur et exfiltre contenu OneDrive, SharePoint, Teams, Outlook dans le périmètre de contexte. Découvert par Aim Labs (Aim Security), divulgué de façon responsable à Microsoft, patché côté serveur (aucune action utilisateur requise). Aucune exploitation malveillante confirmée dans la nature. Apport : incident concret *cross-tool exfiltration* de niveau production, avec CVE traçable. Confirme que l'injection indirecte via le contenu ingéré par l'agent (pas via prompt utilisateur direct) est la classe de risque dominante en 2025-2026.

4. arXiv:2509.10540 — Amit et al. / Aim Security — « EchoLeak: The First Real-World Zero-Click Prompt Injection Exploit in a Production LLM System » — septembre 2025 — https://arxiv.org/abs/2509.10540 — Analyse technique complète de CVE-2025-32711. Formalise la notion de *LLM Scope Violation* : le modèle ne distingue pas le contenu de confiance (instructions système) du contenu non fiable (contenu utilisateur ingéré) lorsque celui-ci est présent dans la fenêtre de contexte. Démontre que l'agent peut être contraint d'agir sur des instructions encodées dans des données qu'il traite, sans que l'utilisateur ait initié d'action explicite. Apport : source académique primaire sur EchoLeak ; fonde la distinction injection directe vs indirecte dans le modèle de menace.

5. arXiv:2504.16489 — « Amplified Vulnerabilities: Structured Jailbreak Attacks on LLM-based Multi-Agent Debate » — avril 2025 — ICLR 2026 Workshop on Agents in the Wild — https://arxiv.org/abs/2504.16489 — Démontre que les systèmes multi-agents de type *debate* (où plusieurs LLM débattent pour converger) amplifient les attaques de jailbreak : un agent compromis injecte des instructions malveillantes dans le flux de délégation, et la propagation à travers les tours de dialogue atteint d'autres agents. Les cadres MAD (*multi-agent debate*) testés (quatre frameworks) présentent tous des vulnérabilités au *jailbreak by delegation* via modification des descriptions de tâche inter-agents. Apport : papier académique primaire sur *jailbreak by delegation* ; mécanisme de propagation multi-hop formalisé.

6. arXiv:2505.02077 — « Open Challenges in Multi-Agent Security: Towards Secure Systems of Interacting AI Agents » — mai 2025 — https://arxiv.org/html/2505.02077 — Synthèse des défis ouverts en sécurité des systèmes multi-agents : (1) absence de frontières d'authentification entre agents (*trust-authorization mismatch*) ; (2) propagation de prompts compromis à travers des chaînes de délégation de confiance (*cascading jailbreaks*) ; (3) effets de réseau qui amplifient les vulnérabilités à l'échelle. Formalise la notion d'*orchestrateur comme mécanisme d'exécution* d'un DAG de dépendances pour défendre contre les menaces de coordination. Apport : cadre conceptuel pour la défense en profondeur multi-agents ; base théorique du modèle de menace agentique.

7. NCCoE / NIST — « Accelerating the Adoption of Software and AI Agent Identity and Authorization » (Concept Paper) — 5 février 2026 — https://www.nccoe.nist.gov/news-insights/new-concept-paper-identity-and-authority-software-agents — PDF : https://www.nccoe.nist.gov/sites/default/files/2026-02/accelerating-the-adoption-of-software-and-ai-agent-identity-and-authorization-concept-paper.pdf — Concept paper NCCoE publié pour commentaires publics (délai : 2 avril 2026). Aborde l'identité des agents au-delà des clés API : comment les agents doivent être identifiés dans les architectures d'entreprise, ce que constitue une authentification robuste pour un agent IA, et pourquoi les comptes de service partagés sont insuffisants. Recommande une identité de niveau enterprise avec gestion du cycle de vie et autorisation *least-privilege* by design. Lien avec NIST SP 800-207 (Zero Trust Architecture). Apport : source primaire NIST sur l'identité d'agent ; pilier identité du NIST AI Agent Standards Initiative (Ch. 5 §5.8 avait documenté les piliers interopérabilité et sécurité — ici le pilier identité est précisé).

8. Microsoft — « Announcing Microsoft Entra Agent ID: Secure and manage your AI agents » — Microsoft Entra Blog — 2025-2026 — https://techcommunity.microsoft.com/blog/microsoft-entra-blog/announcing-microsoft-entra-agent-id-secure-and-manage-your-ai-agents/3827392 — Microsoft Entra Agent ID : identités dédiées pour agents IA (distinct des comptes de service utilisateur). Authentification par *Federated Identity Credentials* (FIC) — pas de mots de passe, pas de secrets. Politiques d'accès adaptatives, détection de risque en temps réel, gouvernance du cycle de vie. *Agent identity blueprints* : modèles parent-enfant pour déployer des politiques cohérentes à grande échelle. Intégration Azure AI Foundry et Microsoft 365 Copilot. Apport : implémentation de référence de l'identité vérifiable d'agents chez un hyperscaleur ; illustration concrète de *least-privilege* dynamique par design.

9. AWS — « Introducing Amazon Bedrock AgentCore Identity: Securing agentic AI at scale » — AWS Security Blog — https://aws.amazon.com/blogs/machine-learning/introducing-amazon-bedrock-agentcore-identity-securing-agentic-ai-at-scale/ — AgentCore Identity (powered by Amazon Cognito) : gestion d'identité et de credentials spécifique aux agents et aux flux automatisés. *Token vault* pour sécuriser les tokens OAuth 2.0 des utilisateurs délégués. Intégration native AWS Secrets Manager. Rôles IAM fins par composant AgentCore, avec ARNs spécifiques aux ressources (*least privilege* opérationnel). Principe : les credentials utilisateur ne circulent jamais dans le prompt — ils sont injectés programmatiquement par le runtime au moment de l'exécution de l'outil. Note de sécurité indépendante (Sonrai Security, 2025-2026) : chemin de privilege escalation documenté dans AgentCore via mauvaise configuration SCPs — à confirmer en source primaire AWS. Apport : contrepartie AWS de Microsoft Entra Agent ID ; pattern *token vault* pour la délégation OAuth.

10. IETF / NIST — Drafts OAuth 2.1 pour agents — 2025-2026 — https://datatracker.ietf.org/doc/draft-ietf-oauth-v2-1/ + https://www.ietf.org/archive/id/draft-patwhite-aauth-00.html + https://www.ietf.org/archive/id/draft-goswami-agentic-jwt-00.html — (a) OAuth 2.1 (draft-ietf-oauth-v2-1) : consolidation OAuth 2.0, PKCE obligatoire, rotation des refresh tokens, suppression du flux implicite. *Tool-level scopes* : granularité permettant « lecture contacts Salesforce » sans « création/suppression ». (b) AAuth (draft-patwhite-aauth-00) : extension OAuth 2.1 pour clients agents confidentiels — consentement de l'utilisateur final via HTTP polling, SSE ou WebSocket. (c) Agentic JWT (draft-goswami-agentic-jwt-00) : extension JWT OAuth 2.0 pour l'autorisation des systèmes agentiques autonomes (*zero-trust drift*). RFC 9700 (Best Current Practice OAuth 2.0 Security) : référence de sécurité actuelle. Apport : état de l'art des proposals IETF sur l'identité agentique ; fondement réglementaire du *per-task token* et du *least-privilege* dynamique.

11. Maxim AI / AI Security in Practice — « Guardrails Engineering: Bedrock Guardrails vs NeMo Guardrails vs Lakera Guard » + « Top 5 AI Guardrails Platforms 2026 » — 2026 — https://www.aisecurityinpractice.com/defend-and-harden/guardrails-engineering/ + https://www.getmaxim.ai/articles/top-5-ai-guardrails-platforms-for-responsible-enterprise-ai-in-2026/ — Panorama des plateformes de guardrails en 2026 : (a) Llama Guard 4 (Meta, 12B paramètres multimodaux, MLCommons hazards taxonomy, pruned from Llama 4 Scout MoE → dense) : filtre I/O, texte + images ; (b) NeMo Guardrails (NVIDIA, open-source, middleware en Colang entre app et LLM, *topical*, *fact-checking*, *jailbreak rails*) ; (c) Anthropic Constitutional Classifiers (classificateurs entraînés sur données synthétiques dérivées d'une constitution NLP, défense contre *universal jailbreaks*, live demo fév. 2025) ; (d) Microsoft Azure AI Content Safety + Prompt Shield (détection injection indirecte via documents récupérés, intégration Azure OpenAI) ; (e) AWS Bedrock Guardrails (6 politiques : content moderation, prompt attack detection, topic classification, PII redaction, hallucination detection, custom word filters ; cross-provider). Divergence documentée : efficacité des guardrails contre les attaques adaptatives — méta-analyse de 78 études (2021-2026) rapporte un taux de succès > 85 % des stratégies d'attaque adaptative contre les défenses état de l'art — à traiter comme borne supérieure du risque résiduel, pas comme invalidation des guardrails. Apport : inventaire complet et versions 2025-2026 de tous les guardrails cités dans le périmètre.

12. Northflank / Modal / E2B — « Top AI sandbox platforms in 2026 » + « AI Agent Sandboxing Guide: Firecracker, gVisor, runtimes » — 2026 — https://northflank.com/blog/top-ai-sandbox-platforms-for-code-execution + https://manveerc.substack.com/p/ai-agent-sandboxing-guide — Technologies d'isolation : (a) Firecracker microVMs (AWS open-source) : frontière hardware-level VM, noyau séparé par sandbox, 150 ms de démarrage (E2B) ; (b) gVisor (Google) : espace utilisateur kernel, interception des syscalls, plus fort que les conteneurs standard (Modal) ; (c) Kata Containers : VM légères compatibles OCI (Northflank). Plateformes 2026 : E2B (Firecracker, 200M+ sandboxes démarrés, Fortune 100), Daytona (Docker, 90 ms cold start), Modal (gVisor), Northflank (Kata/gVisor, 2M+ workloads/mois, durée de session illimitée). Émergence des sandboxes spécialisés comme catégorie distincte des frameworks agents. Apport : inventaire des runtimes de sandboxing pour agents en 2026 ; distinction des niveaux d'isolation (conteneur Docker < gVisor < Firecracker microVM).
-->

## Esquisse

**a) Thèse.** La sécurité d'un système *agentic* d'entreprise ne se réduit pas à la sécurité du modèle de langage sous-jacent : c'est une propriété de l'architecture dans son ensemble, qui exige un modèle de menace propre aux agents (distinct du modèle de menace des API ou des LLM passifs), un régime d'identité et d'accès conçu pour la délégation dynamique et le *least privilege* par tâche, et une défense en profondeur à trois couches — guardrails de contenu, sandboxing d'exécution, kill switches opérationnels. Les vecteurs d'attaque les plus graves de 2025-2026 (EchoLeak CVE-2025-32711, jailbreak par délégation multi-hop, supply chain des registres MCP) partagent une caractéristique commune : ils exploitent la confiance implicite que l'agent accorde au contenu qu'il ingère ou aux agents avec lesquels il collabore — et aucun d'eux ne peut être neutralisé par un seul mécanisme de défense.

**b) Question.** Comment concevoir un système *agentic* d'entreprise dont la posture de sécurité résiste aux vecteurs d'attaque propres aux agents (injection indirecte, exfiltration cross-tool, jailbreak par délégation, empoisonnement de la supply chain) sans rendre le système opérationnellement paralysé par les contrôles ?

**c) Lecteur cible.** Architecte de solution senior qui doit spécifier le modèle de sécurité d'un déploiement *agentic* en production ; responsable sécurité (CISO ou RSSI) qui évalue la posture de risque d'un projet agentique ; équipe de sécurité applicative qui implémente les contrôles de défense en profondeur.

**d) Renvois croisés prévus.**
- [Ch. 5 §5.8](ch05-protocols-interoperability.md) — surface d'attaque protocolaire MCP déjà établie (tool poisoning, sampling injection, RCE by design OX Security, supply chain registres) — ce chapitre ne duplique pas §5.8 mais construit sur lui : le modèle de menace agentique élargit le périmètre à l'exécution multi-agents et à l'exfiltration cross-tool.
- [Ch. 7 §7.4](ch07-agentops.md) — plan de contrôle AgentOps (kill switches, retry budgets, permission boundaries) réutilisé ici comme couche opérationnelle de la défense en profondeur.
- [Ch. 4 §4.1](ch04-roi-risk-readiness.md) — matrice réversibilité × tolérance à l'erreur : calibre le niveau de sandboxing requis par cas d'usage.
- [Annexe A](annexe-A-architecture-review.md) — checklist de revue architecturale sécurité/observabilité : section sécurité agentique.
- [Annexe D](annexe-D-governance-raci.md) — RACI gouvernance : qui détient l'autorité d'activer un kill switch.

---

## Plan détaillé

### §9.0 — Accroche et thèse (ouverture de chapitre)

**Phrase-clé.** La sécurité d'un agent n'est pas héritée du modèle — elle s'architecture.

**Contenu.** Partir de CVE-2025-32711 (EchoLeak, juin 2025) : un courriel anodin dans une boîte Outlook, aucune action utilisateur requise, Copilot exfiltre les fichiers OneDrive et SharePoint vers un contrôleur externe. CVSS 9.3. Zéro interaction. Patché côté serveur par Microsoft six mois après l'incident initial — sans advisory public, sans action utilisateur. Ce n'est pas un bug d'implémentation : c'est la conséquence d'une décision d'architecture (le modèle ne distingue pas le contenu de confiance des données ingérées dans sa fenêtre de contexte). Formuler la thèse : les vecteurs d'attaque agentiques exploitent systématiquement la confiance implicite accordée au contenu ingéré, aux outils invoqués, et aux agents délégués — trois surfaces distinctes, un seul principe de défense : *zero trust* à chaque frontière de confiance.

---

### §9.1 — Modèle de menace agentique : six classes de vecteurs

**Phrase-clé.** Le modèle de menace des agents n'est pas un sur-ensemble du modèle de menace des API — c'est une classe de risques structurellement différente, fondée sur la confiance dynamique accordée au contenu et à la délégation.

**Contenu.** Présenter les six classes en lien avec la taxonomie OWASP Top 10 for Agentic Applications 2026 (ASI01–ASI10) — ne pas les lister exhaustivement mais les regrouper en trois familles opérationnelles :

**Famille 1 — Injection et détournement d'objectifs** (ASI01 Agent Goal Hijack)
- *Prompt injection directe* : l'utilisateur encode des instructions malveillantes dans son prompt ; périmètre limité par les contrôles d'entrée.
- *Indirect prompt injection* (IDPI) : les instructions malveillantes sont encodées dans le *contenu que l'agent ingère* — page web récupérée, document analysé, résultat d'outil, courriel. C'est la classe dominante en 2025-2026 (EchoLeak, Unit 42 déc. 2025). Le mécanisme fondamental : *LLM Scope Violation* — le modèle ne segmente pas les espaces de confiance à l'intérieur de sa fenêtre de contexte. Ne pas dupliquer §5.8 (tool poisoning MCP) — pointer vers Ch. 5 et se concentrer sur l'exécution cross-tool comme vecteur d'exfiltration.
- *Cross-tool exfiltration* (sous-classe d'ASI02 Tool Misuse) : l'injection dans l'outil A contrôle l'invocation de l'outil B pour exfiltrer vers un endpoint externe. Taux de succès documenté (arXiv 2025-2026) : GPT-4o à 72-80 % sur tâche de résumé avec exfiltration SSH keys ; Copilot/Cursor à 84 % sur exécution de commandes malveillantes.

**Famille 2 — Délégation et chaînes de confiance** (ASI03, ASI07, ASI08)
- *Jailbreak by delegation* : un agent orchestrateur délègue une sous-tâche à un agent worker avec un contexte modifié. Le modèle de confiance implicite entre orchestrateur et worker propage l'intention malveillante sans que le worker la questionne. Mécanisme formalisé : modification de la description de tâche ou des contraintes à chaque *hop* de délégation. Amplification documentée dans les systèmes MAD (*multi-agent debate* arXiv:2504.16489). Propagation *cascading jailbreaks* dans les systèmes multi-agents à grande échelle (arXiv:2505.02077).
- *Insecure inter-agent communication* (ASI07) : absence d'authentification mutuelle entre agents A2A — usurpation d'Agent Card, man-in-the-middle sur les messages de délégation. Renvoi Ch. 5 §5.8 pour la surface A2A.
- *Trust-authorization mismatch* : l'agent sur-fait confiance à ses pairs ou aux services délégués et exécute des actions hors de son périmètre autorisé.

**Famille 3 — Supply chain et état persistant** (ASI04, ASI06)
- *Supply chain des agents* (ASI04) : registres MCP/plugins tiers compromis (§5.8 pour les incidents Postmark sept. 2025 et Smithery oct. 2025). Extension ici : agents tiers dans les systèmes A2A, *plugin marketplaces* des plateformes (Copilot Studio, Bedrock). Chaîne de confiance SDK → registre → serveur MCP → agent orchestrateur.
- *Memory & Context Poisoning* (ASI06) : corruption des stores de mémoire persistante (embeddings, RAG, mémoire épisodique) pour biaiser le raisonnement futur. Vecteur distinct de l'injection directe : l'attaque persiste au-delà d'une session, survit à un redémarrage de l'agent. Renvoi [Ch. 6 §6.5](ch06-orchestration-memory-tools.md) pour l'architecture mémoire.

**Tableau de synthèse du modèle de menace** (2 dimensions : classe × impact × contrôle primaire) — à produire en Phase 3.

---

### §9.2 — Identity et access pour agents : du compte de service à l'identité vérifiable

**Phrase-clé.** Un compte de service partagé avec une clé API statique n'est pas une identité d'agent — c'est un périmètre d'attaque permanent sans attribution.

**Contenu.** Trois niveaux de maturité d'identité pour agents (du moins sécurisé au plus sécurisé) :

**Niveau 0 — Clé API statique partagée.** Le pattern dominant en 2025 dans les déploiements de première génération. Problèmes : absence d'attribution (quelle action de quel agent ?), révocation coûteuse, aucune rotation automatique, périmètre d'accès binaire (la clé donne accès à tout le service). Incompatible avec les exigences OSFI E-23 d'inventaire des modèles avec métadonnées de propriété et de périmètre autorisé.

**Niveau 1 — Rôles IAM fins + OAuth 2.1 par tâche.** Présenter le pattern *per-task token* :
- OAuth 2.1 (draft-ietf-oauth-v2-1) : PKCE obligatoire, rotation des refresh tokens, suppression du flux implicite. *Tool-level scopes* : granularité par outil et par opération (lecture contacts Salesforce ≠ création Salesforce).
- RFC 8693 (Token Exchange) : réduction du périmètre (*scope narrowing*) à chaque hop de délégation — l'agent orchestrateur échange son token large contre un token plus étroit avant de déléguer au worker.
- SPIFFE/SVID : identité machine vérifiable par certificat pour les flux M2M (*machine-to-machine*).
- AAuth (draft-patwhite-aauth-00, IETF) : extension OAuth 2.1 pour les agents confidentiels — consentement utilisateur via polling/SSE/WebSocket, sans interaction synchrone obligatoire.

**Niveau 2 — Identité vérifiable d'agent + gouvernance du cycle de vie.** Deux implémentations de référence :
- Microsoft Entra Agent ID : identités dédiées (pas de mots de passe, authentification par *Federated Identity Credentials*), politiques adaptatives, détection de risque en temps réel, *agent identity blueprints* parent-enfant. Intégration Azure AI Foundry.
- AWS Bedrock AgentCore Identity (Amazon Cognito) : *token vault* pour les tokens OAuth délégués, intégration Secrets Manager, rôles IAM fins par composant (ARN spécifiques). Note de risque : chemin de privilege escalation documenté via mauvaise configuration SCPs (*à vérifier* — source Sonrai Security, non corroborée par AWS directement).

**Recommandation architecturale principale** : adopter le Niveau 1 (OAuth 2.1 per-task token + SPIFFE/SVID) comme plancher pour tout déploiement en zone orange ou rouge de la matrice [Ch. 4 §4.1](ch04-roi-risk-readiness.md). Le Niveau 2 (identité vérifiable d'agent avec gouvernance du cycle de vie) est requis pour les systèmes soumis à OSFI E-23 et EU AI Act haute-risque.
- Compromis principal : le Niveau 2 ajoute une latence d'authentification (50-200 ms par échange de token selon le fournisseur — *à vérifier*) et une complexité opérationnelle (cycle de vie des identités agents à gérer comme les identités humaines).
- Alternative crédible : SPIFFE/SVID seul pour les flux M2M purs dans un cloud unique, sans délégation multi-tenant.
- Condition qui renverse la recommandation : prototype à agent unique en environnement isolé (pas d'accès à des ressources d'entreprise) — une clé API avec rotation mensuelle est suffisant.

---

### §9.3 — Défense en profondeur : trois couches, une seule architecture

**Phrase-clé.** La défense en profondeur agentique n'est pas une checklist de contrôles indépendants — c'est un pipeline ordonné : guardrails à l'entrée et à la sortie, sandboxing de l'exécution, kill switches opérationnels.

**Contenu.** Présenter l'architecture en trois couches en montrant comment elles se composent, pas comment elles coexistent indépendamment.

**Couche 1 — Guardrails de contenu (I/O filtering)**

Cinq familles de guardrails comparées sur trois dimensions (couverture, latence, coût de déploiement) :

| Guardrail | Type | Couverture | Déploiement |
|---|---|---|---|
| Llama Guard 4 (Meta, 12B, multimodal) | Modèle ouvert | Texte + images, MLCommons taxonomy | On-premise ou API |
| NeMo Guardrails (NVIDIA, Colang) | Middleware open-source | Topical, fact-checking, jailbreak rails | On-premise, entre app et LLM |
| Anthropic Constitutional Classifiers | Classificateurs propriétaires | Universal jailbreaks, constitution NLP | Via API Anthropic |
| Microsoft Azure AI Content Safety + Prompt Shield | Service cloud | Injection indirecte via docs récupérés, PII | Azure-native |
| AWS Bedrock Guardrails (6 politiques) | Service cloud cross-provider | Content, prompt attack, PII, hallucination | Cross-provider (Bedrock + OpenAI + Gemini) |

**Divergence sur l'efficacité des guardrails** : méta-analyse de 78 études 2021-2026 (source secondaire, non identifiée en source primaire — *à vérifier*) rapporte un taux de succès des stratégies d'attaque *adaptative* > 85 % contre les défenses état de l'art. Cette borne ne disqualifie pas les guardrails : elle indique que les guardrails seuls ne constituent pas une défense suffisante — ils doivent être composés avec le sandboxing et les kill switches. Présenter cette divergence explicitement.

**Couche 2 — Sandboxing de l'exécution**

L'agent qui exécute du code généré ou invoque des outils avec effets de bord doit opérer dans un environnement isolé. Trois niveaux d'isolation :

- *Conteneur Docker standard* : isolation au niveau des processus, partage du noyau hôte. Insuffisant pour les agents exécutant du code non fiable (évasion par exploit noyau documentée).
- *gVisor (Google)* : noyau en espace utilisateur qui intercepte les syscalls. Isolation significativement supérieure aux conteneurs, surcoût en latence (~10-20 %). Utilisé par Modal pour les sandboxes agents.
- *Firecracker microVM* : frontière VM hardware, noyau séparé par sandbox. Démarrage 150 ms (E2B). Isolation la plus forte ; utilisé par E2B (200M+ sandboxes démarrés, Fortune 100).

Recommandation : Firecracker ou gVisor pour tout agent exécutant du code généré ou accédant à des ressources de production. Docker standard tolérable uniquement en prototype sans accès à des ressources réelles.

Pattern opérationnel : session courte + rotation systématique du sandbox (pas de sessions longue durée pour les agents à risque élevé).

**Couche 3 — Kill switches et plan de contrôle**

Renvoi [Ch. 7 §7.4](ch07-agentops.md) pour la définition opérationnelle des kill switches dans le plan de contrôle AgentOps. Extension ici :
- Kill switch *par agent* : désactiver une instance sans affecter les autres.
- Kill switch *par outil* : révoquer l'accès à un outil spécifique (ex. outil d'envoi de courriel) sans arrêter l'agent entier.
- Kill switch *par périmètre de données* : isoler un store de mémoire potentiellement compromis (ASI06).
- *Dry-run mode* : basculer un agent en mode lecture seule (effets de bord désactivés) pour investigation sans arrêt.
- Qui détient l'autorité d'activer ? Renvoi [Annexe D](annexe-D-governance-raci.md) — RACI kill switch.

---

### §9.4 — Le problème de la surface de confiance distribuée

**Phrase-clé.** Dans un système multi-agents, la posture de sécurité du système est déterminée par l'agent le moins sécurisé dans la chaîne de délégation.

**Contenu.** Formaliser la notion de *trust boundary* entre agents : chaque délégation A → B crée une frontière de confiance implicite. Si B fait confiance à A sans vérification (pas d'authentification du message A2A, pas de validation de l'intention déclarée), une compromission de A se propage automatiquement à B.

Trois patterns de défense pour la communication inter-agents :
1. *Authentification mutuelle* sur les messages A2A (signature des Agent Cards — spec A2A v1.0.0 prévoit OAuth 2.0/mTLS — renvoi Ch. 5 §5.2).
2. *Scope narrowing* à chaque délégation (RFC 8693 token exchange) : le worker reçoit un token plus étroit que celui de l'orchestrateur.
3. *Intent attestation* : l'orchestrateur encode dans le message de délégation une attestation signée de l'intention originale — le worker peut vérifier que sa sous-tâche est cohérente avec l'intention déclarée (pattern émergent — *hypothèse*, non standardisé à mai 2026).

Cas concret : un système Bedrock AgentCore avec trois workers spécialisés (analyse, rédaction, envoi). Si le worker *analyse* est compromis par injection indirecte dans un document, il peut modifier les instructions transmises au worker *envoi*. Sans authentification mutuelle et scope narrowing, le worker *envoi* exécute. Avec les deux, le token du worker *analyse* ne lui permet pas d'invoquer le worker *envoi* directement — il doit passer par l'orchestrateur, qui valide la cohérence.

---

### §9.5 — Recommandation architecturale : la matrice sécurité × autonomie

**Phrase-clé.** Le niveau de contrôle sécurité requis est une fonction directe du niveau d'autonomie accordé — et cette relation n'est pas linéaire.

**Contenu.** Synthèse opérationnelle : produire une matrice (tableau 2D) croisant le niveau d'autonomie (N1 assistance → N4 autonome, référence [Ch. 8 §8.1](ch08-trustworthy-systems.md) sans renvoi direct au chapitre — renvoi vers la définition dans le glossaire) avec le niveau de contrôle sécurité requis (guardrails seuls / + sandboxing / + identité vérifiable / + kill switches actifs).

**Recommandation principale :** tout système dépassant le niveau N2 (supervisé) doit combiner les trois couches — guardrails + sandboxing + kill switches — sans exception. La concession d'une couche pour des raisons de latence ou de coût doit être documentée comme risque accepté explicite, avec compensation dans une autre couche.

**Compromis principal :** la défense en profondeur à trois couches ajoute 200-400 ms de latence par tour d'exécution agentique (guardrails ~50-100 ms, sandboxing ~100-200 ms, token exchange ~50-100 ms — *à vérifier en source primaire*). Pour les cas d'usage à contrainte de latence forte (< 500 ms de bout en bout), l'architecte doit dimensionner le compromis explicitement.

**Alternative crédible :** architecture *gateway-plus-guardrails* centralisée (pattern observé dans les déploiements enterprise matures 2025-2026) : un gateway unique applique les guardrails et le sandboxing pour tous les agents, plutôt qu'une implémentation par service. Réduit la complexité opérationnelle, crée un point de contrôle centralisé et un point de défaillance unique.

**Condition qui renverse :** si le système opère en environnement physiquement isolé (air-gapped), sans accès à des ressources externes, et avec des données non sensibles — le sandboxing microVM peut être remplacé par des conteneurs Docker standard avec contrôles réseau stricts.

---

### §9.6 — Ce que la sécurité agentique ne peut pas encore garantir

**Phrase-clé.** À mai 2026, aucun mécanisme de défense unique — ni les guardrails, ni le sandboxing, ni l'identité vérifiable — ne fournit une protection exhaustive contre les attaques adaptatives.

**Contenu.** Questions ouvertes sans réponse standardisée à mai 2026 :

1. **Standardisation de l'attestation d'intention** : aucun standard d'*intent attestation* entre agents n'est ratifié. Les drafts IETF AAuth et Agentic JWT sont en phase initiale. Le profil d'interopérabilité NIST est attendu Q4 2026.
2. **Efficacité résiduelle des guardrails contre les attaques adaptatives** : la méta-analyse de 78 études rapporte > 85 % de succès des attaques adaptatives — mais cette borne est mesurée en contexte de laboratoire, pas en production avec défense en profondeur. La vraie question est l'efficacité *composée* (guardrails + sandboxing + kill switches).
3. **Memory poisoning détection** : aucun outil standard de détection de corruption des stores de mémoire persistante (ASI06) n'est disponible à mai 2026. Les approches existantes (validation de cohérence, signatures d'embeddings) sont expérimentales.
4. **Responsabilité distribuée** : dans un système multi-agents avec 5+ workers, déterminer quel agent a initié une action non autorisée requiert une trace d'audit inter-agents que ni OTel GenAI SemConv ni les plateformes commerciales ne fournissent encore de façon standardisée (renvoi [Ch. 7 §7.2](ch07-agentops.md) pour l'état de l'art des traces agentiques).

---

## Sources clés

1. **OWASP Top 10 for Agentic Applications 2026** — https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/ — Taxonomie de référence ASI01–ASI10 pour le modèle de menace du chapitre. Distinct du LLM Top 10 v2 (orienté modèle unique). Source normative pour la nomenclature des classes de vecteurs.

2. **arXiv:2509.10540 — EchoLeak (Aim Security, sept. 2025)** — https://arxiv.org/abs/2509.10540 — Analyse technique de CVE-2025-32711 ; formalise *LLM Scope Violation* comme mécanisme fondamental de l'injection indirecte zero-click. Incident de production traçable avec CVE.

3. **NCCoE / NIST — Concept Paper « Accelerating the Adoption of Software and AI Agent Identity and Authorization » (fév. 2026)** — https://www.nccoe.nist.gov/sites/default/files/2026-02/accelerating-the-adoption-of-software-and-ai-agent-identity-and-authorization-concept-paper.pdf — Source primaire NIST sur l'identité d'agent ; pilier identité du NIST AI Agent Standards Initiative.

4. **arXiv:2504.16489 — Structured Jailbreak on Multi-Agent Debate (ICLR 2026 Workshop)** — https://arxiv.org/abs/2504.16489 — Papier académique primaire sur *jailbreak by delegation* via modification multi-hop des descriptions de tâche inter-agents.

5. **arXiv:2505.02077 — Open Challenges in Multi-Agent Security (mai 2025)** — https://arxiv.org/html/2505.02077 — Synthèse des défis ouverts ; formalise *trust-authorization mismatch* et propagation des *cascading jailbreaks* à l'échelle.

6. **Microsoft Entra Agent ID — documentation officielle** — https://techcommunity.microsoft.com/blog/microsoft-entra-blog/announcing-microsoft-entra-agent-id-secure-and-manage-your-ai-agents/3827392 — Implémentation de référence d'identité vérifiable d'agent chez un hyperscaleur ; *Federated Identity Credentials*, *agent identity blueprints*.

7. **AWS — « Introducing Amazon Bedrock AgentCore Identity »** — https://aws.amazon.com/blogs/machine-learning/introducing-amazon-bedrock-agentcore-identity-securing-agentic-ai-at-scale/ — Pattern *token vault* pour la délégation OAuth ; IAM fins par composant AgentCore.

8. **IETF — AAuth (draft-patwhite-aauth-00) + Agentic JWT (draft-goswami-agentic-jwt-00)** — https://www.ietf.org/archive/id/draft-patwhite-aauth-00.html + https://www.ietf.org/archive/id/draft-goswami-agentic-jwt-00.html — État de l'art des proposals IETF sur l'identité agentique ; fondement des *per-task tokens* et du *least-privilege* dynamique.

9. **Northflank / Manveer Singh Substack — AI Agent Sandboxing Guide 2026** — https://northflank.com/blog/top-ai-sandbox-platforms-for-code-execution + https://manveerc.substack.com/p/ai-agent-sandboxing-guide — Inventaire des runtimes 2026 (E2B/Firecracker, Modal/gVisor, Northflank/Kata) ; distinction des niveaux d'isolation.

10. **AI Security in Practice + Maxim AI — Guardrails Engineering 2026** — https://www.aisecurityinpractice.com/defend-and-harden/guardrails-engineering/ + https://www.getmaxim.ai/articles/top-5-ai-guardrails-platforms-for-responsible-enterprise-ai-in-2026/ — Panorama comparatif des 5 familles de guardrails avec versions et couvertures actualisées à mai 2026.

---

## Questions ouvertes pour arbitrage humain

1. **Niveau de détail sur CVE-2025-32711** : traiter EchoLeak comme l'incident de référence de l'ouverture (forte illustration) ou en faire l'un de plusieurs incidents cités dans §9.1 ? La profondeur dépend du choix narratif.

2. **Renvois croisés vers le niveau d'autonomie (N1–N4)** : les niveaux N1–N4 sont définis dans le plan détaillé de Ch. 8 (esquisse). Si Ch. 8 modifie la définition en Phase 3, §9.5 devra être synchronisé. Hypothèse de travail : les niveaux N1–N4 de Ch. 8 sont stables.

3. **Incident Sonrai Security sur AgentCore** : le chemin de privilege escalation documenté par Sonrai Security (blog, 2025-2026) sur AgentCore n'est pas corroboré par une source primaire AWS. À traiter comme *à vérifier* ou à exclure du chapitre ?

4. **Profondeur de couverture de NeMo Guardrails** : NeMo Guardrails 0.x (versions courantes — *à confirmer sur GitHub NVIDIA-NeMo/Guardrails*) est un toolkit open-source ; son déploiement en production enterprise est moins documenté que les offres cloud (Bedrock Guardrails, Azure AI Content Safety). Jusqu'où aller dans la comparaison sans fabrication ?

5. **Attestation d'intention entre agents** : le pattern *intent attestation* (§9.4) est décrit comme émergent et non standardisé. Si un draft IETF ou un standard NIST est publié entre mai 2026 et la livraison du chapitre, il devra être intégré en Phase 3.
