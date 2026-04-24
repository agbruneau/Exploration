# PRD — Landing Web Page « Analyse théologique réformée — Luc-Actes »

> *Coram Deo, soli Deo gloria.*

---

## Métadonnées du document

| Champ              | Valeur                                                                       |
| ------------------ | ---------------------------------------------------------------------------- |
| Type               | Product Requirements Document (PRD)                                          |
| Projet             | Site statique de présentation et de lecture d'`AnalyseTheologique.md`        |
| Version            | 1.1 (revue complémentaire)                                                   |
| Date               | 2026-04-24                                                                   |
| Auteur             | André-Guy Bruneau                                                            |
| Statut             | Brouillon enrichi en attente de revue                                        |
| Changements v1.1   | Ajout §6.4, §7.4, §8.1.0, §8.2.9-11, §10.7-8, §11.8, §13.4, Annexes E-F. Enrichissement §8.1.6, §8.1.7, §8.1.10, §8.1.11. |
| Source de contenu  | `AnalyseTheologique.md` — 1 870 lignes, ~295 KB, ~50 000 mots, en français   |
| Cible déploiement  | GitHub Pages (branche `main`, dossier racine)                                |
| Licence du site    | Reprise de la licence du dépôt (à confirmer en revue)                        |

---

## 1. Résumé exécutif

Construire un **site web statique en deux pages** — une **page-vitrine** (`index.html`) et un **lecteur intégral** (`lecture.html`) — qui présente publiquement et permet la lecture en ligne de l'analyse théologique réformée des écrits lucaniens (Luc-Actes) rédigée par l'auteur.

Le site adopte une **identité visuelle sombre rehaussée d'accents orange ambrés** (« manuscrit nocturne »), une typographie éditoriale dignifiant la gravité du sujet, et reste **100 % statique, sans backend, sans build complexe, sans tracker**. Il se déploie tel quel sur GitHub Pages depuis la branche `main`.

**Promesse au lecteur** : recevoir l'*asphaleia* lucanienne (Luc 1.4) à travers une expérience de lecture longue exemplaire — concentrée, lisible, navigable, accessible (WCAG 2.1 AA).

**Périmètre v1.0** : présentation visuelle, lecture intégrale, table des matières interactive, recherche plein-texte simple, mode lecture concentrée, contrôle de la taille de police, ancres profondes partageables, téléchargement du markdown source.

---

## 2. Contexte et motivation

Le dépôt contient un unique livrable : `AnalyseTheologique.md`, traité théologique de ~50 000 mots couvrant les deux tomes de l'œuvre lucanienne (Évangile selon Luc + Actes des Apôtres) selon la méthode O.I.A. (Observation, Interprétation, Application) appliquée à 49 péricopes, complété d'une introduction magistrale et d'une synthèse systématique en huit *loci* dogmatiques.

À l'état actuel, ce document n'est consultable que sous forme markdown brut depuis GitHub. Cette présentation :

1. **N'est pas optimisée pour la lecture longue** — pas de navigation, pas de mise en page typographique éditoriale, défilement monolithique d'un fichier de 295 KB.
2. **N'est pas accueillante** pour un lecteur arrivant sans contexte — aucun pitch, aucune présentation de la méthode, aucune mise en valeur des passages-clés.
3. **N'est pas partageable** de façon élégante — l'URL GitHub d'un fichier `.md` n'a ni vignette sociale optimisée, ni ancres profondes propres, ni structure pour la recherche.

Une présentation web dédiée résout ces trois manques. Elle constitue par ailleurs un **artefact public** que l'auteur peut référencer, partager et faire évoluer indépendamment de l'éditeur de markdown GitHub.

---

## 3. Vision produit

> *Une lampe ambrée allumée sur un manuscrit théologique.*

Le site doit donner au lecteur l'impression d'**ouvrir un volume soigné**, non de consulter un document technique. La gravitas du contenu (références confessionnelles, exégèse grammatico-historique, vocabulaire grec et latin) appelle une mise en forme respectueuse :

- **Lente** dans le rythme typographique (interlignage généreux, mesure courte, espace blanc abondant)
- **Sombre** mais chaleureuse (charbon profond, jamais bleu froid)
- **Ambrée** dans ses points d'attention (l'orange comme *flamme du candélabre*, *encre dorée*, non comme alerte ou signal publicitaire)
- **Sobre** dans ses ornements (pas de carrousels animés, pas de pop-ups, pas de notifications)
- **Assumée confessionnellement** — la page-vitrine déclare explicitement le cadre réformé classique du document (Westminster, Dort, 1689, NEG 1979 / NA28)

L'expérience cible : un utilisateur qui ouvre la page tard le soir, dans un environnement calme, et qui peut **soit** parcourir la vitrine en quelques minutes, **soit** s'enfoncer dans le lecteur pour deux heures de lecture dense.

---

## 4. Public cible et personae

### 4.1 Persona principal — Le pasteur réformé francophone

- **Profil** : 35-65 ans, pasteur, ancien, prédicateur laïc dans une église réformée, baptiste réformée ou évangélique de tradition confessionnelle francophone (France, Québec, Suisse romande, Belgique, Afrique francophone).
- **Besoin** : Préparer une prédication ou une étude biblique sur une péricope précise de Luc ou Actes ; vérifier l'angle réformé classique sur un passage controversé ; trouver un appui exégétique solide en français.
- **Contexte d'usage** : Bureau pastoral, samedi soir, écran 14"-27", connexion variable.
- **Comportement attendu** : Arrive via lien partagé ou recherche directe d'une péricope ; veut **accéder rapidement** au passage qui l'intéresse (ancre profonde) ; apprécie la possibilité de **télécharger le markdown** pour annotation locale.

### 4.2 Persona secondaire — Le séminariste / catéchumène avancé

- **Profil** : 20-35 ans, en formation théologique réformée (séminaire, faculté, parcours autodidacte sérieux), bilingue ou trilingue (français, anglais, possiblement latin/grec basique).
- **Besoin** : Trouver une analyse rigoureuse, confessionnellement située, avec apparat critique (références grecques, parallèles bibliques, citations confessionnelles) sur un sujet précis.
- **Contexte d'usage** : Mobile et desktop, sessions longues, copie-collage fréquent vers notes personnelles.
- **Comportement attendu** : Utilise **intensément la recherche plein-texte** ; navigue d'une péricope à l'autre via la TOC ; copie des extraits avec leurs ancres pour citation.

### 4.3 Persona tertiaire — Le chrétien curieux ou le lecteur cultivé

- **Profil** : Chrétien engagé, journaliste religieux, étudiant en sciences humaines, lecteur des éditions critiques.
- **Besoin** : Découvrir la posture théologique du corpus, comprendre la méthode, jauger le sérieux du travail avant d'investir du temps de lecture.
- **Contexte d'usage** : Première visite, attention courte, défilement de la landing.
- **Comportement attendu** : Lit la page-vitrine en 2-5 min ; clique éventuellement sur une ou deux péricopes ; ne reviendra que si convaincu.

### 4.4 Anti-personae (publics non visés en v1.0)

- Lecteur monolingue non-francophone — la traduction est hors-périmètre.
- Lecteur cherchant un dévotionnel court, une méditation grand public ou une vulgarisation — le contenu reste dense et technique.
- Polémiste cherchant à débattre — le site n'offre ni commentaires ni forum.

---

## 5. Objectifs et indicateurs de succès

### 5.1 Objectifs (formulation SMART)

1. **Rendre l'analyse lisible en ligne** d'ici la livraison v1.0 sur 100 % des navigateurs cibles (Chrome/Edge/Firefox/Safari, dernières 2 versions majeures), desktop et mobile.
2. **Atteindre un score Lighthouse ≥ 95** en Performance, Accessibilité, Bonnes Pratiques et SEO sur la landing, et **≥ 90** en Performance sur le lecteur (justifié par la charge markdown).
3. **Garantir un Time-to-Interactive < 2 s** sur la landing en 4G simulée modérée.
4. **Respecter WCAG 2.1 niveau AA** sur les deux pages, vérifié par `axe-core` (zéro erreur critique).
5. **Préserver l'intégrité confessionnelle** du document : aucune édition, aucun ajout de contenu théologique, aucun retrait. Le site est un *contenant*, jamais un *commentaire*.

### 5.2 Indicateurs de succès mesurables (sans tracker)

Étant donné l'engagement de confidentialité (§13), les métriques produit reposent sur :

- **Validation technique automatisable** : Lighthouse CI, axe-core CI, validation HTML W3C, contrôle des budgets de poids (cf. §10.3).
- **Recettes manuelles documentées** : checklist d'acceptation (§14) exécutée et cochée à chaque livraison.
- **Feedback qualitatif** : retours via *issues* GitHub (canal volontaire et identifiable, hors tracker).

---

## 6. Périmètre

### 6.1 Dans le périmètre v1.0 (MVP)

**Page-vitrine (`index.html`)** :
- Hero avec titre, sous-titre, trois CTA principaux
- Bloc « Thèse directrice » (citation manifeste)
- Bloc « Méthode O.I.A. » (3 colonnes : Observation / Interprétation / Application)
- Bloc « Corpus d'appui » (Sproul, MacArthur, Westminster, Dort, 1689, NEG 1979, NA28)
- Aperçu de la table des matières (sélection des péricopes phares + lien « Voir les 49 péricopes »)
- Tableau synoptique des divergences (extrait condensé du tableau de la Synthèse)
- Citations marquantes (3-5 *pull-quotes* extraites du document)
- Synthèse en 8 *loci* (preview avec liens vers les sections du lecteur)
- À propos / posture confessionnelle assumée
- Bibliographie sommaire
- Footer avec liens (téléchargement markdown, dépôt GitHub, licence)

