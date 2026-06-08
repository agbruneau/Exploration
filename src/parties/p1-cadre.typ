#import "../../lib/canon.typ": *

= PARTIE I — Cadre conceptuel et problématique

== Ch. 1 — Définir l'interopérabilité agentique

#emph[Insight-clé.] L'interopérabilité n'est pas la connectivité : c'est l'échange où le #emph[sens] d'une grandeur est préservé de bout en bout, et non la simple circulation d'octets entre systèmes. Cette frontière — héritée du #angl[Levels of Conceptual Interoperability Model] (LCIM) et confirmée par ses sources primaires de 2003 et 2007 — fonde tout l'édifice agentique : déléguer une décision à un agent #angl[LLM] ne devient #emph[interopérable] que si le sens survit au passage d'un régime déterministe à un régime probabiliste. C'est précisément le lieu où l'opérateur #tau déplace l'instant de fixation du sens #tfix sans altérer la grandeur transportée.

L'enjeu de ce chapitre est définitionnel et empirique à la fois. Définitionnel : poser ce qu'« interopérabilité agentique » veut dire, en la distinguant de l'intégration et de la connectivité, et en la situant sur l'échelle des niveaux d'interopérabilité. Empirique : ancrer cette définition dans la littérature primaire vérifiée — sans la lisser, en conservant une correction historique majeure sur le LCIM que la littérature secondaire reproduit massivement à tort. La définition canonique complète de #tau, du #ciaFull et des invariants #invariant(1, "Hypothèse")–#invariant(5, "Hypothèse") relève du corpus mère ; ce chapitre y #emph[réfère] et n'en duplique pas l'appareil formel.

=== 1.1 Interopérabilité ≠ intégration ≠ connectivité : la frontière normative

#emph[Insight.] Confondre « octets qui transitent » et « sens partagé » est l'anti-patron central que le LCIM existe pour dissiper#footnote[The Levels of Conceptual Interoperability Model — Tolk \& Muguira — 2003 Fall Simulation Interoperability Workshop (paper 03F-SIW-007) — septembre 2003 — https://www.mscoe.org/content/uploads/2017/12/Tolk-Muguira-The-Levels-of-Conceptual-Interoperability-Models.pdf]. Trois notions distinctes, trop souvent fusionnées dans le discours d'ingénierie, structurent le champ.

La #emph[connectivité] (équivalent du niveau #angl[integratability] dans la triade LCIM) répond à une question matérielle : les systèmes peuvent-ils échanger des bits sur un réseau dont les protocoles sont définis sans ambiguïté ? Elle occupe les couches basses (L0–L1). L'#emph[intégration] assemble des composants pour qu'ils fonctionnent ensemble ; elle est une condition nécessaire mais non suffisante de l'interopérabilité. L'#emph[interopérabilité] proprement dite — au sens fort retenu ici — est l'échange où le #emph[sens] de l'information est préservé : elle exige les niveaux sémantique, pragmatique, dynamique et conceptuel. Le papier fondateur l'énonce dès son abrégé : #emph[« Interoperability of systems is not a cookie-cutter-function »] ; et la version de 2007 le formule comme thèse — #emph[« meaningful interoperability requires much more than technical layers »]#footnote[Applying the LCIM in Support of Integratability, Interoperability, and Composability for SoS Engineering — Tolk, Diallo \& Turnitsa — Journal of Systemics, Cybernetics and Informatics, Vol. 5 No 5 (IIIS), ISSN 1690-4524 — 2007 — https://www.iiisci.org/journal/pdv/sci/pdfs/p468106.pdf]. `confirmé`

La portée agentique de cette frontière est directe. Un agent #angl[LLM] qui reçoit un message bien typé sur un canal Kafka fiable dispose de la connectivité et, le plus souvent, de l'intégration ; rien ne garantit que le #emph[sens] de la requête — l'intention, l'autorité de l'appelant, les invariants à préserver — survive à son interprétation probabiliste. La rupture #emph[syntaxique → sémantique] (cf. Ch. 3), seconde des #ruptures, prend racine exactement ici : passer de « la structure du message est valide » à « le contenu de la requête est compris sans ambiguïté » est le saut que la connectivité ne franchit jamais seule.

=== 1.2 Les niveaux d'interopérabilité : du technique à l'organisationnel

#emph[Insight.] Les niveaux d'interopérabilité forment une échelle cumulative — chaque palier présuppose les précédents — et le « sens » n'apparaît qu'à partir du niveau sémantique. La nomenclature usuelle en cinq paliers (technique, syntaxique, sémantique, pragmatique, organisationnel) recoupe l'ossature du LCIM canonique sans s'y superposer terme à terme : le LearningCIM raffine le haut de l'échelle en distinguant pragmatique, dynamique et conceptuel.

Le palier #emph[technique] assure le transport des bits (réseaux, protocoles) ; le palier #emph[syntaxique] impose une structure et un format de données communs ; le palier #emph[sémantique] rend le contenu d'un échange non ambigu ; le palier #emph[pragmatique] suppose que les parties soient conscientes des méthodes, procédures et du contexte d'usage ; le palier #emph[organisationnel] (que le LCIM éclate en #emph[dynamique] — comprendre les changements d'état, hypothèses et contraintes dans le temps — et #emph[conceptuel] — modèle partagé du domaine) couvre l'alignement des intentions, autorités et processus entre organisations. Le seuil critique est le franchissement du palier syntaxique vers le palier sémantique : en deçà, on transporte des structures ; au-delà, on transporte du sens.

Pour la suite de la monographie, cette échelle fournit la #emph[carte] sur laquelle #tau opère. L'opérateur ne crée pas de niveau ; il déplace #tfix — l'instant où le sens d'une grandeur `g` est fixé — entre un régime déterministe (garantie de message, paliers technique/syntaxique stabilisés) et un régime probabiliste (agent #angl[LLM], paliers sémantique/pragmatique en jeu), en émettant une #decision. Ses trois dimensions d'entrée se projettent sur l'échelle : #dsens (score sémantique dans $[0,1]$) mesure la solidité au palier sémantique ; #dautorite (autorité de l'appelant croisée avec l'autorité requise par la cible) relève du palier organisationnel ; #dinvariant (état des invariants sur la trace) porte la mémoire dynamique des contraintes. La définition canonique complète de cette mécanique appartient au corpus mère.

#corpusTODO[Énoncés précis et statuts des invariants #invariant(1, "Hypothèse"), #invariant(2, "Hypothèse"), #invariant(3, "Hypothèse") et #invariant(5, "Hypothèse") (le présent chapitre ne les fixe pas) ; rappeler que #i4 demeure une hypothèse, campagne empirique non concluante. Reprendre du corpus mère, chap. III.8, la projection formelle des dimensions #dsens / #dautorite / #dinvariant sur les niveaux d'interopérabilité.]

=== 1.3 Positionnement vis-à-vis du LCIM : une correction de source à conserver

#emph[Insight.] Le LCIM #emph[original] de 2003 ne comporte PAS la forme canonique « 0–6 nommée » (None / Technical / Syntactic / Semantic / Pragmatic / Dynamic / Conceptual) que la littérature secondaire lui prête presque universellement. La vérification par source primaire établit que Tolk \& Muguira (2003) définissent explicitement #emph[cinq] niveaux L0–L4 à dénomination centrée-données ; la forme 0–6 nommée est une élaboration postérieure, attestée #emph[verbatim] au plus tard en 2007 (Tolk, Diallo \& Turnitsa). `confirmé`

