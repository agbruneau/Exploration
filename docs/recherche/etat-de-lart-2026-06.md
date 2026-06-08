# Dossier d'état de l'art — L'Interopérabilité Agentique en Entreprise

> **Arrêté au :** 8 juin 2026 (`asOf = 2026-06-08`) · **Langue :** fr-CA · **Auteur :** André-Guy Bruneau, M.Sc. · **Co-auteur :** Claude (Anthropic)
> **Statut :** base probante vérifiée, destinée à nourrir la rédaction des chapitres empiriques (Parties III–V) de la monographie.

---

## Avertissement de portée — à lire avant usage

Ce dossier couvre **exclusivement le terrain empirique et normatif** (protocoles, substrats, identité, autorité déléguée, observabilité, conformité, modèles conceptuels d'interopérabilité), c'est-à-dire ce qui doit être **re-vérifié et daté à la date d'exécution**. Il **ne contient pas** le noyau théorique de la monographie — l'opérateur **τ (tau)**, le **Calcul d'Intégration Agentique (CIA)**, les **invariants réfutables I1–I5** (dont **I4 = Hypothèse**), la **thèse des trois ruptures couplées** — qui provient du **corpus mère** `InteroperabiliteAgentique` et fait foi via `CLAUDE.md` §2. Ces constructions **ne doivent pas être réinventées** à partir de ce dossier ; elles l'**encadrent**.

## Méthodologie de production

- **16 angles de recherche** (un par grappe de chapitres), chacun confié à un agent : `WebSearch` pour cartographier, puis `WebFetch` sur les **sources primaires** (IETF, W3C, NIST/NCCoE, CNCF, Apache, IBM, Microsoft, Anthropic, Google, Linux Foundation, *peer-reviewed*) pour préciser versions, dates, numéros de *drafts* et statuts.
- **Vérification adversariale à 3 voix** : pour chaque fait à haut enjeu (version / date / n° de *draft* / échéance réglementaire / statut de maturité), trois sceptiques indépendants (lentilles : exactitude factuelle ; actualité/maturité ; primauté des sources) ont tenté de le **réfuter**. Règle : **≥ 2/3 réfutations ⇒ fait rétrogradé `à vérifier`** (jamais supprimé en silence).
- **Bilan quantitatif :** 339 faits collectés ; **2 rétrogradés `à vérifier`** après réfutation ; 305 sources uniques (dédupliquées par URL).

## Comment lire ce dossier

- **Marqueurs d'incertitude** par fait : `confirmé` (source primaire au texte intégral) · `probable` · `hypothèse` · `à vérifier` (non confirmé ou réfuté — **piste de vérification fournie, ne pas affirmer tel quel**).
- **Verdict adversarial** : *tenu (survécu à 3 sceptiques)* ou *réfuté/à vérifier*.
- Les appels `[n]` renvoient à la **liste de sources locale à chaque partie** (en fin de section). Un **index bibliographique global dédupliqué** figure en annexe.
- Les **divergences** entre sources sont signalées, non lissées.

---


# PARTIE I — Cadre conceptuel et héritage des patrons d'intégration

> Dossier d'état de l'art, arrêté au **8 juin 2026** (`asOf=2026-06-08`). Sources primaires (texte intégral des PDF) prioritaires. Chaque fait porte un marqueur d'incertitude (`confirmé` | `probable` | `hypothèse` | `à vérifier`) et un appel `[n]` vers la liste numérotée finale. Les claims rétrogradés à `à vérifier` sont **présentés comme tels**, jamais comme acquis.

---

## Ch. 1 — Le LCIM (Levels of Conceptual Interoperability Model) : généalogie, niveaux, et la frontière interopérabilité ≠ intégration

### 1.1 Insight-clé (pyramide inversée)

**Le LCIM *original* de 2003 ne comporte PAS la forme canonique « 0-6 nommée » (None/Technical/Syntactic/Semantic/Pragmatic/Dynamic/Conceptual) que la littérature secondaire lui prête presque universellement.** La vérification par source primaire (texte intégral du PDF) établit que Tolk & Muguira (2003) définissent **explicitement cinq niveaux L0-L4 à dénomination centrée-données** ; la forme 0-6 nommée est une **élaboration postérieure**, attestée *verbatim* au plus tard en **2007** (Tolk, Diallo & Turnitsa). Corollaire de fond pour la monographie : la distinction normative entre **interopérabilité** (échange où le *sens* est préservé) et **simple intégration/connectivité** est précisément la raison d'être du LCIM, et elle est confirmée par les sources primaires de 2003 et 2007. `confirmé`

### 1.2 Faits datés et cités

**F1.1 — Origine et paternité (2003).** Le LCIM a été introduit par **Andreas Tolk et James A. Muguira** (VMASC/Old Dominion University) dans *The Levels of Conceptual Interoperability Model*, **2003 Fall Simulation Interoperability Workshop (SIW)**, Orlando, septembre 2003, paper **03F-SIW-007** (11 p.). Auteurs, affiliation, lieu et titre confirmés *verbatim* sur la page de titre du PDF intégral. `confirmé` [1] — *verdict adversarial : tenu (survécu à 3 sceptiques).*

**F1.2 — Cinq niveaux data-centric en 2003 (correction majeure).** Le texte de 2003 dit textuellement : *« Similar to the technical approaches, five levels of interoperability are defined. »* Les niveaux sont : **L0 System Specific Data** (« No interoperability… black box ») ; **L1 Documented Data** (« common protocol… black box with an interface ») ; **L2 Aligned Static Data** (« common reference model ») ; **L3 Aligned Dynamic Data** (« standard software engineering methods such as UML ») ; **L4 Harmonized Data (and Processes)** (« semantic connections… conceptual model »). Le texte de 2003 **ne contient ni « seven levels », ni L5/L6, ni les étiquettes Technical/Syntactic/Semantic/Pragmatic/Dynamic** comme noms de niveaux. Ce claim passe de « probable » à **`confirmé`** par source primaire [1] — *verdict adversarial : tenu.*

**F1.3 — Forme canonique 0-6 nommée (attestée dès 2007).** La forme canonique 0-6 est attestée *verbatim* dès **2007** dans Tolk, Diallo & Turnitsa (*Journal of Systemics, Cybernetics and Informatics*, Vol. 5 No 5, ISSN 1690-4524) — Figure 1 et descriptions : **L0 None** (« stand-alone systems ») ; **L1 Technical** (« exchange bits and bytes… networks and protocols unambiguously defined ») ; **L2 Syntactic** (« common structure… common data format ») ; **L3 Semantic** (« content of information exchange requests unambiguously defined ») ; **L4 Pragmatic** (« aware of the methods and procedures… context of use ») ; **L5 Dynamic** (« comprehend the state changes… assumptions and constraints over time ») ; **L6 Conceptual**. Le papier 2009 (Wang, Tolk & Wang, SpringSim'09, San Diego) réaffirme : *« The seven levels from no interoperability to conceptual interoperability are notated from L0 to L6. »* `confirmé` [2][3] — *verdict adversarial : tenu.*

**F1.4 — Lignée d'évolution et attributions.** L'évolution de 5 niveaux data-centric (2003) vers 7 niveaux nommés 0-6 est portée par une lignée postérieure : forme 0-6 établie **au plus tard en 2007** (Tolk/Diallo/Turnitsa, fetch primaire) ; **Tolk, Turnitsa, Diallo & Winters (2006)**, *Composable M&S Web services for net-centric applications*, JDMS 3(1):27-44, **confirmé comme référence citée** dans le papier 2009 [réf. 18] et 2007 [réf. 21]. **Turnitsa (2005)**, *Extending the LCIM*, IEEE Summer Computer Simulation Conference (SCSC) — **`probable`** (confirmé par recherche, **non** par fetch primaire). Le papier 2009 cite aussi Tolk/Turnitsa/Diallo (2008), *Implied ontological representation within the LCIM*, Intelligent Decision Technologies 2:3-19. `probable` [2][3][5] — *verdict adversarial : tenu.*

**F1.5 — Le triplet integratability / interoperability / composability (correction de date).** Le triplet est mappé sur le LCIM dans Tolk, Diallo & Turnitsa (**2007**, et non « 2011 »). Mapping *verbatim* (Figure 1, axe de droite) : **Modeling/Abstraction** ↔ composability ; **Simulation/Implementation** ↔ interoperability ; **Network/Connectivity** ↔ integratability. Origine de l'idée **créditée à « Page et al. »** : *« Page et al. introduced the idea to differentiate between technical layers for integratability, implementation layers for interoperability, and modeling layers for composability. »* Le terme **« integratability » est ABSENT des papiers 2003 et 2009** : le triplet est une élaboration de 2006-2007, **pas** un trait du LCIM de 2003. Le lien `digitalcommons.odu.edu` (métadonnée « 2011 ») n'est qu'un **miroir de dépôt** ; la publication originale est 2007. `confirmé` [2][4]

**F1.6 — La formule « realm of the model… » (rétrogradée).** La formule souvent citée — *« composability is the realm of the model, interoperability is the realm of the software implementation of the model, integratability addresses the hardware/configuration side of connectivity »* — **n'a PAS été trouvée *verbatim*** dans le papier primaire 2007 (qui exprime l'idée via « Modeling/Simulation/Network » + attribution à Page et al., sans le phrasage « realm »). **Statut : `à vérifier`.** Piste : Tolk, A. (ed.), *Engineering Principles of Combat Modeling and Distributed Simulation* (Wiley, 2012), ou publications Diallo/Tolk 2010-2013. **Ne pas attribuer ce phrasage exact sans vérification.** `à vérifier` [2][6]

**F1.7 — Frontière normative interopérabilité ≠ intégration.** Confirmée par la littérature LCIM primaire : l'interopérabilité (échange où le **sens** est préservé — L2-L6, semantique/pragmatique/dynamique/conceptuel) est distincte de la simple intégration/connectivité technique (integratability = couche Network/Connectivity, L0-L1). Le papier 2007 fonde le modèle sur ce constat : *« meaningful interoperability requires much more than technical layers »* ; le papier 2003 l'énonce dès l'abstract (*« Interoperability of systems is not a cookie-cutter-function… »*). **Confondre « octets qui transitent » et « sens partagé » est l'anti-patron central que le LCIM existe pour dissiper.** `confirmé` [1][2]

### 1.3 Tableau comparatif — LCIM 2003 (original) vs forme canonique 0-6 (≥ 2007)

| Niveau | LCIM **2003** (Tolk & Muguira) — *data-centric* [1] | LCIM **canonique ≥ 2007** (Tolk/Diallo/Turnitsa) — *nommé* [2] |
|---|---|---|
| L0 | **System Specific Data** (no interop., black box) | **None** (stand-alone systems) |
| L1 | **Documented Data** (common protocol, black box + interface) | **Technical** (bits and bytes ; protocols defined) |
| L2 | **Aligned Static Data** (common reference model) | **Syntactic** (common structure / data format) |
| L3 | **Aligned Dynamic Data** (UML, std SW eng.) | **Semantic** (content of exchange unambiguous) |
| L4 | **Harmonized Data (and Processes)** (semantic connections, conceptual model) | **Pragmatic** (methods/procedures, context of use) |
| L5 | — (absent en 2003) | **Dynamic** (state changes ; assumptions/constraints over time) |
| L6 | — (absent en 2003) | **Conceptual** |
| **Nb niveaux** | **5 (L0-L4)** `confirmé` | **7 (L0-L6)** `confirmé` |
| **Triplet I/I/C** | absent (« integratability » non présent) | présent ; origine « Page et al. » (Modeling/Simulation/Network) |

### 1.4 Divergences signalées (Ch. 1)

- **D1.1** — Attribuer la forme « 0-6 nommée » à la publication de **2003** est une **erreur courante** de la littérature secondaire. Source primaire : 2003 = 5 niveaux L0-L4 data-centric ; 0-6 nommé = postérieur (≥ 2007). [1][2]
- **D1.2** — Date du papier-source du triplet : **2007** (J. Systemics, Cybernetics & Informatics Vol. 5 No 5), **non 2011**. La date 2011 du lien ODU Digital Commons est une métadonnée de dépôt/miroir. [2][4]
- **D1.3** — Origine du triplet créditée à **« Page et al. »** (pas à Tolk seul) ; « integratability » absent des papiers 2003 et 2009. [2]
- **D1.4** — La formule « realm of the model/software… » **n'apparaît pas *verbatim*** dans le papier primaire 2007 — phrasage probablement d'une publication Tolk postérieure (~2010-2012). [2][6]
- **D1.5** — Turnitsa 2005 (*Extending the LCIM*, IEEE SCSC) **confirmé par recherche mais non par fetch primaire** → statut `probable` ; venue IEEE SCSC à re-vérifier. [5]

### 1.5 Marqueurs d'incertitude (synthèse Ch. 1)

| Fait | Marqueur |
|---|---|
| Origine 2003 (Tolk & Muguira, paper 03F-SIW-007) | `confirmé` |
| 5 niveaux L0-L4 data-centric en 2003 | `confirmé` (élevé depuis « probable ») |
| Forme canonique 0-6 nommée dès 2007 | `confirmé` |
| Lignée 2005-2008 (Turnitsa 2005, Winters 2006, Diallo 2008) | `probable` (fetch primaire partiel) |
| Triplet I/I/C formalisé 2007, origine Page et al. | `confirmé` |
| Formule « realm of the model… » exacte | **`à vérifier`** |
| Frontière interopérabilité ≠ intégration | `confirmé` |

### 1.6 Questions ouvertes / à vérifier en relance (Ch. 1)

1. Localiser la source **primaire exacte** de la formule « composability is the realm of the model / interoperability is the realm of the software implementation / integratability addresses the hardware-configuration side of connectivity » (piste : Tolk (ed.), Wiley 2012 ; Diallo/Tolk 2010-2013).
2. Confirmer **par fetch primaire** Turnitsa (2005), *Extending the LCIM* : venue exacte (IEEE SCSC ?), pagination, et **ce qu'il ajoute précisément** (passage de 5 à 7 niveaux ? introduction des étiquettes nommées ?).
3. Identifier le **premier document** attestant la forme 0-6 nommée : le papier 2007 la présente comme « current version… documented in [16] » — vérifier la réf. [16] (Turnitsa/Tolk ?) pour dater l'apparition des 7 niveaux nommés (probablement 2006).

---

## Ch. 7 — Des Enterprise Integration Patterns aux patrons agentiques : une filiation reconstruite, non revendiquée

### 7.1 Insight-clé (pyramide inversée)

**Le pontage entre les Enterprise Integration Patterns (EIP) / LCIM et les patrons agentiques-LLM est entièrement RECONSTRUIT par la littérature secondaire et académique — il n'est revendiqué par AUCUNE source primaire éditeur.** *Building Effective Agents* (Anthropic) ne mentionne ni EIP, ni Hohpe, ni LCIM ; la page officielle EIP et ses *Conversation Patterns* n'évoquent ni agents ni LLM. Les correspondances « classique ↔ agentique » sont donc une **thèse d'analyse**, pas un fait déclaré par les auteurs d'origine. **Nuance historique notable** : la lignée LCIM elle-même invoquait déjà les *« intelligent software agents using the Internet »* en **2007** (section « Agent Mediated Decision Support »), offrant un **précurseur** — mais **pré-LLM**. `confirmé`

### 7.2 Faits datés et cités

**F7.1 — Catalogue EIP (65 patrons, 2003).** *Enterprise Integration Patterns: Designing, Building, and Deploying Messaging Solutions* (Gregor **Hohpe & Bobby Woolf**, Addison-Wesley) catalogue **65 patrons**. Site officiel : *« This pattern catalog includes 65 integration patterns. »* Publication : **10 octobre 2003**. **ISBN 978-0321200686** (0-321-20068-3). `confirmé` [7][9] — *verdict adversarial : tenu.*

**F7.2 — Sept catégories.** Les 65 patrons sont organisés en **7 catégories** suivant le flot d'un message : (1) Integration Styles ; (2) Messaging Channels ; (3) Message Construction ; (4) Message Routing ; (5) Message Transformation ; (6) Messaging Endpoints ; (7) System Management. `confirmé` [7]

**F7.3 — « GregorGrams » et implémentations.** Langage de patrons iconographique surnommé **« GregorGrams »** (Wikipedia : *« an icon-based pattern language, sometimes nicknamed GregorGrams »*). Implémentations de référence : **Apache Camel, Red Hat Fuse, Mule ESB (MuleSoft), Spring Integration, Guarana DSL**. Le site officiel évoque le langage d'icônes (Visio stencil) sans employer le terme « GregorGrams ». `confirmé` [9][7]

**F7.4 — Conversation Patterns (Volume 2 — work in progress).** Un **Volume 2 — Conversation Patterns** est annoncé comme *work in progress* par Hohpe : *« Conversation Patterns are set to become Volume 2… »* ; *« Work in progress. Last update: Jan 2017 »* ; copyright « © 2003, 2023 ». Groupes : Discovery ; Starting a Conversation ; Basic Conversations ; Intermediaries (Proxy, Relay, Load Balancer, Scatter-Gather) ; Managing Distributed Systems ; Resource Management ; Ensuring Consistency. **AUCUNE mention d'agents ni de LLM** ; **aucune 2e édition formelle** du Volume 1 à juin 2026. `confirmé` [8] — *verdict adversarial : tenu.*

**F7.5 — Anthropic, *Building Effective Agents* (7 patrons, 19 déc. 2024).** Le document codifie **7 patrons** : (1) Augmented LLM ; (2) Prompt Chaining ; (3) **Routing** (*« Routing classifies an input and directs it to a specialized followup task »* — analogue fonctionnel du Message Router des EIP) ; (4) **Parallelization** (Sectioning = *« Breaking a task into independent subtasks run in parallel »* ; Voting = *« Running the same task multiple times to get diverse outputs »* — analogue du Scatter-Gather/Aggregator) ; (5) Orchestrator-Workers ; (6) Evaluator-Optimizer ; (7) Agents. **DIVERGENCE confirmée : AUCUNE référence explicite aux EIP, à Hohpe, au « Message Router » ni au LCIM.** `confirmé` [10] — *verdict adversarial : tenu.*

**F7.6 — Survey Sarkar & Sarkar (MCP, arXiv:2506.05364).** *Survey of LLM Agent Communication with MCP: A Software Design Pattern Centric Review* (Anjana Sarkar, Soumyendu Sarkar). Abstract *verbatim* : *« The study revisits well-established patterns, including Mediator, Observer, Publish-Subscribe, and Broker… »*. Soumis **v1 le 26 mai 2025 ; v2 le 22 mai 2026**. **Nuance** : patrons GoF / systèmes distribués (recoupant partiellement les EIP) ; l'abstract **ne cite PAS** nommément « Enterprise Integration Patterns », Hohpe ni le LCIM. `confirmé` [11] — *verdict adversarial : tenu.*

**F7.7 — Milosevic & Rabhi, *Architecting Agentic Communities* (arXiv:2601.03624).** Trois niveaux (abstract *verbatim*) : *« LLM Agents (task-specific automation), Agentic AI (adaptive goal-seekers), and Agentic Communities (organizational frameworks where AI agents and human participants coordinate through formal roles, protocols, and governance structures). »* Soumis **v1 le 7 janvier 2026 ; v3 le 25 mai 2026**. L'abstract **ne cite PAS** Hohpe, les EIP ni le LCIM (catalogue détaillé en annexe **non vérifié** au niveau de la source). `confirmé` [12] — *verdict adversarial : tenu.*

**F7.8 — semantic-router comme Message Router à prédicat vectoriel.** Le routage sémantique instancie le **Message Router** des EIP en remplaçant le prédicat de routage déterministe par une **similarité vectorielle**. README (Aurelio Labs) : *« Semantic Router is a superfast decision-making layer for your LLMs and agents. Rather than waiting for slow LLM generations to make tool-use decisions, we use the magic of semantic vector space to make those decisions, routing our requests using semantic meaning. »* On définit des routes par des *« utterances »* exemples ; à l'exécution la requête est encodée et dirigée vers la route la plus proche. **Pont direct entre le niveau Sémantique (L3) du LCIM et le pattern Message Router.** `confirmé` [13]

**F7.9 — Nuance « agents » dans la lignée LCIM (2007, pré-LLM).** Le papier primaire 2007 motive explicitement le modèle par *« the advent of intelligent software agents using the Internet »* et comporte une section **« Motivation for Agent Mediated Decision Support »** (*« the agent must be aware of the assumptions and constraints underlying the model »*). **IMPORTANT** : agents logiciels **classiques (pré-LLM, 2007)** ; **aucune mention de grands modèles de langage**. Cette filiation « agents ↔ niveaux supérieurs du LCIM (pragmatique/dynamique/conceptuel) » précède de près de deux décennies l'agentique LLM et offre un **ancrage historique** au pontage du Ch. 7 — **à présenter comme analogie/précurseur, non comme équivalence**. `confirmé` [2]

**F7.10 — Thèse de pontage (divergence structurante).** Le couplage « classique ↔ agentique » est largement **reconstruit** par la littérature secondaire/académique (surveys arXiv 2506.05364, 2601.03624 ; billets d'ingénierie tiers) et **non revendiqué** par les sources primaires éditeur. `confirmé` [10][8][11]

### 7.3 Tableau comparatif — Patrons EIP (2003) ↔ Patrons agentiques Anthropic (2024)

> **Avertissement méthodologique** : les correspondances ci-dessous sont une **analogie reconstruite** par la littérature d'analyse, **non une filiation déclarée** par les auteurs (Anthropic ne cite pas les EIP). [10]

| Patron EIP (Hohpe & Woolf, 2003) [7] | Patron Anthropic (*Building Effective Agents*, 2024) [10] | Nature du pont |
|---|---|---|
| **Message Router** (prédicat déterministe) | **Routing** (*« classifies an input… specialized followup »*) | Analogue fonctionnel ; prédicat → classification LLM |
| **Scatter-Gather / Aggregator** | **Parallelization** — Sectioning (*« independent subtasks in parallel »*) / Voting (*« diverse outputs »*) | Analogue (fan-out / agrégation) |
| **Content-Based Router / Recipient List** | **Orchestrator-Workers** | Correspondance suggérée (à cartographier finement) |
| **Message Router** + espace vectoriel | **semantic-router** (Aurelio Labs) — prédicat **vectoriel/sémantique** [13] | Pont direct L3 (Sémantique) ↔ Message Router |

### 7.4 Tableau comparatif — Statut des sources sur le pontage EIP/LCIM ↔ agentique

| Source | Type | Revendique le pont EIP/LCIM ↔ agentique ? | Date |
|---|---|---|---|
| Anthropic, *Building Effective Agents* [10] | Primaire éditeur | **Non** (aucune réf. EIP/Hohpe/LCIM) | 19 déc. 2024 |
| Page officielle EIP + Conversation Patterns [7][8] | Primaire éditeur | **Non** (aucun agent/LLM) | 2017-2023 |
| Sarkar & Sarkar, arXiv:2506.05364 [11] | Académique (preprint) | **Partiellement** (Mediator/Observer/Pub-Sub/Broker, GoF ; sans citer Hohpe dans l'abstract) | v1 26 mai 2025 / v2 22 mai 2026 |
| Milosevic & Rabhi, arXiv:2601.03624 [12] | Académique (preprint) | **Non explicitement** dans l'abstract (annexe non vérifiée) | v1 7 jan. 2026 / v3 25 mai 2026 |
| LCIM 2007 (Tolk/Diallo/Turnitsa) [2] | Primaire (académique) | **Précurseur pré-LLM** (« intelligent software agents », pas de LLM) | 2007 |

### 7.5 Divergences signalées (Ch. 7)

- **D7.1** — Les sources **primaires éditeur** (Anthropic ; page EIP + Conversation Patterns) **ne revendiquent AUCUN lien explicite** EIP/LCIM ↔ agentique/LLM ; le pontage est **entièrement reconstruit** par la littérature secondaire/académique. [10][8][11]
- **D7.2** — Les surveys arXiv (2506.05364) emploient **Mediator/Observer/Publish-Subscribe/Broker** (patrons GoF / systèmes distribués) plutôt que la nomenclature exacte de Hohpe & Woolf ; recoupement **partiel** avec les EIP, sans citation d'origine dans l'abstract. [11]
- **D7.3** — Le décompte « ~9 catégories » parfois cité provient de l'ajout des chapitres introductifs ; le site officiel structure explicitement en **7 groupes thématiques**. [7]
- **D7.4** — **Nuance compensatoire** : la lignée LCIM invoquait déjà les « intelligent software agents » en 2007 (D7.1 n'efface pas ce **précurseur historique pré-LLM**). [2]

### 7.6 Marqueurs d'incertitude (synthèse Ch. 7)

| Fait | Marqueur |
|---|---|
| EIP : 65 patrons, 10 oct. 2003, ISBN 978-0321200686 | `confirmé` |
| EIP : 7 catégories | `confirmé` |
| « GregorGrams » + implémentations (Camel/Spring/Mule…) | `confirmé` |
| Conversation Patterns Vol. 2 = WIP « Jan 2017 », sans agents/LLM | `confirmé` |
| Anthropic : 7 patrons, 19 déc. 2024, sans réf. EIP/LCIM | `confirmé` |
| Sarkar & Sarkar (Mediator/Observer/Pub-Sub/Broker) | `confirmé` (abstract) |
| Milosevic & Rabhi (3 niveaux) | `confirmé` (abstract ; annexe non vérifiée) |
| semantic-router = Message Router à prédicat vectoriel | `confirmé` |
| LCIM 2007 motivé par « intelligent software agents » (pré-LLM) | `confirmé` |
| Pontage EIP/LCIM ↔ agentique = reconstruit, non revendiqué | `confirmé` |

### 7.7 Questions ouvertes / à vérifier en relance (Ch. 7)

1. Vérifier si le **Volume 2 (Conversation Patterns)** de Hohpe a reçu une mise à jour après **janvier 2017** ou une publication formelle d'ici 2026-2027 (copyright affiché « 2023 » mais « Last update Jan 2017 » — statut figé à clarifier).
2. Établir si un travail académique **peer-reviewed** (au-delà des surveys arXiv et des billets d'ingénierie) revendique explicitement la correspondance **EIP ↔ patrons agentiques**, ou si elle reste exclusivement dans la **littérature grise / preprints** à juin 2026.
3. Cartographier finement la correspondance entre patrons EIP précis (**Message Router, Scatter-Gather, Aggregator, Content-Based Router, Recipient List**) et patrons Anthropic (**Routing, Parallelization Sectioning/Voting, Orchestrator-Workers**), **en signalant qu'il s'agit d'une analogie reconstruite, non d'une filiation déclarée**.
4. Vérifier le **catalogue détaillé en annexe** de Milosevic & Rabhi (arXiv:2601.03624) : cite-t-il nommément Hohpe / EIP / LCIM hors abstract ? (non vérifié au niveau de la source).

---

## Sources réellement utilisées (PARTIE I)

1. **The Levels of Conceptual Interoperability Model** (Tolk & Muguira) — *2003 Fall Simulation Interoperability Workshop / MSCO archive*, 2003. <https://www.mscoe.org/content/uploads/2017/12/Tolk-Muguira-The-Levels-of-Conceptual-Interoperability-Models.pdf>
2. **Applying the LCIM in Support of Integratability, Interoperability, and Composability for SoS Engineering** (Tolk, Diallo, Turnitsa) — *Journal of Systemics, Cybernetics and Informatics, Vol. 5 No 5 (IIIS), ISSN 1690-4524*, 2007. <https://www.iiisci.org/journal/pdv/sci/pdfs/p468106.pdf>
3. **The Levels of Conceptual Interoperability Model: Applying Systems Engineering Principles to M&S** (Wang, Tolk & Wang) — *arXiv / SpringSim'09 (SCS), San Diego*, 2009. <https://arxiv.org/pdf/0908.0191>
4. **Applying the LCIM… for SoS Engineering — page de dépôt (miroir, métadonnées 2011)** — *Old Dominion University Digital Commons (MSVE)*, 2011. <https://digitalcommons.odu.edu/msve_fac_pubs/27/>
5. **Conceptual interoperability — historique des auteurs (source secondaire de corroboration)** — *HandWiki*, 2023. <https://handwiki.org/wiki/Conceptual_interoperability>
6. **Conceptual interoperability — source secondaire où la formule « realm of… » circule** — *HandWiki*, 2023. <https://handwiki.org/wiki/Conceptual_interoperability>
7. **Enterprise Integration Patterns — Messaging Patterns Overview (site officiel)** — *Gregor Hohpe / enterpriseintegrationpatterns.com*, 2023. <https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html>
8. **Enterprise Integration Patterns — Conversation Patterns (Vol. 2, « Work in progress. Last update: Jan 2017 »)** — *Gregor Hohpe / enterpriseintegrationpatterns.com*, 2017. <https://www.enterpriseintegrationpatterns.com/patterns/conversation/>
9. **Enterprise Integration Patterns — Wikipedia** — *Wikipedia*, 2025. <https://en.wikipedia.org/wiki/Enterprise_Integration_Patterns>
10. **Building Effective Agents** — *Anthropic*, 19 déc. 2024. <https://www.anthropic.com/engineering/building-effective-agents>
11. **Survey of LLM Agent Communication with MCP: A Software Design Pattern Centric Review** (Sarkar & Sarkar) — *arXiv*, v1 26 mai 2025 / v2 22 mai 2026. <https://arxiv.org/abs/2506.05364>
12. **Architecting Agentic Communities using Design Patterns** (Milosevic & Rabhi) — *arXiv*, v1 7 jan. 2026 / v3 25 mai 2026. <https://arxiv.org/abs/2601.03624>
13. **aurelio-labs/semantic-router — README** — *Aurelio Labs (GitHub)*, 2026. <https://github.com/aurelio-labs/semantic-router/blob/main/README.md>

---


# PARTIE II — Fondements formels de l'interopérabilité agentique

> Dossier d'état de l'art, arrêté au **8 juin 2026**. Base probante pour une monographie doctorale (fr-CA). Chaque fait porte un marqueur d'incertitude (`confirmé` | `probable` | `hypothèse` | `à vérifier`) et un appel de source [n]. Les claims dont le verdict est `à vérifier` sont présentés comme tels, jamais comme acquis.

---

## Ch. 6 — Fondements formels : les types de session multipartites (MPST)

### 6.0 Insight-clé (pyramide inversée)

Le socle formel mobilisable pour raisonner sur l'interopérabilité d'agents — projection global→local, absence d'interblocage, vérification à l'exécution — **existe, est mécanisé et a connu en 2025 une correction de fond**. Trois faits structurent ce chapitre. **Premièrement**, la théorie des *Multiparty Session Types* (MPST), publiée à POPL 2008 puis étendue au *Journal of the ACM* en 2016, demeure le cadre canonique [1][2]. **Deuxièmement**, et c'est le fait à fort enjeu, Tirore, Bengtson et Carbone (ECOOP 2025) établissent que **la preuve de *subject reduction* de la formulation originale comporte des failles** ; ils en restreignent la portée à un fragment, mécanisé en Coq — il s'agit d'une correction de l'état de l'art, non d'une controverse ouverte [3]. **Troisièmement**, et c'est la recalibration décisive pour le canon CIA : la mécanisation de la métathéorie *des types de session stricto sensu* reste, à juin 2026, ancrée dans **Coq/Rocq/Iris** (Li & Wies ITP 2025 ; Tirore et al. ECOOP 2025) [3][7], **mais** il existe désormais **au moins une mécanisation Lean 4** d'un formalisme de coordination voisin — les *message sequence charts* (MSC) — appliqué aux agents *LLM* (Bollig-Függer-Nowak, préprint arXiv) [9]. Conséquence : la revendication d'une mécanisation Lean 4 du CIA n'est **pas contredite** par l'état de l'art ; elle constitue une **innovation défendable**, à positionner explicitement comme telle.

### 6.1 Le socle canonique : MPST (2008 → 2016)

Les *Multiparty Session Types* sont introduits par **Kohei Honda, Nobuko Yoshida et Marco Carbone** dans « Multiparty Asynchronous Session Types », POPL 2008, p. 273-284 [`confirmé`, vérifié CrossRef] [1]. La version journal étendue paraît au **Journal of the ACM, vol. 63, no 1, Article 9, p. 1-67, 2016** [`confirmé`] [2]. Note de catalogage : l'identifiant « Article 9 » est confirmé par **dblp** (notation `9:1-9:67`), alors que **CrossRef** n'enregistre que la plage de pages 1-67 sans champ *article-number* — divergence de catalogage résolue en faveur de dblp, mais signalée (cf. §6.6) [2].

L'apport structurant de MPST pour l'interopérabilité agentique tient à la **projection global→local** : un type global décrit le protocole d'interaction de l'ensemble des participants ; sa projection engendre les types locaux que chaque *end-point* (ici, chaque agent) doit respecter. C'est cette mécanique de projection qui sera réinvestie, en 2025-2026, jusqu'aux protocoles d'agents *LLM* (§6.4-6.5).

### 6.2 Correction de fond 2025 : le *subject reduction* failé

> Fait à fort enjeu — `confirmé` (Schloss Dagstuhl).

**Tirore, Bengtson et Carbone**, « Multiparty Asynchronous Session Types: A Mechanised Proof of Subject Reduction » (ECOOP 2025, LIPIcs art. 31:1-31:30), montrent que la preuve de *subject reduction* de la formulation **originale** de Honda et al. « *contains some flaws* » [3]. Leur réponse n'est pas une réfutation destructrice mais un **resserrement** : ils restreignent la théorie à un **fragment** pour lequel le *subject reduction* tient, établissent les propriétés de sûreté des processus bien typés, et **mécanisent l'ensemble en Coq** [3].

Portée pour la monographie : tout argument qui s'appuie sur la sûreté des MPST asynchrones doit désormais référer au **fragment corrigé et mécanisé**, et non à la formulation de 2008-2016 prise telle quelle. Il s'agit d'une **divergence de fond** (entre formulation originale et fragment restreint), à présenter comme **correction de l'état de l'art**, pas comme désaccord entre sources (cf. §6.6).

### 6.3 Extensions probabilistes et raffinées : PReST

Pour des agents au comportement **probabiliste/non déterministe**, l'état de l'art fournit une extension primaire confirmée. **Qiancheng Fu, Ankush Das et Marco Gaboardi** (Boston University), « Probabilistic Refinement Session Types » (**PReST**, PLDI 2025), proposent une extension *conservative* des *refinement session types* supportant des opérateurs de choix **probabiliste ET régulier** (probabilités non constantes, symboliques), une vérification par **solveur SMT**, et une analyse de coût garantissant la **terminaison presque-sûre** [`confirmé`, vérifié CrossRef] [4]. Études de cas confirmées : élection de leader d'Itai-Rodeh, *bounded retransmission*, chaînes de Markov paramétriques [4].

PReST est le pont formel le plus direct entre la rigueur des types de session et l'**indéterminisme intrinsèque** des agents *LLM* — pertinence centrale pour le couplage `déterministe→probabiliste` du canon.

### 6.4 Mécanisation : la domination Coq/Rocq/Iris

Trois jalons primaires confirment que la **métathéorie mécanisée des types de session** demeure, à juin 2026, ancrée dans la famille Coq/Rocq (dont Iris) :

- **Zooid** (Castro-Perez, Ferreira, Gheri, Yoshida), PLDI 2021 : DSL embarqué dans **Coq** pour le calcul multipartite certifié, bâti sur une mécanisation de la métathéorie des MPST asynchrones ; langage de processus *end-point* vérifié héritant des propriétés des types globaux [`confirmé`, vérifié CrossRef] [5].
- **Multiparty GV (MPGV)** (Jacobs, Balzer, Krebbers), ICFP 2022 : langage fonctionnel à types de session multipartites garantissant l'**absence d'interblocage** (héritée de GV / Curry-Howard avec la logique linéaire), malgré entrelacement de sessions et délégation ; preuves mécanisées en **Coq** via le *connectivity graph framework* (cadre **Iris**) [`confirmé`, vérifié CrossRef] [6].
- **Li & Wies** (NYU), « Certified Implementability of Global Multiparty Protocols » (ITP 2025, LIPIcs art. 15) : mécanisation dans **Rocq** (ex-Coq, ~15 000 lignes) d'une caractérisation récente de l'implémentabilité des protocoles multipartites asynchrones, unifiant des formalismes distincts et l'étendant aux protocoles à participants en **nombre infini** [`confirmé`, vérifié Dagstuhl] [7].

### 6.5 Recalibration canon/CIA : Lean 4, MSC et agents LLM

> Fait majeur de ce passage — divergence non lissée.

**Constat 1 (`confirmé`).** La mécanisation de la **métathéorie des types de session** reste dominée par Coq/Rocq (dont Iris), F\*, Beluga et Agda ; **aucune mécanisation Lean 4 *dédiée aux types de session*** n'a été identifiée à juin 2026 (Li & Wies ITP 2025 = Rocq [7] ; Tirore et al. ECOOP 2025 = Coq [3] ; le tutoriel de métathéorie de référence vise Rocq [13]) [8].

**Constat 2 (`confirmé`, NOUVEAU, décisif).** **Bollig, Függer, Nowak**, « Provable Coordination for LLM Agents via Message Sequence Charts » (préprint arXiv 2604.17612, v1 2026-04-19, v2 2026-04-29, 40 p.) : DSL de coordination d'agents fondé sur des **message sequence charts (MSC)**, séparant la structure de passage de messages des actions imprévisibles des *LLM* ; projection syntaxique global→local engendrant des programmes d'agents locaux **sans interblocage** (« *deadlock-free local agent programs* ») ; étude de cas : protocole de consensus de diagnostic ; implémentation Python open-source nommée **ZipperGen** [9]. **Correction majeure** vs le claim initial : les résultats sont mécaniquement vérifiés **en Lean 4** (et non en Coq), mention ajoutée en **v2** (« *All definitions and results are now mechanically verified in Lean 4* ») et **absente de v1** [9].

**Conclusion (`probable`).** La revendication d'une mécanisation **Lean 4 du CIA** n'est pas contredite par l'état de l'art : elle constitue une **innovation défendable** (première mécanisation Lean 4 d'une théorie de session/coordination), à positionner explicitement comme telle plutôt que comme alignement sur l'état de l'art — lequel, pour les types de session *stricto sensu*, est Coq/Rocq [8].

> **ALERTE FABRICATION — `à verifier`.** L'attribution du papier Bollig-Függer-Nowak au « *46th International Conference on Petri Nets*, Paris, juin 2025 » n'est **pas confirmée** : la page canonique arXiv 2604.17612 ne mentionne **aucune venue** de conférence. À traiter strictement comme **préprint arXiv** tant qu'une publication revue n'est pas vérifiée. Confusion probable avec la lignée fondatrice MSC/automates (Deniélou-Yoshida ESOP 2012 [11] ; Stutz ECOOP 2023 [12]) [10].

### 6.6 Lignée MSC ↔ MPST : le pont que mobilise Bollig

L'approche MSC pour agents *LLM* (§6.5) ne sort pas du néant : elle prolonge une lignée fertile et confirmée.

- **Pont MPST ↔ automates communicants.** Deniélou & Yoshida, « Multiparty Session Types Meet Communicating Automata » (ESOP 2012, LNCS 7211:194-213) établissent le pont conceptuel entre MPST et *communicating finite-state machines* (CFSM), qui sous-tend la vérification de protocoles via projection et **synthèse de moniteurs** [`confirmé`, Springer/dblp ; l'un des deux *best papers* ESOP'12] [11].
- **Décidabilité de l'implémentabilité.** Stutz, « Asynchronous Multiparty Session Type Implementability is Decidable — Lessons Learned from Message Sequence Charts » (ECOOP 2023, LIPIcs art. 32) établit que l'implémentabilité des MPST asynchrones à **choix dirigé par l'émetteur** est **décidable**, en adaptant des techniques fondatrices des *high-level message sequence charts*, et montre que certaines généralisations deviennent **indécidables** [`confirmé`, Dagstuhl] [12]. C'est la **même veine MSC** qu'exploite Bollig.

### 6.7 Du formalisme aux agents : adoption et vérification à l'exécution

- **Lien direct types de session ↔ agents.** Bergenti, Egidi, Galliera, Giannini, Monica, « Correct implementation of agent interaction protocols » (*Frontiers in Computer Science*, vol. 7, 31 oct. 2025, *peer-reviewed*) : la correction est assurée d'un côté par la méthodologie **MPST** (projection global→local), de l'autre par une **traduction des types locaux en agents** (langage Jadescript ciblant la plateforme **JADE**), avec preuve que les agents se comportent conformément aux types locaux [`confirmé`, 5 auteurs vérifiés CrossRef] [14].
- **Vérification à l'exécution probabiliste.** **PSTMonitor** (« Monitor Synthesis from Probabilistic Session Types ») dérive des moniteurs *runtime* depuis des types de session enrichis de probabilités — voie pertinente pour des agents au comportement non déterministe [`probable` ; **venue/version exactes à vérifier**, non re-vérifiées au niveau primaire ce passage] [15].
- **Socle alternatif.** Les **Session Coalgebras** offrent une vue coalgébrique des types de session — cadre comportemental complémentaire au π-calcul pour raisonner sur la composition [`probable` ; **venue exacte (POPL 2021 vs version journal) et DOI à vérifier**] [16].

### 6.8 Tableaux comparatifs

#### Tableau 6.A — Jalons formels MPST (dimensions : nature, venue/date, mécanisation, statut)

| Jalon | Nature de l'apport | Venue / date | Mécanisation | Confiance |
|---|---|---|---|---|
| Honda-Yoshida-Carbone [1] | Introduction MPST | POPL 2008, p. 273-284 | — | `confirmé` |
| Honda-Yoshida-Carbone [2] | Version journal étendue | JACM 63(1):Art.9, 2016 | — | `confirmé` |
| Tirore-Bengtson-Carbone [3] | *Subject reduction* failé → fragment corrigé | ECOOP 2025, art. 31 | **Coq** | `confirmé` |
| PReST — Fu-Das-Gaboardi [4] | Choix probabiliste + régulier, coût | PLDI 2025, PACMPL 9 | (SMT) | `confirmé` |
| Zooid [5] | DSL calcul multipartite certifié | PLDI 2021, p. 237-251 | **Coq** | `confirmé` |
| MPGV [6] | Absence d'interblocage, délégation | ICFP 2022, PACMPL 6 | **Coq/Iris** | `confirmé` |
| Li & Wies [7] | Implémentabilité (participants infinis) | ITP 2025, art. 15 | **Rocq** (~15k LOC) | `confirmé` |
| Stutz [12] | Implémentabilité décidable (via MSC) | ECOOP 2023, art. 32 | — | `confirmé` |
| Deniélou-Yoshida [11] | Pont MPST ↔ CFSM | ESOP 2012, LNCS 7211 | — | `confirmé` |
| Bollig-Függer-Nowak [9] | Coordination LLM via MSC, sans interblocage | **préprint** arXiv 2604.17612 (v2) | **Lean 4** (v2) | `confirmé` (résultat) / venue `à vérifier` |
| Bergenti et al. [14] | MPST → agents (JADE/Jadescript) | Frontiers CS vol. 7, 2025 | — | `confirmé` |
| PSTMonitor [15] | Moniteurs *runtime* probabilistes | arXiv 2212.07329 | — | `probable` |
| Session Coalgebras [16] | Vue coalgébrique | (POPL 2021 ?) | — | `probable` |

#### Tableau 6.B — Paysage de la mécanisation (dimensions : objet formalisé, assistant de preuve, applicabilité agents)

| Travail | Objet formalisé | Assistant de preuve | Applicabilité agents LLM |
|---|---|---|---|
| Tirore et al. [3] | Métathéorie types de session (fragment) | Coq | Indirecte (socle de sûreté) |
| Zooid [5] | Métathéorie MPST async + processus | Coq | Indirecte |
| MPGV [6] | Absence d'interblocage, délégation | Coq / Iris | Indirecte |
| Li & Wies [7] | Implémentabilité protocoles globaux | Rocq | Indirecte |
| Tutoriel métathéorie [13] | Métathéorie types de session (référence) | Rocq | — |
| **Bollig et al. [9]** | **Coordination MSC d'agents LLM** | **Lean 4** | **Directe** |
| CIA (revendication monographie) | Calcul d'Intégration Agentique | **Lean 4** (revendiqué) | Directe — **innovation à justifier** [8] |

> Lecture du Tableau 6.B : la colonne « assistant de preuve » établit le constat décisif — Lean 4 n'apparaît, à juin 2026, **que** pour la coordination MSC d'agents *LLM* (Bollig [9]) et la revendication CIA, jamais pour la métathéorie des types de session *stricto sensu* (Coq/Rocq partout ailleurs).

### 6.9 Divergences entre sources (signalées, non lissées)

1. **CIA / Lean 4 (fait majeur).** Le claim initial supposait l'état de l'art mécanisé des types de session **exclusivement** Coq/Rocq/F\*/Beluga/Agda, rendant suspecte une « mécanisation Lean 4 du CIA ». Découverte : Bollig et al. mécanisent **en Lean 4** un formalisme de coordination d'agents *LLM* fondé sur les MSC [9]. Divergence non lissée : **(a)** pour les types de session *stricto sensu*, Lean 4 reste absent (Coq/Rocq domine — Li & Wies [7], Tirore et al. [3]) ; **(b)** pour la coordination MSC d'agents *LLM*, Lean 4 est désormais présent. La revendication CIA-Lean4 est donc une **innovation défendable**, pas une anomalie — mais doit être positionnée comme telle [8].
2. **Mécanisation Bollig : Coq → Lean 4.** Le claim initial affirmait une mécanisation « en Coq » ; la page arXiv canonique indique explicitement **Lean 4** (v2). Correction appliquée. L'implémentation est nommée **ZipperGen** (le claim disait « implémentation Python open-source » sans nom) [9].
3. **Venue Bollig.** L'attribution agrégateur « Petri Nets 2025 Paris » demeure **non confirmée** (absente de la page arXiv) — divergence maintenue, statut **`à vérifier`** [10].
4. **JACM Article 9.** CrossRef ne fournit pas de champ *article-number* (seulement page 1-67) alors que dblp fournit « 9:1-9:67 ». Divergence de catalogage **résolue en faveur de dblp** (Article 9 confirmé), mais signalée [2].
5. **Subject reduction MPST.** Divergence de **fond** (non un désaccord de sources) entre la formulation **originale** de Honda et al. (preuve failée, selon Tirore et al. ECOOP 2025) et le **fragment restreint** corrigé et mécanisé en Coq. À présenter comme **correction de l'état de l'art**, pas comme controverse ouverte [3].

### 6.10 Marqueurs d'incertitude (récapitulatif)

- `confirmé` (sources primaires) : [1] POPL 2008 · [2] JACM 2016 (+dblp) · [3] ECOOP 2025 · [4] PLDI 2025 · [5] PLDI 2021 · [6] ICFP 2022 · [7] ITP 2025 · [9] Bollig (résultat + mécanisation Lean 4 v2) · [11] ESOP 2012 · [12] ECOOP 2023 · [14] Frontiers CS 2025.
- `probable` : [8] absence de Lean 4 dans la métathéorie des types de session (conclusion d'analyse) · [15] PSTMonitor · [16] Session Coalgebras.
- `à vérifier` : [10] venue « Petri Nets 2025 Paris » de Bollig et al. (préprint uniquement) ; venue/version exactes de PSTMonitor [15] et Session Coalgebras [16].

### 6.11 Questions ouvertes / à vérifier en relance

1. **Statut de publication revue du préprint Bollig-Függer-Nowak** (arXiv 2604.17612) : aucune venue confirmée à juin 2026. *Vérification* : surveiller dblp/DOI et la page arXiv pour une version publiée (ECOOP/POPL/CONCUR/Petri Nets) ; ne pas citer de venue tant qu'absente.
2. **Artefact Lean 4 de Bollig et al.** : le code de mécanisation est-il public (dépôt Zenodo/GitHub) et quelle est sa taille/portée exacte ? Pertinent pour comparer à une éventuelle mécanisation Lean 4 du CIA. *Vérification* : section « artifact » / liens du PDF arXiv v2.
3. **PSTMonitor** (arXiv 2212.07329) : venue et version de publication revue exactes (workshop/journal ?) non re-vérifiées ce passage. *Vérification* : CrossRef/dblp sur le titre.
4. **Session Coalgebras** : venue primaire exacte (POPL 2021 / PACMPL vs version journal *Logical Methods in CS* ?) et DOI non re-confirmés ce passage. *Vérification* : CrossRef/dblp.
5. **Une autre mécanisation Lean 4 *des types de session* (et non des MSC)** entre avril 2026 et juin 2026 ? Aucune trouvée, mais le champ évolue vite. *Vérification* : re-balayage ciblé « session types Lean 4 » à la date de finalisation du chapitre.
6. **Ancrage du CIA** : l'analogie directrice est M(π)/π-calcul ; or l'état de l'art récent (Bollig [9], Stutz [12], Li & Wies [7]) privilégie les **MSC/automates communicants** comme support de décidabilité/projection. Faut-il **compléter** l'ancrage π-calcul par un ancrage MSC/CFSM (plus proche des résultats d'implémentabilité mécanisés) ?

---

## Sources utilisées (Partie II)

1. *Multiparty asynchronous session types* (POPL 2008) — CrossRef / ACM SIGPLAN-SIGACT, 2008 — https://api.crossref.org/works/10.1145/1328438.1328472 (DOI 10.1145/1328438.1328472, p. 273-284)
2. *Multiparty Asynchronous Session Types* — J. ACM 63(1):9:1-9:67 — dblp (Schloss Dagstuhl), 2016 — https://dblp.org/rec/journals/jacm/HondaYC16.html (DOI 10.1145/2827695 ; CrossRef : https://api.crossref.org/works/10.1145/2827695)
3. *Multiparty Asynchronous Session Types: A Mechanised Proof of Subject Reduction* (ECOOP 2025) — Schloss Dagstuhl — LIPIcs, 2025-06-25 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.31 (art. 31:1-31:30, Coq)
4. *Probabilistic Refinement Session Types* (PLDI 2025) — CrossRef / ACM (PACMPL 9(PLDI):1666-1691), 2025-06-10 — https://api.crossref.org/works/10.1145/3729317 (DOI 10.1145/3729317)
5. *Zooid: a DSL for certified multiparty computation* (PLDI 2021) — CrossRef / ACM SIGPLAN, 2021-06-18 — https://api.crossref.org/works/10.1145/3453483.3454041 (p. 237-251 ; arXiv 2103.10269)
6. *Multiparty GV* (ICFP 2022) — CrossRef / ACM (PACMPL 6(ICFP):466-495), 2022-08-29 — https://api.crossref.org/works/10.1145/3547638 (artefact Zenodo 6606474)
7. *Certified Implementability of Global Multiparty Protocols* (ITP 2025, Rocq) — Schloss Dagstuhl — LIPIcs, 2025-09-22 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ITP.2025.15 (art. 15:1-15:20)
8. *Mechanizing the Meta-Theory of Session Types in Rocq: a Tutorial* — U. Milano (Momigliano et al.), 2025 — https://momigliano.di.unimi.it/papers/stutorial.pdf
9. *Provable Coordination for LLM Agents via Message Sequence Charts* (arXiv, v2 mécanisé en Lean 4) — arXiv, 2026-04-29 — https://arxiv.org/abs/2604.17612 (préprint, 40 p., outil ZipperGen)
10. *Provable Coordination for LLM Agents via Message Sequence Charts* (page arXiv canonique — aucune venue listée) — arXiv, 2026-04-29 — https://arxiv.org/abs/2604.17612
11. *Multiparty Session Types Meet Communicating Automata* (ESOP 2012, LNCS 7211:194-213) — Springer, 2012 — https://link.springer.com/chapter/10.1007/978-3-642-28869-2_10 (DOI 10.1007/978-3-642-28869-2_10)
12. *Asynchronous Multiparty Session Type Implementability is Decidable — Lessons Learned from Message Sequence Charts* (ECOOP 2023) — Schloss Dagstuhl — LIPIcs, 2023-07-11 — https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2023.32 (art. 32:1-32:31)
13. *Mechanizing the Meta-Theory of Session Types in Rocq: a Tutorial* — U. Milano (Momigliano et al.), 2025 — https://momigliano.di.unimi.it/papers/stutorial.pdf
14. *Correct implementation of agent interaction protocols* (Frontiers in Computer Science, vol. 7) — Frontiers in Computer Science, 2025-10-31 — https://www.frontiersin.org/journals/computer-science/articles/10.3389/fcomp.2025.1659785/full (DOI 10.3389/fcomp.2025.1659785 ; CrossRef : https://api.crossref.org/works/10.3389/fcomp.2025.1659785)
15. *PSTMonitor: Monitor Synthesis from Probabilistic Session Types* (arXiv) — arXiv, 2022-12 — https://arxiv.org/pdf/2212.07329 (venue/version à vérifier)
16. *Session Coalgebras: A Coalgebraic View on Session Types and Communication Protocols* — ACM / PMC, 2021 — https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7984539/ (venue/DOI à vérifier)

---


# PARTIE III — Substrats, protocoles et modernisation : la base probante (juin 2026)

> **Périmètre.** Cette partie consolide l'état de l'art vérifié au **8 juin 2026** sur quatre fronts couplés : (Ch. 8) la couche protocolaire agentique — MCP d'une part, la constellation A2A/ACP/AGNTCY/AG-UI d'autre part ; (Ch. 9) les substrats de messagerie — Apache Kafka/Confluent et IBM MQ ; (Ch. 10) la modernisation du mainframe IBM Z. Chaque énoncé porte un **marqueur d'incertitude** (`confirmé` | `probable` | `à vérifier`) et un **horodatage**. Les divergences entre sources primaires sont **signalées, jamais lissées**. Les appels `[n]` renvoient à la bibliographie numérotée en fin de partie.

---

## Ch. 8 — Protocoles agentiques (I) : Model Context Protocol (MCP)

**Insight-clé.** Au 8 juin 2026, MCP a franchi le seuil de la maturité institutionnelle : sa révision stable est **2025-11-25** [1][6] (`confirmé`), il a été **donné à l'Agentic AI Foundation sous la Linux Foundation le 9 décembre 2025** [7][8] (`confirmé`), et un *Release Candidate* visant la version finale **2026-07-28** [9] propose une mutation architecturale majeure — le passage d'un cœur explicitement *stateful* à un cœur *sans état* (`probable`, statut RC non finalisé). La trajectoire est donc double : une norme stable et gouvernée, et une refonte protocolaire en cours dont les paramètres exacts restent susceptibles d'évoluer d'ici la date cible.

### Synthèse de l'état de l'art

La spécification 2025-11-25 repose sur **JSON-RPC 2.0**, messages **encodés en UTF-8**, et des **connexions explicitement *stateful*** [1bis][4bis] (`confirmé`) — caractérisation qui constitue précisément ce que le RC 2026-07-28 propose de retirer. Les primitives sont stabilisées : côté serveur `{Resources, Prompts, Tools}`, côté client `{Sampling, Roots, Elicitation}` [3] (`confirmé`). Deux transports normatifs subsistent — **stdio** et **Streamable HTTP** (endpoint unique POST+GET, SSE optionnel) — l'ancien HTTP+SSE (2024-11-05) étant déprécié avec mode de rétrocompatibilité [4] (`confirmé`).

Le modèle d'autorisation est l'un des points les plus durcis : serveur MCP en **OAuth 2.1 Resource Server** (référence normative `draft-ietf-oauth-v2-1-13`), **RFC 9728** (MUST), **PKCE S256** (MUST), découverte via **RFC 8414 ou OIDC Discovery 1.0** [10] (`confirmé`). Contre le *confused deputy*, **RFC 8707** est obligatoire côté client (paramètre `resource` inconditionnel), avec validation d'audience côté serveur et **interdiction explicite du *token passthrough*** [11] (`confirmé`). **Nuance vérifiée à ne pas lisser** : le bénéfice de liaison d'audience RFC 8707 ne s'obtient que « *when the Authorization Server supports the capability* » — l'obligation côté client est inconditionnelle, l'effet de *binding* dépend du support par l'AS [11].

L'origine pratique de ces durcissements est empiriquement attestée par **CVE-2025-49596** (MCP Inspector < 0.14.1, RCE, **CVSS v4.0 = 9.4 CRITICAL**, NVD publié le 13 juin 2025) [12] (`confirmé`).

### Faits datés et cités

- **Révision stable** : 2025-11-25, succédant à 2025-06-18 ; marquée « Latest » sur GitHub (publiée le 25 nov. 2025) [1][6] (`confirmé`, haut enjeu).
- **Historique des révisions stables** : 2024-11-05 / 2025-03-26 / 2025-06-18 / 2025-11-25 ; les jalons RC (2025-11-25-RC, 2026-07-28-RC) sont des *pre-releases* distinctes, **non** des révisions stables [6][1][5] (`confirmé`).
- **Apports 2025-11-25** : élicitation par URL (SEP-1036) + énumérations standardisées single/multi-select (**SEP-1330**, et non SEP-1036 comme une lecture initiale le suggérait) [1][5] (`confirmé`) ; *tool calling* dans le sampling (SEP-1577) et *tasks* **expérimental** (SEP-1686) [1] (`confirmé`) ; OAuth Client ID Metadata Documents (SEP-991, `draft-ietf-oauth-client-id-metadata-document-00`), rétrogradant **DCR/RFC 7591 à MAY** ; consentement de scope incrémental (SEP-835) [13][1] (`confirmé`) ; gouvernance formalisée (SEP-932, 994, 1302, 1730) [1] (`confirmé`).
- **Don à l'AAIF** : 9 décembre 2025 ; Anthropic qualifie l'AAIF de « *directed fund under the Linux Foundation* » [7] (`confirmé`).
- **Membres Platinum AAIF** (8) : AWS, Anthropic, Block, Bloomberg, Cloudflare, Google, Microsoft, OpenAI ; projets fondateurs MCP (Anthropic), goose (Block), AGENTS.md (OpenAI) [8][7] (`confirmé`).
- **RC 2026-07-28** : cœur **sans état** — suppression de `initialize` (SEP-2575) et de `Mcp-Session-Id` (SEP-2567), en-têtes `Mcp-Method`/`Mcp-Name` (SEP-2243) [9] (`probable`) ; politique de cycle de vie ≥ 12 mois (**SEP-2596**) dépréciant Roots, Sampling et Logging (**SEP-2577**) [9] (`probable`) ; cadre Extensions (SEP-2133), MCP Apps (SEP-1865), Tasks promu (SEP-2663) [9] (`probable`).
- **Roadmap 2026** (9 mars 2026) : scalabilité horizontale sans état, primitive Tasks, *contributor ladder*, préparation entreprise ; **« *not adding more official transports this cycle* »** [14bis] (`confirmé`).
- **Adoption** : > 10 000 serveurs publics [8][7], **97 M+ téléchargements SDK/mois (Python+TS, source primaire Anthropic)** [adopt-dl] (`confirmé`, réserve métrologique : téléchargements SDK ≠ utilisateurs), **10 SDK officiels** [sdk][sdk2] (`confirmé`), registre officiel **en PREVIEW** depuis le 8 sept. 2025, sans GA repérée [reg][reg2] (`confirmé`).

### Tableau 1 — Évolution architecturale de MCP : 2025-11-25 (stable) vs RC 2026-07-28

| Dimension | 2025-11-25 (stable, `confirmé`) | RC 2026-07-28 (`probable`, non finalisé) |
|---|---|---|
| Modèle de session | Connexions **stateful**, handshake `initialize`/`initialized` | **Stateless** : suppression `initialize` (SEP-2575) et `Mcp-Session-Id` (SEP-2567) |
| Routage proxy/LB | Inspection du corps requise | En-têtes `Mcp-Method`/`Mcp-Name` (SEP-2243) pour router sans inspecter |
| Cycle de vie | Non formalisé | Active→Deprecated→Removed, fenêtre **≥ 12 mois** (SEP-2596) |
| Primitives dépréciées | — | **Roots, Sampling, Logging** (SEP-2577) |
| Extensibilité | Primitives fixes | Cadre **Extensions** (SEP-2133) + MCP Apps (SEP-1865) + Tasks promu (SEP-2663) |
| Tasks | **Expérimental** (SEP-1686) | Extension promue (SEP-2663) |
| Transports | stdio + Streamable HTTP | Inchangés (roadmap : aucun nouveau transport ce cycle) |

### Tableau 2 — Modèle d'autorisation MCP 2025-11-25 (obligations normatives)

| Élément | Statut normatif | Acteur | Source |
|---|---|---|---|
| Serveur = OAuth 2.1 Resource Server | Établi depuis 2025-06-18 | Serveur | [10] |
| RFC 9728 (Protected Resource Metadata) | **MUST** | Serveur (impl.) / Client (usage) | [10] |
| PKCE méthode S256 | **MUST** (si techniquement possible) | Client | [10] |
| Découverte : RFC 8414 **ou** OIDC Discovery 1.0 | MUST (≥ 1 mécanisme serveur ; client supporte les deux) | Serveur / Client | [10] |
| RFC 8707 (paramètre `resource`) | **MUST**, inconditionnel | Client | [11] |
| Validation d'audience / rejet jetons hors audience | **MUST** | Serveur | [11] |
| *Token passthrough* | **INTERDIT** | Serveur | [11] |
| Client ID Metadata Documents (SEP-991) | RECOMMANDÉ ; DCR/RFC 7591 → **MAY** | Client | [13] |

### Divergences signalées

1. **« Directed fund »** : qualificatif employé explicitement par Anthropic [7] mais **absent du communiqué Linux Foundation** [8], qui décrit une fondation neutre/ouverte. Divergence de **formulation**, non de substance.
2. **Date du RC 2026-07-28** : le billet de blog officiel est daté du **21 mai 2026** [9], tandis que le tag `2026-07-28-RC` sur GitHub porte l'horodatage du **29 mai 2026** [6]. « 2026-07-28 » est la **date cible** de la version finale, pas la date du RC. Les deux sources sont primaires (~8 jours d'écart).
3. **Composition de l'équipe de mainteneurs** : les sources primaires (billets de janv. et avril 2026) situent **Den Delimarsky chez Anthropic** (et non Microsoft), identifient **Clare Liguori chez AWS**, et **ne mentionnent ni Nick Cooper ni de *steering committee* formel** [maint1][maint2]. L'énoncé candidat initial est en écart avec ces sources.
4. **CVE-2025-49596** : la presse secondaire (juillet 2025) cite « CVSS 9.4 » sans version ; la source primaire NVD précise **CVSS v4.0 = 9.4** et une publication au **13 juin 2025** [12]. La date NVD prime.

### Marqueurs d'incertitude

- `confirmé` : version stable, transports, primitives, modèle OAuth, don AAIF, membres Platinum, CVE, roadmap 2026, SDK, registre en preview, 97 M+ téléchargements.
- `probable` : l'ensemble des apports du RC 2026-07-28 (stateless, dépréciations, Extensions) — propositions susceptibles d'évoluer d'ici publication finale.
- `à vérifier` : existence d'un *steering committee* MCP formel et appartenance de Nick Cooper (OpenAI) — **non attesté** par les billets de mainteneurs consultés [steer1][steer2].

### Questions ouvertes / à vérifier en relance

- Statut exact du registre officiel MCP au 8 juin 2026 (toujours PREVIEW ; état précis du format `server.json` et des garanties) — consulter `registry.modelcontextprotocol.io`.
- Existence/composition d'un *steering committee* MCP et présence de Nick Cooper — vérifier la page de gouvernance (SEP-932) ou les fichiers GOVERNANCE/MAINTAINERS du dépôt.
- Le RC 2026-07-28 sera-t-il publié sans modification substantielle ? Reverifier *Releases* et changelog après cette date.
- Statut à jour des Internet-Drafts OAuth (`draft-ietf-oauth-v2-1-13`, `draft-ietf-oauth-client-id-metadata-document-00`) — la spec MCP fige des numéros potentiellement périmés ; vérifier sur datatracker.ietf.org.

---

## Ch. 8 — Protocoles agentiques (II) : A2A, ACP, AGNTCY, AG-UI/A2UI et la convergence

**Insight-clé.** En juin 2026, le paysage protocolaire s'est consolidé **par stratification sous la Linux Foundation**, non par unification monolithique [CONV-001] (`probable`). A2A a absorbé ACP/IBM (fusion août 2025) [ACP-002] (`confirmé`) et atteint sa **première version stable v1.0 le 12 mars 2026** [A2A-005][A2A-rel] (`confirmé`) ; AGNTCY (Cisco) se positionne en **couche infrastructure interopérable** avec A2A et MCP [AGNTCY-004] (`confirmé`) ; la couche interface usager se partage entre AG-UI (CopilotKit) et A2UI (Google), présentés comme complémentaires [A2UI-001] (`confirmé`). La « convergence » est donc un **alignement en couches** : A2A = message/tâche inter-agents ; AGNTCY = annuaire/identité/transport/observabilité ; MCP = accès outils ; AG-UI/A2UI = interface usager.

### Synthèse de l'état de l'art

**A2A** (Agent2Agent) est né chez Google, annoncé le **9 avril 2025** à Google Cloud Next avec 50+ partenaires sous Apache 2.0 [A2A-001] (`confirmé`), puis **transféré à la Linux Foundation le 23 juin 2025** [A2A-002] (`confirmé`). Sa **v1.0** est la première version stable « *production-ready* », apportant *Signed Agent Cards*, support multi-tenant et rétrocompatibilité v0.3↔v1.0 [A2A-005] (`confirmé`). Trois liaisons de transport formelles : **JSON-RPC 2.0, gRPC, HTTP+JSON/REST** [A2A-006] (`confirmé`) ; l'**Agent Card** (métadonnées de découverte + `AgentCardSignature`) supporte API Key, HTTP Auth, OAuth2, OIDC, mTLS [A2A-007] (`confirmé`).

**ACP** (IBM/BeeAI), approche REST-native, a **fusionné dans A2A** : l'équipe ACP cesse le développement actif et Kate Blair (IBM Research) rejoint le A2A TSC [ACP-002] (`confirmé`). En 2026, **ACP relève du contexte historique**, non d'une décision d'architecture courante [ACP-003] (`confirmé`).

**AGNTCY** (Outshift/Cisco), accueilli par la LF le **29 juillet 2025** (membres formateurs : Cisco, Dell, Google Cloud, Oracle, Red Hat) [AGNTCY-002] (`confirmé`), assemble OASF + Agent Directory + Identity + **SLIM** (*Secure Low-latency Interactive Messaging*, avec mention quantum-safe) + observabilité [AGNTCY-003] (`confirmé`). Point notable : l'ancien « Agent Connect Protocol (ACP) » d'AGNTCY (distinct de l'ACP d'IBM) **n'apparaît plus sous ce nom** dans la doc courante, réorganisée autour de SLIM [AGNTCY-005] (`probable`).

**Couche UI** : **AG-UI** (CopilotKit, MIT, ~16 types d'événements, transport-agnostique avec référence HTTP+SSE, release 2026-06-05, hors-fondation) [AGUI-002] (`confirmé`) se déclare complémentaire de MCP/A2A avec support A2A confirmé [AGUI-003] (`confirmé`). **A2UI** (Google, format déclaratif d'UI générative, v0.8, annoncé le 15 décembre 2025) est transportable sur A2A et AG-UI, **complémentaire et non concurrent** d'AG-UI [A2UI-001] (`confirmé`).

### Faits datés et cités

- A2A annoncé **2025-04-09** (50+ partenaires, Apache 2.0) [A2A-001] ; transféré à la LF **2025-06-23** [A2A-002][A2A-LF] (`confirmé`).
- **Membres fondateurs A2A à la LF** : AWS, Cisco, Google, Microsoft, Salesforce, SAP, ServiceNow [A2A-003] (`confirmé`). *Traçabilité* : cette liste figure dans le billet Google Developers ; le communiqué LF ne l'énumère **pas** nommément.
- **v1.0.0 datée du 12 mars 2026** (release notes GitHub) ; tag de patch **v1.0.1 le 28 mai 2026** (corrections éditoriales) [A2A-rel] (`confirmé`).
- **150+ organisations** au premier anniversaire (9 avril 2026) [A2A-150] ; **attribution nominale de déploiements en production** à Microsoft/AWS/Salesforce/SAP/ServiceNow **non explicitement établie** par le communiqué LF (listées comme *supporting organizations*) → portion production `à vérifier` [A2A-008] (`probable`).
- ACP→A2A : discussion GitHub i-am-bee **2025-08-25** vs billet LF AI & Data **2025-08-29** [ACP-002] (`confirmé`).
- AGNTCY accueilli **2025-07-29** [AGNTCY-002] (`confirmé`).
- AG-UI release **2026-06-05** [AGUI-002] ; A2UI v0.8 annoncé **2025-12-15** [A2UI-001] (`confirmé`).

### Tableau 3 — Cartographie de la stratification protocolaire (juin 2026)

| Protocole | Origine / Gouvernance | Couche fonctionnelle | Version (juin 2026) | Licence | Statut |
|---|---|---|---|---|---|
| **A2A** | Google → **Linux Foundation** (2025-06-23) | Message / tâche inter-agents | **v1.0** (spec 1.0.0 ; tag 1.0.1) | Apache 2.0 | `confirmé` |
| **ACP** (IBM) | IBM/BeeAI → **fusionné dans A2A** | (historique) inter-agents REST | — (déprécié) | — | `confirmé` (historique) |
| **AGNTCY** | Outshift/Cisco → **Linux Foundation** (2025-07-29) | Annuaire / identité / transport (SLIM) / observabilité | doc courante | open-source LF | `confirmé` |
| **MCP** | Anthropic → **AAIF/LF** | Accès outils | 2025-11-25 (RC 2026-07-28) | open-source LF | `confirmé` |
| **AG-UI** | CopilotKit (**hors-fondation**) | Interface agent ↔ usager | release 2026-06-05 | MIT | `confirmé` |
| **A2UI** | Google (hors-fondation) | Format déclaratif d'UI générative | v0.8 | open project | `confirmé` |

### Tableau 4 — A2A : version normative vs granularité de release

| Source | Valeur affichée | Interprétation |
|---|---|---|
| Page spec officielle [A2A-spec] | **1.0.0** « Latest Released Version » (historique 0.3.0/0.2.6/0.1.0) | Version **protocolaire normative = 1.0** |
| GitHub `a2aproject/A2A` [A2A-rel] | tag **v1.0.1** (28 mai 2026) | Patch éditorial ; **n'affecte pas** la compatibilité ni la négociation de version |
| Agrégateur (« A2A 1.2 ») | 1.2 | **NON CONFIRMÉ et contredit** par la source primaire [CONV-002] |

### Divergences signalées (à conserver)

1. **Datation de la fusion ACP→A2A** : GitHub i-am-bee **2025-08-25** vs billet LF AI & Data **2025-08-29** — même annonce, deux dates de publication [ACP-002].
2. **Version A2A** : page spec affiche 1.0.0 ; GitHub porte v1.0.1. **Résolution** : les patchs n'affectent pas la compatibilité → version protocolaire normative **= 1.0**. Décalage de granularité, pas contradiction [CONV-002].
3. **Date de release v1.0** : release notes GitHub = **12 mars 2026** (`confirmé`), ce qui **écarte** l'estimation « janvier 2026 » de sources secondaires [A2A-005].
4. **Décompte de partenaires** : 50+ (avril 2025) vs 100+ (juin 2025) vs 150+ (avril 2026) — trois instantanés temporels distincts à ne pas confondre.
5. **« A2A 1.2 »** : allégation agrégateur **réfutée/non confirmée** ; les *Signed Agent Cards* relèvent de **v1.0** [CONV-002].
6. **Production nominale** (Microsoft/AWS/Salesforce/SAP/ServiceNow) : le communiqué LF confirme 150+ organisations et l'adoption verticale mais **n'attribue pas nommément** ces déploiements → `à vérifier` [A2A-008].
7. **« Agent Connect Protocol (ACP) » d'AGNTCY** : absent de la doc courante ; SLIM est la couche transport. Historique du renommage `à vérifier` [AGNTCY-005].

### Marqueurs d'incertitude

- `confirmé` : dates d'annonce/transfert A2A, membres fondateurs, v1.0 et ses capacités, transports, Agent Card, fusion ACP, accueil AGNTCY et ses composants, AG-UI, A2UI.
- `probable` : adoption A2A 150+ (avec production nominale `à vérifier`), absence du nom « ACP » chez AGNTCY, dynamique de convergence par stratification.
- `à vérifier` : dates de lancement initiales précises d'ACP/AGNTCY (~mars 2025 non étayé au jour près), mainteneurs initiaux d'AGNTCY (LangChain/Galileo), mécanique exacte du handshake AG-UI↔A2A.

### Questions ouvertes / à vérifier en relance

- Cadence de gouvernance post-1.0 d'A2A (politique de support des versions 0.x) — non datée au-delà des tags GitHub.
- Structure de gouvernance fine d'AGNTCY (TAC, charte) — non précisée dans le communiqué du 29 juillet 2025.
- Historique exact du renommage « Agent Connect Protocol » → SLIM — vérifier les dépôts OASF/SLIM.
- Adoption en production **vérifiable et nominative** au-delà des communiqués de fondation — nécessite études de cas éditeurs/*peer-reviewed*.
- Trajectoire post-v0.8 d'A2UI (gouvernance, éventuelle donation) — horizon 2026-2027.

---

## Ch. 9 — Substrats (I) : Apache Kafka / Confluent

**Insight-clé.** L'*exactly-once semantics* (EOS) de Kafka est **structurellement borné au périmètre interne read-process-write** : tout appel RPC externe (API LLM, courriel, paiement) **n'est pas garanti exactly-once** [eos-limite] (`confirmé`, verbatim Confluent). Cette frontière — entre la garantie déterministe du substrat et l'action probabiliste/non rejouable de l'agent — est l'ancrage empirique de la thèse de l'opérateur τ. Côté versions, Kafka **4.3.0 (22 mai 2026)** est courant, avec la ligne 4.2.x maintenue en parallèle (4.2.1, 30 mai 2026) [kafka-courante] (`confirmé`).

### Synthèse de l'état de l'art

La vérification du 8 juin 2026 (pages primaires Apache + wikis KIP + deux articles Confluent confirmés verbatim) établit une chronologie de versions précise (Tableau 5). **Kafka 4.0.0 (18 mars 2025)** est la première version majeure **sans ZooKeeper** (KRaft par défaut), avec GA de KIP-848 et **défense transactionnelle serveur (KIP-890) activée par défaut depuis 4.0** [kafka-4-0][kip890] (`confirmé`). **Kafka 4.2.0 (17 février 2026, Apache)** fait passer Queues/Share Groups (**KIP-932**) en **GA/production-ready** [kafka-4-2] (`confirmé`).

L'EOS lui-même remonte à **Kafka 0.11 (juin 2017)** via **KIP-98** (producteur idempotent par PID + numéros de séquence par partition ; transactions inter-partitions atomiques ; consommateur read_committed/read_uncommitted) [eos-origine] (`confirmé`). **Correction de traçabilité majeure** : la nomenclature EOS de Kafka Streams. Le nom `exactly_once_v2` **n'existe que depuis Kafka 3.0** (KIP-732, qui renomme `exactly_once_beta`) ; le mécanisme `eos-beta` provient de **Kafka 2.6.0** (KIP-447) — **l'affirmation initiale « introduit en Kafka 2.5 » est erronée** [eos-v2-streams][kip732] (`confirmé`).

### Faits datés et cités

- **Kafka 4.3.0 = 2026-05-22** (25 KIPs, 600+ commits) ; **4.2.1 = 2026-05-30** ; l'ordre 4.3.0 avant 4.2.1 est **réel** (deux lignes distinctes) [kafka-courante] (`confirmé`, haut enjeu).
- **Kafka 4.0.0 = 2025-03-18** (relevé de « probable » à `confirmé`) ; correctifs 4.0.1 (13 oct. 2025), 4.0.2 (16 mars 2026) [kafka-4-0] (`confirmé`).
- **Kafka 4.1.0 = 2025-09-04** ; KIP-932 en **PREVIEW** (« *still not ready for production* ») [kafka-4-1] (`confirmé`).
- **KIP-890** : statut wiki « Approved » ; la doc officielle 4.1 confirme l'**activation serveur automatique depuis Kafka 4.0** et le *bump* d'epoch par transaction [kip890-protocole][kip890] (`confirmé`).
- **KIP-939** (participation 2PC externe) : statut « Accepted », **aucune version d'intégration spécifiée** → marqueur `à vérifier` **maintenu** ; `transaction.two.phase.commit.enable` (défaut false) ; adoption attendue d'abord via Apache Flink (FLIP-319) [kip939] (`probable`).
- **Tiered Storage (KIP-405)** : production-ready **depuis 3.9** (verbatim wiki) — **ce n'est plus un différenciateur Confluent exclusif** en juin 2026 [tiered] (`confirmé`).
- **Patrons IA** (verbatim Confluent, 5 mai 2026) : *transactional outbox* + Debezium CDC [outbox] ; log = **mémoire stateful avec replay déterministe** ; DLQ avec prompt-id/model-version/offset ; *data contracts* CEL pour masquage PII [kafka-memoire] (`confirmé`).

### Tableau 5 — Chronologie des versions Apache Kafka (vérifiée le 8 juin 2026)

| Version | Date (Apache) | Apport majeur | Statut | Source |
|---|---|---|---|---|
| 4.3.0 | **2026-05-22** | 25 KIPs, 600+ commits ; version courante | `confirmé` | [kafka-courante] |
| 4.2.1 | 2026-05-30 | Correctif (ligne maintenance 4.2.x) | `confirmé` | [kafka-courante] |
| 4.2.0 | **2026-02-17** | KIP-932 (Share Groups) **GA** ; KIP-1228 | `confirmé` | [kafka-4-2] |
| 4.1.0 | 2025-09-04 | KIP-932 **PREVIEW** ; KIP-1071 early access | `confirmé` | [kafka-4-1] |
| 4.0.0 | **2025-03-18** | Sans ZooKeeper (KRaft) ; KIP-890 actif par défaut | `confirmé` | [kafka-4-0] |
| 0.11.0.0 | 2017-06 | KIP-98 : EOS (idempotence + transactions) | `confirmé` | [eos-origine] |

### Tableau 6 — Nomenclature EOS de Kafka Streams (correction de traçabilité)

| Nom de configuration | KIP | Version d'apparition | Statut juin 2026 |
|---|---|---|---|
| `exactly_once` (eos-alpha) | KIP-98/129 | 0.11 | **Retiré en 4.0** (KIP-732) |
| `exactly_once_beta` (eos-beta) | KIP-447 | **2.6.0** | Renommé en 3.0 |
| `exactly_once_v2` | KIP-732 | **3.0.0** | **Nom canonique** |

> ⚠️ **Correction** : l'énoncé candidat « exactly_once_v2 introduit en Kafka 2.5 » est **erroné** — `eos-beta` = 2.6.0 (KIP-447), nom `v2` = 3.0.0 (KIP-732) [eos-v2-streams][kip732].

### Tableau 7 — Frontière de garantie EOS (ancrage de la thèse τ)

| Périmètre | Garantie EOS Kafka | Implication agentique |
|---|---|---|
| read-process-write **interne** Kafka | **Oui** (atomique, multi-partitions) | Substrat déterministe |
| Appel RPC externe (store distant, **API LLM**, courriel, paiement) | **Non** [eos-limite] | Action probabiliste/non rejouable → ressort de τ |

### Divergences signalées

1. **Date Kafka 4.2.0** : Apache = **17 février 2026** vs Confluent = 20 février 2026. **Résolue** en faveur d'Apache (date de release ; l'écart Confluent reflète la date de publication du billet) [kafka-4-2].
2. **Nomenclature EOS** : « Kafka 2.5 » de l'énoncé initial corrigée via wikis KIP (KIP-447 = 2.6.0 ; KIP-732 = 3.0.0) [eos-v2-streams].
3. **Statut KIP-890** : page KIP « Approved » sans version vs doc officielle 4.1 (« *automatically enabled since Apache Kafka 4.0* »). Écart de granularité, pas contradiction [kip890-protocole].
4. **Version KIP-939 (2PC)** : aucune source primaire ne donne de version cible → `à vérifier` maintenu [kip939].
5. **Tiered Storage** : production-ready depuis 3.9 confirmé ; la phase « early access 3.6 » souvent citée **n'est pas** sur la page KIP-405 consultée — à sourcer séparément [tiered].

### Marqueurs d'incertitude

- `confirmé` : versions 4.0–4.3, EOS/KIP-98, nomenclature corrigée, KIP-890 (via doc officielle), Tiered Storage, limite effets de bord, patrons IA.
- `probable` : ordre intra-partition `max.in.flight ≤ 5` avec idempotence (borne issue de Confluent, à recouper sur la doc Producer Configs) ; KIP-939 ; différenciateurs Confluent (pages « 2025 » non re-fetchées).
- `à vérifier` : **coût performance EOS** (~2-5 ms latence, ~10-20 % débit) — **source secondaire (Conduktor), aucun banc primaire**, à ne pas présenter comme normatif [eos-cout] ; défaut `isolation.level=read_uncommitted`.

### Questions ouvertes / à vérifier en relance

- Quelle version exacte d'Apache Kafka intégrera **KIP-939 (2PC)** ? Page KIP muette — vérifier les notes 4.x ultérieures et FLIP-319.
- Recouper le défaut `read_uncommitted` et le plafond `max.in.flight ≤ 5` sur `kafka.apache.org/documentation` plutôt que sur le billet Confluent.
- Existe-t-il un **rapport de performance primaire** (Apache/Confluent horodaté) quantifiant le surcoût latence/débit de l'EOS ? À défaut, remplacer par une mesure **AgentMeshKafka** propre.
- KIP-1071 (rebalance Streams) a-t-il atteint la GA en 4.2.0 ou 4.3.0 ?

---

## Ch. 9 — Substrats (II) : IBM MQ et l'event streaming transactionnel

**Insight-clé.** La distinction **delivery (transport) vs processing (applicatif)** est solidement étayée : l'« exactly-once **delivery** » au niveau transport est **impossible** sur réseau non fiable (Deux Généraux / FLP) ; seul l'« exactly-once **processing** » (atomicité applicative) est atteignable [exactly-once-impossible] (`confirmé`). IBM MQ assure le *once-and-only-once* par la conjonction **persistance + syncpoint (MQCMIT/MQBACK) + coordination transactionnelle** [mq-eos-mechanism] (`confirmé`), là où Kafka est un **log à rétention relisable** [mq-vs-kafka-retention] (`confirmé`). La règle de décision substrat (MQ ⇐ atomicité/ordre/conformité ; Kafka ⇐ débit/replay/fan-out) reste une **synthèse argumentative**, non un fait normatif [mq-kafka-decision-rule] (`probable`).

### Synthèse de l'état de l'art

**Réserve méthodologique de premier ordre** : les pages `ibm.com` (`/docs`, `/new/announcements`, `/support`) renvoient **HTTP 403** à l'agent de *fetch* (protection anti-robot). Leur contenu a été corroboré via extraits de recherche pointant ces mêmes pages primaires + blogs d'ingénieurs **IBM Hursley** signés (Ian Harwood) ; une **lecture intégrale directe n'a pu être faite** — d'où le marqueur `probable` là où la double corroboration restait indirecte.

Le **pontage MQ→Kafka** via Kafka Connect n'atteint l'exactly-once que sous **contraintes strictes** confirmées par les docs Confluent ET IBM Event Streams : un seul consommateur (`tasks.max=1`), file d'état dédiée, mode distribué, `exactly.once.source.support=enabled`, ACL appropriées, Connect ≥ 3.3.0 — sans quoi : at-least-once [mq-kafka-bridge] (`confirmé`). **Divergence de numérotation résolue** : deux lignées distinctes — le connecteur open-source IBM `kafka-connect-mq-source` introduit l'exactly-once en **v2.0.0** (v1 = at-least-once), tandis que la distribution Confluent suit une numérotation propre (**v12.x** support introduit, v11.x déprécié) [mq-connector-divergence] (`confirmé`).

### Faits datés et cités

- **MQ 9.4.0 LTS** : annoncé 14 mai 2024, **GA 18 juin 2024** ; support **≥ juin 2029**, extensible jusqu'à **2033** ; support OpenTelemetry [mq-940-lts] (`confirmé`).
- **MQ 9.4.5 CD** : **GA 5 février 2026** (Multiplateformes/Appliance), correctifs jusqu'au 5 février 2027 ; Java 25, .NET 10, EKS Operator GA. **Date z/OS exacte (2026-02-20) `à vérifier`** [mq-945-cd] (`confirmé`, sauf date z/OS).
- **Cadence CD 2025** (relevée à `confirmé` via blogs IBM Hursley) : 9.4.2 (GA 27 fév. 2025 ; z/OS 21 mars 2025) ; 9.4.3 (GA 17 juin 2025) ; 9.4.4 (GA 16 oct. 2025 ; **z/OS 31 oct. 2025, ajoutée**) [mq-cd-cadence] (`confirmé`).
- **EOL** : 9.3 LTS standard **2027-09-30** / étendu 2031-09-30 ; 9.2 LTS standard **2025-09-30 (échu)** / étendu 2029-09-30 — relevé à `confirmé` via endoflife.date [mq-93-lts-eos] (`confirmé`).
- **EOS Kafka borné** (verbatim Confluent) : « *guaranteed within the scope of Kafka Streams' internal processing only* » [kafka-eos-scope] (`confirmé`).

### Tableau 8 — IBM MQ vs Apache Kafka : sémantique et critères de choix

| Dimension | IBM MQ | Apache Kafka |
|---|---|---|
| Modèle de données | **File** (point-to-point + pub/sub) | **Log distribué partitionné** à rétention |
| Sort du message après consommation | **Retiré** (à la consommation validée) | **Conservé** (relecture/replay possible) |
| Garantie native | Once-and-only-once (persistant + syncpoint + coordination) | EOS bornée au périmètre interne Kafka |
| Coordination multi-ressources | **2PC / X-Open XA** (détail XA `à vérifier`, 403) | KIP-939 (2PC externe) « Accepted », version `à vérifier` |
| Fan-out multi-consommateurs | Limité | **Natif** (groupes indépendants) |
| Critère de préférence | Atomicité transactionnelle / ordre / conformité financière | Débit / replay / fan-out / découplage temporel |

*Sources : [mq-vs-kafka-retention][mq-xa-2pc][kip939][mq-kafka-decision-rule].*

### Tableau 9 — Lignées du connecteur source MQ→Kafka (divergence résolue)

| Lignée | Artefact | Exactly-once introduit | Statut antérieur |
|---|---|---|---|
| IBM open-source | `kafka-connect-mq-source` | **v2.0.0** | v1 = at-least-once |
| Confluent Platform | IBM MQ Source Connector | **v12.x** | v11.x déprécié |

> Les deux numéros (v2 côté IBM, v12.x côté Confluent) désignent des **artefacts/packagings différents** et **ne sont pas contradictoires** [mq-connector-divergence].

### Divergences signalées

1. **Connecteur MQ→Kafka** : numérotation IBM open-source (v2.0.0) vs Confluent (v12.x). **Résolue** : deux lignées distinctes [mq-connector-divergence].
2. **Native HA Cross-Region Replication (CRR) — version d'introduction** : sources IBM divergentes — **9.4.2** (selon un extrait d'annonce 9.4.4) vs **9.4.3** (selon un autre extrait). **NON RÉSOLUE** — à trancher par lecture directe (bloquée par 403) [mq-native-ha-crr] (`probable`).
3. **Surcoût EOS Kafka** (~2-5 ms / ~10-20 %) : chiffres de blogs techniques (Strimzi/CNCF, ActiveWizards), **sans référence de mesure primaire** — ordre de grandeur, non normatif [kafka-eos-cost].
4. **Statistiques de marché mainframe** (IBM Z ~63 %, > 70 % Fortune 500) : **chiffres d'analystes** (Mordor, BMC), non corroborés par source primaire éditeur — `à vérifier` [mq-financial-positioning].

### Marqueurs d'incertitude

- `confirmé` : mécanisme MQ once-and-only-once, impossibilité de l'exactly-once delivery, EOS Kafka borné, contraintes du pont MQ→Kafka, lignées de connecteur, dates haut-enjeu MQ (9.4.0, 9.4.5 GA, cadence CD 2025, EOL 9.2/9.3).
- `probable` : détail XA/2PC embarqué (403), Native HA CRR (version d'introduction divergente), surcoût EOS Kafka, thèse « event-driven > RPC », règle de décision substrat.
- `à vérifier` : positionnement financier MQ via chiffres d'analystes ; date z/OS exacte de 9.4.5.

### Questions ouvertes / à vérifier en relance

- Détail exact du protocole **2PC/X-Open XA** dans IBM MQ (coordinateur embarqué vs participant) — page IBM en 403 ; piste : Redbook IBM MQ ou cache Knowledge Center.
- **Date z/OS exacte de 9.4.5** (claim initial : 2026-02-20) — le billet IBM dit « *PTFs available now* » sans date z/OS distincte.
- **Version d'introduction de Native HA CRR** (9.4.2 vs 9.4.3) — trancher via doc IBM dédiée et notes « What's new ».
- Affirmation « **RPO zéro** » pour CRR — non lue sur source primaire (asynchrone ⇒ RPO non nul en théorie).
- **Méthodologie** : prévoir une vérification manuelle/navigateur des dates IBM haut-enjeu (403 sur l'agent de fetch).

---

## Ch. 10 — Modernisation du mainframe IBM Z

**Insight-clé.** La modernisation Z de juin 2026 est **structurée par MCP comme couche d'intégration agentique** : z/OS Connect expose les API existantes comme **outils MCP** depuis la 3.0.98 (21 oct. 2025) [zosc-mcp] (`confirmé`), watsonx Assistant for Z (GA agentique 19 nov. 2025) exploite MCP comme interface commune [wxa4z-agentic][wxa4z-mcp] (`confirmé`/`probable`), et IBM publie un **MCP Gateway open-source** (ContextForge, Apache-2.0) fédérant MCP/A2A/REST/gRPC [mcp-gateway] (`confirmé`). **Correction majeure** : le claim « z/OS Connect 3.0.101 = dernière version » est **périmé** — 3.0.102 (avril 2026) et la CD update 3.0.103 (mai 2026, APAR PH70973) lui succèdent [zosc-version-latest] (`confirmé`).

### Synthèse de l'état de l'art

**Réserve méthodologique** : comme au Ch. 9, les pages `ibm.com/docs` renvoient **HTTP 403** — d'où plusieurs `à vérifier` (transport/auth MCP de z/OS Connect, attribution de l'exécution in-CICS-region à 3.0.88).

**z/OS Connect** se déploie en Started Task, CICS JVM Server ou conteneur OCI (Liberty 25.0.0.9 en 3.0.98, **porté à 26.0.0.3 en 3.0.102**) [zosc-deploy][zosc-3102] (`confirmé`), supporte CICS/IMS/Db2 (MQ `probable` en 3.0) [zosc-subsystems] (`probable`), et les modes provider et **API requester sortant** OAS3 [zosc-requester] (`confirmé`).

**watsonx Assistant for Z** a atteint la GA agentique le **19 nov. 2025** (Agent Builder, orchestration multi-agents) [wxa4z-agentic] (`confirmé`), progressé à **v3.2 (GA 13 mars 2026** : *flow builder* graphique, ACF2/Top Secret via SAF) [wxa4z-v32] (`confirmé`), avec **Spyre GA le 12 déc. 2025** (Granite 3.3-8B-instruct sur z17) [wxa4z-spyre] (`confirmé`). Le dépôt `IBM/z-ai-agents` v1.2.1 (15 mai 2026) fournit Helm charts et agents nommés (CICS/Db2/IMS/OMEGAMON/zRAG/Concert) [z-ai-agents] (`confirmé`).

**watsonx Code Assistant for Z** : code-gen COBOL + preview Assembler en **v2.6 (27 juin 2025)** [wcaz-code-gen] (`confirmé`), expérience agentique + outils MCP (Z Understand Metadata Retrieval, Impact Analysis) en 2.8 [wcaz-mcp][wcaz-version] (`confirmé`/`probable` pour le patch 2.8.20 partner-source CROZ).

**IBM Bob** (successeur AI-first) atteint la **GA mondiale le 28 avril 2026** [bob-ga] (`confirmé`), avec un **Bob Premium Package for Z** (modes Architect/Code, contexte Zaware) en **preview technique privée sans frais** [bob-premium] (`confirmé`).

**Cloud Pak for Integration 16.1.3** : GA 17 déc. 2025 (OpenShift 4.19/4.20, Kubernetes 1.33) [cp4i-version] (`confirmé`), AI Agents en tech preview jusqu'au 31 mars 2026 [cp4i-ai-agents] (`confirmé`).

**Z Open Editor** : MCP introduit en **v6.0.0 (19 sept. 2025**, 40 outils MCP, mode Agent VS Code via Zowe) [zopeneditor-mcp] (`confirmé`).

### Tableau 10 — Cartographie de l'agentique mainframe IBM Z (juin 2026)

| Produit / Dépôt | Capacité agentique / MCP | Version & date | Statut |
|---|---|---|---|
| **z/OS Connect** | API exposées comme **outils MCP** | 3.0.103 (mai 2026) ; MCP dès **3.0.98** (21 oct. 2025) | `confirmé` |
| **watsonx Assistant for Z** | Agent Builder, MCP couche d'intégration | **v3.2** (GA 13 mars 2026) ; agentique GA 19 nov. 2025 | `confirmé` |
| **Spyre pour wxA4Z** | Inférence on-Z (Granite 3.3-8B) | GA **12 déc. 2025** | `confirmé` |
| **watsonx Code Assistant for Z** | Expérience agentique + outils MCP | **2.8** (code-gen v2.6, 27 juin 2025) | `confirmé` |
| **IBM Bob** | Partenaire AI-first multi-modèles | **GA 28 avril 2026** | `confirmé` |
| **Bob Premium Package for Z** | Modes Architect/Code, contexte Zaware | preview privée sans frais (à la GA) | `confirmé` |
| **Cloud Pak for Integration 16.1.3** | AI Agents (langage naturel) | GA 17 déc. 2025 ; AI Agents preview → 31 mars 2026 | `confirmé` |
| **mcp-context-forge (MCP Gateway)** | Fédère MCP/A2A/REST/gRPC (Apache-2.0) | **v1.0.2** (26 mai 2026) | `confirmé` |
| **IBM/z-ai-agents** | Helm charts agents Z | v1.2.1 (15 mai 2026) | `confirmé` |
| **Z Open Editor** | 40 outils MCP, mode Agent via Zowe | MCP dès **v6.0.0** (19 sept. 2025) | `confirmé` |

### Tableau 11 — IBM Bob : modèles employés (claim réfuté sur sa conclusion)

| Modèle | The Register / DevClass (secondaires) | **IBM Newsroom (primaire, 28 avril 2026)** | Statut révisé |
|---|---|---|---|
| « frontier LLMs / open-source / SLM / Granite » | **Oui** (formulation générique) | Oui | `confirmé` |
| **Anthropic Claude** | Non nommé | **Nommé explicitement** | **`confirmé`** (et non « à vérifier ») |
| **Mistral** (open source) | Non nommé | **Nommé explicitement** | **`confirmé`** |
| **Meta Llama** | Non nommé | **Non nommé** | **Non confirmé / `à vérifier`** |

> ⚠️ **Note de vérification critique** [bob-models] : le claim original portait `verdictAdversarial="refute/a verifier"` et `confiance="a verifier"`. **Sa lecture des deux sources secondaires est exacte** (The Register et DevClass restent génériques, sans nommer aucun modèle). **Mais sa conclusion est PÉRIMÉE/RÉFUTÉE** : la **source primaire IBM Newsroom (28 avril 2026)** nomme explicitement « *a mix of frontier models including Anthropic Claude, Mistral open source models, and IBM Granite* ». **Anthropic Claude et Mistral sont donc `confirmés` par source primaire éditeur** ; seul **Meta Llama demeure non confirmé**. Pour le *naming*, citer l'annonce IBM Newsroom — **non** The Register/DevClass.

### Divergences signalées

1. **z/OS Connect « dernière version »** : le claim initial fixait 3.0.101 (23 fév. 2026) ; en juin 2026, **3.0.102** (avril 2026) et **3.0.103** (mai 2026, APAR PH70973) lui succèdent. Le contenu de 3.0.101 (Operator sur z/OS Container Platform) reste exact [zosc-version-latest].
2. **Date de 3.0.102** : l'URL du blog IBM Community porte le **20 avril 2026**, le corps de l'article indique **23 avril 2026** — divergence intra-source non résolue ; retenir « avril 2026 » [zosc-3102].
3. **Modèles d'IBM Bob** : The Register/DevClass ne nomment que « frontier/open-source/SLM/Granite » ; **IBM Newsroom nomme Claude et Mistral** (réfutant le « à vérifier » initial pour ces deux) ; **Llama reste non nommé** [bob-models].
4. **Portée des sous-systèmes z/OS Connect** : CICS/IMS/Db2 confirmés ; **MQ** listé sur la page produit mais **non re-confirmé** dans la doc 3.0 (403) [zosc-subsystems].
5. **Pages ibm.com/docs en 403** : transport/auth MCP de z/OS Connect et attribution de l'exécution in-CICS-region à 3.0.88 **non confirmés** [zosc-mcp-mechanism][zosc-cics-region].

### Marqueurs d'incertitude

- `confirmé` : 3.0.103/3.0.102, MCP en 3.0.98, déploiement et requester, wxA4Z agentique + v3.2 + Spyre, z-ai-agents, wcaz code-gen v2.6 + outils MCP, IBM Bob GA + Premium Z, CP4I 16.1.3 + AI Agents, MCP Gateway, Z Open Editor MCP.
- `probable` : couverture MQ en z/OS Connect 3.0, exécution in-CICS-region attribuée à 3.0.88, couche MCP de wxA4Z (CICS/MQ nominaux), patch wcaz 2.8.20 (partner-source CROZ), composants CP4I.
- `à vérifier` : **transport/auth MCP de z/OS Connect** (docs 403) [zosc-mcp-mechanism] ; **présence nominale de Meta Llama** dans IBM Bob [bob-models].

### Questions ouvertes / à vérifier en relance

- Quel **transport MCP** (HTTP streamable / SSE / stdio) et quel **modèle d'authentification** z/OS Connect 3.0 emploie-t-il ? (docs 403 — vérifier via PDF Knowledge Center ou client authentifié.)
- L'exécution in-CICS-region a-t-elle été introduite précisément en **3.0.88 / décembre 2024** ? (change history inaccessible.)
- IBM Bob emploie-t-il nommément **Meta Llama** ? (IBM Newsroom nomme Claude et Mistral, pas Llama.)
- La couche MCP de wxA4Z couvre-t-elle nommément **CICS et MQ** (en plus de Db2 et IMS) ?
- Existe-t-il une release z/OS Connect **postérieure à 3.0.103** en juin 2026 ? Surveiller le flux « now available » et les APAR.
- Versions exactes de chaque composant CP4I 16.1.3 (ACE, API Connect, MQ, DataPower, Event Streams, Aspera, webMethods) — docs en 403.

---

## Synthèse transversale de la PARTIE III

Trois constats structurent la base probante au 8 juin 2026 :

1. **Consolidation institutionnelle par stratification.** MCP (→ AAIF/LF), A2A (→ LF, absorbant ACP), AGNTCY (→ LF) convergent **en couches complémentaires** sous la Linux Foundation, non en protocole unique [CONV-001][7][AGNTCY-004]. La gouvernance se formalise (SEP-932 pour MCP, A2A TSC, AAIF Platinum).

2. **La frontière déterministe/probabiliste est empiriquement attestée.** L'EOS de Kafka (et l'impossibilité de l'exactly-once delivery transport) borne explicitement la garantie au périmètre interne ; **tout effet de bord externe — dont l'appel à une API LLM — échappe à la garantie** [eos-limite][kafka-eos-scope]. C'est le socle factuel de l'opérateur τ et de la distinction substrat/action.

3. **Le mainframe adopte MCP comme couche d'intégration agentique standard**, d'IBM z/OS Connect à watsonx Assistant/Code Assistant for Z, jusqu'au MCP Gateway open-source [zosc-mcp][wxa4z-mcp][mcp-gateway].

**Réserves transversales** : (a) plusieurs paramètres MCP du RC 2026-07-28 restent `probable` (non finalisés) ; (b) le blocage HTTP 403 sur `ibm.com/docs` impose une vérification manuelle des dates IBM haut-enjeu et laisse plusieurs détails techniques (transport/auth MCP z/OS Connect, XA/2PC, Native HA CRR) en `à vérifier` ; (c) les chiffres d'adoption en production nominative (A2A) et de marché (mainframe) relèvent de communiqués ou d'analystes, non de sources éditeur/peer-reviewed.


---


# PARTIE IV — Identité, autorité déléguée et menaces dans l'entreprise agentique

> Dossier d'état de l'art, arrêté au **8 juin 2026**. Base probante verbatim sur sources primaires (IETF Datatracker, CNCF, W3C, NIST/NCCoE, AWS, Eclipse Foundation, OWASP, MITRE, dépôts GitHub officiels). Les marqueurs d'incertitude — `confirmé`, `probable`, `hypothèse`, `à vérifier` — sont normatifs et ne doivent pas être lissés. Les énoncés à verdict adversarial `réfuté/à vérifier` sont présentés **avec ce statut**, jamais comme acquis.

---

## Ch. 11 — Identité des charges et des agents

### Insight-clé

**Au 8 juin 2026, l'identité de charge agentique repose sur un socle déterministe mûr (SPIFFE/SPIRE, `Graduated` CNCF depuis 2022) mais sur une couche protocolaire IETF encore entièrement pré-RFC : aucun document du groupe WIMSE n'a atteint le statut RFC, et l'identité spécifiquement *agentique* n'existe qu'en drafts individuels non adoptés.** Trois piliers cohabitent à des maturités hétérogènes : (1) le cadre **SPIFFE/SPIRE** (CNCF, gradué), stabilisé et largement déployé ; (2) la pile **WIMSE/OAuth** (IETF), en standardisation active mais sans RFC ; (3) la famille **DID/VC** du W3C, partiellement recommandée (VC 2.0) et partiellement en *Candidate Recommendation* (DID v1.1). La thèse architecturale : l'industrie **compose** des briques éprouvées (OAuth Token Exchange, SPIFFE, attestation) plutôt qu'elle n'invente un protocole d'agent dédié.

### 1. SPIFFE/SPIRE — le socle gradué

SPIFFE et SPIRE sont des projets CNCF au niveau **`Graduated`** [1][2]. La trajectoire de maturité est confirmée verbatim sur les pages projet CNCF : acceptés le **29 mars 2018**, passés `incubating` le **22 juin 2020**, puis `graduated` — **le 22 août 2022 pour SPIRE** et **le 23 août 2022 pour SPIFFE** [1][3]. L'annonce officielle de graduation conjointe date du **20 septembre 2022** ; elle s'accompagne d'un audit tiers Cure53 (en sus de la revue TAG Security de début 2020) et liste des adopteurs de production : Bloomberg, ByteDance, Pinterest, Twilio, Anthem, GitHub, Netflix, Niantic, Uber, Carelon Digital Platforms, Indeed.com, HPE/Cray [4].

> **DIVERGENCE (à ne pas lisser) [1][3].** La date de bascule `graduated` diffère d'**un jour** entre les deux projets (SPIRE 2022-08-22 ; SPIFFE 2022-08-23). Cet écart est confirmé tel quel par les deux pages projet CNCF ; l'annonce conjointe porte quant à elle la date du 2022-09-20. Citer les **deux** dates de bascule plus la date d'annonce, sans les fusionner.

La dernière version stable de SPIRE est **v1.15.1**, publiée le **28 mai 2026** : correctif de sécurité sur le plugin d'attestation de nœud serveur `azure_imds` (validation de certificat impropre permettant la forge de documents attestés). Backport `v1.14.7` le même jour ; `v1.15.0` (fonctionnalités) le 19 mai 2026 [5] `confirmé`.

**Spécifications (confirmées au mot).** Un **SPIFFE ID** est un URI RFC 3986 de schéma `spiffe://`, composé d'un *trust domain* et d'un chemin ; il **DOIT** porter le schéma `spiffe`, un *trust domain* non vide, et **NE DOIT PAS** inclure de composante *query* ou *fragment* ; les implémentations **DOIVENT** supporter jusqu'à **2048 octets** (et **NE DEVRAIENT PAS** générer au-delà) ; *trust domain* ≤ **255 octets** [6]. Le **X.509-SVID** encode le SPIFFE ID comme URI dans le SAN : « *An X.509 SVID MUST contain exactly one URI SAN* » ; feuilles `cA=false`, `digitalSignature` obligatoire, `keyCertSign`/`cRLSign` interdits [7]. Le **JWT-SVID** place le SPIFFE ID dans `sub` ; `aud` obligatoire et validée ; `alg` restreint aux familles asymétriques RFC 7518 §3.3/3.4/3.5 (RS\*, ES\*, PS\*), excluant de facto `none` et HS\* [8] `confirmé`. SPIRE réalise l'attestation en deux phases — *node attestation* puis *workload attestation* ; la fédération inter-domaines relève d'une **spécification SPIFFE Federation distincte**, non détaillée sur la page « SPIRE Concepts » [9] `confirmé`.

**Écosystème commercial (`confirmé` sauf mention).** HashiCorp Vault Enterprise 1.21 ajoute l'authentification SPIFFE native (émission de X.509-SVID), et Vault Enterprise 2.0 un moteur de secrets SPIFFE émettant des JWT-SVID — billet HashiCorp daté du **30 avril 2026** [10] (correction : la date « 2025 » des claims initiaux est erronée). Red Hat propose le **Zero Trust Workload Identity Manager**, opérateur OpenShift en *tech preview* basé sur SPIFFE/SPIRE (page publiée 2025-10-08) [11]. **Defakto** (anciennement SPIRL) a levé une Série B de **30,75 M$** le 21 octobre 2025, menée par XYZ Venture Capital ; cofondateurs Eli Nesterov (CTO) et Danny Oliveri (CEO) [12][13] `probable`.

> **CORRECTION / RÉTROGRADATION MAJEURE — adoption Uber [14].** Le blog d'ingénierie Uber primaire (2023-11-09) confirme verbatim « *4,500 services running on hundreds of thousands of hosts across four clouds* » et « *over 1/4 million nodes* » (> 250 000 nœuds, 4 nuages) via SPIRE. **En revanche, la statistique « > 1 milliard de *credentials* SPIFFE/jour » N'EST PAS présente dans ce blog primaire** ; la source HashiCorp antérieurement citée ne mentionne pas Uber. Cette portion passe à **`à vérifier`** (piste : transcript de la conférence CNCF « *Changing the SPIFFE ID of Every SPIRE-Enabled Workload at Uber* » ou *case studies* spiffe.io [14]). Retenir uniquement le primaire.

> **CORRECTIONS Defakto [12].** La source primaire ne cite **pas** Evan Gilman parmi les cofondateurs (il est co-auteur du livre O'Reilly SPIFFE/SPIRE, non désigné cofondateur ici). Le total cumulé « ~49 M$ levés » et l'année de fondation « 2022 » ne figurent pas dans le billet de Série B → **`à vérifier`**.

Note épistémique : le positionnement de SPIFFE comme « standard de facto de l'identité de charge, pilier de l'identité non-humaine (NHI) et fondation de l'identité des agents IA » est un **cadrage convergent d'éditeurs** (HashiCorp, Palo Alto Networks), à traiter comme positionnement industriel, **non** comme énoncé normatif d'un organisme de normalisation [10][15] `probable`.

### 2. WIMSE (IETF) — la couche protocolaire, sans RFC

Le groupe **WIMSE** (Workload Identity in Multi-System Environments) opère sous la charte `charter-ietf-wimse-01` (statut **Approuvé**), chaires **Justin Richer** et **Pieter Kasselman**, *Area Director* **Charles Eckel** [16][17] `confirmé`. La charte mentionne explicitement la collaboration avec la CNCF « *particularly with regard to the SPIFFE/SPIRE project* » et combine OAuth, JWT et SPIFFE.

> **DIVERGENCE inter-blocs sur l'aire IETF.** Un bloc de vérification situe WIMSE en **Security Area** (présumée, non confirmée verbatim sur la page charte → `à vérifier`) ; un second bloc affirme l'aire **ART** (Applications and Real-Time) avec confirmation sur la page *About* [17]. Le second est plus précis (lecture directe de la page WG). **À recouper** via le champ *Area* de `datatracker.ietf.org/group/wimse/about/`.

**Au 8 juin 2026, AUCUN document WIMSE n'a atteint le statut RFC** : les 7 drafts WG sont tous au stade *Internet-Draft*, le plus avancé (`workload-identity-practices-04`, 28 p., 10 avril 2026, shepherd J. Richer) en état **« WG Consensus: Waiting for Write-Up »** [18][19] `confirmé`. La pile credentielle WIMSE :

| Draft WG | Rév. / date | Pages | État | Rôle |
|---|---|---|---|---|
| `draft-ietf-wimse-arch` | **-07** / 2026-03-02 | 27 | WG Document | Architecture de référence ; **§3.3.9 « AI and ML-Based Intermediaries »** (agents = charges déléguées, *re-bind* du contexte) [20][22] |
| `draft-ietf-wimse-workload-creds` | **-01** / 2026-05-05 | 24 | WG Document | Définit **WIT** (JWS/JWT, identité de charge) et **WIC** (X.509, SAN URI) ; remplace `s2s-protocol` [23][24] |
| `draft-ietf-wimse-wpt` | **-01** / 2026-03-02 | 19 | WG Document | *Workload Proof Token* : preuve de possession applicative liée à la requête HTTP [25] |
| `draft-ietf-wimse-http-signature` | **-03** / 2026-04-07 | 19 | WG Document | Auth. via HTTP Message Signatures (RFC 9421), s'appuie sur le WIT [26] |
| `draft-ietf-wimse-identifier` | **-02** / 2026-03-02 | 12 | WG Document | Identifiant = **URI absolu** (authority = *trust domain*) ; schémas `wimse://` et `spiffe://` [27] |
| `draft-ietf-wimse-mutual-tls` | **-01** / 2026-05-05 | 8 | WG Document | Auth. de charge par mTLS [18][28] |
| `draft-ietf-wimse-workload-identity-practices` | **-04** / 2026-04-10 | 28 | **Waiting for Write-Up** | Pratiques industrielles ; draft le plus avancé [18] |

**Le WIT (Workload Identity Token)** est un JWS/JWT, en-tête JOSE `typ=wit+jwt` ; claims requis `sub` (URI), `exp` (rafraîchi à l'ordre des heures), `cnf` (jwk de la clé publique) ; optionnels `iss`, `jti` ; **preuve de possession obligatoire** à la présentation [24] `confirmé`. Le draft `s2s-protocol` (prédécesseur) est **MORT** (`Dead/Replaced`, dernière rév. -07 du 2025-10-16), éclaté en quatre successeurs (`workload-creds`, `http-signature`, `mutual-tls`, `wpt`) — **ne pas le citer comme normatif** [21] (bloc SPIFFE) `confirmé`.

Outre les 7 drafts WG, la page Documents recense **7 drafts individuels** liés (versions -00 à -02, 2026-01-05 à 2026-06-07), dont `draft-ni-wimse-ai-agent-identity-02` (2026-02-28). Ces drafts **n'ont aucun statut normatif** [18] `confirmé`.

> **DIVERGENCE SYSTÉMIQUE (haut enjeu épistémique) [29][30].** Pour la quasi-totalité des drafts WG (WIMSE et OAuth), le champ métadonnée Datatracker **« Intended RFC status » affiche `(None)`** alors que l'en-tête *boilerplate* du document indique « Standards Track ». Conséquence : « Standards Track » est l'**intention déclarée par les auteurs** (en-tête), **non** un statut IESG assigné (métadonnée). Ne pas présenter « Standards Track » comme statut sanctionné pour ces drafts. Seul `identity-chaining-14`, parvenu au stade IESG, porte une métadonnée « Proposed Standard » assignée.

### 3. Chaînage OAuth — la primitive de délégation

| Document | État (8 juin 2026) | Statut visé | Détail |
|---|---|---|---|
| **RFC 8693** OAuth 2.0 Token Exchange | **RFC publiée** | Proposed Standard | Socle ; `subject_token`/`actor_token` ; impersonation + délégation ; jan. 2020 [31] |
| `draft-ietf-oauth-identity-chaining` | **-14** / 2026-06-02 ; **IESG `Approved-announcement::Revised I-D Needed`** (2026-06-04) | Proposed Standard (métadonnée assignée) | Le plus mature ; ballots « No Objection » 2-3 juin 2026 ; combine RFC 8693 + RFC 7523 [32][33] |
| `draft-ietf-oauth-transaction-tokens` | **-08** / 2026-03-02 ; « In WG Last Call » | Standards Track (en-tête) | Jalon IESG visé déc. 2026 ; propage identité + contexte d'autorisation dans un domaine de confiance [34] |
| `draft-ietf-oauth-identity-assertion-authz-grant` | **-04** / 2026-05-21 ; actif | None (métadonnée) / S.T. (en-tête) | Base du **Cross-App Access (XAA)** ; ID-JAG [35] |
| `draft-ietf-oauth-attestation-based-client-auth` | **-09** / 2026-05-26 | None / S.T. (en-tête) | Attestation de client liée à une clé [36] |
| `draft-ietf-oauth-spiffe-client-auth` | **-01** / 2026-03-02 | None / S.T. (en-tête) | Auth. de charges SPIFFE via SVID ; co-auteurs **NIST + IBM** [37] |
| `draft-ietf-oauth-v2-1` (OAuth 2.1) | **-15** / 2026-03-02 ; **reste un I-D** | — | Jalon IESG visé déc. 2026 ; **pas encore RFC** [38] |

> **PIÈGE DE DATATION CONFIRMÉ — Transaction Tokens [34].** Un résultat secondaire annonçait une révision « 2026-06-02 / exp. 2026-12-04 ». Sur la page canonique, la plus haute révision **numérotée déposée reste -08** (2026-03-02) ; aucune -09 au 8 juin 2026. La date « 2026-06-02 » correspond à la **copie éditeur continue `-latest`** (`drafts.oauth.net`), **non** à une révision officielle. Ne pas citer cette date comme une révision.

> **PRÉCISION — état d'`identity-chaining-14`.** Le claim initial le décrivait comme « Submitted to IESG for Publication ». L'état exact lu sur le datatracker est **« Approved-announcement to be sent::Revised I-D Needed »** : approuvé par l'IESG mais **révision requise** avant publication. Approuvé ≠ publié [32].

**Cross-App Access (XAA).** Formellement « Identity Assertion Authorization Grant », c'est une extension OAuth où un IdP d'entreprise gère la connexion entre deux applications, remplaçant l'approbation manuelle par un échange de jeton (via RFC 8693 + RFC 7523). Adoption **au stade précoce** selon OAuth.net : Okta en *early access* (IdP) ; Auth0 et Athenz en *beta* (serveur d'autorisation) ; Athenz aussi *beta* (IdP) ; Keycloak *in progress* ; **Claude Code (Anthropic)** listé comme client *beta* [39] `confirmé`.

### 4. Identité spécifiquement *agentique* — drafts individuels seulement

**Aucun standard agentique n'est au stade WG en juin 2026.** La couche agentique de l'IETF reste en drafts **individuels / Independent Submission**, de nature *Informational*, non adoptés :

| Draft | Rév. / date | Type | Statut | Apport |
|---|---|---|---|---|
| `draft-klrc-aiagent-auth` | **-02** / 2026-06-01 | Individuel | Informational | « *Rather than defining new protocols* » : compose WIMSE + OAuth ; co-auteurs Defakto, AWS, Zscaler, Ping, **OpenAI**, Okta [40] |
| `draft-araut-oauth-transaction-tokens-for-agents` | **-02** / 2026-05-22 | Individuel | **voir divergence ci-dessous** | `agentic_ctx` (métadonnées multi-agents) ; **atténuation monotone** confirmée verbatim ; auteur A. Raut (Amazon) [41] |
| `draft-embesozzi-oauth-agent-native-authorization` | **-00** / 2026-04-03 | **Independent Submission** | Informational | *Structured elicitation* + autorisation *just-in-time* (JIT) ; M. Besozzi [42] |
| `draft-oauth-ai-agents-on-behalf-of-user` | **-02** / 2025-08-25 | Individuel | **EXPIRÉ & archivé** | `requested_actor` + `actor_token` ; **NE PAS citer comme actif/normatif** [43] |

> **VERDICT ADVERSARIAL `réfuté/à vérifier` — `intended status` de `draft-araut-...-for-agents-02` [41].** Un bloc affirmait catégoriquement que « le datatracker affiche `(None)`, et non `Informational` ». **Cette affirmation absolutiste est réfutée sur le point précis** : le datatracker présente **les deux valeurs contradictoires** selon la vue — le champ métadonnée structuré « Intended RFC status » = `(None)`, tandis que l'en-tête de la révision -02 « Intended status: » = `Informational`. **Formulation correcte** : signaler la divergence interne des deux champs (document vs révision), **plutôt qu'affirmer `(None)` et non `Informational`**. Les autres faits (rév. -02, 2026-05-22, soumission individuelle non-WG, auteur A. Raut/Amazon, exp. 2026-11-23, remplace le prédécesseur, claims `act`/`sub`/`agentic_ctx` sans nouveau type de jeton ni *grant*) sont **`confirmés`**. Le second bloc IETF (C16) confirme par ailleurs `-02, Informational, individuel`, `agentic_ctx` + *Monotonic Attenuation* verbatim, et l'**absence de version WG** (URL `draft-ietf-oauth-transaction-tokens-for-agents` = **HTTP 404**) [41].

**Insight structurant (`confirmé` pour le constat de stade ; interprétatif pour l'intention) [40][32].** La stratégie dominante — portée par des acteurs récurrents (Defakto, Ping, Okta, AWS, OpenAI, Amazon) — est la **composition** de briques éprouvées (Token Exchange, attestation, identity-chaining, SPIFFE/WIMSE) plutôt que l'invention d'un protocole d'agent, confirmée verbatim par l'abstract de `klrc` (« *Rather than defining new protocols* »). À l'inverse, l'infrastructure de délégation inter-domaines sous-jacente (`identity-chaining-14`) atteint le stade **quasi-RFC** (IESG-approuvé).

### 5. W3C — DID et Verifiable Credentials

| Spécification | Statut | Date | Note |
|---|---|---|---|
| **DID Core v1.0** | **W3C Recommendation** | 2022-07-19 | Statut normatif stable de référence [44] |
| **DID v1.1** | **Candidate Recommendation Snapshot** | 2026-03-05 | **Pas encore REC** ; ≥ 2 implémentations/fonctionnalité ; type média `application/did` [45] |
| **VC Data Model v2.0** | **W3C Recommendation** | 2025-05-15 | Concepts cœur de la famille VC 2.0 [46] |
| **Famille VC 2.0** | **7 Recommendations** | 2025-05-15 | Data Model 2.0, Data Integrity 1.0, EdDSA + ECDSA Cryptosuites, JOSE-COSE, Bitstring Status List, Controlled Identifiers ; **VC JSON Schema** et **BBS Cryptosuites** restent en CR [47][48] |

> **CONVERGENCE SPIFFE ↔ WIMSE — `à vérifier` [49].** La relation de convergence (support des WIT par SPIFFE, recouvrement WIT/SVID) **n'est pas confirmée** par les sources primaires : la page d'aperçu spiffe.io ne mentionne ni WIMSE ni le Workload Identity Token. Le recouvrement conceptuel est plausible (WIT JWT à clé confirmée vs JWT-SVID), mais tout travail formel de support reste **`à vérifier`**. Retrogradé de `probable` à `à vérifier` faute de source primaire.

### Questions ouvertes / à vérifier en relance — Ch. 11

- Confirmer l'**aire IETF** exacte de WIMSE (ART vs Security ; divergence inter-blocs) via le champ *Area* du datatracker.
- Vérifier la statistique Uber « **> 1 milliard de credentials/jour** » sur source primaire Uber/CNCF (actuellement non sourcée par le primaire).
- Confirmer l'**année de fondation** de SPIRL/Defakto (2022 ?) et le **total cumulé levé** (~49 M$ ?) — absents du billet Série B.
- Calendrier réel des **premières RFC WIMSE** : seul le jalon architecture (IESG, 31 juillet 2026, informational) est daté ; les RFC complets sont vraisemblablement un événement **2027-2028** (`hypothèse`, non engagement officiel).
- Trajectoire de standardisation de l'**identité des agents** : un WG (WIMSE ou OAuth) adoptera-t-il un document normatif dédié d'ici 2027 ? Surveiller `araut-02` et `ni-wimse-ai-agent-identity-02`.
- Date effective de passage de **DID v1.1 en REC** (fenêtre « pas avant le 5 avril 2026 » ; statut CR au 8 juin 2026).
- Articulation normative **WIT (WIMSE) ↔ JWT-SVID (SPIFFE)** : recouvrement plausible, profil d'interopérabilité formel non établi.
- Statut de publication final de `identity-chaining` après la révision requise (« Revised I-D Needed ») : suivre la rév. ≥ 15 et l'entrée en file RFC Editor.

---

## Ch. 12 — Autorité déléguée : capacités atténuables vs politiques analysables

### Insight-clé

**La délégation d'autorité verifiable se structure autour d'une opposition architecturale fondatrice : transporter une autorité *atténuable* (jetons à capacités — Macaroons, Biscuit) versus évaluer une autorité *analysable* (langage de politiques — Cedar).** Les premiers incarnent le modèle *object-capability* (ocap) de Mark Miller — « la référence EST la permission », POLA, atténuation monotone hors-ligne — substrat naturel des chaînes multi-sauts d'agents. Cedar n'est **pas** un jeton atténuable mais un langage de politiques dont la force différenciante est l'**analysabilité formelle** (preuves Lean, *soundness* + *completeness*). Le pont vers l'agentique reste **émergent et non normatif** : `cedar-for-agents` (expérimental) et le préprint `AIP` (non revu) coexistent sans coordination, et **aucun standard IETF/W3C de jeton à capacités pour agents n'est confirmé en juin 2026**.

### 1. Le modèle object-capability et les jetons atténuables

Le modèle **ocap** de Mark Miller pose que « la référence EST la permission » : un composant détient exactement l'autorité requise (POLA), et un agent ne peut déléguer plus d'autorité qu'il n'en possède — il peut seulement passer une capacité **atténuée** [50][51] `confirmé` (sources secondaires/curation pour le cadrage).

**Macaroons** : article fondateur « *Macaroons: Cookies with Contextual Caveats for Decentralized Authorization in the Cloud* », **NDSS 2014** (Internet Society), 6 auteurs Google (Birgisson, Politz, Erlingsson, Taly, Vrable, Lentczner) — titre, *venue*, année et liste d'auteurs confirmés au mot [52]. Mécanisme : jetons **porteurs** (*bearer*) par chaîne de MAC imbriqués (HMAC) ; *first-party caveats* (atténuation locale) ; *third-party caveats* exigeant une preuve de décharge (*discharge macaroon*) [53] `confirmé`.

**Biscuit** : proposé à l'Eclipse Foundation (proposition du **22 juillet 2024**), projet « Eclipse Biscuit » **`Incubating`** sous parent « Eclipse Technology » ; lead Clément Delafargue ; parties prenantes Outscale et Clever Cloud [54] `confirmé`. Atténuation **hors-ligne** par liste de blocs *append-only* signés (le porteur ajoute un bloc de *checks* sans retirer ni remplacer) ; **Ed25519** par défaut, ECDSA secp256r1 (SEC2v1) en alternative ; version *sealed* bloquant toute atténuation ultérieure ; sérialisation Protocol Buffers [55] `confirmé`. Langage **Datalog sans négation** (types : variable, entier, chaîne, octets, date, booléen, null, set, array, map) [56] `confirmé`.

> **DIVERGENCE DE VERSIONNEMENT BISCUIT (à manier avec rigueur) [57][58].** Le numéro de **spécification/format Datalog (v3.3, encodé `6`)** est distinct du numéro de la **bibliothèque Rust `biscuit-auth` (≥ 5.0.0)**. Ne jamais confondre dans une citation normative. La spec v3.3 a ajouté null, arrays, maps, appels de fonctions externes et l'opération `try` [57].

> **VULNÉRABILITÉ — CVE-2024-42350 [59].** Confusion de clé publique dans les *third-party blocks* (GHSA-rgqv-mwc3-c78m), publiée le 31 juillet 2024. **CORRECTION** : le score est **CVSS v3.1 = 3.0** (et non « CVSS v3.0 » comme libellé initialement). Versions affectées : `biscuit-auth` (Rust) ≤ 4, `org.biscuitsec.biscuit` (Maven) 3-4, spec 3-4. **Corrigée en 5.0.0** `confirmé`.

> **DIVERGENCE TEMPORELLE — statut *third-party blocks* [57].** « alpha » dans l'annonce de version (27 nov. 2024) vs « mature » dans la spécification courante (juin 2026). À dater, **non** une contradiction.

### 2. Cedar — politiques analysables et vérification Lean

Cedar : article de référence « *Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization* », **OOPSLA 2024** (PACMPL, DOI 10.1145/3649835) ; article compagnon « *How We Built Cedar: A Verification-Guided Approach* », **FSE 2024** (DOI 10.1145/3663529.3663854) ; implémentation **Rust**, propriétés formellement vérifiées avec **Lean** [60][61][62] `confirmé`. L'approche *verification-guided development* (VGD) maintient des modèles Lean exécutables en parallèle du Rust de production ; validation par *differential random testing* (Lean ↔ Rust) ; **4 bugs de *soundness* + 21 bugs** trouvés/corrigés [62][63] `confirmé`.

**Cedar Analysis** (annonce AWS du **16 juin 2025**) comprend le *Cedar Symbolic Compiler* (implémenté en Lean, preuves de ***soundness* ET *completeness***) et la *Cedar Analysis CLI* [64]. Crate associé `cedar-policy-symcc` **v0.5.1** (1 juin 2026) confirmé via la page de releases [65] `confirmé`. Cedar a rejoint la CNCF comme projet **`Sandbox`** (annonce AWS du **15 décembre 2025**), trajectoire annoncée « Sandbox → Incubation → Graduated » [66] `confirmé`.

> **DIVERGENCE DE VERSIONNEMENT CEDAR (à manier avec rigueur) [67][68].** La version du **LANGAGE Cedar (4.5**, supporté par Amazon Verified Permissions depuis le 21 août 2025, opérateur `is`) est distincte de la version du **CRATE/SDK Rust (4.11.0**, 18 mai 2026, module `pst`). Un changement cassant de l'API Rust n'implique **pas** un changement cassant du langage [69].

### 3. Le pont agentique — émergent, non normatif

`cedar-policy/cedar-for-agents` : pont expérimental entre Cedar et systèmes d'agents IA (~30 étoiles). Composant vérifié : **`cedar-policy-mcp-schema-generator-v0.6.0`** (26 mai 2026) — génère un schéma Cedar depuis les descriptions d'outils d'un serveur MCP — et `cedar-analysis-mcp-server` [70]. **PRÉCISION** : pas de release globale « cedar-for-agents 0.6.0 » monolithique ; le dépôt est multi-crates. La documentation **ne détaille pas** de chaînes de délégation multi-sauts [70] `confirmé`.

> **VERDICT — préprint AIP : `à vérifier` pour usage normatif [71].** « *AIP: Agent Identity Protocol for Verifiable Delegation Across MCP and A2A* » (arXiv:2603.24775, auteur unique S. Prakash, 25 mars 2026, cs.CR) introduit des *Invocation-Bound Capability Tokens* (IBCTs) combinant délégation vérifiable par clé publique, atténuation côté porteur et politique chaînée, surcoût annoncé < 2,35 ms ; l'article affirme avoir scanné ~2000 serveurs MCP tous dépourvus d'authentification. **STATUT : préprint non revu par les pairs, à auteur unique — ne PAS citer comme normatif.** Aucun standard IETF/W3C de jeton à capacités pour agents confirmé à cette date.

### 4. Tableau comparatif — modèles de délégation

| Dimension | Macaroons | Biscuit | Cedar |
|---|---|---|---|
| **Nature** | Jeton porteur atténuable | Jeton porteur atténuable | Langage de **politiques** (pas un jeton) |
| **Atténuation** | Hors-ligne, décentralisée (caveats) | Hors-ligne, blocs *append-only* | N/A (évaluée par moteur) |
| **Crypto** | HMAC chaînés | Ed25519 (défaut) / ECDSA secp256r1 | Signatures sur les politiques (selon déploiement) |
| **Langage** | Caveats contextuels | **Datalog** (sans négation) | Langage de politiques dédié |
| **Force différenciante** | Simplicité, décentralisation | Datalog déclaratif + vérif. par clé racine | **Analysabilité formelle** (Lean, *soundness*+*completeness*) |
| **Évaluation** | Locale (vérif. de chaîne) | Locale (vérif. de chaîne) | Moteur (centralisé AVP ou embarqué) |
| **Risque** | Vol du *bearer* | Vol du *bearer* | Erreur de politique (atténué par analyse formelle) |
| **Pertinence agentique** | Chaînes multi-sauts | Chaînes multi-sauts (POLA, atténuation monotone) | Politiques analysables d'autorisation d'outils |
| **Gouvernance** | Google (NDSS 2014) | Eclipse `Incubating` (2024) | CNCF `Sandbox` (déc. 2025) |
| **Maturité agentique** | — | — | `cedar-for-agents` **expérimental** |

[52][53][55][56][64][70] `confirmé` (la pertinence agentique de l'ocap reste un **courant d'opinion émergent**, sources secondaires, `probable` [72]).

### 5. Drafts IETF de délégation et initiatives NIST/NCCoE

Au-delà des familles de capacités, la délégation inter-domaines s'appuie sur la pile OAuth (cf. tableau Ch. 11 §3). Le draft le plus mature, **`identity-chaining-14`**, atteint le stade **quasi-RFC** (IESG `Approved-announcement::Revised I-D Needed`, ballots 2-3 juin 2026) ; co-auteurs incluant **MITRE** (K. Burgin) et **NSA-CCSS** (M. Jenkins), confirmant l'implication d'acteurs gouvernementaux US [32][33].

**Initiatives NIST/NCCoE (`confirmé`).** Le NCCoE a publié le concept paper « *Accelerating the Adoption of Software and AI Agent Identity and Authorization* » (marqué **DRAFT, February 2026** ; auteurs Booth/Fisher/Galluzzo/Roberts, NIST) ; période de commentaires **5 février - 2 avril 2026** [73]. **PRÉCISION** : la date « 2026-02-05 » est l'**ouverture** de la période de commentaires, non une date de publication imprimée distincte (le PDF ne porte que « February 2026 »). Quatre domaines de démonstration confirmés verbatim : *Authorization of AI Systems* (via OAuth 2.0), *Access Delegation*, *Logging and Transparency*, plus un axe *Identification*. En parallèle, NIST mène une **« AI Agent Standards Initiative »** (page créée 2026-02-17, MaJ 2026-04-20) incluant « *fundamental research into agent authentication and identity infrastructure* » ; RFI sécurité clos le 9 mars 2026 [74].

> **PRÉCISION SVID [75].** L'annonce CNCF de graduation SPIFFE/SPIRE (2022-09-20) **ne définit pas** l'acronyme SVID (« SPIFFE Verifiable Identity Document ») ; cette définition provient de spiffe.io, source distincte. Ne pas l'attribuer à l'annonce de graduation.

### Questions ouvertes / à vérifier en relance — Ch. 12

- Date **exacte** d'acceptation de Cedar par la CNCF (vote du TOC) : le billet AWS donne la date d'annonce (15 déc. 2025) mais pas la date du vote.
- Version exacte et date de la dernière publication du crate `cedar-policy` sur crates.io (page rendue côté JS, non récupérée le 8 juin 2026 ; v4.11.0 confirmée via GitHub).
- Existe-t-il un **Internet-Draft IETF actif** (non expiré) sur les jetons à capacités / délégation d'agents, au-delà des préprints arXiv ? Vérifier OAuth, WIMSE, SPICE.
- Au-delà de `cedar-for-agents` (expérimental) et AIP (préprint), un acteur majeur a-t-il publié une **spécification officielle** de délégation à capacités pour MCP/A2A ? Aucune confirmée à ce jour.
- Le terme « *delegation chain splicing* » et le débat associé sur la liste OAuth de mars 2026 ne sont **pas re-confirmés** sur archive primaire ; le mécanisme d'**atténuation monotone** qui y répond est, lui, confirmé dans `araut-02` [41][33].
- Passage du concept paper NCCoE (commentaires clos 2026-04-02) à un **projet de démonstration formel** (avec partenaires) : non annoncé au 8 juin 2026.
- Calendrier 2027-2030 : aucune **date d'entrée en vigueur / publication RFC ferme** pour `transaction-tokens` (jalon « Submit to IESG » fixé à déc. 2026, indicatif) ni pour les drafts WIMSE ; toute projection est une **`hypothèse`**.

---

## Ch. 13 — Menaces et défenses de l'entreprise agentique

### Insight-clé

**Le paysage des menaces agentiques s'organise autour de trois cadres complémentaires — OWASP (catalogue de vulnérabilités + mitigations), MITRE ATLAS (techniques adverses/TTP), CSA (cartographie architecturale) — qui convergent sur un constat unifiant : le *confused deputy* agentique et la prompt injection sont des problèmes d'AUTORISATION et d'ARCHITECTURE, non des défauts de modèle, et la prompt injection demeure un problème ouvert non entièrement résoluble.** L'agentique **aggrave** l'injection (surface élargie via outils, RAG, multi-agent) et introduit des classes de menaces — *chain splicing*, *credential relay through delegation chains* — encore imparfaitement couvertes par les taxonomies existantes.

### 1. OWASP — double numérotation à ne pas confondre

> **CORRECTION / DIVERGENCE — date OWASP LLM 2025 [76].** La valeur initiale « **18 novembre 2024** » n'est **PAS confirmée**. Trois dates coexistent dans les sources OWASP : *byline* d'annonce « **November 17, 2024** », dateline de communiqué « WILMINGTON, Del. — **Nov. 19, 2024** », et tampon de *build* PDF « **20241114** » (v4.2.0a). **Correction retenue : 17 novembre 2024** (annonce officielle). Ne pas lisser cet écart intra-OWASP de 14/17/19 nov. La désignation « 2025 » est l'**année de l'édition**, pas la date de sortie.

Les dix entrées du **OWASP Top 10 for LLM Applications 2025** (confirmées verbatim) : LLM01 Prompt Injection, LLM02 Sensitive Information Disclosure, LLM03 Supply Chain, LLM04 Data and Model Poisoning, LLM05 Improper Output Handling, LLM06 Excessive Agency, **LLM07 System Prompt Leakage** (nouveau), **LLM08 Vector and Embedding Weaknesses** (nouveau, RAG), LLM09 Misinformation, **LLM10 Unbounded Consumption** (étend l'ancien DoS) [76][77] `confirmé`.

Le guide **« Agentic AI — Threats and Mitigations » v1.0** (17 février 2025, « *first in a series* » de l'Agentic Security Initiative) énumère 15 menaces **T1-T15** [78] `confirmé` (titres T1-T15 à confirmer dans le PDF intégral — la page de ressource n'expose que la couverture). Le **OWASP Top 10 for Agentic Applications (édition 2026)**, publié le **9 décembre 2025** (> 100 contributeurs ; *Expert Review Board* incluant NIST, Commission européenne, Alan Turing Institute), liste **ASI01-ASI10** [79][80][81] `confirmé` :

| Code | Risque agentique 2026 |
|---|---|
| ASI01 | Agent Goal Hijack *(annonce officielle : « Agent Behavior Hijacking » — voir divergence)* |
| ASI02 | Tool Misuse and Exploitation |
| ASI03 | Identity and Privilege Abuse |
| ASI04 | Agentic Supply Chain Vulnerabilities |
| ASI05 | Unexpected Code Execution (RCE) |
| ASI06 | Memory & Context Poisoning |
| ASI07 | Insecure Inter-Agent Communication |
| ASI08 | Cascading Failures |
| ASI09 | Human-Agent Trust Exploitation |
| ASI10 | Rogue Agents |

> **DIVERGENCE — double numérotation [78][80].** Les listes **T1-T15** (guide v1.0) et **ASI01-ASI10** (Top 10 2026) **ne se correspondent PAS un-à-un**. Le Top 10 consolide/réorganise mais **aucune table de correspondance officielle 1:1 normative** n'a été confirmée. **Ne pas présenter T-codes et ASI-codes comme équivalents** `probable`.

> **DIVERGENCE — dénomination ASI01 [79][81].** L'annonce officielle nomme « Agent Behavior Hijacking » ; les recensions secondaires (Giskard) listent « Agent Goal Hijack ». À confirmer dans le PDF intégral 2026.

### 2. MITRE ATLAS — l'arrivée de l'agentique et un débat sur le mouvement latéral

| Version ATLAS | Date | Contenu / apport |
|---|---|---|
| **v5.1.0** | 2025-11-06 | 16 tactiques / 84 techniques / 56 sous-techniques / 32 mitigations / 42 cas ; **« Added a new tactic Lateral Movement (AML.TA0015) »** [82] |
| **v2026.05** | 2026-05-27 | Versionnage `YYYY.MM.N` ; format YAML **v6.0.0** ; champ *platforms* = **{Predictive AI, Generative AI, Agentic AI, Enterprise}** — « Agentic AI » de premier rang [83] |

Les techniques *agent-focused* proviennent de contributions **Zenity Labs** en deux vagues : automne 2025 (premières techniques centrées agents — AML.T0081/T0082/T0086) puis « première mise à jour 2026 » (5 techniques AML.T0096/T0098/T0099/T0100/T0101) [84]. Le chiffre « 14 techniques » de la vague oct. 2025 figure dans des recensions vendeur mais **n'a pas été confirmé au CHANGELOG** → `à vérifier` `probable`.

> **DIVERGENCE RÉELLE (à NE PAS lisser) — couverture du mouvement latéral [82][85].** (a) Le CHANGELOG MITRE indique que v5.1.0 « *Added a new tactic Lateral Movement (AML.TA0015)* » ; (b) la note CSA « *MITRE ATT&CK and ATLAS Agentic Gap Analysis* » (draft, 27 mars 2026) affirme qu'ATLAS « *intentionally excludes lateral movement and command-and-control as tactics* » et identifie **six catégories** non couvertes : (1) *agent-to-agent lateral movement*, (2) *tool-chain poisoning*, (3) *orchestrator hijacking*, (4) *credential relay through delegation chains*, (5) *cross-session memory persistence*, (6) *MCP server compromise as a pivot point*. **Interprétation `probable`** : la tactique ajoutée vise un mouvement latéral de **style réseau**, distinct du mouvement latéral **agent-à-agent** visé par la critique CSA ; ou le cadrage CSA est antérieur/non aligné sur v5.1.0. **Ne pas affirmer qu'ATLAS couvre pleinement le mouvement latéral inter-agents.**

### 3. Cadres NIST

| Publication | Statut | Date | Portée |
|---|---|---|---|
| **NIST AI 100-2 E2025** Adversarial ML | Final | 2025-03-24 | DOI 10.6028/NIST.AI.100-2e2025 ; taxonomie (intégrité/disponibilité/confidentialité) ; prompt injection directe/indirecte, *poisoning*, évasion [86] |
| **NIST AI RMF 1.0** | Cadre-mère | 2023-01 | Govern/Map/Measure/Manage ; **pas** de taxonomie adversariale native [87] (jour exact `à vérifier`) |
| **NIST AI 600-1** GenAI Profile | Final | 2024-07-26 | ~12 catégories de risque GenAI ; prompt injection ; n'emploie **pas** « confused deputy » [88] |

`confirmé` (les pages AI RMF 1.0 et AI 600-1 n'ont pas été ré-ouvertes cette session ; valeurs conservées de la connaissance établie + pages éditeur).

### 4. Confused deputy, prompt injection, chain splicing

Le **confused deputy agentique** est conceptualisé comme une **faille d'autorisation/architecture**, non un défaut de modèle : l'agent « *is designed to treat all content in their context window as potentially instructive, which eliminates the hard boundary between data and code* », donc une injection le manipule pour abuser de ses identifiants délégués ; les remédiations (admission control, validation d'entrée structurée, cadrage explicite de l'autorité) sont des contrôles **externes au modèle**. Note de recherche CSA dédiée : « *Confused Deputy Attacks on Autonomous AI Agents* », **23 mars 2026** [89] `confirmé`.

La **prompt injection** (directe et indirecte) est qualifiée de **problème ouvert non entièrement résoluble**. Source primaire substituée : la page OpenAI « *Understanding prompt injections: a frontier security challenge* » la présente comme « *frontier, challenging research problem* » dont le travail « *remains ongoing* » (« *an open challenge for agent security... for years to come* ») [90] `confirmé` (date exacte de la page **`à vérifier`** — HTTP 403 à la récupération directe).

Le **chain splicing / re-délégation inter-agents** est documenté comme amplification multi-agent : l'injection cible l'agent délégué (moins protégé) plutôt que l'agent face-utilisateur. Convergence avec « *credential relay through delegation chains* » (CSA) ; cartographie partielle OWASP ASI07 + T12 [85][91] `probable` (le terme « chain splicing » lui-même reste de la littérature secondaire/préprint, non normatif). Le draft `araut-transaction-tokens-for-agents` y répond par l'**atténuation monotone** (confirmée verbatim) [41].

### 5. Convergence des cadres — complémentarité, pas mapping normatif

| Cadre | Rôle | Statut du mapping inter-cadres |
|---|---|---|
| **OWASP ASI** | Catalogue de vulnérabilités + mitigations actionnables | — |
| **MITRE ATLAS** | Modèle de comportement adverse / références TTP | — |
| **CSA MAESTRO** | Carte de menaces architecturale par couche + responsabilité | — |

> **DIVERGENCE — cross-mapping [92].** La complémentarité est **plausible** et soutenue par le positionnement éditorial de chaque cadre, mais le mapping détaillé « T-codes OWASP alignés sur couches MAESTRO et techniques ATLAS » provient d'un **agrégateur tiers** (Tech Jacks Solutions) et **N'EST PAS un mapping officiel normatif**. Distinguer positionnement éditorial (`confirmé`) du mapping fin (`probable`, non normatif) [85] `confirmé` pour la gap-analysis CSA elle-même.

### Questions ouvertes / à vérifier en relance — Ch. 13

- Confirmer les titres verbatim **T1-T15** du guide OWASP v1.0 directement dans le PDF intégral.
- Confirmer la dénomination exacte d'**ASI01** dans le document final 2026 (« Agent Goal Hijack » vs « Agent Behavior Hijacking »).
- Lever la **divergence ATLAS sur le mouvement latéral** : vérifier la description exacte d'AML.TA0015 (réseau vs agent-à-agent) sur atlas.mitre.org / atlas-data, et si la critique CSA est antérieure/non alignée sur v5.1.0.
- Établir le décompte **exact** des techniques *agent-focused* Zenity Labs d'oct. 2025 (les « 14 ») via atlas-data ou le blogue Zenity primaire.
- Confirmer la **date de publication exacte** de la page OpenAI « Understanding prompt injections » (HTTP 403).
- Confirmer le jour exact de **NIST AI RMF 1.0** (janvier 2023) et le nombre exact de catégories de risque GenAI de NIST AI 600-1 (~12).
- Vérifier l'existence d'une **table de correspondance officielle** T1-T15 ↔ ASI01-ASI10 ; à défaut, ne jamais présenter les deux numérotations comme équivalentes.

---

## Synthèse transversale — Partie IV

**Trois constats structurent l'état de l'art identité-autorité-menaces au 8 juin 2026 :**

1. **Asymétrie de maturité.** Le socle déterministe (SPIFFE/SPIRE, gradué CNCF) et la primitive de délégation (RFC 8693) sont **stables** ; la couche protocolaire WIMSE et le chaînage OAuth sont en **standardisation active mais pré-RFC** (`identity-chaining-14` au stade quasi-RFC faisant exception) ; l'identité spécifiquement **agentique** n'existe qu'en **drafts individuels** non adoptés.

2. **Composition plutôt qu'invention.** La stratégie dominante des acteurs (Defakto, Ping, Okta, AWS, OpenAI, Amazon, NIST/NCCoE) est de **composer** des briques éprouvées plutôt que d'inventer un protocole d'agent — confirmé verbatim par l'abstract de `klrc`. La même logique vaut côté autorité (Cedar/Biscuit/Macaroons composés, jamais un standard agentique de capacités).

3. **Convergence sur la nature des menaces.** Le *confused deputy* et la prompt injection sont unanimement cadrés comme problèmes d'**autorisation/architecture** (contrôles externes au modèle), la prompt injection demeurant un **problème ouvert non résoluble** ; les taxonomies (OWASP, ATLAS, CSA) couvrent imparfaitement le mouvement latéral **agent-à-agent** et le *credential relay* en chaînes de délégation.

**Piège épistémique récurrent (haut enjeu) :** la métadonnée Datatracker « Intended RFC status = `(None)` » vs en-tête « Standards Track » sur la quasi-totalité des drafts WG — **ne pas présenter « Standards Track » comme un statut sanctionné** tant que le document n'a pas avancé vers l'IESG.

---


# PARTIE V — Observabilité, provenance et conformité de l'entreprise agentique (état de l'art, juin 2026)

> Base probante datée et citée. Marqueurs d'incertitude par fait : **confirmé** | **probable** | **hypothèse** | **à vérifier**. Les divergences entre sources sont signalées, jamais lissées. Date de référence : 2026-06-08.

---

## Ch. 14 — Observabilité et provenance agentiques

**Insight-clé.** En date de juin 2026, la pile d'observabilité et de provenance pour systèmes agentiques repose sur des standards en cours de stabilisation, *pas encore figés*. Le point dur : **la totalité des conventions sémantiques OpenTelemetry GenAI demeure en statut « Development » (expérimental)** — vérification page par page, aucune sous-section « Stable » [1][2]. Autour de ce noyau mouvant gravitent un socle de provenance stable mais antérieur à l'ère agentique (W3C PROV-DM, Recommandation **inchangée depuis le 30 avril 2013** [10]), un standard de lignage gradué et activement versionné (OpenLineage v1.48.0, 2026-06-03 [14]), un standard de provenance de contenu (C2PA v2.4, avril 2026 [18]) et un cadre réglementaire de marquage machine (art. 50 du Règlement UE 2024/1689, applicable le 2 août 2026 [19]). La thèse de l'état de l'art : **l'instrumentation agentique normalisée existe mais n'offre aucune garantie de stabilité d'API**, ce qui contraint toute architecture d'interopérabilité à un *opt-in* explicite versionné.

### 14.1 OpenTelemetry GenAI : un corpus entièrement expérimental

L'ensemble des conventions sémantiques GenAI — spans modèle/inférence, spans agent et framework, métriques, événements, MCP, conventions par fournisseur — **porte le badge « Development »** ; aucune sous-section n'affiche « Stable » (confirmé, haut enjeu) [1][2][3][4][5]. La version-parapluie courante des Semantic Conventions est **v1.41.1, publiée le 2026-05-11** (`published_at` 2026-05-11T22:28:25Z) ; ce patch exclut deux métriques k8s de la génération de code (#3711) et **ne contient aucun changement GenAI** — la dernière version porteuse d'ajouts GenAI est **v1.41.0 (2026-04-28)** (confirmé) [6][7].

La discipline de transition est explicite : le **baseline de stabilité des conventions GenAI est v1.36.0 (2025-07-05)** ; les instrumentations existantes *« SHOULD NOT change the version of the GenAI conventions that they emit by default »*, et l'adhésion à la dernière version expérimentale passe par la variable **`OTEL_SEMCONV_STABILITY_OPT_IN=gen_ai_latest_experimental`** (confirmé) [1][6]. Un dépôt dédié **`open-telemetry/semantic-conventions-genai`** existe (gestion des dépendances via *Weaver* ; spans/métriques/événements clients GenAI, MCP, conventions fournisseurs), mais la page indique explicitement **« No releases published »** (confirmé) [8]. Nuance à conserver : la ligne README de ce dépôt énumère « OpenAI, etc. » et **ne nomme pas** Anthropic/Azure/Bedrock, lesquels figurent en revanche sur le hub `gen-ai/` [8][9].

Côté contenu instrumental (statut Development) :

- **Spans GenAI** : `gen_ai.request.model`, `gen_ai.usage.input_tokens`, `gen_ai.usage.output_tokens`, `gen_ai.response.finish_reasons`, `gen_ai.operation.name`, `gen_ai.provider.name`, `gen_ai.response.id`, `gen_ai.conversation.id`. Les attributs à fournir à la création du span pour les décisions d'échantillonnage incluent aussi **`server.address` et `server.port`** (citation verbatim vérifiée) [3].
- **Spans agent/framework** : opérations `create_agent`, `invoke_agent`, `invoke_workflow`, `execute_tool`. `invoke_agent` distingue une variante **Client Span** (invocation d'agent sur service distant — ex. OpenAI Assistants API, AWS Bedrock Agents) d'une variante **Internal Span** (même processus — ex. LangChain, CrewAI). Attributs : `gen_ai.agent.{id,name,version,description}` [6].
- **Métriques** : **7 instruments, tous de type Histogram** — côté client `gen_ai.client.token.usage`, `gen_ai.client.operation.duration`, `gen_ai.client.operation.time_to_first_chunk`, `gen_ai.client.operation.time_per_output_chunk` ; côté serveur `gen_ai.server.request.duration`, `gen_ai.server.time_per_output_token`, `gen_ai.server.time_to_first_token`. Les deux instruments `time_to_first_chunk`/`time_per_output_chunk` ont été **ajoutés en v1.41.0 (2026-04-28)** [4][7].
- **MCP** : spans client et serveur dont le **nom effectif est `{mcp.method.name} {target}`** (ex. `tools/call get-weather`), avec repli `{mcp.method.name}` ; `mcp.method.name` est *Required* ; autres attributs `mcp.session.id`, `mcp.protocol.version`, `mcp.resource.uri`, `gen_ai.tool.name`. Alignement sur la **spécification MCP 2025-06-18** [5]. Précision : `span.mcp.client`/`span.mcp.server` sont des **identifiants de registre, non le span name littéral**.
- **Conventions fournisseurs** (hub GenAI) : Anthropic, Azure AI Inference, AWS Bedrock, OpenAI [1].

**Correction majeure (divergence résolue).** Le claim initial postulait un écart persistant entre le *changelog* (agrégation introduite en v1.37.0, 2025-08-25, « GenAI chat history revamp ») et la documentation rendue (événements *per-message* encore affichés). **Vérification : cet écart n'existe plus en juin 2026.** La page docs « Generative AI events » ne montre **plus** d'événements per-message ; elle expose désormais **deux événements agrégés** — `gen_ai.client.inference.operation.details` et `gen_ai.evaluation.result` — portant `gen_ai.input.messages`, `gen_ai.output.messages` et `gen_ai.system_instructions` (confirmé) [7][?]. La transition d'attributs reste néanmoins en statut **Development**.

### 14.2 Provenance : W3C PROV (stable mais antérieur), PROV-AGENT (recherche)

**W3C PROV-DM est une Recommandation datée du 30 avril 2013** (en-tête : *« W3C Recommendation 30 April 2013 »*), avec trois types cœur — **Entity, Activity, Agent** — et **aucune révision ni v2** postérieure (confirmé, haut enjeu) [10]. La famille comprend des Recommandations (PROV-DM ; PROV-O, ontologie OWL2/RDF ; PROV-N ; PROV-CONSTRAINTS) et des Notes (PROV-OVERVIEW, PROV-PRIMER), **toutes datées du 30 avril 2013** [11][12].

L'extension vers l'agentique reste au stade **recherche, non normalisée** : **PROV-AGENT** (arXiv 2508.02866, soumis le 2025-08-04 ; présenté à l'IEEE 21st International Conference on e-Science 2025, Chicago) étend PROV pour capturer prompts, réponses, décisions et invocations de modèles d'agents, en s'intégrant à MCP (confirmé que c'est un travail de recherche) [13]. *À vérifier* : la présence dans les actes publiés IEEE e-Science 2025 (DOI Xplore) au-delà de la préimpression arXiv.

### 14.3 Lignage : OpenLineage, gradué et activement versionné

**OpenLineage en est à la version 1.48.0, publiée le 2026-06-03** (`published_at` 2026-06-03T09:19:08Z, confirmé via l'API GitHub releases/latest) ; spécification OpenAPI extensible par facettes (job/run/dataset) (confirmé, haut enjeu) [14]. C'est un **projet de stade GRADUATION de la LF AI & Data Foundation** — citation verbatim : *« OpenLineage is a graduation-stage project of the LF AI & Data Foundation. Contributed by: Datakin in May 2021 as an incubation-stage project and graduated in July 2023 »* ; Marquez est l'implémentation de référence (confirmé, haut enjeu) [15].

**Complémentarité, non convergence** avec OpenTelemetry : OpenLineage est une API de collecte de **lignage** (dépendances entre datasets et pipelines, « équivalent des traces pour les données »), distincte des traces de services d'OpenTelemetry ; OpenLineage revendique s'être inspiré de l'architecture d'OpenTelemetry (**probable** — sources d'origine 2023, relation toujours valable en 2026 mais non re-datée) [16].

**Adoption éditeur (IBM watsonx).** Modèle producteur-consommateur : `watsonx.data` et `watsonx.data integration` **génèrent** des événements OpenLineage à l'exécution ; `watsonx.data intelligence` les **consomme et les exporte** au format OpenLineage (**probable**, haut enjeu) [17]. Réserves explicites : il existe une **série de ≥ 3 annonces IBM** connexes ; la **date exacte du communiqué cible (initialement 2026-03-02) n'a pu être re-confirmée par fetch direct (HTTP 403 sur ibm.com)** — gardée en *à vérifier* ; la mention d'adoption parallèle Snowflake/Collibra/Atlan **n'a pas été re-vérifiée** sur source primaire.

### 14.4 Provenance de contenu et marquage réglementaire

**C2PA v2.4 (Content Credentials), datée « April 2026 »** selon l'historique de versions de la spécification elle-même (section 5.3.1 : « 2.4 - April 2026 », nouveaux formats d'actifs, assertions, sérialisation JSON) ; versions antérieures 2.2 (2025-05-01) et 2.1 (2024-09-20) (confirmé, haut enjeu) [18]. C2PA crée un *manifest* signé cryptographiquement portant des assertions de provenance (capture, édition, ingrédients, divulgation IA, horodatage, hachages). Réserve : la page d'index ne porte pas de dates ; la datation provient du corps du document. *À vérifier* : la date exacte de C2PA 2.3 (entre 2.2 et 2.4).

Côté réglementation, **l'article 50 du Règlement (UE) 2024/1689 devient applicable le 2 août 2026** (renvoi art. 113) ; l'art. 50(2) impose que les sorties d'IA générative soient *« marked in a machine-readable format and detectable as artificially generated or manipulated »* (confirmé, haut enjeu) [19]. **Précision Omnibus (probable).** L'accord politique « AI Omnibus » Conseil/Parlement est daté du **7 mai 2026** [20] ; il accorde un **délai de grâce de QUATRE mois** (compromis de trilogue entre les 6 mois proposés par la Commission et les 3 mois du Parlement), portant l'échéance de l'art. 50(2) au **2 décembre 2026 UNIQUEMENT pour les systèmes d'IA générative déjà sur le marché avant le 2 août 2026** ; les systèmes mis sur le marché après le 2 août 2026 se conforment dès le premier jour, et les obligations art. 50(1)(3)(4) **ne bénéficient d'aucun report** [20][21][22]. Accord **provisoire/politique** — texte définitif à confirmer au Journal officiel.

### Tableau 14-A — Standards d'observabilité/provenance agentique (juin 2026)

| Standard | Version / date | Statut de maturité | Rôle | Couverture agentique | Confiance |
|---|---|---|---|---|---|
| OTel Semantic Conventions (parapluie) | v1.41.1 — 2026-05-11 [6] | Stable (corpus), mais **GenAI = Development** | Traces/métriques/logs | Spans agent, MCP, fournisseurs (tous expérimentaux) | confirmé |
| OTel GenAI (toutes sous-sections) | Development [1] | **Expérimental** (aucune « Stable ») | Instrumentation LLM/agent | create/invoke_agent, execute_tool, MCP | confirmé |
| W3C PROV-DM | Rec. 30 avr. 2013 [10] | **Stable, figé** (pas de v2) | Provenance (Entity/Activity/Agent) | Générique, non agentique | confirmé |
| PROV-AGENT | arXiv 2508.02866 — 2025-08-04 [13] | **Recherche** (non normalisé) | Provenance agent (prompts/décisions) | Native agentique + MCP | confirmé (= recherche) |
| OpenLineage | v1.48.0 — 2026-06-03 [14] | **Graduation** (LF AI & Data) | Lignage données/pipelines | Complémentaire d'OTel | confirmé |
| C2PA | v2.4 — avril 2026 [18] | Versionné activement | Provenance de contenu (manifest signé) | Marquage sorties IA | confirmé |
| Art. 50 UE 2024/1689 | Applicable 2 août 2026 [19] | En vigueur (échelonné) | Marquage machine obligatoire | Sorties d'IA générative | confirmé (Omnibus : probable) |

### Tableau 14-B — OpenTelemetry vs OpenLineage (≥ 2 dimensions)

| Dimension | OpenTelemetry (GenAI) | OpenLineage |
|---|---|---|
| Objet observé | Traces/spans/métriques de services et d'agents | Lignage : dépendances datasets ↔ pipelines |
| Analogie | Traces de services | « Traces pour les données » |
| Maturité (juin 2026) | GenAI = **Development** [1] | **Graduation** LF AI & Data [15] |
| Versionnement | v1.41.1 (2026-05-11) ; dépôt GenAI dédié sans release [6][8] | v1.48.0 (2026-06-03) [14] |
| Relation mutuelle | Source d'inspiration revendiquée par OpenLineage | **Complémentaire, pas convergent** [16] |

### Divergences signalées (Ch. 14)

1. **Événements GenAI OTel** — l'écart changelog/docs postulé au départ **n'existe plus** : la doc montre désormais les événements agrégés (`gen_ai.client.inference.operation.details`, `gen_ai.evaluation.result`). Claim corrigé [7].
2. **AI Omnibus / délai de grâce** — divergence de durée selon l'institution : Commission = 6 mois ; Parlement = 3 mois ; **compromis de trilogue (7 mai 2026) = 4 mois** → 2 décembre 2026, **systèmes *legacy* seulement** [20][21][22].
3. **MCP OTel** — `span.mcp.client`/`span.mcp.server` sont des **identifiants de registre**, non le span name effectif (`{mcp.method.name} {target}`) [5].
4. **Dépôt `semantic-conventions-genai`** — la ligne README dit « OpenAI, etc. » sans nommer Anthropic/Azure/Bedrock (présents sur le hub `gen-ai/`) [8][9].
5. **IBM watsonx/OpenLineage** — série de ≥ 3 annonces ; **date du communiqué cible non re-confirmée (HTTP 403)**, gardée en *probable*/*à vérifier* ; mention Snowflake/Collibra/Atlan non re-vérifiée [17].

### Questions ouvertes / à vérifier en relance (Ch. 14)

- Date de publication **exacte** du communiqué IBM « OpenLineage for a unified lineage view… » (hypothèse 2026-03-02, page 403). Piste : cache/Wayback ou date affichée sur ibm.com/new.
- Le **texte définitif** du Règlement Omnibus est-il publié au JO de l'UE, et la date du 2 décembre 2026 + restriction *legacy* y sont-elles consacrées ? Piste : EUR-Lex (règlement modificatif).
- Les **lignes directrices Commission art. 50** ont-elles atteint leur version finale vers juin 2026, et imposent-elles C2PA comme standard de marquage ou restent-elles neutres ? Piste : projet de mai 2026.
- **PROV-AGENT** figure-t-il dans les actes IEEE e-Science 2025 (DOI Xplore) ? Piste : IEEE Xplore.
- Une sous-section GenAI OTel est-elle planifiée « Stable » avant fin 2026, et le dépôt `semantic-conventions-genai` produira-t-il sa première release ? Piste : milestones GitHub + SIG GenAI Observability.
- Date **exacte** de C2PA 2.3 (entre 2.2=2025-05-01 et 2.4=avril 2026). Piste : version history de la spec 2.3.

---

## Ch. 15 (volet UE) — Conformité européenne : EU AI Act & DORA

**Insight-clé.** Deux régimes européens structurent la conformité d'un système agentique en services financiers, avec une **asymétrie de maturité décisive**. **DORA (Règlement (UE) 2022/2554) est pleinement et fermement applicable depuis le 17 janvier 2025** (art. 64) [29] — ses cinq piliers et l'essentiel de sa législation déléguée de niveau 2 sont en vigueur. L'**AI Act (Règlement (UE) 2024/1689)** s'applique au contraire **par paliers** (art. 113) et reste partiellement **mouvant** : le « Digital Omnibus on AI » (accord politique provisoire du 7 mai 2026) **reporte les échéances haut risque**, mais **n'est PAS encore publié au Journal officiel en juin 2026** — point juridique critique : **tant que la publication n'a pas lieu, les dates originales (2 août 2026 / 2 août 2027) demeurent juridiquement en vigueur** [27][28]. **Hypothèse structurante** : aucun texte primaire de juin 2026 ne définit l'« agent autonome » ou l'« agentique » ; la qualification procède **par analogie** (système d'IA haut risque / actif TIC), ce qui constitue la principale zone d'incertitude réglementaire pour l'interopérabilité agentique [33].

### 15.1 EU AI Act : référence, entrée en vigueur, paliers

L'AI Act porte la référence **Règlement (UE) 2024/1689** (confirmé) [23] ; **entré en vigueur le 1er août 2024**, application générale **2 août 2026** (art. 113) (confirmé) [23][24]. Les paliers de l'art. 113 (texte confirmé) :

- **2 février 2025** — Chap. I-II : dispositions générales + pratiques interdites (art. 5) + littératie IA (art. 4) [24][25].
- **2 août 2025** — Chap. III §4, Chap. V (GPAI), Chap. VII (gouvernance), Chap. XII, art. 78, **sauf art. 101** ; pénalités [24].
- **2 août 2026** — application générale (majorité des obligations haut risque Annexe III) [24].
- **2 août 2027** — art. 6(1) et obligations correspondantes (haut risque intégré aux produits, Annexe I) [24].

**Pratiques interdites + littératie** applicables depuis le 2 février 2025 ; sanction des pratiques interdites (art. 99(3)) **jusqu'à 35 M EUR ou 7 % du CA mondial annuel total**, le plus élevé (confirmé) [24][25]. **GPAI/gouvernance** applicables depuis le 2 août 2025 (sauf art. 101) ; les modèles GPAI antérieurs bénéficient d'une grâce **jusqu'au 2 août 2027** (confirmé) [24].

**Seuil de risque systémique GPAI** : présomption réfutable de capacités à fort impact (art. 51(2)) lorsque le calcul cumulé d'entraînement **dépasse 10^25 FLOP** (confirmé) ; l'estimation « ~5-15 fournisseurs mondiaux » concernés est un **ordre de grandeur secondaire, indicatif (à vérifier)** [26]. **Code de bonnes pratiques GPAI** publié le **10 juillet 2025**, trois chapitres (Transparence, Droit d'auteur, Sûreté et Sécurité) — les deux premiers pour tous les fournisseurs GPAI, le troisième pour les modèles à risque systémique ; jugé « outil volontaire adéquat » par la Commission et l'AI Board (confirmé) [26b].

### 15.2 Le « Digital Omnibus on AI » : reports, statut juridique

- **Proposition Commission : 19 novembre 2025** (probable) [27a].
- **Accord politique provisoire : 7 mai 2026** (trilogue Parlement/Conseil), confirmé par le Parlement, le Conseil (Consilium) et la Commission [27][28]. **Divergence** : certaines sources secondaires datent les négociations finales au 6 mai 2026 (séance nocturne aboutissant vers 4 h 30 le 7 mai) ; les sources institutionnelles primaires retiennent le **7 mai 2026**.
- **Annexe III (haut risque autonome) reportée au 2 décembre 2027** — dates **fixes**, et non le mécanisme conditionnel « stop-the-clock » initialement proposé (confirmé) [27][?].
- **Annexe I (haut risque intégré aux produits) reportée au 2 août 2028** ; l'accord résout aussi le différend sur l'évaluation de conformité Annexe I (confirmé) [27].
- **Marquage (art. 50)** : pour les systèmes mis sur le marché avant le 2 août 2026, conformité au **2 décembre 2026** (au lieu du 2 février 2027) ; systèmes postérieurs au 2 août 2026 = dès la mise sur le marché (**probable**) [27][22].
- **Nouvelles interdictions (art. 5)** : *nudifiers* + CSAM, effet **2 décembre 2026** (confirmé) [27].
- **Statut juridique (probable)** : accord **politique provisoire non publié au JO** ; adoption formelle visée **avant le 2 août 2026** ; publication attendue d'ici juillet 2026 ; **les dates originales restent en vigueur** d'ici là. **À vérifier** : date de confirmation COREPER (parfois citée au 13 mai 2026, non confirmée sur source primaire) [27][28][22].

### 15.3 Ancrage agentique : sanctions, Annexe III finance, supervision humaine

Structure des sanctions (art. 99, confirmé) : **35 M/7 %** (interdit) ; **15 M/3 %** (haut risque et autres obligations) ; **7,5 M/1 %** (information incorrecte/trompeuse) — *le plus élevé* ; plafonds réduits (le plus *faible*) pour PME/jeunes pousses [26?]. **Annexe III finance** (confirmé) : sont à haut risque l'évaluation de **solvabilité / score de crédit** des personnes physiques (sauf détection de fraude) et la **tarification assurance vie/santé** — ancrage direct de l'AI Act pour les systèmes agentiques en services financiers [Annexe III]. **Art. 14(1)** : **supervision humaine effective obligatoire** pour les systèmes haut risque — exigence structurante qui **borne la délégation** et impose un point de contrôle humain [art. 14]. **Art. 6(3)** : exemption haut risque sous conditions (tâche procédurale étroite, amélioration d'un résultat humain, détection d'écarts sans remplacer l'évaluation humaine, tâche préparatoire) + documentation + enregistrement art. 49(2) [art. 6].

### 15.4 DORA : socle ferme et législation déléguée

**DORA = Règlement (UE) 2022/2554 du 14 décembre 2022**, **applicable depuis le 17 janvier 2025** (art. 64) — date ferme et exécutoire (confirmé) [29]. **Cinq piliers** (confirmé) : (1) gestion du risque TIC (art. 5-16) ; (2) gestion/signalement des incidents (art. 17-23) ; (3) tests de résilience (art. 24-27) ; (4) risque lié aux tiers TIC (art. 28-44) ; (5) partage d'informations (art. 45) [30].

Législation déléguée de niveau 2 pertinente pour les chaînes agentiques (toutes confirmées) :

- **Registre d'information** — Règlement d'exécution (UE) **2024/2956** du 29 nov. 2024 (ITS, art. 28(3)) ; JO 2 déc. 2024 ; en vigueur 22 déc. 2024 ; modèles normalisés + information sur les sous-traitants de fonctions critiques [31]. Première soumission aux NCA **au plus tard le 30 avril 2025** ; **divergence confirmée** sur les dates intermédiaires (CSSF Luxembourg : référence 31 mars, fenêtre 1-15 avril, transmission ESAs 30 avril 2025) [31].
- **RTS TLPT** (tests d'intrusion fondés sur la menace, art. 26) — Règlement délégué (UE) **2025/1190** du 13 fév. 2025 ; JO 18 juin 2025 ; **applicable depuis le 8 juillet 2025** ; alignement TIBER-EU (détail *à vérifier*) [32].
- **RTS sous-traitance** (art. 30(5)) — Règlement délégué (UE) **2025/532** du 24 mars 2025 ; JO 2 juillet 2025 ; **en vigueur 22 juillet 2025** [33]. **Probable** : la suppression de l'Article 5/Recital 5 du projet (suivi continu de la chaîne de sous-traitants), rapportée comme « retrait partiel » par des cabinets, **n'est pas vérifiée ligne à ligne contre le JO** ; piste — comparer le projet JC 2024-53 et le texte final 2025/532 [33].

### 15.5 Double conformité agentique (hypothèse)

Pour un agent LLM déployé en services financiers UE, les deux régimes **se cumulent** (hypothèse de l'auteur, non un fait établi) [34] : (a) **AI Act** — qualification haut risque possible (Annexe III : crédit, assurance) → gestion des risques, gouvernance des données, journalisation, **supervision humaine (art. 14)** ; (b) **DORA** — l'agent et ses dépendances (modèle, API, cloud) sont des actifs/services TIC à **inscrire au registre** (2024/2956), **tester** (TLPT, 2025/1190) et **encadrer contractuellement** (sous-traitance, 2025/532). **Hypothèse** : aucun texte primaire de juin 2026 ne définit « agent autonome »/« agentique » ; la qualification procède **par analogie**, d'où une zone d'incertitude réglementaire à surveiller.

### Tableau 15-A (UE) — Calendrier d'application (original vs Omnibus)

| Obligation | Date ORIGINALE (2024/1689) | Date sous Omnibus (accord 7 mai 2026) | Statut juridique juin 2026 | Confiance |
|---|---|---|---|---|
| Interdictions (art. 5) + littératie (art. 4) | 2 fév. 2025 | inchangé | En vigueur | confirmé [24] |
| GPAI + gouvernance (sauf art. 101) | 2 août 2025 | inchangé | En vigueur | confirmé [24] |
| Marquage art. 50 (sys. *legacy*) | (≈ 2 fév. 2027) | **2 déc. 2026** | Dates originales prévalent (non publié JO) | probable [27][22] |
| Nouvelles interdictions (nudifiers, CSAM) | — | **2 déc. 2026** | Sous réserve de publication | confirmé [27] |
| Haut risque Annexe III (autonome) | **2 août 2026** | **2 déc. 2027** (dates fixes) | **2 août 2026 reste en vigueur** | confirmé [27] |
| Haut risque Annexe I (produits) | **2 août 2027** | **2 août 2028** | **2 août 2027 reste en vigueur** | confirmé [27] |

### Tableau 15-B (UE) — DORA vs AI Act (≥ 2 dimensions)

| Dimension | DORA (2022/2554) | AI Act (2024/1689) |
|---|---|---|
| Nature | Résilience opérationnelle TIC, secteur financier | Régulation horizontale produit, risque IA |
| Maturité juin 2026 | **Ferme, applicable depuis 17 janv. 2025** [29] | **Échelonné + Omnibus non publié** [24][27] |
| Niveau 2 clé | Reg. 2024/2956, 2025/1190, 2025/532 [31][32][33] | Code GPAI (10 juil. 2025) ; normes harmonisées attendues [26b] |
| Ancrage agentique | Agent = actif/service TIC (registre, TLPT, sous-traitance) | Agent = système d'IA (Annexe III ; art. 14) |
| Sanctions | (régime DORA propre) | 35 M/7 % ; 15 M/3 % ; 7,5 M/1 % [art. 99] |
| Définition « agentique » | Absente (analogie) | Absente (analogie) — **hypothèse** [34] |

### Divergences signalées (Ch. 15 — UE)

1. **Date de l'accord Omnibus** : primaires (Parlement/Conseil/Commission) = **7 mai 2026** ; secondaires = 6 mai 2026 (séance nocturne) [27][28].
2. **Confirmation COREPER** : parfois citée au 13 mai 2026, **non confirmée** sur source primaire → *à vérifier* [27].
3. **Première soumission registre DORA** : dates intermédiaires variables selon NCA ; plafond commun 30 avril 2025 [31].
4. **Suppression art. 5 du projet RTS sous-traitance** : rapportée par cabinets, **non vérifiée contre le JO** → *probable* [33].
5. **Nombre de fournisseurs GPAI systémiques (~5-15)** : ordre de grandeur secondaire ; seul le **seuil > 10^25 FLOP** est confirmé [26].

### Questions ouvertes / à vérifier en relance (Ch. 15 — UE)

- Date **exacte de publication au JO** de l'Omnibus → entrée en vigueur des dates 2 déc. 2027 / 2 août 2028. Piste : EUR-Lex (post-publication).
- Le texte final modifiera-t-il d'autres dispositions (GPAI, registre UE haut risque, art. 50) au-delà des communiqués de mai 2026 ?
- Émergence d'ici 2027-2030 d'une **qualification primaire des « agents autonomes »** (lignes directrices Commission/AI Office, normes CEN-CENELEC JTC 21) — actuellement absente.
- Articulation pratique **art. 14 (supervision humaine) ↔ autonomie déléguée** d'un agent multi-étapes : que préciseront les normes harmonisées ?
- Statut et calendrier des **autres RTS/ITS DORA** pertinents pour les chaînes agentiques (RTS risque TIC, lignes directrices coûts/pertes d'incidents).

---

## Ch. 15 (volet Canada) — Conformité canadienne : OSFI E-23, AMF, AIDA

**Insight-clé.** En date de juin 2026, la conformité de l'IA en services financiers canadiens repose sur des **lignes directrices sectorielles (droit souple prudentiel)** et **non sur une loi fédérale horizontale**. Trois échéances convergent en 2027 : **LD AMF risque lié aux tiers le 1er avril 2027** ; **ligne directrice E-23 du BSIF ET LD AMF sur l'IA toutes deux le 1er mai 2027** [C2][C7]. **L'IA agentique est déjà saisie par le droit prudentiel** — via le **risque de modélisation** (E-23 inclut explicitement IA/AA dans la définition de « modèle ») et la **gouvernance des systèmes d'IA** (AMF, imputabilité individuelle d'un dirigeant) — **avant toute loi horizontale**. Côté fédéral : le projet de loi **C-27 (contenant AIDA) est mort à la prorogation** (44e législature close le 6 janvier 2025) ; AIDA **ne sera pas réintroduite telle quelle** ; la stratégie **« AI for All » (4 juin 2026)** est **non contraignante** ; **aucun projet de loi fédéral successeur n'était déposé au 8 juin 2026 (probable, preuve de négatif)** [C10][C11][C12][C13].

### 15.6 BSIF — Ligne directrice E-23 (gestion du risque de modélisation)

**Version finale publiée le 11 septembre 2025**, **entrée en vigueur le 1er mai 2027** (mise en œuvre ≈ 20 mois) (confirmé, haut enjeu) [C1][C2]. **Périmètre** : institutions financières fédérales réglementées (IFFR) — banques, succursales de banques étrangères, assureurs vie/fraternelles, assureurs IARD, sociétés de fiducie et de prêt ; **régimes de retraite fédéraux reconsidérés et EXCLUS** de la version finale (confirmé) [C3]. **IA/AA inclus textuellement** dans la définition de « modèle » (*« …including AI/ML methods… »*) ; le cadre MRM **couvre les modèles tiers/fournisseurs** (confirmé) [C4].

**Neutralité algorithmique** (confirmé) : la lettre énonce textuellement *« the outcomes and principles provided in the guideline do not vary based on the algorithmic approach to modeling »* et reconnaît des **défis de gouvernance** propres aux modèles « boîte noire », données d'entraînement externes dynamiques et techniques propriétaires [C5]. **Précision/divergence** : la qualification selon laquelle l'IA/AA « exacerbe les risques » provient d'une **glose secondaire (Torys)**, **non d'une citation primaire** — la lettre BSIF cadre ces enjeux comme des *défis de gouvernance*, pas une « exacerbation » nommée.

### 15.7 AMF (Québec) — LD sur l'utilisation de l'IA et LD risque lié aux tiers

**LD AMF sur l'utilisation de l'IA : version finale publiée le 7 avril 2026** (consultation automne 2025), **entrée en vigueur le 1er mai 2027** ; s'applique aux assureurs autorisés, coopératives de services financiers, sociétés de fiducie autorisées et institutions de dépôt autorisées encadrées par l'AMF (confirmé) [C6][C7]. Exigences (confirmé) : le **CA** veille à une culture d'utilisation responsable ; la **haute direction** assure gouvernance/contrôle des risques des systèmes d'IA (SIA) ; **UN membre de la haute direction est imputable de l'ensemble des SIA** [C8]. **Probable / à confirmer mot pour mot** : la mention « **registre/inventaire centralisé des SIA + cote de risque par système** » provient de la couverture du *projet* (NRF, automne 2025) ; la **page AMF retourne 403** à la récolte automatisée — formulation à confirmer dans le PDF final [C8].

**LD AMF distincte sur le risque lié aux tiers** : **entrée en vigueur le 1er avril 2027** (consultation 9 oct.-19 déc. 2025) ; met à jour/remplace la LD impartition de 2009 ; exige un registre centralisé des ententes avec les tiers. **À ne pas confondre** avec la LD IA (effet 1er mai 2027) (confirmé) [C9].

### 15.8 Fédéral — AIDA mort-née, « AI for All », vide horizontal

**Projet de loi C-27 (contenant AIDA) mort au Feuilleton** à la prorogation (44e législature, 1re session, close le 6 janvier 2025) ; stade maximal = **étude en comité INDU (non complétée)**, jamais de rapport ni de 3e lecture ; dernière réunion INDU enregistrée le 26 septembre 2024 (confirmé) [C10]. **Précision** : LEGISinfo classe C-27 en « information historique » et **n'emploie pas littéralement « mort au Feuilleton »** (mécanique de prorogation confirmée par sources juridiques). Le ministre **Solomon** a indiqué (mi-2025) qu'**AIDA ne sera pas réintroduite telle quelle**, IA et vie privée étant désormais traitées **séparément** (confirmé pour le principe) [C11].

**Stratégie « AI for All » lancée le 4 juin 2026 (Toronto)** par le PM Carney (avec Solomon, Joly, Hajdu) — plan quinquennal économique **non contraignant**, promettant une modernisation législative **sans nommer de projet de loi IA horizontal ni fixer d'échéancier IA précis** (confirmé, haut enjeu) [C12]. **Cibles** (confirmé, à citer comme cibles, non réalisations) : ≈ **200 G$ de croissance** + **250 000 emplois** sur 5 ans ; adoption IA **12 % → 60 % d'ici 2034** [C12b]. **Au 8 juin 2026, aucun projet de loi fédéral horizontal sur l'IA n'a été déposé** ; le Canada s'appuie sur un code de conduite volontaire (IA générative) dans l'intervalle (**probable** — affirmation de négatif, convergence de sources secondaires Osler/BLG/CCPA, sans registre primaire unique) [C13].

### 15.9 Implication pour l'argument agentique

**Triple échéance 2027** sans loi fédérale horizontale (confirmé) [C15] : 1er avril (LD tiers AMF), 1er mai (E-23 BSIF + LD IA AMF). L'IA/AA est explicitement visée par E-23 (risque de modélisation) et la LD IA AMF (gouvernance des SIA) — **droit souple prudentiel plutôt que droit dur horizontal**. Points d'ancrage directs pour la gouvernance agentique : **imputabilité individuelle d'un dirigeant** (AMF) et **registre/cote de risque par système** (probable, AMF). *Question d'interprétation, non un fait* : dans quelle mesure un agent LLM **déclencheur d'actions** (et non un simple modèle prédictif) tombe-t-il dans la définition de « modèle » d'E-23 ou de « SIA » de l'AMF ?

### Tableau 15-C (Canada) — Trois cadres prudentiels (juin 2026)

| Cadre | Autorité | Publication | Entrée en vigueur | Périmètre | IA/agentique | Confiance |
|---|---|---|---|---|---|---|
| E-23 (risque de modélisation) | BSIF (fédéral) | 11 sept. 2025 [C1] | **1er mai 2027** [C2] | IFFR (pensions exclues) [C3] | IA/AA dans déf. « modèle » + modèles tiers [C4] | confirmé |
| LD utilisation de l'IA | AMF (Québec) | 7 avr. 2026 [C6] | **1er mai 2027** [C7] | Assureurs, coop., fiducies, dépôts (AMF) | Imputabilité 1 dirigeant ; registre+cote = *probable* [C8] | confirmé / probable |
| LD risque lié aux tiers | AMF (Québec) | (consult. oct.-déc. 2025) | **1er avril 2027** [C9] | Encadrés AMF | Remplace LD impartition 2009 ; registre tiers | confirmé |
| AIDA (C-27) | Fédéral | — | **Morte** (prorogation 6 janv. 2025) [C10] | — | Pas de réintroduction telle quelle [C11] | confirmé |
| « AI for All » | PM / fédéral | 4 juin 2026 [C12] | Non contraignant | Stratégie économique | Aucune loi IA horizontale nommée [C13] | confirmé / probable |

### Tableau 15-D (Canada) — Comparaison E-23 vs LD IA AMF (≥ 2 dimensions)

| Dimension | E-23 (BSIF) | LD IA (AMF) |
|---|---|---|
| Angle | Risque de **modélisation** (MRM) | Gouvernance des **systèmes d'IA** (SIA) |
| Entrée en vigueur | 1er mai 2027 [C2] | 1er mai 2027 [C7] |
| Principe directeur | Neutralité algorithmique (texte) [C5] | Imputabilité d'**un** dirigeant pour tous les SIA [C8] |
| Modèles/systèmes tiers | Couverts (vendor/third-party) [C4] | Encadrés via gouvernance (+ LD tiers, 1er avr. 2027) [C9] |
| Registre | (cadre MRM) | Registre + cote de risque par SIA — **probable** [C8] |

### Divergences signalées (Ch. 15 — Canada)

1. **E-23 — date** : une source secondaire (Blakes, avril 2026) indique **1er avril 2027**, contredite par la **primaire BSIF (1er mai 2027)** ; le 1er avril 2027 est en réalité la date de la **LD AMF risque lié aux tiers** — confusion probable entre deux échéances 2027 voisines. **Retenir la primaire : E-23 = 1er mai 2027** [C14].
2. **E-23 — « exacerbation »** : qualification de **glose secondaire (Torys)** ; la **neutralité algorithmique** est, elle, citée textuellement dans la lettre primaire [C5].
3. **Fédéral (C13)** : **affirmation de négatif** (absence de dépôt d'un successeur à AIDA au 8 juin 2026) — confiance **probable** malgré la convergence Osler/BLG/CCPA ; à re-vérifier à la rédaction finale.

### Questions ouvertes / à vérifier en relance (Ch. 15 — Canada)

- **PDF final de la LD AMF sur l'IA** : confirmer **mot pour mot** l'exigence d'un « registre/inventaire centralisé des SIA » et la « cote de risque par système » (page AMF en 403). Piste : ouvrir manuellement le PDF officiel EN/FR.
- **Successeur fédéral à AIDA** déposé en 2026 après « AI for All » ? Surveiller LEGISinfo (45e législature).
- Le BSIF / autres régulateurs publieront-ils des **attentes spécifiques à l'IA agentique** (au-delà du risque de modélisation) avant 2027 ? Aucune source primaire confirmée à ce jour.
- **Champ d'application matériel** d'E-23 et de la LD IA AMF aux **systèmes agentiques** (agents LLM autonomes, orchestration multi-agent) : ces cadres parlent de « modèles »/« SIA » sans nommer l'agentivité — **question d'interprétation pour la monographie**, pas un fait établi.

---

## Sources réellement utilisées (Partie V)

1. Semantic conventions for generative AI systems (badge Development) — OpenTelemetry, 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/
2. Semantic conventions for generative AI spans (badge Development vérifié) — OpenTelemetry, 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/
3. Semantic conventions for generative AI spans (attributs + texte sampling) — OpenTelemetry, 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/
4. Semantic conventions for generative AI metrics (7 Histograms) — OpenTelemetry, 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-metrics/
5. Semantic conventions for MCP (span names, attributs, version 2025-06-18) — OpenTelemetry, 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/mcp/
6. Release v1.41.1 / GitHub API releases (tag_name + published_at ISO) — OpenTelemetry / GitHub, 2026-05-11 — https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.1
7. Release v1.41.0 / GitHub API releases (ajout time_to_first_chunk/time_per_output_chunk ; v1.37.0 = 2025-08-25) — OpenTelemetry / GitHub, 2026-04-28 — https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.0
8. GitHub — open-telemetry/semantic-conventions-genai (README + « No releases published ») — OpenTelemetry / GitHub, 2026 — https://github.com/open-telemetry/semantic-conventions-genai
9. Semantic Conventions for GenAI agent and framework spans (opérations et variantes) — OpenTelemetry, 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/
10. PROV-DM: The PROV Data Model (W3C Recommendation 30 April 2013) — W3C, 2013-04-30 — https://www.w3.org/TR/prov-dm/
11. PROV-O: The PROV Ontology — W3C, 2013-04-30 — https://www.w3.org/TR/prov-o/
12. PROV-Overview (famille de documents PROV) — W3C, 2013-04-30 — https://www.w3.org/TR/prov-overview/
13. PROV-AGENT: Unified Provenance for Tracking AI Agent Interactions in Agentic Workflows — Souza et al. (arXiv) / IEEE e-Science 2025, 2025-08-04 — https://arxiv.org/abs/2508.02866
14. GitHub API — OpenLineage/OpenLineage releases/latest (tag 1.48.0, 2026-06-03) — OpenLineage / GitHub, 2026-06-03 — https://api.github.com/repos/OpenLineage/OpenLineage/releases/latest
15. OpenLineage — LFAI & Data (statut Graduation ; Datakin 2021-05, gradué 2023-07) — Linux Foundation AI & Data, 2026 — https://lfaidata.foundation/projects/openlineage/
16. How OpenLineage takes inspiration from OpenTelemetry — OpenLineage, 2023 — https://openlineage.github.io/blog/openlineage-takes-inspiration-from-opentelemetry/
17. OpenLineage for a unified lineage view across structured and unstructured data to enable explainable AI (date exacte à vérifier — 403 au fetch) — IBM, 2026 — https://www.ibm.com/new/announcements/openlineage-for-a-unified-lineage-view-across-structured-and-unstructured-data-to-enable-explainable-ai
18. Content Credentials: C2PA Technical Specification 2.4 (version history 5.3.1 : « 2.4 - April 2026 ») — C2PA, 2026-04 — https://spec.c2pa.org/specifications/specifications/2.4/specs/C2PA_Specification.html
19. Article 50: Transparency Obligations (texte consolidé ; application 2 août 2026) — artificialintelligenceact.eu (Future of Life Institute), 2026 — https://artificialintelligenceact.eu/article/50/
20. Artificial Intelligence: Council and Parliament agree to simplify and streamline rules (Conseil UE, 7 mai 2026 ; Omnibus) — Conseil de l'Union européenne (Consilium), 2026-05-07 — https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/
21. EU AI Act Omnibus Deal Reached: Postponed Deadlines, Watermarking Compromise (délai 4 mois → 2 déc. 2026) — William Fry, 2026 — https://www.williamfry.com/knowledge/eu-ai-act-omnibus-deal-reached-postponed-deadlines-watermarking-compromise-and-the-nudificiation-prohibition/
22. EU AI Act Update: Timeline Relief, Targeted Simplification, and New Prohibitions — Covington & Burling (Inside Privacy), 2026-05 — https://www.insideprivacy.com/artificial-intelligence/eu-ai-act-update-timeline-relief-targeted-simplification-and-new-prohibitions/
23. AI Act — Shaping Europe's digital future (page officielle) — Commission européenne (DG CNECT), 2026 — https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai
24. Article 113: Entry into Force and Application (texte du Règlement 2024/1689) — Future of Life Institute, 2026 — https://artificialintelligenceact.eu/article/113/
25. Article 99: Penalties (texte du Règlement 2024/1689) — Future of Life Institute, 2026 — https://artificialintelligenceact.eu/article/99/
26. Article 51: Classification of GPAI Models as GPAI Models with Systemic Risk (seuil 10^25 FLOP) — Future of Life Institute, 2026 — https://artificialintelligenceact.eu/article/51/
27. AI Act: deal on simplification measures, ban on 'nudifier' apps — Parlement européen, 2026-05 — https://www.europarl.europa.eu/news/en/press-room/20260427IPR42011/ai-act-deal-on-simplification-measures-ban-on-nudifier-apps
28. Digital Omnibus on AI — Legislative Train Schedule — Parlement européen, 2026-05 — https://www.europarl.europa.eu/legislative-train/package-digital-package/file-digital-omnibus-on-ai
29. Entry into application of DORA regulation on 17 January 2025 — CSSF (Luxembourg), 2025-01 — https://www.cssf.lu/en/2025/01/entry-in-application-of-dora-regulation-on-17-january-2025/
30. Regulation (EU) 2022/2554 (DORA) — texte consolidé — EUR-Lex (Office des publications de l'UE), 2022-12 — https://eur-lex.europa.eu/eli/reg/2022/2554/oj/eng
31. Commission Implementing Regulation (EU) 2024/2956 — register of information (ITS, art. 28(3) DORA) — EUR-Lex, 2024-12 — https://eur-lex.europa.eu/eli/reg_impl/2024/2956/oj/eng
32. Commission Delegated Regulation (EU) 2025/1190 — TLPT (RTS, art. 26 DORA) — EUR-Lex, 2025-06 — https://eur-lex.europa.eu/eli/reg_del/2025/1190/oj/eng
33. Commission Delegated Regulation (EU) 2025/532 — subcontracting ICT services (RTS, art. 30(5) DORA) — EUR-Lex, 2025-07 — https://eur-lex.europa.eu/eli/reg_del/2025/532/oj/eng
34. Annex III: High-Risk AI Systems Referred to in Article 6(2) — Future of Life Institute, 2026 — https://artificialintelligenceact.eu/annex/3/
35. The General-Purpose AI Code of Practice — Commission européenne (DG CNECT), 2025 — https://digital-strategy.ec.europa.eu/en/policies/contents-code-gpai
36. Article 14: Human Oversight (texte AI Act) — Future of Life Institute, 2026 — https://artificialintelligenceact.eu/article/14/
37. Article 6: Classification Rules for High-Risk AI Systems — Future of Life Institute, 2026 — https://artificialintelligenceact.eu/article/6/
38. EU AI Act Omnibus Agreement — Postponed High-Risk Deadlines and Other Key Changes — Gibson Dunn, 2026 — https://www.gibsondunn.com/eu-ai-act-omnibus-agreement-postponed-high-risk-deadlines-and-other-key-changes/
39. Guideline E-23 — Model Risk Management (2027) [publication 11 sept. 2025, effet 1er mai 2027, déf. « modèle » incl. IA/AA, périmètre IFFR] — BSIF/OSFI, 2025-09-11 — https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027
40. Guideline E-23 — Model Risk Management (2027) - Letter [neutralité algorithmique citée ; exclusion régimes de retraite fédéraux] — BSIF/OSFI, 2025-09-11 — https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027-letter
41. OSFI updates and expands scope of Guideline E-23 for AI governance — Torys LLP, 2025-10 — https://www.torys.com/en/our-latest-thinking/publications/2025/10/osfi-updates-and-expands-scope-of-guideline-e-23
42. OSFI Releases Final Guideline E-23 for Model Risk Management and AI Use by FRFIs — Blakes, 2025-09 — https://www.blakes.com/insights/osfi-releases-final-guideline-e-23-for-model-risk-management-and-ai-use-by-frfis/
43. Lignes directrices en matière d'intelligence artificielle et de gestion du risque lié aux tiers [communiqué AMF : 7 avril 2026 ; effet 1er mai 2027 (IA) / 1er avril 2027 (tiers)] — Autorité des marchés financiers (AMF), 2026-04-07 — https://lautorite.qc.ca/grand-public/salle-de-presse/actualites/fiche-dactualite/lignes-directrices-en-matiere-dintelligence-artificielle-et-de-gestion-du-risque-lie-aux-tiers
44. Ligne directrice sur l'utilisation de l'intelligence artificielle (page officielle AMF) [imputabilité d'un membre de la haute direction ; WebFetch 403, contenu via index AMF] — AMF, 2026-04 — https://lautorite.qc.ca/en/professionals/insurers/guidelines/use-of-models/guideline-for-the-use-of-artificial-intelligence
45. AMF's AI guideline is now official: What financial institutions need to know — Norton Rose Fulbright, 2026-04 — https://www.nortonrosefulbright.com/en/knowledge/publications/27e0daab/amf-s-ai-guideline-is-now-official-what-financial-institutions-need-to-know
46. L'AMF propose un encadrement pour l'usage de l'IA dans les services financiers [couverture du projet : registre + cote de risque] — Norton Rose Fulbright, 2025-08 — https://www.nortonrosefulbright.com/fr-ca/centre-du-savoir/publications/129d21cb/lamf-propose-un-encadrement-pour-lusage-de-lia-dans-les-services-financiers
47. Third-Party Risk Management Guideline (page officielle AMF) [effet 1er avril 2027] — AMF, 2026 — https://lautorite.qc.ca/en/professionals/insurers/guidelines/operational-risk/third-party-risk-management-guideline
48. AMF — Third-Party Risk Management Guideline - avis de consultation [consultation 9 oct.-19 déc. 2025] — AMF, 2025-10-09 — https://lautorite.qc.ca/fileadmin/lautorite/consultations/lignes-directrices/2025-12-19-fin/2025oct09-LD-Tiers-avis-cons-en.pdf
49. C-27 (44-1) — LEGISinfo [stade : Consideration in committee / Not completed ; session 44-1 close le 6 janvier 2025] — Parlement du Canada (LEGISinfo), 2025-01 — https://www.parl.ca/legisinfo/en/bill/44-1/c-27
50. Prorogation's Digital Impact: Canada's Digital Bills Set to Die on the Order Paper — Fasken, 2025-01 — https://www.fasken.com/en/knowledge/2025/01/prorogations-digital-impact
51. What's Next After AIDA? [Solomon : pas de réintroduction d'AIDA telle quelle] — Schwartz Reisman Institute (Université de Toronto), 2025 — https://srinstitute.utoronto.ca/news/whats-next-for-aida
52. Liberals won't reintroduce old AI law but will address copyright issues — The Logic, 2025 — https://thelogic.co/news/exclusive/canada-ai-regulation-copyright-evan-solomon/
53. Prime Minister Carney launches AI for All: Canada's new national artificial intelligence strategy [4 juin 2026 ; cibles 200 G$ / 250 000 emplois / adoption 12 % → 60 % d'ici 2034] — Cabinet du Premier ministre du Canada, 2026-06-04 — https://www.pm.gc.ca/en/news/news-releases/2026/06/04/prime-minister-carney-launches-ai-all-canadas-new-national-artificial
54. Canada launches AI for All national artificial intelligence strategy — Gowling WLG, 2026-06 — https://gowlingwlg.com/en-ca/insights-resources/articles/2026/canada-launches-ai-for-all-national-artificial-intelligence-strategy
55. Canada still has no meaningful AI regulation [absence de loi-cadre fédérale, 2026] — Canadian Centre for Policy Alternatives (CCPA), 2026 — https://www.policyalternatives.ca/news-research/canada-still-has-no-meaningful-ai-regulation/
56. Canada's 2026 privacy priorities: data sovereignty, open banking and AI — Osler, Hoskin & Harcourt LLP, 2026 — https://www.osler.com/en/insights/reports/2025-legal-outlook/canadas-2026-privacy-priorities-data-sovereignty-open-banking-and-ai/
57. A turning point for AI in Canada in 2026 — Borden Ladner Gervais (BLG), 2026-03 — https://www.blg.com/en/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026
58. European Commission adopts revised DORA Subcontracting RTS — a partial retreat on monitoring sub-contractors? — Herbert Smith Freehills Kramer, 2025 — https://www.hsfkramer.com/notes/tmt/2025-posts/european-commission-adopts-revised-dora-subcontracting-rts-a-partial-retreat-on-monitoring-sub-contractors
59. Commission Implementing Regulation (EU) 2024/2956 — ITS register templates (EBA) — Autorité bancaire européenne (EBA), 2024 — https://www.eba.europa.eu/activities/single-rulebook/regulatory-activities/operational-resilience/implementing-technical-standards-establish-templates-register-information
60. Semantic conventions for Generative AI events (événements agrégés vérifiés) — OpenTelemetry, 2026 — https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-events/

---


# PARTIE VI — Entreprise agentique, résilience, validation et gouvernance financière

> Dossier d'état de l'art, juin 2026. Base probante pour monographie doctorale (fr-CA). Tous les énoncés portent un marqueur d'incertitude (`confirmé` | `probable` | `hypothèse` | `à vérifier`) et un horodatage de vérification (`asOf`). Les claims dont le verdict adversarial ou la confiance vaut « à vérifier » sont présentés **avec ce statut**, jamais comme acquis.

---

## Ch. 2 — L'entreprise agentique : frontière conceptuelle, autonomie et risque d'exécution

**Insight-clé.** Le passage de l'automatisation déterministe (RPA) à l'automatisation agentique ne déplace pas seulement la *capacité* mais le *lieu et le moment du risque* : les agents produisent des trajectoires multi-étapes à effets externes, de sorte que les risques importants émergent **durant l'exécution**, et non plus seulement à la conception ou au déploiement. Le cartographe de référence du paysage, le *2025 AI Agent Index* [1], documente 30 systèmes agentiques de pointe selon une échelle d'autonomie L1–L5 qui situe déjà les agents navigateurs en régime L4–L5 (intervention humaine limitée en cours d'exécution).

**Faits datés et cités.**

- **Cartographie de l'autonomie déployée.** Le *2025 AI Agent Index* documente 30 systèmes agentiques répartis en 6 catégories, instantané au 31 décembre 2025, selon une échelle d'autonomie L1–L5 ; les agents navigateurs opèrent en L4–L5, tandis que les agents d'entreprise glissent de L1–L2 (conception) vers L3–L5 (déploiement) [1][2]. *Confirmé* (source primaire arXiv + site MIT *further-details*), `asOf 2026-05-06`.
- **Piège de datation.** L'ouvrage s'intitule « 2025 AI Agent Index » (instantané des systèmes au 31 décembre 2025), mais sa préimpression arXiv (2602.17753, à paraître à FAccT '26) a été déposée le **19 février 2026** (v1) et révisée le **6 mai 2026** (v2). Il faut donc citer l'année de l'instantané (2025) distinctement de l'année de publication (2026) ; la date arXiv exacte est 2026-02-19 / 2026-05-06, **et non le 7 mai** indiqué dans certaines listes [1]. *Confirmé*, `asOf 2026-05-06`.
- **Frontière RPA vs agentique.** Le RPA suit des règles prédéfinies déterministes pour des tâches identiques mono-système et ne s'adapte pas ; l'automatisation agentique réorganise le flux autour d'un raisonnement autonome adaptatif multi-système agissant sans approbation par étape [3]. *Probable* — distinction conceptuelle largement consensuelle, mais portée surtout par du contenu éditeur/marketing. **À ne pas citer comme source normative** : pour l'argument doctoral, chercher un substrat académique (taxonomies d'autonomie). `asOf 2026-06-08`.
- **Écart temporel d'exécution.** Le risque opérationnel spécifique des agents en production tient à ce que des risques importants émergent **durant l'exécution** : un agent planifie, utilise des outils, maintient un état et produit des trajectoires multi-étapes à effets externes [4]. La thèse « *risks emerge during execution* » est **confirmée** dans le résumé ; le cadrage précis « écart temporel entre initiation d'actions irréversibles et observation/intervention humaine » n'est **pas** une citation verbatim et reste *probable*. `asOf 2026-04-06`.

**Tableau 2.1 — RPA vs automatisation agentique (≥ 2 dimensions).**

| Dimension | RPA (déterministe) | Automatisation agentique |
|---|---|---|
| Logique de contrôle | Règles fixes, prédéfinies | Raisonnement autonome adaptatif |
| Portée systémique | Mono-système, tâches identiques | Multi-système, flux réorganisé |
| Adaptation | Aucune | Réorganisation autour du but |
| Approbation humaine | N/A (déterministe) | Agit sans approbation par étape |
| Niveau d'autonomie (échelle Index) | — | L1–L5 ; navigateurs en L4–L5 |
| Localisation du risque | Conception / déploiement | **Exécution** (trajectoires à effets externes) |

**Divergences signalées.** Aucune divergence inter-sources interne au chapitre ; réserve méthodologique : la frontière RPA/agentique (C03) repose sur des sources éditeur/marketing — divergence de *niveau de preuve* avec les sources académiques mobilisées ailleurs.

**Marqueurs d'incertitude.** C01/C02 *confirmés* ; C03 *probable* (substrat marketing) ; C04 *probable* pour le cadrage « écart temporel » (thèse générale confirmée).

**Questions ouvertes / à vérifier en relance.** Trouver une source académique (taxonomie d'autonomie *peer-reviewed*) pour étayer la frontière RPA/agentique en remplacement du substrat marketing.

---

## Ch. 16 — Résilience opérationnelle et gardes-fous d'exécution

**Insight-clé.** Parce que le risque agentique se matérialise à l'exécution (Ch. 2), la résilience se déplace vers des contrôles *runtime* : surveillance post-déploiement structurée et traduction des normes de gouvernance en gardes-fous applicables. Le repère normatif majeur de juin 2026 est le NIST AI 800-4, qui — **correction de fond** — définit **six** catégories de surveillance post-déploiement (et non cinq) [5][6].

**Faits datés et cités.**

- **NIST AI 800-4 — six catégories.** Le NIST (CAISI) publie « *Challenges to the Monitoring of Deployed AI Systems* » (NIST AI 800-4, DOI 10.6028/NIST.AI.800-4), approuvé par le NIST Editorial Review Board le **13 février 2026** et diffusé en mars 2026 (communiqué 9 mars, MAJ 18 mars) [5][6]. **Correction majeure** : le rapport définit **six** catégories — Functionality, Operational, Human Factors, Security, Compliance et **Large-Scale Impacts** (« promote human flourishing ») — et non cinq ; la version initiale du claim omettait « Large-Scale Impacts ». Méthode : trois ateliers (avril–mai 2025) + revue de littérature passée de 23 à 87 articles ; ~200 experts externes et 10+ agences fédérales. *Confirmé*, `asOf 2026-03-18`.
- **Gardes-fous *runtime* : norme → contrôle.** « *From Governance Norms to Enforceable Controls* » (Christopher Koch, arXiv 2604.05229, 2026-04-06) propose une méthode de traduction en couches pour transformer des normes de gouvernance en contrôles *runtime* applicables [4]. Existence *confirmée* ; la thèse « risques à l'exécution » *confirmée*, le cadrage « écart temporel » *probable*. `asOf 2026-04-06`.

**Tableau 16.1 — Les six catégories de surveillance post-déploiement (NIST AI 800-4) [5][6].**

| # | Catégorie | Question directrice (résumé primaire) |
|---|---|---|
| 1 | Functionality | Le système fonctionne-t-il comme prévu ? |
| 2 | Operational | Le système opère-t-il dans ses paramètres ? |
| 3 | Human Factors | Transparence + qualité (et non un simple « facteurs humains ») |
| 4 | Security | Le système est-il sécurisé ? |
| 5 | Compliance | Le système est-il conforme ? |
| 6 | **Large-Scale Impacts** | « *Does the system promote human flourishing?* » |

**Divergences signalées.** **DIVERGENCE de fond** : la formulation initiale du claim C06 indiquait **cinq** dimensions ; le document primaire (Table 1, DOI 10.6028/NIST.AI.800-4) en définit **six** — l'ajout étant « Large-Scale Impacts ». Les libellés primaires diffèrent aussi (p. ex. « Human Factors » = transparence + qualité). **Ne pas lisser** : citer les six catégories avec leurs libellés primaires.

**Marqueurs d'incertitude.** C06 *confirmé* (correction intégrée) ; C04 *probable* sur le cadrage.

**Questions ouvertes / à vérifier en relance.** Aucune en suspens pour le NIST AI 800-4 (corps du PDF vérifié) ; confirmer, le cas échéant, le statut peer-review de la préimpression Koch.

---

## Ch. 17 — Validation, métrologie et fiabilité des agents

**Insight-clé.** La métrologie agentique de 2025–2026 est dominée par un constat de **crise de validité** : un audit de 10 bancs d'essai montre que 7/10 violent la validité de tâche, 7/10 la validité de résultat, et que 80 % n'admettent aucune faiblesse de conception [9]. L'illustration canonique — un agent trivial renvoyant des réponses vides obtient **38 %** sur des tâches impossibles et surpasse un agent GPT-4o [10] — fonde la thèse que l'exactitude seule est un signal trompeur, d'où l'émergence de cadres multidimensionnels (fiabilité, déterminisme, CLEAR).

**Faits datés et cités.**

- **Audit de validité (10 bancs).** Zhu, Jin, Liang et al. (25 auteurs ; arXiv 2507.02825, 2025-07-03) : 7/10 violent la validité de tâche, 7/10 la validité de résultat, 80 % n'admettent aucune faiblesse (aucun ne satisfait tous les critères de reporting → 10/10 lacunaires). Sur-estimations mesurées : **KernelBench +31 %** (absolu) faute de *fuzz testing* exhaustif ; **WebArena +1,4 à +5,2 %**. Proposition : l'*Agentic Benchmark Checklist* (ABC), réduisant p. ex. la sur-estimation de CVE-Bench de 33 % [9]. *Confirmé* (HTML plein texte). NB : venue NeurIPS 2025 **à confirmer** (non explicite dans le résumé ; arXiv classe cs.AI, v5 du 7 août 2025). `asOf 2025-08-07`.
- **Cas τ-bench-airline (agent trivial 38 %).** Un agent trivial renvoyant des réponses vides est compté comme réussi sur des tâches volontairement impossibles, atteignant **38 %** et **surpassant** un agent fondé sur GPT-4o [10]. *Confirmé* verbatim (HTML plein texte). `asOf 2025-08-07`.
- **Origine de τ-bench.** τ-bench (Yao et al., ICLR 2025) est un banc d'interaction outil-agent-utilisateur (service client) ; il évalue la correction par appariement d'état (*state matching*) contre des états-or, contrastant avec GAIA (appariement de réponses courtes) [11]. *Probable* — caractérisation issue d'une revue arXiv (secondaire) ; **la primaire ICLR 2025 reste à citer directement**. `asOf 2025-06-08`.
- **Science de la fiabilité (4 dimensions, 12 métriques).** « *Towards a Science of AI Agent Reliability* » (Rabanser, Kapoor, Kirgis, Liu, Utpala, Narayanan ; Princeton HAL Lab ; arXiv 2602.16666, v1 2026-02-18, v3 2026-06-02) propose, « *grounded in safety-critical engineering* », un profil de performance holistique décomposé en **12 métriques** selon **4 dimensions** : *consistency, robustness, predictability, safety* — y compris la cohérence inter-exécutions [12]. *Confirmé* pour les 4 dimensions et 12 métriques. **Correction** : les normes nominatives aviation/nucléaire (ARP4754A, IEC 61513, ISO 26262) ne sont **pas** nommées dans le résumé — **à verifier** dans le corps du PDF ; ne pas les attribuer comme citation. La mention « pass@k » n'apparaît pas dans le résumé (**à vérifier**). `asOf 2026-06-02`.
- **Cadre CLEAR.** *Cost, Latency, Efficacy, Assurance, Reliability* (Mehta, arXiv 2511.14136, 2025-11-18) : l'exactitude seule corrèle faiblement avec le succès en déploiement (ρ≈0,41) contre ρ≈0,83 pour CLEAR ; variations de coût jusqu'à **50×** à exactitude comparable, écart labo-production de **37 %**, chute pass@1=60 % → pass@8=25 % [13]. *Probable* — **préimpression à auteur unique, courriel personnel, sans peer-review confirmée** ; chiffres à citer comme illustratifs, non normatifs. Valeurs non re-vérifiées ligne à ligne lors de cette passe. `asOf 2025-11-18`.
- **Proxys utilisateurs simulés non fiables.** « *Lost in Simulation: LLM-Simulated Users are Unreliable Proxies for Human Users in Agentic Evaluations* » soutient que les utilisateurs simulés par LLM sont des proxys non fiables (caveat de validité externe pour les bancs type τ-bench) [14b]. *Probable* — existence/intitulé **à confirmer** sur la page arXiv (2601.17087, non re-fetchée). `asOf 2026-01-01`.

**Tableau 17.1 — Cadres de validation/fiabilité agentique (≥ 2 dimensions).**

| Cadre | Auteur·s / venue | Dimensions clés | Chiffre signature | Statut |
|---|---|---|---|---|
| ABC (audit) | Zhu, Jin, Liang et al. (25) — arXiv 2507.02825 | Validité tâche / résultat / reporting | 7/10, 7/10, 80 % ; KernelBench +31 % | *Confirmé* |
| Science of Reliability | Rabanser et al. — Princeton HAL, arXiv 2602.16666 | consistency / robustness / predictability / safety | 4 dim. / 12 métriques | *Confirmé* (normes nominatives **à vérifier**) |
| CLEAR | Mehta — arXiv 2511.14136 (auteur indép.) | Cost / Latency / Efficacy / Assurance / Reliability | ρ≈0,83 vs 0,41 ; coût 50× | *Probable* (pas de peer-review) |
| DFAH (cf. Ch. 19) | Khatchadourian — arXiv 2601.15322 | déterminisme trajectoire/décision + fidélité évidence | déterminisme ≠ exactitude | *Confirmé* |

**Tableau 17.2 — Défauts de validité mesurés [9][10].**

| Banc | Défaut | Effet quantifié |
|---|---|---|
| τ-bench-airline | Validité de tâche (tâches impossibles « réussies ») | Agent trivial = 38 % > GPT-4o |
| KernelBench | Validité de résultat (pas de *fuzz testing*) | +31 % (absolu) |
| WebArena | Validité de résultat | +1,4 à +5,2 % |
| CVE-Bench | Reporting / conception | sur-estimation réduite de 33 % via ABC |

**Divergences signalées.** **DIVERGENCE C12** : la formulation initiale attribuait des normes de sûreté nominatives (ARP4754A, IEC 61513, ISO 26262) ; le résumé primaire ne les nomme **pas** (« grounded in safety-critical engineering » seulement) et énonce 4 dimensions explicites + 12 métriques. Ne pas attribuer ces normes comme citation.

**Marqueurs d'incertitude.** C09/C10 *confirmés* ; C11 *probable* (primaire ICLR à citer) ; C12 *confirmé* sauf normes nominatives *à vérifier* ; C13 *probable* (sans peer-review) ; C26 *probable* (intitulé à reconfirmer).

**Questions ouvertes / à vérifier en relance.**
- Confirmer la venue de l'audit ABC (NeurIPS 2025 ?) — non explicite dans le résumé.
- Citer directement la primaire ICLR 2025 (Yao et al.) pour τ-bench.
- Vérifier dans le corps du PDF de Rabanser et al. la présence/absence des normes nominatives et de « pass@k ».
- Re-vérifier ligne à ligne les valeurs CLEAR (ρ≈0,83/0,41 ; 37 % ; pass@1 60 %→pass@8 25 %) et statuer sur le peer-review.
- Reconfirmer l'intitulé, les auteurs et la date de « Lost in Simulation » (arXiv 2601.17087).

---

## Ch. 19 — Gouvernance financière, auditabilité réglementaire et adoption

**Insight-clé.** Dans le secteur financier régulé, l'auditabilité des agents devient le pivot de conformité : il faut **rejouer** une décision à entrées identiques (déterminisme) tout en capturant la chaîne de raisonnement. Or le déterminisme décisionnel et l'exactitude de tâche **ne sont pas détectablement corrélés** [14], ce qui impose de les mesurer indépendamment. Le cadre réglementaire se densifie via DORA (application **17 janvier 2025**) [19] et, côté *soft law*, le FS AI RMF du Treasury (**19 février 2026**, matrice de 230 objectifs de contrôle) [21][21b]. La sécurité agentique reçoit en parallèle son référentiel : l'OWASP Top 10 for Agentic Applications (**9 décembre 2025**) [5b].

**Faits datés et cités.**

- **Référentiel de sécurité agentique (OWASP).** OWASP GenAI Security Project publie le 9 décembre 2025 le « *Top 10 for Agentic Applications* » : ASI01 Agent Goal Hijack, ASI02 Tool Misuse, ASI03 Identity & Privilege Abuse, ASI04 Agentic Supply Chain Vulnerabilities, ASI05 Unexpected Code Execution, ASI06 Memory & Context Poisoning, ASI07 Insecure Inter-Agent Communication, ASI08 Cascading Failures, ASI09 Human-Agent Trust Exploitation, ASI10 Rogue Agents — synchronisé avec « Threat and Mitigations 1.1 » [5b]. *Confirmé* (liste intégrale verbatim sur source primaire). `asOf 2025-12-09`.
- **Profil agentique du NIST AI RMF (CSA).** La Cloud Security Alliance publie le « *NIST AI Risk Management Framework: Agentic Profile* » (white paper, **statut draft**, 27 mars 2026) étendant le NIST AI RMF 1.0 via GOVERN/MAP/MEASURE/MANAGE, avec une classification d'autonomie à **quatre paliers** (Tier 1 pleinement supervisé → Tier 4 pleine autonomie en environnement contraint) ; il complète le futur « *AI Agent Interoperability Profile* » du NIST attendu au **Q4 2026** [7a][7b]. *Confirmé*, `asOf 2026-03-27`.
- **Initiative NIST/CAISI.** Le NIST CAISI a lancé formellement l'*AI Agent Standards Initiative* le **17 février 2026**, en amont du profil d'interopérabilité attendu au Q4 2026 [7c][7d]. *Probable* — fait rapporté par des notes CSA et un mémoire IEEE-USA (9 mars 2026) ; **la page primaire nist.gov reste à confirmer**. `asOf 2026-03-09`.
- **NIST IR 8596 / Cyber AI Profile.** NIST IR 8596 (« *Cybersecurity Framework Profile for AI* », pont CSF 2.0 ↔ AI RMF) serait diffusé en *initial preliminary draft* fin 2025 ; les contrôles SP 800-53 seraient traités via le projet COSAiS/Cyber AI Profile (premier projet public attendu en 2026) [8a][8b]. **À VÉRIFIER** — non confirmé sur source primaire NIST lisible. Le white paper CSA liste « IR 8596 » parmi ses références, ce qui corrobore l'existence du numéro mais **ni le statut ni la date**. Piste : csrc.nist.gov (rechercher « NIST IR 8596 » et « Cyber AI Profile / COSAiS »). `asOf 2025-12-31`.
- **Rejeu et déterminisme (DFAH).** « *Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness…* » (Raffi Khatchadourian, arXiv 2601.15322, v1 2026-01-17, v2 2026-03-07) propose le harnais **DFAH** mesurant trois propriétés : déterminisme de trajectoire, déterminisme de décision (sorties stables à entrées identiques rejouées) et fidélité conditionnée à l'évidence. **Constat-clé : le déterminisme de décision et l'exactitude de tâche ne sont PAS détectablement corrélés** — d'où mesure indépendante. Pertinent pour l'auditabilité réglementaire (rejeu d'audit à entrées identiques) [14]. *Confirmé*, `asOf 2026-03-07`.
- **Auditabilité en finance régulée.** L'auditabilité exige de capturer la chaîne de raisonnement (données considérées, logique de décision, alternatives, niveau de confiance), les autorisations de l'agent, le contexte reçu, les systèmes aval et toute approbation/override humain ; les superviseurs réutilisent les cadres existants (**SR 11-7** *model risk* de la Réserve fédérale, **guidance IT du FFIEC**, gestion du risque tiers) [22]. *Probable* — principe largement admis ; **SR 11-7 et FFIEC sont des primaires (Fed/FFIEC) à citer directement** plutôt que via l'analyse secondaire. `asOf 2026-06-08`.
- **DORA — application.** Le Règlement (UE) 2022/2554 (DORA), du 14 décembre 2022, est entré en application le **17 janvier 2025** ; il impose la gestion du risque ICT tiers (art. 28), les tests de résilience dont le *Threat-Led Penetration Testing* (TLPT), le reporting des incidents ICT majeurs et un cadre d'oversight UE des prestataires ICT critiques (CTPP). S'applique à ~20 types d'entités financières plus les prestataires ICT [19]. *Confirmé* (numéro, date d'adoption 14 déc. 2022 et date d'application 17 janv. 2025 sur EIOPA). `asOf 2025-01-17`.
- **DORA — RTS/ITS et registre.** DORA est complété par des RTS/ITS (EBA, ESMA, EIOPA) applicables à la même date pivot ; le Règlement d'exécution (UE) **2024/2956** fixerait les gabarits du registre d'information ICT (art. 28(9)) [20a][20b]. **À VÉRIFIER** — le numéro « 2024/2956 » provient d'une source secondaire (QuoIntelligence) et n'a pas été confirmé sur EUR-Lex ; l'échéance annuelle (30 avril, gabarit XBRL/XML) est rapportée par des secondaires. Piste : EUR-Lex (« Commission Implementing Regulation (EU) 2024/2956 register of information DORA »). `asOf 2025-01-17`.
- **Treasury — FS AI RMF + Lexicon.** Le US Department of the Treasury publie le **19 février 2026** deux ressources **non contraignantes** (*soft law*) : un « *Artificial Intelligence Lexicon* » et un « *Financial Services AI Risk Management Framework* » (FS AI RMF), aligné sur le NIST AI RMF, adressant l'IA émergente dont les systèmes agentiques [21][21b2]. *Confirmé* (communiqué primaire sb0401). `asOf 2026-02-19`.
- **Treasury — 230 objectifs de contrôle.** Le FS AI RMF fournit une matrice de **230 objectifs de contrôle** sur le cycle de vie de l'IA ; élaboré avec **>100 institutions financières**, le **FSSCC** et le **Cyber Risk Institute (CRI)** [21b][21]. *Probable* — chiffre et partenaires concordants chez plusieurs analyses ; **à confirmer sur le document FS AI RMF primaire (treasury.gov)**. `asOf 2026-02-19`.
- **Plan de contrôle agentique IBM (watsonx Orchestrate).** IBM présente (annonce 2026) une nouvelle génération de watsonx Orchestrate comme plan de contrôle agentique d'entreprise : observabilité et gouvernance plein cycle, évaluation pré-déploiement multi-dimensions (p. ex. *journey completion*, *answer relevancy*, *tool call accuracy*) et passerelle IA unifiée [23]. *Probable* — **page d'annonce IBM en HTTP 403 au fetch** (contenu via index de recherche) ; l'association à « Think 2026 (Boston, 5 mai 2026) » **à vérifier**. `asOf 2026-05-05`.
- **OSWorld et adoption.** Le Stanford AI Index 2026 (rapport HAI, ~423 pages, avril 2026) indique **66,3 %** de succès sur **OSWorld** (contre ~12 % l'an précédent, à ~6 points de la performance humaine) [24a]. Séparément, plusieurs analyses concordantes rapportent que **~89 %** des implémentations d'agents en entreprise (coût **150 k–800 k USD**) n'atteignent jamais la production, la **gouvernance** plutôt que la capacité étant la cause dominante [24b]. Le volet « 89 %/coût » **n'a pas été reconfirmé** sur la page primaire HAI (reste *probable*). `asOf 2026-04-01`.
- **Enquêtes d'adoption (éditeur).** Une enquête PwC de mai 2025 rapporterait que **79 %** des organisations exécutent déjà des agents IA, **66 %** signalant des gains de productivité mesurables ; Deloitte estimerait **25 %** des entreprises GenAI déployant des pilotes agentiques en 2025 et **50 %** en 2027 [25]. **À VÉRIFIER** — non confirmé sur sources primaires lisibles (PwC/Deloitte). Pistes : pwc.com « AI Agent Survey May 2025 » ; deloitte.com prévisions agentiques 2025. `asOf 2025-05-01`.

**Tableau 19.1 — Référentiels de gouvernance/résilience financière agentique (≥ 2 dimensions).**

| Instrument | Émetteur | Nature | Date pivot | Statut |
|---|---|---|---|---|
| OWASP Top 10 Agentic (ASI01–ASI10) | OWASP GenAI Security Project | Référentiel sécurité | 9 déc. 2025 | *Confirmé* |
| NIST AI 800-4 (monitoring, 6 cat.) | NIST / CAISI | Rapport | mars 2026 | *Confirmé* (cf. Ch. 16) |
| Agentic Profile (Tier 1–4) | Cloud Security Alliance | White paper (draft) | 27 mars 2026 | *Confirmé* |
| AI Agent Standards Initiative | NIST / CAISI | Initiative | 17 févr. 2026 | *Probable* |
| NIST IR 8596 / Cyber AI Profile | NIST | Draft (?) | fin 2025 (?) | **À vérifier** |
| DORA (UE 2022/2554) | UE / EIOPA, EBA, ESMA | Règlement contraignant | application 17 janv. 2025 | *Confirmé* |
| Reg. exéc. UE 2024/2956 (registre) | Commission UE | ITS contraignant | 17 janv. 2025 | **À vérifier** (n° EUR-Lex) |
| FS AI RMF + Lexicon (230 obj.) | U.S. Treasury | *Soft law* (volontaire) | 19 févr. 2026 | *Confirmé* (230 obj. *probable*) |

**Tableau 19.2 — Auditabilité : exigences vs cadres superviseurs réutilisés [22].**

| Élément à capturer | Cadre superviseur mobilisé |
|---|---|
| Chaîne de raisonnement (données, logique, alternatives, confiance) | SR 11-7 (model risk, Réserve fédérale) |
| Autorisations / périmètre de l'agent | Gestion du risque tiers |
| Contexte reçu + systèmes aval touchés | FFIEC IT guidance |
| Approbation / override humain | SR 11-7 + contrôles internes |

**Tableau 19.3 — Indicateurs d'adoption (à citer comme tels) [24a][24b][25].**

| Indicateur | Valeur | Source / statut |
|---|---|---|
| Succès OSWorld (AI Index) | 66,3 % (depuis ~12 %) | Stanford HAI — *confirmé* |
| Succès OSWorld (blogue computer-use) | 82 % | Coasty — instantané/agent distinct |
| Agents jamais en production | ~89 % | secondaires — *probable* |
| Coût implémentation | 150 k–800 k USD | secondaires — *probable* |
| Organisations exécutant des agents | 79 % (PwC, mai 2025) | **à vérifier** |
| Gains de productivité mesurables | 66 % (PwC) | **à vérifier** |
| Pilotes agentiques GenAI | 25 % (2025) → 50 % (2027) (Deloitte) | **à vérifier** |

**Divergences signalées.**
- **OSWorld** : 66,3 % (rapport primaire HAI) vs **82 %** (blogue computer-use Coasty) — instantanés/agents différents ; **ne pas fusionner**. Le volet « ~89 % jamais en production » + coût 150–800 k USD est corroboré par plusieurs secondaires mais **non reconfirmé** sur la page primaire HAI.
- **Statut « beta » du serveur MCP IBM i** (cf. Ch. annexe infra) : exact à l'annonce d'octobre 2025 (IT Jungle, « early version »), mais le dépôt GitHub affiche désormais un badge « Stable » — le statut a évolué entre l'annonce et juin 2026.
- **DORA — ITS du registre** : « 2024/2956 » provient d'une source secondaire (QuoIntelligence) et n'a **pas** été confirmé sur EUR-Lex ; la date d'application 17 janv. 2025 et le Règlement (UE) 2022/2554 sont, eux, confirmés sur EIOPA.

**Marqueurs d'incertitude.** C05/C07/C19/C21/C14 *confirmés* ; C07b/C21b/C22/C23/C24 *probables* ; C08/C20/C25 **à vérifier**.

**Questions ouvertes / à vérifier en relance.**
- **NIST IR 8596** : statut (*initial preliminary draft* ?), date exacte, et calendrier COSAiS/Cyber AI Profile (SP 800-53) — sur csrc.nist.gov.
- **DORA** : confirmer sur EUR-Lex le numéro exact du Règlement d'exécution (art. 28(9)) et l'échéance annuelle de soumission (30 avril ? XBRL/XML ?).
- **Treasury FS AI RMF** : confirmer le chiffre de 230 objectifs de contrôle et le mappage explicite aux fonctions/catégories/sous-catégories du NIST AI RMF sur treasury.gov.
- **Enquêtes d'adoption** (PwC mai 2025 : 79 %/66 % ; Deloitte : 25 %→50 % en 2027) : retrouver et citer les rapports primaires.
- **watsonx Orchestrate** : confirmer sur une page IBM lisible l'association à Think 2026 et la liste exacte des métriques d'évaluation pré-déploiement (annonce 403 au fetch).
- **NIST/CAISI** : confirmer directement sur nist.gov la page de l'AI Agent Standards Initiative (17 févr. 2026).

---

## Annexe Ch. 19 — Modernisation des systèmes patrimoniaux (mainframe) et MCP

**Insight-clé.** L'interopérabilité agentique atteint le cœur des systèmes patrimoniaux : IBM expose désormais ses plateformes z/OS et IBM i comme **outils MCP**, permettant à des agents LLM de découvrir et consommer des services et données mainframe (CICS, Db2, IMS, MQ). La capacité est *confirmée* ; les **sous-versions exactes** et le **statut GA/preview** restent partiellement **à vérifier** (docs.ibm.com renvoie HTTP 403 au fetch direct).

**Faits datés et cités.**

- **z/OS Connect → outils MCP.** IBM z/OS Connect (lignée 3.0, OpenAPI 3) permet d'exposer des opérations d'API OpenAPI 3 comme **outils MCP**, le serveur MCP générant automatiquement les descriptions d'outils à partir de la spécification OpenAPI [15a][15b][15c]. Capacité MCP *confirmée* (annonce IBM + index docs) ; **la sous-version exacte (refresh 3.0.9x) introduisant MCP et son statut GA/preview restent À VÉRIFIER** (docs.ibm.com 403 ; recherche confirme des refresh au-delà de 3.0.90 sans isoler la sous-version MCP). `asOf 2026-06-08`.
- **Serveur MCP CICS.** CICS Transaction Server for z/OS (lignée 6.x) fournit un « *CICS MCP server* » donnant accès à des outils qu'une application peut utiliser pour assister un LLM, intégrant des agents directement dans les transactions CICS ; l'agent de détermination de problème associé requiert **CICS TS 6.3+ avec l'APAR PH68212**, et **CICS TS 6.3.0 est GA depuis le 5 septembre 2025** [16a][16b]. *Confirmé* pour l'existence ; **le refresh exact introduisant le serveur MCP et son statut restent partiellement à vérifier** (page docs IBM 403). `asOf 2026-06-08`.
- **Serveur MCP IBM i.** Le serveur MCP pour IBM i (dépôt open-source IBM/ibmi-mcp-server, **Apache 2.0**, équipe de Jesse Gorzinski) a été dévoilé à IBM TechXchange en **octobre 2025** à l'état de version préliminaire (« early version »/beta) ; il expose des opérations Db2 for i via des outils SQL configurés en YAML (WebSocket via Mapepire), consommables par Claude, VSCode Copilot, Bob et des agents personnalisés. Produit **distinct** de z/OS Connect [17a][17b]. *Confirmé* — NB : le dépôt GitHub affiche désormais un badge « **Stable** » (~499 commits) ; l'étiquette « beta » vaut pour l'annonce d'octobre 2025. `asOf 2026-06-08`.
- **Intention « 500 outils MCP en 2026 ».** IBM déclare l'intention de livrer 500 outils MCP en 2026 pour ses plateformes (IBM Z / IBM i) ; IT Jungle cite **verbatim** un document IBM : « *our intent is to deliver 500 tools in 2026* » [18]. *Probable* — citation médiée par la presse spécialisée, **le document IBM source n'étant pas directement lisible**. `asOf 2026-06-08`.

**Tableau A19.1 — Connecteurs MCP mainframe IBM (≥ 2 dimensions).**

| Produit | Plateforme / données | Mécanisme MCP | Licence / origine | Statut |
|---|---|---|---|---|
| z/OS Connect 3.0 | z/OS (CICS, Db2, IMS, MQ) | OpenAPI 3 → outils MCP (auto-gén.) | IBM (commercial) | Capacité *confirmée* ; sous-version GA **à vérifier** |
| CICS MCP server | CICS TS 6.x | Outils pour assister LLM in-transaction | IBM (commercial) | *Confirmé* ; refresh exact **à vérifier** |
| ibmi-mcp-server | IBM i (Db2 for i) | Outils SQL en YAML (WebSocket/Mapepire) | **Apache 2.0** (IBM/GitHub) | *Confirmé* ; « beta » à l'annonce, « Stable » en juin 2026 |

**Divergences signalées.** Statut **« beta »** du serveur MCP IBM i : exact à l'annonce d'octobre 2025 (IT Jungle), mais le dépôt GitHub affiche désormais « Stable » — divergence temporelle à ne pas lisser.

**Marqueurs d'incertitude.** C16/C17 *confirmés* ; C15 *confirmé* (capacité) avec sous-version **à vérifier** ; C18 *probable*.

**Questions ouvertes / à vérifier en relance.**
- **z/OS Connect** : dans quel refresh exact de la lignée 3.0 (3.0.9x) la capacité « OpenAPI 3 → outils MCP » a-t-elle été livrée, et est-elle GA ou *technology preview* ? (isoler via la *change history* OpenAPI 3 ; docs.ibm.com 403).
- **CICS TS** : quel release précis de la lignée 6.x introduit le « CICS MCP server » (au-delà de l'agent de détermination de problème qui requiert 6.3 + APAR PH68212), et quel est son statut GA/beta ?

---

## Note transversale sur les niveaux de preuve

Cette PARTIE VI mobilise des sources d'autorité hétérogène. Les **primaires fortes** (NIST/CAISI, EIOPA, U.S. Treasury, OWASP, Stanford HAI, dépôts GitHub IBM sous licence Apache 2.0, préimpressions arXiv avec HTML plein texte vérifié) soutiennent les claims *confirmés*. Les **secondaires** (presse spécialisée IT Jungle, analyses juridiques, agrégateurs) et les **préimpressions à auteur unique sans peer-review** (CLEAR) ne soutiennent que des claims *probables* ou *à vérifier* et ne doivent **pas** servir d'affirmation normative dans la rédaction doctorale finale. Les obstacles techniques persistants — **docs.ibm.com en HTTP 403** au fetch direct — expliquent que plusieurs sous-versions IBM et l'annonce watsonx Orchestrate restent partiellement à confirmer.

---


# Annexe — Index bibliographique global (dédupliqué)

> 305 sources uniques agrégées depuis les listes locales des parties. L'ordre est indicatif (non lié aux appels `[n]` internes).

1. The Levels of Conceptual Interoperability Model (Tolk & Muguira, 2003 Fall SIW, Orlando) — texte intégral du PDF original (paper 03F-SIW-007 ; 'five levels of interoperability are defined', L0-L4 data-centric) — 2003 Fall Simulation Interoperability Workshop / MSCO archive — 2003 — <https://www.mscoe.org/content/uploads/2017/12/Tolk-Muguira-The-Levels-of-Conceptual-Interoperability-Models.pdf>
2. Applying the LCIM in Support of Integratability, Interoperability, and Composability for SoS Engineering (Tolk, Diallo, Turnitsa) — source primaire de la forme 0-6 nommée ET du triplet (Figure 1 : Modeling/Simulation/Network) — Journal of Systemics, Cybernetics and Informatics, Vol.5 No.5 (IIIS), ISSN 1690-4524 — 2007 — <https://www.iiisci.org/journal/pdv/sci/pdfs/p468106.pdf>
3. The Levels of Conceptual Interoperability Model: Applying Systems Engineering Principles to M&S (Wang, Tolk & Wang) — 'seven levels... L0 to L6' ; bibliographie de la lignée (Winters 2006, Diallo 2008) — arXiv / SpringSim'09 (SCS), San Diego — 2009 — <https://arxiv.org/pdf/0908.0191>
4. Applying the LCIM... for SoS Engineering — page de dépôt (miroir ; métadonnées 2011, publication originale 2007) — Old Dominion University Digital Commons (MSVE) — 2011 — <https://digitalcommons.odu.edu/msve_fac_pubs/27/>
5. Conceptual interoperability — définitions L0-L6 et historique des auteurs (Turnitsa 2005, Winters 2006) — source secondaire de corroboration — HandWiki — 2023 — <https://handwiki.org/wiki/Conceptual_interoperability>
6. Enterprise Integration Patterns — Messaging Patterns Overview (site officiel) : '65 integration patterns', 7 catégories — Gregor Hohpe / enterpriseintegrationpatterns.com — 2023 — <https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html>
7. Enterprise Integration Patterns — Conversation Patterns (Vol.2, 'Work in progress. Last update: Jan 2017') ; aucune mention d'agents/LLM — Gregor Hohpe / enterpriseintegrationpatterns.com — 2017 — <https://www.enterpriseintegrationpatterns.com/patterns/conversation/>
8. Enterprise Integration Patterns — Wikipedia : Hohpe & Woolf, 10 oct. 2003, ISBN 978-0321200686, 65 patrons, 'GregorGrams', implémentations (Camel/Fuse/Mule ESB/Spring Integration/Guarana DSL) — Wikipedia — 2025 — <https://en.wikipedia.org/wiki/Enterprise_Integration_Patterns>
9. Building Effective Agents — 7 patrons (Augmented LLM, Prompt Chaining, Routing, Parallelization, Orchestrator-Workers, Evaluator-Optimizer, Agents) ; aucune référence EIP/Hohpe/LCIM — Anthropic — 2024-12-19 — <https://www.anthropic.com/engineering/building-effective-agents>
10. Survey of LLM Agent Communication with MCP: A Software Design Pattern Centric Review (Sarkar & Sarkar) — Mediator/Observer/Publish-Subscribe/Broker ; v1 26 mai 2025, v2 22 mai 2026 — arXiv — 2025-05-26 — <https://arxiv.org/abs/2506.05364>
11. Architecting Agentic Communities using Design Patterns (Milosevic & Rabhi) — 3 niveaux LLM Agents/Agentic AI/Agentic Communities ; v1 7 jan. 2026, v3 25 mai 2026 — arXiv — 2026-01-07 — <https://arxiv.org/abs/2601.03624>
12. aurelio-labs/semantic-router — README : 'superfast decision-making layer for your LLMs and agents' ; routage par espace vectoriel sémantique — Aurelio Labs (GitHub) — 2026 — <https://github.com/aurelio-labs/semantic-router/blob/main/README.md>
13. Multiparty asynchronous session types (POPL 2008) — CrossRef metadata — CrossRef / ACM SIGPLAN-SIGACT — 2008 — <https://api.crossref.org/works/10.1145/1328438.1328472>
14. Multiparty Asynchronous Session Types — J. ACM 63(1):9:1-9:67 (dblp) — dblp (Schloss Dagstuhl) — 2016 — <https://dblp.org/rec/journals/jacm/HondaYC16.html>
15. Multiparty Asynchronous Session Types — CrossRef (JACM 63(1):1-67, 2016) — CrossRef / Journal of the ACM — 2016-03-03 — <https://api.crossref.org/works/10.1145/2827695>
16. Multiparty Asynchronous Session Types: A Mechanised Proof of Subject Reduction (ECOOP 2025) — Schloss Dagstuhl — LIPIcs (ECOOP 2025) — 2025-06-25 — <https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.31>
17. Probabilistic Refinement Session Types — CrossRef (PACMPL 9(PLDI):1666-1691) — CrossRef / ACM (PACMPL / PLDI 2025) — 2025-06-10 — <https://api.crossref.org/works/10.1145/3729317>
18. Zooid: a DSL for certified multiparty computation — CrossRef (PLDI '21, p.237-251) — CrossRef / ACM SIGPLAN (PLDI 2021) — 2021-06-18 — <https://api.crossref.org/works/10.1145/3453483.3454041>
19. Multiparty GV — CrossRef (PACMPL 6(ICFP):466-495) — CrossRef / ACM (PACMPL / ICFP 2022) — 2022-08-29 — <https://api.crossref.org/works/10.1145/3547638>
20. Certified Implementability of Global Multiparty Protocols (ITP 2025, Rocq) — Schloss Dagstuhl — LIPIcs (ITP 2025) — 2025-09-22 — <https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ITP.2025.15>
21. Mechanizing the Meta-Theory of Session Types in Rocq: a Tutorial — U. Milano (Momigliano et al.) — 2025 — <https://momigliano.di.unimi.it/papers/stutorial.pdf>
22. Provable Coordination for LLM Agents via Message Sequence Charts (arXiv abs — v2, Lean 4) — arXiv — 2026-04-29 — <https://arxiv.org/abs/2604.17612>
23. Multiparty Session Types Meet Communicating Automata (ESOP 2012, LNCS 7211:194-213) — Springer (LNCS 7211) — 2012 — <https://link.springer.com/chapter/10.1007/978-3-642-28869-2_10>
24. Asynchronous Multiparty Session Type Implementability is Decidable — Lessons Learned from Message Sequence Charts (ECOOP 2023) — Schloss Dagstuhl — LIPIcs (ECOOP 2023) — 2023-07-11 — <https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2023.32>
25. Correct implementation of agent interaction protocols (Frontiers in Computer Science) — Frontiers in Computer Science — 2025-10-31 — <https://www.frontiersin.org/journals/computer-science/articles/10.3389/fcomp.2025.1659785/full>
26. Correct implementation of agent interaction protocols — CrossRef — CrossRef / Frontiers in Computer Science — 2025-10-31 — <https://api.crossref.org/works/10.3389/fcomp.2025.1659785>
27. PSTMonitor: Monitor Synthesis from Probabilistic Session Types (arXiv) — arXiv — 2022-12 — <https://arxiv.org/pdf/2212.07329>
28. Session Coalgebras: A Coalgebraic View on Session Types and Communication Protocols — ACM / PMC — 2021 — <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7984539/>
29. Key Changes (spécification 2025-11-25 changelog) — Model Context Protocol — 2025-11-25 — <https://modelcontextprotocol.io/specification/2025-11-25/changelog>
30. Specification 2025-11-25 (overview, primitives, 'Stateful connections') — Model Context Protocol — 2025-11-25 — <https://modelcontextprotocol.io/specification/2025-11-25>
31. Transports (spécification 2025-11-25) — Model Context Protocol — 2025-11-25 — <https://modelcontextprotocol.io/specification/2025-11-25/basic/transports>
32. Authorization (spécification 2025-11-25 : OAuth 2.1, RFC 9728 MUST, PKCE S256, RFC 8707) — Model Context Protocol — 2025-11-25 — <https://modelcontextprotocol.io/specification/2025-11-25/basic/authorization>
33. Key Changes (spécification 2025-06-18 changelog : OAuth RS, élicitation) — Model Context Protocol — 2025-06-18 — <https://modelcontextprotocol.io/specification/2025-06-18/changelog>
34. Releases - modelcontextprotocol/modelcontextprotocol (tags ; 2025-11-25 'Latest', 2026-07-28-RC '29 May') — GitHub / Model Context Protocol — 2026-05-29 — <https://github.com/modelcontextprotocol/modelcontextprotocol/releases>
35. Donating the Model Context Protocol and establishing the Agentic AI Foundation ('directed fund' ; 10k serveurs ; 97M+ téléchargements) — Anthropic — 2025-12-09 — <https://www.anthropic.com/news/donating-the-model-context-protocol-and-establishing-of-the-agentic-ai-foundation>
36. Linux Foundation Announces the Formation of the Agentic AI Foundation (AAIF) — Linux Foundation — 2025-12-09 — <https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation>
37. The 2026-07-28 MCP Specification Release Candidate (stateless ; dépréciations ; Extensions) — Model Context Protocol Blog — 2026-05-21 — <https://blog.modelcontextprotocol.io/posts/2026-07-28-release-candidate/>
38. The 2026 MCP Roadmap (4 axes ; aucun nouveau transport) — Model Context Protocol Blog — 2026-03-09 — <https://blog.modelcontextprotocol.io/posts/2026-mcp-roadmap/>
39. Introducing the MCP Registry (preview ; 'breaking changes may occur before GA') — Model Context Protocol Blog — 2025-09-08 — <https://blog.modelcontextprotocol.io/posts/2025-09-08-mcp-registry-preview/>
40. The MCP Registry (about) — Model Context Protocol — 2026 — <https://modelcontextprotocol.io/registry/about>
41. CVE-2025-49596 Detail (NVD : MCP Inspector < 0.14.1, RCE, CVSS v4.0 9.4) — NVD / NIST — 2025-06-13 — <https://nvd.nist.gov/vuln/detail/CVE-2025-49596>
42. Expanding the MCP Maintainer Team (Delimarsky/Anthropic Lead, Liguori/AWS Core) — Model Context Protocol Blog — 2026-04-08 — <https://blog.modelcontextprotocol.io/posts/2026-04-08-maintainer-update/>
43. January MCP Core Maintainer Update (Van Gent/Google, McCaffrey/Microsoft, Alexander/Anthropic) — Model Context Protocol Blog — 2026-01-23 — <https://blog.modelcontextprotocol.io/posts/2026-01-22-core-maintainer-update/>
44. Model Context Protocol GitHub organization (dépôts SDK ; co-maintenance Google/JetBrains/Microsoft) — GitHub / Model Context Protocol — 2026-06 — <https://github.com/modelcontextprotocol>
45. Model Context Protocol (MCP) - OpenAI Agents SDK — OpenAI — 2026 — <https://openai.github.io/openai-agents-js/guides/mcp/>
46. Google Cloud donates A2A to Linux Foundation (membres fondateurs ; donation) — Google Developers Blog — 2025-06-23 — <https://developers.googleblog.com/en/google-cloud-donates-a2a-to-linux-foundation/>
47. Linux Foundation Launches the Agent2Agent Protocol Project — Linux Foundation — 2025-06-23 — <https://www.linuxfoundation.org/press/linux-foundation-launches-the-agent2agent-protocol-project-to-enable-secure-intelligent-communication-between-ai-agents>
48. Google Open-Sources Agent2Agent Protocol for Agentic Collaboration — InfoQ — 2025-04 — <https://www.infoq.com/news/2025/04/google-agentic-a2a/>
49. Agent2Agent (A2A) Protocol Specification (1.0.0 'latest released') — A2A Project (Linux Foundation) — 2026 — <https://a2a-protocol.org/latest/specification/>
50. Announcing Version 1.0 - A2A Protocol — A2A Project (Linux Foundation) — 2026-03 — <https://a2a-protocol.org/latest/announcing-1.0/>
51. Releases - a2aproject/A2A (v1.0.0 12 Mar 2026 ; v1.0.1 28 May 2026) — A2A Project / GitHub — 2026-05-28 — <https://github.com/a2aproject/A2A/releases>
52. A2A Protocol Surpasses 150 Organizations ... Enterprise Production Use in First Year — Linux Foundation — 2026-04-09 — <https://www.linuxfoundation.org/press/a2a-protocol-surpasses-150-organizations-lands-in-major-cloud-platforms-and-sees-enterprise-production-use-in-first-year>
53. What is Agent Communication Protocol (ACP)? — IBM — 2025 — <https://www.ibm.com/think/topics/agent-communication-protocol>
54. ACP Joins Forces with A2A under the Linux Foundation (GitHub discussion) — i-am-bee (BeeAI) GitHub — 2025-08-25 — <https://github.com/orgs/i-am-bee/discussions/5>
55. ACP Joins Forces with A2A - LFAI & Data — LF AI & Data Foundation — 2025-08-29 — <https://lfaidata.foundation/communityblog/2025/08/29/acp-joins-forces-with-a2a-under-the-linux-foundations-lf-ai-data/>
56. Linux Foundation Welcomes the AGNTCY Project — Linux Foundation — 2025-07-29 — <https://www.linuxfoundation.org/press/linux-foundation-welcomes-the-agntcy-project-to-standardize-open-multi-agent-system-infrastructure-and-break-down-ai-agent-silos>
57. Agntcy Documentation (OASF, Agent Directory, Identity, SLIM, Observability) — AGNTCY (Linux Foundation) — 2026 — <https://docs.agntcy.org/>
58. Building the Internet of Agents: Introducing AGNTCY.org — Outshift by Cisco — 2025-03 — <https://outshift.cisco.com/blog/ai-ml/building-the-internet-of-agents-introducing-the-agntcy>
59. AGNTCY Agent Directory: Find and publish AI agents — Outshift by Cisco — 2025 — <https://outshift.cisco.com/blog/ai-ml/agntcy-agent-directory-find-and-publish-ai-agents>
60. AG-UI: the Agent-User Interaction Protocol (GitHub, Release 2026-06-05) — ag-ui-protocol / CopilotKit — 2026-06-05 — <https://github.com/ag-ui-protocol/ag-ui>
61. AG-UI Overview - Agent User Interaction Protocol — CopilotKit — 2026 — <https://docs.ag-ui.com/>
62. AG-UI Protocol | CopilotKit — CopilotKit — 2026 — <https://www.copilotkit.ai/ag-ui>
63. Introducing A2UI: an open project for agent-driven interfaces (v0.8) — Google Developers Blog — 2025-12-15 — <https://developers.googleblog.com/en/introducing-a2ui-an-open-project-for-agent-driven-interfaces/>
64. Release Announcements (liste officielle versions et dates Kafka) — Apache Software Foundation — 2026-05-30 — <https://kafka.apache.org/blog/releases/>
65. Apache Kafka 4.3.0 Release Announcement — Apache Software Foundation — 2026-05-22 — <https://kafka.apache.org/blog/2026/05/22/apache-kafka-4.3.0-release-announcement/>
66. Apache Kafka 4.2.0 Release Announcement — Apache Software Foundation — 2026-02-17 — <https://kafka.apache.org/blog/2026/02/17/apache-kafka-4.2.0-release-announcement/>
67. Apache Kafka 4.2.0 (Confluent, date divergente 2026-02-20) — Confluent — 2026-02-20 — <https://www.confluent.io/blog/apache-kafka-4-2-release/>
68. Apache Kafka 4.1.0 Release Announcement — Apache Software Foundation — 2025-09-04 — <https://kafka.apache.org/blog/2025/09/04/apache-kafka-4.1.0-release-announcement/>
69. Apache Kafka 4.0.0 Release Announcement — Apache Software Foundation — 2025-03-18 — <https://kafka.apache.org/blog/2025/03/18/apache-kafka-4.0.0-release-announcement/>
70. Transaction Protocol (doc officielle 4.1 - activation serveur depuis 4.0) — Apache Software Foundation — 2025-09-04 — <https://kafka.apache.org/41/operations/transaction-protocol/>
71. KIP-890: Transactions Server-Side Defense (statut Approved) — Apache Software Foundation — 2025-01-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-890:+Transactions+Server-Side+Defense>
72. KIP-98 - Exactly Once Delivery and Transactional Messaging (Adopted) — Apache Software Foundation — 2026-03-04 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-98+-+Exactly+Once+Delivery+and+Transactional+Messaging>
73. KIP-185: Make exactly once in order delivery per partition the default — Apache Software Foundation — 2017-09-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-185:+Make+exactly+once+in+order+delivery+per+partition+the+default+Producer+setting>
74. KIP-447: Producer scalability for exactly once semantics (Adopted 2.6.0) — Apache Software Foundation — 2020-06-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-447:+Producer+scalability+for+exactly+once+semantics>
75. KIP-732: Deprecate eos-alpha and replace eos-beta with eos-v2 (Kafka 3.0.0) — Apache Software Foundation — 2021-06-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-732:+Deprecate+eos-alpha+and+replace+eos-beta+with+eos-v2>
76. KIP-939: Support Participation in 2PC (Accepted, version non spécifiée) — Apache Software Foundation — 2024-06-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-939:+Support+Participation+in+2PC>
77. FLIP-319: Integrate with Kafka Support for Proper 2PC Participation — Apache Software Foundation (Flink) — 2024-01-01 — <https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=255071710>
78. KIP-405: Kafka Tiered Storage (production-ready depuis 3.9) — Apache Software Foundation — 2020-01-01 — <https://cwiki.apache.org/confluence/display/KAFKA/KIP-405:+Kafka+Tiered+Storage>
79. Exactly-once Semantics is Possible: Here is How Apache Kafka Does It (limite effets de bord verbatim) — Confluent (Narkhede, Wang et al.) — 2025-03-01 — <https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/>
80. Integrating AI Into Apache Kafka Architectures: Patterns (outbox/DLQ/replay verbatim) — Confluent — 2026-05-05 — <https://www.confluent.io/blog/ai-kafka-integration-patterns/>
81. How Kafka improves agentic AI — Red Hat Developer (M. Vandeperre) — 2025-06-16 — <https://developers.redhat.com/articles/2025/06/16/how-kafka-improves-agentic-ai>
82. Exactly-Once Semantics in Kafka (glossaire, secondaire - coût performance) — Conduktor — 2025-01-01 — <https://www.conduktor.io/glossary/exactly-once-semantics-in-kafka>
83. Tiered Storage for Confluent Platform — Confluent — 2025-01-01 — <https://docs.confluent.io/platform/current/clusters/tiered-storage.html>
84. A Complete Comparison of Apache Kafka vs Confluent — Confluent — 2025-01-01 — <https://www.confluent.io/apache-kafka-vs-confluent/>
85. Exactly once support - IBM MQ 9.4.x Documentation — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.4.x?topic=scenarios-exactly-once-support>
86. Syncpoints in IBM MQ for Multiplatforms - IBM MQ 9.3.x Documentation — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.3.x?topic=work-syncpoints-in-mq-multiplatforms>
87. MQCMIT (Commit changes) - IBM MQ Documentation — IBM — 2024 — <https://www.ibm.com/docs/en/ibm-mq/9.2.x?topic=i-mqcmit-commit-changes>
88. IBM MQ Source Connector for Confluent Platform - Overview — Confluent — 2025 — <https://docs.confluent.io/kafka-connectors/ibmmq-source/current/overview.html>
89. Running the MQ source connector - IBM Event Automation / Event Streams — IBM — 2025 — <https://ibm.github.io/event-automation/es/connecting/mq/source/>
90. kafka-connect-mq-source (README) - ibm-messaging — IBM (GitHub) — 2025 — <https://github.com/ibm-messaging/kafka-connect-mq-source/blob/main/README.md>
91. Introducing IBM MQ version 9.4: Built for change — IBM — 2024-05-14 — <https://www.ibm.com/new/announcements/introducing-ibm-mq-version-9-4-built-for-change>
92. IBM MQ - endoflife.date — endoflife.date — 2026 — <https://endoflife.date/ibm-mq>
93. IBM MQ ... 9.4.5 Continuous Delivery releases are available — IBM Community (Ian Harwood, IBM Hursley) — 2026-01-30 — <https://community.ibm.com/community/user/blogs/ian-harwood1/2026/01/30/mq945ga>
94. IBM MQ ... 9.4.4 Continuous Delivery releases are available — IBM Community (Ian Harwood, IBM Hursley) — 2025-10-10 — <https://community.ibm.com/community/user/blogs/ian-harwood1/2025/10/10/mq944ga>
95. Enhancing security, productivity and resilience with IBM MQ 9.4.3 — IBM — 2025-06-10 — <https://www.ibm.com/new/announcements/enhancing-security-productivity-and-resilience-with-ibm-mq-9-4-3>
96. IBM MQ 9.4.4 strengthens hybrid resilience and federal compliance — IBM — 2025-10-02 — <https://www.ibm.com/new/announcements/enhanced-resilience-compliance-and-simplicity-with-ibm-mq-9-4-4>
97. Native HA Cross-Region Replication - IBM MQ 9.4.x Documentation — IBM — 2025 — <https://www.ibm.com/docs/en/ibm-mq/9.4.x?topic=containers-native-ha-cross-region-replication>
98. Exactly-once semantics with Kafka transactions (Strimzi blog) — Strimzi (CNCF) — 2023-05-03 — <https://strimzi.io/blog/2023/05/03/kafka-transactions/>
99. IBM MQ vs. Kafka vs. ActiveMQ: Comparing Message Brokers — OpenLogic (Perforce) — 2024 — <https://www.openlogic.com/blog/ibm-mq-vs-kafka-vs-activemq>
100. The Future of AI Agents Is Event-Driven — Confluent (Sean Falconer) — 2025-05-13 — <https://www.confluent.io/blog/the-future-of-ai-agents-is-event-driven/>
101. Mainframe Market Size, Growth & Outlook 2026-2031 — Mordor Intelligence — 2025 — <https://www.mordorintelligence.com/industry-reports/mainframe-market>
102. z/OS Connect 3.0.102 now available (IBM Community) — IBM Community — 2026-04-20 — <https://community.ibm.com/community/user/blogs/geetha-s2/2026/04/20/zos-connect-30102-now-available>
103. PH70973: z/OS Connect EE Unlimited continuous delivery update (3.0.103) - IBM Support — IBM Support — 2026-05 — <https://www.ibm.com/support/pages/ph70973-ibm-zos-connect-enterprise-edition-unlimited-continuous-delivery-update-30103-notices-and-information>
104. z/OS Connect 3.0.101 now available (IBM Community, Kate Bittles) — IBM Community — 2026-02-23 — <https://community.ibm.com/community/user/blogs/kate-bittles/2026/02/23/zos-connect-30101-now-available>
105. z/OS Connect 3.0.98 now available - introduction du MCP (IBM Community, Shruthi Krishnan) — IBM Community — 2025-10-21 — <https://community.ibm.com/community/user/blogs/shruthi-krishnan/2025/10/21/zos-connect-3098-now-available>
106. zosconnect/sample-oas3-requester (GitHub) — IBM (zosconnect, GitHub) — 2025 — <https://github.com/zosconnect/sample-oas3-requester>
107. z/OS Connect on GitHub (Designer, OpenAPI 3.0) — IBM (zosconnect.github.io) — 2026 — <https://zosconnect.github.io/>
108. IBM watsonx Assistant for Z: agentic AI (announcement) — IBM — 2025-11-19 — <https://www.ibm.com/new/announcements/ibm-watsonx-assistant-for-z-bringing-intelligence-and-automation-to-mainframe-it-management-with-agentic-ai>
109. IBM watsonx Assistant for Z v3.2: Increased flexibility, security and simplicity — IBM — 2026 — <https://www.ibm.com/new/announcements/ibm-watsonx-assistant-for-z-v3-2-increased-flexibility-security-and-simplicity>
110. Accelerating AI on IBM Z: watsonx Assistant for Z now powered by Spyre Accelerator — IBM — 2025-12-12 — <https://www.ibm.com/new/announcements/watsonx-assistant-for-z-now-powered-by-spyre-accelerator>
111. IBM/z-ai-agents (GitHub, v1.2.1) — IBM (GitHub) — 2026-05-15 — <https://github.com/IBM/z-ai-agents>
112. Agentic AI for smarter mainframe modernization with IBM watsonx Code Assistant for Z — IBM — 2026 — <https://www.ibm.com/new/announcements/agentic-ai-for-smarter-mainframe-modernization-with-ibm-watsonx-code-assistant-for-z>
113. watsonx Code Assistant for Z v2.8.x: The Final Chapters Before Project Bob (CROZ, partenaire IBM) — CROZ (partenaire IBM) — 2026 — <https://croz.net/watsonx-final-chapters-before-project-bob/>
114. IBM watsonx Code Assistant for Z adds AI Code Generation and Assembler Support (v2.6, 27 juin 2025) — IBM — 2025 — <https://www.ibm.com/new/announcements/ibm-watsonx-code-assistant-for-z-adds-ai-code-generation-and-assembler-support>
115. IBM's AI coding 'partner' Bob hits general availability (The Register) — The Register — 2026-04-28 — <https://www.theregister.com/2026/04/28/ibms_ai_coding_partner_bob/>
116. IBM's AI coding 'partner' Bob hits general availability (DevClass) — DevClass — 2026-04-29 — <https://www.devclass.com/development/2026/04/29/ibms-ai-coding-partner-bob-hits-general-availability/5219012>
117. IBM Ships Homegrown Spyre Accelerators, Embraces Anthropic For AI Push (NextPlatform, agrégateur - non normatif) — The Next Platform — 2025-10-10 — <https://www.nextplatform.com/ai/2025/10/10/ibm-ships-homegrown-spyre-accelerators-embraces-anthropic-for-ai-push/1642396>
118. Simplifying and scaling integration operations with IBM Cloud Pak for Integration 16.1.3 (IBM) — IBM — 2025-12 — <https://www.ibm.com/new/announcements/simplifying-and-scaling-integration-operations-with-ibm-cloud-pak-for-integration-16-1-3>
119. Announcing IBM Cloud Pak for Integration 16.1.3 (Leif Davidsen, IBM) — Leif Davidsen (IBM) — 2025-12-09 — <https://leifdavidsen.wordpress.com/2025/12/09/elevate-control-of-your-business-through-unified-management-and-make-integrations-more-accessible-and-secure-with-us-federal-compliance-announcing-ibm-cloud-pak-for-integration-16-1-3/>
120. IBM/mcp-context-forge - MCP Gateway (GitHub, v1.0.2) — IBM (GitHub) — 2026-05-26 — <https://github.com/IBM/mcp-context-forge>
121. IBM/mcp (GitHub, collection serveurs/clients/outils MCP) — IBM (GitHub) — 2026 — <https://github.com/IBM/mcp>
122. IBM Z Open Editor Releases (MCP en v6.0.0, 19 sept. 2025) — IBM (zopeneditor) — 2026 — <https://ibm.github.io/zopeneditor-about/Blog/new-releases.html>
123. IBM z/OS Connect (page produit, options de déploiement) — IBM — 2026 — <https://www.ibm.com/products/zos-connect>
124. IBM Cloud Pak for Integration (page produit) — IBM — 2026 — <https://www.ibm.com/products/cloud-pak-for-integration>
125. SPIRE | CNCF (project page, dates de maturité) — CNCF — 2026 — <https://www.cncf.io/projects/spire/>
126. SPIFFE | CNCF (project page, dates de maturité) — CNCF — 2026 — <https://www.cncf.io/projects/spiffe/>
127. SPIFFE and SPIRE Projects Graduate from CNCF Incubator (annonce ; Cure53 ; adopteurs) — CNCF — 2022-09-20 — <https://www.cncf.io/announcements/2022/09/20/spiffe-and-spire-projects-graduate-from-cloud-native-computing-foundation-incubator/>
128. SPIFFE and SPIRE Projects Graduate from Cloud Native Computing Foundation — CNCF — 2022-09-20 — <https://www.cncf.io/announcements/2022/09/20/spiffe-and-spire-projects-graduate-from-cloud-native-computing-foundation/>
129. spiffe/spire Releases (GitHub, v1.15.1) — SPIFFE / GitHub — 2026-05-28 — <https://github.com/spiffe/spire/releases>
130. SPIFFE-ID standard (spiffe/spiffe GitHub) — SPIFFE — 2026 — <https://github.com/spiffe/spiffe/blob/main/standards/SPIFFE-ID.md>
131. SPIFFE | X509-SVID specification — SPIFFE — 2026 — <https://spiffe.io/docs/latest/spiffe-specs/x509-svid/>
132. SPIFFE | JWT-SVID specification — SPIFFE — 2026 — <https://spiffe.io/docs/latest/spiffe-specs/jwt-svid/>
133. SPIFFE | SPIRE Concepts (node/workload attestation) + SPIFFE Federation specification — SPIFFE — 2026 — <https://spiffe.io/docs/latest/spire-about/spire-concepts/>
134. SPIFFE: Securing the identity of agentic AI and non-human actors (HashiCorp blog) — HashiCorp — 2026-04-30 — <https://www.hashicorp.com/en/blog/spiffe-securing-the-identity-of-agentic-ai-and-non-human-actors>
135. What are SPIFFE and SPIRE? (Red Hat ; Zero Trust Workload Identity Manager tech preview) — Red Hat — 2025-10-08 — <https://www.redhat.com/en/topics/security/spiffe-and-spire>
136. Defakto Secures $30.75M Series B (Defakto blog) — Defakto — 2025-10-21 — <https://www.defakto.security/blog/defakto-secures-30-75-m-series-b-to-set-a-new-standard-in-non-human-identity-security/>
137. Defakto raises $30.75m to secure non-human identities — FinTech Global — 2025-10-27 — <https://fintech.global/2025/10/27/defakto-raises-30-75m-to-secure-non-human-identities/>
138. Our Journey Adopting SPIFFE/SPIRE at Scale (Uber Engineering blog) + SPIRE Case Studies (spiffe.io) — Uber Engineering — 2023-11-09 — <https://www.uber.com/en-IE/blog/our-journey-adopting-spiffe-spire/>
139. What is SPIFFE? Universal Workload Identity Framework Guide (Palo Alto Networks) — Palo Alto Networks — 2025 — <https://www.paloaltonetworks.com/cyberpedia/what-is-spiffe>
140. Charter for WIMSE (IETF Datatracker) — IETF — 2026-03-18 — <https://datatracker.ietf.org/doc/charter-ietf-wimse/>
141. Workload Identity in Multi System Environments (wimse) - WG About / Charter / Milestones — IETF — 2026-06 — <https://datatracker.ietf.org/wg/wimse/about/>
142. IETF WIMSE Working Group - Documents — IETF — 2026-06 — <https://datatracker.ietf.org/wg/wimse/documents/>
143. WIMSE WG documents (jeu de drafts actifs) (IETF Datatracker) — IETF — 2026 — <https://datatracker.ietf.org/group/wimse/documents/>
144. draft-ietf-wimse-arch - WIMSE Architecture (datatracker) — IETF — 2026-03-02 — <https://datatracker.ietf.org/doc/draft-ietf-wimse-arch/>
145. draft-ietf-wimse-s2s-protocol (Dead/Replaced) (IETF Datatracker) — IETF — 2025-10-16 — <https://datatracker.ietf.org/doc/draft-ietf-wimse-s2s-protocol/>
146. draft-ietf-wimse-workload-creds - WIMSE Workload Credentials (datatracker) — IETF — 2026-05-05 — <https://datatracker.ietf.org/doc/draft-ietf-wimse-workload-creds/>
147. draft-ietf-wimse-workload-creds-01 (texte HTML, claims WIT) — IETF — 2026-05-05 — <https://www.ietf.org/archive/id/draft-ietf-wimse-workload-creds-01.html>
148. draft-ietf-wimse-wpt - WIMSE Workload Proof Token (datatracker) — IETF — 2026-03-02 — <https://datatracker.ietf.org/doc/draft-ietf-wimse-wpt/>
149. draft-ietf-wimse-http-signature (datatracker) — IETF — 2026-04-07 — <https://datatracker.ietf.org/doc/draft-ietf-wimse-http-signature/>
150. draft-ietf-wimse-identifier - Workload Identifier (datatracker) — IETF — 2026-03-02 — <https://datatracker.ietf.org/doc/draft-ietf-wimse-identifier/>
151. draft-ietf-oauth-attestation-based-client-auth-09 (métadonnée Intended RFC status = None) — IETF — 2026-05-26 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-attestation-based-client-auth/>
152. RFC 8693 - OAuth 2.0 Token Exchange — IETF — 2020-01 — <https://datatracker.ietf.org/doc/rfc8693/>
153. draft-ietf-oauth-identity-chaining - OAuth Identity and Authorization Chaining Across Domains (datatracker) — IETF — 2026-06-04 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/>
154. draft-ietf-oauth-identity-chaining history (états IESG, positions de ballot) — IETF — 2026-06-04 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/history/>
155. draft-ietf-oauth-transaction-tokens (datatracker) + editor's copy -latest — IETF — 2026-03-02 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-transaction-tokens/>
156. draft-ietf-oauth-identity-assertion-authz-grant - Identity Assertion JWT Authorization Grant (datatracker) — IETF — 2026-05-21 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-assertion-authz-grant/>
157. draft-ietf-oauth-spiffe-client-auth-01 - OAuth SPIFFE Client Authentication (co-auteurs NIST + IBM) — IETF — 2026-03-02 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-spiffe-client-auth/>
158. draft-ietf-oauth-v2-1-15 (OAuth 2.1) (datatracker) — IETF — 2026-03-02 — <https://datatracker.ietf.org/doc/draft-ietf-oauth-v2-1/>
159. Cross-App Access - OAuth.net — OAuth.net (communauté IETF OAuth) — 2026 — <https://oauth.net/cross-app-access/>
160. draft-klrc-aiagent-auth-02 - AI Agent Authentication and Authorization (individuel) — IETF Datatracker — 2026-06-01 — <https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/>
161. draft-araut-oauth-transaction-tokens-for-agents-02 (individuel ; agentic_ctx + Monotonic Attenuation ; divergence intended status) — IETF Datatracker — 2026-05-22 — <https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/>
162. draft-embesozzi-oauth-agent-native-authorization-00 (Independent Submission ; structured elicitation + JIT) — IETF Datatracker — 2026-04-03 — <https://datatracker.ietf.org/doc/draft-embesozzi-oauth-agent-native-authorization/>
163. draft-oauth-ai-agents-on-behalf-of-user-02 (EXPIRE & archivé - ne pas citer comme normatif) — IETF Datatracker (individuel, expiré) — 2026-02-26 — <https://datatracker.ietf.org/doc/draft-oauth-ai-agents-on-behalf-of-user/>
164. Decentralized Identifiers (DIDs) v1.0 (W3C Recommendation) — W3C — 2022-07-19 — <https://www.w3.org/TR/did-1.0/>
165. Decentralized Identifiers (DIDs) v1.1 (Candidate Recommendation Snapshot) — W3C — 2026-03-05 — <https://www.w3.org/TR/did-1.1/>
166. Verifiable Credentials Data Model v2.0 (W3C Recommendation) — W3C — 2025-05-15 — <https://www.w3.org/TR/vc-data-model-2.0/>
167. Verifiable Credentials Overview (famille VC 2.0) + Press release VC 2.0 — W3C — 2025-05-15 — <https://www.w3.org/TR/vc-overview/>
168. SPIFFE Overview (pas de mention WIMSE/WIT ; convergence à vérifier) — SPIFFE/CNCF — 2026 — <https://spiffe.io/docs/latest/spiffe-about/overview/>
169. OCapN and Structural Authority in Agentic AI (analyse du modèle de Miller - source secondaire) — serefayar (Substack) — 2026 — <https://serefayar.substack.com/p/ocapn-and-structural-authority-in-agentic-ai>
170. awesome-ocap : Object Capabilities and Capability Security (curation, références primaires Miller/E-rights) — GitHub (dckc) — 2026 — <https://github.com/dckc/awesome-ocap>
171. Macaroons: Cookies with Contextual Caveats for Decentralized Authorization in the Cloud (NDSS 2014) — Google Research / Internet Society (NDSS) — 2014 — <https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/>
172. Macaroons (PDF archive, construction et caveats) — Google Research / NDSS — 2014 — <https://research.google.com/pubs/archive/41892.pdf>
173. Eclipse Biscuit (projects.eclipse.org proposal ; Incubating ; lead C. Delafargue ; Outscale + Clever Cloud) — Eclipse Foundation — 2024-07-22 — <https://projects.eclipse.org/proposals/eclipse-biscuit>
174. biscuit SPECIFICATIONS.md (Datalog v3.3 encodé 6, append-only, Ed25519/ECDSA, sealed, protobuf) — Eclipse Biscuit (GitHub) — 2025 — <https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md>
175. Specifications - Eclipse Biscuit (doc de référence ; null/arrays/maps depuis v3.3 ; pas de négation) — Eclipse Biscuit — 2025 — <https://doc.biscuitsec.org/reference/specifications.html>
176. Biscuit 3.3 (annonce de version d'origine) — Biscuit (biscuitsec.org) — 2024-11-27 — <https://www.biscuitsec.org/blog/biscuit-3-3/>
177. Public key confusion in third party block (GHSA-rgqv-mwc3-c78m) - CVE-2024-42350, CVSS v3.1 = 3.0, corrigé en 5.0.0 — Eclipse Biscuit (GitHub Security Advisory) — 2024-07-31 — <https://github.com/eclipse-biscuit/biscuit/security/advisories/GHSA-rgqv-mwc3-c78m>
178. Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization (PACMPL / OOPSLA 2024) — ACM (PACMPL) — 2024 — <https://dl.acm.org/doi/full/10.1145/3649835>
179. Cedar (Extended Version), arXiv:2403.04651 (Rust + Lean confirmés) — arXiv — 2024-03-07 — <https://arxiv.org/abs/2403.04651>
180. How We Built Cedar: A Verification-Guided Approach (FSE 2024, DOI 10.1145/3663529.3663854 ; 4 bugs soundness + 21 bugs) — ACM (FSE 2024) — 2024 — <https://dl.acm.org/doi/abs/10.1145/3663529.3663854>
181. Lean Powers Secure Software at AWS: Cedar's Journey — Lean Lang (lean-lang.org) — 2025 — <https://lean-lang.org/use-cases/cedar/>
182. Introducing Cedar Analysis: Open Source Tools for Verifying Authorization Policies (Symbolic Compiler, soundness+completeness) — AWS Open Source Blog — 2025-06-16 — <https://aws.amazon.com/blogs/opensource/introducing-cedar-analysis-open-source-tools-for-verifying-authorization-policies/>
183. cedar-policy/cedar releases (cedar-policy-symcc-v0.5.1 ; tag v4.11.0) — GitHub (cedar-policy) — 2026-06-01 — <https://github.com/cedar-policy/cedar/releases>
184. Cedar Joins CNCF as a Sandbox Project (15 déc. 2025 ; trajectoire Sandbox->Incubation->Graduated) — AWS Open Source Blog — 2025-12-15 — <https://aws.amazon.com/blogs/opensource/cedar-joins-cncf-as-a-sandbox-project/>
185. Amazon Verified Permissions now supports Cedar 4.5 (opérateur 'is') — AWS (What's New) — 2025-08-21 — <https://aws.amazon.com/about-aws/whats-new/2025/08/amazon-verified-permissions-cedar-4-5/>
186. Fully managed, Cedar authorization service - Amazon Verified Permissions — AWS — 2025 — <https://aws.amazon.com/verified-permissions/>
187. cedar-policy/cedar-for-agents (cedar-policy-mcp-schema-generator v0.6.0 ; cedar-analysis-mcp-server ; expérimental) — GitHub (cedar-policy) — 2026 — <https://github.com/cedar-policy/cedar-for-agents>
188. AIP: Agent Identity Protocol for Verifiable Delegation Across MCP and A2A (arXiv:2603.24775 ; préprint non revu, auteur unique S. Prakash) — arXiv — 2026-03-25 — <https://arxiv.org/abs/2603.24775>
189. Interpreting OCapN Principles in Cloud-Native Agentic AI Architectures (source secondaire) — serefayar (Substack) — 2026 — <https://serefayar.substack.com/p/interpreting-ocapn-principles-in-cloud-native-agentic-ai>
190. Accelerating the Adoption of Software and AI Agent Identity and Authorization (concept paper PDF, source primaire ; DRAFT February 2026 ; commentaires 5 fév - 2 avr 2026) — NIST NCCoE — 2026-02-05 — <https://www.nccoe.nist.gov/sites/default/files/2026-02/accelerating-the-adoption-of-software-and-ai-agent-identity-and-authorization-concept-paper.pdf>
191. AI Agent Standards Initiative (RFI clos 2026-03-09 ; recherche auth/identité d'agent) — NIST — 2026-04-20 — <https://www.nist.gov/artificial-intelligence/ai-agent-standards-initiative>
192. OWASP Reveals Updated 2025 Top 10 Risks for LLMs, Announces New Sponsorship Program (annonce officielle ; dates 17/19 nov. 2024 ; build PDF 20241114) — OWASP GenAI Security Project — 2024-11-17 — <https://genai.owasp.org/2024/11/17/owasp-reveals-2025-top-10-risks-for-llms-new-sponsorship-program/>
193. OWASP Top 10 for LLM Applications 2025 (resource page + liste LLM01-LLM10 verbatim) — OWASP GenAI Security Project — 2024-11-17 — <https://genai.owasp.org/llm-top-10/>
194. Agentic AI - Threats and Mitigations v1.0 (T1-T15 ; 'first in a series') — OWASP GenAI Security Project / Agentic Security Initiative — 2025-02-17 — <https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/>
195. OWASP GenAI Security Project Releases Top 10 Risks and Mitigations for Agentic AI Security (>100 experts ; Expert Review Board NIST/CE/Alan Turing) — OWASP GenAI Security Project — 2025-12-09 — <https://genai.owasp.org/2025/12/09/owasp-genai-security-project-releases-top-10-risks-and-mitigations-for-agentic-ai-security/>
196. OWASP Top 10 for Agentic Applications for 2026 (resource page ; 'globally peer-reviewed framework') — OWASP GenAI Security Project — 2025-12-09 — <https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/>
197. OWASP Top 10 for Agentic Application 2026 (liste ASI01-ASI10 verbatim) — Giskard — 2025-12 — <https://www.giskard.ai/knowledge/owasp-top-10-for-agentic-application-2026>
198. mitre-atlas/atlas-data CHANGELOG.md (v5.1.0 2025-11-06 ; 'Added a new tactic Lateral Movement') — MITRE — 2025-11-06 — <https://raw.githubusercontent.com/mitre-atlas/atlas-data/main/CHANGELOG.md>
199. Zenity & MITRE ATLAS Expand AI Agent Attack Coverage + MITRE ATLAS AI Security 2026 Update (vendeur, à recouper) — Zenity Labs (vendeur) — 2025-10 — <https://zenity.io/blog/current-events/zenity-labs-and-mitre-atlas-collaborate-to-advances-ai-agent-security-with-the-first-release-of>
200. MITRE ATT&CK and ATLAS Agentic Gap Analysis (draft ; 'intentionally excludes lateral movement' ; 6 catégories non couvertes) — Cloud Security Alliance — 2026-03-27 — <https://labs.cloudsecurityalliance.org/agentic/csa-research-note-atlas-agentic-gap-analysis-20260327/>
201. NIST AI 100-2 E2025 Adversarial Machine Learning (final ; DOI 10.6028/NIST.AI.100-2e2025) + actualité NIST — NIST — 2025-03-24 — <https://csrc.nist.gov/pubs/ai/100/2/e2025/final>
202. AI Risk Management Framework (AI RMF 1.0) (page éditeur NIST) — NIST — 2023-01 — <https://www.nist.gov/itl/ai-risk-management-framework>
203. NIST.AI.600-1 Generative AI Profile (PDF) — NIST — 2024-07-26 — <https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf>
204. Confused Deputy Attacks on Autonomous AI Agents (research note ; cadrage autorisation/architecture) — Cloud Security Alliance (AI Safety Initiative) — 2026-03-23 — <https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-confused-deputy-prompt-injection/>
205. Understanding prompt injections: a frontier security challenge (source primaire OpenAI ; date page à vérifier) — OpenAI — 2025 — <https://openai.com/index/prompt-injections/>
206. From LLM to agentic AI: prompt injection got worse (amplification multi-agent ; 'chain splicing' - secondaire) — Christian Schneider (chercheur sécurité ; secondaire) — 2025 — <https://christian-schneider.net/blog/prompt-injection-agentic-amplification/>
207. Agentic AI Threat Landscape: OWASP, MITRE ATLAS & MAESTRO (agrégateur ; cross-mapping non officiel, à recouper) — Tech Jacks Solutions (agrégateur) — 2025 — <https://techjacksolutions.com/ai/agentic-ai/secure/agent-threat-landscape/>
208. Semantic conventions for generative AI systems (badge Development) — OpenTelemetry — 2026 — <https://opentelemetry.io/docs/specs/semconv/gen-ai/>
209. Semantic conventions for generative AI spans (badge Development; attributs + sampling) — OpenTelemetry — 2026 — <https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/>
210. Semantic conventions for generative AI metrics (7 Histograms) — OpenTelemetry — 2026 — <https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-metrics/>
211. Semantic conventions for MCP (span names; version 2025-06-18) — OpenTelemetry — 2026 — <https://opentelemetry.io/docs/specs/semconv/gen-ai/mcp/>
212. Semantic Conventions for GenAI agent and framework spans — OpenTelemetry — 2026 — <https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-agent-spans/>
213. Semantic conventions for Generative AI events (evenements agreges) — OpenTelemetry — 2026 — <https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-events/>
214. Release v1.41.1 - open-telemetry/semantic-conventions — OpenTelemetry / GitHub — 2026-05-11 — <https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.1>
215. Release v1.41.0 - open-telemetry/semantic-conventions — OpenTelemetry / GitHub — 2026-04-28 — <https://github.com/open-telemetry/semantic-conventions/releases/tag/v1.41.0>
216. GitHub API releases - open-telemetry/semantic-conventions (tag_name + published_at) — OpenTelemetry / GitHub — 2026-05-11 — <https://api.github.com/repos/open-telemetry/semantic-conventions/releases>
217. GitHub - open-telemetry/semantic-conventions-genai (No releases published) — OpenTelemetry / GitHub — 2026 — <https://github.com/open-telemetry/semantic-conventions-genai>
218. PROV-DM: The PROV Data Model (W3C Recommendation 30 April 2013) — W3C — 2013-04-30 — <https://www.w3.org/TR/prov-dm/>
219. PROV-O: The PROV Ontology — W3C — 2013-04-30 — <https://www.w3.org/TR/prov-o/>
220. PROV-Overview (famille de documents PROV) — W3C — 2013-04-30 — <https://www.w3.org/TR/prov-overview/>
221. PROV-AGENT: Unified Provenance for Tracking AI Agent Interactions in Agentic Workflows — Souza et al. (arXiv) / IEEE e-Science 2025 — 2025-08-04 — <https://arxiv.org/abs/2508.02866>
222. GitHub API - OpenLineage/OpenLineage releases/latest (1.48.0, 2026-06-03) — OpenLineage / GitHub — 2026-06-03 — <https://api.github.com/repos/OpenLineage/OpenLineage/releases/latest>
223. OpenLineage - LFAI & Data (Graduation; Datakin 2021-05, gradue 2023-07) — Linux Foundation AI & Data — 2026 — <https://lfaidata.foundation/projects/openlineage/>
224. How OpenLineage takes inspiration from OpenTelemetry — OpenLineage — 2023 — <https://openlineage.github.io/blog/openlineage-takes-inspiration-from-opentelemetry/>
225. OpenLineage for a unified lineage view across structured and unstructured data to enable explainable AI (date a verifier - 403) — IBM — 2026 — <https://www.ibm.com/new/announcements/openlineage-for-a-unified-lineage-view-across-structured-and-unstructured-data-to-enable-explainable-ai>
226. Content Credentials: C2PA Technical Specification 2.4 (version history 5.3.1: 2.4 - April 2026) — C2PA — 2026-04 — <https://spec.c2pa.org/specifications/specifications/2.4/specs/C2PA_Specification.html>
227. Article 50: Transparency Obligations (texte consolide; application 2 aout 2026) — artificialintelligenceact.eu (Future of Life Institute) — 2026 — <https://artificialintelligenceact.eu/article/50/>
228. Artificial Intelligence: Council and Parliament agree to simplify and streamline rules (Conseil UE, 7 mai 2026; Omnibus) — Conseil de l'Union europeenne (Consilium) — 2026-05-07 — <https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/>
229. EU AI Act Omnibus Deal Reached: Postponed Deadlines, Watermarking Compromise (delai 4 mois -> 2 dec 2026) — William Fry — 2026 — <https://www.williamfry.com/knowledge/eu-ai-act-omnibus-deal-reached-postponed-deadlines-watermarking-compromise-and-the-nudificiation-prohibition/>
230. EU AI Act Update: Timeline Relief, Targeted Simplification, and New Prohibitions — Covington & Burling (Inside Privacy) — 2026-05 — <https://www.insideprivacy.com/artificial-intelligence/eu-ai-act-update-timeline-relief-targeted-simplification-and-new-prohibitions/>
231. AI Act - Shaping Europe's digital future (page officielle) — Commission europeenne (DG CNECT) — 2026 — <https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai>
232. Article 113: Entry into Force and Application (texte du Reglement 2024/1689) — Future of Life Institute — 2026 — <https://artificialintelligenceact.eu/article/113/>
233. Article 99: Penalties (texte du Reglement 2024/1689) — Future of Life Institute — 2026 — <https://artificialintelligenceact.eu/article/99/>
234. Article 51: Classification of GPAI Models with Systemic Risk (seuil 10^25 FLOP) — Future of Life Institute — 2026 — <https://artificialintelligenceact.eu/article/51/>
235. AI Act: deal on simplification measures, ban on 'nudifier' apps — Parlement europeen — 2026-05 — <https://www.europarl.europa.eu/news/en/press-room/20260427IPR42011/ai-act-deal-on-simplification-measures-ban-on-nudifier-apps>
236. Digital Omnibus on AI - Legislative Train Schedule — Parlement europeen — 2026-05 — <https://www.europarl.europa.eu/legislative-train/package-digital-package/file-digital-omnibus-on-ai>
237. Entry into application of DORA regulation on 17 January 2025 — CSSF (Luxembourg) — 2025-01 — <https://www.cssf.lu/en/2025/01/entry-in-application-of-dora-regulation-on-17-january-2025/>
238. Regulation (EU) 2022/2554 (DORA) - texte consolide — EUR-Lex (Office des publications de l'UE) — 2022-12 — <https://eur-lex.europa.eu/eli/reg/2022/2554/oj/eng>
239. Commission Implementing Regulation (EU) 2024/2956 - register of information (ITS, art. 28(3) DORA) — EUR-Lex (Office des publications de l'UE) — 2024-12 — <https://eur-lex.europa.eu/eli/reg_impl/2024/2956/oj/eng>
240. Commission Delegated Regulation (EU) 2025/1190 - TLPT (RTS, art. 26 DORA) — EUR-Lex (Office des publications de l'UE) — 2025-06 — <https://eur-lex.europa.eu/eli/reg_del/2025/1190/oj/eng>
241. Commission Delegated Regulation (EU) 2025/532 - subcontracting ICT services (RTS, art. 30(5) DORA) — EUR-Lex (Office des publications de l'UE) — 2025-07 — <https://eur-lex.europa.eu/eli/reg_del/2025/532/oj/eng>
242. Annex III: High-Risk AI Systems Referred to in Article 6(2) — Future of Life Institute — 2026 — <https://artificialintelligenceact.eu/annex/3/>
243. The General-Purpose AI Code of Practice — Commission europeenne (DG CNECT) — 2025 — <https://digital-strategy.ec.europa.eu/en/policies/contents-code-gpai>
244. Article 14: Human Oversight (texte AI Act) — Future of Life Institute — 2026 — <https://artificialintelligenceact.eu/article/14/>
245. Article 6: Classification Rules for High-Risk AI Systems — Future of Life Institute — 2026 — <https://artificialintelligenceact.eu/article/6/>
246. EU AI Act Omnibus Agreement - Postponed High-Risk Deadlines and Other Key Changes — Gibson Dunn — 2026 — <https://www.gibsondunn.com/eu-ai-act-omnibus-agreement-postponed-high-risk-deadlines-and-other-key-changes/>
247. Guideline E-23 - Model Risk Management (2027) — BSIF/OSFI — 2025-09-11 — <https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027>
248. Guideline E-23 - Model Risk Management (2027) - Letter — BSIF/OSFI — 2025-09-11 — <https://www.osfi-bsif.gc.ca/en/guidance/guidance-library/guideline-e-23-model-risk-management-2027-letter>
249. OSFI updates and expands scope of Guideline E-23 for AI governance — Torys LLP — 2025-10 — <https://www.torys.com/en/our-latest-thinking/publications/2025/10/osfi-updates-and-expands-scope-of-guideline-e-23>
250. OSFI Releases Final Guideline E-23 for Model Risk Management and AI Use by FRFIs — Blakes — 2025-09 — <https://www.blakes.com/insights/osfi-releases-final-guideline-e-23-for-model-risk-management-and-ai-use-by-frfis/>
251. Lignes directrices en matiere d'intelligence artificielle et de gestion du risque lie aux tiers (communique AMF) — Autorite des marches financiers (AMF) — 2026-04-07 — <https://lautorite.qc.ca/grand-public/salle-de-presse/actualites/fiche-dactualite/lignes-directrices-en-matiere-dintelligence-artificielle-et-de-gestion-du-risque-lie-aux-tiers>
252. Ligne directrice sur l'utilisation de l'intelligence artificielle (page officielle AMF) — AMF — 2026-04 — <https://lautorite.qc.ca/en/professionals/insurers/guidelines/use-of-models/guideline-for-the-use-of-artificial-intelligence>
253. AMF's AI guideline is now official: What financial institutions need to know — Norton Rose Fulbright — 2026-04 — <https://www.nortonrosefulbright.com/en/knowledge/publications/27e0daab/amf-s-ai-guideline-is-now-official-what-financial-institutions-need-to-know>
254. L'AMF propose un encadrement pour l'usage de l'IA dans les services financiers (registre + cote de risque) — Norton Rose Fulbright — 2025-08 — <https://www.nortonrosefulbright.com/fr-ca/centre-du-savoir/publications/129d21cb/lamf-propose-un-encadrement-pour-lusage-de-lia-dans-les-services-financiers>
255. Third-Party Risk Management Guideline (page officielle AMF; effet 1er avril 2027) — AMF — 2026 — <https://lautorite.qc.ca/en/professionals/insurers/guidelines/operational-risk/third-party-risk-management-guideline>
256. AMF - Third-Party Risk Management Guideline - avis de consultation (9 oct.-19 dec. 2025) — AMF — 2025-10-09 — <https://lautorite.qc.ca/fileadmin/lautorite/consultations/lignes-directrices/2025-12-19-fin/2025oct09-LD-Tiers-avis-cons-en.pdf>
257. C-27 (44-1) - LEGISinfo (Consideration in committee / Not completed; 44-1 close 6 janvier 2025) — Parlement du Canada (LEGISinfo) — 2025-01 — <https://www.parl.ca/legisinfo/en/bill/44-1/c-27>
258. Prorogation's Digital Impact: Canada's Digital Bills Set to Die on the Order Paper — Fasken — 2025-01 — <https://www.fasken.com/en/knowledge/2025/01/prorogations-digital-impact>
259. What's Next After AIDA? (Solomon: pas de reintroduction d'AIDA telle quelle) — Schwartz Reisman Institute (Universite de Toronto) — 2025 — <https://srinstitute.utoronto.ca/news/whats-next-for-aida>
260. Liberals won't reintroduce old AI law but will address copyright issues — The Logic — 2025 — <https://thelogic.co/news/exclusive/canada-ai-regulation-copyright-evan-solomon/>
261. Prime Minister Carney launches AI for All: Canada's new national artificial intelligence strategy — Cabinet du Premier ministre du Canada — 2026-06-04 — <https://www.pm.gc.ca/en/news/news-releases/2026/06/04/prime-minister-carney-launches-ai-all-canadas-new-national-artificial>
262. Canada launches AI for All national artificial intelligence strategy — Gowling WLG — 2026-06 — <https://gowlingwlg.com/en-ca/insights-resources/articles/2026/canada-launches-ai-for-all-national-artificial-intelligence-strategy>
263. Canada still has no meaningful AI regulation — Canadian Centre for Policy Alternatives (CCPA) — 2026 — <https://www.policyalternatives.ca/news-research/canada-still-has-no-meaningful-ai-regulation/>
264. Canada's 2026 privacy priorities: data sovereignty, open banking and AI — Osler, Hoskin & Harcourt LLP — 2026 — <https://www.osler.com/en/insights/reports/2025-legal-outlook/canadas-2026-privacy-priorities-data-sovereignty-open-banking-and-ai/>
265. A turning point for AI in Canada in 2026 — Borden Ladner Gervais (BLG) — 2026-03 — <https://www.blg.com/en/insights/2026/03/a-turning-point-for-ai-in-canada-in-2026>
266. European Commission adopts revised DORA Subcontracting RTS - a partial retreat on monitoring sub-contractors? — Herbert Smith Freehills Kramer — 2025 — <https://www.hsfkramer.com/notes/tmt/2025-posts/european-commission-adopts-revised-dora-subcontracting-rts-a-partial-retreat-on-monitoring-sub-contractors>
267. Implementing Technical Standards to establish the templates for the register of information (EBA) — Autorite bancaire europeenne (EBA) — 2024 — <https://www.eba.europa.eu/activities/single-rulebook/regulatory-activities/operational-resilience/implementing-technical-standards-establish-templates-register-information>
268. The 2025 AI Agent Index: Documenting Technical and Safety Features of Deployed Agentic AI Systems (arXiv 2602.17753, v1 2026-02-19 / v2 2026-05-06, FAccT '26) — Staufer, Feng, Wei, Bailey, Duan, Yang, Ozisik, Casper, Kolt — arXiv / ACM FAccT '26 — 2026-02-19 — <https://arxiv.org/abs/2602.17753>
269. Further Details — 2025 AI Agent Index (échelle L1-L5, 30 systèmes / 6 catégories, instantané 31 déc. 2025) — MIT AI Agent Index — 2026 — <https://aiagentindex.mit.edu/2025/further-details/>
270. Agentic automation vs RPA: what actually changes for enterprise IT — Mindflow (éditeur — marketing) — 2025 — <https://mindflow.io/blog/agentic-automation-vs-rpa-what-actually-changes-for-enterprise-it>
271. What are Agentic Workflows? The 2026 Enterprise Guide — Automation Anywhere (éditeur — marketing) — 2026 — <https://www.automationanywhere.com/rpa/agentic-workflows>
272. From Governance Norms to Enforceable Controls: A Layered Translation Method for Runtime Guardrails in Agentic AI — Christopher Koch — arXiv (preprint) — 2026-04-06 — <https://arxiv.org/abs/2604.05229>
273. New Report: Challenges to the Monitoring of Deployed AI Systems (communiqué) — NIST — 2026-03-09 — <https://www.nist.gov/news-events/news/2026/03/new-report-challenges-monitoring-deployed-ai-systems>
274. Challenges to the Monitoring of Deployed AI Systems (NIST AI 800-4, DOI 10.6028/NIST.AI.800-4, PDF — SIX catégories) — NIST / CAISI (Rao, Keller, Kalra, Steed, Kwegyir-Aggrey, Klyman, Staheli, Bergman) — 2026-03 — <https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.800-4.pdf>
275. OWASP Top 10 for Agentic Applications — The Benchmark for Agentic Security (ASI01-ASI10 ; T&M 1.1) — OWASP GenAI Security Project — 2025-12-09 — <https://genai.owasp.org/2025/12/09/owasp-top-10-for-agentic-applications-the-benchmark-for-agentic-security-in-the-age-of-autonomous-ai/>
276. NIST AI Risk Management Framework: Agentic Profile (draft, Tier 1-4) — Cloud Security Alliance — Lab Space — 2026-03-27 — <https://labs.cloudsecurityalliance.org/agentic/agentic-nist-ai-rmf-profile-v1/>
277. Agentic AI Governance: NIST Standards for Autonomous Systems (white paper, cite 'IR 8596') — Cloud Security Alliance — 2026-03 — <https://labs.cloudsecurityalliance.org/wp-content/uploads/2026/03/governance-nist-ai-agent-standards-agentic-governance-v1-csa-styled.pdf>
278. CSA Research Note: NIST AI Agent Standards Initiative (2026) — Cloud Security Alliance — 2026 — <https://labs.cloudsecurityalliance.org/research/csa-research-note-nist-ai-agent-standards-initiative-2026040/>
279. IEEE-USA comments — NIST RFI on Agentic AI (9 March 2026, cite Peter Cihon, CAISI) — IEEE-USA — 2026-03-09 — <https://ieeeusa.org/assets/public-policy/policy-log/2026/IEEE-USA-NIST-RFI-Agentic-AI-030926.pdf>
280. NIST Computer Security Resource Center — publications (piste de vérification IR 8596 / Cyber AI Profile) — NIST CSRC — 2026 — <https://csrc.nist.gov/publications>
281. Establishing Best Practices for Building Rigorous Agentic Benchmarks (ABC ; audit 7/10, 7/10, 80 % ; KernelBench +31 %) — Zhu, Jin, Liang et al. (25 auteurs) — arXiv — 2025-07-03 — <https://arxiv.org/abs/2507.02825>
282. Establishing Best Practices for Building Rigorous Agentic Benchmarks (HTML plein texte v1 ; tau-bench-airline 38 %) — arXiv — 2025-07 — <https://arxiv.org/html/2507.02825v1>
283. A Survey on Evaluation of LLM-based Agents (caractérisation tau-bench ; secondaire) — arXiv (revue — secondaire) — 2025-03 — <https://arxiv.org/html/2503.16416v2>
284. Towards a Science of AI Agent Reliability (4 dimensions, 12 métriques ; normes nominatives à vérifier) — Rabanser, Kapoor, Kirgis, Liu, Utpala, Narayanan — Princeton HAL Lab — 2026-02-18 — <https://arxiv.org/abs/2602.16666>
285. Beyond Accuracy: A Multi-Dimensional Framework for Evaluating Enterprise Agentic AI Systems (CLEAR) — Mehta — arXiv (preprint, auteur indépendant) — 2025-11-18 — <https://arxiv.org/html/2511.14136v1>
286. Replayable Financial Agents: A Determinism-Faithfulness Assurance Harness for Tool-Using LLM Agents (DFAH) — Raffi Khatchadourian — arXiv (preprint) — 2026-01-17 — <https://arxiv.org/abs/2601.15322>
287. Lost in Simulation: LLM-Simulated Users are Unreliable Proxies for Human Users in Agentic Evaluations (intitulé à reconfirmer) — arXiv (preprint — prudence) — 2026-01 — <https://arxiv.org/pdf/2601.17087>
288. IBM z/OS Connect — What is MCP? (topic connect-what-is-mcp ; 403 au fetch, confirmé via index) — IBM Documentation — 2026 — <https://www.ibm.com/docs/en/zos-connect/3.0.0?topic=connect-what-is-mcp>
289. What's new in IBM z/OS Connect OpenAPI 3 change history — IBM Documentation — 2026 — <https://www.ibm.com/docs/en/zos-connect/zos-connect/3.0?topic=whats-new-in-zos-connect-openapi-3>
290. Empowering IBM Z Users with agentic AI (annonce) — IBM — 2026 — <https://www.ibm.com/new/announcements/empowering-mainframe-users-with-agentic-ai>
291. How it works: the CICS MCP server (CICS TS 6.x ; 403 au fetch, confirmé via index) — IBM Documentation — 2026 — <https://www.ibm.com/docs/en/cics-ts/6.x?topic=ai-how-it-works-cics-mcp-server>
292. IBM CICS Transaction Server agents for Z — Helm Chart (cics-agent) — IBM (GitHub) — 2026 — <https://github.com/IBM/z-ai-agents/blob/main/agent-helm-charts/cics-agent/README.md>
293. Beta Of MCP Server Opens Up IBM i For Agentic AI (cite verbatim « intent to deliver 500 tools in 2026 ») — IT Jungle (presse spécialisée) — 2025-10-27 — <https://www.itjungle.com/2025/10/27/beta-of-mcp-server-opens-up-ibm-i-for-agentic-ai/>
294. IBM/ibmi-mcp-server (dépôt GitHub, README + LICENSE Apache 2.0 ; badge 'Stable' en juin 2026) — IBM (GitHub) — 2026 — <https://github.com/IBM/ibmi-mcp-server>
295. Digital Operational Resilience Act (DORA) — Règlement (UE) 2022/2554, application 17 janv. 2025 — EIOPA (autorité européenne de surveillance) — 2025 — <https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en>
296. DORA Explained: Scope, Requirements, Enforcement, and Next Deadlines (n° ITS registre à confirmer) — QuoIntelligence (secondaire) — 2025-02 — <https://quointelligence.eu/2025/02/dora-explained-scope-requirements-enforcement-deadlines/>
297. EUR-Lex (piste de vérification du numéro d'ITS du registre d'information DORA, art. 28(9)) — EUR-Lex (UE) — 2025 — <https://eur-lex.europa.eu/>
298. Treasury Releases Two New Resources to Guide AI Use in the Financial Sector (press release sb0401 ; FS AI RMF + AI Lexicon) — U.S. Department of the Treasury (primaire) — 2026-02-19 — <https://home.treasury.gov/news/press-releases/sb0401>
299. U.S. Treasury Department Publishes AI Guidance for Financial Services — ZwillGen (analyse juridique) — 2026-02 — <https://www.zwillgen.com/artificial-intelligence/us-treasury-department-publishes-ai-guidance-financial-services/>
300. Financial Services AI Risk Management Framework: Operationalizing The 230 Control Objectives (chiffre 230 à confirmer sur primaire) — Mondaq (analyse) — 2026 — <https://www.mondaq.com/unitedstates/fintech/1751798/>
301. Agentic AI Governance for Financial Services: The CISO's Readiness Checklist (SR 11-7 / FFIEC sont primaires Fed/FFIEC) — ABT (secondaire) — 2026 — <https://www.myabt.com/blog/agentic-ai-governance-financial-services>
302. Revolutionizing AI Agent management with IBM watsonx Orchestrate new Observability and Governance capabilities (403 au fetch, contenu via recherche) — IBM (annonce) — 2026-05 — <https://www.ibm.com/new/announcements/revolutionizing-ai-agent-management-with-ibm-watsonx-orchestrate-new-observability-and-governance-capabilities>
303. The 2026 AI Index Report (66,3 % OSWorld ; ~423 pages ; volet 89 %/coût à confirmer dans le corps) — Stanford HAI (primaire) — 2026-04 — <https://hai.stanford.edu/ai-index/2026-ai-index-report>
304. Stanford AI Index 2026: AI Agents Hit 66% Success Rate - But 89% Never Reach Production — Beri (secondaire) — 2026 — <https://www.beri.net/article/stanford-ai-index-2026-agents-66-percent-success>
305. 79% of Enterprises Already Run AI Agents (cite PwC/Deloitte ; primaires à confirmer) — Ekfrazo (secondaire) — 2025 — <https://ekfrazo.com/resources/blogs/agentic-ai-in-enterprise-operations/>
