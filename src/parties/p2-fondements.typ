#import "../../lib/canon.typ": *

= PARTIE II — Fondements formels

== Ch. 4 — La tension fondamentale : garanties déterministes vs comportement probabiliste

#block(fill: luma(245), inset: 10pt, radius: 3pt, width: 100%)[
*Insight-clé.* La tension qui structure cette monographie n'est pas une opposition de styles d'ingénierie mais une *discontinuité de régime de garantie* : le substrat de messagerie d'entreprise offre des garanties déterministes — _exactly-once_, ordre, idempotence — *bornées à un périmètre interne fermé* (le cycle _read-process-write_ d'un courtier), tandis que l'agent _LLM_ qu'on y branche produit un comportement probabiliste et révisable dont l'unité d'action — l'appel _RPC_ externe à effet de bord non rejouable — *tombe précisément hors de ce périmètre*. La frontière n'est donc pas conceptuelle : elle est tracée, en date de juin 2026, par la documentation des substrats eux-mêmes, qui circonscrit verbatim la portée de leur garantie. C'est cette frontière empirique — _delivery_ garanti / effet externe non garanti — que l'#optau est conçu pour arbitrer (#tau au Ch. 5), et c'est elle qui fonde l'ancrage empirique de la thèse déjà posé au Ch. 9.
]

Ce chapitre est empirique. Il ne formalise pas l'arbitrage — c'est l'objet du Ch. 5 — mais il *établit que l'arbitrage est nécessaire*, en montrant que les deux régimes ne se rejoignent nulle part dans les substrats de production actuels. L'argument procède en quatre temps : (1) caractériser ce que «&nbsp;déterministe&nbsp;» garantit réellement et où la garantie s'arrête ; (2) caractériser en quoi le comportement d'agent est irréductiblement probabiliste *et* révisable ; (3) localiser la couture exacte — la distinction _delivery_ / _processing_, puis la frontière périmètre-interne / effet-externe ; (4) montrer que les patrons de mitigation existants (_transactional outbox_, _DLQ_, _replay_) déplacent la tension sans la dissoudre. Cette tension est la première des #ruptures ; son couplage aux deux autres (syntaxique→sémantique, composition→délégation) est la thèse de l'ouvrage, non l'objet de ce chapitre.

=== 4.1 Ce que «&nbsp;déterministe&nbsp;» garantit — et où la garantie s'arrête

La garantie déterministe d'un substrat de messagerie est *réelle, atomique et vérifiable, mais structurellement close sur elle-même*. Elle ne franchit pas la membrane du courtier.

Du côté du log distribué, l'_exactly-once semantics_ (EOS) d'Apache Kafka remonte à Kafka&nbsp;0.11 (juin&nbsp;2017) via KIP-98 : producteur idempotent (identifiant de producteur + numéros de séquence par partition), transactions inter-partitions atomiques, consommateur en mode `read_committed`/`read_uncommitted`#footnote[KIP-98 — Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — 2026-03-04 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging")]. En date de juin&nbsp;2026, la défense transactionnelle côté serveur (KIP-890) est activée par défaut depuis Kafka&nbsp;4.0 (18&nbsp;mars&nbsp;2025, première majeure sans ZooKeeper, KRaft par défaut)#footnote[Transaction Protocol (doc officielle 4.1, activation serveur depuis 4.0) — Apache Software Foundation — 2025-09-04 — #link("https://kafka.apache.org/41/operations/transaction-protocol/")] ; la version courante est Kafka&nbsp;4.3.0 (22&nbsp;mai&nbsp;2026)#footnote[Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — #link("https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/")] (`confirmé`).

L'énoncé décisif pour ce chapitre est la *portée* de cette garantie, et il est posé verbatim par Confluent : l'EOS de Kafka Streams est «&nbsp;_guaranteed within the scope of Kafka Streams' internal processing only_&nbsp;»#footnote[Exactly-once Semantics is Possible: Here is How Apache Kafka Does It — Confluent (Narkhede, Wang et al.) — 2025-03-01 — #link("https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/")] (`confirmé`, verbatim). Tout appel _RPC_ externe — magasin distant, *API LLM*, courriel, paiement — *n'est pas couvert*. La garantie tient pour le triptyque consommer→transformer→produire *à l'intérieur* du courtier ; elle ne s'étend pas à l'action que l'agent déclenche *vers le dehors*.

Du côté de la file transactionnelle, IBM&nbsp;MQ atteint le _once-and-only-once_ par la conjonction *persistance + syncpoint (`MQCMIT`/`MQBACK`) + coordination transactionnelle*#footnote[Exactly once support — IBM MQ 9.4.x Documentation — IBM — 2024 — #link("https://www.ibm.com/docs/en/ibm-mq/9.4.x?topic=scenarios-exactly-once-support")]#footnote[Syncpoints in IBM MQ for Multiplatforms — IBM MQ 9.3.x Documentation — IBM — 2024 — #link("https://www.ibm.com/docs/en/ibm-mq/9.3.x?topic=work-syncpoints-in-mq-multiplatforms")] (`confirmé`). MQ&nbsp;9.4.0 LTS est GA depuis le 18&nbsp;juin&nbsp;2024 (support ≥&nbsp;juin&nbsp;2029, extensible jusqu'en 2033)#footnote[Introducing IBM MQ version 9.4: Built for change — IBM — 2024-05-14 — #link("https://www.ibm.com/new/announcements/introducing-ibm-mq-version-9-4-built-for-change")] ; la ligne CD est en 9.4.5 (GA 5&nbsp;février&nbsp;2026, Multiplateformes/Appliance)#footnote[IBM MQ 9.4.5 Continuous Delivery releases are available — IBM Community (Ian Harwood, IBM Hursley) — 2026-01-30 — #link("https://community.ibm.com/community/user/blogs/ian-harwood1/2026/01/30/mq945ga")] (`confirmé`).

#corpusTODO[Réserve méthodologique du dossier (Ch. 9, IBM MQ) : les pages `ibm.com` renvoient HTTP 403 à l'agent de _fetch_ ; le contenu MQ a été corroboré indirectement (extraits + blogs IBM Hursley signés). Le détail du protocole 2PC/X-Open XA dans MQ — coordinateur embarqué vs participant — reste `à vérifier` (page IBM en 403 ; piste : Redbook MQ ou cache Knowledge Center). Ne pas durcir au-delà.]

La leçon convergente des deux substrats : *la garantie déterministe est conditionnelle à un périmètre que l'agent, par nature, est appelé à quitter*. Le coût de cette garantie (de l'ordre de ~2-5&nbsp;ms de latence et ~10-20&nbsp;% de débit pour l'EOS) est `à vérifier` — il provient de sources secondaires (Conduktor, Strimzi/CNCF) *sans banc de mesure primaire horodaté* et ne doit pas être présenté comme normatif ; à défaut d'un rapport primaire, une mesure propre sur AgentMeshKafka s'impose.

=== 4.2 Ce que «&nbsp;probabiliste&nbsp;» implique — non-déterminisme _et_ révisabilité

Le comportement de l'agent _LLM_ n'est pas seulement non-déterministe à l'émission ; il est *révisable après coup*, ce qui détruit l'hypothèse de rejouabilité sur laquelle repose la garantie du substrat.

Deux propriétés se cumulent. D'abord le *non-déterminisme de production* : pour une même entrée, l'agent peut décider d'appeler un outil différent, de reformuler une requête, ou de ne pas agir — la trajectoire n'est pas une fonction de l'entrée mais une distribution. Ensuite, et c'est le point sous-estimé, la *révisabilité* : un agent peut revenir sur une intention, corriger une étape, réinterpréter le contexte à mesure que des observations arrivent. Cette révisabilité est une vertu fonctionnelle — elle fait l'intérêt de l'agent — mais elle est *toxique pour un protocole transactionnel*, qui suppose qu'une action validée est définitive et qu'un _replay_ reproduit fidèlement l'effet.

Le conflit se cristallise sur un objet précis : l'*effet de bord externe non rejouable*. Quand l'agent émet un paiement, envoie un courriel, ou appelle une API mutante, l'effet est produit *dans le monde*, hors du log. Le substrat peut rejouer le message d'intention autant de fois qu'il le faut ; il ne peut pas «&nbsp;dé-envoyer&nbsp;» le courriel ni garantir que le second appel à l'API LLM produira la même sortie que le premier. La garantie déterministe du _replay_ — «&nbsp;le log est une mémoire _stateful_ à _replay_ déterministe&nbsp;»#footnote[Integrating AI Into Apache Kafka Architectures: Patterns — Confluent — 2026-05-05 — #link("https://www.confluent.io/blog/ai-kafka-integration-patterns/")] (`confirmé`, verbatim) — est *vraie pour l'état interne et fausse pour l'effet externe*. C'est exactement la dissymétrie que l'#optau prend en charge : pour une grandeur `g` dont le sens doit être fixé, #tau *déplace l'instant de fixation* #tfix sans altérer `g`, et statue #decision — déterministe quand l'action retombe dans le périmètre garanti, probabiliste quand elle l'excède sous contrôle, #tauRefus quand l'autorité ou les invariants l'interdisent (formalisation au Ch. 5).

