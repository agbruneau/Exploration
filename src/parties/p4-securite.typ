#import "../../lib/canon.typ": *

= PARTIE IV — Sécurité, identité et autorité déléguée

== Ch. 11 — Identité des charges et des agents

*Insight-clé.* En date de juin 2026, l'identité de charge agentique repose sur un socle déterministe mûr — SPIFFE/SPIRE, `Graduated` à la CNCF — mais sur une couche protocolaire IETF encore entièrement pré-RFC : aucun document du groupe WIMSE n'a atteint le statut RFC, et l'identité spécifiquement _agentique_ n'existe qu'en _drafts_ individuels non adoptés. La thèse architecturale qui en découle : l'industrie *compose* des briques éprouvées (#angl[OAuth Token Exchange], SPIFFE, attestation) plutôt qu'elle n'invente un protocole d'agent dédié. Pour le canon de cette monographie, ce chapitre alimente directement la dimension #dautorite de l'#optau (cf. Ch. 5) : c'est l'identité vérifiable d'une charge — et, par chaînage, d'un agent agissant pour le compte d'un tiers — qui rend calculable le produit _autorité appelant × autorité requise cible_ dont dépend la #decision.

Trois piliers cohabitent à des maturités hétérogènes, et leur écart de maturité est lui-même un fait structurant qu'il ne faut pas lisser : (1) le cadre *SPIFFE/SPIRE* (CNCF, gradué), stabilisé et largement déployé ; (2) la pile *WIMSE/OAuth* (IETF), en standardisation active mais sans RFC ; (3) la famille *DID/VC* du W3C, partiellement recommandée (VC 2.0) et partiellement en _Candidate Recommendation_ (DID v1.1). Aucun de ces trois ne fournit, à lui seul, une primitive d'« identité d'agent » : celle-ci se reconstruit par superposition.

=== 1. SPIFFE/SPIRE — le socle gradué

*SPIFFE et SPIRE sont le seul élément de la pile à offrir un statut de maturité non contestable : projets CNCF au niveau `Graduated`, audités, déployés en production à grande échelle.* `confirmé` La trajectoire est confirmée verbatim sur les pages projet CNCF : acceptés le 29 mars 2018, passés `incubating` le 22 juin 2020, puis `graduated`.#footnote[SPIRE | CNCF (page projet, dates de maturité) — CNCF — 2026 — https://www.cncf.io/projects/spire/]#footnote[SPIFFE | CNCF (page projet, dates de maturité) — CNCF — 2026 — https://www.cncf.io/projects/spiffe/]

Une divergence d'un jour, confirmée telle quelle par les deux pages projet, doit être citée sans la fusionner : la bascule `graduated` est datée du *22 août 2022 pour SPIRE* et du *23 août 2022 pour SPIFFE*, tandis que l'*annonce conjointe* officielle — assortie d'un audit tiers Cure53 (en sus de la revue TAG Security de début 2020) — porte la date du *20 septembre 2022*.#footnote[SPIFFE and SPIRE Projects Graduate from CNCF Incubator (annonce ; Cure53 ; adopteurs) — CNCF — 2022-09-20 — https://www.cncf.io/announcements/2022/09/20/spiffe-and-spire-projects-graduate-from-cloud-native-computing-foundation-incubator/] L'annonce liste des adopteurs de production : Bloomberg, ByteDance, Pinterest, Twilio, Anthem, GitHub, Netflix, Niantic, Uber, Carelon Digital Platforms, Indeed.com, HPE/Cray.

La dernière version stable de SPIRE est *v1.15.1*, publiée le *28 mai 2026* : correctif de sécurité sur le plugin d'attestation de nœud serveur `azure_imds` (validation de certificat impropre permettant la forge de documents attestés). Le _backport_ `v1.14.7` paraît le même jour ; `v1.15.0` (fonctionnalités) le 19 mai 2026.#footnote[spiffe/spire Releases (GitHub, v1.15.1) — SPIFFE / GitHub — 2026-05-28 — https://github.com/spiffe/spire/releases] `confirmé`

==== Spécifications normatives

Les contraintes sur les identifiants et documents d'identité SPIFFE sont confirmées au mot et fixent les invariants que toute couche supérieure hérite. Un *SPIFFE ID* est un URI RFC 3986 de schéma `spiffe://`, composé d'un _trust domain_ et d'un chemin ; il *DOIT* porter le schéma `spiffe`, un _trust domain_ non vide, et *NE DOIT PAS* inclure de composante _query_ ou _fragment_ ; les implémentations *DOIVENT* supporter jusqu'à 2048 octets (et *NE DEVRAIENT PAS* générer au-delà) ; _trust domain_ ≤ 255 octets.#footnote[SPIFFE-ID standard (spiffe/spiffe GitHub) — SPIFFE — 2026 — https://github.com/spiffe/spiffe/blob/main/standards/SPIFFE-ID.md] Le *X.509-SVID* encode le SPIFFE ID comme URI dans le SAN — « _An X.509 SVID MUST contain exactly one URI SAN_ » — avec feuilles `cA=false`, `digitalSignature` obligatoire, `keyCertSign`/`cRLSign` interdits.#footnote[SPIFFE | X509-SVID specification — SPIFFE — 2026 — https://spiffe.io/docs/latest/spiffe-specs/x509-svid/] Le *JWT-SVID* place le SPIFFE ID dans `sub` ; `aud` est obligatoire et validée ; `alg` est restreint aux familles asymétriques RFC 7518 §3.3/3.4/3.5 (RS\*, ES\*, PS\*), excluant de facto `none` et HS\*.#footnote[SPIFFE | JWT-SVID specification — SPIFFE — 2026 — https://spiffe.io/docs/latest/spiffe-specs/jwt-svid/] `confirmé`

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

SPIRE réalise l'attestation en deux phases — _node attestation_ puis _workload attestation_ ; la fédération inter-domaines relève d'une *spécification SPIFFE Federation distincte*, non détaillée sur la page « SPIRE Concepts ».#footnote[SPIFFE | SPIRE Concepts (node/workload attestation) + SPIFFE Federation specification — SPIFFE — 2026 — https://spiffe.io/docs/latest/spire-about/spire-concepts/] `confirmé`

==== Écosystème commercial

Le socle ouvert se double d'une offre commerciale en consolidation, à traiter comme positionnement industriel. HashiCorp Vault Enterprise 1.21 ajoute l'authentification SPIFFE native (émission de X.509-SVID), et Vault Enterprise 2.0 un moteur de secrets SPIFFE émettant des JWT-SVID — billet HashiCorp daté du *30 avril 2026*.#footnote[SPIFFE: Securing the identity of agentic AI and non-human actors (HashiCorp blog) — HashiCorp — 2026-04-30 — https://www.hashicorp.com/en/blog/spiffe-securing-the-identity-of-agentic-ai-and-non-human-actors] Red Hat propose le *Zero Trust Workload Identity Manager*, opérateur OpenShift en _tech preview_ basé sur SPIFFE/SPIRE (page publiée le 8 octobre 2025).#footnote[What are SPIFFE and SPIRE? (Red Hat ; Zero Trust Workload Identity Manager tech preview) — Red Hat — 2025-10-08 — https://www.redhat.com/en/topics/security/spiffe-and-spire] *Defakto* (anciennement SPIRL) a levé une Série B de *30,75 M\$* le 21 octobre 2025, menée par XYZ Venture Capital ; cofondateurs Eli Nesterov (CTO) et Danny Oliveri (CEO).#footnote[Defakto Secures \$30.75M Series B (Defakto blog) — Defakto — 2025-10-21 — https://www.defakto.security/blog/defakto-secures-30-75-m-series-b-to-set-a-new-standard-in-non-human-identity-security/] `probable`

Deux corrections d'état de l'art s'imposent, conservées sans lissage. D'abord, la statistique « > 1 milliard de _credentials_ SPIFFE par jour » couramment prêtée à Uber *n'est pas présente* dans le blog d'ingénierie primaire (9 novembre 2023) ; ce dernier confirme en revanche verbatim « _4 500 services_ » et « _over 1/4 million nodes_ » (> 250 000 nœuds, quatre nuages) via SPIRE. La portion « 1 milliard/jour » passe donc à *`à vérifier`* (piste : transcript de la conférence CNCF « _Changing the SPIFFE ID of Every SPIRE-Enabled Workload at Uber_ » ou _case studies_ spiffe.io).#footnote[Our Journey Adopting SPIFFE/SPIRE at Scale (Uber Engineering blog) + SPIRE Case Studies (spiffe.io) — Uber Engineering — 2023-11-09 — https://www.uber.com/en-IE/blog/our-journey-adopting-spiffe-spire/] Ensuite, le billet de Série B Defakto ne cite *pas* Evan Gilman parmi les cofondateurs (il est co-auteur du livre O'Reilly SPIFFE/SPIRE, non désigné cofondateur ici) ; l'année de fondation « 2022 » et le total cumulé « ~49 M\$ levés » n'y figurent pas non plus → *`à vérifier`*.

Note épistémique : le positionnement de SPIFFE comme « standard de facto de l'identité de charge, pilier de l'identité non-humaine (NHI) et fondation de l'identité des agents IA » est un *cadrage convergent d'éditeurs* (HashiCorp, Palo Alto Networks), à traiter comme positionnement industriel, *non* comme énoncé normatif d'un organisme de normalisation.#footnote[What is SPIFFE? Universal Workload Identity Framework Guide (Palo Alto Networks) — Palo Alto Networks — 2025 — https://www.paloaltonetworks.com/cyberpedia/what-is-spiffe] `probable`

=== 2. WIMSE (IETF) — la couche protocolaire, sans RFC

*Au 8 juin 2026, aucun document WIMSE n'a atteint le statut RFC : la couche protocolaire de l'identité de charge est en standardisation active mais reste entièrement à l'état d'_Internet-Draft_.* `confirmé` Le groupe *WIMSE* (Workload Identity in Multi-System Environments) opère sous la charte `charter-ietf-wimse-01` (statut *Approuvé*), chaires Justin Richer et Pieter Kasselman, _Area Director_ Charles Eckel.#footnote[Charter for WIMSE (IETF Datatracker) — IETF — 2026-03-18 — https://datatracker.ietf.org/doc/charter-ietf-wimse/] La charte mentionne explicitement la collaboration avec la CNCF « _particularly with regard to the SPIFFE/SPIRE project_ » et combine OAuth, JWT et SPIFFE.

Une divergence inter-blocs subsiste sur l'aire IETF de rattachement et reste *`à vérifier`* : un bloc situe WIMSE en _Security Area_ (présumée, non confirmée verbatim) ; un second affirme l'aire *ART* (Applications and Real-Time) avec confirmation sur la page _About_ du groupe — lecture plus directe, donc plus probante, à recouper néanmoins via le champ _Area_ de `datatracker.ietf.org/group/wimse/about/`.#footnote[Workload Identity in Multi System Environments (wimse) — WG About / Charter / Milestones — IETF — 2026-06 — https://datatracker.ietf.org/wg/wimse/about/]

Les sept _drafts_ WG sont tous au stade _Internet-Draft_, le plus avancé (`workload-identity-practices-04`, 28 p., 10 avril 2026, _shepherd_ J. Richer) en état « _WG Consensus: Waiting for Write-Up_ ».#footnote[WIMSE WG documents (jeu de drafts actifs) (IETF Datatracker) — IETF — 2026 — https://datatracker.ietf.org/group/wimse/documents/] La pile crédentielle se répartit ainsi :

#figure(
  table(
    columns: 5,
    table.header[*Draft WG*][*Rév. / date*][*Pages*][*État*][*Rôle*],
    [`wimse-arch`], [-07 / 2026-03-02], [27], [WG Document], [Architecture de référence ; §3.3.9 « AI and ML-Based Intermediaries » — agents = charges déléguées, _re-bind_ du contexte],
    [`wimse-workload-creds`], [-01 / 2026-05-05], [24], [WG Document], [Définit *WIT* (JWS/JWT) et *WIC* (X.509, SAN URI) ; remplace `s2s-protocol`],
    [`wimse-wpt`], [-01 / 2026-03-02], [19], [WG Document], [_Workload Proof Token_ : preuve de possession liée à la requête HTTP],
    [`wimse-http-signature`], [-03 / 2026-04-07], [19], [WG Document], [Auth. via HTTP Message Signatures (RFC 9421) ; s'appuie sur le WIT],
    [`wimse-identifier`], [-02 / 2026-03-02], [12], [WG Document], [Identifiant = URI absolu (authority = _trust domain_) ; schémas `wimse://` et `spiffe://`],
    [`wimse-mutual-tls`], [-01 / 2026-05-05], [8], [WG Document], [Auth. de charge par mTLS],
    [`wimse-workload-identity-practices`], [-04 / 2026-04-10], [28], [*Waiting for Write-Up*], [Pratiques industrielles ; _draft_ le plus avancé],
  ),
  caption: [Drafts WG WIMSE — états au 8 juin 2026 (aucune RFC).],
) <tab-wimse>

Le *WIT (Workload Identity Token)* est un JWS/JWT à en-tête JOSE `typ=wit+jwt` ; claims requis `sub` (URI), `exp` (rafraîchi à l'ordre des heures), `cnf` (jwk de la clé publique) ; optionnels `iss`, `jti` ; *preuve de possession obligatoire* à la présentation.#footnote[draft-ietf-wimse-workload-creds-01 (texte HTML, claims WIT) — IETF — 2026-05-05 — https://www.ietf.org/archive/id/draft-ietf-wimse-workload-creds-01.html] `confirmé`

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

Le _draft_ `s2s-protocol` (prédécesseur) est *mort* (`Dead/Replaced`, dernière rév. -07 du 2025-10-16), éclaté en quatre successeurs (`workload-creds`, `http-signature`, `mutual-tls`, `wpt`) — *à ne pas citer comme normatif*.#footnote[draft-ietf-wimse-s2s-protocol (Dead/Replaced) (IETF Datatracker) — IETF — 2025-10-16 — https://datatracker.ietf.org/doc/draft-ietf-wimse-s2s-protocol/] `confirmé` Outre les sept _drafts_ WG, la page Documents recense sept _drafts_ individuels liés (versions -00 à -02, 2026-01-05 à 2026-06-07), dont `draft-ni-wimse-ai-agent-identity-02` (2026-02-28) ; ces _drafts_ *n'ont aucun statut normatif*. `confirmé`

Une mise en garde épistémique à fort enjeu encadre toute citation de ces documents. Pour la quasi-totalité des _drafts_ WG (WIMSE comme OAuth), le champ métadonnée Datatracker « Intended RFC status » affiche `(None)` alors que l'en-tête _boilerplate_ du document indique « Standards Track ». « Standards Track » est donc l'*intention déclarée par les auteurs* (en-tête), *non* un statut IESG assigné (métadonnée) : il ne faut pas le présenter comme statut sanctionné. Seul `identity-chaining-14`, parvenu au stade IESG, porte une métadonnée « Proposed Standard » assignée.

=== 3. Chaînage OAuth — la primitive de délégation

*La délégation transverse aux domaines de confiance — substrat indispensable d'un agent agissant pour le compte d'un utilisateur ou d'un autre service — repose sur OAuth, et c'est sur ce front que la maturité normative est la plus avancée : RFC 8693 publiée, `identity-chaining` approuvé par l'IESG.* La primitive socle est RFC 8693 (OAuth 2.0 Token Exchange) — `subject_token`/`actor_token`, impersonation _et_ délégation, publiée en janvier 2020.#footnote[RFC 8693 - OAuth 2.0 Token Exchange — IETF — 2020-01 — https://datatracker.ietf.org/doc/rfc8693/]

#figure(
  table(
    columns: 4,
    table.header[*Document*][*État (8 juin 2026)*][*Statut visé*][*Détail*],
    [`oauth-identity-chaining`], [-14 / 2026-06-02 ; IESG `Approved-announcement::Revised I-D Needed` (2026-06-04)], [Proposed Standard (métadonnée assignée)], [Le plus mature ; ballots « No Objection » 2-3 juin 2026 ; combine RFC 8693 + RFC 7523],
    [`oauth-transaction-tokens`], [-08 / 2026-03-02 ; « In WG Last Call »], [Standards Track (en-tête)], [Jalon IESG visé déc. 2026 ; propage identité + contexte d'autorisation dans un domaine de confiance],
    [`oauth-identity-assertion-authz-grant`], [-04 / 2026-05-21 ; actif], [None (métadonnée) / S.T. (en-tête)], [Base du _Cross-App Access_ (XAA) ; ID-JAG],
    [`oauth-attestation-based-client-auth`], [-09 / 2026-05-26], [None / S.T. (en-tête)], [Attestation de client liée à une clé],
    [`oauth-spiffe-client-auth`], [-01 / 2026-03-02], [None / S.T. (en-tête)], [Auth. de charges SPIFFE via SVID ; co-auteurs *NIST + IBM*],
    [`oauth-v2-1` (OAuth 2.1)], [-15 / 2026-03-02 ; *reste un I-D*], [—], [Jalon IESG visé déc. 2026 ; *pas encore RFC*],
  ),
  caption: [Chaînage et attestation OAuth — états au 8 juin 2026.],
) <tab-oauth>

Deux pièges de datation sont confirmés et conservés tels quels. Pour `transaction-tokens`, la plus haute révision numérotée déposée *reste -08* (2026-03-02) ; la date « 2026-06-02 » qui circule correspond à la *copie éditeur continue `-latest`* (`drafts.oauth.net`), non à une révision officielle — à ne pas citer comme révision.#footnote[draft-ietf-oauth-transaction-tokens (datatracker) + editor's copy -latest — IETF — 2026-03-02 — https://datatracker.ietf.org/doc/draft-ietf-oauth-transaction-tokens/] Pour `identity-chaining-14`, l'état exact lu sur le datatracker est « _Approved-announcement to be sent::Revised I-D Needed_ » : *approuvé par l'IESG mais révision requise* avant publication — approuvé ≠ publié.#footnote[draft-ietf-oauth-identity-chaining - OAuth Identity and Authorization Chaining Across Domains (datatracker) — IETF — 2026-06-04 — https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/]

Le *Cross-App Access (XAA)* — formellement « Identity Assertion Authorization Grant » — est une extension OAuth où un IdP d'entreprise gère la connexion entre deux applications, remplaçant l'approbation manuelle par un échange de jeton (via RFC 8693 + RFC 7523). L'adoption est *au stade précoce* selon OAuth.net : Okta en _early access_ (IdP) ; Auth0 et Athenz en _beta_ (serveur d'autorisation) ; Athenz aussi _beta_ (IdP) ; Keycloak _in progress_ ; *Claude Code (Anthropic)* listé comme client _beta_.#footnote[Cross-App Access - OAuth.net — OAuth.net (communauté IETF OAuth) — 2026 — https://oauth.net/cross-app-access/] `confirmé`

=== 4. Identité spécifiquement _agentique_ — drafts individuels seulement

*Aucun standard agentique n'est au stade WG en juin 2026 : la couche agentique de l'IETF reste en _drafts_ individuels ou _Independent Submission_, de nature _Informational_, non adoptés.* `confirmé` Leur lecture conjointe livre toutefois l'insight le plus net du chapitre.

#figure(
  table(
    columns: 5,
    table.header[*Draft*][*Rév. / date*][*Type*][*Statut*][*Apport*],
    [`klrc-aiagent-auth`], [-02 / 2026-06-01], [Individuel], [Informational], [« _Rather than defining new protocols_ » : compose WIMSE + OAuth ; co-auteurs Defakto, AWS, Zscaler, Ping, *OpenAI*, Okta],
    [`araut-oauth-transaction-tokens-for-agents`], [-02 / 2026-05-22], [Individuel], [voir divergence], [`agentic_ctx` (métadonnées multi-agents) ; _Monotonic Attenuation_ verbatim ; auteur A. Raut (Amazon)],
    [`embesozzi-oauth-agent-native-authorization`], [-00 / 2026-04-03], [*Independent Submission*], [Informational], [_Structured elicitation_ + autorisation _just-in-time_ (JIT) ; M. Besozzi],
    [`oauth-ai-agents-on-behalf-of-user`], [-02 / 2025-08-25], [Individuel], [*EXPIRÉ & archivé*], [`requested_actor` + `actor_token` ; *NE PAS citer comme actif/normatif*],
  ),
  caption: [Drafts d'identité agentique — tous individuels, non adoptés (8 juin 2026).],
) <tab-agentique>

Un verdict adversarial `réfuté/à vérifier` doit être restitué fidèlement sur `araut-...-for-agents-02` : l'affirmation absolutiste selon laquelle « le datatracker affiche `(None)`, et non `Informational` » est *réfutée sur ce point précis*. Le datatracker présente *les deux valeurs contradictoires* selon la vue — champ métadonnée structuré « Intended RFC status » = `(None)`, en-tête de la révision -02 « Intended status: » = `Informational`. La formulation correcte est de *signaler la divergence interne des deux champs* (document vs révision), non d'affirmer l'un contre l'autre.#footnote[draft-araut-oauth-transaction-tokens-for-agents-02 (individuel ; agentic_ctx + Monotonic Attenuation ; divergence intended status) — IETF Datatracker — 2026-05-22 — https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/] Les autres faits — rév. -02, 2026-05-22, soumission individuelle non-WG, auteur A. Raut (Amazon), expiration 2026-11-23, claims `act`/`sub`/`agentic_ctx` *sans nouveau type de jeton ni grant*, absence de version WG (l'URL `draft-ietf-oauth-transaction-tokens-for-agents` renvoie HTTP 404) — sont `confirmés`.

L'insight structurant est `confirmé` pour le constat de stade, interprétatif pour l'intention : la stratégie dominante, portée par des acteurs récurrents (Defakto, Ping, Okta, AWS, OpenAI, Amazon), est la *composition* de briques éprouvées — Token Exchange, attestation, `identity-chaining`, SPIFFE/WIMSE — plutôt que l'invention d'un protocole d'agent, confirmée verbatim par l'_abstract_ de `klrc` (« _Rather than defining new protocols_ »).#footnote[draft-klrc-aiagent-auth-02 - AI Agent Authentication and Authorization (individuel) — IETF Datatracker — 2026-06-01 — https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/] À l'inverse, l'infrastructure de délégation inter-domaines sous-jacente (`identity-chaining-14`) atteint le stade quasi-RFC (IESG-approuvé). Conséquence pour le canon : la dimension #dautorite de l'#optau (cf. Ch. 5) doit, en pratique 2026, être alimentée par un chaînage OAuth standard adossé à une identité SPIFFE ou WIT — il n'existe pas de « jeton d'agent » normatif sur lequel s'appuyer. La trace d'autorité d'une #decision repose donc sur l'_atténuation monotone_ (concept que `araut` formalise sous `agentic_ctx`) et sur la délégation chaînée, non sur un type de crédentiel agentique dédié.

=== 5. W3C — DID et Verifiable Credentials

*La famille DID/VC du W3C apporte un substrat d'identité décentralisée partiellement recommandé, mais son articulation avec la pile de charge (SPIFFE/WIMSE) reste non établie en source primaire.* La VC 2.0 est recommandée ; DID v1.1 ne l'est pas encore.

#figure(
  table(
    columns: 4,
    table.header[*Spécification*][*Statut*][*Date*][*Note*],
    [DID Core v1.0], [*W3C Recommendation*], [2022-07-19], [Référence normative stable],
    [DID v1.1], [_Candidate Recommendation Snapshot_], [2026-03-05], [*Pas encore REC* ; ≥ 2 implémentations/fonctionnalité ; type média `application/did`],
    [VC Data Model v2.0], [*W3C Recommendation*], [2025-05-15], [Concepts cœur de la famille VC 2.0],
    [Famille VC 2.0], [*7 Recommendations*], [2025-05-15], [Data Model 2.0, Data Integrity 1.0, EdDSA + ECDSA Cryptosuites, JOSE-COSE, Bitstring Status List, Controlled Identifiers ; *VC JSON Schema* et *BBS Cryptosuites* restent en CR],
  ),
  caption: [W3C DID / Verifiable Credentials — statuts au 8 juin 2026.],
) <tab-w3c>

