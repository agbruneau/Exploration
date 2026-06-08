#import "../../lib/canon.typ": *

= PARTIE VI — Validation empirique et architecture de référence

== Ch. 17 — Validation, métrologie et fiabilité des agents

#corpusTODO[Vérifier le numéro de chapitre dans le plan détaillé (`docs/plan.md`) ; le présent fichier suppose la position « Ch. 17, Partie VI ». Reprendre du corpus mère les énoncés exacts de #invariant(1, "Confirme"), #invariant(2, "Confirme"), #invariant(3, "Confirme") et #invariant(5, "Confirme"), ainsi que leurs conditions de réfutation : ils sont invoqués ici comme cibles métrologiques sans que leur formulation canonique soit reproduite.]

*Insight-clé.* L'exactitude moyenne d'un agent est un signal métrologique trompeur : un audit de dix bancs d'essai majeurs établit que 7/10 violent la validité de tâche, 7/10 la validité de résultat, et que 80 % n'admettent aucune faiblesse de conception, l'illustration limite étant un agent trivial — réponses vides — qui obtient 38 % sur des tâches volontairement impossibles et surpasse un agent fondé sur GPT-4o.#footnote[Establishing Best Practices for Building Rigorous Agentic Benchmarks (ABC) — Zhu, Jin, Liang et al. (25 auteurs) — arXiv 2507.02825 — 2025-07-03 — #link("https://arxiv.org/abs/2507.02825"); HTML plein texte v1 (cas $tau$-bench-airline 38 %) — #link("https://arxiv.org/html/2507.02825v1").] La conséquence pour notre cadre est directe : valider #optau ne consiste pas à mesurer un taux de succès, mais à *réfuter* des invariants. La métrologie agentique défendue ici est conçue comme un appareil de falsification — elle opérationnalise la falsifiabilité des invariants $I_1$–$I_5$ (le banc cherche les conditions qui les *brisent*), et c'est précisément ce dispositif qui maintient #i4 au statut d'hypothèse plutôt que de l'inscrire comme acquis.

Ce chapitre est empirique. Il pose la méthodologie : conjectures réfutables, bancs d'essai sur substrat Go/Kafka (`AgentMeshKafka` adossé à `TauGo`), reproductibilité, métrologie outillée. Il ne redéfinit ni #optau, ni le #cia, ni les énoncés d'invariants — il les *teste*.

=== 17.1 La crise de validité comme prémisse méthodologique

*Insight.* Si l'on ne peut pas faire confiance aux bancs publics, on ne peut pas non plus se contenter d'en reprendre les scores : il faut un banc dédié dont la conception est elle-même auditée, et des métriques qui mesurent la *réfutation* plutôt que la réussite.

La littérature 2025–2026 documente une crise de validité interne des évaluations agentiques. L'audit ABC mesure des sur-estimations attribuables à des défauts de conception, et non au modèle évalué : KernelBench est sur-estimé de 31 % (absolu) faute de #angl[fuzz testing] exhaustif ; WebArena de 1,4 à 5,2 % ; la sur-estimation de CVE-Bench est réduite de 33 % une fois la liste de contrôle ABC appliquée.#footnote[Idem — Zhu, Jin, Liang et al. — arXiv 2507.02825 — 2025-07-03. NB : venue NeurIPS 2025 *à confirmer* (non explicite dans le résumé ; arXiv classe cs.AI, v5 du 7 août 2025).] Le cas $tau$-bench-airline — un agent trivial compté comme réussi sur des tâches impossibles — est l'exemple paradigmatique d'une *violation de validité de tâche* : la métrique récompense un artefact du protocole, pas une compétence.

Deux conséquences structurent la suite. Premièrement, l'exactitude doit être décomposée. La science émergente de la fiabilité agentique propose un profil de performance holistique décomposé en 12 métriques selon 4 dimensions — #angl[consistency], #angl[robustness], #angl[predictability], #angl[safety] — « ancré dans l'ingénierie des systèmes critiques pour la sûreté ».#footnote[Towards a Science of AI Agent Reliability (4 dimensions, 12 métriques) — Rabanser, Kapoor, Kirgis, Liu, Utpala, Narayanan — Princeton HAL Lab — arXiv 2602.16666 (v1 2026-02-18, v3 2026-06-02) — #link("https://arxiv.org/abs/2602.16666").] *À vérifier* : les normes nominatives aviation/nucléaire (ARP4754A, IEC 61513, ISO 26262) ne sont *pas* nommées dans le résumé primaire — l'expression « grounded in safety-critical engineering » ne doit pas être traduite en citation de ces standards (cf. divergence C12 ci-dessous) ; de même, la mention « pass\@k » n'apparaît pas dans le résumé et reste à vérifier dans le corps du PDF. Deuxièmement, la robustesse des proxys d'évaluation est elle-même contestable : les utilisateurs simulés par #angl[LLM] seraient des proxys non fiables des utilisateurs humains dans les évaluations agentiques, ce qui mine la validité externe des bancs de type $tau$-bench.#footnote[Lost in Simulation: LLM-Simulated Users are Unreliable Proxies for Human Users in Agentic Evaluations — arXiv 2601.17087 — 2026-01 — #link("https://arxiv.org/pdf/2601.17087"); *probable* — intitulé, auteurs et date à reconfirmer sur la page arXiv (non re-fetchée).]

#figure(
  table(
    columns: 5,
    table.header([*Cadre*], [*Auteur·s / venue*], [*Dimensions clés*], [*Chiffre signature*], [*Statut*]),
    [ABC (audit)], [Zhu, Jin, Liang et al. (25) — arXiv 2507.02825], [Validité tâche / résultat / reporting], [7/10, 7/10, 80 % ; KernelBench +31 %], [_Confirmé_],
    [Science of Reliability], [Rabanser et al. — Princeton HAL — arXiv 2602.16666], [consistency / robustness / predictability / safety], [4 dim. / 12 métriques], [_Confirmé_ (normes nominatives _à vérifier_)],
    [CLEAR], [Mehta — arXiv 2511.14136 (auteur indép.)], [Cost / Latency / Efficacy / Assurance / Reliability], [$rho approx 0{,}83$ vs $0{,}41$ ; coût $50 times$], [_Probable_ (sans peer-review)],
    [DFAH (cf. Ch. 19)], [Khatchadourian — arXiv 2601.15322], [déterminisme trajectoire/décision + fidélité évidence], [déterminisme $!=$ exactitude], [_Confirmé_],
  ),
  caption: [Tableau 17.1 — Cadres de validation/fiabilité agentique ($>= 2$ dimensions).],
)

