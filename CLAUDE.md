# CLAUDE.md

> Fichier de contexte persistant lu par Claude Code à la racine du dépôt.
> Toute session (mono-agent ou multi-agent) **doit** s'y conformer.

---

## 0. Paramètres du dépôt

```
REPO            = InteroperabiliteAgentiqueEntreprise
                  (alternative : sous-dossier /monographie-entreprise/ de
                   github.com/agbruneau/InteroperabiliteAgentique — voir §11)
TITRE           = L'Interopérabilité Agentique en Entreprise
AUTEUR          = André-Guy Bruneau, M.Sc.
CO-AUTEUR       = Claude (Anthropic) — divulgation transparente, cf. §9
FORMAT          = Typst
LANGUE          = français canadien (fr-CA) ; anglais en italique pour termes techniques
STATUT          = en rédaction
RÉF. CANONIQUE  = github.com/agbruneau/InteroperabiliteAgentique (corpus mère)
```

---

## 1. Finalité du dépôt

Ce dépôt héberge les **sources Typst** d'une **monographie scientifique de niveau doctoral** sur l'interopérabilité dans l'entreprise agentique. Il **prolonge et consolide** le corpus mère `InteroperabiliteAgentique` ; il n'invente pas une théorie concurrente. Lectorat cible : pairs architectes principaux et chercheurs. Plan de référence : 7 parties / 20 chapitres (voir `docs/plan.md`).

**Avant toute rédaction**, lis : `docs/plan.md`, `lib/canon.typ` (glossaire verrouillé), et le fichier de la partie concernée. Ne réécris jamais une construction du canon sans justification explicite consignée.

---

## 2. Canon théorique — TERMINOLOGIE VERROUILLÉE

Ces constructions proviennent du corpus mère et **ne doivent pas dériver** (orthographe, sémantique, notation). Toute reformulation est un *écart de traçabilité* à consigner.