#figure(
  table(
    columns: 3,
    align: left,
    table.header([*Axe*], [*Régime déterministe (substrat)*], [*Régime probabiliste (agent LLM)*]),
    [Unité d'action], [Message validé dans une transaction], [Décision/appel d'outil échantillonné],
    [Rapport entrée→sortie], [Fonction (reproductible)], [Distribution (révisable)],
    [Effet d'un _replay_], [Idempotent sur l'état interne], [Non rejouable sur l'effet externe],
    [Notion de correction], [_Rollback_ (`MQBACK`) / _abort_ transactionnel], [Compensation / nouvelle décision contextuelle],
    [Frontière de validité], [Périmètre interne _read-process-write_], [Action vers le dehors (API, courriel, paiement)],
    [Statut épistémique], [`confirmé` (doc primaire substrat)], [`confirmé` (non-déterminisme) ; portée formelle → #cia],
  ),
  caption: [La discontinuité de régime : ce que chaque côté tient pour acquis. La ligne «&nbsp;frontière de validité&nbsp;» est la couture où l'#optau opère.],
)

#corpusTODO[Les invariants réfutables I1–I5 caractérisent les conditions sous lesquelles cette frontière est franchissable sans perte de sens. Les énoncés précis de I1, I2, I3 et I5 ainsi que leurs statuts ne sont pas fournis ici et ne doivent pas être inventés ; les reprendre du corpus mère. Seul #i4 est posé comme tel : campagne empirique non concluante — ne pas le présenter comme acquis.]

=== 4.3 La couture : _delivery_ vs _processing_, puis interne vs externe

La tension se localise sur *deux frontières emboîtées*, et confondre l'une avec l'autre est l'erreur d'ingénierie centrale du domaine. La première frontière est théorique et bien établie ; la seconde est pratique et trace l'emplacement exact de l'#optau.

*Première frontière — _delivery_ vs _processing_.* L'_exactly-once *delivery*_ au niveau transport est *impossible* sur un réseau non fiable : c'est une conséquence du problème des Deux Généraux et du résultat FLP. Seul l'_exactly-once *processing*_ — l'atomicité applicative — est atteignable#footnote[Synthèse Ch. 9 (II) du dossier de recherche, corroborée par la littérature systèmes (Deux Généraux / FLP) ; cf. aussi IBM MQ «&nbsp;Exactly once support&nbsp;» et Confluent «&nbsp;Exactly-once Semantics is Possible&nbsp;».] (`confirmé`). Autrement dit, on ne garantit jamais qu'un message *traverse* exactement une fois ; on garantit qu'il est *traité* avec un effet net équivalent à un traitement unique — via idempotence, déduplication et transactions. MQ retire le message à la consommation validée ; Kafka le conserve dans un log relisable#footnote[Comparaison de substrats, Tableau 8 du dossier de recherche ; IBM MQ vs Apache Kafka — sémantique et critères de choix.] : deux stratégies pour atteindre le _processing_ là où le _delivery_ exact est hors d'atteinte.

*Seconde frontière — périmètre interne vs effet externe.* C'est ici que la tension agentique devient irréductible. Le _processing_ exact est garanti *tant qu'il reste interne au substrat*. Dès que le traitement déclenche un effet externe — l'acte même de l'agent — on quitte le domaine où l'atomicité est défendable. La documentation de Kafka borne explicitement la garantie au cycle interne#footnote[Exactly-once Semantics is Possible: Here is How Apache Kafka Does It — Confluent — 2025-03-01 — #link("https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/")]. Cette seconde frontière est l'*ancrage empirique de la thèse* : elle n'est pas postulée, elle est documentée par l'éditeur du substrat.

Le tableau suivant rend la dépendance explicite — deux périmètres, deux verdicts opposés.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([*Périmètre de l'action*], [*Garantie du substrat*], [*Conséquence agentique*]),
    [_read-process-write_ interne au courtier (Kafka : atomique multi-partitions ; MQ : syncpoint)], [Oui — _exactly-once *processing*_], [Le substrat *est* déterministe ; aucune décision de #tau requise],
    [Transport sur réseau non fiable (_delivery_)], [Non — impossible (Deux Généraux / FLP)], [Compensé par idempotence/dédup ; ramené au _processing_ interne],
    [Appel _RPC_ externe : magasin distant, *API LLM*, courriel, paiement], [Non — hors périmètre (verbatim Confluent)], [Action probabiliste / non rejouable → ressort de l'#optau (#tau, Ch. 5)],
  ),
  caption: [Frontière de garantie : la garantie déterministe s'arrête là où commence l'acte externe de l'agent. La troisième ligne reprend la frontière EOS posée comme ancrage de la thèse au Ch. 9.],
)

L'enjeu pratique : un système qui *suppose* que la garantie EOS couvre l'appel à l'API LLM construit une sûreté fictive. C'est la confusion à proscrire — interopérabilité (coopération de systèmes hétérogènes avec *sens préservé* à travers la frontière) confondue avec simple connectivité transactionnelle interne.

=== 4.4 Les patrons de mitigation déplacent la tension, ils ne la dissolvent pas

Les patrons d'intégration IA recommandés pour les substrats *rapprochent* l'effet externe du périmètre garanti, mais aucun ne ramène l'effet externe non rejouable *à l'intérieur* de la garantie : ils transforment le problème en un problème de réconciliation, pas en une garantie de bout en bout.

Le patron canonique, en date de juin&nbsp;2026, est le _transactional outbox_ couplé à la capture de changements (Debezium CDC)#footnote[Integrating AI Into Apache Kafka Architectures: Patterns — Confluent — 2026-05-05 — #link("https://www.confluent.io/blog/ai-kafka-integration-patterns/")] (`confirmé`, verbatim Confluent). Son principe : *au lieu* d'appeler le service externe dans la transaction (impossible à rendre atomique), on écrit l'*intention* d'appel dans une table _outbox_ au sein de la même transaction locale que la mutation d'état ; un relais (CDC) publie ensuite cette intention de façon fiable. L'atomicité est ainsi préservée *jusqu'à la publication de l'intention* — mais l'exécution de l'effet externe reste, elle, au moins _at-least-once_, et exige une clé d'idempotence côté destinataire pour absorber les répétitions.

Schématiquement, l'_outbox_ déplace la frontière sans l'abolir :

```text
# Patron transactional outbox + CDC (Kafka / Debezium)
# Garanti atomique :         écriture état  +  écriture intention
#                            \________ même transaction locale _______/
#
# Au-delà de la frontière :  relais CDC  →  topic Kafka  →  consommateur  →  EFFET EXTERNE
#                                                                            (API LLM, paiement,
#                                                                             courriel : NON rejouable
#                                                                             → idempotence requise côté cible)

BEGIN TRANSACTION                       -- périmètre déterministe
    UPDATE compte SET solde = solde - montant WHERE id = :id;
    INSERT INTO outbox (cle_idempotence, type_effet, charge_utile)
           VALUES (:uuid, 'appel_api_llm', :payload);     -- l'INTENTION, pas l'effet
COMMIT;                                  -- fin du périmètre garanti
-- Debezium (CDC) lit le journal de transaction et publie l'intention (>= once).
-- L'exécuteur de l'effet externe DOIT déduplicar sur :cle_idempotence.
```

Deux autres patrons du dossier complètent le tableau, sans changer la conclusion : la _dead-letter queue_ (DLQ) outillée pour le diagnostic agentique — annotée de `prompt-id`, `model-version`, `offset` — capture les effets qui *échouent* à franchir la frontière proprement, et les _data contracts_ (CEL) appliquent un masquage PII sur le flux#footnote[Integrating AI Into Apache Kafka Architectures: Patterns — Confluent — 2026-05-05 — #link("https://www.confluent.io/blog/ai-kafka-integration-patterns/")] (`confirmé`, verbatim). Pour la coordination multi-ressources *incluant* un participant externe, KIP-939 (participation 2PC, `transaction.two.phase.commit.enable`, défaut `false`) est «&nbsp;Accepted&nbsp;» mais *sans version d'intégration spécifiée* — marqueur `à vérifier` maintenu, adoption attendue d'abord via Apache Flink (FLIP-319)#footnote[KIP-939: Support Participation in 2PC (Accepted, version non spécifiée) — Apache Software Foundation — 2024-06-01 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC")] (`probable`).

#corpusTODO[Le pontage formel de cette frontière — types de session probabilistes / tolérants au _drift_, algèbre d'héritage de garanties, mécanisation Lean 4, banc AgentMeshKafka — est l'objet du #ciaFull (Ch. 6), sur l'analogie directrice M(π)/π-calcul. Les règles précises de l'algèbre et les extraits Lean ne sont pas fournis et ne doivent pas être fabriqués ; les reprendre du corpus mère.]

Le résultat net : *aucun patron de production, en date de juin&nbsp;2026, ne fait franchir à la garantie déterministe la frontière de l'effet externe non rejouable.* Tous la déplacent vers une réconciliation _at-least-once_ + idempotence côté cible. C'est précisément ce constat — la frontière demeure — qui rend nécessaire un opérateur d'arbitrage explicite plutôt qu'une garantie implicite de bout en bout, et qui motive l'#optau au chapitre suivant.

=== Questions ouvertes

- *Surcoût réel de la garantie déterministe au contact d'un agent.* Le chiffre ~2-5&nbsp;ms / ~10-20&nbsp;% (EOS) est `à vérifier` : sources secondaires (Conduktor, Strimzi/CNCF), *aucun banc primaire horodaté*. Existe-t-il un rapport primaire Apache/Confluent ? À défaut, le mesurer sur AgentMeshKafka, en isolant le surcoût _outbox_ + CDC du surcoût EOS pur.
- *Calibrage de la frontière _delivery_/_processing_ vs interne/externe.* La distinction est `confirmé` au plan théorique (Deux Généraux / FLP), mais la *règle de décision substrat* (MQ ⇐ atomicité/ordre/conformité ; Kafka ⇐ débit/_replay_/fan-out) reste une synthèse argumentative, `probable`, non un fait normatif. Quelles classes d'effets externes tolèrent l'_at-least-once_ + idempotence, et lesquelles exigent un #tauRefus ?
- *Coordination 2PC incluant un participant externe.* Quelle version d'Apache Kafka intégrera KIP-939 ? La page KIP est muette (`à vérifier`) ; vérifier les notes 4.x ultérieures et FLIP-319. Le détail du protocole 2PC/X-Open XA d'IBM MQ (coordinateur embarqué vs participant) reste à confirmer (page IBM en 403).
- *Statut des invariants de franchissement.* #i4 est `Hypothèse` (campagne empirique non concluante) ; les énoncés et statuts de I1, I2, I3, I5 sont à reprendre du corpus mère et ne sont pas tranchés ici. Tant qu'ils ne le sont pas, la frontière de l'§4.3 doit être traitée comme *condition* de l'arbitrage, non comme propriété acquise.
- *Révisabilité de l'agent et compensation.* La sémantique de compensation (annuler l'effet d'une décision révisée) n'a pas d'équivalent transactionnel propre côté effet externe ; sa formalisation relève du #cia (Ch. 6) et n'est pas établie ici.

#pagebreak()

== Ch. 5 — L'opérateur #tau

#optau est un opérateur directionnel qui *déplace l'instant de fixation du sens* #tfix sans altérer la grandeur $g$, et qui en dérive un #decision : il route une interaction vers le régime déterministe (garantie de message), vers le régime probabiliste (agent #angl[LLM]) ou vers le refus. Sa raison d'être n'est pas théorique mais structurelle : elle naît exactement là où la garantie du substrat s'arrête et où commence l'action non rejouable de l'agent. Ce chapitre instancie ici la sémantique de #tau telle que *fixée* par le canon (CLAUDE.md §2) ; il défère explicitement au chapitre III.8 du corpus mère la sémantique opérationnelle complète, l'énoncé précis des invariants #invariant(1, "—") à #invariant(5, "—") et leurs statuts, et les règles de l'algèbre du #cia. Aucune de ces constructions n'est reconstituée ici : tout ce qui n'est pas fourni par le canon est renvoyé au corpus, jamais fabriqué.

=== 5.1 — La frontière qui appelle l'opérateur

L'opérateur #tau répond à une discontinuité empiriquement attestée : la garantie de livraison *exactly-once* du substrat est structurellement bornée au périmètre interne, et tout ce qui la franchit relève d'un régime distinct. Cette frontière est l'ancrage de la thèse, pas une hypothèse de travail.

Côté substrat, l'#angl[exactly-once semantics] (EOS) d'Apache Kafka — depuis KIP-98 (Kafka 0.11, juin 2017), avec défense transactionnelle serveur active par défaut depuis 4.0 et version courante 4.3.0 en date de juin 2026#footnote[Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — #link("https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/").] — garantit l'atomicité du cycle *read-process-write* à l'_intérieur_ de Kafka. Confluent l'énonce sans ambiguïté (`confirmé`, verbatim) : la garantie ne couvre _pas_ les appels RPC externes#footnote[Exactly-once Semantics is Possible: Here is How Apache Kafka Does It — Confluent (Narkhede, Wang et al.) — 2025-03-01 — #link("https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/").]. Or l'action d'un agent — appel d'API #angl[LLM], envoi de courriel, paiement — _est_ un effet de bord externe : non transactionnel, non idempotent par défaut, non rejouable. Le détail de cette frontière et de ses corollaires (log comme mémoire à #angl[replay] déterministe, DLQ portant `prompt-id`/`model-version`/`offset`) est traité au Ch. 9#footnote[Integrating AI Into Apache Kafka Architectures: Patterns — Confluent — 2026-05-05 — #link("https://www.confluent.io/blog/ai-kafka-integration-patterns/").] ; ce qui importe ici est que la frontière _existe_ et _se laisse localiser_.

#figure(
  table(
    columns: 3,
    align: (left, center, left),
    table.header([*Périmètre de l'interaction*], [*Garantie EOS*], [*Régime visé par #tau*]),
    [#angl[read-process-write] interne à Kafka], [Oui (atomique, multi-partitions)], [Déterministe — la grandeur $g$ est déjà fixée],
    [Appel RPC externe : #angl[store] distant, API #angl[LLM], courriel, paiement], [Non#footnote[Confluent, op. cit. (2025-03-01) : la garantie EOS ne s'étend pas aux effets de bord externes au cluster Kafka.]], [Probabiliste ou Refus — #tfix doit être déplacé],
  ),
  caption: [Frontière de garantie EOS (Ch. 9) comme déclencheur du dispatch de #tau. La colonne de droite indique le régime que #tau a vocation à sélectionner ; les conditions exactes de sélection relèvent de #dsens, #dautorite, #dinvariant (§5.3).],
)

Le rôle de #tau est de *traiter cette frontière comme une décision explicite* plutôt que comme un débordement silencieux. Sans #tau, le passage du déterministe au probabiliste se produit de toute façon — au moment où l'agent émet son appel externe — mais de manière implicite, non tracée, sans point de contrôle d'autorité. #tau rend ce passage *nommable et arbitrable*.

=== 5.2 — Sémantique de #tau : déplacer #tfix sans altérer $g$

L'invariant sémantique de #tau est précis et restrictif : il *déplace l'instant de fixation du sens* #tfix — c'est-à-dire le moment où la grandeur acquiert son interprétation engageante — *sans altérer la grandeur* $g$ elle-même. #tau ne réécrit pas le message ; il décide _quand_ et _sous quel régime_ son sens devient contraignant.

Cette distinction est le cœur du couplage des #ruptures (la thèse étant leur *couplage*, non trois axes indépendants). Dans un système classique, le sens d'un message est fixé à l'émission, syntaxiquement, par composition : `t_fix` coïncide avec la sérialisation, et la garantie de livraison suffit. Dans un système agentique, le sens d'une grandeur peut rester *ouvert* jusqu'à ce qu'un agent l'interprète — la fixation devient sémantique (un score, non un schéma), probabiliste (une distribution, non une valeur), et déléguée (une autorité tierce, non une composition locale). #tau est l'opérateur qui *positionne* #tfix sur cet axe sans toucher à $g$ : la même grandeur peut voir son sens fixé tôt (régime déterministe, garantie de message) ou tard (régime probabiliste, agent #angl[LLM]), selon la décision de #tau.

La sortie est un #decision. La sémantique _opérationnelle_ complète de cette décision — règles d'inférence, conditions de transition, propriétés de terminaison et de cohérence — est définie canoniquement au chapitre III.8 du corpus mère et n'est pas dupliquée ici (CLAUDE.md §2, §11).

#corpusTODO[Sémantique opérationnelle complète de #tau (chap. III.8) : règles d'inférence du dispatch #decision ; définition formelle de l'instant #tfix et de l'opération de déplacement (« #tau déplace #tfix sans altérer $g$ ») ; conditions de bord entre régime déterministe et régime probabiliste ; propriétés de terminaison et de cohérence de la décision. NE PAS reconstituer ici — y *référer*.]

=== 5.3 — Les trois dimensions d'entrée

#tau ne décide pas sur la seule grandeur $g$ : il décide sur trois dimensions d'entrée, dont l'évaluation conjointe détermine le #decision. Aucune des trois ne suffit seule ; c'est leur combinaison qui distingue un dispatch légitime d'un refus.

- #dsens — score sémantique dans $[0,1]$. Mesure l'_adéquation interprétative_ entre la grandeur et le sens visé. Un score bas signale une fixation de sens incertaine : il tire vers le régime probabiliste (délégation à un agent) ou, en deçà d'un seuil, vers le refus. C'est la dimension qui matérialise la rupture syntaxique→sémantique : on ne valide plus un schéma, on évalue un degré.
- #dautorite — produit `autorité appelant × autorité requise cible`. Confronte l'autorité _détenue_ par l'appelant à l'autorité _exigée_ par l'action cible. C'est la dimension de défense contre l'abus d'identité déléguée (§5.4) : une grandeur sémantiquement parfaite mais portée par une autorité insuffisante ne doit pas voir son sens fixé en régime probabiliste agissant.
- #dinvariant — état des invariants #invariant(1, "—")–#invariant(5, "—") sur la *trace* (et non sur le seul message courant). Introduit la mémoire : la décision de #tau dépend de l'historique des fixations de sens déjà engagées. C'est le point d'articulation avec le #cia, dont les types de session tolérants au #angl[drift] portent cet état (§5.5).

#figure(
  table(
    columns: 4,
    align: (left, left, left, left),
    table.header([*Dimension*], [*Domaine / forme*], [*Rupture couplée portée*], [*Effet directionnel sur #tfix*]),
    [#dsens], [Score $in [0,1]$], [syntaxique→sémantique], [Score élevé → fixation déterministe admissible ; score bas → délégation probabiliste ou refus],
    [#dautorite], [autorité appelant $times$ autorité requise cible], [composition→délégation], [Autorité suffisante → dispatch ; insuffisante → refus, quel que soit le sens],
    [#dinvariant], [état de #invariant(1, "—")–#invariant(5, "—") sur la trace], [déterministe→probabiliste], [Invariants tenus → régime probabiliste autorisé ; invariant menacé → refus],
  ),
  caption: [Les trois dimensions d'entrée de #tau et leur correspondance avec les trois ruptures couplées. La colonne « rupture portée » associe chaque dimension à l'axe qu'elle opérationnalise ; le couplage des trois ruptures est la thèse — les dimensions ne sont pas indépendantes.],
)

Les *seuils*, la *fonction de combinaison* des trois dimensions et la *forme exacte* du produit d'autorité ne sont pas fixés par le présent chapitre : ils relèvent de la définition canonique.

#corpusTODO[Définition canonique (chap. III.8) de la combinaison des trois dimensions : fonction de décision $f(#dsens, #dautorite, #dinvariant) → #decision$ ; seuils de bascule déterministe/probabiliste/refus ; définition précise du produit `autorité appelant × autorité requise cible` (treillis d'autorité, opération de comparaison) ; définition de l'« état des invariants sur la trace » pour #dinvariant. NE PAS fabriquer de seuils ni de fonction.]

=== 5.4 — Ancrage défensif : #tauRefus contre le #angl[confused deputy]

La sortie *Refus* de #tau (#tauRefus) n'est pas un cas d'erreur : c'est la défense de premier rang contre le #angl[confused deputy] agentique, cadré par les sources primaires comme une faille d'_autorisation et d'architecture_, non un défaut de modèle.

La Cloud Security Alliance établit (`confirmé`) que l'agent « *is designed to treat all content in their context window as potentially instructive, which eliminates the hard boundary between data and code* » : une injection le manipule donc pour qu'il abuse de ses _identifiants délégués_, et les remédiations efficaces — #angl[admission control], validation d'entrée structurée, cadrage explicite de l'autorité — sont des contrôles *externes au modèle*#footnote[Confused Deputy Attacks on Autonomous AI Agents — Cloud Security Alliance (AI Safety Initiative) — 2026-03-23 — #link("https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-confused-deputy-prompt-injection/").]. C'est précisément la fonction de #dautorite dans #tau : confronter l'autorité détenue à l'autorité requise *avant* de fixer le sens en régime agissant. Le risque correspond à l'entrée *ASI03 — Identity and Privilege Abuse* du OWASP Top 10 for Agentic Applications 2026 (publié le 9 décembre 2025, `confirmé`)#footnote[OWASP GenAI Security Project Releases Top 10 Risks and Mitigations for Agentic AI Security — OWASP GenAI Security Project — 2025-12-09 — #link("https://genai.owasp.org/2025/12/09/owasp-genai-security-project-releases-top-10-risks-and-mitigations-for-agentic-ai-security/").].

Deux qualifications épistémiques s'imposent, conservées sans lissage. D'abord, la #angl[prompt injection] — vecteur principal du #angl[confused deputy] — est qualifiée par OpenAI de *problème ouvert non entièrement résoluble*, « *a frontier, challenging research problem* » dont le travail « *remains ongoing... for years to come* »#footnote[Understanding prompt injections: a frontier security challenge — OpenAI — 2025 (date exacte de la page `à vérifier` : HTTP 403 à la récupération directe) — #link("https://openai.com/index/prompt-injections/").]. #tau ne *résout* donc pas l'injection ; il *contient* son rayon d'action en refusant la fixation de sens lorsque #dautorite est insuffisante — défense en profondeur, non barrière étanche. Ensuite, la re-délégation inter-agents (#angl[chain splicing], #angl[credential relay through delegation chains]) reste imparfaitement couverte par les taxonomies (`probable` ; le terme « #angl[chain splicing] » relève de la littérature secondaire/préprint, non normative)#footnote[From LLM to agentic AI: prompt injection got worse — Christian Schneider (chercheur sécurité, source secondaire) — 2025 — #link("https://christian-schneider.net/blog/prompt-injection-agentic-amplification/").] ; la réponse standardisée émergente est l'*atténuation monotone* du #angl[draft] individuel IETF `draft-araut-oauth-transaction-tokens-for-agents-02` (en date de juin 2026 ; statut individuel, non adopté)#footnote[draft-araut-oauth-transaction-tokens-for-agents-02 (agentic_ctx ; Monotonic Attenuation) — IETF Datatracker — 2026-05-22 — #link("https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/").]. Le détail de ce paysage menaces/défenses est traité au Ch. 13 ; #tau s'y *branche* via #dautorite et #dinvariant, sans le redéfinir.

Le schéma de décision suivant fixe l'_ordre_ d'évaluation et la place du refus, sans présumer des seuils (déférés au corpus) :

```text
# Schéma de dispatch de τ (ordre d'évaluation ; seuils → corpus chap. III.8)
# Entrée : grandeur g, autorité_appelant, autorité_requise_cible, trace
# Sortie : Decision ∈ {Déterministe, Probabiliste, Refus}
# INVARIANT : τ déplace t_fix(g) ; il NE MODIFIE PAS g.

fonction τ(g, autorité_appelant, autorité_requise_cible, trace):
    a   = D-Autorité(autorité_appelant, autorité_requise_cible)  # produit d'autorité
    inv = D-Invariant(trace)            # état de I1..I5 sur la trace (statuts → corpus)
    s   = D-Sens(g)                     # score sémantique ∈ [0,1]

    # 1) Garde d'autorité — défense confused deputy (CSA 2026-03-23, OWASP ASI03)
    si a est insuffisante OU inv signale un invariant menacé:
        retourner Refus                 # τ-Refus : ne PAS fixer le sens en régime agissant

    # 2) Dispatch sur le sens — déplacement de t_fix(g)
    si s ≥ seuil_déterministe:          # seuil → corpus
        retourner Déterministe          # sens fixé tôt ; garantie de message (EOS interne)
    sinon:
        retourner Probabiliste          # sens fixé tard ; délégué à l'agent LLM
    # Conditions de combinaison exactes (f(s, a, inv)) : corpus chap. III.8 — NON fabriquées ici
```

=== 5.5 — Cadre des invariants réfutables #invariant(1, "—")–#invariant(5, "—")

#tau et le #cia s'évaluent contre cinq invariants *réfutables*, chacun porté avec un *statut explicite* obligatoire — `Confirmé`, `Hypothèse` ou `Réfuté` — et chacun énonçant sa condition de réfutation. Présenter un invariant `Hypothèse` comme acquis est un écart de traçabilité interdit (CLAUDE.md §2, §4, §10).

La règle de discipline épistémique est ici plus contraignante que partout ailleurs dans la monographie : le *cadre* (cinq invariants, statut obligatoire, falsifiabilité) est fixé par le canon, mais l'*énoncé précis* de #invariant(1, "—"), #invariant(2, "—"), #invariant(3, "—"), #invariant(5, "—") et leurs statuts respectifs *ne sont pas fournis* et ne doivent pas être inventés. Seul #i4 est connu avec son statut : c'est une *hypothèse* — la campagne empirique associée n'a pas été concluante — et il ne sera donc jamais présenté comme confirmé. #dinvariant lit l'état de ces invariants sur la trace ; sa fonction est de transformer un statut en décision (refus si un invariant tenu est menacé).

#figure(
  table(
    columns: 3,
    align: (center, left, center),
    table.header([*Invariant*], [*Énoncé / condition de réfutation*], [*Statut (juin 2026)*]),
    [#invariant(1, "—")], [Énoncé non fourni par le canon — à reprendre du corpus (chap. III.8)], [Non fourni],
    [#invariant(2, "—")], [Énoncé non fourni par le canon — à reprendre du corpus (chap. III.8)], [Non fourni],
    [#invariant(3, "—")], [Énoncé non fourni par le canon — à reprendre du corpus (chap. III.8)], [Non fourni],
    [#i4], [Énoncé non fourni ; statut canonique connu : campagne empirique *non concluante*], [`Hypothèse`],
    [#invariant(5, "—")], [Énoncé non fourni par le canon — à reprendre du corpus (chap. III.8)], [Non fourni],
  ),
  caption: [Cadre des invariants réfutables. Seul le statut de #i4 (`Hypothèse`) est fixé par le canon ; les énoncés et les statuts des autres invariants relèvent du corpus mère et ne sont pas reconstitués. La colonne « statut » porte le marqueur d'incertitude exigé.],
)

#corpusTODO[Énoncés précis et statuts de #invariant(1, "—"), #invariant(2, "—"), #invariant(3, "—") et #invariant(5, "—") (chap. III.8 du corpus mère), incluant pour chacun sa *condition de réfutation* (falsifiabilité, §4). Pour #i4 : reprendre l'énoncé exact et le compte rendu de la campagne empirique *non concluante* qui justifie le statut `Hypothèse`. NE PAS inventer d'énoncé ni promouvoir un statut sans justification empirique citée (§9).]

L'articulation de #tau avec le #cia se résume ainsi : #tau est l'*opérateur de dispatch* à l'échelle d'une interaction ; le #cia est le *cadre formel* qui borne, à l'échelle d'une session, la composition de ces décisions sous garanties. Le #cia ponte les garanties déterministes (Kafka/MQ) et le comportement probabiliste d'agents #angl[LLM] au moyen de quatre composants — types de session probabilistes/tolérants au #angl[drift], algèbre d'héritage de garanties, mécanisation Lean 4, banc empirique `AgentMeshKafka` — sous l'analogie directrice $M(pi)$ / π-calcul. #dinvariant est l'interface entre les deux : l'état que les types de session du #cia maintiennent est précisément ce que #tau consulte. Les travaux de référence sur les types de session probabilistes et leur mécanisation existent dans la littérature primaire — types de raffinement probabilistes (PLDI 2025)#footnote[Probabilistic Refinement Session Types — ACM (PACMPL / PLDI 2025) — 2025-06-10 — #link("https://api.crossref.org/works/10.1145/3729317").], coordination prouvée d'agents #angl[LLM] via #angl[Message Sequence Charts] mécanisée en Lean 4#footnote[Provable Coordination for LLM Agents via Message Sequence Charts (Lean 4) — arXiv — 2026-04-29 — #link("https://arxiv.org/abs/2604.17612").] — mais les *règles propres* de l'algèbre d'héritage de garanties du #cia et le *code Lean* du corpus ne sont pas fournis et ne sont pas fabriqués ici.

#corpusTODO[Règles précises de l'algèbre d'héritage de garanties du #cia ; définition des types de session probabilistes / tolérants au #angl[drift] ; extraits Lean 4 de la mécanisation ; protocole et résultats du banc empirique `AgentMeshKafka` adossé à l'écosystème (`TauGo`, `PubSubKafka`, `FibGo`). NE PAS reconstituer ; *référer* au corpus mère et aux dépôts liés.]

=== Questions ouvertes

- *Énoncés et statuts des invariants.* Les énoncés précis de #invariant(1, "—"), #invariant(2, "—"), #invariant(3, "—"), #invariant(5, "—") et leurs statuts (`Confirmé`/`Hypothèse`/`Réfuté`) restent à reprendre du chapitre III.8. Tant qu'ils ne sont pas réconciliés, #dinvariant ne peut être instancié que formellement, pas numériquement.
- *Statut de #i4.* Quelle condition empirique ferait passer #i4 de `Hypothèse` à `Confirmé` ou `Réfuté` ? Le compte rendu de la campagne *non concluante* est requis (justification citée exigée pour tout changement de statut, §9) ; à défaut, #i4 demeure `Hypothèse`.
- *Seuils de dispatch.* La fonction de combinaison $f(#dsens, #dautorite, #dinvariant) → #decision$ et ses seuils sont déférés au corpus. Une instanciation chiffrée nécessiterait un banc primaire — candidat naturel : `AgentMeshKafka` plutôt qu'une borne secondaire.
- *Couverture de la re-délégation inter-agents.* Les taxonomies (OWASP, MITRE ATLAS, CSA) couvrent imparfaitement le #angl[credential relay through delegation chains] (`probable`, Ch. 13) ; l'efficacité de #dautorite + #dinvariant contre le #angl[chain splicing] est *à vérifier* empiriquement, l'atténuation monotone de `draft-araut-...` restant un #angl[draft] individuel non adopté en date de juin 2026.
- *Coût du dispatch.* Le surcoût latence/débit qu'introduit l'évaluation de #tau sur le chemin critique n'est pas mesuré ; par analogie, le coût de l'EOS lui-même reste sans banc primaire horodaté (`à vérifier`, Ch. 9). À quantifier sur `AgentMeshKafka`.
- *Frontière de validité de l'analogie $M(pi)$.* Jusqu'où le π-calcul probabiliste capture-t-il fidèlement le comportement d'agents #angl[LLM] tolérants au #angl[drift] ? La frontière de validité de l'analogie directrice du #cia est à expliciter au corpus.

#pagebreak()

== Ch. 6 — Le Calcul d'Intégration Agentique (CIA)

Le #ciaFull est le cadre formel qui ponte les *garanties déterministes* d'un substrat de messagerie (Kafka, MQ) et le *comportement probabiliste* d'agents #angl[LLM] ; il n'invente pas un calcul concurrent #emph[ex nihilo], mais réinvestit la lignée des types de session multipartites (MPST) — théorie canonique, mécanisée, et corrigée de fond en 2025 — en y greffant quatre composants : types de session probabilistes/tolérants au #angl[drift], algèbre d'héritage de garanties, mécanisation Lean 4, et banc empirique `AgentMeshKafka`. L'#optau (Ch. 5) en est le poste d'aiguillage ; le #cia en est l'algèbre de composition. L'enjeu de ce chapitre est de situer chaque composant par rapport à l'état de l'art vérifié en date de juin 2026, et de distinguer rigoureusement ce qui est *acquis dans la littérature* de ce qui constitue une *innovation défendable du corpus mère* — sans fabriquer aucun énoncé formel non fourni.

Le #cia matérialise le couplage des #ruptures : il ne traite pas le passage déterministe→probabiliste comme un simple ajout de non-déterminisme à un calcul de processus, mais comme une recomposition simultanée du *régime de garantie* (déterministe→probabiliste), du *support du sens* (syntaxique→sémantique, d'où la tolérance au #angl[drift]) et du *mode d'orchestration* (composition→délégation, d'où l'algèbre d'héritage). C'est ce triple couplage — et non l'un de ces axes isolé — qui justifie un calcul dédié plutôt qu'une extension cosmétique de MPST.

=== 6.1 Le socle réinvesti : projection global→local des MPST

Insight : la mécanique que le #cia emprunte aux MPST est la *projection global→local*, seul invariant structurel qui survit intact au passage vers les agents #angl[LLM].

Les *Multiparty Session Types* sont introduits par Honda, Yoshida et Carbone à POPL 2008#footnote[Multiparty asynchronous session types — ACM SIGPLAN-SIGACT (POPL) — 2008 — DOI 10.1145/1328438.1328472, p. 273-284.], puis étendus dans la version journal du *Journal of the ACM* en 2016 (`confirmé`)#footnote[Multiparty Asynchronous Session Types — J. ACM 63(1):9:1-9:67 — 2016 — DOI 10.1145/2827695. Catalogage de l'« Article 9 » confirmé par dblp ; CrossRef n'enregistre que la plage de pages 1-67, divergence signalée, non lissée.]. Leur apport structurant pour l'interopérabilité agentique est unique : un *type global* décrit le protocole d'interaction de l'ensemble des participants ; sa *projection* engendre les *types locaux* que chaque #emph[end-point] — ici, chaque agent — doit respecter. Cette mécanique de projection est précisément ce que la lignée 2025-2026 réinvestit jusqu'aux protocoles d'agents #angl[LLM] (§6.4) ; le #cia s'y inscrit en traitant chaque agent comme un #emph[end-point] dont le type local borne le comportement, fût-il probabiliste.

La sémantique opérationnelle du #cia (réduction, bien-typage des sessions, conditions de projection) relève de la définition canonique et n'est pas reproduite ici.

#corpusTODO[Sémantique opérationnelle du #cia : règles de réduction, jugement de bien-typage des sessions probabilistes, et conditions de projection global→local propres au calcul. Reprendre la formulation exacte du corpus mère (chap. III.8 et suivants) plutôt que la reconstruire depuis MPST.]

=== 6.2 La correction de fond de 2025 : un socle resserré, pas réfuté

Insight : tout argument du #cia qui s'appuie sur la sûreté des MPST asynchrones doit désormais référer au *fragment corrigé et mécanisé* de 2025, et non à la formulation de 2008-2016 prise telle quelle.

Tirore, Bengtson et Carbone (ECOOP 2025) établissent que la preuve de #emph[subject reduction] de la formulation *originale* « contient certaines failles » (`confirmé`)#footnote[Multiparty Asynchronous Session Types: A Mechanised Proof of Subject Reduction — Schloss Dagstuhl, LIPIcs (ECOOP 2025), art. 31:1-31:30 — 2025-06-25 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.31 — mécanisation Coq.]. Leur réponse n'est pas une réfutation destructrice mais un *resserrement* : ils restreignent la théorie à un fragment pour lequel le #emph[subject reduction] tient, établissent les propriétés de sûreté des processus bien typés, et mécanisent l'ensemble en Coq. La portée pour le #cia est directe : il s'agit d'une *divergence de fond* entre formulation originale et fragment restreint — à présenter comme *correction de l'état de l'art*, non comme désaccord entre sources ni comme controverse ouverte. Le socle de sûreté que le #cia hérite des MPST est donc plus étroit qu'il n'y paraissait avant 2025, et cette étroitesse doit être consignée comme contrainte de conception, pas masquée.

=== 6.3 Composant 1 — Types de session probabilistes / tolérants au #angl[drift]

Insight : le pont formel le plus direct entre la rigueur des types de session et l'indéterminisme intrinsèque des agents #angl[LLM] existe déjà dans la littérature (PReST) ; la *tolérance au #angl[drift]* propre au #cia en est l'extension sémantique, à reprendre du corpus.

Pour des agents au comportement probabiliste/non déterministe, l'état de l'art fournit une extension primaire confirmée. Fu, Das et Gaboardi (Boston University) proposent les *Probabilistic Refinement Session Types* (PReST, PLDI 2025) : une extension #emph[conservative] des #emph[refinement session types] supportant des opérateurs de choix *probabiliste et régulier* (probabilités non constantes, symboliques), une vérification par solveur SMT, et une analyse de coût garantissant la *terminaison presque-sûre* (`confirmé`)#footnote[Probabilistic Refinement Session Types — ACM, PACMPL 9(PLDI):1666-1691 — 2025-06-10 — DOI 10.1145/3729317. Études de cas : élection de leader d'Itai-Rodeh, #emph[bounded retransmission], chaînes de Markov paramétriques.]. PReST est le pont formel le plus direct vers le couplage déterministe→probabiliste du canon : il montre qu'un type de session peut borner un comportement intrinsèquement aléatoire sans renoncer à la vérification.

Le #cia revendique davantage : non seulement une session *probabiliste*, mais *tolérante au #angl[drift]* — c'est-à-dire robuste à la dérive du sens propre au régime probabiliste de l'#optau, où l'instant de fixation du sens #tfix est déplacé sans que la grandeur $g$ soit altérée. Ce que PReST capture (la distribution sur des branches d'un protocole) ne couvre pas, en l'état, ce que la tolérance au #angl[drift] vise (la préservation du sens malgré une fixation tardive et révisable). La construction exacte du type de session tolérant au #angl[drift] — sa syntaxe, sa relation de sous-typage, son interaction avec #dsens — n'est pas fournie ; PReST en est l'analogue le plus proche, non l'équivalent.

#corpusTODO[Type de session probabiliste *tolérant au #angl[drift]* du #cia : syntaxe des types, relation de sous-typage/conformité tolérant la dérive sémantique, et lien formel avec #dsens (score sémantique [0,1]) et le déplacement de #tfix par l'#optau. Reprendre du corpus ; ne pas l'assimiler à PReST, qui en est seulement l'analogue probabiliste le plus proche.]

=== 6.4 Composant 2 — Algèbre d'héritage de garanties

Insight : le #cia formalise *comment* une garantie déterministe (p. ex. #emph[exactly-once] d'un substrat de messagerie) se propage — ou se dégrade — lorsqu'une étape probabiliste s'intercale dans une chaîne de délégation ; cette algèbre incarne la rupture composition→délégation, et ses règles relèvent du corpus.

La littérature MPST offre le terreau conceptuel — la *délégation* y est déjà un objet de première classe. Multiparty GV (Jacobs, Balzer, Krebbers, ICFP 2022) garantit l'*absence d'interblocage* malgré entrelacement de sessions *et délégation*, preuves mécanisées en Coq via le #emph[connectivity graph framework] (cadre Iris) (`confirmé`)#footnote[Multiparty GV — ACM, PACMPL 6(ICFP):466-495 — 2022-08-29 — DOI 10.1145/3547638 — artefact Zenodo 6606474.]. Mais l'absence d'interblocage n'est pas l'héritage de garanties : ce que le #cia vise est l'*algèbre* qui compose les garanties hétérogènes du substrat déterministe (ordre, durabilité, #emph[exactly-once] côté Kafka/MQ) avec le régime probabiliste d'un agent, et qui dit quelle garantie survit à la composition. C'est le cœur de la rupture composition→délégation : on ne *compose* plus des fonctions aux contrats fixes, on *délègue* à un agent dont le contrat est probabiliste, et l'algèbre doit propager l'affaiblissement résultant.

Les règles précises de cette algèbre — opérateurs de composition, treillis des garanties, lois d'affaiblissement sous délégation à une étape #tauRefus ou probabiliste — ne sont pas fournies et ne doivent pas être inventées.

#corpusTODO[Algèbre d'héritage de garanties du #cia : ensemble des garanties (ordre, durabilité, #emph[exactly-once], etc.), opérateurs de composition séquentielle/parallèle, et lois de propagation/affaiblissement d'une garantie déterministe à travers une étape probabiliste ou un #tauRefus. Reprendre l'énoncé exact et ses propriétés (associativité, monotonie, élément neutre) du corpus mère.]

=== 6.5 Composant 3 — Mécanisation Lean 4 : une innovation défendable, pas un alignement

Insight (divergence non lissée) : en date de juin 2026, la mécanisation de la métathéorie des types de session #emph[stricto sensu] reste dominée par Coq/Rocq ; la revendication d'une mécanisation Lean 4 du #cia n'est *pas contredite* par l'état de l'art, mais doit être positionnée comme *innovation* — non comme conformité.

Trois jalons primaires confirment la domination Coq/Rocq de la métathéorie mécanisée des types de session (`confirmé`) : Zooid (Castro-Perez et al., PLDI 2021), DSL embarqué dans Coq pour le calcul multipartite certifié#footnote[Zooid: a DSL for certified multiparty computation — ACM SIGPLAN (PLDI) — 2021-06-18 — DOI 10.1145/3453483.3454041, p. 237-251 ; arXiv 2103.10269.] ; Multiparty GV en Coq/Iris (§6.4) ; et Li & Wies (ITP 2025), mécanisation en *Rocq* (ex-Coq, ~15 000 lignes) de l'implémentabilité des protocoles multipartites asynchrones, étendue aux protocoles à participants en nombre *infini*#footnote[Certified Implementability of Global Multiparty Protocols — Schloss Dagstuhl, LIPIcs (ITP 2025), art. 15:1-15:20 — 2025-09-22 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ITP.2025.15.]. Le tutoriel de métathéorie de référence vise lui aussi Rocq#footnote[Mechanizing the Meta-Theory of Session Types in Rocq: a Tutorial — Momigliano et al., U. Milano — 2025 — https://momigliano.di.unimi.it/papers/stutorial.pdf.]. *Constat 1 (`confirmé`)* : aucune mécanisation Lean 4 *dédiée aux types de session* n'a été identifiée à juin 2026.

*Constat 2 (`confirmé`, décisif)* : Bollig, Függer et Nowak, « Provable Coordination for LLM Agents via Message Sequence Charts » (préprint arXiv, v2 du 2026-04-29), mécanisent *en Lean 4* — et non en Coq — un DSL de coordination d'agents #angl[LLM] fondé sur les #emph[message sequence charts] (MSC), avec projection syntaxique global→local engendrant des programmes d'agents locaux *sans interblocage* ; la mention « All definitions and results are now mechanically verified in Lean 4 » apparaît en v2 et était *absente de v1*, l'implémentation étant nommée ZipperGen#footnote[Provable Coordination for LLM Agents via Message Sequence Charts — arXiv 2604.17612, v2 (40 p.), outil ZipperGen — 2026-04-29 — https://arxiv.org/abs/2604.17612. La mécanisation Lean 4 est ajoutée en v2 ; v1 n'en faisait pas mention.].

La conséquence pour le canon est précise et doit être tenue sans la lisser : (a) pour les types de session #emph[stricto sensu], Lean 4 reste *absent* (Coq/Rocq partout) ; (b) pour la coordination MSC d'agents #angl[LLM], Lean 4 est *désormais présent* (Bollig). La revendication d'une mécanisation Lean 4 du #cia est donc une *innovation défendable* — plausiblement la première mécanisation Lean 4 d'une théorie de session/coordination de ce type (`probable`) — à positionner explicitement comme telle, et non comme un simple alignement sur l'état de l'art. Une réserve documentaire est maintenue : l'attribution du préprint Bollig à une venue de conférence (« Petri Nets 2025, Paris ») n'est *pas confirmée* — la page arXiv canonique ne liste aucune venue ; à traiter comme préprint tant qu'une publication revue n'est pas vérifiée (`à vérifier`)#footnote[Page arXiv canonique 2604.17612 — aucune venue de conférence listée — 2026-04-29 — https://arxiv.org/abs/2604.17612. L'attribution « 46th Int. Conf. on Petri Nets, Paris, juin 2025 » n'est pas confirmée ; confusion probable avec la lignée fondatrice MSC/automates (Deniélou-Yoshida ESOP 2012 ; Stutz ECOOP 2023).].

Le code Lean 4 du #cia lui-même n'est pas fourni et ne doit pas être reconstitué.

#corpusTODO[Mécanisation Lean 4 du #cia : définitions, énoncés de théorèmes et preuves (en particulier la sûreté du fragment et l'héritage de garanties). Reprendre l'artefact du corpus mère. À vérifier également : publicité et taille de l'artefact Lean 4 de Bollig et al. (dépôt Zenodo/GitHub ?), pour comparaison rigoureuse.]

=== 6.6 Composant 4 — Le banc empirique `AgentMeshKafka`

Insight : la prétention du #cia à *ponter* garanties déterministes et comportement probabiliste n'est pas qu'analytique — elle est adossée à un banc exécutable, `AgentMeshKafka`, qui instrumente la composition d'agents #angl[LLM] sur un substrat Kafka et alimente l'évaluation des invariants réfutables.

`AgentMeshKafka` est le banc de validation de l'écosystème du corpus, distinct du kernel exécutable `TauGo` (implémentation Go de l'#optau) et des patrons `PubSubKafka` / `FibGo`. Son rôle dans le #cia est double : observer empiriquement la propagation des garanties (l'algèbre du §6.4) sur un substrat réel, et fournir le terrain probant pour le statut des invariants réfutables (§6.7). La littérature offre un précédent de *descente du formalisme vers les agents* : Bergenti et al. (Frontiers in Computer Science, vol. 7, 2025, #emph[peer-reviewed]) traduisent les types locaux MPST en agents exécutables (Jadescript ciblant la plateforme JADE), avec preuve que les agents se comportent conformément aux types locaux (`confirmé`)#footnote[Correct implementation of agent interaction protocols — Frontiers in Computer Science, vol. 7 — 2025-10-31 — DOI 10.3389/fcomp.2025.1659785.] — ce qui valide la *faisabilité* d'un pont type→agent, sans préjuger des chiffres propres à `AgentMeshKafka`.

La configuration exacte du banc, ses métriques, et les résultats chiffrés relèvent du chapitre de validation (Partie VI) et du corpus.

#corpusTODO[Spécification du banc `AgentMeshKafka` : topologie Kafka, charge de travail, métriques d'observation de l'héritage de garanties, et protocole expérimental reliant les mesures aux statuts d'invariants. Reprendre du corpus mère et du chapitre de validation (Partie VI).]

=== 6.7 Invariants réfutables et statut empirique

Insight : le #cia est *réfutable par construction* — ses prétentions sont consignées comme invariants $I_1$–$I_5$ portant chacun un statut explicite ; #i4 demeure une *hypothèse* (campagne empirique non concluante) et ne doit jamais être présenté comme acquis.

Le statut courant des invariants est normatif : #invariant(4, "Hypothèse") en particulier. Les énoncés précis de $I_1$, $I_2$, $I_3$, $I_5$ et leurs statuts respectifs ne sont pas fournis dans la base mobilisée ici et ne doivent pas être inventés.

#corpusTODO[Énoncés exacts des invariants réfutables $I_1$, $I_2$, $I_3$, $I_5$ et leurs statuts (#smallcaps[Confirmé] | #smallcaps[Hypothèse] | #smallcaps[Réfuté]), ainsi que la *condition de réfutation* de chacun. Reprendre du corpus mère. Rappel : #i4 reste #smallcaps[Hypothèse] (campagne `AgentMeshKafka` non concluante) ; tout changement de statut exige une justification empirique citée et une entrée ADR (CLAUDE.md §9).]

=== 6.8 Rapport au π-calcul et aux #emph[behavioural types]

Insight : l'analogie directrice du #cia est $M(pi)$ / π-calcul — un calcul de processus communicants dont les MPST sont l'appareil de typage comportemental ; mais l'état de l'art récent des résultats *mécanisés* d'implémentabilité privilégie la veine MSC/automates communicants, ce qui pose la question d'un *ancrage double*.

Les types de session sont, historiquement, l'appareil de #emph[behavioural typing] du π-calcul : ils disciplinent les interactions sur les canaux comme un système de types discipline les valeurs. Le #cia hérite de cette filiation — l'analogie $M(pi)$ situe les agents comme processus communicants et les sessions comme protocoles typés. Or, deux veines coexistent dans la littérature et le #cia se trouve à leur charnière, ce que le tableau suivant explicite.

#figure(
  table(
    columns: 4,
    table.header(
      [*Dimension*], [*Veine π-calcul / types de session*], [*Veine MSC / automates communicants*], [*Position du #cia*],
    ),
    [Objet premier], [Processus communicants, canaux], [Diagrammes de séquence, machines à états], [Agents comme #emph[end-points] typés],
    [Mécanique de projection], [Type global → types locaux (MPST)], [MSC global → programmes locaux (Bollig)], [Projection réinvestie (§6.1)],
    [Résultat-phare mobilisé], [Sûreté du fragment corrigé (Coq, 2025)], [Implémentabilité *décidable* (Stutz, 2023)], [Sûreté + décidabilité visées],
    [Mécanisation observée (juin 2026)], [Coq / Rocq / Iris], [Lean 4 (Bollig, agents #angl[LLM])], [Lean 4 — *innovation* (§6.5)],
    [Indéterminisme], [PReST : choix probabiliste + régulier (SMT)], [Actions #angl[LLM] séparées de la structure de messages], [Sessions tolérantes au #angl[drift] (§6.3)],
  ),
  caption: [Le #cia à la charnière de deux veines de #emph[behavioural types]. La veine π-calcul fournit l'analogie directrice et la sûreté ; la veine MSC fournit la décidabilité de l'implémentabilité et le seul précédent de mécanisation Lean 4 pour agents #angl[LLM].],
)

Deux jalons confirment la fertilité de la veine MSC et expliquent pourquoi Bollig l'a mobilisée. Deniélou & Yoshida (ESOP 2012, l'un des deux #emph[best papers] de la conférence) établissent le pont entre MPST et #emph[communicating finite-state machines] (CFSM), qui sous-tend la vérification par projection et synthèse de moniteurs (`confirmé`)#footnote[Multiparty Session Types Meet Communicating Automata — Springer, LNCS 7211:194-213 (ESOP 2012) — 2012 — DOI 10.1007/978-3-642-28869-2_10.]. Stutz (ECOOP 2023) montre que l'implémentabilité des MPST asynchrones à *choix dirigé par l'émetteur* est *décidable*, en adaptant des techniques fondatrices des #emph[high-level message sequence charts], et que certaines généralisations deviennent *indécidables* (`confirmé`)#footnote[Asynchronous Multiparty Session Type Implementability is Decidable — Lessons Learned from Message Sequence Charts — Schloss Dagstuhl, LIPIcs (ECOOP 2023), art. 32:1-32:31 — 2023-07-11 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2023.32.] — c'est la même veine MSC qu'exploite Bollig.

La tension est réelle et reste à trancher au niveau du corpus : l'analogie directrice $M(pi)$/π-calcul oriente la *sémantique* du #cia, tandis que les résultats *mécanisés* d'implémentabilité et de coordination d'agents #angl[LLM] (Stutz, Bollig, Li & Wies) gravitent autour des MSC/CFSM. Faut-il *compléter* l'ancrage π-calcul par un ancrage MSC/CFSM, plus proche des résultats d'implémentabilité mécanisés ? La question est ouverte (§6.9).

Un appareil coalgébrique (Session Coalgebras) offre par ailleurs une vue comportementale complémentaire au π-calcul pour raisonner sur la composition, mais sa venue primaire exacte et son DOI restent à vérifier (`probable`)#footnote[Session Coalgebras: A Coalgebraic View on Session Types and Communication Protocols — 2021 — https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7984539/ — venue primaire (POPL 2021 vs version journal) et DOI à vérifier.] ; de même, la vérification à l'exécution probabiliste (PSTMonitor, moniteurs #emph[runtime] dérivés de types de session enrichis de probabilités) est une voie pertinente pour des agents non déterministes, mais sa venue/version exactes ne sont pas re-vérifiées ici (`probable`)#footnote[PSTMonitor: Monitor Synthesis from Probabilistic Session Types — arXiv 2212.07329 — 2022-12 — https://arxiv.org/pdf/2212.07329 — venue/version à vérifier.].

=== 6.9 Synthèse : ce que le #cia hérite, ce qu'il revendique

Le tableau suivant sépare, composant par composant, le *socle hérité de la littérature* (vérifié) de la *revendication propre au corpus* (déférée), afin qu'aucune prétention canonique ne soit confondue avec un acquis publié.

#figure(
  table(
    columns: 3,
    table.header(
      [*Composant du #cia*], [*Socle hérité (état de l'art, juin 2026)*], [*Revendication propre au corpus (déférée)*],
    ),
    [Projection global→local], [MPST (Honda-Yoshida-Carbone) ; fragment de sûreté corrigé 2025], [Projection appliquée aux agents #angl[LLM] sous régime #optau],
    [Sessions probabilistes], [PReST : choix probabiliste + régulier, terminaison presque-sûre], [Sessions *tolérantes au #angl[drift]*, lien à #dsens et #tfix],
    [Algèbre d'héritage de garanties], [Délégation sans interblocage (MPGV/Iris)], [Lois de propagation/affaiblissement des garanties du substrat],
    [Mécanisation], [Coq/Rocq (métathéorie) ; Lean 4 pour MSC d'agents (Bollig)], [Mécanisation Lean 4 du #cia — *innovation à justifier*],
    [Validation empirique], [Type→agent prouvé faisable (Bergenti, JADE)], [Banc `AgentMeshKafka` ; statuts d'invariants $I_1$–$I_5$],
  ),
  caption: [Frontière hérité/revendiqué du #cia. La colonne de droite est entièrement déférée au corpus mère (#smallcaps[À reprendre du corpus mère]) ; aucun de ces éléments n'est fabriqué ici.],
)

=== 6.10 Questions ouvertes

- *Ancrage π-calcul vs MSC/CFSM.* L'analogie directrice est $M(pi)$/π-calcul, mais les résultats *mécanisés* d'implémentabilité et de coordination d'agents #angl[LLM] (Stutz ECOOP 2023, Li & Wies ITP 2025, Bollig) privilégient les MSC/automates communicants. Le #cia doit-il *compléter* son ancrage π-calcul par un ancrage MSC/CFSM, plus proche des résultats de décidabilité mécanisés ? (`à vérifier` — décision de conception, à consigner en ADR.)
- *Positionnement de la mécanisation Lean 4.* La revendication Lean 4 du #cia n'est pas contredite par l'état de l'art (`confirmé`), mais reste une *innovation défendable* (`probable`) tant qu'aucune autre mécanisation Lean 4 *des types de session stricto sensu* (et non des MSC) n'émerge. Re-balayer « session types Lean 4 » à la date de finalisation du chapitre.
- *Statut de publication revue du préprint Bollig-Függer-Nowak* (arXiv 2604.17612) : aucune venue confirmée en date de juin 2026 (`à vérifier`). Surveiller dblp/DOI ; ne pas citer de venue tant qu'absente. Vérifier aussi la *publicité et la taille de l'artefact Lean 4* de Bollig, pour comparaison avec le #cia.
- *Frontière exacte entre PReST et les sessions tolérantes au #angl[drift].* PReST capture une distribution sur des branches d'un protocole ; la tolérance au #angl[drift] vise la préservation du sens sous fixation tardive de #tfix. La construction canonique du type tolérant au #angl[drift] et sa relation de sous-typage restent à reprendre du corpus (#corpusTODO encadré §6.3).
- *Statut empirique des invariants.* #i4 demeure une hypothèse (campagne `AgentMeshKafka` non concluante) ; tout passage #smallcaps[Hypothèse]→#smallcaps[Confirmé]/#smallcaps[Réfuté] exige une justification empirique citée et une entrée ADR (CLAUDE.md §9). Les énoncés et conditions de réfutation de $I_1$, $I_2$, $I_3$, $I_5$ restent à reprendre du corpus.
- *Venues/DOI à re-vérifier* (`à vérifier`) : PSTMonitor (arXiv 2212.07329) et Session Coalgebras (POPL 2021 vs version journal). Re-vérification CrossRef/dblp avant intégration en bibliographie normative.

#pagebreak()

== Ch. 7 — Patrons d'intégration agentique : une filiation reconstruite des Enterprise Integration Patterns

Le pontage entre les #angl[Enterprise Integration Patterns] (EIP) de Hohpe et Woolf et les patrons agentiques-#angl[LLM] est *entièrement reconstruit* par la littérature secondaire et académique : il n'est revendiqué par aucune source primaire éditeur. _Building Effective Agents_ (Anthropic) ne mentionne ni les EIP, ni Hohpe, ni le LCIM ; la page officielle des EIP et ses _Conversation Patterns_ n'évoquent ni agents ni #angl[LLM].#footnote[_Building Effective Agents_ — Anthropic — 19 déc. 2024 — https://www.anthropic.com/engineering/building-effective-agents]#footnote[_Enterprise Integration Patterns — Messaging Patterns Overview_ (site officiel) — Gregor Hohpe / enterpriseintegrationpatterns.com — 2023 — https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html] Les correspondances « classique ↔ agentique » sont donc une *thèse d'analyse*, posée et assumée ici comme telle, et non un fait déclaré par les auteurs d'origine. Ce chapitre opère ce pontage en le qualifiant explicitement de filiation _reconstruite, non revendiquée_, et le rattache au canon : les patrons agentiques *opérationnalisent la rupture composition→délégation* — le troisième terme des #ruptures — en déplaçant le prédicat de routage du déterminisme syntaxique vers la médiation sémantique par agent.

=== 7.1 La thèse de pontage et son statut épistémique

Le couplage « EIP ↔ patrons agentiques » relève de la littérature grise et des préprints, jamais d'une revendication d'éditeur ; cet écart de provenance est lui-même structurant et ne doit pas être lissé. Trois constats l'établissent en date de juin 2026.

Premièrement, les *sources primaires éditeur sont muettes sur le pont*. Anthropic codifie sept patrons agentiques — #angl[Augmented LLM], #angl[Prompt Chaining], #angl[Routing], #angl[Parallelization], #angl[Orchestrator-Workers], #angl[Evaluator-Optimizer], #angl[Agents] — sans aucune référence aux EIP, à Hohpe, au #angl[Message Router] ni au LCIM, alors même que la description du patron #angl[Routing] (« _classifies an input and directs it to a specialized followup task_ ») est un analogue fonctionnel quasi littéral du #angl[Message Router].#footnote[_Building Effective Agents_ — Anthropic — 19 déc. 2024 — https://www.anthropic.com/engineering/building-effective-agents] Symétriquement, la page officielle des EIP et le _Volume 2 — Conversation Patterns_ (annoncé _work in progress_, « _Last update: Jan 2017_ », copyright « © 2003, 2023 ») n'introduisent ni agents ni #angl[LLM], et aucune deuxième édition formelle du Volume 1 n'existe à juin 2026.#footnote[_Enterprise Integration Patterns — Conversation Patterns_ (Vol. 2, « Work in progress. Last update: Jan 2017 ») — Gregor Hohpe / enterpriseintegrationpatterns.com — 2017 — https://www.enterpriseintegrationpatterns.com/patterns/conversation/] `confirmé`

Deuxièmement, *la reconstruction provient de la littérature académique et grise*. Le _survey_ de Sarkar et Sarkar sur la communication d'agents #angl[LLM] via #angl[MCP] « _revisits well-established patterns, including Mediator, Observer, Publish-Subscribe, and Broker_ » — patrons GoF et systèmes distribués qui recoupent _partiellement_ les EIP, mais sans citer nommément « Enterprise Integration Patterns », Hohpe ni le LCIM dans l'abrégé.#footnote[_Survey of LLM Agent Communication with MCP: A Software Design Pattern Centric Review_ (Sarkar & Sarkar) — arXiv:2506.05364 — v1 26 mai 2025 / v2 22 mai 2026 — https://arxiv.org/abs/2506.05364] De même, Milosevic et Rabhi stratifient le champ en « _LLM Agents, Agentic AI, and Agentic Communities_ » sans invoquer Hohpe ou les EIP dans l'abrégé (le catalogue détaillé en annexe restant `à vérifier` au niveau de la source primaire).#footnote[_Architecting Agentic Communities using Design Patterns_ (Milosevic & Rabhi) — arXiv:2601.03624 — v1 7 jan. 2026 / v3 25 mai 2026 — https://arxiv.org/abs/2601.03624] `confirmé` (abrégé)

Troisièmement, *un précurseur historique pré-#angl[LLM] nuance le verdict*. La lignée même du LCIM mobilisait déjà, en 2007, les « _intelligent software agents using the Internet_ » et comportait une section « _Motivation for Agent Mediated Decision Support_ » (« _the agent must be aware of the assumptions and constraints underlying the model_ »).#footnote[_Applying the LCIM in Support of Integratability, Interoperability, and Composability for SoS Engineering_ (Tolk, Diallo, Turnitsa) — Journal of Systemics, Cybernetics and Informatics, Vol. 5 No 5 (IIIS), ISSN 1690-4524 — 2007 — https://www.iiisci.org/journal/pdv/sci/pdfs/p468106.pdf] Il s'agit d'agents logiciels classiques, pré-#angl[LLM], sans aucune mention de grands modèles de langage ; cette filiation « agents ↔ niveaux supérieurs du LCIM » précède de près de deux décennies l'agentique #angl[LLM]. Elle offre un *ancrage historique au pontage du présent chapitre, à présenter comme analogie et précurseur, non comme équivalence*. `confirmé`

La conséquence méthodologique est nette : tout le chapitre tient son autorité de la cartographie qu'il construit, non d'un endossement d'éditeur. C'est une thèse réfutable — sa condition de réfutation est l'apparition d'une source primaire (Anthropic, page EIP, ou travail _peer-reviewed_) revendiquant explicitement la correspondance, auquel cas le statut « reconstruit » tomberait au profit de « déclaré ».

=== 7.2 Le socle classique : 65 patrons, sept catégories, un langage iconographique

Le catalogue de Hohpe et Woolf fournit la grammaire de référence de l'intégration par messages, organisée le long du flot d'un message ; c'est cette grammaire que le régime agentique réinterprète. Le catalogue _Enterprise Integration Patterns: Designing, Building, and Deploying Messaging Solutions_ (Addison-Wesley, 10 octobre 2003, ISBN 978-0321200686) recense *65 patrons* — le site officiel précise « _This pattern catalog includes 65 integration patterns_ ».#footnote[_Enterprise Integration Patterns_ — Wikipedia (Hohpe & Woolf, 10 oct. 2003, ISBN 978-0321200686, 65 patrons) — 2025 — https://en.wikipedia.org/wiki/Enterprise_Integration_Patterns]#footnote[_Enterprise Integration Patterns — Messaging Patterns Overview_ (site officiel) — Gregor Hohpe / enterpriseintegrationpatterns.com — 2023 — https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html] `confirmé`

Ces 65 patrons se répartissent en *sept catégories* suivant le cheminement d'un message : (1) #angl[Integration Styles] ; (2) #angl[Messaging Channels] ; (3) #angl[Message Construction] ; (4) #angl[Message Routing] ; (5) #angl[Message Transformation] ; (6) #angl[Messaging Endpoints] ; (7) #angl[System Management]. Le décompte « ~9 catégories » que l'on rencontre parfois provient de l'ajout des chapitres introductifs ; la structure officielle en compte explicitement sept — divergence de décompte à ne pas reporter (D7.3). `confirmé` Le langage de patrons est iconographique, surnommé « #angl[GregorGrams] » (Wikipedia : « _an icon-based pattern language, sometimes nicknamed GregorGrams_ »), et ses implémentations de référence sont _Apache Camel, Red Hat Fuse, Mule ESB (MuleSoft), Spring Integration_ et _Guarana DSL_.#footnote[_Enterprise Integration Patterns_ — Wikipedia — 2025 — https://en.wikipedia.org/wiki/Enterprise_Integration_Patterns] `confirmé`

L'enjeu pour le canon est que cette grammaire est *déterministe et syntaxique* : le #angl[Message Router] route sur un prédicat évalué sur la structure du message, le #angl[Content-Based Router] sur le contenu typé, le #angl[Scatter-Gather] orchestre un _fan-out_ vers une liste de destinataires connue. Aucun de ces prédicats n'interprète le _sens_. C'est précisément là que les deux premières des #ruptures — déterministe→probabiliste et syntaxique→sémantique — viennent transformer le patron sans en changer la silhouette.

=== 7.3 Cartographie EIP ↔ patrons agentiques

La transposition agentique conserve la _topologie_ du patron classique mais en déplace le _prédicat_ : là où l'EIP évalue une condition syntaxique déterministe, le patron agentique substitue une classification probabiliste par #angl[LLM] ou une similarité sémantique. C'est l'opérationnalisation directe de la délégation, où le sous-traitant n'est plus une branche de code mais un agent dont le comportement est fixé à l'exécution.

#figure(
  table(
    columns: 3,
    table.header[*Patron EIP (Hohpe & Woolf, 2003)*][*Patron agentique (Anthropic, 2024)*][*Nature du pont (analogie reconstruite)*],
    [#angl[Message Router] — prédicat déterministe], [#angl[Routing] — « _classifies an input… specialized followup_ »], [Analogue fonctionnel ; prédicat structurel → classification par #angl[LLM]],
    [#angl[Scatter-Gather] / #angl[Aggregator]], [#angl[Parallelization] — #angl[Sectioning] (« _independent subtasks in parallel_ ») / #angl[Voting] (« _diverse outputs_ »)], [Analogue _fan-out_ / agrégation ; agrégat de votes au lieu d'agrégat de réponses],
    [#angl[Content-Based Router] / #angl[Recipient List]], [#angl[Orchestrator-Workers]], [Correspondance suggérée, à cartographier finement (`à vérifier`)],
    [#angl[Message Router] + espace vectoriel], [#angl[semantic-router] (Aurelio Labs) — prédicat vectoriel], [Pont direct : niveau sémantique (L3 du LCIM) ↔ #angl[Message Router]],
  ),
  caption: [Correspondances EIP ↔ patrons agentiques. *Avertissement* : analogie reconstruite par la littérature d'analyse, non filiation déclarée — Anthropic ne cite pas les EIP.],
)

Les correspondances de ce tableau s'appuient sur les descriptions _verbatim_ d'Anthropic et sur le routage sémantique d'Aurelio Labs ; la ligne #angl[Orchestrator-Workers] reste la plus spéculative et appelle une cartographie fine (question ouverte 7.3).#footnote[_Building Effective Agents_ — Anthropic — 19 déc. 2024 — https://www.anthropic.com/engineering/building-effective-agents] Le point d'ancrage canonique se lit ainsi : le patron #angl[Routing] agentique *est une instance dégénérée de* #optau. Quand le routeur agentique classifie une entrée pour la diriger, il *déplace l'instant de fixation du sens* #tfix — la branche n'est plus déterminée par la structure du message à la compilation, mais par l'interprétation du sens à l'exécution. Là où #tau formalise ce déplacement en arbitrant entre régime déterministe et régime probabiliste, le patron #angl[Routing] d'Anthropic en livre une réalisation d'ingénierie sans la garde formelle. La définition canonique complète de #tau, de ses dimensions d'entrée #dsens, #dautorite, #dinvariant et de sa sortie #decision relève du chap. III.8 du corpus mère et n'est pas dupliquée ici.

#corpusTODO[Reprendre du corpus mère (chap. III.8) la formalisation exacte par laquelle le patron Routing agentique s'instancie comme cas particulier de #optau : conditions sur #dsens (seuil de score sémantique déclenchant le routage probabiliste), traitement de #dautorite lorsque la cible de routage exige une autorité supérieure à celle de l'appelant, et règle produisant #tauRefus lorsque le prédicat sémantique est sous le seuil de confiance. Ces règles précises ne sont pas fournies au présent chapitre.]

=== 7.4 Le routage sémantique comme instanciation directe du Message Router

Le routage sémantique constitue le pont le plus net et le plus opérationnel du chapitre : il instancie le #angl[Message Router] des EIP en remplaçant le prédicat de routage déterministe par une *similarité vectorielle dans l'espace sémantique*. La bibliothèque _semantic-router_ d'Aurelio Labs se décrit comme « _a superfast decision-making layer for your LLMs and agents. Rather than waiting for slow LLM generations to make tool-use decisions, we use the magic of semantic vector space to make those decisions, routing our requests using semantic meaning._ »#footnote[_aurelio-labs/semantic-router — README_ — Aurelio Labs (GitHub) — 2026 — https://github.com/aurelio-labs/semantic-router/blob/main/README.md] On y définit des routes par des _utterances_ exemples ; à l'exécution, la requête est encodée et dirigée vers la route dont les exemples sont sémantiquement les plus proches. `confirmé`

C'est un *pont direct entre le niveau Sémantique (L3) du LCIM et le patron #angl[Message Router]* : le routeur ne lit plus un en-tête ni un champ typé, il lit le sens. Le schéma de configuration ci-dessous illustre la forme du prédicat — un ensemble d'_utterances_ par route, le routage s'opérant par proximité d'encodage plutôt que par égalité syntaxique.

```yaml
# Schéma d'illustration : Message Router à prédicat vectoriel (semantic-router, Aurelio Labs)
# Le prédicat n'est plus « header == X » mais « encode(requête) ≈ encode(utterances) »
routes:
  - name: facturation
    utterances:                      # exemples qui DÉFINISSENT la route (pas une règle exacte)
      - "où est ma facture du mois dernier"
      - "je conteste un montant prélevé"
      - "demande de remboursement"
    destination: agent_comptable     # endpoint cible (au sens EIP)
  - name: support_technique
    utterances:
      - "l'application plante au démarrage"
      - "erreur 500 sur le tableau de bord"
    destination: agent_sre
# Exécution :
#   q = encode(requête_entrante)
#   route* = argmax_r  similarité_cosinus(q, encode(utterances_r))
#   si  similarité(q, route*) < seuil   ->  pas de routage déterministe garanti
#                                            (frontière où #optau exigerait une Décision : Refus)
```

La dernière clause est le point de jonction avec le canon. Lorsque la similarité maximale tombe sous un seuil, le routeur sémantique « pur » n'a pas de réponse sûre : il route quand même vers la route la moins lointaine, ou échoue silencieusement. *C'est exactement la zone où l'arbitrage* #optau *intervient* : sous le seuil de confiance sémantique (#dsens faible), la sortie correcte n'est ni le régime déterministe ni le régime probabiliste, mais #tauRefus. Le routage sémantique d'Aurelio Labs livre donc le mécanisme de dispatch sans la garde — il route, mais ne refuse pas ; #tau ajoute la troisième issue. La médiation par agents (le patron #angl[Orchestrator-Workers], la délégation à un agent comptable ou SRE dans le schéma) hérite de cette même exigence : déléguer suppose un arbitrage sur l'autorité de la cible, ce que #dautorite encode et que le routeur sémantique nu ignore.

=== 7.5 Statut des sources sur le pontage — divergences à ne pas lisser

Le tableau suivant consolide la provenance de chaque source mobilisée et son positionnement face au pont EIP/LCIM ↔ agentique ; il rend visible que *la revendication explicite n'existe qu'au niveau secondaire/académique, jamais primaire éditeur*.

#figure(
  table(
    columns: 4,
    table.header[*Source*][*Type*][*Revendique le pont EIP/LCIM ↔ agentique ?*][*Date*],
    [Anthropic, _Building Effective Agents_], [Primaire éditeur], [*Non* — aucune réf. EIP / Hohpe / LCIM], [19 déc. 2024],
    [Page officielle EIP + _Conversation Patterns_], [Primaire éditeur], [*Non* — aucun agent / #angl[LLM]], [2017–2023],
    [Sarkar & Sarkar, arXiv:2506.05364], [Académique (préprint)], [*Partiellement* — #angl[Mediator] / #angl[Observer] / #angl[Pub-Sub] / #angl[Broker], GoF ; Hohpe non cité dans l'abrégé], [v1 26 mai 2025 / v2 22 mai 2026],
    [Milosevic & Rabhi, arXiv:2601.03624], [Académique (préprint)], [*Non explicitement* dans l'abrégé (annexe `à vérifier`)], [v1 7 jan. 2026 / v3 25 mai 2026],
    [LCIM 2007 (Tolk / Diallo / Turnitsa)], [Primaire (académique)], [*Précurseur pré-#angl[LLM]* — « _intelligent software agents_ », pas de #angl[LLM]], [2007],
  ),
  caption: [Provenance et positionnement des sources sur la filiation EIP/LCIM ↔ agentique (en date de juin 2026).],
)

Quatre divergences sont conservées telles quelles. *D7.1* — les sources primaires éditeur (Anthropic ; page EIP + _Conversation Patterns_) ne revendiquent aucun lien explicite EIP/LCIM ↔ agentique ; le pontage est entièrement reconstruit par la littérature secondaire et académique. *D7.2* — le _survey_ arXiv:2506.05364 emploie #angl[Mediator] / #angl[Observer] / #angl[Publish-Subscribe] / #angl[Broker] (patrons GoF et systèmes distribués) plutôt que la nomenclature exacte de Hohpe et Woolf ; le recoupement avec les EIP est _partiel_, sans citation d'origine dans l'abrégé. *D7.3* — le décompte « ~9 catégories » parfois cité provient de l'ajout des chapitres introductifs ; la structure officielle compte sept groupes thématiques. *D7.4* — nuance compensatoire : la lignée LCIM invoquait déjà les « _intelligent software agents_ » en 2007, ce que D7.1 n'efface pas — précurseur historique pré-#angl[LLM] réel.

=== 7.6 Ancrage au CIA et frontière de validité

Le pontage de ce chapitre est *informel par construction* : il met en regard des patrons d'ingénierie, là où le #cia vise la garantie formelle de l'intégration. La distance entre les deux est l'objet propre du #ciaFull. Les patrons agentiques décrits ici — #angl[Routing], #angl[Parallelization], #angl[Orchestrator-Workers] — exhibent le _comportement_ que le #cia entend borner : un agent #angl[LLM] dont la décision de routage ou de délégation est probabiliste et susceptible de _drift_, opérant au-dessus d'un substrat de messages à garanties déterministes (Kafka/MQ). Le rôle du #cia est de fournir l'algèbre d'héritage de garanties et les types de session tolérants au _drift_ qui qualifieraient _formellement_ ce qu'un patron comme #angl[Scatter-Gather] agentique préserve ou détruit comme garantie de bout en bout.

Ce raccordement reste à l'état de programme : les patrons sont catalogués (niveau empirique, ce chapitre), leur garantie est à formaliser (niveau CIA, chap. 6 et corpus mère). En particulier, la question de savoir si un routeur sémantique préserve un invariant de bout en bout sous _drift_ touche directement #i4, qui demeure une hypothèse — la campagne empirique sur le banc _AgentMeshKafka_ n'étant pas concluante à ce jour. Ne pas présenter comme acquise la préservation d'invariant par un patron agentique.

#corpusTODO[Reprendre du corpus mère : (a) les énoncés précis et statuts des invariants I1, I2, I3, I5 — non fournis au présent chapitre — afin de qualifier lesquels chaque patron agentique (Routing, Parallelization, Orchestrator-Workers) est censé préserver ou mettre en péril ; (b) les règles précises de l'algèbre d'héritage de garanties du #cia déterminant comment un Scatter-Gather agentique compose les garanties de ses branches ; (c) la mécanisation Lean 4 correspondante. Ces contenus formels ne sont pas fournis ici et ne doivent pas être inventés.]

#corpusTODO[Statut de #invariant(4, "Hypothèse") : reprendre du corpus mère la formulation exacte de I4 et l'état de la campagne empirique AgentMeshKafka, pour appuyer l'affirmation ci-dessus selon laquelle la préservation d'invariant par un patron de routage agentique reste une hypothèse non confirmée.]

=== 7.7 Marqueurs d'incertitude (synthèse)

#figure(
  table(
    columns: 2,
    table.header[*Fait*][*Marqueur*],
    [EIP : 65 patrons, 10 oct. 2003, ISBN 978-0321200686], [`confirmé`],
    [EIP : sept catégories de patrons], [`confirmé`],
    [« GregorGrams » + implémentations (Camel / Spring / Mule…)], [`confirmé`],
    [_Conversation Patterns_ (Vol. 2) = WIP « Jan 2017 », sans agents/#angl[LLM]], [`confirmé`],
    [Anthropic : sept patrons, 19 déc. 2024, sans réf. EIP/LCIM], [`confirmé`],
    [Sarkar & Sarkar (Mediator/Observer/Pub-Sub/Broker)], [`confirmé` (abrégé)],
    [Milosevic & Rabhi (trois niveaux) — annexe], [`à vérifier`],
    [semantic-router = #angl[Message Router] à prédicat vectoriel], [`confirmé`],
    [LCIM 2007 motivé par « intelligent software agents » (pré-#angl[LLM])], [`confirmé`],
    [Pontage EIP/LCIM ↔ agentique = reconstruit, non revendiqué], [`confirmé`],
  ),
  caption: [Synthèse des marqueurs d'incertitude du chapitre 7 (en date de juin 2026).],
)

=== 7.8 Questions ouvertes

- Vérifier si le _Volume 2 — Conversation Patterns_ de Hohpe a reçu une mise à jour après janvier 2017 ou une publication formelle d'ici 2026–2027 : le copyright affiche « 2023 » alors que la mention « _Last update: Jan 2017_ » subsiste — statut figé à clarifier.
- Établir si un travail académique _peer-reviewed_ — au-delà des préprints arXiv et des billets d'ingénierie tiers — revendique explicitement la correspondance EIP ↔ patrons agentiques, ou si elle demeure exclusivement dans la littérature grise et les préprints à juin 2026. C'est la condition de réfutation directe du statut « reconstruit, non revendiqué ».
- Cartographier finement la correspondance entre patrons EIP précis (#angl[Message Router], #angl[Scatter-Gather], #angl[Aggregator], #angl[Content-Based Router], #angl[Recipient List]) et patrons Anthropic (#angl[Routing], #angl[Parallelization] Sectioning/Voting, #angl[Orchestrator-Workers]), en signalant à chaque entrée qu'il s'agit d'une analogie reconstruite, non d'une filiation déclarée ; la ligne #angl[Orchestrator-Workers] est la plus incertaine.
- Vérifier le catalogue détaillé en annexe de Milosevic et Rabhi (arXiv:2601.03624) : cite-t-il nommément Hohpe / EIP / LCIM hors abrégé ? (`à vérifier` — non vérifié au niveau de la source primaire).
- Au plan canonique : formaliser, depuis le corpus mère, la condition exacte sous laquelle un routeur sémantique doit produire #tauRefus plutôt que de router vers la route la moins lointaine, et déterminer si cette garde préserve l'invariant pertinent — question liée à #i4, non résolue.