Sources primaires : DID v1.0#footnote[Decentralized Identifiers (DIDs) v1.0 (W3C Recommendation) — W3C — 2022-07-19 — https://www.w3.org/TR/did-1.0/], DID v1.1#footnote[Decentralized Identifiers (DIDs) v1.1 (Candidate Recommendation Snapshot) — W3C — 2026-03-05 — https://www.w3.org/TR/did-1.1/], VC Data Model 2.0#footnote[Verifiable Credentials Data Model v2.0 (W3C Recommendation) — W3C — 2025-05-15 — https://www.w3.org/TR/vc-data-model-2.0/] et l'aperçu de la famille VC 2.0.#footnote[Verifiable Credentials Overview (famille VC 2.0) + Press release VC 2.0 — W3C — 2025-05-15 — https://www.w3.org/TR/vc-overview/]

La convergence SPIFFE ↔ WIMSE est explicitement *`à vérifier`* et a été rétrogradée de `probable` faute de source primaire : la relation supposée (support des WIT par SPIFFE, recouvrement WIT/SVID) *n'est pas confirmée* — la page d'aperçu spiffe.io ne mentionne ni WIMSE ni le Workload Identity Token. Le recouvrement conceptuel est plausible (WIT, JWT à clé confirmée, vs JWT-SVID), mais tout travail formel de support reste à vérifier.#footnote[SPIFFE Overview (pas de mention WIMSE/WIT ; convergence à vérifier) — SPIFFE/CNCF — 2026 — https://spiffe.io/docs/latest/spiffe-about/overview/]

