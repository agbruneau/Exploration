#import "../../lib/canon.typ": *

= PARTIE III — Protocoles et standards

== Ch. 8 — Paysage des protocoles d'interopérabilité agentique

*Insight-clé.* En date de juin 2026, le paysage protocolaire agentique ne converge pas vers un protocole unique mais se stratifie en couches complémentaires sous la Linux Foundation — #angl[MCP] pour l'accès aux outils, A2A pour la délégation inter-agents, AGNTCY pour l'annuaire/identité/transport, AG-UI et A2UI pour l'interface usager #footnote[Synthèse de stratification (clé interne #raw("[CONV-001]")) — état de l'art arrêté au 8 juin 2026, marqueur `probable`.]. Cette stratification n'est pas un accident d'ingénierie : elle calque la rupture *composition→délégation* (cf. Ch. 1–2). Tant que les agents se *composaient* — appels d'outils déterministes ordonnancés par un programme hôte — une seule couche d'accès aux capacités (#angl[MCP]) suffisait ; dès qu'ils *délèguent* — un agent confie une tâche à un autre agent autonome dont il ne contrôle ni le plan ni le régime d'exécution — il faut une couche distincte de message/tâche inter-agents (A2A) et une couche d'identité/découverte (AGNTCY). La frontière MCP↔A2A est donc la matérialisation protocolaire de la frontière composition↔délégation, et non une simple redondance de transport.

La conséquence opératoire est directe pour #optau : un appel #angl[MCP] (accès outil, périmètre composition) et une délégation A2A (tâche confiée, périmètre délégation) ne déplacent pas #tfix au même instant ni avec la même autorité. La dimension #dautorite de #tau — autorité de l'appelant × autorité requise de la cible (cf. Ch. 5) — s'évalue différemment selon que la cible est un outil sous contrat déterministe ou un agent #angl[LLM] tiers ; c'est précisément là que se joue le risque de *confused deputy* que le modèle d'autorisation #angl[MCP] cherche à clore (§ Sécurité ci-dessous).

=== La stratification, couche par couche

*Insight-clé.* Quatre familles protocolaires occupent quatre couches fonctionnelles disjointes ; leurs promoteurs les présentent comme complémentaires, et la fusion ACP→A2A (août 2025) a éliminé le principal recouvrement.

#angl[MCP] (Anthropic) occupe la couche *accès aux outils* : un agent y découvre et invoque des ressources, *prompts* et outils exposés par un serveur, sous un cœur explicitement *stateful* dans sa révision stable 2025-11-25 #footnote[Model Context Protocol, révision stable 2025-11-25 — Anthropic / Agentic AI Foundation (Linux Foundation) — publiée le 25 novembre 2025 (clé interne #raw("[1]") #raw("[6]")), marqueur `confirmé`.]. A2A (Agent2Agent, originellement Google) occupe la couche *message/tâche inter-agents* : un agent y délègue une tâche à un agent pair décrit par une *Agent Card*, avec négociation de capacités et suivi de cycle de vie de tâche #footnote[A2A Protocol v1.0 (spec 1.0.0) — Google → Linux Foundation — release notes GitHub du 12 mars 2026 (clé interne #raw("[A2A-005]") #raw("[A2A-rel]")), marqueur `confirmé`.]. AGNTCY (Outshift/Cisco) occupe la couche *infrastructure* — OASF, Agent Directory, Identity, transport SLIM (#angl[Secure Low-latency Interactive Messaging], avec mention *quantum-safe*) et observabilité — et se déclare interopérable avec A2A et #angl[MCP] #footnote[AGNTCY — Outshift/Cisco, accueilli par la Linux Foundation le 29 juillet 2025 ; membres formateurs : Cisco, Dell, Google Cloud, Oracle, Red Hat (clé interne #raw("[AGNTCY-002]") #raw("[AGNTCY-003]")), marqueur `confirmé`.]. AG-UI (CopilotKit) et A2UI (Google) occupent la couche *interface agent↔usager* et se présentent mutuellement comme complémentaires, non concurrents #footnote[AG-UI — CopilotKit (MIT), release 2026-06-05 (clé interne #raw("[AGUI-002]")) ; A2UI v0.8 — Google, annoncé le 15 décembre 2025 (clé interne #raw("[A2UI-001]")), marqueurs `confirmé`.].

Le recouvrement historique le plus net — ACP (IBM/BeeAI), approche REST-native pour le dialogue inter-agents — a été résorbé : l'équipe ACP a cessé le développement actif et a fusionné dans A2A, Kate Blair (IBM Research) rejoignant le A2A TSC #footnote[Fusion ACP→A2A — discussion GitHub i-am-bee du 25 août 2025 vs billet LF AI & Data du 29 août 2025 (clé interne #raw("[ACP-002]")), marqueur `confirmé` ; divergence de date de publication conservée, ~4 jours.]. En 2026, ACP relève donc du contexte historique, non d'une décision d'architecture courante — distinction à tenir, d'autant qu'AGNTCY a porté jadis un *Agent Connect Protocol* homonyme mais distinct, aujourd'hui disparu de la documentation courante au profit de SLIM (`probable`).

