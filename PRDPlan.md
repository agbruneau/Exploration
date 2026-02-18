# Livre Blanc — Plan de rédaction

**Goal:** Rédiger l'intégralité du livre blanc « Enterprise Architects Emerge as Strategic AI Advisors » — 13 chapitres, sections liminaires, conclusion et 8 annexes — en respectant les standards définis dans le PRD et le TDM.

**Architecture:** Chaque chapitre est un fichier Markdown autonome dans une arborescence `content/`. La rédaction suit l'ordre argumentatif du PRD (Partie I → V), puis les sections encadrantes (avant-propos, résumé, conclusion), et enfin les annexes. Chaque livrable est vérifié contre les critères de qualité avant commit.

**Références autoritaires:**

- `PRD.md` — Thèse centrale, fil argumentatif, personas, critères de succès
- `TDM_Livre_Blanc_EA_Strategic_AI_Advisors.md` — Structure détaillée des chapitres, instructions de rédaction, sources de recherche consolidées
- `CLAUDE.md` — Standards de rédaction (langue, ton, volume, références, conventions typographiques)

---

## Conventions du plan

### Structure de fichiers cible

```
content/
├── avant-propos.md
├── resume-executif.md
├── partie-1/
│   ├── chapitre-01.md
│   └── chapitre-02.md
├── partie-2/
│   ├── chapitre-03.md
│   ├── chapitre-04.md
│   ├── chapitre-05.md
│   └── chapitre-06.md
├── partie-3/
│   ├── chapitre-07.md
│   ├── chapitre-08.md
│   └── chapitre-09.md
├── partie-4/
│   ├── chapitre-10.md
│   └── chapitre-11.md
├── partie-5/
│   ├── chapitre-12.md
│   └── chapitre-13.md
├── conclusion.md
└── annexes/
    ├── annexe-a-glossaire.md
    ├── annexe-b-referentiel-competences.md
    ├── annexe-c-template-maturite.md
    ├── annexe-d-cartographie-frameworks.md
    ├── annexe-e-matrice-valeur-risque.md
    ├── annexe-f-canevas-cas-usage.md
    ├── annexe-g-patterns-architecturaux.md
    └── annexe-h-bibliographie.md
```

### Critères de vérification par chapitre

Chaque chapitre DOIT satisfaire ces critères avant commit :


| Critère                   | Cible                                           | Commande de vérification                |
| ------------------------- | ----------------------------------------------- | --------------------------------------- |
| Nombre de mots            | ≥ 5 000 (hors figures/tableaux/références)      | `wc -w content/partie-X/chapitre-XX.md` |
| Références                | 15-25, numérotées, fin de chapitre              | Comptage manuel des entrées `[N]`       |
| Figures/tableaux          | ≥ 2-3 par chapitre                              | Recherche `[Figure` et `[Tableau`       |
| Introduction contextuelle | 200-400 mots                                    | Comptage de la section d'introduction   |
| Encadré « Points clés »   | Présent                                         | Recherche `Points clés à retenir`       |
| Transition                | Vers le chapitre suivant                        | Vérification de la dernière section     |
| Encadré « En pratique »   | Parties III et IV seulement                     | Recherche `En pratique`                 |
| Fil argumentatif          | Lié à la thèse (PRD §3)                         | Relecture croisée avec le PRD           |
| Données récentes          | ≥ 70 % sources 2024-2026                        | Audit des dates dans les références     |
| Langue                    | Français canadien, ton scientifique             | Relecture                               |
| Conventions typo          | Termes anglais en *italique*, acronymes définis | Relecture                               |


### Critères pour sections liminaires


| Section         | Volume cible       | Critères spécifiques                                         |
| --------------- | ------------------ | ------------------------------------------------------------ |
| Avant-propos    | 1 500 – 2 500 mots | Contexte personnel/professionnel, motivation du livre blanc  |
| Résumé exécutif | 1 500 – 2 500 mots | Synthèse des 5 parties, thèse centrale, appel à l'action     |
| Conclusion      | 1 500 – 2 500 mots | Synthèse argumentative, vision prospective, appel à l'action |


---

## Tableau de suivi des tâches