Le texte de 2003 dit textuellement #emph[« Similar to the technical approaches, five levels of interoperability are defined »], et ces niveaux sont #emph[data-centric] : L0 #angl[System Specific Data] (boîte noire, aucune interopérabilité) ; L1 #angl[Documented Data] (protocole commun, boîte noire à interface) ; L2 #angl[Aligned Static Data] (modèle de référence commun) ; L3 #angl[Aligned Dynamic Data] (méthodes d'ingénierie logicielle standard, UML) ; L4 #angl[Harmonized Data (and Processes)] (connexions sémantiques, modèle conceptuel). Le texte de 2003 ne contient ni #emph[« seven levels »], ni L5/L6, ni les étiquettes Technical/Syntactic/Semantic/Pragmatic/Dynamic comme noms de niveaux. La forme canonique 0–6 nommée n'apparaît, elle, qu'à partir de 2007 — Figure 1 du papier IIIS — et le papier de 2009 la réaffirme : #emph[« The seven levels from no interoperability to conceptual interoperability are notated from L0 to L6 »]#footnote[The Levels of Conceptual Interoperability Model: Applying Systems Engineering Principles to M\&S — Wang, Tolk \& Wang — arXiv / SpringSim'09 (SCS), San Diego — 2009 — https://arxiv.org/pdf/0908.0191]. `confirmé`

Cette correction n'est pas un détail d'érudition : la monographie s'appuie sur la forme canonique 0–6 (où le palier sémantique L3 est le pivot du « sens »), mais elle doit le faire en sachant que cette forme est une #emph[élaboration de 2006–2007], non l'énoncé de 2003. Attribuer la forme nommée à 2003 — erreur courante — fausserait la généalogie sur laquelle s'adosse l'argument des trois ruptures.

