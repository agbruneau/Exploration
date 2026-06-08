#import "../../lib/canon.typ": *

= PARTIE VII — Perspectives

== Ch. 20 — Limites, angles morts et programme de recherche 2027–2030

#emph[Insight-clé.] La thèse de cette monographie — le couplage des #ruptures, arbitré par l'#optau qui déplace #tfix sans altérer la grandeur — est *à ce jour partiellement étayée et largement non falsifiée*, ce qui est un statut épistémique honorable mais pas un acquis. Trois dettes structurent l'horizon 2027–2030 : (1) une #emph[dette de formalisation] (les énoncés précis de #invariant("1", "?")–#invariant("5", "?"), l'algèbre d'héritage de garanties et la mécanisation Lean 4 du #cia restent à reprendre du corpus mère, non à réinventer) ; (2) une #emph[dette empirique], dont la levée de #i4 est le cas critique, sur fond de #emph[crise de validité] de la métrologie agentique où un agent trivial obtient 38 % sur un banc de référence#footnote[Establishing Best Practices for Building Rigorous Agentic Benchmarks (HTML plein texte v1 ; cas $tau$-bench-airline 38 %) — arXiv — 2025-07 — #link("https://arxiv.org/html/2507.02825v1")] ; (3) une #emph[dette de terrain mouvant], car le paysage normatif et protocolaire dont dépend l'instanciation de l'#optau se reconfigure plus vite que ne se stabilise la théorie. Ce chapitre n'invente aucun contenu formel manquant : il le nomme comme cible de travail et le situe dans un calendrier réfutable.

=== 20.1 — Le statut épistémique réel : ce qui est établi, ce qui est mouvant

#emph[Insight.] Distinguer le #emph[savoir établi] du #emph[terrain mouvant] est la première discipline de ce bilan : la confusion des deux est l'angle mort le plus coûteux d'une monographie de niveau doctoral.

Sur le versant #emph[établi] (en date de juin 2026), trois acquis tiennent indépendamment de la fortune du #cia. D'abord, la #emph[non-corrélation détectable] entre déterminisme de décision et exactitude de tâche : le harnais DFAH mesure séparément déterminisme de trajectoire, déterminisme de décision (sorties stables à entrées identiques rejouées) et fidélité conditionnée à l'évidence, et conclut que déterminisme et exactitude #emph[ne sont pas détectablement corrélés]#footnote[Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness for Tool-Using LLM Agents (DFAH) — Raffi Khatchadourian — arXiv (préprint) — 2026-01-17 — #link("https://arxiv.org/abs/2601.15322")]. Ce résultat #emph[corrobore] le geste fondateur de l'#optau — séparer le régime déterministe (garantie de message) du régime probabiliste (agent #angl[LLM]) plutôt que de les confondre dans une métrique unique d'exactitude. Ensuite, la #emph[crise de validité] des bancs : 7/10 violent la validité de tâche, 7/10 la validité de résultat, 80 % n'admettent aucune faiblesse de conception#footnote[idem arXiv 2507.02825 ; venue NeurIPS 2025 à confirmer.]. Enfin, la #emph[multidimensionnalité de la fiabilité] : l'exactitude seule corrèle faiblement avec le succès en déploiement, ce qu'objectivent un profil à quatre dimensions et douze métriques (#emph[consistency, robustness, predictability, safety])#footnote[Towards a Science of AI Agent Reliability (4 dimensions, 12 métriques ; normes nominatives à vérifier) — Rabanser, Kapoor, Kirgis, Liu, Utpala, Narayanan — Princeton HAL Lab — 2026-02-18 — #link("https://arxiv.org/abs/2602.16666")] et, de façon #emph[probable] seulement (préimpression à auteur unique, sans #emph[peer-review]), le cadre CLEAR#footnote[Beyond Accuracy: A Multi-Dimensional Framework for Evaluating Enterprise Agentic AI Systems (CLEAR) — Mehta — arXiv (préprint, auteur indépendant) — 2025-11-18 — #link("https://arxiv.org/html/2511.14136v1")].