=== Questions ouvertes

Les incertitudes suivantes sont reportées telles quelles du dossier d'état de l'art (8 juin 2026) ; aucune ne doit être présentée comme tranchée.

- *Aire IETF de WIMSE* (ART vs Security) : divergence inter-blocs, à confirmer via le champ _Area_ du datatracker. `à vérifier`
- *Statistique Uber « > 1 milliard de credentials/jour »* : non sourcée par le primaire Uber/CNCF ; à confirmer (transcript CNCF ou _case studies_ spiffe.io). `à vérifier`
- *Defakto/SPIRL* : année de fondation (2022 ?) et total cumulé levé (~49 M\$ ?) absents du billet de Série B. `à vérifier`
- *Calendrier des premières RFC WIMSE* : seul le jalon architecture (IESG, 31 juillet 2026, _informational_) est daté ; les RFC complètes relèvent vraisemblablement d'un événement 2027-2028, sans engagement officiel. `hypothèse`
- *Trajectoire de l'identité des agents* : un WG (WIMSE ou OAuth) adoptera-t-il un document normatif dédié d'ici 2027 ? Surveiller `araut-02` et `ni-wimse-ai-agent-identity-02`. `à vérifier`
- *Passage de DID v1.1 en REC* : fenêtre « pas avant le 5 avril 2026 » ; statut CR au 8 juin 2026, date effective non fixée. `à vérifier`
- *Articulation normative WIT (WIMSE) ↔ JWT-SVID (SPIFFE)* : recouvrement plausible, profil d'interopérabilité formel non établi. `à vérifier`
- *Publication finale d'`identity-chaining`* après la révision requise (« Revised I-D Needed ») : suivre la rév. ≥ 15 et l'entrée en file RFC Editor. `à vérifier`

