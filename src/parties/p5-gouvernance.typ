#import "../../lib/canon.typ": *

= PARTIE V — Observabilité, traçabilité et gouvernance

== Ch. 14 — Observabilité et provenance agentiques

*Insight-clé.* En date de juin 2026, l'instrumentation normalisée des systèmes agentiques *existe* mais *n'offre aucune garantie de stabilité d'API* : la totalité des conventions sémantiques OpenTelemetry GenAI demeure en statut *« Development »* (expérimental), vérification page par page, sans aucune sous-section *« Stable »* (confirmé, haut enjeu).#footnote[Semantic conventions for generative AI systems (badge Development) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/]#footnote[Semantic conventions for generative AI spans (badge Development vérifié) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/] Ce noyau mouvant est entouré d'un socle de provenance stable mais antérieur à l'ère agentique (W3C PROV-DM, Recommandation inchangée depuis le 30 avril 2013), d'un standard de lignage gradué et activement versionné (OpenLineage v1.48.0, 2026-06-03), d'un standard de provenance de contenu (C2PA v2.4, avril 2026) et d'un cadre réglementaire de marquage machine (art. 50 du Règlement (UE) 2024/1689, applicable le 2 août 2026). La conséquence architecturale est nette : toute pile d'interopérabilité doit traiter l'observabilité agentique comme un *opt-in* explicite et versionné, jamais comme un acquis implicite.

*Ancrage théorique (cf. Ch. 5, Ch. 6).* Cet appareil n'est pas un instrument de confort opérationnel : c'est le support de réfutabilité du cadre. La trace observable est le substrat sur lequel les invariants #invariant(1, "Hypothèse")–#invariant(5, "Hypothèse") sont énoncés et vérifiés — sans trace, leur condition de réfutation n'a pas de référent. La dimension #dinvariant de l'#optau (cf. Ch. 5) lit précisément *l'état des invariants sur la trace* ; elle présuppose donc une trace fidèle, attribuée et non répudiable. Symétriquement, la provenance est une *condition de falsifiabilité* (cf. CLAUDE.md §4) : pour qu'un énoncé du #cia (cf. Ch. 6) sur l'héritage de garanties soit réfutable, il faut pouvoir reconstruire la chaîne causale prompt → décision → invocation qui l'a produit. L'enjeu de ce chapitre est donc de confronter ce que les standards de juin 2026 permettent réellement d'attester à ce que la falsifiabilité du cadre exige.

=== 14.1 OpenTelemetry GenAI : un corpus entièrement expérimental

*L'instrumentation agentique d'OpenTelemetry couvre déjà spans d'agent, exécution d'outils et MCP, mais chaque sous-section porte le badge « Development » — aucune n'est « Stable » (confirmé, haut enjeu).*#footnote[Semantic conventions for generative AI spans (attributs + texte sampling) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/] La version-parapluie courante des Semantic Conventions est v1.41.1, publiée le 2026-05-11 (`published_at` 2026-05-11T22:28:25Z) ; ce patch exclut deux métriques k8s de la génération de code (#3711) et *ne contient aucun changement GenAI* — la dernière version porteuse d'ajouts GenAI est v1.41.0 (2026-04-28).#footnote[Release v1.41.1 / GitHub API releases (tag_name + published_at ISO) — OpenTelemetry / GitHub — 2026-05-11 — https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.1]#footnote[Release v1.41.0 / GitHub API releases (ajout time_to_first_chunk / time_per_output_chunk ; v1.37.0 = 2025-08-25) — OpenTelemetry / GitHub — 2026-04-28 — https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.0]

La discipline de transition est explicite et doit être reprise telle quelle par toute architecture : le *baseline* de stabilité des conventions GenAI est v1.36.0 (2025-07-05) ; les instrumentations existantes *« SHOULD NOT change the version of the GenAI conventions that they emit by default »*, et l'adhésion à la dernière version expérimentale passe par la variable d'environnement `OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental` (confirmé). C'est ici que l'*opt-in* versionné prend une forme concrète :

```yaml
# Adhésion EXPLICITE aux conventions GenAI expérimentales (statut Development).
# Sans cet opt-in, l'instrumentation émet le baseline v1.36.0 (2025-07-05) et NE DOIT PAS
# changer de version par défaut. À versionner et à consigner dans l'ADR d'observabilité.
env:
  OTEL_SEMCONV_STABILITY_OPT_IN: "gen_ai_latest_experimental"   # API NON garantie stable
```

Un dépôt dédié `open-telemetry/semantic-conventions-genai` existe (gestion des dépendances via *Weaver* ; spans / métriques / événements clients GenAI, MCP, conventions fournisseurs), mais la page indique explicitement *« No releases published »* (confirmé).#footnote[GitHub — open-telemetry/semantic-conventions-genai (README + « No releases published ») — OpenTelemetry / GitHub — 2026 — https://github.com/open-telemetry/semantic-conventions-genai] Nuance à conserver, et non à lisser : la ligne README de ce dépôt énumère *« OpenAI, etc. »* et *ne nomme pas* Anthropic / Azure / Bedrock, lesquels figurent en revanche sur le hub `gen-ai/`.#footnote[Semantic Conventions for GenAI agent and framework spans (opérations et variantes) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/]

Le contenu instrumental (toujours en statut *Development*) couvre quatre couches utiles à l'attribution agentique :

```typ
// Span GenAI minimal — attributs requis à la création (décisions d'échantillonnage).
gen_ai.request.model         // ex. modèle demandé
gen_ai.provider.name         // fournisseur
gen_ai.operation.name        // opération
gen_ai.usage.input_tokens
gen_ai.usage.output_tokens
gen_ai.response.finish_reasons
gen_ai.response.id
gen_ai.conversation.id       // corrélation multi-tours
server.address               // requis à la création du span (sampling)
server.port                  // idem
```

