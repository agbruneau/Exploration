# L'Interopérabilité Agentique en Entreprise

> **Fondements formels, protocoles et gouvernance des systèmes multi-agents sur substrats à garanties fortes.**
> André-Guy Bruneau, M.Sc. · co-auteur **Claude (Anthropic)** · fr‑CA · **ébauche** — état de l'art arrêté au **8 juin 2026**.

> ℹ️ _Version Markdown générée **fidèlement** depuis les sources Typst (`src/parties/`) — même contenu que [`docs/monographie.pdf`](monographie.pdf). Le noyau formel (sémantique opératoire de τ, énoncés précis de I1–I5, algèbre du CIA, mécanisation Lean 4) reste **déféré au corpus mère** via les encadrés « ⟢ À reprendre du corpus mère » ; il n'est pas fabriqué (cf. `CLAUDE.md` §10). Source de vérité typographique : le PDF compilé._

## Sommaire

- [PARTIE I — Cadre conceptuel et problématique](#partie-i--cadre-conceptuel-et-problématique)
  - [Ch. 1 — Définir l'interopérabilité agentique](#ch-1--définir-linteropérabilité-agentique)
  - [Ch. 2 — L'entreprise agentique : frontière conceptuelle, autonomie et risque d'exécution](#ch-2--lentreprise-agentique--frontière-conceptuelle-autonomie-et-risque-dexécution)
  - [Ch. 3 — Les trois ruptures conceptuelles couplées](#ch-3--les-trois-ruptures-conceptuelles-couplées)
- [PARTIE II — Fondements formels](#partie-ii--fondements-formels)
  - [Ch. 4 — La tension fondamentale : garanties déterministes vs comportement probabiliste](#ch-4--la-tension-fondamentale--garanties-déterministes-vs-comportement-probabiliste)
  - [Ch. 5 — L'opérateur τ](#ch-5--lopérateur-τ)
  - [Ch. 6 — Le Calcul d'Intégration Agentique (CIA)](#ch-6--le-calcul-dintégration-agentique-cia)
  - [Ch. 7 — Patrons d'intégration agentique : une filiation reconstruite des Enterprise Integration Patterns](#ch-7--patrons-dintégration-agentique--une-filiation-reconstruite-des-enterprise-integration-patterns)
- [PARTIE III — Protocoles et standards](#partie-iii--protocoles-et-standards)
  - [Ch. 8 — Paysage des protocoles d'interopérabilité agentique](#ch-8--paysage-des-protocoles-dinteropérabilité-agentique)
  - [Ch. 9 — Substrats de messagerie à garanties fortes](#ch-9--substrats-de-messagerie-à-garanties-fortes)
  - [Ch. 10 — Modernisation du mainframe IBM Z](#ch-10--modernisation-du-mainframe-ibm-z)
- [PARTIE IV — Sécurité, identité et autorité déléguée](#partie-iv--sécurité-identité-et-autorité-déléguée)
  - [Ch. 11 — Identité des charges et des agents](#ch-11--identité-des-charges-et-des-agents)
  - [Ch. 12 — Autorité déléguée dans les chaînes agentiques](#ch-12--autorité-déléguée-dans-les-chaînes-agentiques)
  - [Ch. 13 — Menaces et défenses de l'entreprise agentique](#ch-13--menaces-et-défenses-de-lentreprise-agentique)
- [PARTIE V — Observabilité, traçabilité et gouvernance](#partie-v--observabilité-traçabilité-et-gouvernance)
  - [Ch. 14 — Observabilité et provenance agentiques](#ch-14--observabilité-et-provenance-agentiques)
  - [Ch. 15 — Gouvernance et conformité réglementaire](#ch-15--gouvernance-et-conformité-réglementaire)
  - [Ch. 16 — Résilience opérationnelle et gestion du risque agentique](#ch-16--résilience-opérationnelle-et-gestion-du-risque-agentique)
- [PARTIE VI — Validation empirique et architecture de référence](#partie-vi--validation-empirique-et-architecture-de-référence)
  - [Ch. 17 — Validation, métrologie et fiabilité des agents](#ch-17--validation-métrologie-et-fiabilité-des-agents)
  - [Ch. 18 — Architecture de référence implémentable de bout en bout](#ch-18--architecture-de-référence-implémentable-de-bout-en-bout)
  - [Ch. 19 — Instanciation en services financiers régulés](#ch-19--instanciation-en-services-financiers-régulés)
- [PARTIE VII — Perspectives](#partie-vii--perspectives)
  - [Ch. 20 — Limites, angles morts et programme de recherche 2027–2030](#ch-20--limites-angles-morts-et-programme-de-recherche-20272030)

---

## PARTIE I — Cadre conceptuel et problématique

### Ch. 1 — Définir l'interopérabilité agentique

_Insight-clé._ L'interopérabilité n'est pas la connectivité : c'est l'échange où le _sens_ d'une grandeur est préservé de bout en bout, et non la simple circulation d'octets entre systèmes. Cette frontière — héritée du _Levels of Conceptual Interoperability Model_ (LCIM) et confirmée par ses sources primaires de 2003 et 2007 — fonde tout l'édifice agentique : déléguer une décision à un agent _LLM_ ne devient _interopérable_ que si le sens survit au passage d'un régime déterministe à un régime probabiliste. C'est précisément le lieu où l'opérateur τ déplace l'instant de fixation du sens _t_fix</sub>(g) sans altérer la grandeur transportée.

L'enjeu de ce chapitre est définitionnel et empirique à la fois. Définitionnel : poser ce qu'« interopérabilité agentique » veut dire, en la distinguant de l'intégration et de la connectivité, et en la situant sur l'échelle des niveaux d'interopérabilité. Empirique : ancrer cette définition dans la littérature primaire vérifiée — sans la lisser, en conservant une correction historique majeure sur le LCIM que la littérature secondaire reproduit massivement à tort. La définition canonique complète de τ, du Calcul d’Intégration Agentique (CIA) et des invariants I1 (Hypothèse)–I5 (Hypothèse) relève du corpus mère ; ce chapitre y _réfère_ et n'en duplique pas l'appareil formel.

#### 1.1 Interopérabilité ≠ intégration ≠ connectivité : la frontière normative

_Insight._ Confondre « octets qui transitent » et « sens partagé » est l'anti-patron central que le LCIM existe pour dissiper[^p1-1]. Trois notions distinctes, trop souvent fusionnées dans le discours d'ingénierie, structurent le champ.

La _connectivité_ (équivalent du niveau _integratability_ dans la triade LCIM) répond à une question matérielle : les systèmes peuvent-ils échanger des bits sur un réseau dont les protocoles sont définis sans ambiguïté ? Elle occupe les couches basses (L0–L1). L'_intégration_ assemble des composants pour qu'ils fonctionnent ensemble ; elle est une condition nécessaire mais non suffisante de l'interopérabilité. L'_interopérabilité_ proprement dite — au sens fort retenu ici — est l'échange où le _sens_ de l'information est préservé : elle exige les niveaux sémantique, pragmatique, dynamique et conceptuel. Le papier fondateur l'énonce dès son abrégé : _« Interoperability of systems is not a cookie-cutter-function »_ ; et la version de 2007 le formule comme thèse — _« meaningful interoperability requires much more than technical layers »_[^p1-2]. `confirmé`

La portée agentique de cette frontière est directe. Un agent _LLM_ qui reçoit un message bien typé sur un canal Kafka fiable dispose de la connectivité et, le plus souvent, de l'intégration ; rien ne garantit que le _sens_ de la requête — l'intention, l'autorité de l'appelant, les invariants à préserver — survive à son interprétation probabiliste. La rupture _syntaxique → sémantique_ (cf. Ch. 3), seconde des déterministe→probabiliste, syntaxique→sémantique, composition→délégation, prend racine exactement ici : passer de « la structure du message est valide » à « le contenu de la requête est compris sans ambiguïté » est le saut que la connectivité ne franchit jamais seule.

#### 1.2 Les niveaux d'interopérabilité : du technique à l'organisationnel

_Insight._ Les niveaux d'interopérabilité forment une échelle cumulative — chaque palier présuppose les précédents — et le « sens » n'apparaît qu'à partir du niveau sémantique. La nomenclature usuelle en cinq paliers (technique, syntaxique, sémantique, pragmatique, organisationnel) recoupe l'ossature du LCIM canonique sans s'y superposer terme à terme : le LearningCIM raffine le haut de l'échelle en distinguant pragmatique, dynamique et conceptuel.

Le palier _technique_ assure le transport des bits (réseaux, protocoles) ; le palier _syntaxique_ impose une structure et un format de données communs ; le palier _sémantique_ rend le contenu d'un échange non ambigu ; le palier _pragmatique_ suppose que les parties soient conscientes des méthodes, procédures et du contexte d'usage ; le palier _organisationnel_ (que le LCIM éclate en _dynamique_ — comprendre les changements d'état, hypothèses et contraintes dans le temps — et _conceptuel_ — modèle partagé du domaine) couvre l'alignement des intentions, autorités et processus entre organisations. Le seuil critique est le franchissement du palier syntaxique vers le palier sémantique : en deçà, on transporte des structures ; au-delà, on transporte du sens.

Pour la suite de la monographie, cette échelle fournit la _carte_ sur laquelle τ opère. L'opérateur ne crée pas de niveau ; il déplace _t_fix</sub>(g) — l'instant où le sens d'une grandeur `g` est fixé — entre un régime déterministe (garantie de message, paliers technique/syntaxique stabilisés) et un régime probabiliste (agent _LLM_, paliers sémantique/pragmatique en jeu), en émettant une Decision ∈ {Déterministe, Probabiliste, Refus}. Ses trois dimensions d'entrée se projettent sur l'échelle : D‑Sens (score sémantique dans `[0,1]`) mesure la solidité au palier sémantique ; D‑Autorité (autorité de l'appelant croisée avec l'autorité requise par la cible) relève du palier organisationnel ; D‑Invariant (état des invariants sur la trace) porte la mémoire dynamique des contraintes. La définition canonique complète de cette mécanique appartient au corpus mère.


> ⟢ ***À reprendre du corpus mère*** — Énoncés précis et statuts des invariants I1 (Hypothèse), I2 (Hypothèse), I3 (Hypothèse) et I5 (Hypothèse) (le présent chapitre ne les fixe pas) ; rappeler que I4 (Hypothèse) demeure une hypothèse, campagne empirique non concluante. Reprendre du corpus mère, chap. III.8, la projection formelle des dimensions D‑Sens / D‑Autorité / D‑Invariant sur les niveaux d'interopérabilité.


#### 1.3 Positionnement vis-à-vis du LCIM : une correction de source à conserver

_Insight._ Le LCIM _original_ de 2003 ne comporte PAS la forme canonique « 0–6 nommée » (None / Technical / Syntactic / Semantic / Pragmatic / Dynamic / Conceptual) que la littérature secondaire lui prête presque universellement. La vérification par source primaire établit que Tolk & Muguira (2003) définissent explicitement _cinq_ niveaux L0–L4 à dénomination centrée-données ; la forme 0–6 nommée est une élaboration postérieure, attestée _verbatim_ au plus tard en 2007 (Tolk, Diallo & Turnitsa). `confirmé`

Le texte de 2003 dit textuellement _« Similar to the technical approaches, five levels of interoperability are defined »_, et ces niveaux sont _data-centric_ : L0 _System Specific Data_ (boîte noire, aucune interopérabilité) ; L1 _Documented Data_ (protocole commun, boîte noire à interface) ; L2 _Aligned Static Data_ (modèle de référence commun) ; L3 _Aligned Dynamic Data_ (méthodes d'ingénierie logicielle standard, UML) ; L4 _Harmonized Data (and Processes)_ (connexions sémantiques, modèle conceptuel). Le texte de 2003 ne contient ni _« seven levels »_, ni L5/L6, ni les étiquettes Technical/Syntactic/Semantic/Pragmatic/Dynamic comme noms de niveaux. La forme canonique 0–6 nommée n'apparaît, elle, qu'à partir de 2007 — Figure 1 du papier IIIS — et le papier de 2009 la réaffirme : _« The seven levels from no interoperability to conceptual interoperability are notated from L0 to L6 »_[^p1-3]. `confirmé`

Cette correction n'est pas un détail d'érudition : la monographie s'appuie sur la forme canonique 0–6 (où le palier sémantique L3 est le pivot du « sens »), mais elle doit le faire en sachant que cette forme est une _élaboration de 2006–2007_, non l'énoncé de 2003. Attribuer la forme nommée à 2003 — erreur courante — fausserait la généalogie sur laquelle s'adosse l'argument des trois ruptures.


***Tableau — LCIM 2003 (original, data-centric) vs forme canonique 0–6 (≥ 2007). Sources primaires : Tolk & Muguira 2003 ; Tolk/Diallo/Turnitsa 2007.***

| **Niveau** | **LCIM 2003 (Tolk & Muguira) — data-centric** | **LCIM canonique ≥ 2007 (Tolk/Diallo/Turnitsa) — nommé** |
| --- | --- | --- |
| L0 | System Specific Data (no interop., black box) | None (stand-alone systems) |
| L1 | Documented Data (protocole commun, black box + interface) | Technical (bits and bytes ; protocoles définis) |
| L2 | Aligned Static Data (modèle de référence commun) | Syntactic (structure / format de données communs) |
| L3 | Aligned Dynamic Data (UML, génie logiciel std) | Semantic (contenu de l'échange non ambigu) |
| L4 | Harmonized Data (and Processes) (connexions sémantiques, modèle conceptuel) | Pragmatic (méthodes/procédures, contexte d'usage) |
| L5 | — (absent en 2003) | Dynamic (changements d'état ; hypothèses/contraintes dans le temps) |
| L6 | — (absent en 2003) | Conceptual |
| **Nb niveaux** | **5 (L0–L4)** `confirmé` | **7 (L0–L6)** `confirmé` |
| **Triade I/I/C** | absente (« integratability » non présent) | présente ; origine « Page et al. » (Modeling/Simulation/Network) |



Trois précisions de source accompagnent ce tableau et ne doivent pas être lissées. D'abord, la triade _integratability / interoperability / composability_ est mappée sur le LCIM en 2007 (et non « 2011 » : la date 2011 du miroir ODU Digital Commons est une métadonnée de dépôt) ; son origine est créditée à _« Page et al. »_, le terme _integratability_ étant absent des papiers de 2003 et 2009. Ensuite, le mapping _verbatim_ est : Modeling/Abstraction ↔ composability ; Simulation/Implementation ↔ interoperability ; Network/Connectivity ↔ integratability — ce dernier confirmant que connectivité et interopérabilité sont des couches distinctes. Enfin, la formule fréquemment citée _« composability is the realm of the model… interoperability is the realm of the software implementation… integratability addresses the hardware/configuration side of connectivity »_ n'a _pas_ été trouvée _verbatim_ dans le papier primaire de 2007 ; son statut est `à vérifier` (piste : Tolk (éd.), _Engineering Principles of Combat Modeling and Distributed Simulation_, Wiley, 2012). Ne pas attribuer ce phrasage exact sans vérification.

#### 1.4 Ce que « agentique » ajoute : un précurseur pré-LLM, une rupture qui reste

_Insight._ La lignée LCIM invoquait déjà des _« intelligent software agents using the Internet »_ en 2007 — un précurseur historique réel, mais _pré-LLM_ : il ne mentionne aucun grand modèle de langage. L'interopérabilité « agentique » au sens de cette monographie n'est donc pas un néologisme sans ascendance, mais elle introduit une rupture que le LCIM classique ne thématise pas : le passage de la composition déterministe à la _délégation_ vers un agent au comportement probabiliste.

Le papier de 2007 comporte une section _« Motivation for Agent Mediated Decision Support »_ et exige que _« the agent must be aware of the assumptions and constraints underlying the model »_ — exigence qui relève des niveaux supérieurs (pragmatique, dynamique, conceptuel) de l'échelle. Cette filiation « agents ↔ niveaux supérieurs du LCIM » précède de près de deux décennies l'agentique _LLM_ et offre un ancrage historique au cadre — à présenter comme analogie et précurseur, jamais comme équivalence. `confirmé`

Ce qui change avec les agents _LLM_, et que le précurseur de 2007 ne capture pas, est la troisième des déterministe→probabiliste, syntaxique→sémantique, composition→délégation : _composition → délégation_. Un système classique _compose_ des comportements dont les garanties sont connues et héritables ; un système agentique _délègue_ une part de la décision à un agent dont la sortie est probabiliste et susceptible de _drift_. C'est ce déplacement qui motive le CIA — son algèbre d'héritage de garanties, ses types de session probabilistes/tolérants au _drift_, sa mécanisation Lean 4 et son banc empirique _AgentMeshKafka_ — et qui justifie l'existence même de τ comme opérateur de _dispatch_ entre régime déterministe et régime probabiliste, avec une troisième issue, τ‑Refus, lorsque ni l'un ni l'autre régime n'est sûr. Les règles précises de l'algèbre et la mécanisation appartiennent au corpus mère.


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère la formulation exacte de la rupture composition → délégation et son couplage aux deux autres ruptures (la thèse étant le _couplage_, non trois axes indépendants) ; reprendre l'analogie directrice `M(pi)` / π-calcul ainsi que les règles de l'algèbre d'héritage de garanties du CIA et l'état de la mécanisation Lean 4. Ne pas reconstruire ces éléments à partir du présent dossier empirique.


Schématiquement, la définition opérationnelle retenue articule les trois notions et le point d'entrée de τ de la manière suivante (vue conceptuelle, non normative) :

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

#### Questions ouvertes

- _Source exacte de la formule « realm of the model… »._ Localiser la source primaire du phrasage _« composability is the realm of the model / interoperability is the realm of the software implementation / integratability addresses the hardware-configuration side of connectivity »_ — `à vérifier` ; pistes : Tolk (éd.), Wiley 2012 ; publications Diallo/Tolk 2010–2013. À ne pas citer _verbatim_ sans confirmation.
- _Datation de l'apparition des 7 niveaux nommés._ Le papier de 2007 présente la forme 0–6 comme _« current version… documented in [16_ »] ; identifier la référence [16] (Turnitsa/Tolk ?) pour dater le _premier_ document attestant les sept niveaux nommés (probablement 2006). `probable`
- _Turnitsa (2005), « Extending the LCIM »._ Confirmer par _fetch_ primaire la venue exacte (IEEE SCSC ?), la pagination, et surtout _ce qu'il ajoute_ précisément (passage de 5 à 7 niveaux ? introduction des étiquettes nommées ?). Statut actuel : `probable`, confirmé par recherche mais non par source primaire.
- _Frontière « sens » et seuils de D‑Sens._ À quel score D‑Sens (palier sémantique) la frontière « sens préservé » est-elle franchie de façon défendable, et comment ce seuil interagit-il avec D‑Autorité et D‑Invariant ? Question renvoyée au traitement canonique de τ (corpus mère, chap. III.8) ; mentionnée ici comme charnière entre la définition du Ch. 1 et la rupture syntaxique → sémantique du Ch. 3.
- _Statut de I4 (Hypothèse)._ L'invariant I4 (Hypothèse) reste une hypothèse (campagne empirique non concluante) ; son énoncé précis et ceux de I1 (Hypothèse), I2 (Hypothèse), I3 (Hypothèse), I5 (Hypothèse) proviennent du corpus mère et ne sont pas fixés dans ce chapitre.



### Ch. 2 — L'entreprise agentique : frontière conceptuelle, autonomie et risque d'exécution

L'entreprise agentique ne se distingue pas de l'automatisation classique par une capacité supérieure, mais par un **déplacement du lieu et du moment du risque** : l'agent produit des trajectoires multi-étapes à effets externes, de sorte que les risques importants émergent **durant l'exécution** et non plus, comme pour le _robotic process automation_ (RPA), à la conception ou au déploiement. Ce déplacement n'est pas une nuance opérationnelle : il est la motivation empirique directe de l'opérateur τ (Partie II, Ch. 5) — qui statue, instant par instant, sur l'admissibilité d'une action — et de la discipline de résilience _runtime_ (Ch. 16). La cartographie de référence du paysage déployé, le _2025 AI Agent Index_, documente 30 systèmes agentiques de pointe et situe déjà les agents navigateurs en régime d'autonomie L4–L5, c'est-à-dire à intervention humaine limitée _en cours d'exécution_.[^p1-4] [^p1-5]

#### 2.1 Définition opératoire : l'agent comme producteur de trajectoires

Un agent d'entreprise, au sens retenu ici, est un système qui _planifie_, _utilise des outils_, _maintient un état_ et _produit des trajectoires multi-étapes à effets externes_, sans approbation humaine par étape. Cette caractérisation — confirmée dans la littérature primaire sur les contrôles d'exécution[^p1-6] — est **opératoire** plutôt qu'ontologique : elle ne demande pas si le système « comprend », mais ce qu'il _fait advenir_ dans l'environnement entre deux points d'observation humaine.

Trois propriétés distinctives en découlent, et c'est leur _conjonction_, non chacune isolément, qui définit le régime agentique. La première est l'_adaptation au but_ : le flux de travail est réorganisé autour d'un objectif plutôt qu'exécuté selon une séquence fixe. La deuxième est la _portée multi-système_ : l'agent franchit les frontières applicatives qu'un automate déterministe traiterait comme des silos. La troisième — la plus lourde de conséquences — est l'_irréversibilité partielle des effets_ : certaines actions de la trajectoire (un transfert, un envoi, une écriture transactionnelle) sont engagées avant que l'humain n'observe le résultat. Cette troisième propriété est le pivot : elle transforme une question de _qualité_ (la sortie est-elle correcte ?) en une question de _sûreté temporelle_ (l'action a-t-elle été engagée alors qu'elle aurait dû être refusée ou différée ?). C'est précisément l'enjeu que τ adresse en déplaçant l'instant de fixation du sens _t_fix</sub>(g) sans altérer la grandeur traitée.

Cette définition reste **opératoire et provisoire** : la frontière de l'agentique ne se trace pas par une propriété binaire mais par un degré d'autonomie, que la §2.3 mesure sur l'échelle L1–L5 de l'Index.

#### 2.2 Frontière avec l'automatisation classique et le RPA

Le RPA et l'automatisation agentique ne diffèrent pas par le degré de sophistication mais par le _régime de causalité_ : le premier exécute des règles prédéfinies déterministes sur des tâches identiques mono-système et ne s'adapte pas ; le second réorganise le flux autour d'un raisonnement autonome adaptatif multi-système, et agit sans approbation par étape. Cette distinction est **probable** plutôt que **confirmée** : elle fait consensus dans la pratique, mais son substrat documentaire reste très majoritairement éditeur ou marketing[^p1-7] [^p1-8] — d'où une **divergence de niveau de preuve** assumée avec les sources académiques mobilisées ailleurs dans la monographie. **À vérifier** (question ouverte, §2.5) : un substrat académique _peer-reviewed_, sous forme de taxonomie d'autonomie, reste à substituer au substrat marketing pour porter l'argument au niveau doctoral.

L'enjeu théorique de cette frontière est direct. La rupture `composition→délégation` (l'une des déterministe→probabiliste, syntaxique→sémantique, composition→délégation couplées) se lit exactement ici : le RPA _compose_ des étapes spécifiées à l'avance — l'auteur du flux conserve l'autorité sur chaque transition ; l'agent _délègue_ le choix de la prochaine action à un raisonnement probabiliste — l'autorité de transition migre du concepteur vers le système, _à l'exécution_. La délégation est donc ce qui distingue ontologiquement l'agent du RPA, et c'est aussi ce qui rend la dimension `D-Autorité` (autorité de l'appelant × autorité requise par la cible) constitutive de l'entrée de τ : sans délégation, il n'y aurait pas d'autorité à arbitrer à chaque étape.


***Tableau — Tableau 2.1 — RPA contre automatisation agentique. La dernière ligne — déplacement du risque vers l'exécution — est la motivation empirique de τ (Ch. 5) et de la résilience _runtime_ (Ch. 16). Distinction **probable**, substrat éditeur/marketing.***

| **Dimension** | **RPA (déterministe)** | **Automatisation agentique** |
| --- | --- | --- |
| Logique de contrôle | Règles fixes, prédéfinies | Raisonnement autonome adaptatif |
| Portée systémique | Mono-système, tâches identiques | Multi-système, flux réorganisé autour du but |
| Adaptation | Aucune | Réorganisation dynamique vers l'objectif |
| Source d'autorité de transition | Concepteur (à la conception) | Système délégataire (à l'exécution) |
| Approbation humaine | Sans objet (déterministe) | Agit sans approbation par étape |
| Régime de la rupture | Composition | Délégation |
| Niveau d'autonomie (échelle Index) | — | L1–L5 ; navigateurs en L4–L5 |
| Localisation du risque | Conception / déploiement | **Exécution** (trajectoires à effets externes) |



#### 2.3 Niveaux d'autonomie et localisation empirique du risque

Le risque agentique n'est pas un attribut de classe mais une _fonction du niveau d'autonomie effectivement déployé_, et l'Index montre que ce niveau est déjà élevé en production. L'échelle L1–L5 du _2025 AI Agent Index_ gradue l'intervention humaine : les agents navigateurs opèrent en L4–L5 (intervention limitée en cours d'exécution), tandis que les agents d'entreprise _glissent_ de L1–L2 au stade conception vers L3–L5 au stade déploiement.[^p1-9] Ce glissement conception→déploiement est l'observation empirique centrale du chapitre : l'autonomie réellement concédée en production excède celle prévue sur la planche à dessin, ce qui décale d'autant la fenêtre où le risque devient observable.

Un **piège de datation** doit être signalé, conformément à la discipline d'horodatage. L'ouvrage s'intitule « 2025 AI Agent Index » (instantané des systèmes au 31 décembre 2025), mais sa préimpression arXiv (2602.17753) a été déposée le 19 février 2026 (v1) et révisée le 6 mai 2026 (v2). Il faut citer l'_année de l'instantané_ (2025) distinctement de l'_année de publication_ (2026) ; la date arXiv exacte est 2026-02-19 / 2026-05-06, et non « le 7 mai » que reproduisent certaines listes. **Confirmé**, en date de juin 2026.

La thèse de risque qui structure le chapitre — « _risks emerge during execution_ » — est **confirmée** dans la littérature primaire.[^p1-10] En revanche, son _cadrage fin_ — l'existence d'un « écart temporel entre l'initiation d'actions irréversibles et l'observation/intervention humaine » — n'est **pas** une citation verbatim et demeure **probable**. La distinction importe : on tient la _localisation_ du risque (à l'exécution) ; on infère, sans le citer mot pour mot, le _mécanisme_ (la fenêtre temporelle d'irréversibilité). C'est sur cet inféré, marqué comme tel, que reposent τ et la garde-fou _runtime_ ; la monographie ne doit pas le durcir en acquis.

L'ampleur opérationnelle de cet écart se lit dans les chiffres d'industrialisation. Le _2026 AI Index Report_ de Stanford rapporte un taux de réussite de 66,3 % sur le banc OSWorld[^p1-11] ; une lecture secondaire en tire que « 89 % » des agents n'atteindraient jamais la production[^p1-12] — chiffre **à vérifier** dans le corps du rapport primaire (piste : volet « coût/déploiement », ~423 pages). Quelle que soit la valeur exacte, l'écart entre capacité démontrée en banc et fiabilité en production confirme que le risque résiduel se concentre là où l'humain n'observe plus : à l'exécution.

#### 2.4 Écosystème d'acteurs : du recensement à l'outillage du risque d'exécution

L'écosystème de l'entreprise agentique se structure, en date de juin 2026, autour de trois cercles d'acteurs dont aucun ne préexistait à 2025 sous cette forme, et dont la production converge vers un même objet : _outiller le risque d'exécution_. Le premier cercle est celui du _recensement_ : le MIT AI Agent Index cartographie les systèmes déployés et leur niveau d'autonomie (refs. ci-dessus) ; Stanford HAI en mesure la performance agrégée (ref. ci-dessus). Le deuxième est celui de la _normalisation du risque_ : l'OWASP GenAI Security Project publie un _Top 10 for Agentic Applications_ (catégories ASI01–ASI10)[^p1-13] ; le NIST/CAISI cadre la surveillance post-déploiement (NIST AI 800-4, détaillé au Ch. 16)[^p1-14] ; la Cloud Security Alliance prépare un _Agentic Profile_ du NIST AI RMF (Tier 1–4) qui cite un « IR 8596 »[^p1-15] — _IR 8596 étant à vérifier_ sur le NIST CSRC (piste : csrc.nist.gov/publications), aucun document NIST de ce numéro n'étant confirmé en date de juin 2026. Le troisième cercle est celui de l'_instrumentation_ : une science émergente de la fiabilité des agents (Princeton HAL — 4 dimensions, 12 métriques)[^p1-16] et des cadres d'évaluation d'entreprise multi-dimensionnels (CLEAR)[^p1-17] cherchent à mesurer ce que l'accuracy en banc ne capte pas.

Un acteur de ce troisième cercle mérite une mention dédiée, car il préfigure directement la posture du CIA. La _harness_ DFAH (_Determinism-Faithfulness Assurance Harness_) pour agents financiers utilisant des outils propose un mécanisme de _rejouabilité_ : journaliser la trajectoire pour pouvoir la rejouer de façon déterministe et en contrôler la fidélité.[^p1-18] L'analogie est frappante : tout comme le Calcul d’Intégration Agentique (CIA) cherche à _ponter_ la garantie déterministe (Kafka/MQ) et le comportement probabiliste de l'agent _LLM_, DFAH tente d'imposer un _socle déterministe vérifiable_ sous une trajectoire probabiliste. Que ces efforts convergent de façon indépendante corrobore — sans la démontrer — la pertinence de la posture canonique du CIA.


***Tableau — Tableau 2.2 — Écosystème d'acteurs de l'entreprise agentique (en date de juin 2026), ordonné par cercle. La convergence du cercle « instrumentation » vers la rejouabilité déterministe corrobore la posture du CIA (Ch. 6).***

| **Acteur / artefact** | **Cercle** | **Objet** | **Statut (juin 2026)** |
| --- | --- | --- | --- |
| MIT AI Agent Index | Recensement | Cartographie autonomie L1–L5, 30 systèmes | _Confirmé_ |
| Stanford HAI — AI Index 2026 | Recensement | Performance agrégée (OSWorld 66,3 %) | _Confirmé_ ; « 89 % » _à vérifier_ |
| OWASP — Top 10 Agentic (ASI01–10) | Normalisation du risque | Taxonomie de menaces agentiques | _Confirmé_ |
| NIST / CAISI — AI 800-4 | Normalisation du risque | 6 catégories de surveillance (cf. Ch. 16) | _Confirmé_ |
| CSA — Agentic Profile (NIST AI RMF) | Normalisation du risque | Profil Tier 1–4 ; cite « IR 8596 » | Draft ; IR 8596 _à vérifier_ |
| Princeton HAL — AI Agent Reliability | Instrumentation | 4 dimensions, 12 métriques de fiabilité | _Preprint_ |
| CLEAR (Mehta) | Instrumentation | Évaluation d'entreprise multi-dimensionnelle | _Preprint_, auteur indépendant |
| DFAH (Khatchadourian) | Instrumentation | Rejouabilité déterministe d'agents-outils | _Preprint_ ; préfigure le CIA |



Le rattachement au canon doit rester **par référence**, non par redéfinition. Les énoncés précis et les statuts des invariants réfutables `I1`, `I2`, `I3`, `I5` — qui formaliseraient ce que l'écosystème ci-dessus tente d'établir empiriquement — ne sont pas reproductibles ici sans risque de dérive.


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère les énoncés exacts et les statuts (`Confirmé` | `Hypothèse` | `Réfuté`) de `I1`, `I2`, `I3`, `I5` ; les rattacher à l'ancrage empirique du présent chapitre (Index L1–L5, taxonomie OWASP, écart capacité/production de Stanford). Ne pas les inventer ici.


L'un d'eux est toutefois explicitement **à statut** dans le canon et structure la prudence du chapitre : I4 (Hypothèse). La campagne empirique correspondante n'étant pas concluante, aucune affirmation du présent chapitre — en particulier sur l'ampleur exacte de l'écart d'exécution ou sur le « 89 % » non production — ne doit être présentée comme la validant.

#### 2.5 Schéma de positionnement : où τ intercepte la trajectoire

Le risque d'exécution se prête à un positionnement schématique : entre deux points d'observation humaine, chaque action de la trajectoire franchit — ou non — un point de décision où opérateur τ statue. Le schéma de séquence ci-dessous situe ce point d'interception ; il fixe le _lieu_ logique de τ dans le cycle d'une trajectoire agentique, sans en dériver la sémantique (définition canonique complète : chap. III.8 du corpus mère).

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

La lecture du schéma tient en une phrase : τ ne juge pas la _correction_ de la sortie de l'agent, il arbitre, à chaque étape de la fenêtre `[t0, t1]`, entre trois issues — Decision ∈ {Déterministe, Probabiliste, Refus} — selon ses trois dimensions d'entrée, et c'est l'issue τ‑Refus qui interrompt l'irréversibilité avant qu'elle ne s'engage. Les **règles précises** de cet arbitrage (seuils, composition des dimensions, sémantique formelle du déplacement de _t_fix</sub>(g)) ne sont pas reconstituées ici.


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère (chap. III.8) la définition formelle complète de τ : composition des dimensions `D-Sens` / `D-Autorité` / `D-Invariant`, règle de production de Decision ∈ {Déterministe, Probabiliste, Refus}, et formalisation du déplacement de l'instant de fixation du sens _t_fix</sub>(g). Reprendre de même l'algèbre d'héritage de garanties et les types de session probabilistes/tolérants au _drift_ du CIA (composants, règles, mécanisation Lean 4, banc `AgentMeshKafka`). Ne rien fabriquer de ce contenu formel ici.


#### Questions ouvertes

- **Substrat académique de la frontière RPA/agentique.** La distinction RPA contre agentique reste **probable** sur substrat éditeur/marketing ; une taxonomie d'autonomie _peer-reviewed_ doit la remplacer pour l'argument doctoral. La **divergence de niveau de preuve** avec les sources académiques de la monographie est assumée et non lissée (piste : recensions d'échelles d'autonomie hors corpus marketing).
- **Cadrage de l'écart temporel.** La localisation du risque à l'exécution est **confirmée** ; le mécanisme « écart temporel entre action irréversible et observation humaine » demeure **probable** (inféré, non verbatim). Toute formalisation de τ bâtie sur ce mécanisme hérite de ce statut tant que le corpus mère n'en consigne pas la condition de réfutation.
- **Chiffre d'industrialisation.** Le « 89 % des agents n'atteignent jamais la production » est **à vérifier** dans le corps du _2026 AI Index Report_ (source primaire Stanford HAI) ; seule la valeur OSWorld 66,3 % est confirmée.
- **Référence normative non résolue.** L'« IR 8596 » cité par le _Agentic Profile_ de la CSA est **à vérifier** sur le NIST CSRC ; aucun document NIST de ce numéro n'est confirmé en date de juin 2026.
- **Invariants canoniques.** Les énoncés et statuts de `I1`, `I2`, `I3`, `I5` (et la non-validation de I4 (Hypothèse)) restent à reprendre du corpus mère (encadré ci‑dessus ci-dessus) ; ils ne doivent pas être inventés depuis l'ancrage empirique du présent chapitre.



### Ch. 3 — Les trois ruptures conceptuelles couplées

**Insight-clé.** Le passage des systèmes d'intégration d'entreprise classiques aux systèmes agentiques ne se décrit pas par un progrès graduel sur un seul axe, mais par trois ruptures simultanées — déterministe→probabiliste, syntaxique→sémantique, composition→délégation — dont la thèse centrale de cette monographie est qu'elles sont **couplées** : aucune ne peut être absorbée isolément par l'ingénierie existante, parce que franchir l'une force à franchir les deux autres. Concrètement, déléguer une tâche à un agent _LLM_ (rupture composition→délégation) le place hors du périmètre où le substrat garantit l'_exactly-once_ (rupture déterministe→probabiliste), et ce déplacement n'a de sens opérationnel que parce que la décision d'agir repose désormais sur le **contenu** interprété du message et non sur sa forme (rupture syntaxique→sémantique). Ce chapitre établit les trois ruptures, les ancre chacune sur un fait empirique daté (en date de juin 2026), puis **démontre** leur couplage. Le formalisme qui opérationnalise ce couplage — l'opérateur τ au Ch. 5, le CIA au Ch. 6 — est ici annoncé, non développé.

#### 3.1 Pourquoi « trois ruptures » et non « un continuum de maturité »

**Insight-clé.** La tentation naturelle de l'architecte est de lire l'agentique comme un cran supplémentaire sur une échelle de maturité d'interopérabilité déjà connue ; cette lecture est fausse parce que les trois transformations ne sont pas ordonnables sur un même axe et ne se composent pas additivement.

L'échelle de référence du domaine — le LCIM (_Levels of Conceptual Interoperability Model_) — illustre précisément ce que la lecture « continuum » fait perdre. Dans sa forme canonique attestée dès 2007 (sept niveaux L0–L6 : None, Technical, Syntactic, Semantic, Pragmatic, Dynamic, Conceptual)[^p1-19], le LCIM ordonne des **degrés de préservation du sens** dans un échange. Il fonde la frontière normative — `confirmé` par les sources primaires de 2003 et 2007 — entre l'interopérabilité (échange où le sens est **préservé**) et la simple intégration/connectivité technique (les octets transitent)[^p1-20]. Mais le LCIM, y compris dans la lignée qui invoquait dès 2007 les « _intelligent software agents_ » (agents **classiques, pré-LLM** ; aucune mention de grands modèles de langage — `confirmé`)[^p1-21], reste un modèle **monodimensionnel** : il mesure une qualité (le sens partagé) le long d'une seule progression. Or les trois ruptures relèvent de trois plans hétérogènes :


***Tableau — Trois plans hétérogènes — les ruptures ne sont pas ordonnables sur un axe unique.***

| **Rupture** | **Plan transformé** | **Avant (intégration classique)** | **Après (système agentique)** |
| --- | --- | --- | --- |
| déterministe→probabiliste | Garantie d'exécution | Livraison et traitement à garantie forte (_exactly-once_ transactionnel) | Action non rejouable à issue distribuée |
| syntaxique→sémantique | Base de la décision | Prédicat sur la forme/structure du message | Prédicat sur le contenu interprété |
| composition→délégation | Mode d'assemblage | Orchestration de fonctions au comportement fixé | Délégation d'un but à un agent autonome |



Le point décisif : ces trois plans sont indépendants **par construction conceptuelle** — on peut imaginer chacun isolément — mais ils deviennent **solidaires en pratique** dès qu'on instancie un agent _LLM_ dans une chaîne d'entreprise réelle. C'est cette solidarité, et non l'existence séparée des trois axes, qui constitue la thèse (§3.5).

#### 3.2 Rupture 1 — déterministe → probabiliste

**Insight-clé.** La rupture déterministe→probabiliste n'est pas une affirmation philosophique sur la « créativité » des modèles ; elle est **mesurable** à une frontière d'ingénierie précise et documentée — le bord du périmètre où le substrat de messagerie cesse de garantir l'_exactly-once_.

L'ancrage empirique est la sémantique _exactly-once_ (EOS) d'Apache Kafka. EOS existe depuis Kafka 0.11 (juin 2017, KIP-98 : producteur idempotent, transactions inter-partitions atomiques, consommateur `read_committed`)[^p1-22] (`confirmé`), et la défense transactionnelle côté serveur (KIP-890) est active par défaut depuis Kafka 4.0 (18 mars 2025)[^p1-23] (`confirmé`). La version courante en date de juin 2026 est Kafka 4.3.0 (22 mai 2026), la ligne 4.2.x étant maintenue en parallèle (4.2.1, 30 mai 2026)[^p1-24] (`confirmé`).

Le fait structurant est une **borne** de cette garantie, énoncée verbatim par Confluent : l'EOS est circonscrite au périmètre interne **read-process-write** de Kafka ; **tout appel RPC externe — magasin distant, API _LLM_, courriel, paiement — n'est pas garanti _exactly-once_**[^p1-25] (`confirmé`, verbatim Confluent). La rupture est exactement là : un agent _LLM_, par définition, **agit par appels externes** (il invoque un outil, émet une requête, déclenche un effet). Son action tombe donc, structurellement, du mauvais côté de la frontière de garantie.


***Tableau — Frontière de garantie EOS — ancrage empirique de la rupture déterministe→probabiliste (d'après Confluent, 2025-2026).***

| **Périmètre** | **Garantie EOS Kafka** | **Implication agentique** |
| --- | --- | --- |
| read-process-write **interne** Kafka | Oui (atomique, multi-partitions) | Substrat déterministe |
| Appel RPC externe (magasin distant, **API LLM**, courriel, paiement) | Non | Action probabiliste / non rejouable → ressort de l'opérateur τ |



Deux nuances doivent être préservées, non lissées. D'abord, le substrat **n'est pas** inutile dans le régime probabiliste : l'industrie le requalifie en **mémoire avec rejeu déterministe** — le journal devient mémoire _stateful_, avec DLQ portant `prompt-id`/`model-version`/`offset` et _transactional outbox_ + CDC Debezium pour borner les effets (verbatim Confluent, 5 mai 2026)[^p1-26] (`confirmé`). La rupture ne supprime pas le déterministe ; elle l'enserre autour d'un noyau probabiliste. Ensuite, des mécanismes de 2PC externe sont à l'étude (KIP-939, statut « Accepted », `transaction.two.phase.commit.enable` par défaut `false`) mais **aucune version d'intégration n'est spécifiée en date de juin 2026** → `à vérifier` maintenu[^p1-27]. La frontière reste donc, à ce jour, structurelle et non refermable par configuration.

L'opérateur τ prend précisément cette frontière comme domaine : il **dispatch** entre le régime déterministe (garantie de message) et le régime probabiliste (agent _LLM_), sa dimension d'entrée D‑Invariant traçant l'état des invariants de part et d'autre. Le mécanisme complet — définition canonique au chap. III.8 du corpus mère, instancié au Ch. 5 — n'est pas développé ici.

#### 3.3 Rupture 2 — syntaxique → sémantique

**Insight-clé.** La rupture syntaxique→sémantique déplace le **prédicat de décision** : là où l'intégration classique route et valide sur la forme du message (structure, format, schéma), le système agentique route et décide sur le **contenu interprété**, ce qui fait du score sémantique une grandeur de premier ordre et non un confort applicatif.

Le LCIM nomme déjà les deux paliers : L2 **Syntactic** (« _common structure… common data format_ ») et L3 **Semantic** (« _content of information exchange requests unambiguously defined_ »)[^p1-28] (`confirmé`). Les protocoles agentiques opèrent leur transport sur le palier syntaxique — MCP repose sur JSON-RPC 2.0, messages encodés en UTF-8, dans sa révision stable 2025-11-25[^p1-29] (`confirmé`) — mais la **décision d'agir** migre au palier sémantique. L'ancrage empirique le plus net est le routage sémantique. Le projet `semantic-router` (Aurelio Labs) instancie le **Message Router** classique des _Enterprise Integration Patterns_ en **remplaçant le prédicat de routage déterministe par une similarité vectorielle** ; verbatim : « _Rather than waiting for slow LLM generations to make tool-use decisions, we use the magic of semantic vector space to make those decisions, routing our requests using semantic meaning_ »[^p1-30] (`confirmé`). Le routage cesse d'être une fonction de la forme ; il devient une fonction de la **proximité de sens** dans un espace vectoriel.


***Tableau — Déplacement du prédicat de décision — du format au sens.***

| **Dimension** | **Régime syntaxique (intégration classique)** | **Régime sémantique (agentique)** |
| --- | --- | --- |
| Prédicat de routage | Champ / schéma / type de message | Similarité vectorielle au sens (`semantic-router`) |
| Critère de validité | Conformité de format (UTF-8, JSON-RPC, schéma) | Adéquation interprétée requête↔intention |
| Palier LCIM | L2 Syntactic | L3 Semantic (et au-delà) |
| Mode d'échec | Rejet déterministe (malformé) | Faux positif / dérive sémantique (_drift_) |



La conséquence formelle est centrale pour la suite : le sens devient une **grandeur mesurée**, le score sémantique sur `[0, 1]`, soit la dimension d'entrée D‑Sens de l'opérateur τ. C'est aussi le lieu d'un nouveau mode d'échec absent du régime syntaxique : non plus le message malformé rejeté de manière déterministe, mais le faux positif sémantique et la dérive (_drift_) — d'où la conception, au CIA, de types de session **tolérants au _drift_**. Cette migration recouvre la transformation la plus subtile de la pile : ce que l'opérateur τ formalise sous le nom de déplacement de l'instant de fixation du sens _t_fix</sub>(g) — le sens n'est plus arrêté à la compilation/au contrat, mais à l'exécution, par l'interprétation. La construction canonique de _t_fix</sub>(g) relève du Ch. 5 et n'est pas reprise ici.


> ⟢ ***À reprendre du corpus mère*** — Énoncé(s) d'invariant(s) du corpus mère portant sur la conservation/dégradation du sens à travers _t_fix</sub>(g) (candidats I2 (à confirmer), I3 (à confirmer) — énoncés et statuts NON fournis dans le dossier d'état de l'art). Ne pas fabriquer : reprendre tels quels du corpus mère, avec statut explicite.


#### 3.4 Rupture 3 — composition → délégation

**Insight-clé.** La rupture composition→délégation change la **nature de l'assemblage** : on ne compose plus des fonctions au comportement fixé (entrée→sortie déterministe), on délègue un but à un agent autonome dont l'exécution est ouverte ; le paysage protocolaire de juin 2026 **acte cette distinction dans sa propre stratification**.

L'ancrage empirique est la séparation, devenue structurelle, entre deux familles de protocoles. MCP régit l'**accès aux outils** — primitives serveur `{Resources, Prompts, Tools}`, primitives client `{Sampling, Roots, Elicitation}` — c'est-à-dire la mise à disposition de capacités **composables** à un agent[^p1-31] (`confirmé`). A2A (Agent2Agent) régit la **délégation inter-agents** — message/tâche d'un agent à un autre — avec sa première version stable v1.0 le 12 mars 2026 (_Signed Agent Cards_, support multi-tenant)[^p1-32] (`confirmé`), après transfert à la Linux Foundation le 23 juin 2025[^p1-33] (`confirmé`) et absorption d'ACP/IBM (fusion août 2025)[^p1-34] (`confirmé`, historique).

Le constat clé, `probable` en date de juin 2026 : la convergence du paysage s'est faite **par stratification sous la Linux Foundation, non par unification monolithique**[^p1-35] — A2A = message/tâche inter-agents (délégation) ; MCP = accès outils (composition) ; AGNTCY = annuaire/identité/transport/observabilité ; AG-UI/A2UI = interface usager. Que l'écosystème ait spontanément séparé « accès outils » (MCP) de « délégation inter-agents » (A2A) est l'attestation empirique que composition et délégation sont des régimes **distincts**, exigeant des contrats distincts.


***Tableau — Composition (MCP) vs délégation (A2A) — distinction actée par la stratification protocolaire.***

| **Axe** | **Composition (MCP — accès outils)** | **Délégation (A2A — inter-agents)** | **Source / statut** |
| --- | --- | --- | --- |
| Unité assemblée | Outil / ressource / prompt | Tâche confiée à un agent | Spécs MCP / A2A — `confirmé` |
| Garantie de comportement | Contrat d'outil (entrée→sortie typée) | But poursuivi, exécution ouverte | `confirmé` / inhérent |
| Découverte | Primitives serveur déclarées | _Agent Card_ (+ `AgentCardSignature`) | A2A v1.0 — `confirmé` |
| Gouvernance (juin 2026) | AAIF / Linux Foundation, rév. 2025-11-25 | Linux Foundation, v1.0 (12 mars 2026) | Communiqués LF — `confirmé` |



Une mutation en cours mérite d'être signalée car elle illustre la pression de la délégation sur l'architecture : MCP propose, via un _Release Candidate_ visant la version finale 2026-07-28, le passage d'un cœur explicitement _stateful_ (handshake `initialize`, `Mcp-Session-Id`) à un cœur **sans état**, pour permettre la scalabilité horizontale[^p1-36] (`probable`, statut RC non finalisé ; ses paramètres restent susceptibles d'évoluer d'ici la date cible). Cette refonte est annoncée, non acquise : à re-vérifier après le 2026-07-28.

L'opérateur τ lit cette rupture par sa dimension D‑Autorité (autorité du contexte appelant × autorité requise par la cible) : déléguer, contrairement à composer, transfère une autorité d'agir, ce qui ouvre la classe d'échec du _confused deputy_ — précisément la raison du durcissement OAuth 2.1 / RFC 8707 de MCP (paramètre `resource` MUST, interdiction du _token passthrough_), durcissement empiriquement motivé par CVE-2025-49596 (CVSS v4.0 = 9.4 CRITICAL)[^p1-37] (`confirmé`). La formalisation de D‑Autorité et la sortie τ‑Refus (refus lorsque l'autorité est insuffisante) relèvent du Ch. 5.

#### 3.5 Le couplage : la thèse

**Insight-clé.** Les trois ruptures ne s'additionnent pas, elles s'impliquent : franchir l'une force, en pratique d'entreprise, à franchir les deux autres. C'est ce **couplage** — et non l'inventaire des trois axes — qui est la contribution thétique de la monographie et qui rend insuffisante toute réponse traitant un seul axe.

La démonstration est causale, non rhétorique. Suivons une chaîne d'entreprise minimale qui délègue une tâche à un agent _LLM_ :


***Figure — Chaîne de délégation : un seul franchissement entraîne les trois ruptures.***

,



L'enchaînement (1)→(2)→(3) est forcé, pas optionnel :

- **Délégation ⇒ probabiliste.** Confier un **but** (et non une fonction au comportement fixé) à un agent _LLM_ implique qu'il agira par appels externes, donc hors du périmètre _exactly-once_ du substrat (§3.2). On ne peut pas déléguer à un agent tout en gardant la garantie déterministe : la frontière EOS est franchie **du fait même** de la délégation.
- **Délégation ⇒ sémantique.** Un agent à qui l'on délègue un but doit **décider** quels outils composer pour l'atteindre ; cette décision est un routage sur le sens, pas sur la forme (§3.3). La délégation présuppose le prédicat sémantique D‑Sens.
- **Probabiliste ⇒ sémantique (et réciproquement).** L'action non rejouable n'est gouvernable que si l'on peut **qualifier** la requête avant de l'émettre (score sémantique, état des invariants) ; et le prédicat sémantique n'a d'enjeu que parce que l'action qu'il déclenche est non rejouable. Les deux paliers se tiennent.

Le couplage se lit aussi **en négatif**, dans l'insuffisance des réponses monodimensionnelles — argument central contre la lecture « continuum » de §3.1 :


***Tableau — Insuffisance des réponses monodimensionnelles — chaque axe pris seul laisse les deux autres ouverts.***

| **Réponse traitant un seul axe** | **Ce qu'elle règle** | **Ce que le couplage laisse non résolu** |
| --- | --- | --- |
| 2PC / transactions étendues (axe déterministe seul, ex. KIP-939) | Atomicité de l'effet externe | Le **quoi** appeler reste un choix sémantique faillible ; statut d'intégration `à vérifier` |
| Routage sémantique seul (axe sémantique) | Diriger la requête vers la bonne route | L'effet émis reste non rejouable ; aucune garantie d'exécution |
| Orchestration statique de fonctions (axe composition seul) | Comportement prévisible des sous-tâches | Interdit l'autonomie même qui motive la délégation |



C'est exactement la fonction de l'opérateur τ (Ch. 5) et du CIA (Ch. 6) que de traiter les trois ruptures **ensemble** : l'opérateur τ prend en entrée les trois dimensions correspondantes — D‑Sens (rupture sémantique), D‑Autorité (rupture délégation), D‑Invariant (rupture déterministe, état des invariants sur la trace) — et produit Decision ∈ {Déterministe, Probabiliste, Refus}, dispatchant entre régime déterministe, régime probabiliste, ou τ‑Refus. Le CIA fournit le cadre formel pontant garanties déterministes (Kafka/MQ) et comportement probabiliste d'agents _LLM_, via types de session probabilistes/tolérants au _drift_ et algèbre d'héritage de garanties, mécanisé en Lean 4 sur le banc _AgentMeshKafka_. Ni l'algèbre, ni la sémantique opérationnelle, ni le code Lean ne sont reproduits ici.


> ⟢ ***À reprendre du corpus mère*** — Énoncés précis et statuts des invariants réfutables I1, I2, I3, I5 du corpus mère (I4 (Hypothèse) = Hypothèse, campagne empirique non concluante — à ne jamais présenter comme acquis). Règles de l'algèbre d'héritage de garanties et extraits Lean 4 du CIA. Aucun de ces contenus formels n'est fourni par le dossier d'état de l'art (qui couvre l'ancrage empirique, non le formalisme canonique) → reprendre intégralement du corpus mère, ne pas fabriquer (CLAUDE.md §10).


#### 3.6 Portée et limites de la thèse du couplage

**Insight-clé.** Le couplage est une thèse **réfutable** : il suffirait, pour l'affaiblir, qu'une réponse monodimensionnelle robuste neutralise les deux autres axes ; en date de juin 2026, aucune ne le fait, mais deux fronts sont à surveiller.

La condition de réfutation est explicite. Le couplage serait **réfuté** si l'on exhibait un mécanisme traitant un seul axe et fermant les deux autres sans effet de bord — par exemple un 2PC externe généralisé qui rendrait l'action d'agent rejouable **et** dispenserait du prédicat sémantique. Or (i) le 2PC externe Kafka reste non livré (`à vérifier`, §3.2), et (ii) même livré, il n'adresserait pas le choix sémantique du **quoi** appeler. Le couplage tient donc, en date de juin 2026, mais comme énoncé **à condition de réfutation nommée**, non comme vérité acquise.

Deux nuances de traçabilité doivent rester visibles. D'abord, l'ancrage de la rupture sémantique sur le pontage « patrons classiques ↔ patrons agentiques » s'appuie sur une analogie largement **reconstruite par la littérature secondaire/académique** (surveys arXiv) et **non revendiquée par les sources primaires éditeur** (Anthropic ne cite pas les _Enterprise Integration Patterns_) — `confirmé`[^p1-38]. La filiation `semantic-router` ↔ Message Router est, elle, directe et `confirmé`. Ensuite, l'attribution de déploiements en **production** nominatifs sur A2A au-delà des communiqués de fondation reste `à vérifier` (les organisations sont listées comme _supporting_, non comme exploitants nommés)[^p1-39] : la rupture composition→délégation est attestée **au plan protocolaire** (la stratification existe), son ampleur **en production** l'est moins.

#### 3.7 Questions ouvertes

- **Réfutabilité du couplage.** Existe-t-il, ou émergera-t-il, un mécanisme monodimensionnel (typiquement un 2PC externe généralisé, KIP-939 + suites) qui neutraliserait les deux autres axes ? **Vérification** : suivre le statut d'intégration de KIP-939 et FLIP-319 (Apache Flink) ; à ce jour version d'intégration non spécifiée (`à vérifier`).
- **Stabilité de l'ancrage protocolaire.** Le RC MCP 2026-07-28 (cœur sans état) sera-t-il publié sans modification substantielle, et la stratification A2A/MCP/AGNTCY tiendra-t-elle, ou une réunification altèrera-t-elle la lecture composition vs délégation ? **Vérification** : re-balayer _Releases_/changelog après le 2026-07-28.
- **Ancrage formel du couplage.** L'analogie directrice du CIA est M(π)/π-calcul, alors que l'état de l'art récent (MSC/automates communicants, mécanisations Lean 4/Rocq) privilégie les supports d'implémentabilité décidable. Faut-il **compléter** l'ancrage π-calcul par un ancrage MSC/CFSM ? Question ouverte à arbitrer au Ch. 6 ; hors périmètre de ce chapitre.
- **Statut empirique des invariants.** Les énoncés et statuts de I1, I2, I3, I5 (et la confirmation que I4 (Hypothèse) demeure Hypothèse) conditionnent la force de la thèse ; ils sont à reprendre du corpus mère et à confronter au banc _AgentMeshKafka_ (cf. 
> ⟢ ***À reprendre du corpus mère*** — supra, §3.5
).
- **Portée en production.** Au-delà des communiqués de fondation, des études de cas éditeurs/_peer-reviewed_ attestent-elles nominativement des déploiements agentiques en production qui exercent réellement les trois ruptures couplées ? `à vérifier`.

[^p1-1]: The Levels of Conceptual Interoperability Model — Tolk & Muguira — 2003 Fall Simulation Interoperability Workshop (paper 03F-SIW-007) — septembre 2003 — https://www.mscoe.org/content/uploads/2017/12/Tolk-Muguira-The-Levels-of-Conceptual-Interoperability-Models.pdf
[^p1-2]: Applying the LCIM in Support of Integratability, Interoperability, and Composability for SoS Engineering — Tolk, Diallo & Turnitsa — Journal of Systemics, Cybernetics and Informatics, Vol. 5 No 5 (IIIS), ISSN 1690-4524 — 2007 — https://www.iiisci.org/journal/pdv/sci/pdfs/p468106.pdf
[^p1-3]: The Levels of Conceptual Interoperability Model: Applying Systems Engineering Principles to M&S — Wang, Tolk & Wang — arXiv / SpringSim'09 (SCS), San Diego — 2009 — https://arxiv.org/pdf/0908.0191
[^p1-4]: The 2025 AI Agent Index: Documenting Technical and Safety Features of Deployed Agentic AI Systems — Staufer, Feng, Wei et al., arXiv 2602.17753 (v1 2026-02-19 / v2 2026-05-06), à paraître ACM FAccT '26 — https://arxiv.org/abs/2602.17753
[^p1-5]: Further Details — 2025 AI Agent Index (échelle L1–L5, 30 systèmes / 6 catégories, instantané 31 déc. 2025) — MIT AI Agent Index, 2026 — https://aiagentindex.mit.edu/2025/further-details/
[^p1-6]: From Governance Norms to Enforceable Controls: A Layered Translation Method for Runtime Guardrails in Agentic AI — Christopher Koch, arXiv 2604.05229, 2026-04-06 — https://arxiv.org/abs/2604.05229
[^p1-7]: Agentic automation vs RPA: what actually changes for enterprise IT — Mindflow (éditeur — marketing), 2025 — https://mindflow.io/blog/agentic-automation-vs-rpa-what-actually-changes-for-enterprise-it
[^p1-8]: What are Agentic Workflows? The 2026 Enterprise Guide — Automation Anywhere (éditeur — marketing), 2026 — https://www.automationanywhere.com/rpa/agentic-workflows
[^p1-9]: 2025 AI Agent Index — répartition L1–L5, 30 systèmes / 6 catégories, instantané au 31 décembre 2025 (cf. notes ci-dessus, refs. arXiv 2602.17753 et MIT _further-details_).
[^p1-10]: From Governance Norms to Enforceable Controls — Koch, arXiv 2604.05229, 2026-04-06 (cf. note ci-dessus). La thèse « risks emerge during execution » est confirmée dans le résumé.
[^p1-11]: The 2026 AI Index Report — Stanford HAI (primaire), 2026-04 — https://hai.stanford.edu/ai-index/2026-ai-index-report
[^p1-12]: Stanford AI Index 2026: AI Agents Hit 66% Success Rate — But 89% Never Reach Production — Beri (secondaire), 2026 — https://www.beri.net/article/stanford-ai-index-2026-agents-66-percent-success
[^p1-13]: OWASP Top 10 for Agentic Applications — The Benchmark for Agentic Security in the Age of Autonomous AI (ASI01–ASI10) — OWASP GenAI Security Project, 2025-12-09 — https://genai.owasp.org/2025/12/09/owasp-top-10-for-agentic-applications-the-benchmark-for-agentic-security-in-the-age-of-autonomous-ai/
[^p1-14]: Challenges to the Monitoring of Deployed AI Systems (NIST AI 800-4, DOI 10.6028/NIST.AI.800-4) — NIST / CAISI, 2026-03 — https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.800-4.pdf
[^p1-15]: NIST AI Risk Management Framework: Agentic Profile (draft, Tier 1–4) — Cloud Security Alliance Lab Space, 2026-03-27 — https://labs.cloudsecurityalliance.org/agentic/agentic-nist-ai-rmf-profile-v1/
[^p1-16]: Towards a Science of AI Agent Reliability — Rabanser, Kapoor, Kirgis et al., Princeton HAL Lab, 2026-02-18 — https://arxiv.org/abs/2602.16666
[^p1-17]: Beyond Accuracy: A Multi-Dimensional Framework for Evaluating Enterprise Agentic AI Systems (CLEAR) — Mehta, arXiv (preprint), 2025-11-18 — https://arxiv.org/html/2511.14136v1
[^p1-18]: Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness for Tool-Using LLM Agents (DFAH) — Raffi Khatchadourian, arXiv (preprint), 2026-01-17 — https://arxiv.org/abs/2601.15322
[^p1-19]: Applying the LCIM in Support of Integratability, Interoperability, and Composability for SoS Engineering (Tolk, Diallo, Turnitsa) — Journal of Systemics, Cybernetics and Informatics, Vol. 5 No 5 (IIIS), ISSN 1690-4524 — 2007 — https://www.iiisci.org/journal/pdv/sci/pdfs/p468106.pdf
[^p1-20]: The Levels of Conceptual Interoperability Model (Tolk & Muguira, 2003 Fall SIW, Orlando, paper 03F-SIW-007) — MSCO archive — 2003 — https://www.mscoe.org/content/uploads/2017/12/Tolk-Muguira-The-Levels-of-Conceptual-Interoperability-Models.pdf
[^p1-21]: Même source : section « Motivation for Agent Mediated Decision Support », antérieure de près de deux décennies à l'agentique LLM ; à traiter comme précurseur historique, non comme équivalence.
[^p1-22]: KIP-98 — Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging
[^p1-23]: Apache Kafka 4.0.0 Release Announcement — Apache Software Foundation — 2025-03-18 — https://kafka.apache.org/blog/2025/03/18/apache-kafka-4.0.0-release-announcement/
[^p1-24]: Release Announcements (versions et dates Kafka) — Apache Software Foundation — 2026-05-30 — https://kafka.apache.org/blog/releases/
[^p1-25]: Exactly-once Semantics is Possible: Here is How Apache Kafka Does It (Narkhede, Wang et al.) — Confluent — 2025-03-01 — https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/
[^p1-26]: Integrating AI Into Apache Kafka Architectures: Patterns (outbox/DLQ/replay) — Confluent — 2026-05-05 — https://www.confluent.io/blog/ai-kafka-integration-patterns/
[^p1-27]: KIP-939: Support Participation in 2PC (Accepted, version non spécifiée) — Apache Software Foundation — https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC
[^p1-28]: Voir source LCIM 2007 supra (Figure 1, descriptions L0-L6).
[^p1-29]: Specification 2025-11-25 (overview, primitives, « Stateful connections ») — Model Context Protocol — 2025-11-25 — https://modelcontextprotocol.io/specification/2025-11-25
[^p1-30]: aurelio-labs/semantic-router — README — Aurelio Labs (GitHub) — 2026 — https://github.com/aurelio-labs/semantic-router/blob/main/README.md
[^p1-31]: Voir Specification 2025-11-25 supra ; primitives stabilisées (`confirmé`).
[^p1-32]: Releases — a2aproject/A2A (v1.0.0 12 mars 2026 ; v1.0.1 28 mai 2026) — A2A Project / GitHub — https://github.com/a2aproject/A2A/releases
[^p1-33]: Linux Foundation Launches the Agent2Agent Protocol Project — Linux Foundation — 2025-06-23 — https://www.linuxfoundation.org/press/linux-foundation-launches-the-agent2agent-protocol-project-to-enable-secure-intelligent-communication-between-ai-agents
[^p1-34]: ACP Joins Forces with A2A — LF AI & Data Foundation — 2025-08-29 — https://lfaidata.foundation/communityblog/2025/08/29/acp-joins-forces-with-a2a-under-the-linux-foundations-lf-ai-data/
[^p1-35]: A2A, ACP, AGNTCY, AG-UI/A2UI — synthèse de stratification — voir communiqués LF cités. Dynamique de convergence par stratification : `probable`.
[^p1-36]: The 2026-07-28 MCP Specification Release Candidate (stateless ; dépréciations ; Extensions) — Model Context Protocol Blog — 2026-05-21 — https://blog.modelcontextprotocol.io/posts/2026-07-28-release-candidate/
[^p1-37]: CVE-2025-49596 Detail (NVD : MCP Inspector < 0.14.1, RCE, CVSS v4.0 9.4) — NVD / NIST — 2025-06-13 — https://nvd.nist.gov/vuln/detail/CVE-2025-49596
[^p1-38]: Survey of LLM Agent Communication with MCP: A Software Design Pattern Centric Review (Sarkar & Sarkar) — arXiv — 2025-05-26 / v2 2026-05-22 — https://arxiv.org/abs/2506.05364
[^p1-39]: A2A Protocol Surpasses 150 Organizations… Enterprise Production Use in First Year — Linux Foundation — 2026-04-09 — https://www.linuxfoundation.org/press/a2a-protocol-surpasses-150-organizations-lands-in-major-cloud-platforms-and-sees-enterprise-production-use-in-first-year

## PARTIE II — Fondements formels

### Ch. 4 — La tension fondamentale : garanties déterministes vs comportement probabiliste




**Insight-clé.** La tension qui structure cette monographie n'est pas une opposition de styles d'ingénierie mais une **discontinuité de régime de garantie** : le substrat de messagerie d'entreprise offre des garanties déterministes — _exactly-once_, ordre, idempotence — **bornées à un périmètre interne fermé** (le cycle _read-process-write_ d'un courtier), tandis que l'agent _LLM_ qu'on y branche produit un comportement probabiliste et révisable dont l'unité d'action — l'appel _RPC_ externe à effet de bord non rejouable — **tombe précisément hors de ce périmètre**. La frontière n'est donc pas conceptuelle : elle est tracée, en date de juin 2026, par la documentation des substrats eux-mêmes, qui circonscrit verbatim la portée de leur garantie. C'est cette frontière empirique — _delivery_ garanti / effet externe non garanti — que l'opérateur τ est conçu pour arbitrer (τ au Ch. 5), et c'est elle qui fonde l'ancrage empirique de la thèse déjà posé au Ch. 9.




Ce chapitre est empirique. Il ne formalise pas l'arbitrage — c'est l'objet du Ch. 5 — mais il **établit que l'arbitrage est nécessaire**, en montrant que les deux régimes ne se rejoignent nulle part dans les substrats de production actuels. L'argument procède en quatre temps : (1) caractériser ce que «&nbsp;déterministe&nbsp;» garantit réellement et où la garantie s'arrête ; (2) caractériser en quoi le comportement d'agent est irréductiblement probabiliste **et** révisable ; (3) localiser la couture exacte — la distinction _delivery_ / _processing_, puis la frontière périmètre-interne / effet-externe ; (4) montrer que les patrons de mitigation existants (_transactional outbox_, _DLQ_, _replay_) déplacent la tension sans la dissoudre. Cette tension est la première des déterministe→probabiliste, syntaxique→sémantique, composition→délégation ; son couplage aux deux autres (syntaxique→sémantique, composition→délégation) est la thèse de l'ouvrage, non l'objet de ce chapitre.

#### 4.1 Ce que «&nbsp;déterministe&nbsp;» garantit — et où la garantie s'arrête

La garantie déterministe d'un substrat de messagerie est **réelle, atomique et vérifiable, mais structurellement close sur elle-même**. Elle ne franchit pas la membrane du courtier.

Du côté du log distribué, l'_exactly-once semantics_ (EOS) d'Apache Kafka remonte à Kafka&nbsp;0.11 (juin&nbsp;2017) via KIP-98 : producteur idempotent (identifiant de producteur + numéros de séquence par partition), transactions inter-partitions atomiques, consommateur en mode `read_committed`/`read_uncommitted`[^p2-1]. En date de juin&nbsp;2026, la défense transactionnelle côté serveur (KIP-890) est activée par défaut depuis Kafka&nbsp;4.0 (18&nbsp;mars&nbsp;2025, première majeure sans ZooKeeper, KRaft par défaut)[^p2-2] ; la version courante est Kafka&nbsp;4.3.0 (22&nbsp;mai&nbsp;2026)[^p2-3] (`confirmé`).

L'énoncé décisif pour ce chapitre est la **portée** de cette garantie, et il est posé verbatim par Confluent : l'EOS de Kafka Streams est «&nbsp;_guaranteed within the scope of Kafka Streams' internal processing only_&nbsp;»[^p2-4] (`confirmé`, verbatim). Tout appel _RPC_ externe — magasin distant, **API LLM**, courriel, paiement — **n'est pas couvert**. La garantie tient pour le triptyque consommer→transformer→produire **à l'intérieur** du courtier ; elle ne s'étend pas à l'action que l'agent déclenche **vers le dehors**.

Du côté de la file transactionnelle, IBM&nbsp;MQ atteint le _once-and-only-once_ par la conjonction **persistance + syncpoint (`MQCMIT`/`MQBACK`) + coordination transactionnelle**[^p2-5][^p2-6] (`confirmé`). MQ&nbsp;9.4.0 LTS est GA depuis le 18&nbsp;juin&nbsp;2024 (support ≥&nbsp;juin&nbsp;2029, extensible jusqu'en 2033)[^p2-7] ; la ligne CD est en 9.4.5 (GA 5&nbsp;février&nbsp;2026, Multiplateformes/Appliance)[^p2-8] (`confirmé`).


> ⟢ ***À reprendre du corpus mère*** — Réserve méthodologique du dossier (Ch. 9, IBM MQ) : les pages `ibm.com` renvoient HTTP 403 à l'agent de _fetch_ ; le contenu MQ a été corroboré indirectement (extraits + blogs IBM Hursley signés). Le détail du protocole 2PC/X-Open XA dans MQ — coordinateur embarqué vs participant — reste `à vérifier` (page IBM en 403 ; piste : Redbook MQ ou cache Knowledge Center). Ne pas durcir au-delà.


La leçon convergente des deux substrats : **la garantie déterministe est conditionnelle à un périmètre que l'agent, par nature, est appelé à quitter**. Le coût de cette garantie (de l'ordre de ~2-5&nbsp;ms de latence et ~10-20&nbsp;% de débit pour l'EOS) est `à vérifier` — il provient de sources secondaires (Conduktor, Strimzi/CNCF) **sans banc de mesure primaire horodaté** et ne doit pas être présenté comme normatif ; à défaut d'un rapport primaire, une mesure propre sur AgentMeshKafka s'impose.

#### 4.2 Ce que «&nbsp;probabiliste&nbsp;» implique — non-déterminisme _et_ révisabilité

Le comportement de l'agent _LLM_ n'est pas seulement non-déterministe à l'émission ; il est **révisable après coup**, ce qui détruit l'hypothèse de rejouabilité sur laquelle repose la garantie du substrat.

Deux propriétés se cumulent. D'abord le **non-déterminisme de production** : pour une même entrée, l'agent peut décider d'appeler un outil différent, de reformuler une requête, ou de ne pas agir — la trajectoire n'est pas une fonction de l'entrée mais une distribution. Ensuite, et c'est le point sous-estimé, la **révisabilité** : un agent peut revenir sur une intention, corriger une étape, réinterpréter le contexte à mesure que des observations arrivent. Cette révisabilité est une vertu fonctionnelle — elle fait l'intérêt de l'agent — mais elle est **toxique pour un protocole transactionnel**, qui suppose qu'une action validée est définitive et qu'un _replay_ reproduit fidèlement l'effet.

Le conflit se cristallise sur un objet précis : l'**effet de bord externe non rejouable**. Quand l'agent émet un paiement, envoie un courriel, ou appelle une API mutante, l'effet est produit **dans le monde**, hors du log. Le substrat peut rejouer le message d'intention autant de fois qu'il le faut ; il ne peut pas «&nbsp;dé-envoyer&nbsp;» le courriel ni garantir que le second appel à l'API LLM produira la même sortie que le premier. La garantie déterministe du _replay_ — «&nbsp;le log est une mémoire _stateful_ à _replay_ déterministe&nbsp;»[^p2-9] (`confirmé`, verbatim) — est **vraie pour l'état interne et fausse pour l'effet externe**. C'est exactement la dissymétrie que l'opérateur τ prend en charge : pour une grandeur `g` dont le sens doit être fixé, τ **déplace l'instant de fixation** _t_fix</sub>(g) sans altérer `g`, et statue Decision ∈ {Déterministe, Probabiliste, Refus} — déterministe quand l'action retombe dans le périmètre garanti, probabiliste quand elle l'excède sous contrôle, τ‑Refus quand l'autorité ou les invariants l'interdisent (formalisation au Ch. 5).


***Tableau — La discontinuité de régime : ce que chaque côté tient pour acquis. La ligne «&nbsp;frontière de validité&nbsp;» est la couture où l'opérateur τ opère.***

| **Axe** | **Régime déterministe (substrat)** | **Régime probabiliste (agent LLM)** |
| --- | --- | --- |
| Unité d'action | Message validé dans une transaction | Décision/appel d'outil échantillonné |
| Rapport entrée→sortie | Fonction (reproductible) | Distribution (révisable) |
| Effet d'un _replay_ | Idempotent sur l'état interne | Non rejouable sur l'effet externe |
| Notion de correction | _Rollback_ (`MQBACK`) / _abort_ transactionnel | Compensation / nouvelle décision contextuelle |
| Frontière de validité | Périmètre interne _read-process-write_ | Action vers le dehors (API, courriel, paiement) |
| Statut épistémique | `confirmé` (doc primaire substrat) | `confirmé` (non-déterminisme) ; portée formelle → CIA |




> ⟢ ***À reprendre du corpus mère*** — Les invariants réfutables I1–I5 caractérisent les conditions sous lesquelles cette frontière est franchissable sans perte de sens. Les énoncés précis de I1, I2, I3 et I5 ainsi que leurs statuts ne sont pas fournis ici et ne doivent pas être inventés ; les reprendre du corpus mère. Seul I4 (Hypothèse) est posé comme tel : campagne empirique non concluante — ne pas le présenter comme acquis.


#### 4.3 La couture : _delivery_ vs _processing_, puis interne vs externe

La tension se localise sur **deux frontières emboîtées**, et confondre l'une avec l'autre est l'erreur d'ingénierie centrale du domaine. La première frontière est théorique et bien établie ; la seconde est pratique et trace l'emplacement exact de l'opérateur τ.

**Première frontière — _delivery_ vs _processing_.** L'_exactly-once **delivery**_ au niveau transport est **impossible** sur un réseau non fiable : c'est une conséquence du problème des Deux Généraux et du résultat FLP. Seul l'_exactly-once **processing**_ — l'atomicité applicative — est atteignable[^p2-10] (`confirmé`). Autrement dit, on ne garantit jamais qu'un message **traverse** exactement une fois ; on garantit qu'il est **traité** avec un effet net équivalent à un traitement unique — via idempotence, déduplication et transactions. MQ retire le message à la consommation validée ; Kafka le conserve dans un log relisable[^p2-11] : deux stratégies pour atteindre le _processing_ là où le _delivery_ exact est hors d'atteinte.

**Seconde frontière — périmètre interne vs effet externe.** C'est ici que la tension agentique devient irréductible. Le _processing_ exact est garanti **tant qu'il reste interne au substrat**. Dès que le traitement déclenche un effet externe — l'acte même de l'agent — on quitte le domaine où l'atomicité est défendable. La documentation de Kafka borne explicitement la garantie au cycle interne[^p2-12]. Cette seconde frontière est l'**ancrage empirique de la thèse** : elle n'est pas postulée, elle est documentée par l'éditeur du substrat.

Le tableau suivant rend la dépendance explicite — deux périmètres, deux verdicts opposés.


***Tableau — Frontière de garantie : la garantie déterministe s'arrête là où commence l'acte externe de l'agent. La troisième ligne reprend la frontière EOS posée comme ancrage de la thèse au Ch. 9.***

| **Périmètre de l'action** | **Garantie du substrat** | **Conséquence agentique** |
| --- | --- | --- |
| _read-process-write_ interne au courtier (Kafka : atomique multi-partitions ; MQ : syncpoint) | Oui — _exactly-once **processing**_ | Le substrat **est** déterministe ; aucune décision de τ requise |
| Transport sur réseau non fiable (_delivery_) | Non — impossible (Deux Généraux / FLP) | Compensé par idempotence/dédup ; ramené au _processing_ interne |
| Appel _RPC_ externe : magasin distant, **API LLM**, courriel, paiement | Non — hors périmètre (verbatim Confluent) | Action probabiliste / non rejouable → ressort de l'opérateur τ (τ, Ch. 5) |



L'enjeu pratique : un système qui **suppose** que la garantie EOS couvre l'appel à l'API LLM construit une sûreté fictive. C'est la confusion à proscrire — interopérabilité (coopération de systèmes hétérogènes avec **sens préservé** à travers la frontière) confondue avec simple connectivité transactionnelle interne.

#### 4.4 Les patrons de mitigation déplacent la tension, ils ne la dissolvent pas

Les patrons d'intégration IA recommandés pour les substrats **rapprochent** l'effet externe du périmètre garanti, mais aucun ne ramène l'effet externe non rejouable **à l'intérieur** de la garantie : ils transforment le problème en un problème de réconciliation, pas en une garantie de bout en bout.

Le patron canonique, en date de juin&nbsp;2026, est le _transactional outbox_ couplé à la capture de changements (Debezium CDC)[^p2-13] (`confirmé`, verbatim Confluent). Son principe : **au lieu** d'appeler le service externe dans la transaction (impossible à rendre atomique), on écrit l'**intention** d'appel dans une table _outbox_ au sein de la même transaction locale que la mutation d'état ; un relais (CDC) publie ensuite cette intention de façon fiable. L'atomicité est ainsi préservée **jusqu'à la publication de l'intention** — mais l'exécution de l'effet externe reste, elle, au moins _at-least-once_, et exige une clé d'idempotence côté destinataire pour absorber les répétitions.

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

Deux autres patrons du dossier complètent le tableau, sans changer la conclusion : la _dead-letter queue_ (DLQ) outillée pour le diagnostic agentique — annotée de `prompt-id`, `model-version`, `offset` — capture les effets qui **échouent** à franchir la frontière proprement, et les _data contracts_ (CEL) appliquent un masquage PII sur le flux[^p2-14] (`confirmé`, verbatim). Pour la coordination multi-ressources **incluant** un participant externe, KIP-939 (participation 2PC, `transaction.two.phase.commit.enable`, défaut `false`) est «&nbsp;Accepted&nbsp;» mais **sans version d'intégration spécifiée** — marqueur `à vérifier` maintenu, adoption attendue d'abord via Apache Flink (FLIP-319)[^p2-15] (`probable`).


> ⟢ ***À reprendre du corpus mère*** — Le pontage formel de cette frontière — types de session probabilistes / tolérants au _drift_, algèbre d'héritage de garanties, mécanisation Lean 4, banc AgentMeshKafka — est l'objet du Calcul d’Intégration Agentique (CIA) (Ch. 6), sur l'analogie directrice M(π)/π-calcul. Les règles précises de l'algèbre et les extraits Lean ne sont pas fournis et ne doivent pas être fabriqués ; les reprendre du corpus mère.


Le résultat net : **aucun patron de production, en date de juin&nbsp;2026, ne fait franchir à la garantie déterministe la frontière de l'effet externe non rejouable.** Tous la déplacent vers une réconciliation _at-least-once_ + idempotence côté cible. C'est précisément ce constat — la frontière demeure — qui rend nécessaire un opérateur d'arbitrage explicite plutôt qu'une garantie implicite de bout en bout, et qui motive l'opérateur τ au chapitre suivant.

#### Questions ouvertes

- **Surcoût réel de la garantie déterministe au contact d'un agent.** Le chiffre ~2-5&nbsp;ms / ~10-20&nbsp;% (EOS) est `à vérifier` : sources secondaires (Conduktor, Strimzi/CNCF), **aucun banc primaire horodaté**. Existe-t-il un rapport primaire Apache/Confluent ? À défaut, le mesurer sur AgentMeshKafka, en isolant le surcoût _outbox_ + CDC du surcoût EOS pur.
- **Calibrage de la frontière _delivery_/_processing_ vs interne/externe.** La distinction est `confirmé` au plan théorique (Deux Généraux / FLP), mais la **règle de décision substrat** (MQ ⇐ atomicité/ordre/conformité ; Kafka ⇐ débit/_replay_/fan-out) reste une synthèse argumentative, `probable`, non un fait normatif. Quelles classes d'effets externes tolèrent l'_at-least-once_ + idempotence, et lesquelles exigent un τ‑Refus ?
- **Coordination 2PC incluant un participant externe.** Quelle version d'Apache Kafka intégrera KIP-939 ? La page KIP est muette (`à vérifier`) ; vérifier les notes 4.x ultérieures et FLIP-319. Le détail du protocole 2PC/X-Open XA d'IBM MQ (coordinateur embarqué vs participant) reste à confirmer (page IBM en 403).
- **Statut des invariants de franchissement.** I4 (Hypothèse) est `Hypothèse` (campagne empirique non concluante) ; les énoncés et statuts de I1, I2, I3, I5 sont à reprendre du corpus mère et ne sont pas tranchés ici. Tant qu'ils ne le sont pas, la frontière de l'§4.3 doit être traitée comme **condition** de l'arbitrage, non comme propriété acquise.
- **Révisabilité de l'agent et compensation.** La sémantique de compensation (annuler l'effet d'une décision révisée) n'a pas d'équivalent transactionnel propre côté effet externe ; sa formalisation relève du CIA (Ch. 6) et n'est pas établie ici.



### Ch. 5 — L'opérateur τ

opérateur τ est un opérateur directionnel qui **déplace l'instant de fixation du sens** _t_fix</sub>(g) sans altérer la grandeur `g`, et qui en dérive un Decision ∈ {Déterministe, Probabiliste, Refus} : il route une interaction vers le régime déterministe (garantie de message), vers le régime probabiliste (agent _LLM_) ou vers le refus. Sa raison d'être n'est pas théorique mais structurelle : elle naît exactement là où la garantie du substrat s'arrête et où commence l'action non rejouable de l'agent. Ce chapitre instancie ici la sémantique de τ telle que **fixée** par le canon (CLAUDE.md §2) ; il défère explicitement au chapitre III.8 du corpus mère la sémantique opérationnelle complète, l'énoncé précis des invariants I1 (—) à I5 (—) et leurs statuts, et les règles de l'algèbre du CIA. Aucune de ces constructions n'est reconstituée ici : tout ce qui n'est pas fourni par le canon est renvoyé au corpus, jamais fabriqué.

#### 5.1 — La frontière qui appelle l'opérateur

L'opérateur τ répond à une discontinuité empiriquement attestée : la garantie de livraison **exactly-once** du substrat est structurellement bornée au périmètre interne, et tout ce qui la franchit relève d'un régime distinct. Cette frontière est l'ancrage de la thèse, pas une hypothèse de travail.

Côté substrat, l'_exactly-once semantics_ (EOS) d'Apache Kafka — depuis KIP-98 (Kafka 0.11, juin 2017), avec défense transactionnelle serveur active par défaut depuis 4.0 et version courante 4.3.0 en date de juin 2026[^p2-16] — garantit l'atomicité du cycle **read-process-write** à l'_intérieur_ de Kafka. Confluent l'énonce sans ambiguïté (`confirmé`, verbatim) : la garantie ne couvre _pas_ les appels RPC externes[^p2-17]. Or l'action d'un agent — appel d'API _LLM_, envoi de courriel, paiement — _est_ un effet de bord externe : non transactionnel, non idempotent par défaut, non rejouable. Le détail de cette frontière et de ses corollaires (log comme mémoire à _replay_ déterministe, DLQ portant `prompt-id`/`model-version`/`offset`) est traité au Ch. 9[^p2-18] ; ce qui importe ici est que la frontière _existe_ et _se laisse localiser_.


***Tableau — Frontière de garantie EOS (Ch. 9) comme déclencheur du dispatch de τ. La colonne de droite indique le régime que τ a vocation à sélectionner ; les conditions exactes de sélection relèvent de D‑Sens, D‑Autorité, D‑Invariant (§5.3).***

| **Périmètre de l'interaction** | **Garantie EOS** | **Régime visé par τ** |
| --- | --- | --- |
| _read-process-write_ interne à Kafka | Oui (atomique, multi-partitions) | Déterministe — la grandeur `g` est déjà fixée |
| Appel RPC externe : _store_ distant, API _LLM_, courriel, paiement | Non[^p2-19] | Probabiliste ou Refus — _t_fix</sub>(g) doit être déplacé |



Le rôle de τ est de **traiter cette frontière comme une décision explicite** plutôt que comme un débordement silencieux. Sans τ, le passage du déterministe au probabiliste se produit de toute façon — au moment où l'agent émet son appel externe — mais de manière implicite, non tracée, sans point de contrôle d'autorité. τ rend ce passage **nommable et arbitrable**.

#### 5.2 — Sémantique de τ : déplacer _t_fix</sub>(g) sans altérer `g`

L'invariant sémantique de τ est précis et restrictif : il **déplace l'instant de fixation du sens** _t_fix</sub>(g) — c'est-à-dire le moment où la grandeur acquiert son interprétation engageante — **sans altérer la grandeur** `g` elle-même. τ ne réécrit pas le message ; il décide _quand_ et _sous quel régime_ son sens devient contraignant.

Cette distinction est le cœur du couplage des déterministe→probabiliste, syntaxique→sémantique, composition→délégation (la thèse étant leur **couplage**, non trois axes indépendants). Dans un système classique, le sens d'un message est fixé à l'émission, syntaxiquement, par composition : `t_fix` coïncide avec la sérialisation, et la garantie de livraison suffit. Dans un système agentique, le sens d'une grandeur peut rester **ouvert** jusqu'à ce qu'un agent l'interprète — la fixation devient sémantique (un score, non un schéma), probabiliste (une distribution, non une valeur), et déléguée (une autorité tierce, non une composition locale). τ est l'opérateur qui **positionne** _t_fix</sub>(g) sur cet axe sans toucher à `g` : la même grandeur peut voir son sens fixé tôt (régime déterministe, garantie de message) ou tard (régime probabiliste, agent _LLM_), selon la décision de τ.

La sortie est un Decision ∈ {Déterministe, Probabiliste, Refus}. La sémantique _opérationnelle_ complète de cette décision — règles d'inférence, conditions de transition, propriétés de terminaison et de cohérence — est définie canoniquement au chapitre III.8 du corpus mère et n'est pas dupliquée ici (CLAUDE.md §2, §11).


> ⟢ ***À reprendre du corpus mère*** — Sémantique opérationnelle complète de τ (chap. III.8) : règles d'inférence du dispatch Decision ∈ {Déterministe, Probabiliste, Refus} ; définition formelle de l'instant _t_fix</sub>(g) et de l'opération de déplacement (« τ déplace _t_fix</sub>(g) sans altérer `g` ») ; conditions de bord entre régime déterministe et régime probabiliste ; propriétés de terminaison et de cohérence de la décision. NE PAS reconstituer ici — y **référer**.


#### 5.3 — Les trois dimensions d'entrée

τ ne décide pas sur la seule grandeur `g` : il décide sur trois dimensions d'entrée, dont l'évaluation conjointe détermine le Decision ∈ {Déterministe, Probabiliste, Refus}. Aucune des trois ne suffit seule ; c'est leur combinaison qui distingue un dispatch légitime d'un refus.

- D‑Sens — score sémantique dans `[0,1]`. Mesure l'_adéquation interprétative_ entre la grandeur et le sens visé. Un score bas signale une fixation de sens incertaine : il tire vers le régime probabiliste (délégation à un agent) ou, en deçà d'un seuil, vers le refus. C'est la dimension qui matérialise la rupture syntaxique→sémantique : on ne valide plus un schéma, on évalue un degré.
- D‑Autorité — produit `autorité appelant × autorité requise cible`. Confronte l'autorité _détenue_ par l'appelant à l'autorité _exigée_ par l'action cible. C'est la dimension de défense contre l'abus d'identité déléguée (§5.4) : une grandeur sémantiquement parfaite mais portée par une autorité insuffisante ne doit pas voir son sens fixé en régime probabiliste agissant.
- D‑Invariant — état des invariants I1 (—)–I5 (—) sur la **trace** (et non sur le seul message courant). Introduit la mémoire : la décision de τ dépend de l'historique des fixations de sens déjà engagées. C'est le point d'articulation avec le CIA, dont les types de session tolérants au _drift_ portent cet état (§5.5).


***Tableau — Les trois dimensions d'entrée de τ et leur correspondance avec les trois ruptures couplées. La colonne « rupture portée » associe chaque dimension à l'axe qu'elle opérationnalise ; le couplage des trois ruptures est la thèse — les dimensions ne sont pas indépendantes.***

| **Dimension** | **Domaine / forme** | **Rupture couplée portée** | **Effet directionnel sur _t_fix</sub>(g)** |
| --- | --- | --- | --- |
| D‑Sens | Score `in [0,1]` | syntaxique→sémantique | Score élevé → fixation déterministe admissible ; score bas → délégation probabiliste ou refus |
| D‑Autorité | autorité appelant `times` autorité requise cible | composition→délégation | Autorité suffisante → dispatch ; insuffisante → refus, quel que soit le sens |
| D‑Invariant | état de I1 (—)–I5 (—) sur la trace | déterministe→probabiliste | Invariants tenus → régime probabiliste autorisé ; invariant menacé → refus |



Les **seuils**, la **fonction de combinaison** des trois dimensions et la **forme exacte** du produit d'autorité ne sont pas fixés par le présent chapitre : ils relèvent de la définition canonique.


> ⟢ ***À reprendre du corpus mère*** — Définition canonique (chap. III.8) de la combinaison des trois dimensions : fonction de décision `f(D‑Sens, D‑Autorité, D‑Invariant) → Decision ∈ {Déterministe, Probabiliste, Refus}` ; seuils de bascule déterministe/probabiliste/refus ; définition précise du produit `autorité appelant × autorité requise cible` (treillis d'autorité, opération de comparaison) ; définition de l'« état des invariants sur la trace » pour D‑Invariant. NE PAS fabriquer de seuils ni de fonction.


#### 5.4 — Ancrage défensif : τ‑Refus contre le _confused deputy_

La sortie **Refus** de τ (τ‑Refus) n'est pas un cas d'erreur : c'est la défense de premier rang contre le _confused deputy_ agentique, cadré par les sources primaires comme une faille d'_autorisation et d'architecture_, non un défaut de modèle.

La Cloud Security Alliance établit (`confirmé`) que l'agent « **is designed to treat all content in their context window as potentially instructive, which eliminates the hard boundary between data and code** » : une injection le manipule donc pour qu'il abuse de ses _identifiants délégués_, et les remédiations efficaces — _admission control_, validation d'entrée structurée, cadrage explicite de l'autorité — sont des contrôles **externes au modèle**[^p2-20]. C'est précisément la fonction de D‑Autorité dans τ : confronter l'autorité détenue à l'autorité requise **avant** de fixer le sens en régime agissant. Le risque correspond à l'entrée **ASI03 — Identity and Privilege Abuse** du OWASP Top 10 for Agentic Applications 2026 (publié le 9 décembre 2025, `confirmé`)[^p2-21].

Deux qualifications épistémiques s'imposent, conservées sans lissage. D'abord, la _prompt injection_ — vecteur principal du _confused deputy_ — est qualifiée par OpenAI de **problème ouvert non entièrement résoluble**, « **a frontier, challenging research problem** » dont le travail « **remains ongoing... for years to come** »[^p2-22]. τ ne **résout** donc pas l'injection ; il **contient** son rayon d'action en refusant la fixation de sens lorsque D‑Autorité est insuffisante — défense en profondeur, non barrière étanche. Ensuite, la re-délégation inter-agents (_chain splicing_, _credential relay through delegation chains_) reste imparfaitement couverte par les taxonomies (`probable` ; le terme « _chain splicing_ » relève de la littérature secondaire/préprint, non normative)[^p2-23] ; la réponse standardisée émergente est l'**atténuation monotone** du _draft_ individuel IETF `draft-araut-oauth-transaction-tokens-for-agents-02` (en date de juin 2026 ; statut individuel, non adopté)[^p2-24]. Le détail de ce paysage menaces/défenses est traité au Ch. 13 ; τ s'y **branche** via D‑Autorité et D‑Invariant, sans le redéfinir.

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

#### 5.5 — Cadre des invariants réfutables I1 (—)–I5 (—)

τ et le CIA s'évaluent contre cinq invariants **réfutables**, chacun porté avec un **statut explicite** obligatoire — `Confirmé`, `Hypothèse` ou `Réfuté` — et chacun énonçant sa condition de réfutation. Présenter un invariant `Hypothèse` comme acquis est un écart de traçabilité interdit (CLAUDE.md §2, §4, §10).

La règle de discipline épistémique est ici plus contraignante que partout ailleurs dans la monographie : le **cadre** (cinq invariants, statut obligatoire, falsifiabilité) est fixé par le canon, mais l'**énoncé précis** de I1 (—), I2 (—), I3 (—), I5 (—) et leurs statuts respectifs **ne sont pas fournis** et ne doivent pas être inventés. Seul I4 (Hypothèse) est connu avec son statut : c'est une **hypothèse** — la campagne empirique associée n'a pas été concluante — et il ne sera donc jamais présenté comme confirmé. D‑Invariant lit l'état de ces invariants sur la trace ; sa fonction est de transformer un statut en décision (refus si un invariant tenu est menacé).


***Tableau — Cadre des invariants réfutables. Seul le statut de I4 (Hypothèse) (`Hypothèse`) est fixé par le canon ; les énoncés et les statuts des autres invariants relèvent du corpus mère et ne sont pas reconstitués. La colonne « statut » porte le marqueur d'incertitude exigé.***

| **Invariant** | **Énoncé / condition de réfutation** | **Statut (juin 2026)** |
| --- | --- | --- |
| I1 (—) | Énoncé non fourni par le canon — à reprendre du corpus (chap. III.8) | Non fourni |
| I2 (—) | Énoncé non fourni par le canon — à reprendre du corpus (chap. III.8) | Non fourni |
| I3 (—) | Énoncé non fourni par le canon — à reprendre du corpus (chap. III.8) | Non fourni |
| I4 (Hypothèse) | Énoncé non fourni ; statut canonique connu : campagne empirique **non concluante** | `Hypothèse` |
| I5 (—) | Énoncé non fourni par le canon — à reprendre du corpus (chap. III.8) | Non fourni |




> ⟢ ***À reprendre du corpus mère*** — Énoncés précis et statuts de I1 (—), I2 (—), I3 (—) et I5 (—) (chap. III.8 du corpus mère), incluant pour chacun sa **condition de réfutation** (falsifiabilité, §4). Pour I4 (Hypothèse) : reprendre l'énoncé exact et le compte rendu de la campagne empirique **non concluante** qui justifie le statut `Hypothèse`. NE PAS inventer d'énoncé ni promouvoir un statut sans justification empirique citée (§9).


L'articulation de τ avec le CIA se résume ainsi : τ est l'**opérateur de dispatch** à l'échelle d'une interaction ; le CIA est le **cadre formel** qui borne, à l'échelle d'une session, la composition de ces décisions sous garanties. Le CIA ponte les garanties déterministes (Kafka/MQ) et le comportement probabiliste d'agents _LLM_ au moyen de quatre composants — types de session probabilistes/tolérants au _drift_, algèbre d'héritage de garanties, mécanisation Lean 4, banc empirique `AgentMeshKafka` — sous l'analogie directrice `M(pi)` / π-calcul. D‑Invariant est l'interface entre les deux : l'état que les types de session du CIA maintiennent est précisément ce que τ consulte. Les travaux de référence sur les types de session probabilistes et leur mécanisation existent dans la littérature primaire — types de raffinement probabilistes (PLDI 2025)[^p2-25], coordination prouvée d'agents _LLM_ via _Message Sequence Charts_ mécanisée en Lean 4[^p2-26] — mais les **règles propres** de l'algèbre d'héritage de garanties du CIA et le **code Lean** du corpus ne sont pas fournis et ne sont pas fabriqués ici.


> ⟢ ***À reprendre du corpus mère*** — Règles précises de l'algèbre d'héritage de garanties du CIA ; définition des types de session probabilistes / tolérants au _drift_ ; extraits Lean 4 de la mécanisation ; protocole et résultats du banc empirique `AgentMeshKafka` adossé à l'écosystème (`TauGo`, `PubSubKafka`, `FibGo`). NE PAS reconstituer ; **référer** au corpus mère et aux dépôts liés.


#### Questions ouvertes

- **Énoncés et statuts des invariants.** Les énoncés précis de I1 (—), I2 (—), I3 (—), I5 (—) et leurs statuts (`Confirmé`/`Hypothèse`/`Réfuté`) restent à reprendre du chapitre III.8. Tant qu'ils ne sont pas réconciliés, D‑Invariant ne peut être instancié que formellement, pas numériquement.
- **Statut de I4 (Hypothèse).** Quelle condition empirique ferait passer I4 (Hypothèse) de `Hypothèse` à `Confirmé` ou `Réfuté` ? Le compte rendu de la campagne **non concluante** est requis (justification citée exigée pour tout changement de statut, §9) ; à défaut, I4 (Hypothèse) demeure `Hypothèse`.
- **Seuils de dispatch.** La fonction de combinaison `f(D‑Sens, D‑Autorité, D‑Invariant) → Decision ∈ {Déterministe, Probabiliste, Refus}` et ses seuils sont déférés au corpus. Une instanciation chiffrée nécessiterait un banc primaire — candidat naturel : `AgentMeshKafka` plutôt qu'une borne secondaire.
- **Couverture de la re-délégation inter-agents.** Les taxonomies (OWASP, MITRE ATLAS, CSA) couvrent imparfaitement le _credential relay through delegation chains_ (`probable`, Ch. 13) ; l'efficacité de D‑Autorité + D‑Invariant contre le _chain splicing_ est **à vérifier** empiriquement, l'atténuation monotone de `draft-araut-...` restant un _draft_ individuel non adopté en date de juin 2026.
- **Coût du dispatch.** Le surcoût latence/débit qu'introduit l'évaluation de τ sur le chemin critique n'est pas mesuré ; par analogie, le coût de l'EOS lui-même reste sans banc primaire horodaté (`à vérifier`, Ch. 9). À quantifier sur `AgentMeshKafka`.
- **Frontière de validité de l'analogie `M(pi)`.** Jusqu'où le π-calcul probabiliste capture-t-il fidèlement le comportement d'agents _LLM_ tolérants au _drift_ ? La frontière de validité de l'analogie directrice du CIA est à expliciter au corpus.



### Ch. 6 — Le Calcul d'Intégration Agentique (CIA)

Le Calcul d’Intégration Agentique (CIA) est le cadre formel qui ponte les **garanties déterministes** d'un substrat de messagerie (Kafka, MQ) et le **comportement probabiliste** d'agents _LLM_ ; il n'invente pas un calcul concurrent _ex nihilo_, mais réinvestit la lignée des types de session multipartites (MPST) — théorie canonique, mécanisée, et corrigée de fond en 2025 — en y greffant quatre composants : types de session probabilistes/tolérants au _drift_, algèbre d'héritage de garanties, mécanisation Lean 4, et banc empirique `AgentMeshKafka`. L'opérateur τ (Ch. 5) en est le poste d'aiguillage ; le CIA en est l'algèbre de composition. L'enjeu de ce chapitre est de situer chaque composant par rapport à l'état de l'art vérifié en date de juin 2026, et de distinguer rigoureusement ce qui est **acquis dans la littérature** de ce qui constitue une **innovation défendable du corpus mère** — sans fabriquer aucun énoncé formel non fourni.

Le CIA matérialise le couplage des déterministe→probabiliste, syntaxique→sémantique, composition→délégation : il ne traite pas le passage déterministe→probabiliste comme un simple ajout de non-déterminisme à un calcul de processus, mais comme une recomposition simultanée du **régime de garantie** (déterministe→probabiliste), du **support du sens** (syntaxique→sémantique, d'où la tolérance au _drift_) et du **mode d'orchestration** (composition→délégation, d'où l'algèbre d'héritage). C'est ce triple couplage — et non l'un de ces axes isolé — qui justifie un calcul dédié plutôt qu'une extension cosmétique de MPST.

#### 6.1 Le socle réinvesti : projection global→local des MPST

Insight : la mécanique que le CIA emprunte aux MPST est la **projection global→local**, seul invariant structurel qui survit intact au passage vers les agents _LLM_.

Les **Multiparty Session Types** sont introduits par Honda, Yoshida et Carbone à POPL 2008[^p2-27], puis étendus dans la version journal du **Journal of the ACM** en 2016 (`confirmé`)[^p2-28]. Leur apport structurant pour l'interopérabilité agentique est unique : un **type global** décrit le protocole d'interaction de l'ensemble des participants ; sa **projection** engendre les **types locaux** que chaque _end-point_ — ici, chaque agent — doit respecter. Cette mécanique de projection est précisément ce que la lignée 2025-2026 réinvestit jusqu'aux protocoles d'agents _LLM_ (§6.4) ; le CIA s'y inscrit en traitant chaque agent comme un _end-point_ dont le type local borne le comportement, fût-il probabiliste.

La sémantique opérationnelle du CIA (réduction, bien-typage des sessions, conditions de projection) relève de la définition canonique et n'est pas reproduite ici.


> ⟢ ***À reprendre du corpus mère*** — Sémantique opérationnelle du CIA : règles de réduction, jugement de bien-typage des sessions probabilistes, et conditions de projection global→local propres au calcul. Reprendre la formulation exacte du corpus mère (chap. III.8 et suivants) plutôt que la reconstruire depuis MPST.


#### 6.2 La correction de fond de 2025 : un socle resserré, pas réfuté

Insight : tout argument du CIA qui s'appuie sur la sûreté des MPST asynchrones doit désormais référer au **fragment corrigé et mécanisé** de 2025, et non à la formulation de 2008-2016 prise telle quelle.

Tirore, Bengtson et Carbone (ECOOP 2025) établissent que la preuve de _subject reduction_ de la formulation **originale** « contient certaines failles » (`confirmé`)[^p2-29]. Leur réponse n'est pas une réfutation destructrice mais un **resserrement** : ils restreignent la théorie à un fragment pour lequel le _subject reduction_ tient, établissent les propriétés de sûreté des processus bien typés, et mécanisent l'ensemble en Coq. La portée pour le CIA est directe : il s'agit d'une **divergence de fond** entre formulation originale et fragment restreint — à présenter comme **correction de l'état de l'art**, non comme désaccord entre sources ni comme controverse ouverte. Le socle de sûreté que le CIA hérite des MPST est donc plus étroit qu'il n'y paraissait avant 2025, et cette étroitesse doit être consignée comme contrainte de conception, pas masquée.

#### 6.3 Composant 1 — Types de session probabilistes / tolérants au _drift_

Insight : le pont formel le plus direct entre la rigueur des types de session et l'indéterminisme intrinsèque des agents _LLM_ existe déjà dans la littérature (PReST) ; la **tolérance au _drift_** propre au CIA en est l'extension sémantique, à reprendre du corpus.

Pour des agents au comportement probabiliste/non déterministe, l'état de l'art fournit une extension primaire confirmée. Fu, Das et Gaboardi (Boston University) proposent les **Probabilistic Refinement Session Types** (PReST, PLDI 2025) : une extension _conservative_ des _refinement session types_ supportant des opérateurs de choix **probabiliste et régulier** (probabilités non constantes, symboliques), une vérification par solveur SMT, et une analyse de coût garantissant la **terminaison presque-sûre** (`confirmé`)[^p2-30]. PReST est le pont formel le plus direct vers le couplage déterministe→probabiliste du canon : il montre qu'un type de session peut borner un comportement intrinsèquement aléatoire sans renoncer à la vérification.

Le CIA revendique davantage : non seulement une session **probabiliste**, mais **tolérante au _drift_** — c'est-à-dire robuste à la dérive du sens propre au régime probabiliste de l'opérateur τ, où l'instant de fixation du sens _t_fix</sub>(g) est déplacé sans que la grandeur `g` soit altérée. Ce que PReST capture (la distribution sur des branches d'un protocole) ne couvre pas, en l'état, ce que la tolérance au _drift_ vise (la préservation du sens malgré une fixation tardive et révisable). La construction exacte du type de session tolérant au _drift_ — sa syntaxe, sa relation de sous-typage, son interaction avec D‑Sens — n'est pas fournie ; PReST en est l'analogue le plus proche, non l'équivalent.


> ⟢ ***À reprendre du corpus mère*** — Type de session probabiliste **tolérant au _drift_** du CIA : syntaxe des types, relation de sous-typage/conformité tolérant la dérive sémantique, et lien formel avec D‑Sens (score sémantique [0,1]) et le déplacement de _t_fix</sub>(g) par l'opérateur τ. Reprendre du corpus ; ne pas l'assimiler à PReST, qui en est seulement l'analogue probabiliste le plus proche.


#### 6.4 Composant 2 — Algèbre d'héritage de garanties

Insight : le CIA formalise **comment** une garantie déterministe (p. ex. _exactly-once_ d'un substrat de messagerie) se propage — ou se dégrade — lorsqu'une étape probabiliste s'intercale dans une chaîne de délégation ; cette algèbre incarne la rupture composition→délégation, et ses règles relèvent du corpus.

La littérature MPST offre le terreau conceptuel — la **délégation** y est déjà un objet de première classe. Multiparty GV (Jacobs, Balzer, Krebbers, ICFP 2022) garantit l'**absence d'interblocage** malgré entrelacement de sessions **et délégation**, preuves mécanisées en Coq via le _connectivity graph framework_ (cadre Iris) (`confirmé`)[^p2-31]. Mais l'absence d'interblocage n'est pas l'héritage de garanties : ce que le CIA vise est l'**algèbre** qui compose les garanties hétérogènes du substrat déterministe (ordre, durabilité, _exactly-once_ côté Kafka/MQ) avec le régime probabiliste d'un agent, et qui dit quelle garantie survit à la composition. C'est le cœur de la rupture composition→délégation : on ne **compose** plus des fonctions aux contrats fixes, on **délègue** à un agent dont le contrat est probabiliste, et l'algèbre doit propager l'affaiblissement résultant.

Les règles précises de cette algèbre — opérateurs de composition, treillis des garanties, lois d'affaiblissement sous délégation à une étape τ‑Refus ou probabiliste — ne sont pas fournies et ne doivent pas être inventées.


> ⟢ ***À reprendre du corpus mère*** — Algèbre d'héritage de garanties du CIA : ensemble des garanties (ordre, durabilité, _exactly-once_, etc.), opérateurs de composition séquentielle/parallèle, et lois de propagation/affaiblissement d'une garantie déterministe à travers une étape probabiliste ou un τ‑Refus. Reprendre l'énoncé exact et ses propriétés (associativité, monotonie, élément neutre) du corpus mère.


#### 6.5 Composant 3 — Mécanisation Lean 4 : une innovation défendable, pas un alignement

Insight (divergence non lissée) : en date de juin 2026, la mécanisation de la métathéorie des types de session _stricto sensu_ reste dominée par Coq/Rocq ; la revendication d'une mécanisation Lean 4 du CIA n'est **pas contredite** par l'état de l'art, mais doit être positionnée comme **innovation** — non comme conformité.

Trois jalons primaires confirment la domination Coq/Rocq de la métathéorie mécanisée des types de session (`confirmé`) : Zooid (Castro-Perez et al., PLDI 2021), DSL embarqué dans Coq pour le calcul multipartite certifié[^p2-32] ; Multiparty GV en Coq/Iris (§6.4) ; et Li & Wies (ITP 2025), mécanisation en **Rocq** (ex-Coq, ~15 000 lignes) de l'implémentabilité des protocoles multipartites asynchrones, étendue aux protocoles à participants en nombre **infini**[^p2-33]. Le tutoriel de métathéorie de référence vise lui aussi Rocq[^p2-34]. **Constat 1 (`confirmé`)** : aucune mécanisation Lean 4 **dédiée aux types de session** n'a été identifiée à juin 2026.

**Constat 2 (`confirmé`, décisif)** : Bollig, Függer et Nowak, « Provable Coordination for LLM Agents via Message Sequence Charts » (préprint arXiv, v2 du 2026-04-29), mécanisent **en Lean 4** — et non en Coq — un DSL de coordination d'agents _LLM_ fondé sur les _message sequence charts_ (MSC), avec projection syntaxique global→local engendrant des programmes d'agents locaux **sans interblocage** ; la mention « All definitions and results are now mechanically verified in Lean 4 » apparaît en v2 et était **absente de v1**, l'implémentation étant nommée ZipperGen[^p2-35].

La conséquence pour le canon est précise et doit être tenue sans la lisser : (a) pour les types de session _stricto sensu_, Lean 4 reste **absent** (Coq/Rocq partout) ; (b) pour la coordination MSC d'agents _LLM_, Lean 4 est **désormais présent** (Bollig). La revendication d'une mécanisation Lean 4 du CIA est donc une **innovation défendable** — plausiblement la première mécanisation Lean 4 d'une théorie de session/coordination de ce type (`probable`) — à positionner explicitement comme telle, et non comme un simple alignement sur l'état de l'art. Une réserve documentaire est maintenue : l'attribution du préprint Bollig à une venue de conférence (« Petri Nets 2025, Paris ») n'est **pas confirmée** — la page arXiv canonique ne liste aucune venue ; à traiter comme préprint tant qu'une publication revue n'est pas vérifiée (`à vérifier`)[^p2-36].

Le code Lean 4 du CIA lui-même n'est pas fourni et ne doit pas être reconstitué.


> ⟢ ***À reprendre du corpus mère*** — Mécanisation Lean 4 du CIA : définitions, énoncés de théorèmes et preuves (en particulier la sûreté du fragment et l'héritage de garanties). Reprendre l'artefact du corpus mère. À vérifier également : publicité et taille de l'artefact Lean 4 de Bollig et al. (dépôt Zenodo/GitHub ?), pour comparaison rigoureuse.


#### 6.6 Composant 4 — Le banc empirique `AgentMeshKafka`

Insight : la prétention du CIA à **ponter** garanties déterministes et comportement probabiliste n'est pas qu'analytique — elle est adossée à un banc exécutable, `AgentMeshKafka`, qui instrumente la composition d'agents _LLM_ sur un substrat Kafka et alimente l'évaluation des invariants réfutables.

`AgentMeshKafka` est le banc de validation de l'écosystème du corpus, distinct du kernel exécutable `TauGo` (implémentation Go de l'opérateur τ) et des patrons `PubSubKafka` / `FibGo`. Son rôle dans le CIA est double : observer empiriquement la propagation des garanties (l'algèbre du §6.4) sur un substrat réel, et fournir le terrain probant pour le statut des invariants réfutables (§6.7). La littérature offre un précédent de **descente du formalisme vers les agents** : Bergenti et al. (Frontiers in Computer Science, vol. 7, 2025, _peer-reviewed_) traduisent les types locaux MPST en agents exécutables (Jadescript ciblant la plateforme JADE), avec preuve que les agents se comportent conformément aux types locaux (`confirmé`)[^p2-37] — ce qui valide la **faisabilité** d'un pont type→agent, sans préjuger des chiffres propres à `AgentMeshKafka`.

La configuration exacte du banc, ses métriques, et les résultats chiffrés relèvent du chapitre de validation (Partie VI) et du corpus.


> ⟢ ***À reprendre du corpus mère*** — Spécification du banc `AgentMeshKafka` : topologie Kafka, charge de travail, métriques d'observation de l'héritage de garanties, et protocole expérimental reliant les mesures aux statuts d'invariants. Reprendre du corpus mère et du chapitre de validation (Partie VI).


#### 6.7 Invariants réfutables et statut empirique

Insight : le CIA est **réfutable par construction** — ses prétentions sont consignées comme invariants `I_1`–`I_5` portant chacun un statut explicite ; I4 (Hypothèse) demeure une **hypothèse** (campagne empirique non concluante) et ne doit jamais être présenté comme acquis.

Le statut courant des invariants est normatif : I4 (Hypothèse) en particulier. Les énoncés précis de `I_1`, `I_2`, `I_3`, `I_5` et leurs statuts respectifs ne sont pas fournis dans la base mobilisée ici et ne doivent pas être inventés.


> ⟢ ***À reprendre du corpus mère*** — Énoncés exacts des invariants réfutables `I_1`, `I_2`, `I_3`, `I_5` et leurs statuts (Confirmé | Hypothèse | Réfuté), ainsi que la **condition de réfutation** de chacun. Reprendre du corpus mère. Rappel : I4 (Hypothèse) reste Hypothèse (campagne `AgentMeshKafka` non concluante) ; tout changement de statut exige une justification empirique citée et une entrée ADR (CLAUDE.md §9).


#### 6.8 Rapport au π-calcul et aux _behavioural types_

Insight : l'analogie directrice du CIA est `M(pi)` / π-calcul — un calcul de processus communicants dont les MPST sont l'appareil de typage comportemental ; mais l'état de l'art récent des résultats **mécanisés** d'implémentabilité privilégie la veine MSC/automates communicants, ce qui pose la question d'un **ancrage double**.

Les types de session sont, historiquement, l'appareil de _behavioural typing_ du π-calcul : ils disciplinent les interactions sur les canaux comme un système de types discipline les valeurs. Le CIA hérite de cette filiation — l'analogie `M(pi)` situe les agents comme processus communicants et les sessions comme protocoles typés. Or, deux veines coexistent dans la littérature et le CIA se trouve à leur charnière, ce que le tableau suivant explicite.


***Tableau — Le CIA à la charnière de deux veines de _behavioural types_. La veine π-calcul fournit l'analogie directrice et la sûreté ; la veine MSC fournit la décidabilité de l'implémentabilité et le seul précédent de mécanisation Lean 4 pour agents _LLM_.***

| **Dimension** | **Veine π-calcul / types de session** | **Veine MSC / automates communicants** | **Position du CIA** |
| --- | --- | --- | --- |
| Objet premier | Processus communicants, canaux | Diagrammes de séquence, machines à états | Agents comme _end-points_ typés |
| Mécanique de projection | Type global → types locaux (MPST) | MSC global → programmes locaux (Bollig) | Projection réinvestie (§6.1) |
| Résultat-phare mobilisé | Sûreté du fragment corrigé (Coq, 2025) | Implémentabilité **décidable** (Stutz, 2023) | Sûreté + décidabilité visées |
| Mécanisation observée (juin 2026) | Coq / Rocq / Iris | Lean 4 (Bollig, agents _LLM_) | Lean 4 — **innovation** (§6.5) |
| Indéterminisme | PReST : choix probabiliste + régulier (SMT) | Actions _LLM_ séparées de la structure de messages | Sessions tolérantes au _drift_ (§6.3) |



Deux jalons confirment la fertilité de la veine MSC et expliquent pourquoi Bollig l'a mobilisée. Deniélou & Yoshida (ESOP 2012, l'un des deux _best papers_ de la conférence) établissent le pont entre MPST et _communicating finite-state machines_ (CFSM), qui sous-tend la vérification par projection et synthèse de moniteurs (`confirmé`)[^p2-38]. Stutz (ECOOP 2023) montre que l'implémentabilité des MPST asynchrones à **choix dirigé par l'émetteur** est **décidable**, en adaptant des techniques fondatrices des _high-level message sequence charts_, et que certaines généralisations deviennent **indécidables** (`confirmé`)[^p2-39] — c'est la même veine MSC qu'exploite Bollig.

La tension est réelle et reste à trancher au niveau du corpus : l'analogie directrice `M(pi)`/π-calcul oriente la **sémantique** du CIA, tandis que les résultats **mécanisés** d'implémentabilité et de coordination d'agents _LLM_ (Stutz, Bollig, Li & Wies) gravitent autour des MSC/CFSM. Faut-il **compléter** l'ancrage π-calcul par un ancrage MSC/CFSM, plus proche des résultats d'implémentabilité mécanisés ? La question est ouverte (§6.9).

Un appareil coalgébrique (Session Coalgebras) offre par ailleurs une vue comportementale complémentaire au π-calcul pour raisonner sur la composition, mais sa venue primaire exacte et son DOI restent à vérifier (`probable`)[^p2-40] ; de même, la vérification à l'exécution probabiliste (PSTMonitor, moniteurs _runtime_ dérivés de types de session enrichis de probabilités) est une voie pertinente pour des agents non déterministes, mais sa venue/version exactes ne sont pas re-vérifiées ici (`probable`)[^p2-41].

#### 6.9 Synthèse : ce que le CIA hérite, ce qu'il revendique

Le tableau suivant sépare, composant par composant, le **socle hérité de la littérature** (vérifié) de la **revendication propre au corpus** (déférée), afin qu'aucune prétention canonique ne soit confondue avec un acquis publié.


***Tableau — Frontière hérité/revendiqué du CIA. La colonne de droite est entièrement déférée au corpus mère (À reprendre du corpus mère) ; aucun de ces éléments n'est fabriqué ici.***

| **Composant du CIA** | **Socle hérité (état de l'art, juin 2026)** | **Revendication propre au corpus (déférée)** |
| --- | --- | --- |
| Projection global→local | MPST (Honda-Yoshida-Carbone) ; fragment de sûreté corrigé 2025 | Projection appliquée aux agents _LLM_ sous régime opérateur τ |
| Sessions probabilistes | PReST : choix probabiliste + régulier, terminaison presque-sûre | Sessions **tolérantes au _drift_**, lien à D‑Sens et _t_fix</sub>(g) |
| Algèbre d'héritage de garanties | Délégation sans interblocage (MPGV/Iris) | Lois de propagation/affaiblissement des garanties du substrat |
| Mécanisation | Coq/Rocq (métathéorie) ; Lean 4 pour MSC d'agents (Bollig) | Mécanisation Lean 4 du CIA — **innovation à justifier** |
| Validation empirique | Type→agent prouvé faisable (Bergenti, JADE) | Banc `AgentMeshKafka` ; statuts d'invariants `I_1`–`I_5` |



#### 6.10 Questions ouvertes

- **Ancrage π-calcul vs MSC/CFSM.** L'analogie directrice est `M(pi)`/π-calcul, mais les résultats **mécanisés** d'implémentabilité et de coordination d'agents _LLM_ (Stutz ECOOP 2023, Li & Wies ITP 2025, Bollig) privilégient les MSC/automates communicants. Le CIA doit-il **compléter** son ancrage π-calcul par un ancrage MSC/CFSM, plus proche des résultats de décidabilité mécanisés ? (`à vérifier` — décision de conception, à consigner en ADR.)
- **Positionnement de la mécanisation Lean 4.** La revendication Lean 4 du CIA n'est pas contredite par l'état de l'art (`confirmé`), mais reste une **innovation défendable** (`probable`) tant qu'aucune autre mécanisation Lean 4 **des types de session stricto sensu** (et non des MSC) n'émerge. Re-balayer « session types Lean 4 » à la date de finalisation du chapitre.
- **Statut de publication revue du préprint Bollig-Függer-Nowak** (arXiv 2604.17612) : aucune venue confirmée en date de juin 2026 (`à vérifier`). Surveiller dblp/DOI ; ne pas citer de venue tant qu'absente. Vérifier aussi la **publicité et la taille de l'artefact Lean 4** de Bollig, pour comparaison avec le CIA.
- **Frontière exacte entre PReST et les sessions tolérantes au _drift_.** PReST capture une distribution sur des branches d'un protocole ; la tolérance au _drift_ vise la préservation du sens sous fixation tardive de _t_fix</sub>(g). La construction canonique du type tolérant au _drift_ et sa relation de sous-typage restent à reprendre du corpus (encadré ci‑dessus encadré §6.3).
- **Statut empirique des invariants.** I4 (Hypothèse) demeure une hypothèse (campagne `AgentMeshKafka` non concluante) ; tout passage Hypothèse→Confirmé/Réfuté exige une justification empirique citée et une entrée ADR (CLAUDE.md §9). Les énoncés et conditions de réfutation de `I_1`, `I_2`, `I_3`, `I_5` restent à reprendre du corpus.
- **Venues/DOI à re-vérifier** (`à vérifier`) : PSTMonitor (arXiv 2212.07329) et Session Coalgebras (POPL 2021 vs version journal). Re-vérification CrossRef/dblp avant intégration en bibliographie normative.



### Ch. 7 — Patrons d'intégration agentique : une filiation reconstruite des Enterprise Integration Patterns

Le pontage entre les _Enterprise Integration Patterns_ (EIP) de Hohpe et Woolf et les patrons agentiques-_LLM_ est **entièrement reconstruit** par la littérature secondaire et académique : il n'est revendiqué par aucune source primaire éditeur. _Building Effective Agents_ (Anthropic) ne mentionne ni les EIP, ni Hohpe, ni le LCIM ; la page officielle des EIP et ses _Conversation Patterns_ n'évoquent ni agents ni _LLM_.[^p2-42][^p2-43] Les correspondances « classique ↔ agentique » sont donc une **thèse d'analyse**, posée et assumée ici comme telle, et non un fait déclaré par les auteurs d'origine. Ce chapitre opère ce pontage en le qualifiant explicitement de filiation _reconstruite, non revendiquée_, et le rattache au canon : les patrons agentiques **opérationnalisent la rupture composition→délégation** — le troisième terme des déterministe→probabiliste, syntaxique→sémantique, composition→délégation — en déplaçant le prédicat de routage du déterminisme syntaxique vers la médiation sémantique par agent.

#### 7.1 La thèse de pontage et son statut épistémique

Le couplage « EIP ↔ patrons agentiques » relève de la littérature grise et des préprints, jamais d'une revendication d'éditeur ; cet écart de provenance est lui-même structurant et ne doit pas être lissé. Trois constats l'établissent en date de juin 2026.

Premièrement, les **sources primaires éditeur sont muettes sur le pont**. Anthropic codifie sept patrons agentiques — _Augmented LLM_, _Prompt Chaining_, _Routing_, _Parallelization_, _Orchestrator-Workers_, _Evaluator-Optimizer_, _Agents_ — sans aucune référence aux EIP, à Hohpe, au _Message Router_ ni au LCIM, alors même que la description du patron _Routing_ (« _classifies an input and directs it to a specialized followup task_ ») est un analogue fonctionnel quasi littéral du _Message Router_.[^p2-44] Symétriquement, la page officielle des EIP et le _Volume 2 — Conversation Patterns_ (annoncé _work in progress_, « _Last update: Jan 2017_ », copyright « © 2003, 2023 ») n'introduisent ni agents ni _LLM_, et aucune deuxième édition formelle du Volume 1 n'existe à juin 2026.[^p2-45] `confirmé`

Deuxièmement, **la reconstruction provient de la littérature académique et grise**. Le _survey_ de Sarkar et Sarkar sur la communication d'agents _LLM_ via _MCP_ « _revisits well-established patterns, including Mediator, Observer, Publish-Subscribe, and Broker_ » — patrons GoF et systèmes distribués qui recoupent _partiellement_ les EIP, mais sans citer nommément « Enterprise Integration Patterns », Hohpe ni le LCIM dans l'abrégé.[^p2-46] De même, Milosevic et Rabhi stratifient le champ en « _LLM Agents, Agentic AI, and Agentic Communities_ » sans invoquer Hohpe ou les EIP dans l'abrégé (le catalogue détaillé en annexe restant `à vérifier` au niveau de la source primaire).[^p2-47] `confirmé` (abrégé)

Troisièmement, **un précurseur historique pré-_LLM_ nuance le verdict**. La lignée même du LCIM mobilisait déjà, en 2007, les « _intelligent software agents using the Internet_ » et comportait une section « _Motivation for Agent Mediated Decision Support_ » (« _the agent must be aware of the assumptions and constraints underlying the model_ »).[^p2-48] Il s'agit d'agents logiciels classiques, pré-_LLM_, sans aucune mention de grands modèles de langage ; cette filiation « agents ↔ niveaux supérieurs du LCIM » précède de près de deux décennies l'agentique _LLM_. Elle offre un **ancrage historique au pontage du présent chapitre, à présenter comme analogie et précurseur, non comme équivalence**. `confirmé`

La conséquence méthodologique est nette : tout le chapitre tient son autorité de la cartographie qu'il construit, non d'un endossement d'éditeur. C'est une thèse réfutable — sa condition de réfutation est l'apparition d'une source primaire (Anthropic, page EIP, ou travail _peer-reviewed_) revendiquant explicitement la correspondance, auquel cas le statut « reconstruit » tomberait au profit de « déclaré ».

#### 7.2 Le socle classique : 65 patrons, sept catégories, un langage iconographique

Le catalogue de Hohpe et Woolf fournit la grammaire de référence de l'intégration par messages, organisée le long du flot d'un message ; c'est cette grammaire que le régime agentique réinterprète. Le catalogue _Enterprise Integration Patterns: Designing, Building, and Deploying Messaging Solutions_ (Addison-Wesley, 10 octobre 2003, ISBN 978-0321200686) recense **65 patrons** — le site officiel précise « _This pattern catalog includes 65 integration patterns_ ».[^p2-49][^p2-50] `confirmé`

Ces 65 patrons se répartissent en **sept catégories** suivant le cheminement d'un message : (1) _Integration Styles_ ; (2) _Messaging Channels_ ; (3) _Message Construction_ ; (4) _Message Routing_ ; (5) _Message Transformation_ ; (6) _Messaging Endpoints_ ; (7) _System Management_. Le décompte « ~9 catégories » que l'on rencontre parfois provient de l'ajout des chapitres introductifs ; la structure officielle en compte explicitement sept — divergence de décompte à ne pas reporter (D7.3). `confirmé` Le langage de patrons est iconographique, surnommé « _GregorGrams_ » (Wikipedia : « _an icon-based pattern language, sometimes nicknamed GregorGrams_ »), et ses implémentations de référence sont _Apache Camel, Red Hat Fuse, Mule ESB (MuleSoft), Spring Integration_ et _Guarana DSL_.[^p2-51] `confirmé`

L'enjeu pour le canon est que cette grammaire est **déterministe et syntaxique** : le _Message Router_ route sur un prédicat évalué sur la structure du message, le _Content-Based Router_ sur le contenu typé, le _Scatter-Gather_ orchestre un _fan-out_ vers une liste de destinataires connue. Aucun de ces prédicats n'interprète le _sens_. C'est précisément là que les deux premières des déterministe→probabiliste, syntaxique→sémantique, composition→délégation — déterministe→probabiliste et syntaxique→sémantique — viennent transformer le patron sans en changer la silhouette.

#### 7.3 Cartographie EIP ↔ patrons agentiques

La transposition agentique conserve la _topologie_ du patron classique mais en déplace le _prédicat_ : là où l'EIP évalue une condition syntaxique déterministe, le patron agentique substitue une classification probabiliste par _LLM_ ou une similarité sémantique. C'est l'opérationnalisation directe de la délégation, où le sous-traitant n'est plus une branche de code mais un agent dont le comportement est fixé à l'exécution.


***Tableau — Correspondances EIP ↔ patrons agentiques. **Avertissement* : analogie reconstruite par la littérature d'analyse, non filiation déclarée — Anthropic ne cite pas les EIP.**

| **Patron EIP (Hohpe & Woolf, 2003)** | **Patron agentique (Anthropic, 2024)** | **Nature du pont (analogie reconstruite)** |
| --- | --- | --- |
| _Message Router_ — prédicat déterministe | _Routing_ — « _classifies an input… specialized followup_ » | Analogue fonctionnel ; prédicat structurel → classification par _LLM_ |
| _Scatter-Gather_ / _Aggregator_ | _Parallelization_ — _Sectioning_ (« _independent subtasks in parallel_ ») / _Voting_ (« _diverse outputs_ ») | Analogue _fan-out_ / agrégation ; agrégat de votes au lieu d'agrégat de réponses |
| _Content-Based Router_ / _Recipient List_ | _Orchestrator-Workers_ | Correspondance suggérée, à cartographier finement (`à vérifier`) |
| _Message Router_ + espace vectoriel | _semantic-router_ (Aurelio Labs) — prédicat vectoriel | Pont direct : niveau sémantique (L3 du LCIM) ↔ _Message Router_ |



Les correspondances de ce tableau s'appuient sur les descriptions _verbatim_ d'Anthropic et sur le routage sémantique d'Aurelio Labs ; la ligne _Orchestrator-Workers_ reste la plus spéculative et appelle une cartographie fine (question ouverte 7.3).[^p2-52] Le point d'ancrage canonique se lit ainsi : le patron _Routing_ agentique **est une instance dégénérée de** opérateur τ. Quand le routeur agentique classifie une entrée pour la diriger, il **déplace l'instant de fixation du sens** _t_fix</sub>(g) — la branche n'est plus déterminée par la structure du message à la compilation, mais par l'interprétation du sens à l'exécution. Là où τ formalise ce déplacement en arbitrant entre régime déterministe et régime probabiliste, le patron _Routing_ d'Anthropic en livre une réalisation d'ingénierie sans la garde formelle. La définition canonique complète de τ, de ses dimensions d'entrée D‑Sens, D‑Autorité, D‑Invariant et de sa sortie Decision ∈ {Déterministe, Probabiliste, Refus} relève du chap. III.8 du corpus mère et n'est pas dupliquée ici.


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère (chap. III.8) la formalisation exacte par laquelle le patron Routing agentique s'instancie comme cas particulier de opérateur τ : conditions sur D‑Sens (seuil de score sémantique déclenchant le routage probabiliste), traitement de D‑Autorité lorsque la cible de routage exige une autorité supérieure à celle de l'appelant, et règle produisant τ‑Refus lorsque le prédicat sémantique est sous le seuil de confiance. Ces règles précises ne sont pas fournies au présent chapitre.


#### 7.4 Le routage sémantique comme instanciation directe du Message Router

Le routage sémantique constitue le pont le plus net et le plus opérationnel du chapitre : il instancie le _Message Router_ des EIP en remplaçant le prédicat de routage déterministe par une **similarité vectorielle dans l'espace sémantique**. La bibliothèque _semantic-router_ d'Aurelio Labs se décrit comme « _a superfast decision-making layer for your LLMs and agents. Rather than waiting for slow LLM generations to make tool-use decisions, we use the magic of semantic vector space to make those decisions, routing our requests using semantic meaning._ »[^p2-53] On y définit des routes par des _utterances_ exemples ; à l'exécution, la requête est encodée et dirigée vers la route dont les exemples sont sémantiquement les plus proches. `confirmé`

C'est un **pont direct entre le niveau Sémantique (L3) du LCIM et le patron _Message Router_** : le routeur ne lit plus un en-tête ni un champ typé, il lit le sens. Le schéma de configuration ci-dessous illustre la forme du prédicat — un ensemble d'_utterances_ par route, le routage s'opérant par proximité d'encodage plutôt que par égalité syntaxique.

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

La dernière clause est le point de jonction avec le canon. Lorsque la similarité maximale tombe sous un seuil, le routeur sémantique « pur » n'a pas de réponse sûre : il route quand même vers la route la moins lointaine, ou échoue silencieusement. **C'est exactement la zone où l'arbitrage** opérateur τ **intervient** : sous le seuil de confiance sémantique (D‑Sens faible), la sortie correcte n'est ni le régime déterministe ni le régime probabiliste, mais τ‑Refus. Le routage sémantique d'Aurelio Labs livre donc le mécanisme de dispatch sans la garde — il route, mais ne refuse pas ; τ ajoute la troisième issue. La médiation par agents (le patron _Orchestrator-Workers_, la délégation à un agent comptable ou SRE dans le schéma) hérite de cette même exigence : déléguer suppose un arbitrage sur l'autorité de la cible, ce que D‑Autorité encode et que le routeur sémantique nu ignore.

#### 7.5 Statut des sources sur le pontage — divergences à ne pas lisser

Le tableau suivant consolide la provenance de chaque source mobilisée et son positionnement face au pont EIP/LCIM ↔ agentique ; il rend visible que **la revendication explicite n'existe qu'au niveau secondaire/académique, jamais primaire éditeur**.


***Tableau — Provenance et positionnement des sources sur la filiation EIP/LCIM ↔ agentique (en date de juin 2026).***

| **Source** | **Type** | **Revendique le pont EIP/LCIM ↔ agentique ?** | **Date** |
| --- | --- | --- | --- |
| Anthropic, _Building Effective Agents_ | Primaire éditeur | **Non** — aucune réf. EIP / Hohpe / LCIM | 19 déc. 2024 |
| Page officielle EIP + _Conversation Patterns_ | Primaire éditeur | **Non** — aucun agent / _LLM_ | 2017–2023 |
| Sarkar & Sarkar, arXiv:2506.05364 | Académique (préprint) | **Partiellement** — _Mediator_ / _Observer_ / _Pub-Sub_ / _Broker_, GoF ; Hohpe non cité dans l'abrégé | v1 26 mai 2025 / v2 22 mai 2026 |
| Milosevic & Rabhi, arXiv:2601.03624 | Académique (préprint) | **Non explicitement** dans l'abrégé (annexe `à vérifier`) | v1 7 jan. 2026 / v3 25 mai 2026 |
| LCIM 2007 (Tolk / Diallo / Turnitsa) | Primaire (académique) | **Précurseur pré-_LLM_** — « _intelligent software agents_ », pas de _LLM_ | 2007 |



Quatre divergences sont conservées telles quelles. **D7.1** — les sources primaires éditeur (Anthropic ; page EIP + _Conversation Patterns_) ne revendiquent aucun lien explicite EIP/LCIM ↔ agentique ; le pontage est entièrement reconstruit par la littérature secondaire et académique. **D7.2** — le _survey_ arXiv:2506.05364 emploie _Mediator_ / _Observer_ / _Publish-Subscribe_ / _Broker_ (patrons GoF et systèmes distribués) plutôt que la nomenclature exacte de Hohpe et Woolf ; le recoupement avec les EIP est _partiel_, sans citation d'origine dans l'abrégé. **D7.3** — le décompte « ~9 catégories » parfois cité provient de l'ajout des chapitres introductifs ; la structure officielle compte sept groupes thématiques. **D7.4** — nuance compensatoire : la lignée LCIM invoquait déjà les « _intelligent software agents_ » en 2007, ce que D7.1 n'efface pas — précurseur historique pré-_LLM_ réel.

#### 7.6 Ancrage au CIA et frontière de validité

Le pontage de ce chapitre est **informel par construction** : il met en regard des patrons d'ingénierie, là où le CIA vise la garantie formelle de l'intégration. La distance entre les deux est l'objet propre du Calcul d’Intégration Agentique (CIA). Les patrons agentiques décrits ici — _Routing_, _Parallelization_, _Orchestrator-Workers_ — exhibent le _comportement_ que le CIA entend borner : un agent _LLM_ dont la décision de routage ou de délégation est probabiliste et susceptible de _drift_, opérant au-dessus d'un substrat de messages à garanties déterministes (Kafka/MQ). Le rôle du CIA est de fournir l'algèbre d'héritage de garanties et les types de session tolérants au _drift_ qui qualifieraient _formellement_ ce qu'un patron comme _Scatter-Gather_ agentique préserve ou détruit comme garantie de bout en bout.

Ce raccordement reste à l'état de programme : les patrons sont catalogués (niveau empirique, ce chapitre), leur garantie est à formaliser (niveau CIA, chap. 6 et corpus mère). En particulier, la question de savoir si un routeur sémantique préserve un invariant de bout en bout sous _drift_ touche directement I4 (Hypothèse), qui demeure une hypothèse — la campagne empirique sur le banc _AgentMeshKafka_ n'étant pas concluante à ce jour. Ne pas présenter comme acquise la préservation d'invariant par un patron agentique.


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère : (a) les énoncés précis et statuts des invariants I1, I2, I3, I5 — non fournis au présent chapitre — afin de qualifier lesquels chaque patron agentique (Routing, Parallelization, Orchestrator-Workers) est censé préserver ou mettre en péril ; (b) les règles précises de l'algèbre d'héritage de garanties du CIA déterminant comment un Scatter-Gather agentique compose les garanties de ses branches ; (c) la mécanisation Lean 4 correspondante. Ces contenus formels ne sont pas fournis ici et ne doivent pas être inventés.



> ⟢ ***À reprendre du corpus mère*** — Statut de I4 (Hypothèse) : reprendre du corpus mère la formulation exacte de I4 et l'état de la campagne empirique AgentMeshKafka, pour appuyer l'affirmation ci-dessus selon laquelle la préservation d'invariant par un patron de routage agentique reste une hypothèse non confirmée.


#### 7.7 Marqueurs d'incertitude (synthèse)


***Tableau — Synthèse des marqueurs d'incertitude du chapitre 7 (en date de juin 2026).***

| **Fait** | **Marqueur** |
| --- | --- |
| EIP : 65 patrons, 10 oct. 2003, ISBN 978-0321200686 | `confirmé` |
| EIP : sept catégories de patrons | `confirmé` |
| « GregorGrams » + implémentations (Camel / Spring / Mule…) | `confirmé` |
| _Conversation Patterns_ (Vol. 2) = WIP « Jan 2017 », sans agents/_LLM_ | `confirmé` |
| Anthropic : sept patrons, 19 déc. 2024, sans réf. EIP/LCIM | `confirmé` |
| Sarkar & Sarkar (Mediator/Observer/Pub-Sub/Broker) | `confirmé` (abrégé) |
| Milosevic & Rabhi (trois niveaux) — annexe | `à vérifier` |
| semantic-router = _Message Router_ à prédicat vectoriel | `confirmé` |
| LCIM 2007 motivé par « intelligent software agents » (pré-_LLM_) | `confirmé` |
| Pontage EIP/LCIM ↔ agentique = reconstruit, non revendiqué | `confirmé` |



#### 7.8 Questions ouvertes

- Vérifier si le _Volume 2 — Conversation Patterns_ de Hohpe a reçu une mise à jour après janvier 2017 ou une publication formelle d'ici 2026–2027 : le copyright affiche « 2023 » alors que la mention « _Last update: Jan 2017_ » subsiste — statut figé à clarifier.
- Établir si un travail académique _peer-reviewed_ — au-delà des préprints arXiv et des billets d'ingénierie tiers — revendique explicitement la correspondance EIP ↔ patrons agentiques, ou si elle demeure exclusivement dans la littérature grise et les préprints à juin 2026. C'est la condition de réfutation directe du statut « reconstruit, non revendiqué ».
- Cartographier finement la correspondance entre patrons EIP précis (_Message Router_, _Scatter-Gather_, _Aggregator_, _Content-Based Router_, _Recipient List_) et patrons Anthropic (_Routing_, _Parallelization_ Sectioning/Voting, _Orchestrator-Workers_), en signalant à chaque entrée qu'il s'agit d'une analogie reconstruite, non d'une filiation déclarée ; la ligne _Orchestrator-Workers_ est la plus incertaine.
- Vérifier le catalogue détaillé en annexe de Milosevic et Rabhi (arXiv:2601.03624) : cite-t-il nommément Hohpe / EIP / LCIM hors abrégé ? (`à vérifier` — non vérifié au niveau de la source primaire).
- Au plan canonique : formaliser, depuis le corpus mère, la condition exacte sous laquelle un routeur sémantique doit produire τ‑Refus plutôt que de router vers la route la moins lointaine, et déterminer si cette garde préserve l'invariant pertinent — question liée à I4 (Hypothèse), non résolue.

[^p2-1]: KIP-98 — Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — 2026-03-04 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging>
[^p2-2]: Transaction Protocol (doc officielle 4.1, activation serveur depuis 4.0) — Apache Software Foundation — 2025-09-04 — <https://kafka.apache.org/41/operations/transaction-protocol/>
[^p2-3]: Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — <https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/>
[^p2-4]: Exactly-once Semantics is Possible: Here is How Apache Kafka Does It — Confluent (Narkhede, Wang et al.) — 2025-03-01 — <https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/>
[^p2-5]: Exactly once support — IBM MQ 9.4.x Documentation — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.4.x?topic=scenarios-exactly-once-support>
[^p2-6]: Syncpoints in IBM MQ for Multiplatforms — IBM MQ 9.3.x Documentation — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.3.x?topic=work-syncpoints-in-mq-multiplatforms>
[^p2-7]: Introducing IBM MQ version 9.4: Built for change — IBM — 2024-05-14 — <https://www.ibm.com/new/announcements/introducing-ibm-mq-version-9-4-built-for-change>
[^p2-8]: IBM MQ 9.4.5 Continuous Delivery releases are available — IBM Community (Ian Harwood, IBM Hursley) — 2026-01-30 — <https://community.ibm.com/community/user/blogs/ian-harwood1/2026/01/30/mq945ga>
[^p2-9]: Integrating AI Into Apache Kafka Architectures: Patterns — Confluent — 2026-05-05 — <https://www.confluent.io/blog/ai-kafka-integration-patterns/>
[^p2-10]: Synthèse Ch. 9 (II) du dossier de recherche, corroborée par la littérature systèmes (Deux Généraux / FLP) ; cf. aussi IBM MQ «&nbsp;Exactly once support&nbsp;» et Confluent «&nbsp;Exactly-once Semantics is Possible&nbsp;».
[^p2-11]: Comparaison de substrats, Tableau 8 du dossier de recherche ; IBM MQ vs Apache Kafka — sémantique et critères de choix.
[^p2-12]: Exactly-once Semantics is Possible: Here is How Apache Kafka Does It — Confluent — 2025-03-01 — <https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/>
[^p2-13]: Integrating AI Into Apache Kafka Architectures: Patterns — Confluent — 2026-05-05 — <https://www.confluent.io/blog/ai-kafka-integration-patterns/>
[^p2-14]: Integrating AI Into Apache Kafka Architectures: Patterns — Confluent — 2026-05-05 — <https://www.confluent.io/blog/ai-kafka-integration-patterns/>
[^p2-15]: KIP-939: Support Participation in 2PC (Accepted, version non spécifiée) — Apache Software Foundation — 2024-06-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC>
[^p2-16]: Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — <https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/>.
[^p2-17]: Exactly-once Semantics is Possible: Here is How Apache Kafka Does It — Confluent (Narkhede, Wang et al.) — 2025-03-01 — <https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/>.
[^p2-18]: Integrating AI Into Apache Kafka Architectures: Patterns — Confluent — 2026-05-05 — <https://www.confluent.io/blog/ai-kafka-integration-patterns/>.
[^p2-19]: Confluent, op. cit. (2025-03-01) : la garantie EOS ne s'étend pas aux effets de bord externes au cluster Kafka.
[^p2-20]: Confused Deputy Attacks on Autonomous AI Agents — Cloud Security Alliance (AI Safety Initiative) — 2026-03-23 — <https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-confused-deputy-prompt-injection/>.
[^p2-21]: OWASP GenAI Security Project Releases Top 10 Risks and Mitigations for Agentic AI Security — OWASP GenAI Security Project — 2025-12-09 — <https://genai.owasp.org/2025/12/09/owasp-genai-security-project-releases-top-10-risks-and-mitigations-for-agentic-ai-security/>.
[^p2-22]: Understanding prompt injections: a frontier security challenge — OpenAI — 2025 (date exacte de la page `à vérifier` : HTTP 403 à la récupération directe) — <https://openai.com/index/prompt-injections/>.
[^p2-23]: From LLM to agentic AI: prompt injection got worse — Christian Schneider (chercheur sécurité, source secondaire) — 2025 — <https://christian-schneider.net/blog/prompt-injection-agentic-amplification/>.
[^p2-24]: draft-araut-oauth-transaction-tokens-for-agents-02 (agentic_ctx ; Monotonic Attenuation) — IETF Datatracker — 2026-05-22 — <https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/>.
[^p2-25]: Probabilistic Refinement Session Types — ACM (PACMPL / PLDI 2025) — 2025-06-10 — <https://api.crossref.org/works/10.1145/3729317>.
[^p2-26]: Provable Coordination for LLM Agents via Message Sequence Charts (Lean 4) — arXiv — 2026-04-29 — <https://arxiv.org/abs/2604.17612>.
[^p2-27]: Multiparty asynchronous session types — ACM SIGPLAN-SIGACT (POPL) — 2008 — DOI 10.1145/1328438.1328472, p. 273-284.
[^p2-28]: Multiparty Asynchronous Session Types — J. ACM 63(1):9:1-9:67 — 2016 — DOI 10.1145/2827695. Catalogage de l'« Article 9 » confirmé par dblp ; CrossRef n'enregistre que la plage de pages 1-67, divergence signalée, non lissée.
[^p2-29]: Multiparty Asynchronous Session Types: A Mechanised Proof of Subject Reduction — Schloss Dagstuhl, LIPIcs (ECOOP 2025), art. 31:1-31:30 — 2025-06-25 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.31 — mécanisation Coq.
[^p2-30]: Probabilistic Refinement Session Types — ACM, PACMPL 9(PLDI):1666-1691 — 2025-06-10 — DOI 10.1145/3729317. Études de cas : élection de leader d'Itai-Rodeh, _bounded retransmission_, chaînes de Markov paramétriques.
[^p2-31]: Multiparty GV — ACM, PACMPL 6(ICFP):466-495 — 2022-08-29 — DOI 10.1145/3547638 — artefact Zenodo 6606474.
[^p2-32]: Zooid: a DSL for certified multiparty computation — ACM SIGPLAN (PLDI) — 2021-06-18 — DOI 10.1145/3453483.3454041, p. 237-251 ; arXiv 2103.10269.
[^p2-33]: Certified Implementability of Global Multiparty Protocols — Schloss Dagstuhl, LIPIcs (ITP 2025), art. 15:1-15:20 — 2025-09-22 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ITP.2025.15.
[^p2-34]: Mechanizing the Meta-Theory of Session Types in Rocq: a Tutorial — Momigliano et al., U. Milano — 2025 — https://momigliano.di.unimi.it/papers/stutorial.pdf.
[^p2-35]: Provable Coordination for LLM Agents via Message Sequence Charts — arXiv 2604.17612, v2 (40 p.), outil ZipperGen — 2026-04-29 — https://arxiv.org/abs/2604.17612. La mécanisation Lean 4 est ajoutée en v2 ; v1 n'en faisait pas mention.
[^p2-36]: Page arXiv canonique 2604.17612 — aucune venue de conférence listée — 2026-04-29 — https://arxiv.org/abs/2604.17612. L'attribution « 46th Int. Conf. on Petri Nets, Paris, juin 2025 » n'est pas confirmée ; confusion probable avec la lignée fondatrice MSC/automates (Deniélou-Yoshida ESOP 2012 ; Stutz ECOOP 2023).
[^p2-37]: Correct implementation of agent interaction protocols — Frontiers in Computer Science, vol. 7 — 2025-10-31 — DOI 10.3389/fcomp.2025.1659785.
[^p2-38]: Multiparty Session Types Meet Communicating Automata — Springer, LNCS 7211:194-213 (ESOP 2012) — 2012 — DOI 10.1007/978-3-642-28869-2_10.
[^p2-39]: Asynchronous Multiparty Session Type Implementability is Decidable — Lessons Learned from Message Sequence Charts — Schloss Dagstuhl, LIPIcs (ECOOP 2023), art. 32:1-32:31 — 2023-07-11 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2023.32.
[^p2-40]: Session Coalgebras: A Coalgebraic View on Session Types and Communication Protocols — 2021 — https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7984539/ — venue primaire (POPL 2021 vs version journal) et DOI à vérifier.
[^p2-41]: PSTMonitor: Monitor Synthesis from Probabilistic Session Types — arXiv 2212.07329 — 2022-12 — https://arxiv.org/pdf/2212.07329 — venue/version à vérifier.
[^p2-42]: _Building Effective Agents_ — Anthropic — 19 déc. 2024 — https://www.anthropic.com/engineering/building-effective-agents
[^p2-43]: _Enterprise Integration Patterns — Messaging Patterns Overview_ (site officiel) — Gregor Hohpe / enterpriseintegrationpatterns.com — 2023 — https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html
[^p2-44]: _Building Effective Agents_ — Anthropic — 19 déc. 2024 — https://www.anthropic.com/engineering/building-effective-agents
[^p2-45]: _Enterprise Integration Patterns — Conversation Patterns_ (Vol. 2, « Work in progress. Last update: Jan 2017 ») — Gregor Hohpe / enterpriseintegrationpatterns.com — 2017 — https://www.enterpriseintegrationpatterns.com/patterns/conversation/
[^p2-46]: _Survey of LLM Agent Communication with MCP: A Software Design Pattern Centric Review_ (Sarkar & Sarkar) — arXiv:2506.05364 — v1 26 mai 2025 / v2 22 mai 2026 — https://arxiv.org/abs/2506.05364
[^p2-47]: _Architecting Agentic Communities using Design Patterns_ (Milosevic & Rabhi) — arXiv:2601.03624 — v1 7 jan. 2026 / v3 25 mai 2026 — https://arxiv.org/abs/2601.03624
[^p2-48]: _Applying the LCIM in Support of Integratability, Interoperability, and Composability for SoS Engineering_ (Tolk, Diallo, Turnitsa) — Journal of Systemics, Cybernetics and Informatics, Vol. 5 No 5 (IIIS), ISSN 1690-4524 — 2007 — https://www.iiisci.org/journal/pdv/sci/pdfs/p468106.pdf
[^p2-49]: _Enterprise Integration Patterns_ — Wikipedia (Hohpe & Woolf, 10 oct. 2003, ISBN 978-0321200686, 65 patrons) — 2025 — https://en.wikipedia.org/wiki/Enterprise_Integration_Patterns
[^p2-50]: _Enterprise Integration Patterns — Messaging Patterns Overview_ (site officiel) — Gregor Hohpe / enterpriseintegrationpatterns.com — 2023 — https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html
[^p2-51]: _Enterprise Integration Patterns_ — Wikipedia — 2025 — https://en.wikipedia.org/wiki/Enterprise_Integration_Patterns
[^p2-52]: _Building Effective Agents_ — Anthropic — 19 déc. 2024 — https://www.anthropic.com/engineering/building-effective-agents
[^p2-53]: _aurelio-labs/semantic-router — README_ — Aurelio Labs (GitHub) — 2026 — https://github.com/aurelio-labs/semantic-router/blob/main/README.md

## PARTIE III — Protocoles et standards

### Ch. 8 — Paysage des protocoles d'interopérabilité agentique

**Insight-clé.** En date de juin 2026, le paysage protocolaire agentique ne converge pas vers un protocole unique mais se stratifie en couches complémentaires sous la Linux Foundation — _MCP_ pour l'accès aux outils, A2A pour la délégation inter-agents, AGNTCY pour l'annuaire/identité/transport, AG-UI et A2UI pour l'interface usager [^p3-1]. Cette stratification n'est pas un accident d'ingénierie : elle calque la rupture **composition→délégation** (cf. Ch. 1–2). Tant que les agents se **composaient** — appels d'outils déterministes ordonnancés par un programme hôte — une seule couche d'accès aux capacités (_MCP_) suffisait ; dès qu'ils **délèguent** — un agent confie une tâche à un autre agent autonome dont il ne contrôle ni le plan ni le régime d'exécution — il faut une couche distincte de message/tâche inter-agents (A2A) et une couche d'identité/découverte (AGNTCY). La frontière MCP↔A2A est donc la matérialisation protocolaire de la frontière composition↔délégation, et non une simple redondance de transport.

La conséquence opératoire est directe pour opérateur τ : un appel _MCP_ (accès outil, périmètre composition) et une délégation A2A (tâche confiée, périmètre délégation) ne déplacent pas _t_fix</sub>(g) au même instant ni avec la même autorité. La dimension D‑Autorité de τ — autorité de l'appelant × autorité requise de la cible (cf. Ch. 5) — s'évalue différemment selon que la cible est un outil sous contrat déterministe ou un agent _LLM_ tiers ; c'est précisément là que se joue le risque de **confused deputy** que le modèle d'autorisation _MCP_ cherche à clore (§ Sécurité ci-dessous).

#### La stratification, couche par couche

**Insight-clé.** Quatre familles protocolaires occupent quatre couches fonctionnelles disjointes ; leurs promoteurs les présentent comme complémentaires, et la fusion ACP→A2A (août 2025) a éliminé le principal recouvrement.

_MCP_ (Anthropic) occupe la couche **accès aux outils** : un agent y découvre et invoque des ressources, **prompts** et outils exposés par un serveur, sous un cœur explicitement **stateful** dans sa révision stable 2025-11-25 [^p3-2]. A2A (Agent2Agent, originellement Google) occupe la couche **message/tâche inter-agents** : un agent y délègue une tâche à un agent pair décrit par une **Agent Card**, avec négociation de capacités et suivi de cycle de vie de tâche [^p3-3]. AGNTCY (Outshift/Cisco) occupe la couche **infrastructure** — OASF, Agent Directory, Identity, transport SLIM (_Secure Low-latency Interactive Messaging_, avec mention **quantum-safe**) et observabilité — et se déclare interopérable avec A2A et _MCP_ [^p3-4]. AG-UI (CopilotKit) et A2UI (Google) occupent la couche **interface agent↔usager** et se présentent mutuellement comme complémentaires, non concurrents [^p3-5].

Le recouvrement historique le plus net — ACP (IBM/BeeAI), approche REST-native pour le dialogue inter-agents — a été résorbé : l'équipe ACP a cessé le développement actif et a fusionné dans A2A, Kate Blair (IBM Research) rejoignant le A2A TSC [^p3-6]. En 2026, ACP relève donc du contexte historique, non d'une décision d'architecture courante — distinction à tenir, d'autant qu'AGNTCY a porté jadis un **Agent Connect Protocol** homonyme mais distinct, aujourd'hui disparu de la documentation courante au profit de SLIM (`probable`).


***Tableau — Cartographie de la stratification protocolaire (état au 8 juin 2026). Reprise du dossier d'état de l'art, Partie III.***

| **Protocole** | **Origine / Gouvernance** | **Couche fonctionnelle** | **Version (juin 2026)** | **Licence** | **Statut** |
| --- | --- | --- | --- | --- | --- |
| **A2A** | Google → Linux Foundation (2025-06-23) | Message / tâche inter-agents | v1.0 (spec 1.0.0 ; tag 1.0.1) | Apache 2.0 | `confirmé` |
| **ACP** (IBM) | IBM/BeeAI → fusionné dans A2A | (historique) inter-agents REST | — (déprécié) | — | `confirmé` (historique) |
| **AGNTCY** | Outshift/Cisco → Linux Foundation (2025-07-29) | Annuaire / identité / transport (SLIM) / observabilité | doc courante | open-source LF | `confirmé` |
| **_MCP_** | Anthropic → AAIF / Linux Foundation | Accès outils | 2025-11-25 (RC 2026-07-28) | open-source LF | `confirmé` |
| **AG-UI** | CopilotKit (hors-fondation) | Interface agent ↔ usager | release 2026-06-05 | MIT | `confirmé` |
| **A2UI** | Google (hors-fondation) | Format déclaratif d'UI générative | v0.8 | open project | `confirmé` |



#### Comparaison multidimensionnelle : couche, confiance, gouvernance, maturité, adoption

**Insight-clé.** Sur cinq dimensions, _MCP_ et A2A sont les deux pôles matures (versions stables gouvernées sous LF) ; AGNTCY est l'infrastructure transverse ; AG-UI/A2UI restent hors-fondation et plus jeunes. Aucun de ces protocoles n'invente un modèle de confiance **ad hoc** : tous réutilisent le socle OAuth 2.1 / OIDC / mTLS, ce qui est l'indice fort de la convergence par couches plutôt que par réécriture.

Le modèle de confiance est le discriminant le plus instructif. _MCP_ 2025-11-25 fixe le serveur comme **OAuth 2.1 Resource Server** et impose, côté autorisation, un faisceau d'obligations normatives durcies — détaillées au le tableau ci‑dessus. A2A, lui, n'impose pas un schéma unique : l'**Agent Card** déclare le ou les schémas supportés (API Key, HTTP Auth, OAuth2, OIDC, mTLS) et la v1.0 ajoute la signature de carte (_Signed Agent Cards_, champ `AgentCardSignature`) pour authentifier la métadonnée de découverte elle-même [^p3-7]. La différence est structurante : _MCP_ verrouille l'autorisation parce que l'appel d'outil traverse la frontière de privilège de l'hôte (risque **confused deputy**) ; A2A négocie l'authentification parce que la délégation franchit une frontière organisationnelle (multi-tenant, agents tiers).


***Tableau — Comparaison multidimensionnelle des cinq familles protocolaires (juin 2026). † Réserve métrologique : téléchargements SDK ≠ utilisateurs. ‡ Attribution nominale de déploiements en production (Microsoft/AWS/Salesforce/SAP/ServiceNow) `à vérifier` — non explicitement établie par le communiqué LF.***

| **Dimension** | **_MCP_** | **A2A** | **AGNTCY** | **AG-UI** | **A2UI** |
| --- | --- | --- | --- | --- | --- |
| Couche | Accès outils (composition) | Message/tâche inter-agents (délégation) | Annuaire / identité / transport / observabilité | Interface agent↔usager | UI générative déclarative |
| Modèle de confiance | OAuth 2.1 RS ; RFC 9728/8707/PKCE S256 (MUST) | Schéma déclaré par l'**Agent Card** (API Key/OAuth2/OIDC/mTLS) + carte signée | Identity dédié + SLIM (mention **quantum-safe**) | Transport-agnostique (réf. HTTP+SSE) | Transportée sur A2A / AG-UI (hérite leur confiance) |
| Gouvernance | AAIF (LF) ; gouvernance formalisée (SEP-932/994/1302/1730) | Linux Foundation ; A2A TSC | Linux Foundation (charte/TAC `à vérifier`) | Hors-fondation (CopilotKit) | Hors-fondation (Google, open project) |
| Maturité | Stable 2025-11-25 ; RC 2026-07-28 (`probable`) | Stable v1.0 (12 mars 2026) | Doc courante ; pas de jalon de version unique | Release 2026-06-05 | v0.8 (`probable` pour la trajectoire) |
| Adoption | > 10 000 serveurs publics ; 97 M+ téléch. SDK/mois†</sup> | 150+ organisations (1er anniv., 9 avr. 2026)‡</sup> | Membres formateurs (Cisco/Dell/Google Cloud/Oracle/Red Hat) | ~16 types d'événements ; support A2A confirmé | Annoncé 2025-12-15 ; adoption non chiffrée |



Sur l'adoption, deux réserves du dossier ne doivent pas être lissées. Le chiffre « 97 M+ téléchargements SDK/mois » est une source primaire Anthropic, mais téléchargements de SDK ≠ utilisateurs actifs [^p3-8]. Côté A2A, le communiqué de fondation confirme 150+ organisations et une adoption verticale, mais n'attribue nommément aucun déploiement **en production** aux acteurs souvent cités (Microsoft, AWS, Salesforce, SAP, ServiceNow) : ils figurent comme **supporting organizations**, et la portion « production nominative » reste `à vérifier` [^p3-9]. Enfin, l'allégation d'agrégateur « A2A 1.2 » est **réfutée/non confirmée** par la source primaire : la version protocolaire normative est v1.0, le tag v1.0.1 (28 mai 2026) n'étant qu'un correctif éditorial sans effet sur la compatibilité ni la négociation de version [^p3-10].

#### Convergence par stratification vs fragmentation

**Insight-clé.** La consolidation observée est institutionnelle (mêmes fondations, mêmes briques de confiance) avant d'être technique : _MCP_, A2A et AGNTCY relèvent tous de la Linux Foundation et se réclament d'une complémentarité de couches, ce qui rend l'hypothèse de convergence `probable` plutôt que de fragmentation — sans pour autant garantir l'interopérabilité de bout en bout, qui reste à attester empiriquement.

Trois signaux étayent la lecture « convergence par stratification ». D'abord, l'absorption d'un concurrent direct : ACP (REST inter-agents) a fusionné **dans** A2A plutôt que de coexister, supprimant le doublon de couche. Ensuite, l'alignement de gouvernance : MCP→AAIF (don du 9 décembre 2025), A2A→LF (transfert du 23 juin 2025), AGNTCY→LF (29 juillet 2025) placent les trois piliers sous une même autorité de fondation, avec des conseils Platinum/TSC formalisés [^p3-11]. Enfin, la réutilisation systématique du socle de confiance (OAuth 2.1, OIDC, mTLS) interdit la divergence de modèle d'identité qui caractériserait une vraie fragmentation.

Le contre-argument de prudence demeure. La complémentarité est **déclarée** par les promoteurs, et la mécanique exacte de certains ponts inter-couches reste sous-spécifiée — par exemple le handshake AG-UI↔A2A est `à vérifier`, et le rôle de l'ancien « Agent Connect Protocol » d'AGNTCY n'est pas tracé jusqu'à SLIM. La convergence par stratification est donc l'hypothèse la mieux soutenue, non un fait acquis : son verdict empirique passe par des études de cas d'interopérabilité multi-protocoles, encore manquantes.

#### Le modèle d'autorisation MCP : le point dur de la délégation d'accès

**Insight-clé.** Le durcissement OAuth de _MCP_ 2025-11-25 est la réponse normative directe au **confused deputy** — exactement le risque que la dimension D‑Autorité de τ (cf. Ch. 5) cherche à arbitrer lorsqu'un appelant emprunte l'autorité d'un serveur d'outils.

L'autorisation _MCP_ impose un faisceau d'obligations (le tableau ci‑dessus) dont la clé anti-**confused deputy** est l'usage inconditionnel du paramètre `resource` (RFC 8707) côté client, doublé d'une validation d'audience côté serveur et d'une interdiction explicite du **token passthrough**. Nuance vérifiée à ne pas lisser : l'obligation côté client est inconditionnelle, mais le bénéfice de **binding** d'audience ne s'obtient « **when the Authorization Server supports the capability** » — l'effet dépend du support par l'AS [^p3-12].


***Tableau — Obligations normatives d'autorisation, _MCP_ 2025-11-25. Reprise du dossier (Tableau 2, Partie III).***

| **Élément** | **Statut normatif** | **Acteur** | **Source (clé interne)** |
| --- | --- | --- | --- |
| Serveur = OAuth 2.1 Resource Server | Établi depuis 2025-06-18 | Serveur | `[10]` |
| RFC 9728 (Protected Resource Metadata) | **MUST** | Serveur (impl.) / Client (usage) | `[10]` |
| PKCE méthode S256 | **MUST** (si techniquement possible) | Client | `[10]` |
| Découverte : RFC 8414 **ou** OIDC Discovery 1.0 | MUST (≥ 1 mécanisme serveur ; client supporte les deux) | Serveur / Client | `[10]` |
| RFC 8707 (paramètre `resource`) | **MUST**, inconditionnel | Client | `[11]` |
| Validation d'audience / rejet hors audience | **MUST** | Serveur | `[11]` |
| **Token passthrough** | **INTERDIT** | Serveur | `[11]` |
| Client ID Metadata Documents (SEP-991) | RECOMMANDÉ ; DCR/RFC 7591 → **MAY** | Client | `[13]` |



Le couplage à τ est conceptuel, non protocolaire : _MCP_ ne **décide** pas du régime déterministe/probabiliste, il fournit le canal d'accès outil et la garantie d'audience sur laquelle D‑Autorité peut s'appuyer pour produire Decision ∈ {Déterministe, Probabiliste, Refus} (cf. Ch. 5). À titre d'illustration de schéma — et non de spécification normative — une politique de dispatch peut typer un appel selon que sa cible est un outil sous contrat _MCP_ (régime déterministe candidat) ou une délégation A2A vers un agent _LLM_ (régime probabiliste candidat) :

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

#### La trajectoire MCP : norme stable et refonte **stateless** en cours

**Insight-clé.** _MCP_ vit une double trajectoire — une révision stable gouvernée (2025-11-25) et un **Release Candidate** (cible 2026-07-28) proposant une mutation architecturale majeure du cœur **stateful** vers un cœur **sans état** — dont les paramètres restent `probable`, non finalisés.

Le RC vise la scalabilité horizontale en supprimant l'état de session : retrait de `initialize` (SEP-2575) et de `Mcp-Session-Id` (SEP-2567), en-têtes `Mcp-Method`/`Mcp-Name` (SEP-2243) pour router sans inspecter le corps, dépréciation de Roots/Sampling/Logging (SEP-2577) et fenêtre de cycle de vie ≥ 12 mois (SEP-2596) [^p3-13]. Deux divergences de datation sont conservées : le billet officiel du RC est daté du 21 mai 2026, le tag GitHub `2026-07-28-RC` porte le 29 mai 2026, et « 2026-07-28 » est la date **cible** de la version finale — non la date du RC (~8 jours d'écart entre deux sources primaires).


***Tableau — Évolution architecturale de _MCP_ : 2025-11-25 (stable) vs RC 2026-07-28. Reprise du dossier (Tableau 1, Partie III).***

| **Dimension** | **2025-11-25 (stable, `confirmé`)** | **RC 2026-07-28 (`probable`, non finalisé)** |
| --- | --- | --- |
| Modèle de session | **Stateful** ; handshake `initialize`/`initialized` | **Stateless** : suppression `initialize` (SEP-2575) + `Mcp-Session-Id` (SEP-2567) |
| Routage proxy/LB | Inspection du corps requise | En-têtes `Mcp-Method`/`Mcp-Name` (SEP-2243) |
| Cycle de vie | Non formalisé | Active→Deprecated→Removed, fenêtre ≥ 12 mois (SEP-2596) |
| Primitives dépréciées | — | Roots, Sampling, Logging (SEP-2577) |
| Extensibilité | Primitives fixes | Cadre Extensions (SEP-2133) + MCP Apps (SEP-1865) + Tasks promu (SEP-2663) |
| Tasks | Expérimental (SEP-1686) | Extension promue (SEP-2663) |
| Transports | stdio + Streamable HTTP | Inchangés (aucun nouveau transport ce cycle) |



#### Questions ouvertes

Les incertitudes du dossier, à reverifier en relance, sont les suivantes :

- **Finalisation du RC _MCP_ 2026-07-28** : l'ensemble des apports (**stateless**, dépréciations Roots/Sampling/Logging, cadre Extensions) reste `probable` ; reverifier **Releases** et **changelog** après la date cible. Statut exact du registre officiel _MCP_ (toujours PREVIEW au 8 juin 2026, format `server.json`) à consulter sur `registry.modelcontextprotocol.io`.
- **Gouvernance _MCP_** : existence et composition d'un **steering committee** formel, et appartenance de Nick Cooper (OpenAI) — `à vérifier`, non attesté par les billets de mainteneurs consultés (vérifier SEP-932 ou les fichiers GOVERNANCE/MAINTAINERS).
- **Internet-Drafts OAuth figés par _MCP_** : `draft-ietf-oauth-v2-1-13` et `draft-ietf-oauth-client-id-metadata-document-00` peuvent être périmés ; vérifier sur `datatracker.ietf.org`.
- **Gouvernance post-1.0 d'A2A** : cadence et politique de support des versions 0.x non datées au-delà des tags GitHub ; structure fine d'AGNTCY (TAC, charte) non précisée par le communiqué du 29 juillet 2025.
- **Convergence à l'épreuve** : la complémentarité AG-UI↔A2A (mécanique exacte du handshake) et l'historique du renommage « Agent Connect Protocol » → SLIM restent `à vérifier` ; l'adoption **en production vérifiable et nominative** (au-delà des communiqués de fondation) exige des études de cas éditeurs ou **peer-reviewed**, encore manquantes.



### Ch. 9 — Substrats de messagerie à garanties fortes

**Insight-clé.** L'_exactly-once semantics_ (EOS) d'Apache Kafka est **structurellement borné au périmètre interne read-process-write** : tout effet de bord externe — appel à une API _LLM_, courriel, paiement — n'est **pas** garanti _exactly-once_.[^p3-14] Cette frontière entre la garantie déterministe du substrat et l'action probabiliste, non rejouable, de l'agent est l'**ancrage empirique** de l'opérateur τ (défini au Ch. 5 ; ne pas le redéfinir ici). IBM MQ obtient pour sa part le _once-and-only-once_ par la conjonction persistance + _syncpoint_ + coordination transactionnelle, tandis que Kafka est un journal à rétention relisable : deux familles de substrat aux contrats distincts, non interchangeables.

#### La frontière EOS interne / effet de bord externe : ancrage de τ

L'insight tient en une distinction de périmètre. Kafka garantit l'atomicité d'un cycle _consommer → traiter → produire_ entièrement contenu **à l'intérieur** de Kafka (multi-partitions, transactionnel) ; il ne garantit rien dès qu'une étape sort de ce périmètre vers une ressource externe non transactionnelle.[^p3-15] Or l'action agentique — invoquer un modèle, émettre un paiement, envoyer un courriel — **est** précisément cet effet de bord externe : non transactionnel, non idempotent par défaut, non rejouable sans conséquence.

C'est le socle factuel de l'opérateur τ et de la distinction substrat/action développée au Ch. 5. Le substrat occupe le régime déterministe ; l'effet de bord externe ressort du régime probabiliste ; l'opérateur arbitre le passage de l'un à l'autre en déplaçant _t_fix</sub>(g) sans altérer la grandeur (cf. Ch. 5 pour la construction, Ch. 6 pour l'algèbre d'héritage de garanties du CIA). Le le tableau ci‑dessus transpose la documentation Kafka en lecture agentique : il ne **prouve** pas la thèse — il l'**atteste empiriquement**.


***Tableau — Frontière de garantie EOS (ancrage empirique de la thèse τ). Source : Confluent, 2025-03-01.***

| **Périmètre** | **Garantie EOS Kafka** | **Implication agentique** |
| --- | --- | --- |
| read-process-write **interne** Kafka | **Oui** — atomique, multi-partitions | Substrat déterministe |
| Appel RPC externe (store distant, **API _LLM_**, courriel, paiement) | **Non** | Action probabiliste / non rejouable → ressort de τ |



La conséquence d'ingénierie est nette : aucun réglage de Kafka ne **transporte** la garantie au-delà de sa frontière. Prétendre le contraire — « activer l'EOS rend l'agent _exactly-once_ » — est un défaut de raisonnement sur le périmètre, non un défaut de configuration. La garantie forte du substrat **encadre** l'incertitude agentique ; elle ne l'**absorbe** pas.

#### Apache Kafka / Confluent : EOS, idempotence, transactions, ordre

Le mécanisme EOS de Kafka repose sur trois primitives couplées, stabilisées depuis **Kafka 0.11 (juin 2017)** via **KIP-98** : producteur idempotent (identifiant de producteur `PID` + numéros de séquence par partition), transactions inter-partitions atomiques, et consommateur en `read_committed` / `read_uncommitted`.[^p3-16] Depuis **Kafka 4.0.0 (18 mars 2025)** — première majeure sans ZooKeeper (KRaft par défaut) — la **défense transactionnelle côté serveur (KIP-890)** est **activée automatiquement**, avec _bump_ d'epoch par transaction.[^p3-17][^p3-18] En date de juin 2026, **Kafka 4.3.0 (22 mai 2026)** est la version courante (25 KIPs, 600+ commits), la ligne 4.2.x étant maintenue en parallèle (**4.2.1 = 30 mai 2026**) ; l'ordre « 4.3.0 avant 4.2.1 » est **réel** — deux lignes distinctes, pas une anomalie (`confirmé`, haut enjeu).[^p3-19][^p3-20]


***Tableau — Chronologie des versions Apache Kafka (vérifiée le 8 juin 2026).***

| **Version** | **Date (Apache)** | **Apport majeur** | **Statut** | **Source** |
| --- | --- | --- | --- | --- |
| 4.3.0 | **2026-05-22** | 25 KIPs, 600+ commits ; version courante | `confirmé` | rel. 4.3.0 |
| 4.2.1 | 2026-05-30 | Correctif (ligne maintenance 4.2.x) | `confirmé` | rel. announcements |
| 4.2.0 | **2026-02-17** | KIP-932 (Share Groups) **GA** ; KIP-1228 | `confirmé` | rel. 4.2.0 |
| 4.1.0 | 2025-09-04 | KIP-932 **PREVIEW** ; KIP-1071 early access | `confirmé` | rel. 4.1.0 |
| 4.0.0 | **2025-03-18** | Sans ZooKeeper (KRaft) ; KIP-890 actif par défaut | `confirmé` | rel. 4.0.0 |
| 0.11.0.0 | 2017-06 | KIP-98 : EOS (idempotence + transactions) | `confirmé` | KIP-98 |



Une **correction de traçabilité** doit être consignée sur la nomenclature EOS de Kafka Streams, où l'énoncé candidat « `exactly_once_v2` introduit en Kafka 2.5 » est **erroné**. Le mécanisme `eos-beta` provient de **Kafka 2.6.0** (KIP-447) ; le nom `exactly_once_v2` n'apparaît qu'en **Kafka 3.0.0** (KIP-732, qui renomme `exactly_once_beta` et déprécie `eos-alpha`).[^p3-21][^p3-22]


***Tableau — Nomenclature EOS de Kafka Streams (correction de traçabilité). L'énoncé « v2 en 2.5 » est réfuté : `eos-beta` = 2.6.0, nom `v2` = 3.0.0.***

| **Nom de configuration** | **KIP** | **Version d'apparition** | **Statut juin 2026** |
| --- | --- | --- | --- |
| `exactly_once` (eos-alpha) | KIP-98/129 | 0.11 | **Retiré en 4.0** (KIP-732) |
| `exactly_once_beta` (eos-beta) | KIP-447 | **2.6.0** | Renommé en 3.0 |
| `exactly_once_v2` | KIP-732 | **3.0.0** | **Nom canonique** |



Côté **ordre**, la livraison ordonnée par partition est obtenue avec le producteur idempotent ; la borne `max.in.flight.requests.per.connection ≤ 5` préservant l'ordre sous idempotence est issue d'un billet Confluent et reste à recouper sur la documentation _Producer Configs_ primaire (`probable`, à vérifier sur `kafka.apache.org/documentation`).[^p3-23] La configuration minimale d'un producteur transactionnel EOS, et le cycle d'API correspondant, se lisent ainsi :

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

Le surcoût de performance de l'EOS — souvent cité autour de ~2–5 ms de latence et ~10–20 % de débit — provient d'une **source secondaire** (Conduktor ; recoupements Strimzi/CNCF) **sans banc de mesure primaire** ; il **ne doit pas** être présenté comme normatif (`à vérifier`), et appelle une mesure propre sur le banc `AgentMeshKafka`.[^p3-24][^p3-25]

Pour l'IA agentique, les patrons confirmés (verbatim Confluent, 5 mai 2026) consacrent le journal comme **mémoire stateful à replay déterministe** : _transactional outbox_ + CDC Debezium pour franchir proprement la frontière vers un système externe, file de lettres mortes (DLQ) portant `prompt-id` / `model-version` / `offset`, et _data contracts_ CEL pour le masquage PII.[^p3-26] Le _transactional outbox_ est l'aveu d'ingénierie de la frontière EOS : on n'écrit pas directement vers l'externe dans la transaction ; on écrit **l'intention** dans un topic (couvert par l'EOS), puis un processus distinct effectue l'effet de bord et en consigne le résultat.

```json
// Enregistrement DLQ après échec d'effet de bord externe (patron Confluent)
{ "prompt_id": "p-7f3a", "model_version": "claude-…@2026-05", "offset": 184421,
  "topic": "agent.actions.outbox", "error": "external_call_not_idempotent",
  "decision": "Refus" }
```

Deux précisions de positionnement, pour ne pas figer le paysage. Le **Tiered Storage (KIP-405)** est _production-ready_ depuis Kafka 3.9 (verbatim wiki) : **ce n'est plus un différenciateur Confluent exclusif** en juin 2026.[^p3-27] Et le **KIP-939 (participation 2PC externe)** est au statut « Accepted » **sans version d'intégration spécifiée** — `transaction.two.phase.commit.enable` (défaut `false`), adoption attendue d'abord via Apache Flink (FLIP-319) ; le marqueur `à vérifier` sur la version cible est **maintenu** (`probable`).[^p3-28][^p3-29]

#### IBM MQ : once-and-only-once, syncpoint et la frontière delivery / processing

La distinction **delivery (transport) vs processing (applicatif)** est solidement étayée et tranche un faux espoir. L'« _exactly-once_ **delivery** » au niveau transport est **impossible** sur réseau non fiable — résultat classique des Deux Généraux et de l'impossibilité FLP ; seul l'« _exactly-once_ **processing** » (atomicité applicative) est atteignable.[^p3-30] IBM MQ assure le _once-and-only-once_ par la conjonction **persistance + syncpoint (`MQCMIT` / `MQBACK`) + coordination transactionnelle**, là où Kafka demeure un **journal à rétention relisable**.[^p3-31][^p3-32][^p3-33]




**Réserve méthodologique de premier ordre (à ne pas lisser).** Les pages `ibm.com` (`/docs`, `/new/announcements`, `/support`) renvoient **HTTP 403** à l'agent de _fetch_. Leur contenu a été corroboré via extraits de recherche pointant ces mêmes pages primaires et via blogs d'ingénieurs **IBM Hursley** signés (Ian Harwood) ; une **lecture intégrale directe n'a pu être faite**. D'où le marqueur `probable` partout où la double corroboration restait indirecte — notamment le **détail du protocole XA / 2PC embarqué** (coordinateur vs participant).




La sémantique de MQ se distingue sur deux axes décisifs pour l'architecture agentique. Premièrement, le **sort du message** : retiré de la file à la consommation validée (modèle file, point-to-point + pub/sub), là où Kafka **conserve** le message pour relecture/replay (journal partitionné). Deuxièmement, la **coordination multi-ressources** : MQ s'appuie sur **2PC / X-Open XA** (détail embarqué `à vérifier`, 403), tandis que Kafka attend KIP-939 (version cible `à vérifier`). Le le tableau ci‑dessus synthétise ces dimensions et la règle de choix associée.


***Tableau — IBM MQ vs Apache Kafka : sémantique et critères de choix. Sources : doc IBM MQ 9.x ; KIP-939 ; comparatif OpenLogic. La ligne « critère de préférence » est une synthèse argumentative (voir infra), non un fait normatif.***

| **Dimension** | **IBM MQ** | **Apache Kafka** |
| --- | --- | --- |
| Modèle de données | **File** (point-to-point + pub/sub) | **Journal distribué partitionné** à rétention |
| Sort du message après consommation | **Retiré** (à la consommation validée) | **Conservé** (relecture / replay possible) |
| Garantie native | Once-and-only-once (persistant + _syncpoint_ + coordination) | EOS bornée au périmètre interne Kafka |
| Coordination multi-ressources | **2PC / X-Open XA** (détail XA `à vérifier`, 403) | KIP-939 (2PC externe) « Accepted », version `à vérifier` |
| Fan-out multi-consommateurs | Limité | **Natif** (groupes indépendants) |
| Critère de préférence | Atomicité transactionnelle / ordre / conformité financière | Débit / replay / fan-out / découplage temporel |



Côté versions, **MQ 9.4.0 LTS** a été annoncé le 14 mai 2024, **GA le 18 juin 2024**, supporté **≥ juin 2029**, extensible jusqu'à **2033** (support OpenTelemetry).[^p3-34] **MQ 9.4.5 CD** est **GA le 5 février 2026** (Multiplateformes/Appliance ; Java 25, .NET 10, EKS Operator GA), correctifs jusqu'au 5 février 2027 ; la **date z/OS exacte (2026-02-20) reste `à vérifier`** (le billet IBM dit « PTFs available now » sans date z/OS distincte).[^p3-35] La cadence CD 2025 (relevée à `confirmé` via blogs Hursley) : 9.4.2 (GA 27 fév. 2025 ; z/OS 21 mars 2025), 9.4.3 (GA 17 juin 2025), 9.4.4 (GA 16 oct. 2025 ; z/OS 31 oct. 2025).[^p3-36][^p3-37] Côté fin de vie, 9.3 LTS standard **2027-09-30** (étendu 2031-09-30) ; 9.2 LTS standard **2025-09-30 (échu)** / étendu 2029-09-30 (`confirmé` via endoflife.date).[^p3-38]

Le **pontage MQ → Kafka** via Kafka Connect n'atteint l'_exactly-once_ que sous **contraintes strictes** (confirmées par les docs Confluent ET IBM Event Streams), faute de quoi le régime retombe à _at-least-once_ : un seul consommateur (`tasks.max=1`), file d'état dédiée, mode distribué, `exactly.once.source.support=enabled`, ACL appropriées, Connect ≥ 3.3.0.[^p3-39][^p3-40]

```properties
# Connecteur source MQ -> Kafka : EOS UNIQUEMENT sous ces contraintes
tasks.max=1                              # un seul consommateur, sinon at-least-once
exactly.once.source.support=enabled      # exige Connect en mode distribué, >= 3.3.0
# + file d'état dédiée + ACL appropriées (cf. docs Confluent / IBM Event Streams)
```

Une **divergence de numérotation** doit être conservée, non lissée : deux lignées distinctes. Le connecteur open-source IBM `kafka-connect-mq-source` introduit l'_exactly-once_ en **v2.0.0** (v1 = at-least-once), tandis que la distribution Confluent suit sa propre numérotation (**v12.x** support introduit, v11.x déprécié). Les deux numéros désignent des **artefacts/packagings différents** et **ne sont pas contradictoires**.[^p3-41]


***Tableau — Lignées du connecteur source MQ → Kafka (divergence résolue : artefacts distincts, non contradictoires).***

| **Lignée** | **Artefact** | **Exactly-once introduit** | **Statut antérieur** |
| --- | --- | --- | --- |
| IBM open-source | `kafka-connect-mq-source` | **v2.0.0** | v1 = at-least-once |
| Confluent Platform | IBM MQ Source Connector | **v12.x** | v11.x déprécié |



#### Compatibilité des garanties fortes avec l'incertitude agentique

La garantie forte du substrat et l'incertitude agentique sont **compatibles par cloisonnement**, non par fusion : le substrat borne le déterministe, l'agent occupe le probabiliste, et la frontière entre les deux est exactement le lieu d'arbitrage de l'opérateur τ (cf. Ch. 5). Aucun des deux substrats n'« absorbe » l'incertitude de l'action externe ; tous deux la **rendent explicite**, ce qui est précisément ce qu'exige une décision sur _t_fix</sub>(g).

De là découle une **règle de décision substrat**, qu'il faut énoncer pour ce qu'elle est — une **synthèse argumentative** (`probable`), **non** un fait normatif : préférer **MQ** lorsque l'atomicité transactionnelle, l'ordre strict et la conformité (financière, réglementaire) priment ; préférer **Kafka** lorsque le débit, le replay, le _fan-out_ multi-consommateurs et le découplage temporel priment.[^p3-42][^p3-43] La thèse adjacente « event-driven > RPC » pour l'orchestration d'agents relève du même registre `probable` (positionnement d'éditeur, non démonstration neutre).

Articulation au CIA (cf. Ch. 6, sans le redéfinir) : l'algèbre d'héritage de garanties prend ici un appui concret. Une session agentique qui **consomme** depuis un substrat once-and-only-once n'hérite de cette force **qu'en deçà** de la frontière d'effet de bord ; au-delà, la garantie **dégénère** en _at-least-once_ effective, et le type de session probabiliste / tolérant au _drift_ doit en rendre compte. La force du substrat est une **borne supérieure** sur la garantie agentique de bout en bout, jamais une garantie de bout en bout en soi.

#### Questions ouvertes

Les incertitudes du dossier, conservées telles quelles (à trancher en relance), sont hétérogènes et portent autant sur les chiffres que sur les détails de protocole inaccessibles :

- **Surcoût EOS Kafka.** Existe-t-il un **rapport de performance primaire** (Apache/Confluent horodaté) quantifiant le surcoût latence/débit de l'EOS ? À défaut des ~2–5 ms / ~10–20 % de sources secondaires (`à vérifier`), produire une mesure propre sur `AgentMeshKafka`.
- **Défauts à recouper.** Le défaut serveur `isolation.level=read_uncommitted` et le plafond `max.in.flight ≤ 5` sous idempotence sont à recouper sur `kafka.apache.org/documentation`, plutôt que sur le billet Confluent.
- **KIP-939 (2PC).** Quelle version exacte d'Apache Kafka intégrera la participation 2PC ? Page KIP muette — vérifier les notes 4.x ultérieures et FLIP-319.
- **XA / 2PC dans MQ.** Détail exact du protocole (coordinateur embarqué vs participant) — page IBM en 403 ; piste : Redbook IBM MQ ou cache Knowledge Center.
- **Native HA Cross-Region Replication (CRR).** Version d'introduction **non résolue** — **9.4.2** vs **9.4.3** selon des extraits d'annonce IBM divergents (`probable`) ; et l'affirmation **« RPO zéro »** reste non lue sur source primaire (réplication asynchrone ⇒ RPO non nul en théorie). À trancher par lecture directe (bloquée par 403).
- **Date z/OS de MQ 9.4.5.** Claim initial 2026-02-20 ; le billet IBM dit « PTFs available now » sans date z/OS distincte (`à vérifier`).
- **Positionnement marché mainframe.** Les chiffres (IBM Z ~63 %, > 70 % Fortune 500) sont d'**analystes** (Mordor, BMC), non corroborés par source primaire éditeur (`à vérifier`).
- **Méthodologie.** Prévoir une vérification manuelle/navigateur des dates IBM haut-enjeu, le _fetch_ direct étant bloqué par HTTP 403.



### Ch. 10 — Modernisation du mainframe IBM Z

_Insight-clé._ En date de juin 2026, la modernisation du mainframe IBM Z ne se joue plus comme un projet de _wrapping_ d'actifs hérités mais comme la ***constitution d'une couche d'intégration agentique standardisée sur _MCP_*** : z/OS Connect expose les API d'actifs CICS/IMS/Db2 (et MQ, `probable`) en ***outils _MCP_*** depuis la version 3.0.98 (21 octobre 2025) [^p3-44] (`confirmé`), tandis que watsonx Assistant for Z, watsonx Code Assistant for Z et un _MCP Gateway_ open-source (ContextForge) fédèrent ces actifs sous une interface commune. La thèse architecturale de ce chapitre : ***le mainframe est le substrat à garanties fortes par excellence du côté déterministe de l'opérateur τ*** (cf. Ch. 5) — les transactions CICS/IMS et la coordination Db2/MQ matérialisent la fixation du sens en régime déterministe, et l'opérateur τ dispatche vers le régime probabiliste (agent _LLM_) sans relâcher ces garanties. ***Correction normative*** : le claim « z/OS Connect 3.0.101 = dernière version » est ***périmé*** en juin 2026 ; 3.0.102 (avril 2026) puis la _CD update_ 3.0.103 (mai 2026, APAR PH70973) lui succèdent [^p3-45] (`confirmé`).

#### L'exposition d'actifs : z/OS Connect comme charnière déterministe→agentique

***z/OS Connect est la charnière qui transmute un actif transactionnel hérité en outil consommable par un agent, sans déplacer la frontière de garantie.*** L'actif (programme CICS, transaction IMS, requête Db2) demeure le siège de la fixation déterministe du sens — verrouillage, journalisation, intégrité référentielle — et z/OS Connect n'en altère ni la sémantique ni la grandeur traitée ; il en publie une description OpenAPI (OAS3) consommable des deux côtés de l'opérateur τ (cf. Ch. 5).

En date de juin 2026, z/OS Connect se déploie en _Started Task_, en _CICS JVM Server_ ou en conteneur OCI, sur une base Liberty portée à 26.0.0.3 en 3.0.102 (contre 25.0.0.9 en 3.0.98) [^p3-46] (`confirmé`). Il couvre CICS, IMS et Db2 de façon confirmée ; ***la couverture MQ figure sur la page produit mais n'a pas été re-confirmée*** dans la documentation 3.0 (page `ibm.com/docs` en HTTP 403 lors de la collecte) [^p3-47] (`probable` pour MQ). Deux modes coexistent : le mode ***_provider_*** (l'actif Z exposé comme service) et le mode ***_API requester_ sortant*** OAS3 (l'actif Z appelant une API externe) [^p3-48] (`confirmé`). Cette directionnalité importe pour l'opérateur τ : le mode _requester_ est précisément le point où un actif déterministe peut solliciter un service externe — potentiellement probabiliste — franchissant alors la frontière que l'opérateur τ a pour rôle d'arbitrer (cf. Ch. 5).

***Réserve à ne pas lisser*** : le ***transport _MCP_*** exact (HTTP _streamable_ / SSE / stdio) et le ***modèle d'authentification*** employés par z/OS Connect 3.0 demeurent `à vérifier` — la documentation primaire est inaccessible (HTTP 403) [^p3-49] (`à vérifier`). De même, l'attribution de l'exécution _in-CICS-region_ à la version 3.0.88 (décembre 2024) reste `probable`, l'historique des changements étant inaccessible.

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

#### watsonx for Z : l'agentique on-Z et l'orchestration multi-agents

***Le second pilier de la modernisation Z est la pile watsonx, qui apporte l'orchestration multi-agents et l'inférence _on-Z_, rapprochant le calcul probabiliste du substrat déterministe.*** Le tableau qui suit cartographie l'écosystème ; il met en évidence que, du côté agentique, _MCP_ joue partout le rôle d'interface d'intégration commune.

***watsonx Assistant for Z*** a atteint la ***GA agentique le 19 novembre 2025*** (Agent Builder, orchestration multi-agents) [^p3-50] (`confirmé`), puis ***v3.2 (GA 13 mars 2026)*** avec _flow builder_ graphique et intégration ACF2/Top Secret via SAF [^p3-51] (`confirmé`). L'inférence _on-Z_ est devenue réelle avec ***Spyre en GA le 12 décembre 2025*** (Granite 3.3-8B-instruct sur z17) [^p3-52] (`confirmé`) : ici, le côté probabiliste de l'opérateur τ s'exécute sur l'accélérateur même qui jouxte le substrat transactionnel, réduisant la latence d'aller-retour à travers la frontière. Le dépôt `IBM/z-ai-agents` v1.2.1 (15 mai 2026) fournit des _Helm charts_ et des agents nommés (CICS, Db2, IMS, OMEGAMON, zRAG, Concert) [^p3-53] (`confirmé`). ***Réserve*** : que la couche _MCP_ de watsonx Assistant for Z couvre nommément CICS et MQ (au-delà de Db2 et IMS) demeure `probable`.

***watsonx Code Assistant for Z*** fournit la _code-gen_ COBOL et une _preview_ Assembler depuis la v2.6 (27 juin 2025) [^p3-54] (`confirmé`), avec une expérience agentique et des outils _MCP_ (Z Understand Metadata Retrieval, Impact Analysis) en 2.8 [^p3-55] (`confirmé`, le patch 2.8.20 partner-source CROZ restant `probable`).


***Tableau — Cartographie de l'agentique mainframe IBM Z (en date de juin 2026). Sources : labels dossier `zosc-**`, `wxa4z-**`, `wcaz-**`, `bob-**`, `cp4i-**`, `mcp-gateway`, `z-ai-agents`, `zopeneditor-mcp` — IBM / GitHub — URL `à vérifier` (docs `ibm.com` en HTTP 403).**

| **Produit / Dépôt** | **Capacité agentique / MCP** | **Version & date** | **Statut** |
| --- | --- | --- | --- |
| ***z/OS Connect*** | API exposées comme outils _MCP_ | 3.0.103 (mai 2026) ; MCP dès 3.0.98 (21 oct. 2025) | `confirmé` |
| ***watsonx Assistant for Z*** | Agent Builder ; _MCP_ comme couche d'intégration | v3.2 (GA 13 mars 2026) ; agentique GA 19 nov. 2025 | `confirmé` |
| ***Spyre pour watsonx Assistant for Z*** | Inférence _on-Z_ (Granite 3.3-8B) | GA 12 déc. 2025 | `confirmé` |
| ***watsonx Code Assistant for Z*** | Expérience agentique + outils _MCP_ | 2.8 (code-gen v2.6, 27 juin 2025) | `confirmé` |
| ***IBM Bob*** | Partenaire AI-first multi-modèles | GA 28 avril 2026 | `confirmé` |
| ***Bob Premium Package for Z*** | Modes Architect/Code, contexte Zaware | preview privée sans frais (à la GA) | `confirmé` |
| ***Cloud Pak for Integration 16.1.3*** | AI Agents (langage naturel) | GA 17 déc. 2025 ; AI Agents preview → 31 mars 2026 | `confirmé` |
| ***mcp-context-forge (_MCP Gateway_)*** | Fédère _MCP_/A2A/REST/gRPC (Apache-2.0) | v1.0.2 (26 mai 2026) | `confirmé` |
| ***IBM/z-ai-agents*** | _Helm charts_ d'agents Z | v1.2.1 (15 mai 2026) | `confirmé` |
| ***Z Open Editor*** | 40 outils _MCP_, mode Agent via Zowe | MCP dès v6.0.0 (19 sept. 2025) | `confirmé` |



#### Cloud Pak for Integration et le MCP Gateway : fédérer les protocoles

***Au-delà du mainframe stricto sensu, l'intégration agentique d'entreprise s'appuie sur deux briques de fédération : Cloud Pak for Integration et un _MCP Gateway_ open-source.*** Toutes deux répondent au même besoin — donner à un agent un point d'accès unique et gouverné à une hétérogénéité de protocoles, ce qui est la condition pratique de l'interopérabilité (sens préservé) par opposition à la simple connectivité.

***Cloud Pak for Integration 16.1.3*** est GA depuis le 17 décembre 2025 (OpenShift 4.19/4.20, Kubernetes 1.33), ses ***AI Agents*** étant en _tech preview_ jusqu'au 31 mars 2026 [^p3-56] (`confirmé`). Les versions exactes de chaque composant (ACE, API Connect, MQ, DataPower, Event Streams, Aspera, webMethods) restent `à vérifier` (docs en HTTP 403).

Le ***_MCP Gateway_ (mcp-context-forge / ContextForge)****, publié sous Apache-2.0, fédère _MCP_, A2A, REST et gRPC en v1.0.2 (26 mai 2026) [^p3-57] (`confirmé`). Côté outillage développeur, ****Z Open Editor*** introduit _MCP_ dès la v6.0.0 (19 septembre 2025, 40 outils _MCP_, mode Agent VS Code via Zowe) [^p3-58] (`confirmé`).

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

#### IBM Bob : le partenaire AI-first et la divergence de sources sur les modèles

***IBM Bob, successeur AI-first, illustre une divergence de sources que ce chapitre conserve sans la lisser.*** Bob atteint la ***GA mondiale le 28 avril 2026*** [^p3-59] (`confirmé`), assorti d'un ***Bob Premium Package for Z*** (modes Architect/Code, contexte Zaware) en ***preview technique privée sans frais*** [^p3-60] (`confirmé`).

***La divergence porte sur les modèles employés.*** Les sources secondaires (The Register, DevClass) restent ***génériques*** — « _frontier LLMs_ / open-source / SLM / Granite » — sans nommer aucun modèle ; leur lecture, exacte, ne permettait pas de trancher (d'où un « à vérifier » initial). ***Mais la source primaire — IBM Newsroom (28 avril 2026) — nomme explicitement*** « _a mix of frontier models including Anthropic Claude, Mistral open source models, and IBM Granite_ ». ***Anthropic Claude et Mistral sont donc `confirmés` par la source primaire éditeur*** ; seul ***Meta Llama demeure `à vérifier`*** (non nommé). Le tableau ci-dessous consigne cette révision ; pour le _naming_, la citation normative est l'annonce IBM Newsroom, ***non*** The Register/DevClass.


***Tableau — IBM Bob — modèles employés : révision du verdict par confrontation source primaire vs secondaires. Source primaire pour le _naming_ : IBM Newsroom, 28 avril 2026 [^p3-61].***

| **Modèle** | **Sources secondaires (The Register / DevClass)** | **IBM Newsroom (primaire, 28 avril 2026)** | **Statut révisé** |
| --- | --- | --- | --- |
| « _frontier LLMs_ / open-source / SLM / Granite » | Oui (formulation générique) | Oui | `confirmé` |
| ***Anthropic Claude*** | Non nommé | Nommé explicitement | ***`confirmé`*** (et non « à vérifier ») |
| ***Mistral*** (open source) | Non nommé | Nommé explicitement | ***`confirmé`*** |
| ***Meta Llama*** | Non nommé | Non nommé | Non confirmé / `à vérifier` |



#### Ancrage théorique : le mainframe, substrat à garanties fortes de l'opérateur τ

***Le mainframe IBM Z fournit le substrat déterministe le plus mûr sur lequel l'opérateur τ puisse dispatcher : ses garanties transactionnelles ne sont pas approximées par convention mais imposées par le moniteur transactionnel.*** CICS et IMS fixent le sens d'une opération (`t_fix(g)`, cf. Ch. 5) au moment du _commit_ — atomicité, isolation, durabilité — et Db2/MQ étendent cette fixation à la coordination inter-ressources. Du point de vue de l'opérateur τ, un appel à `executer_virement` exposé par z/OS Connect relève sans ambiguïté du régime ***Déterministe*** de la Decision ∈ {Déterministe, Probabiliste, Refus} : la grandeur `g` (le virement) y est traitée sous garantie, et la D‑Invariant porte sur des invariants transactionnels effectivement vérifiables sur la trace. L'opérateur τ n'altère pas `g` ; il décide _où_ le sens se fixe — sur le substrat Z déterministe, ou en aval dans un agent _LLM_ probabiliste (cf. Ch. 5).

Cet ancrage rejoint le constat transversal de la Partie III : la frontière déterministe/probabiliste est ***empiriquement attestée*** (l'_exactly-once_ de Kafka borne la garantie au périmètre interne ; tout effet de bord externe — dont l'appel à une API _LLM_ — y échappe). Le mainframe en est le versant le plus exigeant : un agent ne doit jamais inférer un effet transactionnel ; il doit _invoquer_ l'actif Z, qui seul détient l'autorité de fixer le sens. C'est précisément ce que la D‑Autorité arbitre — l'autorité de l'appelant (l'agent) composée à l'autorité requise par la cible (la transaction Z). L'***instanciation en services financiers*** de cette discipline — où la moindre violation d'invariant transactionnel a une portée réglementaire — est développée au Ch. 19.

L'enjeu pour le CIA (cf. Ch. 6) est explicite : l'***algèbre d'héritage de garanties*** doit modéliser ce qu'un agent _hérite_ lorsqu'il invoque un actif Z via z/OS Connect — la garantie transactionnelle CICS/IMS se propage-t-elle, ou s'arrête-t-elle à la frontière _MCP_ ? Tant que le transport et l'authentification _MCP_ de z/OS Connect 3.0 restent `à vérifier` (HTTP 403), cette propagation ne peut être formellement caractérisée — limite qui touche directement au statut de l'invariant I4 (Hypothèse).

#### Questions ouvertes

Les incertitudes suivantes, reprises du dossier (en date de juin 2026), conditionnent toute conclusion architecturale de ce chapitre :

- ***Transport et authentification _MCP_ de z/OS Connect 3.0*** : quel transport (HTTP _streamable_ / SSE / stdio) et quel modèle d'authentification ? Documentation primaire en HTTP 403 — vérifier via PDF Knowledge Center ou client authentifié (`à vérifier`).
- ***Exécution _in-CICS-region_*** : a-t-elle été introduite précisément en 3.0.88 / décembre 2024 ? Historique des changements inaccessible (`probable`).
- ***Modèles d'IBM Bob*** : Bob emploie-t-il nommément ***Meta Llama*** ? IBM Newsroom nomme Claude et Mistral, pas Llama (`à vérifier`).
- ***Couche _MCP_ de watsonx Assistant for Z*** : couvre-t-elle nommément ***CICS et MQ*** (au-delà de Db2 et IMS) ? (`probable`).
- ***Couverture MQ de z/OS Connect 3.0*** : listée sur la page produit, non re-confirmée en doc 3.0 (HTTP 403) (`probable`).
- ***Release postérieure à 3.0.103*** : existe-t-il une version z/OS Connect ultérieure en juin 2026 ? Surveiller le flux « _now available_ » et les APAR.
- ***Composants de Cloud Pak for Integration 16.1.3*** : versions exactes d'ACE, API Connect, MQ, DataPower, Event Streams, Aspera, webMethods — docs en HTTP 403 (`à vérifier`).

***Réserve méthodologique transversale*** : le blocage HTTP 403 sur `ibm.com/docs` impose une vérification manuelle (navigateur / client authentifié) des dates et détails techniques IBM à haut enjeu ; plusieurs URL de ce chapitre sont en conséquence marquées `à vérifier` plutôt que fabriquées, conformément à l'interdiction de fabrication.

[^p3-1]: Synthèse de stratification (clé interne `[CONV-001]`) — état de l'art arrêté au 8 juin 2026, marqueur `probable`.
[^p3-2]: Model Context Protocol, révision stable 2025-11-25 — Anthropic / Agentic AI Foundation (Linux Foundation) — publiée le 25 novembre 2025 (clé interne `[1]` `[6]`), marqueur `confirmé`.
[^p3-3]: A2A Protocol v1.0 (spec 1.0.0) — Google → Linux Foundation — release notes GitHub du 12 mars 2026 (clé interne `[A2A-005]` `[A2A-rel]`), marqueur `confirmé`.
[^p3-4]: AGNTCY — Outshift/Cisco, accueilli par la Linux Foundation le 29 juillet 2025 ; membres formateurs : Cisco, Dell, Google Cloud, Oracle, Red Hat (clé interne `[AGNTCY-002]` `[AGNTCY-003]`), marqueur `confirmé`.
[^p3-5]: AG-UI — CopilotKit (MIT), release 2026-06-05 (clé interne `[AGUI-002]`) ; A2UI v0.8 — Google, annoncé le 15 décembre 2025 (clé interne `[A2UI-001]`), marqueurs `confirmé`.
[^p3-6]: Fusion ACP→A2A — discussion GitHub i-am-bee du 25 août 2025 vs billet LF AI & Data du 29 août 2025 (clé interne `[ACP-002]`), marqueur `confirmé` ; divergence de date de publication conservée, ~4 jours.
[^p3-7]: A2A v1.0 — **Signed Agent Cards**, support multi-tenant, rétrocompatibilité v0.3↔v1.0 ; transports JSON-RPC 2.0, gRPC, HTTP+JSON/REST ; **Agent Card** supportant API Key / HTTP Auth / OAuth2 / OIDC / mTLS (clé interne `[A2A-005]` `[A2A-006]` `[A2A-007]`), marqueur `confirmé`.
[^p3-8]: Adoption _MCP_ : > 10 000 serveurs publics ; 97 M+ téléchargements SDK/mois (Python+TS, source primaire Anthropic) ; 10 SDK officiels ; registre officiel en PREVIEW depuis le 8 sept. 2025 (clés internes `[8]` `[7]` `[adopt-dl]` `[sdk]` `[reg]`), marqueur `confirmé` avec réserve métrologique.
[^p3-9]: A2A : 150+ organisations au premier anniversaire (9 avril 2026) ; production nominative `à vérifier` (clés internes `[A2A-150]` `[A2A-008]`), marqueur `probable`.
[^p3-10]: « A2A 1.2 » non confirmé et contredit par la source primaire ; version normative = 1.0 ; v1.0.1 = patch éditorial (clés internes `[CONV-002]` `[A2A-rel]`), divergence conservée.
[^p3-11]: Don de _MCP_ à l'Agentic AI Foundation (AAIF), **directed fund under the Linux Foundation** selon Anthropic, le 9 décembre 2025 ; membres Platinum AAIF (8) : AWS, Anthropic, Block, Bloomberg, Cloudflare, Google, Microsoft, OpenAI (clés internes `[7]` `[8]`), marqueur `confirmé`. Le qualificatif « directed fund » est employé par Anthropic mais absent du communiqué LF — divergence de formulation, non de substance.
[^p3-12]: Modèle d'autorisation _MCP_ 2025-11-25 : RFC 8707 inconditionnel côté client, **binding** d'audience effectif seulement si l'AS le supporte ; **token passthrough** interdit (clés internes `[10]` `[11]`), marqueur `confirmé`. Origine empirique du durcissement : CVE-2025-49596 (MCP Inspector < 0.14.1, RCE, CVSS v4.0 = 9.4 CRITICAL, NVD publié le 13 juin 2025), clé interne `[12]`.
[^p3-13]: RC _MCP_ 2026-07-28 : cœur **stateless**, dépréciations et cadre Extensions (clés internes `[9]` `[14bis]`), marqueur `probable` (RC non finalisé). La roadmap du 9 mars 2026 précise « **not adding more official transports this cycle** ».
[^p3-14]: Exactly-once Semantics is Possible: Here is How Apache Kafka Does It — Confluent (Narkhede, Wang et al.) — 2025-03-01 — <https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/>
[^p3-15]: Verbatim Confluent : « guaranteed within the scope of Kafka Streams' internal processing only ». Source : entrée précédente (Confluent, 2025-03-01).
[^p3-16]: KIP-98 — Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — consulté 2026-03-04 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging>
[^p3-17]: Transaction Protocol (doc officielle 4.1 — activation serveur automatique depuis Kafka 4.0) — Apache Software Foundation — 2025-09-04 — <https://kafka.apache.org/41/operations/transaction-protocol/>
[^p3-18]: KIP-890: Transactions Server-Side Defense (statut wiki « Approved ») — Apache Software Foundation — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-890:+Transactions+Server-Side+Defense>
[^p3-19]: Release Announcements (liste officielle versions et dates Kafka) — Apache Software Foundation — 2026-05-30 — <https://kafka.apache.org/blog/releases/>
[^p3-20]: Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — <https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/>
[^p3-21]: KIP-447: Producer scalability for exactly once semantics (Adopted 2.6.0) — Apache Software Foundation — 2020-06-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-447:+Producer+scalability+for+exactly+once+semantics>
[^p3-22]: KIP-732: Deprecate eos-alpha and replace eos-beta with eos-v2 (Kafka 3.0.0) — Apache Software Foundation — 2021-06-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-732:+Deprecate+eos-alpha+and+replace+eos-beta+with+eos-v2>
[^p3-23]: KIP-185: Make exactly once in order delivery per partition the default — Apache Software Foundation — 2017-09-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-185:+Make+exactly+once+in+order+delivery+per+partition+the+default+Producer+setting>
[^p3-24]: Exactly-Once Semantics in Kafka (glossaire, secondaire — coût performance) — Conduktor — 2025-01-01 — <https://www.conduktor.io/glossary/exactly-once-semantics-in-kafka>
[^p3-25]: Exactly-once semantics with Kafka transactions (recoupement secondaire) — Strimzi (CNCF) — 2023-05-03 — <https://strimzi.io/blog/2023/05/03/kafka-transactions/>
[^p3-26]: Integrating AI Into Apache Kafka Architectures: Patterns (outbox/DLQ/replay verbatim) — Confluent — 2026-05-05 — <https://www.confluent.io/blog/ai-kafka-integration-patterns/>
[^p3-27]: KIP-405: Kafka Tiered Storage (production-ready depuis 3.9) — Apache Software Foundation — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-405:+Kafka+Tiered+Storage>
[^p3-28]: KIP-939: Support Participation in 2PC (Accepted, version non spécifiée) — Apache Software Foundation — 2024-06-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC>
[^p3-29]: FLIP-319: Integrate with Kafka Support for Proper 2PC Participation — Apache Software Foundation (Flink) — 2024 — <https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=255071710>
[^p3-30]: Cadre des Deux Généraux / impossibilité FLP : l'exactly-once delivery transport est théoriquement impossible ; seule l'atomicité de traitement est atteignable. Corroboré verbatim par la documentation Confluent et IBM citées dans ce chapitre (référence de théorie distribuée non résolue au dossier — `à vérifier` pour la citation primaire CS).
[^p3-31]: Exactly once support — IBM MQ 9.4.x Documentation — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.4.x?topic=scenarios-exactly-once-support>
[^p3-32]: Syncpoints in IBM MQ for Multiplatforms — IBM MQ 9.3.x Documentation — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.3.x?topic=work-syncpoints-in-mq-multiplatforms>
[^p3-33]: MQCMIT (Commit changes) — IBM MQ Documentation — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.2.x?topic=i-mqcmit-commit-changes>
[^p3-34]: Introducing IBM MQ version 9.4: Built for change — IBM — 2024-05-14 — <https://www.ibm.com/new/announcements/introducing-ibm-mq-version-9-4-built-for-change>
[^p3-35]: IBM MQ 9.4.5 Continuous Delivery releases are available — IBM Community (Ian Harwood, IBM Hursley) — 2026-01-30 — <https://community.ibm.com/community/user/blogs/ian-harwood1/2026/01/30/mq945ga>
[^p3-36]: IBM MQ 9.4.4 Continuous Delivery releases are available — IBM Community (Ian Harwood, IBM Hursley) — 2025-10-10 — <https://community.ibm.com/community/user/blogs/ian-harwood1/2025/10/10/mq944ga>
[^p3-37]: Enhancing security, productivity and resilience with IBM MQ 9.4.3 — IBM — 2025-06-10 — <https://www.ibm.com/new/announcements/enhancing-security-productivity-and-resilience-with-ibm-mq-9-4-3>
[^p3-38]: IBM MQ — endoflife.date — endoflife.date — 2026 — <https://endoflife.date/ibm-mq>
[^p3-39]: IBM MQ Source Connector for Confluent Platform — Overview — Confluent — 2025 — <https://docs.confluent.io/kafka-connectors/ibmmq-source/current/overview.html>
[^p3-40]: Running the MQ source connector — IBM Event Automation / Event Streams — IBM — 2025 — <https://ibm.github.io/event-automation/es/connecting/mq/source/>
[^p3-41]: kafka-connect-mq-source (README) — ibm-messaging (GitHub) — IBM — 2025 — <https://github.com/ibm-messaging/kafka-connect-mq-source/blob/main/README.md>
[^p3-42]: IBM MQ vs. Kafka vs. ActiveMQ: Comparing Message Brokers — OpenLogic (Perforce) — 2024 — <https://www.openlogic.com/blog/ibm-mq-vs-kafka-vs-activemq>
[^p3-43]: The Future of AI Agents Is Event-Driven — Confluent (Sean Falconer) — 2025-05-13 — <https://www.confluent.io/blog/the-future-of-ai-agents-is-event-driven/>
[^p3-44]: _z/OS Connect — API existantes exposées comme outils MCP (v3.0.98)_ — IBM (label dossier `zosc-mcp`) — 21 octobre 2025 — URL `à vérifier` (page `ibm.com/docs` en HTTP 403 lors de la collecte).
[^p3-45]: _z/OS Connect — versions 3.0.102 / 3.0.103 (APAR PH70973)_ — IBM Community blog (label dossier `zosc-version-latest`) — avril–mai 2026 — URL `à vérifier`. Divergence de datation intra-source pour 3.0.102 : URL portant le 20 avril 2026, corps de l'article indiquant le 23 avril 2026 — retenir « avril 2026 ».
[^p3-46]: _z/OS Connect — modes de déploiement et socle Liberty_ — IBM (labels dossier `zosc-deploy`, `zosc-3102`) — 2025–2026 — URL `à vérifier`.
[^p3-47]: _z/OS Connect — portée des sous-systèmes (CICS/IMS/Db2 confirmés ; MQ non re-confirmé en doc 3.0)_ — IBM (label dossier `zosc-subsystems`) — 2026 — URL `à vérifier`.
[^p3-48]: _z/OS Connect — modes provider et API requester sortant (OAS3)_ — IBM (label dossier `zosc-requester`) — 2026 — URL `à vérifier`.
[^p3-49]: _z/OS Connect — transport et authentification MCP non confirmés (docs en HTTP 403)_ — IBM (label dossier `zosc-mcp-mechanism`) — 2026 — URL `à vérifier` (piste : PDF Knowledge Center ou client authentifié).
[^p3-50]: _watsonx Assistant for Z — GA agentique (Agent Builder, orchestration multi-agents)_ — IBM (label dossier `wxa4z-agentic`) — 19 novembre 2025 — URL `à vérifier`.
[^p3-51]: _watsonx Assistant for Z v3.2 (flow builder graphique, ACF2/Top Secret via SAF)_ — IBM (label dossier `wxa4z-v32`) — 13 mars 2026 — URL `à vérifier`.
[^p3-52]: _Spyre pour watsonx Assistant for Z — GA (Granite 3.3-8B-instruct sur z17)_ — IBM (label dossier `wxa4z-spyre`) — 12 décembre 2025 — URL `à vérifier`.
[^p3-53]: _IBM/z-ai-agents v1.2.1 (Helm charts, agents CICS/Db2/IMS/OMEGAMON/zRAG/Concert)_ — IBM, dépôt GitHub `IBM/z-ai-agents` (label dossier `z-ai-agents`) — 15 mai 2026 — URL `à vérifier`.
[^p3-54]: _watsonx Code Assistant for Z v2.6 — code-gen COBOL + preview Assembler_ — IBM (label dossier `wcaz-code-gen`) — 27 juin 2025 — URL `à vérifier`.
[^p3-55]: _watsonx Code Assistant for Z 2.8 — expérience agentique + outils MCP (Metadata Retrieval, Impact Analysis)_ — IBM (label dossier `wcaz-mcp`) — 2026 — URL `à vérifier`. Patch 2.8.20 issu de partner-source CROZ : `probable`.
[^p3-56]: _Cloud Pak for Integration 16.1.3 — GA (OpenShift 4.19/4.20, K8s 1.33) ; AI Agents en tech preview_ — IBM (labels dossier `cp4i-version`, `cp4i-ai-agents`) — 17 décembre 2025 — URL `à vérifier`.
[^p3-57]: _mcp-context-forge (MCP Gateway / ContextForge) v1.0.2 — fédère MCP/A2A/REST/gRPC, Apache-2.0_ — IBM, dépôt GitHub (label dossier `mcp-gateway`) — 26 mai 2026 — URL `à vérifier`.
[^p3-58]: _Z Open Editor v6.0.0 — 40 outils MCP, mode Agent VS Code via Zowe_ — IBM (label dossier `zopeneditor-mcp`) — 19 septembre 2025 — URL `à vérifier`.
[^p3-59]: _IBM Bob — GA mondiale_ — IBM Newsroom (label dossier `bob-ga`) — 28 avril 2026 — URL `à vérifier`.
[^p3-60]: _Bob Premium Package for Z — modes Architect/Code, contexte Zaware (preview privée sans frais)_ — IBM (label dossier `bob-premium`) — avril 2026 — URL `à vérifier`.
[^p3-61]: _IBM Bob — « a mix of frontier models including Anthropic Claude, Mistral open source models, and IBM Granite »_ — IBM Newsroom (label dossier `bob-models`) — 28 avril 2026 — URL `à vérifier`. Note de vérification critique : conclusion initiale « réfuté/à vérifier » périmée ; Claude et Mistral `confirmés` par source primaire, Llama demeure `à vérifier`.

## PARTIE IV — Sécurité, identité et autorité déléguée

### Ch. 11 — Identité des charges et des agents

**Insight-clé.** En date de juin 2026, l'identité de charge agentique repose sur un socle déterministe mûr — SPIFFE/SPIRE, `Graduated` à la CNCF — mais sur une couche protocolaire IETF encore entièrement pré-RFC : aucun document du groupe WIMSE n'a atteint le statut RFC, et l'identité spécifiquement _agentique_ n'existe qu'en _drafts_ individuels non adoptés. La thèse architecturale qui en découle : l'industrie **compose** des briques éprouvées (_OAuth Token Exchange_, SPIFFE, attestation) plutôt qu'elle n'invente un protocole d'agent dédié. Pour le canon de cette monographie, ce chapitre alimente directement la dimension D‑Autorité de l'opérateur τ (cf. Ch. 5) : c'est l'identité vérifiable d'une charge — et, par chaînage, d'un agent agissant pour le compte d'un tiers — qui rend calculable le produit _autorité appelant × autorité requise cible_ dont dépend la Decision ∈ {Déterministe, Probabiliste, Refus}.

Trois piliers cohabitent à des maturités hétérogènes, et leur écart de maturité est lui-même un fait structurant qu'il ne faut pas lisser : (1) le cadre **SPIFFE/SPIRE** (CNCF, gradué), stabilisé et largement déployé ; (2) la pile **WIMSE/OAuth** (IETF), en standardisation active mais sans RFC ; (3) la famille **DID/VC** du W3C, partiellement recommandée (VC 2.0) et partiellement en _Candidate Recommendation_ (DID v1.1). Aucun de ces trois ne fournit, à lui seul, une primitive d'« identité d'agent » : celle-ci se reconstruit par superposition.

#### 1. SPIFFE/SPIRE — le socle gradué

**SPIFFE et SPIRE sont le seul élément de la pile à offrir un statut de maturité non contestable : projets CNCF au niveau `Graduated`, audités, déployés en production à grande échelle.** `confirmé` La trajectoire est confirmée verbatim sur les pages projet CNCF : acceptés le 29 mars 2018, passés `incubating` le 22 juin 2020, puis `graduated`.[^p4-1][^p4-2]

Une divergence d'un jour, confirmée telle quelle par les deux pages projet, doit être citée sans la fusionner : la bascule `graduated` est datée du **22 août 2022 pour SPIRE** et du **23 août 2022 pour SPIFFE**, tandis que l'**annonce conjointe** officielle — assortie d'un audit tiers Cure53 (en sus de la revue TAG Security de début 2020) — porte la date du **20 septembre 2022**.[^p4-3] L'annonce liste des adopteurs de production : Bloomberg, ByteDance, Pinterest, Twilio, Anthem, GitHub, Netflix, Niantic, Uber, Carelon Digital Platforms, Indeed.com, HPE/Cray.

La dernière version stable de SPIRE est **v1.15.1**, publiée le **28 mai 2026** : correctif de sécurité sur le plugin d'attestation de nœud serveur `azure_imds` (validation de certificat impropre permettant la forge de documents attestés). Le _backport_ `v1.14.7` paraît le même jour ; `v1.15.0` (fonctionnalités) le 19 mai 2026.[^p4-4] `confirmé`

==== Spécifications normatives

Les contraintes sur les identifiants et documents d'identité SPIFFE sont confirmées au mot et fixent les invariants que toute couche supérieure hérite. Un **SPIFFE ID** est un URI RFC 3986 de schéma `spiffe://`, composé d'un _trust domain_ et d'un chemin ; il **DOIT** porter le schéma `spiffe`, un _trust domain_ non vide, et **NE DOIT PAS** inclure de composante _query_ ou _fragment_ ; les implémentations **DOIVENT** supporter jusqu'à 2048 octets (et **NE DEVRAIENT PAS** générer au-delà) ; _trust domain_ ≤ 255 octets.[^p4-5] Le **X.509-SVID** encode le SPIFFE ID comme URI dans le SAN — « _An X.509 SVID MUST contain exactly one URI SAN_ » — avec feuilles `cA=false`, `digitalSignature` obligatoire, `keyCertSign`/`cRLSign` interdits.[^p4-6] Le **JWT-SVID** place le SPIFFE ID dans `sub` ; `aud` est obligatoire et validée ; `alg` est restreint aux familles asymétriques RFC 7518 §3.3/3.4/3.5 (RS\**, ES\**, PS\**), excluant de facto `none` et HS\**.[^p4-7] `confirmé`

```
# X.509-SVID — feuille de charge (résumé des contraintes normatives)
Subject Alternative Name:
    URI: spiffe://prod.acme.example/ns/paiements/sa/agent-rapprochement
Basic Constraints: CA:FALSE
Key Usage: Digital Signature          # keyCertSign / cRLSign INTERDITS

# JWT-SVID — charge utile
{
  "sub": "spiffe://prod.acme.example/ns/paiements/sa/agent-rapprochement",
  "aud": ["spiffe://prod.acme.example/ns/grandlivre/sa/api-ledger"],
  "exp": 1782345600
}                                       # alg ∈ {RS*, ES*, PS*}  —  jamais none / HS*
```

SPIRE réalise l'attestation en deux phases — _node attestation_ puis _workload attestation_ ; la fédération inter-domaines relève d'une **spécification SPIFFE Federation distincte**, non détaillée sur la page « SPIRE Concepts ».[^p4-8] `confirmé`

==== Écosystème commercial

Le socle ouvert se double d'une offre commerciale en consolidation, à traiter comme positionnement industriel. HashiCorp Vault Enterprise 1.21 ajoute l'authentification SPIFFE native (émission de X.509-SVID), et Vault Enterprise 2.0 un moteur de secrets SPIFFE émettant des JWT-SVID — billet HashiCorp daté du **30 avril 2026**.[^p4-9] Red Hat propose le **Zero Trust Workload Identity Manager**, opérateur OpenShift en _tech preview_ basé sur SPIFFE/SPIRE (page publiée le 8 octobre 2025).[^p4-10] **Defakto** (anciennement SPIRL) a levé une Série B de **30,75 M$** le 21 octobre 2025, menée par XYZ Venture Capital ; cofondateurs Eli Nesterov (CTO) et Danny Oliveri (CEO).[^p4-11] `probable`

Deux corrections d'état de l'art s'imposent, conservées sans lissage. D'abord, la statistique « > 1 milliard de _credentials_ SPIFFE par jour » couramment prêtée à Uber **n'est pas présente** dans le blog d'ingénierie primaire (9 novembre 2023) ; ce dernier confirme en revanche verbatim « _4 500 services_ » et « _over 1/4 million nodes_ » (> 250 000 nœuds, quatre nuages) via SPIRE. La portion « 1 milliard/jour » passe donc à **`à vérifier`** (piste : transcript de la conférence CNCF « _Changing the SPIFFE ID of Every SPIRE-Enabled Workload at Uber_ » ou _case studies_ spiffe.io).[^p4-12] Ensuite, le billet de Série B Defakto ne cite **pas** Evan Gilman parmi les cofondateurs (il est co-auteur du livre O'Reilly SPIFFE/SPIRE, non désigné cofondateur ici) ; l'année de fondation « 2022 » et le total cumulé « ~49 M$ levés » n'y figurent pas non plus → **`à vérifier`**.

Note épistémique : le positionnement de SPIFFE comme « standard de facto de l'identité de charge, pilier de l'identité non-humaine (NHI) et fondation de l'identité des agents IA » est un **cadrage convergent d'éditeurs** (HashiCorp, Palo Alto Networks), à traiter comme positionnement industriel, **non** comme énoncé normatif d'un organisme de normalisation.[^p4-13] `probable`

#### 2. WIMSE (IETF) — la couche protocolaire, sans RFC

**Au 8 juin 2026, aucun document WIMSE n'a atteint le statut RFC : la couche protocolaire de l'identité de charge est en standardisation active mais reste entièrement à l'état d'_Internet-Draft_.** `confirmé` Le groupe **WIMSE** (Workload Identity in Multi-System Environments) opère sous la charte `charter-ietf-wimse-01` (statut **Approuvé**), chaires Justin Richer et Pieter Kasselman, _Area Director_ Charles Eckel.[^p4-14] La charte mentionne explicitement la collaboration avec la CNCF « _particularly with regard to the SPIFFE/SPIRE project_ » et combine OAuth, JWT et SPIFFE.

Une divergence inter-blocs subsiste sur l'aire IETF de rattachement et reste **`à vérifier`** : un bloc situe WIMSE en _Security Area_ (présumée, non confirmée verbatim) ; un second affirme l'aire **ART** (Applications and Real-Time) avec confirmation sur la page _About_ du groupe — lecture plus directe, donc plus probante, à recouper néanmoins via le champ _Area_ de `datatracker.ietf.org/group/wimse/about/`.[^p4-15]

Les sept _drafts_ WG sont tous au stade _Internet-Draft_, le plus avancé (`workload-identity-practices-04`, 28 p., 10 avril 2026, _shepherd_ J. Richer) en état « _WG Consensus: Waiting for Write-Up_ ».[^p4-16] La pile crédentielle se répartit ainsi :


***Tableau — Drafts WG WIMSE — états au 8 juin 2026 (aucune RFC).***

| **Draft WG** | **Rév. / date** | **Pages** | **État** | **Rôle** |
| --- | --- | --- | --- | --- |
| `wimse-arch` | -07 / 2026-03-02 | 27 | WG Document | Architecture de référence ; §3.3.9 « AI and ML-Based Intermediaries » — agents = charges déléguées, _re-bind_ du contexte |
| `wimse-workload-creds` | -01 / 2026-05-05 | 24 | WG Document | Définit **WIT** (JWS/JWT) et **WIC** (X.509, SAN URI) ; remplace `s2s-protocol` |
| `wimse-wpt` | -01 / 2026-03-02 | 19 | WG Document | _Workload Proof Token_ : preuve de possession liée à la requête HTTP |
| `wimse-http-signature` | -03 / 2026-04-07 | 19 | WG Document | Auth. via HTTP Message Signatures (RFC 9421) ; s'appuie sur le WIT |
| `wimse-identifier` | -02 / 2026-03-02 | 12 | WG Document | Identifiant = URI absolu (authority = _trust domain_) ; schémas `wimse://` et `spiffe://` |
| `wimse-mutual-tls` | -01 / 2026-05-05 | 8 | WG Document | Auth. de charge par mTLS |
| `wimse-workload-identity-practices` | -04 / 2026-04-10 | 28 | **Waiting for Write-Up** | Pratiques industrielles ; _draft_ le plus avancé |



Le **WIT (Workload Identity Token)** est un JWS/JWT à en-tête JOSE `typ=wit+jwt` ; claims requis `sub` (URI), `exp` (rafraîchi à l'ordre des heures), `cnf` (jwk de la clé publique) ; optionnels `iss`, `jti` ; **preuve de possession obligatoire** à la présentation.[^p4-17] `confirmé`

```json
// WIT — en-tête JOSE puis charge utile (draft-ietf-wimse-workload-creds-01)
{ "typ": "wit+jwt", "alg": "ES256", "kid": "..." }
{
  "sub": "wimse://prod.acme.example/agent-rapprochement",
  "exp": 1782345600,                 // horizon ~ heures, rafraîchi
  "cnf": { "jwk": { "kty": "EC", "crv": "P-256", "x": "...", "y": "..." } },
  "iss": "https://sts.acme.example", // optionnel
  "jti": "..."                       // optionnel — preuve de possession EXIGÉE à la présentation
}
```

Le _draft_ `s2s-protocol` (prédécesseur) est **mort** (`Dead/Replaced`, dernière rév. -07 du 2025-10-16), éclaté en quatre successeurs (`workload-creds`, `http-signature`, `mutual-tls`, `wpt`) — **à ne pas citer comme normatif**.[^p4-18] `confirmé` Outre les sept _drafts_ WG, la page Documents recense sept _drafts_ individuels liés (versions -00 à -02, 2026-01-05 à 2026-06-07), dont `draft-ni-wimse-ai-agent-identity-02` (2026-02-28) ; ces _drafts_ **n'ont aucun statut normatif**. `confirmé`

Une mise en garde épistémique à fort enjeu encadre toute citation de ces documents. Pour la quasi-totalité des _drafts_ WG (WIMSE comme OAuth), le champ métadonnée Datatracker « Intended RFC status » affiche `(None)` alors que l'en-tête _boilerplate_ du document indique « Standards Track ». « Standards Track » est donc l'**intention déclarée par les auteurs** (en-tête), **non** un statut IESG assigné (métadonnée) : il ne faut pas le présenter comme statut sanctionné. Seul `identity-chaining-14`, parvenu au stade IESG, porte une métadonnée « Proposed Standard » assignée.

#### 3. Chaînage OAuth — la primitive de délégation

**La délégation transverse aux domaines de confiance — substrat indispensable d'un agent agissant pour le compte d'un utilisateur ou d'un autre service — repose sur OAuth, et c'est sur ce front que la maturité normative est la plus avancée : RFC 8693 publiée, `identity-chaining` approuvé par l'IESG.** La primitive socle est RFC 8693 (OAuth 2.0 Token Exchange) — `subject_token`/`actor_token`, impersonation _et_ délégation, publiée en janvier 2020.[^p4-19]


***Tableau — Chaînage et attestation OAuth — états au 8 juin 2026.***

| **Document** | **État (8 juin 2026)** | **Statut visé** | **Détail** |
| --- | --- | --- | --- |
| `oauth-identity-chaining` | -14 / 2026-06-02 ; IESG `Approved-announcement::Revised I-D Needed` (2026-06-04) | Proposed Standard (métadonnée assignée) | Le plus mature ; ballots « No Objection » 2-3 juin 2026 ; combine RFC 8693 + RFC 7523 |
| `oauth-transaction-tokens` | -08 / 2026-03-02 ; « In WG Last Call » | Standards Track (en-tête) | Jalon IESG visé déc. 2026 ; propage identité + contexte d'autorisation dans un domaine de confiance |
| `oauth-identity-assertion-authz-grant` | -04 / 2026-05-21 ; actif | None (métadonnée) / S.T. (en-tête) | Base du _Cross-App Access_ (XAA) ; ID-JAG |
| `oauth-attestation-based-client-auth` | -09 / 2026-05-26 | None / S.T. (en-tête) | Attestation de client liée à une clé |
| `oauth-spiffe-client-auth` | -01 / 2026-03-02 | None / S.T. (en-tête) | Auth. de charges SPIFFE via SVID ; co-auteurs **NIST + IBM** |
| `oauth-v2-1` (OAuth 2.1) | -15 / 2026-03-02 ; **reste un I-D** | — | Jalon IESG visé déc. 2026 ; **pas encore RFC** |



Deux pièges de datation sont confirmés et conservés tels quels. Pour `transaction-tokens`, la plus haute révision numérotée déposée **reste -08** (2026-03-02) ; la date « 2026-06-02 » qui circule correspond à la **copie éditeur continue `-latest`** (`drafts.oauth.net`), non à une révision officielle — à ne pas citer comme révision.[^p4-20] Pour `identity-chaining-14`, l'état exact lu sur le datatracker est « _Approved-announcement to be sent::Revised I-D Needed_ » : **approuvé par l'IESG mais révision requise** avant publication — approuvé ≠ publié.[^p4-21]

Le **Cross-App Access (XAA)** — formellement « Identity Assertion Authorization Grant » — est une extension OAuth où un IdP d'entreprise gère la connexion entre deux applications, remplaçant l'approbation manuelle par un échange de jeton (via RFC 8693 + RFC 7523). L'adoption est **au stade précoce** selon OAuth.net : Okta en _early access_ (IdP) ; Auth0 et Athenz en _beta_ (serveur d'autorisation) ; Athenz aussi _beta_ (IdP) ; Keycloak _in progress_ ; **Claude Code (Anthropic)** listé comme client _beta_.[^p4-22] `confirmé`

#### 4. Identité spécifiquement _agentique_ — drafts individuels seulement

**Aucun standard agentique n'est au stade WG en juin 2026 : la couche agentique de l'IETF reste en _drafts_ individuels ou _Independent Submission_, de nature _Informational_, non adoptés.** `confirmé` Leur lecture conjointe livre toutefois l'insight le plus net du chapitre.


***Tableau — Drafts d'identité agentique — tous individuels, non adoptés (8 juin 2026).***

| **Draft** | **Rév. / date** | **Type** | **Statut** | **Apport** |
| --- | --- | --- | --- | --- |
| `klrc-aiagent-auth` | -02 / 2026-06-01 | Individuel | Informational | « _Rather than defining new protocols_ » : compose WIMSE + OAuth ; co-auteurs Defakto, AWS, Zscaler, Ping, **OpenAI**, Okta |
| `araut-oauth-transaction-tokens-for-agents` | -02 / 2026-05-22 | Individuel | voir divergence | `agentic_ctx` (métadonnées multi-agents) ; _Monotonic Attenuation_ verbatim ; auteur A. Raut (Amazon) |
| `embesozzi-oauth-agent-native-authorization` | -00 / 2026-04-03 | **Independent Submission** | Informational | _Structured elicitation_ + autorisation _just-in-time_ (JIT) ; M. Besozzi |
| `oauth-ai-agents-on-behalf-of-user` | -02 / 2025-08-25 | Individuel | **EXPIRÉ & archivé** | `requested_actor` + `actor_token` ; **NE PAS citer comme actif/normatif** |



Un verdict adversarial `réfuté/à vérifier` doit être restitué fidèlement sur `araut-...-for-agents-02` : l'affirmation absolutiste selon laquelle « le datatracker affiche `(None)`, et non `Informational` » est **réfutée sur ce point précis**. Le datatracker présente **les deux valeurs contradictoires** selon la vue — champ métadonnée structuré « Intended RFC status » = `(None)`, en-tête de la révision -02 « Intended status: » = `Informational`. La formulation correcte est de **signaler la divergence interne des deux champs** (document vs révision), non d'affirmer l'un contre l'autre.[^p4-23] Les autres faits — rév. -02, 2026-05-22, soumission individuelle non-WG, auteur A. Raut (Amazon), expiration 2026-11-23, claims `act`/`sub`/`agentic_ctx` **sans nouveau type de jeton ni grant**, absence de version WG (l'URL `draft-ietf-oauth-transaction-tokens-for-agents` renvoie HTTP 404) — sont `confirmés`.

L'insight structurant est `confirmé` pour le constat de stade, interprétatif pour l'intention : la stratégie dominante, portée par des acteurs récurrents (Defakto, Ping, Okta, AWS, OpenAI, Amazon), est la **composition** de briques éprouvées — Token Exchange, attestation, `identity-chaining`, SPIFFE/WIMSE — plutôt que l'invention d'un protocole d'agent, confirmée verbatim par l'_abstract_ de `klrc` (« _Rather than defining new protocols_ »).[^p4-24] À l'inverse, l'infrastructure de délégation inter-domaines sous-jacente (`identity-chaining-14`) atteint le stade quasi-RFC (IESG-approuvé). Conséquence pour le canon : la dimension D‑Autorité de l'opérateur τ (cf. Ch. 5) doit, en pratique 2026, être alimentée par un chaînage OAuth standard adossé à une identité SPIFFE ou WIT — il n'existe pas de « jeton d'agent » normatif sur lequel s'appuyer. La trace d'autorité d'une Decision ∈ {Déterministe, Probabiliste, Refus} repose donc sur l'_atténuation monotone_ (concept que `araut` formalise sous `agentic_ctx`) et sur la délégation chaînée, non sur un type de crédentiel agentique dédié.

#### 5. W3C — DID et Verifiable Credentials

**La famille DID/VC du W3C apporte un substrat d'identité décentralisée partiellement recommandé, mais son articulation avec la pile de charge (SPIFFE/WIMSE) reste non établie en source primaire.** La VC 2.0 est recommandée ; DID v1.1 ne l'est pas encore.


***Tableau — W3C DID / Verifiable Credentials — statuts au 8 juin 2026.***

| **Spécification** | **Statut** | **Date** | **Note** |
| --- | --- | --- | --- |
| DID Core v1.0 | **W3C Recommendation** | 2022-07-19 | Référence normative stable |
| DID v1.1 | _Candidate Recommendation Snapshot_ | 2026-03-05 | **Pas encore REC** ; ≥ 2 implémentations/fonctionnalité ; type média `application/did` |
| VC Data Model v2.0 | **W3C Recommendation** | 2025-05-15 | Concepts cœur de la famille VC 2.0 |
| Famille VC 2.0 | **7 Recommendations** | 2025-05-15 | Data Model 2.0, Data Integrity 1.0, EdDSA + ECDSA Cryptosuites, JOSE-COSE, Bitstring Status List, Controlled Identifiers ; **VC JSON Schema** et **BBS Cryptosuites** restent en CR |



Sources primaires : DID v1.0[^p4-25], DID v1.1[^p4-26], VC Data Model 2.0[^p4-27] et l'aperçu de la famille VC 2.0.[^p4-28]

La convergence SPIFFE ↔ WIMSE est explicitement **`à vérifier`** et a été rétrogradée de `probable` faute de source primaire : la relation supposée (support des WIT par SPIFFE, recouvrement WIT/SVID) **n'est pas confirmée** — la page d'aperçu spiffe.io ne mentionne ni WIMSE ni le Workload Identity Token. Le recouvrement conceptuel est plausible (WIT, JWT à clé confirmée, vs JWT-SVID), mais tout travail formel de support reste à vérifier.[^p4-29]

#### Questions ouvertes

Les incertitudes suivantes sont reportées telles quelles du dossier d'état de l'art (8 juin 2026) ; aucune ne doit être présentée comme tranchée.

- **Aire IETF de WIMSE** (ART vs Security) : divergence inter-blocs, à confirmer via le champ _Area_ du datatracker. `à vérifier`
- **Statistique Uber « > 1 milliard de credentials/jour »** : non sourcée par le primaire Uber/CNCF ; à confirmer (transcript CNCF ou _case studies_ spiffe.io). `à vérifier`
- **Defakto/SPIRL** : année de fondation (2022 ?) et total cumulé levé (~49 M$ ?) absents du billet de Série B. `à vérifier`
- **Calendrier des premières RFC WIMSE** : seul le jalon architecture (IESG, 31 juillet 2026, _informational_) est daté ; les RFC complètes relèvent vraisemblablement d'un événement 2027-2028, sans engagement officiel. `hypothèse`
- **Trajectoire de l'identité des agents** : un WG (WIMSE ou OAuth) adoptera-t-il un document normatif dédié d'ici 2027 ? Surveiller `araut-02` et `ni-wimse-ai-agent-identity-02`. `à vérifier`
- **Passage de DID v1.1 en REC** : fenêtre « pas avant le 5 avril 2026 » ; statut CR au 8 juin 2026, date effective non fixée. `à vérifier`
- **Articulation normative WIT (WIMSE) ↔ JWT-SVID (SPIFFE)** : recouvrement plausible, profil d'interopérabilité formel non établi. `à vérifier`
- **Publication finale d'`identity-chaining`** après la révision requise (« Revised I-D Needed ») : suivre la rév. ≥ 15 et l'entrée en file RFC Editor. `à vérifier`



### Ch. 12 — Autorité déléguée dans les chaînes agentiques

La délégation d'autorité vérifiable dans une chaîne d'agents se structure autour d'une opposition architecturale fondatrice : **transporter** une autorité atténuable — jetons à capacités, famille Macaroons/Biscuit — versus **évaluer** une autorité analysable — langage de politiques, Cedar. Les premiers instancient le modèle _object-capability_ (ocap) de Mark Miller — « la référence EST la permission », moindre privilège (POLA), atténuation monotone hors-ligne — qui est le substrat naturel des chaînes multi-sauts ; Cedar n'est pas un jeton mais un langage dont la force différenciante est l'analysabilité formelle (preuves Lean, _soundness_ et _completeness_). C'est précisément cette atténuation hors-ligne qui instrumente la dimension D‑Autorité de l'opérateur τ (autorité de l'appelant × autorité requise de la cible, cf. Ch. 5) : un agent ne peut transmettre que ce qu'il détient, jamais davantage. Le pont vers l'agentique reste toutefois **émergent et non normatif** : `cedar-for-agents` (expérimental) et le préprint `AIP` (non revu) coexistent sans coordination, et `confirmé` qu'_aucun standard IETF/W3C de jeton à capacités spécifique aux agents_ n'existe en date de juin 2026.

#### Le modèle object-capability et les jetons atténuables

L'ocap fournit la garantie structurelle que la délégation agentique requiert : un composant détient exactement l'autorité dont il a besoin (POLA), et il ne peut déléguer plus d'autorité qu'il n'en possède — il peut seulement passer une capacité **atténuée**.[^p4-30][^p4-31] Cette propriété — atténuation monotone, sans retour en arrière — est ce qui rend une chaîne de délégation analysable de bout en bout : à chaque saut, l'autorité ne peut que décroître. Le cadrage ocap pour l'agentique demeure cependant un courant d'opinion (`probable`, sources secondaires), pas un consensus normatif.

**Macaroons** est la formalisation fondatrice du jeton porteur (_bearer_) atténuable. L'article « Macaroons: Cookies with Contextual Caveats for Decentralized Authorization in the Cloud » (NDSS 2014, Internet Society ; 6 auteurs Google : Birgisson, Politz, Erlingsson, Taly, Vrable, Lentczner) en fixe le mécanisme : une chaîne de MAC imbriqués (HMAC) où l'on n'ajoute jamais d'autorité, on la restreint.[^p4-32] Deux types de _caveats_ : les _first-party caveats_ (atténuation locale, p. ex. « expire dans 5 min ») et les _third-party caveats_, qui exigent une preuve de décharge externe (_discharge macaroon_). Ce dernier mécanisme est l'ancêtre direct de la délégation inter-domaines : prouver qu'une autorité tierce a consenti, sans que l'émetteur initial soit en ligne.

**Biscuit** généralise l'approche avec un appareil cryptographique et logique plus moderne, et un parrainage institutionnel. Proposé à l'Eclipse Foundation le 22 juillet 2024 (projet « Eclipse Biscuit », statut _Incubating_ sous parent « Eclipse Technology » ; lead Clément Delafargue ; parties prenantes Outscale et Clever Cloud), il réalise l'atténuation **hors-ligne** par une liste de blocs _append-only_ signés : le porteur ajoute un bloc de _checks_ sans jamais retirer ni remplacer les blocs antérieurs.[^p4-33] Cryptographie : Ed25519 par défaut, ECDSA secp256r1 (SEC2v1) en alternative ; une version _sealed_ bloque toute atténuation ultérieure ; sérialisation Protocol Buffers. L'autorisation s'exprime en **Datalog sans négation** (types : variable, entier, chaîne, octets, date, booléen, null, set, array, map), ce qui rend chaque bloc déclaratif et vérifiable contre la clé racine.[^p4-34][^p4-35]

L'append-only de Biscuit correspond presque terme à terme à la mécanique d'atténuation monotone exigée par D‑Autorité : la fonction d'autorité d'un jeton est décroissante le long de la chaîne, ce qui ferme structurellement la porte à l'escalade de privilège dans la re-délégation inter-agents (le mécanisme de défense contre le _confused deputy_ est traité au Ch. 13).

Deux divergences de versionnement doivent être maniées avec rigueur dans toute citation normative, et ne pas être lissées.

Le numéro de **spécification/format Datalog** (v3.3, encodé `6`) est distinct de celui de la **bibliothèque Rust** `biscuit-auth` (≥ 5.0.0). La spec v3.3 a ajouté null, arrays, maps, appels de fonctions externes et l'opération `try`.[^p4-36] Par ailleurs, le statut des _third-party blocks_ est rapporté « alpha » dans l'annonce de version (27 novembre 2024) mais « mature » dans la spécification courante (juin 2026) : c'est une évolution à **dater**, non une contradiction.

Côté sécurité, `confirmé` : **CVE-2024-42350** (GHSA-rgqv-mwc3-c78m, publiée le 31 juillet 2024) — confusion de clé publique dans les _third-party blocks_. Le score est CVSS v3.1 = 3,0 (et non « CVSS v3.0 »). Versions affectées : `biscuit-auth` (Rust) ≤ 4, `org.biscuitsec.biscuit` (Maven) 3–4, spec 3–4 ; corrigée en 5.0.0.[^p4-37]

Un bloc d'atténuation Biscuit illustre la mécanique : le porteur ajoute un _check_ qui **restreint** la requête à un outil et une fenêtre temporelle, sans pouvoir élargir l'autorité héritée du bloc d'autorité racine.

```
// Bloc racine (émis par l'autorité) — autorité maximale du jeton
right("agent-orchestrateur", "outil:facture", "lecture");
right("agent-orchestrateur", "outil:facture", "ecriture");

// Bloc atténué ajouté hors-ligne par l'agent délégué (append-only) :
// la requête est RESTREINTE à la lecture, sur une seule ressource,
// avant une échéance. Aucun droit nouveau ne peut être introduit.
check if
  operation("lecture"),
  resource("outil:facture/INV-2026-0612"),
  time($t), $t < 2026-06-12T23:59:59Z;
```

#### Cedar — politiques analysables et vérification Lean

Cedar relève d'une autre catégorie : ce n'est pas un jeton porteur atténuable mais un langage de politiques dont l'argument différenciant est l'analysabilité formelle. L'article de référence « Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization » (OOPSLA 2024, PACMPL, DOI 10.1145/3649835) et son compagnon « How We Built Cedar: A Verification-Guided Approach » (FSE 2024, DOI 10.1145/3663529.3663854) décrivent une implémentation Rust dont les propriétés sont formellement vérifiées en Lean.[^p4-38][^p4-39] L'approche _verification-guided development_ (VGD) maintient des modèles Lean exécutables **en parallèle** du Rust de production, validés par _differential random testing_ (Lean ↔ Rust) ; `confirmé` : 4 bugs de _soundness_ et 21 bugs au total trouvés et corrigés par ce dispositif.

**Cedar Analysis** (annonce AWS du 16 juin 2025) franchit un cap : le _Cedar Symbolic Compiler_, implémenté en Lean, fournit des preuves de _soundness_ **et** de _completeness_, complété par la _Cedar Analysis CLI_.[^p4-40] Le crate associé `cedar-policy-symcc` est en v0.5.1 (1 juin 2026).[^p4-41] Cedar a rejoint la CNCF comme projet _Sandbox_ (annonce AWS du 15 décembre 2025), trajectoire annoncée « Sandbox → Incubation → Graduated ».[^p4-42]

Comme pour Biscuit, deux numéros de version ne doivent pas être confondus : la version du **langage** Cedar (4.5, supportée par Amazon Verified Permissions depuis le 21 août 2025, opérateur `is`) est distincte de celle du **crate/SDK Rust** (4.11.0, 18 mai 2026, module `pst`).[^p4-43] Un changement cassant de l'API Rust n'implique **pas** un changement cassant du langage.

L'analysabilité de Cedar se rattache à D‑Invariant et à l'analyse statique de la délégation : on peut **prouver**, hors exécution, qu'aucune combinaison de politiques n'autorise un accès interdit. C'est une garantie complémentaire — et non concurrente — de l'atténuation monotone des jetons : l'un borne l'autorité **transportée**, l'autre vérifie l'autorité **décidée**.

#### Le pont agentique — émergent, non normatif

Le pont entre ces primitives et l'agentique est aujourd'hui expérimental, fragmenté et dépourvu de tout sceau normatif. `cedar-policy/cedar-for-agents` est un dépôt expérimental (~30 étoiles) reliant Cedar à des systèmes d'agents IA. Son composant le plus abouti, `cedar-policy-mcp-schema-generator` v0.6.0 (26 mai 2026), génère un schéma Cedar à partir des descriptions d'outils d'un serveur _MCP_ ; un `cedar-analysis-mcp-server` l'accompagne.[^p4-44] Précision : il n'existe **pas** de release globale monolithique « cedar-for-agents 0.6.0 » (dépôt multi-crates), et `confirmé` que la documentation **ne détaille pas** de chaînes de délégation multi-sauts.

Le seul protocole prétendant unifier délégation vérifiable et atténuation côté porteur pour agents est un préprint dont le statut interdit tout usage normatif. Verdict du dossier : `à vérifier`. « AIP: Agent Identity Protocol for Verifiable Delegation Across MCP and A2A » (arXiv:2603.24775, auteur unique S. Prakash, 25 mars 2026, cs.CR) introduit des _Invocation-Bound Capability Tokens_ (IBCTs) combinant délégation vérifiable par clé publique, atténuation côté porteur et politique chaînée, avec un surcoût annoncé < 2,35 ms ; l'article affirme avoir scanné ~2000 serveurs MCP, tous dépourvus d'authentification.[^p4-45] **Statut : préprint non revu par les pairs, à auteur unique — à ne PAS citer comme normatif.** Aucun standard IETF/W3C de jeton à capacités pour agents n'est confirmé à cette date.

#### Tableau comparatif — modèles de délégation

Trois primitives, deux catégories : deux jetons porteurs atténuables (Macaroons, Biscuit) et un langage de politiques analysable (Cedar). Le tableau croise nature, mécanique d'atténuation, cryptographie, force différenciante et — colonne décisive ici — pertinence et maturité pour la chaîne agentique. La pertinence agentique de l'ocap reste un courant d'opinion émergent (`probable`, sources secondaires).


***Tableau — Modèles de délégation d'autorité — capacités atténuables vs politiques analysables (juin 2026).***

| **Dimension** | **Macaroons** | **Biscuit** | **Cedar** |
| --- | --- | --- | --- |
| Nature | Jeton porteur atténuable | Jeton porteur atténuable | Langage de **politiques** (pas un jeton) |
| Atténuation | Hors-ligne, décentralisée (caveats) | Hors-ligne, blocs append-only | N/A (évaluée par moteur) |
| Cryptographie | HMAC chaînés | Ed25519 (défaut) / ECDSA secp256r1 | Signatures sur les politiques (selon déploiement) |
| Langage | Caveats contextuels | Datalog (sans négation) | Langage de politiques dédié |
| Force différenciante | Simplicité, décentralisation | Datalog déclaratif + vérif. par clé racine | Analysabilité formelle (Lean, soundness + completeness) |
| Évaluation | Locale (vérif. de chaîne) | Locale (vérif. de chaîne) | Moteur (AVP centralisé ou embarqué) |
| Risque | Vol du **bearer** | Vol du **bearer** | Erreur de politique (atténué par analyse formelle) |
| Pertinence agentique | Chaînes multi-sauts | Chaînes multi-sauts (POLA, atténuation monotone) | Politiques analysables d'autorisation d'outils |
| Gouvernance | Google (NDSS 2014) | Eclipse `Incubating` (2024) | CNCF `Sandbox` (déc. 2025) |
| Maturité agentique | — | — | `cedar-for-agents` **expérimental** |



#### Drafts IETF de délégation et initiatives NIST/NCCoE

Au-delà des familles de capacités, la délégation inter-domaines repose sur la pile OAuth (cf. Ch. 11), et deux signaux gouvernementaux US confirment que l'infrastructure d'autorité d'agent quitte le stade purement industriel. Le draft le plus mature, `draft-ietf-oauth-identity-chaining` (révision 14), atteint le stade **quasi-RFC** (IESG `Approved-announcement::Revised I-D Needed`, ballots des 2–3 juin 2026) ; ses co-auteurs incluent MITRE (K. Burgin) et NSA-CCSS (M. Jenkins).[^p4-46]

Côté NIST/NCCoE (`confirmé`), le NCCoE a publié le concept paper « Accelerating the Adoption of Software and AI Agent Identity and Authorization » (marqué DRAFT, February 2026 ; auteurs Booth/Fisher/Galluzzo/Roberts, NIST), avec une période de commentaires du 5 février au 2 avril 2026.[^p4-47] Précision à conserver : la date « 2026-02-05 » est l'**ouverture** de la période de commentaires, non une date de publication imprimée distincte (le PDF ne porte que « February 2026 »). Quatre domaines de démonstration sont confirmés verbatim : _Authorization of AI Systems_ (via OAuth 2.0), _Access Delegation_, _Logging and Transparency_, plus un axe _Identification_. En parallèle, NIST mène une « AI Agent Standards Initiative » (page créée le 17 février 2026, mise à jour le 20 avril 2026) incluant explicitement « fundamental research into agent authentication and identity infrastructure » ; le RFI sécurité associé s'est clos le 9 mars 2026.[^p4-48]

La leçon transversale rejoint la dimension D‑Autorité de l'opérateur τ : le marché **compose** des briques éprouvées (OAuth chaîné, Cedar/Biscuit/Macaroons) plutôt qu'il n'invente un standard agentique de capacités. L'atténuation hors-ligne demeure le mécanisme qui rend cette composition sûre — chaque saut décroît, et la décision d'autorité de τ peut s'appuyer sur une autorité dont la borne supérieure est cryptographiquement garantie.

#### Questions ouvertes

Les incertitudes suivantes sont reprises du dossier d'état de l'art (arrêté au 8 juin 2026) et conservent leur marqueur.

- **Date exacte du vote CNCF.** Le billet AWS donne la date d'**annonce** de l'acceptation de Cedar (15 décembre 2025), mais non la date du vote du TOC. `à vérifier`.
- **Dernière publication du crate `cedar-policy` sur crates.io.** La page est rendue côté JS et n'a pu être récupérée le 8 juin 2026 ; v4.11.0 est confirmée via GitHub uniquement. `à vérifier`.
- **Internet-Draft IETF actif (non expiré) sur les jetons à capacités / la délégation d'agents**, au-delà des préprints arXiv ? Pistes : OAuth, WIMSE, SPICE. `à vérifier`.
- **Spécification officielle de délégation à capacités pour MCP/A2A** par un acteur majeur, au-delà de `cedar-for-agents` (expérimental) et d'AIP (préprint) ? Aucune confirmée à ce jour. `à vérifier`.
- **« Delegation chain splicing » sur la liste OAuth de mars 2026** : le terme et le débat associé ne sont **pas** re-confirmés sur archive primaire ; le mécanisme d'atténuation monotone qui y répond est, lui, confirmé dans `draft-araut-oauth-transaction-tokens-for-agents-02`. `à vérifier` / `confirmé` (mécanisme).
- **Passage du concept paper NCCoE (commentaires clos le 2 avril 2026) à un projet de démonstration formel** avec partenaires : non annoncé au 8 juin 2026. `à vérifier`.
- **Calendrier 2027–2030** : aucune date ferme d'entrée en vigueur ou de publication RFC pour `transaction-tokens` (jalon « Submit to IESG » fixé à décembre 2026, indicatif) ni pour les drafts WIMSE ; toute projection demeure une `hypothèse`.



### Ch. 13 — Menaces et défenses de l'entreprise agentique

Le paysage des menaces agentiques s'organise autour de trois cadres complémentaires — OWASP (catalogue de vulnérabilités et de mitigations), MITRE ATLAS (techniques adverses, _TTP_), CSA (cartographie architecturale) — qui convergent sur un constat unifiant : le _confused deputy_ agentique et l'injection de prompt sont des problèmes d'**autorisation** et d'**architecture**, non des défauts de modèle, et l'injection de prompt demeure un problème ouvert non entièrement résoluble. L'agentique **aggrave** l'injection — surface élargie par les outils, le _RAG_ et le multi-agent — et introduit des classes de menaces (_chain splicing_, _credential relay through delegation chains_) encore imparfaitement couvertes par les taxonomies existantes.

Lu à travers le canon (cf. Ch. 5 et Ch. 6), ce constat se reformule sans perte : ces menaces sont des **violations d'invariants sur la trace**. Le D‑Invariant — l'état des invariants `I1`–`I5` observé le long de la trace d'exécution — est précisément la dimension d'entrée de τ qui rend l'agression **détectable comme telle**, indépendamment de la qualité du modèle. La défense de premier ordre n'est donc pas un meilleur classifieur, mais le régime opérateur τ en sortie **Refus** (cf. Decision ∈ {Déterministe, Probabiliste, Refus}) : un **dispatch** qui refuse de fixer le sens (_t_fix</sub>(g)) lorsque l'autorité requise dépasse l'autorité de l'appelant (D‑Autorité) ou qu'un invariant est rompu. Les remédiations recensées par OWASP et CSA — _admission control_, validation d'entrée structurée, cadrage explicite de l'autorité — sont l'instanciation opérationnelle, **externe au modèle**, de ce même refus.

#### 1. OWASP — deux taxonomies à ne pas confondre

OWASP maintient en date de juin 2026 **deux** listes distinctes qu'il ne faut pas amalgamer : le _Top 10 for LLM Applications_ (orienté application) et le _Top 10 for Agentic Applications_ (orienté système d'agents). La première décrit des vulnérabilités de la couche modèle-application ; la seconde, des risques propres à l'autonomie, à l'usage d'outils et à la coordination inter-agents.

La date de l'édition « LLM 2025 » illustre la discipline de datation requise : trois dates coexistent dans les propres sources d'OWASP — **byline** d'annonce « November 17, 2024 », communiqué « WILMINGTON, Del. — Nov. 19, 2024 », et tampon de **build** du PDF « 20241114 » (v4.2.0a). La date retenue est le **17 novembre 2024** (annonce officielle)[^p4-49], écart intra-OWASP de 14/17/19 nov. à ne pas lisser ; « 2025 » désigne l'année de l'édition, pas la date de sortie. Les dix entrées (`confirmé` verbatim) sont LLM01 _Prompt Injection_, LLM02 _Sensitive Information Disclosure_, LLM03 _Supply Chain_, LLM04 _Data and Model Poisoning_, LLM05 _Improper Output Handling_, LLM06 _Excessive Agency_, LLM07 _System Prompt Leakage_ (nouveau), LLM08 _Vector and Embedding Weaknesses_ (nouveau, _RAG_), LLM09 _Misinformation_, LLM10 _Unbounded Consumption_ (étend l'ancien _DoS_)[^p4-50].

Du côté agentique, deux livrables se succèdent. Le guide « Agentic AI — Threats and Mitigations » v1.0 (17 février 2025, **first in a series** de l'_Agentic Security Initiative_) énumère 15 menaces **T1–T15**[^p4-51] (`confirmé` ; titres verbatim `à vérifier` dans le PDF intégral, la page de ressource n'exposant que la couverture). Le « Top 10 for Agentic Applications » (édition 2026), publié le **9 décembre 2025** (plus de 100 contributeurs ; **Expert Review Board** incluant NIST, Commission européenne, Alan Turing Institute), liste **ASI01–ASI10**[^p4-52] (`confirmé`).


***Tableau — OWASP Top 10 for Agentic Applications (édition 2026) — ASI01–ASI10***

| **Code** | **Risque agentique 2026** |
| --- | --- |
| ASI01 | Agent Goal Hijack _(annonce officielle : « Agent Behavior Hijacking » — voir divergence)_ |
| ASI02 | Tool Misuse and Exploitation |
| ASI03 | Identity and Privilege Abuse |
| ASI04 | Agentic Supply Chain Vulnerabilities |
| ASI05 | Unexpected Code Execution (RCE) |
| ASI06 | Memory & Context Poisoning |
| ASI07 | Insecure Inter-Agent Communication |
| ASI08 | Cascading Failures |
| ASI09 | Human-Agent Trust Exploitation |
| ASI10 | Rogue Agents |



Deux divergences sont à conserver. D'une part, les listes **T1–T15** et **ASI01–ASI10** ne se correspondent **pas un-à-un** : le Top 10 consolide et réorganise, mais aucune table de correspondance officielle 1:1 normative n'a été confirmée — ne jamais présenter les T-codes et les ASI-codes comme équivalents (`probable`). D'autre part, la dénomination d'ASI01 diverge entre l'annonce officielle (« Agent Behavior Hijacking ») et les recensions secondaires (« Agent Goal Hijack »[^p4-53]), à confirmer dans le PDF intégral 2026.

La lecture canonique de cette table est directe : ASI03 (_Identity and Privilege Abuse_) et ASI07 (_Insecure Inter-Agent Communication_) sont exactement les vecteurs par lesquels D‑Autorité et D‑Invariant sont franchis. Une politique opérateur τ correctement instanciée transforme ASI03 et ASI07 d'incidents subis en **Refus** émis avant action.

#### 2. MITRE ATLAS — l'arrivée de l'agentique et un débat sur le mouvement latéral

ATLAS a promu l'« Agentic AI » au rang de plateforme de premier ordre en 2026, mais sa couverture du mouvement latéral **agent-à-agent** fait l'objet d'une divergence réelle entre MITRE et la CSA qu'il ne faut pas lisser.


***Tableau — Jalons MITRE ATLAS pertinents pour l'agentique***

| **Version ATLAS** | **Date** | **Contenu / apport** |
| --- | --- | --- |
| v5.1.0 | 2025-11-06 | 16 tactiques / 84 techniques / 56 sous-techniques / 32 mitigations / 42 cas ; « Added a new tactic Lateral Movement (AML.TA0015) » |
| v2026.05 | 2026-05-27 | Versionnage `YYYY.MM.N` ; format YAML v6.0.0 ; champ **platforms** = {Predictive AI, Generative AI, Agentic AI, Enterprise} — « Agentic AI » de premier rang |



Les techniques **agent-focused** proviennent de contributions Zenity Labs en deux vagues : automne 2025 (premières techniques centrées agents — AML.T0081/T0082/T0086) puis « première mise à jour 2026 » (5 techniques AML.T0096/T0098/T0099/T0100/T0101)[^p4-54]. Le chiffre de « 14 techniques » attribué à la vague d'octobre 2025 figure dans des recensions vendeur mais n'a pas été confirmé au CHANGELOG[^p4-55] → `à vérifier` (`probable`).

La divergence centrale, **à ne pas lisser** : (a) le CHANGELOG MITRE indique que v5.1.0 « **Added a new tactic Lateral Movement (AML.TA0015)** » ; (b) la note CSA « **MITRE ATT&CK and ATLAS Agentic Gap Analysis** » (draft, 27 mars 2026) affirme qu'ATLAS « **intentionally excludes lateral movement and command-and-control as tactics** » et identifie **six catégories** non couvertes[^p4-56] :

- **agent-to-agent lateral movement** ;
- **tool-chain poisoning** ;
- **orchestrator hijacking** ;
- **credential relay through delegation chains** ;
- **cross-session memory persistence** ;
- **MCP server compromise as a pivot point**.

Interprétation `probable` : la tactique ajoutée vise un mouvement latéral de **style réseau**, distinct du mouvement latéral **agent-à-agent** visé par la critique CSA ; ou bien le cadrage CSA est antérieur ou non aligné sur v5.1.0. **Ne pas affirmer qu'ATLAS couvre pleinement le mouvement latéral inter-agents.** Cet angle mort est doctrinalement significatif : **agent-to-agent lateral movement** et **credential relay through delegation chains** sont, dans le vocabulaire du canon, des trajectoires où D‑Autorité est érodée saut après saut et où D‑Invariant n'est plus vérifié de bout en bout — exactement la zone que τ est censé garder.

#### 3. Cadres NIST

NIST fournit la taxonomie adversariale de référence (AI 100-2 E2025) et le cadre-mère de gouvernance (AI RMF 1.0). Fait à conserver : le NIST AI 600-1 **n'emploie pas le terme « confused deputy »**, qui relève du cadrage CSA/OWASP. (L'absence de ce terme dans l'AI 100-2 E2025 et l'AI RMF 1.0 n'est pas attestée par le dossier — `à vérifier` —, le dossier ne confirmant explicitement le « n'emploie pas » que pour l'AI 600-1.)


***Tableau — Cadres NIST applicables aux menaces agentiques***

| **Publication** | **Statut** | **Date** | **Portée** |
| --- | --- | --- | --- |
| NIST AI 100-2 E2025 — Adversarial ML | Final | 2025-03-24 | DOI 10.6028/NIST.AI.100-2e2025 ; taxonomie intégrité/disponibilité/confidentialité ; injection de prompt directe/indirecte, **poisoning**, évasion |
| NIST AI RMF 1.0 | Cadre-mère | 2023-01 | Govern/Map/Measure/Manage ; **pas** de taxonomie adversariale native (jour exact `à vérifier`) |
| NIST AI 600-1 — GenAI Profile | Final | 2024-07-26 | ~12 catégories de risque GenAI ; injection de prompt ; n'emploie **pas** « confused deputy » |



Sources : AI 100-2 E2025[^p4-57] ; AI RMF 1.0[^p4-58] ; AI 600-1[^p4-59]. État `confirmé` (les pages AI RMF 1.0 et AI 600-1 n'ont pas été ré-ouvertes cette session ; valeurs conservées de la connaissance établie et des pages éditeur). La taxonomie tripartite de l'AI 100-2 (intégrité / disponibilité / confidentialité) cartographie proprement le rôle de D‑Invariant : une atteinte à l'**intégrité** est, sur la trace, une rupture d'invariant détectable avant que τ ne consente à fixer le sens.

#### 4. Confused deputy, injection de prompt, chain splicing

Ces quatre vecteurs partagent une même racine : l'agent traite **tout** contenu de sa fenêtre de contexte comme potentiellement instructif, ce qui efface la frontière dure entre données et code. La conséquence canonique est que la défense ne peut résider dans le modèle ; elle réside dans le **dispatch** d'autorité (τ) et la vérification d'invariants (D‑Invariant) en amont de l'action.

Le **confused deputy** agentique est conceptualisé comme une faille d'**autorisation/architecture**, non un défaut de modèle : l'agent « **is designed to treat all content in their context window as potentially instructive, which eliminates the hard boundary between data and code** », de sorte qu'une injection le manipule pour abuser de ses identifiants délégués ; les remédiations (_admission control_, validation d'entrée structurée, cadrage explicite de l'autorité) sont des contrôles **externes au modèle**. Note de recherche CSA dédiée : « **Confused Deputy Attacks on Autonomous AI Agents** », 23 mars 2026[^p4-60] (`confirmé`). C'est le cas d'usage paradigmatique de la sortie **Refus** : l'appelant n'a pas l'autorité requise (D‑Autorité), donc τ refuse de déplacer _t_fix</sub>(g) vers le régime probabiliste, quel que soit le contenu injecté.

L'injection de prompt (directe et indirecte) est qualifiée de **problème ouvert non entièrement résoluble**. La page OpenAI « **Understanding prompt injections: a frontier security challenge** » la présente comme « **frontier, challenging research problem** » dont le travail « **remains ongoing** » (« **an open challenge for agent security... for years to come** »)[^p4-61] (`confirmé` ; date exacte de la page `à vérifier` — HTTP 403 à la récupération directe). Cette irréductibilité justifie, au plan théorique, de ne **pas** faire dépendre la sécurité d'une garantie probabiliste : la frontière déterministe (le **Refus** de τ, la garantie de message du substrat _event streaming_) est ce qui reste vrai même quand l'injection réussit à l'intérieur du régime probabiliste.

Le **chain splicing** / re-délégation inter-agents est documenté comme amplification multi-agent : l'injection cible l'agent **délégué** (moins protégé) plutôt que l'agent face-utilisateur, en convergence avec le **credential relay through delegation chains** de la CSA ; cartographie partielle OWASP ASI07 et T12[^p4-62] (`probable` ; le terme « chain splicing » lui-même reste de la littérature secondaire/préprint, non normatif — par cohérence avec le Ch. 12, le débat de la liste OAuth de mars 2026 n'est pas re-confirmé sur archive primaire). Le draft `draft-araut-oauth-transaction-tokens-for-agents-02` y répond par l'**atténuation monotone** (confirmée verbatim ; auteur A. Raut, Amazon ; -02 du 2026-05-22)[^p4-63], s'appuyant sur la pile de chaînage d'identité (`identity-chaining-14`, co-auteurs MITRE/NSA-CCSS)[^p4-64].

L'atténuation monotone est l'expression protocolaire d'une propriété d'invariant : l'autorité ne peut que **décroître** le long de la chaîne de délégation. Formellement, c'est une contrainte sur D‑Autorité — l'autorité requise à la cible ne peut excéder l'autorité héritée de l'appelant — et toute violation est, par construction, une rupture d'invariant sur la trace que τ peut sanctionner en **Refus**. Une politique illustrative, exprimant que la re-délégation préserve la monotonie et déclenche un refus sinon :

```yaml
# Politique de re-délégation inter-agents (illustrative, non normative)
# Invariant gardé : autorité(délégué) ⊆ autorité(appelant) — atténuation monotone
delegation:
  monotonic_attenuation: required        # l'autorité ne peut que décroître
  agentic_ctx:                           # cf. araut-02 : métadonnées multi-agents
    propagate: [caller_id, scope_subset, hop_count]
    max_hops: 4
  on_scope_inflation:                    # autorité requise > autorité héritée
    tau_decision: Refus                  # cf. Ch. 5 — sortie {Déterministe, Probabiliste, Refus}
    reason: "D-Autorité: requested > inherited"
  on_invariant_break:                    # I1–I5 rompu sur la trace
    tau_decision: Refus                  # cf. Ch. 6 — I4 demeure Hypothèse, ne pas présumer
    audit: emit_trace_event
```

Cette politique n'invente rien : elle compose des briques éprouvées (chaînage OAuth, atténuation monotone) et délègue la décision finale au opérateur τ, conformément à la rupture canonique `composition→délégation`.

#### 5. Convergence des cadres — complémentarité, pas mapping normatif

Les trois grands cadres sont **complémentaires** par positionnement éditorial, mais le mapping fin inter-cadres n'est **pas** normatif — distinction à conserver pour ne pas conférer une autorité indue à des recensions tierces.


***Tableau — Rôles éditoriaux des trois cadres et statut du cross-mapping***

| **Cadre** | **Rôle** | **Statut du mapping inter-cadres** |
| --- | --- | --- |
| OWASP ASI | Catalogue de vulnérabilités + mitigations actionnables | — |
| MITRE ATLAS | Modèle de comportement adverse / références TTP | — |
| CSA MAESTRO | Carte de menaces architecturale par couche + responsabilité | — |



La complémentarité est **plausible** et soutenue par le positionnement éditorial de chaque cadre, mais le mapping détaillé « T-codes OWASP alignés sur les couches MAESTRO et les techniques ATLAS » provient d'un **agrégateur tiers** (Tech Jacks Solutions) et **n'est pas un mapping officiel normatif**[^p4-65]. Distinguer le positionnement éditorial (`confirmé`) du mapping fin (`probable`, non normatif) ; la **gap analysis** CSA elle-même est `confirmé`[^p4-66]. La lecture par le canon offre, faute de table normative, un **invariant de traduction** : quelle que soit la taxonomie, une menace donnée se range selon la dimension de τ qu'elle viole — D‑Sens (sens détourné : ASI01, ASI06), D‑Autorité (autorité abusée : ASI03, **confused deputy**, **credential relay**) ou D‑Invariant (intégrité de la trace rompue : ASI07, ASI08). Ce classement n'est pas un mapping officiel mais un principe d'organisation interne à la monographie.

#### Questions ouvertes

Les incertitudes suivantes, issues du dossier (`à vérifier` en date de juin 2026), conditionnent toute affirmation normative de ce chapitre :

- Confirmer les titres verbatim **T1–T15** du guide OWASP v1.0 directement dans le PDF intégral.
- Confirmer la dénomination exacte d'**ASI01** dans le document final 2026 (« Agent Goal Hijack » vs « Agent Behavior Hijacking »).
- Lever la **divergence ATLAS sur le mouvement latéral** : vérifier la description exacte d'AML.TA0015 (réseau vs agent-à-agent) sur atlas.mitre.org / atlas-data, et déterminer si la critique CSA est antérieure ou non alignée sur v5.1.0.
- Établir le décompte **exact** des techniques **agent-focused** Zenity Labs d'octobre 2025 (les « 14 ») via atlas-data ou le blogue Zenity primaire.
- Confirmer la **date de publication exacte** de la page OpenAI « Understanding prompt injections » (HTTP 403).
- Confirmer le jour exact de **NIST AI RMF 1.0** (janvier 2023) et le nombre exact de catégories de risque GenAI de NIST AI 600-1 (~12).
- Vérifier l'existence d'une **table de correspondance officielle** T1–T15 ↔ ASI01–ASI10 ; à défaut, ne jamais présenter les deux numérotations comme équivalentes.

Au-delà du dossier, une question ouverte **propre à la monographie** demeure : l'efficacité de la défense par τ en régime **Refus** contre l'injection indirecte n'est pas établie empiriquement — elle relève du même statut que I4 (Hypothèse), dont la campagne empirique n'est pas concluante (cf. Ch. 6). Présenter le **Refus** comme garantie acquise contre le **chain splicing** serait un écart de traçabilité ; il s'agit, en l'état, d'une `hypothèse` réfutable dont la condition de réfutation est une chaîne de re-délégation où l'atténuation monotone est respectée mais où le sens est néanmoins détourné sans rupture d'invariant détectable.

[^p4-1]: SPIRE | CNCF (page projet, dates de maturité) — CNCF — 2026 — https://www.cncf.io/projects/spire/
[^p4-2]: SPIFFE | CNCF (page projet, dates de maturité) — CNCF — 2026 — https://www.cncf.io/projects/spiffe/
[^p4-3]: SPIFFE and SPIRE Projects Graduate from CNCF Incubator (annonce ; Cure53 ; adopteurs) — CNCF — 2022-09-20 — https://www.cncf.io/announcements/2022/09/20/spiffe-and-spire-projects-graduate-from-cloud-native-computing-foundation-incubator/
[^p4-4]: spiffe/spire Releases (GitHub, v1.15.1) — SPIFFE / GitHub — 2026-05-28 — https://github.com/spiffe/spire/releases
[^p4-5]: SPIFFE-ID standard (spiffe/spiffe GitHub) — SPIFFE — 2026 — https://github.com/spiffe/spiffe/blob/main/standards/SPIFFE-ID.md
[^p4-6]: SPIFFE | X509-SVID specification — SPIFFE — 2026 — https://spiffe.io/docs/latest/spiffe-specs/x509-svid/
[^p4-7]: SPIFFE | JWT-SVID specification — SPIFFE — 2026 — https://spiffe.io/docs/latest/spiffe-specs/jwt-svid/
[^p4-8]: SPIFFE | SPIRE Concepts (node/workload attestation) + SPIFFE Federation specification — SPIFFE — 2026 — https://spiffe.io/docs/latest/spire-about/spire-concepts/
[^p4-9]: SPIFFE: Securing the identity of agentic AI and non-human actors (HashiCorp blog) — HashiCorp — 2026-04-30 — https://www.hashicorp.com/en/blog/spiffe-securing-the-identity-of-agentic-ai-and-non-human-actors
[^p4-10]: What are SPIFFE and SPIRE? (Red Hat ; Zero Trust Workload Identity Manager tech preview) — Red Hat — 2025-10-08 — https://www.redhat.com/en/topics/security/spiffe-and-spire
[^p4-11]: Defakto Secures $30.75M Series B (Defakto blog) — Defakto — 2025-10-21 — https://www.defakto.security/blog/defakto-secures-30-75-m-series-b-to-set-a-new-standard-in-non-human-identity-security/
[^p4-12]: Our Journey Adopting SPIFFE/SPIRE at Scale (Uber Engineering blog) + SPIRE Case Studies (spiffe.io) — Uber Engineering — 2023-11-09 — https://www.uber.com/en-IE/blog/our-journey-adopting-spiffe-spire/
[^p4-13]: What is SPIFFE? Universal Workload Identity Framework Guide (Palo Alto Networks) — Palo Alto Networks — 2025 — https://www.paloaltonetworks.com/cyberpedia/what-is-spiffe
[^p4-14]: Charter for WIMSE (IETF Datatracker) — IETF — 2026-03-18 — https://datatracker.ietf.org/doc/charter-ietf-wimse/
[^p4-15]: Workload Identity in Multi System Environments (wimse) — WG About / Charter / Milestones — IETF — 2026-06 — https://datatracker.ietf.org/wg/wimse/about/
[^p4-16]: WIMSE WG documents (jeu de drafts actifs) (IETF Datatracker) — IETF — 2026 — https://datatracker.ietf.org/group/wimse/documents/
[^p4-17]: draft-ietf-wimse-workload-creds-01 (texte HTML, claims WIT) — IETF — 2026-05-05 — https://www.ietf.org/archive/id/draft-ietf-wimse-workload-creds-01.html
[^p4-18]: draft-ietf-wimse-s2s-protocol (Dead/Replaced) (IETF Datatracker) — IETF — 2025-10-16 — https://datatracker.ietf.org/doc/draft-ietf-wimse-s2s-protocol/
[^p4-19]: RFC 8693 - OAuth 2.0 Token Exchange — IETF — 2020-01 — https://datatracker.ietf.org/doc/rfc8693/
[^p4-20]: draft-ietf-oauth-transaction-tokens (datatracker) + editor's copy -latest — IETF — 2026-03-02 — https://datatracker.ietf.org/doc/draft-ietf-oauth-transaction-tokens/
[^p4-21]: draft-ietf-oauth-identity-chaining - OAuth Identity and Authorization Chaining Across Domains (datatracker) — IETF — 2026-06-04 — https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/
[^p4-22]: Cross-App Access - OAuth.net — OAuth.net (communauté IETF OAuth) — 2026 — https://oauth.net/cross-app-access/
[^p4-23]: draft-araut-oauth-transaction-tokens-for-agents-02 (individuel ; agentic_ctx + Monotonic Attenuation ; divergence intended status) — IETF Datatracker — 2026-05-22 — https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/
[^p4-24]: draft-klrc-aiagent-auth-02 - AI Agent Authentication and Authorization (individuel) — IETF Datatracker — 2026-06-01 — https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/
[^p4-25]: Decentralized Identifiers (DIDs) v1.0 (W3C Recommendation) — W3C — 2022-07-19 — https://www.w3.org/TR/did-1.0/
[^p4-26]: Decentralized Identifiers (DIDs) v1.1 (Candidate Recommendation Snapshot) — W3C — 2026-03-05 — https://www.w3.org/TR/did-1.1/
[^p4-27]: Verifiable Credentials Data Model v2.0 (W3C Recommendation) — W3C — 2025-05-15 — https://www.w3.org/TR/vc-data-model-2.0/
[^p4-28]: Verifiable Credentials Overview (famille VC 2.0) + Press release VC 2.0 — W3C — 2025-05-15 — https://www.w3.org/TR/vc-overview/
[^p4-29]: SPIFFE Overview (pas de mention WIMSE/WIT ; convergence à vérifier) — SPIFFE/CNCF — 2026 — https://spiffe.io/docs/latest/spiffe-about/overview/
[^p4-30]: OCapN and Structural Authority in Agentic AI — serefayar (Substack), source secondaire — 2026 — https://serefayar.substack.com/p/ocapn-and-structural-authority-in-agentic-ai
[^p4-31]: awesome-ocap : Object Capabilities and Capability Security (curation, références primaires Miller / E-rights) — GitHub (dckc) — 2026 — https://github.com/dckc/awesome-ocap
[^p4-32]: Macaroons: Cookies with Contextual Caveats for Decentralized Authorization in the Cloud (NDSS 2014) — Google Research / Internet Society (NDSS) — 2014 — https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/
[^p4-33]: Eclipse Biscuit (projects.eclipse.org proposal ; Incubating ; lead C. Delafargue ; Outscale + Clever Cloud) — Eclipse Foundation — 2024-07-22 — https://projects.eclipse.org/proposals/eclipse-biscuit
[^p4-34]: Specifications — Eclipse Biscuit (doc de référence ; Datalog sans négation ; null/arrays/maps depuis v3.3) — Eclipse Biscuit — 2025 — https://doc.biscuitsec.org/reference/specifications.html
[^p4-35]: biscuit SPECIFICATIONS.md (Datalog v3.3 encodé 6, append-only, Ed25519/ECDSA, sealed, protobuf) — Eclipse Biscuit (GitHub) — 2025 — https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md
[^p4-36]: Biscuit 3.3 (annonce de version d'origine ; statut « alpha » des third-party blocks à la date de l'annonce) — Biscuit (biscuitsec.org) — 2024-11-27 — https://www.biscuitsec.org/blog/biscuit-3-3/
[^p4-37]: Public key confusion in third party block (GHSA-rgqv-mwc3-c78m) — CVE-2024-42350, CVSS v3.1 = 3.0, corrigé en 5.0.0 — Eclipse Biscuit (GitHub Security Advisory) — 2024-07-31 — https://github.com/eclipse-biscuit/biscuit/security/advisories/GHSA-rgqv-mwc3-c78m
[^p4-38]: Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization (PACMPL / OOPSLA 2024) — ACM (PACMPL) — 2024 — https://dl.acm.org/doi/full/10.1145/3649835
[^p4-39]: How We Built Cedar: A Verification-Guided Approach (FSE 2024, DOI 10.1145/3663529.3663854 ; 4 bugs de soundness + 21 bugs) — ACM (FSE 2024) — 2024 — https://dl.acm.org/doi/abs/10.1145/3663529.3663854
[^p4-40]: Introducing Cedar Analysis: Open Source Tools for Verifying Authorization Policies (Symbolic Compiler ; soundness + completeness) — AWS Open Source Blog — 2025-06-16 — https://aws.amazon.com/blogs/opensource/introducing-cedar-analysis-open-source-tools-for-verifying-authorization-policies/
[^p4-41]: cedar-policy/cedar releases (cedar-policy-symcc-v0.5.1 ; tag v4.11.0) — GitHub (cedar-policy) — 2026-06-01 — https://github.com/cedar-policy/cedar/releases
[^p4-42]: Cedar Joins CNCF as a Sandbox Project (15 déc. 2025 ; trajectoire Sandbox → Incubation → Graduated) — AWS Open Source Blog — 2025-12-15 — https://aws.amazon.com/blogs/opensource/cedar-joins-cncf-as-a-sandbox-project/
[^p4-43]: Amazon Verified Permissions now supports Cedar 4.5 (opérateur « is ») — AWS (What's New) — 2025-08-21 — https://aws.amazon.com/about-aws/whats-new/2025/08/amazon-verified-permissions-cedar-4-5/
[^p4-44]: cedar-policy/cedar-for-agents (cedar-policy-mcp-schema-generator v0.6.0 ; cedar-analysis-mcp-server ; expérimental) — GitHub (cedar-policy) — 2026 — https://github.com/cedar-policy/cedar-for-agents
[^p4-45]: AIP: Agent Identity Protocol for Verifiable Delegation Across MCP and A2A (arXiv:2603.24775 ; préprint non revu, auteur unique S. Prakash) — arXiv — 2026-03-25 — https://arxiv.org/abs/2603.24775
[^p4-46]: draft-ietf-oauth-identity-chaining — OAuth Identity and Authorization Chaining Across Domains (datatracker ; états IESG, positions de ballot) — IETF — 2026-06-04 — https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/
[^p4-47]: Accelerating the Adoption of Software and AI Agent Identity and Authorization (concept paper, source primaire ; DRAFT February 2026 ; commentaires 5 fév. – 2 avr. 2026) — NIST NCCoE — 2026-02-05 — https://www.nccoe.nist.gov/sites/default/files/2026-02/accelerating-the-adoption-of-software-and-ai-agent-identity-and-authorization-concept-paper.pdf
[^p4-48]: AI Agent Standards Initiative (RFI clos 2026-03-09 ; recherche sur l'authentification et l'identité d'agent) — NIST — 2026-04-20 — https://www.nist.gov/artificial-intelligence/ai-agent-standards-initiative
[^p4-49]: OWASP Reveals Updated 2025 Top 10 Risks for LLMs, Announces New Sponsorship Program (annonce officielle ; dates 17/19 nov. 2024 ; build PDF 20241114) — OWASP GenAI Security Project — 2024-11-17 — https://genai.owasp.org/2024/11/17/owasp-reveals-2025-top-10-risks-for-llms-new-sponsorship-program/
[^p4-50]: OWASP Top 10 for LLM Applications 2025 (resource page + liste LLM01-LLM10 verbatim) — OWASP GenAI Security Project — 2024-11-17 — https://genai.owasp.org/llm-top-10/
[^p4-51]: Agentic AI - Threats and Mitigations v1.0 (T1-T15 ; 'first in a series') — OWASP GenAI Security Project / Agentic Security Initiative — 2025-02-17 — https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/
[^p4-52]: OWASP GenAI Security Project Releases Top 10 Risks and Mitigations for Agentic AI Security (>100 experts ; Expert Review Board NIST/CE/Alan Turing) — OWASP GenAI Security Project — 2025-12-09 — https://genai.owasp.org/2025/12/09/owasp-genai-security-project-releases-top-10-risks-and-mitigations-for-agentic-ai-security/
[^p4-53]: OWASP Top 10 for Agentic Application 2026 (liste ASI01-ASI10 verbatim) — Giskard — 2025-12 — https://www.giskard.ai/knowledge/owasp-top-10-for-agentic-application-2026
[^p4-54]: mitre-atlas/atlas-data CHANGELOG.md (v5.1.0 2025-11-06 ; 'Added a new tactic Lateral Movement') — MITRE — 2025-11-06 — https://raw.githubusercontent.com/mitre-atlas/atlas-data/main/CHANGELOG.md
[^p4-55]: Zenity & MITRE ATLAS Expand AI Agent Attack Coverage + MITRE ATLAS AI Security 2026 Update (vendeur, à recouper) — Zenity Labs (vendeur) — 2025-10 — https://zenity.io/blog/current-events/zenity-labs-and-mitre-atlas-collaborate-to-advances-ai-agent-security-with-the-first-release-of
[^p4-56]: MITRE ATT&CK and ATLAS Agentic Gap Analysis (draft ; 'intentionally excludes lateral movement' ; 6 catégories non couvertes) — Cloud Security Alliance — 2026-03-27 — https://labs.cloudsecurityalliance.org/agentic/csa-research-note-atlas-agentic-gap-analysis-20260327/
[^p4-57]: NIST AI 100-2 E2025 Adversarial Machine Learning (final ; DOI 10.6028/NIST.AI.100-2e2025) — NIST — 2025-03-24 — https://csrc.nist.gov/pubs/ai/100/2/e2025/final
[^p4-58]: AI Risk Management Framework (AI RMF 1.0) — NIST — 2023-01 — https://www.nist.gov/itl/ai-risk-management-framework
[^p4-59]: NIST.AI.600-1 Generative AI Profile (PDF) — NIST — 2024-07-26 — https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf
[^p4-60]: Confused Deputy Attacks on Autonomous AI Agents (research note ; cadrage autorisation/architecture) — Cloud Security Alliance (AI Safety Initiative) — 2026-03-23 — https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-confused-deputy-prompt-injection/
[^p4-61]: Understanding prompt injections: a frontier security challenge (source primaire OpenAI ; date page à vérifier) — OpenAI — 2025 — https://openai.com/index/prompt-injections/
[^p4-62]: From LLM to agentic AI: prompt injection got worse (amplification multi-agent ; 'chain splicing' — secondaire) — Christian Schneider (chercheur sécurité ; secondaire) — 2025 — https://christian-schneider.net/blog/prompt-injection-agentic-amplification/
[^p4-63]: draft-araut-oauth-transaction-tokens-for-agents-02 (individuel ; agentic_ctx + Monotonic Attenuation ; divergence intended status) — IETF Datatracker — 2026-05-22 — https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/
[^p4-64]: draft-ietf-oauth-identity-chaining - OAuth Identity and Authorization Chaining Across Domains — IETF — 2026-06-04 — https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/
[^p4-65]: Agentic AI Threat Landscape: OWASP, MITRE ATLAS & MAESTRO (agrégateur ; cross-mapping non officiel, à recouper) — Tech Jacks Solutions (agrégateur) — 2025 — https://techjacksolutions.com/ai/agentic-ai/secure/agent-threat-landscape/
[^p4-66]: MITRE ATT&CK and ATLAS Agentic Gap Analysis (draft) — Cloud Security Alliance — 2026-03-27 — https://labs.cloudsecurityalliance.org/agentic/csa-research-note-atlas-agentic-gap-analysis-20260327/

## PARTIE V — Observabilité, traçabilité et gouvernance

### Ch. 14 — Observabilité et provenance agentiques

**Insight-clé.** En date de juin 2026, l'instrumentation normalisée des systèmes agentiques **existe** mais **n'offre aucune garantie de stabilité d'API** : la totalité des conventions sémantiques OpenTelemetry GenAI demeure en statut **« Development »** (expérimental), vérification page par page, sans aucune sous-section **« Stable »** (confirmé, haut enjeu).[^p5-1][^p5-2] Ce noyau mouvant est entouré d'un socle de provenance stable mais antérieur à l'ère agentique (W3C PROV-DM, Recommandation inchangée depuis le 30 avril 2013), d'un standard de lignage gradué et activement versionné (OpenLineage v1.48.0, 2026-06-03), d'un standard de provenance de contenu (C2PA v2.4, avril 2026) et d'un cadre réglementaire de marquage machine (art. 50 du Règlement (UE) 2024/1689, applicable le 2 août 2026). La conséquence architecturale est nette : toute pile d'interopérabilité doit traiter l'observabilité agentique comme un **opt-in** explicite et versionné, jamais comme un acquis implicite.

**Ancrage théorique (cf. Ch. 5, Ch. 6).** Cet appareil n'est pas un instrument de confort opérationnel : c'est le support de réfutabilité du cadre. La trace observable est le substrat sur lequel les invariants I1 (Hypothèse)–I5 (Hypothèse) sont énoncés et vérifiés — sans trace, leur condition de réfutation n'a pas de référent. La dimension D‑Invariant de l'opérateur τ (cf. Ch. 5) lit précisément **l'état des invariants sur la trace** ; elle présuppose donc une trace fidèle, attribuée et non répudiable. Symétriquement, la provenance est une **condition de falsifiabilité** (cf. CLAUDE.md §4) : pour qu'un énoncé du CIA (cf. Ch. 6) sur l'héritage de garanties soit réfutable, il faut pouvoir reconstruire la chaîne causale prompt → décision → invocation qui l'a produit. L'enjeu de ce chapitre est donc de confronter ce que les standards de juin 2026 permettent réellement d'attester à ce que la falsifiabilité du cadre exige.

#### 14.1 OpenTelemetry GenAI : un corpus entièrement expérimental

**L'instrumentation agentique d'OpenTelemetry couvre déjà spans d'agent, exécution d'outils et MCP, mais chaque sous-section porte le badge « Development » — aucune n'est « Stable » (confirmé, haut enjeu).**[^p5-3] La version-parapluie courante des Semantic Conventions est v1.41.1, publiée le 2026-05-11 (`published_at` 2026-05-11T22:28:25Z) ; ce patch exclut deux métriques k8s de la génération de code (#3711) et **ne contient aucun changement GenAI** — la dernière version porteuse d'ajouts GenAI est v1.41.0 (2026-04-28).[^p5-4][^p5-5]

La discipline de transition est explicite et doit être reprise telle quelle par toute architecture : le **baseline** de stabilité des conventions GenAI est v1.36.0 (2025-07-05) ; les instrumentations existantes **« SHOULD NOT change the version of the GenAI conventions that they emit by default »**, et l'adhésion à la dernière version expérimentale passe par la variable d'environnement `OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental` (confirmé). C'est ici que l'**opt-in** versionné prend une forme concrète :

```yaml
# Adhésion EXPLICITE aux conventions GenAI expérimentales (statut Development).
# Sans cet opt-in, l'instrumentation émet le baseline v1.36.0 (2025-07-05) et NE DOIT PAS
# changer de version par défaut. À versionner et à consigner dans l'ADR d'observabilité.
env:
  OTEL_SEMCONV_STABILITY_OPT_IN: "gen_ai_latest_experimental"   # API NON garantie stable
```

Un dépôt dédié `open-telemetry/semantic-conventions-genai` existe (gestion des dépendances via **Weaver** ; spans / métriques / événements clients GenAI, MCP, conventions fournisseurs), mais la page indique explicitement **« No releases published »** (confirmé).[^p5-6] Nuance à conserver, et non à lisser : la ligne README de ce dépôt énumère **« OpenAI, etc. »** et **ne nomme pas** Anthropic / Azure / Bedrock, lesquels figurent en revanche sur le hub `gen-ai/`.[^p5-7]

Le contenu instrumental (toujours en statut **Development**) couvre quatre couches utiles à l'attribution agentique :

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

- **Spans agent / framework** : opérations `create_agent`, `invoke_agent`, `invoke_workflow`, `execute_tool`. `invoke_agent` distingue une variante **Client Span** (invocation d'agent sur service distant — p. ex. OpenAI Assistants API, AWS Bedrock Agents) d'une variante **Internal Span** (même processus — p. ex. LangChain, CrewAI), avec les attributs `gen_ai.agent.{id,name,version,description}`. Cette distinction est exploitable directement pour situer l'autorité dans une chaîne de délégation (cf. D‑Autorité, Ch. 5).
- **Métriques** : 7 instruments, tous de type Histogram — côté client `gen_ai.client.token.usage`, `gen_ai.client.operation.duration`, `gen_ai.client.operation.time_to_first_chunk`, `gen_ai.client.operation.time_per_output_chunk` ; côté serveur `gen_ai.server.request.duration`, `gen_ai.server.time_per_output_token`, `gen_ai.server.time_to_first_token`. Les deux instruments `time_to_first_chunk` / `time_per_output_chunk` ont été ajoutés en v1.41.0 (2026-04-28).[^p5-8]
- **MCP** : spans client et serveur dont le **nom effectif** est `{mcp.method.name} {target}` (p. ex. `tools/call get-weather`), avec repli `{mcp.method.name}` ; `mcp.method.name` est **Required** ; autres attributs `mcp.session.id`, `mcp.protocol.version`, `mcp.resource.uri`, `gen_ai.tool.name`. Alignement sur la spécification _MCP_ 2025-06-18. Divergence à signaler explicitement : `span.mcp.client` / `span.mcp.server` sont des **identifiants de registre**, non le **span name** littéral.[^p5-9]
- **Conventions fournisseurs** (hub GenAI) : Anthropic, Azure AI Inference, AWS Bedrock, OpenAI.

**Divergence résolue (à ne pas reconduire).** Le claim initial du dossier postulait un écart persistant entre le **changelog** (agrégation introduite en v1.37.0, 2025-08-25, **« GenAI chat history revamp »**) et la documentation rendue (événements **per-message** encore affichés). Vérification : cet écart **n'existe plus** en juin 2026. La page docs **« Generative AI events »** ne montre plus d'événements **per-message** ; elle expose désormais deux événements agrégés — `gen_ai.client.inference.operation.details` et `gen_ai.evaluation.result` — portant `gen_ai.input.messages`, `gen_ai.output.messages` et `gen_ai.system_instructions` (confirmé). La transition d'attributs reste néanmoins en statut **Development**.[^p5-10]

L'`gen_ai.client.inference.operation.details` est le candidat le plus direct comme support de **décision attestée** : il transporte, dans un événement unique et corrélé au span, les messages d'entrée, de sortie et les instructions système qui ont conditionné une décision de l'opérateur τ. C'est, en l'état (expérimental), le maillon OTel le plus proche d'une trace réfutable au sens du Ch. 6.

#### 14.2 Provenance : W3C PROV stable mais antérieur, PROV-AGENT en recherche

**La provenance dispose d'un standard stable et figé — W3C PROV-DM — mais antérieur à l'ère agentique ; l'extension native vers l'agentique (PROV-AGENT) reste au stade recherche, non normalisée.** W3C PROV-DM est une Recommandation datée du 30 avril 2013 (en-tête : **« W3C Recommendation 30 April 2013 »**), avec trois types cœur — Entity, Activity, Agent — et **aucune révision ni v2** postérieure (confirmé, haut enjeu).[^p5-11] La famille comprend des Recommandations (PROV-DM ; PROV-O, ontologie OWL2/RDF ; PROV-N ; PROV-CONSTRAINTS) et des Notes (PROV-OVERVIEW, PROV-PRIMER), toutes datées du 30 avril 2013.[^p5-12][^p5-13]

La stabilité de PROV est ici un atout **et** une limite. Atout : le triplet Entity / Activity / Agent se projette sans friction sur une chaîne de délégation agentique — une décision est une **Activity**, l'agent appelant et l'agent cible sont des **Agent**, le prompt et la réponse des **Entity**, et la relation `wasGeneratedBy` / `wasAssociatedWith` reconstruit la causalité dont la falsifiabilité du CIA a besoin (cf. Ch. 6). Limite : PROV ignore, par construction (2013), la sémantique propre du régime probabiliste — prompts, instructions système, scores, **finish reasons**, **drift** — qui sont précisément ce que l'opérateur τ arbitre (cf. Ch. 5). La projection est donc structurellement correcte mais sémantiquement appauvrie tant qu'aucune extension normalisée ne comble l'écart.

C'est l'objet de PROV-AGENT, qui reste **au stade recherche** : arXiv 2508.02866 (soumis le 2025-08-04 ; présenté à l'IEEE 21st International Conference on e-Science 2025, Chicago) étend PROV pour capturer prompts, réponses, décisions et invocations de modèles d'agents, en s'intégrant à _MCP_ (confirmé qu'il s'agit d'un travail de recherche).[^p5-14] **À vérifier** : la présence dans les actes publiés IEEE e-Science 2025 (DOI Xplore) au-delà de la préimpression arXiv. Conséquence pour l'architecte : en juin 2026, la **décision attestée** native agentique relève encore d'un patron à construire (projection PROV maison + corrélation OTel), non d'un standard à consommer.

#### 14.3 Lignage : OpenLineage, gradué et activement versionné

**Pour les dépendances de données — distinctes des traces de services — OpenLineage est mature, gradué et activement versionné ; il est complémentaire d'OpenTelemetry, pas convergent.** OpenLineage en est à la version 1.48.0, publiée le 2026-06-03 (`published_at` 2026-06-03T09:19:08Z, confirmé via l'API GitHub `releases/latest`) ; spécification OpenAPI extensible par facettes (job / run / dataset) (confirmé, haut enjeu).[^p5-15] C'est un projet de stade **Graduation** de la LF AI & Data Foundation — verbatim : **« OpenLineage is a graduation-stage project of the LF AI & Data Foundation. Contributed by: Datakin in May 2021 as an incubation-stage project and graduated in July 2023 »** ; Marquez est l'implémentation de référence (confirmé, haut enjeu).[^p5-16]

La complémentarité est le point structurant, et il ne faut pas la convertir en convergence : OpenLineage est une API de collecte de **lignage** (dépendances entre datasets et pipelines, **« équivalent des traces pour les données »**), distincte des traces de services d'OpenTelemetry. OpenLineage revendique s'être inspiré de l'architecture d'OpenTelemetry (**probable** — sources d'origine 2023, relation toujours valable en 2026 mais non re-datée).[^p5-17] Pour une architecture agentique, les deux piles répondent à deux questions causales différentes : **quelles décisions et invocations** ont eu lieu (OTel) versus **quelles données** ont alimenté et résulté de ces décisions (OpenLineage). La reconstruction complète d'une chaîne réfutable suppose de corréler les deux — c'est un travail d'intégration, non un standard unifié disponible.

**Adoption éditeur (IBM watsonx), modèle producteur-consommateur (probable, haut enjeu).** `watsonx.data` et `watsonx.data integration` **génèrent** des événements OpenLineage à l'exécution ; `watsonx.data intelligence` les **consomme et les exporte** au format OpenLineage.[^p5-18] Réserves explicites à conserver : il existe une série de ≥ 3 annonces IBM connexes ; la date exacte du communiqué cible (initialement 2026-03-02) n'a pu être re-confirmée par fetch direct (HTTP 403 sur ibm.com) — gardée en **à vérifier** ; la mention d'adoption parallèle Snowflake / Collibra / Atlan **n'a pas été re-vérifiée** sur source primaire.

#### 14.4 Provenance de contenu et marquage réglementaire

**La provenance bascule ici du registre technique au registre juridique : C2PA fournit le mécanisme cryptographique, l'article 50 de l'AI Act en fait une obligation datée — mais l'échéance elle-même est mouvante.** C2PA v2.4 (Content Credentials) est datée **« April 2026 »** selon l'historique de versions de la spécification (section 5.3.1 : **« 2.4 - April 2026 »**, nouveaux formats d'actifs, assertions, sérialisation JSON) ; versions antérieures 2.2 (2025-05-01) et 2.1 (2024-09-20) (confirmé, haut enjeu).[^p5-19] C2PA crée un **manifest** signé cryptographiquement portant des assertions de provenance (capture, édition, **ingredients**, divulgation IA, horodatage, hachages). Réserve : la page d'index ne porte pas de dates ; la datation provient du corps du document. **À vérifier** : la date exacte de C2PA 2.3 (entre 2.2 et 2.4).

Côté réglementation, l'article 50 du Règlement (UE) 2024/1689 devient applicable le 2 août 2026 (renvoi art. 113) ; l'art. 50(2) impose que les sorties d'IA générative soient **« marked in a machine-readable format and detectable as artificially generated or manipulated »** (confirmé, haut enjeu).[^p5-20] **Précision Omnibus (probable, divergence conservée).** L'accord politique **« AI Omnibus »** Conseil / Parlement est daté du 7 mai 2026 ; il accorde un délai de grâce de **quatre mois** — compromis de trilogue entre les 6 mois proposés par la Commission et les 3 mois du Parlement —, portant l'échéance de l'art. 50(2) au 2 décembre 2026 **uniquement** pour les systèmes d'IA générative déjà sur le marché avant le 2 août 2026 ; les systèmes mis sur le marché après le 2 août 2026 se conforment dès le premier jour, et les obligations art. 50(1)(3)(4) **ne bénéficient d'aucun report**.[^p5-21][^p5-22][^p5-23] Accord **provisoire / politique** — texte définitif à confirmer au Journal officiel.

Cette assertion de divulgation IA est, conceptuellement, le pendant **sortant** de la décision attestée : là où OTel + PROV reconstruisent la causalité **en amont** d'une sortie, le **manifest** C2PA appose **en aval** une attestation signée et détectable par machine. Pour une chaîne agentique soumise à l'art. 50, la frontière de l'opérateur τ (sortie Decision ∈ {Déterministe, Probabiliste, Refus}, cf. Ch. 5) gagne ainsi un sous-produit réglementaire : toute sortie produite en régime probabiliste doit pouvoir porter un marquage machine, ce qui en fait un invariant de conformité à instrumenter, non une option.

#### Tableau 14-A — Standards d'observabilité / provenance agentique (juin 2026)


***Tableau — Standards d'observabilité et de provenance pour l'entreprise agentique, statut au 2026-06-08.***

| **Standard** | **Version / date** | **Maturité** | **Rôle** | **Couverture agentique** | **Confiance** |
| --- | --- | --- | --- | --- | --- |
| OTel Semantic Conventions (parapluie) | v1.41.1 — 2026-05-11 | Stable (corpus), mais GenAI = Development | Traces / métriques / logs | Spans agent, MCP, fournisseurs (tous expérimentaux) | confirmé |
| OTel GenAI (toutes sous-sections) | Development | Expérimental (aucune « Stable ») | Instrumentation LLM / agent | create / invoke_agent, execute_tool, MCP | confirmé |
| W3C PROV-DM | Rec. 30 avr. 2013 | Stable, figé (pas de v2) | Provenance (Entity / Activity / Agent) | Générique, non agentique | confirmé |
| PROV-AGENT | arXiv 2508.02866 — 2025-08-04 | Recherche (non normalisé) | Provenance agent (prompts / décisions) | Native agentique + MCP | confirmé (= recherche) |
| OpenLineage | v1.48.0 — 2026-06-03 | Graduation (LF AI & Data) | Lignage données / pipelines | Complémentaire d'OTel | confirmé |
| C2PA | v2.4 — avril 2026 | Versionné activement | Provenance de contenu (manifest signé) | Marquage sorties IA | confirmé |
| Art. 50 UE 2024/1689 | Applicable 2 août 2026 | En vigueur (échelonné) | Marquage machine obligatoire | Sorties d'IA générative | confirmé (Omnibus : probable) |



#### Tableau 14-B — OpenTelemetry (GenAI) vs OpenLineage


***Tableau — OpenTelemetry GenAI et OpenLineage : complémentarité, non convergence.***

| **Dimension** | **OpenTelemetry (GenAI)** | **OpenLineage** |
| --- | --- | --- |
| Objet observé | Traces / spans / métriques de services et d'agents | Lignage : dépendances datasets ↔ pipelines |
| Analogie | Traces de services | « Traces pour les données » |
| Maturité (juin 2026) | GenAI = Development | Graduation (LF AI & Data) |
| Versionnement | v1.41.1 (2026-05-11) ; dépôt GenAI dédié sans release | v1.48.0 (2026-06-03) |
| Relation mutuelle | Source d'inspiration revendiquée par OpenLineage | Complémentaire, **pas convergent** |



#### Synthèse — la trace comme support de réfutabilité

Trois conclusions architecturales se dégagent, toutes subordonnées au statut mouvant des standards. Premièrement, l'instrumentation agentique normalisée **existe** (spans agent, `execute_tool`, MCP, événements agrégés) mais **n'offre aucune garantie de stabilité d'API** : l'adoption est un **opt-in** versionné (`OTEL_SEMCONV_STABILITY_OPT_IN`) qui doit être consigné, faute de quoi la trace — donc le référent de I1 (Hypothèse)–I5 (Hypothèse) — devient elle-même instable. Deuxièmement, la **décision attestée** native agentique n'est pas, en juin 2026, un standard à consommer : elle se construit par corrélation OTel (`gen_ai.client.inference.operation.details`) + projection PROV (Entity / Activity / Agent), PROV-AGENT n'étant encore que recherche. Troisièmement, lignage (OpenLineage), provenance de contenu (C2PA) et marquage réglementaire (art. 50) ajoutent des couches **complémentaires** dont aucune ne subsume les autres ; la falsifiabilité du CIA (cf. Ch. 6) exige leur intégration, que les standards de juin 2026 laissent à la charge de l'architecte.

#### Questions ouvertes

Les incertitudes ci-dessous sont **à vérifier en relance** et ne doivent pas être présentées comme résolues.

- **Communiqué IBM watsonx / OpenLineage** — date de publication exacte (hypothèse 2026-03-02 ; page en HTTP 403 au fetch). Piste : cache / Wayback ou date affichée sur ibm.com/new.
- **Règlement Omnibus** — le texte définitif est-il publié au Journal officiel de l'UE, et la date du 2 décembre 2026 assortie de la restriction **legacy** y est-elle consacrée ? Tant que la publication n'a pas lieu, l'échéance du 2 août 2026 demeure juridiquement la référence. Piste : EUR-Lex (règlement modificatif).
- **Lignes directrices Commission art. 50** — ont-elles atteint leur version finale vers juin 2026, et imposent-elles C2PA comme standard de marquage ou restent-elles neutres ? Piste : projet de mai 2026.
- **PROV-AGENT** — figure-t-il dans les actes IEEE e-Science 2025 (DOI Xplore) au-delà de la préimpression arXiv ? Piste : IEEE Xplore.
- **Stabilisation GenAI OTel** — une sous-section est-elle planifiée **« Stable »** avant fin 2026, et le dépôt `semantic-conventions-genai` produira-t-il sa première release ? Piste : **milestones** GitHub + SIG GenAI Observability.
- **C2PA 2.3** — date exacte entre 2.2 (2025-05-01) et 2.4 (avril 2026). Piste : **version history** de la spécification 2.3.



### Ch. 15 — Gouvernance et conformité réglementaire

**Insight-clé.** Un agent _LLM_ déployé en services financiers tombe simultanément sous deux familles d'obligations dont la maturité est asymétrique : un socle de résilience opérationnelle **ferme et exécutoire** d'un côté, un régime produit-IA **échelonné et mouvant** de l'autre. La thèse de ce chapitre est que cette conformité n'exige pas un appareil neuf : chaque obligation se **mappe** sur un mécanisme déjà construit dans les Parties I-II — identité et autorité de l'appelant (cf. Ch. 3-4), trace de provenance _PROV_, et la branche _Refus_ de opérateur τ (cf. Ch. 5). Le point dur n'est donc pas technique mais qualificatif : **aucun texte primaire en date de juin 2026 ne définit l'« agent autonome » ni l'« agentique »** ; la qualification d'un agent comme système d'IA haut risque (UE), comme actif TIC (DORA), comme « modèle » (BSIF E-23) ou comme « système d'IA » (AMF) procède **par analogie**. C'est l'unique zone d'incertitude réglementaire structurante pour l'interopérabilité agentique, et elle est consignée comme telle (hypothèse, à surveiller).[^p5-24]

L'organisation suit la géographie réglementaire pertinente pour l'auteur : Union européenne (AI Act + Digital Omnibus, DORA), puis Canada (BSIF E-23, AMF, vide fédéral horizontal). La section terminale convertit l'ensemble en une matrice obligation `arrow.r` mécanisme et recense les incertitudes ouvertes.

#### 15.1 EU AI Act : référence, paliers, asymétrie avec DORA

L'AI Act s'applique **par paliers** (art. 113) et DORA est **déjà pleinement en vigueur** — cette asymétrie de maturité, et non le contenu de chaque texte pris isolément, dicte l'ordre de priorité d'un programme de conformité agentique.

L'AI Act porte la référence **Règlement (UE) 2024/1689** (confirmé), entré en vigueur le 1^er^ août 2024, application générale au **2 août 2026** (art. 113).[^p5-25] Les paliers confirmés de l'art. 113 :

- **2 février 2025** — Chap. I-II : dispositions générales, pratiques interdites (art. 5), littératie IA (art. 4).
- **2 août 2025** — Chap. III §4, Chap. V (_GPAI_), Chap. VII (gouvernance), Chap. XII, art. 78, **sauf art. 101** ; pénalités.
- **2 août 2026** — application générale, majorité des obligations haut risque de l'Annexe III.
- **2 août 2027** — art. 6(1) et obligations correspondantes (haut risque intégré aux produits, Annexe I).

Les pratiques interdites et la littératie sont applicables depuis le 2 février 2025 ; la sanction des pratiques interdites (art. 99(3)) atteint **35 M EUR ou 7 % du chiffre d'affaires mondial annuel total**, le montant le plus élevé étant retenu (confirmé).[^p5-26] Les obligations _GPAI_ et de gouvernance s'appliquent depuis le 2 août 2025 (sauf art. 101) ; les modèles _GPAI_ antérieurs bénéficient d'une grâce jusqu'au 2 août 2027 (confirmé).

Le seuil de risque systémique _GPAI_ est une présomption **réfutable** de capacités à fort impact (art. 51(2)) lorsque le calcul cumulé d'entraînement **dépasse `10^(25)` _FLOP_** (confirmé) ; l'estimation de « ~5-15 fournisseurs mondiaux » concernés reste un ordre de grandeur secondaire, indicatif (à vérifier).[^p5-27] Le **Code de bonnes pratiques _GPAI_** a été publié le **10 juillet 2025** en trois chapitres (Transparence, Droit d'auteur, Sûreté et Sécurité) ; les deux premiers visent tous les fournisseurs _GPAI_, le troisième les seuls modèles à risque systémique. La Commission et l'_AI Board_ l'ont jugé « outil volontaire adéquat » (confirmé).[^p5-28]

#### 15.2 Le « Digital Omnibus on AI » : reports et statut juridique

**Point juridique critique.** Tant que l'Omnibus n'est pas publié au Journal officiel, **les dates originales (2 août 2026 / 2 août 2027) demeurent juridiquement en vigueur** — un programme de conformité prudent doit donc viser ces dates et traiter les reports comme un sursis non acquis.

Chronologie (statut indiqué texte par texte) : proposition de la Commission le **19 novembre 2025** (probable) ; **accord politique provisoire le 7 mai 2026** en trilogue Parlement/Conseil, confirmé par le Parlement, le Conseil (Consilium) et la Commission.[^p5-29][^p5-30] **Divergence conservée** : certaines sources secondaires datent les négociations finales du 6 mai 2026 (séance nocturne aboutissant vers 4 h 30 le 7 mai) ; les sources institutionnelles primaires retiennent le **7 mai 2026**.

Contenu de l'accord (confirmé sauf indication) : l'**Annexe III (haut risque autonome) est reportée au 2 décembre 2027** — dates **fixes**, et non le mécanisme conditionnel « _stop-the-clock_ » initialement proposé ; l'**Annexe I (haut risque intégré aux produits) est reportée au 2 août 2028**, l'accord résolvant aussi le différend sur l'évaluation de conformité Annexe I. Le marquage (art. 50) pour les systèmes mis sur le marché avant le 2 août 2026 bascule au **2 décembre 2026** (au lieu du 2 février 2027) ; les systèmes postérieurs y sont soumis dès la mise sur le marché (probable). De nouvelles interdictions (art. 5 : _nudifiers_ + CSAM) prennent effet le **2 décembre 2026**.[^p5-31][^p5-32]

**Statut juridique (probable)** : accord politique provisoire **non publié au JO** ; adoption formelle visée avant le 2 août 2026 ; publication attendue d'ici juillet 2026 ; **les dates originales restent en vigueur d'ici là**. À vérifier : la date de confirmation COREPER, parfois citée au 13 mai 2026, n'est pas confirmée sur source primaire.


***Tableau — Calendrier d'application de l'AI Act — original vs Omnibus (UE).***

| **Obligation** | **Date originale (2024/1689)** | **Date sous Omnibus (accord 7 mai 2026)** | **Statut juridique juin 2026** | **Confiance** |
| --- | --- | --- | --- | --- |
| Interdictions (art. 5) + littératie (art. 4) | 2 fév. 2025 | inchangé | En vigueur | confirmé |
| _GPAI_ + gouvernance (sauf art. 101) | 2 août 2025 | inchangé | En vigueur | confirmé |
| Marquage art. 50 (systèmes _legacy_) | ≈ 2 fév. 2027 | **2 déc. 2026** | Dates originales prévalent (non publié JO) | probable |
| Nouvelles interdictions (_nudifiers_, CSAM) | — | **2 déc. 2026** | Sous réserve de publication | confirmé |
| Haut risque Annexe III (autonome) | **2 août 2026** | **2 déc. 2027** (dates fixes) | **2 août 2026 reste en vigueur** | confirmé |
| Haut risque Annexe I (produits) | **2 août 2027** | **2 août 2028** | **2 août 2027 reste en vigueur** | confirmé |



#### 15.3 Ancrage agentique côté AI Act : sanctions, Annexe III finance, supervision humaine

L'AI Act mord directement sur les agents financiers par deux entrées de l'Annexe III et par l'art. 14, ce dernier **bornant la délégation** d'un agent multi-étapes.

La structure des sanctions (art. 99, confirmé) gradue trois plafonds, le plus élevé étant retenu : **35 M / 7 %** (pratique interdite) ; **15 M / 3 %** (haut risque et autres obligations) ; **7,5 M / 1 %** (information incorrecte ou trompeuse) ; des plafonds réduits (le plus **faible**) s'appliquent aux PME et jeunes pousses. L'**Annexe III finance** (confirmé) classe à haut risque l'évaluation de **solvabilité / score de crédit** des personnes physiques (sauf détection de fraude) et la **tarification de l'assurance vie/santé** — ancrage direct de l'AI Act pour les systèmes agentiques en services financiers.

L'**art. 14(1)** impose une **supervision humaine effective** pour les systèmes haut risque : exigence structurante qui borne l'autonomie déléguée et impose un point de contrôle humain.[^p5-33] C'est ici que le couplage avec le canon est le plus net : l'art. 14 ne demande pas d'inhiber l'agent mais d'instrumenter un **point de bascule** vers l'humain. La branche _Refus_ de Decision ∈ {Déterministe, Probabiliste, Refus} (cf. Ch. 5) en est la réalisation mécanique — opérateur τ déplace _t_fix</sub>(g) vers un régime non probabiliste lorsque D‑Autorité ou D‑Invariant l'imposent, l'issue _Refus_ matérialisant le « _human-in-the-loop_ » exigé par l'art. 14 sans recoder une logique de contrôle ad hoc. L'**art. 6(3)** ménage une exemption haut risque sous conditions cumulatives (tâche procédurale étroite ; amélioration d'un résultat humain ; détection d'écarts sans remplacer l'évaluation humaine ; tâche préparatoire), assortie de documentation et d'enregistrement (art. 49(2)).[^p5-34]

#### 15.4 DORA : socle ferme et législation déléguée

DORA est le **socle exécutoire** : un agent et toutes ses dépendances (modèle, API, _cloud_) y sont des actifs ou services TIC à inscrire, tester et encadrer contractuellement — sans grâce ni report.

**DORA = Règlement (UE) 2022/2554 du 14 décembre 2022, applicable depuis le 17 janvier 2025** (art. 64) — date ferme et exécutoire (confirmé).[^p5-35] Ses **cinq piliers** (confirmé) : (1) gestion du risque TIC (art. 5-16) ; (2) gestion et signalement des incidents (art. 17-23) ; (3) tests de résilience (art. 24-27) ; (4) risque lié aux tiers TIC (art. 28-44) ; (5) partage d'informations (art. 45).[^p5-36]

La législation déléguée de niveau 2 pertinente pour les chaînes agentiques (toutes confirmées) :

- **Registre d'information** — Règlement d'exécution (UE) **2024/2956** du 29 nov. 2024 (ITS, art. 28(3)) ; JO du 2 déc. 2024 ; en vigueur le 22 déc. 2024 ; modèles normalisés et information sur les **sous-traitants de fonctions critiques**. Première soumission aux NCA **au plus tard le 30 avril 2025**. **Divergence confirmée** sur les dates intermédiaires (CSSF Luxembourg : référence au 31 mars, fenêtre 1-15 avril, transmission aux ESAs le 30 avril 2025).[^p5-37]
- **RTS TLPT** (tests d'intrusion fondés sur la menace, art. 26) — Règlement délégué (UE) **2025/1190** du 13 fév. 2025 ; JO du 18 juin 2025 ; **applicable depuis le 8 juillet 2025** ; alignement TIBER-EU (détail à vérifier).[^p5-38]
- **RTS sous-traitance** (art. 30(5)) — Règlement délégué (UE) **2025/532** du 24 mars 2025 ; JO du 2 juillet 2025 ; **en vigueur le 22 juillet 2025**.[^p5-39] **Probable** : la suppression de l'Article 5 / Recital 5 du projet (suivi continu de la chaîne de sous-traitants), rapportée comme « retrait partiel » par des cabinets, **n'est pas vérifiée ligne à ligne contre le JO** ; piste — comparer le projet JC 2024-53 et le texte final 2025/532.[^p5-40]

Le registre d'information est l'obligation DORA la plus directement opérationnalisable pour une chaîne agentique : il **exige** une énumération exhaustive et structurée des dépendances TIC, ce qui présuppose l'identité stable de chaque agent et de chaque service tiers (cf. Ch. 3-4). Le fragment ci-dessous illustre une entrée de registre alignée sur la logique de l'ITS 2024/2956 — modèle _LLM_ traité comme service TIC sous-traité d'une fonction critique ; il s'agit d'une **transposition illustrative**, non d'un extrait normatif des modèles XBRL officiels (à vérifier mot pour mot contre l'ITS) :

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

#### 15.5 Double conformité agentique (hypothèse)

Pour un agent _LLM_ déployé en services financiers de l'UE, les deux régimes **se cumulent** — c'est une hypothèse de l'auteur, non un fait établi, mais elle commande de ne pas traiter conformité produit-IA et résilience TIC en silos.

(a) **AI Act** — qualification haut risque possible (Annexe III : crédit, assurance) déclenchant gestion des risques, gouvernance des données, journalisation et **supervision humaine** (art. 14). (b) **DORA** — l'agent et ses dépendances (modèle, API, _cloud_) sont des actifs/services TIC à **inscrire au registre** (2024/2956), **tester** (TLPT, 2025/1190) et **encadrer contractuellement** (sous-traitance, 2025/532). **Hypothèse** : aucun texte primaire de juin 2026 ne définit « agent autonome » ou « agentique » ; la qualification procède **par analogie**, d'où une zone d'incertitude réglementaire à surveiller.


***Tableau — DORA vs AI Act — deux régimes cumulatifs, maturité asymétrique (UE).***

| **Dimension** | **DORA (2022/2554)** | **AI Act (2024/1689)** |
| --- | --- | --- |
| Nature | Résilience opérationnelle TIC, secteur financier | Régulation horizontale produit, risque IA |
| Maturité juin 2026 | **Ferme, applicable depuis 17 janv. 2025** | **Échelonné + Omnibus non publié** |
| Niveau 2 clé | Reg. 2024/2956, 2025/1190, 2025/532 | Code _GPAI_ (10 juil. 2025) ; normes harmonisées attendues |
| Ancrage agentique | Agent = actif/service TIC (registre, TLPT, sous-traitance) | Agent = système d'IA (Annexe III ; art. 14) |
| Sanctions | Régime DORA propre | 35 M/7 % ; 15 M/3 % ; 7,5 M/1 % |
| Définition « agentique » | Absente (analogie) | Absente (analogie) — **hypothèse** |



#### 15.6 Canada — BSIF, ligne directrice E-23 (risque de modélisation)

**Insight-clé.** En date de juin 2026, la conformité de l'IA en services financiers canadiens repose sur des **lignes directrices sectorielles (droit souple prudentiel)** et **non sur une loi fédérale horizontale** ; l'IA agentique y est déjà saisie — par le risque de modélisation — **avant toute loi horizontale**.

La **version finale d'E-23 a été publiée le 11 septembre 2025**, pour une **entrée en vigueur le 1^er^ mai 2027** (mise en œuvre d'environ 20 mois) (confirmé, haut enjeu).[^p5-41] Le périmètre couvre les institutions financières fédérales réglementées (IFFR) — banques, succursales de banques étrangères, assureurs vie et fraternelles, assureurs IARD, sociétés de fiducie et de prêt ; les **régimes de retraite fédéraux ont été reconsidérés et EXCLUS** de la version finale (confirmé). L'IA/AA est **incluse textuellement** dans la définition de « modèle » (« …including AI/ML methods… ») et le cadre MRM **couvre les modèles tiers/fournisseurs** (confirmé).

La lettre d'accompagnement pose une **neutralité algorithmique** (confirmé), citée textuellement : « the outcomes and principles provided in the guideline do not vary based on the algorithmic approach to modeling », tout en reconnaissant des **défis de gouvernance** propres aux modèles « boîte noire », aux données d'entraînement externes dynamiques et aux techniques propriétaires.[^p5-42] **Précision / divergence** : la qualification selon laquelle l'IA/AA « exacerbe les risques » provient d'une **glose secondaire (Torys)**, **non d'une citation primaire** — la lettre du BSIF cadre ces enjeux comme des **défis de gouvernance**, pas une « exacerbation » nommée.[^p5-43]

#### 15.7 Canada — AMF (Québec) : LD sur l'IA et LD risque lié aux tiers

L'AMF fournit l'ancrage agentique le plus **personnalisé** du paysage : l'**imputabilité individuelle d'un dirigeant** pour l'ensemble des systèmes d'IA — un point de contrôle nommé que la trace technique doit pouvoir alimenter.

La **LD AMF sur l'utilisation de l'IA, version finale, a été publiée le 7 avril 2026** (consultation à l'automne 2025), pour une **entrée en vigueur le 1^er^ mai 2027** ; elle s'applique aux assureurs autorisés, coopératives de services financiers, sociétés de fiducie autorisées et institutions de dépôt autorisées encadrées par l'AMF (confirmé).[^p5-44] Exigences (confirmé) : le **conseil d'administration** veille à une culture d'utilisation responsable ; la **haute direction** assure la gouvernance et le contrôle des risques des systèmes d'IA (SIA) ; **un membre de la haute direction est imputable de l'ensemble des SIA**.[^p5-45] **Probable / à confirmer mot pour mot** : la mention d'un « registre/inventaire centralisé des SIA + cote de risque par système » provient de la couverture du **projet** (NRF, automne 2025) ; la page AMF retourne un code 403 à la récolte automatisée — formulation à confirmer dans le PDF final.[^p5-46]

La **LD AMF distincte sur le risque lié aux tiers** entre en vigueur le **1^er^ avril 2027** (consultation du 9 oct. au 19 déc. 2025) ; elle met à jour et remplace la LD impartition de 2009 et exige un registre centralisé des ententes avec les tiers. **À ne pas confondre** avec la LD IA (effet 1^er^ mai 2027) (confirmé).[^p5-47]

#### 15.8 Canada — fédéral : AIDA mort-née, « AI for All », vide horizontal

Côté fédéral, il n'existe **aucune loi-cadre horizontale sur l'IA en date de juin 2026** ; la conformité agentique s'arrime exclusivement au droit prudentiel sectoriel des §§ 15.6-15.7.

Le **projet de loi C-27 (contenant AIDA) est mort au Feuilleton** à la prorogation (44^e^ législature, 1^re^ session, close le 6 janvier 2025) ; son stade maximal fut l'**étude en comité INDU (non complétée)**, sans rapport ni 3^e^ lecture, la dernière réunion INDU enregistrée datant du 26 septembre 2024 (confirmé).[^p5-48] **Précision** : LEGISinfo classe C-27 en « information historique » et **n'emploie pas littéralement « mort au Feuilleton »**, la mécanique de prorogation étant néanmoins confirmée par les sources juridiques.[^p5-49] Le ministre **Solomon** a indiqué (mi-2025) qu'**AIDA ne sera pas réintroduite telle quelle**, IA et vie privée étant désormais traitées **séparément** (confirmé pour le principe).[^p5-50]

La stratégie **« AI for All » a été lancée le 4 juin 2026 (Toronto)** par le PM Carney (avec Solomon, Joly, Hajdu) — plan quinquennal économique **non contraignant** promettant une modernisation législative **sans nommer de projet de loi IA horizontal ni fixer d'échéancier IA précis** (confirmé, haut enjeu).[^p5-51] Cibles (confirmé, à citer comme cibles, non comme réalisations) : environ **200 G$ de croissance**, **250 000 emplois** sur cinq ans, adoption de l'IA passant de **12 % à 60 % d'ici 2034**. **Au 8 juin 2026, aucun projet de loi fédéral horizontal sur l'IA n'a été déposé** ; le Canada s'appuie dans l'intervalle sur un code de conduite volontaire (IA générative) — affirmation de négatif, **probable**, fondée sur la convergence de sources secondaires (Osler/BLG/CCPA) sans registre primaire unique.[^p5-52]

#### 15.9 Implication pour l'argument agentique (Canada)

Une **triple échéance 2027** sans loi fédérale horizontale (confirmé) : 1^er^ avril (LD tiers AMF), 1^er^ mai (E-23 BSIF + LD IA AMF). L'IA/AA est explicitement visée par E-23 (risque de modélisation) et par la LD IA AMF (gouvernance des SIA) — **droit souple prudentiel plutôt que droit dur horizontal**. Les points d'ancrage directs pour la gouvernance agentique sont l'**imputabilité individuelle d'un dirigeant** (AMF) et le **registre / cote de risque par système** (probable, AMF). **Question d'interprétation, et non un fait** : dans quelle mesure un agent _LLM_ **déclencheur d'actions** (et non un simple modèle prédictif) tombe-t-il dans la définition de « modèle » d'E-23 ou de « SIA » de l'AMF ?


***Tableau — E-23 (BSIF) vs LD IA (AMF) — deux angles d'un même horizon 2027 (Canada).***

| **Dimension** | **E-23 (BSIF)** | **LD IA (AMF)** |
| --- | --- | --- |
| Angle | Risque de **modélisation** (MRM) | Gouvernance des **systèmes d'IA** (SIA) |
| Entrée en vigueur | 1^er^ mai 2027 | 1^er^ mai 2027 |
| Principe directeur | Neutralité algorithmique (texte) | Imputabilité d'**un** dirigeant pour tous les SIA |
| Modèles/systèmes tiers | Couverts (_vendor / third-party_) | Encadrés via gouvernance (+ LD tiers, 1^er^ avr. 2027) |
| Registre | Cadre MRM | Registre + cote de risque par SIA — **probable** |



#### 15.10 Matrice obligation `arrow.r` mécanisme

L'apport central du chapitre : chaque obligation réglementaire saillante se **mappe** sur un mécanisme déjà spécifié dans les Parties I-II, ce qui transforme la conformité d'un fardeau documentaire en propriété **vérifiable sur la trace**. Trois mécanismes suffisent à couvrir l'essentiel : (i) **identité et autorité** de l'appelant et de la cible (cf. Ch. 3-4), reflétées dans D‑Autorité ; (ii) **trace de provenance** _PROV_, support de D‑Invariant et de l'imputabilité ; (iii) **dispatch et branche _Refus_** de opérateur τ (cf. Ch. 5), réalisation du point de contrôle humain. La mécanisation formelle du pont entre garanties déterministes et comportement probabiliste relève du Calcul d’Intégration Agentique (CIA) (cf. Ch. 6) ; il n'est pas redéfini ici.

Réserve épistémique : ces correspondances sont **des hypothèses d'ingénierie de conformité**, non des équivalences juridiques validées par un régulateur. Le statut probatoire de D‑Invariant comme preuve d'imputabilité reste à éprouver — l'invariant de traçabilité de bout en bout demeure I4 (Hypothèse), donc non acquis et à ne pas présenter comme garanti.


***Tableau — Matrice obligations `arrow.r` mécanismes du canon — renvois aux Parties I-II, sans redéfinition.***

| **Obligation (source)** | **Régime** | **Mécanisme canon (renvoi)** | **Marqueur** |
| --- | --- | --- | --- |
| Supervision humaine effective (art. 14) | UE / AI Act | Branche _Refus_ de Decision ∈ {Déterministe, Probabiliste, Refus} ; opérateur τ déplace _t_fix</sub>(g) hors régime probabiliste (cf. Ch. 5) | confirmé (obligation) / hypothèse (mapping) |
| Registre d'information TIC (ITS 2024/2956) | UE / DORA | Identité stable agent + tiers, énumération des dépendances (cf. Ch. 3-4) | confirmé / hypothèse (mapping) |
| Encadrement sous-traitance (RTS 2025/532) | UE / DORA | D‑Autorité : autorité appelant × autorité cible sur la chaîne tierce (cf. Ch. 4) | confirmé / hypothèse |
| Tests de résilience TIC (RTS TLPT 2025/1190) | UE / DORA | Banc empirique de validation ; CIA comme cadre (cf. Ch. 6) | confirmé / hypothèse |
| Journalisation / traçabilité haut risque | UE / AI Act | Trace de provenance _PROV_ ; support de D‑Invariant | confirmé / hypothèse |
| Imputabilité individuelle d'un dirigeant | Canada / AMF | Trace _PROV_ attribuable + identité d'agent (cf. Ch. 3) → preuve d'imputabilité | confirmé / **I4 (Hypothèse) non acquis** |
| Registre + cote de risque par SIA (probable) | Canada / AMF | Inventaire indexé sur l'identité d'agent ; D‑Invariant par système | probable / hypothèse |
| Risque de modélisation, modèles tiers (E-23) | Canada / BSIF | Identité du modèle tiers au registre TIC + D‑Autorité sur l'appel | confirmé / hypothèse |



#### 15.11 Divergences signalées (conservées, non lissées)

Conformément à la discipline épistémique du dossier, les divergences de sources sont **préservées**, jamais arbitrées au-delà de ce que les primaires permettent.

UE : (1) date de l'accord Omnibus — primaires (Parlement/Conseil/Commission) = **7 mai 2026**, secondaires = 6 mai 2026 (séance nocturne) ; (2) confirmation COREPER parfois citée au 13 mai 2026, **non confirmée** sur source primaire (à vérifier) ; (3) première soumission du registre DORA — dates intermédiaires variables selon la NCA, plafond commun au 30 avril 2025 ; (4) suppression de l'art. 5 du projet de RTS sous-traitance — rapportée par cabinets, **non vérifiée contre le JO** (probable) ; (5) nombre de fournisseurs _GPAI_ systémiques (~5-15) — ordre de grandeur secondaire ; seul le seuil `> 10^(25)` _FLOP_ est confirmé.

Canada : (1) date d'E-23 — une source secondaire (Blakes, avril 2026) indique le 1^er^ avril 2027, **contredite par la primaire BSIF (1^er^ mai 2027)** ; le 1^er^ avril 2027 est en réalité la date de la LD AMF risque lié aux tiers — confusion probable entre deux échéances 2027 voisines ; **retenir la primaire : E-23 = 1^er^ mai 2027**.[^p5-53] (2) « Exacerbation » par l'IA/AA — glose secondaire (Torys) ; la neutralité algorithmique est, elle, citée textuellement dans la lettre primaire. (3) Absence de successeur fédéral à AIDA au 8 juin 2026 — **affirmation de négatif**, confiance **probable** malgré la convergence Osler/BLG/CCPA, à re-vérifier à la rédaction finale.[^p5-54]

#### Questions ouvertes

Les incertitudes ci-dessous bornent la portée du chapitre ; aucune n'est résolue en date de juin 2026.

- **Publication au JO de l'Omnibus** : date exacte conditionnant l'entrée en vigueur des reports au 2 déc. 2027 / 2 août 2028 ; jusque-là, les dates originales prévalent. Piste : EUR-Lex (post-publication).
- **Portée réelle du texte final Omnibus** : modifiera-t-il d'autres dispositions (_GPAI_, registre UE haut risque, art. 50) au-delà des communiqués de mai 2026 ?
- **Qualification primaire des « agents autonomes »** : émergence possible d'ici 2027-2030 via lignes directrices Commission/AI Office ou normes CEN-CENELEC JTC 21 — actuellement **absente**. C'est la zone d'incertitude réglementaire structurante de l'interopérabilité agentique.
- **Articulation art. 14 (supervision humaine) ↔ autonomie déléguée** d'un agent multi-étapes : que préciseront les normes harmonisées ? Le _mapping_ sur la branche _Refus_ de opérateur τ reste une hypothèse d'ingénierie tant que la pratique réglementaire ne l'a pas éprouvé.
- **Autres RTS/ITS DORA** pertinents pour les chaînes agentiques (RTS risque TIC, lignes directrices coûts/pertes d'incidents) : statut et calendrier.
- **PDF final de la LD AMF sur l'IA** : confirmer **mot pour mot** l'exigence d'un « registre/inventaire centralisé des SIA » et la « cote de risque par système » (page AMF en 403). Piste : ouvrir manuellement le PDF officiel EN/FR.
- **Successeur fédéral canadien à AIDA** déposé en 2026 après « AI for All » ? Surveiller LEGISinfo (45^e^ législature).
- **Attentes spécifiques à l'IA agentique** (au-delà du risque de modélisation) du BSIF ou d'autres régulateurs avant 2027 : aucune source primaire confirmée à ce jour.
- **Champ d'application matériel** d'E-23 et de la LD IA AMF aux systèmes agentiques (agents _LLM_ autonomes, orchestration multi-agent) : ces cadres parlent de « modèles » / « SIA » sans nommer l'agentivité — **question d'interprétation pour la monographie**, pas un fait établi.



### Ch. 16 — Résilience opérationnelle et gestion du risque agentique

Parce que le risque agentique se matérialise **à l'exécution** — et non plus seulement à la conception ou au déploiement (cf. Ch. 2) — la résilience cesse d'être une propriété de la phase de test pour devenir une discipline de contrôle _runtime_. La thèse de ce chapitre : **la résilience opérationnelle d'un système agentique est le maintien de ses invariants `I1`–`I5` sous perturbation**, et le mécanisme de premier recours qui la garantit n'est pas un correctif réactif mais un disjoncteur préventif — la sortie τ‑Refus de l'opérateur τ (cf. Ch. 5), qui interrompt la trajectoire avant l'effet externe irréversible plutôt que de le compenser après coup. Le repère normatif majeur en date de juin 2026 est le NIST AI 800-4, qui définit **six** catégories de surveillance post-déploiement.

L'enjeu se distingue nettement de la fiabilité métrologique (cf. Ch. 17) : mesurer la fiabilité d'un agent répond à « se comporte-t-il bien en moyenne ? », tandis que la résilience opérationnelle répond à « que se passe-t-il à la queue de distribution, quand une trajectoire dévie ? ». Les deux sont complémentaires ; les confondre revient à confondre un banc d'essai avec un disjoncteur.

#### L'écart temporel d'exécution comme source primaire du risque

L'insight fondateur, hérité du Ch. 2, est que les risques importants émergent **durant** l'exécution parce qu'un agent planifie, utilise des outils, maintient un état et produit des trajectoires multi-étapes à effets externes[^p5-55]. La thèse « _risks emerge during execution_ » est **confirmée** dans la littérature primaire de juin 2026. En revanche, le cadrage plus précis souvent invoqué — un **écart temporel** entre l'initiation d'actions irréversibles et l'observation/intervention humaine — reste **probable** : il n'est pas une formulation verbatim des sources et constitue une reconstruction analytique.

Cet écart temporel est, du point de vue du canon, exactement la fenêtre durant laquelle un invariant peut basculer de `Confirmé` à `Réfuté` sans qu'aucun contrôle humain n'ait eu le temps d'agir. La résilience opérationnelle consiste donc à **rapprocher** le point de décision de gouvernance du point d'exécution, jusqu'à les rendre synchrones. C'est précisément la fonction du dispatch de l'opérateur τ : statuer Decision ∈ {Déterministe, Probabiliste, Refus} **avant** l'effet, sur la base des dimensions D‑Sens, D‑Autorité et D‑Invariant (cf. Ch. 5), de sorte que l'instant de fixation du sens _t_fix</sub>(g) soit positionné en amont de toute action irréversible plutôt qu'en aval.

#### Le repère normatif : NIST AI 800-4 et ses six catégories

Le NIST (via le CAISI) publie « _Challenges to the Monitoring of Deployed AI Systems_ » (NIST AI 800-4, DOI 10.6028/NIST.AI.800-4), approuvé par le NIST Editorial Review Board le 13 février 2026 et diffusé en mars 2026 (communiqué du 9 mars, mise à jour du 18 mars)[^p5-56][^p5-57]. La méthode du rapport est notable pour un document doctoral : trois ateliers (avril–mai 2025), une revue de littérature passée de 23 à 87 articles, environ 200 experts externes et plus de 10 agences fédérales — soit un substrat probant que peu de référentiels concurrents atteignent (**confirmé**).

Une correction de fond, à ne pas lisser, s'impose ici : le rapport définit **six** catégories de surveillance post-déploiement, et non cinq. Plusieurs synthèses secondaires omettaient « Large-Scale Impacts ». Les libellés primaires comptent également — « Human Factors » y désigne transparence **et** qualité, et non un vague « facteurs humains ». Le le tableau ci‑dessus reproduit les six catégories avec leur question directrice telle que formulée dans le résumé primaire.


***Tableau — Les six catégories de surveillance post-déploiement (NIST AI 800-4). La sixième catégorie, fréquemment omise dans les synthèses secondaires, est rétablie ici conformément à la Table 1 du document primaire.***

| **#** | **Catégorie (libellé primaire)** | **Question directrice (résumé primaire)** |
| --- | --- | --- |
| 1 | Functionality | Le système fonctionne-t-il comme prévu ? |
| 2 | Operational | Le système opère-t-il dans ses paramètres ? |
| 3 | Human Factors | Transparence + qualité (et non un simple « facteurs humains ») |
| 4 | Security | Le système est-il sécurisé ? |
| 5 | Compliance | Le système est-il conforme ? |
| 6 | **Large-Scale Impacts** | « _Does the system promote human flourishing?_ » |



Articulé au canon, ce découpage n'est pas neutre : les catégories **Functionality**, **Operational** et **Security** observent la santé des invariants côté système ; **Compliance** projette les obligations réglementaires (cf. Ch. 15) sur la trace d'exécution ; **Large-Scale Impacts** et **Human Factors** couvrent les effets que la mesure de fiabilité (cf. Ch. 17) ne capte pas. La surveillance NIST fournit ainsi le **quoi observer** ; elle ne prescrit pas le **quoi faire** lorsqu'une déviation est détectée — ce verrou d'exécution relève des gardes-fous _runtime_.

#### Des normes de gouvernance aux gardes-fous _runtime_ applicables

La surveillance détecte ; elle ne contraint pas. Le maillon manquant est la **traduction** d'une norme de gouvernance — énoncée en langage de politique — en un contrôle effectivement applicable au moment de l'action. Koch propose à cet effet une méthode de traduction **en couches** transformant des normes de gouvernance en gardes-fous _runtime_ applicables[^p5-58]. L'existence et l'approche du travail sont **confirmées** ; son statut _peer-review_ reste **à vérifier** en date de juin 2026, ce qui invite à le citer comme proposition méthodologique et non comme standard établi.

La lecture canonique de cette méthode est directe : un garde-fou _runtime_ applicable **est** une instanciation opérationnelle de l'opérateur τ. La couche de gouvernance fournit le seuil (autorité requise, score sémantique minimal, invariants à préserver) ; la couche d'exécution évalue D‑Sens, D‑Autorité, D‑Invariant à chaque pas de la trajectoire et émet Decision ∈ {Déterministe, Probabiliste, Refus}. Lorsque la sortie est **Refus**, le garde-fou agit en disjoncteur : il rompt le circuit **avant** l'effet externe. C'est la différence structurante entre résilience agentique et résilience d'un système déterministe classique — ici, le disjoncteur n'est pas déclenché par une surcharge mesurée **a posteriori**, mais par un calcul de licéité évalué **avant** l'irréversibilité.

Le le tableau ci‑dessus compare les deux régimes de protection que cette architecture met en regard, afin d'éviter l'assimilation paresseuse du τ‑Refus à un simple _timeout_ ou à un _rate limiter_.


***Tableau — Disjoncteur déterministe classique vs τ‑Refus comme garde-fou d'exécution agentique. Le second n'est pas un _rate limiter_ : il statue sur la licéité avant l'action, non sur la charge après coup.***

| **Dimension** | **Disjoncteur classique (déterministe)** | **τ‑Refus (gardes-fous agentiques)** |
| --- | --- | --- |
| Déclencheur | Seuil physique/charge mesuré _a posteriori_ | Calcul de licéité (D‑Sens, D‑Autorité, D‑Invariant) évalué _a priori_ |
| Instant d'action | Après le dépassement | Avant l'effet externe irréversible — déplace _t_fix</sub>(g) en amont |
| Grandeur protégée | Intégrité d'une ressource (courant, débit) | Invariants `I1`–`I5` de la trajectoire |
| Réversibilité visée | Limiter la propagation d'un dommage déjà amorcé | Empêcher l'amorce du dommage |
| Sortie | Ouvert / Fermé | Decision ∈ {Déterministe, Probabiliste, Refus} |
| Lien gouvernance | Configuration statique | Norme traduite en contrôle _runtime_ (méthode en couches) |



#### Esquisse d'une politique de garde-fou _runtime_

À titre d'illustration — et sans prétendre figer un schéma normatif que la méthode de Koch laisse ouvert (**à vérifier** quant à son format canonique) — une politique de garde-fou peut s'exprimer comme un contrat déclaratif évalué à chaque appel d'outil. Le principe : pour chaque action à effet externe, la politique fixe les seuils des trois dimensions d'entrée de l'opérateur τ et l'action par défaut en cas de franchissement, l'action par défaut sûre étant le **Refus**. L'extrait ci-dessous esquisse une telle politique pour un outil à effet irréversible (virement, suppression, publication).

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

Trois propriétés de cette esquisse méritent d'être soulignées. D'abord, `decision_par_defaut: "Refus"` matérialise le principe du **défaut sûr** : l'absence de preuve de licéité vaut interdiction, ce qui referme l'écart temporel d'exécution. Ensuite, `d_invariant.requis` lie explicitement l'autorisation au statut des invariants sur la trace — un garde-fou qui ignorerait l'état de `I1`–`I5` ne protégerait pas la grandeur que la résilience est censée maintenir. Enfin, le bloc `surveillance.categories` raccroche chaque garde-fou aux catégories NIST observables, fermant la boucle détection→contrôle.

Note de prudence canonique : cet exemple ne doit pas être lu comme une présomption sur le statut des invariants. En particulier, aucun garde-fou de ce type ne saurait **établir** I4 (Hypothèse), dont la campagne empirique demeure non concluante ; un tel invariant ne peut figurer dans `statut_attendu: "Confirme"` qu'au prix d'un écart de traçabilité à consigner (cf. `docs/tracabilite.md`).

#### Articulation avec DORA (Ch. 15) et la validation (Ch. 17)

La résilience opérationnelle agentique ne flotte pas hors sol réglementaire : elle s'inscrit dans le cadre contraignant de DORA — Règlement (UE) 2022/2554, applicable depuis le 17 janvier 2025 (**confirmé**, cf. Ch. 15) — dont le pilier **tests de résilience** (art. 24-27) et le pilier **gestion/signalement des incidents** (art. 17-23) trouvent ici leur contrepartie technique. Là où DORA exige que l'entité financière démontre sa capacité à résister à un choc TIC, les gardes-fous _runtime_ et la surveillance NIST AI 800-4 fournissent l'instrumentation par laquelle cette démonstration devient vérifiable pour un agent en production. Le rattachement précis des contrôles agentiques aux articles de DORA, en particulier au **Threat-Led Penetration Testing**, reste un chantier de cartographie (**à vérifier** quant aux RTS/ITS pertinents pour les chaînes agentiques, cf. Ch. 15).

En aval, la résilience se distingue de la validation (cf. Ch. 17) tout en s'y appuyant. La métrologie agentique de 2025–2026 est traversée par une crise de validité qui interdit de tenir l'exactitude pour un signal suffisant ; un garde-fou _runtime_ calibré sur une métrique trompeuse hériterait de cette fragilité. La résilience consomme donc les profils de fiabilité du Ch. 17 (cohérence, robustesse, prédictibilité, sûreté) comme **entrées** de calibration des seuils — mais son objet propre demeure le comportement à la queue de distribution, que la validation moyenne ne couvre pas.

#### Questions ouvertes

Les incertitudes du dossier, à conserver explicitement :

- **Cadrage de l'écart temporel d'exécution** — la thèse générale « les risques émergent à l'exécution » est **confirmée**, mais la formulation précise d'un « écart temporel entre initiation d'actions irréversibles et intervention humaine » reste **probable** et non verbatim. À étayer sur une source primaire qui l'énonce comme telle.
- **Statut de la méthode de traduction en couches (Koch)** — existence et approche **confirmées** ; le statut _peer-review_ de la préimpression arXiv 2604.05229 reste **à vérifier** en date de juin 2026. À reconfirmer avant tout usage comme référence normative.
- **Cartographie DORA ↔ gardes-fous agentiques** — l'arrimage des contrôles _runtime_ aux piliers « tests de résilience » et « incidents » de DORA, et notamment aux RTS/ITS applicables aux chaînes agentiques, demeure à instruire (**à vérifier**, cf. Ch. 15).
- **Format canonique d'une politique de garde-fou** — l'esquisse proposée est **non normative** ; la méthode primaire ne fixe pas de schéma de politique de référence. La standardisation d'un tel contrat déclaratif (langage, granularité, points d'évaluation) reste un terrain mouvant.

Sur le NIST AI 800-4 lui-même, aucune question n'est en suspens : les six catégories et leurs libellés primaires sont vérifiés sur le corps du PDF (**confirmé**).

[^p5-1]: Semantic conventions for generative AI systems (badge Development) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/
[^p5-2]: Semantic conventions for generative AI spans (badge Development vérifié) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/
[^p5-3]: Semantic conventions for generative AI spans (attributs + texte sampling) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/
[^p5-4]: Release v1.41.1 / GitHub API releases (tag_name + published_at ISO) — OpenTelemetry / GitHub — 2026-05-11 — https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.1
[^p5-5]: Release v1.41.0 / GitHub API releases (ajout time_to_first_chunk / time_per_output_chunk ; v1.37.0 = 2025-08-25) — OpenTelemetry / GitHub — 2026-04-28 — https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.0
[^p5-6]: GitHub — open-telemetry/semantic-conventions-genai (README + « No releases published ») — OpenTelemetry / GitHub — 2026 — https://github.com/open-telemetry/semantic-conventions-genai
[^p5-7]: Semantic Conventions for GenAI agent and framework spans (opérations et variantes) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/
[^p5-8]: Semantic conventions for generative AI metrics (7 Histograms) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-metrics/
[^p5-9]: Semantic conventions for MCP (span names, attributs, version 2025-06-18) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/mcp/
[^p5-10]: Semantic conventions for Generative AI events (événements agrégés vérifiés) — OpenTelemetry — 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-events/
[^p5-11]: PROV-DM: The PROV Data Model (W3C Recommendation 30 April 2013) — W3C — 2013-04-30 — https://www.w3.org/TR/prov-dm/
[^p5-12]: PROV-O: The PROV Ontology — W3C — 2013-04-30 — https://www.w3.org/TR/prov-o/
[^p5-13]: PROV-Overview (famille de documents PROV) — W3C — 2013-04-30 — https://www.w3.org/TR/prov-overview/
[^p5-14]: PROV-AGENT: Unified Provenance for Tracking AI Agent Interactions in Agentic Workflows — Souza et al. (arXiv) / IEEE e-Science 2025 — 2025-08-04 — https://arxiv.org/abs/2508.02866
[^p5-15]: GitHub API — OpenLineage/OpenLineage releases/latest (tag 1.48.0, 2026-06-03) — OpenLineage / GitHub — 2026-06-03 — https://api.github.com/repos/OpenLineage/OpenLineage/releases/latest
[^p5-16]: OpenLineage — LFAI & Data (statut Graduation ; Datakin 2021-05, gradué 2023-07) — Linux Foundation AI & Data — 2026 — https://lfaidata.foundation/projects/openlineage/
[^p5-17]: How OpenLineage takes inspiration from OpenTelemetry — OpenLineage — 2023 — https://openlineage.github.io/blog/openlineage-takes-inspiration-from-opentelemetry/
[^p5-18]: OpenLineage for a unified lineage view across structured and unstructured data to enable explainable AI (date exacte à vérifier — 403 au fetch) — IBM — 2026 — https://www.ibm.com/new/announcements/openlineage-for-a-unified-lineage-view-across-structured-and-unstructured-data-to-enable-explainable-ai
[^p5-19]: Content Credentials: C2PA Technical Specification 2.4 (version history 5.3.1 : « 2.4 - April 2026 ») — C2PA — 2026-04 — https://spec.c2pa.org/specifications/specifications/2.4/specs/C2PA_Specification.html
[^p5-20]: Article 50: Transparency Obligations (texte consolidé ; application 2 août 2026) — artificialintelligenceact.eu (Future of Life Institute) — 2026 — https://artificialintelligenceact.eu/article/50/
[^p5-21]: Artificial Intelligence: Council and Parliament agree to simplify and streamline rules (Conseil UE, 7 mai 2026 ; Omnibus) — Conseil de l'Union européenne (Consilium) — 2026-05-07 — https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/
[^p5-22]: EU AI Act Omnibus Deal Reached: Postponed Deadlines, Watermarking Compromise (délai 4 mois → 2 déc. 2026) — William Fry — 2026 — https://www.williamfry.com/knowledge/eu-ai-act-omnibus-deal-reached-postponed-deadlines-watermarking-compromise-and-the-nudificiation-prohibition/
[^p5-23]: EU AI Act Update: Timeline Relief, Targeted Simplification, and New Prohibitions — Covington & Burling (Inside Privacy) — 2026-05 — https://www.insideprivacy.com/artificial-intelligence/eu-ai-act-update-timeline-relief-targeted-simplification-and-new-prohibitions/
[^p5-24]: Annex III: High-Risk AI Systems Referred to in Article 6(2) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/annex/3/
[^p5-25]: Article 113: Entry into Force and Application (texte du Règlement 2024/1689) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/113/
[^p5-26]: Article 99: Penalties (texte du Règlement 2024/1689) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/99/
[^p5-27]: Article 51: Classification of GPAI Models as GPAI Models with Systemic Risk (seuil 10^25 FLOP) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/51/
[^p5-28]: The General-Purpose AI Code of Practice — Commission européenne (DG CNECT) — 2025 — https://digital-strategy.ec.europa.eu/en/policies/contents-code-gpai
[^p5-29]: Artificial Intelligence: Council and Parliament agree to simplify and streamline rules (Conseil UE, 7 mai 2026 ; Omnibus) — Conseil de l'Union européenne (Consilium) — 2026-05-07 — https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/
[^p5-30]: AI Act: deal on simplification measures, ban on 'nudifier' apps — Parlement européen — 2026-05 — https://www.europarl.europa.eu/news/en/press-room/20260427IPR42011/ai-act-deal-on-simplification-measures-ban-on-nudifier-apps
[^p5-31]: Digital Omnibus on AI — Legislative Train Schedule — Parlement européen — 2026-05 — https://www.europarl.europa.eu/legislative-train/package-digital-package/file-digital-omnibus-on-ai
[^p5-32]: EU AI Act Update: Timeline Relief, Targeted Simplification, and New Prohibitions — Covington & Burling (Inside Privacy) — 2026-05 — https://www.insideprivacy.com/artificial-intelligence/eu-ai-act-update-timeline-relief-targeted-simplification-and-new-prohibitions/
[^p5-33]: Article 14: Human Oversight (texte AI Act) — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/14/
[^p5-34]: Article 6: Classification Rules for High-Risk AI Systems — Future of Life Institute — 2026 — https://artificialintelligenceact.eu/article/6/
[^p5-35]: Entry into application of DORA regulation on 17 January 2025 — CSSF (Luxembourg) — 2025-01 — https://www.cssf.lu/en/2025/01/entry-in-application-of-dora-regulation-on-17-january-2025/
[^p5-36]: Regulation (EU) 2022/2554 (DORA) — texte consolidé — EUR-Lex (Office des publications de l'UE) — 2022-12 — https://eur-lex.europa.eu/eli/reg/2022/2554/oj/eng
[^p5-37]: Commission Implementing Regulation (EU) 2024/2956 — register of information (ITS, art. 28(3) DORA) — EUR-Lex — 2024-12 — https://eur-lex.europa.eu/eli/reg_impl/2024/2956/oj/eng
[^p5-38]: Commission Delegated Regulation (EU) 2025/1190 — TLPT (RTS, art. 26 DORA) — EUR-Lex — 2025-06 — https://eur-lex.europa.eu/eli/reg_del/2025/1190/oj/eng
[^p5-39]: Commission Delegated Regulation (EU) 2025/532 — subcontracting ICT services (RTS, art. 30(5) DORA) — EUR-Lex — 2025-07 — https://eur-lex.europa.eu/eli/reg_del/2025/532/oj/eng
[^p5-40]: European Commission adopts revised DORA Subcontracting RTS — a partial retreat on monitoring sub-contractors? — Herbert Smith Freehills Kramer — 2025 — https://www.hsfkramer.com/notes/tmt/2025-posts/european-commission-adopts-revised-dora-subcontracting-rts-a-partial-retreat-on-monitoring-sub-contractors
[^p5-41]: Guideline E-23 — Model Risk Management (2027) — BSIF/OSFI — 2025-09-11 — https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027
[^p5-42]: Guideline E-23 — Model Risk Management (2027) - Letter — BSIF/OSFI — 2025-09-11 — https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027-letter
[^p5-43]: OSFI updates and expands scope of Guideline E-23 for AI governance — Torys LLP — 2025-10 — https://www.torys.com/en/our-latest-thinking/publications/2025/10/osfi-updates-and-expands-scope-of-guideline-e-23
[^p5-44]: Lignes directrices en matière d'intelligence artificielle et de gestion du risque lié aux tiers (communiqué AMF : 7 avril 2026 ; effet 1er mai 2027 (IA) / 1er avril 2027 (tiers)) — Autorité des marchés financiers (AMF) — 2026-04-07 — https://lautorite.qc.ca/grand-public/salle-de-presse/actualites/fiche-dactualite/lignes-directrices-en-matiere-dintelligence-artificielle-et-de-gestion-du-risque-lie-aux-tiers
[^p5-45]: Ligne directrice sur l'utilisation de l'intelligence artificielle (page officielle AMF) — AMF — 2026-04 — https://lautorite.qc.ca/en/professionals/insurers/guidelines/use-of-models/guideline-for-the-use-of-artificial-intelligence
[^p5-46]: L'AMF propose un encadrement pour l'usage de l'IA dans les services financiers (couverture du projet : registre + cote de risque) — Norton Rose Fulbright — 2025-08 — https://www.nortonrosefulbright.com/fr-ca/centre-du-savoir/publications/129d21cb/lamf-propose-un-encadrement-pour-lusage-de-lia-dans-les-services-financiers
[^p5-47]: Third-Party Risk Management Guideline (page officielle AMF ; effet 1er avril 2027) — AMF — 2026 — https://lautorite.qc.ca/en/professionals/insurers/guidelines/operational-risk/third-party-risk-management-guideline
[^p5-48]: C-27 (44-1) — LEGISinfo (stade : Consideration in committee / Not completed ; session 44-1 close le 6 janvier 2025) — Parlement du Canada (LEGISinfo) — 2025-01 — https://www.parl.ca/legisinfo/en/bill/44-1/c-27
[^p5-49]: Prorogation's Digital Impact: Canada's Digital Bills Set to Die on the Order Paper — Fasken — 2025-01 — https://www.fasken.com/en/knowledge/2025/01/prorogations-digital-impact
[^p5-50]: What's Next After AIDA? (Solomon : pas de réintroduction d'AIDA telle quelle) — Schwartz Reisman Institute (Université de Toronto) — 2025 — https://srinstitute.utoronto.ca/news/whats-next-for-aida
[^p5-51]: Prime Minister Carney launches AI for All: Canada's new national artificial intelligence strategy (4 juin 2026 ; cibles 200 G$ / 250 000 emplois / adoption 12 % → 60 % d'ici 2034) — Cabinet du Premier ministre du Canada — 2026-06-04 — https://www.pm.gc.ca/en/news/news-releases/2026/06/04/prime-minister-carney-launches-ai-all-canadas-new-national-artificial
[^p5-52]: Canada still has no meaningful AI regulation (absence de loi-cadre fédérale, 2026) — Canadian Centre for Policy Alternatives (CCPA) — 2026 — https://www.policyalternatives.ca/news-research/canada-still-has-no-meaningful-ai-regulation/
[^p5-53]: OSFI Releases Final Guideline E-23 for Model Risk Management and AI Use by FRFIs — Blakes — 2025-09 — https://www.blakes.com/insights/osfi-releases-final-guideline-e-23-for-model-risk-management-and-ai-use-by-frfis/
[^p5-54]: A turning point for AI in Canada in 2026 — Borden Ladner Gervais (BLG) — 2026-03 — https://www.blg.com/en/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026
[^p5-55]: From Governance Norms to Enforceable Controls: A Layered Translation Method for Runtime Guardrails in Agentic AI — Christopher Koch — arXiv (preprint) — 2026-04-06 — https://arxiv.org/abs/2604.05229
[^p5-56]: New Report: Challenges to the Monitoring of Deployed AI Systems (communiqué) — NIST — 2026-03-09 — https://www.nist.gov/news-events/news/2026/03/new-report-challenges-monitoring-deployed-ai-systems
[^p5-57]: Challenges to the Monitoring of Deployed AI Systems (NIST AI 800-4, DOI 10.6028/NIST.AI.800-4) — NIST / CAISI (Rao, Keller, Kalra, Steed, Kwegyir-Aggrey, Klyman, Staheli, Bergman) — 2026-03 — https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.800-4.pdf
[^p5-58]: From Governance Norms to Enforceable Controls: A Layered Translation Method for Runtime Guardrails in Agentic AI — Christopher Koch — arXiv (preprint) — 2026-04-06 — https://arxiv.org/abs/2604.05229

## PARTIE VI — Validation empirique et architecture de référence

### Ch. 17 — Validation, métrologie et fiabilité des agents


> ⟢ ***À reprendre du corpus mère*** — Vérifier le numéro de chapitre dans le plan détaillé (`docs/plan.md`) ; le présent fichier suppose la position « Ch. 17, Partie VI ». Reprendre du corpus mère les énoncés exacts de I1 (Confirme), I2 (Confirme), I3 (Confirme) et I5 (Confirme), ainsi que leurs conditions de réfutation : ils sont invoqués ici comme cibles métrologiques sans que leur formulation canonique soit reproduite.


**Insight-clé.** L'exactitude moyenne d'un agent est un signal métrologique trompeur : un audit de dix bancs d'essai majeurs établit que 7/10 violent la validité de tâche, 7/10 la validité de résultat, et que 80 % n'admettent aucune faiblesse de conception, l'illustration limite étant un agent trivial — réponses vides — qui obtient 38 % sur des tâches volontairement impossibles et surpasse un agent fondé sur GPT-4o.[^p6-1] La conséquence pour notre cadre est directe : valider opérateur τ ne consiste pas à mesurer un taux de succès, mais à **réfuter** des invariants. La métrologie agentique défendue ici est conçue comme un appareil de falsification — elle opérationnalise la falsifiabilité des invariants `I_1`–`I_5` (le banc cherche les conditions qui les **brisent**), et c'est précisément ce dispositif qui maintient I4 (Hypothèse) au statut d'hypothèse plutôt que de l'inscrire comme acquis.

Ce chapitre est empirique. Il pose la méthodologie : conjectures réfutables, bancs d'essai sur substrat Go/Kafka (`AgentMeshKafka` adossé à `TauGo`), reproductibilité, métrologie outillée. Il ne redéfinit ni opérateur τ, ni le CIA, ni les énoncés d'invariants — il les **teste**.

#### 17.1 La crise de validité comme prémisse méthodologique

**Insight.** Si l'on ne peut pas faire confiance aux bancs publics, on ne peut pas non plus se contenter d'en reprendre les scores : il faut un banc dédié dont la conception est elle-même auditée, et des métriques qui mesurent la **réfutation** plutôt que la réussite.

La littérature 2025–2026 documente une crise de validité interne des évaluations agentiques. L'audit ABC mesure des sur-estimations attribuables à des défauts de conception, et non au modèle évalué : KernelBench est sur-estimé de 31 % (absolu) faute de _fuzz testing_ exhaustif ; WebArena de 1,4 à 5,2 % ; la sur-estimation de CVE-Bench est réduite de 33 % une fois la liste de contrôle ABC appliquée.[^p6-2] Le cas `tau`-bench-airline — un agent trivial compté comme réussi sur des tâches impossibles — est l'exemple paradigmatique d'une **violation de validité de tâche** : la métrique récompense un artefact du protocole, pas une compétence.

Deux conséquences structurent la suite. Premièrement, l'exactitude doit être décomposée. La science émergente de la fiabilité agentique propose un profil de performance holistique décomposé en 12 métriques selon 4 dimensions — _consistency_, _robustness_, _predictability_, _safety_ — « ancré dans l'ingénierie des systèmes critiques pour la sûreté ».[^p6-3] **À vérifier** : les normes nominatives aviation/nucléaire (ARP4754A, IEC 61513, ISO 26262) ne sont **pas** nommées dans le résumé primaire — l'expression « grounded in safety-critical engineering » ne doit pas être traduite en citation de ces standards (cf. divergence C12 ci-dessous) ; de même, la mention « pass\ » n'apparaît pas dans le résumé et reste à vérifier dans le corps du PDF. Deuxièmement, la robustesse des proxys d'évaluation est elle-même contestable : les utilisateurs simulés par _LLM_ seraient des proxys non fiables des utilisateurs humains dans les évaluations agentiques, ce qui mine la validité externe des bancs de type `tau`-bench.[^p6-4]


***Tableau — Tableau 17.1 — Cadres de validation/fiabilité agentique (`>= 2` dimensions).***

| **Cadre** | **Auteur·s / venue** | **Dimensions clés** | **Chiffre signature** | **Statut** |
| --- | --- | --- | --- | --- |
| ABC (audit) | Zhu, Jin, Liang et al. (25) — arXiv 2507.02825 | Validité tâche / résultat / reporting | 7/10, 7/10, 80 % ; KernelBench +31 % | _Confirmé_ |
| Science of Reliability | Rabanser et al. — Princeton HAL — arXiv 2602.16666 | consistency / robustness / predictability / safety | 4 dim. / 12 métriques | _Confirmé_ (normes nominatives _à vérifier_) |
| CLEAR | Mehta — arXiv 2511.14136 (auteur indép.) | Cost / Latency / Efficacy / Assurance / Reliability | `rho approx 0{,}83` vs `0{,}41` ; coût `50 times` | _Probable_ (sans peer-review) |
| DFAH (cf. Ch. 19) | Khatchadourian — arXiv 2601.15322 | déterminisme trajectoire/décision + fidélité évidence | déterminisme `!=` exactitude | _Confirmé_ |



Le cadre CLEAR (_Cost, Latency, Efficacy, Assurance, Reliability_) chiffre l'écart entre exactitude et succès de déploiement : l'exactitude seule corrèle faiblement avec le succès en production (`rho approx 0{,}41`) contre `rho approx 0{,}83` pour le profil composite ; il rapporte des variations de coût jusqu'à `50 times` à exactitude comparable, un écart labo–production de 37 %, et une chute de pass@1 `= 60 %` à pass@8 `= 25 %`.[^p6-5] Ces chiffres sont **à manier comme illustratifs** (préimpression non revue) ; ils motivent néanmoins une exigence forte pour notre banc — instrumenter le coût et la latence au même titre que la décision, car une garantie de correction obtenue à coût divergent n'a aucune valeur d'ingénierie.

#### 17.2 Conjectures réfutables : du programme falsificationniste à l'instrumentation

**Insight.** Un invariant n'a de valeur scientifique que s'il énonce sa condition de réfutation ; le rôle du banc est de fabriquer, systématiquement, les traces susceptibles de produire cette réfutation.

Les invariants `I_1`–`I_5` du Calcul d’Intégration Agentique (CIA) sont, par construction du corpus mère, **réfutables** : chacun s'accompagne d'un statut explicite — I1 (Confirme) | I1 (Hypothese) | I1 (Refute) — et d'une condition empirique sous laquelle il bascule. Le présent chapitre ne reproduit pas leurs énoncés (ils appartiennent au canon, cf. l'encadré liminaire), mais il fixe la **discipline de test** qui leur est appliquée.


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère, pour chaque invariant, le triplet ⟨énoncé formel, condition de réfutation, métrique de décision⟩. La présente méthodologie suppose que ces conditions existent et sont opérationnelles ; elle ne les invente pas. En particulier, l'énoncé qui motive I4 (Hypothèse) et la raison pour laquelle « la campagne empirique fut non concluante » doivent être cités tels quels (statut : I4 (Hypothese)).


La règle est asymétrique, conforme à la logique falsificationniste : aucune campagne ne **confirme** un invariant ; une campagne peut seulement échouer à le réfuter (il demeure alors `Confirmé` au sens « non réfuté à la date de la campagne ») ou le réfuter (transition vers `Réfuté`). Le statut I4 (Hypothese) matérialise un troisième cas — l'instrument n'a pas atteint la puissance statistique ou la couverture nécessaire pour trancher. La promotion d'un statut (`Hypothèse` `arrow.r` `Confirmé` ou `Réfuté`) exige une justification empirique citée et une entrée dans `docs/adr/` ; c'est une obligation éditoriale, pas une convenance.

Trois exigences découlent de cette asymétrie pour la conception du banc :

- **Couverture de réfutation.** Le générateur de scénarios doit cibler les régions de l'espace d'entrée de opérateur τ — D‑Sens, D‑Autorité, D‑Invariant — où l'invariant testé est le plus **fragile**, et non l'usage nominal. Une campagne qui ne sonde que le cas heureux n'a aucune valeur réfutante (c'est exactement le défaut de validité de tâche mesuré par ABC).
- **Oracles indépendants du modèle.** La correction se juge par appariement d'état (_state matching_) contre un état-or déterministe, et non par jugement d'un _LLM_ sur sa propre sortie. C'est la posture de `tau`-bench (Yao et al., ICLR 2025), qui évalue par appariement d'état contrastant avec l'appariement de réponses courtes de GAIA.[^p6-6]
- **Métrologie du déterminisme, distincte de l'exactitude.** L'approche DFAH établit que le déterminisme (de trajectoire et de décision) est une propriété **orthogonale** à l'exactitude : un agent peut être exact et non reproductible, ou reproductible et faux.[^p6-7] Pour opérateur τ, le déterminisme porte sur la **décision de dispatch** (Decision ∈ {Déterministe, Probabiliste, Refus}), pas sur la sortie de l'agent probabiliste en aval : c'est la fonction de routage qui doit être reproductible, le régime probabiliste assumant le _drift_ par construction.

#### 17.3 Le banc sur substrat Go/Kafka : `AgentMeshKafka` adossé à `TauGo`

**Insight.** Le banc valide opérateur τ en le plaçant à la frontière exacte qu'il est censé arbitrer — entre le régime déterministe garanti par Kafka (_exactly-once_) et le régime probabiliste d'un agent _LLM_ — et en vérifiant que la trace observée respecte (ou réfute) l'invariant ciblé.

Le choix du substrat n'est pas arbitraire. Kafka fournit une garantie de message **vérifiable et datée** : la sémantique _exactly-once_ est adoptée (KIP-98) et la transactionnalité côté producteur passée à `eos-v2` (KIP-732, depuis Kafka 3.0.0), avec activation serveur du protocole transactionnel depuis la 4.0.[^p6-8] En date de juin 2026, Kafka 4.3.0 est publiée (2026-05-22).[^p6-9] **À verifier** : la limite documentée de l'_exactly-once_ aux effets internes au système Kafka — un agent qui produit un effet de bord externe (appel d'outil, écriture tierce) sort du périmètre de la garantie.[^p6-10] Cette limite **est** le terrain de jeu de opérateur τ : c'est précisément là où la garantie déterministe s'arrête que la décision de basculer en régime probabiliste — ou de refuser (τ‑Refus) — doit être instrumentée.

`TauGo` fournit le kernel exécutable de opérateur τ ; `AgentMeshKafka` l'exerce comme banc. L'architecture de validation injecte des messages portant un triplet d'entrée, observe la Decision ∈ {Déterministe, Probabiliste, Refus} émise, puis confronte la trace résultante à l'invariant testé.


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère (écosystème `TauGo` / `AgentMeshKafka`) : la signature exacte de la fonction de dispatch de opérateur τ, le format de trace produit par `TauGo`, et le protocole de mesure d'`AgentMeshKafka` (topics, schémas d'événements, état-or). Le schéma ci-dessous est une **esquisse de configuration de banc** à des fins d'articulation méthodologique ; il ne reproduit ni n'invente l'API canonique.


Le pseudo-schéma de configuration ci-dessous illustre la **forme** d'une campagne réfutante — il fixe les topics, l'oracle d'état et l'injection de fautes ciblant la fragilité d'un invariant. Les noms d'attributs sont indicatifs et doivent être réconciliés avec le format canonique de `TauGo`.

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

Le point critique de validité interne est l'_elevation_autorite_ : c'est l'instrumentation directe du scénario _confused deputy_, où l'autorité de l'appelant est inférieure à l'autorité requise par la cible. Un banc qui ne produit jamais cette configuration ne peut pas réfuter un invariant de sûreté de délégation — il reproduirait le défaut de validité de tâche d'ABC. La sortie τ‑Refus n'est donc pas un échec mesuré comme tel : un refus **correct** sous élévation d'autorité est une réussite de sûreté, et le banc doit distinguer le sous-refus dangereux (l'agent agit alors qu'il aurait dû refuser) du sur-refus coûteux.

#### 17.4 Reproductibilité et métrologie outillée

**Insight.** La reproductibilité d'une campagne agentique exige une trace de provenance liant chaque Decision ∈ {Déterministe, Probabiliste, Refus} à ses entrées, à la version du substrat et au modèle invoqué ; faute de quoi un résultat « confirmé » n'est pas re-jouable et donc pas scientifique.

La métrologie ne peut reposer sur des journaux maison. En date de juin 2026, deux familles de standards primaires couvrent l'instrumentation. D'une part, les conventions sémantiques OpenTelemetry pour les systèmes d'IA générative (badge _Development_) définissent des spans et 7 histogrammes de métriques GenAI, et des conventions dédiées à _MCP_ (version de span 2025-06-18).[^p6-11] D'autre part, la provenance : PROV-O (W3C Recommendation, 2013) fournit l'ontologie de base, et PROV-AGENT l'étend pour le suivi unifié des interactions d'agents dans les flux agentiques.[^p6-12] Le lignage de données peut s'appuyer sur OpenLineage (gradué LF AI & Data ; v1.48.0 au 2026-06-03).[^p6-13]

**Divergence (statut des conventions).** Les conventions GenAI OTel portent le badge _Development_ : elles ne sont pas stabilisées en date de juin 2026 et ne peuvent être citées comme garantie d'interopérabilité métrologique pérenne — seulement comme cible d'instrumentation courante, à re-vérifier à chaque campagne.


***Tableau — Tableau 17.2 — Appareil de reproductibilité d'une campagne sur `AgentMeshKafka`.***

| **Exigence de repro.** | **Instrument primaire** | **Ce qui est lié à la Decision ∈ {Déterministe, Probabiliste, Refus}** | **Statut (juin 2026)** |
| --- | --- | --- | --- |
| Trace d'exécution | OpenTelemetry GenAI spans + 7 histogrammes | latence, coût en jetons, appels d'outil par décision | _Development_ (non stabilisé) |
| Provenance décisionnelle | PROV-O / PROV-AGENT | entrées D‑Sens D‑Autorité D‑Invariant `arrow.r` Decision | PROV-O _Recommendation_ ; PROV-AGENT _préprint_ |
| Lignage de données | OpenLineage v1.48.0 | état-or, jeux de scénarios | gradué (_Confirmé_) |
| Garantie de substrat | Kafka `eos-v2` (KIP-732) | idempotence message `arrow.r` trace re-jouable | adopté (_Confirmé_) |



La reproductibilité agentique se mesure, elle ne se postule pas. La dimension _consistency_ de Rabanser et al. — cohérence inter-exécutions — devient ici une métrique de premier rang : pour un même triplet d'entrée, la variance de la Decision ∈ {Déterministe, Probabiliste, Refus} émise par opérateur τ doit être bornée (idéalement nulle, le dispatch étant déterministe), et toute variance non nulle est un signal de réfutation de l'hypothèse de déterminisme de routage. C'est la jonction directe avec DFAH : ce que l'on certifie, c'est la **re-jouabilité de la décision**, pas la reproductibilité de la génération probabiliste en aval.

#### 17.5 Synthèse : pourquoi I4 (Hypothèse) reste une hypothèse

**Insight.** L'honnêteté épistémique du CIA tient à ce que son appareil de validation est conçu pour réfuter, et qu'une absence de réfutation concluante laisse l'invariant en suspens plutôt qu'elle ne le promeut.

L'écart documenté entre laboratoire et production — 37 % selon CLEAR (illustratif), et plus largement le constat de la crise de validité — interdit de conclure prématurément. Le contexte de déploiement le confirme à l'échelle de l'industrie : le rapport Stanford HAI 2026 rapporte un taux de succès de 66,3 % sur OSWorld, mais une fraction massive des systèmes n'atteindrait jamais la production.[^p6-14] Dans ce paysage, le statut I4 (Hypothese) n'est pas un aveu de faiblesse : c'est la sortie **correcte** d'un appareil de validation qui refuse de confondre « non réfuté faute de puissance » avec « confirmé ». La campagne empirique adossée à `AgentMeshKafka` n'a pas, à ce jour, produit la couverture nécessaire pour trancher I4 (Hypothèse) ; le présent chapitre fixe les conditions sous lesquelles une campagne future pourrait le faire, sans préjuger du résultat.

#### Questions ouvertes

- **Énoncés canoniques manquants.** Les formulations exactes de `I_1`, `I_2`, `I_3`, `I_5` (et la raison précise du statut I4 (Hypothese)) ne sont pas fournies dans la plage de dossier ; elles doivent être reprises du corpus mère (encadré ci‑dessus ci-dessus) avant toute campagne, faute de quoi le banc teste une cible mal spécifiée.
- **Validité externe des oracles.** Si les utilisateurs simulés par _LLM_ sont des proxys non fiables (« Lost in Simulation », **à reconfirmer**), tout scénario d'`AgentMeshKafka` reposant sur un utilisateur simulé hérite de ce biais ; l'appariement d'état déterministe le contourne partiellement, mais la couverture des intentions utilisateur réelles reste **à vérifier**.
- **Statut des conventions métrologiques.** Les conventions sémantiques GenAI d'OpenTelemetry sont en badge _Development_ (juin 2026) : la pérennité de l'instrumentation de coût/latence par décision n'est pas garantie ; re-vérifier la stabilisation à chaque relance.
- **Périmètre de l'_exactly-once_.** La garantie Kafka s'arrête aux effets internes ; la réfutation d'un invariant impliquant un effet de bord externe d'un agent exige un oracle hors-Kafka **à concevoir** (par exemple via PROV-AGENT) — non couvert par le schéma de banc actuel.
- **Re-vérifications de chiffres.** Les valeurs CLEAR (`rho approx 0{,}83`/`0{,}41` ; 37 % ; pass@1 `60 % arrow.r` pass@8 `25 %`), le « 89 % » de Stanford HAI, et la présence éventuelle de normes nominatives / « pass\ » dans Rabanser et al. restent **à vérifier** sur les sources primaires avant tout usage normatif.
- **Venue d'ABC.** L'attribution NeurIPS 2025 de l'audit de validité est **à confirmer** (non explicite dans le résumé) ; citer la primaire ICLR 2025 (Yao et al.) directement pour `tau`-bench.



### Ch. 18 — Architecture de référence implémentable de bout en bout

_Insight-clé._ Une entreprise agentique défendable n'est pas un assemblage d'agents par-dessus une couche d'intégration : c'est une _pile à frontière de sens explicite_ où l'opérateur τ matérialise, à chaque traversée de couche, le point unique où l'instant de fixation du sens _t_fix</sub>(g) est déplacé entre le substrat déterministe (qui garantit le message) et l'agent probabiliste (qui interprète l'intention). Cette section propose une architecture de référence — _proposition_, non standard — dont chaque composant est instancié à partir d'une brique attestée en date de juin 2026, et dont le fil conducteur est que la garantie _exactly-once_ du substrat _s'arrête structurellement_ au premier effet de bord externe — y compris l'appel à une API _LLM_[^p6-15]. Le rôle de τ (dispatch entre régime déterministe et régime probabiliste, sortie Decision ∈ {Déterministe, Probabiliste, Refus}) reste défini canoniquement au chap. III.8 du corpus mère et instancié au Ch. 5 ; ce chapitre l'_installe_ dans une topologie concrète, sans le redéfinir.

L'architecture qui suit consolide les couches étudiées séparément aux chapitres 8 à 14 : protocoles (Ch. 8), substrats (Ch. 9–10), identité et autorité déléguée (Ch. 11–12), menaces (Ch. 13), observabilité et provenance (Ch. 14). Son ambition est de montrer que ces couches, prises ensemble, ne se composent proprement qu'autour d'un _point de dispatch_ explicite — faute de quoi la frontière déterministe/probabiliste se dilue dans le code applicatif de chaque agent, là où elle devient incontrôlable.

#### 18.1 Le principe directeur : une frontière de sens, pas une couche d'intégration

_Insight._ La différence entre une architecture agentique d'entreprise et une simple intégration tient à un invariant de placement : il existe un et un seul endroit, par flux, où la décision Decision ∈ {Déterministe, Probabiliste, Refus} est prise, et cet endroit sépare ce qui doit être rejoué à l'identique de ce qui ne peut pas l'être.

Le fait fondateur est métrologique. La sémantique _exactly-once_ de Kafka est _bornée au périmètre interne_ _read-process-write_ : « _guaranteed within the scope of Kafka Streams' internal processing only_ » (verbatim Confluent) ; tout appel RPC externe — store distant, API _LLM_, courriel, paiement — _n'est pas garanti_ _exactly-once_[^p6-16] (`confirmé`). Symétriquement, du côté file de messages, l'« _exactly-once delivery_ » au niveau transport est _impossible_ sur réseau non fiable (problème des Deux Généraux / résultat FLP) ; seul l'« _exactly-once processing_ » applicatif est atteignable, IBM MQ l'obtenant par la conjonction persistance + syncpoint (`MQCMIT`/`MQBACK`) + coordination transactionnelle[^p6-17] (`confirmé`).

Cette double borne est l'ancrage empirique de τ. Là où le substrat garantit, le régime est déterministe et le sens est fixé en amont (_t_fix</sub>(g) précoce) ; là où l'action sort du périmètre garanti et où l'interprétation devient probabiliste, τ déplace _t_fix</sub>(g) vers l'aval et arbitre entre _Déterministe_ (router vers une garantie de message), _Probabiliste_ (déléguer à un agent _LLM_) et τ‑Refus (refuser). Les dimensions d'entrée — D‑Sens, D‑Autorité, D‑Invariant — restent celles du canon (Ch. 5) et ne sont pas redéfinies ici.


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère (chap. III.8) la sémantique opérationnelle complète de τ et la fonction de décision sur les trois dimensions, ainsi que les énoncés précis et les statuts des invariants I1, I2, I3, I5 — non fournis au présent chapitre, à ne pas inventer. Seul I4 (Hypothèse) est qualifié (campagne empirique non concluante).


#### 18.2 Vue d'ensemble : six plans, un point de dispatch

_Insight._ L'architecture se lit comme six plans horizontaux empilés ; τ est la _membrane verticale_ qui les traverse, et chaque plan adosse sa garantie ou son incertitude à une brique datée.

Description du diagramme (à coder en `cetz` dans `src/figures/` ; décrit ici en texte normatif). Le schéma se lit de bas en haut, avec une _barre verticale τ_ traversant tous les plans à droite de la colonne « agents » :

+ _Plan substrat (garanties fortes)._ Au socle, deux moteurs : Apache Kafka 4.3.0 (_log_ distribué relisable, EOS interne, 22 mai 2026)[^p6-18] et IBM MQ 9.4.5 (file _once-and-only-once_, coordination XA, GA 5 fév. 2026)[^p6-19], le mainframe IBM Z s'y rattachant par z/OS Connect.
+ _Plan exposition d'actifs._ z/OS Connect expose les API existantes (CICS/IMS/Db2) comme _outils MCP_ depuis la 3.0.98 (21 oct. 2025), un _MCP Gateway_ open-source (ContextForge, Apache-2.0, v1.0.2) fédérant MCP/A2A/REST/gRPC[^p6-20].
+ _Plan protocolaire._ Trois couches complémentaires, stratifiées sous la Linux Foundation et non unifiées : MCP (accès outils, révision stable 2025-11-25), A2A (message/tâche inter-agents, v1.0 du 12 mars 2026), AGNTCY (annuaire/identité/transport SLIM/observabilité)[^p6-21].
+ _Plan identité et autorité._ SPIFFE/SPIRE (identité de charge graduée CNCF) sous le substrat ; chaînage OAuth (RFC 8693 + `identity-chaining-14`) pour la délégation inter-domaines ; capacités atténuables (Biscuit/Macaroons) ou politiques analysables (Cedar) pour borner D‑Autorité.
+ _Plan τ (dispatch)._ La membrane verticale : pour chaque requête franchissant le substrat vers un agent, ou un agent vers un autre, τ évalue D‑Sens, D‑Autorité, D‑Invariant et émet Decision ∈ {Déterministe, Probabiliste, Refus}.
+ _Plan observabilité et provenance._ OpenTelemetry GenAI (traces/spans agent, _entièrement expérimental_), OpenLineage (lignage, gradué) et W3C PROV / C2PA (provenance, marquage réglementaire) capturent la trace sur laquelle D‑Invariant est évalué.

Le tableau suivant fixe l'instanciation de chaque plan et, surtout, son _niveau de garantie_ — la donnée architecturalement décisive, car elle conditionne ce qui peut être confié au régime déterministe.


***Tableau — Instanciation de l'architecture de référence par plan, avec niveau de garantie daté (juin 2026). La colonne « maturité » conditionne ce qui peut être délégué au régime déterministe.***

| **Plan** | **Brique instanciée (juin 2026)** | **Rôle dans le dispatch τ** | **Maturité / garantie** | **Renvoi** |
| --- | --- | --- | --- | --- |
| Substrat | Kafka 4.3.0 ; IBM MQ 9.4.5 | Régime déterministe : garantie de message, rejouabilité | `confirmé` (EOS interne ; once-and-only-once) | Ch. 9 |
| Exposition | z/OS Connect 3.0.103 (outils MCP) ; MCP Gateway v1.0.2 | Présente les actifs legacy comme outils invocables | `confirmé` (transport/auth MCP `à vérifier`, docs 403) | Ch. 10 |
| Protocole | MCP 2025-11-25 ; A2A v1.0 ; AGNTCY | Transport de l'intention et des tâches inter-agents | `confirmé` (RC MCP 2026-07-28 `probable`) | Ch. 8 |
| Identité/autorité | SPIFFE/SPIRE v1.15.1 ; RFC 8693 ; `identity-chaining-14` | Calcule D‑Autorité ; lie l'appelant à l'audience | Socle `confirmé` ; couche agentique pré-RFC | Ch. 11–12 |
| Dispatch | opérateur τ (kernel TauGo) | Émet Decision ∈ {Déterministe, Probabiliste, Refus} sur D‑Sens × D‑Autorité × D‑Invariant | 
> ⟢ ***À reprendre du corpus mère*** — noyau formel du corpus
 | Ch. 5 |
| Observabilité | OTel GenAI ; OpenLineage v1.48.0 ; W3C PROV ; C2PA v2.4 | Fournit la trace évaluée par D‑Invariant | Lignage gradué ; _GenAI = Development_ | Ch. 14 |



#### 18.3 Le plan substrat : où _t_fix</sub>(g) est fixé en amont

_Insight._ Le substrat n'est pas un simple _bus_ : c'est le lieu où le sens est fixé tôt et garanti, ce qui en fait le destinataire naturel de la branche _Déterministe_ de Decision ∈ {Déterministe, Probabiliste, Refus}.

Le choix entre les deux moteurs du socle n'est pas idéologique mais dicté par la nature de la garantie recherchée. Le tableau ci-dessous reprend la règle de décision substrat — présentée comme _synthèse argumentative_, non comme fait normatif (`probable`)[^p6-22] — et l'aligne sur la branche de τ qu'il sert.


***Tableau — IBM MQ vs Apache Kafka : sémantique et critère de choix, projetés sur les branches de Decision ∈ {Déterministe, Probabiliste, Refus}. La règle de décision substrat reste `probable` (synthèse, non normatif).***

| **Dimension** | **IBM MQ** | **Apache Kafka** | **Implication pour τ** |
| --- | --- | --- | --- |
| Modèle de données | File (point-à-point + pub/sub) | Log distribué partitionné à rétention | Kafka : la trace relisable nourrit D‑Invariant |
| Sort du message après consommation | Retiré (consommation validée) | Conservé (replay possible) | Replay déterministe = base de l'audit de Decision ∈ {Déterministe, Probabiliste, Refus} |
| Garantie native | Once-and-only-once (persistant + syncpoint + coordination) | EOS bornée au périmètre interne | Branche _Déterministe_ adressée ici |
| Coordination multi-ressources | 2PC / X-Open XA (détail XA `à vérifier`, 403) | KIP-939 (2PC externe) « Accepted », version `à vérifier` | Limite l'atomicité au-delà du substrat |
| Critère de préférence | Atomicité / ordre / conformité financière | Débit / replay / fan-out / découplage | Sélection du canal de la branche déterministe |



Le pontage MQ→Kafka illustre la fragilité de la garantie dès qu'on franchit une frontière de système : il n'atteint l'_exactly-once_ que sous contraintes strictes (un seul consommateur `tasks.max=1`, file d'état dédiée, mode distribué, `exactly.once.source.support=enabled`, Connect ≥ 3.3.0) — sans quoi, _at-least-once_[^p6-23] (`confirmé`). C'est précisément cette dégradation de garantie aux frontières qui justifie un point de dispatch explicite plutôt qu'une foi implicite dans le « _bus_ ».

Patron d'usage du substrat comme mémoire (verbatim Confluent, 5 mai 2026) : le _log_ sert de _mémoire _stateful_ à replay déterministe_, avec _transactional outbox_ + CDC Debezium pour la fiabilité d'émission, et une _DLQ_ enrichie de `prompt-id` / `model-version` / `offset` pour tracer les actions probabilistes non rejouables[^p6-24] (`confirmé`).

#### 18.4 Le plan τ : le dispatch comme code de contrôle d'admission

_Insight._ Concrètement, τ s'implémente comme un _contrôle d'admission_ placé sur le chemin entre le substrat et l'agent : il transforme une requête entrante en une décision typée avant toute invocation _LLM_, et c'est là que se logent les défenses contre le _confused deputy_.

Le schéma de configuration ci-dessous esquisse le contrat d'entrée/sortie du dispatch τ tel qu'il s'insère dans le flux. Il est _illustratif_ (forme déclarative ; la sémantique normative et la fonction de décision relèvent du corpus mère, non reproduite ici) et n'introduit aucun énoncé formel nouveau.

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


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère la _fonction de décision_ exacte de τ (seuils, ordre d'évaluation des trois dimensions, conditions de bascule vers τ‑Refus), l'_algèbre d'héritage de garanties_ du Calcul d’Intégration Agentique (CIA) (règles précises de composition des garanties à travers une délégation), les _types de session probabilistes / tolérants au _drift__ et la mécanisation _Lean 4_ associée — aucun de ces éléments formels n'est fourni au présent chapitre.


L'intérêt architectural de matérialiser τ en contrôle d'admission tient au diagnostic de sécurité du Ch. 13 : le _confused deputy_ agentique est une _faille d'autorisation et d'architecture_, non un défaut de modèle — l'agent « _is designed to treat all content in their context window as potentially instructive, which eliminates the hard boundary between data and code_ », de sorte que les remédiations efficaces (_admission control_, validation d'entrée structurée, cadrage explicite de l'autorité) sont des contrôles _externes au modèle_[^p6-25] (`confirmé`). Le dispatch τ est exactement ce contrôle externe : il porte D‑Autorité _avant_ que le contenu n'entre dans la fenêtre de contexte de l'agent. Réserve à conserver : la prompt injection demeure un _problème ouvert non entièrement résoluble_ (« _an open challenge for agent security… for years to come_ », source primaire OpenAI)[^p6-26] (`confirmé`) — τ réduit la surface, il ne la ferme pas.

#### 18.5 Le plan protocolaire : transporter l'intention sans figer le paysage

_Insight._ Les protocoles ne sont pas interchangeables : ils occupent des couches distinctes, et l'architecture les compose plutôt qu'elle n'en élit un seul — ce qui impose un _opt-in_ versionné, car le paysage bouge en date de juin 2026.

MCP transporte l'accès aux outils. Sa révision stable 2025-11-25 (JSON-RPC 2.0, transports `stdio` et _Streamable HTTP_) durcit fortement l'autorisation : serveur en OAuth 2.1 _Resource Server_, RFC 9728 (`MUST`), PKCE S256 (`MUST`), et — décisif pour le _confused deputy_ — RFC 8707 (paramètre `resource`, `MUST` inconditionnel côté client), validation d'audience côté serveur, _interdiction explicite du _token passthrough__[^p6-27] (`confirmé`). _Nuance vérifiée à ne pas lisser_ : le bénéfice de liaison d'audience RFC 8707 ne s'obtient que « _when the Authorization Server supports the capability_ » — l'obligation client est inconditionnelle, l'effet de _binding_ dépend du support par l'AS. Cette nuance se propage directement dans le calcul de D‑Autorité : l'architecture ne peut pas _présumer_ le binding ; elle doit le vérifier au plan identité.

L'origine de ces durcissements est empiriquement attestée par CVE-2025-49596 (MCP Inspector < 0.14.1, RCE, CVSS v4.0 = 9.4 CRITICAL, NVD 13 juin 2025)[^p6-28] (`confirmé`). _Divergence temporelle à intégrer dans l'_opt-in_ versionné_ : le RC 2026-07-28 propose une mutation majeure — cœur _sans état_ (suppression de `initialize` et de `Mcp-Session-Id`), dépréciation de Roots/Sampling/Logging, cadre Extensions — mais ces paramètres restent `probable` (RC non finalisé)[^p6-29]. Une architecture de référence doit donc figer la révision MCP qu'elle émet (à l'instar de la discipline `OTEL_SEMCONV_STABILITY_OPT_IN`, §18.7) et ne pas présumer le stateless.

A2A transporte le message et la tâche inter-agents : v1.0 (« _production-ready_ »), trois liaisons (JSON-RPC 2.0, gRPC, HTTP+JSON/REST), _Agent Card_ signée (`AgentCardSignature`) supportant API Key, HTTP Auth, OAuth2, OIDC, mTLS[^p6-30] (`confirmé`). _Divergence à conserver_ : l'allégation agrégateur « A2A 1.2 » est _réfutée/non confirmée_ par la source primaire ; les _Signed Agent Cards_ relèvent de v1.0. AGNTCY fournit le tissu d'infrastructure (OASF + Agent Directory + Identity + SLIM + observabilité)[^p6-31] (`confirmé`). La « convergence » est un _alignement en couches_, non une unification : A2A = message/tâche ; AGNTCY = annuaire/identité/transport/observabilité ; MCP = accès outils ; AG-UI/A2UI = interface usager (`probable`).

#### 18.6 Le plan identité et autorité : calculer D‑Autorité

_Insight._ D‑Autorité n'est pas une donnée fournie par l'agent : c'est un produit calculé par composition de briques éprouvées — identité de charge (SPIFFE), délégation inter-domaines (chaînage OAuth), bornage de permission (capacités ou politiques) — la stratégie dominante de l'industrie étant la _composition_, non l'invention d'un protocole d'agent.

Le socle d'identité de charge est mûr et déterministe : SPIFFE/SPIRE est gradué CNCF (depuis 2022 ; dernière version SPIRE v1.15.1 du 28 mai 2026, correctif de sécurité sur l'attestation `azure_imds`)[^p6-32]. Un SPIFFE ID est un URI `spiffe://` (trust domain + chemin), encodé dans le SAN d'un X.509-SVID (« _exactly one URI SAN_ ») ou dans le `sub` d'un JWT-SVID (`aud` obligatoire et validée)[^p6-33] (`confirmé`). C'est le facteur « autorité_appelant » de D‑Autorité.

La délégation inter-domaines repose sur la primitive RFC 8693 (OAuth 2.0 Token Exchange, `subject_token`/`actor_token`), prolongée par `draft-ietf-oauth-identity-chaining` au stade _quasi-RFC_ (IESG `Approved-announcement::Revised I-D Needed`, ballots 2–3 juin 2026 ; co-auteurs incluant MITRE et NSA-CCSS)[^p6-34] (`confirmé`). _Asymétrie de maturité à ne pas lisser_ : le socle (SPIFFE, RFC 8693) est stable, mais la couche protocolaire WIMSE est _entièrement pré-RFC_ — aucun document WIMSE n'a atteint le statut RFC en date de juin 2026 — et l'identité _spécifiquement agentique_ n'existe qu'en _drafts individuels_ non adoptés (`draft-klrc-aiagent-auth`, `draft-araut-…-for-agents`)[^p6-35] (`confirmé`). _Piège épistémique récurrent_ : pour la quasi-totalité de ces drafts, la métadonnée Datatracker « Intended RFC status » affiche `(None)` alors que l'en-tête indique « Standards Track » — ne pas présenter « Standards Track » comme statut sanctionné. Le pont SPIFFE↔OAuth est lui-même formalisé en draft co-signé NIST + IBM (`draft-ietf-oauth-spiffe-client-auth-01`)[^p6-36] (`confirmé`).

Le bornage de la permission transportée — « autorité_requise_cible » de D‑Autorité — se joue entre deux modèles opposés. Le tableau suivant en restitue la tension architecturale.


***Tableau — Capacités atténuables vs politiques analysables, projetées sur le calcul de D‑Autorité (Ch. 12). Le pont agentique reste émergent et non normatif en juin 2026.***

| **Dimension** | **Macaroons / Biscuit (capacités)** | **Cedar (politiques)** | **Apport au calcul de D‑Autorité** |
| --- | --- | --- | --- |
| Nature | Jeton porteur atténuable | Langage de politiques (pas un jeton) | Transporter vs évaluer l'autorité |
| Atténuation | Hors-ligne (caveats ; blocs append-only Ed25519) | N/A (évaluée par moteur) | Atténuation monotone le long de la chaîne d'agents |
| Force différenciante | Décentralisation, POLA | Analysabilité formelle (Lean, _soundness_+_completeness_) | Vérifiabilité a priori des autorisations d'outils |
| Gouvernance | Eclipse `Incubating` (Biscuit) / Google (Macaroons) | CNCF `Sandbox` (déc. 2025) | Maturité institutionnelle hétérogène |
| Maturité agentique | Chaînes multi-sauts (courant émergent) | `cedar-for-agents` _expérimental_ | Pont agentique non normatif |



Réserve décisive (`confirmé` pour le constat de stade) : _aucun standard IETF/W3C de jeton à capacités pour agents n'est confirmé en juin 2026_ ; `cedar-for-agents` (génère un schéma Cedar depuis les descriptions d'outils d'un serveur MCP) et le préprint AIP (non revu, auteur unique — à ne pas citer comme normatif) coexistent sans coordination[^p6-37]. L'architecture _compose_ donc SPIFFE + chaînage OAuth + (Cedar ou Biscuit) ; elle n'attend pas un protocole d'autorité agentique unifié, qui n'existe pas.

#### 18.7 Le plan observabilité et provenance : fournir la trace de D‑Invariant

_Insight._ D‑Invariant se calcule sur une trace, et la qualité de cette dimension est aujourd'hui plafonnée par l'immaturité de l'instrumentation : toute l'observabilité GenAI est _expérimentale_, ce qui contraint l'architecture à un _opt-in_ explicite versionné.

Le point dur, vérifié page par page : _la totalité des conventions sémantiques OpenTelemetry GenAI demeure en statut « Development »_ (spans modèle, spans agent `create_agent`/`invoke_agent`/`execute_tool`, métriques — 7 instruments Histogram —, MCP, conventions par fournisseur) ; aucune sous-section n'affiche « Stable »[^p6-38] (`confirmé`, haut enjeu). La discipline de transition est explicite : baseline de stabilité v1.36.0 ; les instrumentations « _SHOULD NOT change the version of the GenAI conventions that they emit by default_ » ; l'adhésion à la dernière version expérimentale passe par `OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental`[^p6-39] (`confirmé`). Conséquence architecturale directe : D‑Invariant (et D‑Sens, qui peut s'alimenter des spans `gen_ai.*`) repose sur une API _sans garantie de stabilité_ — l'architecture _doit_ versionner explicitement ses conventions, faute de quoi un saut de version casse silencieusement le calcul du dispatch.

Autour de ce noyau mouvant, trois socles plus stables complètent la trace. Le lignage — « équivalent des traces pour les données » — est assuré par OpenLineage v1.48.0 (3 juin 2026), projet _gradué_ LF AI & Data, _complémentaire et non convergent_ avec OpenTelemetry[^p6-40] (`confirmé`). La provenance des entités/activités/agents s'appuie sur W3C PROV-DM, _Recommandation stable mais figée depuis le 30 avril 2013_, antérieure à l'ère agentique (l'extension PROV-AGENT, native MCP, reste _au stade recherche_)[^p6-41] (`confirmé`). Enfin, le marquage de sortie relève de C2PA v2.4 (avril 2026, _manifest_ signé) et de l'obligation réglementaire de l'art. 50 du Règlement UE 2024/1689, _applicable le 2 août 2026_[^p6-42] (`confirmé`) — avec, par l'accord « AI Omnibus » du 7 mai 2026, un report au 2 décembre 2026 _uniquement_ pour les systèmes génératifs déjà sur le marché avant le 2 août 2026 (`probable`, texte définitif à confirmer au JO).


***Tableau — Composants de la trace évaluée par D‑Invariant. L'instrumentation agentique normalisée existe mais n'offre _aucune garantie de stabilité d'API_ — d'où l'_opt-in_ versionné obligatoire.***

| **Composant de trace** | **Version / date** | **Maturité (juin 2026)** | **Rôle pour le dispatch** |
| --- | --- | --- | --- |
| OTel GenAI (toutes sous-sections) | v1.41.1 — 2026-05-11 | _Development_ (aucune « Stable ») | Alimente D‑Sens et D‑Invariant (API non stable) |
| OpenLineage | v1.48.0 — 2026-06-03 | Graduation (LF AI & Data) | Lignage des datasets sous-jacents |
| W3C PROV-DM | Rec. 30 avr. 2013 | Stable mais figé (pas de v2) | Provenance générique, non agentique |
| C2PA + art. 50 UE | v2.4 (avr. 2026) ; appl. 2 août 2026 | Versionné ; en vigueur échelonné | Marquage et conformité des sorties |



#### 18.8 Flux de bout en bout : une requête traverse la pile

_Insight._ Mis bout à bout, les six plans décrivent un seul trajet : une requête entre par le substrat, est dispatchée par τ, et soit emprunte la branche déterministe garantie, soit est déléguée à un agent dont chaque effet de bord est tracé et non rejouable.

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

Deux propriétés de cette topologie méritent d'être soulignées. D'abord, la _non-rejouabilité_ est confinée à l'étape 4 : tout ce qui précède le dispatch est déterministe et auditable par replay du _log_ ; tout effet de bord probabiliste est isolé et tracé, jamais présumé idempotent. Ensuite, le _chain splicing_ (re-délégation inter-agents ciblant l'agent délégué, moins protégé) — documenté comme amplification multi-agent et convergent avec le « _credential relay through delegation chains_ » du Ch. 13 — est combattu non au niveau du modèle mais au plan identité/autorité, par l'atténuation monotone des capacités (§18.6) et la liaison d'audience (§18.5)[^p6-43] (`probable` ; le terme « chain splicing » reste de la littérature secondaire).


> ⟢ ***À reprendre du corpus mère*** — Reprendre du corpus mère et du Calcul d’Intégration Agentique (CIA) la formalisation de la _propagation de garanties_ le long de ce trajet (algèbre d'héritage : comment une garantie déterministe à l'étape 1 est ou non préservée après la délégation de l'étape 3), ainsi que le banc empirique _AgentMeshKafka_ qui doit mesurer cette propagation. Ces éléments — types de session tolérants au _drift_, règles d'héritage, code Lean 4 — ne sont pas fournis ici.


#### 18.9 Frontière de validité de l'architecture proposée

_Insight._ Cette architecture est une _proposition_ dont la validité est bornée par trois faits non négociables de juin 2026 : l'absence de standard d'identité agentique, l'instabilité de l'observabilité GenAI, et l'opacité documentaire de plusieurs briques mainframe.

Trois limites circonscrivent explicitement la portée de la proposition. (1) _Asymétrie de maturité de l'identité._ Le socle (SPIFFE, RFC 8693) est `confirmé`, mais la couche agentique est pré-RFC et non adoptée ; toute dépendance à un « standard d'identité d'agent » est prématurée (`hypothèse` pour tout calendrier de RFC, vraisemblablement 2027–2028). (2) _Instabilité de l'observabilité._ L'intégralité d'OTel GenAI étant en « Development », le calcul de D‑Sens et D‑Invariant à partir de ces conventions est exposé à des ruptures d'API — la robustesse du dispatch dépend d'un facteur hors du contrôle de l'architecte. (3) _Opacité documentaire mainframe._ Plusieurs détails décisifs restent `à vérifier` du fait du blocage HTTP 403 sur `ibm.com/docs` : transport et modèle d'authentification MCP de z/OS Connect, détail du 2PC/XA d'IBM MQ, version d'introduction de Native HA CRR. L'architecture suppose ces points résolus favorablement ; cette supposition n'est pas attestée.

Enfin, le couplage des déterministe→probabiliste, syntaxique→sémantique, composition→délégation (déterministe→probabiliste, syntaxique→sémantique, composition→délégation) demeure la thèse qui justifie le point de dispatch unique : ce n'est pas que le substrat devienne probabiliste, ni que la syntaxe cède à la sémantique, ni que la composition cède à la délégation _séparément_ — c'est que ces trois bascules surviennent _ensemble_ à la traversée de τ. Toute architecture qui traiterait ces axes indépendamment manquerait la frontière que τ a précisément pour fonction de tenir.

#### Questions ouvertes

- _Identité agentique normative._ Un groupe de travail (WIMSE ou OAuth) adoptera-t-il un document _normatif_ dédié à l'identité d'agent d'ici 2027 (`hypothèse`) ? Surveiller `draft-araut-…-for-agents-02` et `draft-ni-wimse-ai-agent-identity-02`, et le passage d'`identity-chaining` au-delà de « Revised I-D Needed ».
- _Stabilité de l'observabilité._ Une sous-section GenAI d'OpenTelemetry atteindra-t-elle « Stable » avant fin 2026, et le dépôt `semantic-conventions-genai` produira-t-il sa première release (actuellement « No releases published ») ? Sans cela, le calcul de D‑Invariant reste sur API instable.
- _Transport/auth MCP du mainframe._ Quel transport MCP (_Streamable HTTP_ / SSE / stdio) et quel modèle d'authentification z/OS Connect 3.0 emploie-t-il (docs en 403) ? Réponse déterminante pour brancher le substrat Z sur le plan protocolaire.
- _Atomicité au-delà du substrat._ Quelle version d'Apache Kafka intégrera KIP-939 (2PC externe, « Accepted », version `à vérifier`), et le détail du coordinateur 2PC/XA d'IBM MQ — embarqué ou participant ? De cela dépend l'étendue réelle de la branche _Déterministe_ au-delà d'un seul système.
- _Capacités pour agents._ Au-delà de `cedar-for-agents` (expérimental) et du préprint AIP (non revu), un acteur majeur publiera-t-il une _spécification officielle_ de délégation à capacités pour MCP/A2A ? Aucune confirmée à ce jour.
- _Surcoût du dispatch._ Existe-t-il une mesure primaire horodatée du surcoût de la frontière déterministe (latence/débit de l'EOS Kafka) ? À défaut, substituer une mesure propre via _AgentMeshKafka_ (
> ⟢ ***À reprendre du corpus mère*** — banc empirique à reprendre du corpus
).
- _Conformité du marquage._ Le texte définitif du Règlement Omnibus consacre-t-il l'échéance du 2 décembre 2026 et la restriction aux systèmes _legacy_, et les lignes directrices de la Commission sur l'art. 50 imposent-elles C2PA ou restent-elles neutres (`à vérifier`) ?



### Ch. 19 — Instanciation en services financiers régulés

_Insight-clé._ L'institution financière régulée constitue le banc d'épreuve le plus contraignant de l'opérateur τ, parce qu'elle impose simultanément trois exigences que les trois ruptures couplées (déterministe→probabiliste, syntaxique→sémantique, composition→délégation) rendent difficiles à satisfaire ensemble : **souveraineté** de la donnée et du calcul (le cœur de système reste sur substrat patrimonial, désormais exposé comme outils _MCP_), **auditabilité** par rejeu (rejouer une décision à entrées identiques) et **imputabilité** d'un dirigeant nommé sur un acte délégué à un agent probabiliste. Or le rejeu déterministe et l'exactitude de tâche ne sont **pas** détectablement corrélés[^p6-44] : la conformité ne peut donc pas se déduire de la qualité fonctionnelle, elle doit se mesurer séparément. La thèse opérationnelle de ce chapitre est que le τ‑Refus joue, dans ce secteur, le rôle d'un **disjoncteur réglementaire** — il refuse de déplacer _t_fix</sub>(g) vers le régime probabiliste lorsqu'un invariant d'autorité ou de traçabilité n'est pas satisfait, transformant une obligation de moyens (gouvernance) en garantie de message (substrat déterministe). Le cadre normatif s'est densifié en 2025–2026 (DORA en application, E-23 et la ligne directrice de l'AMF finalisées), ce qui ancre empiriquement cette instanciation plutôt que de la postuler.

#### Le substrat régulé : un cœur patrimonial désormais exposé comme outils MCP

_Insight-clé._ Dans la banque et l'assurance, le système d'enregistrement (_system of record_) demeure sur mainframe, et l'événement marquant de 2025–2026 est que ce cœur souverain est **exposé comme outils _MCP_** — la frontière substrat/action passe désormais à l'intérieur même du z/OS, ce qui déplace la question de souveraineté du « où vit la donnée » vers « quelle autorité fixe le sens d'un appel d'agent sur cette donnée ».

IBM expose ses plateformes z/OS et IBM i comme serveurs _MCP_, permettant à un agent _LLM_ de découvrir et de consommer CICS, Db2, IMS et MQ. La capacité est **confirmée** ; les sous-versions et le statut GA/preview restent partiellement **à vérifier**, le blocage HTTP 403 sur `docs.ibm.com` empêchant la lecture directe de plusieurs pages produit. Trois mécanismes coexistent, de maturité hétérogène.


***Tableau — Connecteurs MCP mainframe IBM en institution financière : trois maturités, deux modèles de licence.***

| **Connecteur** | **Plateforme / données** | **Mécanisme MCP** | **Licence / origine** | **Statut (juin 2026)** |
| --- | --- | --- | --- | --- |
| z/OS Connect (lignée 3.0) | z/OS : CICS, Db2, IMS, MQ | OpenAPI 3 → outils MCP (descriptions auto-générées depuis la spec) | IBM (commercial) | Capacité MCP **confirmée** dès la 3.0.98 (21 oct. 2025) ; lignée portée à 3.0.103 (mai 2026, APAR PH70973) |
| CICS MCP server | CICS TS 6.x (in-transaction) | Outils assistant un LLM, intégrés dans les transactions CICS | IBM (commercial) | **Confirmé** pour l'existence ; CICS TS 6.3.0 GA le 5 sept. 2025 ; refresh exact du serveur MCP **à vérifier** |
| ibmi-mcp-server | IBM i : Db2 for i | Outils SQL configurés en YAML, WebSocket via Mapepire | **Apache 2.0** (IBM / GitHub) | Dévoilé en oct. 2025 à l'état « early version » ; dépôt affichant « Stable » en juin 2026 — divergence temporelle à ne pas lisser |


[^p6-45]

Deux conséquences pour la souveraineté. Premièrement, la donnée régulée ne quitte pas le substrat : c'est une **description d'outil** (et non la donnée) qui est publiée vers l'agent, et l'exécution (transaction CICS, requête Db2) reste sur z/OS — propriété que le secteur exige et que le modèle _MCP_ préserve par construction lorsque le serveur est colocalisé. Deuxièmement, la **licence** devient un critère de conformité tiers : z/OS Connect et le serveur CICS sont commerciaux (chaîne contractuelle IBM, donc lisible par la gestion du risque tiers), tandis que `ibmi-mcp-server` est sous Apache 2.0 (composant open-source à inventorier comme dépendance — cf. ASI04 _Agentic Supply Chain Vulnerabilities_ de l'OWASP Top 10 Agentic). IBM déclare par ailleurs l'intention de livrer « 500 outils _MCP_ en 2026 » pour ses plateformes ; cette ambition, citée verbatim par la presse spécialisée, reste **probable** (document source IBM non directement lisible) et ne doit pas être traitée comme un engagement contractuel[^p6-46].


> ⟢ ***À reprendre du corpus mère*** — La frontière substrat/action et la propriété « la garantie de message ne couvre pas l'effet de bord externe (appel LLM) » sont établies au corpus mère (lignée Kafka EOS / impossibilité de l'_exactly-once delivery_). Ce chapitre y réfère : ne pas redériver la borne, l'instancier sur z/OS Connect.


#### Souveraineté et localisation : du périmètre réseau à la fixation du sens

_Insight-clé._ En contexte régulé canadien et européen, la souveraineté ne se réduit plus à la résidence des données ; elle inclut la **résidence de la décision** — quel régime (Decision ∈ {Déterministe, Probabiliste, Refus}) a fixé _t_fix</sub>(g), sous quelle autorité, et où cette fixation est-elle traçable. Le déplacement de _t_fix</sub>(g) par l'opérateur τ devient lui-même un objet de conformité.

Les régulateurs traitent désormais le risque tiers ICT comme central. DORA (Règlement (UE) 2022/2554, **confirmé** : adoption 14 déc. 2022, application **17 janvier 2025**) impose la gestion du risque ICT tiers (art. 28), des tests de résilience dont le _Threat-Led Penetration Testing_ (TLPT) et un cadre d'_oversight_ UE des prestataires ICT critiques (CTPP)[^p6-47]. Le dispositif est complété par des actes confirmés sur EUR-Lex : l'ITS sur le registre d'information (Reg. exéc. (UE) 2024/2956, art. 28(3)), le RTS TLPT (Reg. délégué (UE) 2025/1190, art. 26) et le RTS sous-traitance ICT (Reg. délégué (UE) 2025/532, art. 30(5))[^p6-48]. _Divergence à conserver_ : le numéro « 2024/2956 » avait d'abord transité par une source secondaire (QuoIntelligence) avant confirmation EUR-Lex ; l'échéance annuelle de soumission du registre (gabarit XBRL/XML, échéance rapportée mais à reconfirmer) demeure **à vérifier** sur source primaire EBA.

Côté canadien, l'OSFI/BSIF a finalisé la ligne directrice E-23 (_Model Risk Management_ 2027, datée du 11 sept. 2025), élargissant explicitement le périmètre du risque de modèle à l'usage de l'IA par les institutions financières fédérales[^p6-49]. L'AMF a rendu officielle, le 7 avril 2026, sa ligne directrice sur l'utilisation de l'intelligence artificielle — assortie, **à confirmer** (PDF AMF en 403), d'un **registre** des systèmes d'IA et d'une **cote de risque** — et a couplé l'exercice à une ligne directrice sur la gestion du risque lié aux tiers (effet au 1er</sup> avril 2027)[^p6-50]. Aux États-Unis, le Trésor a publié le 19 février 2026 deux ressources **non contraignantes** (_soft law_) : un _AI Lexicon_ et un _Financial Services AI Risk Management Framework_ aligné sur le NIST AI RMF, fournissant une matrice de **230 objectifs de contrôle** — chiffre **probable**, à confirmer sur le document primaire treasury.gov[^p6-51].

Le tableau suivant relie chaque obligation pertinente à son point d'instanciation dans la machinerie de l'opérateur τ (renvois au Ch. 15 pour le mapping réglementaire détaillé, au Ch. 14 pour la trace, au Ch. 12 pour l'autorité déléguée).


***Tableau — Mapping des obligations financières régulées vers les mécanismes de l'opérateur τ (cf. Ch. 15).***

| **Obligation (instrument)** | **Exigence opérationnelle** | **Mécanisme opérateur τ / canon** | **Statut de l'instrument** |
| --- | --- | --- | --- |
| Risque ICT tiers — DORA art. 28 ; AMF risque-tiers ; OSFI E-23 périmètre élargi | Inventaire et surveillance des prestataires/composants ICT, dont les serveurs MCP | Frontière substrat/action : serveur MCP commercial vs open-source porté à l'inventaire ; D‑Autorité borne l'appelant | DORA **confirmé** (appl. 17 janv. 2025) ; E-23 **confirmé** (2025-09-11) ; AMF tiers effet 2027 |
| Auditabilité / rejeu — SR 11-7 ; FFIEC IT ; E-23 ; AMF registre | Rejouer une décision à entrées identiques + capturer la chaîne de raisonnement | Trace PROV (Ch. 14) ; D‑Invariant lit l'état des invariants sur la trace ; DFAH mesure le déterminisme indépendamment de l'exactitude | SR 11-7/FFIEC **probable** (primaires Fed/FFIEC à citer en propre) ; DFAH **confirmé** |
| Imputabilité d'un dirigeant — AMF (imputabilité ; registre + cote de risque) | Un responsable nommé répond d'un acte délégué à l'agent | Chaîne d'autorité déléguée (Ch. 12) ; τ‑Refus si l'autorité requise excède l'autorité de l'appelant | AMF officielle **confirmée** (2026-04-07) ; **registre** + **cote** **probables** |
| Résilience / tests — DORA TLPT (RTS 2025/1190) | Tests de pénétration guidés par la menace sur la chaîne agentique | Surface d'attaque OWASP Top 10 Agentic (ASI01–ASI10) ; τ‑Refus comme point d'arrêt testable | RTS **confirmé** (EUR-Lex 2025/1190) |
| Transparence non contraignante — Treasury FS AI RMF (230 obj.) | Cartographie de contrôles sur le cycle de vie de l'IA | Référentiel volontaire à recouper avec CIA (pont garanties/comportement) | **Confirmé** (publication) ; 230 obj. **probable** |



#### Auditabilité : la trace PROV comme objet de conformité

_Insight-clé._ En finance régulée, l'auditabilité exige deux propriétés distinctes qu'il faut mesurer séparément : **rejouabilité** (mêmes entrées → mêmes sorties) et **fidélité conditionnée à l'évidence** (la décision est justifiée par les données effectivement considérées). Le harnais DFAH démontre que la première ne garantit pas l'exactitude fonctionnelle ; la trace PROV (Ch. 14) fournit le support matériel de la seconde et alimente directement la dimension D‑Invariant de l'opérateur τ.

L'auditabilité réglementaire impose de capturer, pour chaque décision : les données considérées, la logique de décision, les alternatives écartées, le niveau de confiance, les autorisations de l'agent, le contexte reçu, les systèmes aval touchés et toute approbation ou _override_ humain. Les superviseurs réutilisent à cette fin des cadres préexistants — la _guidance_ SR 11-7 sur le risque de modèle (Réserve fédérale), la _guidance_ IT du FFIEC et la gestion du risque tiers. Ce principe est **probable** et largement admis ; SR 11-7 et le FFIEC étant des sources primaires (Fed/FFIEC), ils doivent être cités en propre dans la rédaction finale plutôt que via une analyse secondaire[^p6-52].

Le résultat empirique structurant provient du harnais DFAH (_Determinism-Faithfulness Assurance Harness_), qui mesure trois propriétés sur des agents outillés : déterminisme de trajectoire, déterminisme de décision (sorties stables à entrées identiques rejouées) et fidélité conditionnée à l'évidence. Son constat-clé — **le déterminisme de décision et l'exactitude de tâche ne sont pas détectablement corrélés** — a une portée réglementaire directe : un agent peut être parfaitement rejouable et fonctionnellement faux, ou exact et non rejouable. La conformité (rejeu d'audit) et la performance (exactitude) doivent donc faire l'objet de bancs distincts. C'est précisément la justification empirique de séparer, dans l'opérateur τ, la mesure D‑Sens (score sémantique de la tâche) de l'état D‑Invariant (traçabilité/rejouabilité sur la trace) : ce sont deux signaux non substituables.


***Tableau — De l'exigence d'audit à la dimension d'entrée de l'opérateur τ, via la trace PROV.***

| **Élément à capturer (audit)** | **Support PROV / canon (Ch. 14)** | **Dimension opérateur τ alimentée** |
| --- | --- | --- |
| Données considérées + alternatives écartées | Entités PROV + relations d'usage | D‑Sens (pertinence sémantique) |
| Logique de décision + niveau de confiance | Activité PROV horodatée + attributs | D‑Sens / D‑Invariant |
| Autorisations et périmètre de l'agent | Agent PROV + délégation (Ch. 12) | D‑Autorité |
| Override / approbation humaine | Activité PROV attribuée à un agent humain | D‑Invariant (statut d'invariant sur la trace) |
| Rejouabilité à entrées identiques | Trace complète versionnée (banc DFAH) | D‑Invariant |




> ⟢ ***À reprendre du corpus mère*** — Les énoncés précis et statuts des invariants I1, I2, I3, I5 ne sont pas fournis ici. Pour articuler formellement « rejouabilité ⇒ état de D‑Invariant », reprendre du corpus mère l'invariant adéquat et son statut. I4 (Hypothèse) demeure une _Hypothèse_ (campagne empirique non concluante) : ne pas l'invoquer comme garantie d'auditabilité acquise.


#### Imputabilité dirigeante et autorité déléguée : le τ‑Refus comme disjoncteur réglementaire

_Insight-clé._ L'exigence d'imputabilité (un dirigeant nommé répond d'un acte) entre en tension frontale avec la délégation à un agent probabiliste ; le τ‑Refus résout cette tension en **refusant de fixer _t_fix</sub>(g)** en régime probabiliste lorsque l'autorité requise par la cible excède l'autorité effectivement déléguée à l'appelant — il convertit une zone d'incertitude réglementaire en refus déterministe, traçable et testable.

La ligne directrice de l'AMF — en imposant l'imputabilité d'un dirigeant nommé et, **à confirmer** (PDF AMF en 403), un registre des systèmes d'IA assorti d'une cote de risque — présuppose un responsable identifiable par système. Cette imputabilité se traduit techniquement par la chaîne d'autorité déléguée (Ch. 12) : l'agent agit **au nom de** (et dans les limites de) l'autorité d'un principal humain, et tout franchissement de ces limites doit être bloqué **avant** l'effet de bord. C'est la fonction du τ‑Refus : sur l'axe D‑Autorité (autorité de l'appelant × autorité requise par la cible), un produit insuffisant force la sortie « Refus » de Decision ∈ {Déterministe, Probabiliste, Refus} plutôt qu'une tentative probabiliste. Le refus n'est pas une dégradation — c'est la garantie de message du substrat déterministe réaffirmée à la frontière, c'est-à-dire exactement la propriété qu'un superviseur peut auditer.

L'écosystème de délégation outille cette chaîne, à des degrés de maturité variables (cf. Ch. 12). Les jetons de transaction et l'enchaînement d'identité côté OAuth — RFC 8693 (_Token Exchange_, **confirmé**), `draft-ietf-oauth-identity-chaining` et `draft-ietf-oauth-transaction-tokens` (_Internet-Drafts_ actifs) — portent l'autorité à travers les domaines[^p6-53]. Les modèles de capacité atténuables (Biscuit, Cedar) offrent une atténuation monotone de l'autorité que le τ‑Refus peut vérifier localement[^p6-54]. _À vérifier_ : `draft-araut-oauth-transaction-tokens-for-agents` introduit un concept de « _Monotonic Attenuation_ » d'autorité pour agents, mais c'est une soumission individuelle au statut instable (divergence d'_intended status_) — à ne pas traiter comme normative en date de juin 2026[^p6-55].

Le schéma ci-dessous illustre l'instanciation : un outil _MCP_ exposé par z/OS Connect sur une opération Db2 régulée, dont l'appel par un agent est arbitré par un disjoncteur τ‑Refus paramétré sur l'autorité déléguée et l'état des invariants. La forme YAML reprend le patron `ibmi-mcp-server` (outils SQL déclarés en YAML) ; le bloc de garde encode la condition de refus.

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


> ⟢ ***À reprendre du corpus mère*** — Les règles précises de l'algèbre d'héritage de garanties du Calcul d’Intégration Agentique (CIA) et la mécanisation Lean 4 ne sont pas fournies. La propriété « le τ‑Refus hérite de la garantie déterministe du substrat » doit être reprise du corpus mère (types de session probabilistes / tolérants au _drift_ ; analogie M(π)/π-calcul) — ne pas la fabriquer ici.


#### Plan de contrôle et adoption : ce que le terrain confirme, ce qu'il ne confirme pas

_Insight-clé._ L'outillage de gouvernance agentique se constitue en **plan de contrôle** d'entreprise, mais les chiffres d'adoption les plus cités relèvent de communiqués et de secondaires ; la cause dominante d'échec rapportée — la gouvernance, non la capacité — est cohérente avec la thèse de ce chapitre, sans en constituer une preuve.

IBM positionne une nouvelle génération de watsonx Orchestrate comme plan de contrôle agentique offrant observabilité et gouvernance plein cycle et une évaluation pré-déploiement multidimensions ; ce fait est **probable**, la page d'annonce renvoyant HTTP 403 au fetch (contenu reconstruit via index) et l'association à un événement précis restant **à vérifier**[^p6-56]. Sur l'adoption, le Stanford AI Index 2026 rapporte **66,3 %** de succès sur OSWorld (depuis ~12 % un an plus tôt), chiffre **confirmé** sur la source primaire HAI[^p6-57]. _Divergence à conserver_ : un blogue _computer-use_ avance **82 %** sur OSWorld — instantané et agent différents, à ne pas fusionner. Le volet souvent cité « ~89 % des implémentations d'agents (coût 150 k–800 k USD) n'atteignent jamais la production, la gouvernance étant la cause dominante » est corroboré par plusieurs secondaires mais **n'a pas été reconfirmé** sur la page primaire HAI : il demeure **probable** et ne peut servir d'argument normatif. De même, les enquêtes d'éditeurs (PwC : 79 % exécutent déjà des agents ; Deloitte : 25 % en 2025 → 50 % en 2027) restent **à vérifier** faute de sources primaires lisibles.

#### Questions ouvertes

- **Souveraineté du transport/auth MCP sur z/OS Connect.** Quel transport (_HTTP streamable_ / SSE / stdio) et quel modèle d'authentification la lignée 3.0 emploie-t-elle pour exposer ses outils _MCP_ ? Point critique pour la conformité, non confirmé (`docs.ibm.com` en 403) — vérifier via PDF du Knowledge Center ou client authentifié.
- **Statut GA des connecteurs.** Dans quel refresh exact de la lignée 3.0 (3.0.9x) la capacité « OpenAPI 3 → outils MCP » est-elle GA plutôt que _technology preview_, et quel release de CICS TS 6.x introduit le serveur MCP (au-delà de l'agent de détermination de problème requérant 6.3 + APAR PH68212) ?
- **Registre DORA.** Confirmer sur EUR-Lex/EBA l'échéance annuelle exacte de soumission du registre d'information (gabarit XBRL/XML) au titre de l'ITS 2024/2956 ; à vérifier en date de juin 2026.
- **Treasury FS AI RMF.** Confirmer le chiffre de 230 objectifs de contrôle et le mappage explicite aux fonctions/catégories du NIST AI RMF sur treasury.gov (actuellement **probable**).
- **Mapping E-23 / AMF ↔ opérateur τ.** L'articulation fine des obligations canadiennes (E-23 risque de modèle ; registre et cote de risque de l'AMF, **à confirmer** sur PDF primaire) vers les dimensions D‑Autorité/D‑Invariant relève du Ch. 15 ; reste à formaliser l'équivalence « cote de risque réglementaire ↔ seuil de bascule _t_fix</sub>(g) ».
- **Statut formel des invariants et de l'algèbre.** Les énoncés et statuts de I1, I2, I3, I5, les règles de l'algèbre d'héritage de garanties et le code Lean 4 du CIA doivent être repris du corpus mère pour fonder formellement le τ‑Refus comme disjoncteur ; I4 (Hypothèse) demeure une _Hypothèse_.
- **Drift réglementaire normatif d'agents.** Le concept de « _Monotonic Attenuation_ » d'autorité pour agents (`draft-araut-...`) et l'ensemble des _Internet-Drafts_ de délégation d'agents sont à re-vérifier à la date d'exécution (statut/expiration), aucun n'étant normatif en date de juin 2026.

[^p6-1]: Establishing Best Practices for Building Rigorous Agentic Benchmarks (ABC) — Zhu, Jin, Liang et al. (25 auteurs) — arXiv 2507.02825 — 2025-07-03 — <https://arxiv.org/abs/2507.02825>; HTML plein texte v1 (cas `tau`-bench-airline 38 %) — <https://arxiv.org/html/2507.02825v1>.
[^p6-2]: Idem — Zhu, Jin, Liang et al. — arXiv 2507.02825 — 2025-07-03. NB : venue NeurIPS 2025 **à confirmer** (non explicite dans le résumé ; arXiv classe cs.AI, v5 du 7 août 2025).
[^p6-3]: Towards a Science of AI Agent Reliability (4 dimensions, 12 métriques) — Rabanser, Kapoor, Kirgis, Liu, Utpala, Narayanan — Princeton HAL Lab — arXiv 2602.16666 (v1 2026-02-18, v3 2026-06-02) — <https://arxiv.org/abs/2602.16666>.
[^p6-4]: Lost in Simulation: LLM-Simulated Users are Unreliable Proxies for Human Users in Agentic Evaluations — arXiv 2601.17087 — 2026-01 — <https://arxiv.org/pdf/2601.17087>; **probable** — intitulé, auteurs et date à reconfirmer sur la page arXiv (non re-fetchée).
[^p6-5]: Beyond Accuracy: A Multi-Dimensional Framework for Evaluating Enterprise Agentic AI Systems (CLEAR) — Mehta — arXiv 2511.14136 — 2025-11-18 — <https://arxiv.org/html/2511.14136v1>; **probable** — préimpression à auteur unique, sans peer-review confirmée ; chiffres illustratifs, non normatifs, non re-vérifiés ligne à ligne.
[^p6-6]: Origine de `tau`-bench (appariement d'état vs GAIA) — caractérisation issue de A Survey on Evaluation of LLM-based Agents — arXiv 2503.16416 (revue, **secondaire**) — 2025-03 — <https://arxiv.org/html/2503.16416v2>; **probable** — la primaire ICLR 2025 (Yao et al.) reste à citer directement.
[^p6-7]: Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness (DFAH) — Raffi Khatchadourian — arXiv 2601.15322 — 2026-01-17 — <https://arxiv.org/abs/2601.15322>.
[^p6-8]: KIP-98 — Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging>; KIP-732 — Deprecate eos-alpha and replace eos-beta with eos-v2 (Kafka 3.0.0) — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-732:+Deprecate+eos-alpha+and+replace+eos-beta+with+eos-v2>.
[^p6-9]: Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — <https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/>.
[^p6-10]: Exactly-once Semantics is Possible: Here is How Apache Kafka Does It (limite aux effets de bord) — Confluent (Narkhede, Wang et al.) — 2025-03-01 — <https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/>.
[^p6-11]: Semantic conventions for generative AI metrics (7 Histograms) — OpenTelemetry — <https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-metrics/>; Semantic conventions for MCP — OpenTelemetry — <https://opentelemetry.io/docs/specs/semconv/gen-ai/mcp/>. Statut **Development** : conventions non stabilisées, sujettes à changement.
[^p6-12]: PROV-O: The PROV Ontology — W3C — 2013-04-30 — <https://www.w3.org/TR/prov-o/>; PROV-AGENT: Unified Provenance for Tracking AI Agent Interactions in Agentic Workflows — Souza et al. — arXiv / IEEE e-Science 2025 — 2025-08-04 — <https://arxiv.org/abs/2508.02866>.
[^p6-13]: OpenLineage — LF AI & Data (gradué 2023-07) — <https://lfaidata.foundation/projects/openlineage/> ; release 1.48.0 — <https://api.github.com/repos/OpenLineage/OpenLineage/releases/latest>.
[^p6-14]: The 2026 AI Index Report (66,3 % OSWorld) — Stanford HAI — 2026-04 — <https://hai.stanford.edu/ai-index/2026-ai-index-report>; chiffre « 89 % n'atteignent jamais la production » via analyse secondaire — Beri — <https://www.beri.net/article/stanford-ai-index-2026-agents-66-percent-success> ; **à confirmer** dans le corps du rapport primaire.
[^p6-15]: _Exactly-once Semantics is Possible: Here is How Apache Kafka Does It_ — Confluent — 2025-03-01 — <https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/>
[^p6-16]: _Exactly once support_ — IBM MQ 9.4.x Documentation — 2024 ; et _Integrating AI Into Apache Kafka Architectures: Patterns_ — Confluent — 2026-05-05 — <https://www.confluent.io/blog/ai-kafka-integration-patterns/>
[^p6-17]: _Syncpoints in IBM MQ for Multiplatforms_ — IBM MQ 9.3.x Documentation — 2024 ; _MQCMIT (Commit changes)_ — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.2.x?topic=i-mqcmit-commit-changes>
[^p6-18]: _Apache Kafka 4.3.0 Release Announcement_ — Apache Software Foundation — 2026-05-22 — <https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/>
[^p6-19]: _IBM MQ 9.4.5 Continuous Delivery releases are available_ — IBM Community (Ian Harwood, IBM Hursley) — 2026-01-30 — <https://community.ibm.com/community/user/blogs/ian-harwood1/2026/01/30/mq945ga>
[^p6-20]: _z/OS Connect 3.0.98 now available_ — IBM Community — 2025-10-21 — <https://community.ibm.com/community/user/blogs/shruthi-krishnan/2025/10/21/zos-connect-3098-now-available> ; _IBM/mcp-context-forge — MCP Gateway_ — IBM (GitHub) — 2026-05-26 — <https://github.com/IBM/mcp-context-forge>
[^p6-21]: _Releases — a2aproject/A2A_ — A2A Project / GitHub — 2026-05-28 — <https://github.com/a2aproject/A2A/releases> ; _Agntcy Documentation_ — AGNTCY (Linux Foundation) — 2026 — <https://docs.agntcy.org/>
[^p6-22]: _IBM MQ vs. Kafka vs. ActiveMQ: Comparing Message Brokers_ — OpenLogic (Perforce) — 2024 — <https://www.openlogic.com/blog/ibm-mq-vs-kafka-vs-activemq>
[^p6-23]: _Running the MQ source connector_ — IBM Event Automation / Event Streams — 2025 — <https://ibm.github.io/event-automation/es/connecting/mq/source/> ; _IBM MQ Source Connector for Confluent Platform — Overview_ — Confluent — 2025 — <https://docs.confluent.io/kafka-connectors/ibmmq-source/current/overview.html>
[^p6-24]: _Integrating AI Into Apache Kafka Architectures: Patterns_ — Confluent — 2026-05-05 — <https://www.confluent.io/blog/ai-kafka-integration-patterns/>
[^p6-25]: _Confused Deputy Attacks on Autonomous AI Agents_ — Cloud Security Alliance (AI Safety Initiative) — 2026-03-23 — <https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-confused-deputy-prompt-injection/>
[^p6-26]: _Understanding prompt injections: a frontier security challenge_ — OpenAI — 2025 — <https://openai.com/index/prompt-injections/> (date de page `à vérifier`, HTTP 403)
[^p6-27]: _Authorization (spécification 2025-11-25)_ — Model Context Protocol — 2025-11-25 — <https://modelcontextprotocol.io/specification/2025-11-25/basic/authorization>
[^p6-28]: _CVE-2025-49596 Detail_ — NVD / NIST — 2025-06-13 — <https://nvd.nist.gov/vuln/detail/CVE-2025-49596>
[^p6-29]: _The 2026-07-28 MCP Specification Release Candidate_ — Model Context Protocol Blog — 2026-05-21 — <https://blog.modelcontextprotocol.io/posts/2026-07-28-release-candidate/>
[^p6-30]: _Announcing Version 1.0 — A2A Protocol_ — A2A Project (Linux Foundation) — 2026-03 — <https://a2a-protocol.org/latest/announcing-1.0/>
[^p6-31]: _Linux Foundation Welcomes the AGNTCY Project_ — Linux Foundation — 2025-07-29 — <https://www.linuxfoundation.org/press/linux-foundation-welcomes-the-agntcy-project-to-standardize-open-multi-agent-system-infrastructure-and-break-down-ai-agent-silos>
[^p6-32]: _spiffe/spire Releases_ — SPIFFE / GitHub — 2026-05-28 — <https://github.com/spiffe/spire/releases>
[^p6-33]: _SPIFFE | X509-SVID specification_ — SPIFFE — 2026 — <https://spiffe.io/docs/latest/spiffe-specs/x509-svid/> ; _SPIFFE | JWT-SVID specification_ — SPIFFE — 2026 — <https://spiffe.io/docs/latest/spiffe-specs/jwt-svid/>
[^p6-34]: _draft-ietf-oauth-identity-chaining_ — IETF — 2026-06-04 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/>
[^p6-35]: _IETF WIMSE Working Group — Documents_ — IETF — 2026-06 — <https://datatracker.ietf.org/wg/wimse/documents/>
[^p6-36]: _draft-ietf-oauth-spiffe-client-auth-01_ — IETF — 2026-03-02 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-spiffe-client-auth/>
[^p6-37]: _cedar-policy/cedar-for-agents_ — GitHub (cedar-policy) — 2026 — <https://github.com/cedar-policy/cedar-for-agents>
[^p6-38]: _Semantic conventions for generative AI systems_ — OpenTelemetry — 2026 — <https://opentelemetry.io/docs/specs/semconv/gen-ai/>
[^p6-39]: _Release v1.41.1 — open-telemetry/semantic-conventions_ — OpenTelemetry / GitHub — 2026-05-11 — <https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.1>
[^p6-40]: _OpenLineage — LFAI & Data_ — Linux Foundation AI & Data — 2026 — <https://lfaidata.foundation/projects/openlineage/>
[^p6-41]: _PROV-DM: The PROV Data Model_ — W3C — 2013-04-30 — <https://www.w3.org/TR/prov-dm/> ; _PROV-AGENT_ — Souza et al. / IEEE e-Science 2025 — 2025-08-04 — <https://arxiv.org/abs/2508.02866>
[^p6-42]: _Article 50: Transparency Obligations_ — artificialintelligenceact.eu (Future of Life Institute) — 2026 — <https://artificialintelligenceact.eu/article/50/>
[^p6-43]: _MITRE ATT&CK and ATLAS Agentic Gap Analysis_ — Cloud Security Alliance — 2026-03-27 — <https://labs.cloudsecurityalliance.org/agentic/csa-research-note-atlas-agentic-gap-analysis-20260327/>
[^p6-44]: Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness for Tool-Using LLM Agents (DFAH) — Raffi Khatchadourian — arXiv:2601.15322, v2 — 2026-03-07 — <https://arxiv.org/abs/2601.15322>
[^p6-45]: z/OS Connect 3.0.98 now available — introduction du MCP (IBM Community, S. Krishnan) — 2025-10-21 — <https://community.ibm.com/community/user/blogs/shruthi-krishnan/2025/10/21/zos-connect-3098-now-available> ; PH70973 — z/OS Connect EE Unlimited CD update (3.0.103) — IBM Support — 2026-05 — <https://www.ibm.com/support/pages/ph70973-ibm-zos-connect-enterprise-edition-unlimited-continuous-delivery-update-30103-notices-and-information> ; How it works: the CICS MCP server — IBM Documentation — 2026 (403 au fetch, confirmé via index) — <https://www.ibm.com/docs/en/cics-ts/6.x?topic=ai-how-it-works-cics-mcp-server> ; IBM/ibmi-mcp-server (README + LICENSE Apache 2.0 ; badge « Stable » en juin 2026) — IBM (GitHub) — 2026 — <https://github.com/IBM/ibmi-mcp-server>
[^p6-46]: Beta Of MCP Server Opens Up IBM i For Agentic AI (cite verbatim « our intent is to deliver 500 tools in 2026 ») — IT Jungle (presse spécialisée) — 2025-10-27 — <https://www.itjungle.com/2025/10/27/beta-of-mcp-server-opens-up-ibm-i-for-agentic-ai/>
[^p6-47]: Digital Operational Resilience Act (DORA) — Règlement (UE) 2022/2554, application 17 janv. 2025 — EIOPA — 2025 — <https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en> ; Regulation (EU) 2022/2554 — texte consolidé — EUR-Lex — 2022-12 — <https://eur-lex.europa.eu/eli/reg/2022/2554/oj/eng>
[^p6-48]: Commission Implementing Regulation (EU) 2024/2956 — register of information — EUR-Lex — 2024-12 — <https://eur-lex.europa.eu/eli/reg_impl/2024/2956/oj/eng> ; Commission Delegated Regulation (EU) 2025/1190 — TLPT — EUR-Lex — 2025-06 — <https://eur-lex.europa.eu/eli/reg_del/2025/1190/oj/eng> ; Commission Delegated Regulation (EU) 2025/532 — subcontracting ICT services — EUR-Lex — 2025-07 — <https://eur-lex.europa.eu/eli/reg_del/2025/532/oj/eng>
[^p6-49]: Guideline E-23 — Model Risk Management (2027) — BSIF/OSFI — 2025-09-11 — <https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027>
[^p6-50]: Ligne directrice sur l'utilisation de l'intelligence artificielle — AMF — 2026-04 — <https://lautorite.qc.ca/en/professionals/insurers/guidelines/use-of-models/guideline-for-the-use-of-artificial-intelligence> ; Lignes directrices en matière d'IA et de gestion du risque lié aux tiers (communiqué) — AMF — 2026-04-07 — <https://lautorite.qc.ca/grand-public/salle-de-presse/actualites/fiche-dactualite/lignes-directrices-en-matiere-dintelligence-artificielle-et-de-gestion-du-risque-lie-aux-tiers>
[^p6-51]: Treasury Releases Two New Resources to Guide AI Use in the Financial Sector (sb0401) — U.S. Department of the Treasury — 2026-02-19 — <https://home.treasury.gov/news/press-releases/sb0401>
[^p6-52]: Agentic AI Governance for Financial Services: The CISO's Readiness Checklist (rappelle que SR 11-7 / FFIEC sont des primaires Fed/FFIEC) — ABT (secondaire) — 2026 — <https://www.myabt.com/blog/agentic-ai-governance-financial-services>
[^p6-53]: RFC 8693 — OAuth 2.0 Token Exchange — IETF — 2020-01 — <https://datatracker.ietf.org/doc/rfc8693/> ; draft-ietf-oauth-identity-chaining — IETF — 2026-06-04 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/>
[^p6-54]: Specifications — Eclipse Biscuit (Datalog, atténuation, append-only) — 2025 — <https://doc.biscuitsec.org/reference/specifications.html> ; Cedar (Extended Version), arXiv:2403.04651 (Rust + Lean) — 2024-03-07 — <https://arxiv.org/abs/2403.04651>
[^p6-55]: draft-araut-oauth-transaction-tokens-for-agents-02 (individuel ; agentic_ctx + Monotonic Attenuation) — IETF Datatracker — 2026-05-22 — <https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/>
[^p6-56]: Revolutionizing AI Agent management with IBM watsonx Orchestrate new Observability and Governance capabilities (403 au fetch, contenu via recherche) — IBM — 2026-05 — <https://www.ibm.com/new/announcements/revolutionizing-ai-agent-management-with-ibm-watsonx-orchestrate-new-observability-and-governance-capabilities>
[^p6-57]: The 2026 AI Index Report (66,3 % OSWorld ; ~423 pages) — Stanford HAI — 2026-04 — <https://hai.stanford.edu/ai-index/2026-ai-index-report>

## PARTIE VII — Perspectives

### Ch. 20 — Limites, angles morts et programme de recherche 2027–2030

_Insight-clé._ La thèse de cette monographie — le couplage des déterministe→probabiliste, syntaxique→sémantique, composition→délégation, arbitré par l'opérateur τ qui déplace _t_fix</sub>(g) sans altérer la grandeur — est **à ce jour partiellement étayée et largement non falsifiée**, ce qui est un statut épistémique honorable mais pas un acquis. Trois dettes structurent l'horizon 2027–2030 : (1) une _dette de formalisation_ (les énoncés précis de I1 (?)–I5 (?), l'algèbre d'héritage de garanties et la mécanisation Lean 4 du CIA restent à reprendre du corpus mère, non à réinventer) ; (2) une _dette empirique_, dont la levée de I4 (Hypothèse) est le cas critique, sur fond de _crise de validité_ de la métrologie agentique où un agent trivial obtient 38 % sur un banc de référence[^p7-1] ; (3) une _dette de terrain mouvant_, car le paysage normatif et protocolaire dont dépend l'instanciation de l'opérateur τ se reconfigure plus vite que ne se stabilise la théorie. Ce chapitre n'invente aucun contenu formel manquant : il le nomme comme cible de travail et le situe dans un calendrier réfutable.

#### 20.1 — Le statut épistémique réel : ce qui est établi, ce qui est mouvant

_Insight._ Distinguer le _savoir établi_ du _terrain mouvant_ est la première discipline de ce bilan : la confusion des deux est l'angle mort le plus coûteux d'une monographie de niveau doctoral.

Sur le versant _établi_ (en date de juin 2026), trois acquis tiennent indépendamment de la fortune du CIA. D'abord, la _non-corrélation détectable_ entre déterminisme de décision et exactitude de tâche : le harnais DFAH mesure séparément déterminisme de trajectoire, déterminisme de décision (sorties stables à entrées identiques rejouées) et fidélité conditionnée à l'évidence, et conclut que déterminisme et exactitude _ne sont pas détectablement corrélés_[^p7-2]. Ce résultat _corrobore_ le geste fondateur de l'opérateur τ — séparer le régime déterministe (garantie de message) du régime probabiliste (agent _LLM_) plutôt que de les confondre dans une métrique unique d'exactitude. Ensuite, la _crise de validité_ des bancs : 7/10 violent la validité de tâche, 7/10 la validité de résultat, 80 % n'admettent aucune faiblesse de conception[^p7-3]. Enfin, la _multidimensionnalité de la fiabilité_ : l'exactitude seule corrèle faiblement avec le succès en déploiement, ce qu'objectivent un profil à quatre dimensions et douze métriques (_consistency, robustness, predictability, safety_)[^p7-4] et, de façon _probable_ seulement (préimpression à auteur unique, sans _peer-review_), le cadre CLEAR[^p7-5].

Sur le versant _mouvant_, la liste est plus longue et c'est précisément l'aveu qui fait défaut à la plupart des cadres concurrents. Le tableau 20.1 trie les énoncés par _niveau de preuve_, conformément à la note transversale du dossier qui interdit aux secondaires et aux préimpressions non revues de soutenir une affirmation normative.


***Tableau — Tableau 20.1 — Tri des énoncés par niveau de preuve : ce qui peut soutenir une affirmation normative et ce qui ne le peut pas.***

| **Énoncé** | **Niveau de preuve (juin 2026)** | **Statut** | **Condition de bascule** |
| --- | --- | --- | --- |
| Déterminisme ≠ exactitude (DFAH) | Préimpression arXiv, HTML vérifié | _confirmé_ | Réfutation = corrélation détectée sur banc indépendant |
| Crise de validité (audit ABC) | Préimpression 25 auteurs, HTML vérifié | _confirmé_ | Venue NeurIPS 2025 à confirmer |
| Fiabilité = 4 dim. / 12 métriques | Princeton HAL, résumé vérifié | _confirmé_ | Normes aviation/nucléaire nominatives à vérifier dans le corps du PDF |
| CLEAR (`rho approx 0,83` vs `0,41`) | Préimpression auteur unique | _probable_ | Obtenir une _peer-review_ |
| Proxys utilisateurs simulés non fiables | Intitulé à reconfirmer | _probable_ | Confirmer arXiv 2601.17087 |
| Enquêtes d'adoption (79 % PwC ; 25 %→50 % Deloitte) | Secondaires (agrégateurs) | _à vérifier_ | Retrouver les rapports primaires |



_Divergence conservée (non lissée)._ Sur l'indicateur OSWorld, le rapport primaire Stanford HAI rapporte 66,3 % de succès[^p7-6] là où un blogue _computer-use_ avance 82 % : instantanés et agents distincts, à _ne pas fusionner_. De même, le volet « ~89 % des implémentations n'atteignent jamais la production (coût 150 k–800 k USD), la gouvernance étant la cause dominante » reste _probable_ — corroboré par plusieurs secondaires mais non reconfirmé sur la page primaire HAI. Cet écart entre capacité brute (succès au banc) et déploiement effectif (gouvernance) est l'observation empirique qui _motive_ le plus directement la frontière τ‑Refus de l'opérateur τ : une grande part de l'échec en production n'est pas un échec de capacité mais un défaut d'arbitrage de l'autorité et des invariants.

#### 20.2 — La dette de formalisation : ce qui doit être repris du corpus mère

_Insight._ Le cœur formel du CIA — énoncés des invariants, règles de l'algèbre, preuves Lean 4 — n'est _pas_ reproduit ici par discipline anti-fabrication (§10) ; il constitue la première charge de travail 2027–2028, sous forme de _reprise fidèle_, jamais de réinvention.

L'opérateur τ et le CIA ne valent comme _contribution scientifique_ que si leur noyau formel est exposé, et non simplement invoqué. Quatre objets sont actuellement renvoyés au corpus mère et doivent y être réconciliés (la définition canonique complète de l'opérateur τ demeure au chap. III.8 du corpus, auquel cette monographie _réfère_ sans le dupliquer, §11).


> ⟢ ***À reprendre du corpus mère*** — Énoncés précis et statuts de I1 (?), I2 (?), I3 (?), I5 (?). Le dossier de recherche n'en fournit ni la formulation ni le statut ; seuls le gabarit de statut (_Confirmé_ | _Hypothèse_ | _Réfuté_) et le cas I4 (Hypothèse) sont connus. À reprendre verbatim du corpus mère, avec leur condition de réfutation respective.



> ⟢ ***À reprendre du corpus mère*** — Règles précises de l'_algèbre d'héritage de garanties_ du CIA (composition des garanties déterministes Kafka/MQ avec le comportement probabiliste d'agents _LLM_ ; sémantique opérationnelle ; types de session probabilistes / tolérants au _drift_). Analogie directrice `M(pi)` / π-calcul. Aucune règle, signature ou jugement de typage n'est fourni par le dossier — ne rien fabriquer ; reprendre du corpus mère.



> ⟢ ***À reprendre du corpus mère*** — Mécanisation _Lean 4_ du CIA : énoncés des théorèmes, code et statut de preuve. Aucun extrait Lean n'est disponible dans le dossier de recherche. À reprendre du corpus mère ; ne pas reconstituer de listing.


La forme — non le contenu — de cette dette se laisse néanmoins esquisser sans rien fabriquer. La table 20.2 cartographie _où_ chaque objet formel manquant devra s'insérer et _contre quoi_ le mécaniser, en s'appuyant sur le fait, _établi_ dans la littérature, que la méta-théorie des types de session multipartites est désormais mécanisée (Coq/Rocq, ECOOP 2025[^p7-7]) et que des types de session _probabilistes_ existent (PACMPL/PLDI 2025[^p7-8]) ainsi qu'une coordination d'agents _LLM_ vérifiée en Lean 4 via _message sequence charts_[^p7-9]. Le CIA ne part donc pas d'un vide théorique : il a des voisins mécanisés contre lesquels se mesurer.


***Tableau — Tableau 20.2 — Carte de la dette de formalisation : insertion canonique et voisins mécanisés servant de substrat de vérification. Aucun énoncé formel n'est ici reconstitué.***

| **Objet formel (à reprendre)** | **Point d'insertion canonique** | **Substrat de vérification disponible (établi)** |
| --- | --- | --- |
| Énoncés I1 (?)–I5 (?) | Chapitres du corpus mère + Partie II ici | Statut réfutable obligatoire (§4) ; I4 (Hypothèse) reste _Hypothèse_ |
| Algèbre d'héritage de garanties | Ch. 6 (Partie II) — CIA | Types de session probabilistes (PLDI 2025) ; `M(pi)`/π-calcul |
| Sémantique de l'opérateur τ / _t_fix</sub>(g) | Ch. III.8 du corpus (réf. seule) | Implémentabilité MPST décidable (ECOOP 2023)[^p7-10] |
| Mécanisation Lean 4 du CIA | Banc formel du corpus | Méta-théorie MPST en Rocq (ECOOP 2025) ; coordination Lean 4 (MSC, 2026) |



#### 20.3 — La dette empirique : lever I4 (Hypothèse) et survivre à la crise de validité

_Insight._ Lever I4 (Hypothèse) — actuellement _Hypothèse_ faute de campagne empirique concluante — exige plus qu'un banc favorable : il faut un protocole _immunisé_ contre les défauts de validité documentés, sous peine de produire une confirmation illusoire du type « agent trivial à 38 % ».

Le statut de I4 (Hypothèse) est le verrou empirique du programme. Le changer en _Confirmé_ ou _Réfuté_ exige, par discipline (§9), une justification empirique citée et une entrée ADR ; or l'instrument de cette justification — la mesure sur banc — est lui-même en crise. Trois pièges documentés conditionnent tout protocole de levée : la _validité de tâche_ (des tâches impossibles comptées comme réussies — le cas _`tau`-bench-airline_ où un agent renvoyant des réponses vides atteint 38 % et _surpasse_ un agent fondé sur GPT-4o), la _validité de résultat_ (sur-estimation de KernelBench de +31 % faute de _fuzz testing_ exhaustif), et la _non-fiabilité des proxys_ utilisateurs simulés par _LLM_ comme substituts d'utilisateurs humains[^p7-11]. La campagne de validation de l'opérateur τ devra donc s'auto-appliquer l'_Agentic Benchmark Checklist_ (ABC), qui réduit par exemple la sur-estimation de CVE-Bench de 33 %.

Le banc empirique du CIA est _AgentMeshKafka_, et le kernel exécutable de l'opérateur τ est _TauGo_ (Go). L'ancrage de la mesure sur Kafka est _établi_ : la sémantique _exactly-once_ côté serveur est activable depuis Kafka 4.0 et documentée en 4.1[^p7-12], avec la défense transactionnelle côté serveur KIP-890 approuvée[^p7-13] ; la participation au _2PC_ (KIP-939) est acceptée[^p7-14]. Le régime déterministe que l'opérateur τ présuppose côté garantie de message est donc une cible stable. Le schéma ci-dessous fixe le contrat de mesure minimal que la campagne devra instrumenter — il décrit un _protocole d'évaluation_, non une règle formelle de l'algèbre (laquelle reste en encadré ci‑dessus ci-dessus).

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


> ⟢ ***À reprendre du corpus mère*** — Énoncé exact de I4 (Hypothèse) et sa _condition de réfutation_ (champ `condition_refutation_I4` ci-dessus). Le dossier indique seulement que I4 (Hypothèse) est _Hypothèse_ (campagne empirique non concluante) ; il ne donne pas le prédicat à tester. À reprendre du corpus mère avant toute campagne — sans quoi la mesure n'a pas de cible falsifiable.


#### 20.4 — Angles morts de terrain mouvant : l'instanciation dépend d'un sol instable

_Insight._ L'opérateur τ dispatche entre régimes en fonction de D‑Sens, D‑Autorité et D‑Invariant ; or les deux dernières dimensions sont câblées à des standards d'_identité_, de _délégation_ et de _gouvernance_ qui sont, en juin 2026, des _drafts_ actifs et des règlements en cours d'amendement. C'est l'angle mort le plus susceptible de périmer le chapitre.

La dimension D‑Autorité — « autorité appelant × autorité requise cible » — repose sur une infrastructure d'identité de charge de travail et de délégation qui n'est pas stabilisée. Le groupe IETF WIMSE produit un jeu de _drafts_ actifs (architecture, _workload credentials_, _workload proof token_) tous datés du premier semestre 2026[^p7-15] ; côté délégation, `draft-ietf-oauth-identity-chaining` est en cours de processus IESG[^p7-16], tandis que des _drafts_ spécifiquement agentiques divergent (l'un, `draft-oauth-ai-agents-on-behalf-of-user`, a _expiré_ et ne doit _pas_ être cité comme normatif[^p7-17]). La dimension D‑Invariant, elle, dépend de l'auditabilité réglementaire, dont le cadre se densifie mais reste en partie _à vérifier_ : DORA est en application depuis le 17 janvier 2025[^p7-18], mais le numéro exact de l'ITS du registre d'information (art. 28) provient d'une source secondaire non encore confirmée sur EUR-Lex ; le FS AI RMF du Treasury (matrice de _230 objectifs de contrôle_, chiffre _probable_) est _soft law_[^p7-19] ; et l'AI Act européen voit ses échéances _reportées_ par l'accord Omnibus (décalage de 4 mois)[^p7-20]. Enfin, le profil d'interopérabilité des agents du NIST n'est attendu qu'au _Q4 2026_[^p7-21] : le référentiel même contre lequel l'interopérabilité agentique d'entreprise devra se mesurer n'existe pas encore en version stable.

Conséquence directrice : toute affirmation de cette monographie sur l'instanciation de D‑Autorité et D‑Invariant est _horodatée à juin 2026_ et doit être re-vérifiée à l'exécution (§10). Le couplage des trois ruptures, lui, est conceptuel et ne périme pas ; son _ancrage protocolaire_, si.

#### 20.5 — Programme de recherche 2027–2030

_Insight._ Le programme se lit comme une séquence de _bascules de statut_ réfutables : chaque jalon est défini par l'invariant ou la dette qu'il fait passer d'un état à un autre, jamais par une intention vague.


***Tableau — Tableau 20.3 — Programme 2027–2030 par bascules de statut réfutables. Les jalons formels (2027–2028) sont des _reprises_ du corpus mère, non des inventions.***

| **Horizon** | **Cible** | **Critère de succès (réfutable)** | **Dépendance de terrain mouvant** |
| --- | --- | --- | --- |
| 2027 | Reprise formelle du noyau | Énoncés I1 (?)–I5 (?) + algèbre exposés ici, réconciliés au corpus (§11) | — |
| 2027–2028 | Mécanisation Lean 4 du CIA | Théorèmes du corpus rejoués/étendus ; preuve compilée | Voisins Rocq/Lean 4 (établis) |
| 2028 | Lever I4 (Hypothèse) | I4 (Hypothèse) : _Hypothèse_ → _Confirmé_ ou _Réfuté_ ; campagne ABC-conforme sur AgentMeshKafka/TauGo + ADR | Kafka exactly-once (stable) |
| 2028–2029 | Métrologie de l'opérateur τ | D‑Sens, D‑Autorité, D‑Invariant mesurées _indépendamment_ (pas d'exactitude agrégée) | Profil d'interop. NIST (Q4 2026) |
| 2029–2030 | Ancrage protocolaire stabilisé | D‑Autorité câblée sur un standard _publié_ (post-draft) de délégation | WIMSE / OAuth identity-chaining (_drafts_) |
| 2027–2030 | Validité externe | Substituer aux proxys _LLM_ des traces réelles ; reproductibilité inter-exécutions | Science de la fiabilité (4 dim.) |



Deux principes gouvernent ce calendrier. D'abord, l'_ordre est contraint_ : on ne peut lever I4 (Hypothèse) (2028) avant d'avoir repris son énoncé exact (2027), ni mécaniser une algèbre dont les règles ne sont pas exposées. Ensuite, les jalons _2029–2030_ sont délibérément subordonnés à des standards aujourd'hui en _draft_ ou attendus : il serait malhonnête de les présenter comme planifiables avec certitude, et le programme les marque comme _probables_ sous condition de stabilisation du sol normatif.

#### Questions ouvertes

_Formelles (à reprendre du corpus mère, non à fabriquer)._
- Énoncés précis et statuts de I1 (?), I2 (?), I3 (?), I5 (?), avec leurs conditions de réfutation respectives.
- Règles de l'algèbre d'héritage de garanties du CIA, types de session probabilistes / tolérants au _drift_, et sémantique opérationnelle de l'opérateur τ (chap. III.8 du corpus, réf. seule).
- Théorèmes et code de la mécanisation Lean 4 du CIA ; énoncé exact de I4 (Hypothèse) et son prédicat de réfutation.

_Empiriques (terrain en crise de validité)._
- Un protocole de levée de I4 (Hypothèse) sur _AgentMeshKafka_ / _TauGo_ est-il _immunisé_ contre les défauts ABC (faux-positifs type 38 %, sur-estimation type KernelBench +31 %) ? — _à vérifier_ par auto-application de l'ABC.
- Les normes nominatives aviation/nucléaire (ARP4754A, IEC 61513, ISO 26262) sont-elles réellement mobilisées par la « science de la fiabilité », ou seulement « _grounded in safety-critical engineering_ » ? — _à vérifier_ dans le corps du PDF Princeton HAL.
- Le statut _peer-review_ de CLEAR et l'intitulé exact de « Lost in Simulation » (arXiv 2601.17087) restent _à confirmer_ ; le volet « ~89 % jamais en production » est _probable_, non reconfirmé sur la primaire HAI.

_Terrain mouvant (horodaté juin 2026)._
- Numéro EUR-Lex exact de l'ITS du registre DORA (art. 28) et chiffre des 230 objectifs de contrôle du FS AI RMF — _à vérifier_ sur sources primaires (EUR-Lex, treasury.gov).
- Quel standard de délégation (WIMSE, `oauth-identity-chaining`) atteindra une publication stable d'ici 2030 pour ancrer D‑Autorité, et le profil d'interopérabilité des agents du NIST (attendu _Q4 2026_) fournira-t-il le référentiel manquant pour D‑Invariant ?
- DIVERGENCE non lissée à surveiller : OSWorld 66,3 % (HAI primaire) vs 82 % (blogue _computer-use_) — instantanés distincts, à ne pas fusionner dans une métrique de progrès unique.

[^p7-1]: Establishing Best Practices for Building Rigorous Agentic Benchmarks (HTML plein texte v1 ; cas `tau`-bench-airline 38 %) — arXiv — 2025-07 — <https://arxiv.org/html/2507.02825v1>
[^p7-2]: Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness for Tool-Using LLM Agents (DFAH) — Raffi Khatchadourian — arXiv (préprint) — 2026-01-17 — <https://arxiv.org/abs/2601.15322>
[^p7-3]: idem arXiv 2507.02825 ; venue NeurIPS 2025 à confirmer.
[^p7-4]: Towards a Science of AI Agent Reliability (4 dimensions, 12 métriques ; normes nominatives à vérifier) — Rabanser, Kapoor, Kirgis, Liu, Utpala, Narayanan — Princeton HAL Lab — 2026-02-18 — <https://arxiv.org/abs/2602.16666>
[^p7-5]: Beyond Accuracy: A Multi-Dimensional Framework for Evaluating Enterprise Agentic AI Systems (CLEAR) — Mehta — arXiv (préprint, auteur indépendant) — 2025-11-18 — <https://arxiv.org/html/2511.14136v1>
[^p7-6]: The 2026 AI Index Report (66,3 % OSWorld ; volet « 89 %/coût » à confirmer dans le corps) — Stanford HAI (primaire) — 2026-04 — <https://hai.stanford.edu/ai-index/2026-ai-index-report>
[^p7-7]: Multiparty Asynchronous Session Types: A Mechanised Proof of Subject Reduction (ECOOP 2025) — Schloss Dagstuhl — LIPIcs — 2025-06-25 — <https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.31>
[^p7-8]: Probabilistic Refinement Session Types — CrossRef (PACMPL 9(PLDI):1666-1691) — ACM — 2025-06-10 — <https://api.crossref.org/works/10.1145/3729317>
[^p7-9]: Provable Coordination for LLM Agents via Message Sequence Charts (v2, Lean 4) — arXiv — 2026-04-29 — <https://arxiv.org/abs/2604.17612>
[^p7-10]: Asynchronous Multiparty Session Type Implementability is Decidable — Lessons Learned from Message Sequence Charts (ECOOP 2023) — Schloss Dagstuhl — LIPIcs — 2023-07-11 — <https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2023.32>
[^p7-11]: Lost in Simulation: LLM-Simulated Users are Unreliable Proxies for Human Users in Agentic Evaluations (intitulé à reconfirmer) — arXiv — 2026-01 — <https://arxiv.org/pdf/2601.17087>
[^p7-12]: Transaction Protocol (doc officielle 4.1 — activation serveur depuis 4.0) — Apache Software Foundation — 2025-09-04 — <https://kafka.apache.org/41/operations/transaction-protocol/>
[^p7-13]: KIP-890: Transactions Server-Side Defense (Approved) — Apache Software Foundation — 2025 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-890:+Transactions+Server-Side+Defense>
[^p7-14]: KIP-939: Support Participation in 2PC (Accepted) — Apache Software Foundation — 2024 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC>
[^p7-15]: draft-ietf-wimse-workload-creds — WIMSE Workload Credentials — IETF — 2026-05-05 — <https://datatracker.ietf.org/doc/draft-ietf-wimse-workload-creds/>
[^p7-16]: draft-ietf-oauth-identity-chaining — OAuth Identity and Authorization Chaining Across Domains — IETF — 2026-06-04 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/>
[^p7-17]: draft-oauth-ai-agents-on-behalf-of-user (EXPIRÉ & archivé — ne pas citer comme normatif) — IETF Datatracker — 2026-02-26 — <https://datatracker.ietf.org/doc/draft-oauth-ai-agents-on-behalf-of-user/>
[^p7-18]: Digital Operational Resilience Act (DORA) — Règlement (UE) 2022/2554, application 17 janv. 2025 — EIOPA — 2025 — <https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en>
[^p7-19]: Treasury Releases Two New Resources to Guide AI Use in the Financial Sector (FS AI RMF + AI Lexicon) — U.S. Department of the Treasury — 2026-02-19 — <https://home.treasury.gov/news/press-releases/sb0401>
[^p7-20]: Artificial Intelligence: Council and Parliament agree to simplify and streamline rules (Omnibus) — Conseil de l'Union européenne — 2026-05-07 — <https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/>
[^p7-21]: NIST AI Risk Management Framework: Agentic Profile (draft, Tier 1–4) — Cloud Security Alliance — 2026-03-27 — <https://labs.cloudsecurityalliance.org/agentic/agentic-nist-ai-rmf-profile-v1/>