**Page-lecteur (`lecture.html`)** :
- Top bar fixe (titre court, contrôles d'affichage)
- Sidebar gauche : table des matières pliable, synchronisée au scroll
- Zone centrale : rendu HTML fidèle de l'intégralité du markdown
- Recherche plein-texte côté client (champ + navigation entre occurrences)
- Mode lecture concentrée (toggle, persistance localStorage)
- Contrôle de la taille de police (3 niveaux, persistance localStorage)
- Ancres profondes copiables sur chaque heading
- Bouton « Haut de page » sur scroll bas

**Transversal** :
- Identité visuelle dark + orange complète et cohérente
- Préservation des emojis distinctifs du document (🏛️ 🔍 📖 🛡️)
- Style typographique distinct pour citations bibliques, termes grecs/latins, versets-pivot
- Métadonnées SEO complètes (Open Graph, Twitter Card, JSON-LD)
- Accessibilité WCAG 2.1 AA
- Aucun tracker, aucun cookie tiers
- Sitemap.xml et robots.txt

### 6.2 Hors-périmètre v1.0 (explicite)

Les éléments suivants sont **délibérément exclus** de la v1.0 et seront, le cas échéant, traités en versions ultérieures :

- Authentification, comptes utilisateur, profils
- Commentaires, annotations partagées, forum
- Export PDF / EPUB généré dynamiquement (le markdown brut téléchargeable suffit pour le MVP ; un PDF artisanal pourra être ajouté en v1.1)
- Traduction (anglais, espagnol, autres) — mono-langue français
- Mode clair / toggle de thème — le dark + orange est l'**unique** identité visuelle (par décision produit)
- Backend, base de données, API
- Service Worker, PWA installable
- Notifications push
- Analytics, même autoportés (Plausible, Umami, etc.)
- CMS, éditeur en ligne, workflow de contribution
- Recherche fuzzy avancée (Lunr, MiniSearch, Pagefind) — la recherche simple sur DOM rendu suffit pour v1.0
- Génération automatique d'autres analyses bibliques (autre projet)
- Intégration avec applications de Bible en ligne (BibleHub, BlueLetterBible) — liens manuels uniquement

### 6.3 Backlog v1.1+ (idées différées, non engagées)

- Service Worker pour cache offline complet (cf. §13.4 pour la décision MVP)
- Génération PDF imprimable artisanale
- Lien BibleHub automatique sur chaque référence biblique (`Luc 1.1` → tooltip + lien)
- Mode impression typographique avancé (la v1.0 fournit un print stylesheet de base, cf. §11.8)
- Flux RSS minimal si d'autres analyses sont publiées ultérieurement
- Recherche fuzzy avancée avec index Pagefind ou MiniSearch
- Note : la navigation séquentielle « péricope précédente/suivante » initialement différée a été **réintégrée au MVP** (cf. §8.2.11) — gain ergonomique majeur pour un coût d'implémentation marginal.

### 6.4 Stratégie de tests (consolidée)

| Type de test                 | Outil                                | Fréquence              | Critère de passage                                |
| ---------------------------- | ------------------------------------ | ---------------------- | ------------------------------------------------- |
| Validation HTML              | [validator.w3.org/nu](https://validator.w3.org/nu) | Avant chaque release | 0 erreur, 0 avertissement bloquant               |
| Validation CSS               | [jigsaw.w3.org/css-validator](https://jigsaw.w3.org/css-validator) | Avant chaque release | 0 erreur (avertissements vendor-prefix tolérés)  |
| Performance + bonnes pratiques | Lighthouse CI (mobile + desktop)   | Avant chaque release   | Cf. budgets §10.3                                |
| Accessibilité automatisée    | `axe-core` CLI ou DevTools           | Avant chaque release   | 0 violation critique, 0 violation sérieuse       |
| Accessibilité manuelle       | NVDA (Windows), VoiceOver (macOS), navigation clavier seule | Avant chaque release majeure | Tous les parcours utilisateur navigables   |
| Cross-browser visuel         | Chrome, Firefox, Safari (desktop) + iOS Safari, Chrome Android | Avant release | Rendu identique à 95 % (variances mineures de font hinting tolérées) |
| Responsive                   | DevTools, viewports : 360, 414, 768, 1024, 1280, 1440, 1920 px | Avant release | Aucun débordement, aucune coupure de contenu |
| Recettes fonctionnelles      | Checklists §14.1-14.5                | À chaque livraison     | 100 % coché                                       |
| Validation Open Graph        | [Facebook OG Debugger](https://developers.facebook.com/tools/debug/) | Avant release | Vignette correcte, métadonnées affichées        |
| Validation JSON-LD           | [Schema Markup Validator](https://validator.schema.org/) | Avant release | 0 erreur                                         |
| Test du mode hors-ligne      | DevTools → Network → Offline         | Avant release          | Cache localStorage actif après 1ʳᵉ visite ; message d'erreur poli sinon |
| Test de la CSP               | DevTools Console (aucun blocage)     | Avant release          | Aucun avertissement CSP en console               |

**Tests automatisables en CI (GitHub Actions, optionnel)** : un seul workflow `validate.yml` enchaînant Lighthouse CI + axe-core sur la build statique. Recommandé mais non bloquant pour v1.0.

---

## 7. Architecture de l'information

### 7.1 Carte du site

```
/                          (landing — index.html)
/lecture.html              (lecteur intégral)
/AnalyseTheologique.md     (source brute, toujours téléchargeable)
/prd.md                    (présent document)
/sitemap.xml               (2 URLs canoniques)
/robots.txt                (permissif)
/assets/                   (CSS, JS, fonts, images)
```

### 7.2 Structure de la landing (sections en ordre vertical)

| # | Section                          | But                                                                  |
| - | -------------------------------- | -------------------------------------------------------------------- |
| 1 | Hero                             | Capter en 5 secondes : titre, sous-titre, CTA primaires              |
| 2 | Thèse directrice                 | Faire résonner la portée doctrinale en une citation manifeste        |
| 3 | Méthode O.I.A.                   | Expliquer la grille de lecture en 3 colonnes                         |
| 4 | Corpus d'appui                   | Établir l'autorité confessionnelle et critique                       |
| 5 | Aperçu de la table des matières  | Donner à voir l'ampleur (49 péricopes) sans l'écraser                |
| 6 | Tableau synoptique des divergences | Différencier la posture (Sproul/MacArthur/Westminster)             |
| 7 | Citations marquantes             | Exposer la voix et le ton du document                                |
| 8 | Synthèse en 8 *loci*             | Annoncer la structure systématique conclusive                        |
| 9 | À propos / posture confessionnelle | Identifier l'auteur et son cadre                                   |
| 10 | Bibliographie sommaire          | Crédibiliser par les sources                                         |
| 11 | Footer / CTA final              | Rediriger vers la lecture, le téléchargement, GitHub                 |

### 7.3 Structure du lecteur

```
┌──────────────────────────────────────────────────────────────┐
│ [☰] Analyse théologique — Luc-Actes        [🔍] [Aa] [👓] [↗] │ ← Top bar fixe (60px)
├────────────┬─────────────────────────────────────┬───────────┤
│            │                                     │           │
│ TOC        │  Contenu rendu                      │ Ancres    │
│ pliable    │  (max-width: 70ch en mode confort,  │ internes  │
│ (260px)    │   84ch en mode ample)               │ (220px,   │
│            │                                     │  ≥1280px) │
│            │                                     │           │
└────────────┴─────────────────────────────────────┴───────────┘
                                                       [↑ haut]
```

- En **mode concentré**, la sidebar gauche se réduit à un rail de 48 px (icônes seules) et la sidebar droite disparaît.
- En **mobile (< 768px)**, la TOC devient un *drawer* déclenché par l'icône hamburger ; la sidebar droite n'apparaît jamais.

### 7.4 Système de breakpoints responsive

| Nom         | Min-width | Cible                                    | Comportements clés                                                       |
| ----------- | --------- | ---------------------------------------- | ------------------------------------------------------------------------ |
| `xs`        | 0         | Mobile portrait (360-413 px)             | 1 colonne, drawer TOC, hero compact, CTA empilés verticalement           |
| `sm`        | 414 px    | Mobile large (414-767 px)                | 1 colonne, espacements légèrement plus généreux                          |
| `md`        | 768 px    | Tablette portrait (768-1023 px)          | 2 colonnes pour méthode O.I.A. et corpus, sidebar lecteur en drawer encore |
| `lg`        | 1024 px   | Tablette paysage / desktop (1024-1279 px) | 3 colonnes méthode, sidebar TOC permanente dans le lecteur               |
| `xl`        | 1280 px   | Desktop confort (1280-1599 px)           | Sidebar droite (ancres internes) apparaît dans le lecteur                |
| `2xl`       | 1600 px   | Desktop large (≥ 1600 px)                | Mesure de lecture max ; padding latéral généreux                         |

**Implémentation CSS** :
- Mobile-first : styles par défaut pour `xs`, surcharges progressives via `@media (min-width: <breakpoint>)`
- Container queries (`@container`) pour les composants réutilisables (cartes méthode, divergences) lorsque pertinent
- Aucune dépendance au User-Agent ; détection purement par `min-width`

**Tokens CSS** :
```css
--bp-sm: 414px;
--bp-md: 768px;
--bp-lg: 1024px;
--bp-xl: 1280px;
--bp-2xl: 1600px;
```

---

## 8. Spécifications fonctionnelles détaillées

### 8.1 Page-vitrine — détails par section

#### 8.1.0 Header de navigation (sticky)

- **Position** : `position: sticky; top: 0;` avec `backdrop-filter: blur(12px)` et fond semi-transparent `rgba(14, 15, 18, 0.85)` pour effet de verre teinté
- **Hauteur** : 64 px
- **Contenu (gauche → droite)** :
  - **Logo / titre court** : « Luc-Actes » en sérif italique ambré (lien vers `#hero`)
  - **Navigation horizontale** (visible ≥ md) : liens d'ancrage vers les sections clés
    - « Méthode » → `#methode`
    - « Aperçu » → `#apercu`
    - « Divergences » → `#divergences`
    - « Synthèse » → `#synthese`
    - « À propos » → `#a-propos`
  - **CTA inline** (à droite, visible ≥ md) : bouton `Lire l'analyse` (variante primaire compacte) → `lecture.html`
- **Mobile (< md)** : le titre court reste à gauche, un menu hamburger à droite ouvre un drawer plein écran avec les liens d'ancrage et le CTA
- **Comportement au scroll** :
  - Au défilement vers le bas après 200 px : ombrage discret apparaît sous le header (`box-shadow: var(--shadow-soft)`)
  - L'item de navigation correspondant à la section visible est mis en évidence (sous-ligne orange ambré, via `IntersectionObserver` sur les sections)
- **Skip link** : « Aller au contenu » en première position du DOM, masqué visuellement, visible au focus clavier

#### 8.1.1 Hero

- **Titre H1** : « Analyse théologique réformée — Luc-Actes »
- **Sur-titre** (eyebrow, petit caps orange) : « Méthode O.I.A. · NEG 1979 / NA28 »
- **Sous-titre** : « Exégèse grammatico-historique des deux tomes lucaniens, dans l'horizon confessionnel classique : Westminster, Dort, 1689 »
- **Visuel** : Fond `--bg-base` avec halo orange diffus très subtil en haut à droite (radial-gradient 800px, opacité 8 %) + filigrane typographique d'une lettre grecque (Λ pour Luc) en très grande taille, opacité 4 %, à l'arrière-plan, sans gêner la lecture
- **CTA primaire** (orange plein, large) : « Lire l'analyse » → `lecture.html`
- **CTA secondaire** (contour orange) : « Télécharger le markdown » → `AnalyseTheologique.md` (download)
- **CTA tertiaire** (lien sobre, soulignement au survol) : « Voir le dépôt sur GitHub » → URL GitHub du dépôt
- **Badge méta** (sous les CTA) : « ~50 000 mots · 49 péricopes · français · libre »

#### 8.1.2 Thèse directrice

- Bloc citation pleine largeur (mais centré, max 80ch), guillemets français typographiques `« »` orange ambré
- Texte (extrait fidèle de la Synthèse §1726-1730) :
  > « L'œuvre lucanienne présente le déploiement souverain, historique et irrésistible du plan rédempteur trinitaire — Père décrétant, Fils accomplissant, Esprit appliquant — depuis l'Incarnation à Bethléem jusqu'à la prédication apostolique à Rome. »
- Attribution discrète : « — Synthèse systématique, *locus* I »

#### 8.1.3 Méthode O.I.A. (3 colonnes)

| 🔍 Observation | 📖 Interprétation | 🛡️ Application |
| --- | --- | --- |
| Texte (NEG 1979), contexte historique, structure littéraire, analyse grammaticale (grec NA28). | Sens auctorial, apport exégétique (Sproul, MacArthur), analogie de la foi, cohérence systématique. | Volet didactique (orthodoxie), élenctique (orthocardie), normatif (orthopraxie). |

- Chaque colonne dans une carte (`--bg-elevated`, radius 8 px, shadow soft)
- Emoji distinctif en grand (32 px) en haut de carte, accentué orange ambré
- Empilement vertical sur mobile (< 768px)

#### 8.1.4 Corpus d'appui

- Liste structurée (pas de logos copyrightés ; pure typographie sur fonds discrets) :
  - **Bible** : NEG 1979, NA28
  - **Études** : Reformation Study Bible (Sproul), MacArthur Study Bible & NT Commentary
  - **Confessions** : Westminster (1647), Dort (1619), 1689 LBC, Heidelberg (1563), Helvetica posterior (1566)
  - **Dogmaticiens** : Calvin, Owen, Turretin, Bavinck, Hodge, Warfield, Berkhof, Murray, Ferguson
- Disposition : grille responsive 2 → 4 colonnes selon viewport

#### 8.1.5 Aperçu de la table des matières

- Présente 8-12 péricopes phares (par ex. : Luc 1.26-38 Annonciation, Luc 4.14-30 Manifeste à Nazareth, Luc 22.14-38 Cène, Luc 24.1-53 Résurrection, Actes 2.1-41 Pentecôte, Actes 9.1-31 Conversion de Saul, Actes 17.16-34 Aréopage, Actes 28.17-31 Rome)
- Chaque entrée : ancre vers la péricope dans `lecture.html#<slug>`
- CTA en bas du bloc : « Voir les 49 péricopes » → `lecture.html`

#### 8.1.6 Tableau synoptique des divergences

- Reprise fidèle du tableau de la Synthèse systématique (§1825-1834 du source), avec colonne supplémentaire pour Sproul afin de matérialiser les zones de convergence/divergence à trois voix :

| *Locus*       | Position retenue (Westminster / réformé classique) | R.C. Sproul                  | John MacArthur                       | Texte-pivot      |
| ------------- | -------------------------------------------------- | ---------------------------- | ------------------------------------ | ---------------- |
| Baptême       | Paedobaptisme alliantiel                          | Paedobaptiste (Westminster)  | Credobaptiste (1689)                 | Ac 2.39 ; 16.15  |
| Millénium     | Amillénarisme                                      | Amillénariste                | Prémillénariste futuriste            | Luc 19.11 ; Ac 1.6-8 |
| Charismata    | Cessationnisme confessionnel                       | Cessationniste modéré        | Cessationniste strict (*Strange Fire*) | Ac 2 ; 1 Cor 13.8 |
| Cène          | Présence spirituelle réelle (Calvin)               | Présence spirituelle réelle  | Mémorialisme affirmé                 | Luc 22.19-20     |
| Israël-Église | Continuité alliantielle                            | Continuité alliantielle      | Distinction dispensationnelle        | Ac 15.14-18 ; Ga 3.29 |
| Justification | Forensique par double imputation, *sola fide*      | Idem (accord total)          | Idem (accord total)                  | Luc 18.14 ; Ac 13.38-39 |
| Élection      | Inconditionnelle (Dort I)                          | Idem (accord total)          | Idem (accord total)                  | Ac 13.48 ; Luc 1.28 |

- **Style** :
  - Header sticky lors du scroll horizontal mobile
  - Colonne « Position retenue » : fond `rgba(255, 122, 26, 0.06)`, weight 500
  - Cellules « Idem (accord total) » : couleur `--text-muted` italique, pour alléger visuellement
  - Sur mobile (< md) : conversion en cartes empilées, une carte par *locus* (titre + 3 lignes Sproul/MacArthur/Position + texte-pivot)

#### 8.1.7 Citations marquantes

- 7 à 9 *pull-quotes* en grande typographie sérif italique, guillemets français orange ambré, attribution péricope en petit caps `--text-secondary`
- **Sélection retenue** (à valider en revue, ordre canonique) :
  1. « *Asphaleia* — la certitude historique et objective de l'Évangile, non l'expérience subjective. » — *Luc 1.1-4*
  2. « Le Saint-Esprit viendra sur toi, et la puissance du Très-Haut te couvrira de son ombre. » — *Luc 1.35*
  3. « Il a renversé les puissants de leurs trônes, et il a élevé les humbles. » — *Magnificat, Luc 1.52*
  4. « Il vous est né un Sauveur, qui est le Christ, le Seigneur. » — *Luc 2.11*
  5. « Aujourd'hui cette parole de l'Écriture, que vous venez d'entendre, est accomplie. » — *Luc 4.21*
  6. « Lorsque le temps où il devait être enlevé du monde approcha, Jésus prit la résolution de se rendre à Jérusalem. » — *Luc 9.51*
  7. « Tous ceux qui étaient destinés à la vie éternelle crurent. » — *Actes 13.48*
  8. « Le Seigneur ouvrit son cœur, pour qu'elle fût attentive à ce que disait Paul. » — *Actes 16.14, conversion de Lydie*
  9. « *Akōlytōs* — sans obstacle. L'Évangile est inarrêtable. » — *Actes 28.31*
- **Disposition** :
  - Sur desktop (≥ lg) : grille 3 colonnes × 3 lignes (9 cartes égales)
  - Sur tablette (md) : grille 2 colonnes
  - Sur mobile : empilement vertical, une citation par bloc pleine largeur
- **Aucun carrousel JS** (cohérent avec les engagements de sobriété et performance)
- Style cellule : fond `--bg-elevated`, padding `--space-8`, bordure gauche 3 px `--accent`, citation principale en italique `--fs-md`, attribution en sans-serif `--fs-xs` `--text-secondary`

#### 8.1.8 Synthèse en 8 *loci* (preview)

- Liste numérotée I-VIII avec titre + résumé d'une ligne :
  1. **Théologie propre et trinitaire** — Le Dieu *boulē*, prescient et souverain.
  2. **Christologie** — Plénitude chalcédonienne et triple *munus*.
  3. **Pneumatologie** — Esprit personnel, divin, protagoniste de la mission.
  4. **Sotériologie** — Monergisme intégral et cinq *soli*.
  5. **Ecclésiologie et sacrements** — Notes, gouvernement presbytéral, paedobaptisme alliantiel.
  6. **Eschatologie** — Royaume inauguré, amillénarisme, parousie corporelle.
  7. **Herméneutique et apologétique** — *Sola Scriptura* et présuppositionnalisme.
  8. **Mission et *Coram Deo*** — Le « il faut » rédemptif, le chapitre 29 ouvert.
- Chaque item lien vers `lecture.html#<slug>` correspondant

#### 8.1.9 À propos / posture confessionnelle

- 2-3 paragraphes sobres :
  - Identification de l'auteur (André-Guy Bruneau)
  - Posture confessionnelle : Westminster Confession of Faith comme étalon, dialogue critique avec Sproul (paedobaptisme commun) et MacArthur (divergences signalées)
  - Méthode et limites : grammatico-historique, *Scriptura Scripturam interpretatur*, refus du subjectivisme

#### 8.1.10 Bibliographie sommaire

- Reprise condensée de la section « Références documentaires » du document source (§1843-1850), structurée en 4 sous-blocs visuels :

**Texte biblique et substrat critique**
- *La Sainte Bible*, Nouvelle Édition de Genève 1979 (NEG 1979), Société Biblique de Genève
- *Novum Testamentum Graece*, 28ᵉ édition (NA28), Deutsche Bibelgesellschaft

**Études bibliques annotées de référence**
- R.C. Sproul (éd.), *The Reformation Study Bible*, Ligonier Ministries
- John MacArthur (éd.), *The MacArthur Study Bible* ; *The MacArthur New Testament Commentary* (vol. Luke et Acts)

**Confessions et symboles**
- *Westminster Confession of Faith* (1647)
- *Canons of Dort* (1619)
- *Second London Baptist Confession* (1689)
- *Heidelberg Catechism* (1563)
- *Confessio Helvetica Posterior* (1566)

**Corpus dogmatique réformé mobilisé**
- Jean Calvin, *Institution de la religion chrétienne* (1559) et Commentaires
- John Owen, *Works*
- François Turretin, *Institutio Theologiae Elenchticae*
- Herman Bavinck, *Reformed Dogmatics* (4 vol.)
- Charles Hodge, *Systematic Theology*
- B.B. Warfield, *The Plan of Salvation*
- Louis Berkhof, *Systematic Theology*
- John Murray, *Redemption Accomplished and Applied*
- Sinclair Ferguson, *The Holy Spirit*

- **Format visuel** : titres d'œuvre en italique sérif, auteurs en sérif romain, dates en `--text-muted`. Pas de lien externe (aucun éditeur n'est cité commercialement) sauf mention « Voir bibliographie complète dans l'analyse » → ancre vers la section « Références documentaires » du lecteur.

#### 8.1.11 Footer

**Structure en 3 zones (desktop)** :

```
┌──────────────────────────────────────────────────────────────────┐
│ Bloc gauche               │ Bloc central       │ Bloc droit       │
│ Titre court + tagline     │ Liens utiles       │ Métadonnées      │
└──────────────────────────────────────────────────────────────────┘
│ Ligne basse pleine largeur : copyright · licence · Coram Deo     │
└──────────────────────────────────────────────────────────────────┘
```

- **Bloc gauche** : « Analyse théologique réformée — Luc-Actes » + tagline « *Coram Deo* · *Asphaleia* · *Soli Deo gloria* »
- **Bloc central** : liste de liens
  - Lire l'analyse intégrale → `lecture.html`
  - Télécharger le markdown source → `AnalyseTheologique.md` (attribut `download`)
  - Dépôt GitHub → URL du dépôt (à confirmer en revue, cf. Annexe D)
  - Signaler une coquille ou suggestion → URL `<repo>/issues/new` (cf. Annexe D)
- **Bloc droit** : métadonnées techniques discrètes
  - Version du contenu : « v1.0 — 2026-04-24 »
  - Stat : « 49 péricopes · ~50 000 mots »
  - Mention : « Site sans cookies, sans tracker. »
- **Ligne basse pleine largeur** :
  - « © 2026 André-Guy Bruneau » (année dynamique JS : `new Date().getFullYear()`, fallback statique « 2026 »)
  - « Licence : <licence à confirmer> » → lien
  - « *Coram Deo, soli Deo gloria.* » en italique ambré

**Mobile (< md)** : empilement vertical des 3 blocs puis ligne basse, padding réduit, taille de police `--fs-xs`.

**Pas de mention « cookies », « analytics », « politique de confidentialité »** — rien à divulguer (cf. §13).

### 8.2 Page-lecteur — détails fonctionnels

#### 8.2.1 Pipeline de rendu markdown

- **Stratégie retenue** : rendu côté client à la première visite, mise en cache `localStorage` pour visites suivantes.
- **Bibliothèques** :
  - `marked` v12+ (CDN jsDelivr ou auto-hébergé, ~30 KB gzip) — parser markdown → HTML
  - `DOMPurify` v3+ (~20 KB gzip) — sanitisation post-rendu, défense en profondeur
- **Flux d'exécution** :
  1. Au chargement, vérifier `localStorage['analyse:html:v<hash>']`
  2. Si présent et hash inchangé, injecter directement dans le DOM
  3. Sinon : `fetch('AnalyseTheologique.md')` → `marked.parse()` → `DOMPurify.sanitize()` → injection + cache
  4. Affichage d'un *skeleton* (3-4 placeholders pulsants) pendant le chargement
  5. Fallback offline : si `fetch` échoue et pas de cache, message d'erreur poli avec lien vers le markdown brut
- **Hash du fichier** : SHA-256 court (8 caractères) calculé au build manuel et injecté dans `lecture.html` comme constante JS, ou recalculé à la volée via SubtleCrypto à la première visite

#### 8.2.2 Rendu des éléments markdown spécifiques

| Élément markdown | Rendu HTML | Style |
| --- | --- | --- |
| `# Titre` (H1) | `<h1>` | Sérif, `--fs-2xl`, orange ambré, marges généreuses |
| `## Section` (H2) | `<h2>` | Sérif, `--fs-xl`, off-white |
| `### Péricope` (H3) | `<h3>` | Sérif, `--fs-lg`, off-white, ancre `#` au survol |
| `#### Sous-titre` (H4) | `<h4>` | Sérif italique, `--fs-md`, ambre clair |
| `**gras**` | `<strong>` | Couleur off-white renforcée (pas orange — réservé aux accents UI) |
| `*italique*` | `<em>` | Couleur `--quote-amber`, italique |
| `« citation »` | `<p>` | Conservé tel quel, mais wrap CSS pour guillemets stylisés |
| `> blockquote` | `<blockquote>` | Bordure gauche orange 3 px, padding gauche, fond très subtil |
| Tableau markdown | `<table>` | Header sticky, lignes alternées discrètes, scroll horizontal mobile |
| Liste à puces | `<ul>` | Puces orange ambré |
| Liste numérotée | `<ol>` | Numéros orange ambré, font-feature-settings `tnum` |
| Code inline | `<code>` | Pas pertinent ici (peu de code dans le document), style minimal |
| Lien | `<a>` | Sous-ligné orange, hover plus brillant |

#### 8.2.3 Génération de la table des matières

- Au post-rendu, parcourir le DOM pour collecter `h2` et `h3`
- Construire un arbre :
  - `h2 "PREMIER TOME — ÉVANGILE SELON LUC"` (collapsible, déployé par défaut)
    - `h3 "Luc 1.1-4 — Prologue dédicatoire"`
    - …
  - `h2 "SECOND TOME — LES ACTES DES APÔTRES"` (collapsible)
  - `h2 "Synthèse systématique Luc-Actes"` (collapsible)
- Chaque item TOC reçoit l'attribut `data-anchor="<slug>"` correspondant à l'ID du heading
- **Slugs** : générés selon convention GitHub (lowercase, accents conservés ou translittérés selon `marked` config — choisir une stratégie unique et la documenter pour la stabilité des liens)
- **Synchronisation au scroll** : `IntersectionObserver` détecte le heading visible et applique la classe `.toc-item--active` (fond `--bg-overlay`, accent orange à gauche)

#### 8.2.4 Recherche plein-texte

- **Champ** : `<input type="search">` dans la sidebar, placeholder « Rechercher dans l'analyse… »
- **Algorithme** :
  - Au changement de valeur (debounce 200 ms), si longueur ≥ 2 caractères :
    - Parcourir tous les nœuds texte du contenu rendu
    - Marquer les occurrences avec `<mark class="search-hit">`
    - Compter les occurrences
    - Afficher « N résultats »
  - Boutons « ↑ » et « ↓ » pour naviguer (scroll smooth vers `<mark>` actif)
  - Touche `Esc` ou bouton « ✕ » pour effacer
- **Insensibilité** : à la casse (`toLocaleLowerCase('fr')`) et aux diacritiques latins (normaliser via `String.prototype.normalize('NFD').replace(/[̀-ͯ]/g, '')`). Les diacritiques grecs polytoniques ne sont pas normalisés en v1.0 (suffisant : la recherche fonctionne sur la translittération latine donnée systématiquement à côté du grec dans le document).
- **Performance** : opérer sur le DOM rendu pour éviter de tout sérialiser ; limiter à 1 000 occurrences max avec message d'avertissement

#### 8.2.5 Mode lecture concentrée

- **Toggle** : icône 👓 dans la top bar (ou pictogramme Lucide `eye-off`)
- **Effets** :
  - Sidebar gauche réduite à un rail de 48 px (icônes seules : hamburger pour ouvrir, recherche, taille de police)
  - Sidebar droite (ancres internes) cachée
  - Largeur de lecture portée à `max-width: 84ch`
  - Fond légèrement plus profond (`--bg-base` → `#0A0B0E`)
  - Lueur orange discrète sous les paragraphes les plus importants (versets-pivot)
- **Persistance** : `localStorage['analyse:focusMode'] = 'true' | 'false'`

#### 8.2.6 Contrôle de la taille de police

- **Bouton** : icône `Aa` dans la top bar, ouvre un menu déroulant à 3 options
- **Niveaux** :
  - `compact` : `--fs-base` = 17 px (1.0625 rem)
  - `confort` (défaut) : `--fs-base` = 19 px (1.1875 rem)
  - `ample` : `--fs-base` = 22 px (1.375 rem)
- **Implémentation** : ajout d'une classe `.text-size--<niveau>` sur `<html>`, override du token `--fs-base`
- **Persistance** : `localStorage['analyse:textSize']`

#### 8.2.7 Ancres profondes copiables

- Sur chaque heading `h2`, `h3`, `h4` au sein du contenu rendu, ajouter au survol un bouton « # » qui copie l'URL avec ancre dans le presse-papier (`navigator.clipboard.writeText`) et affiche un toast 1.5 s « Lien copié »
- Sur arrivée avec ancre dans l'URL (`location.hash`), scroll smooth vers la cible après hydration

#### 8.2.8 Bouton « Haut de page »

- Apparition lorsque `window.scrollY > 600 px`
- Position : flottant bas-droite, `bottom: 24px; right: 24px`
- Cercle 48 px, fond `--bg-elevated`, bordure orange, icône flèche haut
- Au clic : `window.scrollTo({ top: 0, behavior: 'smooth' })`

#### 8.2.9 États de chargement et d'erreur

Le lecteur charge un fichier markdown de ~295 KB et le rend côté client. Les états transitoires et d'échec doivent être conçus avec autant de soin que l'état nominal.

**État A — Premier chargement (cache vide)**
- À l'instant `T0`, afficher immédiatement :
  - Top bar fonctionnelle (titre, contrôles désactivés en gris)
  - Sidebar TOC vide avec skeleton (4 placeholders pulsants : 1 large, 3 indentés)
  - Zone centrale : skeleton de péricope (1 ligne titre 60 % largeur, 8 lignes paragraphe largeur variable)
  - Animation `pulse` (opacité oscillant 0.4 → 0.7) à 1.5 s, désactivée si `prefers-reduced-motion: reduce`
- À l'instant `T_fetch_complete + render` : remplacement du skeleton par le contenu rendu en `transition: opacity 200ms`

**État B — Visites suivantes (cache localStorage actif)**
- Hydratation immédiate (< 50 ms) depuis le cache
- Pas de skeleton visible (pas de FOUC)
- Vérification asynchrone du hash en arrière-plan ; si dérive, message non-bloquant en haut « Le contenu a été mis à jour. [Recharger] »

**État C — Échec de fetch (offline + cache vide)**
- Bandeau pleine largeur sur fond `--bg-elevated`, bordure orange à gauche :
  - Icône `wifi-off` Lucide
  - Titre : « Lecture hors-ligne indisponible »
  - Texte : « Cette page nécessite une connexion à la première visite. Vous pouvez aussi télécharger directement le markdown source. »
  - CTA : « Télécharger le markdown » (lien vers `AnalyseTheologique.md`) + « Réessayer » (recharge)
- TOC sidebar vide avec message « Indisponible hors-ligne »

**État D — Recherche sans résultat**
- Sous le champ de recherche : « Aucun résultat pour « *<terme>* ». »
- Suggestion : « Essayez avec moins de caractères ou sans accents. »

**État E — Recherche limitée à 1 000 résultats**
- Banner discret sous le champ : « 1 000+ occurrences trouvées. Affinez votre recherche. »

**État F — Erreur JS critique (ex. localStorage corrompu)**
- Message en haut de page : « Une erreur est survenue. [Effacer les préférences et recharger] »
- Bouton qui exécute `localStorage.removeItem('analyse:*')` puis `location.reload()`

**Critères transversaux** :
- Aucun message d'erreur ne contient de jargon technique (pas de codes HTTP, pas de stack traces)
- Tous les messages sont en français
- Tous les messages annoncés via `aria-live="polite"` pour les lecteurs d'écran

#### 8.2.10 Indicateur de progression de lecture

- Barre fine (3 px) en haut de la fenêtre, juste sous la top bar
- Largeur proportionnelle à `window.scrollY / (document.documentElement.scrollHeight - window.innerHeight)`
- Couleur `--accent`, `transition: width 100ms linear`
- En mode lecture concentrée, la barre devient plus discrète (1 px, opacité 0.5)
- Désactivée si `prefers-reduced-motion: reduce`
- Implémentation : single `<div>` positionné fixe, mise à jour via `requestAnimationFrame` throttlé sur `scroll`

**But** : signalisation passive et non-intrusive de la progression dans un document long, particulièrement utile pour les sessions de lecture étendues.

#### 8.2.11 Navigation séquentielle entre péricopes

Initialement différée en backlog v1.1, **réintégrée au MVP** car le coût d'implémentation est faible (~1-2 h) et le gain ergonomique majeur pour le persona principal (pasteur préparant un sermon — passe d'une péricope à l'autre).

**Mécanisme** :
- À la fin de chaque section `<h3>` (péricope) du contenu rendu, injection automatique d'un bloc de navigation séquentielle après le dernier élément avant le prochain `<h3>`
- Bloc :
  ```
  ┌─────────────────────────────────────────────────────────┐
  │ ← Péricope précédente               Péricope suivante → │
  │ Luc 1.1-4 — Prologue                Luc 1.26-38 — Annonciation │
  └─────────────────────────────────────────────────────────┘
  ```
- Style : 2 boutons côte à côte, fond `--bg-elevated`, bordure 1 px `--rule`, padding `--space-4`, gap `--space-4`
- Sur mobile : empilement vertical (suivante en haut, précédente en bas)
- Au clic : navigation vers l'ancre correspondante avec `scrollIntoView({ behavior: 'smooth', block: 'start' })`
- Sur la première péricope : seul « Suivante » est visible
- Sur la dernière péricope (Actes 28.17-31) : seul « Précédente » est visible, suivie d'un message « Vous avez atteint la fin de l'analyse. [Retour à l'introduction] »

**Implémentation** : module `assets/js/modules/sequential-nav.js` qui parcourt la liste des `<h3>` collectés par le module TOC, injecte les boutons aux emplacements correspondants après le rendu.

---

## 9. Identité visuelle et système de design

### 9.1 Concept directeur — « Manuscrit nocturne »

La page évoque un manuscrit théologique consulté à la lumière d'une lampe ambrée, de nuit. **L'orange n'est ni technologique ni publicitaire** : il est *flamme du candélabre*, *encre dorée*, *braise des veillées d'étude*. **Le sombre n'est pas industriel** : il est *parchemin retourné*, *atrium silencieux*, *ciel de Bethléem*. Aucun élément ne doit suggérer une *interface SaaS* ou une *landing tech*. Le registre visuel est éditorial-confessionnel.

### 9.2 Palette de couleurs

| Token CSS              | Hex                          | Rôle                                          |
| ---------------------- | ---------------------------- | --------------------------------------------- |
| `--bg-base`            | `#0E0F12`                    | Fond global (charbon profond)                 |
| `--bg-elevated`        | `#16181D`                    | Cartes, sidebars                              |
| `--bg-overlay`         | `#1E2128`                    | Hover, état actif                             |
| `--text-primary`       | `#EDE6D8`                    | Corps de texte (off-white chaud, lisibilité longue) |
| `--text-secondary`     | `#B5AC9A`                    | Métadonnées, légendes                         |
| `--text-muted`         | `#7A7466`                    | Notes, footer                                 |
| `--accent`             | `#FF7A1A`                    | Orange principal (CTA, liens, accents)        |
| `--accent-hover`       | `#FF924A`                    | Hover orange                                  |
| `--accent-soft`        | `#A85410`                    | Orange profond (badges, fonds doux)           |
| `--accent-glow`        | `rgba(255, 122, 26, 0.25)`   | Halos, focus rings                            |
| `--quote-amber`        | `#E8B65A`                    | Citations grecques/latines, versets-pivot     |
| `--rule`               | `#2B2E36`                    | Filets, séparateurs                           |
| `--success` (réservé)  | `#7BB36A`                    | Très peu utilisé                              |
| `--danger` (réservé)   | `#D55C5C`                    | Très peu utilisé                              |

**Contrastes WCAG (vérifiés)** :
- `--text-primary` sur `--bg-base` : **13.5:1** (AAA texte normal et large)
- `--text-secondary` sur `--bg-base` : **8.2:1** (AAA)
- `--accent` sur `--bg-base` : **6.2:1** (AA texte normal, AAA texte large ≥ 18 px)
- `--quote-amber` sur `--bg-base` : **9.1:1** (AAA)

**Règle d'or** : le orange `--accent` ne doit **jamais** servir de fond pour du texte long. Réservé aux CTA, liens, accents typographiques courts, bordures décoratives.

### 9.3 Typographie

#### 9.3.1 Familles

- **Sérif éditoriale (corps et titres)** : *Source Serif 4* (Adobe, OFL), fallback *Crimson Pro*, *Georgia*, `serif`
  - Justification : adaptée à la lecture longue, supporte un corpus français riche, glyphes pour majuscules accentuées propres
- **Caractères grecs polytoniques** : *Cardo* (OFL) ou *Gentium Plus* (OFL), spécifiquement appelée pour les `<span lang="grc">` ou via `unicode-range` dans `@font-face`
- **Sans-serif (UI)** : *Inter* (OFL), fallback `system-ui`, `-apple-system`, `BlinkMacSystemFont`, `Segoe UI`, `sans-serif`
  - Usage : boutons, top bar, sidebar TOC, métadonnées, badges
- **Monospace** : non utilisée (le document ne contient pas de code)

#### 9.3.2 Échelle modulaire (ratio 1.250 « Major Third »)

| Token          | Taille (rem) | Taille (px à 16px base) | Usage                            |
| -------------- | ------------ | ----------------------- | -------------------------------- |
| `--fs-xs`      | 0.8          | 12.8                    | Légendes, badges, footer         |
| `--fs-sm`      | 1.0          | 16                      | Métadonnées, UI, boutons         |
| `--fs-base`    | 1.1875       | 19                      | Corps de texte (lecteur)         |
| `--fs-md`      | 1.4375       | 23                      | Sous-titres internes             |
| `--fs-lg`      | 1.8125       | 29                      | Titres de péricope (h3)          |
| `--fs-xl`      | 2.25         | 36                      | Titres de section (h2)           |
| `--fs-2xl`     | 3.5          | 56                      | Titre hero (h1)                  |

#### 9.3.3 Hauteurs de ligne et autres

- `--lh-body` : `1.7` (corps)
- `--lh-heading` : `1.25` (titres)
- `--lh-tight` : `1.15` (display)
- `letter-spacing` titres : `-0.01em` (légère contraction)
- `font-feature-settings` corps : `"liga", "kern", "onum"` (vieux chiffres pour intégration au texte)

#### 9.3.4 Mesure de lecture

- Mode confort : `max-width: 70ch`
- Mode ample : `max-width: 84ch`
- Mode compact : `max-width: 60ch`

### 9.4 Système d'espacement (échelle 4 px)

| Token          | Valeur |
| -------------- | ------ |
| `--space-1`    | 4 px   |
| `--space-2`    | 8 px   |
| `--space-3`    | 12 px  |
| `--space-4`    | 16 px  |
| `--space-6`    | 24 px  |
| `--space-8`    | 32 px  |
| `--space-12`   | 48 px  |
| `--space-16`   | 64 px  |
| `--space-24`   | 96 px  |
| `--space-32`   | 128 px |

### 9.5 Rayons et ombres

| Token                | Valeur                                                     |
| -------------------- | ---------------------------------------------------------- |
| `--radius-sm`        | `4px`                                                      |
| `--radius-md`        | `8px`                                                      |
| `--radius-lg`        | `16px`                                                     |
| `--radius-pill`      | `9999px`                                                   |
| `--shadow-soft`      | `0 1px 0 0 rgba(255,255,255,0.04) inset, 0 4px 12px rgba(0,0,0,0.3)` |
| `--shadow-card`      | `0 1px 0 0 rgba(255,255,255,0.04) inset, 0 8px 24px rgba(0,0,0,0.4)` |
| `--shadow-floating`  | `0 12px 40px rgba(0,0,0,0.5)`                              |
| `--ring-focus`       | `0 0 0 3px var(--accent-glow)`                             |

### 9.6 Composants UI

#### 9.6.1 Boutons (3 variantes)

- **Primaire** (`.btn-primary`) : fond `--accent`, texte `#0E0F12`, hover `--accent-hover`, focus `--ring-focus`, padding `12px 24px`, radius `--radius-md`, font sans-serif `--fs-sm`, weight 600
- **Secondaire** (`.btn-secondary`) : fond transparent, bordure 1.5 px `--accent`, texte `--accent`, hover fond `--accent-glow`
- **Tertiaire** (`.btn-tertiary`) : pur lien souligné, sans fond ni bordure

#### 9.6.2 Cartes

- Fond `--bg-elevated`, bordure 1 px `--rule`, radius `--radius-md`, padding `--space-6`, ombre `--shadow-soft`
- Hover (cartes cliquables) : translation Y de -2 px, ombre `--shadow-card`

#### 9.6.3 Badges

- Padding `4px 10px`, radius `--radius-pill`, font sans-serif `--fs-xs`, weight 500
- Variantes : `default` (bord `--rule`), `accent` (fond `--accent-soft`, texte `#FFE4D0`), `muted` (fond `--bg-overlay`, texte `--text-secondary`)

#### 9.6.4 Tableaux

- `<table>` : largeur 100 %, border-collapse separate, border-spacing 0
- `<thead>` : sticky top, fond `--bg-elevated`, font sans-serif `--fs-sm`, weight 600, padding `12px 16px`
- `<tbody> tr` : alternance `--bg-base` / `--bg-elevated` (zebra subtil)
- `<td>` : padding `12px 16px`, bordure-bas 1 px `--rule`
- Mobile (< 768px) : `overflow-x: auto` sur conteneur, scroll horizontal avec ombrage de bord

#### 9.6.5 Citations bibliques

- Détection : paragraphes contenant `« … »` ou versets-pivot identifiés par les marqueurs `**Versets-pivot**`
- Style : padding gauche `--space-4`, bordure gauche 3 px `--accent`, fond `rgba(255, 122, 26, 0.04)`, italique, color `--text-primary`
- Numéros de versets (si rendus en gras dans le source) : `--accent-soft`, weight 700

#### 9.6.6 Termes grecs et latins

- Détection : `<em>` simples (italique markdown) — déjà stylisés `--quote-amber`
- Optionnel : si on enrichit la sortie via post-traitement, balisage `<span lang="grc">` ou `<span lang="la">` avec familles dédiées

#### 9.6.7 Sidebar TOC (lecteur)

- Largeur 260 px (mode confort), 48 px (mode concentré, rail icônes)
- Fond `--bg-elevated`, bordure droite 1 px `--rule`
- Items : padding `8px 12px`, font sans `--fs-sm`, hover `--bg-overlay`
- Item actif : bordure gauche 3 px `--accent`, fond `--bg-overlay`, texte `--text-primary`, weight 600
- Items de groupe (Premier Tome / Second Tome / Synthèse) : font weight 700, casse haute, espacement lettres `+0.05em`, color `--text-secondary`

#### 9.6.8 Modale (réservée à l'aide / raccourcis)

- Overlay `rgba(0,0,0,0.6)`, `backdrop-filter: blur(8px)`
- Contenu : centré, max-width 480 px, fond `--bg-elevated`, padding `--space-8`, radius `--radius-lg`, ombre `--shadow-floating`
- Fermeture : `Esc`, clic sur overlay, bouton `✕`

### 9.7 Iconographie

- **Bibliothèque** : *Lucide* (MIT license, ~1 200 icônes, format SVG inline)
- **Icônes principales utilisées** :
  - `menu` (hamburger TOC mobile)
  - `search` (recherche)
  - `type` (taille de police) ou « Aa » texte
  - `eye-off` (mode concentré) ou 👓 emoji
  - `arrow-up` (haut de page)
  - `download` (téléchargement)
  - `external-link` (lien externe)
  - `copy` (copier ancre)
  - `chevron-right` / `chevron-down` (collapse TOC)
- **Emojis distinctifs du contenu** : 🏛️ 🔍 📖 🛡️ — **conservés à l'identique**, pas remplacés (ils font partie de l'identité éditoriale du document)

### 9.8 Mouvement et transitions

- **Durées standards** :
  - `--motion-quick` : 150 ms (micro-interactions, hover)
  - `--motion-base` : 250 ms (toggles, drawers)
  - `--motion-slow` : 400 ms (transitions de page, fades majeurs)
- **Easing par défaut** : `cubic-bezier(0.4, 0, 0.2, 1)` (ease-out)
- **Respect strict de `prefers-reduced-motion: reduce`** : toutes les transitions et animations non essentielles désactivées (`transition: none !important`, `animation: none !important`)

### 9.9 Mode lecture sombre uniquement

Décision produit ferme : **pas de mode clair, pas de toggle de thème**. Le dark + orange est l'**unique** identité du site, cohérente avec le concept « manuscrit nocturne ». Justification : (1) cohérence éditoriale forte ; (2) simplicité d'implémentation ; (3) le contenu théologique se prête à la lecture concentrée nocturne ; (4) l'absence de toggle évite des configurations conflictuelles avec le `prefers-color-scheme`.

`<meta name="color-scheme" content="dark">` déclaré pour signaler la cohérence aux navigateurs.

---

## 10. Spécifications techniques

### 10.1 Stack

- **HTML5** sémantique strict
- **CSS moderne** : variables CSS, grid, flexbox, container queries (avec fallbacks media queries), `:has()` (avec dégradation)
- **JavaScript ES2022 vanilla** : modules natifs (`<script type="module">`), pas de bundler en MVP
- **Aucune dépendance npm en runtime**
- **Deux bibliothèques tierces auto-hébergées** sur le lecteur uniquement (téléchargées une fois, versionnées dans le dépôt, jamais servies par un CDN tiers) :
  - `marked` v12+ — copie figée dans `assets/vendor/marked.esm.min.js` (~30 KB gzip)
  - `DOMPurify` v3+ — copie figée dans `assets/vendor/purify.min.js` (~20 KB gzip)
- **Polices** : auto-hébergées dans `assets/fonts/` (pas de Google Fonts en CDN — confidentialité)
- **Justification** : aucun appel réseau vers un domaine tiers, conforme à la CSP `'self'` stricte (§10.6) et à l'engagement de confidentialité (§13.1)

### 10.2 Structure de fichiers

```
/
├── index.html                    Landing
├── lecture.html                  Lecteur intégral
├── AnalyseTheologique.md         Source contenu (intacte)
├── prd.md                        Présent document
├── README.md                     Présentation du dépôt (à mettre à jour)
├── sitemap.xml                   2 URLs canoniques
├── robots.txt                    Permissif
├── assets/
│   ├── css/
│   │   ├── tokens.css            Variables CSS (palette, typo, espacement)
│   │   ├── base.css              Reset, typographie de base, body
│   │   ├── components.css        Boutons, cartes, badges, tableaux
│   │   ├── landing.css           Spécifique landing
│   │   └── lecture.css           Spécifique lecteur
│   ├── js/
│   │   ├── landing.js            Comportements landing (scroll, year)
│   │   ├── lecture.js            Orchestrateur lecteur
│   │   └── modules/
│   │       ├── render.js         marked + DOMPurify
│   │       ├── toc.js            Génération + sync scroll
│   │       ├── search.js         Recherche plein-texte
│   │       ├── prefs.js          localStorage : focus, taille
│   │       └── anchors.js        Copie ancre + scroll smooth
│   ├── vendor/
│   │   ├── marked.esm.min.js     Pinned version
│   │   └── purify.min.js         Pinned version
│   ├── fonts/
│   │   ├── source-serif-4-regular.woff2
│   │   ├── source-serif-4-italic.woff2
│   │   ├── source-serif-4-700.woff2
│   │   ├── inter-400.woff2
│   │   ├── inter-600.woff2
│   │   └── cardo-regular.woff2     Pour grec polytonique
│   ├── img/
│   │   └── og-image.png            1200×630, généré
│   └── icons/
│       ├── favicon.svg
│       ├── favicon-32.png
│       └── apple-touch-icon.png
```

### 10.3 Performance — budgets stricts

| Métrique                    | Landing       | Lecteur       |
| --------------------------- | ------------- | ------------- |
| HTML transféré              | ≤ 30 KB       | ≤ 25 KB       |
| CSS critique inline         | ≤ 8 KB        | ≤ 8 KB        |
| CSS total                   | ≤ 25 KB       | ≤ 35 KB       |
| JS bloquant (head, no defer)| 0 KB          | 0 KB          |
| JS différé total            | ≤ 5 KB        | ≤ 90 KB (incl. marked + purify) |
| Polices critiques (preload) | ≤ 60 KB total | ≤ 60 KB total |
| Markdown source téléchargé  | n/a           | ~295 KB (cached) |
| **Largest Contentful Paint**| **< 1.5 s**   | **< 2.5 s**   |
| **Time to Interactive**     | **< 2.0 s**   | **< 3.0 s**   |
| **Cumulative Layout Shift** | **< 0.05**    | **< 0.05**    |
| **Total Blocking Time**     | **< 200 ms**  | **< 400 ms**  |
| Score Lighthouse Performance| ≥ 95          | ≥ 90          |
| Score Lighthouse Accessibility | ≥ 95       | ≥ 95          |
| Score Lighthouse Best Practices | ≥ 95      | ≥ 95          |
| Score Lighthouse SEO        | ≥ 95          | ≥ 95          |

**Optimisations prescrites** :
- `<link rel="preload" as="font" type="font/woff2" crossorigin>` pour fonts critiques au-dessus de la ligne de flottaison
- `<link rel="preconnect">` non utilisé (pas de tiers)
- `font-display: swap` sur toutes les `@font-face`
- Images SVG inline pour icônes critiques (favicon, hero ornement)
- Image OG en PNG optimisé (≤ 80 KB)
- Compression Brotli : automatique sur GitHub Pages
- HTTP/2 : automatique sur GitHub Pages
- Cache headers : maîtrisés par GitHub Pages (1 h par défaut sur HTML, 1 an sur assets via filename versioning manuel si nécessaire)
- Code splitting JS : modules natifs ES, chargement à la demande pour `search.js` (lazy via dynamic import au focus du champ)

### 10.4 Compatibilité navigateurs

- **Cibles supportées** :
  - Chrome / Edge ≥ 109 (janv. 2023)
  - Firefox ≥ 110 (févr. 2023)
  - Safari ≥ 16 (sept. 2022)
  - iOS Safari ≥ 16
  - Android Chrome ≥ 109
- **Non supportés** : IE11, Opera Mini, navigateurs antérieurs aux versions ci-dessus
- **Dégradation gracieuse** : si `IntersectionObserver` ou `:has()` indisponible, fonctionnalités non-essentielles désactivées proprement (TOC sync scroll devient statique, etc.)

### 10.5 Cache et révision du contenu

- Le markdown source `AnalyseTheologique.md` est servi tel quel par GitHub Pages
- Le hash du fichier est calculé manuellement à chaque mise à jour majeure et injecté dans `lecture.html` comme constante `const CONTENT_HASH = 'xxxxxxxx';`
- La clé de cache `localStorage` inclut ce hash : `analyse:html:<hash>` — un changement de hash invalide automatiquement le cache et déclenche un re-rendu
- Documenté dans le `README.md` comme procédure de mise à jour

### 10.6 CSP (Content Security Policy)

```
default-src 'self';
style-src 'self' 'unsafe-inline';
script-src 'self';
font-src 'self';
img-src 'self' data:;
connect-src 'self';
frame-ancestors 'none';
base-uri 'self';
form-action 'none';
```

- Aucune ressource externe : marked, DOMPurify, polices et icônes sont toutes servies depuis `'self'`
- `'unsafe-inline'` sur styles uniquement pour les CSS critiques inline en `<head>` ; à terme, hash SHA-256 des blocs inline pour éliminer `unsafe-inline`
- Déclarée via `<meta http-equiv="Content-Security-Policy">` dans chaque page (GitHub Pages ne permet pas de headers HTTP custom)

### 10.7 Stratégie de cache busting des assets statiques

GitHub Pages applique par défaut un `Cache-Control: max-age=600` (10 min) sur les fichiers HTML, ce qui peut suffire pour le MVP. Cependant, pour les assets CSS/JS et les polices (modifiables sans changement de chemin), une stratégie de versioning par hash de contenu est recommandée pour éviter qu'un utilisateur reçoive un mélange de l'ancienne CSS et du nouveau HTML.

**Stratégie retenue v1.0 — versioning par query string manuel** :
- Les références aux assets dans `index.html` et `lecture.html` portent un suffixe `?v=<short-hash>` :
  ```html
  <link rel="stylesheet" href="/assets/css/landing.css?v=a3f2c1">
  <script type="module" src="/assets/js/lecture.js?v=a3f2c1"></script>
  ```
- Le hash court (6-8 caractères) est calculé manuellement (`shasum -a 256 <fichier> | cut -c1-8`) à chaque modification d'un asset et mis à jour dans les `<link>` et `<script>` correspondants.
- Procédure documentée dans le `README.md` du dépôt : section « Mise à jour des assets ».

**Alternative v1.1+ — hash dans le nom de fichier** :
- Renommage `landing.css` → `landing.<hash>.css` au déploiement (script Node ou shell `prebuild.sh` lancé manuellement)
- Plus robuste mais ajoute une étape de build (contre l'esprit « zéro build » du MVP)

**Markdown source** : `AnalyseTheologique.md` reste à son chemin canonique (sans hash dans le nom), mais sa version est suivie via le hash injecté dans `lecture.html` (cf. §10.5).

### 10.8 Procédure de déploiement GitHub Pages

**Configuration initiale (une seule fois)** :

1. Dépôt GitHub : assurer que la branche par défaut est `main`
2. Dans `Settings → Pages` :
   - Source : `Deploy from a branch`
   - Branch : `main`
   - Folder : `/ (root)`
3. (Optionnel) Domaine personnalisé :
   - Créer un fichier `CNAME` à la racine contenant uniquement le domaine (ex : `analyse-luc-actes.example.org`)
   - Configurer un enregistrement DNS `CNAME` chez le registrar pointant vers `<github-username>.github.io`
   - Activer « Enforce HTTPS » dans `Settings → Pages` après propagation DNS (≤ 24 h)
4. Vérification : `https://<github-username>.github.io/<repo>/` ou `https://<custom-domain>/` doit servir `index.html`

**Procédure de release** :

1. Mettre à jour le contenu (`AnalyseTheologique.md`, code, assets)
2. Recalculer les hashes des assets modifiés (cf. §10.7) et mettre à jour les références
3. Mettre à jour `CONTENT_HASH` dans `lecture.html` si `AnalyseTheologique.md` a changé (cf. §10.5)
4. Mettre à jour `lastmod` dans `sitemap.xml` au format ISO 8601
5. Mettre à jour la version du contenu dans le footer (§8.1.11)
6. Lancer la checklist de tests (§6.4) en local
7. Commit avec un message descriptif, push sur `main`
8. Délai de propagation GitHub Pages : 1-3 minutes
9. Vérification post-déploiement : ouvrir l'URL en navigation privée, vérifier que les hashes d'assets sont à jour, exécuter Lighthouse rapide

**Rollback** :
- En cas de problème, `git revert <commit>` puis push → redéploiement automatique en 1-3 min
- GitHub Pages ne maintient pas d'historique de releases ; le rollback passe par git

---

## 11. Accessibilité (WCAG 2.1 AA)

### 11.1 Structure sémantique

- Un seul `<h1>` par page
- Hiérarchie de headings stricte (pas de saut h1 → h3)
- Landmarks : `<header>`, `<nav>`, `<main>`, `<aside>`, `<footer>` correctement utilisés
- `<article>` pour le contenu de péricope dans le lecteur

### 11.2 Navigation clavier

- Skip-link « Aller au contenu » en première position du DOM, visible au focus
- Tab order logique
- Focus visible : `outline` orange `--ring-focus` sur tous les éléments interactifs
- `Esc` ferme modale, drawer, recherche
- `/` ou `Ctrl+F` (option) ouvre la recherche dans le lecteur
- Flèches haut/bas dans la TOC pour navigation au clavier

### 11.3 ARIA et libellés

- `aria-label` sur tous les boutons icône-seule (`aria-label="Recherche"`, `aria-label="Mode lecture concentrée"`, etc.)
- `aria-current="location"` sur l'item TOC actif
- `aria-expanded` sur les groupes TOC pliables
- `role="search"` sur le formulaire de recherche
- `aria-live="polite"` sur le compteur de résultats de recherche

### 11.4 Contraste

- Tous les textes ≥ 4.5:1 (AA normal) ou ≥ 3:1 (AA large ≥ 18 px ou ≥ 14 px gras)
- Vérifié au §9.2 ; aucun texte gris < `--text-muted` sur fond `--bg-base`

### 11.5 Multilingue interne

- `<html lang="fr">` sur les deux pages
- `<span lang="grc">` autour des termes grecs polytoniques (active la police Cardo via CSS `:lang(grc)`)
- `<span lang="la">` autour des termes latins (active une variante typographique différenciée si désiré)

### 11.6 Préférences utilisateur

- `prefers-reduced-motion: reduce` respecté (transitions désactivées)
- `prefers-color-scheme` ignoré (mode dark unique assumé), mais déclaré via `<meta name="color-scheme" content="dark">`
- Zoom 200 % : tout le contenu reste utilisable et lisible (pas de débordement horizontal forcé)

### 11.7 Tests

- **`axe-core` CLI** : exécuté à chaque commit majeur, zéro erreur critique requis
- **Lighthouse Accessibility** : score ≥ 95
- **Lecture manuelle au lecteur d'écran** : NVDA (Windows) et VoiceOver (macOS) — vérification que la structure est navigable et que les libellés sont prononçables
- **Test contraste** : vérifié via `colour-contrast-checker` ou équivalent

### 11.8 Compatibilité mode impression (CSS print)

Les utilisateurs (notamment pasteurs et séminaristes) imprimeront occasionnellement des péricopes pour annotation papier. Un stylesheet print de base est inclus en v1.0 ; un mode print typographique avancé est différé en v1.1+.

**Stylesheet print v1.0 — règles minimales** :

```css
@media print {
  /* Inverser le thème : fond blanc, texte noir */
  :root {
    --bg-base: #FFFFFF;
    --bg-elevated: #FFFFFF;
    --bg-overlay: #FFFFFF;
    --text-primary: #000000;
    --text-secondary: #333333;
    --text-muted: #666666;
    --accent: #000000;
    --quote-amber: #444444;
    --rule: #CCCCCC;
  }

  /* Cacher les éléments non imprimables */
  .topbar, .sidebar, .aside, .search,
  .focus-toggle, .text-size, .back-to-top,
  .progress-bar, .sequential-nav {
    display: none !important;
  }

  /* Forcer la pleine largeur du contenu */
  main, article {
    max-width: none !important;
    width: 100% !important;
    padding: 0 !important;
    margin: 0 !important;
  }

  /* Préserver les liens (afficher l'URL) */
  a[href^="http"]::after {
    content: " (" attr(href) ")";
    font-size: 0.85em;
    color: #666;
  }

  /* Éviter les coupures intempestives */
  h2, h3, h4 { break-after: avoid; }
  blockquote, table { break-inside: avoid; }

  /* Préserver les emojis distinctifs (en noir et blanc) */
  /* Les emojis 🏛️ 🔍 📖 🛡️ se rendent en monochrome par défaut sur la plupart des imprimantes */

  /* Taille de police adaptée au papier A4 */
  body {
    font-size: 11pt;
    line-height: 1.5;
  }
}
```

**Critère d'acceptation** : un utilisateur peut imprimer une péricope (sélection de texte ou Ctrl+P sur le lecteur après scroll vers la péricope) et obtenir un rendu propre, lisible, sans éléments d'UI parasites.

### 11.9 Préférences utilisateur supplémentaires

- **`prefers-reduced-data`** (expérimental) : si supporté par le navigateur et activé, désactiver les ornements visuels coûteux (halo orange du hero, filigrane Λ, animations de pulse)
- **`prefers-contrast: more`** : forcer une variante haute contraste de la palette (à définir en v1.1) ; en v1.0, la palette par défaut atteint déjà AAA pour les textes principaux

---

## 12. SEO et métadonnées

### 12.1 Balises essentielles (par page)

- `<title>` distinct et descriptif (≤ 60 caractères)
  - Landing : `Analyse théologique réformée — Luc-Actes`
  - Lecteur : `Lecture intégrale — Analyse théologique Luc-Actes`
- `<meta name="description">` (≤ 155 caractères)
  - Landing : « Exégèse réformée des écrits lucaniens (Luc-Actes) selon la méthode O.I.A., dans l'horizon confessionnel Westminster, Dort, 1689. »
- `<link rel="canonical">` sur chaque page
- `<meta name="author" content="André-Guy Bruneau">`
- `<meta name="robots" content="index, follow">`

### 12.2 Open Graph (Facebook, LinkedIn, etc.)

```html
<meta property="og:type" content="article">
<meta property="og:title" content="Analyse théologique réformée — Luc-Actes">
<meta property="og:description" content="...">
<meta property="og:image" content="https://<host>/assets/img/og-image.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:url" content="https://<host>/">
<meta property="og:locale" content="fr_FR">
<meta property="og:site_name" content="Analyse théologique réformée">
<meta property="article:author" content="André-Guy Bruneau">
<meta property="article:section" content="Théologie">
```

### 12.3 Twitter Card

```html
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Analyse théologique réformée — Luc-Actes">
<meta name="twitter:description" content="...">
<meta name="twitter:image" content="https://<host>/assets/img/og-image.png">
```

### 12.4 JSON-LD (`schema.org/Article` ou `Book`)

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Analyse théologique réformée — Luc-Actes",
  "author": {
    "@type": "Person",
    "name": "André-Guy Bruneau"
  },
  "datePublished": "2026-04-24",
  "inLanguage": "fr",
  "about": [
    "Théologie réformée",
    "Évangile selon Luc",
    "Actes des Apôtres",
    "Exégèse",
    "Confession de Westminster"
  ],
  "wordCount": 50000,
  "isAccessibleForFree": true,
  "license": "<URL licence>"
}
```

### 12.5 Sitemap.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://<host>/</loc>
    <lastmod>2026-04-24</lastmod>
    <changefreq>monthly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://<host>/lecture.html</loc>
    <lastmod>2026-04-24</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>
</urlset>
```

### 12.6 Robots.txt

```
User-agent: *
Allow: /
Sitemap: https://<host>/sitemap.xml
```

### 12.7 Image OG

- Dimensions : 1200 × 630 px (ratio 1.91:1)
- Fond : `--bg-base` avec halo orange en haut-droite
- Texte : titre principal en sérif blanc cassé, sous-titre en italique ambré
- Petit ornement typographique grec (Λ) en filigrane
- Format : PNG optimisé (objectif ≤ 80 KB) ou WebP (avec fallback PNG)

---

## 13. Confidentialité et conformité

### 13.1 Engagements fermes

- **Aucun cookie** déposé par le site lui-même
- **Aucun tracker** tiers (Google Analytics, Facebook Pixel, Plausible, Umami, etc.) — même autoportés
- **Aucune requête réseau vers un domaine tiers** (toutes les bibliothèques et polices sont auto-hébergées, cf. §10.1)
- **`localStorage` utilisé uniquement** pour les préférences de lecture personnelles :
  - `analyse:focusMode` (booléen)
  - `analyse:textSize` (compact/confort/ample)
  - `analyse:html:<hash>` (cache du HTML rendu, optionnel — peut être désactivé)
- **Aucun formulaire** collectant des données personnelles

### 13.2 RGPD

- Pas de données personnelles traitées → pas de page « Politique de confidentialité » nécessaire
- Si l'auteur souhaite néanmoins l'afficher pour transparence, une mention courte en footer suffit : « Ce site ne dépose aucun cookie et ne collecte aucune donnée. »

### 13.3 Mentions légales

- Mention de l'auteur (André-Guy Bruneau) dans le footer ou la page « À propos »
- Lien vers la licence du dépôt
- Pas d'obligation française de mentions légales étendues (site personnel non-commercial)

### 13.4 Décision sur Service Worker (différé)

**Décision v1.0 : aucun Service Worker ne sera implémenté.**

**Justification** :
1. Le cache `localStorage` du HTML rendu (cf. §8.2.1) couvre déjà 95 % du bénéfice offline pour le persona principal (lecture répétée de la même page).
2. Un Service Worker introduit une complexité disproportionnée pour le MVP (cycle d'invalidation, gestion des versions, debug en cas de cache « collé »).
3. La PWA installable n'est pas un objectif produit (le site est un document de référence, pas une application).
4. Engagement de simplicité (« sans build complexe ») et de minimalisme JS.

**Conséquences acceptées** :
- L'utilisateur en mobilité (avion, métro) qui n'a jamais visité le site ne peut pas y accéder.
- Pas d'icône d'installation native sur mobile.

**Réévaluation possible en v1.1+** si les retours utilisateurs identifient un besoin offline fort.

---

## 14. Critères d'acceptation

### 14.1 Landing (`index.html`)

- [ ] Toutes les 11 sections du §7.2 sont présentes, dans l'ordre, et hiérarchisées sémantiquement
- [ ] Le hero charge en < 1 s sur connexion 4G simulée modérée (Lighthouse mobile)
- [ ] Les 3 CTA principaux fonctionnent : lien vers `lecture.html`, téléchargement de `AnalyseTheologique.md`, lien vers le dépôt GitHub
- [ ] Les liens depuis l'aperçu de la TOC pointent vers les bonnes ancres dans `lecture.html`
- [ ] Le tableau synoptique des divergences est lisible sur mobile (scroll horizontal propre)
- [ ] Score Lighthouse mobile : Performance ≥ 95, Accessibilité ≥ 95, Best Practices ≥ 95, SEO ≥ 95
- [ ] axe-core : 0 erreur critique
- [ ] Validation HTML W3C : 0 erreur, 0 avertissement bloquant
- [ ] Open Graph et Twitter Card validés via le validateur Facebook/Twitter
- [ ] JSON-LD validé via [Schema Markup Validator](https://validator.schema.org/)

### 14.2 Lecteur (`lecture.html`)

- [ ] Le markdown intégral est rendu fidèlement : titres (h1-h4), listes ordonnées et non ordonnées, tableaux, citations, gras, italiques, blockquotes
- [ ] Les emojis 🏛️ 🔍 📖 🛡️ s'affichent correctement et sont lisibles
- [ ] Les citations bibliques en `« … »` reçoivent le style typographique distinct (bordure gauche orange, fond subtil)
- [ ] Les termes en italique (`*term*`) reçoivent la couleur `--quote-amber`
- [ ] La TOC pliable est générée automatiquement à partir des h2/h3
- [ ] La synchronisation TOC ↔ scroll fonctionne (item actif mis en évidence)
- [ ] La recherche plein-texte trouve un terme (ex. : « *asphaleia* »), affiche le compteur, navigue entre occurrences
- [ ] La recherche est insensible à la casse et aux diacritiques latins (« metanoia » trouve « *metánoia* », « eglise » trouve « Église »). La normalisation des diacritiques grecs polytoniques est hors-périmètre v1.0.
- [ ] Le mode lecture concentrée bascule, persiste après rechargement
- [ ] Le contrôle de taille de police bascule sur 3 niveaux, persiste après rechargement
- [ ] L'URL `lecture.html#luc-21-20--nativité` (slug GitHub, identique aux ancres déjà présentes dans le TOC du markdown source) navigue correctement
- [ ] Le bouton « # » au survol d'un heading copie l'URL avec ancre dans le presse-papier
- [ ] Le bouton « Haut de page » apparaît après 600 px de scroll et fonctionne
- [ ] Sur seconde visite, le rendu est instantané (cache localStorage actif)
- [ ] Sur première visite hors-ligne (et cache vide), un message d'erreur clair invite à la connexion ou au téléchargement du markdown
- [ ] Score Lighthouse mobile : Performance ≥ 90, Accessibilité ≥ 95, Best Practices ≥ 95, SEO ≥ 95

### 14.3 Identité visuelle

- [ ] La palette dark + orange est appliquée de manière cohérente sur les deux pages
- [ ] Aucun élément n'utilise une couleur hors de la palette définie au §9.2
- [ ] La typographie sérif (Source Serif 4) est appliquée au corps et aux titres
- [ ] La typographie sans-serif (Inter) est appliquée à l'UI
- [ ] Les caractères grecs polytoniques s'affichent correctement (Cardo en fallback) sur Windows, macOS, Linux
- [ ] Le focus clavier est visible orange sur tous les éléments interactifs
- [ ] L'image OG est présente et conforme (1200×630)

### 14.4 Cross-browser et responsive

- [ ] Rendu identique et fonctionnel sur Chrome ≥ 109, Firefox ≥ 110, Safari ≥ 16 (desktop)
- [ ] Rendu identique sur iOS Safari ≥ 16 et Android Chrome ≥ 109
- [ ] Responsive testé sur viewports : 360 px, 414 px, 768 px, 1024 px, 1280 px, 1440 px, 1920 px
- [ ] Aucun débordement horizontal (`overflow-x: hidden` non utilisé en hack)

### 14.5 Confidentialité

- [ ] Aucun cookie déposé (vérifié via DevTools → Application → Cookies)
- [ ] Aucune requête réseau vers un domaine tiers (vérifié via DevTools → Network)
- [ ] `localStorage` ne contient que les clés autorisées (`analyse:*`)
- [ ] CSP active et conforme au §10.6

---

## 15. Risques et mitigations

| #   | Risque                                                                                | Impact     | Probabilité | Mitigation                                                                                              |
| --- | ------------------------------------------------------------------------------------- | ---------- | ----------- | ------------------------------------------------------------------------------------------------------- |
| R1  | Rendu lent du markdown 295 KB sur mobile bas de gamme                                | UX dégradée | Moyenne    | Cache `localStorage` après première visite + `<skeleton>` pendant le rendu + parser dans Web Worker en v1.1 |
| R2  | Caractères grecs polytoniques mal rendus selon polices système                       | Lisibilité  | Moyenne    | Auto-hébergement de Cardo + déclaration `:lang(grc)` + tests cross-OS documentés                        |
| R3  | GitHub Pages : limite 100 GB / mois de bande passante                                | Disponibilité | Faible    | Suivi du compteur, plan B Cloudflare Pages préparé (même structure statique)                            |
| R4  | XSS via marked + contenu malveillant injecté                                          | Sécurité    | Très faible (source = nous) | DOMPurify post-rendu obligatoire, CSP stricte, source contrôlée par git           |
| R5  | Dérive de scope (ajout de features hors MVP)                                          | Délai       | Élevée      | Backlog v1.1+ strictement séparé, refus explicite documenté pour chaque demande hors-MVP                |
| R6  | Évolution du `AnalyseTheologique.md` casse les ancres profondes partagées            | Liens cassés | Moyenne    | Slugs stables (algorithme documenté), redirections JS si renommage majeur, journal de modifications     |
| R7  | Conflit entre le mode dark forcé et les préférences système `prefers-color-scheme: light` | Confort utilisateur | Faible | Décision produit assumée et documentée ; `<meta name="color-scheme" content="dark">` informe le navigateur |
| R8  | Recherche sur DOM rendu trop lente sur très gros document (295 KB rendu)             | Performance | Faible      | Debounce 200 ms, limite à 1 000 occurrences, message d'avertissement au-delà                            |
| R9  | Polices auto-hébergées non chargées (path incorrect, MIME)                            | Visuel cassé | Moyenne    | Tests E2E sur déploiement, fallback `serif` / `sans-serif` natif déclaré explicitement                  |
| R10 | Mauvaise interprétation du markdown (tableaux complexes, escapes)                    | Fidélité    | Faible      | Tests visuels par échantillonnage de 5 péricopes représentatives + comparaison avec rendu GitHub        |

---

## 16. Plan de livraison (jalons indicatifs)

| Jalon | Livrable                                                                    | Effort estimé        |
| ----- | --------------------------------------------------------------------------- | -------------------- |
| M0    | PRD validé (présent document)                                              | Livré                |
| M1    | Plan d'implémentation détaillé (via skill `superpowers:writing-plans`)     | 1 session            |
| M2    | Squelette HTML des 2 pages + tokens CSS + base typo                          | 1 session            |
| M3    | Landing complète, validée visuellement et accessibilité                     | 2 sessions           |
| M4    | Lecteur — pipeline de rendu markdown + TOC + ancres                         | 2 sessions           |
| M5    | Recherche + mode concentré + contrôle taille + persistance                  | 1 session            |
| M6    | Audit Lighthouse + axe-core + tests cross-browser + correctifs              | 1 session            |
| M7    | Image OG + métadonnées SEO + sitemap + robots.txt                           | 0.5 session          |
| M8    | Déploiement GitHub Pages + vérification production                          | 0.5 session          |

Effort total estimé : **9 sessions** de travail concentré.

---

## 17. Décisions produit assumées (traçabilité)

| #   | Décision                                                              | Justification                                                                                |
| --- | --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| D1  | Approche hybride (vitrine + lecteur) plutôt que page unique           | Le contenu (295 KB) est trop lourd pour une seule page ; sépare la promotion de la lecture   |
| D2  | Mode dark + orange unique, sans toggle                                | Cohérence éditoriale forte (« manuscrit nocturne ») ; simplicité ; cf. demande utilisateur   |
| D3  | Stack 100 % statique vanilla, sans bundler                            | Déploiement GitHub Pages direct ; zéro maintenance build ; lisibilité du code                |
| D4  | Rendu markdown côté client (marked + DOMPurify) plutôt que pré-rendu  | Le source unique reste le `.md` ; modifications immédiates ; cache localStorage compense    |
| D5  | Auto-hébergement des polices et bibliothèques (pas de CDN tiers)      | Confidentialité totale, indépendance, performance contrôlée                                  |
| D6  | Aucun tracker, aucun analytics                                        | Engagement de confidentialité ; cohérent avec la sobriété éditoriale                         |
| D7  | Mono-langue français uniquement                                       | Le source est en français ; traduction = autre projet                                        |
| D8  | Conservation des emojis 🏛️🔍📖🛡️ du document                          | Identité éditoriale du contenu, ne doivent pas être substitués par des icônes Lucide         |
| D9  | Recherche simple sur DOM rendu, pas Lunr/MiniSearch                   | KISS pour MVP ; suffit pour ~50 000 mots ; v1.1+ peut ajouter index avancé                  |
| D10 | Pas d'export PDF généré en MVP                                        | Le markdown brut téléchargeable suffit ; PDF artisanal en v1.1                              |

---

## 18. Annexes

### Annexe A. Inventaire structurel d'`AnalyseTheologique.md`

Statistiques :
- Lignes : **1 870**
- Octets : **~295 KB**
- Estimation mots : **~50 000**

Sections de premier niveau (`##`) :
1. Introduction magistrale : l'œuvre lucanienne en deux tomes
2. PREMIER TOME — ÉVANGILE SELON LUC
3. SECOND TOME — LES ACTES DES APÔTRES
4. Synthèse systématique Luc-Actes
5. Références documentaires

Sous-sections de l'introduction (`###`) :
- Thèse doctrinale directrice
- Auteur, date, destinataire
- Structure narrative d'ensemble
- Thèmes théologiques matriciels
- Protocole de divergence Sproul ↔ MacArthur appliqué à Luc-Actes
- Plan de lecture

Péricopes du **Premier Tome** (30) :
Luc 1.1-4, 1.5-25, 1.26-38, 1.39-56, 1.57-80, 2.1-20, 2.21-40, 2.41-52, 3.1-20, 3.21-38, 4.1-13, 4.14-30, 5.1-11, 6.12-49, 7.1-50, 8.1-56, 9.18-36, 10.1-24, 10.25-37, 11.1-13, 15.1-32, 16.19-31, 18.9-14, 19.1-27, 19.28-48, 21.5-38, 22.14-38, 22.39-71, 23.1-56, 24.1-53.

Péricopes du **Second Tome** (19) :
Actes 1.1-11, 1.12-26, 2.1-41, 2.42-47, 3.1-4.31, 4.32-5.11, 6.1-7.60, 8.1-40, 9.1-31, 10.1-11.18, 11.19-14.28, 15.1-35, 15.36-17.15, 17.16-34, 18.1-19.41, 20.17-38, 21.17-23.35, 24.1-26.32, 27.1-28.16, 28.17-31.

Sections de la **Synthèse systématique** :
- Thèse systématique directrice
- I. Théologie propre et trinitaire
- II. Christologie
- III. Pneumatologie
- IV. Sotériologie
- V. Ecclésiologie et sacrements
- VI. Eschatologie
- VII. Herméneutique et apologétique
- VIII. Mission et *Coram Deo*
- Tableau synoptique des divergences exégétiques signalées
- Conclusion systématique

**Gabarit appliqué à chaque péricope** (4 blocs strictement uniformes) :
1. 🏛️ THÈSE DOCTRINALE CENTRALE — synthèse en 1 paragraphe
2. 🔍 I. OBSERVATION (O) — péricope, versets-pivot, contexte, structure littéraire, analyse grammaticale (syntaxe + termes originaux grecs)
3. 📖 II. INTERPRÉTATION (I) — sens auctorial, apport exégétique (Sproul, MacArthur), analogie de la foi (parallèles + cohérence systématique)
4. 🛡️ III. APPLICATION (A) — volet didactique (orthodoxie), volet élenctique (orthocardie), volet normatif (orthopraxie)

### Annexe B. Tokens de design — fichier de référence `tokens.css`

```css
:root {
  /* === Palette === */
  --bg-base: #0E0F12;
  --bg-elevated: #16181D;
  --bg-overlay: #1E2128;
  --text-primary: #EDE6D8;
  --text-secondary: #B5AC9A;
  --text-muted: #7A7466;
  --accent: #FF7A1A;
  --accent-hover: #FF924A;
  --accent-soft: #A85410;
  --accent-glow: rgba(255, 122, 26, 0.25);
  --quote-amber: #E8B65A;
  --rule: #2B2E36;
  --success: #7BB36A;
  --danger: #D55C5C;

  /* === Typographie === */
  --font-serif: "Source Serif 4", "Crimson Pro", Georgia, serif;
  --font-sans: "Inter", system-ui, -apple-system, "Segoe UI", sans-serif;
  --font-grec: "Cardo", "Gentium Plus", "Source Serif 4", serif;

  --fs-xs: 0.8rem;       /* 12.8 px */
  --fs-sm: 1rem;         /* 16 px */
  --fs-base: 1.1875rem;  /* 19 px */
  --fs-md: 1.4375rem;    /* 23 px */
  --fs-lg: 1.8125rem;    /* 29 px */
  --fs-xl: 2.25rem;      /* 36 px */
  --fs-2xl: 3.5rem;      /* 56 px */

  --lh-tight: 1.15;
  --lh-heading: 1.25;
  --lh-body: 1.7;

  /* === Espacement (échelle 4 px) === */
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-6: 1.5rem;
  --space-8: 2rem;
  --space-12: 3rem;
  --space-16: 4rem;
  --space-24: 6rem;
  --space-32: 8rem;

  /* === Rayons === */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 16px;
  --radius-pill: 9999px;

  /* === Ombres === */
  --shadow-soft: 0 1px 0 0 rgba(255,255,255,0.04) inset, 0 4px 12px rgba(0,0,0,0.3);
  --shadow-card: 0 1px 0 0 rgba(255,255,255,0.04) inset, 0 8px 24px rgba(0,0,0,0.4);
  --shadow-floating: 0 12px 40px rgba(0,0,0,0.5);
  --ring-focus: 0 0 0 3px var(--accent-glow);

  /* === Mouvement === */
  --motion-quick: 150ms;
  --motion-base: 250ms;
  --motion-slow: 400ms;
  --easing: cubic-bezier(0.4, 0, 0.2, 1);

  /* === Mesures de lecture === */
  --measure-compact: 60ch;
  --measure-confort: 70ch;
  --measure-ample: 84ch;

  /* === Layout === */
  --topbar-h: 60px;
  --sidebar-w: 260px;
  --sidebar-rail-w: 48px;
  --aside-w: 220px;
}

@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    transition-duration: 0.01ms !important;
    animation-duration: 0.01ms !important;
  }
}
```

### Annexe C. Glossaire des termes-clés du contenu

| Terme | Signification dans le document |
| --- | --- |
| *asphaleia* | Certitude historique et objective (Luc 1.4) — concept structurant |
| O.I.A. | Observation, Interprétation, Application — méthode exégétique du document |
| *Coram Deo* | « Devant la face de Dieu » — cadre permanent de la lecture confessionnelle |
| *Sola Scriptura* | L'Écriture seule comme norme normante |
| *Sola gratia* | La grâce seule sauve |
| *Sola fide* | La foi seule justifie |
| *Solus Christus* | Le Christ seul est médiateur |
| *Soli Deo gloria* | À Dieu seul la gloire |
| Westminster | Confession de foi de 1647, étalon de référence |
| Dort (Canons de) | 1619, articulation des cinq points TULIP |
| 1689 (Confession baptiste de) | Variante baptiste de la Westminster |
| TULIP | Total depravity, Unconditional election, Limited atonement, Irresistible grace, Perseverance of saints |
| *Munera tria* | Les trois charges du Christ : Prophète, Sacrificateur, Roi |
| *Pactum salutis* | Décret éternel trinitaire pour le salut |
| Paedobaptisme | Baptême des enfants de croyants (position Westminster) |
| Credobaptisme | Baptême des seuls professants (position 1689 / MacArthur) |
| Amillénarisme | Le millénium est l'âge actuel symbolique (position Westminster) |
| Prémillénarisme | Le millénium est un règne terrestre futur (position MacArthur) |
| Cessationnisme | Les charismes apostoliques ont cessé avec la clôture du canon |
| NEG 1979 | Nouvelle Édition de Genève — texte biblique français de référence |
| NA28 | Novum Testamentum Graece, 28e édition — substrat critique grec |

### Annexe D. Questions à clarifier en revue

- Le **nom de domaine** définitif (par défaut : `<github-username>.github.io/<repo>` ; domaine personnalisé optionnel cf. §10.8)
- L'**URL exacte du dépôt GitHub** à insérer dans les CTA et les liens « Signaler une coquille »
- La **licence du site** (proposition par défaut : code MIT, contenu CC BY-SA 4.0 — à confirmer)
- Le choix de **conserver ou retirer** la mention « André-Guy Bruneau » nominative dans le footer / OG / JSON-LD
- La **liste finale des 9 pull-quotes** de la landing (§8.1.7) : les 9 propositions sont confirmées par défaut, à amender si besoin
- La **stratégie de versioning** du document : git tags par version majeure du contenu (recommandé : `content-v1.0`, `content-v1.1`...), ou fil continu sur `main` ?
- La **teinte exacte de l'orange `--accent`** : `#FF7A1A` proposé (orange chaud) ; alternatives à examiner si souhaité (`#E86A0C` plus profond, `#FF8A3D` plus vif)
- Le **fond `--bg-base`** : `#0E0F12` (charbon neutre) ; alternative tonalité légèrement bleutée `#0D1117` (proche de GitHub dark) ou plus chaude `#100E0B` (parchemin retourné)

### Annexe E. Matrice de conformité WCAG 2.1 AA — par critère

| Critère WCAG | Niveau | Description abrégée                           | Couverture                                                                  | Vérification              |
| ------------ | ------ | --------------------------------------------- | --------------------------------------------------------------------------- | ------------------------- |
| 1.1.1        | A      | Contenu non textuel : alternative textuelle   | Toutes les icônes ont `aria-label` ; image OG décorative                    | axe-core                  |
| 1.3.1        | A      | Information et relations : structure sémantique | Headings hiérarchiques, landmarks, `<nav>`, `<main>`, `<aside>`            | axe-core + revue manuelle |
| 1.3.2        | A      | Ordre séquentiel logique                      | Flux DOM correspond à l'ordre visuel ; pas de positionnement absolu trompeur | Revue manuelle           |
| 1.3.3        | A      | Caractéristiques sensorielles                 | Aucune instruction reposant uniquement sur la couleur ou la position        | Revue manuelle           |
| 1.3.4        | AA     | Orientation : pas verrouillée                 | Aucune contrainte d'orientation                                             | Test mobile               |
| 1.3.5        | AA     | Identifier la finalité de la saisie           | Champ recherche : `type="search"`, `autocomplete="off"`                     | Revue manuelle           |
| 1.4.1        | A      | Utilisation de la couleur : pas seule         | Items TOC actifs : couleur + bordure + weight ; liens : couleur + soulignement | Revue manuelle         |
| 1.4.2        | A      | Contrôle audio : aucun                        | Aucun audio                                                                 | N/A                       |
| 1.4.3        | AA     | Contraste minimum : 4.5:1 (3:1 large)         | Cf. §9.2 ; tous textes ≥ 4.5:1                                              | colour-contrast-checker  |
| 1.4.4        | AA     | Redimensionnement du texte 200 %              | Layout reste utilisable, pas de débordement                                 | Test navigateur zoom     |
| 1.4.5        | AA     | Images de texte : éviter                      | Aucun texte rendu en image (sauf OG décorative)                             | Revue manuelle           |
| 1.4.10       | AA     | Reflow : pas de scroll horizontal à 320 px largeur | Layout responsive testé jusqu'à 320 px                                  | Test viewport            |
| 1.4.11       | AA     | Contraste non textuel ≥ 3:1                   | Bordures de focus, séparateurs : vérifiés                                   | Revue manuelle           |
| 1.4.12       | AA     | Espacement du texte                           | Pas de troncature en cas d'override CSS utilisateur (line-height 1.5+)      | Test bookmarklet         |
| 1.4.13       | AA     | Contenu au survol/focus : descriptif et persistant | Tooltips d'ancre : descriptifs, fermables, persistants                | Revue manuelle           |
| 2.1.1        | A      | Toutes fonctionnalités au clavier             | TOC, recherche, modale, ancres, navigation séquentielle : 100 % clavier     | Test clavier             |
| 2.1.2        | A      | Pas de piège au clavier                       | Modale fermable par Esc                                                     | Test clavier             |
| 2.1.4        | A      | Raccourcis clavier de caractère unique : configurables ou désactivables | Aucun raccourci de caractère unique en MVP                       | N/A                       |
| 2.4.1        | A      | Skip link « Aller au contenu »                | Présent en première position                                                | Revue manuelle           |
| 2.4.2        | A      | Titre de page descriptif                      | `<title>` distinct par page                                                 | Revue manuelle           |
| 2.4.3        | A      | Ordre de focus logique                        | Tab order suit le flux de lecture                                           | Test clavier             |
| 2.4.4        | A      | Texte de lien explicite                       | Tous les liens ont un texte descriptif (pas de « cliquez ici »)            | Revue manuelle           |
| 2.4.5        | AA     | Multiples moyens de navigation                | Top nav + TOC + recherche + ancres directes                                 | Revue manuelle           |
| 2.4.6        | AA     | Headings et étiquettes descriptifs            | Headings reprennent le contenu fidèlement                                   | Revue manuelle           |
| 2.4.7        | AA     | Focus visible                                 | Outline orange `--ring-focus` sur tout élément focusable                    | Test clavier             |
| 2.5.1        | A      | Gestes pointeur : alternatives au glissement  | Aucun geste complexe utilisé                                                | N/A                       |
| 2.5.2        | A      | Annulation du pointeur                        | Aucune action déclenchée sur `mousedown` seul                               | Revue manuelle           |
| 2.5.3        | A      | Étiquette dans le nom accessible              | Boutons : texte visible inclus dans `aria-label`                            | axe-core                 |
| 2.5.4        | A      | Activation par mouvement : aucune             | Aucune                                                                      | N/A                       |
| 3.1.1        | A      | Langue de la page                             | `<html lang="fr">`                                                          | Validation HTML          |
| 3.1.2        | AA     | Langue d'un passage                           | `<span lang="grc">`, `<span lang="la">` sur termes étrangers                | Revue manuelle           |
| 3.2.1        | A      | Au focus : pas de changement de contexte      | Aucun                                                                       | Revue manuelle           |
| 3.2.2        | A      | À la saisie : pas de changement de contexte   | Recherche : pas de soumission auto changeant la page                        | Revue manuelle           |
| 3.2.3        | AA     | Navigation cohérente                          | Top nav identique sur les deux pages                                        | Revue manuelle           |
| 3.2.4        | AA     | Identification cohérente                      | Mêmes icônes pour mêmes fonctions                                           | Revue manuelle           |
| 3.3.1        | A      | Identification des erreurs                    | Recherche sans résultat : message clair                                     | Revue manuelle           |
| 3.3.2        | A      | Étiquettes ou instructions                    | Champ recherche : placeholder + label (visuellement masqué mais présent)    | axe-core                 |
| 3.3.3        | AA     | Suggestion en cas d'erreur                    | Recherche : suggestion « moins de caractères »                              | Revue manuelle           |
| 3.3.4        | AA     | Prévention des erreurs (légal, financier)     | Aucun formulaire engageant                                                  | N/A                       |
| 4.1.1        | A      | Analyse syntaxique HTML                       | Validation W3C 0 erreur                                                     | validator.w3.org         |
| 4.1.2        | A      | Nom, rôle, valeur ARIA                        | axe-core 0 violation                                                        | axe-core                 |
| 4.1.3        | AA     | Messages d'état                               | `aria-live="polite"` sur compteur recherche, messages d'erreur              | axe-core + lecteur d'écran |

**Niveau cible : WCAG 2.1 AA complet sur les 50 critères applicables (4 critères N/A liés à audio/formulaires absents).**

### Annexe F. Wireframes ASCII des deux pages

#### F.1 Landing — desktop (≥ 1280 px)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ ☧ Luc-Actes  │ Méthode  Aperçu  Divergences  Synthèse  À propos │ [Lire]│ ← Header sticky 64px
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│                                                            ╲╲           │
│                                                              Λ  filigrane│
│        ANALYSE THÉOLOGIQUE RÉFORMÉE — LUC-ACTES                         │
│                                                                         │
│        Méthode O.I.A. · NEG 1979 / NA28                                 │
│                                                                         │
│        Exégèse grammatico-historique des deux tomes lucaniens,         │
│        dans l'horizon confessionnel classique : Westminster,           │
│        Dort, 1689.                                                      │
│                                                                         │
│        ┌──────────────────┐  ┌──────────────────┐  Voir sur GitHub →    │
│        │  Lire l'analyse  │  │ Télécharger .md  │                       │
│        └──────────────────┘  └──────────────────┘                       │
│                                                                         │
│        ~50 000 mots · 49 péricopes · français · libre                   │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│                          THÈSE DIRECTRICE                               │
│                                                                         │
│   « L'œuvre lucanienne présente le déploiement souverain, historique   │
│    et irrésistible du plan rédempteur trinitaire — Père décrétant,    │
│    Fils accomplissant, Esprit appliquant. »                            │
│                          — Synthèse systématique, locus I                │
├─────────────────────────────────────────────────────────────────────────┤
│                      MÉTHODE O.I.A.                                     │
│   ┌──────────────┐  ┌──────────────┐  ┌──────────────┐                 │
│   │ 🔍           │  │ 📖           │  │ 🛡️          │                  │
│   │ Observation  │  │ Interprétation│  │ Application │                  │
│   │ Texte, contexte│ │ Sens, exégèse│ │ Doctrine,    │                 │
│   │ grammaire    │  │ analogie foi  │  │ cœur, pratique│                │
│   └──────────────┘  └──────────────┘  └──────────────┘                 │
├─────────────────────────────────────────────────────────────────────────┤
│ CORPUS · APERÇU TOC · DIVERGENCES · CITATIONS · SYNTHÈSE · À PROPOS    │
│                          BIBLIOGRAPHIE                                  │
├─────────────────────────────────────────────────────────────────────────┤
│ Footer : 3 zones + ligne basse                                          │
│ Coram Deo, soli Deo gloria.                                             │
└─────────────────────────────────────────────────────────────────────────┘
```

#### F.2 Lecteur — desktop (≥ 1280 px)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ ☰ Analyse théologique — Luc-Actes        [🔍] [Aa] [👓] [↗ GitHub]    │ ← Top bar 60px
├─▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬─┤ ← Barre progression 3px
├──────────────┬─────────────────────────────────────────┬────────────────┤
│              │                                         │                │
│ TOC (260px)  │ Contenu rendu (max 70ch)                │ Ancres (220px) │
│              │                                         │                │
│ ─ Intro      │ ## Luc 1.1-4 — Prologue dédicatoire     │ Cette péricope │
│              │                                         │                │
│ PREMIER TOME │ ### 🏛️ THÈSE DOCTRINALE CENTRALE       │ • Thèse        │
│ ▶ Luc 1.1-4  │                                         │ • Observation  │
│   Luc 1.5-25 │ Synthèse : Luc pose l'Évangile comme   │ • Interprét.   │
│   Luc 1.26-38│ rapport historiographique méthodique... │ • Application  │
│   ...        │                                         │                │
│              │ ### 🔍 I. OBSERVATION (O)               │                │
│ SECOND TOME  │                                         │                │
│ ▷ ...        │ • Péricope : Luc 1.1-4                  │                │
│              │ • Versets-pivot : « Plusieurs ayant... »│                │
│ SYNTHÈSE     │ ...                                     │                │
│ ▷ ...        │                                         │                │
│              │ ┌─────────────────────────────────────┐ │                │
│              │ │ ← Précédent      Suivant : 1.5-25 → │ │ ← Nav séquent. │
│              │ └─────────────────────────────────────┘ │                │
│              │                                         │                │
│              │ ## Luc 1.5-25 — Annonce à Zacharie      │                │
│              │ ...                                     │              ↑ │
└──────────────┴─────────────────────────────────────────┴────────────────┘
                                                                  Bouton haut
```

#### F.3 Lecteur — mode concentré (toggle 👓)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ ☰ Analyse théologique — Luc-Actes                      [👓 actif]      │
├─▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬─┤ ← Barre 1px (discrète)
├──┬──────────────────────────────────────────────────────────────────────┤
│☰ │                                                                      │
│🔍│        Contenu rendu (max 84ch, fond plus profond)                   │
│Aa│                                                                      │
│  │        ## Luc 1.1-4 — Prologue dédicatoire                           │
│  │        ...                                                           │
└──┴──────────────────────────────────────────────────────────────────────┘
   ↑ Rail 48px (icônes seules)
```

#### F.4 Mobile (< 768 px)

```
Landing                          Lecteur
┌────────────────────┐           ┌────────────────────┐
│ ☧ Luc-Actes    ☰   │           │ ☰  Luc-Actes  🔍   │
├────────────────────┤           ├────────────────────┤
│                    │           │ ▬▬▬▬▬▬▬▬░░░░░░░░░ │ ← progression
│ ANALYSE            │           │                    │
│ THÉOLOGIQUE        │           │ ## Luc 1.1-4       │
│ RÉFORMÉE           │           │   Prologue         │
│ Luc-Actes          │           │                    │
│                    │           │ ### 🏛️ THÈSE      │
│ ┌────────────────┐ │           │                    │
│ │ Lire l'analyse │ │           │ Luc pose...        │
│ └────────────────┘ │           │                    │
│ ┌────────────────┐ │           │ ### 🔍 OBSERVATION │
│ │ Télécharger .md│ │           │                    │
│ └────────────────┘ │           │ • Péricope...      │
│ Voir sur GitHub →  │           │                    │
│                    │           │ ┌────────────────┐ │
│ THÈSE DIRECTRICE   │           │ │ Suivant 1.5-25→│ │
│ ...                │           │ │ ←Précédent     │ │
│                    │           │ └────────────────┘ │
│ MÉTHODE            │           │                  ↑ │
│ ┌──────────────┐   │           └────────────────────┘
│ │ 🔍 Observat. │   │
│ └──────────────┘   │
│ ┌──────────────┐   │
│ │ 📖 Interprét.│   │
│ └──────────────┘   │
│ ┌──────────────┐   │
│ │ 🛡️ Applicat.│   │
│ └──────────────┘   │
│ ...                │
└────────────────────┘
```

---

*Fin du PRD v1.1 — `prd.md`.*