- *Spans agent / framework* : opérations `create_agent`, `invoke_agent`, `invoke_workflow`, `execute_tool`. `invoke_agent` distingue une variante *Client Span* (invocation d'agent sur service distant — p. ex. OpenAI Assistants API, AWS Bedrock Agents) d'une variante *Internal Span* (même processus — p. ex. LangChain, CrewAI), avec les attributs `gen_ai.agent.{id,name,version,description}`. Cette distinction est exploitable directement pour situer l'autorité dans une chaîne de délégation (cf. #dautorite, Ch. 5).
- *Métriques* : 7 instruments, tous de type Histogram — côté client `gen_ai.client.token.usage`, `gen_ai.client.operation.duration`, `gen_ai.client.operation.time_to_first_chunk`, `gen_ai.client.operation.time_per_output_chunk` ; côté serveur `gen_ai.server.request.duration`, `gen_ai.server.time_per_output_token`, `gen_ai.server.time_to_first_token`. Les deux instruments `time_to_first_chunk` / `time_per_output_chunk` ont été ajoutés en v1.41.0 (2026-04-28).#footnote[Semantic conventions for generative AI metrics (7 Histograms) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-metrics/]
- *MCP* : spans client et serveur dont le *nom effectif* est `{mcp.method.name} {target}` (p. ex. `tools/call get-weather`), avec repli `{mcp.method.name}` ; `mcp.method.name` est *Required* ; autres attributs `mcp.session.id`, `mcp.protocol.version`, `mcp.resource.uri`, `gen_ai.tool.name`. Alignement sur la spécification #angl[MCP] 2025-06-18. Divergence à signaler explicitement : `span.mcp.client` / `span.mcp.server` sont des *identifiants de registre*, non le *span name* littéral.#footnote[Semantic conventions for MCP (span names, attributs, version 2025-06-18) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/mcp/]
- *Conventions fournisseurs* (hub GenAI) : Anthropic, Azure AI Inference, AWS Bedrock, OpenAI.

*Divergence résolue (à ne pas reconduire).* Le claim initial du dossier postulait un écart persistant entre le *changelog* (agrégation introduite en v1.37.0, 2025-08-25, *« GenAI chat history revamp »*) et la documentation rendue (événements *per-message* encore affichés). Vérification : cet écart *n'existe plus* en juin 2026. La page docs *« Generative AI events »* ne montre plus d'événements *per-message* ; elle expose désormais deux événements agrégés — `gen_ai.client.inference.operation.details` et `gen_ai.evaluation.result` — portant `gen_ai.input.messages`, `gen_ai.output.messages` et `gen_ai.system_instructions` (confirmé). La transition d'attributs reste néanmoins en statut *Development*.#footnote[Semantic conventions for Generative AI events (événements agrégés vérifiés) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-events/]

L'`gen_ai.client.inference.operation.details` est le candidat le plus direct comme support de *décision attestée* : il transporte, dans un événement unique et corrélé au span, les messages d'entrée, de sortie et les instructions système qui ont conditionné une décision de l'#optau. C'est, en l'état (expérimental), le maillon OTel le plus proche d'une trace réfutable au sens du Ch. 6.

=== 14.2 Provenance : W3C PROV stable mais antérieur, PROV-AGENT en recherche

*La provenance dispose d'un standard stable et figé — W3C PROV-DM — mais antérieur à l'ère agentique ; l'extension native vers l'agentique (PROV-AGENT) reste au stade recherche, non normalisée.* W3C PROV-DM est une Recommandation datée du 30 avril 2013 (en-tête : *« W3C Recommendation 30 April 2013 »*), avec trois types cœur — Entity, Activity, Agent — et *aucune révision ni v2* postérieure (confirmé, haut enjeu).#footnote[PROV-DM: The PROV Data Model (W3C Recommendation 30 April 2013) — W3C — 2013-04-30 — https://www.w3.org/TR/prov-dm/] La famille comprend des Recommandations (PROV-DM ; PROV-O, ontologie OWL2/RDF ; PROV-N ; PROV-CONSTRAINTS) et des Notes (PROV-OVERVIEW, PROV-PRIMER), toutes datées du 30 avril 2013.#footnote[PROV-O: The PROV Ontology — W3C — 2013-04-30 — https://www.w3.org/TR/prov-o/]#footnote[PROV-Overview (famille de documents PROV) — W3C — 2013-04-30 — https://www.w3.org/TR/prov-overview/]

La stabilité de PROV est ici un atout *et* une limite. Atout : le triplet Entity / Activity / Agent se projette sans friction sur une chaîne de délégation agentique — une décision est une *Activity*, l'agent appelant et l'agent cible sont des *Agent*, le prompt et la réponse des *Entity*, et la relation `wasGeneratedBy` / `wasAssociatedWith` reconstruit la causalité dont la falsifiabilité du #cia a besoin (cf. Ch. 6). Limite : PROV ignore, par construction (2013), la sémantique propre du régime probabiliste — prompts, instructions système, scores, *finish reasons*, *drift* — qui sont précisément ce que l'#optau arbitre (cf. Ch. 5). La projection est donc structurellement correcte mais sémantiquement appauvrie tant qu'aucune extension normalisée ne comble l'écart.

C'est l'objet de PROV-AGENT, qui reste *au stade recherche* : arXiv 2508.02866 (soumis le 2025-08-04 ; présenté à l'IEEE 21st International Conference on e-Science 2025, Chicago) étend PROV pour capturer prompts, réponses, décisions et invocations de modèles d'agents, en s'intégrant à #angl[MCP] (confirmé qu'il s'agit d'un travail de recherche).#footnote[PROV-AGENT: Unified Provenance for Tracking AI Agent Interactions in Agentic Workflows — Souza et al. (arXiv) / IEEE e-Science 2025 — 2025-08-04 — https://arxiv.org/abs/2508.02866] *À vérifier* : la présence dans les actes publiés IEEE e-Science 2025 (DOI Xplore) au-delà de la préimpression arXiv. Conséquence pour l'architecte : en juin 2026, la *décision attestée* native agentique relève encore d'un patron à construire (projection PROV maison + corrélation OTel), non d'un standard à consommer.

=== 14.3 Lignage : OpenLineage, gradué et activement versionné

*Pour les dépendances de données — distinctes des traces de services — OpenLineage est mature, gradué et activement versionné ; il est complémentaire d'OpenTelemetry, pas convergent.* OpenLineage en est à la version 1.48.0, publiée le 2026-06-03 (`published_at` 2026-06-03T09:19:08Z, confirmé via l'API GitHub `releases/latest`) ; spécification OpenAPI extensible par facettes (job / run / dataset) (confirmé, haut enjeu).#footnote[GitHub API — OpenLineage/OpenLineage releases/latest (tag 1.48.0, 2026-06-03) — OpenLineage / GitHub — 2026-06-03 — https://api.github.com/repos/OpenLineage/OpenLineage/releases/latest] C'est un projet de stade *Graduation* de la LF AI & Data Foundation — verbatim : *« OpenLineage is a graduation-stage project of the LF AI & Data Foundation. Contributed by: Datakin in May 2021 as an incubation-stage project and graduated in July 2023 »* ; Marquez est l'implémentation de référence (confirmé, haut enjeu).#footnote[OpenLineage — LFAI & Data (statut Graduation ; Datakin 2021-05, gradué 2023-07) — Linux Foundation AI & Data — 2026 — https://lfaidata.foundation/projects/openlineage/]