Sur le versant #emph[mouvant], la liste est plus longue et c'est précisément l'aveu qui fait défaut à la plupart des cadres concurrents. Le tableau 20.1 trie les énoncés par #emph[niveau de preuve], conformément à la note transversale du dossier qui interdit aux secondaires et aux préimpressions non revues de soutenir une affirmation normative.

#figure(
  table(
    columns: 4,
    align: left,
    table.header([*Énoncé*], [*Niveau de preuve (juin 2026)*], [*Statut*], [*Condition de bascule*]),
    [Déterminisme ≠ exactitude (DFAH)], [Préimpression arXiv, HTML vérifié], [#emph[confirmé]], [Réfutation = corrélation détectée sur banc indépendant],
    [Crise de validité (audit ABC)], [Préimpression 25 auteurs, HTML vérifié], [#emph[confirmé]], [Venue NeurIPS 2025 à confirmer],
    [Fiabilité = 4 dim. / 12 métriques], [Princeton HAL, résumé vérifié], [#emph[confirmé]], [Normes aviation/nucléaire nominatives à vérifier dans le corps du PDF],
    [CLEAR ($rho approx 0,83$ vs $0,41$)], [Préimpression auteur unique], [#emph[probable]], [Obtenir une #emph[peer-review]],
    [Proxys utilisateurs simulés non fiables], [Intitulé à reconfirmer], [#emph[probable]], [Confirmer arXiv 2601.17087],
    [Enquêtes d'adoption (79 % PwC ; 25 %→50 % Deloitte)], [Secondaires (agrégateurs)], [#emph[à vérifier]], [Retrouver les rapports primaires],
  ),
  caption: [Tableau 20.1 — Tri des énoncés par niveau de preuve : ce qui peut soutenir une affirmation normative et ce qui ne le peut pas.],
)

#emph[Divergence conservée (non lissée).] Sur l'indicateur OSWorld, le rapport primaire Stanford HAI rapporte 66,3 % de succès#footnote[The 2026 AI Index Report (66,3 % OSWorld ; volet « 89 %/coût » à confirmer dans le corps) — Stanford HAI (primaire) — 2026-04 — #link("https://hai.stanford.edu/ai-index/2026-ai-index-report")] là où un blogue #angl[computer-use] avance 82 % : instantanés et agents distincts, à #emph[ne pas fusionner]. De même, le volet « ~89 % des implémentations n'atteignent jamais la production (coût 150 k–800 k USD), la gouvernance étant la cause dominante » reste #emph[probable] — corroboré par plusieurs secondaires mais non reconfirmé sur la page primaire HAI. Cet écart entre capacité brute (succès au banc) et déploiement effectif (gouvernance) est l'observation empirique qui #emph[motive] le plus directement la frontière #tauRefus de l'#optau : une grande part de l'échec en production n'est pas un échec de capacité mais un défaut d'arbitrage de l'autorité et des invariants.

=== 20.2 — La dette de formalisation : ce qui doit être repris du corpus mère

#emph[Insight.] Le cœur formel du #cia — énoncés des invariants, règles de l'algèbre, preuves Lean 4 — n'est #emph[pas] reproduit ici par discipline anti-fabrication (§10) ; il constitue la première charge de travail 2027–2028, sous forme de #emph[reprise fidèle], jamais de réinvention.

L'#optau et le #cia ne valent comme #emph[contribution scientifique] que si leur noyau formel est exposé, et non simplement invoqué. Quatre objets sont actuellement renvoyés au corpus mère et doivent y être réconciliés (la définition canonique complète de l'#optau demeure au chap. III.8 du corpus, auquel cette monographie #emph[réfère] sans le dupliquer, §11).

#corpusTODO[Énoncés précis et statuts de #invariant("1", "?"), #invariant("2", "?"), #invariant("3", "?"), #invariant("5", "?"). Le dossier de recherche n'en fournit ni la formulation ni le statut ; seuls le gabarit de statut (#emph[Confirmé] | #emph[Hypothèse] | #emph[Réfuté]) et le cas #i4 sont connus. À reprendre verbatim du corpus mère, avec leur condition de réfutation respective.]

#corpusTODO[Règles précises de l'#emph[algèbre d'héritage de garanties] du #cia (composition des garanties déterministes Kafka/MQ avec le comportement probabiliste d'agents #angl[LLM] ; sémantique opérationnelle ; types de session probabilistes / tolérants au #angl[drift]). Analogie directrice $M(pi)$ / π-calcul. Aucune règle, signature ou jugement de typage n'est fourni par le dossier — ne rien fabriquer ; reprendre du corpus mère.]

#corpusTODO[Mécanisation #emph[Lean 4] du #cia : énoncés des théorèmes, code et statut de preuve. Aucun extrait Lean n'est disponible dans le dossier de recherche. À reprendre du corpus mère ; ne pas reconstituer de listing.]

La forme — non le contenu — de cette dette se laisse néanmoins esquisser sans rien fabriquer. La table 20.2 cartographie #emph[où] chaque objet formel manquant devra s'insérer et #emph[contre quoi] le mécaniser, en s'appuyant sur le fait, #emph[établi] dans la littérature, que la méta-théorie des types de session multipartites est désormais mécanisée (Coq/Rocq, ECOOP 2025#footnote[Multiparty Asynchronous Session Types: A Mechanised Proof of Subject Reduction (ECOOP 2025) — Schloss Dagstuhl — LIPIcs — 2025-06-25 — #link("https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.31")]) et que des types de session #emph[probabilistes] existent (PACMPL/PLDI 2025#footnote[Probabilistic Refinement Session Types — CrossRef (PACMPL 9(PLDI):1666-1691) — ACM — 2025-06-10 — #link("https://api.crossref.org/works/10.1145/3729317")]) ainsi qu'une coordination d'agents #angl[LLM] vérifiée en Lean 4 via #emph[message sequence charts]#footnote[Provable Coordination for LLM Agents via Message Sequence Charts (v2, Lean 4) — arXiv — 2026-04-29 — #link("https://arxiv.org/abs/2604.17612")]. Le #cia ne part donc pas d'un vide théorique : il a des voisins mécanisés contre lesquels se mesurer.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([*Objet formel (à reprendre)*], [*Point d'insertion canonique*], [*Substrat de vérification disponible (établi)*]),
    [Énoncés #invariant("1", "?")–#invariant("5", "?")], [Chapitres du corpus mère + Partie II ici], [Statut réfutable obligatoire (§4) ; #i4 reste #emph[Hypothèse]],
    [Algèbre d'héritage de garanties], [Ch. 6 (Partie II) — #cia], [Types de session probabilistes (PLDI 2025) ; $M(pi)$/π-calcul],
    [Sémantique de l'#optau / #tfix], [Ch. III.8 du corpus (réf. seule)], [Implémentabilité MPST décidable (ECOOP 2023)#footnote[Asynchronous Multiparty Session Type Implementability is Decidable — Lessons Learned from Message Sequence Charts (ECOOP 2023) — Schloss Dagstuhl — LIPIcs — 2023-07-11 — #link("https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2023.32")]],
    [Mécanisation Lean 4 du #cia], [Banc formel du corpus], [Méta-théorie MPST en Rocq (ECOOP 2025) ; coordination Lean 4 (MSC, 2026)],
  ),
  caption: [Tableau 20.2 — Carte de la dette de formalisation : insertion canonique et voisins mécanisés servant de substrat de vérification. Aucun énoncé formel n'est ici reconstitué.],
)

=== 20.3 — La dette empirique : lever #i4 et survivre à la crise de validité

#emph[Insight.] Lever #i4 — actuellement #emph[Hypothèse] faute de campagne empirique concluante — exige plus qu'un banc favorable : il faut un protocole #emph[immunisé] contre les défauts de validité documentés, sous peine de produire une confirmation illusoire du type « agent trivial à 38 % ».

Le statut de #i4 est le verrou empirique du programme. Le changer en #emph[Confirmé] ou #emph[Réfuté] exige, par discipline (§9), une justification empirique citée et une entrée ADR ; or l'instrument de cette justification — la mesure sur banc — est lui-même en crise. Trois pièges documentés conditionnent tout protocole de levée : la #emph[validité de tâche] (des tâches impossibles comptées comme réussies — le cas #emph[$tau$-bench-airline] où un agent renvoyant des réponses vides atteint 38 % et #emph[surpasse] un agent fondé sur GPT-4o), la #emph[validité de résultat] (sur-estimation de KernelBench de +31 % faute de #emph[fuzz testing] exhaustif), et la #emph[non-fiabilité des proxys] utilisateurs simulés par #angl[LLM] comme substituts d'utilisateurs humains#footnote[Lost in Simulation: LLM-Simulated Users are Unreliable Proxies for Human Users in Agentic Evaluations (intitulé à reconfirmer) — arXiv — 2026-01 — #link("https://arxiv.org/pdf/2601.17087")]. La campagne de validation de l'#optau devra donc s'auto-appliquer l'#emph[Agentic Benchmark Checklist] (ABC), qui réduit par exemple la sur-estimation de CVE-Bench de 33 %.

Le banc empirique du #cia est #emph[AgentMeshKafka], et le kernel exécutable de l'#optau est #emph[TauGo] (Go). L'ancrage de la mesure sur Kafka est #emph[établi] : la sémantique #emph[exactly-once] côté serveur est activable depuis Kafka 4.0 et documentée en 4.1#footnote[Transaction Protocol (doc officielle 4.1 — activation serveur depuis 4.0) — Apache Software Foundation — 2025-09-04 — #link("https://kafka.apache.org/41/operations/transaction-protocol/")], avec la défense transactionnelle côté serveur KIP-890 approuvée#footnote[KIP-890: Transactions Server-Side Defense (Approved) — Apache Software Foundation — 2025 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-890:+Transactions+Server-Side+Defense")] ; la participation au #emph[2PC] (KIP-939) est acceptée#footnote[KIP-939: Support Participation in 2PC (Accepted) — Apache Software Foundation — 2024 — #link("https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC")]. Le régime déterministe que l'#optau présuppose côté garantie de message est donc une cible stable. Le schéma ci-dessous fixe le contrat de mesure minimal que la campagne devra instrumenter — il décrit un #emph[protocole d'évaluation], non une règle formelle de l'algèbre (laquelle reste en #corpusTODO ci-dessus).

```yaml
# Contrat de mesure pour la levée de I4 (Hypothèse -> Confirmé/Réfuté).
# NB : décrit le protocole empirique, PAS l'algèbre du CIA (cf. corpusTODO §20.2).
campagne_i4:
  kernel: TauGo            # implémentation Go de l'opérateur tau
  banc: AgentMeshKafka     # garantie déterministe : Kafka exactly-once (>= 4.0)
  garde_validite:
    abc_checklist: true            # auto-application de l'Agentic Benchmark Checklist
    taches_impossibles_temoins: true   # détecter le faux-positif type "38 %"
    fuzz_testing_resultats: true       # éviter sur-estimation type KernelBench (+31 %)
    proxys_utilisateurs:
      llm_simules: false       # proxys LLM = non fiables -> humains ou traces réelles
  mesures_independantes:       # NE PAS agréger en une exactitude unique (cf. DFAH)
    - determinisme_decision    # sorties stables à entrées rejouées identiques
    - determinisme_trajectoire
    - fidelite_evidence
    - score_D_Sens             # dimension sémantique [0,1] de tau
    - arbitrage_D_Autorite     # autorité appelant × autorité requise cible
    - etat_D_Invariant         # invariants sur la trace
  condition_refutation_I4: "<énoncé exact de I4 — À REPRENDRE DU CORPUS MÈRE>"
  sortie_attendue: Decision   # Déterministe | Probabiliste | Refus
```

#corpusTODO[Énoncé exact de #i4 et sa #emph[condition de réfutation] (champ `condition_refutation_I4` ci-dessus). Le dossier indique seulement que #i4 est #emph[Hypothèse] (campagne empirique non concluante) ; il ne donne pas le prédicat à tester. À reprendre du corpus mère avant toute campagne — sans quoi la mesure n'a pas de cible falsifiable.]

=== 20.4 — Angles morts de terrain mouvant : l'instanciation dépend d'un sol instable

#emph[Insight.] L'#optau dispatche entre régimes en fonction de #dsens, #dautorite et #dinvariant ; or les deux dernières dimensions sont câblées à des standards d'#emph[identité], de #emph[délégation] et de #emph[gouvernance] qui sont, en juin 2026, des #emph[drafts] actifs et des règlements en cours d'amendement. C'est l'angle mort le plus susceptible de périmer le chapitre.

La dimension #dautorite — « autorité appelant × autorité requise cible » — repose sur une infrastructure d'identité de charge de travail et de délégation qui n'est pas stabilisée. Le groupe IETF WIMSE produit un jeu de #emph[drafts] actifs (architecture, #emph[workload credentials], #emph[workload proof token]) tous datés du premier semestre 2026#footnote[draft-ietf-wimse-workload-creds — WIMSE Workload Credentials — IETF — 2026-05-05 — #link("https://datatracker.ietf.org/doc/draft-ietf-wimse-workload-creds/")] ; côté délégation, `draft-ietf-oauth-identity-chaining` est en cours de processus IESG#footnote[draft-ietf-oauth-identity-chaining — OAuth Identity and Authorization Chaining Across Domains — IETF — 2026-06-04 — #link("https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/")], tandis que des #emph[drafts] spécifiquement agentiques divergent (l'un, `draft-oauth-ai-agents-on-behalf-of-user`, a #emph[expiré] et ne doit #emph[pas] être cité comme normatif#footnote[draft-oauth-ai-agents-on-behalf-of-user (EXPIRÉ & archivé — ne pas citer comme normatif) — IETF Datatracker — 2026-02-26 — #link("https://datatracker.ietf.org/doc/draft-oauth-ai-agents-on-behalf-of-user/")]). La dimension #dinvariant, elle, dépend de l'auditabilité réglementaire, dont le cadre se densifie mais reste en partie #emph[à vérifier] : DORA est en application depuis le 17 janvier 2025#footnote[Digital Operational Resilience Act (DORA) — Règlement (UE) 2022/2554, application 17 janv. 2025 — EIOPA — 2025 — #link("https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en")], mais le numéro exact de l'ITS du registre d'information (art. 28) provient d'une source secondaire non encore confirmée sur EUR-Lex ; le FS AI RMF du Treasury (matrice de #emph[230 objectifs de contrôle], chiffre #emph[probable]) est #emph[soft law]#footnote[Treasury Releases Two New Resources to Guide AI Use in the Financial Sector (FS AI RMF + AI Lexicon) — U.S. Department of the Treasury — 2026-02-19 — #link("https://home.treasury.gov/news/press-releases/sb0401")] ; et l'AI Act européen voit ses échéances #emph[reportées] par l'accord Omnibus (décalage de 4 mois)#footnote[Artificial Intelligence: Council and Parliament agree to simplify and streamline rules (Omnibus) — Conseil de l'Union européenne — 2026-05-07 — #link("https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/")]. Enfin, le profil d'interopérabilité des agents du NIST n'est attendu qu'au #emph[Q4 2026]#footnote[NIST AI Risk Management Framework: Agentic Profile (draft, Tier 1–4) — Cloud Security Alliance — 2026-03-27 — #link("https://labs.cloudsecurityalliance.org/agentic/agentic-nist-ai-rmf-profile-v1/")] : le référentiel même contre lequel l'interopérabilité agentique d'entreprise devra se mesurer n'existe pas encore en version stable.

Conséquence directrice : toute affirmation de cette monographie sur l'instanciation de #dautorite et #dinvariant est #emph[horodatée à juin 2026] et doit être re-vérifiée à l'exécution (§10). Le couplage des trois ruptures, lui, est conceptuel et ne périme pas ; son #emph[ancrage protocolaire], si.

=== 20.5 — Programme de recherche 2027–2030

#emph[Insight.] Le programme se lit comme une séquence de #emph[bascules de statut] réfutables : chaque jalon est défini par l'invariant ou la dette qu'il fait passer d'un état à un autre, jamais par une intention vague.

#figure(
  table(
    columns: 4,
    align: left,
    table.header([*Horizon*], [*Cible*], [*Critère de succès (réfutable)*], [*Dépendance de terrain mouvant*]),
    [2027], [Reprise formelle du noyau], [Énoncés #invariant("1", "?")–#invariant("5", "?") + algèbre exposés ici, réconciliés au corpus (§11)], [—],
    [2027–2028], [Mécanisation Lean 4 du #cia], [Théorèmes du corpus rejoués/étendus ; preuve compilée], [Voisins Rocq/Lean 4 (établis)],
    [2028], [Lever #i4], [#i4 : #emph[Hypothèse] → #emph[Confirmé] ou #emph[Réfuté] ; campagne ABC-conforme sur AgentMeshKafka/TauGo + ADR], [Kafka exactly-once (stable)],
    [2028–2029], [Métrologie de l'#optau], [#dsens, #dautorite, #dinvariant mesurées #emph[indépendamment] (pas d'exactitude agrégée)], [Profil d'interop. NIST (Q4 2026)],
    [2029–2030], [Ancrage protocolaire stabilisé], [#dautorite câblée sur un standard #emph[publié] (post-draft) de délégation], [WIMSE / OAuth identity-chaining (#emph[drafts])],
    [2027–2030], [Validité externe], [Substituer aux proxys #angl[LLM] des traces réelles ; reproductibilité inter-exécutions], [Science de la fiabilité (4 dim.)],
  ),
  caption: [Tableau 20.3 — Programme 2027–2030 par bascules de statut réfutables. Les jalons formels (2027–2028) sont des #emph[reprises] du corpus mère, non des inventions.],
)

Deux principes gouvernent ce calendrier. D'abord, l'#emph[ordre est contraint] : on ne peut lever #i4 (2028) avant d'avoir repris son énoncé exact (2027), ni mécaniser une algèbre dont les règles ne sont pas exposées. Ensuite, les jalons #emph[2029–2030] sont délibérément subordonnés à des standards aujourd'hui en #emph[draft] ou attendus : il serait malhonnête de les présenter comme planifiables avec certitude, et le programme les marque comme #emph[probables] sous condition de stabilisation du sol normatif.

=== Questions ouvertes

#emph[Formelles (à reprendre du corpus mère, non à fabriquer).]
- Énoncés précis et statuts de #invariant("1", "?"), #invariant("2", "?"), #invariant("3", "?"), #invariant("5", "?"), avec leurs conditions de réfutation respectives.
- Règles de l'algèbre d'héritage de garanties du #cia, types de session probabilistes / tolérants au #angl[drift], et sémantique opérationnelle de l'#optau (chap. III.8 du corpus, réf. seule).
- Théorèmes et code de la mécanisation Lean 4 du #cia ; énoncé exact de #i4 et son prédicat de réfutation.

#emph[Empiriques (terrain en crise de validité).]
- Un protocole de levée de #i4 sur #emph[AgentMeshKafka] / #emph[TauGo] est-il #emph[immunisé] contre les défauts ABC (faux-positifs type 38 %, sur-estimation type KernelBench +31 %) ? — #emph[à vérifier] par auto-application de l'ABC.
- Les normes nominatives aviation/nucléaire (ARP4754A, IEC 61513, ISO 26262) sont-elles réellement mobilisées par la « science de la fiabilité », ou seulement « #emph[grounded in safety-critical engineering] » ? — #emph[à vérifier] dans le corps du PDF Princeton HAL.
- Le statut #emph[peer-review] de CLEAR et l'intitulé exact de « Lost in Simulation » (arXiv 2601.17087) restent #emph[à confirmer] ; le volet « ~89 % jamais en production » est #emph[probable], non reconfirmé sur la primaire HAI.

#emph[Terrain mouvant (horodaté juin 2026).]
- Numéro EUR-Lex exact de l'ITS du registre DORA (art. 28) et chiffre des 230 objectifs de contrôle du FS AI RMF — #emph[à vérifier] sur sources primaires (EUR-Lex, treasury.gov).
- Quel standard de délégation (WIMSE, `oauth-identity-chaining`) atteindra une publication stable d'ici 2030 pour ancrer #dautorite, et le profil d'interopérabilité des agents du NIST (attendu #emph[Q4 2026]) fournira-t-il le référentiel manquant pour #dinvariant ?
- DIVERGENCE non lissée à surveiller : OSWorld 66,3 % (HAI primaire) vs 82 % (blogue #angl[computer-use]) — instantanés distincts, à ne pas fusionner dans une métrique de progrès unique.