| Tâche   | Description                             | Statut     | Lignes | Réf. | Date       | Notes                                  |
| ------- | --------------------------------------- | ---------- | ------ | ---- | ---------- | -------------------------------------- |
| Task 0  | Arborescence du projet                  | COMPLÉTÉ   | —      | —    | 2026-02-17 | 24 fichiers créés                      |
| Task 1  | Ch. 1 — Écart de confiance CEO-CIO      | COMPLÉTÉ   | 275    | 22   | 2026-02-18 | ✓ tous critères                        |
| Task 2  | Ch. 2 — IA comme force de rupture       | COMPLÉTÉ   | 361    | 26   | 2026-02-18 | ✓ tous critères                        |
| Task 3  | Ch. 3 — Évolution du rôle EA            | COMPLÉTÉ   | 329    | 21   | 2026-02-18 | ⚠ format « Points clés » à uniformiser |
| Task 4  | Ch. 4 — EA au centre de la stratégie IA | COMPLÉTÉ   | 334    | 29   | 2026-02-18 | ⚠ format « Points clés » à uniformiser |
| Task 5  | Ch. 5 — Cadres d'analyse pour l'IA      | COMPLÉTÉ   | 414    | 23   | 2026-02-18 | ⚠ format « Points clés » à uniformiser |
| Task 6  | Ch. 6 — Nouvelles compétences EA        | COMPLÉTÉ   | 590    | 36   | 2026-02-18 | ⚠ format « Points clés » à uniformiser |
| Task 7  | Ch. 7 — Architectures IA-first          | COMPLÉTÉ   | 8200   | 25   | 2026-02-18 | ✓ tous critères, 3 fig., 2 tab.        |
| Task 8  | Ch. 8 — EA médiateur du risque IA       | COMPLÉTÉ   | 8635   | 25   | 2026-02-18 | ✓ tous critères, 3 fig., 3 tab.        |
| Task 9  | Ch. 9 — Gouvernance IA et Shadow AI     | COMPLÉTÉ   | 8254   | 25   | 2026-02-18 | ✓ tous critères, 3 fig., 3 tab.        |
| Task 10 | Ch. 10 — Nouveau modèle opérationnel    | COMPLÉTÉ   | 8386   | 26   | 2026-02-18 | ✓ tous critères, 3 fig., 3 tab.        |
| Task 11 | Ch. 11 — Études de cas et patterns      | COMPLÉTÉ   | 8135   | 25   | 2026-02-18 | ✓ tous critères, 3 fig., 4 tab.        |
| Task 12 | Ch. 12 — EA horizon 2028                | COMPLÉTÉ   | 7812   | 26   | 2026-02-18 | ✓ tous critères, 3 fig., 4 tab.        |
| Task 13 | Ch. 13 — Feuille de route               | COMPLÉTÉ   | 8303   | 25   | 2026-02-18 | ✓ tous critères, checklist 29 items    |
| Task 14 | Sections liminaires                     | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ avant-propos + résumé + conclusion   |
| Task 15 | Annexe A — Glossaire                    | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ termes extraits des 13 chapitres     |
| Task 16 | Annexe B — Compétences                  | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ 18 compétences, 3 dimensions         |
| Task 17 | Annexe C — Maturité                     | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ grille 6 piliers × 5 niveaux         |
| Task 18 | Annexe D — Frameworks                   | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ 4 frameworks, guide sélection        |
| Task 19 | Annexe E — Matrice valeur/risque        | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ template + exemple 10 initiatives    |
| Task 20 | Annexe F — Canevas cas d'usage          | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ template + guide + 2 exemples        |
| Task 21 | Annexe G — Patterns architecturaux      | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ 4 patterns, diagrammes, guide        |
| Task 22 | Annexe H — Bibliographie                | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ consolidation 13 chapitres, IEEE     |
| Task 23 | Revue de qualité finale                 | COMPLÉTÉ   | —      | —    | 2026-02-18 | ✓ 154K+ mots, tous critères conformes  |

**Progression :** 24/24 tâches complétées (100 %) — Livre blanc terminé. 154 000+ mots, 13 chapitres, 3 sections liminaires, 8 annexes.

**Anomalie détectée :** Les chapitres 3 à 6 utilisent un format de liste à puces pour la section « Points clés à retenir » au lieu du format encadré utilisé dans les chapitres 1-2. À uniformiser lors de la revue finale (Task 23) ou par une passe de correction dédiée.

**Tâches débloquées par la complétion de la Partie II :** Les annexes B (compétences, dépend Ch. 6) et E (matrice valeur/risque, dépend Ch. 5) peuvent être rédigées en parallèle avec la Partie III.


---

## Task 0 : Créer l'arborescence du projet ✅ COMPLÉTÉ

**Files:**

- Create: `content/avant-propos.md` (fichier vide avec en-tête)
- Create: `content/resume-executif.md`
- Create: `content/partie-1/` à `content/partie-5/` (répertoires)
- Create: `content/conclusion.md`
- Create: `content/annexes/` (répertoire)

**Step 1 : Créer les répertoires**

```bash
mkdir -p content/partie-1 content/partie-2 content/partie-3 content/partie-4 content/partie-5 content/annexes
```

**Step 2 : Créer les fichiers squelettes**

Créer chaque fichier chapitre avec uniquement son en-tête H3 et la structure de sous-sections tirée du TDM (sans contenu). Exemple pour `content/partie-1/chapitre-01.md` :

```markdown
### Chapitre 1 — L'écart de confiance CEO-CIO sur l'IA

<!-- Rôle argumentatif (PRD §3) : Le fossé de confiance CEO-CIO sur l'IA est réel et mesurable. -->

#### Introduction

#### 1.1 Les chiffres qui révèlent le fossé
#### 1.2 Le verdict des CEO
#### 1.3 71 % des tech leaders face aux attentes irréalistes
#### 1.4 Un écart qui dépasse le CIO
#### 1.5 Pourquoi cet écart existe
#### 1.6 McKinsey Global Tech Agenda 2026
#### 1.7 Les conséquences de l'inaction

#### Points clés à retenir

#### Transition
```

Répéter pour les 13 chapitres, les sections liminaires et les 8 annexes — chacun avec son en-tête et sa structure tirée du TDM.

**Step 3 : Vérifier la structure**