Le cadre CLEAR (#angl[Cost, Latency, Efficacy, Assurance, Reliability]) chiffre l'écart entre exactitude et succès de déploiement : l'exactitude seule corrèle faiblement avec le succès en production ($rho approx 0{,}41$) contre $rho approx 0{,}83$ pour le profil composite ; il rapporte des variations de coût jusqu'à $50 times$ à exactitude comparable, un écart labo–production de 37 %, et une chute de pass\@1 $= 60 %$ à pass\@8 $= 25 %$.#footnote[Beyond Accuracy: A Multi-Dimensional Framework for Evaluating Enterprise Agentic AI Systems (CLEAR) — Mehta — arXiv 2511.14136 — 2025-11-18 — #link("https://arxiv.org/html/2511.14136v1"); *probable* — préimpression à auteur unique, sans peer-review confirmée ; chiffres illustratifs, non normatifs, non re-vérifiés ligne à ligne.] Ces chiffres sont *à manier comme illustratifs* (préimpression non revue) ; ils motivent néanmoins une exigence forte pour notre banc — instrumenter le coût et la latence au même titre que la décision, car une garantie de correction obtenue à coût divergent n'a aucune valeur d'ingénierie.

=== 17.2 Conjectures réfutables : du programme falsificationniste à l'instrumentation

*Insight.* Un invariant n'a de valeur scientifique que s'il énonce sa condition de réfutation ; le rôle du banc est de fabriquer, systématiquement, les traces susceptibles de produire cette réfutation.

Les invariants $I_1$–$I_5$ du #ciaFull sont, par construction du corpus mère, *réfutables* : chacun s'accompagne d'un statut explicite — #invariant(1, "Confirme") | #invariant(1, "Hypothese") | #invariant(1, "Refute") — et d'une condition empirique sous laquelle il bascule. Le présent chapitre ne reproduit pas leurs énoncés (ils appartiennent au canon, cf. l'encadré liminaire), mais il fixe la *discipline de test* qui leur est appliquée.

#corpusTODO[Reprendre du corpus mère, pour chaque invariant, le triplet ⟨énoncé formel, condition de réfutation, métrique de décision⟩. La présente méthodologie suppose que ces conditions existent et sont opérationnelles ; elle ne les invente pas. En particulier, l'énoncé qui motive #i4 et la raison pour laquelle « la campagne empirique fut non concluante » doivent être cités tels quels (statut : #invariant(4, "Hypothese")).]

La règle est asymétrique, conforme à la logique falsificationniste : aucune campagne ne *confirme* un invariant ; une campagne peut seulement échouer à le réfuter (il demeure alors `Confirmé` au sens « non réfuté à la date de la campagne ») ou le réfuter (transition vers `Réfuté`). Le statut #invariant(4, "Hypothese") matérialise un troisième cas — l'instrument n'a pas atteint la puissance statistique ou la couverture nécessaire pour trancher. La promotion d'un statut (`Hypothèse` $arrow.r$ `Confirmé` ou `Réfuté`) exige une justification empirique citée et une entrée dans `docs/adr/` ; c'est une obligation éditoriale, pas une convenance.

Trois exigences découlent de cette asymétrie pour la conception du banc :

- *Couverture de réfutation.* Le générateur de scénarios doit cibler les régions de l'espace d'entrée de #optau — #dsens, #dautorite, #dinvariant — où l'invariant testé est le plus *fragile*, et non l'usage nominal. Une campagne qui ne sonde que le cas heureux n'a aucune valeur réfutante (c'est exactement le défaut de validité de tâche mesuré par ABC).
- *Oracles indépendants du modèle.* La correction se juge par appariement d'état (#angl[state matching]) contre un état-or déterministe, et non par jugement d'un #angl[LLM] sur sa propre sortie. C'est la posture de $tau$-bench (Yao et al., ICLR 2025), qui évalue par appariement d'état contrastant avec l'appariement de réponses courtes de GAIA.#footnote[Origine de $tau$-bench (appariement d'état vs GAIA) — caractérisation issue de A Survey on Evaluation of LLM-based Agents — arXiv 2503.16416 (revue, *secondaire*) — 2025-03 — #link("https://arxiv.org/html/2503.16416v2"); *probable* — la primaire ICLR 2025 (Yao et al.) reste à citer directement.]
- *Métrologie du déterminisme, distincte de l'exactitude.* L'approche DFAH établit que le déterminisme (de trajectoire et de décision) est une propriété *orthogonale* à l'exactitude : un agent peut être exact et non reproductible, ou reproductible et faux.#footnote[Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness (DFAH) — Raffi Khatchadourian — arXiv 2601.15322 — 2026-01-17 — #link("https://arxiv.org/abs/2601.15322").] Pour #optau, le déterminisme porte sur la *décision de dispatch* (#decision), pas sur la sortie de l'agent probabiliste en aval : c'est la fonction de routage qui doit être reproductible, le régime probabiliste assumant le #angl[drift] par construction.

=== 17.3 Le banc sur substrat Go/Kafka : `AgentMeshKafka` adossé à `TauGo`

*Insight.* Le banc valide #optau en le plaçant à la frontière exacte qu'il est censé arbitrer — entre le régime déterministe garanti par Kafka (#angl[exactly-once]) et le régime probabiliste d'un agent #angl[LLM] — et en vérifiant que la trace observée respecte (ou réfute) l'invariant ciblé.

Le choix du substrat n'est pas arbitraire. Kafka fournit une garantie de message *vérifiable et datée* : la sémantique #angl[exactly-once] est adoptée (KIP-98) et la transactionnalité côté producteur passée à `eos-v2` (KIP-732, depuis Kafka 3.0.0), avec activation serveur du protocole transactionnel depuis la 4.0.#footnote[KIP-98 — Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging"); KIP-732 — Deprecate eos-alpha and replace eos-beta with eos-v2 (Kafka 3.0.0) — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-732:+Deprecate+eos-alpha+and+replace+eos-beta+with+eos-v2").] En date de juin 2026, Kafka 4.3.0 est publiée (2026-05-22).#footnote[Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — #link("https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/").] *À verifier* : la limite documentée de l'#angl[exactly-once] aux effets internes au système Kafka — un agent qui produit un effet de bord externe (appel d'outil, écriture tierce) sort du périmètre de la garantie.#footnote[Exactly-once Semantics is Possible: Here is How Apache Kafka Does It (limite aux effets de bord) — Confluent (Narkhede, Wang et al.) — 2025-03-01 — #link("https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/").] Cette limite *est* le terrain de jeu de #optau : c'est précisément là où la garantie déterministe s'arrête que la décision de basculer en régime probabiliste — ou de refuser (#tauRefus) — doit être instrumentée.

`TauGo` fournit le kernel exécutable de #optau ; `AgentMeshKafka` l'exerce comme banc. L'architecture de validation injecte des messages portant un triplet d'entrée, observe la #decision émise, puis confronte la trace résultante à l'invariant testé.

#corpusTODO[Reprendre du corpus mère (écosystème `TauGo` / `AgentMeshKafka`) : la signature exacte de la fonction de dispatch de #optau, le format de trace produit par `TauGo`, et le protocole de mesure d'`AgentMeshKafka` (topics, schémas d'événements, état-or). Le schéma ci-dessous est une *esquisse de configuration de banc* à des fins d'articulation méthodologique ; il ne reproduit ni n'invente l'API canonique.]

Le pseudo-schéma de configuration ci-dessous illustre la *forme* d'une campagne réfutante — il fixe les topics, l'oracle d'état et l'injection de fautes ciblant la fragilité d'un invariant. Les noms d'attributs sont indicatifs et doivent être réconciliés avec le format canonique de `TauGo`.

```yaml
# Esquisse de configuration AgentMeshKafka — NON canonique (cf. corpusTODO)
# Objectif : réfuter (ou échouer à réfuter) un invariant à la frontière tau.
banc:
  invariant_cible: "I?"            # énoncé + condition de réfutation : voir canon
  hypothese_nulle: "non réfuté à la date de la campagne"
substrat_kafka:
  version: "4.3.0"                 # daté juin 2026
  eos: "v2"                        # KIP-732 ; transactionnalité producteur
  topics:
    entree_tau: "tau.in"           # messages porteurs du triplet d'entrée
    decisions:  "tau.decision"     # Decision in {Déterministe, Probabiliste, Refus}
    etat_or:    "oracle.gold"      # état-or pour appariement (state matching)
dimensions_entree:                 # espace d'entrée de tau (cf. canon, ne pas dériver)
  D_Sens:      { plage: [0.0, 1.0], echantillonnage: "frontiere" }
  D_Autorite:  { appelant: "...",   cible_requise: "..." }
  D_Invariant: { source: "trace",   etat: "..." }
injection_de_fautes:               # cibler la FRAGILITÉ, pas le cas nominal
  - type: "drift_semantique"       # D_Sens près du seuil de bascule
  - type: "elevation_autorite"     # confused deputy : autorité appelant < requise
  - type: "rejeu_partiel"          # tester l'idempotence sous eos-v2
oracle:
  mode: "state_matching"           # indépendant du modèle (pas de LLM-juge)
  reproductibilite: "n>=k exécutions ; mesurer variance inter-exécutions"
metrologie:                        # 12 métriques / 4 dimensions (Rabanser et al.)
  - consistency  # cohérence inter-exécutions de la Decision
  - robustness   # stabilité sous injection de fautes
  - predictability
  - safety       # taux de Refus correct vs sous-refus dangereux
  - cost_latency # CLEAR : coût/latence au même rang que la correction
```

Le point critique de validité interne est l'#angl[elevation_autorite] : c'est l'instrumentation directe du scénario #angl[confused deputy], où l'autorité de l'appelant est inférieure à l'autorité requise par la cible. Un banc qui ne produit jamais cette configuration ne peut pas réfuter un invariant de sûreté de délégation — il reproduirait le défaut de validité de tâche d'ABC. La sortie #tauRefus n'est donc pas un échec mesuré comme tel : un refus *correct* sous élévation d'autorité est une réussite de sûreté, et le banc doit distinguer le sous-refus dangereux (l'agent agit alors qu'il aurait dû refuser) du sur-refus coûteux.

=== 17.4 Reproductibilité et métrologie outillée

*Insight.* La reproductibilité d'une campagne agentique exige une trace de provenance liant chaque #decision à ses entrées, à la version du substrat et au modèle invoqué ; faute de quoi un résultat « confirmé » n'est pas re-jouable et donc pas scientifique.

La métrologie ne peut reposer sur des journaux maison. En date de juin 2026, deux familles de standards primaires couvrent l'instrumentation. D'une part, les conventions sémantiques OpenTelemetry pour les systèmes d'IA générative (badge #angl[Development]) définissent des spans et 7 histogrammes de métriques GenAI, et des conventions dédiées à #angl[MCP] (version de span 2025-06-18).#footnote[Semantic conventions for generative AI metrics (7 Histograms) — OpenTelemetry — #link("https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-metrics/"); Semantic conventions for MCP — OpenTelemetry — #link("https://opentelemetry.io/docs/specs/semconv/gen-ai/mcp/"). Statut *Development* : conventions non stabilisées, sujettes à changement.] D'autre part, la provenance : PROV-O (W3C Recommendation, 2013) fournit l'ontologie de base, et PROV-AGENT l'étend pour le suivi unifié des interactions d'agents dans les flux agentiques.#footnote[PROV-O: The PROV Ontology — W3C — 2013-04-30 — #link("https://www.w3.org/TR/prov-o/"); PROV-AGENT: Unified Provenance for Tracking AI Agent Interactions in Agentic Workflows — Souza et al. — arXiv / IEEE e-Science 2025 — 2025-08-04 — #link("https://arxiv.org/abs/2508.02866").] Le lignage de données peut s'appuyer sur OpenLineage (gradué LF AI & Data ; v1.48.0 au 2026-06-03).#footnote[OpenLineage — LF AI & Data (gradué 2023-07) — #link("https://lfaidata.foundation/projects/openlineage/") ; release 1.48.0 — #link("https://api.github.com/repos/OpenLineage/OpenLineage/releases/latest").]

*Divergence (statut des conventions).* Les conventions GenAI OTel portent le badge #angl[Development] : elles ne sont pas stabilisées en date de juin 2026 et ne peuvent être citées comme garantie d'interopérabilité métrologique pérenne — seulement comme cible d'instrumentation courante, à re-vérifier à chaque campagne.

#figure(
  table(
    columns: 4,
    table.header([*Exigence de repro.*], [*Instrument primaire*], [*Ce qui est lié à la #decision*], [*Statut (juin 2026)*]),
    [Trace d'exécution], [OpenTelemetry GenAI spans + 7 histogrammes], [latence, coût en jetons, appels d'outil par décision], [_Development_ (non stabilisé)],
    [Provenance décisionnelle], [PROV-O / PROV-AGENT], [entrées #dsens #dautorite #dinvariant $arrow.r$ Decision], [PROV-O _Recommendation_ ; PROV-AGENT _préprint_],
    [Lignage de données], [OpenLineage v1.48.0], [état-or, jeux de scénarios], [gradué (_Confirmé_)],
    [Garantie de substrat], [Kafka `eos-v2` (KIP-732)], [idempotence message $arrow.r$ trace re-jouable], [adopté (_Confirmé_)],
  ),
  caption: [Tableau 17.2 — Appareil de reproductibilité d'une campagne sur `AgentMeshKafka`.],
)

La reproductibilité agentique se mesure, elle ne se postule pas. La dimension #angl[consistency] de Rabanser et al. — cohérence inter-exécutions — devient ici une métrique de premier rang : pour un même triplet d'entrée, la variance de la #decision émise par #optau doit être bornée (idéalement nulle, le dispatch étant déterministe), et toute variance non nulle est un signal de réfutation de l'hypothèse de déterminisme de routage. C'est la jonction directe avec DFAH : ce que l'on certifie, c'est la *re-jouabilité de la décision*, pas la reproductibilité de la génération probabiliste en aval.

=== 17.5 Synthèse : pourquoi #i4 reste une hypothèse

*Insight.* L'honnêteté épistémique du #cia tient à ce que son appareil de validation est conçu pour réfuter, et qu'une absence de réfutation concluante laisse l'invariant en suspens plutôt qu'elle ne le promeut.

L'écart documenté entre laboratoire et production — 37 % selon CLEAR (illustratif), et plus largement le constat de la crise de validité — interdit de conclure prématurément. Le contexte de déploiement le confirme à l'échelle de l'industrie : le rapport Stanford HAI 2026 rapporte un taux de succès de 66,3 % sur OSWorld, mais une fraction massive des systèmes n'atteindrait jamais la production.#footnote[The 2026 AI Index Report (66,3 % OSWorld) — Stanford HAI — 2026-04 — #link("https://hai.stanford.edu/ai-index/2026-ai-index-report"); chiffre « 89 % n'atteignent jamais la production » via analyse secondaire — Beri — #link("https://www.beri.net/article/stanford-ai-index-2026-agents-66-percent-success") ; *à confirmer* dans le corps du rapport primaire.] Dans ce paysage, le statut #invariant(4, "Hypothese") n'est pas un aveu de faiblesse : c'est la sortie *correcte* d'un appareil de validation qui refuse de confondre « non réfuté faute de puissance » avec « confirmé ». La campagne empirique adossée à `AgentMeshKafka` n'a pas, à ce jour, produit la couverture nécessaire pour trancher #i4 ; le présent chapitre fixe les conditions sous lesquelles une campagne future pourrait le faire, sans préjuger du résultat.

=== Questions ouvertes

- *Énoncés canoniques manquants.* Les formulations exactes de $I_1$, $I_2$, $I_3$, $I_5$ (et la raison précise du statut #invariant(4, "Hypothese")) ne sont pas fournies dans la plage de dossier ; elles doivent être reprises du corpus mère (#corpusTODO ci-dessus) avant toute campagne, faute de quoi le banc teste une cible mal spécifiée.
- *Validité externe des oracles.* Si les utilisateurs simulés par #angl[LLM] sont des proxys non fiables (« Lost in Simulation », *à reconfirmer*), tout scénario d'`AgentMeshKafka` reposant sur un utilisateur simulé hérite de ce biais ; l'appariement d'état déterministe le contourne partiellement, mais la couverture des intentions utilisateur réelles reste *à vérifier*.
- *Statut des conventions métrologiques.* Les conventions sémantiques GenAI d'OpenTelemetry sont en badge #angl[Development] (juin 2026) : la pérennité de l'instrumentation de coût/latence par décision n'est pas garantie ; re-vérifier la stabilisation à chaque relance.
- *Périmètre de l'#angl[exactly-once].* La garantie Kafka s'arrête aux effets internes ; la réfutation d'un invariant impliquant un effet de bord externe d'un agent exige un oracle hors-Kafka *à concevoir* (par exemple via PROV-AGENT) — non couvert par le schéma de banc actuel.
- *Re-vérifications de chiffres.* Les valeurs CLEAR ($rho approx 0{,}83$/$0{,}41$ ; 37 % ; pass\@1 $60 % arrow.r$ pass\@8 $25 %$), le « 89 % » de Stanford HAI, et la présence éventuelle de normes nominatives / « pass\@k » dans Rabanser et al. restent *à vérifier* sur les sources primaires avant tout usage normatif.
- *Venue d'ABC.* L'attribution NeurIPS 2025 de l'audit de validité est *à confirmer* (non explicite dans le résumé) ; citer la primaire ICLR 2025 (Yao et al.) directement pour $tau$-bench.

#pagebreak()

== Ch. 18 — Architecture de référence implémentable de bout en bout

#emph[Insight-clé.] Une entreprise agentique défendable n'est pas un assemblage d'agents par-dessus une couche d'intégration : c'est une #emph[pile à frontière de sens explicite] où l'opérateur #tau matérialise, à chaque traversée de couche, le point unique où l'instant de fixation du sens #tfix est déplacé entre le substrat déterministe (qui garantit le message) et l'agent probabiliste (qui interprète l'intention). Cette section propose une architecture de référence — #emph[proposition], non standard — dont chaque composant est instancié à partir d'une brique attestée en date de juin 2026, et dont le fil conducteur est que la garantie #angl[exactly-once] du substrat #emph[s'arrête structurellement] au premier effet de bord externe — y compris l'appel à une API #angl[LLM]#footnote[#emph[Exactly-once Semantics is Possible: Here is How Apache Kafka Does It] — Confluent — 2025-03-01 — #link("https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/")]. Le rôle de #tau (dispatch entre régime déterministe et régime probabiliste, sortie #decision) reste défini canoniquement au chap. III.8 du corpus mère et instancié au Ch. 5 ; ce chapitre l'#emph[installe] dans une topologie concrète, sans le redéfinir.

L'architecture qui suit consolide les couches étudiées séparément aux chapitres 8 à 14 : protocoles (Ch. 8), substrats (Ch. 9–10), identité et autorité déléguée (Ch. 11–12), menaces (Ch. 13), observabilité et provenance (Ch. 14). Son ambition est de montrer que ces couches, prises ensemble, ne se composent proprement qu'autour d'un #emph[point de dispatch] explicite — faute de quoi la frontière déterministe/probabiliste se dilue dans le code applicatif de chaque agent, là où elle devient incontrôlable.

=== 18.1 Le principe directeur : une frontière de sens, pas une couche d'intégration

#emph[Insight.] La différence entre une architecture agentique d'entreprise et une simple intégration tient à un invariant de placement : il existe un et un seul endroit, par flux, où la décision #decision est prise, et cet endroit sépare ce qui doit être rejoué à l'identique de ce qui ne peut pas l'être.

Le fait fondateur est métrologique. La sémantique #angl[exactly-once] de Kafka est #emph[bornée au périmètre interne] #angl[read-process-write] : « #emph[guaranteed within the scope of Kafka Streams' internal processing only] » (verbatim Confluent) ; tout appel RPC externe — store distant, API #angl[LLM], courriel, paiement — #emph[n'est pas garanti] #angl[exactly-once]#footnote[#emph[Exactly once support] — IBM MQ 9.4.x Documentation — 2024 ; et #emph[Integrating AI Into Apache Kafka Architectures: Patterns] — Confluent — 2026-05-05 — #link("https://www.confluent.io/blog/ai-kafka-integration-patterns/")] (`confirmé`). Symétriquement, du côté file de messages, l'« #emph[exactly-once delivery] » au niveau transport est #emph[impossible] sur réseau non fiable (problème des Deux Généraux / résultat FLP) ; seul l'« #emph[exactly-once processing] » applicatif est atteignable, IBM MQ l'obtenant par la conjonction persistance + syncpoint (`MQCMIT`/`MQBACK`) + coordination transactionnelle#footnote[#emph[Syncpoints in IBM MQ for Multiplatforms] — IBM MQ 9.3.x Documentation — 2024 ; #emph[MQCMIT (Commit changes)] — IBM — 2024 — #link("https://www.ibm.com/docs/en/ibm-mq/9.2.x?topic=i-mqcmit-commit-changes")] (`confirmé`).

Cette double borne est l'ancrage empirique de #tau. Là où le substrat garantit, le régime est déterministe et le sens est fixé en amont (#tfix précoce) ; là où l'action sort du périmètre garanti et où l'interprétation devient probabiliste, #tau déplace #tfix vers l'aval et arbitre entre #emph[Déterministe] (router vers une garantie de message), #emph[Probabiliste] (déléguer à un agent #angl[LLM]) et #tauRefus (refuser). Les dimensions d'entrée — #dsens, #dautorite, #dinvariant — restent celles du canon (Ch. 5) et ne sont pas redéfinies ici.

#corpusTODO[Reprendre du corpus mère (chap. III.8) la sémantique opérationnelle complète de #tau et la fonction de décision sur les trois dimensions, ainsi que les énoncés précis et les statuts des invariants I1, I2, I3, I5 — non fournis au présent chapitre, à ne pas inventer. Seul #i4 est qualifié (campagne empirique non concluante).]

=== 18.2 Vue d'ensemble : six plans, un point de dispatch

#emph[Insight.] L'architecture se lit comme six plans horizontaux empilés ; #tau est la #emph[membrane verticale] qui les traverse, et chaque plan adosse sa garantie ou son incertitude à une brique datée.

Description du diagramme (à coder en `cetz` dans `src/figures/` ; décrit ici en texte normatif). Le schéma se lit de bas en haut, avec une #emph[barre verticale #tau] traversant tous les plans à droite de la colonne « agents » :

+ #emph[Plan substrat (garanties fortes).] Au socle, deux moteurs : Apache Kafka 4.3.0 (#angl[log] distribué relisable, EOS interne, 22 mai 2026)#footnote[#emph[Apache Kafka 4.3.0 Release Announcement] — Apache Software Foundation — 2026-05-22 — #link("https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/")] et IBM MQ 9.4.5 (file #angl[once-and-only-once], coordination XA, GA 5 fév. 2026)#footnote[#emph[IBM MQ 9.4.5 Continuous Delivery releases are available] — IBM Community (Ian Harwood, IBM Hursley) — 2026-01-30 — #link("https://community.ibm.com/community/user/blogs/ian-harwood1/2026/01/30/mq945ga")], le mainframe IBM Z s'y rattachant par z/OS Connect.
+ #emph[Plan exposition d'actifs.] z/OS Connect expose les API existantes (CICS/IMS/Db2) comme #emph[outils MCP] depuis la 3.0.98 (21 oct. 2025), un #emph[MCP Gateway] open-source (ContextForge, Apache-2.0, v1.0.2) fédérant MCP/A2A/REST/gRPC#footnote[#emph[z/OS Connect 3.0.98 now available] — IBM Community — 2025-10-21 — #link("https://community.ibm.com/community/user/blogs/shruthi-krishnan/2025/10/21/zos-connect-3098-now-available") ; #emph[IBM/mcp-context-forge — MCP Gateway] — IBM (GitHub) — 2026-05-26 — #link("https://github.com/IBM/mcp-context-forge")].
+ #emph[Plan protocolaire.] Trois couches complémentaires, stratifiées sous la Linux Foundation et non unifiées : MCP (accès outils, révision stable 2025-11-25), A2A (message/tâche inter-agents, v1.0 du 12 mars 2026), AGNTCY (annuaire/identité/transport SLIM/observabilité)#footnote[#emph[Releases — a2aproject/A2A] — A2A Project / GitHub — 2026-05-28 — #link("https://github.com/a2aproject/A2A/releases") ; #emph[Agntcy Documentation] — AGNTCY (Linux Foundation) — 2026 — #link("https://docs.agntcy.org/")].
+ #emph[Plan identité et autorité.] SPIFFE/SPIRE (identité de charge graduée CNCF) sous le substrat ; chaînage OAuth (RFC 8693 + `identity-chaining-14`) pour la délégation inter-domaines ; capacités atténuables (Biscuit/Macaroons) ou politiques analysables (Cedar) pour borner #dautorite.
+ #emph[Plan #tau (dispatch).] La membrane verticale : pour chaque requête franchissant le substrat vers un agent, ou un agent vers un autre, #tau évalue #dsens, #dautorite, #dinvariant et émet #decision.
+ #emph[Plan observabilité et provenance.] OpenTelemetry GenAI (traces/spans agent, #emph[entièrement expérimental]), OpenLineage (lignage, gradué) et W3C PROV / C2PA (provenance, marquage réglementaire) capturent la trace sur laquelle #dinvariant est évalué.

Le tableau suivant fixe l'instanciation de chaque plan et, surtout, son #emph[niveau de garantie] — la donnée architecturalement décisive, car elle conditionne ce qui peut être confié au régime déterministe.

#figure(
  table(
    columns: 5,
    table.header[*Plan*][*Brique instanciée (juin 2026)*][*Rôle dans le dispatch #tau*][*Maturité / garantie*][*Renvoi*],
    [Substrat], [Kafka 4.3.0 ; IBM MQ 9.4.5], [Régime déterministe : garantie de message, rejouabilité], [`confirmé` (EOS interne ; once-and-only-once)], [Ch. 9],
    [Exposition], [z/OS Connect 3.0.103 (outils MCP) ; MCP Gateway v1.0.2], [Présente les actifs legacy comme outils invocables], [`confirmé` (transport/auth MCP `à vérifier`, docs 403)], [Ch. 10],
    [Protocole], [MCP 2025-11-25 ; A2A v1.0 ; AGNTCY], [Transport de l'intention et des tâches inter-agents], [`confirmé` (RC MCP 2026-07-28 `probable`)], [Ch. 8],
    [Identité/autorité], [SPIFFE/SPIRE v1.15.1 ; RFC 8693 ; `identity-chaining-14`], [Calcule #dautorite ; lie l'appelant à l'audience], [Socle `confirmé` ; couche agentique pré-RFC], [Ch. 11–12],
    [Dispatch], [#optau (kernel TauGo)], [Émet #decision sur #dsens × #dautorite × #dinvariant], [#corpusTODO[noyau formel du corpus]], [Ch. 5],
    [Observabilité], [OTel GenAI ; OpenLineage v1.48.0 ; W3C PROV ; C2PA v2.4], [Fournit la trace évaluée par #dinvariant], [Lignage gradué ; #emph[GenAI = Development]], [Ch. 14],
  ),
  caption: [Instanciation de l'architecture de référence par plan, avec niveau de garantie daté (juin 2026). La colonne « maturité » conditionne ce qui peut être délégué au régime déterministe.],
)

=== 18.3 Le plan substrat : où #tfix est fixé en amont

#emph[Insight.] Le substrat n'est pas un simple #angl[bus] : c'est le lieu où le sens est fixé tôt et garanti, ce qui en fait le destinataire naturel de la branche #emph[Déterministe] de #decision.

Le choix entre les deux moteurs du socle n'est pas idéologique mais dicté par la nature de la garantie recherchée. Le tableau ci-dessous reprend la règle de décision substrat — présentée comme #emph[synthèse argumentative], non comme fait normatif (`probable`)#footnote[#emph[IBM MQ vs. Kafka vs. ActiveMQ: Comparing Message Brokers] — OpenLogic (Perforce) — 2024 — #link("https://www.openlogic.com/blog/ibm-mq-vs-kafka-vs-activemq")] — et l'aligne sur la branche de #tau qu'il sert.

#figure(
  table(
    columns: 4,
    table.header[*Dimension*][*IBM MQ*][*Apache Kafka*][*Implication pour #tau*],
    [Modèle de données], [File (point-à-point + pub/sub)], [Log distribué partitionné à rétention], [Kafka : la trace relisable nourrit #dinvariant],
    [Sort du message après consommation], [Retiré (consommation validée)], [Conservé (replay possible)], [Replay déterministe = base de l'audit de #decision],
    [Garantie native], [Once-and-only-once (persistant + syncpoint + coordination)], [EOS bornée au périmètre interne], [Branche #emph[Déterministe] adressée ici],
    [Coordination multi-ressources], [2PC / X-Open XA (détail XA `à vérifier`, 403)], [KIP-939 (2PC externe) « Accepted », version `à vérifier`], [Limite l'atomicité au-delà du substrat],
    [Critère de préférence], [Atomicité / ordre / conformité financière], [Débit / replay / fan-out / découplage], [Sélection du canal de la branche déterministe],
  ),
  caption: [IBM MQ vs Apache Kafka : sémantique et critère de choix, projetés sur les branches de #decision. La règle de décision substrat reste `probable` (synthèse, non normatif).],
)

Le pontage MQ→Kafka illustre la fragilité de la garantie dès qu'on franchit une frontière de système : il n'atteint l'#angl[exactly-once] que sous contraintes strictes (un seul consommateur `tasks.max=1`, file d'état dédiée, mode distribué, `exactly.once.source.support=enabled`, Connect ≥ 3.3.0) — sans quoi, #angl[at-least-once]#footnote[#emph[Running the MQ source connector] — IBM Event Automation / Event Streams — 2025 — #link("https://ibm.github.io/event-automation/es/connecting/mq/source/") ; #emph[IBM MQ Source Connector for Confluent Platform — Overview] — Confluent — 2025 — #link("https://docs.confluent.io/kafka-connectors/ibmmq-source/current/overview.html")] (`confirmé`). C'est précisément cette dégradation de garantie aux frontières qui justifie un point de dispatch explicite plutôt qu'une foi implicite dans le « #angl[bus] ».

Patron d'usage du substrat comme mémoire (verbatim Confluent, 5 mai 2026) : le #angl[log] sert de #emph[mémoire #angl[stateful] à replay déterministe], avec #angl[transactional outbox] + CDC Debezium pour la fiabilité d'émission, et une #angl[DLQ] enrichie de `prompt-id` / `model-version` / `offset` pour tracer les actions probabilistes non rejouables#footnote[#emph[Integrating AI Into Apache Kafka Architectures: Patterns] — Confluent — 2026-05-05 — #link("https://www.confluent.io/blog/ai-kafka-integration-patterns/")] (`confirmé`).

=== 18.4 Le plan #tau : le dispatch comme code de contrôle d'admission

#emph[Insight.] Concrètement, #tau s'implémente comme un #emph[contrôle d'admission] placé sur le chemin entre le substrat et l'agent : il transforme une requête entrante en une décision typée avant toute invocation #angl[LLM], et c'est là que se logent les défenses contre le #emph[confused deputy].

Le schéma de configuration ci-dessous esquisse le contrat d'entrée/sortie du dispatch #tau tel qu'il s'insère dans le flux. Il est #emph[illustratif] (forme déclarative ; la sémantique normative et la fonction de décision relèvent du corpus mère, non reproduite ici) et n'introduit aucun énoncé formel nouveau.

```yaml
# Contrat de dispatch tau (illustratif — sémantique normative au chap. III.8)
tau_dispatch:
  entree:
    d_sens:       # score sémantique [0,1] — alignement intention/grandeur g
      source: otel_genai_span        # gen_ai.* (statut Development)
    d_autorite:   # autorité_appelant × autorité_requise_cible
      appelant:   spiffe_id          # SVID présenté (X.509 ou JWT)
      cible:      mcp_tool_audience  # RFC 8707 resource (binding d'audience)
    d_invariant:  # état des invariants sur la trace
      source: kafka_replay           # log relisable + OpenLineage facets
  sortie:
    decision: [Deterministe, Probabiliste, Refus]   # canon Ch. 5
  regles_de_decision: REPRENDRE_DU_CORPUS           # ne pas inventer
```

#corpusTODO[Reprendre du corpus mère la #emph[fonction de décision] exacte de #tau (seuils, ordre d'évaluation des trois dimensions, conditions de bascule vers #tauRefus), l'#emph[algèbre d'héritage de garanties] du #ciaFull (règles précises de composition des garanties à travers une délégation), les #emph[types de session probabilistes / tolérants au #angl[drift]] et la mécanisation #emph[Lean 4] associée — aucun de ces éléments formels n'est fourni au présent chapitre.]

L'intérêt architectural de matérialiser #tau en contrôle d'admission tient au diagnostic de sécurité du Ch. 13 : le #emph[confused deputy] agentique est une #emph[faille d'autorisation et d'architecture], non un défaut de modèle — l'agent « #emph[is designed to treat all content in their context window as potentially instructive, which eliminates the hard boundary between data and code] », de sorte que les remédiations efficaces (#angl[admission control], validation d'entrée structurée, cadrage explicite de l'autorité) sont des contrôles #emph[externes au modèle]#footnote[#emph[Confused Deputy Attacks on Autonomous AI Agents] — Cloud Security Alliance (AI Safety Initiative) — 2026-03-23 — #link("https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-confused-deputy-prompt-injection/")] (`confirmé`). Le dispatch #tau est exactement ce contrôle externe : il porte #dautorite #emph[avant] que le contenu n'entre dans la fenêtre de contexte de l'agent. Réserve à conserver : la prompt injection demeure un #emph[problème ouvert non entièrement résoluble] (« #emph[an open challenge for agent security… for years to come] », source primaire OpenAI)#footnote[#emph[Understanding prompt injections: a frontier security challenge] — OpenAI — 2025 — #link("https://openai.com/index/prompt-injections/") (date de page `à vérifier`, HTTP 403)] (`confirmé`) — #tau réduit la surface, il ne la ferme pas.

=== 18.5 Le plan protocolaire : transporter l'intention sans figer le paysage

#emph[Insight.] Les protocoles ne sont pas interchangeables : ils occupent des couches distinctes, et l'architecture les compose plutôt qu'elle n'en élit un seul — ce qui impose un #angl[opt-in] versionné, car le paysage bouge en date de juin 2026.

MCP transporte l'accès aux outils. Sa révision stable 2025-11-25 (JSON-RPC 2.0, transports `stdio` et #angl[Streamable HTTP]) durcit fortement l'autorisation : serveur en OAuth 2.1 #angl[Resource Server], RFC 9728 (`MUST`), PKCE S256 (`MUST`), et — décisif pour le #emph[confused deputy] — RFC 8707 (paramètre `resource`, `MUST` inconditionnel côté client), validation d'audience côté serveur, #emph[interdiction explicite du #angl[token passthrough]]#footnote[#emph[Authorization (spécification 2025-11-25)] — Model Context Protocol — 2025-11-25 — #link("https://modelcontextprotocol.io/specification/2025-11-25/basic/authorization")] (`confirmé`). #emph[Nuance vérifiée à ne pas lisser] : le bénéfice de liaison d'audience RFC 8707 ne s'obtient que « #emph[when the Authorization Server supports the capability] » — l'obligation client est inconditionnelle, l'effet de #angl[binding] dépend du support par l'AS. Cette nuance se propage directement dans le calcul de #dautorite : l'architecture ne peut pas #emph[présumer] le binding ; elle doit le vérifier au plan identité.

L'origine de ces durcissements est empiriquement attestée par CVE-2025-49596 (MCP Inspector < 0.14.1, RCE, CVSS v4.0 = 9.4 CRITICAL, NVD 13 juin 2025)#footnote[#emph[CVE-2025-49596 Detail] — NVD / NIST — 2025-06-13 — #link("https://nvd.nist.gov/vuln/detail/CVE-2025-49596")] (`confirmé`). #emph[Divergence temporelle à intégrer dans l'#angl[opt-in] versionné] : le RC 2026-07-28 propose une mutation majeure — cœur #emph[sans état] (suppression de `initialize` et de `Mcp-Session-Id`), dépréciation de Roots/Sampling/Logging, cadre Extensions — mais ces paramètres restent `probable` (RC non finalisé)#footnote[#emph[The 2026-07-28 MCP Specification Release Candidate] — Model Context Protocol Blog — 2026-05-21 — #link("https://blog.modelcontextprotocol.io/posts/2026-07-28-release-candidate/")]. Une architecture de référence doit donc figer la révision MCP qu'elle émet (à l'instar de la discipline `OTEL_SEMCONV_STABILITY_OPT_IN`, §18.7) et ne pas présumer le stateless.

A2A transporte le message et la tâche inter-agents : v1.0 (« #angl[production-ready] »), trois liaisons (JSON-RPC 2.0, gRPC, HTTP+JSON/REST), #emph[Agent Card] signée (`AgentCardSignature`) supportant API Key, HTTP Auth, OAuth2, OIDC, mTLS#footnote[#emph[Announcing Version 1.0 — A2A Protocol] — A2A Project (Linux Foundation) — 2026-03 — #link("https://a2a-protocol.org/latest/announcing-1.0/")] (`confirmé`). #emph[Divergence à conserver] : l'allégation agrégateur « A2A 1.2 » est #emph[réfutée/non confirmée] par la source primaire ; les #emph[Signed Agent Cards] relèvent de v1.0. AGNTCY fournit le tissu d'infrastructure (OASF + Agent Directory + Identity + SLIM + observabilité)#footnote[#emph[Linux Foundation Welcomes the AGNTCY Project] — Linux Foundation — 2025-07-29 — #link("https://www.linuxfoundation.org/press/linux-foundation-welcomes-the-agntcy-project-to-standardize-open-multi-agent-system-infrastructure-and-break-down-ai-agent-silos")] (`confirmé`). La « convergence » est un #emph[alignement en couches], non une unification : A2A = message/tâche ; AGNTCY = annuaire/identité/transport/observabilité ; MCP = accès outils ; AG-UI/A2UI = interface usager (`probable`).

=== 18.6 Le plan identité et autorité : calculer #dautorite

#emph[Insight.] #dautorite n'est pas une donnée fournie par l'agent : c'est un produit calculé par composition de briques éprouvées — identité de charge (SPIFFE), délégation inter-domaines (chaînage OAuth), bornage de permission (capacités ou politiques) — la stratégie dominante de l'industrie étant la #emph[composition], non l'invention d'un protocole d'agent.

Le socle d'identité de charge est mûr et déterministe : SPIFFE/SPIRE est gradué CNCF (depuis 2022 ; dernière version SPIRE v1.15.1 du 28 mai 2026, correctif de sécurité sur l'attestation `azure_imds`)#footnote[#emph[spiffe/spire Releases] — SPIFFE / GitHub — 2026-05-28 — #link("https://github.com/spiffe/spire/releases")]. Un SPIFFE ID est un URI `spiffe://` (trust domain + chemin), encodé dans le SAN d'un X.509-SVID (« #emph[exactly one URI SAN] ») ou dans le `sub` d'un JWT-SVID (`aud` obligatoire et validée)#footnote[#emph[SPIFFE | X509-SVID specification] — SPIFFE — 2026 — #link("https://spiffe.io/docs/latest/spiffe-specs/x509-svid/") ; #emph[SPIFFE | JWT-SVID specification] — SPIFFE — 2026 — #link("https://spiffe.io/docs/latest/spiffe-specs/jwt-svid/")] (`confirmé`). C'est le facteur « autorité_appelant » de #dautorite.

La délégation inter-domaines repose sur la primitive RFC 8693 (OAuth 2.0 Token Exchange, `subject_token`/`actor_token`), prolongée par `draft-ietf-oauth-identity-chaining` au stade #emph[quasi-RFC] (IESG `Approved-announcement::Revised I-D Needed`, ballots 2–3 juin 2026 ; co-auteurs incluant MITRE et NSA-CCSS)#footnote[#emph[draft-ietf-oauth-identity-chaining] — IETF — 2026-06-04 — #link("https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/")] (`confirmé`). #emph[Asymétrie de maturité à ne pas lisser] : le socle (SPIFFE, RFC 8693) est stable, mais la couche protocolaire WIMSE est #emph[entièrement pré-RFC] — aucun document WIMSE n'a atteint le statut RFC en date de juin 2026 — et l'identité #emph[spécifiquement agentique] n'existe qu'en #emph[drafts individuels] non adoptés (`draft-klrc-aiagent-auth`, `draft-araut-…-for-agents`)#footnote[#emph[IETF WIMSE Working Group — Documents] — IETF — 2026-06 — #link("https://datatracker.ietf.org/wg/wimse/documents/")] (`confirmé`). #emph[Piège épistémique récurrent] : pour la quasi-totalité de ces drafts, la métadonnée Datatracker « Intended RFC status » affiche `(None)` alors que l'en-tête indique « Standards Track » — ne pas présenter « Standards Track » comme statut sanctionné. Le pont SPIFFE↔OAuth est lui-même formalisé en draft co-signé NIST + IBM (`draft-ietf-oauth-spiffe-client-auth-01`)#footnote[#emph[draft-ietf-oauth-spiffe-client-auth-01] — IETF — 2026-03-02 — #link("https://datatracker.ietf.org/doc/draft-ietf-oauth-spiffe-client-auth/")] (`confirmé`).

Le bornage de la permission transportée — « autorité_requise_cible » de #dautorite — se joue entre deux modèles opposés. Le tableau suivant en restitue la tension architecturale.

#figure(
  table(
    columns: 4,
    table.header[*Dimension*][*Macaroons / Biscuit (capacités)*][*Cedar (politiques)*][*Apport au calcul de #dautorite*],
    [Nature], [Jeton porteur atténuable], [Langage de politiques (pas un jeton)], [Transporter vs évaluer l'autorité],
    [Atténuation], [Hors-ligne (caveats ; blocs append-only Ed25519)], [N/A (évaluée par moteur)], [Atténuation monotone le long de la chaîne d'agents],
    [Force différenciante], [Décentralisation, POLA], [Analysabilité formelle (Lean, #emph[soundness]+#emph[completeness])], [Vérifiabilité a priori des autorisations d'outils],
    [Gouvernance], [Eclipse `Incubating` (Biscuit) / Google (Macaroons)], [CNCF `Sandbox` (déc. 2025)], [Maturité institutionnelle hétérogène],
    [Maturité agentique], [Chaînes multi-sauts (courant émergent)], [`cedar-for-agents` #emph[expérimental]], [Pont agentique non normatif],
  ),
  caption: [Capacités atténuables vs politiques analysables, projetées sur le calcul de #dautorite (Ch. 12). Le pont agentique reste émergent et non normatif en juin 2026.],
)

Réserve décisive (`confirmé` pour le constat de stade) : #emph[aucun standard IETF/W3C de jeton à capacités pour agents n'est confirmé en juin 2026] ; `cedar-for-agents` (génère un schéma Cedar depuis les descriptions d'outils d'un serveur MCP) et le préprint AIP (non revu, auteur unique — à ne pas citer comme normatif) coexistent sans coordination#footnote[#emph[cedar-policy/cedar-for-agents] — GitHub (cedar-policy) — 2026 — #link("https://github.com/cedar-policy/cedar-for-agents")]. L'architecture #emph[compose] donc SPIFFE + chaînage OAuth + (Cedar ou Biscuit) ; elle n'attend pas un protocole d'autorité agentique unifié, qui n'existe pas.

=== 18.7 Le plan observabilité et provenance : fournir la trace de #dinvariant

#emph[Insight.] #dinvariant se calcule sur une trace, et la qualité de cette dimension est aujourd'hui plafonnée par l'immaturité de l'instrumentation : toute l'observabilité GenAI est #emph[expérimentale], ce qui contraint l'architecture à un #angl[opt-in] explicite versionné.

Le point dur, vérifié page par page : #emph[la totalité des conventions sémantiques OpenTelemetry GenAI demeure en statut « Development »] (spans modèle, spans agent `create_agent`/`invoke_agent`/`execute_tool`, métriques — 7 instruments Histogram —, MCP, conventions par fournisseur) ; aucune sous-section n'affiche « Stable »#footnote[#emph[Semantic conventions for generative AI systems] — OpenTelemetry — 2026 — #link("https://opentelemetry.io/docs/specs/semconv/gen-ai/")] (`confirmé`, haut enjeu). La discipline de transition est explicite : baseline de stabilité v1.36.0 ; les instrumentations « #emph[SHOULD NOT change the version of the GenAI conventions that they emit by default] » ; l'adhésion à la dernière version expérimentale passe par `OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental`#footnote[#emph[Release v1.41.1 — open-telemetry/semantic-conventions] — OpenTelemetry / GitHub — 2026-05-11 — #link("https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.1")] (`confirmé`). Conséquence architecturale directe : #dinvariant (et #dsens, qui peut s'alimenter des spans `gen_ai.*`) repose sur une API #emph[sans garantie de stabilité] — l'architecture #emph[doit] versionner explicitement ses conventions, faute de quoi un saut de version casse silencieusement le calcul du dispatch.

Autour de ce noyau mouvant, trois socles plus stables complètent la trace. Le lignage — « équivalent des traces pour les données » — est assuré par OpenLineage v1.48.0 (3 juin 2026), projet #emph[gradué] LF AI & Data, #emph[complémentaire et non convergent] avec OpenTelemetry#footnote[#emph[OpenLineage — LFAI & Data] — Linux Foundation AI & Data — 2026 — #link("https://lfaidata.foundation/projects/openlineage/")] (`confirmé`). La provenance des entités/activités/agents s'appuie sur W3C PROV-DM, #emph[Recommandation stable mais figée depuis le 30 avril 2013], antérieure à l'ère agentique (l'extension PROV-AGENT, native MCP, reste #emph[au stade recherche])#footnote[#emph[PROV-DM: The PROV Data Model] — W3C — 2013-04-30 — #link("https://www.w3.org/TR/prov-dm/") ; #emph[PROV-AGENT] — Souza et al. / IEEE e-Science 2025 — 2025-08-04 — #link("https://arxiv.org/abs/2508.02866")] (`confirmé`). Enfin, le marquage de sortie relève de C2PA v2.4 (avril 2026, #angl[manifest] signé) et de l'obligation réglementaire de l'art. 50 du Règlement UE 2024/1689, #emph[applicable le 2 août 2026]#footnote[#emph[Article 50: Transparency Obligations] — artificialintelligenceact.eu (Future of Life Institute) — 2026 — #link("https://artificialintelligenceact.eu/article/50/")] (`confirmé`) — avec, par l'accord « AI Omnibus » du 7 mai 2026, un report au 2 décembre 2026 #emph[uniquement] pour les systèmes génératifs déjà sur le marché avant le 2 août 2026 (`probable`, texte définitif à confirmer au JO).

#figure(
  table(
    columns: 4,
    table.header[*Composant de trace*][*Version / date*][*Maturité (juin 2026)*][*Rôle pour le dispatch*],
    [OTel GenAI (toutes sous-sections)], [v1.41.1 — 2026-05-11], [#emph[Development] (aucune « Stable »)], [Alimente #dsens et #dinvariant (API non stable)],
    [OpenLineage], [v1.48.0 — 2026-06-03], [Graduation (LF AI & Data)], [Lignage des datasets sous-jacents],
    [W3C PROV-DM], [Rec. 30 avr. 2013], [Stable mais figé (pas de v2)], [Provenance générique, non agentique],
    [C2PA + art. 50 UE], [v2.4 (avr. 2026) ; appl. 2 août 2026], [Versionné ; en vigueur échelonné], [Marquage et conformité des sorties],
  ),
  caption: [Composants de la trace évaluée par #dinvariant. L'instrumentation agentique normalisée existe mais n'offre #emph[aucune garantie de stabilité d'API] — d'où l'#angl[opt-in] versionné obligatoire.],
)

=== 18.8 Flux de bout en bout : une requête traverse la pile

#emph[Insight.] Mis bout à bout, les six plans décrivent un seul trajet : une requête entre par le substrat, est dispatchée par #tau, et soit emprunte la branche déterministe garantie, soit est déléguée à un agent dont chaque effet de bord est tracé et non rejouable.

Trajet de référence (illustratif ; reprend les briques des §18.3–18.7) :

```
1. Ingestion      requête publiée sur Kafka (offset, replay déterministe)        [§18.3]
2. Identité       SVID SPIFFE de l'appelant résolu ; audience cible liée
                  (RFC 8707 'resource' — binding effectif SI l'AS le supporte)   [§18.6]
3. Dispatch tau   tau évalue D-Sens × D-Autorite × D-Invariant -> Decision       [§18.4]
     |-- Deterministe : routage vers garantie de message (MQ once-and-only-once
     |                   ou read-process-write interne Kafka)                     [§18.3]
     |-- Probabiliste : délégation à l'agent LLM via outil MCP
     |                   (z/OS Connect / MCP Gateway ; A2A si multi-agents)       [§18.2/18.5]
     |-- Refus (tau-Refus) : rejet ; consigné, aucune action                     [§18.4]
4. Effet de bord  l'action de l'agent SORT du périmètre EOS -> NON exactly-once  [§18.1]
                  -> DLQ enrichie (prompt-id / model-version / offset)           [§18.3]
5. Trace          spans OTel gen_ai.* (Development) + lignage OpenLineage
                  + provenance PROV / marquage C2PA ; alimente D-Invariant       [§18.7]
```

Deux propriétés de cette topologie méritent d'être soulignées. D'abord, la #emph[non-rejouabilité] est confinée à l'étape 4 : tout ce qui précède le dispatch est déterministe et auditable par replay du #angl[log] ; tout effet de bord probabiliste est isolé et tracé, jamais présumé idempotent. Ensuite, le #emph[chain splicing] (re-délégation inter-agents ciblant l'agent délégué, moins protégé) — documenté comme amplification multi-agent et convergent avec le « #emph[credential relay through delegation chains] » du Ch. 13 — est combattu non au niveau du modèle mais au plan identité/autorité, par l'atténuation monotone des capacités (§18.6) et la liaison d'audience (§18.5)#footnote[#emph[MITRE ATT&CK and ATLAS Agentic Gap Analysis] — Cloud Security Alliance — 2026-03-27 — #link("https://labs.cloudsecurityalliance.org/agentic/csa-research-note-atlas-agentic-gap-analysis-20260327/")] (`probable` ; le terme « chain splicing » reste de la littérature secondaire).

#corpusTODO[Reprendre du corpus mère et du #ciaFull la formalisation de la #emph[propagation de garanties] le long de ce trajet (algèbre d'héritage : comment une garantie déterministe à l'étape 1 est ou non préservée après la délégation de l'étape 3), ainsi que le banc empirique #emph[AgentMeshKafka] qui doit mesurer cette propagation. Ces éléments — types de session tolérants au #angl[drift], règles d'héritage, code Lean 4 — ne sont pas fournis ici.]

=== 18.9 Frontière de validité de l'architecture proposée

#emph[Insight.] Cette architecture est une #emph[proposition] dont la validité est bornée par trois faits non négociables de juin 2026 : l'absence de standard d'identité agentique, l'instabilité de l'observabilité GenAI, et l'opacité documentaire de plusieurs briques mainframe.

Trois limites circonscrivent explicitement la portée de la proposition. (1) #emph[Asymétrie de maturité de l'identité.] Le socle (SPIFFE, RFC 8693) est `confirmé`, mais la couche agentique est pré-RFC et non adoptée ; toute dépendance à un « standard d'identité d'agent » est prématurée (`hypothèse` pour tout calendrier de RFC, vraisemblablement 2027–2028). (2) #emph[Instabilité de l'observabilité.] L'intégralité d'OTel GenAI étant en « Development », le calcul de #dsens et #dinvariant à partir de ces conventions est exposé à des ruptures d'API — la robustesse du dispatch dépend d'un facteur hors du contrôle de l'architecte. (3) #emph[Opacité documentaire mainframe.] Plusieurs détails décisifs restent `à vérifier` du fait du blocage HTTP 403 sur `ibm.com/docs` : transport et modèle d'authentification MCP de z/OS Connect, détail du 2PC/XA d'IBM MQ, version d'introduction de Native HA CRR. L'architecture suppose ces points résolus favorablement ; cette supposition n'est pas attestée.

Enfin, le couplage des #ruptures (déterministe→probabiliste, syntaxique→sémantique, composition→délégation) demeure la thèse qui justifie le point de dispatch unique : ce n'est pas que le substrat devienne probabiliste, ni que la syntaxe cède à la sémantique, ni que la composition cède à la délégation #emph[séparément] — c'est que ces trois bascules surviennent #emph[ensemble] à la traversée de #tau. Toute architecture qui traiterait ces axes indépendamment manquerait la frontière que #tau a précisément pour fonction de tenir.

=== Questions ouvertes

- #emph[Identité agentique normative.] Un groupe de travail (WIMSE ou OAuth) adoptera-t-il un document #emph[normatif] dédié à l'identité d'agent d'ici 2027 (`hypothèse`) ? Surveiller `draft-araut-…-for-agents-02` et `draft-ni-wimse-ai-agent-identity-02`, et le passage d'`identity-chaining` au-delà de « Revised I-D Needed ».
- #emph[Stabilité de l'observabilité.] Une sous-section GenAI d'OpenTelemetry atteindra-t-elle « Stable » avant fin 2026, et le dépôt `semantic-conventions-genai` produira-t-il sa première release (actuellement « No releases published ») ? Sans cela, le calcul de #dinvariant reste sur API instable.
- #emph[Transport/auth MCP du mainframe.] Quel transport MCP (#angl[Streamable HTTP] / SSE / stdio) et quel modèle d'authentification z/OS Connect 3.0 emploie-t-il (docs en 403) ? Réponse déterminante pour brancher le substrat Z sur le plan protocolaire.
- #emph[Atomicité au-delà du substrat.] Quelle version d'Apache Kafka intégrera KIP-939 (2PC externe, « Accepted », version `à vérifier`), et le détail du coordinateur 2PC/XA d'IBM MQ — embarqué ou participant ? De cela dépend l'étendue réelle de la branche #emph[Déterministe] au-delà d'un seul système.
- #emph[Capacités pour agents.] Au-delà de `cedar-for-agents` (expérimental) et du préprint AIP (non revu), un acteur majeur publiera-t-il une #emph[spécification officielle] de délégation à capacités pour MCP/A2A ? Aucune confirmée à ce jour.
- #emph[Surcoût du dispatch.] Existe-t-il une mesure primaire horodatée du surcoût de la frontière déterministe (latence/débit de l'EOS Kafka) ? À défaut, substituer une mesure propre via #emph[AgentMeshKafka] (#corpusTODO[banc empirique à reprendre du corpus]).
- #emph[Conformité du marquage.] Le texte définitif du Règlement Omnibus consacre-t-il l'échéance du 2 décembre 2026 et la restriction aux systèmes #emph[legacy], et les lignes directrices de la Commission sur l'art. 50 imposent-elles C2PA ou restent-elles neutres (`à vérifier`) ?

#pagebreak()

== Ch. 19 — Instanciation en services financiers régulés

#emph[Insight-clé.] L'institution financière régulée constitue le banc d'épreuve le plus contraignant de l'#optau, parce qu'elle impose simultanément trois exigences que les trois ruptures couplées (#ruptures) rendent difficiles à satisfaire ensemble : *souveraineté* de la donnée et du calcul (le cœur de système reste sur substrat patrimonial, désormais exposé comme outils #angl[MCP]), *auditabilité* par rejeu (rejouer une décision à entrées identiques) et *imputabilité* d'un dirigeant nommé sur un acte délégué à un agent probabiliste. Or le rejeu déterministe et l'exactitude de tâche ne sont *pas* détectablement corrélés#footnote[Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness for Tool-Using LLM Agents (DFAH) — Raffi Khatchadourian — arXiv:2601.15322, v2 — 2026-03-07 — #link("https://arxiv.org/abs/2601.15322")] : la conformité ne peut donc pas se déduire de la qualité fonctionnelle, elle doit se mesurer séparément. La thèse opérationnelle de ce chapitre est que le #tauRefus joue, dans ce secteur, le rôle d'un *disjoncteur réglementaire* — il refuse de déplacer #tfix vers le régime probabiliste lorsqu'un invariant d'autorité ou de traçabilité n'est pas satisfait, transformant une obligation de moyens (gouvernance) en garantie de message (substrat déterministe). Le cadre normatif s'est densifié en 2025–2026 (DORA en application, E-23 et la ligne directrice de l'AMF finalisées), ce qui ancre empiriquement cette instanciation plutôt que de la postuler.

=== Le substrat régulé : un cœur patrimonial désormais exposé comme outils MCP

#emph[Insight-clé.] Dans la banque et l'assurance, le système d'enregistrement (#angl[system of record]) demeure sur mainframe, et l'événement marquant de 2025–2026 est que ce cœur souverain est *exposé comme outils #angl[MCP]* — la frontière substrat/action passe désormais à l'intérieur même du z/OS, ce qui déplace la question de souveraineté du « où vit la donnée » vers « quelle autorité fixe le sens d'un appel d'agent sur cette donnée ».

IBM expose ses plateformes z/OS et IBM i comme serveurs #angl[MCP], permettant à un agent #angl[LLM] de découvrir et de consommer CICS, Db2, IMS et MQ. La capacité est *confirmée* ; les sous-versions et le statut GA/preview restent partiellement *à vérifier*, le blocage HTTP 403 sur #raw("docs.ibm.com") empêchant la lecture directe de plusieurs pages produit. Trois mécanismes coexistent, de maturité hétérogène.

#figure(
  table(
    columns: 5,
    align: left,
    table.header(
      [*Connecteur*], [*Plateforme / données*], [*Mécanisme MCP*], [*Licence / origine*], [*Statut (juin 2026)*],
    ),
    [z/OS Connect (lignée 3.0)], [z/OS : CICS, Db2, IMS, MQ], [OpenAPI 3 → outils MCP (descriptions auto-générées depuis la spec)], [IBM (commercial)], [Capacité MCP *confirmée* dès la 3.0.98 (21 oct. 2025) ; lignée portée à 3.0.103 (mai 2026, APAR PH70973)],
    [CICS MCP server], [CICS TS 6.x (in-transaction)], [Outils assistant un LLM, intégrés dans les transactions CICS], [IBM (commercial)], [*Confirmé* pour l'existence ; CICS TS 6.3.0 GA le 5 sept. 2025 ; refresh exact du serveur MCP *à vérifier*],
    [ibmi-mcp-server], [IBM i : Db2 for i], [Outils SQL configurés en YAML, WebSocket via Mapepire], [*Apache 2.0* (IBM / GitHub)], [Dévoilé en oct. 2025 à l'état « early version » ; dépôt affichant « Stable » en juin 2026 — divergence temporelle à ne pas lisser],
  ),
  caption: [Connecteurs MCP mainframe IBM en institution financière : trois maturités, deux modèles de licence.],
)
#footnote[z/OS Connect 3.0.98 now available — introduction du MCP (IBM Community, S. Krishnan) — 2025-10-21 — #link("https://community.ibm.com/community/user/blogs/shruthi-krishnan/2025/10/21/zos-connect-3098-now-available") ; PH70973 — z/OS Connect EE Unlimited CD update (3.0.103) — IBM Support — 2026-05 — #link("https://www.ibm.com/support/pages/ph70973-ibm-zos-connect-enterprise-edition-unlimited-continuous-delivery-update-30103-notices-and-information") ; How it works: the CICS MCP server — IBM Documentation — 2026 (403 au fetch, confirmé via index) — #link("https://www.ibm.com/docs/en/cics-ts/6.x?topic=ai-how-it-works-cics-mcp-server") ; IBM/ibmi-mcp-server (README + LICENSE Apache 2.0 ; badge « Stable » en juin 2026) — IBM (GitHub) — 2026 — #link("https://github.com/IBM/ibmi-mcp-server")]

Deux conséquences pour la souveraineté. Premièrement, la donnée régulée ne quitte pas le substrat : c'est une *description d'outil* (et non la donnée) qui est publiée vers l'agent, et l'exécution (transaction CICS, requête Db2) reste sur z/OS — propriété que le secteur exige et que le modèle #angl[MCP] préserve par construction lorsque le serveur est colocalisé. Deuxièmement, la *licence* devient un critère de conformité tiers : z/OS Connect et le serveur CICS sont commerciaux (chaîne contractuelle IBM, donc lisible par la gestion du risque tiers), tandis que `ibmi-mcp-server` est sous Apache 2.0 (composant open-source à inventorier comme dépendance — cf. ASI04 #angl[Agentic Supply Chain Vulnerabilities] de l'OWASP Top 10 Agentic). IBM déclare par ailleurs l'intention de livrer « 500 outils #angl[MCP] en 2026 » pour ses plateformes ; cette ambition, citée verbatim par la presse spécialisée, reste *probable* (document source IBM non directement lisible) et ne doit pas être traitée comme un engagement contractuel#footnote[Beta Of MCP Server Opens Up IBM i For Agentic AI (cite verbatim « our intent is to deliver 500 tools in 2026 ») — IT Jungle (presse spécialisée) — 2025-10-27 — #link("https://www.itjungle.com/2025/10/27/beta-of-mcp-server-opens-up-ibm-i-for-agentic-ai/")].

#corpusTODO[La frontière substrat/action et la propriété « la garantie de message ne couvre pas l'effet de bord externe (appel LLM) » sont établies au corpus mère (lignée Kafka EOS / impossibilité de l'#emph[exactly-once delivery]). Ce chapitre y réfère : ne pas redériver la borne, l'instancier sur z/OS Connect.]

=== Souveraineté et localisation : du périmètre réseau à la fixation du sens

#emph[Insight-clé.] En contexte régulé canadien et européen, la souveraineté ne se réduit plus à la résidence des données ; elle inclut la *résidence de la décision* — quel régime (#decision) a fixé #tfix, sous quelle autorité, et où cette fixation est-elle traçable. Le déplacement de #tfix par l'#optau devient lui-même un objet de conformité.

Les régulateurs traitent désormais le risque tiers ICT comme central. DORA (Règlement (UE) 2022/2554, *confirmé* : adoption 14 déc. 2022, application *17 janvier 2025*) impose la gestion du risque ICT tiers (art. 28), des tests de résilience dont le #angl[Threat-Led Penetration Testing] (TLPT) et un cadre d'#angl[oversight] UE des prestataires ICT critiques (CTPP)#footnote[Digital Operational Resilience Act (DORA) — Règlement (UE) 2022/2554, application 17 janv. 2025 — EIOPA — 2025 — #link("https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en") ; Regulation (EU) 2022/2554 — texte consolidé — EUR-Lex — 2022-12 — #link("https://eur-lex.europa.eu/eli/reg/2022/2554/oj/eng")]. Le dispositif est complété par des actes confirmés sur EUR-Lex : l'ITS sur le registre d'information (Reg. exéc. (UE) 2024/2956, art. 28(3)), le RTS TLPT (Reg. délégué (UE) 2025/1190, art. 26) et le RTS sous-traitance ICT (Reg. délégué (UE) 2025/532, art. 30(5))#footnote[Commission Implementing Regulation (EU) 2024/2956 — register of information — EUR-Lex — 2024-12 — #link("https://eur-lex.europa.eu/eli/reg_impl/2024/2956/oj/eng") ; Commission Delegated Regulation (EU) 2025/1190 — TLPT — EUR-Lex — 2025-06 — #link("https://eur-lex.europa.eu/eli/reg_del/2025/1190/oj/eng") ; Commission Delegated Regulation (EU) 2025/532 — subcontracting ICT services — EUR-Lex — 2025-07 — #link("https://eur-lex.europa.eu/eli/reg_del/2025/532/oj/eng")]. #emph[Divergence à conserver] : le numéro « 2024/2956 » avait d'abord transité par une source secondaire (QuoIntelligence) avant confirmation EUR-Lex ; l'échéance annuelle de soumission du registre (gabarit XBRL/XML, échéance rapportée mais à reconfirmer) demeure *à vérifier* sur source primaire EBA.

Côté canadien, l'OSFI/BSIF a finalisé la ligne directrice E-23 (#angl[Model Risk Management] 2027, datée du 11 sept. 2025), élargissant explicitement le périmètre du risque de modèle à l'usage de l'IA par les institutions financières fédérales#footnote[Guideline E-23 — Model Risk Management (2027) — BSIF/OSFI — 2025-09-11 — #link("https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027")]. L'AMF a rendu officielle, le 7 avril 2026, sa ligne directrice sur l'utilisation de l'intelligence artificielle — assortie, *à confirmer* (PDF AMF en 403), d'un *registre* des systèmes d'IA et d'une *cote de risque* — et a couplé l'exercice à une ligne directrice sur la gestion du risque lié aux tiers (effet au 1#super[er] avril 2027)#footnote[Ligne directrice sur l'utilisation de l'intelligence artificielle — AMF — 2026-04 — #link("https://lautorite.qc.ca/en/professionals/insurers/guidelines/use-of-models/guideline-for-the-use-of-artificial-intelligence") ; Lignes directrices en matière d'IA et de gestion du risque lié aux tiers (communiqué) — AMF — 2026-04-07 — #link("https://lautorite.qc.ca/grand-public/salle-de-presse/actualites/fiche-dactualite/lignes-directrices-en-matiere-dintelligence-artificielle-et-de-gestion-du-risque-lie-aux-tiers")]. Aux États-Unis, le Trésor a publié le 19 février 2026 deux ressources *non contraignantes* (#angl[soft law]) : un #angl[AI Lexicon] et un #angl[Financial Services AI Risk Management Framework] aligné sur le NIST AI RMF, fournissant une matrice de *230 objectifs de contrôle* — chiffre *probable*, à confirmer sur le document primaire treasury.gov#footnote[Treasury Releases Two New Resources to Guide AI Use in the Financial Sector (sb0401) — U.S. Department of the Treasury — 2026-02-19 — #link("https://home.treasury.gov/news/press-releases/sb0401")].

Le tableau suivant relie chaque obligation pertinente à son point d'instanciation dans la machinerie de l'#optau (renvois au Ch. 15 pour le mapping réglementaire détaillé, au Ch. 14 pour la trace, au Ch. 12 pour l'autorité déléguée).

#figure(
  table(
    columns: 4,
    align: left,
    table.header(
      [*Obligation (instrument)*], [*Exigence opérationnelle*], [*Mécanisme #optau / canon*], [*Statut de l'instrument*],
    ),
    [Risque ICT tiers — DORA art. 28 ; AMF risque-tiers ; OSFI E-23 périmètre élargi], [Inventaire et surveillance des prestataires/composants ICT, dont les serveurs MCP], [Frontière substrat/action : serveur MCP commercial vs open-source porté à l'inventaire ; #dautorite borne l'appelant], [DORA *confirmé* (appl. 17 janv. 2025) ; E-23 *confirmé* (2025-09-11) ; AMF tiers effet 2027],
    [Auditabilité / rejeu — SR 11-7 ; FFIEC IT ; E-23 ; AMF registre], [Rejouer une décision à entrées identiques + capturer la chaîne de raisonnement], [Trace PROV (Ch. 14) ; #dinvariant lit l'état des invariants sur la trace ; DFAH mesure le déterminisme indépendamment de l'exactitude], [SR 11-7/FFIEC *probable* (primaires Fed/FFIEC à citer en propre) ; DFAH *confirmé*],
    [Imputabilité d'un dirigeant — AMF (imputabilité ; registre + cote de risque)], [Un responsable nommé répond d'un acte délégué à l'agent], [Chaîne d'autorité déléguée (Ch. 12) ; #tauRefus si l'autorité requise excède l'autorité de l'appelant], [AMF officielle *confirmée* (2026-04-07) ; *registre* + *cote* *probables*],
    [Résilience / tests — DORA TLPT (RTS 2025/1190)], [Tests de pénétration guidés par la menace sur la chaîne agentique], [Surface d'attaque OWASP Top 10 Agentic (ASI01–ASI10) ; #tauRefus comme point d'arrêt testable], [RTS *confirmé* (EUR-Lex 2025/1190)],
    [Transparence non contraignante — Treasury FS AI RMF (230 obj.)], [Cartographie de contrôles sur le cycle de vie de l'IA], [Référentiel volontaire à recouper avec #cia (pont garanties/comportement)], [*Confirmé* (publication) ; 230 obj. *probable*],
  ),
  caption: [Mapping des obligations financières régulées vers les mécanismes de l'#optau (cf. Ch. 15).],
)

=== Auditabilité : la trace PROV comme objet de conformité

#emph[Insight-clé.] En finance régulée, l'auditabilité exige deux propriétés distinctes qu'il faut mesurer séparément : *rejouabilité* (mêmes entrées → mêmes sorties) et *fidélité conditionnée à l'évidence* (la décision est justifiée par les données effectivement considérées). Le harnais DFAH démontre que la première ne garantit pas l'exactitude fonctionnelle ; la trace PROV (Ch. 14) fournit le support matériel de la seconde et alimente directement la dimension #dinvariant de l'#optau.

L'auditabilité réglementaire impose de capturer, pour chaque décision : les données considérées, la logique de décision, les alternatives écartées, le niveau de confiance, les autorisations de l'agent, le contexte reçu, les systèmes aval touchés et toute approbation ou #angl[override] humain. Les superviseurs réutilisent à cette fin des cadres préexistants — la #angl[guidance] SR 11-7 sur le risque de modèle (Réserve fédérale), la #angl[guidance] IT du FFIEC et la gestion du risque tiers. Ce principe est *probable* et largement admis ; SR 11-7 et le FFIEC étant des sources primaires (Fed/FFIEC), ils doivent être cités en propre dans la rédaction finale plutôt que via une analyse secondaire#footnote[Agentic AI Governance for Financial Services: The CISO's Readiness Checklist (rappelle que SR 11-7 / FFIEC sont des primaires Fed/FFIEC) — ABT (secondaire) — 2026 — #link("https://www.myabt.com/blog/agentic-ai-governance-financial-services")].

Le résultat empirique structurant provient du harnais DFAH (#angl[Determinism-Faithfulness Assurance Harness]), qui mesure trois propriétés sur des agents outillés : déterminisme de trajectoire, déterminisme de décision (sorties stables à entrées identiques rejouées) et fidélité conditionnée à l'évidence. Son constat-clé — *le déterminisme de décision et l'exactitude de tâche ne sont pas détectablement corrélés* — a une portée réglementaire directe : un agent peut être parfaitement rejouable et fonctionnellement faux, ou exact et non rejouable. La conformité (rejeu d'audit) et la performance (exactitude) doivent donc faire l'objet de bancs distincts. C'est précisément la justification empirique de séparer, dans l'#optau, la mesure #dsens (score sémantique de la tâche) de l'état #dinvariant (traçabilité/rejouabilité sur la trace) : ce sont deux signaux non substituables.

#figure(
  table(
    columns: 3,
    align: left,
    table.header(
      [*Élément à capturer (audit)*], [*Support PROV / canon (Ch. 14)*], [*Dimension #optau alimentée*],
    ),
    [Données considérées + alternatives écartées], [Entités PROV + relations d'usage], [#dsens (pertinence sémantique)],
    [Logique de décision + niveau de confiance], [Activité PROV horodatée + attributs], [#dsens / #dinvariant],
    [Autorisations et périmètre de l'agent], [Agent PROV + délégation (Ch. 12)], [#dautorite],
    [Override / approbation humaine], [Activité PROV attribuée à un agent humain], [#dinvariant (statut d'invariant sur la trace)],
    [Rejouabilité à entrées identiques], [Trace complète versionnée (banc DFAH)], [#dinvariant],
  ),
  caption: [De l'exigence d'audit à la dimension d'entrée de l'#optau, via la trace PROV.],
)

#corpusTODO[Les énoncés précis et statuts des invariants I1, I2, I3, I5 ne sont pas fournis ici. Pour articuler formellement « rejouabilité ⇒ état de #dinvariant », reprendre du corpus mère l'invariant adéquat et son statut. #i4 demeure une #emph[Hypothèse] (campagne empirique non concluante) : ne pas l'invoquer comme garantie d'auditabilité acquise.]

=== Imputabilité dirigeante et autorité déléguée : le #tauRefus comme disjoncteur réglementaire

#emph[Insight-clé.] L'exigence d'imputabilité (un dirigeant nommé répond d'un acte) entre en tension frontale avec la délégation à un agent probabiliste ; le #tauRefus résout cette tension en *refusant de fixer #tfix* en régime probabiliste lorsque l'autorité requise par la cible excède l'autorité effectivement déléguée à l'appelant — il convertit une zone d'incertitude réglementaire en refus déterministe, traçable et testable.

La ligne directrice de l'AMF — en imposant l'imputabilité d'un dirigeant nommé et, *à confirmer* (PDF AMF en 403), un registre des systèmes d'IA assorti d'une cote de risque — présuppose un responsable identifiable par système. Cette imputabilité se traduit techniquement par la chaîne d'autorité déléguée (Ch. 12) : l'agent agit *au nom de* (et dans les limites de) l'autorité d'un principal humain, et tout franchissement de ces limites doit être bloqué *avant* l'effet de bord. C'est la fonction du #tauRefus : sur l'axe #dautorite (autorité de l'appelant × autorité requise par la cible), un produit insuffisant force la sortie « Refus » de #decision plutôt qu'une tentative probabiliste. Le refus n'est pas une dégradation — c'est la garantie de message du substrat déterministe réaffirmée à la frontière, c'est-à-dire exactement la propriété qu'un superviseur peut auditer.

L'écosystème de délégation outille cette chaîne, à des degrés de maturité variables (cf. Ch. 12). Les jetons de transaction et l'enchaînement d'identité côté OAuth — RFC 8693 (#angl[Token Exchange], *confirmé*), `draft-ietf-oauth-identity-chaining` et `draft-ietf-oauth-transaction-tokens` (#angl[Internet-Drafts] actifs) — portent l'autorité à travers les domaines#footnote[RFC 8693 — OAuth 2.0 Token Exchange — IETF — 2020-01 — #link("https://datatracker.ietf.org/doc/rfc8693/") ; draft-ietf-oauth-identity-chaining — IETF — 2026-06-04 — #link("https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/")]. Les modèles de capacité atténuables (Biscuit, Cedar) offrent une atténuation monotone de l'autorité que le #tauRefus peut vérifier localement#footnote[Specifications — Eclipse Biscuit (Datalog, atténuation, append-only) — 2025 — #link("https://doc.biscuitsec.org/reference/specifications.html") ; Cedar (Extended Version), arXiv:2403.04651 (Rust + Lean) — 2024-03-07 — #link("https://arxiv.org/abs/2403.04651")]. #emph[À vérifier] : `draft-araut-oauth-transaction-tokens-for-agents` introduit un concept de « #angl[Monotonic Attenuation] » d'autorité pour agents, mais c'est une soumission individuelle au statut instable (divergence d'#angl[intended status]) — à ne pas traiter comme normative en date de juin 2026#footnote[draft-araut-oauth-transaction-tokens-for-agents-02 (individuel ; agentic_ctx + Monotonic Attenuation) — IETF Datatracker — 2026-05-22 — #link("https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/")].

Le schéma ci-dessous illustre l'instanciation : un outil #angl[MCP] exposé par z/OS Connect sur une opération Db2 régulée, dont l'appel par un agent est arbitré par un disjoncteur #tauRefus paramétré sur l'autorité déléguée et l'état des invariants. La forme YAML reprend le patron `ibmi-mcp-server` (outils SQL déclarés en YAML) ; le bloc de garde encode la condition de refus.

```yaml
# Exposition souveraine d'un outil MCP sur substrat régulé (z/OS / Db2 for i)
# Patron : ibmi-mcp-server (outils SQL en YAML, exécution colocalisée sur le cœur)
tool:
  name: "consulter_solde_compte_reglemente"
  source: "z/OS Connect 3.0.x (OpenAPI 3 -> outil MCP, description auto-générée)"
  data_residency: "on-z"          # la donnée NE quitte PAS le substrat (souveraineté)
  backend:
    subsystem: "Db2"               # CICS/Db2/IMS confirmés ; MQ : à vérifier en 3.0 (docs 403)
    operation: "SELECT solde FROM comptes WHERE id = :compte"

# Disjoncteur réglementaire : porte d'entrée de l'opérateur tau (dispatch)
tau_dispatch:
  D_Autorite:                      # autorité_appelant x autorité_requise_cible
    autorite_requise: "lecture_compte_client"
    exiger_delegation_active: true # jeton OAuth chaîné (RFC 8693) valide et non expiré
  D_Invariant:                     # état des invariants sur la trace (PROV, Ch. 14)
    exiger_trace_prov: true        # sans trace rejouable -> pas de régime probabiliste
  regle_de_refus:                  # tau-Refus = sortie déterministe auditée
    si: "autorite_appelant < autorite_requise  OU  trace_prov == absente"
    alors: "Refus"                 # Decision in {Déterministe, Probabiliste, Refus}
    journaliser:
      evenement_prov: "tau_refus"  # le refus lui-même est une activité PROV imputable
      imputabilite: "principal_humain_delegant"   # dirigeant nommé (registre AMF)
```

Ce schéma rend trois propriétés simultanément vérifiables par un auditeur : la donnée ne migre pas (souveraineté), tout refus est journalisé comme activité PROV imputable à un principal humain (imputabilité AMF), et la condition de refus est un prédicat déterministe testable par un exercice TLPT (résilience DORA). Le refus est ainsi le point où les trois ruptures couplées se replient sur une garantie déterministe contrôlable.

#corpusTODO[Les règles précises de l'algèbre d'héritage de garanties du #ciaFull et la mécanisation Lean 4 ne sont pas fournies. La propriété « le #tauRefus hérite de la garantie déterministe du substrat » doit être reprise du corpus mère (types de session probabilistes / tolérants au #angl[drift] ; analogie M(π)/π-calcul) — ne pas la fabriquer ici.]

=== Plan de contrôle et adoption : ce que le terrain confirme, ce qu'il ne confirme pas

#emph[Insight-clé.] L'outillage de gouvernance agentique se constitue en *plan de contrôle* d'entreprise, mais les chiffres d'adoption les plus cités relèvent de communiqués et de secondaires ; la cause dominante d'échec rapportée — la gouvernance, non la capacité — est cohérente avec la thèse de ce chapitre, sans en constituer une preuve.

IBM positionne une nouvelle génération de watsonx Orchestrate comme plan de contrôle agentique offrant observabilité et gouvernance plein cycle et une évaluation pré-déploiement multidimensions ; ce fait est *probable*, la page d'annonce renvoyant HTTP 403 au fetch (contenu reconstruit via index) et l'association à un événement précis restant *à vérifier*#footnote[Revolutionizing AI Agent management with IBM watsonx Orchestrate new Observability and Governance capabilities (403 au fetch, contenu via recherche) — IBM — 2026-05 — #link("https://www.ibm.com/new/announcements/revolutionizing-ai-agent-management-with-ibm-watsonx-orchestrate-new-observability-and-governance-capabilities")]. Sur l'adoption, le Stanford AI Index 2026 rapporte *66,3 %* de succès sur OSWorld (depuis ~12 % un an plus tôt), chiffre *confirmé* sur la source primaire HAI#footnote[The 2026 AI Index Report (66,3 % OSWorld ; ~423 pages) — Stanford HAI — 2026-04 — #link("https://hai.stanford.edu/ai-index/2026-ai-index-report")]. #emph[Divergence à conserver] : un blogue #angl[computer-use] avance *82 %* sur OSWorld — instantané et agent différents, à ne pas fusionner. Le volet souvent cité « ~89 % des implémentations d'agents (coût 150 k–800 k USD) n'atteignent jamais la production, la gouvernance étant la cause dominante » est corroboré par plusieurs secondaires mais *n'a pas été reconfirmé* sur la page primaire HAI : il demeure *probable* et ne peut servir d'argument normatif. De même, les enquêtes d'éditeurs (PwC : 79 % exécutent déjà des agents ; Deloitte : 25 % en 2025 → 50 % en 2027) restent *à vérifier* faute de sources primaires lisibles.

=== Questions ouvertes

- *Souveraineté du transport/auth MCP sur z/OS Connect.* Quel transport (#angl[HTTP streamable] / SSE / stdio) et quel modèle d'authentification la lignée 3.0 emploie-t-elle pour exposer ses outils #angl[MCP] ? Point critique pour la conformité, non confirmé (#raw("docs.ibm.com") en 403) — vérifier via PDF du Knowledge Center ou client authentifié.
- *Statut GA des connecteurs.* Dans quel refresh exact de la lignée 3.0 (3.0.9x) la capacité « OpenAPI 3 → outils MCP » est-elle GA plutôt que #angl[technology preview], et quel release de CICS TS 6.x introduit le serveur MCP (au-delà de l'agent de détermination de problème requérant 6.3 + APAR PH68212) ?
- *Registre DORA.* Confirmer sur EUR-Lex/EBA l'échéance annuelle exacte de soumission du registre d'information (gabarit XBRL/XML) au titre de l'ITS 2024/2956 ; à vérifier en date de juin 2026.
- *Treasury FS AI RMF.* Confirmer le chiffre de 230 objectifs de contrôle et le mappage explicite aux fonctions/catégories du NIST AI RMF sur treasury.gov (actuellement *probable*).
- *Mapping E-23 / AMF ↔ #optau.* L'articulation fine des obligations canadiennes (E-23 risque de modèle ; registre et cote de risque de l'AMF, *à confirmer* sur PDF primaire) vers les dimensions #dautorite/#dinvariant relève du Ch. 15 ; reste à formaliser l'équivalence « cote de risque réglementaire ↔ seuil de bascule #tfix ».
- *Statut formel des invariants et de l'algèbre.* Les énoncés et statuts de I1, I2, I3, I5, les règles de l'algèbre d'héritage de garanties et le code Lean 4 du #cia doivent être repris du corpus mère pour fonder formellement le #tauRefus comme disjoncteur ; #i4 demeure une #emph[Hypothèse].
- *Drift réglementaire normatif d'agents.* Le concept de « #angl[Monotonic Attenuation] » d'autorité pour agents (`draft-araut-...`) et l'ensemble des #angl[Internet-Drafts] de délégation d'agents sont à re-vérifier à la date d'exécution (statut/expiration), aucun n'étant normatif en date de juin 2026.