#figure(
  table(
    columns: 6,
    table.header[*Protocole*][*Origine / Gouvernance*][*Couche fonctionnelle*][*Version (juin 2026)*][*Licence*][*Statut*],
    [*A2A*], [Google → Linux Foundation (2025-06-23)], [Message / tâche inter-agents], [v1.0 (spec 1.0.0 ; tag 1.0.1)], [Apache 2.0], [`confirmé`],
    [*ACP* (IBM)], [IBM/BeeAI → fusionné dans A2A], [(historique) inter-agents REST], [— (déprécié)], [—], [`confirmé` (historique)],
    [*AGNTCY*], [Outshift/Cisco → Linux Foundation (2025-07-29)], [Annuaire / identité / transport (SLIM) / observabilité], [doc courante], [open-source LF], [`confirmé`],
    [*#angl[MCP]*], [Anthropic → AAIF / Linux Foundation], [Accès outils], [2025-11-25 (RC 2026-07-28)], [open-source LF], [`confirmé`],
    [*AG-UI*], [CopilotKit (hors-fondation)], [Interface agent ↔ usager], [release 2026-06-05], [MIT], [`confirmé`],
    [*A2UI*], [Google (hors-fondation)], [Format déclaratif d'UI générative], [v0.8], [open project], [`confirmé`],
  ),
  caption: [Cartographie de la stratification protocolaire (état au 8 juin 2026). Reprise du dossier d'état de l'art, Partie III.],
) <tab-strat>

=== Comparaison multidimensionnelle : couche, confiance, gouvernance, maturité, adoption

*Insight-clé.* Sur cinq dimensions, #angl[MCP] et A2A sont les deux pôles matures (versions stables gouvernées sous LF) ; AGNTCY est l'infrastructure transverse ; AG-UI/A2UI restent hors-fondation et plus jeunes. Aucun de ces protocoles n'invente un modèle de confiance *ad hoc* : tous réutilisent le socle OAuth 2.1 / OIDC / mTLS, ce qui est l'indice fort de la convergence par couches plutôt que par réécriture.

Le modèle de confiance est le discriminant le plus instructif. #angl[MCP] 2025-11-25 fixe le serveur comme *OAuth 2.1 Resource Server* et impose, côté autorisation, un faisceau d'obligations normatives durcies — détaillées au @tab-autz. A2A, lui, n'impose pas un schéma unique : l'*Agent Card* déclare le ou les schémas supportés (API Key, HTTP Auth, OAuth2, OIDC, mTLS) et la v1.0 ajoute la signature de carte (#angl[Signed Agent Cards], champ `AgentCardSignature`) pour authentifier la métadonnée de découverte elle-même #footnote[A2A v1.0 — *Signed Agent Cards*, support multi-tenant, rétrocompatibilité v0.3↔v1.0 ; transports JSON-RPC 2.0, gRPC, HTTP+JSON/REST ; *Agent Card* supportant API Key / HTTP Auth / OAuth2 / OIDC / mTLS (clé interne #raw("[A2A-005]") #raw("[A2A-006]") #raw("[A2A-007]")), marqueur `confirmé`.]. La différence est structurante : #angl[MCP] verrouille l'autorisation parce que l'appel d'outil traverse la frontière de privilège de l'hôte (risque *confused deputy*) ; A2A négocie l'authentification parce que la délégation franchit une frontière organisationnelle (multi-tenant, agents tiers).

#figure(
  table(
    columns: 6,
    table.header[*Dimension*][*#angl[MCP]*][*A2A*][*AGNTCY*][*AG-UI*][*A2UI*],
    [Couche], [Accès outils (composition)], [Message/tâche inter-agents (délégation)], [Annuaire / identité / transport / observabilité], [Interface agent↔usager], [UI générative déclarative],
    [Modèle de confiance], [OAuth 2.1 RS ; RFC 9728/8707/PKCE S256 (MUST)], [Schéma déclaré par l'*Agent Card* (API Key/OAuth2/OIDC/mTLS) + carte signée], [Identity dédié + SLIM (mention *quantum-safe*)], [Transport-agnostique (réf. HTTP+SSE)], [Transportée sur A2A / AG-UI (hérite leur confiance)],
    [Gouvernance], [AAIF (LF) ; gouvernance formalisée (SEP-932/994/1302/1730)], [Linux Foundation ; A2A TSC], [Linux Foundation (charte/TAC `à vérifier`)], [Hors-fondation (CopilotKit)], [Hors-fondation (Google, open project)],
    [Maturité], [Stable 2025-11-25 ; RC 2026-07-28 (`probable`)], [Stable v1.0 (12 mars 2026)], [Doc courante ; pas de jalon de version unique], [Release 2026-06-05], [v0.8 (`probable` pour la trajectoire)],
    [Adoption], [> 10 000 serveurs publics ; 97 M+ téléch. SDK/mois#super[†]], [150+ organisations (1er anniv., 9 avr. 2026)#super[‡]], [Membres formateurs (Cisco/Dell/Google Cloud/Oracle/Red Hat)], [~16 types d'événements ; support A2A confirmé], [Annoncé 2025-12-15 ; adoption non chiffrée],
  ),
  caption: [Comparaison multidimensionnelle des cinq familles protocolaires (juin 2026). † Réserve métrologique : téléchargements SDK ≠ utilisateurs. ‡ Attribution nominale de déploiements en production (Microsoft/AWS/Salesforce/SAP/ServiceNow) `à vérifier` — non explicitement établie par le communiqué LF.],
) <tab-multidim>

Sur l'adoption, deux réserves du dossier ne doivent pas être lissées. Le chiffre « 97 M+ téléchargements SDK/mois » est une source primaire Anthropic, mais téléchargements de SDK ≠ utilisateurs actifs #footnote[Adoption #angl[MCP] : > 10 000 serveurs publics ; 97 M+ téléchargements SDK/mois (Python+TS, source primaire Anthropic) ; 10 SDK officiels ; registre officiel en PREVIEW depuis le 8 sept. 2025 (clés internes #raw("[8]") #raw("[7]") #raw("[adopt-dl]") #raw("[sdk]") #raw("[reg]")), marqueur `confirmé` avec réserve métrologique.]. Côté A2A, le communiqué de fondation confirme 150+ organisations et une adoption verticale, mais n'attribue nommément aucun déploiement *en production* aux acteurs souvent cités (Microsoft, AWS, Salesforce, SAP, ServiceNow) : ils figurent comme *supporting organizations*, et la portion « production nominative » reste `à vérifier` #footnote[A2A : 150+ organisations au premier anniversaire (9 avril 2026) ; production nominative `à vérifier` (clés internes #raw("[A2A-150]") #raw("[A2A-008]")), marqueur `probable`.]. Enfin, l'allégation d'agrégateur « A2A 1.2 » est *réfutée/non confirmée* par la source primaire : la version protocolaire normative est v1.0, le tag v1.0.1 (28 mai 2026) n'étant qu'un correctif éditorial sans effet sur la compatibilité ni la négociation de version #footnote[« A2A 1.2 » non confirmé et contredit par la source primaire ; version normative = 1.0 ; v1.0.1 = patch éditorial (clés internes #raw("[CONV-002]") #raw("[A2A-rel]")), divergence conservée.].

=== Convergence par stratification vs fragmentation

*Insight-clé.* La consolidation observée est institutionnelle (mêmes fondations, mêmes briques de confiance) avant d'être technique : #angl[MCP], A2A et AGNTCY relèvent tous de la Linux Foundation et se réclament d'une complémentarité de couches, ce qui rend l'hypothèse de convergence `probable` plutôt que de fragmentation — sans pour autant garantir l'interopérabilité de bout en bout, qui reste à attester empiriquement.

Trois signaux étayent la lecture « convergence par stratification ». D'abord, l'absorption d'un concurrent direct : ACP (REST inter-agents) a fusionné *dans* A2A plutôt que de coexister, supprimant le doublon de couche. Ensuite, l'alignement de gouvernance : MCP→AAIF (don du 9 décembre 2025), A2A→LF (transfert du 23 juin 2025), AGNTCY→LF (29 juillet 2025) placent les trois piliers sous une même autorité de fondation, avec des conseils Platinum/TSC formalisés #footnote[Don de #angl[MCP] à l'Agentic AI Foundation (AAIF), *directed fund under the Linux Foundation* selon Anthropic, le 9 décembre 2025 ; membres Platinum AAIF (8) : AWS, Anthropic, Block, Bloomberg, Cloudflare, Google, Microsoft, OpenAI (clés internes #raw("[7]") #raw("[8]")), marqueur `confirmé`. Le qualificatif « directed fund » est employé par Anthropic mais absent du communiqué LF — divergence de formulation, non de substance.]. Enfin, la réutilisation systématique du socle de confiance (OAuth 2.1, OIDC, mTLS) interdit la divergence de modèle d'identité qui caractériserait une vraie fragmentation.

Le contre-argument de prudence demeure. La complémentarité est *déclarée* par les promoteurs, et la mécanique exacte de certains ponts inter-couches reste sous-spécifiée — par exemple le handshake AG-UI↔A2A est `à vérifier`, et le rôle de l'ancien « Agent Connect Protocol » d'AGNTCY n'est pas tracé jusqu'à SLIM. La convergence par stratification est donc l'hypothèse la mieux soutenue, non un fait acquis : son verdict empirique passe par des études de cas d'interopérabilité multi-protocoles, encore manquantes.

=== Le modèle d'autorisation MCP : le point dur de la délégation d'accès

*Insight-clé.* Le durcissement OAuth de #angl[MCP] 2025-11-25 est la réponse normative directe au *confused deputy* — exactement le risque que la dimension #dautorite de #tau (cf. Ch. 5) cherche à arbitrer lorsqu'un appelant emprunte l'autorité d'un serveur d'outils.

L'autorisation #angl[MCP] impose un faisceau d'obligations (@tab-autz) dont la clé anti-*confused deputy* est l'usage inconditionnel du paramètre `resource` (RFC 8707) côté client, doublé d'une validation d'audience côté serveur et d'une interdiction explicite du *token passthrough*. Nuance vérifiée à ne pas lisser : l'obligation côté client est inconditionnelle, mais le bénéfice de *binding* d'audience ne s'obtient « *when the Authorization Server supports the capability* » — l'effet dépend du support par l'AS #footnote[Modèle d'autorisation #angl[MCP] 2025-11-25 : RFC 8707 inconditionnel côté client, *binding* d'audience effectif seulement si l'AS le supporte ; *token passthrough* interdit (clés internes #raw("[10]") #raw("[11]")), marqueur `confirmé`. Origine empirique du durcissement : CVE-2025-49596 (MCP Inspector < 0.14.1, RCE, CVSS v4.0 = 9.4 CRITICAL, NVD publié le 13 juin 2025), clé interne #raw("[12]").].

#figure(
  table(
    columns: 4,
    table.header[*Élément*][*Statut normatif*][*Acteur*][*Source (clé interne)*],
    [Serveur = OAuth 2.1 Resource Server], [Établi depuis 2025-06-18], [Serveur], [#raw("[10]")],
    [RFC 9728 (Protected Resource Metadata)], [*MUST*], [Serveur (impl.) / Client (usage)], [#raw("[10]")],
    [PKCE méthode S256], [*MUST* (si techniquement possible)], [Client], [#raw("[10]")],
    [Découverte : RFC 8414 *ou* OIDC Discovery 1.0], [MUST (≥ 1 mécanisme serveur ; client supporte les deux)], [Serveur / Client], [#raw("[10]")],
    [RFC 8707 (paramètre `resource`)], [*MUST*, inconditionnel], [Client], [#raw("[11]")],
    [Validation d'audience / rejet hors audience], [*MUST*], [Serveur], [#raw("[11]")],
    [*Token passthrough*], [*INTERDIT*], [Serveur], [#raw("[11]")],
    [Client ID Metadata Documents (SEP-991)], [RECOMMANDÉ ; DCR/RFC 7591 → *MAY*], [Client], [#raw("[13]")],
  ),
  caption: [Obligations normatives d'autorisation, #angl[MCP] 2025-11-25. Reprise du dossier (Tableau 2, Partie III).],
) <tab-autz>

Le couplage à #tau est conceptuel, non protocolaire : #angl[MCP] ne *décide* pas du régime déterministe/probabiliste, il fournit le canal d'accès outil et la garantie d'audience sur laquelle #dautorite peut s'appuyer pour produire #decision (cf. Ch. 5). À titre d'illustration de schéma — et non de spécification normative — une politique de dispatch peut typer un appel selon que sa cible est un outil sous contrat #angl[MCP] (régime déterministe candidat) ou une délégation A2A vers un agent #angl[LLM] (régime probabiliste candidat) :

```json
{
  "policy": "tau-dispatch-illustratif",
  "cible": { "protocole": "MCP", "type": "tool", "audience": "spiffe://exemple/serveur-outils" },
  "d_autorite": { "appelant": 0.7, "requise_cible": 0.4 },
  "binding_audience_RFC8707": "obligatoire-client; effectif-si-AS-supporte",
  "regime_candidat": "Deterministe",
  "note": "Une delegation A2A (tache inter-agents) basculerait le regime_candidat vers Probabiliste; arbitrage final = Decision de tau (cf. Ch. 5)."
}
```

=== La trajectoire MCP : norme stable et refonte *stateless* en cours

*Insight-clé.* #angl[MCP] vit une double trajectoire — une révision stable gouvernée (2025-11-25) et un *Release Candidate* (cible 2026-07-28) proposant une mutation architecturale majeure du cœur *stateful* vers un cœur *sans état* — dont les paramètres restent `probable`, non finalisés.

Le RC vise la scalabilité horizontale en supprimant l'état de session : retrait de `initialize` (SEP-2575) et de `Mcp-Session-Id` (SEP-2567), en-têtes `Mcp-Method`/`Mcp-Name` (SEP-2243) pour router sans inspecter le corps, dépréciation de Roots/Sampling/Logging (SEP-2577) et fenêtre de cycle de vie ≥ 12 mois (SEP-2596) #footnote[RC #angl[MCP] 2026-07-28 : cœur *stateless*, dépréciations et cadre Extensions (clés internes #raw("[9]") #raw("[14bis]")), marqueur `probable` (RC non finalisé). La roadmap du 9 mars 2026 précise « *not adding more official transports this cycle* ».]. Deux divergences de datation sont conservées : le billet officiel du RC est daté du 21 mai 2026, le tag GitHub `2026-07-28-RC` porte le 29 mai 2026, et « 2026-07-28 » est la date *cible* de la version finale — non la date du RC (~8 jours d'écart entre deux sources primaires).

#figure(
  table(
    columns: 3,
    table.header[*Dimension*][*2025-11-25 (stable, `confirmé`)*][*RC 2026-07-28 (`probable`, non finalisé)*],
    [Modèle de session], [*Stateful* ; handshake `initialize`/`initialized`], [*Stateless* : suppression `initialize` (SEP-2575) + `Mcp-Session-Id` (SEP-2567)],
    [Routage proxy/LB], [Inspection du corps requise], [En-têtes `Mcp-Method`/`Mcp-Name` (SEP-2243)],
    [Cycle de vie], [Non formalisé], [Active→Deprecated→Removed, fenêtre ≥ 12 mois (SEP-2596)],
    [Primitives dépréciées], [—], [Roots, Sampling, Logging (SEP-2577)],
    [Extensibilité], [Primitives fixes], [Cadre Extensions (SEP-2133) + MCP Apps (SEP-1865) + Tasks promu (SEP-2663)],
    [Tasks], [Expérimental (SEP-1686)], [Extension promue (SEP-2663)],
    [Transports], [stdio + Streamable HTTP], [Inchangés (aucun nouveau transport ce cycle)],
  ),
  caption: [Évolution architecturale de #angl[MCP] : 2025-11-25 (stable) vs RC 2026-07-28. Reprise du dossier (Tableau 1, Partie III).],
) <tab-mcp-evol>

=== Questions ouvertes

Les incertitudes du dossier, à reverifier en relance, sont les suivantes :

- *Finalisation du RC #angl[MCP] 2026-07-28* : l'ensemble des apports (*stateless*, dépréciations Roots/Sampling/Logging, cadre Extensions) reste `probable` ; reverifier *Releases* et *changelog* après la date cible. Statut exact du registre officiel #angl[MCP] (toujours PREVIEW au 8 juin 2026, format `server.json`) à consulter sur `registry.modelcontextprotocol.io`.
- *Gouvernance #angl[MCP]* : existence et composition d'un *steering committee* formel, et appartenance de Nick Cooper (OpenAI) — `à vérifier`, non attesté par les billets de mainteneurs consultés (vérifier SEP-932 ou les fichiers GOVERNANCE/MAINTAINERS).
- *Internet-Drafts OAuth figés par #angl[MCP]* : `draft-ietf-oauth-v2-1-13` et `draft-ietf-oauth-client-id-metadata-document-00` peuvent être périmés ; vérifier sur `datatracker.ietf.org`.
- *Gouvernance post-1.0 d'A2A* : cadence et politique de support des versions 0.x non datées au-delà des tags GitHub ; structure fine d'AGNTCY (TAC, charte) non précisée par le communiqué du 29 juillet 2025.
- *Convergence à l'épreuve* : la complémentarité AG-UI↔A2A (mécanique exacte du handshake) et l'historique du renommage « Agent Connect Protocol » → SLIM restent `à vérifier` ; l'adoption *en production vérifiable et nominative* (au-delà des communiqués de fondation) exige des études de cas éditeurs ou *peer-reviewed*, encore manquantes.

#pagebreak()

== Ch. 9 — Substrats de messagerie à garanties fortes

*Insight-clé.* L'#angl[exactly-once semantics] (EOS) d'Apache Kafka est *structurellement borné au périmètre interne read-process-write* : tout effet de bord externe — appel à une API #angl[LLM], courriel, paiement — n'est *pas* garanti #angl[exactly-once].#footnote[Exactly-once Semantics is Possible: Here is How Apache Kafka Does It — Confluent (Narkhede, Wang et al.) — 2025-03-01 — #link("https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/")] Cette frontière entre la garantie déterministe du substrat et l'action probabiliste, non rejouable, de l'agent est l'*ancrage empirique* de l'#optau (défini au Ch. 5 ; ne pas le redéfinir ici). IBM MQ obtient pour sa part le _once-and-only-once_ par la conjonction persistance + #angl[syncpoint] + coordination transactionnelle, tandis que Kafka est un journal à rétention relisable : deux familles de substrat aux contrats distincts, non interchangeables.

=== La frontière EOS interne / effet de bord externe : ancrage de #tau

L'insight tient en une distinction de périmètre. Kafka garantit l'atomicité d'un cycle _consommer → traiter → produire_ entièrement contenu *à l'intérieur* de Kafka (multi-partitions, transactionnel) ; il ne garantit rien dès qu'une étape sort de ce périmètre vers une ressource externe non transactionnelle.#footnote[Verbatim Confluent : « guaranteed within the scope of Kafka Streams' internal processing only ». Source : entrée précédente (Confluent, 2025-03-01).] Or l'action agentique — invoquer un modèle, émettre un paiement, envoyer un courriel — *est* précisément cet effet de bord externe : non transactionnel, non idempotent par défaut, non rejouable sans conséquence.

C'est le socle factuel de l'#optau et de la distinction substrat/action développée au Ch. 5. Le substrat occupe le régime déterministe ; l'effet de bord externe ressort du régime probabiliste ; l'opérateur arbitre le passage de l'un à l'autre en déplaçant #tfix sans altérer la grandeur (cf. Ch. 5 pour la construction, Ch. 6 pour l'algèbre d'héritage de garanties du #cia). Le @tab-eos-frontiere transpose la documentation Kafka en lecture agentique : il ne *prouve* pas la thèse — il l'*atteste empiriquement*.

#figure(
  table(
    columns: 3,
    align: left,
    table.header[*Périmètre*][*Garantie EOS Kafka*][*Implication agentique*],
    [read-process-write *interne* Kafka], [*Oui* — atomique, multi-partitions], [Substrat déterministe],
    [Appel RPC externe (store distant, *API #angl[LLM]*, courriel, paiement)], [*Non*], [Action probabiliste / non rejouable → ressort de #tau],
  ),
  caption: [Frontière de garantie EOS (ancrage empirique de la thèse #tau). Source : Confluent, 2025-03-01.],
) <tab-eos-frontiere>

La conséquence d'ingénierie est nette : aucun réglage de Kafka ne *transporte* la garantie au-delà de sa frontière. Prétendre le contraire — « activer l'EOS rend l'agent #angl[exactly-once] » — est un défaut de raisonnement sur le périmètre, non un défaut de configuration. La garantie forte du substrat *encadre* l'incertitude agentique ; elle ne l'*absorbe* pas.

=== Apache Kafka / Confluent : EOS, idempotence, transactions, ordre

Le mécanisme EOS de Kafka repose sur trois primitives couplées, stabilisées depuis *Kafka 0.11 (juin 2017)* via *KIP-98* : producteur idempotent (identifiant de producteur `PID` + numéros de séquence par partition), transactions inter-partitions atomiques, et consommateur en `read_committed` / `read_uncommitted`.#footnote[KIP-98 — Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — consulté 2026-03-04 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging")] Depuis *Kafka 4.0.0 (18 mars 2025)* — première majeure sans ZooKeeper (KRaft par défaut) — la *défense transactionnelle côté serveur (KIP-890)* est *activée automatiquement*, avec _bump_ d'epoch par transaction.#footnote[Transaction Protocol (doc officielle 4.1 — activation serveur automatique depuis Kafka 4.0) — Apache Software Foundation — 2025-09-04 — #link("https://kafka.apache.org/41/operations/transaction-protocol/")]#footnote[KIP-890: Transactions Server-Side Defense (statut wiki « Approved ») — Apache Software Foundation — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-890:+Transactions+Server-Side+Defense")] En date de juin 2026, *Kafka 4.3.0 (22 mai 2026)* est la version courante (25 KIPs, 600+ commits), la ligne 4.2.x étant maintenue en parallèle (*4.2.1 = 30 mai 2026*) ; l'ordre « 4.3.0 avant 4.2.1 » est *réel* — deux lignes distinctes, pas une anomalie (`confirmé`, haut enjeu).#footnote[Release Announcements (liste officielle versions et dates Kafka) — Apache Software Foundation — 2026-05-30 — #link("https://kafka.apache.org/blog/releases/")]#footnote[Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — #link("https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/")]

#figure(
  table(
    columns: 5,
    align: (left, left, left, center, left),
    table.header[*Version*][*Date (Apache)*][*Apport majeur*][*Statut*][*Source*],
    [4.3.0], [*2026-05-22*], [25 KIPs, 600+ commits ; version courante], [`confirmé`], [rel. 4.3.0],
    [4.2.1], [2026-05-30], [Correctif (ligne maintenance 4.2.x)], [`confirmé`], [rel. announcements],
    [4.2.0], [*2026-02-17*], [KIP-932 (Share Groups) *GA* ; KIP-1228], [`confirmé`], [rel. 4.2.0],
    [4.1.0], [2025-09-04], [KIP-932 *PREVIEW* ; KIP-1071 early access], [`confirmé`], [rel. 4.1.0],
    [4.0.0], [*2025-03-18*], [Sans ZooKeeper (KRaft) ; KIP-890 actif par défaut], [`confirmé`], [rel. 4.0.0],
    [0.11.0.0], [2017-06], [KIP-98 : EOS (idempotence + transactions)], [`confirmé`], [KIP-98],
  ),
  caption: [Chronologie des versions Apache Kafka (vérifiée le 8 juin 2026).],
) <tab-kafka-versions>

Une *correction de traçabilité* doit être consignée sur la nomenclature EOS de Kafka Streams, où l'énoncé candidat « `exactly_once_v2` introduit en Kafka 2.5 » est *erroné*. Le mécanisme `eos-beta` provient de *Kafka 2.6.0* (KIP-447) ; le nom `exactly_once_v2` n'apparaît qu'en *Kafka 3.0.0* (KIP-732, qui renomme `exactly_once_beta` et déprécie `eos-alpha`).#footnote[KIP-447: Producer scalability for exactly once semantics (Adopted 2.6.0) — Apache Software Foundation — 2020-06-01 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-447:+Producer+scalability+for+exactly+once+semantics")]#footnote[KIP-732: Deprecate eos-alpha and replace eos-beta with eos-v2 (Kafka 3.0.0) — Apache Software Foundation — 2021-06-01 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-732:+Deprecate+eos-alpha+and+replace+eos-beta+with+eos-v2")]

#figure(
  table(
    columns: 4,
    align: left,
    table.header[*Nom de configuration*][*KIP*][*Version d'apparition*][*Statut juin 2026*],
    [`exactly_once` (eos-alpha)], [KIP-98/129], [0.11], [*Retiré en 4.0* (KIP-732)],
    [`exactly_once_beta` (eos-beta)], [KIP-447], [*2.6.0*], [Renommé en 3.0],
    [`exactly_once_v2`], [KIP-732], [*3.0.0*], [*Nom canonique*],
  ),
  caption: [Nomenclature EOS de Kafka Streams (correction de traçabilité). L'énoncé « v2 en 2.5 » est réfuté : `eos-beta` = 2.6.0, nom `v2` = 3.0.0.],
) <tab-eos-nomenclature>

Côté *ordre*, la livraison ordonnée par partition est obtenue avec le producteur idempotent ; la borne `max.in.flight.requests.per.connection ≤ 5` préservant l'ordre sous idempotence est issue d'un billet Confluent et reste à recouper sur la documentation _Producer Configs_ primaire (`probable`, à vérifier sur `kafka.apache.org/documentation`).#footnote[KIP-185: Make exactly once in order delivery per partition the default — Apache Software Foundation — 2017-09-01 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-185:+Make+exactly+once+in+order+delivery+per+partition+the+default+Producer+setting")] La configuration minimale d'un producteur transactionnel EOS, et le cycle d'API correspondant, se lisent ainsi :

```yaml
# Producteur Kafka — EOS (read-process-write INTERNE uniquement)
enable.idempotence: true            # PID + numéros de séquence par partition
transactional.id: "agent-tx-writer" # active les transactions inter-partitions
acks: all                           # implicite sous idempotence
max.in.flight.requests.per.connection: 5   # borne « probable » à recouper (KIP-185)
# Consommateur en aval :
isolation.level: read_committed     # ATTENTION : défaut serveur = read_uncommitted
```

```go
// Cycle transactionnel : atomicité GARANTIE seulement entre topics Kafka.
producer.InitTransactions()
producer.BeginTransaction()
producer.Produce(outMsg)                 // écriture dans un topic Kafka -> couvert
producer.SendOffsetsToTransaction(...)   // commit d'offset atomique -> couvert
// callExternalLLM(prompt)   // <-- effet de bord EXTERNE : HORS transaction, ressort de tau
producer.CommitTransaction()
```

Le surcoût de performance de l'EOS — souvent cité autour de ~2–5 ms de latence et ~10–20 % de débit — provient d'une *source secondaire* (Conduktor ; recoupements Strimzi/CNCF) *sans banc de mesure primaire* ; il *ne doit pas* être présenté comme normatif (`à vérifier`), et appelle une mesure propre sur le banc `AgentMeshKafka`.#footnote[Exactly-Once Semantics in Kafka (glossaire, secondaire — coût performance) — Conduktor — 2025-01-01 — #link("https://www.conduktor.io/glossary/exactly-once-semantics-in-kafka")]#footnote[Exactly-once semantics with Kafka transactions (recoupement secondaire) — Strimzi (CNCF) — 2023-05-03 — #link("https://strimzi.io/blog/2023/05/03/kafka-transactions/")]

Pour l'IA agentique, les patrons confirmés (verbatim Confluent, 5 mai 2026) consacrent le journal comme *mémoire stateful à replay déterministe* : _transactional outbox_ + CDC Debezium pour franchir proprement la frontière vers un système externe, file de lettres mortes (DLQ) portant `prompt-id` / `model-version` / `offset`, et _data contracts_ CEL pour le masquage PII.#footnote[Integrating AI Into Apache Kafka Architectures: Patterns (outbox/DLQ/replay verbatim) — Confluent — 2026-05-05 — #link("https://www.confluent.io/blog/ai-kafka-integration-patterns/")] Le _transactional outbox_ est l'aveu d'ingénierie de la frontière EOS : on n'écrit pas directement vers l'externe dans la transaction ; on écrit *l'intention* dans un topic (couvert par l'EOS), puis un processus distinct effectue l'effet de bord et en consigne le résultat.

```json
// Enregistrement DLQ après échec d'effet de bord externe (patron Confluent)
{ "prompt_id": "p-7f3a", "model_version": "claude-…@2026-05", "offset": 184421,
  "topic": "agent.actions.outbox", "error": "external_call_not_idempotent",
  "decision": "Refus" }
```

Deux précisions de positionnement, pour ne pas figer le paysage. Le *Tiered Storage (KIP-405)* est _production-ready_ depuis Kafka 3.9 (verbatim wiki) : *ce n'est plus un différenciateur Confluent exclusif* en juin 2026.#footnote[KIP-405: Kafka Tiered Storage (production-ready depuis 3.9) — Apache Software Foundation — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-405:+Kafka+Tiered+Storage")] Et le *KIP-939 (participation 2PC externe)* est au statut « Accepted » *sans version d'intégration spécifiée* — `transaction.two.phase.commit.enable` (défaut `false`), adoption attendue d'abord via Apache Flink (FLIP-319) ; le marqueur `à vérifier` sur la version cible est *maintenu* (`probable`).#footnote[KIP-939: Support Participation in 2PC (Accepted, version non spécifiée) — Apache Software Foundation — 2024-06-01 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC")]#footnote[FLIP-319: Integrate with Kafka Support for Proper 2PC Participation — Apache Software Foundation (Flink) — 2024 — #link("https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=255071710")]

=== IBM MQ : once-and-only-once, syncpoint et la frontière delivery / processing

La distinction *delivery (transport) vs processing (applicatif)* est solidement étayée et tranche un faux espoir. L'« #angl[exactly-once] *delivery* » au niveau transport est *impossible* sur réseau non fiable — résultat classique des Deux Généraux et de l'impossibilité FLP ; seul l'« #angl[exactly-once] *processing* » (atomicité applicative) est atteignable.#footnote[Cadre des Deux Généraux / impossibilité FLP : l'exactly-once delivery transport est théoriquement impossible ; seule l'atomicité de traitement est atteignable. Corroboré verbatim par la documentation Confluent et IBM citées dans ce chapitre (référence de théorie distribuée non résolue au dossier — `à vérifier` pour la citation primaire CS).] IBM MQ assure le _once-and-only-once_ par la conjonction *persistance + syncpoint (`MQCMIT` / `MQBACK`) + coordination transactionnelle*, là où Kafka demeure un *journal à rétention relisable*.#footnote[Exactly once support — IBM MQ 9.4.x Documentation — IBM — 2024 — #link("https://www.ibm.com/docs/en/ibm-mq/9.4.x?topic=scenarios-exactly-once-support")]#footnote[Syncpoints in IBM MQ for Multiplatforms — IBM MQ 9.3.x Documentation — IBM — 2024 — #link("https://www.ibm.com/docs/en/ibm-mq/9.3.x?topic=work-syncpoints-in-mq-multiplatforms")]#footnote[MQCMIT (Commit changes) — IBM MQ Documentation — IBM — 2024 — #link("https://www.ibm.com/docs/en/ibm-mq/9.2.x?topic=i-mqcmit-commit-changes")]

#block(fill: rgb("#fff8e1"), inset: 8pt, radius: 3pt, width: 100%)[
*Réserve méthodologique de premier ordre (à ne pas lisser).* Les pages `ibm.com` (`/docs`, `/new/announcements`, `/support`) renvoient *HTTP 403* à l'agent de _fetch_. Leur contenu a été corroboré via extraits de recherche pointant ces mêmes pages primaires et via blogs d'ingénieurs *IBM Hursley* signés (Ian Harwood) ; une *lecture intégrale directe n'a pu être faite*. D'où le marqueur `probable` partout où la double corroboration restait indirecte — notamment le *détail du protocole XA / 2PC embarqué* (coordinateur vs participant).
]

La sémantique de MQ se distingue sur deux axes décisifs pour l'architecture agentique. Premièrement, le *sort du message* : retiré de la file à la consommation validée (modèle file, point-to-point + pub/sub), là où Kafka *conserve* le message pour relecture/replay (journal partitionné). Deuxièmement, la *coordination multi-ressources* : MQ s'appuie sur *2PC / X-Open XA* (détail embarqué `à vérifier`, 403), tandis que Kafka attend KIP-939 (version cible `à vérifier`). Le @tab-mq-kafka synthétise ces dimensions et la règle de choix associée.

#figure(
  table(
    columns: 3,
    align: left,
    table.header[*Dimension*][*IBM MQ*][*Apache Kafka*],
    [Modèle de données], [*File* (point-to-point + pub/sub)], [*Journal distribué partitionné* à rétention],
    [Sort du message après consommation], [*Retiré* (à la consommation validée)], [*Conservé* (relecture / replay possible)],
    [Garantie native], [Once-and-only-once (persistant + #angl[syncpoint] + coordination)], [EOS bornée au périmètre interne Kafka],
    [Coordination multi-ressources], [*2PC / X-Open XA* (détail XA `à vérifier`, 403)], [KIP-939 (2PC externe) « Accepted », version `à vérifier`],
    [Fan-out multi-consommateurs], [Limité], [*Natif* (groupes indépendants)],
    [Critère de préférence], [Atomicité transactionnelle / ordre / conformité financière], [Débit / replay / fan-out / découplage temporel],
  ),
  caption: [IBM MQ vs Apache Kafka : sémantique et critères de choix. Sources : doc IBM MQ 9.x ; KIP-939 ; comparatif OpenLogic. La ligne « critère de préférence » est une synthèse argumentative (voir infra), non un fait normatif.],
) <tab-mq-kafka>

Côté versions, *MQ 9.4.0 LTS* a été annoncé le 14 mai 2024, *GA le 18 juin 2024*, supporté *≥ juin 2029*, extensible jusqu'à *2033* (support OpenTelemetry).#footnote[Introducing IBM MQ version 9.4: Built for change — IBM — 2024-05-14 — #link("https://www.ibm.com/new/announcements/introducing-ibm-mq-version-9-4-built-for-change")] *MQ 9.4.5 CD* est *GA le 5 février 2026* (Multiplateformes/Appliance ; Java 25, .NET 10, EKS Operator GA), correctifs jusqu'au 5 février 2027 ; la *date z/OS exacte (2026-02-20) reste `à vérifier`* (le billet IBM dit « PTFs available now » sans date z/OS distincte).#footnote[IBM MQ 9.4.5 Continuous Delivery releases are available — IBM Community (Ian Harwood, IBM Hursley) — 2026-01-30 — #link("https://community.ibm.com/community/user/blogs/ian-harwood1/2026/01/30/mq945ga")] La cadence CD 2025 (relevée à `confirmé` via blogs Hursley) : 9.4.2 (GA 27 fév. 2025 ; z/OS 21 mars 2025), 9.4.3 (GA 17 juin 2025), 9.4.4 (GA 16 oct. 2025 ; z/OS 31 oct. 2025).#footnote[IBM MQ 9.4.4 Continuous Delivery releases are available — IBM Community (Ian Harwood, IBM Hursley) — 2025-10-10 — #link("https://community.ibm.com/community/user/blogs/ian-harwood1/2025/10/10/mq944ga")]#footnote[Enhancing security, productivity and resilience with IBM MQ 9.4.3 — IBM — 2025-06-10 — #link("https://www.ibm.com/new/announcements/enhancing-security-productivity-and-resilience-with-ibm-mq-9-4-3")] Côté fin de vie, 9.3 LTS standard *2027-09-30* (étendu 2031-09-30) ; 9.2 LTS standard *2025-09-30 (échu)* / étendu 2029-09-30 (`confirmé` via endoflife.date).#footnote[IBM MQ — endoflife.date — endoflife.date — 2026 — #link("https://endoflife.date/ibm-mq")]

Le *pontage MQ → Kafka* via Kafka Connect n'atteint l'#angl[exactly-once] que sous *contraintes strictes* (confirmées par les docs Confluent ET IBM Event Streams), faute de quoi le régime retombe à _at-least-once_ : un seul consommateur (`tasks.max=1`), file d'état dédiée, mode distribué, `exactly.once.source.support=enabled`, ACL appropriées, Connect ≥ 3.3.0.#footnote[IBM MQ Source Connector for Confluent Platform — Overview — Confluent — 2025 — #link("https://docs.confluent.io/kafka-connectors/ibmmq-source/current/overview.html")]#footnote[Running the MQ source connector — IBM Event Automation / Event Streams — IBM — 2025 — #link("https://ibm.github.io/event-automation/es/connecting/mq/source/")]

```properties
# Connecteur source MQ -> Kafka : EOS UNIQUEMENT sous ces contraintes
tasks.max=1                              # un seul consommateur, sinon at-least-once
exactly.once.source.support=enabled      # exige Connect en mode distribué, >= 3.3.0
# + file d'état dédiée + ACL appropriées (cf. docs Confluent / IBM Event Streams)
```

Une *divergence de numérotation* doit être conservée, non lissée : deux lignées distinctes. Le connecteur open-source IBM `kafka-connect-mq-source` introduit l'#angl[exactly-once] en *v2.0.0* (v1 = at-least-once), tandis que la distribution Confluent suit sa propre numérotation (*v12.x* support introduit, v11.x déprécié). Les deux numéros désignent des *artefacts/packagings différents* et *ne sont pas contradictoires*.#footnote[kafka-connect-mq-source (README) — ibm-messaging (GitHub) — IBM — 2025 — #link("https://github.com/ibm-messaging/kafka-connect-mq-source/blob/main/README.md")]

#figure(
  table(
    columns: 4,
    align: left,
    table.header[*Lignée*][*Artefact*][*Exactly-once introduit*][*Statut antérieur*],
    [IBM open-source], [`kafka-connect-mq-source`], [*v2.0.0*], [v1 = at-least-once],
    [Confluent Platform], [IBM MQ Source Connector], [*v12.x*], [v11.x déprécié],
  ),
  caption: [Lignées du connecteur source MQ → Kafka (divergence résolue : artefacts distincts, non contradictoires).],
) <tab-connecteur>

=== Compatibilité des garanties fortes avec l'incertitude agentique

La garantie forte du substrat et l'incertitude agentique sont *compatibles par cloisonnement*, non par fusion : le substrat borne le déterministe, l'agent occupe le probabiliste, et la frontière entre les deux est exactement le lieu d'arbitrage de l'#optau (cf. Ch. 5). Aucun des deux substrats n'« absorbe » l'incertitude de l'action externe ; tous deux la *rendent explicite*, ce qui est précisément ce qu'exige une décision sur #tfix.

De là découle une *règle de décision substrat*, qu'il faut énoncer pour ce qu'elle est — une *synthèse argumentative* (`probable`), *non* un fait normatif : préférer *MQ* lorsque l'atomicité transactionnelle, l'ordre strict et la conformité (financière, réglementaire) priment ; préférer *Kafka* lorsque le débit, le replay, le _fan-out_ multi-consommateurs et le découplage temporel priment.#footnote[IBM MQ vs. Kafka vs. ActiveMQ: Comparing Message Brokers — OpenLogic (Perforce) — 2024 — #link("https://www.openlogic.com/blog/ibm-mq-vs-kafka-vs-activemq")]#footnote[The Future of AI Agents Is Event-Driven — Confluent (Sean Falconer) — 2025-05-13 — #link("https://www.confluent.io/blog/the-future-of-ai-agents-is-event-driven/")] La thèse adjacente « event-driven > RPC » pour l'orchestration d'agents relève du même registre `probable` (positionnement d'éditeur, non démonstration neutre).

Articulation au #cia (cf. Ch. 6, sans le redéfinir) : l'algèbre d'héritage de garanties prend ici un appui concret. Une session agentique qui *consomme* depuis un substrat once-and-only-once n'hérite de cette force *qu'en deçà* de la frontière d'effet de bord ; au-delà, la garantie *dégénère* en _at-least-once_ effective, et le type de session probabiliste / tolérant au _drift_ doit en rendre compte. La force du substrat est une *borne supérieure* sur la garantie agentique de bout en bout, jamais une garantie de bout en bout en soi.

=== Questions ouvertes

Les incertitudes du dossier, conservées telles quelles (à trancher en relance), sont hétérogènes et portent autant sur les chiffres que sur les détails de protocole inaccessibles :

- *Surcoût EOS Kafka.* Existe-t-il un *rapport de performance primaire* (Apache/Confluent horodaté) quantifiant le surcoût latence/débit de l'EOS ? À défaut des ~2–5 ms / ~10–20 % de sources secondaires (`à vérifier`), produire une mesure propre sur `AgentMeshKafka`.
- *Défauts à recouper.* Le défaut serveur `isolation.level=read_uncommitted` et le plafond `max.in.flight ≤ 5` sous idempotence sont à recouper sur `kafka.apache.org/documentation`, plutôt que sur le billet Confluent.
- *KIP-939 (2PC).* Quelle version exacte d'Apache Kafka intégrera la participation 2PC ? Page KIP muette — vérifier les notes 4.x ultérieures et FLIP-319.
- *XA / 2PC dans MQ.* Détail exact du protocole (coordinateur embarqué vs participant) — page IBM en 403 ; piste : Redbook IBM MQ ou cache Knowledge Center.
- *Native HA Cross-Region Replication (CRR).* Version d'introduction *non résolue* — *9.4.2* vs *9.4.3* selon des extraits d'annonce IBM divergents (`probable`) ; et l'affirmation *« RPO zéro »* reste non lue sur source primaire (réplication asynchrone ⇒ RPO non nul en théorie). À trancher par lecture directe (bloquée par 403).
- *Date z/OS de MQ 9.4.5.* Claim initial 2026-02-20 ; le billet IBM dit « PTFs available now » sans date z/OS distincte (`à vérifier`).
- *Positionnement marché mainframe.* Les chiffres (IBM Z ~63 %, > 70 % Fortune 500) sont d'*analystes* (Mordor, BMC), non corroborés par source primaire éditeur (`à vérifier`).
- *Méthodologie.* Prévoir une vérification manuelle/navigateur des dates IBM haut-enjeu, le _fetch_ direct étant bloqué par HTTP 403.

#pagebreak()

== Ch. 10 — Modernisation du mainframe IBM Z

#emph[Insight-clé.] En date de juin 2026, la modernisation du mainframe IBM Z ne se joue plus comme un projet de #angl[wrapping] d'actifs hérités mais comme la #strong[constitution d'une couche d'intégration agentique standardisée sur #angl[MCP]] : z/OS Connect expose les API d'actifs CICS/IMS/Db2 (et MQ, `probable`) en #strong[outils #angl[MCP]] depuis la version 3.0.98 (21 octobre 2025) #footnote[#emph[z/OS Connect — API existantes exposées comme outils MCP (v3.0.98)] — IBM (label dossier `zosc-mcp`) — 21 octobre 2025 — URL `à vérifier` (page `ibm.com/docs` en HTTP 403 lors de la collecte).] (`confirmé`), tandis que watsonx Assistant for Z, watsonx Code Assistant for Z et un #angl[MCP Gateway] open-source (ContextForge) fédèrent ces actifs sous une interface commune. La thèse architecturale de ce chapitre : #strong[le mainframe est le substrat à garanties fortes par excellence du côté déterministe de l'#optau] (cf. Ch. 5) — les transactions CICS/IMS et la coordination Db2/MQ matérialisent la fixation du sens en régime déterministe, et l'#optau dispatche vers le régime probabiliste (agent #angl[LLM]) sans relâcher ces garanties. #strong[Correction normative] : le claim « z/OS Connect 3.0.101 = dernière version » est #strong[périmé] en juin 2026 ; 3.0.102 (avril 2026) puis la #angl[CD update] 3.0.103 (mai 2026, APAR PH70973) lui succèdent #footnote[#emph[z/OS Connect — versions 3.0.102 / 3.0.103 (APAR PH70973)] — IBM Community blog (label dossier `zosc-version-latest`) — avril–mai 2026 — URL `à vérifier`. Divergence de datation intra-source pour 3.0.102 : URL portant le 20 avril 2026, corps de l'article indiquant le 23 avril 2026 — retenir « avril 2026 ».] (`confirmé`).

=== L'exposition d'actifs : z/OS Connect comme charnière déterministe→agentique

#strong[z/OS Connect est la charnière qui transmute un actif transactionnel hérité en outil consommable par un agent, sans déplacer la frontière de garantie.] L'actif (programme CICS, transaction IMS, requête Db2) demeure le siège de la fixation déterministe du sens — verrouillage, journalisation, intégrité référentielle — et z/OS Connect n'en altère ni la sémantique ni la grandeur traitée ; il en publie une description OpenAPI (OAS3) consommable des deux côtés de l'#optau (cf. Ch. 5).

En date de juin 2026, z/OS Connect se déploie en #angl[Started Task], en #angl[CICS JVM Server] ou en conteneur OCI, sur une base Liberty portée à 26.0.0.3 en 3.0.102 (contre 25.0.0.9 en 3.0.98) #footnote[#emph[z/OS Connect — modes de déploiement et socle Liberty] — IBM (labels dossier `zosc-deploy`, `zosc-3102`) — 2025–2026 — URL `à vérifier`.] (`confirmé`). Il couvre CICS, IMS et Db2 de façon confirmée ; #strong[la couverture MQ figure sur la page produit mais n'a pas été re-confirmée] dans la documentation 3.0 (page `ibm.com/docs` en HTTP 403 lors de la collecte) #footnote[#emph[z/OS Connect — portée des sous-systèmes (CICS/IMS/Db2 confirmés ; MQ non re-confirmé en doc 3.0)] — IBM (label dossier `zosc-subsystems`) — 2026 — URL `à vérifier`.] (`probable` pour MQ). Deux modes coexistent : le mode #strong[#angl[provider]] (l'actif Z exposé comme service) et le mode #strong[#angl[API requester] sortant] OAS3 (l'actif Z appelant une API externe) #footnote[#emph[z/OS Connect — modes provider et API requester sortant (OAS3)] — IBM (label dossier `zosc-requester`) — 2026 — URL `à vérifier`.] (`confirmé`). Cette directionnalité importe pour l'#optau : le mode #angl[requester] est précisément le point où un actif déterministe peut solliciter un service externe — potentiellement probabiliste — franchissant alors la frontière que l'#optau a pour rôle d'arbitrer (cf. Ch. 5).

#strong[Réserve à ne pas lisser] : le #strong[transport #angl[MCP]] exact (HTTP #angl[streamable] / SSE / stdio) et le #strong[modèle d'authentification] employés par z/OS Connect 3.0 demeurent `à vérifier` — la documentation primaire est inaccessible (HTTP 403) #footnote[#emph[z/OS Connect — transport et authentification MCP non confirmés (docs en HTTP 403)] — IBM (label dossier `zosc-mcp-mechanism`) — 2026 — URL `à vérifier` (piste : PDF Knowledge Center ou client authentifié).] (`à vérifier`). De même, l'attribution de l'exécution #angl[in-CICS-region] à la version 3.0.88 (décembre 2024) reste `probable`, l'historique des changements étant inaccessible.

```yaml
# Esquisse d'exposition d'un actif CICS en outil MCP via z/OS Connect (illustratif).
# Le transport et le bloc d'authentification MCP exacts de la 3.0 sont « a verifier »
# (docs ibm.com en HTTP 403 lors de la collecte) ; placeholders explicites ci-dessous.
apiVersion: zosconnect/v3
service:
  name: paiement-virement            # actif herite : programme CICS COBOL
  subsystem: CICS                    # CICS | IMS | Db2 ( MQ : a verifier en 3.0 )
  region: CICSPRD1                   # execution in-CICS-region : attribuee a 3.0.88 ( probable )
  contract: openapi-3.0             # description OAS3 consommee des deux cotes de tau
exposeAs:
  mcpTool:
    name: executer_virement
    description: "Execute un virement interbancaire transactionnel (CICS)."
    # transport: a-verifier            # HTTP streamable | SSE | stdio  -> a verifier
    # auth:      a-verifier            # modele d'auth MCP 3.0          -> a verifier
```

=== watsonx for Z : l'agentique on-Z et l'orchestration multi-agents

#strong[Le second pilier de la modernisation Z est la pile watsonx, qui apporte l'orchestration multi-agents et l'inférence #emph[on-Z], rapprochant le calcul probabiliste du substrat déterministe.] Le tableau qui suit cartographie l'écosystème ; il met en évidence que, du côté agentique, #angl[MCP] joue partout le rôle d'interface d'intégration commune.

#strong[watsonx Assistant for Z] a atteint la #strong[GA agentique le 19 novembre 2025] (Agent Builder, orchestration multi-agents) #footnote[#emph[watsonx Assistant for Z — GA agentique (Agent Builder, orchestration multi-agents)] — IBM (label dossier `wxa4z-agentic`) — 19 novembre 2025 — URL `à vérifier`.] (`confirmé`), puis #strong[v3.2 (GA 13 mars 2026)] avec #angl[flow builder] graphique et intégration ACF2/Top Secret via SAF #footnote[#emph[watsonx Assistant for Z v3.2 (flow builder graphique, ACF2/Top Secret via SAF)] — IBM (label dossier `wxa4z-v32`) — 13 mars 2026 — URL `à vérifier`.] (`confirmé`). L'inférence #emph[on-Z] est devenue réelle avec #strong[Spyre en GA le 12 décembre 2025] (Granite 3.3-8B-instruct sur z17) #footnote[#emph[Spyre pour watsonx Assistant for Z — GA (Granite 3.3-8B-instruct sur z17)] — IBM (label dossier `wxa4z-spyre`) — 12 décembre 2025 — URL `à vérifier`.] (`confirmé`) : ici, le côté probabiliste de l'#optau s'exécute sur l'accélérateur même qui jouxte le substrat transactionnel, réduisant la latence d'aller-retour à travers la frontière. Le dépôt `IBM/z-ai-agents` v1.2.1 (15 mai 2026) fournit des #angl[Helm charts] et des agents nommés (CICS, Db2, IMS, OMEGAMON, zRAG, Concert) #footnote[#emph[IBM/z-ai-agents v1.2.1 (Helm charts, agents CICS/Db2/IMS/OMEGAMON/zRAG/Concert)] — IBM, dépôt GitHub `IBM/z-ai-agents` (label dossier `z-ai-agents`) — 15 mai 2026 — URL `à vérifier`.] (`confirmé`). #strong[Réserve] : que la couche #angl[MCP] de watsonx Assistant for Z couvre nommément CICS et MQ (au-delà de Db2 et IMS) demeure `probable`.

#strong[watsonx Code Assistant for Z] fournit la #angl[code-gen] COBOL et une #angl[preview] Assembler depuis la v2.6 (27 juin 2025) #footnote[#emph[watsonx Code Assistant for Z v2.6 — code-gen COBOL + preview Assembler] — IBM (label dossier `wcaz-code-gen`) — 27 juin 2025 — URL `à vérifier`.] (`confirmé`), avec une expérience agentique et des outils #angl[MCP] (Z Understand Metadata Retrieval, Impact Analysis) en 2.8 #footnote[#emph[watsonx Code Assistant for Z 2.8 — expérience agentique + outils MCP (Metadata Retrieval, Impact Analysis)] — IBM (label dossier `wcaz-mcp`) — 2026 — URL `à vérifier`. Patch 2.8.20 issu de partner-source CROZ : `probable`.] (`confirmé`, le patch 2.8.20 partner-source CROZ restant `probable`).

#figure(
  table(
    columns: 4,
    table.header([*Produit / Dépôt*], [*Capacité agentique / MCP*], [*Version & date*], [*Statut*]),
    [#strong[z/OS Connect]], [API exposées comme outils #angl[MCP]], [3.0.103 (mai 2026) ; MCP dès 3.0.98 (21 oct. 2025)], [`confirmé`],
    [#strong[watsonx Assistant for Z]], [Agent Builder ; #angl[MCP] comme couche d'intégration], [v3.2 (GA 13 mars 2026) ; agentique GA 19 nov. 2025], [`confirmé`],
    [#strong[Spyre pour watsonx Assistant for Z]], [Inférence #emph[on-Z] (Granite 3.3-8B)], [GA 12 déc. 2025], [`confirmé`],
    [#strong[watsonx Code Assistant for Z]], [Expérience agentique + outils #angl[MCP]], [2.8 (code-gen v2.6, 27 juin 2025)], [`confirmé`],
    [#strong[IBM Bob]], [Partenaire AI-first multi-modèles], [GA 28 avril 2026], [`confirmé`],
    [#strong[Bob Premium Package for Z]], [Modes Architect/Code, contexte Zaware], [preview privée sans frais (à la GA)], [`confirmé`],
    [#strong[Cloud Pak for Integration 16.1.3]], [AI Agents (langage naturel)], [GA 17 déc. 2025 ; AI Agents preview → 31 mars 2026], [`confirmé`],
    [#strong[mcp-context-forge (#angl[MCP Gateway])]], [Fédère #angl[MCP]/A2A/REST/gRPC (Apache-2.0)], [v1.0.2 (26 mai 2026)], [`confirmé`],
    [#strong[IBM/z-ai-agents]], [#angl[Helm charts] d'agents Z], [v1.2.1 (15 mai 2026)], [`confirmé`],
    [#strong[Z Open Editor]], [40 outils #angl[MCP], mode Agent via Zowe], [MCP dès v6.0.0 (19 sept. 2025)], [`confirmé`],
  ),
  caption: [Cartographie de l'agentique mainframe IBM Z (en date de juin 2026). Sources : labels dossier `zosc-*`, `wxa4z-*`, `wcaz-*`, `bob-*`, `cp4i-*`, `mcp-gateway`, `z-ai-agents`, `zopeneditor-mcp` — IBM / GitHub — URL `à vérifier` (docs `ibm.com` en HTTP 403).],
) <tab-z-agentique>

=== Cloud Pak for Integration et le MCP Gateway : fédérer les protocoles

#strong[Au-delà du mainframe stricto sensu, l'intégration agentique d'entreprise s'appuie sur deux briques de fédération : Cloud Pak for Integration et un #angl[MCP Gateway] open-source.] Toutes deux répondent au même besoin — donner à un agent un point d'accès unique et gouverné à une hétérogénéité de protocoles, ce qui est la condition pratique de l'interopérabilité (sens préservé) par opposition à la simple connectivité.

#strong[Cloud Pak for Integration 16.1.3] est GA depuis le 17 décembre 2025 (OpenShift 4.19/4.20, Kubernetes 1.33), ses #strong[AI Agents] étant en #angl[tech preview] jusqu'au 31 mars 2026 #footnote[#emph[Cloud Pak for Integration 16.1.3 — GA (OpenShift 4.19/4.20, K8s 1.33) ; AI Agents en tech preview] — IBM (labels dossier `cp4i-version`, `cp4i-ai-agents`) — 17 décembre 2025 — URL `à vérifier`.] (`confirmé`). Les versions exactes de chaque composant (ACE, API Connect, MQ, DataPower, Event Streams, Aspera, webMethods) restent `à vérifier` (docs en HTTP 403).

Le #strong[#angl[MCP Gateway] (mcp-context-forge / ContextForge)], publié sous Apache-2.0, fédère #angl[MCP], A2A, REST et gRPC en v1.0.2 (26 mai 2026) #footnote[#emph[mcp-context-forge (MCP Gateway / ContextForge) v1.0.2 — fédère MCP/A2A/REST/gRPC, Apache-2.0] — IBM, dépôt GitHub (label dossier `mcp-gateway`) — 26 mai 2026 — URL `à vérifier`.] (`confirmé`). Côté outillage développeur, #strong[Z Open Editor] introduit #angl[MCP] dès la v6.0.0 (19 septembre 2025, 40 outils #angl[MCP], mode Agent VS Code via Zowe) #footnote[#emph[Z Open Editor v6.0.0 — 40 outils MCP, mode Agent VS Code via Zowe] — IBM (label dossier `zopeneditor-mcp`) — 19 septembre 2025 — URL `à vérifier`.] (`confirmé`).

```json
// Esquisse de politique de federation MCP Gateway (illustratif) :
// un agent n'atteint l'actif transactionnel Z que via le cote deterministe de tau.
{
  "route": "executer_virement",
  "backend": { "protocol": "mcp", "target": "zosconnect:executer_virement" },
  "policy": {
    "decision_dimension": {
      "d-autorite": "autorite_appelant x autorite_requise_cible >= seuil",
      "d-invariant": "invariants transactionnels CICS preserves sur la trace"
    },
    "on_refus": "rejeter et journaliser (cf. Decision in {Deterministe, Probabiliste, Refus})"
  }
}
```

=== IBM Bob : le partenaire AI-first et la divergence de sources sur les modèles

#strong[IBM Bob, successeur AI-first, illustre une divergence de sources que ce chapitre conserve sans la lisser.] Bob atteint la #strong[GA mondiale le 28 avril 2026] #footnote[#emph[IBM Bob — GA mondiale] — IBM Newsroom (label dossier `bob-ga`) — 28 avril 2026 — URL `à vérifier`.] (`confirmé`), assorti d'un #strong[Bob Premium Package for Z] (modes Architect/Code, contexte Zaware) en #strong[preview technique privée sans frais] #footnote[#emph[Bob Premium Package for Z — modes Architect/Code, contexte Zaware (preview privée sans frais)] — IBM (label dossier `bob-premium`) — avril 2026 — URL `à vérifier`.] (`confirmé`).

#strong[La divergence porte sur les modèles employés.] Les sources secondaires (The Register, DevClass) restent #strong[génériques] — « #angl[frontier LLMs] / open-source / SLM / Granite » — sans nommer aucun modèle ; leur lecture, exacte, ne permettait pas de trancher (d'où un « à vérifier » initial). #strong[Mais la source primaire — IBM Newsroom (28 avril 2026) — nomme explicitement] « #emph[a mix of frontier models including Anthropic Claude, Mistral open source models, and IBM Granite] ». #strong[Anthropic Claude et Mistral sont donc `confirmés` par la source primaire éditeur] ; seul #strong[Meta Llama demeure `à vérifier`] (non nommé). Le tableau ci-dessous consigne cette révision ; pour le #emph[naming], la citation normative est l'annonce IBM Newsroom, #strong[non] The Register/DevClass.

#figure(
  table(
    columns: 4,
    table.header([*Modèle*], [*Sources secondaires (The Register / DevClass)*], [*IBM Newsroom (primaire, 28 avril 2026)*], [*Statut révisé*]),
    [« #angl[frontier LLMs] / open-source / SLM / Granite »], [Oui (formulation générique)], [Oui], [`confirmé`],
    [#strong[Anthropic Claude]], [Non nommé], [Nommé explicitement], [#strong[`confirmé`] (et non « à vérifier »)],
    [#strong[Mistral] (open source)], [Non nommé], [Nommé explicitement], [#strong[`confirmé`]],
    [#strong[Meta Llama]], [Non nommé], [Non nommé], [Non confirmé / `à vérifier`],
  ),
  caption: [IBM Bob — modèles employés : révision du verdict par confrontation source primaire vs secondaires. Source primaire pour le #emph[naming] : IBM Newsroom, 28 avril 2026 #footnote[#emph[IBM Bob — « a mix of frontier models including Anthropic Claude, Mistral open source models, and IBM Granite »] — IBM Newsroom (label dossier `bob-models`) — 28 avril 2026 — URL `à vérifier`. Note de vérification critique : conclusion initiale « réfuté/à vérifier » périmée ; Claude et Mistral `confirmés` par source primaire, Llama demeure `à vérifier`.].],
) <tab-bob-modeles>

=== Ancrage théorique : le mainframe, substrat à garanties fortes de l'opérateur τ

#strong[Le mainframe IBM Z fournit le substrat déterministe le plus mûr sur lequel l'#optau puisse dispatcher : ses garanties transactionnelles ne sont pas approximées par convention mais imposées par le moniteur transactionnel.] CICS et IMS fixent le sens d'une opération (`t_fix(g)`, cf. Ch. 5) au moment du #angl[commit] — atomicité, isolation, durabilité — et Db2/MQ étendent cette fixation à la coordination inter-ressources. Du point de vue de l'#optau, un appel à `executer_virement` exposé par z/OS Connect relève sans ambiguïté du régime #strong[Déterministe] de la #decision : la grandeur `g` (le virement) y est traitée sous garantie, et la #dinvariant porte sur des invariants transactionnels effectivement vérifiables sur la trace. L'#optau n'altère pas `g` ; il décide #emph[où] le sens se fixe — sur le substrat Z déterministe, ou en aval dans un agent #angl[LLM] probabiliste (cf. Ch. 5).

Cet ancrage rejoint le constat transversal de la Partie III : la frontière déterministe/probabiliste est #strong[empiriquement attestée] (l'#angl[exactly-once] de Kafka borne la garantie au périmètre interne ; tout effet de bord externe — dont l'appel à une API #angl[LLM] — y échappe). Le mainframe en est le versant le plus exigeant : un agent ne doit jamais inférer un effet transactionnel ; il doit #emph[invoquer] l'actif Z, qui seul détient l'autorité de fixer le sens. C'est précisément ce que la #dautorite arbitre — l'autorité de l'appelant (l'agent) composée à l'autorité requise par la cible (la transaction Z). L'#strong[instanciation en services financiers] de cette discipline — où la moindre violation d'invariant transactionnel a une portée réglementaire — est développée au Ch. 19.

L'enjeu pour le #cia (cf. Ch. 6) est explicite : l'#strong[algèbre d'héritage de garanties] doit modéliser ce qu'un agent #emph[hérite] lorsqu'il invoque un actif Z via z/OS Connect — la garantie transactionnelle CICS/IMS se propage-t-elle, ou s'arrête-t-elle à la frontière #angl[MCP] ? Tant que le transport et l'authentification #angl[MCP] de z/OS Connect 3.0 restent `à vérifier` (HTTP 403), cette propagation ne peut être formellement caractérisée — limite qui touche directement au statut de l'invariant #i4.

=== Questions ouvertes

Les incertitudes suivantes, reprises du dossier (en date de juin 2026), conditionnent toute conclusion architecturale de ce chapitre :

- #strong[Transport et authentification #angl[MCP] de z/OS Connect 3.0] : quel transport (HTTP #angl[streamable] / SSE / stdio) et quel modèle d'authentification ? Documentation primaire en HTTP 403 — vérifier via PDF Knowledge Center ou client authentifié (`à vérifier`).
- #strong[Exécution #angl[in-CICS-region]] : a-t-elle été introduite précisément en 3.0.88 / décembre 2024 ? Historique des changements inaccessible (`probable`).
- #strong[Modèles d'IBM Bob] : Bob emploie-t-il nommément #strong[Meta Llama] ? IBM Newsroom nomme Claude et Mistral, pas Llama (`à vérifier`).
- #strong[Couche #angl[MCP] de watsonx Assistant for Z] : couvre-t-elle nommément #strong[CICS et MQ] (au-delà de Db2 et IMS) ? (`probable`).
- #strong[Couverture MQ de z/OS Connect 3.0] : listée sur la page produit, non re-confirmée en doc 3.0 (HTTP 403) (`probable`).
- #strong[Release postérieure à 3.0.103] : existe-t-il une version z/OS Connect ultérieure en juin 2026 ? Surveiller le flux « #angl[now available] » et les APAR.
- #strong[Composants de Cloud Pak for Integration 16.1.3] : versions exactes d'ACE, API Connect, MQ, DataPower, Event Streams, Aspera, webMethods — docs en HTTP 403 (`à vérifier`).

#strong[Réserve méthodologique transversale] : le blocage HTTP 403 sur `ibm.com/docs` impose une vérification manuelle (navigateur / client authentifié) des dates et détails techniques IBM à haut enjeu ; plusieurs URL de ce chapitre sont en conséquence marquées `à vérifier` plutôt que fabriquées, conformément à l'interdiction de fabrication.