```bash
find content -type f -name "*.md" | sort
```

Expected : 24 fichiers (13 chapitres + avant-propos + résumé + conclusion + 8 annexes).

**Step 4 : Commit**

```bash
git add content/
git commit -m "chore: créer l'arborescence et les squelettes du livre blanc"
```

---

## Task 1 : Rédiger le Chapitre 1 — L'écart de confiance CEO-CIO sur l'IA ✅ COMPLÉTÉ

**Files:**

- Modify: `content/partie-1/chapitre-01.md`

**Rôle argumentatif (PRD §3) :** Le fossé de confiance CEO-CIO sur l'IA est réel et mesurable.

**Sections à couvrir (TDM) :**

- 1.1 Les chiffres : 80 % CEO vs 3 % CIO (Gartner 2024-2025)
- 1.2 Le verdict des CEO : 77 % reconnaissent l'ère IA, 44 % font confiance au CIO
- 1.3 71 % des tech leaders face aux attentes irréalistes (Forbes 2026)
- 1.4 L'écart dépasse le CIO : CISO, CDO, C-suite sous pression
- 1.5 Pourquoi cet écart existe : langages, horizons temporels, métriques
- 1.6 McKinsey Global Tech Agenda 2026 : 64 % des entreprises performantes
- 1.7 Conséquences de l'inaction : paralysie, Shadow AI, perte de compétitivité

**Sources de recherche (TDM) :**

- Gartner: CEOs Believe Executive Teams Lack AI Savviness
- Gartner: 3 Trends Driving EA Strategy in 2025
- National CIO Review: CEOs See AI as the Future but Doubt C-Suite Leadership
- Forbes: 71% of Tech Chiefs Say Leadership Has Unrealistic AI Expectations
- CIO.com: Most CEOs Think Their CIOs Lack AI Savviness
- McKinsey Global Tech Agenda 2026
- - sources complémentaires à identifier (cible : 15-25 total)

**Step 1 : Recherche approfondie**

Consulter chaque source listée ci-dessus. Extraire les données quantitatives, les citations clés et les arguments. Identifier les sources complémentaires pour atteindre 15-25 références.

**Step 2 : Rédiger le chapitre**

Rédiger les 7 sections + introduction (200-400 mots) + encadré « Points clés à retenir » + transition vers le chapitre 2. Minimum 5 000 mots. Respecter les conventions de rédaction (CLAUDE.md).

Éléments obligatoires :

- ≥ 2 figures/tableaux (ex. : [Figure 1.1] Écart de perception CEO-CIO, [Tableau 1.1] Données comparatives par rôle C-suite)
- Références numérotées `[1]` à `[N]` en fin de chapitre
- Termes anglais en *italique* à la première occurrence
- Acronymes définis à la première occurrence

**Step 3 : Vérifier les critères de qualité**

```bash
wc -w content/partie-1/chapitre-01.md
```

Expected : ≥ 5 000 mots.

Vérifier manuellement :

- 15-25 références numérotées
- ≥ 2 figures/tableaux
- Introduction 200-400 mots
- Encadré « Points clés à retenir »
- Transition vers le chapitre 2
- Fil argumentatif cohérent avec PRD §3 (fossé réel et mesurable)
- Ton scientifique, pas de langage marketing
- ≥ 70 % sources datées 2024-2026

**Step 4 : Commit**

```bash
git add content/partie-1/chapitre-01.md
git commit -m "feat: rédiger chapitre 1 — écart de confiance CEO-CIO sur l'IA"
```

---

## Task 2 : Rédiger le Chapitre 2 — L'IA comme force de rupture architecturale ✅ COMPLÉTÉ

**Files:**

- Modify: `content/partie-1/chapitre-02.md`

**Rôle argumentatif (PRD §3) :** L'IA amplifie le fossé en bouleversant les fondations architecturales existantes.

**Sections à couvrir (TDM) :**

- 2.1 De l'IA pilote à l'IA en production
- 2.2 Le fossé PoC-Production : 95 % d'échec (MIT/McKinsey)
- 2.3 L'IA générative et les LLM : exigences données, intégration, sécurité
- 2.4 L'IA agentique : architectures autonomes, boucles de rétroaction
- 2.5 La dette technique amplifiée : 62 % des leaders constatent l'inadéquation
- 2.6 L'impératif de composabilité : modulaire, API-first, event-driven
- 2.7 L'architecture comme différenciateur PoC → production

**Sources de recherche (TDM) :**

- CDO Magazine: From AI Workshop to AI Factory
- CIO.com: Agentic AI — It's About the Platform
- Databricks: AI Architecture with Governance
- InfoQ: Agentic AI Architecture Framework
- arXiv: EA as a Dynamic Capability for Scalable GenAI Adoption
- Revolution in AI: AI Performance Gap — 96% Failure Rate
- - sources MIT/McKinsey sur le fossé PoC-Production

**Step 1 : Recherche approfondie**

Consulter les sources. Accent sur les données quantitatives du fossé PoC-Production et les exigences architecturales spécifiques aux LLM et à l'IA agentique.

**Step 2 : Rédiger le chapitre**

≥ 5 000 mots. Introduction + 7 sections + « Points clés » + transition vers chapitre 3.