#figure(
  table(
    columns: 3,
    table.header(
      [*Niveau*],
      [*LCIM 2003 (Tolk \& Muguira) — data-centric*],
      [*LCIM canonique ≥ 2007 (Tolk/Diallo/Turnitsa) — nommé*],
    ),
    [L0], [System Specific Data (no interop., black box)], [None (stand-alone systems)],
    [L1], [Documented Data (protocole commun, black box + interface)], [Technical (bits and bytes ; protocoles définis)],
    [L2], [Aligned Static Data (modèle de référence commun)], [Syntactic (structure / format de données communs)],
    [L3], [Aligned Dynamic Data (UML, génie logiciel std)], [Semantic (contenu de l'échange non ambigu)],
    [L4], [Harmonized Data (and Processes) (connexions sémantiques, modèle conceptuel)], [Pragmatic (méthodes/procédures, contexte d'usage)],
    [L5], [— (absent en 2003)], [Dynamic (changements d'état ; hypothèses/contraintes dans le temps)],
    [L6], [— (absent en 2003)], [Conceptual],
    [*Nb niveaux*], [*5 (L0–L4)* `confirmé`], [*7 (L0–L6)* `confirmé`],
    [*Triade I/I/C*], [absente (« integratability » non présent)], [présente ; origine « Page et al. » (Modeling/Simulation/Network)],
  ),
  caption: [LCIM 2003 (original, data-centric) vs forme canonique 0–6 (≥ 2007). Sources primaires : Tolk \& Muguira 2003 ; Tolk/Diallo/Turnitsa 2007.],
)

Trois précisions de source accompagnent ce tableau et ne doivent pas être lissées. D'abord, la triade #angl[integratability / interoperability / composability] est mappée sur le LCIM en 2007 (et non « 2011 » : la date 2011 du miroir ODU Digital Commons est une métadonnée de dépôt) ; son origine est créditée à #emph[« Page et al. »], le terme #angl[integratability] étant absent des papiers de 2003 et 2009. Ensuite, le mapping #emph[verbatim] est : Modeling/Abstraction ↔ composability ; Simulation/Implementation ↔ interoperability ; Network/Connectivity ↔ integratability — ce dernier confirmant que connectivité et interopérabilité sont des couches distinctes. Enfin, la formule fréquemment citée #emph[« composability is the realm of the model… interoperability is the realm of the software implementation… integratability addresses the hardware/configuration side of connectivity »] n'a #emph[pas] été trouvée #emph[verbatim] dans le papier primaire de 2007 ; son statut est `à vérifier` (piste : Tolk (éd.), #emph[Engineering Principles of Combat Modeling and Distributed Simulation], Wiley, 2012). Ne pas attribuer ce phrasage exact sans vérification.

=== 1.4 Ce que « agentique » ajoute : un précurseur pré-LLM, une rupture qui reste

#emph[Insight.] La lignée LCIM invoquait déjà des #emph[« intelligent software agents using the Internet »] en 2007 — un précurseur historique réel, mais #emph[pré-LLM] : il ne mentionne aucun grand modèle de langage. L'interopérabilité « agentique » au sens de cette monographie n'est donc pas un néologisme sans ascendance, mais elle introduit une rupture que le LCIM classique ne thématise pas : le passage de la composition déterministe à la #emph[délégation] vers un agent au comportement probabiliste.

Le papier de 2007 comporte une section #emph[« Motivation for Agent Mediated Decision Support »] et exige que #emph[« the agent must be aware of the assumptions and constraints underlying the model »] — exigence qui relève des niveaux supérieurs (pragmatique, dynamique, conceptuel) de l'échelle. Cette filiation « agents ↔ niveaux supérieurs du LCIM » précède de près de deux décennies l'agentique #angl[LLM] et offre un ancrage historique au cadre — à présenter comme analogie et précurseur, jamais comme équivalence. `confirmé`

Ce qui change avec les agents #angl[LLM], et que le précurseur de 2007 ne capture pas, est la troisième des #ruptures : #emph[composition → délégation]. Un système classique #emph[compose] des comportements dont les garanties sont connues et héritables ; un système agentique #emph[délègue] une part de la décision à un agent dont la sortie est probabiliste et susceptible de #angl[drift]. C'est ce déplacement qui motive le #cia — son algèbre d'héritage de garanties, ses types de session probabilistes/tolérants au #angl[drift], sa mécanisation Lean 4 et son banc empirique #angl[AgentMeshKafka] — et qui justifie l'existence même de #tau comme opérateur de #emph[dispatch] entre régime déterministe et régime probabiliste, avec une troisième issue, #tauRefus, lorsque ni l'un ni l'autre régime n'est sûr. Les règles précises de l'algèbre et la mécanisation appartiennent au corpus mère.

#corpusTODO[Reprendre du corpus mère la formulation exacte de la rupture composition → délégation et son couplage aux deux autres ruptures (la thèse étant le #emph[couplage], non trois axes indépendants) ; reprendre l'analogie directrice $M(pi)$ / π-calcul ainsi que les règles de l'algèbre d'héritage de garanties du #cia et l'état de la mécanisation Lean 4. Ne pas reconstruire ces éléments à partir du présent dossier empirique.]

Schématiquement, la définition opérationnelle retenue articule les trois notions et le point d'entrée de #tau de la manière suivante (vue conceptuelle, non normative) :

```text
                 connectivité            intégration            INTEROPÉRABILITÉ
                 (octets/réseau)         (assemblage)           (sens préservé)
LCIM (≥2007)     L0 None / L1 Technical  L2 Syntactic           L3 Semantic … L6 Conceptual
                 ───────────────── frontière « sens » ─────────────────►
                                              │
   requête ──────────────────────────────────┤  τ : dispatch sur (D-Sens, D-Autorité, D-Invariant)
                                              ▼
                          Decision ∈ { Déterministe | Probabiliste | Refus }
                                  │ déplace t_fix(g), sans altérer g
```

=== Questions ouvertes

- #emph[Source exacte de la formule « realm of the model… ».] Localiser la source primaire du phrasage #emph[« composability is the realm of the model / interoperability is the realm of the software implementation / integratability addresses the hardware-configuration side of connectivity »] — `à vérifier` ; pistes : Tolk (éd.), Wiley 2012 ; publications Diallo/Tolk 2010–2013. À ne pas citer #emph[verbatim] sans confirmation.
- #emph[Datation de l'apparition des 7 niveaux nommés.] Le papier de 2007 présente la forme 0–6 comme #emph[« current version… documented in [16] »] ; identifier la référence [16] (Turnitsa/Tolk ?) pour dater le #emph[premier] document attestant les sept niveaux nommés (probablement 2006). `probable`
- #emph[Turnitsa (2005), « Extending the LCIM ».] Confirmer par #angl[fetch] primaire la venue exacte (IEEE SCSC ?), la pagination, et surtout #emph[ce qu'il ajoute] précisément (passage de 5 à 7 niveaux ? introduction des étiquettes nommées ?). Statut actuel : `probable`, confirmé par recherche mais non par source primaire.
- #emph[Frontière « sens » et seuils de #dsens.] À quel score #dsens (palier sémantique) la frontière « sens préservé » est-elle franchie de façon défendable, et comment ce seuil interagit-il avec #dautorite et #dinvariant ? Question renvoyée au traitement canonique de #tau (corpus mère, chap. III.8) ; mentionnée ici comme charnière entre la définition du Ch. 1 et la rupture syntaxique → sémantique du Ch. 3.
- #emph[Statut de #i4.] L'invariant #i4 reste une hypothèse (campagne empirique non concluante) ; son énoncé précis et ceux de #invariant(1, "Hypothèse"), #invariant(2, "Hypothèse"), #invariant(3, "Hypothèse"), #invariant(5, "Hypothèse") proviennent du corpus mère et ne sont pas fixés dans ce chapitre.

#pagebreak()

== Ch. 2 — L'entreprise agentique : frontière conceptuelle, autonomie et risque d'exécution

L'entreprise agentique ne se distingue pas de l'automatisation classique par une capacité supérieure, mais par un *déplacement du lieu et du moment du risque* : l'agent produit des trajectoires multi-étapes à effets externes, de sorte que les risques importants émergent *durant l'exécution* et non plus, comme pour le #angl[robotic process automation] (RPA), à la conception ou au déploiement. Ce déplacement n'est pas une nuance opérationnelle : il est la motivation empirique directe de l'opérateur #tau (Partie II, Ch. 5) — qui statue, instant par instant, sur l'admissibilité d'une action — et de la discipline de résilience #angl[runtime] (Ch. 16). La cartographie de référence du paysage déployé, le _2025 AI Agent Index_, documente 30 systèmes agentiques de pointe et situe déjà les agents navigateurs en régime d'autonomie L4–L5, c'est-à-dire à intervention humaine limitée _en cours d'exécution_.#footnote[The 2025 AI Agent Index: Documenting Technical and Safety Features of Deployed Agentic AI Systems — Staufer, Feng, Wei et al., arXiv 2602.17753 (v1 2026-02-19 / v2 2026-05-06), à paraître ACM FAccT '26 — https://arxiv.org/abs/2602.17753] #footnote[Further Details — 2025 AI Agent Index (échelle L1–L5, 30 systèmes / 6 catégories, instantané 31 déc. 2025) — MIT AI Agent Index, 2026 — https://aiagentindex.mit.edu/2025/further-details/]

=== 2.1 Définition opératoire : l'agent comme producteur de trajectoires

Un agent d'entreprise, au sens retenu ici, est un système qui _planifie_, _utilise des outils_, _maintient un état_ et _produit des trajectoires multi-étapes à effets externes_, sans approbation humaine par étape. Cette caractérisation — confirmée dans la littérature primaire sur les contrôles d'exécution#footnote[From Governance Norms to Enforceable Controls: A Layered Translation Method for Runtime Guardrails in Agentic AI — Christopher Koch, arXiv 2604.05229, 2026-04-06 — https://arxiv.org/abs/2604.05229] — est *opératoire* plutôt qu'ontologique : elle ne demande pas si le système « comprend », mais ce qu'il _fait advenir_ dans l'environnement entre deux points d'observation humaine.

Trois propriétés distinctives en découlent, et c'est leur _conjonction_, non chacune isolément, qui définit le régime agentique. La première est l'_adaptation au but_ : le flux de travail est réorganisé autour d'un objectif plutôt qu'exécuté selon une séquence fixe. La deuxième est la _portée multi-système_ : l'agent franchit les frontières applicatives qu'un automate déterministe traiterait comme des silos. La troisième — la plus lourde de conséquences — est l'_irréversibilité partielle des effets_ : certaines actions de la trajectoire (un transfert, un envoi, une écriture transactionnelle) sont engagées avant que l'humain n'observe le résultat. Cette troisième propriété est le pivot : elle transforme une question de _qualité_ (la sortie est-elle correcte ?) en une question de _sûreté temporelle_ (l'action a-t-elle été engagée alors qu'elle aurait dû être refusée ou différée ?). C'est précisément l'enjeu que #tau adresse en déplaçant l'instant de fixation du sens #tfix sans altérer la grandeur traitée.

Cette définition reste *opératoire et provisoire* : la frontière de l'agentique ne se trace pas par une propriété binaire mais par un degré d'autonomie, que la §2.3 mesure sur l'échelle L1–L5 de l'Index.

=== 2.2 Frontière avec l'automatisation classique et le RPA

Le RPA et l'automatisation agentique ne diffèrent pas par le degré de sophistication mais par le _régime de causalité_ : le premier exécute des règles prédéfinies déterministes sur des tâches identiques mono-système et ne s'adapte pas ; le second réorganise le flux autour d'un raisonnement autonome adaptatif multi-système, et agit sans approbation par étape. Cette distinction est *probable* plutôt que *confirmée* : elle fait consensus dans la pratique, mais son substrat documentaire reste très majoritairement éditeur ou marketing#footnote[Agentic automation vs RPA: what actually changes for enterprise IT — Mindflow (éditeur — marketing), 2025 — https://mindflow.io/blog/agentic-automation-vs-rpa-what-actually-changes-for-enterprise-it] #footnote[What are Agentic Workflows? The 2026 Enterprise Guide — Automation Anywhere (éditeur — marketing), 2026 — https://www.automationanywhere.com/rpa/agentic-workflows] — d'où une *divergence de niveau de preuve* assumée avec les sources académiques mobilisées ailleurs dans la monographie. *À vérifier* (question ouverte, §2.5) : un substrat académique _peer-reviewed_, sous forme de taxonomie d'autonomie, reste à substituer au substrat marketing pour porter l'argument au niveau doctoral.

L'enjeu théorique de cette frontière est direct. La rupture `composition→délégation` (l'une des #ruptures couplées) se lit exactement ici : le RPA _compose_ des étapes spécifiées à l'avance — l'auteur du flux conserve l'autorité sur chaque transition ; l'agent _délègue_ le choix de la prochaine action à un raisonnement probabiliste — l'autorité de transition migre du concepteur vers le système, _à l'exécution_. La délégation est donc ce qui distingue ontologiquement l'agent du RPA, et c'est aussi ce qui rend la dimension `D-Autorité` (autorité de l'appelant × autorité requise par la cible) constitutive de l'entrée de #tau : sans délégation, il n'y aurait pas d'autorité à arbitrer à chaque étape.

#figure(
  table(
    columns: 3,
    align: left,
    table.header[*Dimension*][*RPA (déterministe)*][*Automatisation agentique*],
    [Logique de contrôle], [Règles fixes, prédéfinies], [Raisonnement autonome adaptatif],
    [Portée systémique], [Mono-système, tâches identiques], [Multi-système, flux réorganisé autour du but],
    [Adaptation], [Aucune], [Réorganisation dynamique vers l'objectif],
    [Source d'autorité de transition], [Concepteur (à la conception)], [Système délégataire (à l'exécution)],
    [Approbation humaine], [Sans objet (déterministe)], [Agit sans approbation par étape],
    [Régime de la rupture], [Composition], [Délégation],
    [Niveau d'autonomie (échelle Index)], [—], [L1–L5 ; navigateurs en L4–L5],
    [Localisation du risque], [Conception / déploiement], [*Exécution* (trajectoires à effets externes)],
  ),
  caption: [Tableau 2.1 — RPA contre automatisation agentique. La dernière ligne — déplacement du risque vers l'exécution — est la motivation empirique de #tau (Ch. 5) et de la résilience _runtime_ (Ch. 16). Distinction *probable*, substrat éditeur/marketing.],
)

=== 2.3 Niveaux d'autonomie et localisation empirique du risque

Le risque agentique n'est pas un attribut de classe mais une _fonction du niveau d'autonomie effectivement déployé_, et l'Index montre que ce niveau est déjà élevé en production. L'échelle L1–L5 du _2025 AI Agent Index_ gradue l'intervention humaine : les agents navigateurs opèrent en L4–L5 (intervention limitée en cours d'exécution), tandis que les agents d'entreprise _glissent_ de L1–L2 au stade conception vers L3–L5 au stade déploiement.#footnote[2025 AI Agent Index — répartition L1–L5, 30 systèmes / 6 catégories, instantané au 31 décembre 2025 (cf. notes ci-dessus, refs. arXiv 2602.17753 et MIT _further-details_).] Ce glissement conception→déploiement est l'observation empirique centrale du chapitre : l'autonomie réellement concédée en production excède celle prévue sur la planche à dessin, ce qui décale d'autant la fenêtre où le risque devient observable.

Un *piège de datation* doit être signalé, conformément à la discipline d'horodatage. L'ouvrage s'intitule « 2025 AI Agent Index » (instantané des systèmes au 31 décembre 2025), mais sa préimpression arXiv (2602.17753) a été déposée le 19 février 2026 (v1) et révisée le 6 mai 2026 (v2). Il faut citer l'_année de l'instantané_ (2025) distinctement de l'_année de publication_ (2026) ; la date arXiv exacte est 2026-02-19 / 2026-05-06, et non « le 7 mai » que reproduisent certaines listes. *Confirmé*, en date de juin 2026.

La thèse de risque qui structure le chapitre — « _risks emerge during execution_ » — est *confirmée* dans la littérature primaire.#footnote[From Governance Norms to Enforceable Controls — Koch, arXiv 2604.05229, 2026-04-06 (cf. note ci-dessus). La thèse « risks emerge during execution » est confirmée dans le résumé.] En revanche, son _cadrage fin_ — l'existence d'un « écart temporel entre l'initiation d'actions irréversibles et l'observation/intervention humaine » — n'est *pas* une citation verbatim et demeure *probable*. La distinction importe : on tient la _localisation_ du risque (à l'exécution) ; on infère, sans le citer mot pour mot, le _mécanisme_ (la fenêtre temporelle d'irréversibilité). C'est sur cet inféré, marqué comme tel, que reposent #tau et la garde-fou _runtime_ ; la monographie ne doit pas le durcir en acquis.

L'ampleur opérationnelle de cet écart se lit dans les chiffres d'industrialisation. Le _2026 AI Index Report_ de Stanford rapporte un taux de réussite de 66,3 % sur le banc OSWorld#footnote[The 2026 AI Index Report — Stanford HAI (primaire), 2026-04 — https://hai.stanford.edu/ai-index/2026-ai-index-report] ; une lecture secondaire en tire que « 89 % » des agents n'atteindraient jamais la production#footnote[Stanford AI Index 2026: AI Agents Hit 66% Success Rate — But 89% Never Reach Production — Beri (secondaire), 2026 — https://www.beri.net/article/stanford-ai-index-2026-agents-66-percent-success] — chiffre *à vérifier* dans le corps du rapport primaire (piste : volet « coût/déploiement », ~423 pages). Quelle que soit la valeur exacte, l'écart entre capacité démontrée en banc et fiabilité en production confirme que le risque résiduel se concentre là où l'humain n'observe plus : à l'exécution.

=== 2.4 Écosystème d'acteurs : du recensement à l'outillage du risque d'exécution

L'écosystème de l'entreprise agentique se structure, en date de juin 2026, autour de trois cercles d'acteurs dont aucun ne préexistait à 2025 sous cette forme, et dont la production converge vers un même objet : _outiller le risque d'exécution_. Le premier cercle est celui du _recensement_ : le MIT AI Agent Index cartographie les systèmes déployés et leur niveau d'autonomie (refs. ci-dessus) ; Stanford HAI en mesure la performance agrégée (ref. ci-dessus). Le deuxième est celui de la _normalisation du risque_ : l'OWASP GenAI Security Project publie un _Top 10 for Agentic Applications_ (catégories ASI01–ASI10)#footnote[OWASP Top 10 for Agentic Applications — The Benchmark for Agentic Security in the Age of Autonomous AI (ASI01–ASI10) — OWASP GenAI Security Project, 2025-12-09 — https://genai.owasp.org/2025/12/09/owasp-top-10-for-agentic-applications-the-benchmark-for-agentic-security-in-the-age-of-autonomous-ai/] ; le NIST/CAISI cadre la surveillance post-déploiement (NIST AI 800-4, détaillé au Ch. 16)#footnote[Challenges to the Monitoring of Deployed AI Systems (NIST AI 800-4, DOI 10.6028/NIST.AI.800-4) — NIST / CAISI, 2026-03 — https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.800-4.pdf] ; la Cloud Security Alliance prépare un _Agentic Profile_ du NIST AI RMF (Tier 1–4) qui cite un « IR 8596 »#footnote[NIST AI Risk Management Framework: Agentic Profile (draft, Tier 1–4) — Cloud Security Alliance Lab Space, 2026-03-27 — https://labs.cloudsecurityalliance.org/agentic/agentic-nist-ai-rmf-profile-v1/] — _IR 8596 étant à vérifier_ sur le NIST CSRC (piste : csrc.nist.gov/publications), aucun document NIST de ce numéro n'étant confirmé en date de juin 2026. Le troisième cercle est celui de l'_instrumentation_ : une science émergente de la fiabilité des agents (Princeton HAL — 4 dimensions, 12 métriques)#footnote[Towards a Science of AI Agent Reliability — Rabanser, Kapoor, Kirgis et al., Princeton HAL Lab, 2026-02-18 — https://arxiv.org/abs/2602.16666] et des cadres d'évaluation d'entreprise multi-dimensionnels (CLEAR)#footnote[Beyond Accuracy: A Multi-Dimensional Framework for Evaluating Enterprise Agentic AI Systems (CLEAR) — Mehta, arXiv (preprint), 2025-11-18 — https://arxiv.org/html/2511.14136v1] cherchent à mesurer ce que l'accuracy en banc ne capte pas.

Un acteur de ce troisième cercle mérite une mention dédiée, car il préfigure directement la posture du #cia. La _harness_ DFAH (#angl[Determinism-Faithfulness Assurance Harness]) pour agents financiers utilisant des outils propose un mécanisme de _rejouabilité_ : journaliser la trajectoire pour pouvoir la rejouer de façon déterministe et en contrôler la fidélité.#footnote[Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness for Tool-Using LLM Agents (DFAH) — Raffi Khatchadourian, arXiv (preprint), 2026-01-17 — https://arxiv.org/abs/2601.15322] L'analogie est frappante : tout comme le #ciaFull cherche à _ponter_ la garantie déterministe (Kafka/MQ) et le comportement probabiliste de l'agent _LLM_, DFAH tente d'imposer un _socle déterministe vérifiable_ sous une trajectoire probabiliste. Que ces efforts convergent de façon indépendante corrobore — sans la démontrer — la pertinence de la posture canonique du CIA.

#figure(
  table(
    columns: 4,
    align: left,
    table.header[*Acteur / artefact*][*Cercle*][*Objet*][*Statut (juin 2026)*],
    [MIT AI Agent Index], [Recensement], [Cartographie autonomie L1–L5, 30 systèmes], [_Confirmé_],
    [Stanford HAI — AI Index 2026], [Recensement], [Performance agrégée (OSWorld 66,3 %)], [_Confirmé_ ; « 89 % » _à vérifier_],
    [OWASP — Top 10 Agentic (ASI01–10)], [Normalisation du risque], [Taxonomie de menaces agentiques], [_Confirmé_],
    [NIST / CAISI — AI 800-4], [Normalisation du risque], [6 catégories de surveillance (cf. Ch. 16)], [_Confirmé_],
    [CSA — Agentic Profile (NIST AI RMF)], [Normalisation du risque], [Profil Tier 1–4 ; cite « IR 8596 »], [Draft ; IR 8596 _à vérifier_],
    [Princeton HAL — AI Agent Reliability], [Instrumentation], [4 dimensions, 12 métriques de fiabilité], [_Preprint_],
    [CLEAR (Mehta)], [Instrumentation], [Évaluation d'entreprise multi-dimensionnelle], [_Preprint_, auteur indépendant],
    [DFAH (Khatchadourian)], [Instrumentation], [Rejouabilité déterministe d'agents-outils], [_Preprint_ ; préfigure le #cia],
  ),
  caption: [Tableau 2.2 — Écosystème d'acteurs de l'entreprise agentique (en date de juin 2026), ordonné par cercle. La convergence du cercle « instrumentation » vers la rejouabilité déterministe corrobore la posture du #cia (Ch. 6).],
)

Le rattachement au canon doit rester *par référence*, non par redéfinition. Les énoncés précis et les statuts des invariants réfutables `I1`, `I2`, `I3`, `I5` — qui formaliseraient ce que l'écosystème ci-dessus tente d'établir empiriquement — ne sont pas reproductibles ici sans risque de dérive.

#corpusTODO[Reprendre du corpus mère les énoncés exacts et les statuts (`Confirmé` | `Hypothèse` | `Réfuté`) de `I1`, `I2`, `I3`, `I5` ; les rattacher à l'ancrage empirique du présent chapitre (Index L1–L5, taxonomie OWASP, écart capacité/production de Stanford). Ne pas les inventer ici.]

L'un d'eux est toutefois explicitement *à statut* dans le canon et structure la prudence du chapitre : #i4. La campagne empirique correspondante n'étant pas concluante, aucune affirmation du présent chapitre — en particulier sur l'ampleur exacte de l'écart d'exécution ou sur le « 89 % » non production — ne doit être présentée comme la validant.

=== 2.5 Schéma de positionnement : où #tau intercepte la trajectoire

Le risque d'exécution se prête à un positionnement schématique : entre deux points d'observation humaine, chaque action de la trajectoire franchit — ou non — un point de décision où #optau statue. Le schéma de séquence ci-dessous situe ce point d'interception ; il fixe le _lieu_ logique de #tau dans le cycle d'une trajectoire agentique, sans en dériver la sémantique (définition canonique complète : chap. III.8 du corpus mère).

```text
Trajectoire agentique — interception par τ (positionnement, non sémantique)

  Observation humaine (t0)
        │
        ▼
   ┌──────────┐   action proposée a_i (effet potentiellement externe)
   │  Agent   │ ───────────────┐
   │  (LLM)   │                ▼
   └──────────┘          ┌───────────┐  entrées : D-Sens ∈ [0,1]
        ▲                │     τ     │           D-Autorité (appelant × cible)
        │ feedback       │ (dispatch)│           D-Invariant (état sur la trace)
        │                └───────────┘
        │                  │   │   │
        │   Déterministe ◄─┘   │   └─► Refus  (τ-Refus → halte / escalade humaine)
        │   (garantie de       │
        │    message Kafka/MQ) Probabiliste (poursuite du régime LLM)
        │                  │   │
        └──────────────────┴───┘
                          │
                          ▼
              ... étape suivante a_{i+1} ...
                          │
                          ▼
                Observation humaine (t1)   ← l'écart [t0, t1] = fenêtre de risque
```

La lecture du schéma tient en une phrase : #tau ne juge pas la _correction_ de la sortie de l'agent, il arbitre, à chaque étape de la fenêtre `[t0, t1]`, entre trois issues — #decision — selon ses trois dimensions d'entrée, et c'est l'issue #tauRefus qui interrompt l'irréversibilité avant qu'elle ne s'engage. Les *règles précises* de cet arbitrage (seuils, composition des dimensions, sémantique formelle du déplacement de #tfix) ne sont pas reconstituées ici.

#corpusTODO[Reprendre du corpus mère (chap. III.8) la définition formelle complète de #tau : composition des dimensions `D-Sens` / `D-Autorité` / `D-Invariant`, règle de production de #decision, et formalisation du déplacement de l'instant de fixation du sens #tfix. Reprendre de même l'algèbre d'héritage de garanties et les types de session probabilistes/tolérants au _drift_ du #cia (composants, règles, mécanisation Lean 4, banc `AgentMeshKafka`). Ne rien fabriquer de ce contenu formel ici.]

=== Questions ouvertes

- *Substrat académique de la frontière RPA/agentique.* La distinction RPA contre agentique reste *probable* sur substrat éditeur/marketing ; une taxonomie d'autonomie _peer-reviewed_ doit la remplacer pour l'argument doctoral. La *divergence de niveau de preuve* avec les sources académiques de la monographie est assumée et non lissée (piste : recensions d'échelles d'autonomie hors corpus marketing).
- *Cadrage de l'écart temporel.* La localisation du risque à l'exécution est *confirmée* ; le mécanisme « écart temporel entre action irréversible et observation humaine » demeure *probable* (inféré, non verbatim). Toute formalisation de #tau bâtie sur ce mécanisme hérite de ce statut tant que le corpus mère n'en consigne pas la condition de réfutation.
- *Chiffre d'industrialisation.* Le « 89 % des agents n'atteignent jamais la production » est *à vérifier* dans le corps du _2026 AI Index Report_ (source primaire Stanford HAI) ; seule la valeur OSWorld 66,3 % est confirmée.
- *Référence normative non résolue.* L'« IR 8596 » cité par le _Agentic Profile_ de la CSA est *à vérifier* sur le NIST CSRC ; aucun document NIST de ce numéro n'est confirmé en date de juin 2026.
- *Invariants canoniques.* Les énoncés et statuts de `I1`, `I2`, `I3`, `I5` (et la non-validation de #i4) restent à reprendre du corpus mère (#corpusTODO ci-dessus) ; ils ne doivent pas être inventés depuis l'ancrage empirique du présent chapitre.

#pagebreak()

== Ch. 3 — Les trois ruptures conceptuelles couplées

*Insight-clé.* Le passage des systèmes d'intégration d'entreprise classiques aux systèmes agentiques ne se décrit pas par un progrès graduel sur un seul axe, mais par trois ruptures simultanées — #ruptures — dont la thèse centrale de cette monographie est qu'elles sont *couplées* : aucune ne peut être absorbée isolément par l'ingénierie existante, parce que franchir l'une force à franchir les deux autres. Concrètement, déléguer une tâche à un agent #angl[LLM] (rupture composition→délégation) le place hors du périmètre où le substrat garantit l'#angl[exactly-once] (rupture déterministe→probabiliste), et ce déplacement n'a de sens opérationnel que parce que la décision d'agir repose désormais sur le *contenu* interprété du message et non sur sa forme (rupture syntaxique→sémantique). Ce chapitre établit les trois ruptures, les ancre chacune sur un fait empirique daté (en date de juin 2026), puis *démontre* leur couplage. Le formalisme qui opérationnalise ce couplage — l'#optau au Ch. 5, le #cia au Ch. 6 — est ici annoncé, non développé.

=== 3.1 Pourquoi « trois ruptures » et non « un continuum de maturité »

*Insight-clé.* La tentation naturelle de l'architecte est de lire l'agentique comme un cran supplémentaire sur une échelle de maturité d'interopérabilité déjà connue ; cette lecture est fausse parce que les trois transformations ne sont pas ordonnables sur un même axe et ne se composent pas additivement.

L'échelle de référence du domaine — le LCIM (#angl[Levels of Conceptual Interoperability Model]) — illustre précisément ce que la lecture « continuum » fait perdre. Dans sa forme canonique attestée dès 2007 (sept niveaux L0–L6 : None, Technical, Syntactic, Semantic, Pragmatic, Dynamic, Conceptual)#footnote[Applying the LCIM in Support of Integratability, Interoperability, and Composability for SoS Engineering (Tolk, Diallo, Turnitsa) — Journal of Systemics, Cybernetics and Informatics, Vol. 5 No 5 (IIIS), ISSN 1690-4524 — 2007 — https://www.iiisci.org/journal/pdv/sci/pdfs/p468106.pdf], le LCIM ordonne des *degrés de préservation du sens* dans un échange. Il fonde la frontière normative — `confirmé` par les sources primaires de 2003 et 2007 — entre l'interopérabilité (échange où le sens est *préservé*) et la simple intégration/connectivité technique (les octets transitent)#footnote[The Levels of Conceptual Interoperability Model (Tolk & Muguira, 2003 Fall SIW, Orlando, paper 03F-SIW-007) — MSCO archive — 2003 — https://www.mscoe.org/content/uploads/2017/12/Tolk-Muguira-The-Levels-of-Conceptual-Interoperability-Models.pdf]. Mais le LCIM, y compris dans la lignée qui invoquait dès 2007 les « #angl[intelligent software agents] » (agents *classiques, pré-LLM* ; aucune mention de grands modèles de langage — `confirmé`)#footnote[Même source : section « Motivation for Agent Mediated Decision Support », antérieure de près de deux décennies à l'agentique LLM ; à traiter comme précurseur historique, non comme équivalence.], reste un modèle *monodimensionnel* : il mesure une qualité (le sens partagé) le long d'une seule progression. Or les trois ruptures relèvent de trois plans hétérogènes :

#figure(
  table(
    columns: 4,
    align: left,
    table.header(
      [*Rupture*], [*Plan transformé*], [*Avant (intégration classique)*], [*Après (système agentique)*],
    ),
    [déterministe→probabiliste], [Garantie d'exécution], [Livraison et traitement à garantie forte (#angl[exactly-once] transactionnel)], [Action non rejouable à issue distribuée],
    [syntaxique→sémantique], [Base de la décision], [Prédicat sur la forme/structure du message], [Prédicat sur le contenu interprété],
    [composition→délégation], [Mode d'assemblage], [Orchestration de fonctions au comportement fixé], [Délégation d'un but à un agent autonome],
  ),
  caption: [Trois plans hétérogènes — les ruptures ne sont pas ordonnables sur un axe unique.],
)

Le point décisif : ces trois plans sont indépendants *par construction conceptuelle* — on peut imaginer chacun isolément — mais ils deviennent *solidaires en pratique* dès qu'on instancie un agent #angl[LLM] dans une chaîne d'entreprise réelle. C'est cette solidarité, et non l'existence séparée des trois axes, qui constitue la thèse (§3.5).

=== 3.2 Rupture 1 — déterministe → probabiliste

*Insight-clé.* La rupture déterministe→probabiliste n'est pas une affirmation philosophique sur la « créativité » des modèles ; elle est *mesurable* à une frontière d'ingénierie précise et documentée — le bord du périmètre où le substrat de messagerie cesse de garantir l'#angl[exactly-once].

L'ancrage empirique est la sémantique #angl[exactly-once] (EOS) d'Apache Kafka. EOS existe depuis Kafka 0.11 (juin 2017, KIP-98 : producteur idempotent, transactions inter-partitions atomiques, consommateur `read_committed`)#footnote[KIP-98 — Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging] (`confirmé`), et la défense transactionnelle côté serveur (KIP-890) est active par défaut depuis Kafka 4.0 (18 mars 2025)#footnote[Apache Kafka 4.0.0 Release Announcement — Apache Software Foundation — 2025-03-18 — https://kafka.apache.org/blog/2025/03/18/apache-kafka-4.0.0-release-announcement/] (`confirmé`). La version courante en date de juin 2026 est Kafka 4.3.0 (22 mai 2026), la ligne 4.2.x étant maintenue en parallèle (4.2.1, 30 mai 2026)#footnote[Release Announcements (versions et dates Kafka) — Apache Software Foundation — 2026-05-30 — https://kafka.apache.org/blog/releases/] (`confirmé`).

Le fait structurant est une *borne* de cette garantie, énoncée verbatim par Confluent : l'EOS est circonscrite au périmètre interne *read-process-write* de Kafka ; *tout appel RPC externe — magasin distant, API #angl[LLM], courriel, paiement — n'est pas garanti #angl[exactly-once]*#footnote[Exactly-once Semantics is Possible: Here is How Apache Kafka Does It (Narkhede, Wang et al.) — Confluent — 2025-03-01 — https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/] (`confirmé`, verbatim Confluent). La rupture est exactement là : un agent #angl[LLM], par définition, *agit par appels externes* (il invoque un outil, émet une requête, déclenche un effet). Son action tombe donc, structurellement, du mauvais côté de la frontière de garantie.

#figure(
  table(
    columns: 3,
    align: left,
    table.header(
      [*Périmètre*], [*Garantie EOS Kafka*], [*Implication agentique*],
    ),
    [read-process-write *interne* Kafka], [Oui (atomique, multi-partitions)], [Substrat déterministe],
    [Appel RPC externe (magasin distant, *API LLM*, courriel, paiement)], [Non], [Action probabiliste / non rejouable → ressort de l'#optau],
  ),
  caption: [Frontière de garantie EOS — ancrage empirique de la rupture déterministe→probabiliste (d'après Confluent, 2025-2026).],
)

Deux nuances doivent être préservées, non lissées. D'abord, le substrat *n'est pas* inutile dans le régime probabiliste : l'industrie le requalifie en *mémoire avec rejeu déterministe* — le journal devient mémoire #angl[stateful], avec DLQ portant `prompt-id`/`model-version`/`offset` et #angl[transactional outbox] + CDC Debezium pour borner les effets (verbatim Confluent, 5 mai 2026)#footnote[Integrating AI Into Apache Kafka Architectures: Patterns (outbox/DLQ/replay) — Confluent — 2026-05-05 — https://www.confluent.io/blog/ai-kafka-integration-patterns/] (`confirmé`). La rupture ne supprime pas le déterministe ; elle l'enserre autour d'un noyau probabiliste. Ensuite, des mécanismes de 2PC externe sont à l'étude (KIP-939, statut « Accepted », `transaction.two.phase.commit.enable` par défaut `false`) mais *aucune version d'intégration n'est spécifiée en date de juin 2026* → `à vérifier` maintenu#footnote[KIP-939: Support Participation in 2PC (Accepted, version non spécifiée) — Apache Software Foundation — https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC]. La frontière reste donc, à ce jour, structurelle et non refermable par configuration.

L'#optau prend précisément cette frontière comme domaine : il *dispatch* entre le régime déterministe (garantie de message) et le régime probabiliste (agent #angl[LLM]), sa dimension d'entrée #dinvariant traçant l'état des invariants de part et d'autre. Le mécanisme complet — définition canonique au chap. III.8 du corpus mère, instancié au Ch. 5 — n'est pas développé ici.

=== 3.3 Rupture 2 — syntaxique → sémantique

*Insight-clé.* La rupture syntaxique→sémantique déplace le *prédicat de décision* : là où l'intégration classique route et valide sur la forme du message (structure, format, schéma), le système agentique route et décide sur le *contenu interprété*, ce qui fait du score sémantique une grandeur de premier ordre et non un confort applicatif.

Le LCIM nomme déjà les deux paliers : L2 *Syntactic* (« #angl[common structure… common data format] ») et L3 *Semantic* (« #angl[content of information exchange requests unambiguously defined] »)#footnote[Voir source LCIM 2007 supra (Figure 1, descriptions L0-L6).] (`confirmé`). Les protocoles agentiques opèrent leur transport sur le palier syntaxique — MCP repose sur JSON-RPC 2.0, messages encodés en UTF-8, dans sa révision stable 2025-11-25#footnote[Specification 2025-11-25 (overview, primitives, « Stateful connections ») — Model Context Protocol — 2025-11-25 — https://modelcontextprotocol.io/specification/2025-11-25] (`confirmé`) — mais la *décision d'agir* migre au palier sémantique. L'ancrage empirique le plus net est le routage sémantique. Le projet `semantic-router` (Aurelio Labs) instancie le *Message Router* classique des #angl[Enterprise Integration Patterns] en *remplaçant le prédicat de routage déterministe par une similarité vectorielle* ; verbatim : « #angl[Rather than waiting for slow LLM generations to make tool-use decisions, we use the magic of semantic vector space to make those decisions, routing our requests using semantic meaning] »#footnote[aurelio-labs/semantic-router — README — Aurelio Labs (GitHub) — 2026 — https://github.com/aurelio-labs/semantic-router/blob/main/README.md] (`confirmé`). Le routage cesse d'être une fonction de la forme ; il devient une fonction de la *proximité de sens* dans un espace vectoriel.

#figure(
  table(
    columns: 3,
    align: left,
    table.header(
      [*Dimension*], [*Régime syntaxique (intégration classique)*], [*Régime sémantique (agentique)*],
    ),
    [Prédicat de routage], [Champ / schéma / type de message], [Similarité vectorielle au sens (`semantic-router`)],
    [Critère de validité], [Conformité de format (UTF-8, JSON-RPC, schéma)], [Adéquation interprétée requête↔intention],
    [Palier LCIM], [L2 Syntactic], [L3 Semantic (et au-delà)],
    [Mode d'échec], [Rejet déterministe (malformé)], [Faux positif / dérive sémantique (#angl[drift])],
  ),
  caption: [Déplacement du prédicat de décision — du format au sens.],
)

La conséquence formelle est centrale pour la suite : le sens devient une *grandeur mesurée*, le score sémantique sur $[0, 1]$, soit la dimension d'entrée #dsens de l'#optau. C'est aussi le lieu d'un nouveau mode d'échec absent du régime syntaxique : non plus le message malformé rejeté de manière déterministe, mais le faux positif sémantique et la dérive (#angl[drift]) — d'où la conception, au #cia, de types de session *tolérants au #angl[drift]*. Cette migration recouvre la transformation la plus subtile de la pile : ce que l'#optau formalise sous le nom de déplacement de l'instant de fixation du sens #tfix — le sens n'est plus arrêté à la compilation/au contrat, mais à l'exécution, par l'interprétation. La construction canonique de #tfix relève du Ch. 5 et n'est pas reprise ici.

#corpusTODO[Énoncé(s) d'invariant(s) du corpus mère portant sur la conservation/dégradation du sens à travers #tfix (candidats #invariant(2, "à confirmer"), #invariant(3, "à confirmer") — énoncés et statuts NON fournis dans le dossier d'état de l'art). Ne pas fabriquer : reprendre tels quels du corpus mère, avec statut explicite.]

=== 3.4 Rupture 3 — composition → délégation

*Insight-clé.* La rupture composition→délégation change la *nature de l'assemblage* : on ne compose plus des fonctions au comportement fixé (entrée→sortie déterministe), on délègue un but à un agent autonome dont l'exécution est ouverte ; le paysage protocolaire de juin 2026 *acte cette distinction dans sa propre stratification*.

L'ancrage empirique est la séparation, devenue structurelle, entre deux familles de protocoles. MCP régit l'*accès aux outils* — primitives serveur `{Resources, Prompts, Tools}`, primitives client `{Sampling, Roots, Elicitation}` — c'est-à-dire la mise à disposition de capacités *composables* à un agent#footnote[Voir Specification 2025-11-25 supra ; primitives stabilisées (`confirmé`).] (`confirmé`). A2A (Agent2Agent) régit la *délégation inter-agents* — message/tâche d'un agent à un autre — avec sa première version stable v1.0 le 12 mars 2026 (#angl[Signed Agent Cards], support multi-tenant)#footnote[Releases — a2aproject/A2A (v1.0.0 12 mars 2026 ; v1.0.1 28 mai 2026) — A2A Project / GitHub — https://github.com/a2aproject/A2A/releases] (`confirmé`), après transfert à la Linux Foundation le 23 juin 2025#footnote[Linux Foundation Launches the Agent2Agent Protocol Project — Linux Foundation — 2025-06-23 — https://www.linuxfoundation.org/press/linux-foundation-launches-the-agent2agent-protocol-project-to-enable-secure-intelligent-communication-between-ai-agents] (`confirmé`) et absorption d'ACP/IBM (fusion août 2025)#footnote[ACP Joins Forces with A2A — LF AI & Data Foundation — 2025-08-29 — https://lfaidata.foundation/communityblog/2025/08/29/acp-joins-forces-with-a2a-under-the-linux-foundations-lf-ai-data/] (`confirmé`, historique).

Le constat clé, `probable` en date de juin 2026 : la convergence du paysage s'est faite *par stratification sous la Linux Foundation, non par unification monolithique*#footnote[A2A, ACP, AGNTCY, AG-UI/A2UI — synthèse de stratification — voir communiqués LF cités. Dynamique de convergence par stratification : `probable`.] — A2A = message/tâche inter-agents (délégation) ; MCP = accès outils (composition) ; AGNTCY = annuaire/identité/transport/observabilité ; AG-UI/A2UI = interface usager. Que l'écosystème ait spontanément séparé « accès outils » (MCP) de « délégation inter-agents » (A2A) est l'attestation empirique que composition et délégation sont des régimes *distincts*, exigeant des contrats distincts.

#figure(
  table(
    columns: 4,
    align: left,
    table.header(
      [*Axe*], [*Composition (MCP — accès outils)*], [*Délégation (A2A — inter-agents)*], [*Source / statut*],
    ),
    [Unité assemblée], [Outil / ressource / prompt], [Tâche confiée à un agent], [Spécs MCP / A2A — `confirmé`],
    [Garantie de comportement], [Contrat d'outil (entrée→sortie typée)], [But poursuivi, exécution ouverte], [`confirmé` / inhérent],
    [Découverte], [Primitives serveur déclarées], [#angl[Agent Card] (+ `AgentCardSignature`)], [A2A v1.0 — `confirmé`],
    [Gouvernance (juin 2026)], [AAIF / Linux Foundation, rév. 2025-11-25], [Linux Foundation, v1.0 (12 mars 2026)], [Communiqués LF — `confirmé`],
  ),
  caption: [Composition (MCP) vs délégation (A2A) — distinction actée par la stratification protocolaire.],
)

Une mutation en cours mérite d'être signalée car elle illustre la pression de la délégation sur l'architecture : MCP propose, via un #angl[Release Candidate] visant la version finale 2026-07-28, le passage d'un cœur explicitement #angl[stateful] (handshake `initialize`, `Mcp-Session-Id`) à un cœur *sans état*, pour permettre la scalabilité horizontale#footnote[The 2026-07-28 MCP Specification Release Candidate (stateless ; dépréciations ; Extensions) — Model Context Protocol Blog — 2026-05-21 — https://blog.modelcontextprotocol.io/posts/2026-07-28-release-candidate/] (`probable`, statut RC non finalisé ; ses paramètres restent susceptibles d'évoluer d'ici la date cible). Cette refonte est annoncée, non acquise : à re-vérifier après le 2026-07-28.

L'#optau lit cette rupture par sa dimension #dautorite (autorité du contexte appelant × autorité requise par la cible) : déléguer, contrairement à composer, transfère une autorité d'agir, ce qui ouvre la classe d'échec du #angl[confused deputy] — précisément la raison du durcissement OAuth 2.1 / RFC 8707 de MCP (paramètre `resource` MUST, interdiction du #angl[token passthrough]), durcissement empiriquement motivé par CVE-2025-49596 (CVSS v4.0 = 9.4 CRITICAL)#footnote[CVE-2025-49596 Detail (NVD : MCP Inspector < 0.14.1, RCE, CVSS v4.0 9.4) — NVD / NIST — 2025-06-13 — https://nvd.nist.gov/vuln/detail/CVE-2025-49596] (`confirmé`). La formalisation de #dautorite et la sortie #tauRefus (refus lorsque l'autorité est insuffisante) relèvent du Ch. 5.

=== 3.5 Le couplage : la thèse

*Insight-clé.* Les trois ruptures ne s'additionnent pas, elles s'impliquent : franchir l'une force, en pratique d'entreprise, à franchir les deux autres. C'est ce *couplage* — et non l'inventaire des trois axes — qui est la contribution thétique de la monographie et qui rend insuffisante toute réponse traitant un seul axe.

La démonstration est causale, non rhétorique. Suivons une chaîne d'entreprise minimale qui délègue une tâche à un agent #angl[LLM] :

#figure(
```
[Producteur Kafka] --(read-process-write, EOS, déterministe)--> [Topic]
        │                                                          │
        │  frontière de garantie EOS (read-process-write interne)  │
        ▼                                                          ▼
[Agent LLM] --(appel RPC externe : outil/API/paiement)--> [Effet du monde]
   (1) DÉLÉGATION (A2A : tâche, pas fonction)
        ⇒ sort du périmètre EOS ........................ (2) PROBABILISTE (effet non rejouable)
        ⇒ décide quoi appeler par interprétation ....... (3) SÉMANTIQUE (prédicat = sens, D-Sens ∈ [0,1])
```,
caption: [Chaîne de délégation : un seul franchissement entraîne les trois ruptures.],
)

L'enchaînement (1)→(2)→(3) est forcé, pas optionnel :

- *Délégation ⇒ probabiliste.* Confier un *but* (et non une fonction au comportement fixé) à un agent #angl[LLM] implique qu'il agira par appels externes, donc hors du périmètre #angl[exactly-once] du substrat (§3.2). On ne peut pas déléguer à un agent tout en gardant la garantie déterministe : la frontière EOS est franchie *du fait même* de la délégation.
- *Délégation ⇒ sémantique.* Un agent à qui l'on délègue un but doit *décider* quels outils composer pour l'atteindre ; cette décision est un routage sur le sens, pas sur la forme (§3.3). La délégation présuppose le prédicat sémantique #dsens.
- *Probabiliste ⇒ sémantique (et réciproquement).* L'action non rejouable n'est gouvernable que si l'on peut *qualifier* la requête avant de l'émettre (score sémantique, état des invariants) ; et le prédicat sémantique n'a d'enjeu que parce que l'action qu'il déclenche est non rejouable. Les deux paliers se tiennent.

Le couplage se lit aussi *en négatif*, dans l'insuffisance des réponses monodimensionnelles — argument central contre la lecture « continuum » de §3.1 :

#figure(
  table(
    columns: 3,
    align: left,
    table.header(
      [*Réponse traitant un seul axe*], [*Ce qu'elle règle*], [*Ce que le couplage laisse non résolu*],
    ),
    [2PC / transactions étendues (axe déterministe seul, ex. KIP-939)], [Atomicité de l'effet externe], [Le *quoi* appeler reste un choix sémantique faillible ; statut d'intégration `à vérifier`],
    [Routage sémantique seul (axe sémantique)], [Diriger la requête vers la bonne route], [L'effet émis reste non rejouable ; aucune garantie d'exécution],
    [Orchestration statique de fonctions (axe composition seul)], [Comportement prévisible des sous-tâches], [Interdit l'autonomie même qui motive la délégation],
  ),
  caption: [Insuffisance des réponses monodimensionnelles — chaque axe pris seul laisse les deux autres ouverts.],
)

C'est exactement la fonction de l'#optau (Ch. 5) et du #cia (Ch. 6) que de traiter les trois ruptures *ensemble* : l'#optau prend en entrée les trois dimensions correspondantes — #dsens (rupture sémantique), #dautorite (rupture délégation), #dinvariant (rupture déterministe, état des invariants sur la trace) — et produit #decision, dispatchant entre régime déterministe, régime probabiliste, ou #tauRefus. Le #cia fournit le cadre formel pontant garanties déterministes (Kafka/MQ) et comportement probabiliste d'agents #angl[LLM], via types de session probabilistes/tolérants au #angl[drift] et algèbre d'héritage de garanties, mécanisé en Lean 4 sur le banc #angl[AgentMeshKafka]. Ni l'algèbre, ni la sémantique opérationnelle, ni le code Lean ne sont reproduits ici.

#corpusTODO[Énoncés précis et statuts des invariants réfutables I1, I2, I3, I5 du corpus mère (#i4 = Hypothèse, campagne empirique non concluante — à ne jamais présenter comme acquis). Règles de l'algèbre d'héritage de garanties et extraits Lean 4 du #cia. Aucun de ces contenus formels n'est fourni par le dossier d'état de l'art (qui couvre l'ancrage empirique, non le formalisme canonique) → reprendre intégralement du corpus mère, ne pas fabriquer (CLAUDE.md §10).]

=== 3.6 Portée et limites de la thèse du couplage

*Insight-clé.* Le couplage est une thèse *réfutable* : il suffirait, pour l'affaiblir, qu'une réponse monodimensionnelle robuste neutralise les deux autres axes ; en date de juin 2026, aucune ne le fait, mais deux fronts sont à surveiller.

La condition de réfutation est explicite. Le couplage serait *réfuté* si l'on exhibait un mécanisme traitant un seul axe et fermant les deux autres sans effet de bord — par exemple un 2PC externe généralisé qui rendrait l'action d'agent rejouable *et* dispenserait du prédicat sémantique. Or (i) le 2PC externe Kafka reste non livré (`à vérifier`, §3.2), et (ii) même livré, il n'adresserait pas le choix sémantique du *quoi* appeler. Le couplage tient donc, en date de juin 2026, mais comme énoncé *à condition de réfutation nommée*, non comme vérité acquise.

Deux nuances de traçabilité doivent rester visibles. D'abord, l'ancrage de la rupture sémantique sur le pontage « patrons classiques ↔ patrons agentiques » s'appuie sur une analogie largement *reconstruite par la littérature secondaire/académique* (surveys arXiv) et *non revendiquée par les sources primaires éditeur* (Anthropic ne cite pas les #angl[Enterprise Integration Patterns]) — `confirmé`#footnote[Survey of LLM Agent Communication with MCP: A Software Design Pattern Centric Review (Sarkar & Sarkar) — arXiv — 2025-05-26 / v2 2026-05-22 — https://arxiv.org/abs/2506.05364]. La filiation `semantic-router` ↔ Message Router est, elle, directe et `confirmé`. Ensuite, l'attribution de déploiements en *production* nominatifs sur A2A au-delà des communiqués de fondation reste `à vérifier` (les organisations sont listées comme #angl[supporting], non comme exploitants nommés)#footnote[A2A Protocol Surpasses 150 Organizations… Enterprise Production Use in First Year — Linux Foundation — 2026-04-09 — https://www.linuxfoundation.org/press/a2a-protocol-surpasses-150-organizations-lands-in-major-cloud-platforms-and-sees-enterprise-production-use-in-first-year] : la rupture composition→délégation est attestée *au plan protocolaire* (la stratification existe), son ampleur *en production* l'est moins.

=== 3.7 Questions ouvertes

- *Réfutabilité du couplage.* Existe-t-il, ou émergera-t-il, un mécanisme monodimensionnel (typiquement un 2PC externe généralisé, KIP-939 + suites) qui neutraliserait les deux autres axes ? *Vérification* : suivre le statut d'intégration de KIP-939 et FLIP-319 (Apache Flink) ; à ce jour version d'intégration non spécifiée (`à vérifier`).
- *Stabilité de l'ancrage protocolaire.* Le RC MCP 2026-07-28 (cœur sans état) sera-t-il publié sans modification substantielle, et la stratification A2A/MCP/AGNTCY tiendra-t-elle, ou une réunification altèrera-t-elle la lecture composition vs délégation ? *Vérification* : re-balayer #angl[Releases]/changelog après le 2026-07-28.
- *Ancrage formel du couplage.* L'analogie directrice du #cia est M(π)/π-calcul, alors que l'état de l'art récent (MSC/automates communicants, mécanisations Lean 4/Rocq) privilégie les supports d'implémentabilité décidable. Faut-il *compléter* l'ancrage π-calcul par un ancrage MSC/CFSM ? Question ouverte à arbitrer au Ch. 6 ; hors périmètre de ce chapitre.
- *Statut empirique des invariants.* Les énoncés et statuts de I1, I2, I3, I5 (et la confirmation que #i4 demeure Hypothèse) conditionnent la force de la thèse ; ils sont à reprendre du corpus mère et à confronter au banc #angl[AgentMeshKafka] (cf. #corpusTODO[supra, §3.5]).
- *Portée en production.* Au-delà des communiqués de fondation, des études de cas éditeurs/#angl[peer-reviewed] attestent-elles nominativement des déploiements agentiques en production qui exercent réellement les trois ruptures couplées ? `à vérifier`.
