# Skills IA pour pasteurs : édition baptiste réformée francophone

13 outils de flux de travail propulsés par l'IA, conçus pour des pasteurs baptistes réformés francophones. Non des prompts, mais des skills réels, multi-étapes, qui traitent le grain hebdomadaire afin que le pasteur concentre son temps sur la prédication expositive, la prière, les soins pastoraux et le gouvernement de l'assemblée.

Bâti pour [Claude Code](https://claude.ai/code). Fonctionne aussi dans les Projets Claude.ai et dans Cowork mode.

---

## Positionnement doctrinal

Cette édition est une révision complète, une traduction en français canadien et une conformation doctrinale au cadre suivant :

- **Confession :** 1689 London Baptist Confession
- **Doctrines de la grâce :** TULIP (dépravation totale, élection inconditionnelle, rédemption particulière, grâce efficace, persévérance des saints)
- **Distinctifs MacArthur :** prédication expositive verset par verset, cessationnisme, seigneurie de Christ (*Lordship Salvation*), complémentarisme, pluralité d'anciens, dispensationalisme modéré futuriste (divergence assumée avec l'amillénarisme classique du 1689)
- **Herméneutique :** grammatico-historique, intention de l'auteur, *analogia Scripturae*
- **Traduction biblique par défaut :** Nouvelle Édition de Genève 1979 (NEG 1979)
- **Langue :** français canadien (orthographe, vocabulaire, adresse)

Les références doctrinales complètes sont dans `foundation/pastor-foundation/references/` :

- `confession-1689-et-tulip.md`
- `distinctifs-macarthur.md`
- `bible-translations.md`
- `theological-tone.md`
- `banned-phrases.md`