Éléments obligatoires :

- ≥ 2 figures/tableaux (ex. : [Figure 2.1] Évolution des exigences architecturales IA, [Tableau 2.1] Comparaison IA pilote vs IA en production)
- 15-25 références
- Connexion explicite au chapitre 1 (le fossé CEO-CIO amplifié par les défis architecturaux)

**Step 3 : Vérifier les critères de qualité**

Même checklist que Task 1. Vérifier aussi la transition logique depuis le chapitre 1.

**Step 4 : Commit**

```bash
git add content/partie-1/chapitre-02.md
git commit -m "feat: rédiger chapitre 2 — l'IA comme force de rupture architecturale"
```

---

## Task 3 : Rédiger le Chapitre 3 — L'évolution du rôle EA ✅ COMPLÉTÉ

**Files:**

- Modify: `content/partie-2/chapitre-03.md`

**Rôle argumentatif (PRD §3) :** Le rôle EA évolue déjà vers le conseil stratégique (preuves Forrester, Gartner).

**Sections à couvrir (TDM) :**

- 3.1 Perspective historique : EA comme fonction technique
- 3.2 Le point d'inflexion : l'IA force les conversations stratégiques
- 3.3 De « architect-as-creator » à « architect-as-curator »
- 3.4 Les quatre rôles émergents (Forrester) : value mapper, digital twin strategist, knowledge curator, gardien de la gouvernance
- 3.5 L'architecte augmenté : architecture continue en temps réel
- 3.6 Du « server room » au « boardroom »
- 3.7 L'EA comme traducteur d'intentions business

**Sources clés :**

- Forrester: How Agentic AI Elevates The EA's Role
- Forrester: The Augmented Architect
- ACL Digital: Top 6 EA Trends Shaping 2026
- QualiWare: Key Trends Shaping the EA's Role
- Built In: EA as the Missing Link in Scalable AI
- Gartner: 3 Trends Driving EA Strategy in 2025

**Step 1-4 :** Même séquence que les tâches précédentes (recherche → rédaction ≥ 5 000 mots → vérification → commit).

```bash
git add content/partie-2/chapitre-03.md
git commit -m "feat: rédiger chapitre 3 — évolution du rôle EA vers le conseil stratégique"
```

---

## Task 4 : Rédiger le Chapitre 4 — L'EA au centre de la stratégie IA ✅ COMPLÉTÉ

**Files:**

- Modify: `content/partie-2/chapitre-04.md`

**Rôle argumentatif (PRD §3) :** L'EA est le traducteur naturel entre la stratégie organisationnelle et l'exécution IA.

**Sections à couvrir (TDM) :**

- 4.1 Traducteur stratégique : vision CEO → feuille de route tech
- 4.2 Éclaireur du possible : faisable vs fondations vs risque
- 4.3 Facilitateur d'alignement : langage commun business-IT-données
- 4.4 Architecte de la confiance : crédibilité IA du CIO
- 4.5 Décisions d'investissement : portfolio IA et value streams
- 4.6 Co-conception avec les métiers
- 4.7 Collaboration CIO, CDO, CISO

**Sources clés :**

- Faisal Hoque: Strategic EA for AI Value Creation
- McKinsey: The New CIO Mandate
- CIO.com: EA and Start-up Thinking Drive Strategic Success
- Bizzdesign: AI in EA and Strategic Portfolio Management

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-2/chapitre-04.md
git commit -m "feat: rédiger chapitre 4 — l'EA au centre de la stratégie IA"
```

---

## Task 5 : Rédiger le Chapitre 5 — Cadres d'analyse pour conseiller l'IA ✅ COMPLÉTÉ

**Files:**

- Modify: `content/partie-2/chapitre-05.md`

**Rôle argumentatif (PRD §3) :** Des cadres d'analyse concrets permettent aux EA d'exercer ce rôle de conseil.

**Sections à couvrir (TDM) :**

- 5.1 Cartographie « ambitions IA » vs capacités actuelles
- 5.2 Typologie des usages IA : automatisation, augmentation, agents, produits digitaux
- 5.3 Matrice valeur / risque / délai
- 5.4 Capability-based planning appliqué à l'IA
- 5.5 Business capability heat maps et AI readiness scoring
- 5.6 Priorisation IA (RICE, MoSCoW, ICE)

**Note :** Ce chapitre est fortement lié à l'Annexe E (Matrice valeur/risque/délai) et l'Annexe F (Canevas de cas d'usage). Maintenir la cohérence.

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-2/chapitre-05.md
git commit -m "feat: rédiger chapitre 5 — cadres d'analyse pour conseiller l'IA"
```

---

## Task 6 : Rédiger le Chapitre 6 — Nouvelles compétences de l'architecte stratégique IA ✅ COMPLÉTÉ

**Files:**

- Modify: `content/partie-2/chapitre-06.md`

**Rôle argumentatif (PRD §3) :** Les compétences à acquérir couvrent trois dimensions : technique, business et influence.

**Sections à couvrir (TDM) :**

- 6.1 Modèle de compétences élargi : technique + business + influence
- 6.2 Compétences IA essentielles : AI literacy, prompt engineering, LLMOps, model governance
- 6.3 Compétences business critiques
- 6.4 Compétences analytiques
- 6.5 Risque de l'excès de dépendance à la GenAI
- 6.6 Parcours de montée en compétences
- 6.7 Alliances à construire

