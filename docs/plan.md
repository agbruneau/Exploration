# Plan détaillé — *L'Interopérabilité Agentique en Entreprise*

> 7 parties / 20 chapitres. Référence de structure pour toute session (cf. `CLAUDE.md` §1).
> État : **ébauche des parties III–V** rédigée (ancrée sur `docs/recherche/etat-de-lart-2026-06.md`).
> Le noyau théorique (Parties I–II : τ, CIA, I1–I5) provient du **corpus mère** et n'est pas dupliqué (§2, §11).

## PARTIE I — Cadre conceptuel et problématique
- **Ch. 1** — Définir l'interopérabilité agentique : distinction d'avec l'interopérabilité classique ; niveaux (technique / syntaxique / sémantique / pragmatique / organisationnel) ; positionnement vs *LCIM*.
- **Ch. 2** — L'entreprise agentique : définition, propriétés distinctives, écosystème d'acteurs, frontière avec l'automatisation classique et le *RPA*.
- **Ch. 3** — Les trois ruptures conceptuelles couplées : exposé, articulation, démonstration du couplage.

## PARTIE II — Fondements formels
- **Ch. 4** — La tension fondamentale : garanties déterministes (*exactly-once*, ordre, idempotence, *transactional outbox*) vs comportement probabiliste/révisable des agents *LLM*.
- **Ch. 5** — L'opérateur τ : sémantique formelle ; dimensions D-Sens / D-Autorité / D-Invariant ; invariants I1–I5 avec statut de réfutabilité (**I4 = Hypothèse**).
- **Ch. 6** — Le Calcul d'Intégration Agentique (CIA) : types de session probabilistes / tolérants au *drift*, algèbre d'héritage de garanties, mécanisation Lean 4, rapport au π-calcul et aux *behavioural types*.
- **Ch. 7** — Patrons d'intégration agentique : extension critique de Hohpe & Woolf (*Enterprise Integration Patterns*) au régime agentique.

## PARTIE III — Protocoles et standards *(ébauche)*
- **Ch. 8** — Paysage des protocoles : MCP, A2A, ACP, AGNTCY, AG-UI ; comparaison multidimensionnelle ; convergence/fragmentation.
- **Ch. 9** — Substrats de messagerie à garanties fortes : Apache Kafka / Confluent, IBM MQ ; sémantiques de livraison, ordre, transactions vs incertitude agentique.
- **Ch. 10** — Modernisation *mainframe* : z/OS Connect, Cloud Pak for Integration, exposition d'actifs *legacy* à des agents.

## PARTIE IV — Sécurité, identité et autorité déléguée *(ébauche)*
- **Ch. 11** — Identité des agents : SPIFFE/SPIRE, WIMSE, DID/VC, OAuth 2.x ; identité non-humaine à l'échelle.
- **Ch. 12** — Autorité déléguée : *object-capability*, Biscuit/Datalog, Macaroons, Cedar ; *drafts* IETF identité/délégation ; NIST/NCCoE.
- **Ch. 13** — Menaces et défenses : *confused deputy*, *chain splicing*, *scope inflation*, *cross-agent privilege escalation* ; OWASP, MITRE ATLAS, NIST.

## PARTIE V — Observabilité, traçabilité et gouvernance *(ébauche)*
- **Ch. 14** — Observabilité agentique : OpenTelemetry GenAI ; traçabilité attestée via W3C PROV-DM et OpenLineage.
- **Ch. 15** — Gouvernance et conformité : DORA, OSFI E-23, AMF, EU AI Act ; matrice obligations ↔ mécanismes techniques.
- **Ch. 16** — Résilience opérationnelle et gestion du risque agentique.

## PARTIE VI — Validation empirique et architecture de référence
- **Ch. 17** — Méthodologie de validation : conjectures réfutables, bancs sur substrat Go/Kafka (`AgentMeshKafka`, `TauGo`), reproductibilité, métrologie.
- **Ch. 18** — Architecture de référence implémentable de bout en bout.
- **Ch. 19** — Instanciation services financiers : substrat régulé, souveraineté, auditabilité (*mainframe + z/OS Connect + MCP*).

## PARTIE VII — Perspectives
- **Ch. 20** — Limites, angles morts, questions ouvertes, programme de recherche 2027–2030.