Les skills originaux de Thomas Costello ([REACHRIGHT](https://reachrightstudios.com)) ont servi de base structurelle. Tout contenu théologique, vocabulaire, anti-modèles et cadrages doctrinaux ont été révisés pour cohérence confessionnelle.

---

## Les skills

| Skill | Ce qu'il fait | Fréquence |
|---|---|---|
| **Préparation du sermon** | | |
| `/sermon-research` | Recherche exégétique : commentaires (MNTC, Calvin, Henry, Owen, Lloyd-Jones, NAC, PNTC), contexte historique, études de mots grec/hébreu, questions herméneutiques. Sortie PDF. | Hebdomadaire |
| `/sermon-brainstorm` | Session de remue-méninges interactif produisant un brief de sermon (10 questions incluant la connexion *Soli Deo Gloria*). | Hebdomadaire |
| `/sermon-series` | Planifier une série multi-semaines avec titres, passages et idées maîtresses (privilégie l'exposition livre-par-livre). | Mensuel |
| **Communication écrite** | | |
| `/church-email` | Courriel hebdomadaire : ligne d'objet, prévisualisation, corps. | Hebdomadaire |
| `/announcement-script` | Script d'annonces oral de 60-90 secondes pour le dimanche. | Hebdomadaire |
| `/church-letter` | Lettres pastorales : transitions, mises à jour, célébrations, nouvelles difficiles, discipline d'église. | Au besoin |
| **Réemploi du sermon** | | |
| `/small-group-questions` | Questions de groupe de maison : observation, interprétation, application (méthode inductive). | Hebdomadaire |
| `/sermon-to-blog` | Sermon transformé en article de 800-1200 mots. | Hebdomadaire |
| `/sermon-to-youtube` | Titres, description avec chapitres, étiquettes, miniatures, extrait court-format. | Hebdomadaire |
| **Médias sociaux** | | |
| `/church-social-post` | Publications par plateforme : Facebook, Instagram, X. | 3-5 × /semaine |
| `/social-media-calendar` | Calendrier hebdomadaire ou mensuel ancré sur la prédication en cours. | Hebdomadaire |
| **Rythme pastoral** | | |
| `/midweek-devotional` | Méditation de mi-semaine 200-300 mots : pastorale, personnelle, brève. | Hebdomadaire |
| `/meeting-agenda` | Ordre du jour structuré avec blocs de temps et questions (staff, anciens, diacres, bénévoles). | Hebdomadaire |

---

## Démarrage

### Option 1 : Claude Code (plus simple)

Ouvrir Claude Code et coller :

> Installer les skills IA pour pasteurs depuis le dossier local. Je veux tous les skills.

Claude clonera ou copiera le dépôt et installera la fondation et tous les skills. Pour n'installer qu'une partie, préciser lesquels.

Une fois installés, les utiliser en tapant `/sermon-research`, `/church-email`, etc.

### Option 2 : Installation manuelle (CLI Claude Code)

```bash
# Cloner le dépôt
git clone [URL_DU_DEPOT]

# Copier la fondation (requise pour tous les skills)
cp -r pastor-ai-skills/foundation/pastor-foundation ~/.claude/skills/

# Copier les skills voulus
cp -r pastor-ai-skills/sermon-prep/sermon-research ~/.claude/skills/
cp -r pastor-ai-skills/written-communication/church-email ~/.claude/skills/
cp -r pastor-ai-skills/sermon-repurposing/small-group-questions ~/.claude/skills/
# ... ajouter au besoin
```

### Option 3 : Projets Claude.ai

1. Créer un nouveau projet dans Claude.ai
2. Ouvrir le fichier `SKILL.md` du skill désiré
3. Copier le contenu dans les instructions personnalisées du projet
4. Pour de meilleurs résultats, copier d'abord le contenu de `pastor-foundation/SKILL.md`

---

## Configuration de la fondation

La première utilisation d'un skill lancera la fondation qui demandera quelques détails sur l'assemblée :

- **Nom de l'église** (p. ex. « Église baptiste réformée Nouvelle-Espérance »)
- **Nom du pasteur**
- **Titre du pasteur** (p. ex. « pasteur principal », « ancien enseignant »)
- **Dénomination** (défaut : « baptiste réformée (1689 LBCF) »)
- **Affluence moyenne**
- **Lieu** (ville, province)
- **Traduction biblique préférée** (défaut : NEG 1979)
- **Langue** (défaut : fr-CA)

Ces variables sont définies une fois ; tous les skills les utilisent pour personnaliser la sortie.

---

## Dépendances

La plupart des skills n'ont aucune dépendance. Les skills avec génération PDF requièrent une installation unique :

| Skill | Dépendance | Installation |
|---|---|---|
| `/sermon-research`, `/small-group-questions`, `/announcement-script`, `/church-letter`, `/midweek-devotional`, `/meeting-agenda` | reportlab (Python) | `pip install reportlab` |

Claude Code installera automatiquement à la première utilisation. Pour une installation manuelle, exécuter la commande ci-dessus.

---

## Philosophie

**Outils de flux de travail, non modèles de prompt.** Chaque skill a un processus défini, des règles de format et des normes de qualité intégrées. Le pasteur n'a pas à connaître les meilleures pratiques de marketing par courriel ni le SEO YouTube : le skill les connaît.

**La couche fondation assure la cohérence.** Ton, sensibilité doctrinale et variables d'assemblée se transmettent automatiquement à travers chaque skill.

**Les outils de préparation de sermon aident à la recherche et à la réflexion exégétique. Ils n'écrivent jamais le sermon.** Cela relève du pasteur, sous la conduite de l'Esprit par la Parole. Le skill de recherche creuse les commentaires et le contexte ; le skill de remue-méninges pose des questions. Aucun ne livre un manuscrit.

**Chaque sortie est conçue pour être utilisable telle quelle.** Pas un brouillon à réécrire. Copier, coller, envoyer. Si le pasteur réécrit plus de 20 % du contenu, le skill a raté.

**Fidélité doctrinale non négociable.** Aucun skill n'adoucira la doctrine pour la plateforme, l'algorithme ou le confort du lecteur. Les anti-modèles explicitement interdits dans chaque skill incluent :

- Théologie de la prospérité
- Thérapeutisme moraliste déiste (MTD)
- Charismatisme (prophéties personnelles, dons apostoliques continués)
- Easy-believism (croire sans repentance ni seigneurie)
- Œcuménisme compromettant la justification
- New Perspective on Paul (NPP) remettant en cause la justification par la foi seule
- Sensationnalisme
- Moralisme sans Évangile
- Politique partisane dans la communication ecclésiale

---

## Structure du dépôt

```
pastor-ai-skills/
├── README.md                          # ce fichier
├── LICENSE                            # MIT
├── foundation/
│   └── pastor-foundation/
│       ├── SKILL.md                   # fondation : variables, règles, ton
│       └── references/
│           ├── confession-1689-et-tulip.md
│           ├── distinctifs-macarthur.md
│           ├── bible-translations.md
│           ├── theological-tone.md
│           └── banned-phrases.md
├── sermon-prep/
│   ├── sermon-research/
│   ├── sermon-brainstorm/
│   └── sermon-series/
├── sermon-repurposing/
│   ├── small-group-questions/
│   ├── sermon-to-blog/
│   └── sermon-to-youtube/
├── written-communication/
│   ├── church-email/
│   ├── announcement-script/
│   └── church-letter/
├── social-media/
│   ├── church-social-post/
│   └── social-media-calendar/
├── pastoral-rhythm/
│   ├── midweek-devotional/
│   └── meeting-agenda/
├── shared/
│   └── pdf_utils.py                   # utilitaires reportlab partagés
└── docs/
```

Chaque skill expose un `SKILL.md` (frontmatter YAML + prose) et un `generate-pdf.py` quand la sortie PDF est requise. Les clés JSON des schémas de données sont en anglais pour compatibilité avec les générateurs PDF ; les valeurs sont en français.

---

## Attribution

Base structurelle des skills : Thomas Costello ([REACHRIGHT](https://reachrightstudios.com)), « Pastor AI Skills » (MIT).

Révision, traduction intégrale en français canadien et conformation doctrinale au 1689 LBCF et aux distinctifs John MacArthur : Andre-Guy Bruneau.

Les marques commerciales externes (REACHRIGHT) ont été retirées des sorties par défaut ; les PDF sont aux couleurs de l'église utilisatrice.

---

## Avertissements

- **Les skills ne remplacent pas le pasteur.** Ils réduisent le temps administratif pour libérer du temps d'étude biblique, de prière et de soins pastoraux. Toute décision pastorale, doctrinale, disciplinaire demeure du ressort du conseil des anciens.
- **Les lettres sensibles exigent un discernement humain.** Le skill `/church-letter` signale les cas à risque juridique, mais le conseil des anciens et, au besoin, un conseiller juridique doivent réviser avant envoi.
- **La fidélité doctrinale exige une relecture.** Même si les skills sont conçus pour éviter les dérives, le pasteur demeure responsable de ce qui sort de l'assemblée. Toujours relire avant envoi.
- **L'IA est un outil, non une source de révélation.** Les skills produisent un travail d'assistant de recherche et de rédaction. La révélation est dans l'Écriture seule (*sola Scriptura*).

---

## Licence

MIT. Utilisation libre.

---

## Soli Deo Gloria