**Note :** Fortement lié à l'Annexe B (Référentiel de compétences EA-IA). Maintenir la cohérence.

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-2/chapitre-06.md
git commit -m "feat: rédiger chapitre 6 — nouvelles compétences de l'architecte stratégique IA"
```

---

## Task 7 : Rédiger le Chapitre 7 — Architectures IA-first et fondations nécessaires

**Files:**

- Modify: `content/partie-3/chapitre-07.md`

**Rôle argumentatif (PRD §3) :** Les architectures AI-first sont le socle nécessaire — et l'EA est responsable de leur conception.

**Sections à couvrir (TDM) :**

- 7.1 Données : qualité, gouvernance, data mesh/lakehouse, lignage, MDM
- 7.2 Plateformes : MLOps, LLMOps, intégration SI
- 7.3 Architecture de plateforme agentique
- 7.4 Enterprise AI Fabric
- 7.5 Composable AI Architecture
- 7.6 Modèle « AI Factory » (McKinsey)
- 7.7 Gouvernance technique intégrée

**Sources clés :**

- CDO Magazine: From AI Workshop to AI Factory
- CIO.com: Agentic AI — It's About the Platform
- Databricks: AI Architecture with Governance
- InfoQ: Agentic AI Architecture Framework
- BOC Group: EA Outlook Trends 2025-2026

**Exigence supplémentaire (Partie III) :** ≥ 1 encadré « En pratique » obligatoire.

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification (inclure vérification de l'encadré « En pratique ») → commit.

```bash
git add content/partie-3/chapitre-07.md
git commit -m "feat: rédiger chapitre 7 — architectures IA-first et fondations nécessaires"
```

---

## Task 8 : Rédiger le Chapitre 8 — L'EA comme médiateur du risque IA

**Files:**

- Modify: `content/partie-3/chapitre-08.md`

**Rôle argumentatif (PRD §3) :** L'EA est le médiateur naturel du risque IA (technique, business, humain, réglementaire).

**Sections à couvrir (TDM) :**

- 8.1 Risques techniques : robustesse, model drift, vendor lock-in
- 8.2 Risques business : cannibalisation, dette d'architecture IA, ROI
- 8.3 Risques humains : érosion des compétences, résistance
- 8.4 Risques réglementaires : EU AI Act, GDPR
- 8.5 Framework de médiation : risques techniques ↔ décisions business
- 8.6 Matrice de risques IA vivante

**Exigence supplémentaire (Partie III) :** ≥ 1 encadré « En pratique ».

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-3/chapitre-08.md
git commit -m "feat: rédiger chapitre 8 — l'EA comme médiateur du risque IA"
```

---

## Task 9 : Rédiger le Chapitre 9 — Gouvernance IA et Shadow AI

**Files:**

- Modify: `content/partie-3/chapitre-09.md`

**Rôle argumentatif (PRD §3) :** La gouvernance IA et la lutte contre le Shadow AI sont des territoires naturels de l'EA.

**Sections à couvrir (TDM) :**

- 9.1 État des lieux : 80 % revendiquent, < 50 % maturité mesurable
- 9.2 Six piliers de la gouvernance IA
- 9.3 Modèle de maturité en gouvernance IA
- 9.4 Cadre à trois niveaux pour l'IA agentique
- 9.5 Gouvernance des données comme colonne vertébrale
- 9.6 Shadow AI — L'ampleur : 75 % utilisent l'IA, 78 % avec leurs propres outils
- 9.7 Risques concrets du Shadow AI : 650K$ par brèche
- 9.8 L'interdiction ne fonctionne pas
- 9.9 Transformer le Shadow AI en innovation maîtrisée
- 9.10 Opérationnaliser la gouvernance

**Sources clés :**

- CIO.com: Shadow AI — Hidden Agents
- ISACA: From Shadow IT to Shadow AI
- Liminal: Enterprise AI Governance Guide 2025
- Dataversity: AI Governance Maturity Framework
- Architecture & Governance Magazine: Shadow AI Hidden Risks

**Note :** Chapitre plus long (10 sections). Peut dépasser 5 000 mots significativement.

**Exigence supplémentaire (Partie III) :** ≥ 1 encadré « En pratique ».

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-3/chapitre-09.md
git commit -m "feat: rédiger chapitre 9 — gouvernance IA et Shadow AI"
```

---

## Task 10 : Rédiger le Chapitre 10 — Nouveau modèle opérationnel pour l'EA

**Files:**

- Modify: `content/partie-4/chapitre-10.md`

**Rôle argumentatif (PRD §3) :** Un nouveau modèle opérationnel rend cette transformation viable et pérenne.

**Sections à couvrir (TDM) :**

- 10.1 Trois tendances Gartner 2025 : fédéré, rationalisation, compétences élargies
- 10.2 EA réactive → proactive et prédictive
- 10.3 EA dans le « flow of change »
- 10.4 EA comme « système d'exploitation de l'entreprise digitale »
- 10.5 Intégration TOGAF ADM, Zachman, capability-based planning
- 10.6 Rôles, rituels et artefacts
- 10.7 Métriques de valeur EA
- 10.8 EA Center of Excellence orienté IA

**Sources clés :**

- Gartner: 3 Trends Driving EA Strategy in 2025
- Workday: Digital Transformation Strategies for EAs
- CIO.com: EA and Start-up Thinking Drive Strategic Success

**Exigence supplémentaire (Partie IV) :** ≥ 1 encadré « En pratique ».

**Note :** Fortement lié à l'Annexe D (Cartographie des frameworks EA).

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-4/chapitre-10.md
git commit -m "feat: rédiger chapitre 10 — nouveau modèle opérationnel pour l'EA"
```