- **Trois ruptures conceptuelles couplées** : `déterministe→probabiliste`, `syntaxique→sémantique`, `composition→délégation`. Elles structurent l'argument ; leur **couplage** est la thèse, pas trois axes indépendants.
- **Opérateur τ (tau)** : opérateur directionnel qui **déplace l'instant de fixation du sens `t_fix(g)`** sans altérer la grandeur `g`. Rôle : *dispatch* entre régime déterministe (garantie de message) et régime probabiliste (agent *LLM*). Sortie : `Decision ∈ {Déterministe, Probabiliste, Refus}`. Définition canonique : chap. III.8 du corpus mère ; instancié ici au **Ch. 5 (Partie II)**.
- **Dimensions d'entrée de τ** : `D-SENS` (score sémantique [0,1]), `D-AUTORITÉ` (autorité appelant × autorité requise cible), `D-INVARIANT` (état des invariants sur la trace).
- **Invariants réfutables `I1`–`I5`** : chaque mention porte un **statut explicite** — `Confirmé` | `Hypothèse` | `Réfuté`. **`I4` = `Hypothèse`** (campagne empirique non concluante) ; ne pas le présenter comme acquis.
- **CIA — Calcul d'Intégration Agentique** : cadre formel pontant garanties déterministes (Kafka/MQ) et comportement probabiliste d'agents *LLM* ; **types de session probabilistes / tolérants au *drift***, **algèbre d'héritage de garanties**, mécanisation **Lean 4**, banc empirique `AgentMeshKafka`. Analogie directrice : `M(π)` / π-calcul pour les systèmes communicants.
- **Écosystème de dépôts lié** : `TauGo` (kernel exécutable Go de τ), `AgentMeshKafka` (banc de validation), `PubSubKafka`, `FibGo` (patron d'ingénierie de référence).

Notation, casse et accents de ces termes sont normatifs. En cas de doute, `lib/canon.typ` fait foi.

---

## 3. Discipline éditoriale

- **Langue** : fr-CA (courriel, fin de semaine, orthographe québécoise). Anglais **en italique** pour termes techniques sans équivalent établi (*exactly-once*, *session types*, *confused deputy*, *MCP*).
- **Structure rédactionnelle** : **pyramide inversée** par chapitre — insight-clé en 1–2 phrases, justification ensuite.
- **Format** : prose dense par défaut ; **puces** pour énumérations hétérogènes ≥ 4 ; **tableaux** pour comparaisons ≥ 2 dimensions ; **blocs de code** pour tout extrait exécutable (Go, Lean 4, configuration).
- **Niveau** : pair d'architecte principal. **Ne pas définir** les termes du domaine sauf nécessité conceptuelle.
- **Proscrire** : préambules courtois, mises en garde génériques, reformulation de consigne, exemples triviaux, remplissage.

---

## 4. Discipline épistémique

- **Premiers principes** : exposer le raisonnement causal **avant** toute conclusion (pas seulement autorité/convention).
- **Incertitude calibrée** : marqueurs obligatoires — `confirmé`, `probable`, `hypothèse`, `à vérifier`, `je ne sais pas`. Distinguer **savoir établi** de **terrain mouvant**.
- **Datation normative** : tout énoncé sur un standard, une version, un prix ou une statistique est **horodaté** (« en date de [mois année] ») et **cité** (éditeur + date).
- **Sources primaires** : IETF, W3C, NIST/NCCoE, CNCF, Apache, IBM, Microsoft, Anthropic, Google, Linux Foundation, *peer-reviewed*. Éviter agrégateurs/blogues comme source d'affirmation normative. **Signaler les divergences**, ne pas les lisser.
- **Falsifiabilité** : toute conjecture/invariant énonce sa **condition de réfutation**.
- **Interdiction absolue de fabrication** : aucune citation, statistique, API, spécification ou référence inventée. En cas de doute : le dire + piste de vérification. (Voir §10.)

---

## 5. Structure du dépôt

```
.
├── CLAUDE.md                 # ce fichier
├── README.md                 # présentation, statut, build
├── src/
│   ├── main.typ              # point d'entrée (assemble parties + appareil)
│   ├── parties/
│   │   ├── p1-cadre.typ      # Partie I
│   │   ├── p2-fondements.typ # Partie II (τ au Ch. 5, CIA au Ch. 6)
│   │   ├── p3-protocoles.typ
│   │   ├── p4-securite.typ
│   │   ├── p5-gouvernance.typ
│   │   ├── p6-validation.typ
│   │   └── p7-perspectives.typ
│   └── figures/              # diagrammes (Typst natif / Mermaid exporté)
├── lib/
│   ├── template.typ          # styles, mise en page, en-têtes
│   └── canon.typ             # glossaire verrouillé (§2) + macros de termes
├── references.bib            # bibliographie (BibTeX/Hayagriva)
├── docs/
│   ├── plan.md               # plan détaillé 7 parties / 20 chapitres
│   ├── adr/                  # décisions (Architecture Decision Records)
│   └── tracabilite.md        # journal des écarts théorie↔implémentation
└── build/                    # PDF compilé (généré, non versionné)
```

**Règle source de vérité** : un concept = un point de définition (`lib/canon.typ`) ; les chapitres y **réfèrent**, ne le **redéfinissent** pas. Un fichier = un propriétaire (§8).

---

## 6. Chaîne de production (Typst)

```bash
# Compilation
typst compile src/main.typ build/monographie.pdf

# Itération continue
typst watch src/main.typ build/monographie.pdf

# Vérif. polices/dépendances
typst fonts
```

- Cibler une version Typst fixée (consigner dans `README.md` ; **à vérifier** : version courante au moment de l'initialisation).
- Toute macro de terme du canon vit dans `lib/canon.typ` (p. ex. `#tau`, `#i4`, `#cia`) pour garantir la cohérence typographique.
- Diagrammes d'architecture : Typst natif (`cetz`) ou Mermaid exporté en SVG dans `src/figures/`. Décrire chaque figure en commentaire avant de la coder.

---

## 7. Citations et bibliographie

- Style cohérent unique (par défaut : numéroté ou auteur-date — fixer dans `template.typ`).
- Chaque entrée `references.bib` porte un **champ date** ; pour les sources mouvantes (standards, *drafts* IETF), ajouter la **date de consultation** en note.
- Recenser les *Internet-Drafts* actifs sur identité/délégation d'agents avec leur **statut et date** ; ne pas citer un *draft* expiré comme normatif.
- **Aucune référence non vérifiée** ne passe en bibliographie sans le marqueur `% À VÉRIFIER` en commentaire `.bib`.

---

## 8. Modèle d'exécution multi-agent

Lorsqu'une équipe d'agents est orchestrée (chef d'équipe + coéquipiers) :

- **Task list partagée** : le chef d'équipe crée les tâches ; chaque coéquipier *réclame* les siennes.
- **Anti-redondance** : un fichier = un propriétaire ; fusion par le chef d'équipe en étape d'intégration **séquentielle**.
- **Confrontation ciblée** : pour chaque construction du canon (τ, 3 dimensions, I1–I5, frontière de validité, anti-patrons), l'agent « théorie » et l'agent « exécution » échangent **directement** ; tout désaccord est consigné dans `docs/tracabilite.md` comme **écart de traçabilité** — **ne pas le lisser**.
- **Économie de jetons** : limiter les allers-retours inter-agents aux points de confrontation à valeur ; le travail parallèle reste autonome.

---

## 9. Conventions Git et co-paternité

- **Conventional Commits** : `type(portée): sujet` (p. ex. `feat(ch05)`, `docs(plan)`, `fix(bib)`).
- **Co-paternité transparente** : la contribution de Claude est divulguée dans chaque *commit* concerné via le *trailer* :

  ```
  feat(ch06): formaliser l'algèbre d'héritage de garanties (CIA)

  Co-authored-by: Claude <noreply@anthropic.com>
  ```

- **Atomicité** : un *commit* = une unité de sens (un concept, une section, une correction). Pas de *commit* fourre-tout.
- **Statut d'invariant** : tout changement de statut (`Hypothèse`→`Confirmé`/`Réfuté`) exige une **justification empirique citée** dans le message de *commit* et une entrée `docs/adr/`.

---

## 10. Interdits

- **Fabriquer** une citation, un chiffre, une API, une spécification, une version ou une référence. En cas de doute : dire « à vérifier » + piste.
- **Faire dériver** la terminologie du canon (§2) ou redéfinir un concept hors `lib/canon.typ`.
- **Présenter `I4`** (ou tout invariant `Hypothèse`) comme acquis.
- **Confondre interopérabilité** (coopération de systèmes hétérogènes avec **sens préservé**) avec simple **intégration/connectivité**.
- **Figer le paysage protocolaire** sur des connaissances de formation : re-vérifier statut/maturité/convergence (MCP, A2A, ACP, AGNTCY, AG-UI) à la date d'exécution.
- **Lisser les divergences** entre sources ou produire du contenu marketing en guise d'argument scientifique.

---

## 11. Note d'intégration au corpus mère

Si `REPO` doit être un **sous-dossier** de `agbruneau/InteroperabiliteAgentique` plutôt qu'un dépôt distinct :
- placer ce `CLAUDE.md` à la racine du **sous-dossier** (`/monographie-entreprise/CLAUDE.md`) ;
- vérifier qu'il **n'entre pas en conflit** avec un `CLAUDE.md` racine existant (Claude Code applique le plus proche / fusionne selon configuration) ;
- réconcilier le **versionnement des chapitres** : la définition canonique de τ reste chap. III.8 du corpus ; ce sous-dossier y **réfère** et ne la duplique pas.