#pagebreak()

== Ch. 12 — Autorité déléguée dans les chaînes agentiques

La délégation d'autorité vérifiable dans une chaîne d'agents se structure autour d'une opposition architecturale fondatrice : *transporter* une autorité atténuable — jetons à capacités, famille Macaroons/Biscuit — versus *évaluer* une autorité analysable — langage de politiques, Cedar. Les premiers instancient le modèle #angl[object-capability] (ocap) de Mark Miller — « la référence EST la permission », moindre privilège (POLA), atténuation monotone hors-ligne — qui est le substrat naturel des chaînes multi-sauts ; Cedar n'est pas un jeton mais un langage dont la force différenciante est l'analysabilité formelle (preuves Lean, #angl[soundness] et #angl[completeness]). C'est précisément cette atténuation hors-ligne qui instrumente la dimension #dautorite de l'#optau (autorité de l'appelant × autorité requise de la cible, cf. Ch. 5) : un agent ne peut transmettre que ce qu'il détient, jamais davantage. Le pont vers l'agentique reste toutefois *émergent et non normatif* : `cedar-for-agents` (expérimental) et le préprint `AIP` (non revu) coexistent sans coordination, et `confirmé` qu'#emph[aucun standard IETF/W3C de jeton à capacités spécifique aux agents] n'existe en date de juin 2026.

=== Le modèle object-capability et les jetons atténuables

L'ocap fournit la garantie structurelle que la délégation agentique requiert : un composant détient exactement l'autorité dont il a besoin (POLA), et il ne peut déléguer plus d'autorité qu'il n'en possède — il peut seulement passer une capacité *atténuée*.#footnote[OCapN and Structural Authority in Agentic AI — serefayar (Substack), source secondaire — 2026 — https://serefayar.substack.com/p/ocapn-and-structural-authority-in-agentic-ai]#footnote[awesome-ocap : Object Capabilities and Capability Security (curation, références primaires Miller / E-rights) — GitHub (dckc) — 2026 — https://github.com/dckc/awesome-ocap] Cette propriété — atténuation monotone, sans retour en arrière — est ce qui rend une chaîne de délégation analysable de bout en bout : à chaque saut, l'autorité ne peut que décroître. Le cadrage ocap pour l'agentique demeure cependant un courant d'opinion (`probable`, sources secondaires), pas un consensus normatif.