---

## Task 11 : Rédiger le Chapitre 11 — Études de cas et patterns réutilisables

**Files:**

- Modify: `content/partie-4/chapitre-11.md`

**Rôle argumentatif (PRD §3) :** Des cas réels et des patterns réplicables valident l'approche proposée.

**Sections à couvrir (TDM) :**

- 11.1 Cas de succès : organisations à forte maturité EA
- 11.2 Pattern « AI Factory » en action (CDO Magazine)
- 11.3 Cas d'échec : VW Cariad — 7,5 milliards $
- 11.4 Cas d'échec récurrents : IA sans architecture
- 11.5 Patterns réutilisables : AI Capability Factory, AI-Ready Domain, Agentic Safe Sandbox, Composable AI Module
- 11.6 Leçons transversales

**Sources clés :**

- CDO Magazine: From AI Workshop to AI Factory
- NineTwoThree: Biggest AI Fails of 2025
- Revolution in AI: AI Performance Gap
- CIO.com: Why EA Needs a New Playbook

**Exigence supplémentaire (Partie IV) :** ≥ 1 encadré « En pratique ».

**Note :** Fortement lié à l'Annexe G (Patterns architecturaux IA).

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-4/chapitre-11.md
git commit -m "feat: rédiger chapitre 11 — études de cas et patterns réutilisables"
```

---

## Task 12 : Rédiger le Chapitre 12 — L'EA de demain : horizon 2028

**Files:**

- Modify: `content/partie-5/chapitre-12.md`

**Rôle argumentatif (PRD §3) :** L'horizon 2028 confirme la tendance et renforce l'urgence du repositionnement.

**Sections à couvrir (TDM) :**

- 12.1 Prévision Gartner : 55 % EA en gouvernance autonome d'ici 2028
- 12.2 Agents IA : 15 % des décisions quotidiennes d'ici 2028
- 12.3 Architecture continue : boucles de rétroaction, gouvernance haute vélocité
- 12.4 EA comme « capacité dynamique » (sensing, seizing, transforming)
- 12.5 Convergence des disciplines : EA, data architecture, AI/ML engineering, platform engineering
- 12.6 Marché des talents : primes 25-50 %, +67 % demande
- 12.7 De l'architecture comme coût à l'architecture comme levier de croissance

**Sources clés :**

- arXiv: EA as a Dynamic Capability for Scalable GenAI Adoption
- BOC Group: EA Outlook Trends 2025-2026
- ACL Digital: Top 6 EA Trends Shaping 2026
- Info-Tech: CIO Priorities 2026

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-5/chapitre-12.md
git commit -m "feat: rédiger chapitre 12 — l'EA de demain, horizon 2028"
```

---

## Task 13 : Rédiger le Chapitre 13 — Feuille de route pour l'élévation stratégique

**Files:**

- Modify: `content/partie-5/chapitre-13.md`

**Rôle argumentatif (PRD §3) :** Une feuille de route concrète permet de passer de la réflexion à l'action.

**Sections à couvrir (TDM) :**

- 13.1 Auto-diagnostic de maturité
- 13.2 Phase 1 — Fondations (0-6 mois)
- 13.3 Phase 2 — Accélération (6-18 mois)
- 13.4 Phase 3 — Transformation (18-36 mois)
- 13.5 Alliances à construire
- 13.6 Facteurs critiques de succès et pièges
- 13.7 Checklist d'auto-évaluation
- 13.8 Appel à l'action

**Note :** Fortement lié à l'Annexe C (Template d'évaluation de maturité). Ce chapitre doit être particulièrement actionnable — le persona principal (EA en transition) doit pouvoir l'utiliser immédiatement.

**Step 1-4 :** Recherche → rédaction ≥ 5 000 mots → vérification → commit.

```bash
git add content/partie-5/chapitre-13.md
git commit -m "feat: rédiger chapitre 13 — feuille de route pour l'élévation stratégique"
```

---

## Task 14 : Rédiger les sections liminaires

**Files:**

- Modify: `content/avant-propos.md`
- Modify: `content/resume-executif.md`
- Modify: `content/conclusion.md`

**Prérequis :** Les 13 chapitres sont rédigés. Les sections liminaires synthétisent et encadrent le contenu existant.

**Step 1 : Rédiger l'avant-propos (1 500-2 500 mots)**

Contenu : contexte de rédaction, motivation du livre blanc, positionnement dans l'espace francophone, public visé, mode d'emploi du document.

**Step 2 : Rédiger le résumé exécutif (1 500-2 500 mots)**