La complémentarité est le point structurant, et il ne faut pas la convertir en convergence : OpenLineage est une API de collecte de *lignage* (dépendances entre datasets et pipelines, *« équivalent des traces pour les données »*), distincte des traces de services d'OpenTelemetry. OpenLineage revendique s'être inspiré de l'architecture d'OpenTelemetry (*probable* — sources d'origine 2023, relation toujours valable en 2026 mais non re-datée).#footnote[How OpenLineage takes inspiration from OpenTelemetry — OpenLineage — 2023 — https://openlineage.github.io/blog/openlineage-takes-inspiration-from-opentelemetry/] Pour une architecture agentique, les deux piles répondent à deux questions causales différentes : *quelles décisions et invocations* ont eu lieu (OTel) versus *quelles données* ont alimenté et résulté de ces décisions (OpenLineage). La reconstruction complète d'une chaîne réfutable suppose de corréler les deux — c'est un travail d'intégration, non un standard unifié disponible.

*Adoption éditeur (IBM watsonx), modèle producteur-consommateur (probable, haut enjeu).* `watsonx.data` et `watsonx.data integration` *génèrent* des événements OpenLineage à l'exécution ; `watsonx.data intelligence` les *consomme et les exporte* au format OpenLineage.#footnote[OpenLineage for a unified lineage view across structured and unstructured data to enable explainable AI (date exacte à vérifier — 403 au fetch) — IBM — 2026 — https://www.ibm.com/new/announcements/openlineage-for-a-unified-lineage-view-across-structured-and-unstructured-data-to-enable-explainable-ai] Réserves explicites à conserver : il existe une série de ≥ 3 annonces IBM connexes ; la date exacte du communiqué cible (initialement 2026-03-02) n'a pu être re-confirmée par fetch direct (HTTP 403 sur ibm.com) — gardée en *à vérifier* ; la mention d'adoption parallèle Snowflake / Collibra / Atlan *n'a pas été re-vérifiée* sur source primaire.

=== 14.4 Provenance de contenu et marquage réglementaire

*La provenance bascule ici du registre technique au registre juridique : C2PA fournit le mécanisme cryptographique, l'article 50 de l'AI Act en fait une obligation datée — mais l'échéance elle-même est mouvante.* C2PA v2.4 (Content Credentials) est datée *« April 2026 »* selon l'historique de versions de la spécification (section 5.3.1 : *« 2.4 - April 2026 »*, nouveaux formats d'actifs, assertions, sérialisation JSON) ; versions antérieures 2.2 (2025-05-01) et 2.1 (2024-09-20) (confirmé, haut enjeu).#footnote[Content Credentials: C2PA Technical Specification 2.4 (version history 5.3.1 : « 2.4 - April 2026 ») — C2PA — 2026-04 — https://spec.c2pa.org/specifications/specifications/2.4/specs/C2PA_Specification.html] C2PA crée un *manifest* signé cryptographiquement portant des assertions de provenance (capture, édition, *ingredients*, divulgation IA, horodatage, hachages). Réserve : la page d'index ne porte pas de dates ; la datation provient du corps du document. *À vérifier* : la date exacte de C2PA 2.3 (entre 2.2 et 2.4).

Côté réglementation, l'article 50 du Règlement (UE) 2024/1689 devient applicable le 2 août 2026 (renvoi art. 113) ; l'art. 50(2) impose que les sorties d'IA générative soient *« marked in a machine-readable format and detectable as artificially generated or manipulated »* (confirmé, haut enjeu).#footnote[Article 50: Transparency Obligations (texte consolidé ; application 2 août 2026) — artificialintelligenceact.eu (Future of Life Institute) — 2026 — https://artificialintelligenceact.eu/article/50/] *Précision Omnibus (probable, divergence conservée).* L'accord politique *« AI Omnibus »* Conseil / Parlement est daté du 7 mai 2026 ; il accorde un délai de grâce de *quatre mois* — compromis de trilogue entre les 6 mois proposés par la Commission et les 3 mois du Parlement —, portant l'échéance de l'art. 50(2) au 2 décembre 2026 *uniquement* pour les systèmes d'IA générative déjà sur le marché avant le 2 août 2026 ; les systèmes mis sur le marché après le 2 août 2026 se conforment dès le premier jour, et les obligations art. 50(1)(3)(4) *ne bénéficient d'aucun report*.#footnote[Artificial Intelligence: Council and Parliament agree to simplify and streamline rules (Conseil UE, 7 mai 2026 ; Omnibus) — Conseil de l'Union européenne (Consilium) — 2026-05-07 — https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/]#footnote[EU AI Act Omnibus Deal Reached: Postponed Deadlines, Watermarking Compromise (délai 4 mois → 2 déc. 2026) — William Fry — 2026 — https://www.williamfry.com/knowledge/eu-ai-act-omnibus-deal-reached-postponed-deadlines-watermarking-compromise-and-the-nudificiation-prohibition/]#footnote[EU AI Act Update: Timeline Relief, Targeted Simplification, and New Prohibitions — Covington & Burling (Inside Privacy) — 2026-05 — https://www.insideprivacy.com/artificial-intelligence/eu-ai-act-update-timeline-relief-targeted-simplification-and-new-prohibitions/] Accord *provisoire / politique* — texte définitif à confirmer au Journal officiel.

Cette assertion de divulgation IA est, conceptuellement, le pendant *sortant* de la décision attestée : là où OTel + PROV reconstruisent la causalité *en amont* d'une sortie, le *manifest* C2PA appose *en aval* une attestation signée et détectable par machine. Pour une chaîne agentique soumise à l'art. 50, la frontière de l'#optau (sortie #decision, cf. Ch. 5) gagne ainsi un sous-produit réglementaire : toute sortie produite en régime probabiliste doit pouvoir porter un marquage machine, ce qui en fait un invariant de conformité à instrumenter, non une option.

=== Tableau 14-A — Standards d'observabilité / provenance agentique (juin 2026)

#figure(
  table(
    columns: 6,
    table.header[*Standard*][*Version / date*][*Maturité*][*Rôle*][*Couverture agentique*][*Confiance*],
    [OTel Semantic Conventions (parapluie)], [v1.41.1 — 2026-05-11], [Stable (corpus), mais GenAI = Development], [Traces / métriques / logs], [Spans agent, MCP, fournisseurs (tous expérimentaux)], [confirmé],
    [OTel GenAI (toutes sous-sections)], [Development], [Expérimental (aucune « Stable »)], [Instrumentation LLM / agent], [create / invoke_agent, execute_tool, MCP], [confirmé],
    [W3C PROV-DM], [Rec. 30 avr. 2013], [Stable, figé (pas de v2)], [Provenance (Entity / Activity / Agent)], [Générique, non agentique], [confirmé],
    [PROV-AGENT], [arXiv 2508.02866 — 2025-08-04], [Recherche (non normalisé)], [Provenance agent (prompts / décisions)], [Native agentique + MCP], [confirmé (= recherche)],
    [OpenLineage], [v1.48.0 — 2026-06-03], [Graduation (LF AI & Data)], [Lignage données / pipelines], [Complémentaire d'OTel], [confirmé],
    [C2PA], [v2.4 — avril 2026], [Versionné activement], [Provenance de contenu (manifest signé)], [Marquage sorties IA], [confirmé],
    [Art. 50 UE 2024/1689], [Applicable 2 août 2026], [En vigueur (échelonné)], [Marquage machine obligatoire], [Sorties d'IA générative], [confirmé (Omnibus : probable)],
  ),
  caption: [Standards d'observabilité et de provenance pour l'entreprise agentique, statut au 2026-06-08.],
) <tbl-14a>

=== Tableau 14-B — OpenTelemetry (GenAI) vs OpenLineage

#figure(
  table(
    columns: 3,
    table.header[*Dimension*][*OpenTelemetry (GenAI)*][*OpenLineage*],
    [Objet observé], [Traces / spans / métriques de services et d'agents], [Lignage : dépendances datasets ↔ pipelines],
    [Analogie], [Traces de services], [« Traces pour les données »],
    [Maturité (juin 2026)], [GenAI = Development], [Graduation (LF AI & Data)],
    [Versionnement], [v1.41.1 (2026-05-11) ; dépôt GenAI dédié sans release], [v1.48.0 (2026-06-03)],
    [Relation mutuelle], [Source d'inspiration revendiquée par OpenLineage], [Complémentaire, *pas convergent*],
  ),
  caption: [OpenTelemetry GenAI et OpenLineage : complémentarité, non convergence.],
) <tbl-14b>

=== Synthèse — la trace comme support de réfutabilité

Trois conclusions architecturales se dégagent, toutes subordonnées au statut mouvant des standards. Premièrement, l'instrumentation agentique normalisée *existe* (spans agent, `execute_tool`, MCP, événements agrégés) mais *n'offre aucune garantie de stabilité d'API* : l'adoption est un *opt-in* versionné (`OTEL_SEMCONV_STABILITY_OPT_IN`) qui doit être consigné, faute de quoi la trace — donc le référent de #invariant(1, "Hypothèse")–#invariant(5, "Hypothèse") — devient elle-même instable. Deuxièmement, la *décision attestée* native agentique n'est pas, en juin 2026, un standard à consommer : elle se construit par corrélation OTel (`gen_ai.client.inference.operation.details`) + projection PROV (Entity / Activity / Agent), PROV-AGENT n'étant encore que recherche. Troisièmement, lignage (OpenLineage), provenance de contenu (C2PA) et marquage réglementaire (art. 50) ajoutent des couches *complémentaires* dont aucune ne subsume les autres ; la falsifiabilité du #cia (cf. Ch. 6) exige leur intégration, que les standards de juin 2026 laissent à la charge de l'architecte.

=== Questions ouvertes

Les incertitudes ci-dessous sont *à vérifier en relance* et ne doivent pas être présentées comme résolues.

- *Communiqué IBM watsonx / OpenLineage* — date de publication exacte (hypothèse 2026-03-02 ; page en HTTP 403 au fetch). Piste : cache / Wayback ou date affichée sur ibm.com/new.
- *Règlement Omnibus* — le texte définitif est-il publié au Journal officiel de l'UE, et la date du 2 décembre 2026 assortie de la restriction *legacy* y est-elle consacrée ? Tant que la publication n'a pas lieu, l'échéance du 2 août 2026 demeure juridiquement la référence. Piste : EUR-Lex (règlement modificatif).
- *Lignes directrices Commission art. 50* — ont-elles atteint leur version finale vers juin 2026, et imposent-elles C2PA comme standard de marquage ou restent-elles neutres ? Piste : projet de mai 2026.
- *PROV-AGENT* — figure-t-il dans les actes IEEE e-Science 2025 (DOI Xplore) au-delà de la préimpression arXiv ? Piste : IEEE Xplore.
- *Stabilisation GenAI OTel* — une sous-section est-elle planifiée *« Stable »* avant fin 2026, et le dépôt `semantic-conventions-genai` produira-t-il sa première release ? Piste : *milestones* GitHub + SIG GenAI Observability.
- *C2PA 2.3* — date exacte entre 2.2 (2025-05-01) et 2.4 (avril 2026). Piste : *version history* de la spécification 2.3.

#pagebreak()

== Ch. 15 — Gouvernance et conformité réglementaire

*Insight-clé.* Un agent _LLM_ déployé en services financiers tombe simultanément sous deux familles d'obligations dont la maturité est asymétrique : un socle de résilience opérationnelle *ferme et exécutoire* d'un côté, un régime produit-IA *échelonné et mouvant* de l'autre. La thèse de ce chapitre est que cette conformité n'exige pas un appareil neuf : chaque obligation se *mappe* sur un mécanisme déjà construit dans les Parties I-II — identité et autorité de l'appelant (cf. Ch. 3-4), trace de provenance #angl[PROV], et la branche _Refus_ de #optau (cf. Ch. 5). Le point dur n'est donc pas technique mais qualificatif : *aucun texte primaire en date de juin 2026 ne définit l'« agent autonome » ni l'« agentique »* ; la qualification d'un agent comme système d'IA haut risque (UE), comme actif TIC (DORA), comme « modèle » (BSIF E-23) ou comme « système d'IA » (AMF) procède *par analogie*. C'est l'unique zone d'incertitude réglementaire structurante pour l'interopérabilité agentique, et elle est consignée comme telle (hypothèse, à surveiller).#footnote[Annex III: High-Risk AI Systems Referred to in Article 6(2) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/annex/3/]

L'organisation suit la géographie réglementaire pertinente pour l'auteur : Union européenne (AI Act + Digital Omnibus, DORA), puis Canada (BSIF E-23, AMF, vide fédéral horizontal). La section terminale convertit l'ensemble en une matrice obligation $arrow.r$ mécanisme et recense les incertitudes ouvertes.

=== 15.1 EU AI Act : référence, paliers, asymétrie avec DORA

L'AI Act s'applique *par paliers* (art. 113) et DORA est *déjà pleinement en vigueur* — cette asymétrie de maturité, et non le contenu de chaque texte pris isolément, dicte l'ordre de priorité d'un programme de conformité agentique.

L'AI Act porte la référence *Règlement (UE) 2024/1689* (confirmé), entré en vigueur le 1^er^ août 2024, application générale au *2 août 2026* (art. 113).#footnote[Article 113: Entry into Force and Application (texte du Règlement 2024/1689) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/113/] Les paliers confirmés de l'art. 113 :

- *2 février 2025* — Chap. I-II : dispositions générales, pratiques interdites (art. 5), littératie IA (art. 4).
- *2 août 2025* — Chap. III §4, Chap. V (#angl[GPAI]), Chap. VII (gouvernance), Chap. XII, art. 78, *sauf art. 101* ; pénalités.
- *2 août 2026* — application générale, majorité des obligations haut risque de l'Annexe III.
- *2 août 2027* — art. 6(1) et obligations correspondantes (haut risque intégré aux produits, Annexe I).

Les pratiques interdites et la littératie sont applicables depuis le 2 février 2025 ; la sanction des pratiques interdites (art. 99(3)) atteint *35 M EUR ou 7 % du chiffre d'affaires mondial annuel total*, le montant le plus élevé étant retenu (confirmé).#footnote[Article 99: Penalties (texte du Règlement 2024/1689) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/99/] Les obligations #angl[GPAI] et de gouvernance s'appliquent depuis le 2 août 2025 (sauf art. 101) ; les modèles #angl[GPAI] antérieurs bénéficient d'une grâce jusqu'au 2 août 2027 (confirmé).

Le seuil de risque systémique #angl[GPAI] est une présomption *réfutable* de capacités à fort impact (art. 51(2)) lorsque le calcul cumulé d'entraînement *dépasse $10^(25)$ #angl[FLOP]* (confirmé) ; l'estimation de « ~5-15 fournisseurs mondiaux » concernés reste un ordre de grandeur secondaire, indicatif (à vérifier).#footnote[Article 51: Classification of GPAI Models as GPAI Models with Systemic Risk (seuil 10^25 FLOP) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/51/] Le *Code de bonnes pratiques #angl[GPAI]* a été publié le *10 juillet 2025* en trois chapitres (Transparence, Droit d'auteur, Sûreté et Sécurité) ; les deux premiers visent tous les fournisseurs #angl[GPAI], le troisième les seuls modèles à risque systémique. La Commission et l'#angl[AI Board] l'ont jugé « outil volontaire adéquat » (confirmé).#footnote[The General-Purpose AI Code of Practice — Commission européenne (DG CNECT) — 2025 — https://digital-strategy.ec.europa.eu/en/policies/contents-code-gpai]

=== 15.2 Le « Digital Omnibus on AI » : reports et statut juridique

*Point juridique critique.* Tant que l'Omnibus n'est pas publié au Journal officiel, *les dates originales (2 août 2026 / 2 août 2027) demeurent juridiquement en vigueur* — un programme de conformité prudent doit donc viser ces dates et traiter les reports comme un sursis non acquis.

Chronologie (statut indiqué texte par texte) : proposition de la Commission le *19 novembre 2025* (probable) ; *accord politique provisoire le 7 mai 2026* en trilogue Parlement/Conseil, confirmé par le Parlement, le Conseil (Consilium) et la Commission.#footnote[Artificial Intelligence: Council and Parliament agree to simplify and streamline rules (Conseil UE, 7 mai 2026 ; Omnibus) — Conseil de l'Union européenne (Consilium) — 2026-05-07 — https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/]#footnote[AI Act: deal on simplification measures, ban on 'nudifier' apps — Parlement européen — 2026-05 — https://www.europarl.europa.eu/news/en/press-room/20260427IPR42011/ai-act-deal-on-simplification-measures-ban-on-nudifier-apps] *Divergence conservée* : certaines sources secondaires datent les négociations finales du 6 mai 2026 (séance nocturne aboutissant vers 4 h 30 le 7 mai) ; les sources institutionnelles primaires retiennent le *7 mai 2026*.

Contenu de l'accord (confirmé sauf indication) : l'*Annexe III (haut risque autonome) est reportée au 2 décembre 2027* — dates *fixes*, et non le mécanisme conditionnel « #angl[stop-the-clock] » initialement proposé ; l'*Annexe I (haut risque intégré aux produits) est reportée au 2 août 2028*, l'accord résolvant aussi le différend sur l'évaluation de conformité Annexe I. Le marquage (art. 50) pour les systèmes mis sur le marché avant le 2 août 2026 bascule au *2 décembre 2026* (au lieu du 2 février 2027) ; les systèmes postérieurs y sont soumis dès la mise sur le marché (probable). De nouvelles interdictions (art. 5 : _nudifiers_ + CSAM) prennent effet le *2 décembre 2026*.#footnote[Digital Omnibus on AI — Legislative Train Schedule — Parlement européen — 2026-05 — https://www.europarl.europa.eu/legislative-train/package-digital-package/file-digital-omnibus-on-ai]#footnote[EU AI Act Update: Timeline Relief, Targeted Simplification, and New Prohibitions — Covington & Burling (Inside Privacy) — 2026-05 — https://www.insideprivacy.com/artificial-intelligence/eu-ai-act-update-timeline-relief-targeted-simplification-and-new-prohibitions/]

*Statut juridique (probable)* : accord politique provisoire *non publié au JO* ; adoption formelle visée avant le 2 août 2026 ; publication attendue d'ici juillet 2026 ; *les dates originales restent en vigueur d'ici là*. À vérifier : la date de confirmation COREPER, parfois citée au 13 mai 2026, n'est pas confirmée sur source primaire.

#figure(
  table(
    columns: 5,
    align: left,
    table.header[*Obligation*][*Date originale (2024/1689)*][*Date sous Omnibus (accord 7 mai 2026)*][*Statut juridique juin 2026*][*Confiance*],
    [Interdictions (art. 5) + littératie (art. 4)], [2 fév. 2025], [inchangé], [En vigueur], [confirmé],
    [#angl[GPAI] + gouvernance (sauf art. 101)], [2 août 2025], [inchangé], [En vigueur], [confirmé],
    [Marquage art. 50 (systèmes _legacy_)], [≈ 2 fév. 2027], [*2 déc. 2026*], [Dates originales prévalent (non publié JO)], [probable],
    [Nouvelles interdictions (_nudifiers_, CSAM)], [—], [*2 déc. 2026*], [Sous réserve de publication], [confirmé],
    [Haut risque Annexe III (autonome)], [*2 août 2026*], [*2 déc. 2027* (dates fixes)], [*2 août 2026 reste en vigueur*], [confirmé],
    [Haut risque Annexe I (produits)], [*2 août 2027*], [*2 août 2028*], [*2 août 2027 reste en vigueur*], [confirmé],
  ),
  caption: [Calendrier d'application de l'AI Act — original vs Omnibus (UE).],
) <tab-15-calendrier-ue>

=== 15.3 Ancrage agentique côté AI Act : sanctions, Annexe III finance, supervision humaine

L'AI Act mord directement sur les agents financiers par deux entrées de l'Annexe III et par l'art. 14, ce dernier *bornant la délégation* d'un agent multi-étapes.

La structure des sanctions (art. 99, confirmé) gradue trois plafonds, le plus élevé étant retenu : *35 M / 7 %* (pratique interdite) ; *15 M / 3 %* (haut risque et autres obligations) ; *7,5 M / 1 %* (information incorrecte ou trompeuse) ; des plafonds réduits (le plus *faible*) s'appliquent aux PME et jeunes pousses. L'*Annexe III finance* (confirmé) classe à haut risque l'évaluation de *solvabilité / score de crédit* des personnes physiques (sauf détection de fraude) et la *tarification de l'assurance vie/santé* — ancrage direct de l'AI Act pour les systèmes agentiques en services financiers.

L'*art. 14(1)* impose une *supervision humaine effective* pour les systèmes haut risque : exigence structurante qui borne l'autonomie déléguée et impose un point de contrôle humain.#footnote[Article 14: Human Oversight (texte AI Act) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/14/] C'est ici que le couplage avec le canon est le plus net : l'art. 14 ne demande pas d'inhiber l'agent mais d'instrumenter un *point de bascule* vers l'humain. La branche _Refus_ de #decision (cf. Ch. 5) en est la réalisation mécanique — #optau déplace #tfix vers un régime non probabiliste lorsque #dautorite ou #dinvariant l'imposent, l'issue _Refus_ matérialisant le « #angl[human-in-the-loop] » exigé par l'art. 14 sans recoder une logique de contrôle ad hoc. L'*art. 6(3)* ménage une exemption haut risque sous conditions cumulatives (tâche procédurale étroite ; amélioration d'un résultat humain ; détection d'écarts sans remplacer l'évaluation humaine ; tâche préparatoire), assortie de documentation et d'enregistrement (art. 49(2)).#footnote[Article 6: Classification Rules for High-Risk AI Systems — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/6/]

=== 15.4 DORA : socle ferme et législation déléguée

DORA est le *socle exécutoire* : un agent et toutes ses dépendances (modèle, API, _cloud_) y sont des actifs ou services TIC à inscrire, tester et encadrer contractuellement — sans grâce ni report.

*DORA = Règlement (UE) 2022/2554 du 14 décembre 2022, applicable depuis le 17 janvier 2025* (art. 64) — date ferme et exécutoire (confirmé).#footnote[Entry into application of DORA regulation on 17 January 2025 — CSSF (Luxembourg) — 2025-01 — https://www.cssf.lu/en/2025/01/entry-in-application-of-dora-regulation-on-17-january-2025/] Ses *cinq piliers* (confirmé) : (1) gestion du risque TIC (art. 5-16) ; (2) gestion et signalement des incidents (art. 17-23) ; (3) tests de résilience (art. 24-27) ; (4) risque lié aux tiers TIC (art. 28-44) ; (5) partage d'informations (art. 45).#footnote[Regulation (EU) 2022/2554 (DORA) — texte consolidé — EUR-Lex (Office des publications de l'UE) — 2022-12 — https://eur-lex.europa.eu/eli/reg/2022/2554/oj/eng]

La législation déléguée de niveau 2 pertinente pour les chaînes agentiques (toutes confirmées) :

- *Registre d'information* — Règlement d'exécution (UE) *2024/2956* du 29 nov. 2024 (ITS, art. 28(3)) ; JO du 2 déc. 2024 ; en vigueur le 22 déc. 2024 ; modèles normalisés et information sur les *sous-traitants de fonctions critiques*. Première soumission aux NCA *au plus tard le 30 avril 2025*. *Divergence confirmée* sur les dates intermédiaires (CSSF Luxembourg : référence au 31 mars, fenêtre 1-15 avril, transmission aux ESAs le 30 avril 2025).#footnote[Commission Implementing Regulation (EU) 2024/2956 — register of information (ITS, art. 28(3) DORA) — EUR-Lex — 2024-12 — https://eur-lex.europa.eu/eli/reg_impl/2024/2956/oj/eng]
- *RTS TLPT* (tests d'intrusion fondés sur la menace, art. 26) — Règlement délégué (UE) *2025/1190* du 13 fév. 2025 ; JO du 18 juin 2025 ; *applicable depuis le 8 juillet 2025* ; alignement TIBER-EU (détail à vérifier).#footnote[Commission Delegated Regulation (EU) 2025/1190 — TLPT (RTS, art. 26 DORA) — EUR-Lex — 2025-06 — https://eur-lex.europa.eu/eli/reg_del/2025/1190/oj/eng]
- *RTS sous-traitance* (art. 30(5)) — Règlement délégué (UE) *2025/532* du 24 mars 2025 ; JO du 2 juillet 2025 ; *en vigueur le 22 juillet 2025*.#footnote[Commission Delegated Regulation (EU) 2025/532 — subcontracting ICT services (RTS, art. 30(5) DORA) — EUR-Lex — 2025-07 — https://eur-lex.europa.eu/eli/reg_del/2025/532/oj/eng] *Probable* : la suppression de l'Article 5 / Recital 5 du projet (suivi continu de la chaîne de sous-traitants), rapportée comme « retrait partiel » par des cabinets, *n'est pas vérifiée ligne à ligne contre le JO* ; piste — comparer le projet JC 2024-53 et le texte final 2025/532.#footnote[European Commission adopts revised DORA Subcontracting RTS — a partial retreat on monitoring sub-contractors? — Herbert Smith Freehills Kramer — 2025 — https://www.hsfkramer.com/notes/tmt/2025-posts/european-commission-adopts-revised-dora-subcontracting-rts-a-partial-retreat-on-monitoring-sub-contractors]

Le registre d'information est l'obligation DORA la plus directement opérationnalisable pour une chaîne agentique : il *exige* une énumération exhaustive et structurée des dépendances TIC, ce qui présuppose l'identité stable de chaque agent et de chaque service tiers (cf. Ch. 3-4). Le fragment ci-dessous illustre une entrée de registre alignée sur la logique de l'ITS 2024/2956 — modèle _LLM_ traité comme service TIC sous-traité d'une fonction critique ; il s'agit d'une *transposition illustrative*, non d'un extrait normatif des modèles XBRL officiels (à vérifier mot pour mot contre l'ITS) :

```yaml
# Entrée illustrative — registre d'information DORA (logique ITS UE 2024/2956)
# NB : champs et taxonomie à aligner sur les modèles XBRL/XML officiels (à vérifier)
contractual_arrangement:
  reference: "CA-2026-AGENT-CREDIT-001"
  function_supported: "evaluation_solvabilite"      # Annexe III AI Act = haut risque
  critical_or_important: true                         # déclenche exigences renforcées
  ict_service:
    type: "ai_model_inference"                        # agent LLM = service TIC
    provider_lei: "<LEI-fournisseur-modele>"          # identité de l'entité (cf. Ch. 4)
    subcontractors:                                   # chaîne tierce (RTS 2025/532)
      - role: "cloud_infrastructure"
        provider_lei: "<LEI-hyperscaler>"
  resilience:
    tlpt_in_scope: true                               # RTS TLPT 2025/1190
    exit_strategy_documented: true                    # art. 28 DORA
```

=== 15.5 Double conformité agentique (hypothèse)

Pour un agent _LLM_ déployé en services financiers de l'UE, les deux régimes *se cumulent* — c'est une hypothèse de l'auteur, non un fait établi, mais elle commande de ne pas traiter conformité produit-IA et résilience TIC en silos.

(a) *AI Act* — qualification haut risque possible (Annexe III : crédit, assurance) déclenchant gestion des risques, gouvernance des données, journalisation et *supervision humaine* (art. 14). (b) *DORA* — l'agent et ses dépendances (modèle, API, _cloud_) sont des actifs/services TIC à *inscrire au registre* (2024/2956), *tester* (TLPT, 2025/1190) et *encadrer contractuellement* (sous-traitance, 2025/532). *Hypothèse* : aucun texte primaire de juin 2026 ne définit « agent autonome » ou « agentique » ; la qualification procède *par analogie*, d'où une zone d'incertitude réglementaire à surveiller.

#figure(
  table(
    columns: 3,
    align: left,
    table.header[*Dimension*][*DORA (2022/2554)*][*AI Act (2024/1689)*],
    [Nature], [Résilience opérationnelle TIC, secteur financier], [Régulation horizontale produit, risque IA],
    [Maturité juin 2026], [*Ferme, applicable depuis 17 janv. 2025*], [*Échelonné + Omnibus non publié*],
    [Niveau 2 clé], [Reg. 2024/2956, 2025/1190, 2025/532], [Code #angl[GPAI] (10 juil. 2025) ; normes harmonisées attendues],
    [Ancrage agentique], [Agent = actif/service TIC (registre, TLPT, sous-traitance)], [Agent = système d'IA (Annexe III ; art. 14)],
    [Sanctions], [Régime DORA propre], [35 M/7 % ; 15 M/3 % ; 7,5 M/1 %],
    [Définition « agentique »], [Absente (analogie)], [Absente (analogie) — *hypothèse*],
  ),
  caption: [DORA vs AI Act — deux régimes cumulatifs, maturité asymétrique (UE).],
) <tab-15-dora-vs-aiact>

=== 15.6 Canada — BSIF, ligne directrice E-23 (risque de modélisation)

*Insight-clé.* En date de juin 2026, la conformité de l'IA en services financiers canadiens repose sur des *lignes directrices sectorielles (droit souple prudentiel)* et *non sur une loi fédérale horizontale* ; l'IA agentique y est déjà saisie — par le risque de modélisation — *avant toute loi horizontale*.

La *version finale d'E-23 a été publiée le 11 septembre 2025*, pour une *entrée en vigueur le 1^er^ mai 2027* (mise en œuvre d'environ 20 mois) (confirmé, haut enjeu).#footnote[Guideline E-23 — Model Risk Management (2027) — BSIF/OSFI — 2025-09-11 — https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027] Le périmètre couvre les institutions financières fédérales réglementées (IFFR) — banques, succursales de banques étrangères, assureurs vie et fraternelles, assureurs IARD, sociétés de fiducie et de prêt ; les *régimes de retraite fédéraux ont été reconsidérés et EXCLUS* de la version finale (confirmé). L'IA/AA est *incluse textuellement* dans la définition de « modèle » (« …including AI/ML methods… ») et le cadre MRM *couvre les modèles tiers/fournisseurs* (confirmé).

La lettre d'accompagnement pose une *neutralité algorithmique* (confirmé), citée textuellement : « the outcomes and principles provided in the guideline do not vary based on the algorithmic approach to modeling », tout en reconnaissant des *défis de gouvernance* propres aux modèles « boîte noire », aux données d'entraînement externes dynamiques et aux techniques propriétaires.#footnote[Guideline E-23 — Model Risk Management (2027) - Letter — BSIF/OSFI — 2025-09-11 — https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027-letter] *Précision / divergence* : la qualification selon laquelle l'IA/AA « exacerbe les risques » provient d'une *glose secondaire (Torys)*, *non d'une citation primaire* — la lettre du BSIF cadre ces enjeux comme des *défis de gouvernance*, pas une « exacerbation » nommée.#footnote[OSFI updates and expands scope of Guideline E-23 for AI governance — Torys LLP — 2025-10 — https://www.torys.com/en/our-latest-thinking/publications/2025/10/osfi-updates-and-expands-scope-of-guideline-e-23]

=== 15.7 Canada — AMF (Québec) : LD sur l'IA et LD risque lié aux tiers

L'AMF fournit l'ancrage agentique le plus *personnalisé* du paysage : l'*imputabilité individuelle d'un dirigeant* pour l'ensemble des systèmes d'IA — un point de contrôle nommé que la trace technique doit pouvoir alimenter.

La *LD AMF sur l'utilisation de l'IA, version finale, a été publiée le 7 avril 2026* (consultation à l'automne 2025), pour une *entrée en vigueur le 1^er^ mai 2027* ; elle s'applique aux assureurs autorisés, coopératives de services financiers, sociétés de fiducie autorisées et institutions de dépôt autorisées encadrées par l'AMF (confirmé).#footnote[Lignes directrices en matière d'intelligence artificielle et de gestion du risque lié aux tiers (communiqué AMF : 7 avril 2026 ; effet 1er mai 2027 (IA) / 1er avril 2027 (tiers)) — Autorité des marchés financiers (AMF) — 2026-04-07 — https://lautorite.qc.ca/grand-public/salle-de-presse/actualites/fiche-dactualite/lignes-directrices-en-matiere-dintelligence-artificielle-et-de-gestion-du-risque-lie-aux-tiers] Exigences (confirmé) : le *conseil d'administration* veille à une culture d'utilisation responsable ; la *haute direction* assure la gouvernance et le contrôle des risques des systèmes d'IA (SIA) ; *un membre de la haute direction est imputable de l'ensemble des SIA*.#footnote[Ligne directrice sur l'utilisation de l'intelligence artificielle (page officielle AMF) — AMF — 2026-04 — https://lautorite.qc.ca/en/professionals/insurers/guidelines/use-of-models/guideline-for-the-use-of-artificial-intelligence] *Probable / à confirmer mot pour mot* : la mention d'un « registre/inventaire centralisé des SIA + cote de risque par système » provient de la couverture du *projet* (NRF, automne 2025) ; la page AMF retourne un code 403 à la récolte automatisée — formulation à confirmer dans le PDF final.#footnote[L'AMF propose un encadrement pour l'usage de l'IA dans les services financiers (couverture du projet : registre + cote de risque) — Norton Rose Fulbright — 2025-08 — https://www.nortonrosefulbright.com/fr-ca/centre-du-savoir/publications/129d21cb/lamf-propose-un-encadrement-pour-lusage-de-lia-dans-les-services-financiers]

La *LD AMF distincte sur le risque lié aux tiers* entre en vigueur le *1^er^ avril 2027* (consultation du 9 oct. au 19 déc. 2025) ; elle met à jour et remplace la LD impartition de 2009 et exige un registre centralisé des ententes avec les tiers. *À ne pas confondre* avec la LD IA (effet 1^er^ mai 2027) (confirmé).#footnote[Third-Party Risk Management Guideline (page officielle AMF ; effet 1er avril 2027) — AMF — 2026 — https://lautorite.qc.ca/en/professionals/insurers/guidelines/operational-risk/third-party-risk-management-guideline]

=== 15.8 Canada — fédéral : AIDA mort-née, « AI for All », vide horizontal

Côté fédéral, il n'existe *aucune loi-cadre horizontale sur l'IA en date de juin 2026* ; la conformité agentique s'arrime exclusivement au droit prudentiel sectoriel des §§ 15.6-15.7.

Le *projet de loi C-27 (contenant AIDA) est mort au Feuilleton* à la prorogation (44^e^ législature, 1^re^ session, close le 6 janvier 2025) ; son stade maximal fut l'*étude en comité INDU (non complétée)*, sans rapport ni 3^e^ lecture, la dernière réunion INDU enregistrée datant du 26 septembre 2024 (confirmé).#footnote[C-27 (44-1) — LEGISinfo (stade : Consideration in committee / Not completed ; session 44-1 close le 6 janvier 2025) — Parlement du Canada (LEGISinfo) — 2025-01 — https://www.parl.ca/legisinfo/en/bill/44-1/c-27] *Précision* : LEGISinfo classe C-27 en « information historique » et *n'emploie pas littéralement « mort au Feuilleton »*, la mécanique de prorogation étant néanmoins confirmée par les sources juridiques.#footnote[Prorogation's Digital Impact: Canada's Digital Bills Set to Die on the Order Paper — Fasken — 2025-01 — https://www.fasken.com/en/knowledge/2025/01/prorogations-digital-impact] Le ministre *Solomon* a indiqué (mi-2025) qu'*AIDA ne sera pas réintroduite telle quelle*, IA et vie privée étant désormais traitées *séparément* (confirmé pour le principe).#footnote[What's Next After AIDA? (Solomon : pas de réintroduction d'AIDA telle quelle) — Schwartz Reisman Institute (Université de Toronto) — 2025 — https://srinstitute.utoronto.ca/news/whats-next-for-aida]

La stratégie *« AI for All » a été lancée le 4 juin 2026 (Toronto)* par le PM Carney (avec Solomon, Joly, Hajdu) — plan quinquennal économique *non contraignant* promettant une modernisation législative *sans nommer de projet de loi IA horizontal ni fixer d'échéancier IA précis* (confirmé, haut enjeu).#footnote[Prime Minister Carney launches AI for All: Canada's new national artificial intelligence strategy (4 juin 2026 ; cibles 200 G\$ / 250 000 emplois / adoption 12 % → 60 % d'ici 2034) — Cabinet du Premier ministre du Canada — 2026-06-04 — https://www.pm.gc.ca/en/news/news-releases/2026/06/04/prime-minister-carney-launches-ai-all-canadas-new-national-artificial] Cibles (confirmé, à citer comme cibles, non comme réalisations) : environ *200 G\$ de croissance*, *250 000 emplois* sur cinq ans, adoption de l'IA passant de *12 % à 60 % d'ici 2034*. *Au 8 juin 2026, aucun projet de loi fédéral horizontal sur l'IA n'a été déposé* ; le Canada s'appuie dans l'intervalle sur un code de conduite volontaire (IA générative) — affirmation de négatif, *probable*, fondée sur la convergence de sources secondaires (Osler/BLG/CCPA) sans registre primaire unique.#footnote[Canada still has no meaningful AI regulation (absence de loi-cadre fédérale, 2026) — Canadian Centre for Policy Alternatives (CCPA) — 2026 — https://www.policyalternatives.ca/news-research/canada-still-has-no-meaningful-ai-regulation/]

=== 15.9 Implication pour l'argument agentique (Canada)

Une *triple échéance 2027* sans loi fédérale horizontale (confirmé) : 1^er^ avril (LD tiers AMF), 1^er^ mai (E-23 BSIF + LD IA AMF). L'IA/AA est explicitement visée par E-23 (risque de modélisation) et par la LD IA AMF (gouvernance des SIA) — *droit souple prudentiel plutôt que droit dur horizontal*. Les points d'ancrage directs pour la gouvernance agentique sont l'*imputabilité individuelle d'un dirigeant* (AMF) et le *registre / cote de risque par système* (probable, AMF). *Question d'interprétation, et non un fait* : dans quelle mesure un agent _LLM_ *déclencheur d'actions* (et non un simple modèle prédictif) tombe-t-il dans la définition de « modèle » d'E-23 ou de « SIA » de l'AMF ?

#figure(
  table(
    columns: 3,
    align: left,
    table.header[*Dimension*][*E-23 (BSIF)*][*LD IA (AMF)*],
    [Angle], [Risque de *modélisation* (MRM)], [Gouvernance des *systèmes d'IA* (SIA)],
    [Entrée en vigueur], [1^er^ mai 2027], [1^er^ mai 2027],
    [Principe directeur], [Neutralité algorithmique (texte)], [Imputabilité d'*un* dirigeant pour tous les SIA],
    [Modèles/systèmes tiers], [Couverts (_vendor / third-party_)], [Encadrés via gouvernance (+ LD tiers, 1^er^ avr. 2027)],
    [Registre], [Cadre MRM], [Registre + cote de risque par SIA — *probable*],
  ),
  caption: [E-23 (BSIF) vs LD IA (AMF) — deux angles d'un même horizon 2027 (Canada).],
) <tab-15-e23-vs-amf>

=== 15.10 Matrice obligation $arrow.r$ mécanisme

L'apport central du chapitre : chaque obligation réglementaire saillante se *mappe* sur un mécanisme déjà spécifié dans les Parties I-II, ce qui transforme la conformité d'un fardeau documentaire en propriété *vérifiable sur la trace*. Trois mécanismes suffisent à couvrir l'essentiel : (i) *identité et autorité* de l'appelant et de la cible (cf. Ch. 3-4), reflétées dans #dautorite ; (ii) *trace de provenance* #angl[PROV], support de #dinvariant et de l'imputabilité ; (iii) *dispatch et branche _Refus_* de #optau (cf. Ch. 5), réalisation du point de contrôle humain. La mécanisation formelle du pont entre garanties déterministes et comportement probabiliste relève du #ciaFull (cf. Ch. 6) ; il n'est pas redéfini ici.

Réserve épistémique : ces correspondances sont *des hypothèses d'ingénierie de conformité*, non des équivalences juridiques validées par un régulateur. Le statut probatoire de #dinvariant comme preuve d'imputabilité reste à éprouver — l'invariant de traçabilité de bout en bout demeure #i4, donc non acquis et à ne pas présenter comme garanti.

#figure(
  table(
    columns: 4,
    align: left,
    table.header[*Obligation (source)*][*Régime*][*Mécanisme canon (renvoi)*][*Marqueur*],
    [Supervision humaine effective (art. 14)], [UE / AI Act], [Branche _Refus_ de #decision ; #optau déplace #tfix hors régime probabiliste (cf. Ch. 5)], [confirmé (obligation) / hypothèse (mapping)],
    [Registre d'information TIC (ITS 2024/2956)], [UE / DORA], [Identité stable agent + tiers, énumération des dépendances (cf. Ch. 3-4)], [confirmé / hypothèse (mapping)],
    [Encadrement sous-traitance (RTS 2025/532)], [UE / DORA], [#dautorite : autorité appelant × autorité cible sur la chaîne tierce (cf. Ch. 4)], [confirmé / hypothèse],
    [Tests de résilience TIC (RTS TLPT 2025/1190)], [UE / DORA], [Banc empirique de validation ; #cia comme cadre (cf. Ch. 6)], [confirmé / hypothèse],
    [Journalisation / traçabilité haut risque], [UE / AI Act], [Trace de provenance #angl[PROV] ; support de #dinvariant], [confirmé / hypothèse],
    [Imputabilité individuelle d'un dirigeant], [Canada / AMF], [Trace #angl[PROV] attribuable + identité d'agent (cf. Ch. 3) → preuve d'imputabilité], [confirmé / *#i4 non acquis*],
    [Registre + cote de risque par SIA (probable)], [Canada / AMF], [Inventaire indexé sur l'identité d'agent ; #dinvariant par système], [probable / hypothèse],
    [Risque de modélisation, modèles tiers (E-23)], [Canada / BSIF], [Identité du modèle tiers au registre TIC + #dautorite sur l'appel], [confirmé / hypothèse],
  ),
  caption: [Matrice obligations $arrow.r$ mécanismes du canon — renvois aux Parties I-II, sans redéfinition.],
) <tab-15-matrice>

=== 15.11 Divergences signalées (conservées, non lissées)

Conformément à la discipline épistémique du dossier, les divergences de sources sont *préservées*, jamais arbitrées au-delà de ce que les primaires permettent.

UE : (1) date de l'accord Omnibus — primaires (Parlement/Conseil/Commission) = *7 mai 2026*, secondaires = 6 mai 2026 (séance nocturne) ; (2) confirmation COREPER parfois citée au 13 mai 2026, *non confirmée* sur source primaire (à vérifier) ; (3) première soumission du registre DORA — dates intermédiaires variables selon la NCA, plafond commun au 30 avril 2025 ; (4) suppression de l'art. 5 du projet de RTS sous-traitance — rapportée par cabinets, *non vérifiée contre le JO* (probable) ; (5) nombre de fournisseurs #angl[GPAI] systémiques (~5-15) — ordre de grandeur secondaire ; seul le seuil $> 10^(25)$ #angl[FLOP] est confirmé.

Canada : (1) date d'E-23 — une source secondaire (Blakes, avril 2026) indique le 1^er^ avril 2027, *contredite par la primaire BSIF (1^er^ mai 2027)* ; le 1^er^ avril 2027 est en réalité la date de la LD AMF risque lié aux tiers — confusion probable entre deux échéances 2027 voisines ; *retenir la primaire : E-23 = 1^er^ mai 2027*.#footnote[OSFI Releases Final Guideline E-23 for Model Risk Management and AI Use by FRFIs — Blakes — 2025-09 — https://www.blakes.com/insights/osfi-releases-final-guideline-e-23-for-model-risk-management-and-ai-use-by-frfis/] (2) « Exacerbation » par l'IA/AA — glose secondaire (Torys) ; la neutralité algorithmique est, elle, citée textuellement dans la lettre primaire. (3) Absence de successeur fédéral à AIDA au 8 juin 2026 — *affirmation de négatif*, confiance *probable* malgré la convergence Osler/BLG/CCPA, à re-vérifier à la rédaction finale.#footnote[A turning point for AI in Canada in 2026 — Borden Ladner Gervais (BLG) — 2026-03 — https://www.blg.com/en/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026]

=== Questions ouvertes

Les incertitudes ci-dessous bornent la portée du chapitre ; aucune n'est résolue en date de juin 2026.

- *Publication au JO de l'Omnibus* : date exacte conditionnant l'entrée en vigueur des reports au 2 déc. 2027 / 2 août 2028 ; jusque-là, les dates originales prévalent. Piste : EUR-Lex (post-publication).
- *Portée réelle du texte final Omnibus* : modifiera-t-il d'autres dispositions (#angl[GPAI], registre UE haut risque, art. 50) au-delà des communiqués de mai 2026 ?
- *Qualification primaire des « agents autonomes »* : émergence possible d'ici 2027-2030 via lignes directrices Commission/AI Office ou normes CEN-CENELEC JTC 21 — actuellement *absente*. C'est la zone d'incertitude réglementaire structurante de l'interopérabilité agentique.
- *Articulation art. 14 (supervision humaine) ↔ autonomie déléguée* d'un agent multi-étapes : que préciseront les normes harmonisées ? Le _mapping_ sur la branche _Refus_ de #optau reste une hypothèse d'ingénierie tant que la pratique réglementaire ne l'a pas éprouvé.
- *Autres RTS/ITS DORA* pertinents pour les chaînes agentiques (RTS risque TIC, lignes directrices coûts/pertes d'incidents) : statut et calendrier.
- *PDF final de la LD AMF sur l'IA* : confirmer *mot pour mot* l'exigence d'un « registre/inventaire centralisé des SIA » et la « cote de risque par système » (page AMF en 403). Piste : ouvrir manuellement le PDF officiel EN/FR.
- *Successeur fédéral canadien à AIDA* déposé en 2026 après « AI for All » ? Surveiller LEGISinfo (45^e^ législature).
- *Attentes spécifiques à l'IA agentique* (au-delà du risque de modélisation) du BSIF ou d'autres régulateurs avant 2027 : aucune source primaire confirmée à ce jour.
- *Champ d'application matériel* d'E-23 et de la LD IA AMF aux systèmes agentiques (agents _LLM_ autonomes, orchestration multi-agent) : ces cadres parlent de « modèles » / « SIA » sans nommer l'agentivité — *question d'interprétation pour la monographie*, pas un fait établi.

#pagebreak()

== Ch. 16 — Résilience opérationnelle et gestion du risque agentique

Parce que le risque agentique se matérialise *à l'exécution* — et non plus seulement à la conception ou au déploiement (cf. Ch. 2) — la résilience cesse d'être une propriété de la phase de test pour devenir une discipline de contrôle _runtime_. La thèse de ce chapitre : *la résilience opérationnelle d'un système agentique est le maintien de ses invariants `I1`–`I5` sous perturbation*, et le mécanisme de premier recours qui la garantit n'est pas un correctif réactif mais un disjoncteur préventif — la sortie #tauRefus de l'#optau (cf. Ch. 5), qui interrompt la trajectoire avant l'effet externe irréversible plutôt que de le compenser après coup. Le repère normatif majeur en date de juin 2026 est le NIST AI 800-4, qui définit *six* catégories de surveillance post-déploiement.

L'enjeu se distingue nettement de la fiabilité métrologique (cf. Ch. 17) : mesurer la fiabilité d'un agent répond à « se comporte-t-il bien en moyenne ? », tandis que la résilience opérationnelle répond à « que se passe-t-il à la queue de distribution, quand une trajectoire dévie ? ». Les deux sont complémentaires ; les confondre revient à confondre un banc d'essai avec un disjoncteur.

=== L'écart temporel d'exécution comme source primaire du risque

L'insight fondateur, hérité du Ch. 2, est que les risques importants émergent *durant* l'exécution parce qu'un agent planifie, utilise des outils, maintient un état et produit des trajectoires multi-étapes à effets externes#footnote[From Governance Norms to Enforceable Controls: A Layered Translation Method for Runtime Guardrails in Agentic AI — Christopher Koch — arXiv (preprint) — 2026-04-06 — https://arxiv.org/abs/2604.05229]. La thèse « _risks emerge during execution_ » est *confirmée* dans la littérature primaire de juin 2026. En revanche, le cadrage plus précis souvent invoqué — un *écart temporel* entre l'initiation d'actions irréversibles et l'observation/intervention humaine — reste *probable* : il n'est pas une formulation verbatim des sources et constitue une reconstruction analytique.

Cet écart temporel est, du point de vue du canon, exactement la fenêtre durant laquelle un invariant peut basculer de `Confirmé` à `Réfuté` sans qu'aucun contrôle humain n'ait eu le temps d'agir. La résilience opérationnelle consiste donc à *rapprocher* le point de décision de gouvernance du point d'exécution, jusqu'à les rendre synchrones. C'est précisément la fonction du dispatch de l'#optau : statuer #decision *avant* l'effet, sur la base des dimensions #dsens, #dautorite et #dinvariant (cf. Ch. 5), de sorte que l'instant de fixation du sens #tfix soit positionné en amont de toute action irréversible plutôt qu'en aval.

=== Le repère normatif : NIST AI 800-4 et ses six catégories

Le NIST (via le CAISI) publie « _Challenges to the Monitoring of Deployed AI Systems_ » (NIST AI 800-4, DOI 10.6028/NIST.AI.800-4), approuvé par le NIST Editorial Review Board le 13 février 2026 et diffusé en mars 2026 (communiqué du 9 mars, mise à jour du 18 mars)#footnote[New Report: Challenges to the Monitoring of Deployed AI Systems (communiqué) — NIST — 2026-03-09 — https://www.nist.gov/news-events/news/2026/03/new-report-challenges-monitoring-deployed-ai-systems]#footnote[Challenges to the Monitoring of Deployed AI Systems (NIST AI 800-4, DOI 10.6028/NIST.AI.800-4) — NIST / CAISI (Rao, Keller, Kalra, Steed, Kwegyir-Aggrey, Klyman, Staheli, Bergman) — 2026-03 — https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.800-4.pdf]. La méthode du rapport est notable pour un document doctoral : trois ateliers (avril–mai 2025), une revue de littérature passée de 23 à 87 articles, environ 200 experts externes et plus de 10 agences fédérales — soit un substrat probant que peu de référentiels concurrents atteignent (*confirmé*).

Une correction de fond, à ne pas lisser, s'impose ici : le rapport définit *six* catégories de surveillance post-déploiement, et non cinq. Plusieurs synthèses secondaires omettaient « Large-Scale Impacts ». Les libellés primaires comptent également — « Human Factors » y désigne transparence *et* qualité, et non un vague « facteurs humains ». Le @t16-nist reproduit les six catégories avec leur question directrice telle que formulée dans le résumé primaire.

#figure(
  table(
    columns: 3,
    align: (center, left, left),
    table.header[*\#*][*Catégorie (libellé primaire)*][*Question directrice (résumé primaire)*],
    [1], [Functionality], [Le système fonctionne-t-il comme prévu ?],
    [2], [Operational], [Le système opère-t-il dans ses paramètres ?],
    [3], [Human Factors], [Transparence + qualité (et non un simple « facteurs humains »)],
    [4], [Security], [Le système est-il sécurisé ?],
    [5], [Compliance], [Le système est-il conforme ?],
    [6], [*Large-Scale Impacts*], [« _Does the system promote human flourishing?_ »],
  ),
  caption: [Les six catégories de surveillance post-déploiement (NIST AI 800-4). La sixième catégorie, fréquemment omise dans les synthèses secondaires, est rétablie ici conformément à la Table 1 du document primaire.],
) <t16-nist>

Articulé au canon, ce découpage n'est pas neutre : les catégories *Functionality*, *Operational* et *Security* observent la santé des invariants côté système ; *Compliance* projette les obligations réglementaires (cf. Ch. 15) sur la trace d'exécution ; *Large-Scale Impacts* et *Human Factors* couvrent les effets que la mesure de fiabilité (cf. Ch. 17) ne capte pas. La surveillance NIST fournit ainsi le *quoi observer* ; elle ne prescrit pas le *quoi faire* lorsqu'une déviation est détectée — ce verrou d'exécution relève des gardes-fous _runtime_.

=== Des normes de gouvernance aux gardes-fous _runtime_ applicables

La surveillance détecte ; elle ne contraint pas. Le maillon manquant est la *traduction* d'une norme de gouvernance — énoncée en langage de politique — en un contrôle effectivement applicable au moment de l'action. Koch propose à cet effet une méthode de traduction *en couches* transformant des normes de gouvernance en gardes-fous _runtime_ applicables#footnote[From Governance Norms to Enforceable Controls: A Layered Translation Method for Runtime Guardrails in Agentic AI — Christopher Koch — arXiv (preprint) — 2026-04-06 — https://arxiv.org/abs/2604.05229]. L'existence et l'approche du travail sont *confirmées* ; son statut _peer-review_ reste *à vérifier* en date de juin 2026, ce qui invite à le citer comme proposition méthodologique et non comme standard établi.

La lecture canonique de cette méthode est directe : un garde-fou _runtime_ applicable *est* une instanciation opérationnelle de l'#optau. La couche de gouvernance fournit le seuil (autorité requise, score sémantique minimal, invariants à préserver) ; la couche d'exécution évalue #dsens, #dautorite, #dinvariant à chaque pas de la trajectoire et émet #decision. Lorsque la sortie est *Refus*, le garde-fou agit en disjoncteur : il rompt le circuit *avant* l'effet externe. C'est la différence structurante entre résilience agentique et résilience d'un système déterministe classique — ici, le disjoncteur n'est pas déclenché par une surcharge mesurée *a posteriori*, mais par un calcul de licéité évalué *avant* l'irréversibilité.

Le @t16-disjoncteur compare les deux régimes de protection que cette architecture met en regard, afin d'éviter l'assimilation paresseuse du #tauRefus à un simple _timeout_ ou à un _rate limiter_.

#figure(
  table(
    columns: 3,
    align: (left, left, left),
    table.header[*Dimension*][*Disjoncteur classique (déterministe)*][*#tauRefus (gardes-fous agentiques)*],
    [Déclencheur], [Seuil physique/charge mesuré _a posteriori_], [Calcul de licéité (#dsens, #dautorite, #dinvariant) évalué _a priori_],
    [Instant d'action], [Après le dépassement], [Avant l'effet externe irréversible — déplace #tfix en amont],
    [Grandeur protégée], [Intégrité d'une ressource (courant, débit)], [Invariants `I1`–`I5` de la trajectoire],
    [Réversibilité visée], [Limiter la propagation d'un dommage déjà amorcé], [Empêcher l'amorce du dommage],
    [Sortie], [Ouvert / Fermé], [#decision],
    [Lien gouvernance], [Configuration statique], [Norme traduite en contrôle _runtime_ (méthode en couches)],
  ),
  caption: [Disjoncteur déterministe classique vs #tauRefus comme garde-fou d'exécution agentique. Le second n'est pas un _rate limiter_ : il statue sur la licéité avant l'action, non sur la charge après coup.],
) <t16-disjoncteur>

=== Esquisse d'une politique de garde-fou _runtime_

À titre d'illustration — et sans prétendre figer un schéma normatif que la méthode de Koch laisse ouvert (*à vérifier* quant à son format canonique) — une politique de garde-fou peut s'exprimer comme un contrat déclaratif évalué à chaque appel d'outil. Le principe : pour chaque action à effet externe, la politique fixe les seuils des trois dimensions d'entrée de l'#optau et l'action par défaut en cas de franchissement, l'action par défaut sûre étant le *Refus*. L'extrait ci-dessous esquisse une telle politique pour un outil à effet irréversible (virement, suppression, publication).

```yaml
# Esquisse non normative — instancie le dispatch tau au point d'appel d'outil.
# La definition canonique de l'operateur tau et de ses dimensions : cf. Ch. 5.
garde_fou:
  outil: "virement.executer"        # action a effet externe irreversible
  effet: irreversible
  seuils:
    d_sens_min: 0.85                 # D-Sens : score semantique minimal requis [0,1]
    d_autorite:                      # D-Autorite : autorite appelant x autorite cible
      appelant_requis: "agent.financier.delegue"
      cible_requise:   "compte.beneficiaire.verifie"
    d_invariant:                     # D-Invariant : etat des invariants sur la trace
      requis: ["I1", "I2", "I5"]     # doivent etre Confirmes sur la trace courante
      statut_attendu: "Confirme"
  decision_par_defaut: "Refus"       # defaut sur : tout seuil non franchi -> disjoncteur
  sur_refus:
    journaliser: true                # capture pour rejeu d'audit (cf. Ch. 19)
    escalade_humaine: requise        # rapproche l'intervention de l'instant d'execution
  surveillance:                      # rattachement aux categories NIST AI 800-4 (cf. supra)
    categories: ["Operational", "Security", "Compliance"]
```

Trois propriétés de cette esquisse méritent d'être soulignées. D'abord, `decision_par_defaut: "Refus"` matérialise le principe du *défaut sûr* : l'absence de preuve de licéité vaut interdiction, ce qui referme l'écart temporel d'exécution. Ensuite, `d_invariant.requis` lie explicitement l'autorisation au statut des invariants sur la trace — un garde-fou qui ignorerait l'état de `I1`–`I5` ne protégerait pas la grandeur que la résilience est censée maintenir. Enfin, le bloc `surveillance.categories` raccroche chaque garde-fou aux catégories NIST observables, fermant la boucle détection→contrôle.

Note de prudence canonique : cet exemple ne doit pas être lu comme une présomption sur le statut des invariants. En particulier, aucun garde-fou de ce type ne saurait *établir* #i4, dont la campagne empirique demeure non concluante ; un tel invariant ne peut figurer dans `statut_attendu: "Confirme"` qu'au prix d'un écart de traçabilité à consigner (cf. `docs/tracabilite.md`).

=== Articulation avec DORA (Ch. 15) et la validation (Ch. 17)

La résilience opérationnelle agentique ne flotte pas hors sol réglementaire : elle s'inscrit dans le cadre contraignant de DORA — Règlement (UE) 2022/2554, applicable depuis le 17 janvier 2025 (*confirmé*, cf. Ch. 15) — dont le pilier *tests de résilience* (art. 24-27) et le pilier *gestion/signalement des incidents* (art. 17-23) trouvent ici leur contrepartie technique. Là où DORA exige que l'entité financière démontre sa capacité à résister à un choc TIC, les gardes-fous _runtime_ et la surveillance NIST AI 800-4 fournissent l'instrumentation par laquelle cette démonstration devient vérifiable pour un agent en production. Le rattachement précis des contrôles agentiques aux articles de DORA, en particulier au *Threat-Led Penetration Testing*, reste un chantier de cartographie (*à vérifier* quant aux RTS/ITS pertinents pour les chaînes agentiques, cf. Ch. 15).

En aval, la résilience se distingue de la validation (cf. Ch. 17) tout en s'y appuyant. La métrologie agentique de 2025–2026 est traversée par une crise de validité qui interdit de tenir l'exactitude pour un signal suffisant ; un garde-fou _runtime_ calibré sur une métrique trompeuse hériterait de cette fragilité. La résilience consomme donc les profils de fiabilité du Ch. 17 (cohérence, robustesse, prédictibilité, sûreté) comme *entrées* de calibration des seuils — mais son objet propre demeure le comportement à la queue de distribution, que la validation moyenne ne couvre pas.

=== Questions ouvertes

Les incertitudes du dossier, à conserver explicitement :

- *Cadrage de l'écart temporel d'exécution* — la thèse générale « les risques émergent à l'exécution » est *confirmée*, mais la formulation précise d'un « écart temporel entre initiation d'actions irréversibles et intervention humaine » reste *probable* et non verbatim. À étayer sur une source primaire qui l'énonce comme telle.
- *Statut de la méthode de traduction en couches (Koch)* — existence et approche *confirmées* ; le statut _peer-review_ de la préimpression arXiv 2604.05229 reste *à vérifier* en date de juin 2026. À reconfirmer avant tout usage comme référence normative.
- *Cartographie DORA ↔ gardes-fous agentiques* — l'arrimage des contrôles _runtime_ aux piliers « tests de résilience » et « incidents » de DORA, et notamment aux RTS/ITS applicables aux chaînes agentiques, demeure à instruire (*à vérifier*, cf. Ch. 15).
- *Format canonique d'une politique de garde-fou* — l'esquisse proposée est *non normative* ; la méthode primaire ne fixe pas de schéma de politique de référence. La standardisation d'un tel contrat déclaratif (langage, granularité, points d'évaluation) reste un terrain mouvant.

Sur le NIST AI 800-4 lui-même, aucune question n'est en suspens : les six catégories et leurs libellés primaires sont vérifiés sur le corps du PDF (*confirmé*).