*Macaroons* est la formalisation fondatrice du jeton porteur (#angl[bearer]) atténuable. L'article « Macaroons: Cookies with Contextual Caveats for Decentralized Authorization in the Cloud » (NDSS 2014, Internet Society ; 6 auteurs Google : Birgisson, Politz, Erlingsson, Taly, Vrable, Lentczner) en fixe le mécanisme : une chaîne de MAC imbriqués (HMAC) où l'on n'ajoute jamais d'autorité, on la restreint.#footnote[Macaroons: Cookies with Contextual Caveats for Decentralized Authorization in the Cloud (NDSS 2014) — Google Research / Internet Society (NDSS) — 2014 — https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/] Deux types de #angl[caveats] : les #emph[first-party caveats] (atténuation locale, p. ex. « expire dans 5 min ») et les #emph[third-party caveats], qui exigent une preuve de décharge externe (#angl[discharge macaroon]). Ce dernier mécanisme est l'ancêtre direct de la délégation inter-domaines : prouver qu'une autorité tierce a consenti, sans que l'émetteur initial soit en ligne.

*Biscuit* généralise l'approche avec un appareil cryptographique et logique plus moderne, et un parrainage institutionnel. Proposé à l'Eclipse Foundation le 22 juillet 2024 (projet « Eclipse Biscuit », statut #angl[Incubating] sous parent « Eclipse Technology » ; lead Clément Delafargue ; parties prenantes Outscale et Clever Cloud), il réalise l'atténuation *hors-ligne* par une liste de blocs #angl[append-only] signés : le porteur ajoute un bloc de #angl[checks] sans jamais retirer ni remplacer les blocs antérieurs.#footnote[Eclipse Biscuit (projects.eclipse.org proposal ; Incubating ; lead C. Delafargue ; Outscale + Clever Cloud) — Eclipse Foundation — 2024-07-22 — https://projects.eclipse.org/proposals/eclipse-biscuit] Cryptographie : Ed25519 par défaut, ECDSA secp256r1 (SEC2v1) en alternative ; une version #angl[sealed] bloque toute atténuation ultérieure ; sérialisation Protocol Buffers. L'autorisation s'exprime en *Datalog sans négation* (types : variable, entier, chaîne, octets, date, booléen, null, set, array, map), ce qui rend chaque bloc déclaratif et vérifiable contre la clé racine.#footnote[Specifications — Eclipse Biscuit (doc de référence ; Datalog sans négation ; null/arrays/maps depuis v3.3) — Eclipse Biscuit — 2025 — https://doc.biscuitsec.org/reference/specifications.html]#footnote[biscuit SPECIFICATIONS.md (Datalog v3.3 encodé 6, append-only, Ed25519/ECDSA, sealed, protobuf) — Eclipse Biscuit (GitHub) — 2025 — https://github.com/eclipse-biscuit/biscuit/blob/main/SPECIFICATIONS.md]

L'append-only de Biscuit correspond presque terme à terme à la mécanique d'atténuation monotone exigée par #dautorite : la fonction d'autorité d'un jeton est décroissante le long de la chaîne, ce qui ferme structurellement la porte à l'escalade de privilège dans la re-délégation inter-agents (le mécanisme de défense contre le #angl[confused deputy] est traité au Ch. 13).

Deux divergences de versionnement doivent être maniées avec rigueur dans toute citation normative, et ne pas être lissées.

Le numéro de *spécification/format Datalog* (v3.3, encodé `6`) est distinct de celui de la *bibliothèque Rust* `biscuit-auth` (≥ 5.0.0). La spec v3.3 a ajouté null, arrays, maps, appels de fonctions externes et l'opération `try`.#footnote[Biscuit 3.3 (annonce de version d'origine ; statut « alpha » des third-party blocks à la date de l'annonce) — Biscuit (biscuitsec.org) — 2024-11-27 — https://www.biscuitsec.org/blog/biscuit-3-3/] Par ailleurs, le statut des #emph[third-party blocks] est rapporté « alpha » dans l'annonce de version (27 novembre 2024) mais « mature » dans la spécification courante (juin 2026) : c'est une évolution à *dater*, non une contradiction.

Côté sécurité, `confirmé` : *CVE-2024-42350* (GHSA-rgqv-mwc3-c78m, publiée le 31 juillet 2024) — confusion de clé publique dans les #emph[third-party blocks]. Le score est CVSS v3.1 = 3,0 (et non « CVSS v3.0 »). Versions affectées : `biscuit-auth` (Rust) ≤ 4, `org.biscuitsec.biscuit` (Maven) 3–4, spec 3–4 ; corrigée en 5.0.0.#footnote[Public key confusion in third party block (GHSA-rgqv-mwc3-c78m) — CVE-2024-42350, CVSS v3.1 = 3.0, corrigé en 5.0.0 — Eclipse Biscuit (GitHub Security Advisory) — 2024-07-31 — https://github.com/eclipse-biscuit/biscuit/security/advisories/GHSA-rgqv-mwc3-c78m]

Un bloc d'atténuation Biscuit illustre la mécanique : le porteur ajoute un #angl[check] qui *restreint* la requête à un outil et une fenêtre temporelle, sans pouvoir élargir l'autorité héritée du bloc d'autorité racine.

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

=== Cedar — politiques analysables et vérification Lean

Cedar relève d'une autre catégorie : ce n'est pas un jeton porteur atténuable mais un langage de politiques dont l'argument différenciant est l'analysabilité formelle. L'article de référence « Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization » (OOPSLA 2024, PACMPL, DOI 10.1145/3649835) et son compagnon « How We Built Cedar: A Verification-Guided Approach » (FSE 2024, DOI 10.1145/3663529.3663854) décrivent une implémentation Rust dont les propriétés sont formellement vérifiées en Lean.#footnote[Cedar: A New Language for Expressive, Fast, Safe, and Analyzable Authorization (PACMPL / OOPSLA 2024) — ACM (PACMPL) — 2024 — https://dl.acm.org/doi/full/10.1145/3649835]#footnote[How We Built Cedar: A Verification-Guided Approach (FSE 2024, DOI 10.1145/3663529.3663854 ; 4 bugs de soundness + 21 bugs) — ACM (FSE 2024) — 2024 — https://dl.acm.org/doi/abs/10.1145/3663529.3663854] L'approche #angl[verification-guided development] (VGD) maintient des modèles Lean exécutables *en parallèle* du Rust de production, validés par #angl[differential random testing] (Lean ↔ Rust) ; `confirmé` : 4 bugs de #angl[soundness] et 21 bugs au total trouvés et corrigés par ce dispositif.

*Cedar Analysis* (annonce AWS du 16 juin 2025) franchit un cap : le #emph[Cedar Symbolic Compiler], implémenté en Lean, fournit des preuves de #angl[soundness] *et* de #angl[completeness], complété par la #emph[Cedar Analysis CLI].#footnote[Introducing Cedar Analysis: Open Source Tools for Verifying Authorization Policies (Symbolic Compiler ; soundness + completeness) — AWS Open Source Blog — 2025-06-16 — https://aws.amazon.com/blogs/opensource/introducing-cedar-analysis-open-source-tools-for-verifying-authorization-policies/] Le crate associé `cedar-policy-symcc` est en v0.5.1 (1 juin 2026).#footnote[cedar-policy/cedar releases (cedar-policy-symcc-v0.5.1 ; tag v4.11.0) — GitHub (cedar-policy) — 2026-06-01 — https://github.com/cedar-policy/cedar/releases] Cedar a rejoint la CNCF comme projet #angl[Sandbox] (annonce AWS du 15 décembre 2025), trajectoire annoncée « Sandbox → Incubation → Graduated ».#footnote[Cedar Joins CNCF as a Sandbox Project (15 déc. 2025 ; trajectoire Sandbox → Incubation → Graduated) — AWS Open Source Blog — 2025-12-15 — https://aws.amazon.com/blogs/opensource/cedar-joins-cncf-as-a-sandbox-project/]

Comme pour Biscuit, deux numéros de version ne doivent pas être confondus : la version du *langage* Cedar (4.5, supportée par Amazon Verified Permissions depuis le 21 août 2025, opérateur `is`) est distincte de celle du *crate/SDK Rust* (4.11.0, 18 mai 2026, module `pst`).#footnote[Amazon Verified Permissions now supports Cedar 4.5 (opérateur « is ») — AWS (What's New) — 2025-08-21 — https://aws.amazon.com/about-aws/whats-new/2025/08/amazon-verified-permissions-cedar-4-5/] Un changement cassant de l'API Rust n'implique *pas* un changement cassant du langage.

L'analysabilité de Cedar se rattache à #dinvariant et à l'analyse statique de la délégation : on peut *prouver*, hors exécution, qu'aucune combinaison de politiques n'autorise un accès interdit. C'est une garantie complémentaire — et non concurrente — de l'atténuation monotone des jetons : l'un borne l'autorité *transportée*, l'autre vérifie l'autorité *décidée*.

=== Le pont agentique — émergent, non normatif

Le pont entre ces primitives et l'agentique est aujourd'hui expérimental, fragmenté et dépourvu de tout sceau normatif. `cedar-policy/cedar-for-agents` est un dépôt expérimental (~30 étoiles) reliant Cedar à des systèmes d'agents IA. Son composant le plus abouti, `cedar-policy-mcp-schema-generator` v0.6.0 (26 mai 2026), génère un schéma Cedar à partir des descriptions d'outils d'un serveur #angl[MCP] ; un `cedar-analysis-mcp-server` l'accompagne.#footnote[cedar-policy/cedar-for-agents (cedar-policy-mcp-schema-generator v0.6.0 ; cedar-analysis-mcp-server ; expérimental) — GitHub (cedar-policy) — 2026 — https://github.com/cedar-policy/cedar-for-agents] Précision : il n'existe *pas* de release globale monolithique « cedar-for-agents 0.6.0 » (dépôt multi-crates), et `confirmé` que la documentation *ne détaille pas* de chaînes de délégation multi-sauts.

Le seul protocole prétendant unifier délégation vérifiable et atténuation côté porteur pour agents est un préprint dont le statut interdit tout usage normatif. Verdict du dossier : `à vérifier`. « AIP: Agent Identity Protocol for Verifiable Delegation Across MCP and A2A » (arXiv:2603.24775, auteur unique S. Prakash, 25 mars 2026, cs.CR) introduit des #emph[Invocation-Bound Capability Tokens] (IBCTs) combinant délégation vérifiable par clé publique, atténuation côté porteur et politique chaînée, avec un surcoût annoncé < 2,35 ms ; l'article affirme avoir scanné ~2000 serveurs MCP, tous dépourvus d'authentification.#footnote[AIP: Agent Identity Protocol for Verifiable Delegation Across MCP and A2A (arXiv:2603.24775 ; préprint non revu, auteur unique S. Prakash) — arXiv — 2026-03-25 — https://arxiv.org/abs/2603.24775] *Statut : préprint non revu par les pairs, à auteur unique — à ne PAS citer comme normatif.* Aucun standard IETF/W3C de jeton à capacités pour agents n'est confirmé à cette date.

=== Tableau comparatif — modèles de délégation

Trois primitives, deux catégories : deux jetons porteurs atténuables (Macaroons, Biscuit) et un langage de politiques analysable (Cedar). Le tableau croise nature, mécanique d'atténuation, cryptographie, force différenciante et — colonne décisive ici — pertinence et maturité pour la chaîne agentique. La pertinence agentique de l'ocap reste un courant d'opinion émergent (`probable`, sources secondaires).

#figure(
  table(
    columns: 4,
    align: left,
    table.header[*Dimension*][*Macaroons*][*Biscuit*][*Cedar*],
    [Nature], [Jeton porteur atténuable], [Jeton porteur atténuable], [Langage de *politiques* (pas un jeton)],
    [Atténuation], [Hors-ligne, décentralisée (caveats)], [Hors-ligne, blocs append-only], [N/A (évaluée par moteur)],
    [Cryptographie], [HMAC chaînés], [Ed25519 (défaut) / ECDSA secp256r1], [Signatures sur les politiques (selon déploiement)],
    [Langage], [Caveats contextuels], [Datalog (sans négation)], [Langage de politiques dédié],
    [Force différenciante], [Simplicité, décentralisation], [Datalog déclaratif + vérif. par clé racine], [Analysabilité formelle (Lean, soundness + completeness)],
    [Évaluation], [Locale (vérif. de chaîne)], [Locale (vérif. de chaîne)], [Moteur (AVP centralisé ou embarqué)],
    [Risque], [Vol du *bearer*], [Vol du *bearer*], [Erreur de politique (atténué par analyse formelle)],
    [Pertinence agentique], [Chaînes multi-sauts], [Chaînes multi-sauts (POLA, atténuation monotone)], [Politiques analysables d'autorisation d'outils],
    [Gouvernance], [Google (NDSS 2014)], [Eclipse `Incubating` (2024)], [CNCF `Sandbox` (déc. 2025)],
    [Maturité agentique], [—], [—], [`cedar-for-agents` *expérimental*],
  ),
  caption: [Modèles de délégation d'autorité — capacités atténuables vs politiques analysables (juin 2026).],
) <tab-delegation>

=== Drafts IETF de délégation et initiatives NIST/NCCoE

Au-delà des familles de capacités, la délégation inter-domaines repose sur la pile OAuth (cf. Ch. 11), et deux signaux gouvernementaux US confirment que l'infrastructure d'autorité d'agent quitte le stade purement industriel. Le draft le plus mature, `draft-ietf-oauth-identity-chaining` (révision 14), atteint le stade *quasi-RFC* (IESG `Approved-announcement::Revised I-D Needed`, ballots des 2–3 juin 2026) ; ses co-auteurs incluent MITRE (K. Burgin) et NSA-CCSS (M. Jenkins).#footnote[draft-ietf-oauth-identity-chaining — OAuth Identity and Authorization Chaining Across Domains (datatracker ; états IESG, positions de ballot) — IETF — 2026-06-04 — https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/]

Côté NIST/NCCoE (`confirmé`), le NCCoE a publié le concept paper « Accelerating the Adoption of Software and AI Agent Identity and Authorization » (marqué DRAFT, February 2026 ; auteurs Booth/Fisher/Galluzzo/Roberts, NIST), avec une période de commentaires du 5 février au 2 avril 2026.#footnote[Accelerating the Adoption of Software and AI Agent Identity and Authorization (concept paper, source primaire ; DRAFT February 2026 ; commentaires 5 fév. – 2 avr. 2026) — NIST NCCoE — 2026-02-05 — https://www.nccoe.nist.gov/sites/default/files/2026-02/accelerating-the-adoption-of-software-and-ai-agent-identity-and-authorization-concept-paper.pdf] Précision à conserver : la date « 2026-02-05 » est l'*ouverture* de la période de commentaires, non une date de publication imprimée distincte (le PDF ne porte que « February 2026 »). Quatre domaines de démonstration sont confirmés verbatim : #emph[Authorization of AI Systems] (via OAuth 2.0), #emph[Access Delegation], #emph[Logging and Transparency], plus un axe #emph[Identification]. En parallèle, NIST mène une « AI Agent Standards Initiative » (page créée le 17 février 2026, mise à jour le 20 avril 2026) incluant explicitement « fundamental research into agent authentication and identity infrastructure » ; le RFI sécurité associé s'est clos le 9 mars 2026.#footnote[AI Agent Standards Initiative (RFI clos 2026-03-09 ; recherche sur l'authentification et l'identité d'agent) — NIST — 2026-04-20 — https://www.nist.gov/artificial-intelligence/ai-agent-standards-initiative]

La leçon transversale rejoint la dimension #dautorite de l'#optau : le marché *compose* des briques éprouvées (OAuth chaîné, Cedar/Biscuit/Macaroons) plutôt qu'il n'invente un standard agentique de capacités. L'atténuation hors-ligne demeure le mécanisme qui rend cette composition sûre — chaque saut décroît, et la décision d'autorité de #tau peut s'appuyer sur une autorité dont la borne supérieure est cryptographiquement garantie.

=== Questions ouvertes

Les incertitudes suivantes sont reprises du dossier d'état de l'art (arrêté au 8 juin 2026) et conservent leur marqueur.

- *Date exacte du vote CNCF.* Le billet AWS donne la date d'*annonce* de l'acceptation de Cedar (15 décembre 2025), mais non la date du vote du TOC. `à vérifier`.
- *Dernière publication du crate `cedar-policy` sur crates.io.* La page est rendue côté JS et n'a pu être récupérée le 8 juin 2026 ; v4.11.0 est confirmée via GitHub uniquement. `à vérifier`.
- *Internet-Draft IETF actif (non expiré) sur les jetons à capacités / la délégation d'agents*, au-delà des préprints arXiv ? Pistes : OAuth, WIMSE, SPICE. `à vérifier`.
- *Spécification officielle de délégation à capacités pour MCP/A2A* par un acteur majeur, au-delà de `cedar-for-agents` (expérimental) et d'AIP (préprint) ? Aucune confirmée à ce jour. `à vérifier`.
- *« Delegation chain splicing » sur la liste OAuth de mars 2026* : le terme et le débat associé ne sont *pas* re-confirmés sur archive primaire ; le mécanisme d'atténuation monotone qui y répond est, lui, confirmé dans `draft-araut-oauth-transaction-tokens-for-agents-02`. `à vérifier` / `confirmé` (mécanisme).
- *Passage du concept paper NCCoE (commentaires clos le 2 avril 2026) à un projet de démonstration formel* avec partenaires : non annoncé au 8 juin 2026. `à vérifier`.
- *Calendrier 2027–2030* : aucune date ferme d'entrée en vigueur ou de publication RFC pour `transaction-tokens` (jalon « Submit to IESG » fixé à décembre 2026, indicatif) ni pour les drafts WIMSE ; toute projection demeure une `hypothèse`.

#pagebreak()

== Ch. 13 — Menaces et défenses de l'entreprise agentique

Le paysage des menaces agentiques s'organise autour de trois cadres complémentaires — OWASP (catalogue de vulnérabilités et de mitigations), MITRE ATLAS (techniques adverses, #angl[TTP]), CSA (cartographie architecturale) — qui convergent sur un constat unifiant : le #angl[confused deputy] agentique et l'injection de prompt sont des problèmes d'*autorisation* et d'*architecture*, non des défauts de modèle, et l'injection de prompt demeure un problème ouvert non entièrement résoluble. L'agentique *aggrave* l'injection — surface élargie par les outils, le #angl[RAG] et le multi-agent — et introduit des classes de menaces (#angl[chain splicing], #angl[credential relay through delegation chains]) encore imparfaitement couvertes par les taxonomies existantes.

Lu à travers le canon (cf. Ch. 5 et Ch. 6), ce constat se reformule sans perte : ces menaces sont des *violations d'invariants sur la trace*. Le #dinvariant — l'état des invariants `I1`–`I5` observé le long de la trace d'exécution — est précisément la dimension d'entrée de #tau qui rend l'agression *détectable comme telle*, indépendamment de la qualité du modèle. La défense de premier ordre n'est donc pas un meilleur classifieur, mais le régime #optau en sortie *Refus* (cf. #decision) : un *dispatch* qui refuse de fixer le sens (#tfix) lorsque l'autorité requise dépasse l'autorité de l'appelant (#dautorite) ou qu'un invariant est rompu. Les remédiations recensées par OWASP et CSA — #angl[admission control], validation d'entrée structurée, cadrage explicite de l'autorité — sont l'instanciation opérationnelle, *externe au modèle*, de ce même refus.

=== 1. OWASP — deux taxonomies à ne pas confondre

OWASP maintient en date de juin 2026 *deux* listes distinctes qu'il ne faut pas amalgamer : le #angl[Top 10 for LLM Applications] (orienté application) et le #angl[Top 10 for Agentic Applications] (orienté système d'agents). La première décrit des vulnérabilités de la couche modèle-application ; la seconde, des risques propres à l'autonomie, à l'usage d'outils et à la coordination inter-agents.

La date de l'édition « LLM 2025 » illustre la discipline de datation requise : trois dates coexistent dans les propres sources d'OWASP — *byline* d'annonce « November 17, 2024 », communiqué « WILMINGTON, Del. — Nov. 19, 2024 », et tampon de *build* du PDF « 20241114 » (v4.2.0a). La date retenue est le *17 novembre 2024* (annonce officielle)#footnote[OWASP Reveals Updated 2025 Top 10 Risks for LLMs, Announces New Sponsorship Program (annonce officielle ; dates 17/19 nov. 2024 ; build PDF 20241114) — OWASP GenAI Security Project — 2024-11-17 — https://genai.owasp.org/2024/11/17/owasp-reveals-2025-top-10-risks-for-llms-new-sponsorship-program/], écart intra-OWASP de 14/17/19 nov. à ne pas lisser ; « 2025 » désigne l'année de l'édition, pas la date de sortie. Les dix entrées (`confirmé` verbatim) sont LLM01 #angl[Prompt Injection], LLM02 #angl[Sensitive Information Disclosure], LLM03 #angl[Supply Chain], LLM04 #angl[Data and Model Poisoning], LLM05 #angl[Improper Output Handling], LLM06 #angl[Excessive Agency], LLM07 #angl[System Prompt Leakage] (nouveau), LLM08 #angl[Vector and Embedding Weaknesses] (nouveau, #angl[RAG]), LLM09 #angl[Misinformation], LLM10 #angl[Unbounded Consumption] (étend l'ancien #angl[DoS])#footnote[OWASP Top 10 for LLM Applications 2025 (resource page + liste LLM01-LLM10 verbatim) — OWASP GenAI Security Project — 2024-11-17 — https://genai.owasp.org/llm-top-10/].

Du côté agentique, deux livrables se succèdent. Le guide « Agentic AI — Threats and Mitigations » v1.0 (17 février 2025, *first in a series* de l'#angl[Agentic Security Initiative]) énumère 15 menaces *T1–T15*#footnote[Agentic AI - Threats and Mitigations v1.0 (T1-T15 ; 'first in a series') — OWASP GenAI Security Project / Agentic Security Initiative — 2025-02-17 — https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/] (`confirmé` ; titres verbatim `à vérifier` dans le PDF intégral, la page de ressource n'exposant que la couverture). Le « Top 10 for Agentic Applications » (édition 2026), publié le *9 décembre 2025* (plus de 100 contributeurs ; *Expert Review Board* incluant NIST, Commission européenne, Alan Turing Institute), liste *ASI01–ASI10*#footnote[OWASP GenAI Security Project Releases Top 10 Risks and Mitigations for Agentic AI Security (>100 experts ; Expert Review Board NIST/CE/Alan Turing) — OWASP GenAI Security Project — 2025-12-09 — https://genai.owasp.org/2025/12/09/owasp-genai-security-project-releases-top-10-risks-and-mitigations-for-agentic-ai-security/] (`confirmé`).

#figure(
  table(
    columns: 2,
    align: (left, left),
    table.header[*Code*][*Risque agentique 2026*],
    [ASI01], [Agent Goal Hijack #emph[(annonce officielle : « Agent Behavior Hijacking » — voir divergence)]],
    [ASI02], [Tool Misuse and Exploitation],
    [ASI03], [Identity and Privilege Abuse],
    [ASI04], [Agentic Supply Chain Vulnerabilities],
    [ASI05], [Unexpected Code Execution (RCE)],
    [ASI06], [Memory & Context Poisoning],
    [ASI07], [Insecure Inter-Agent Communication],
    [ASI08], [Cascading Failures],
    [ASI09], [Human-Agent Trust Exploitation],
    [ASI10], [Rogue Agents],
  ),
  caption: [OWASP Top 10 for Agentic Applications (édition 2026) — ASI01–ASI10],
) <tbl-asi>

Deux divergences sont à conserver. D'une part, les listes *T1–T15* et *ASI01–ASI10* ne se correspondent *pas un-à-un* : le Top 10 consolide et réorganise, mais aucune table de correspondance officielle 1:1 normative n'a été confirmée — ne jamais présenter les T-codes et les ASI-codes comme équivalents (`probable`). D'autre part, la dénomination d'ASI01 diverge entre l'annonce officielle (« Agent Behavior Hijacking ») et les recensions secondaires (« Agent Goal Hijack »#footnote[OWASP Top 10 for Agentic Application 2026 (liste ASI01-ASI10 verbatim) — Giskard — 2025-12 — https://www.giskard.ai/knowledge/owasp-top-10-for-agentic-application-2026]), à confirmer dans le PDF intégral 2026.

La lecture canonique de cette table est directe : ASI03 (#angl[Identity and Privilege Abuse]) et ASI07 (#angl[Insecure Inter-Agent Communication]) sont exactement les vecteurs par lesquels #dautorite et #dinvariant sont franchis. Une politique #optau correctement instanciée transforme ASI03 et ASI07 d'incidents subis en *Refus* émis avant action.

=== 2. MITRE ATLAS — l'arrivée de l'agentique et un débat sur le mouvement latéral

ATLAS a promu l'« Agentic AI » au rang de plateforme de premier ordre en 2026, mais sa couverture du mouvement latéral *agent-à-agent* fait l'objet d'une divergence réelle entre MITRE et la CSA qu'il ne faut pas lisser.

#figure(
  table(
    columns: 3,
    align: (left, left, left),
    table.header[*Version ATLAS*][*Date*][*Contenu / apport*],
    [v5.1.0], [2025-11-06], [16 tactiques / 84 techniques / 56 sous-techniques / 32 mitigations / 42 cas ; « Added a new tactic Lateral Movement (AML.TA0015) »],
    [v2026.05], [2026-05-27], [Versionnage `YYYY.MM.N` ; format YAML v6.0.0 ; champ *platforms* = {Predictive AI, Generative AI, Agentic AI, Enterprise} — « Agentic AI » de premier rang],
  ),
  caption: [Jalons MITRE ATLAS pertinents pour l'agentique],
) <tbl-atlas>

Les techniques *agent-focused* proviennent de contributions Zenity Labs en deux vagues : automne 2025 (premières techniques centrées agents — AML.T0081/T0082/T0086) puis « première mise à jour 2026 » (5 techniques AML.T0096/T0098/T0099/T0100/T0101)#footnote[mitre-atlas/atlas-data CHANGELOG.md (v5.1.0 2025-11-06 ; 'Added a new tactic Lateral Movement') — MITRE — 2025-11-06 — https://raw.githubusercontent.com/mitre-atlas/atlas-data/main/CHANGELOG.md]. Le chiffre de « 14 techniques » attribué à la vague d'octobre 2025 figure dans des recensions vendeur mais n'a pas été confirmé au CHANGELOG#footnote[Zenity & MITRE ATLAS Expand AI Agent Attack Coverage + MITRE ATLAS AI Security 2026 Update (vendeur, à recouper) — Zenity Labs (vendeur) — 2025-10 — https://zenity.io/blog/current-events/zenity-labs-and-mitre-atlas-collaborate-to-advances-ai-agent-security-with-the-first-release-of] → `à vérifier` (`probable`).

La divergence centrale, *à ne pas lisser* : (a) le CHANGELOG MITRE indique que v5.1.0 « *Added a new tactic Lateral Movement (AML.TA0015)* » ; (b) la note CSA « *MITRE ATT&CK and ATLAS Agentic Gap Analysis* » (draft, 27 mars 2026) affirme qu'ATLAS « *intentionally excludes lateral movement and command-and-control as tactics* » et identifie *six catégories* non couvertes#footnote[MITRE ATT&CK and ATLAS Agentic Gap Analysis (draft ; 'intentionally excludes lateral movement' ; 6 catégories non couvertes) — Cloud Security Alliance — 2026-03-27 — https://labs.cloudsecurityalliance.org/agentic/csa-research-note-atlas-agentic-gap-analysis-20260327/] :

- *agent-to-agent lateral movement* ;
- *tool-chain poisoning* ;
- *orchestrator hijacking* ;
- *credential relay through delegation chains* ;
- *cross-session memory persistence* ;
- *MCP server compromise as a pivot point*.

Interprétation `probable` : la tactique ajoutée vise un mouvement latéral de *style réseau*, distinct du mouvement latéral *agent-à-agent* visé par la critique CSA ; ou bien le cadrage CSA est antérieur ou non aligné sur v5.1.0. *Ne pas affirmer qu'ATLAS couvre pleinement le mouvement latéral inter-agents.* Cet angle mort est doctrinalement significatif : *agent-to-agent lateral movement* et *credential relay through delegation chains* sont, dans le vocabulaire du canon, des trajectoires où #dautorite est érodée saut après saut et où #dinvariant n'est plus vérifié de bout en bout — exactement la zone que #tau est censé garder.

=== 3. Cadres NIST

NIST fournit la taxonomie adversariale de référence (AI 100-2 E2025) et le cadre-mère de gouvernance (AI RMF 1.0). Fait à conserver : le NIST AI 600-1 *n'emploie pas le terme « confused deputy »*, qui relève du cadrage CSA/OWASP. (L'absence de ce terme dans l'AI 100-2 E2025 et l'AI RMF 1.0 n'est pas attestée par le dossier — `à vérifier` —, le dossier ne confirmant explicitement le « n'emploie pas » que pour l'AI 600-1.)

#figure(
  table(
    columns: 4,
    align: (left, left, left, left),
    table.header[*Publication*][*Statut*][*Date*][*Portée*],
    [NIST AI 100-2 E2025 — Adversarial ML], [Final], [2025-03-24], [DOI 10.6028/NIST.AI.100-2e2025 ; taxonomie intégrité/disponibilité/confidentialité ; injection de prompt directe/indirecte, *poisoning*, évasion],
    [NIST AI RMF 1.0], [Cadre-mère], [2023-01], [Govern/Map/Measure/Manage ; *pas* de taxonomie adversariale native (jour exact `à vérifier`)],
    [NIST AI 600-1 — GenAI Profile], [Final], [2024-07-26], [~12 catégories de risque GenAI ; injection de prompt ; n'emploie *pas* « confused deputy »],
  ),
  caption: [Cadres NIST applicables aux menaces agentiques],
) <tbl-nist>

Sources : AI 100-2 E2025#footnote[NIST AI 100-2 E2025 Adversarial Machine Learning (final ; DOI 10.6028/NIST.AI.100-2e2025) — NIST — 2025-03-24 — https://csrc.nist.gov/pubs/ai/100/2/e2025/final] ; AI RMF 1.0#footnote[AI Risk Management Framework (AI RMF 1.0) — NIST — 2023-01 — https://www.nist.gov/itl/ai-risk-management-framework] ; AI 600-1#footnote[NIST.AI.600-1 Generative AI Profile (PDF) — NIST — 2024-07-26 — https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf]. État `confirmé` (les pages AI RMF 1.0 et AI 600-1 n'ont pas été ré-ouvertes cette session ; valeurs conservées de la connaissance établie et des pages éditeur). La taxonomie tripartite de l'AI 100-2 (intégrité / disponibilité / confidentialité) cartographie proprement le rôle de #dinvariant : une atteinte à l'*intégrité* est, sur la trace, une rupture d'invariant détectable avant que #tau ne consente à fixer le sens.

=== 4. Confused deputy, injection de prompt, chain splicing

Ces quatre vecteurs partagent une même racine : l'agent traite *tout* contenu de sa fenêtre de contexte comme potentiellement instructif, ce qui efface la frontière dure entre données et code. La conséquence canonique est que la défense ne peut résider dans le modèle ; elle réside dans le *dispatch* d'autorité (#tau) et la vérification d'invariants (#dinvariant) en amont de l'action.

Le *confused deputy* agentique est conceptualisé comme une faille d'*autorisation/architecture*, non un défaut de modèle : l'agent « *is designed to treat all content in their context window as potentially instructive, which eliminates the hard boundary between data and code* », de sorte qu'une injection le manipule pour abuser de ses identifiants délégués ; les remédiations (#angl[admission control], validation d'entrée structurée, cadrage explicite de l'autorité) sont des contrôles *externes au modèle*. Note de recherche CSA dédiée : « *Confused Deputy Attacks on Autonomous AI Agents* », 23 mars 2026#footnote[Confused Deputy Attacks on Autonomous AI Agents (research note ; cadrage autorisation/architecture) — Cloud Security Alliance (AI Safety Initiative) — 2026-03-23 — https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-confused-deputy-prompt-injection/] (`confirmé`). C'est le cas d'usage paradigmatique de la sortie *Refus* : l'appelant n'a pas l'autorité requise (#dautorite), donc #tau refuse de déplacer #tfix vers le régime probabiliste, quel que soit le contenu injecté.

L'injection de prompt (directe et indirecte) est qualifiée de *problème ouvert non entièrement résoluble*. La page OpenAI « *Understanding prompt injections: a frontier security challenge* » la présente comme « *frontier, challenging research problem* » dont le travail « *remains ongoing* » (« *an open challenge for agent security... for years to come* »)#footnote[Understanding prompt injections: a frontier security challenge (source primaire OpenAI ; date page à vérifier) — OpenAI — 2025 — https://openai.com/index/prompt-injections/] (`confirmé` ; date exacte de la page `à vérifier` — HTTP 403 à la récupération directe). Cette irréductibilité justifie, au plan théorique, de ne *pas* faire dépendre la sécurité d'une garantie probabiliste : la frontière déterministe (le *Refus* de #tau, la garantie de message du substrat #angl[event streaming]) est ce qui reste vrai même quand l'injection réussit à l'intérieur du régime probabiliste.

Le *chain splicing* / re-délégation inter-agents est documenté comme amplification multi-agent : l'injection cible l'agent *délégué* (moins protégé) plutôt que l'agent face-utilisateur, en convergence avec le *credential relay through delegation chains* de la CSA ; cartographie partielle OWASP ASI07 et T12#footnote[From LLM to agentic AI: prompt injection got worse (amplification multi-agent ; 'chain splicing' — secondaire) — Christian Schneider (chercheur sécurité ; secondaire) — 2025 — https://christian-schneider.net/blog/prompt-injection-agentic-amplification/] (`probable` ; le terme « chain splicing » lui-même reste de la littérature secondaire/préprint, non normatif — par cohérence avec le Ch. 12, le débat de la liste OAuth de mars 2026 n'est pas re-confirmé sur archive primaire). Le draft `draft-araut-oauth-transaction-tokens-for-agents-02` y répond par l'*atténuation monotone* (confirmée verbatim ; auteur A. Raut, Amazon ; -02 du 2026-05-22)#footnote[draft-araut-oauth-transaction-tokens-for-agents-02 (individuel ; agentic_ctx + Monotonic Attenuation ; divergence intended status) — IETF Datatracker — 2026-05-22 — https://datatracker.ietf.org/doc/draft-araut-oauth-transaction-tokens-for-agents/], s'appuyant sur la pile de chaînage d'identité (`identity-chaining-14`, co-auteurs MITRE/NSA-CCSS)#footnote[draft-ietf-oauth-identity-chaining - OAuth Identity and Authorization Chaining Across Domains — IETF — 2026-06-04 — https://datatracker.ietf.org/doc/draft-ietf-oauth-identity-chaining/].

L'atténuation monotone est l'expression protocolaire d'une propriété d'invariant : l'autorité ne peut que *décroître* le long de la chaîne de délégation. Formellement, c'est une contrainte sur #dautorite — l'autorité requise à la cible ne peut excéder l'autorité héritée de l'appelant — et toute violation est, par construction, une rupture d'invariant sur la trace que #tau peut sanctionner en *Refus*. Une politique illustrative, exprimant que la re-délégation préserve la monotonie et déclenche un refus sinon :

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

Cette politique n'invente rien : elle compose des briques éprouvées (chaînage OAuth, atténuation monotone) et délègue la décision finale au #optau, conformément à la rupture canonique `composition→délégation`.

=== 5. Convergence des cadres — complémentarité, pas mapping normatif

Les trois grands cadres sont *complémentaires* par positionnement éditorial, mais le mapping fin inter-cadres n'est *pas* normatif — distinction à conserver pour ne pas conférer une autorité indue à des recensions tierces.

#figure(
  table(
    columns: 3,
    align: (left, left, left),
    table.header[*Cadre*][*Rôle*][*Statut du mapping inter-cadres*],
    [OWASP ASI], [Catalogue de vulnérabilités + mitigations actionnables], [—],
    [MITRE ATLAS], [Modèle de comportement adverse / références TTP], [—],
    [CSA MAESTRO], [Carte de menaces architecturale par couche + responsabilité], [—],
  ),
  caption: [Rôles éditoriaux des trois cadres et statut du cross-mapping],
) <tbl-conv>

La complémentarité est *plausible* et soutenue par le positionnement éditorial de chaque cadre, mais le mapping détaillé « T-codes OWASP alignés sur les couches MAESTRO et les techniques ATLAS » provient d'un *agrégateur tiers* (Tech Jacks Solutions) et *n'est pas un mapping officiel normatif*#footnote[Agentic AI Threat Landscape: OWASP, MITRE ATLAS & MAESTRO (agrégateur ; cross-mapping non officiel, à recouper) — Tech Jacks Solutions (agrégateur) — 2025 — https://techjacksolutions.com/ai/agentic-ai/secure/agent-threat-landscape/]. Distinguer le positionnement éditorial (`confirmé`) du mapping fin (`probable`, non normatif) ; la *gap analysis* CSA elle-même est `confirmé`#footnote[MITRE ATT&CK and ATLAS Agentic Gap Analysis (draft) — Cloud Security Alliance — 2026-03-27 — https://labs.cloudsecurityalliance.org/agentic/csa-research-note-atlas-agentic-gap-analysis-20260327/]. La lecture par le canon offre, faute de table normative, un *invariant de traduction* : quelle que soit la taxonomie, une menace donnée se range selon la dimension de #tau qu'elle viole — #dsens (sens détourné : ASI01, ASI06), #dautorite (autorité abusée : ASI03, *confused deputy*, *credential relay*) ou #dinvariant (intégrité de la trace rompue : ASI07, ASI08). Ce classement n'est pas un mapping officiel mais un principe d'organisation interne à la monographie.

=== Questions ouvertes

Les incertitudes suivantes, issues du dossier (`à vérifier` en date de juin 2026), conditionnent toute affirmation normative de ce chapitre :

- Confirmer les titres verbatim *T1–T15* du guide OWASP v1.0 directement dans le PDF intégral.
- Confirmer la dénomination exacte d'*ASI01* dans le document final 2026 (« Agent Goal Hijack » vs « Agent Behavior Hijacking »).
- Lever la *divergence ATLAS sur le mouvement latéral* : vérifier la description exacte d'AML.TA0015 (réseau vs agent-à-agent) sur atlas.mitre.org / atlas-data, et déterminer si la critique CSA est antérieure ou non alignée sur v5.1.0.
- Établir le décompte *exact* des techniques *agent-focused* Zenity Labs d'octobre 2025 (les « 14 ») via atlas-data ou le blogue Zenity primaire.
- Confirmer la *date de publication exacte* de la page OpenAI « Understanding prompt injections » (HTTP 403).
- Confirmer le jour exact de *NIST AI RMF 1.0* (janvier 2023) et le nombre exact de catégories de risque GenAI de NIST AI 600-1 (~12).
- Vérifier l'existence d'une *table de correspondance officielle* T1–T15 ↔ ASI01–ASI10 ; à défaut, ne jamais présenter les deux numérotations comme équivalentes.

Au-delà du dossier, une question ouverte *propre à la monographie* demeure : l'efficacité de la défense par #tau en régime *Refus* contre l'injection indirecte n'est pas établie empiriquement — elle relève du même statut que #i4, dont la campagne empirique n'est pas concluante (cf. Ch. 6). Présenter le *Refus* comme garantie acquise contre le *chain splicing* serait un écart de traçabilité ; il s'agit, en l'état, d'une `hypothèse` réfutable dont la condition de réfutation est une chaîne de re-délégation où l'atténuation monotone est respectée mais où le sens est néanmoins détourné sans rupture d'invariant détectable.