Contenu : synthèse de la thèse centrale, résumé de chaque partie (1-2 paragraphes par partie), principales recommandations, appel à l'action. Doit pouvoir être lu de manière autonome.

**Step 3 : Rédiger la conclusion (1 500-2 500 mots)**

Contenu : rappel de la thèse, synthèse des contributions de chaque partie, vision prospective, appel à l'action final pour les EA et les dirigeants.

**Step 4 : Vérifier les critères**

- Avant-propos : 1 500-2 500 mots
- Résumé exécutif : 1 500-2 500 mots, couvre les 5 parties, thèse explicite
- Conclusion : 1 500-2 500 mots, cohérence avec la thèse et le fil argumentatif
- Ton uniforme, pas de langage marketing

**Step 5 : Commit**

```bash
git add content/avant-propos.md content/resume-executif.md content/conclusion.md
git commit -m "feat: rédiger avant-propos, résumé exécutif et conclusion"
```

---

## Task 15 : Rédiger l'Annexe A — Glossaire des termes clés

**Files:**

- Modify: `content/annexes/annexe-a-glossaire.md`

**Contenu :** Tous les termes techniques, acronymes et concepts clés utilisés dans le livre blanc. Format : terme → définition. Classement alphabétique. Inclure les termes anglais avec leur équivalent français OQLF.

**Méthode :** Extraire systématiquement les termes définis dans chaque chapitre (recherche *italique* et définitions). Consolider dans le glossaire.

**Step 1-3 :** Extraction → rédaction → vérification de couverture → commit.

```bash
git add content/annexes/annexe-a-glossaire.md
git commit -m "feat: rédiger annexe A — glossaire des termes clés"
```

---

## Task 16 : Rédiger l'Annexe B — Référentiel de compétences EA-IA

**Files:**

- Modify: `content/annexes/annexe-b-referentiel-competences.md`

**Contenu :** Matrice détaillée des compétences EA-IA, structurée selon les 3 dimensions du chapitre 6 (technique, business, influence). Pour chaque compétence : description, niveau de maîtrise attendu, méthode d'acquisition suggérée.

**Prérequis :** Le chapitre 6 est rédigé (cohérence croisée).

**Step 1-3 :** Rédaction basée sur le chapitre 6 → vérification cohérence → commit.

```bash
git add content/annexes/annexe-b-referentiel-competences.md
git commit -m "feat: rédiger annexe B — référentiel de compétences EA-IA"
```

---

## Task 17 : Rédiger l'Annexe C — Template d'évaluation de maturité gouvernance IA

**Files:**

- Modify: `content/annexes/annexe-c-template-maturite.md`

**Contenu :** Grille d'évaluation basée sur le modèle de maturité du chapitre 9 (section 9.3) et l'auto-diagnostic du chapitre 13 (section 13.1). Niveaux de maturité, critères d'évaluation, scoring.

**Prérequis :** Chapitres 9 et 13 rédigés.

**Step 1-3 :** Rédaction → vérification cohérence avec chapitres 9 et 13 → commit.

```bash
git add content/annexes/annexe-c-template-maturite.md
git commit -m "feat: rédiger annexe C — template d'évaluation de maturité"
```

---

## Task 18 : Rédiger l'Annexe D — Cartographie des frameworks EA

**Files:**

- Modify: `content/annexes/annexe-d-cartographie-frameworks.md`

**Contenu :** Comparaison structurée de TOGAF, Zachman, Gartner EA Framework, SAFe — avec pour chacun : description, forces/limites, adaptation spécifique à l'IA, recommandation d'usage.

**Prérequis :** Le chapitre 10 est rédigé (section 10.5).

**Step 1-3 :** Rédaction → vérification cohérence avec chapitre 10 → commit.

```bash
git add content/annexes/annexe-d-cartographie-frameworks.md
git commit -m "feat: rédiger annexe D — cartographie des frameworks EA"
```

---

## Task 19 : Rédiger l'Annexe E — Matrice valeur / risque / délai

**Files:**

- Modify: `content/annexes/annexe-e-matrice-valeur-risque.md`

**Contenu :** Template vierge + exemple rempli. Basé sur le cadre présenté dans le chapitre 5 (section 5.3).

**Prérequis :** Le chapitre 5 est rédigé.

**Step 1-3 :** Rédaction → vérification cohérence avec chapitre 5 → commit.

```bash
git add content/annexes/annexe-e-matrice-valeur-risque.md
git commit -m "feat: rédiger annexe E — matrice valeur / risque / délai"
```

---

## Task 20 : Rédiger l'Annexe F — Canevas de cas d'usage IA

**Files:**

- Modify: `content/annexes/annexe-f-canevas-cas-usage.md`

**Contenu :** Template structuré pour documenter un cas d'usage IA : problème, solution IA, architecture cible, risques, métriques, gouvernance. Lié aux chapitres 5 et 11.

**Prérequis :** Les chapitres 5 et 11 sont rédigés.

**Step 1-3 :** Rédaction → vérification → commit.

```bash
git add content/annexes/annexe-f-canevas-cas-usage.md
git commit -m "feat: rédiger annexe F — canevas de cas d'usage IA"
```

---

## Task 21 : Rédiger l'Annexe G — Patterns architecturaux IA réutilisables

**Files:**

- Modify: `content/annexes/annexe-g-patterns-architecturaux.md`

**Contenu :** Inventaire structuré des patterns définis dans le chapitre 11 (section 11.5) : AI Capability Factory, AI-Ready Domain, Agentic Safe Sandbox, Composable AI Module. Pour chaque pattern : contexte, problème, solution, forces, exemples d'application.

**Prérequis :** Le chapitre 11 est rédigé.

**Step 1-3 :** Rédaction → vérification cohérence avec chapitre 11 → commit.

```bash
git add content/annexes/annexe-g-patterns-architecturaux.md
git commit -m "feat: rédiger annexe G — patterns architecturaux IA réutilisables"
```

---

## Task 22 : Rédiger l'Annexe H — Bibliographie et sources de référence

**Files:**

- Modify: `content/annexes/annexe-h-bibliographie.md`

**Contenu :** Consolidation de toutes les références citées dans les 13 chapitres. Format IEEE ou APA adapté. Classement thématique (comme dans le TDM : fossé CEO-CIO, rôle émergent EA, architectures IA-first, gouvernance, cas d'échec, cadres stratégiques).

**Prérequis :** Tous les chapitres sont rédigés.

**Step 1 :** Extraire toutes les références de chaque chapitre.

**Step 2 :** Dédupliquer et consolider.

**Step 3 :** Formater en style IEEE/APA uniforme, classer thématiquement.

**Step 4 :** Vérifier que toutes les références citées dans les chapitres apparaissent dans cette annexe.

**Step 5 :** Commit.

```bash
git add content/annexes/annexe-h-bibliographie.md
git commit -m "feat: rédiger annexe H — bibliographie consolidée"
```

---

## Task 23 : Revue de qualité finale

**Files:**

- Tous les fichiers `content/**/*.md`

**Prérequis :** Toutes les tâches 0-22 sont complétées.

**Step 1 : Vérification quantitative globale**

```bash
# Comptage de mots par chapitre
for f in content/partie-*/chapitre-*.md; do echo "$f: $(wc -w < "$f") mots"; done

# Comptage total
cat content/partie-*/chapitre-*.md | wc -w
```

Expected : ≥ 65 000 mots total, ≥ 5 000 par chapitre.

**Step 2 : Vérification des éléments obligatoires**

Pour chaque chapitre, vérifier :

- Références ≥ 15 par chapitre
- Figures/tableaux ≥ 2 par chapitre
- Encadré « Points clés à retenir »
- Transitions entre chapitres
- Encadrés « En pratique » (Parties III et IV)

**Step 3 : Vérification de cohérence**

- Terminologie cohérente entre chapitres (vérifier avec Annexe A)
- Fil argumentatif traçable (vérifier avec PRD §3)
- Pas de redondances significatives entre chapitres
- Références croisées entre chapitres et annexes cohérentes
- Numérotation des figures et tableaux séquentielle par chapitre

**Step 4 : Vérification éditoriale**

- Ton scientifique uniforme, pas de langage marketing
- Conventions typographiques respectées
- Français canadien (termes OQLF)
- Acronymes définis à la première occurrence par chapitre

**Step 5 : Commit final**

```bash
git add -A content/
git commit -m "chore: revue de qualité finale du livre blanc"
```

---

## Résumé des dépendances

```
Task 0  (arborescence)
  ├── Tasks 1-2   (Partie I : Ch 1-2)
  │     └── Tasks 3-6   (Partie II : Ch 3-6)
  │           └── Tasks 7-9   (Partie III : Ch 7-9, nécessite encadré "En pratique")
  │                 └── Tasks 10-11   (Partie IV : Ch 10-11, nécessite encadré "En pratique")
  │                       └── Tasks 12-13   (Partie V : Ch 12-13)
  │                             └── Task 14   (Sections liminaires : synthèse de tout)
  │
  ├── Task 15  (Annexe A : glossaire — après tous les chapitres)
  ├── Task 16  (Annexe B : compétences — après Ch 6)
  ├── Task 17  (Annexe C : maturité — après Ch 9, 13)
  ├── Task 18  (Annexe D : frameworks — après Ch 10)
  ├── Task 19  (Annexe E : matrice — après Ch 5)
  ├── Task 20  (Annexe F : canevas — après Ch 5, 11)
  ├── Task 21  (Annexe G : patterns — après Ch 11)
  ├── Task 22  (Annexe H : bibliographie — après tous les chapitres)
  │
  └── Task 23  (Revue finale — après tout)
```

**Parallélisation possible :** Les annexes B, D, E, G peuvent être rédigées dès que leurs chapitres prérequis sont terminés, en parallèle avec la rédaction des chapitres suivants.

---

## Volume total estimé


| Section         | Nombre | Mots min/unité | Total min    |
| --------------- | ------ | -------------- | ------------ |
| Chapitres       | 13     | 5 000          | 65 000       |
| Avant-propos    | 1      | 1 500          | 1 500        |
| Résumé exécutif | 1      | 1 500          | 1 500        |
| Conclusion      | 1      | 1 500          | 1 500        |
| Annexes         | 8      | variable       | ~10 000      |
| **Total**       |        |                | **~79 500+** |


