# Landing Web Page « Analyse théologique réformée — Luc-Actes » — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

---

## 📊 Tableau de suivi des tâches

> **Mise à jour automatique :** Ce tableau est mis à jour à chaque complétion réussie d'une tâche (après validation par les agents de revue spec + qualité code).

**Légende :** ⬜ À faire · 🟡 En cours · ✅ Complétée · ❌ Bloquée

| # | Phase | Tâche | Statut | Commit | Date |
|---|-------|-------|--------|--------|------|
| 1 | 1 — Fondations | Préparer l'arborescence et committer le PRD existant | ✅ | `7bb349b` | 2026-04-24 |
| 2 | 1 — Fondations | Auto-héberger les bibliothèques tierces (marked + DOMPurify) et les polices | ✅ | `867a23b` + `59637b1` | 2026-04-24 |
| 3 | 1 — Fondations | Créer les fichiers CSS de base (tokens, base, components) | ✅ | `8e5d847` | 2026-04-24 |
| 4 | 2 — Page-vitrine | Landing — squelette + header sticky + hero + thèse + méthode O.I.A. | ✅ | `bcc540c` | 2026-04-24 |
| 5 | 2 — Page-vitrine | Landing — corpus + aperçu TOC + tableau divergences | ✅ | `23bbf7c` + `bb5a147` | 2026-04-24 |
| 6 | 2 — Page-vitrine | Landing — citations + synthèse 8 loci + à propos + bibliographie + footer | ✅ | `27bd34e` | 2026-04-24 |
| 7 | 2 — Page-vitrine | Landing — JavaScript interactif + SEO complet | ✅ | `3c1d42e` | 2026-04-24 |
| 8 | 3 — Page-lecteur | Lecteur — squelette HTML + CSS layout | ✅ | `ef12a61` | 2026-04-24 |
| 9 | 3 — Page-lecteur | Lecteur — module render (TDD slug helper) + intégration | ✅ | `cb51c6b` + `4a17387` | 2026-04-24 |
| 10 | 3 — Page-lecteur | Lecteur — module TOC (génération + sync scroll) | ✅ | `d878c74` | 2026-04-24 |
| 11 | 3 — Page-lecteur | Lecteur — module recherche (TDD normalize) + intégration | ✅ | `9db8d0d` + fix | 2026-04-24 |
| 12 | 3 — Page-lecteur | Lecteur — modules ancres + progression + nav séquentielle + back-to-top | ✅ | `8f3e19e` | 2026-04-24 |
| 13 | 3 — Page-lecteur | Lecteur — module préférences (taille de police + mode concentré) | ✅ | `8a75b7c` | 2026-04-24 |
| 14 | 4 — Polissage | Stylesheet print + image OG + apple-touch-icon | ✅ | `f7996a0` | 2026-04-24 |
| 15 | 4 — Polissage | SEO meta complet sur le lecteur + JSON-LD enrichi | ✅ | `3b650d3` + `4bb7d96` | 2026-04-24 |
| 16 | 4 — Polissage | Validation HTML + axe + Lighthouse + correctifs | ✅ (auto) | `fab7132` | 2026-04-24 |
| 17 | 5 — Déploiement | Mise à jour du README + procédure de déploiement | ✅ | `3078161` | 2026-04-24 |
| 18 | 5 — Déploiement | Activation GitHub Pages + push final + vérification production | ⬜ | — | — |

**Progression globale :** 17 / 18 tâches complétées (94 %)

---

**Goal:** Construire un site statique en 2 pages (`index.html` vitrine + `lecture.html` lecteur intégral) qui présente et permet la lecture en ligne de `AnalyseTheologique.md`, avec identité visuelle dark + orange ambré « manuscrit nocturne », déployable directement sur GitHub Pages, sans backend, sans build, sans tracker.

**Architecture:** HTML5 sémantique + CSS moderne (variables, grid, container queries) + JavaScript ES2022 vanilla en modules natifs. Le markdown source est rendu côté client par `marked` (auto-hébergé) et sanitisé par `DOMPurify`, avec cache `localStorage` pour visites suivantes. Aucun bundler, aucune dépendance npm en runtime, aucun appel réseau tiers.

**Tech Stack:** HTML5 · CSS3 (variables, grid, flexbox, container queries) · JavaScript ES2022 (modules natifs, ESM) · `marked` v12+ · `DOMPurify` v3+ · Polices auto-hébergées (Source Serif 4, Inter, Cardo) · Icônes Lucide SVG inline · Node `--test` (built-in) pour les helpers JS purs · `axe-core` CLI · Lighthouse CLI · Validation W3C HTML/CSS · Déploiement GitHub Pages.

**Spec source:** `prd.md` (v1.1, ~1730 lignes, ~113 KB).

**Conventions globales :**
- Tous les chemins sont relatifs à la racine du dépôt `C:\Users\agbru\OneDrive\Documents\GitHub\Exploration\`.
- Tous les commits suivent le format Conventional Commits : `feat:`, `fix:`, `chore:`, `docs:`, `style:`, `test:`, `refactor:`.
- Tous les fichiers HTML/CSS/JS sont en UTF-8 sans BOM, fin de ligne LF.
- Tous les commentaires de code sont en français pour cohérence éditoriale.
- Le markdown source `AnalyseTheologique.md` ne doit **jamais** être modifié.
- Aucune dépendance npm en runtime ; un `package.json` minimal est ajouté uniquement pour `"type": "module"` (permet à Node de traiter les `.js` comme ESM pour les tests).

---

## Phase 1 — Fondations (Tasks 1-3)

### Task 1 : Préparer l'arborescence et committer le PRD existant

**Files:**
- Create: `package.json`
- Create: `.gitignore`
- Create: `assets/css/.gitkeep`
- Create: `assets/js/.gitkeep`
- Create: `assets/js/modules/.gitkeep`
- Create: `assets/vendor/.gitkeep`
- Create: `assets/fonts/.gitkeep`
- Create: `assets/img/.gitkeep`
- Create: `assets/icons/.gitkeep`
- Existing (commit): `prd.md`, `plan.md`

- [ ] **Step 1 : Créer `package.json` minimal**

Contenu exact à écrire :
```json
{
  "name": "analyse-theologique-luc-actes",
  "version": "1.0.0",
  "description": "Site statique de présentation et de lecture de l'analyse théologique réformée des écrits lucaniens.",
  "type": "module",
  "private": true,
  "scripts": {
    "test": "node --test assets/js/modules/",
    "validate:html": "echo 'Utiliser https://validator.w3.org/nu/ pour index.html et lecture.html'",
    "lighthouse": "echo 'Utiliser Lighthouse via DevTools Chrome (mobile + desktop)'",
    "axe": "echo 'Utiliser axe DevTools extension navigateur'"
  },
  "author": "André-Guy Bruneau",
  "license": "MIT"
}
```

- [ ] **Step 2 : Créer `.gitignore`**

Contenu exact :
```
# OS
.DS_Store
Thumbs.db

# Editors
.vscode/
.idea/
*.swp
*.swo

# Node (pour les outils dev éventuels)
node_modules/
npm-debug.log*
.npm/

# Local
.env
.env.local

# Tests artifacts
coverage/
.nyc_output/
*.log

# Build artifacts (aucun build en MVP, mais préventif)
dist/
build/
.cache/

# Lighthouse
.lighthouseci/
lighthouse-report.html
```

- [ ] **Step 3 : Créer les dossiers `assets/` avec `.gitkeep`**

Commande :
```bash
mkdir -p assets/css assets/js/modules assets/vendor assets/fonts assets/img assets/icons
touch assets/css/.gitkeep assets/js/.gitkeep assets/js/modules/.gitkeep assets/vendor/.gitkeep assets/fonts/.gitkeep assets/img/.gitkeep assets/icons/.gitkeep
```

Vérifier : `ls -la assets/` doit afficher 6 sous-dossiers.

- [ ] **Step 4 : Vérifier l'état git**

Run : `git status`
Expected : `prd.md`, `plan.md`, `package.json`, `.gitignore`, et les `assets/**/.gitkeep` apparaissent en untracked.

- [ ] **Step 5 : Premier commit (spec + structure)**

```bash
git add prd.md plan.md package.json .gitignore assets/
git commit -m "chore: scaffold project structure with PRD and plan

Adds the PRD v1.1 (prd.md), the implementation plan (plan.md), the
minimal package.json (ESM, no runtime deps), .gitignore, and the
empty assets/ directory tree."
```

Vérifier : `git log --oneline -1` affiche le nouveau commit.

---

### Task 2 : Auto-héberger les bibliothèques tierces (marked + DOMPurify) et les polices

**Files:**
- Create: `assets/vendor/marked.esm.min.js`
- Create: `assets/vendor/purify.min.js`
- Create: `assets/vendor/VENDORS.md`
- Create: `assets/fonts/source-serif-4-regular.woff2`
- Create: `assets/fonts/source-serif-4-italic.woff2`
- Create: `assets/fonts/source-serif-4-700.woff2`
- Create: `assets/fonts/inter-400.woff2`
- Create: `assets/fonts/inter-600.woff2`
- Create: `assets/fonts/cardo-regular.woff2`
- Create: `assets/fonts/FONTS.md`

- [ ] **Step 1 : Télécharger `marked` v12 ESM minifié**

Récupérer depuis jsDelivr (version pinnée v12.0.2) :
```bash
curl -fSL -o assets/vendor/marked.esm.min.js https://cdn.jsdelivr.net/npm/marked@12.0.2/lib/marked.esm.min.js
```
Vérifier : `wc -c assets/vendor/marked.esm.min.js` retourne entre 25 000 et 50 000 octets.

- [ ] **Step 2 : Télécharger `DOMPurify` v3 minifié**

```bash
curl -fSL -o assets/vendor/purify.min.js https://cdn.jsdelivr.net/npm/dompurify@3.0.11/dist/purify.min.js
```
Vérifier : `wc -c assets/vendor/purify.min.js` retourne entre 15 000 et 40 000 octets.

- [ ] **Step 3 : Créer `assets/vendor/VENDORS.md` (traçabilité)**

Contenu exact :
```markdown
# Bibliothèques tierces auto-hébergées

Aucun CDN tiers n'est appelé en runtime. Les fichiers ci-dessous sont des copies
figées versionnées dans le dépôt.

| Fichier | Version | Source | Licence | Date copie |
|---|---|---|---|---|
| `marked.esm.min.js` | 12.0.2 | https://github.com/markedjs/marked | MIT | 2026-04-24 |
| `purify.min.js` | 3.0.11 | https://github.com/cure53/DOMPurify | Apache-2.0 ou MPL-2.0 | 2026-04-24 |

## Mise à jour

Pour mettre à jour, télécharger la nouvelle version depuis jsDelivr ou unpkg,
remplacer le fichier, mettre à jour la version et la date dans ce tableau,
puis relancer la checklist de tests (cf. `prd.md` §6.4).
```

- [ ] **Step 4 : Télécharger les polices Source Serif 4 (Regular, Italic, Bold)**

Source : Google Fonts API ou repo officiel Adobe Fonts (Open Font License). Utiliser le sous-ensemble Latin Extended pour le français + grec polytonique partiel. Récupérer via `google-webfonts-helper.herokuapp.com` (interface humaine) ou directement les fichiers `.woff2` depuis https://fonts.gstatic.com après inspection du CSS Google Fonts.

Commandes (URLs à valider en pratique car Google Fonts génère des URLs dynamiques) :
```bash
# Source Serif 4 — récupération via google-webfonts-helper
curl -fSL -o assets/fonts/source-serif-4-regular.woff2 \
  "https://gwfh.mranftl.com/api/fonts/source-serif-4?download=zip&subsets=latin-ext&variants=regular&formats=woff2"
# (Si l'URL ci-dessus retourne un zip, l'extraire ; sinon utiliser la version unitaire)
```

Vérification : chaque fichier `.woff2` doit faire entre 30 et 100 KB.

**Si les URLs automatiques échouent**, télécharger manuellement depuis :
- https://fonts.google.com/specimen/Source+Serif+4
- https://fonts.google.com/specimen/Inter
- https://fonts.google.com/specimen/Cardo

Et placer les fichiers `.woff2` Latin + Latin Extended (uniquement) dans `assets/fonts/`.

- [ ] **Step 5 : Télécharger Inter (400, 600)**

```bash
curl -fSL -o assets/fonts/inter-400.woff2 \
  "https://gwfh.mranftl.com/api/fonts/inter?download=zip&subsets=latin-ext&variants=regular&formats=woff2"
curl -fSL -o assets/fonts/inter-600.woff2 \
  "https://gwfh.mranftl.com/api/fonts/inter?download=zip&subsets=latin-ext&variants=600&formats=woff2"
```

- [ ] **Step 6 : Télécharger Cardo Regular (pour grec polytonique)**

```bash
curl -fSL -o assets/fonts/cardo-regular.woff2 \
  "https://gwfh.mranftl.com/api/fonts/cardo?download=zip&subsets=latin-ext,greek-ext&variants=regular&formats=woff2"
```

Vérifier : `cardo-regular.woff2` est présent et > 50 KB (la couverture grecque alourdit le fichier).

- [ ] **Step 7 : Créer `assets/fonts/FONTS.md` (traçabilité)**

Contenu exact :
```markdown
# Polices auto-hébergées

Toutes les polices sont sous Open Font License (OFL).

| Fichier | Famille | Variante | Source | Licence |
|---|---|---|---|---|
| `source-serif-4-regular.woff2` | Source Serif 4 | 400 normal | Adobe / Google Fonts | OFL 1.1 |
| `source-serif-4-italic.woff2`  | Source Serif 4 | 400 italic | Adobe / Google Fonts | OFL 1.1 |
| `source-serif-4-700.woff2`     | Source Serif 4 | 700 normal | Adobe / Google Fonts | OFL 1.1 |
| `inter-400.woff2`              | Inter           | 400 normal | Rasmus Andersson / Google Fonts | OFL 1.1 |
| `inter-600.woff2`              | Inter           | 600 normal | Rasmus Andersson / Google Fonts | OFL 1.1 |
| `cardo-regular.woff2`          | Cardo           | 400 normal | David J. Perry / Google Fonts | OFL 1.1 |

Sous-ensemble : `latin` + `latin-ext` (français complet) + `greek-ext` pour Cardo.

## Pourquoi auto-hébergées ?

Confidentialité totale : aucun appel à `fonts.gstatic.com` en production.
Conforme à la CSP `'self'` stricte (cf. `prd.md` §10.6).
```

- [ ] **Step 8 : Commit vendor + fonts**

```bash
git add assets/vendor/ assets/fonts/
git commit -m "chore: vendor third-party libs and self-host fonts

- marked v12.0.2 (MIT) and DOMPurify v3.0.11 (Apache-2.0/MPL-2.0)
  copied locally to avoid any CDN call at runtime.
- Source Serif 4 (regular, italic, 700), Inter (400, 600), and Cardo
  (regular, with Greek-ext subset) self-hosted as woff2.
- VENDORS.md and FONTS.md document provenance and update procedure."
```

---

### Task 3 : Créer les fichiers CSS de base (tokens, base, components)

**Files:**
- Create: `assets/css/tokens.css`
- Create: `assets/css/base.css`
- Create: `assets/css/components.css`

- [ ] **Step 1 : Créer `assets/css/tokens.css` (palette + typo + espacement + breakpoints + motion)**

Contenu exact (reprend Annexe B du PRD, étendu avec les breakpoints du §7.4) :
```css
/* ============================================================
   Design tokens — Analyse théologique Luc-Actes
   Cf. prd.md §9 (Identité visuelle) et §7.4 (Breakpoints)
   ============================================================ */

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

  --fs-xs: 0.8rem;
  --fs-sm: 1rem;
  --fs-base: 1.1875rem;
  --fs-md: 1.4375rem;
  --fs-lg: 1.8125rem;
  --fs-xl: 2.25rem;
  --fs-2xl: 3.5rem;

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
  --shadow-soft: 0 1px 0 0 rgba(255, 255, 255, 0.04) inset, 0 4px 12px rgba(0, 0, 0, 0.3);
  --shadow-card: 0 1px 0 0 rgba(255, 255, 255, 0.04) inset, 0 8px 24px rgba(0, 0, 0, 0.4);
  --shadow-floating: 0 12px 40px rgba(0, 0, 0, 0.5);
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
  --header-h: 64px;
  --sidebar-w: 260px;
  --sidebar-rail-w: 48px;
  --aside-w: 220px;

  /* === Breakpoints (référence — utilisés via @media) === */
  --bp-sm: 414px;
  --bp-md: 768px;
  --bp-lg: 1024px;
  --bp-xl: 1280px;
  --bp-2xl: 1600px;
}

/* Override de --fs-base selon le mode de taille (lecteur) */
html.text-size--compact { --fs-base: 1.0625rem; }
html.text-size--ample   { --fs-base: 1.375rem; }

/* Respect des préférences utilisateur */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    transition-duration: 0.01ms !important;
    animation-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

- [ ] **Step 2 : Créer `assets/css/base.css` (reset + typographie de base + body)**

Contenu exact :
```css
/* ============================================================
   Base — reset, typographie, body
   Cf. prd.md §9.3 (Typographie)
   ============================================================ */

/* Polices auto-hébergées */
@font-face {
  font-family: "Source Serif 4";
  src: url("/assets/fonts/source-serif-4-regular.woff2") format("woff2");
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}
@font-face {
  font-family: "Source Serif 4";
  src: url("/assets/fonts/source-serif-4-italic.woff2") format("woff2");
  font-weight: 400;
  font-style: italic;
  font-display: swap;
}
@font-face {
  font-family: "Source Serif 4";
  src: url("/assets/fonts/source-serif-4-700.woff2") format("woff2");
  font-weight: 700;
  font-style: normal;
  font-display: swap;
}
@font-face {
  font-family: "Inter";
  src: url("/assets/fonts/inter-400.woff2") format("woff2");
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}
@font-face {
  font-family: "Inter";
  src: url("/assets/fonts/inter-600.woff2") format("woff2");
  font-weight: 600;
  font-style: normal;
  font-display: swap;
}
@font-face {
  font-family: "Cardo";
  src: url("/assets/fonts/cardo-regular.woff2") format("woff2");
  font-weight: 400;
  font-style: normal;
  font-display: swap;
  unicode-range: U+0370-03FF, U+1F00-1FFF; /* Greek + Greek Extended */
}

/* Reset minimaliste */
*, *::before, *::after { box-sizing: border-box; }
html { -webkit-text-size-adjust: 100%; text-size-adjust: 100%; }
body, h1, h2, h3, h4, h5, h6, p, ul, ol, blockquote, figure { margin: 0; padding: 0; }
ul, ol { list-style: none; }
img, svg { display: block; max-width: 100%; height: auto; }
button { font: inherit; cursor: pointer; background: none; border: none; color: inherit; }
a { color: inherit; text-decoration: none; }
input, textarea, select { font: inherit; }

/* Body */
html {
  background: var(--bg-base);
  color: var(--text-primary);
  font-family: var(--font-serif);
  font-size: 100%; /* 16 px par défaut */
  line-height: var(--lh-body);
  scroll-behavior: smooth;
}

body {
  min-height: 100vh;
  font-feature-settings: "liga", "kern", "onum";
}

/* Typographie : titres */
h1, h2, h3, h4 {
  font-family: var(--font-serif);
  line-height: var(--lh-heading);
  letter-spacing: -0.01em;
  color: var(--text-primary);
}
h1 { font-size: var(--fs-2xl); font-weight: 700; }
h2 { font-size: var(--fs-xl); font-weight: 700; }
h3 { font-size: var(--fs-lg); font-weight: 600; }
h4 { font-size: var(--fs-md); font-weight: 600; font-style: italic; color: var(--quote-amber); }

/* Paragraphes et listes */
p { margin-bottom: var(--space-4); }
ul, ol { padding-left: var(--space-6); margin-bottom: var(--space-4); }
ul { list-style: disc; }
ul li::marker { color: var(--accent); }
ol { list-style: decimal; font-feature-settings: "tnum"; }
ol li::marker { color: var(--accent); font-weight: 600; }

/* Italique = termes grecs/latins */
em { color: var(--quote-amber); font-style: italic; }

/* Gras */
strong { color: var(--text-primary); font-weight: 700; }

/* Liens */
a {
  color: var(--accent);
  text-decoration: underline;
  text-decoration-thickness: 1px;
  text-underline-offset: 0.15em;
  transition: color var(--motion-quick) var(--easing);
}
a:hover { color: var(--accent-hover); }
a:focus-visible {
  outline: none;
  box-shadow: var(--ring-focus);
  border-radius: var(--radius-sm);
}

/* Citations bibliques (blockquote) */
blockquote {
  border-left: 3px solid var(--accent);
  background: rgba(255, 122, 26, 0.04);
  padding: var(--space-4) var(--space-6);
  margin: var(--space-6) 0;
  font-style: italic;
  color: var(--text-primary);
  border-radius: 0 var(--radius-sm) var(--radius-sm) 0;
}

/* Tableaux */
table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin: var(--space-6) 0;
  font-family: var(--font-sans);
  font-size: var(--fs-sm);
}
thead {
  background: var(--bg-elevated);
  position: sticky;
  top: var(--topbar-h);
}
th, td {
  text-align: left;
  padding: var(--space-3) var(--space-4);
  border-bottom: 1px solid var(--rule);
}
th { font-weight: 600; color: var(--text-secondary); }
tbody tr:nth-child(even) { background: rgba(255, 255, 255, 0.015); }

/* Filets */
hr {
  border: none;
  border-top: 1px solid var(--rule);
  margin: var(--space-8) 0;
}

/* Skip link */
.skip-link {
  position: absolute;
  top: -100px;
  left: var(--space-4);
  background: var(--accent);
  color: var(--bg-base);
  padding: var(--space-2) var(--space-4);
  font-family: var(--font-sans);
  font-weight: 600;
  border-radius: var(--radius-md);
  z-index: 1000;
  transition: top var(--motion-base) var(--easing);
}
.skip-link:focus {
  top: var(--space-4);
  outline: none;
}

/* Selection */
::selection { background: var(--accent-glow); color: var(--text-primary); }

/* Lang-specific */
:lang(grc) { font-family: var(--font-grec); }
```

- [ ] **Step 3 : Créer `assets/css/components.css` (boutons, cartes, badges, modale)**

Contenu exact :
```css
/* ============================================================
   Composants UI partagés
   Cf. prd.md §9.6 (Composants UI)
   ============================================================ */

/* === Boutons === */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-2);
  padding: var(--space-3) var(--space-6);
  font-family: var(--font-sans);
  font-size: var(--fs-sm);
  font-weight: 600;
  border-radius: var(--radius-md);
  text-decoration: none;
  transition: background var(--motion-quick) var(--easing),
              color var(--motion-quick) var(--easing),
              transform var(--motion-quick) var(--easing);
  white-space: nowrap;
}
.btn:focus-visible {
  outline: none;
  box-shadow: var(--ring-focus);
}

.btn-primary {
  background: var(--accent);
  color: var(--bg-base);
}
.btn-primary:hover { background: var(--accent-hover); color: var(--bg-base); }

.btn-secondary {
  background: transparent;
  color: var(--accent);
  border: 1.5px solid var(--accent);
}
.btn-secondary:hover { background: var(--accent-glow); color: var(--accent-hover); }

.btn-tertiary {
  background: transparent;
  color: var(--text-secondary);
  padding: var(--space-2) var(--space-3);
  text-decoration: underline;
  text-underline-offset: 0.2em;
}
.btn-tertiary:hover { color: var(--text-primary); }

.btn-icon {
  width: 40px;
  height: 40px;
  padding: 0;
  border-radius: var(--radius-md);
  background: transparent;
  color: var(--text-secondary);
}
.btn-icon:hover { background: var(--bg-overlay); color: var(--text-primary); }

/* === Cartes === */
.card {
  background: var(--bg-elevated);
  border: 1px solid var(--rule);
  border-radius: var(--radius-md);
  padding: var(--space-6);
  box-shadow: var(--shadow-soft);
  transition: transform var(--motion-base) var(--easing),
              box-shadow var(--motion-base) var(--easing);
}
.card-link:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-card);
}

/* === Badges === */
.badge {
  display: inline-block;
  padding: var(--space-1) var(--space-3);
  font-family: var(--font-sans);
  font-size: var(--fs-xs);
  font-weight: 500;
  border-radius: var(--radius-pill);
  border: 1px solid var(--rule);
  color: var(--text-secondary);
}
.badge--accent {
  background: var(--accent-soft);
  color: #FFE4D0;
  border-color: transparent;
}
.badge--muted {
  background: var(--bg-overlay);
  color: var(--text-secondary);
}

/* === Pull-quote === */
.pull-quote {
  background: var(--bg-elevated);
  border-left: 3px solid var(--accent);
  padding: var(--space-8);
  border-radius: 0 var(--radius-md) var(--radius-md) 0;
  font-family: var(--font-serif);
  font-size: var(--fs-md);
  font-style: italic;
  color: var(--text-primary);
  line-height: 1.5;
}
.pull-quote cite {
  display: block;
  margin-top: var(--space-4);
  font-family: var(--font-sans);
  font-size: var(--fs-xs);
  font-style: normal;
  color: var(--text-secondary);
  letter-spacing: 0.05em;
  text-transform: uppercase;
}

/* === Tableau divergences (carte mobile) === */
.divergence-card {
  background: var(--bg-elevated);
  border: 1px solid var(--rule);
  border-radius: var(--radius-md);
  padding: var(--space-4);
  margin-bottom: var(--space-3);
}
.divergence-card h4 {
  font-family: var(--font-sans);
  font-size: var(--fs-sm);
  color: var(--accent);
  margin-bottom: var(--space-2);
}
.divergence-card dl {
  display: grid;
  grid-template-columns: max-content 1fr;
  gap: var(--space-1) var(--space-3);
  font-size: var(--fs-sm);
}
.divergence-card dt { color: var(--text-secondary); font-weight: 600; }
.divergence-card dd { color: var(--text-primary); margin: 0; }

/* === Toast === */
.toast {
  position: fixed;
  bottom: var(--space-6);
  left: 50%;
  transform: translateX(-50%) translateY(100px);
  background: var(--bg-elevated);
  color: var(--text-primary);
  padding: var(--space-3) var(--space-6);
  border-radius: var(--radius-md);
  border: 1px solid var(--accent);
  box-shadow: var(--shadow-floating);
  font-family: var(--font-sans);
  font-size: var(--fs-sm);
  z-index: 100;
  opacity: 0;
  transition: opacity var(--motion-base) var(--easing),
              transform var(--motion-base) var(--easing);
  pointer-events: none;
}
.toast--visible {
  opacity: 1;
  transform: translateX(-50%) translateY(0);
}

/* === Visually hidden (accessibilité) === */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}
```

- [ ] **Step 4 : Commit CSS de base**

```bash
git add assets/css/tokens.css assets/css/base.css assets/css/components.css
git commit -m "feat(css): add design tokens, base typography, and shared components

- tokens.css: dark + amber palette, fluid typography scale (1.25 ratio),
  4px spacing scale, breakpoints, motion tokens, prefers-reduced-motion.
- base.css: self-hosted @font-face declarations (Source Serif 4, Inter,
  Cardo with Greek unicode-range), reset, headings, lists, blockquotes,
  tables, links, skip-link, ::selection.
- components.css: btn (primary/secondary/tertiary/icon), card, badge,
  pull-quote, divergence-card, toast, sr-only utility."
```

---

## Phase 2 — Page-vitrine (Tasks 4-7)

> Le squelette HTML de la landing est construit en 3 tâches successives (haut, milieu, bas), suivies d'une tâche dédiée à l'interactivité JS et au SEO. Chaque tâche produit une landing fonctionnelle, vérifiable visuellement par ouverture directe dans un navigateur.

### Task 4 : Landing — squelette + header sticky + hero + thèse + méthode O.I.A.

**Files:**
- Create: `index.html` (partiel, sections 1-4 du §7.2)
- Create: `assets/css/landing.css`

- [ ] **Step 1 : Créer `index.html` avec head + skip-link + header + hero + thèse + méthode**

Contenu exact :
```html
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="dark">
  <meta name="author" content="André-Guy Bruneau">
  <meta name="description" content="Exégèse réformée des écrits lucaniens (Luc-Actes) selon la méthode O.I.A., dans l'horizon confessionnel Westminster, Dort, 1689.">
  <meta name="robots" content="index, follow">
  <meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'self' 'unsafe-inline'; script-src 'self'; font-src 'self'; img-src 'self' data:; connect-src 'self'; frame-ancestors 'none'; base-uri 'self'; form-action 'none';">
  <title>Analyse théologique réformée — Luc-Actes</title>
  <link rel="canonical" href="/">
  <link rel="icon" type="image/svg+xml" href="/assets/icons/favicon.svg">
  <link rel="preload" as="font" type="font/woff2" href="/assets/fonts/source-serif-4-regular.woff2" crossorigin>
  <link rel="preload" as="font" type="font/woff2" href="/assets/fonts/inter-400.woff2" crossorigin>
  <link rel="stylesheet" href="/assets/css/tokens.css?v=v1">
  <link rel="stylesheet" href="/assets/css/base.css?v=v1">
  <link rel="stylesheet" href="/assets/css/components.css?v=v1">
  <link rel="stylesheet" href="/assets/css/landing.css?v=v1">
</head>
<body>
  <a href="#contenu" class="skip-link">Aller au contenu</a>

  <header class="site-header" id="site-header">
    <div class="site-header__inner">
      <a href="#hero" class="site-header__brand">
        <span aria-hidden="true">☧</span> Luc-Actes
      </a>
      <nav class="site-header__nav" aria-label="Navigation principale">
        <a href="#methode">Méthode</a>
        <a href="#apercu">Aperçu</a>
        <a href="#divergences">Divergences</a>
        <a href="#synthese">Synthèse</a>
        <a href="#a-propos">À propos</a>
      </nav>
      <a href="lecture.html" class="btn btn-primary site-header__cta">Lire l'analyse</a>
      <button class="btn-icon site-header__menu" aria-label="Ouvrir le menu" aria-expanded="false" aria-controls="mobile-drawer">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
      </button>
    </div>
    <nav class="mobile-drawer" id="mobile-drawer" aria-label="Navigation mobile" hidden>
      <a href="#methode">Méthode</a>
      <a href="#apercu">Aperçu</a>
      <a href="#divergences">Divergences</a>
      <a href="#synthese">Synthèse</a>
      <a href="#a-propos">À propos</a>
      <a href="lecture.html" class="btn btn-primary">Lire l'analyse</a>
    </nav>
  </header>

  <main id="contenu">
    <section class="hero" id="hero">
      <span aria-hidden="true" class="hero__filigrane">Λ</span>
      <div class="hero__content">
        <p class="hero__eyebrow">Méthode O.I.A. · NEG 1979 / NA28</p>
        <h1 class="hero__title">Analyse théologique réformée<br><span class="hero__title--accent">Luc-Actes</span></h1>
        <p class="hero__subtitle">Exégèse grammatico-historique des deux tomes lucaniens, dans l'horizon confessionnel classique : Westminster, Dort, 1689.</p>
        <div class="hero__actions">
          <a href="lecture.html" class="btn btn-primary">Lire l'analyse</a>
          <a href="AnalyseTheologique.md" class="btn btn-secondary" download>Télécharger le markdown</a>
          <a href="#" class="btn btn-tertiary" id="github-link">Voir sur GitHub →</a>
        </div>
        <p class="hero__meta"><span class="badge">~50 000 mots</span> <span class="badge">49 péricopes</span> <span class="badge">français</span> <span class="badge">libre</span></p>
      </div>
    </section>

    <section class="thesis" aria-labelledby="thesis-title">
      <h2 id="thesis-title" class="sr-only">Thèse directrice</h2>
      <blockquote class="thesis__quote">
        <p>« L'œuvre lucanienne présente le déploiement souverain, historique et irrésistible du plan rédempteur trinitaire — Père décrétant, Fils accomplissant, Esprit appliquant — depuis l'Incarnation à Bethléem jusqu'à la prédication apostolique à Rome. »</p>
        <cite>— Synthèse systématique, <i>locus</i> I</cite>
      </blockquote>
    </section>

    <section class="methode" id="methode" aria-labelledby="methode-title">
      <h2 id="methode-title" class="section__title">Méthode O.I.A.</h2>
      <div class="methode__grid">
        <article class="card methode__card">
          <span class="methode__icon" aria-hidden="true">🔍</span>
          <h3>Observation</h3>
          <p>Texte (NEG 1979), contexte historique, structure littéraire, analyse grammaticale (grec NA28).</p>
        </article>
        <article class="card methode__card">
          <span class="methode__icon" aria-hidden="true">📖</span>
          <h3>Interprétation</h3>
          <p>Sens auctorial, apport exégétique (Sproul, MacArthur), analogie de la foi, cohérence systématique.</p>
        </article>
        <article class="card methode__card">
          <span class="methode__icon" aria-hidden="true">🛡️</span>
          <h3>Application</h3>
          <p>Volet didactique (orthodoxie), élenctique (orthocardie), normatif (orthopraxie).</p>
        </article>
      </div>
    </section>

    <!-- Sections 5-11 ajoutées dans Task 5 et Task 6 -->

  </main>

  <!-- Footer ajouté dans Task 6 -->

  <script type="module" src="/assets/js/landing.js?v=v1"></script>
</body>
</html>
```

- [ ] **Step 2 : Créer `assets/css/landing.css` (header + hero + thèse + méthode)**

Contenu exact :
```css
/* ============================================================
   Landing — index.html
   Cf. prd.md §7.2, §8.1.0-8.1.3
   ============================================================ */

/* === Header sticky === */
.site-header {
  position: sticky;
  top: 0;
  z-index: 50;
  height: var(--header-h);
  background: rgba(14, 15, 18, 0.85);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border-bottom: 1px solid transparent;
  transition: border-color var(--motion-base) var(--easing),
              box-shadow var(--motion-base) var(--easing);
}
.site-header--scrolled {
  border-bottom-color: var(--rule);
  box-shadow: var(--shadow-soft);
}
.site-header__inner {
  display: flex;
  align-items: center;
  gap: var(--space-6);
  height: 100%;
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 var(--space-6);
}
.site-header__brand {
  font-family: var(--font-serif);
  font-style: italic;
  font-size: var(--fs-md);
  color: var(--accent);
  text-decoration: none;
  white-space: nowrap;
}
.site-header__nav {
  display: none;
  flex: 1;
  gap: var(--space-6);
  font-family: var(--font-sans);
  font-size: var(--fs-sm);
}
.site-header__nav a {
  color: var(--text-secondary);
  text-decoration: none;
  padding: var(--space-2) 0;
  border-bottom: 2px solid transparent;
  transition: color var(--motion-quick) var(--easing),
              border-color var(--motion-quick) var(--easing);
}
.site-header__nav a:hover { color: var(--text-primary); }
.site-header__nav a.active { color: var(--accent); border-bottom-color: var(--accent); }

.site-header__cta { display: none; padding: var(--space-2) var(--space-4); font-size: var(--fs-xs); }
.site-header__menu { margin-left: auto; }

@media (min-width: 768px) {
  .site-header__nav, .site-header__cta { display: flex; }
  .site-header__menu { display: none; }
}

/* === Mobile drawer === */
.mobile-drawer {
  position: fixed;
  inset: var(--header-h) 0 0 0;
  background: var(--bg-base);
  padding: var(--space-8);
  display: flex;
  flex-direction: column;
  gap: var(--space-4);
  font-family: var(--font-sans);
  font-size: var(--fs-md);
  z-index: 49;
}
.mobile-drawer[hidden] { display: none; }
.mobile-drawer a { color: var(--text-primary); text-decoration: none; padding: var(--space-3) 0; border-bottom: 1px solid var(--rule); }
.mobile-drawer .btn { margin-top: var(--space-4); }

/* === Hero === */
.hero {
  position: relative;
  min-height: 80vh;
  padding: var(--space-16) var(--space-6);
  display: flex;
  align-items: center;
  overflow: hidden;
  background: radial-gradient(ellipse 800px 400px at top right, rgba(255, 122, 26, 0.08), transparent 60%);
}
.hero__filigrane {
  position: absolute;
  top: 50%;
  right: -10%;
  transform: translateY(-50%);
  font-family: var(--font-serif);
  font-size: clamp(20rem, 40vw, 35rem);
  color: var(--text-primary);
  opacity: 0.04;
  pointer-events: none;
  user-select: none;
  line-height: 1;
}
.hero__content {
  position: relative;
  z-index: 1;
  max-width: 720px;
  margin: 0 auto 0 max(var(--space-6), calc(50% - 600px));
}
.hero__eyebrow {
  font-family: var(--font-sans);
  font-size: var(--fs-xs);
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--accent);
  margin-bottom: var(--space-4);
}
.hero__title {
  font-size: clamp(2.5rem, 5vw + 1rem, var(--fs-2xl));
  line-height: 1.1;
  margin-bottom: var(--space-6);
}
.hero__title--accent { color: var(--accent); font-style: italic; }
.hero__subtitle {
  font-size: var(--fs-md);
  color: var(--text-secondary);
  line-height: 1.5;
  margin-bottom: var(--space-8);
  max-width: 60ch;
}
.hero__actions {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-4);
  margin-bottom: var(--space-8);
}
.hero__meta { display: flex; flex-wrap: wrap; gap: var(--space-2); }

/* === Sections génériques === */
.section__title {
  text-align: center;
  margin-bottom: var(--space-12);
  font-size: clamp(1.75rem, 3vw + 1rem, var(--fs-xl));
}

/* === Thèse directrice === */
.thesis {
  padding: var(--space-16) var(--space-6);
  max-width: 900px;
  margin: 0 auto;
  text-align: center;
}
.thesis__quote {
  border: none;
  background: none;
  padding: 0;
  font-family: var(--font-serif);
  font-size: clamp(1.25rem, 2vw + 0.5rem, var(--fs-md));
  line-height: 1.5;
  font-style: italic;
}
.thesis__quote p { margin-bottom: var(--space-6); position: relative; padding: 0 var(--space-8); }
.thesis__quote p::before, .thesis__quote p::after {
  font-family: var(--font-serif);
  color: var(--accent);
  font-size: 3em;
  line-height: 0;
  position: absolute;
}
.thesis__quote p::before { content: "«"; left: 0; top: 0.5em; }
.thesis__quote p::after { content: "»"; right: 0; bottom: 0.1em; }
.thesis__quote cite {
  font-style: normal;
  font-family: var(--font-sans);
  font-size: var(--fs-xs);
  color: var(--text-secondary);
  letter-spacing: 0.1em;
  text-transform: uppercase;
}

/* === Méthode O.I.A. === */
.methode { padding: var(--space-16) var(--space-6); max-width: 1280px; margin: 0 auto; }
.methode__grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-6);
}
.methode__card { text-align: center; }
.methode__icon { font-size: 2.5rem; display: block; margin-bottom: var(--space-4); }
.methode__card h3 { color: var(--accent); margin-bottom: var(--space-3); font-style: normal; }
.methode__card p { color: var(--text-secondary); margin: 0; }

@media (min-width: 768px) {
  .methode__grid { grid-template-columns: repeat(3, 1fr); }
}
```

- [ ] **Step 3 : Vérifier visuellement dans un navigateur**

Ouvrir `index.html` directement dans Chrome/Firefox (file:// ou via serveur local `python -m http.server 8000`).

Vérifier :
- Le header sticky reste visible au scroll
- Le hero s'affiche avec le titre, sous-titre, 3 CTA, badges
- Le filigrane Λ est visible mais discret en arrière-plan
- La citation thèse s'affiche centrée avec guillemets orange
- Les 3 cartes méthode s'affichent en grille responsive

Capturer une capture d'écran rapide pour valider l'esthétique.

- [ ] **Step 4 : Commit**

```bash
git add index.html assets/css/landing.css
git commit -m "feat(landing): add header, hero, thesis, and method sections

index.html sections 1-4 of §7.2: sticky header with mobile drawer,
hero with filigree Λ and 3 CTAs, thesis blockquote, 3-column method
O.I.A. cards with preserved emojis (🔍 📖 🛡️). landing.css covers
the corresponding styles."
```

---

### Task 5 : Landing — corpus + aperçu TOC + tableau divergences

**Files:**
- Modify: `index.html` (ajouter sections 5-7 du §7.2)
- Modify: `assets/css/landing.css` (styles correspondants)

- [ ] **Step 1 : Insérer les 3 sections dans `index.html`**

Localiser la ligne `<!-- Sections 5-11 ajoutées dans Task 5 et Task 6 -->` dans `index.html` et la **remplacer** par :

```html
    <section class="corpus" aria-labelledby="corpus-title">
      <h2 id="corpus-title" class="section__title">Corpus d'appui</h2>
      <div class="corpus__grid">
        <div class="corpus__group">
          <h3>Texte biblique</h3>
          <ul><li>NEG 1979</li><li>NA28</li></ul>
        </div>
        <div class="corpus__group">
          <h3>Études</h3>
          <ul><li>Reformation Study Bible (Sproul)</li><li>MacArthur Study Bible &amp; NT Commentary</li></ul>
        </div>
        <div class="corpus__group">
          <h3>Confessions</h3>
          <ul><li>Westminster (1647)</li><li>Dort (1619)</li><li>1689 LBC</li><li>Heidelberg (1563)</li><li>Helvetica posterior (1566)</li></ul>
        </div>
        <div class="corpus__group">
          <h3>Dogmaticiens</h3>
          <ul><li>Calvin · Owen · Turretin</li><li>Bavinck · Hodge · Warfield</li><li>Berkhof · Murray · Ferguson</li></ul>
        </div>
      </div>
    </section>

    <section class="apercu" id="apercu" aria-labelledby="apercu-title">
      <h2 id="apercu-title" class="section__title">Aperçu — péricopes phares</h2>
      <ul class="apercu__list">
        <li><a href="lecture.html#luc-126-38--annonciation-à-marie">Luc 1.26-38 — Annonciation à Marie</a></li>
        <li><a href="lecture.html#luc-21-20--nativité">Luc 2.1-20 — Nativité</a></li>
        <li><a href="lecture.html#luc-414-30--manifeste-messianique-à-nazareth">Luc 4.14-30 — Manifeste à Nazareth</a></li>
        <li><a href="lecture.html#luc-2214-38--institution-de-la-cène">Luc 22.14-38 — Institution de la Cène</a></li>
        <li><a href="lecture.html#luc-241-53--résurrection-emmaüs-ascension">Luc 24.1-53 — Résurrection</a></li>
        <li><a href="lecture.html#actes-21-41--pentecôte-et-kérygme-pétrinien">Actes 2.1-41 — Pentecôte</a></li>
        <li><a href="lecture.html#actes-91-31--conversion-de-saul">Actes 9.1-31 — Conversion de Saul</a></li>
        <li><a href="lecture.html#actes-1716-34--discours-de-laréopage">Actes 17.16-34 — Aréopage</a></li>
        <li><a href="lecture.html#actes-2817-31--rome-et-ouverture-finale">Actes 28.17-31 — Rome</a></li>
      </ul>
      <p class="apercu__cta"><a href="lecture.html" class="btn btn-secondary">Voir les 49 péricopes</a></p>
    </section>

    <section class="divergences" id="divergences" aria-labelledby="divergences-title">
      <h2 id="divergences-title" class="section__title">Tableau synoptique des divergences</h2>
      <div class="divergences__table-wrap">
        <table class="divergences__table">
          <thead>
            <tr>
              <th><i>Locus</i></th>
              <th>Position retenue</th>
              <th>R.C. Sproul</th>
              <th>John MacArthur</th>
              <th>Texte-pivot</th>
            </tr>
          </thead>
          <tbody>
            <tr><td>Baptême</td><td class="divergences__position">Paedobaptisme alliantiel</td><td>Paedobaptiste (Westminster)</td><td>Credobaptiste (1689)</td><td>Ac 2.39 ; 16.15</td></tr>
            <tr><td>Millénium</td><td class="divergences__position">Amillénarisme</td><td>Amillénariste</td><td>Prémillénariste futuriste</td><td>Luc 19.11 ; Ac 1.6-8</td></tr>
            <tr><td>Charismata</td><td class="divergences__position">Cessationnisme confessionnel</td><td>Cessationniste modéré</td><td>Cessationniste strict (<i>Strange Fire</i>)</td><td>Ac 2 ; 1 Cor 13.8</td></tr>
            <tr><td>Cène</td><td class="divergences__position">Présence spirituelle réelle (Calvin)</td><td>Présence spirituelle réelle</td><td>Mémorialisme affirmé</td><td>Luc 22.19-20</td></tr>
            <tr><td>Israël-Église</td><td class="divergences__position">Continuité alliantielle</td><td>Continuité alliantielle</td><td>Distinction dispensationnelle</td><td>Ac 15.14-18 ; Ga 3.29</td></tr>
            <tr><td>Justification</td><td class="divergences__position">Forensique, <i>sola fide</i></td><td><span class="divergences__accord">Idem (accord total)</span></td><td><span class="divergences__accord">Idem (accord total)</span></td><td>Luc 18.14 ; Ac 13.38-39</td></tr>
            <tr><td>Élection</td><td class="divergences__position">Inconditionnelle (Dort I)</td><td><span class="divergences__accord">Idem (accord total)</span></td><td><span class="divergences__accord">Idem (accord total)</span></td><td>Ac 13.48 ; Luc 1.28</td></tr>
          </tbody>
        </table>
      </div>
    </section>
```

- [ ] **Step 2 : Ajouter les styles correspondants à `assets/css/landing.css`**

Append au fichier :
```css
/* === Corpus === */
.corpus { padding: var(--space-16) var(--space-6); max-width: 1280px; margin: 0 auto; background: var(--bg-elevated); border-radius: var(--radius-lg); }
.corpus__grid { display: grid; grid-template-columns: 1fr; gap: var(--space-8); }
.corpus__group h3 { font-family: var(--font-sans); font-size: var(--fs-sm); text-transform: uppercase; letter-spacing: 0.1em; color: var(--accent); margin-bottom: var(--space-3); font-style: normal; }
.corpus__group ul { padding: 0; list-style: none; }
.corpus__group li { padding: var(--space-1) 0; color: var(--text-secondary); border-bottom: 1px solid var(--rule); }
.corpus__group li:last-child { border-bottom: none; }

@media (min-width: 768px) { .corpus__grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .corpus__grid { grid-template-columns: repeat(4, 1fr); } }

/* === Aperçu TOC === */
.apercu { padding: var(--space-16) var(--space-6); max-width: 900px; margin: 0 auto; }
.apercu__list { display: grid; grid-template-columns: 1fr; gap: var(--space-2); padding: 0; list-style: none; }
.apercu__list a { display: block; padding: var(--space-3) var(--space-4); background: var(--bg-elevated); border: 1px solid var(--rule); border-radius: var(--radius-md); color: var(--text-primary); text-decoration: none; transition: border-color var(--motion-quick) var(--easing), background var(--motion-quick) var(--easing); }
.apercu__list a:hover { border-color: var(--accent); background: var(--bg-overlay); }
.apercu__cta { text-align: center; margin-top: var(--space-8); }

@media (min-width: 768px) { .apercu__list { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .apercu__list { grid-template-columns: repeat(3, 1fr); } }

/* === Divergences === */
.divergences { padding: var(--space-16) var(--space-6); max-width: 1280px; margin: 0 auto; }
.divergences__table-wrap { overflow-x: auto; -webkit-overflow-scrolling: touch; border-radius: var(--radius-md); border: 1px solid var(--rule); }
.divergences__table { margin: 0; min-width: 720px; }
.divergences__table th { background: var(--bg-elevated); position: sticky; top: 0; }
.divergences__position { background: rgba(255, 122, 26, 0.06); font-weight: 500; color: var(--text-primary); }
.divergences__accord { color: var(--text-muted); font-style: italic; }

@media (max-width: 767px) {
  .divergences__table-wrap { padding-bottom: var(--space-2); }
  .divergences__table-wrap::after { content: "← faites défiler →"; display: block; text-align: center; padding: var(--space-2); color: var(--text-muted); font-family: var(--font-sans); font-size: var(--fs-xs); }
}
```

- [ ] **Step 3 : Vérifier visuellement**

Ouvrir `index.html`, scroller jusqu'aux nouvelles sections. Vérifier :
- Corpus s'affiche en 4 colonnes sur desktop, 2 sur tablette, 1 sur mobile
- Aperçu : 9 péricopes en grille 3 colonnes desktop, liens cliquables
- Tableau divergences : header sticky, colonne « Position retenue » en surbrillance ambrée, scroll horizontal sur mobile avec indicateur

- [ ] **Step 4 : Commit**

```bash
git add index.html assets/css/landing.css
git commit -m "feat(landing): add corpus, perimeter overview, and divergences table

- Corpus: 4-column responsive grid (Bible, études, confessions, dogmaticiens).
- Aperçu: 9 phare pericopes with deep links to lecture.html anchors.
- Divergences: 7-row 5-column table with sticky header, amber-highlighted
  position column, horizontal scroll on mobile with hint."
```

---

### Task 6 : Landing — citations + synthèse 8 loci + à propos + bibliographie + footer

**Files:**
- Modify: `index.html`
- Modify: `assets/css/landing.css`

- [ ] **Step 1 : Insérer les sections finales dans `index.html`**

Insérer juste avant la balise `</main>` :

```html
    <section class="quotes" aria-labelledby="quotes-title">
      <h2 id="quotes-title" class="section__title">Citations marquantes</h2>
      <div class="quotes__grid">
        <blockquote class="pull-quote"><p><i>Asphaleia</i> — la certitude historique et objective de l'Évangile, non l'expérience subjective.</p><cite>Luc 1.1-4</cite></blockquote>
        <blockquote class="pull-quote"><p>Le Saint-Esprit viendra sur toi, et la puissance du Très-Haut te couvrira de son ombre.</p><cite>Luc 1.35</cite></blockquote>
        <blockquote class="pull-quote"><p>Il a renversé les puissants de leurs trônes, et il a élevé les humbles.</p><cite>Magnificat — Luc 1.52</cite></blockquote>
        <blockquote class="pull-quote"><p>Il vous est né un Sauveur, qui est le Christ, le Seigneur.</p><cite>Luc 2.11</cite></blockquote>
        <blockquote class="pull-quote"><p>Aujourd'hui cette parole de l'Écriture, que vous venez d'entendre, est accomplie.</p><cite>Luc 4.21</cite></blockquote>
        <blockquote class="pull-quote"><p>Lorsque le temps où il devait être enlevé du monde approcha, Jésus prit la résolution de se rendre à Jérusalem.</p><cite>Luc 9.51</cite></blockquote>
        <blockquote class="pull-quote"><p>Tous ceux qui étaient destinés à la vie éternelle crurent.</p><cite>Actes 13.48</cite></blockquote>
        <blockquote class="pull-quote"><p>Le Seigneur ouvrit son cœur, pour qu'elle fût attentive à ce que disait Paul.</p><cite>Actes 16.14 — Lydie</cite></blockquote>
        <blockquote class="pull-quote"><p><i>Akōlytōs</i> — sans obstacle. L'Évangile est inarrêtable.</p><cite>Actes 28.31</cite></blockquote>
      </div>
    </section>

    <section class="synthese" id="synthese" aria-labelledby="synthese-title">
      <h2 id="synthese-title" class="section__title">Synthèse en 8 <i>loci</i></h2>
      <ol class="synthese__list">
        <li><a href="lecture.html#i-théologie-propre-et-trinitaire"><strong>Théologie propre et trinitaire</strong> — Le Dieu <i>boulē</i>, prescient et souverain.</a></li>
        <li><a href="lecture.html#ii-christologie"><strong>Christologie</strong> — Plénitude chalcédonienne et triple <i>munus</i>.</a></li>
        <li><a href="lecture.html#iii-pneumatologie"><strong>Pneumatologie</strong> — Esprit personnel, divin, protagoniste de la mission.</a></li>
        <li><a href="lecture.html#iv-sotériologie"><strong>Sotériologie</strong> — Monergisme intégral et cinq <i>soli</i>.</a></li>
        <li><a href="lecture.html#v-ecclésiologie-et-sacrements"><strong>Ecclésiologie et sacrements</strong> — Notes, gouvernement presbytéral.</a></li>
        <li><a href="lecture.html#vi-eschatologie"><strong>Eschatologie</strong> — Royaume inauguré, amillénarisme, parousie corporelle.</a></li>
        <li><a href="lecture.html#vii-herméneutique-et-apologétique"><strong>Herméneutique et apologétique</strong> — <i>Sola Scriptura</i> et présuppositionnalisme.</a></li>
        <li><a href="lecture.html#viii-mission-et-coram-deo"><strong>Mission et <i>Coram Deo</i></strong> — Le « il faut » rédemptif, le chapitre 29 ouvert.</a></li>
      </ol>
    </section>

    <section class="about" id="a-propos" aria-labelledby="about-title">
      <h2 id="about-title" class="section__title">À propos</h2>
      <div class="about__content">
        <p>Cette analyse a été rédigée par <strong>André-Guy Bruneau</strong>, dans la posture confessionnelle de la <i>Westminster Confession of Faith</i> (1647), en dialogue critique avec R.C. Sproul (paedobaptisme commun) et John MacArthur (divergences signalées sur baptême, millénium, Cène, charismata).</p>
        <p>La méthode est strictement <strong>grammatico-historique</strong> : <i>Scriptura Scripturam interpretatur</i>, refus du subjectivisme, refus du libéralisme critique, refus du subjectivisme religieux.</p>
        <p>Le contenu est <strong>libre de droits sous licence ouverte</strong> ; les références bibliographiques pointent vers les éditions canoniques de chaque œuvre citée.</p>
      </div>
    </section>

    <section class="biblio" aria-labelledby="biblio-title">
      <h2 id="biblio-title" class="section__title">Bibliographie sommaire</h2>
      <div class="biblio__grid">
        <div class="biblio__group">
          <h3>Texte biblique et substrat critique</h3>
          <ul>
            <li><i>La Sainte Bible</i>, Nouvelle Édition de Genève 1979 (NEG 1979)</li>
            <li><i>Novum Testamentum Graece</i>, 28<sup>e</sup> édition (NA28)</li>
          </ul>
        </div>
        <div class="biblio__group">
          <h3>Études bibliques annotées</h3>
          <ul>
            <li>R.C. Sproul (éd.), <i>The Reformation Study Bible</i></li>
            <li>John MacArthur (éd.), <i>The MacArthur Study Bible</i> ; <i>NT Commentary</i> (Luke, Acts)</li>
          </ul>
        </div>
        <div class="biblio__group">
          <h3>Confessions et symboles</h3>
          <ul>
            <li><i>Westminster Confession of Faith</i> (1647)</li>
            <li><i>Canons of Dort</i> (1619)</li>
            <li><i>Second London Baptist Confession</i> (1689)</li>
            <li><i>Heidelberg Catechism</i> (1563)</li>
            <li><i>Confessio Helvetica Posterior</i> (1566)</li>
          </ul>
        </div>
        <div class="biblio__group">
          <h3>Corpus dogmatique</h3>
          <ul>
            <li>Jean Calvin, <i>Institution de la religion chrétienne</i> (1559)</li>
            <li>John Owen, <i>Works</i></li>
            <li>François Turretin, <i>Institutio Theologiae Elenchticae</i></li>
            <li>Herman Bavinck, <i>Reformed Dogmatics</i> (4 vol.)</li>
            <li>Charles Hodge, <i>Systematic Theology</i></li>
            <li>B.B. Warfield, <i>The Plan of Salvation</i></li>
            <li>Louis Berkhof, <i>Systematic Theology</i></li>
            <li>John Murray, <i>Redemption Accomplished and Applied</i></li>
            <li>Sinclair Ferguson, <i>The Holy Spirit</i></li>
          </ul>
        </div>
      </div>
      <p class="biblio__cta"><a href="lecture.html#références-documentaires" class="btn btn-tertiary">Voir bibliographie complète dans l'analyse →</a></p>
    </section>
```

Et insérer juste après `</main>`, avant `<script>` :

```html
  <footer class="footer">
    <div class="footer__inner">
      <div class="footer__zone footer__zone--brand">
        <p class="footer__brand">Analyse théologique réformée — Luc-Actes</p>
        <p class="footer__tagline"><i>Coram Deo</i> · <i>Asphaleia</i> · <i>Soli Deo gloria</i></p>
      </div>
      <div class="footer__zone footer__zone--links">
        <ul>
          <li><a href="lecture.html">Lire l'analyse intégrale</a></li>
          <li><a href="AnalyseTheologique.md" download>Télécharger le markdown source</a></li>
          <li><a href="#" id="footer-github">Dépôt GitHub</a></li>
          <li><a href="#" id="footer-issues">Signaler une coquille</a></li>
        </ul>
      </div>
      <div class="footer__zone footer__zone--meta">
        <p>Version du contenu : <strong>v1.0 — 2026-04-24</strong></p>
        <p>49 péricopes · ~50 000 mots</p>
        <p>Site sans cookies, sans tracker.</p>
      </div>
    </div>
    <div class="footer__bottom">
      <p>© <span id="footer-year">2026</span> André-Guy Bruneau · Licence : <a href="#" id="footer-license">à confirmer</a> · <i>Coram Deo, soli Deo gloria.</i></p>
    </div>
  </footer>
```

- [ ] **Step 2 : Ajouter les styles correspondants à `assets/css/landing.css`**

Append au fichier :
```css
/* === Citations marquantes === */
.quotes { padding: var(--space-16) var(--space-6); max-width: 1280px; margin: 0 auto; }
.quotes__grid { display: grid; grid-template-columns: 1fr; gap: var(--space-6); }
@media (min-width: 768px) { .quotes__grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .quotes__grid { grid-template-columns: repeat(3, 1fr); } }

/* === Synthèse 8 loci === */
.synthese { padding: var(--space-16) var(--space-6); max-width: 900px; margin: 0 auto; }
.synthese__list { padding: 0; list-style: none; counter-reset: locus; }
.synthese__list li { counter-increment: locus; margin-bottom: var(--space-3); }
.synthese__list a {
  display: flex; gap: var(--space-4); padding: var(--space-4);
  background: var(--bg-elevated); border: 1px solid var(--rule); border-radius: var(--radius-md);
  text-decoration: none; color: var(--text-primary);
  transition: border-color var(--motion-quick) var(--easing);
}
.synthese__list a:hover { border-color: var(--accent); }
.synthese__list a::before {
  content: counter(locus, upper-roman) ".";
  font-family: var(--font-serif); font-style: italic;
  color: var(--accent); font-size: var(--fs-md); min-width: 2.5rem;
}
.synthese__list strong { color: var(--accent); font-weight: 600; }

/* === À propos === */
.about { padding: var(--space-16) var(--space-6); max-width: 720px; margin: 0 auto; }
.about__content { font-size: var(--fs-base); line-height: var(--lh-body); }
.about__content p { margin-bottom: var(--space-4); }

/* === Bibliographie === */
.biblio { padding: var(--space-16) var(--space-6); max-width: 1280px; margin: 0 auto; background: var(--bg-elevated); border-radius: var(--radius-lg); }
.biblio__grid { display: grid; grid-template-columns: 1fr; gap: var(--space-8); }
.biblio__group h3 { font-family: var(--font-sans); font-size: var(--fs-sm); text-transform: uppercase; letter-spacing: 0.1em; color: var(--accent); margin-bottom: var(--space-3); font-style: normal; }
.biblio__group ul { padding-left: var(--space-4); list-style: disc; color: var(--text-secondary); }
.biblio__group li { margin-bottom: var(--space-1); }
.biblio__cta { text-align: center; margin-top: var(--space-8); }

@media (min-width: 768px) { .biblio__grid { grid-template-columns: repeat(2, 1fr); } }

/* === Footer === */
.footer { background: var(--bg-elevated); border-top: 1px solid var(--rule); padding: var(--space-12) var(--space-6) var(--space-6); margin-top: var(--space-16); }
.footer__inner { max-width: 1280px; margin: 0 auto; display: grid; grid-template-columns: 1fr; gap: var(--space-8); }
.footer__zone p, .footer__zone ul { margin: 0; padding: 0; }
.footer__zone ul { list-style: none; }
.footer__zone li { margin-bottom: var(--space-2); }
.footer__brand { font-family: var(--font-serif); font-size: var(--fs-md); margin-bottom: var(--space-2); }
.footer__tagline { font-family: var(--font-serif); font-style: italic; color: var(--accent); font-size: var(--fs-sm); }
.footer__zone--meta p { font-family: var(--font-sans); font-size: var(--fs-xs); color: var(--text-muted); margin-bottom: var(--space-1); }
.footer__bottom { max-width: 1280px; margin: var(--space-8) auto 0; padding-top: var(--space-6); border-top: 1px solid var(--rule); text-align: center; font-family: var(--font-sans); font-size: var(--fs-xs); color: var(--text-muted); }
.footer__bottom i { color: var(--accent); }

@media (min-width: 768px) { .footer__inner { grid-template-columns: 2fr 1.5fr 1fr; } }
```

- [ ] **Step 3 : Vérifier visuellement**

Ouvrir `index.html`, scroller jusqu'au footer. Vérifier les 5 nouvelles sections + footer en 3 colonnes.

- [ ] **Step 4 : Commit**

```bash
git add index.html assets/css/landing.css
git commit -m "feat(landing): add quotes, synthesis, about, bibliography, and footer

- Quotes: 9 pull-quotes in responsive grid (1/2/3 columns).
- Synthesis: ordered list of 8 loci with Roman numeral counters,
  each linking to the corresponding section in lecture.html.
- About: 3-paragraph confessional posture statement.
- Bibliography: 4-group nominative reference list.
- Footer: 3-zone layout (brand, links, meta) + bottom line with
  dynamic year, license placeholder, Coram Deo tagline."
```

---

### Task 7 : Landing — JavaScript interactif + SEO complet

**Files:**
- Create: `assets/js/landing.js`
- Modify: `index.html` (head : OG tags, JSON-LD)
- Create: `assets/icons/favicon.svg`
- Create: `sitemap.xml`
- Create: `robots.txt`

- [ ] **Step 1 : Créer `assets/js/landing.js`**

Contenu exact :
```javascript
/**
 * Landing — comportements interactifs.
 * Zéro dépendance ; aucun appel réseau ; ESM natif.
 */

const repoUrl = "https://github.com/agbruneau/Exploration"; // À ajuster en revue (Annexe D du PRD)

// === 1. Mise à jour des liens GitHub dynamiquement ===
const githubLink = document.getElementById("github-link");
if (githubLink) githubLink.href = repoUrl;
const footerGithub = document.getElementById("footer-github");
if (footerGithub) footerGithub.href = repoUrl;
const footerIssues = document.getElementById("footer-issues");
if (footerIssues) footerIssues.href = `${repoUrl}/issues/new`;
const footerLicense = document.getElementById("footer-license");
if (footerLicense) footerLicense.href = `${repoUrl}/blob/main/LICENSE`;

// === 2. Année dynamique du footer ===
const footerYear = document.getElementById("footer-year");
if (footerYear) footerYear.textContent = new Date().getFullYear();

// === 3. Header sticky : ombrage au scroll ===
const header = document.getElementById("site-header");
const updateHeaderShadow = () => {
  if (!header) return;
  if (window.scrollY > 200) header.classList.add("site-header--scrolled");
  else header.classList.remove("site-header--scrolled");
};
window.addEventListener("scroll", updateHeaderShadow, { passive: true });
updateHeaderShadow();

// === 4. Mobile drawer toggle ===
const menuBtn = document.querySelector(".site-header__menu");
const drawer = document.getElementById("mobile-drawer");
if (menuBtn && drawer) {
  menuBtn.addEventListener("click", () => {
    const isOpen = !drawer.hasAttribute("hidden");
    if (isOpen) {
      drawer.setAttribute("hidden", "");
      menuBtn.setAttribute("aria-expanded", "false");
    } else {
      drawer.removeAttribute("hidden");
      menuBtn.setAttribute("aria-expanded", "true");
    }
  });
  // Fermer au clic sur un lien
  drawer.querySelectorAll("a").forEach((a) => a.addEventListener("click", () => {
    drawer.setAttribute("hidden", "");
    menuBtn.setAttribute("aria-expanded", "false");
  }));
  // Fermer sur Esc
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && !drawer.hasAttribute("hidden")) {
      drawer.setAttribute("hidden", "");
      menuBtn.setAttribute("aria-expanded", "false");
      menuBtn.focus();
    }
  });
}

// === 5. Scroll-spy : mise en évidence du lien actif dans le nav ===
const navLinks = document.querySelectorAll(".site-header__nav a");
const sections = ["methode", "apercu", "divergences", "synthese", "a-propos"]
  .map((id) => document.getElementById(id))
  .filter(Boolean);

if ("IntersectionObserver" in window && sections.length) {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const id = entry.target.id;
          navLinks.forEach((link) => {
            link.classList.toggle("active", link.getAttribute("href") === `#${id}`);
          });
        }
      });
    },
    { rootMargin: "-30% 0px -60% 0px" }
  );
  sections.forEach((s) => observer.observe(s));
}
```

- [ ] **Step 2 : Créer `assets/icons/favicon.svg`**

Contenu exact (favicon SVG : Λ ambré sur fond charbon) :
```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect width="32" height="32" rx="6" fill="#0E0F12"/><text x="16" y="23" font-family="Georgia,serif" font-size="22" font-weight="700" font-style="italic" fill="#FF7A1A" text-anchor="middle">Λ</text></svg>
```

- [ ] **Step 3 : Enrichir `<head>` de `index.html` avec OG, Twitter Card, JSON-LD**

Localiser dans `index.html` la ligne `<title>Analyse théologique réformée — Luc-Actes</title>` et insérer **juste après** :

```html
  <!-- Open Graph -->
  <meta property="og:type" content="article">
  <meta property="og:title" content="Analyse théologique réformée — Luc-Actes">
  <meta property="og:description" content="Exégèse réformée des écrits lucaniens (Luc-Actes) selon la méthode O.I.A., dans l'horizon confessionnel Westminster, Dort, 1689.">
  <meta property="og:image" content="/assets/img/og-image.png">
  <meta property="og:image:width" content="1200">
  <meta property="og:image:height" content="630">
  <meta property="og:url" content="/">
  <meta property="og:locale" content="fr_FR">
  <meta property="og:site_name" content="Analyse théologique réformée">
  <meta property="article:author" content="André-Guy Bruneau">
  <meta property="article:section" content="Théologie">
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="Analyse théologique réformée — Luc-Actes">
  <meta name="twitter:description" content="Exégèse réformée des écrits lucaniens, Westminster, Dort, 1689.">
  <meta name="twitter:image" content="/assets/img/og-image.png">
  <!-- JSON-LD -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": "Analyse théologique réformée — Luc-Actes",
    "author": { "@type": "Person", "name": "André-Guy Bruneau" },
    "datePublished": "2026-04-24",
    "inLanguage": "fr",
    "about": ["Théologie réformée", "Évangile selon Luc", "Actes des Apôtres", "Exégèse", "Confession de Westminster"],
    "wordCount": 50000,
    "isAccessibleForFree": true
  }
  </script>
```

- [ ] **Step 4 : Créer `sitemap.xml` à la racine**

Contenu exact :
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://agbruneau.github.io/Exploration/</loc>
    <lastmod>2026-04-24</lastmod>
    <changefreq>monthly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://agbruneau.github.io/Exploration/lecture.html</loc>
    <lastmod>2026-04-24</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>
</urlset>
```

Note : remplacer l'URL par le domaine final si configuré (cf. PRD Annexe D).

- [ ] **Step 5 : Créer `robots.txt` à la racine**

Contenu exact :
```
User-agent: *
Allow: /

Sitemap: https://agbruneau.github.io/Exploration/sitemap.xml
```

- [ ] **Step 6 : Vérifier dans le navigateur**

- Ouvrir `index.html`, ouvrir DevTools Console : aucun message d'erreur
- Vérifier que le footer affiche `© 2026` (ou année actuelle)
- Sur mobile (DevTools responsive), cliquer sur le hamburger : drawer s'ouvre
- Scroller : header reçoit une ombre après 200 px
- Scroller jusqu'à `#methode` : lien « Méthode » du nav devient orange souligné

- [ ] **Step 7 : Commit**

```bash
git add assets/js/landing.js assets/icons/favicon.svg index.html sitemap.xml robots.txt
git commit -m "feat(landing): add interactivity, favicon, OG/Twitter/JSON-LD, sitemap

- landing.js: dynamic GitHub URLs, footer year, header scroll shadow,
  mobile drawer toggle (Esc close), IntersectionObserver scroll-spy
  for active nav link highlighting.
- favicon.svg: amber italic Λ on charcoal rounded square.
- index.html head: OG, Twitter Card, JSON-LD Article schema.
- sitemap.xml + robots.txt for indexability."
```

---

## Phase 3 — Page-lecteur (Tasks 8-13)

> Le lecteur est construit en 6 tâches : squelette HTML/CSS, modules JS testés (TDD pour helpers purs), puis intégration. Chaque module a une responsabilité unique.

### Task 8 : Lecteur — squelette HTML + CSS layout

**Files:**
- Create: `lecture.html`
- Create: `assets/css/lecture.css`

- [ ] **Step 1 : Créer `lecture.html`**

Contenu exact :
```html
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="dark">
  <meta name="author" content="André-Guy Bruneau">
  <meta name="description" content="Lecture intégrale en ligne de l'analyse théologique réformée Luc-Actes (~50 000 mots, 49 péricopes), méthode O.I.A.">
  <meta name="robots" content="index, follow">
  <meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'self' 'unsafe-inline'; script-src 'self'; font-src 'self'; img-src 'self' data:; connect-src 'self'; frame-ancestors 'none'; base-uri 'self'; form-action 'none';">
  <title>Lecture intégrale — Analyse théologique Luc-Actes</title>
  <link rel="canonical" href="/lecture.html">
  <link rel="icon" type="image/svg+xml" href="/assets/icons/favicon.svg">
  <link rel="preload" as="font" type="font/woff2" href="/assets/fonts/source-serif-4-regular.woff2" crossorigin>
  <link rel="preload" as="font" type="font/woff2" href="/assets/fonts/inter-400.woff2" crossorigin>
  <link rel="preload" as="fetch" href="/AnalyseTheologique.md" crossorigin>
  <link rel="stylesheet" href="/assets/css/tokens.css?v=v1">
  <link rel="stylesheet" href="/assets/css/base.css?v=v1">
  <link rel="stylesheet" href="/assets/css/components.css?v=v1">
  <link rel="stylesheet" href="/assets/css/lecture.css?v=v1">
</head>
<body class="reader">
  <a href="#contenu" class="skip-link">Aller au contenu</a>

  <div class="progress-bar" id="progress-bar" role="progressbar" aria-label="Progression de lecture" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"></div>

  <header class="topbar" id="topbar">
    <button class="btn-icon topbar__toggle" aria-label="Basculer la table des matières" aria-expanded="true" aria-controls="sidebar">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
    </button>
    <a href="index.html" class="topbar__title">Analyse théologique — Luc-Actes</a>
    <div class="topbar__controls">
      <button class="btn-icon" id="btn-search" aria-label="Rechercher dans l'analyse">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      </button>
      <button class="btn-icon" id="btn-text-size" aria-label="Taille de police" aria-haspopup="true" aria-expanded="false">
        <span aria-hidden="true" style="font-family:var(--font-serif);font-weight:700">Aa</span>
      </button>
      <button class="btn-icon" id="btn-focus" aria-label="Mode lecture concentrée" aria-pressed="false">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
      </button>
    </div>
  </header>

  <div class="reader-grid">
    <aside class="sidebar" id="sidebar" aria-label="Table des matières">
      <div class="sidebar__search" id="search-panel" hidden>
        <input type="search" id="search-input" placeholder="Rechercher…" aria-label="Rechercher dans l'analyse" autocomplete="off">
        <p class="sidebar__search-status" id="search-status" aria-live="polite"></p>
        <div class="sidebar__search-nav">
          <button class="btn-icon" id="search-prev" aria-label="Occurrence précédente" disabled>↑</button>
          <button class="btn-icon" id="search-next" aria-label="Occurrence suivante" disabled>↓</button>
          <button class="btn-icon" id="search-close" aria-label="Fermer la recherche">✕</button>
        </div>
      </div>
      <nav class="sidebar__toc" id="toc" aria-label="Sections de l'analyse">
        <p class="sidebar__loading">Chargement…</p>
      </nav>
    </aside>

    <main class="content" id="contenu">
      <article id="article-content" aria-busy="true">
        <div class="skeleton" aria-hidden="true">
          <div class="skeleton__title"></div>
          <div class="skeleton__line skeleton__line--short"></div>
          <div class="skeleton__line"></div>
          <div class="skeleton__line"></div>
          <div class="skeleton__line skeleton__line--medium"></div>
          <div class="skeleton__line"></div>
          <div class="skeleton__line skeleton__line--short"></div>
          <div class="skeleton__line"></div>
        </div>
      </article>
    </main>

    <aside class="aside" id="aside" aria-label="Ancres de la péricope">
      <p class="aside__title">Cette péricope</p>
      <ol class="aside__list" id="aside-list"></ol>
    </aside>
  </div>

  <button class="back-to-top" id="back-to-top" aria-label="Retour en haut" hidden>
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><line x1="12" y1="19" x2="12" y2="5"/><polyline points="5 12 12 5 19 12"/></svg>
  </button>

  <div class="toast" id="toast" role="status" aria-live="polite"></div>

  <script type="module" src="/assets/js/lecture.js?v=v1"></script>
</body>
</html>
```

- [ ] **Step 2 : Créer `assets/css/lecture.css`**

Contenu exact :
```css
/* ============================================================
   Lecteur — lecture.html
   Cf. prd.md §7.3, §8.2.*, §9 (composants)
   ============================================================ */

/* Empêcher le défilement du body quand mode concentré activé sur mobile */
.reader { background: var(--bg-base); }

/* === Top bar === */
.topbar {
  position: sticky; top: 0; z-index: 50;
  height: var(--topbar-h);
  background: rgba(14, 15, 18, 0.92);
  backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--rule);
  display: flex; align-items: center; padding: 0 var(--space-4); gap: var(--space-3);
}
.topbar__toggle { flex-shrink: 0; }
.topbar__title {
  flex: 1;
  font-family: var(--font-serif); font-style: italic;
  color: var(--text-primary); text-decoration: none;
  font-size: var(--fs-sm);
  white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
.topbar__controls { display: flex; gap: var(--space-1); }

/* === Progress bar === */
.progress-bar {
  position: fixed; top: var(--topbar-h); left: 0;
  height: 3px; width: 0%;
  background: var(--accent);
  z-index: 49;
  transition: width 100ms linear;
}
.focus-mode .progress-bar { height: 1px; opacity: 0.5; }

/* === Layout grille === */
.reader-grid {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-areas: "main";
  min-height: calc(100vh - var(--topbar-h));
}
@media (min-width: 1024px) {
  .reader-grid {
    grid-template-columns: var(--sidebar-w) 1fr;
    grid-template-areas: "sidebar main";
  }
}
@media (min-width: 1280px) {
  .reader-grid {
    grid-template-columns: var(--sidebar-w) 1fr var(--aside-w);
    grid-template-areas: "sidebar main aside";
  }
}

/* === Sidebar (TOC + recherche) === */
.sidebar {
  grid-area: sidebar;
  background: var(--bg-elevated);
  border-right: 1px solid var(--rule);
  position: sticky; top: var(--topbar-h);
  height: calc(100vh - var(--topbar-h));
  overflow-y: auto;
  padding: var(--space-4);
  font-family: var(--font-sans); font-size: var(--fs-sm);
}
@media (max-width: 1023px) {
  .sidebar {
    position: fixed; top: var(--topbar-h); left: 0;
    width: 80%; max-width: 360px;
    z-index: 40;
    transform: translateX(-100%);
    transition: transform var(--motion-base) var(--easing);
  }
  .sidebar--open { transform: translateX(0); box-shadow: var(--shadow-floating); }
}

.sidebar__loading { color: var(--text-muted); padding: var(--space-4); text-align: center; }
.sidebar__search { margin-bottom: var(--space-4); padding-bottom: var(--space-4); border-bottom: 1px solid var(--rule); }
.sidebar__search input {
  width: 100%; padding: var(--space-2) var(--space-3);
  background: var(--bg-base); border: 1px solid var(--rule);
  border-radius: var(--radius-sm); color: var(--text-primary);
  font-family: var(--font-sans); font-size: var(--fs-sm);
}
.sidebar__search input:focus { outline: none; border-color: var(--accent); }
.sidebar__search-status { font-size: var(--fs-xs); color: var(--text-muted); margin: var(--space-2) 0; min-height: 1.2em; }
.sidebar__search-nav { display: flex; gap: var(--space-1); justify-content: flex-end; }

.sidebar__toc ul { list-style: none; padding: 0; margin: 0; }
.sidebar__toc .toc-group {
  margin-bottom: var(--space-4);
  font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em;
  font-size: var(--fs-xs); color: var(--text-secondary);
  padding: var(--space-2) var(--space-3);
}
.sidebar__toc .toc-item {
  display: block; padding: var(--space-2) var(--space-3);
  color: var(--text-secondary); text-decoration: none;
  border-left: 3px solid transparent;
  transition: background var(--motion-quick) var(--easing), color var(--motion-quick) var(--easing);
}
.sidebar__toc .toc-item:hover { background: var(--bg-overlay); color: var(--text-primary); }
.sidebar__toc .toc-item--active {
  background: var(--bg-overlay); color: var(--text-primary);
  border-left-color: var(--accent); font-weight: 600;
}

/* === Contenu principal === */
.content {
  grid-area: main;
  padding: var(--space-8) var(--space-6);
  min-width: 0; /* éviter overflow grid */
}
.content article {
  max-width: var(--measure-confort);
  margin: 0 auto;
  font-size: var(--fs-base);
  line-height: var(--lh-body);
}

.focus-mode .content article { max-width: var(--measure-ample); }

/* Headings dans le contenu rendu */
.content h1 { font-size: var(--fs-2xl); color: var(--accent); margin: var(--space-12) 0 var(--space-6); }
.content h2 { font-size: var(--fs-xl); color: var(--text-primary); margin: var(--space-12) 0 var(--space-4); padding-bottom: var(--space-2); border-bottom: 1px solid var(--rule); }
.content h3 { font-size: var(--fs-lg); color: var(--text-primary); margin: var(--space-8) 0 var(--space-4); position: relative; }
.content h4 { font-size: var(--fs-md); color: var(--quote-amber); margin: var(--space-6) 0 var(--space-3); font-style: italic; }

/* Bouton ancre au survol */
.heading-anchor {
  opacity: 0;
  margin-left: var(--space-2);
  font-size: 0.7em;
  color: var(--text-muted);
  transition: opacity var(--motion-quick) var(--easing), color var(--motion-quick) var(--easing);
  background: none; border: none; cursor: pointer;
}
.content h2:hover .heading-anchor, .content h3:hover .heading-anchor, .content h4:hover .heading-anchor { opacity: 1; }
.heading-anchor:hover { color: var(--accent); }

/* Surlignage recherche */
mark.search-hit {
  background: var(--accent-glow);
  color: inherit; padding: 0 2px; border-radius: 2px;
}
mark.search-hit--active { background: var(--accent); color: var(--bg-base); }

/* === Aside (ancres internes) === */
.aside {
  grid-area: aside;
  position: sticky; top: var(--topbar-h);
  height: calc(100vh - var(--topbar-h));
  padding: var(--space-6) var(--space-4);
  border-left: 1px solid var(--rule);
  font-family: var(--font-sans); font-size: var(--fs-xs);
  overflow-y: auto;
}
.aside__title { color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: var(--space-3); }
.aside__list { padding: 0; list-style: none; }
.aside__list li { margin-bottom: var(--space-2); }
.aside__list a { color: var(--text-muted); text-decoration: none; }
.aside__list a:hover, .aside__list a.active { color: var(--accent); }

/* Mode concentré : cacher les sidebars */
.focus-mode .sidebar { display: none; }
.focus-mode .aside { display: none; }
.focus-mode .reader-grid { grid-template-columns: 1fr; grid-template-areas: "main"; }

/* === Back to top === */
.back-to-top {
  position: fixed; bottom: var(--space-6); right: var(--space-6);
  width: 48px; height: 48px;
  background: var(--bg-elevated); color: var(--accent);
  border: 1.5px solid var(--accent);
  border-radius: 50%;
  display: flex; align-items: center; justify-content: center;
  cursor: pointer;
  box-shadow: var(--shadow-card);
  transition: opacity var(--motion-base) var(--easing), transform var(--motion-base) var(--easing);
  z-index: 30;
}
.back-to-top[hidden] { display: none; }

/* === Skeleton (chargement) === */
.skeleton { padding: var(--space-8) 0; }
.skeleton__title, .skeleton__line {
  background: var(--bg-elevated);
  border-radius: var(--radius-sm);
  margin-bottom: var(--space-4);
  animation: skeleton-pulse 1.5s ease-in-out infinite;
}
.skeleton__title { height: 2em; width: 60%; margin-bottom: var(--space-6); }
.skeleton__line { height: 1.2em; width: 100%; }
.skeleton__line--short { width: 40%; }
.skeleton__line--medium { width: 75%; }

@keyframes skeleton-pulse {
  0%, 100% { opacity: 0.4; }
  50% { opacity: 0.7; }
}
@media (prefers-reduced-motion: reduce) {
  .skeleton__title, .skeleton__line { animation: none; opacity: 0.5; }
}

/* === Menu taille de police (popover) === */
.text-size-menu {
  position: absolute;
  background: var(--bg-elevated); border: 1px solid var(--rule); border-radius: var(--radius-md);
  box-shadow: var(--shadow-floating);
  padding: var(--space-2);
  z-index: 60;
  display: none;
}
.text-size-menu[data-open="true"] { display: block; }
.text-size-menu button {
  display: block; width: 100%; text-align: left;
  padding: var(--space-2) var(--space-4);
  color: var(--text-primary); font-family: var(--font-sans); font-size: var(--fs-sm);
  border-radius: var(--radius-sm);
}
.text-size-menu button:hover { background: var(--bg-overlay); }
.text-size-menu button[aria-checked="true"] { color: var(--accent); }

/* === Erreur de chargement === */
.error-banner {
  margin: var(--space-8) auto;
  max-width: 720px;
  padding: var(--space-6);
  background: var(--bg-elevated);
  border-left: 4px solid var(--accent);
  border-radius: 0 var(--radius-md) var(--radius-md) 0;
}
.error-banner h2 { font-size: var(--fs-md); margin-bottom: var(--space-3); color: var(--accent); }
.error-banner p { color: var(--text-secondary); margin-bottom: var(--space-4); }
.error-banner__actions { display: flex; gap: var(--space-3); flex-wrap: wrap; }

/* === Navigation séquentielle === */
.sequential-nav {
  display: grid; grid-template-columns: 1fr 1fr;
  gap: var(--space-4);
  margin: var(--space-12) 0;
  padding: var(--space-6) 0;
  border-top: 1px solid var(--rule);
}
.sequential-nav a {
  display: block; padding: var(--space-4);
  background: var(--bg-elevated); border: 1px solid var(--rule); border-radius: var(--radius-md);
  text-decoration: none; color: var(--text-primary);
  font-family: var(--font-sans); font-size: var(--fs-sm);
  transition: border-color var(--motion-quick) var(--easing);
}
.sequential-nav a:hover { border-color: var(--accent); }
.sequential-nav__label { display: block; font-size: var(--fs-xs); color: var(--text-secondary); margin-bottom: var(--space-1); }
.sequential-nav__title { color: var(--accent); font-weight: 500; }
.sequential-nav__next { text-align: right; }
.sequential-nav__none { visibility: hidden; }

@media (max-width: 767px) {
  .sequential-nav { grid-template-columns: 1fr; }
  .sequential-nav__next { order: -1; text-align: left; }
}
```

- [ ] **Step 3 : Vérification visuelle**

Ouvrir `lecture.html`. Vérifier :
- Top bar avec hamburger + titre + 3 contrôles (recherche, Aa, focus)
- Skeleton de chargement visible (animation pulse)
- Sidebar TOC à gauche avec « Chargement… »
- Sur desktop ≥ 1280 px : aside droite visible
- Sur mobile : sidebar cachée hors écran

Aucune erreur JS attendue (pas de JS chargé encore — sera ajouté dans tâches suivantes).

- [ ] **Step 4 : Commit**

```bash
git add lecture.html assets/css/lecture.css
git commit -m "feat(reader): add HTML skeleton and CSS layout for lecture page

- lecture.html: top bar (hamburger + title + search/Aa/focus controls),
  progress bar, 3-zone grid (sidebar / content / aside), skeleton
  loader, back-to-top button, toast container.
- lecture.css: sticky top bar with blur, responsive grid breakpoints
  (1c → 2c at 1024 → 3c at 1280), skeleton pulse animation respecting
  prefers-reduced-motion, focus-mode hides sidebars and widens content."
```

---

### Task 9 : Lecteur — module render (TDD slug helper) + intégration

**Files:**
- Create: `assets/js/modules/slug.js`
- Create: `assets/js/modules/slug.test.js`
- Create: `assets/js/modules/render.js`
- Create: `assets/js/modules/states.js`
- Create: `assets/js/lecture.js`

- [ ] **Step 1 : Écrire le test du helper `slug.js` (TDD — test d'abord)**

Créer `assets/js/modules/slug.test.js` :
```javascript
import { test } from "node:test";
import assert from "node:assert/strict";
import { slugify } from "./slug.js";

test("slugify lowercases and replaces spaces with dashes", () => {
  assert.equal(slugify("Hello World"), "hello-world");
});

test("slugify preserves French accents (GitHub style)", () => {
  assert.equal(slugify("Luc 2.1-20 — Nativité"), "luc-21-20--nativité");
});

test("slugify strips standalone punctuation but keeps inline accents", () => {
  assert.equal(slugify("Luc 1.26-38 — Annonciation à Marie"), "luc-126-38--annonciation-à-marie");
});

test("slugify handles em-dash and double-dash conversion", () => {
  // L'em-dash devient deux tirets dans la convention GitHub
  assert.equal(slugify("Section — Sous-section"), "section--sous-section");
});

test("slugify handles section roman numerals", () => {
  assert.equal(slugify("I. Théologie propre et trinitaire"), "i-théologie-propre-et-trinitaire");
});

test("slugify removes leading and trailing dashes", () => {
  assert.equal(slugify("  Hello  "), "hello");
});

test("slugify handles empty input", () => {
  assert.equal(slugify(""), "");
  assert.equal(slugify("   "), "");
});
```

- [ ] **Step 2 : Lancer le test pour vérifier qu'il échoue**

```bash
node --test assets/js/modules/slug.test.js
```
Attendu : ÉCHEC avec `Cannot find module './slug.js'`.

- [ ] **Step 3 : Écrire l'implémentation minimale `slug.js`**

Créer `assets/js/modules/slug.js` :
```javascript
/**
 * Génère un slug GitHub-compatible à partir d'un texte de heading.
 *
 * Règles (alignées sur l'algorithme GitHub utilisé dans le TOC d'AnalyseTheologique.md) :
 *  1. Lowercase
 *  2. Trim espaces
 *  3. Supprimer la ponctuation standalone (`.`, `,`, `:`, `;`, `(`, `)`, etc.)
 *     mais conserver les accents et le tiret
 *  4. Remplacer les espaces par des tirets
 *  5. Conserver les doubles tirets résultant des em-dashes ` — `
 *  6. Trim tirets en début/fin
 */
export function slugify(text) {
  if (!text || typeof text !== "string") return "";
  return text
    .toLowerCase()
    .trim()
    // Conserver l'em-dash en tant que double tiret après split par espaces
    .replace(/—/g, "--")
    // Supprimer la ponctuation standalone (mais pas le tiret simple, le tiret bas, ni les accents)
    .replace(/[.,:;()\[\]{}!?'"`«»]/g, "")
    // Remplacer les espaces (et tabs) par un tiret simple
    .replace(/[\s\t]+/g, "-")
    // Coalescer les triples tirets ou plus en double tiret
    .replace(/-{3,}/g, "--")
    // Trim tirets en début/fin
    .replace(/^-+|-+$/g, "");
}
```

- [ ] **Step 4 : Relancer le test**

```bash
node --test assets/js/modules/slug.test.js
```
Attendu : tous les 7 tests passent.

Si un test échoue, ajuster `slug.js` (le test fait foi). Itérer jusqu'à 7/7.

- [ ] **Step 5 : Créer le module `render.js` (orchestre marked + DOMPurify + cache)**

Créer `assets/js/modules/render.js` :
```javascript
/**
 * Module de rendu du markdown source.
 * Utilise marked + DOMPurify auto-hébergés.
 * Met en cache le HTML rendu dans localStorage avec une clé incluant le hash.
 */

import { marked } from "/assets/vendor/marked.esm.min.js";

// DOMPurify est exposé en global via /assets/vendor/purify.min.js (UMD)
// On le charge dynamiquement.
async function loadPurify() {
  if (window.DOMPurify) return window.DOMPurify;
  await new Promise((resolve, reject) => {
    const s = document.createElement("script");
    s.src = "/assets/vendor/purify.min.js";
    s.onload = resolve;
    s.onerror = reject;
    document.head.appendChild(s);
  });
  return window.DOMPurify;
}

const CACHE_PREFIX = "analyse:html:";
const SOURCE_URL = "/AnalyseTheologique.md";

/**
 * Calcule un hash court SHA-256 (8 chars) du texte source.
 */
async function shortHash(text) {
  const buf = new TextEncoder().encode(text);
  const hashBuf = await crypto.subtle.digest("SHA-256", buf);
  const hashArray = Array.from(new Uint8Array(hashBuf));
  return hashArray.slice(0, 4).map((b) => b.toString(16).padStart(2, "0")).join("");
}

/**
 * Configure marked pour utiliser nos slugs (GitHub-style).
 */
import { slugify } from "./slug.js";

function configureMarked() {
  marked.setOptions({ gfm: true, breaks: false, headerIds: false, mangle: false });
  marked.use({
    renderer: {
      heading(text, level) {
        const id = slugify(text);
        return `<h${level} id="${id}">${text}<button class="heading-anchor" data-anchor="${id}" aria-label="Copier le lien vers cette section">#</button></h${level}>`;
      },
    },
  });
}

/**
 * Récupère et rend le markdown source.
 * Retourne { html, hash, fromCache }.
 */
export async function fetchAndRender() {
  configureMarked();

  // 1. Tenter le cache (sans connaître le hash)
  let cachedEntry = null;
  for (let i = 0; i < localStorage.length; i++) {
    const key = localStorage.key(i);
    if (key && key.startsWith(CACHE_PREFIX)) {
      cachedEntry = { key, html: localStorage.getItem(key) };
      break;
    }
  }
  if (cachedEntry) {
    // Hydratation immédiate ; vérification du hash en background
    queueMicrotask(() => verifyHashInBackground(cachedEntry.key));
    return { html: cachedEntry.html, hash: cachedEntry.key.slice(CACHE_PREFIX.length), fromCache: true };
  }

  // 2. Fetch + render + cache
  const res = await fetch(SOURCE_URL, { cache: "no-cache" });
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  const md = await res.text();
  const hash = await shortHash(md);
  const purify = await loadPurify();
  const rawHtml = marked.parse(md);
  const cleanHtml = purify.sanitize(rawHtml, { ADD_ATTR: ["id", "data-anchor"] });
  try { localStorage.setItem(`${CACHE_PREFIX}${hash}`, cleanHtml); } catch { /* quota dépassé : ignorer */ }
  return { html: cleanHtml, hash, fromCache: false };
}

async function verifyHashInBackground(currentKey) {
  try {
    const res = await fetch(SOURCE_URL, { cache: "no-cache" });
    if (!res.ok) return;
    const md = await res.text();
    const hash = await shortHash(md);
    if (`${CACHE_PREFIX}${hash}` !== currentKey) {
      // Hash a changé : invalider l'ancien et notifier
      localStorage.removeItem(currentKey);
      window.dispatchEvent(new CustomEvent("content-updated", { detail: { hash } }));
    }
  } catch { /* offline : pas de vérification */ }
}
```

- [ ] **Step 6 : Créer le module `states.js` (états de chargement/erreur)**

Créer `assets/js/modules/states.js` :
```javascript
/**
 * Affiche les différents états de l'article (chargement, erreur, contenu).
 */

const article = document.getElementById("article-content");

export function showError(reason = "offline") {
  if (!article) return;
  const banner = document.createElement("div");
  banner.className = "error-banner";
  banner.innerHTML = `
    <h2>${reason === "offline" ? "Lecture hors-ligne indisponible" : "Une erreur est survenue"}</h2>
    <p>${reason === "offline"
      ? "Cette page nécessite une connexion à la première visite. Vous pouvez aussi télécharger directement le markdown source."
      : "Le contenu n'a pas pu être chargé. Essayez de recharger la page ou de télécharger le markdown source."}</p>
    <div class="error-banner__actions">
      <a href="/AnalyseTheologique.md" download class="btn btn-primary">Télécharger le markdown</a>
      <button class="btn btn-secondary" onclick="location.reload()">Réessayer</button>
    </div>
  `;
  article.innerHTML = "";
  article.appendChild(banner);
  article.removeAttribute("aria-busy");
}

export function injectContent(html) {
  if (!article) return;
  article.innerHTML = html;
  article.removeAttribute("aria-busy");
}

export function showUpdateAvailable() {
  // Banner non-bloquant : « Le contenu a été mis à jour »
  const existing = document.getElementById("update-banner");
  if (existing) return;
  const banner = document.createElement("div");
  banner.id = "update-banner";
  banner.className = "error-banner";
  banner.innerHTML = `
    <p>Le contenu a été mis à jour. <button class="btn btn-secondary" onclick="location.reload()">Recharger</button></p>
  `;
  document.querySelector(".content")?.prepend(banner);
}
```

- [ ] **Step 7 : Créer `assets/js/lecture.js` (orchestrateur, version minimale)**

Créer `assets/js/lecture.js` :
```javascript
/**
 * Orchestrateur du lecteur. Charge le contenu, puis active progressivement
 * les modules (TOC, search, prefs, etc.) au fur et à mesure de l'implémentation.
 */

import { fetchAndRender } from "/assets/js/modules/render.js";
import { injectContent, showError, showUpdateAvailable } from "/assets/js/modules/states.js";

window.addEventListener("content-updated", showUpdateAvailable);

async function boot() {
  try {
    const { html } = await fetchAndRender();
    injectContent(html);
    // Les autres modules (TOC, search, prefs, anchors, progress, sequential-nav)
    // seront branchés ici dans les tâches suivantes.
  } catch (err) {
    console.error(err);
    showError(navigator.onLine ? "error" : "offline");
  }
}

boot();
```

- [ ] **Step 8 : Vérifier dans le navigateur**

Servir le projet localement (pour `fetch` :
```bash
python -m http.server 8000
```
ou tout équivalent). Ouvrir `http://localhost:8000/lecture.html`.

Vérifier :
- Skeleton apparaît brièvement
- Le contenu intégral d'`AnalyseTheologique.md` s'affiche, headings stylisés
- Pas d'erreur DevTools Console
- Recharger : hydratation instantanée depuis cache
- DevTools → Application → Local Storage : clé `analyse:html:<hash8>` présente

- [ ] **Step 9 : Lancer `npm test` final**

```bash
node --test assets/js/modules/
```
Attendu : 7/7 tests slug passent.

- [ ] **Step 10 : Commit**

```bash
git add assets/js/modules/slug.js assets/js/modules/slug.test.js assets/js/modules/render.js assets/js/modules/states.js assets/js/lecture.js
git commit -m "feat(reader): render markdown with marked + DOMPurify + cache

- slug.js: GitHub-style slugify helper, 7 unit tests (node --test).
- render.js: fetch /AnalyseTheologique.md, parse via marked,
  sanitize via DOMPurify, cache rendered HTML in localStorage
  keyed by SHA-256 short hash. Background hash check invalidates
  stale cache and dispatches 'content-updated' event.
- states.js: error banner (offline / generic), content injection,
  update-available banner.
- lecture.js: orchestrator boot sequence."
```

---

### Task 10 : Lecteur — module TOC (génération + sync scroll)

**Files:**
- Create: `assets/js/modules/toc.js`
- Modify: `assets/js/lecture.js` (brancher le module)

- [ ] **Step 1 : Créer `assets/js/modules/toc.js`**

Contenu exact :
```javascript
/**
 * Génère la table des matières à partir des h2/h3 du contenu rendu,
 * et synchronise l'item actif avec le scroll via IntersectionObserver.
 */

const tocEl = document.getElementById("toc");
const sidebar = document.getElementById("sidebar");
const sidebarToggle = document.querySelector(".topbar__toggle");

export function buildToc() {
  if (!tocEl) return;
  const article = document.getElementById("article-content");
  if (!article) return;
  const headings = article.querySelectorAll("h2, h3");
  if (!headings.length) {
    tocEl.innerHTML = "<p class=\"sidebar__loading\">Aucune section trouvée.</p>";
    return;
  }

  // Construction de l'arbre : h2 = groupe, h3 = item
  const html = [];
  let currentGroup = null;
  headings.forEach((h) => {
    const text = h.firstChild?.textContent || h.textContent.replace(/#$/, "").trim();
    const id = h.id;
    if (h.tagName === "H2") {
      if (currentGroup) html.push("</ul>");
      html.push(`<p class="toc-group">${escapeHtml(text)}</p>`);
      html.push(`<ul>`);
      currentGroup = id;
    } else { // H3
      if (!currentGroup) { html.push("<ul>"); currentGroup = "_root"; }
      html.push(`<li><a class="toc-item" href="#${id}" data-anchor="${id}">${escapeHtml(text)}</a></li>`);
    }
  });
  if (currentGroup) html.push("</ul>");

  tocEl.innerHTML = html.join("");

  // Interception : fermer le drawer mobile au clic
  tocEl.querySelectorAll(".toc-item").forEach((a) => {
    a.addEventListener("click", () => {
      if (window.innerWidth < 1024 && sidebar) {
        sidebar.classList.remove("sidebar--open");
        sidebarToggle?.setAttribute("aria-expanded", "false");
      }
    });
  });

  // Sync scroll → highlight
  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            const id = entry.target.id;
            tocEl.querySelectorAll(".toc-item").forEach((a) => {
              a.classList.toggle("toc-item--active", a.getAttribute("data-anchor") === id);
              if (a.getAttribute("data-anchor") === id) a.setAttribute("aria-current", "location");
              else a.removeAttribute("aria-current");
            });
          }
        });
      },
      { rootMargin: "-30% 0px -60% 0px" }
    );
    headings.forEach((h) => h.id && observer.observe(h));
  }
}

export function setupSidebarToggle() {
  if (!sidebarToggle || !sidebar) return;
  sidebarToggle.addEventListener("click", () => {
    const isOpen = sidebar.classList.toggle("sidebar--open");
    sidebarToggle.setAttribute("aria-expanded", String(isOpen));
  });
  // Fermer sur Esc
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && sidebar.classList.contains("sidebar--open")) {
      sidebar.classList.remove("sidebar--open");
      sidebarToggle.setAttribute("aria-expanded", "false");
    }
  });
}

function escapeHtml(s) {
  return String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
}
```

- [ ] **Step 2 : Brancher TOC dans `lecture.js`**

Modifier `assets/js/lecture.js`. Remplacer la ligne `// Les autres modules (...) seront branchés ici...` par :
```javascript
    const { buildToc, setupSidebarToggle } = await import("/assets/js/modules/toc.js");
    buildToc();
    setupSidebarToggle();
```

Et ajouter en haut, après les imports existants : aucun changement (import dynamique).

- [ ] **Step 3 : Vérifier**

Recharger `http://localhost:8000/lecture.html`. Vérifier :
- TOC peuplée avec ~50 entrées (péricopes + sections)
- Cliquer sur un item TOC : scroll vers la section
- Scroller manuellement : l'item TOC actif change (fond `--bg-overlay`, bordure orange)
- Sur mobile (DevTools < 1024 px) : hamburger ouvre/ferme la sidebar

- [ ] **Step 4 : Commit**

```bash
git add assets/js/modules/toc.js assets/js/lecture.js
git commit -m "feat(reader): generate TOC and sync active item on scroll

toc.js builds a flat-then-grouped TOC from h2/h3, attaches an
IntersectionObserver that toggles .toc-item--active on the visible
heading. Mobile drawer toggle on the topbar hamburger, Esc closes."
```

---

### Task 11 : Lecteur — module recherche (TDD normalize) + intégration

**Files:**
- Create: `assets/js/modules/normalize.js`
- Create: `assets/js/modules/normalize.test.js`
- Create: `assets/js/modules/search.js`
- Modify: `assets/js/lecture.js`

- [ ] **Step 1 : Test du helper `normalize.js` (TDD)**

Créer `assets/js/modules/normalize.test.js` :
```javascript
import { test } from "node:test";
import assert from "node:assert/strict";
import { normalize } from "./normalize.js";

test("normalize lowercases", () => {
  assert.equal(normalize("HELLO"), "hello");
});

test("normalize strips Latin diacritics", () => {
  assert.equal(normalize("Église"), "eglise");
  assert.equal(normalize("français"), "francais");
  assert.equal(normalize("métanoïa"), "metanoia");
});

test("normalize preserves Greek polytonic (out of scope per PRD)", () => {
  // Les diacritiques grecs polytoniques NE sont PAS normalisés en v1.0
  assert.equal(normalize("ἐκκλησία"), "ἐκκλησία");
});

test("normalize collapses whitespace", () => {
  assert.equal(normalize("hello   world"), "hello world");
  assert.equal(normalize("  hello  "), "hello");
});

test("normalize handles empty input", () => {
  assert.equal(normalize(""), "");
  assert.equal(normalize(null), "");
  assert.equal(normalize(undefined), "");
});
```

- [ ] **Step 2 : Lancer le test (échec attendu)**

```bash
node --test assets/js/modules/normalize.test.js
```
Attendu : ÉCHEC `Cannot find module './normalize.js'`.

- [ ] **Step 3 : Implémenter `normalize.js`**

Créer `assets/js/modules/normalize.js` :
```javascript
/**
 * Normalise une chaîne pour la recherche :
 *  - lowercase
 *  - retire les diacritiques latins (Latin Combining Marks U+0300–U+036F)
 *  - collapse les espaces multiples
 *  - trim
 *
 * Ne touche PAS aux diacritiques grecs polytoniques (hors-périmètre v1.0).
 */
export function normalize(s) {
  if (!s) return "";
  return String(s)
    .toLocaleLowerCase("fr")
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "") // Combining Diacritical Marks (Latin)
    .replace(/\s+/g, " ")
    .trim();
}
```

- [ ] **Step 4 : Relancer**

```bash
node --test assets/js/modules/normalize.test.js
```
Attendu : 5/5 tests passent.

- [ ] **Step 5 : Implémenter `search.js`**

Créer `assets/js/modules/search.js` :
```javascript
/**
 * Recherche plein-texte sur le DOM rendu.
 * Surligne les occurrences avec <mark class="search-hit">,
 * navigation entre occurrences via boutons ↑↓.
 */

import { normalize } from "./normalize.js";

const MAX_HITS = 1000;

const panel = document.getElementById("search-panel");
const input = document.getElementById("search-input");
const status = document.getElementById("search-status");
const btnPrev = document.getElementById("search-prev");
const btnNext = document.getElementById("search-next");
const btnClose = document.getElementById("search-close");
const btnOpen = document.getElementById("btn-search");
const article = document.getElementById("article-content");

let hits = [];
let activeIndex = -1;

export function setupSearch() {
  if (!panel || !input || !article) return;

  btnOpen?.addEventListener("click", openPanel);
  btnClose?.addEventListener("click", closePanel);
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && !panel.hasAttribute("hidden")) closePanel();
    if ((e.key === "/" || (e.ctrlKey && e.key === "f")) && panel.hasAttribute("hidden")) {
      e.preventDefault();
      openPanel();
    }
  });

  let timer;
  input.addEventListener("input", () => {
    clearTimeout(timer);
    timer = setTimeout(() => runSearch(input.value), 200);
  });

  btnPrev?.addEventListener("click", () => navigate(-1));
  btnNext?.addEventListener("click", () => navigate(1));
}

function openPanel() {
  panel.removeAttribute("hidden");
  input.focus();
}
function closePanel() {
  clearHits();
  panel.setAttribute("hidden", "");
  input.value = "";
  status.textContent = "";
}

function clearHits() {
  article.querySelectorAll("mark.search-hit").forEach((m) => {
    const text = document.createTextNode(m.textContent);
    m.replaceWith(text);
  });
  article.normalize();
  hits = [];
  activeIndex = -1;
  btnPrev.disabled = true;
  btnNext.disabled = true;
}

function runSearch(term) {
  clearHits();
  const q = normalize(term);
  if (q.length < 2) { status.textContent = ""; return; }

  // Parcours TextNode → wrap matches dans <mark>
  const walker = document.createTreeWalker(article, NodeFilter.SHOW_TEXT, {
    acceptNode: (node) => {
      if (!node.textContent.trim()) return NodeFilter.FILTER_REJECT;
      if (node.parentElement?.closest("script,style")) return NodeFilter.FILTER_REJECT;
      return normalize(node.textContent).includes(q)
        ? NodeFilter.FILTER_ACCEPT
        : NodeFilter.FILTER_REJECT;
    },
  });

  const nodesToProcess = [];
  let n;
  while ((n = walker.nextNode())) nodesToProcess.push(n);

  for (const node of nodesToProcess) {
    if (hits.length >= MAX_HITS) break;
    wrapMatches(node, term, q);
  }

  if (hits.length === 0) {
    status.textContent = `Aucun résultat pour « ${term} ». Essayez avec moins de caractères ou sans accents.`;
    return;
  }
  if (hits.length >= MAX_HITS) {
    status.textContent = `${MAX_HITS}+ occurrences trouvées. Affinez votre recherche.`;
  } else {
    status.textContent = `${hits.length} résultat${hits.length > 1 ? "s" : ""}`;
  }
  btnPrev.disabled = false;
  btnNext.disabled = false;
  navigate(1);
}

function wrapMatches(textNode, originalTerm, normalizedTerm) {
  const text = textNode.textContent;
  const normalizedText = normalize(text);
  const indices = [];
  let from = 0;
  while (true) {
    const idx = normalizedText.indexOf(normalizedTerm, from);
    if (idx === -1) break;
    indices.push(idx);
    from = idx + normalizedTerm.length;
  }
  if (!indices.length) return;

  // Reconstruire le node en wrappant chaque occurrence
  const fragment = document.createDocumentFragment();
  let cursor = 0;
  // Note : indices opèrent sur le texte normalisé qui peut différer en longueur
  // (rare en pratique : NFD ne change pas la longueur de la plupart des Latin chars).
  // On utilise une recherche linéaire sur le texte original, qui partage les mêmes positions
  // tant que la normalisation n'altère pas les longueurs (cas commun).
  for (const idx of indices) {
    if (hits.length >= MAX_HITS) break;
    fragment.appendChild(document.createTextNode(text.slice(cursor, idx)));
    const mark = document.createElement("mark");
    mark.className = "search-hit";
    mark.textContent = text.slice(idx, idx + normalizedTerm.length);
    fragment.appendChild(mark);
    hits.push(mark);
    cursor = idx + normalizedTerm.length;
  }
  fragment.appendChild(document.createTextNode(text.slice(cursor)));
  textNode.replaceWith(fragment);
}

function navigate(delta) {
  if (!hits.length) return;
  // Désactiver l'ancien actif
  if (activeIndex >= 0 && hits[activeIndex]) hits[activeIndex].classList.remove("search-hit--active");
  activeIndex = (activeIndex + delta + hits.length) % hits.length;
  const target = hits[activeIndex];
  target.classList.add("search-hit--active");
  target.scrollIntoView({ behavior: "smooth", block: "center" });
  status.textContent = `${activeIndex + 1} / ${hits.length}`;
}
```

- [ ] **Step 6 : Brancher dans `lecture.js`**

Ajouter après la ligne `setupSidebarToggle();` :
```javascript
    const { setupSearch } = await import("/assets/js/modules/search.js");
    setupSearch();
```

- [ ] **Step 7 : Tester dans le navigateur**

Recharger. Cliquer sur l'icône recherche, taper « asphaleia ». Attendu :
- Plusieurs occurrences surlignées en orange (glow ambré)
- Status « N résultats » apparaît
- Cliquer ↓ → première occurrence devient orange plein, scroll smooth vers elle
- Cliquer ↑ → revient à la dernière

Tester aussi :
- « église » trouve « Église » (insensible accent)
- « ZZZZZ » → message « Aucun résultat »
- Esc ferme le panneau

- [ ] **Step 8 : Tests Node**

```bash
node --test assets/js/modules/
```
Attendu : 7 (slug) + 5 (normalize) = 12 tests passent.

- [ ] **Step 9 : Commit**

```bash
git add assets/js/modules/normalize.js assets/js/modules/normalize.test.js assets/js/modules/search.js assets/js/lecture.js
git commit -m "feat(reader): add full-text search (case + Latin-diacritics insensitive)

- normalize.js: lowercase + NFD strip Latin combining marks +
  whitespace collapse. Greek polytonic preserved (out of scope v1.0).
  5 unit tests.
- search.js: TreeWalker over rendered DOM, wraps matches in
  <mark.search-hit>, navigates with ↑↓ buttons or n/N, supports
  Esc/'/'/Ctrl+F shortcuts, capped at 1000 hits with hint."
```

---

### Task 12 : Lecteur — modules ancres + progression + nav séquentielle + back-to-top

**Files:**
- Create: `assets/js/modules/anchors.js`
- Create: `assets/js/modules/progress.js`
- Create: `assets/js/modules/sequential-nav.js`
- Create: `assets/js/modules/back-to-top.js`
- Modify: `assets/js/lecture.js`

- [ ] **Step 1 : Créer `assets/js/modules/anchors.js`**

```javascript
/**
 * Gère :
 *  - Le clic sur le bouton # à côté de chaque heading (copie l'URL)
 *  - Le scroll smooth vers l'ancre au chargement (location.hash)
 *  - L'affichage d'un toast « Lien copié »
 */

const toast = document.getElementById("toast");

export function setupAnchors() {
  const article = document.getElementById("article-content");
  if (!article) return;

  article.querySelectorAll(".heading-anchor").forEach((btn) => {
    btn.addEventListener("click", async (e) => {
      e.preventDefault();
      const id = btn.getAttribute("data-anchor");
      const url = `${location.origin}${location.pathname}#${id}`;
      try {
        await navigator.clipboard.writeText(url);
        showToast("Lien copié");
      } catch {
        showToast("Impossible de copier le lien");
      }
    });
  });

  // Scroll smooth si arrivée avec hash
  if (location.hash) {
    const target = document.getElementById(decodeURIComponent(location.hash.slice(1)));
    if (target) {
      requestAnimationFrame(() => target.scrollIntoView({ behavior: "smooth", block: "start" }));
    }
  }
}

function showToast(msg) {
  if (!toast) return;
  toast.textContent = msg;
  toast.classList.add("toast--visible");
  setTimeout(() => toast.classList.remove("toast--visible"), 1500);
}
```

- [ ] **Step 2 : Créer `assets/js/modules/progress.js`**

```javascript
/**
 * Barre de progression de lecture en haut de page.
 */

const bar = document.getElementById("progress-bar");

export function setupProgress() {
  if (!bar) return;
  let ticking = false;
  const update = () => {
    const total = document.documentElement.scrollHeight - window.innerHeight;
    const pct = total > 0 ? Math.min(100, Math.max(0, (window.scrollY / total) * 100)) : 0;
    bar.style.width = `${pct}%`;
    bar.setAttribute("aria-valuenow", String(Math.round(pct)));
    ticking = false;
  };
  window.addEventListener("scroll", () => {
    if (!ticking) {
      requestAnimationFrame(update);
      ticking = true;
    }
  }, { passive: true });
  update();
}
```

- [ ] **Step 3 : Créer `assets/js/modules/back-to-top.js`**

```javascript
/**
 * Bouton « Haut de page ».
 */

const btn = document.getElementById("back-to-top");

export function setupBackToTop() {
  if (!btn) return;
  const update = () => {
    if (window.scrollY > 600) btn.removeAttribute("hidden");
    else btn.setAttribute("hidden", "");
  };
  window.addEventListener("scroll", update, { passive: true });
  btn.addEventListener("click", () => window.scrollTo({ top: 0, behavior: "smooth" }));
  update();
}
```

- [ ] **Step 4 : Créer `assets/js/modules/sequential-nav.js`**

```javascript
/**
 * Insère un bloc de navigation « précédente / suivante » entre chaque péricope (h3).
 */

export function injectSequentialNav() {
  const article = document.getElementById("article-content");
  if (!article) return;
  const headings = Array.from(article.querySelectorAll("h3"));
  if (!headings.length) return;

  headings.forEach((h, i) => {
    const prev = headings[i - 1];
    const next = headings[i + 1];

    // Trouver le dernier élément avant le prochain h3 (ou la fin de l'article)
    let lastEl = h;
    let cursor = h.nextElementSibling;
    while (cursor && cursor.tagName !== "H3" && cursor.tagName !== "H2") {
      lastEl = cursor;
      cursor = cursor.nextElementSibling;
    }

    const nav = document.createElement("nav");
    nav.className = "sequential-nav";
    nav.setAttribute("aria-label", "Navigation entre péricopes");

    const prevHtml = prev
      ? `<a href="#${prev.id}"><span class="sequential-nav__label">← Précédente</span><span class="sequential-nav__title">${textOnly(prev)}</span></a>`
      : `<span class="sequential-nav__none"></span>`;
    const nextHtml = next
      ? `<a href="#${next.id}" class="sequential-nav__next"><span class="sequential-nav__label">Suivante →</span><span class="sequential-nav__title">${textOnly(next)}</span></a>`
      : `<span class="sequential-nav__none"></span>`;

    nav.innerHTML = prevHtml + nextHtml;
    lastEl.after(nav);
  });
}

function textOnly(h) {
  return h.firstChild?.textContent?.trim() || h.textContent.replace(/#$/, "").trim();
}
```

- [ ] **Step 5 : Brancher tous les modules dans `lecture.js`**

Modifier `assets/js/lecture.js` pour ajouter (après les modules déjà branchés) :
```javascript
    const { setupAnchors } = await import("/assets/js/modules/anchors.js");
    setupAnchors();
    const { setupProgress } = await import("/assets/js/modules/progress.js");
    setupProgress();
    const { setupBackToTop } = await import("/assets/js/modules/back-to-top.js");
    setupBackToTop();
    const { injectSequentialNav } = await import("/assets/js/modules/sequential-nav.js");
    injectSequentialNav();
```

- [ ] **Step 6 : Tester dans le navigateur**

Recharger. Vérifier :
- Survoler un h3 : bouton « # » apparaît à droite ; clic → toast « Lien copié »
- L'URL dans la barre d'adresse change quand on copie (en collant pour vérifier)
- Scroller : la barre de progression orange en haut s'allonge
- Scroller > 600 px : bouton ↑ apparaît en bas droite ; clic → retour smooth
- À la fin de chaque péricope : bloc « ← Précédente / Suivante → »
- Naviguer vers `lecture.html#luc-21-20--nativité` directement : scroll smooth vers la nativité

- [ ] **Step 7 : Commit**

```bash
git add assets/js/modules/anchors.js assets/js/modules/progress.js assets/js/modules/back-to-top.js assets/js/modules/sequential-nav.js assets/js/lecture.js
git commit -m "feat(reader): anchors + progress bar + sequential nav + back-to-top

- anchors.js: '#' button on h2/h3/h4 hover copies deep link to clipboard
  via navigator.clipboard, shows toast 'Lien copié'. Smooth-scrolls to
  location.hash on initial load.
- progress.js: rAF-throttled top bar reflecting scrollY ratio.
- back-to-top.js: floating circle appears past 600px, smooth-scrolls home.
- sequential-nav.js: injects ← Précédente / Suivante → block between
  each h3 pericope after rendering."
```

---

### Task 13 : Lecteur — module préférences (taille de police + mode concentré)

**Files:**
- Create: `assets/js/modules/prefs.js`
- Modify: `assets/js/lecture.js`

- [ ] **Step 1 : Créer `assets/js/modules/prefs.js`**

```javascript
/**
 * Gère la persistance des préférences utilisateur :
 *  - Mode lecture concentrée (focus mode)
 *  - Taille de police (compact / confort / ample)
 */

const KEY_FOCUS = "analyse:focusMode";
const KEY_SIZE = "analyse:textSize";

const html = document.documentElement;
const btnFocus = document.getElementById("btn-focus");
const btnSize = document.getElementById("btn-text-size");

export function setupPrefs() {
  // Restaurer focus mode
  if (localStorage.getItem(KEY_FOCUS) === "true") setFocus(true);
  btnFocus?.addEventListener("click", () => setFocus(!html.classList.contains("focus-mode")));

  // Restaurer taille de police
  const savedSize = localStorage.getItem(KEY_SIZE) || "confort";
  setTextSize(savedSize);

  // Menu déroulant pour la taille
  if (btnSize) setupSizeMenu();
}

function setFocus(on) {
  html.classList.toggle("focus-mode", on);
  btnFocus?.setAttribute("aria-pressed", String(on));
  try { localStorage.setItem(KEY_FOCUS, String(on)); } catch { /* quota */ }
}

function setTextSize(size) {
  ["compact", "confort", "ample"].forEach((s) => html.classList.remove(`text-size--${s}`));
  if (size !== "confort") html.classList.add(`text-size--${size}`);
  try { localStorage.setItem(KEY_SIZE, size); } catch { /* quota */ }
}

function setupSizeMenu() {
  const menu = document.createElement("div");
  menu.className = "text-size-menu";
  menu.setAttribute("role", "menu");
  ["compact", "confort", "ample"].forEach((size) => {
    const b = document.createElement("button");
    b.type = "button";
    b.setAttribute("role", "menuitemradio");
    b.textContent = { compact: "Compact (17px)", confort: "Confort (19px)", ample: "Ample (22px)" }[size];
    b.addEventListener("click", () => {
      setTextSize(size);
      menu.querySelectorAll("button").forEach((x) => x.setAttribute("aria-checked", "false"));
      b.setAttribute("aria-checked", "true");
      closeMenu();
    });
    menu.appendChild(b);
  });
  document.body.appendChild(menu);

  const positionMenu = () => {
    const rect = btnSize.getBoundingClientRect();
    menu.style.top = `${rect.bottom + 4}px`;
    menu.style.left = `${rect.right - menu.offsetWidth}px`;
  };

  const openMenu = () => {
    positionMenu();
    menu.dataset.open = "true";
    btnSize.setAttribute("aria-expanded", "true");
    // Marquer le courant
    const current = localStorage.getItem(KEY_SIZE) || "confort";
    Array.from(menu.querySelectorAll("button")).forEach((b, i) => {
      b.setAttribute("aria-checked", String(["compact", "confort", "ample"][i] === current));
    });
  };
  const closeMenu = () => {
    delete menu.dataset.open;
    btnSize.setAttribute("aria-expanded", "false");
  };

  btnSize.addEventListener("click", (e) => {
    e.stopPropagation();
    if (menu.dataset.open) closeMenu(); else openMenu();
  });
  document.addEventListener("click", (e) => {
    if (menu.dataset.open && !menu.contains(e.target) && e.target !== btnSize) closeMenu();
  });
  document.addEventListener("keydown", (e) => { if (e.key === "Escape" && menu.dataset.open) closeMenu(); });
  window.addEventListener("resize", () => { if (menu.dataset.open) positionMenu(); });
}
```

- [ ] **Step 2 : Brancher dans `lecture.js`**

Ajouter après les autres modules :
```javascript
    const { setupPrefs } = await import("/assets/js/modules/prefs.js");
    setupPrefs();
```

- [ ] **Step 3 : Tester**

- Cliquer sur 👓 (focus) : sidebars disparaissent, contenu plus large, fond plus profond
- Recharger : focus mode persiste
- Cliquer sur Aa : menu apparaît avec Compact/Confort/Ample
- Choisir Ample : police plus grande
- Recharger : taille persiste

- [ ] **Step 4 : Commit**

```bash
git add assets/js/modules/prefs.js assets/js/lecture.js
git commit -m "feat(reader): focus mode and text size with localStorage persistence

prefs.js manages two user preferences:
- analyse:focusMode (boolean) toggled by the 👁 button, hides sidebars
  and widens reading column.
- analyse:textSize (compact|confort|ample) selected via Aa popover,
  applies html.text-size--* class to override --fs-base."
```

---

## Phase 4 — Polissage (Tasks 14-16)

### Task 14 : Stylesheet print + image OG + apple-touch-icon

**Files:**
- Create: `assets/css/print.css`
- Modify: `index.html` et `lecture.html` (linker print.css)
- Create: `assets/img/og-image.svg` (puis converti en PNG)
- Create: `assets/icons/apple-touch-icon.png`

- [ ] **Step 1 : Créer `assets/css/print.css`**

Reprendre exactement le bloc CSS du PRD §11.8 :
```css
/* ============================================================
   Print stylesheet — cf. prd.md §11.8
   ============================================================ */

@media print {
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

  .topbar, .site-header, .mobile-drawer, .sidebar, .aside,
  .progress-bar, .back-to-top, .toast, .heading-anchor,
  .sequential-nav, .sidebar__search, .skip-link,
  .text-size-menu, .error-banner__actions {
    display: none !important;
  }

  main, .content, .reader-grid, article {
    max-width: none !important;
    width: 100% !important;
    padding: 0 !important;
    margin: 0 !important;
    grid-template-columns: 1fr !important;
    grid-template-areas: "main" !important;
  }

  a[href^="http"]::after {
    content: " (" attr(href) ")";
    font-size: 0.85em;
    color: #666;
  }

  h2, h3, h4 { break-after: avoid; }
  blockquote, table { break-inside: avoid; }

  body {
    font-size: 11pt;
    line-height: 1.5;
    background: #FFFFFF;
  }
}
```

- [ ] **Step 2 : Linker `print.css` dans les deux pages**

Dans `index.html` ET `lecture.html`, ajouter juste après la dernière `<link rel="stylesheet">` :
```html
  <link rel="stylesheet" href="/assets/css/print.css?v=v1" media="print">
```

- [ ] **Step 3 : Créer `assets/img/og-image.svg` (source vectorielle)**

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630" viewBox="0 0 1200 630">
  <rect width="1200" height="630" fill="#0E0F12"/>
  <radialGradient id="halo" cx="85%" cy="20%" r="60%">
    <stop offset="0%" stop-color="#FF7A1A" stop-opacity="0.2"/>
    <stop offset="100%" stop-color="#FF7A1A" stop-opacity="0"/>
  </radialGradient>
  <rect width="1200" height="630" fill="url(#halo)"/>
  <text x="900" y="450" font-family="Georgia,serif" font-size="500" font-weight="700" font-style="italic" fill="#EDE6D8" opacity="0.04" text-anchor="middle">Λ</text>
  <text x="80" y="180" font-family="Inter,sans-serif" font-size="22" letter-spacing="3" fill="#FF7A1A" font-weight="500">MÉTHODE O.I.A. · NEG 1979 / NA28</text>
  <text x="80" y="280" font-family="Georgia,serif" font-size="64" font-weight="700" fill="#EDE6D8">Analyse théologique</text>
  <text x="80" y="360" font-family="Georgia,serif" font-size="64" font-weight="700" font-style="italic" fill="#FF7A1A">réformée — Luc-Actes</text>
  <text x="80" y="440" font-family="Georgia,serif" font-size="24" fill="#B5AC9A">Westminster · Dort · 1689 · ~50 000 mots · 49 péricopes</text>
  <text x="80" y="560" font-family="Georgia,serif" font-size="20" font-style="italic" fill="#E8B65A">Coram Deo, soli Deo gloria.</text>
</svg>
```

- [ ] **Step 4 : Convertir SVG → PNG 1200×630**

Méthode A (en ligne de commande, requiert ImageMagick ou rsvg-convert) :
```bash
# rsvg-convert (paquet librsvg)
rsvg-convert -w 1200 -h 630 -f png -o assets/img/og-image.png assets/img/og-image.svg
# OU ImageMagick
magick assets/img/og-image.svg -resize 1200x630 assets/img/og-image.png
```

Méthode B (manuelle si pas d'outil) : ouvrir le SVG dans un navigateur, capture d'écran 1200×630, sauvegarder en PNG.

Vérifier : `assets/img/og-image.png` ≤ 80 KB. Si plus gros, optimiser avec TinyPNG ou squoosh.app.

- [ ] **Step 5 : Créer `apple-touch-icon.png` (180×180)**

Idem : convertir `favicon.svg` en PNG 180×180 :
```bash
rsvg-convert -w 180 -h 180 -f png -o assets/icons/apple-touch-icon.png assets/icons/favicon.svg
```

Et linker dans le `<head>` des deux pages :
```html
  <link rel="apple-touch-icon" href="/assets/icons/apple-touch-icon.png">
```

- [ ] **Step 6 : Tester l'impression**

Ouvrir `lecture.html`, scroller jusqu'à une péricope, `Ctrl+P` (preview impression). Vérifier :
- Fond blanc, texte noir
- Aucun élément d'UI (top bar, sidebar, boutons) visible
- Citations conservées avec mise en forme
- URLs des liens externes affichées entre parenthèses
- Pas de coupure inattendue dans les titres

- [ ] **Step 7 : Tester l'OG**

Ouvrir `index.html` dans Facebook Sharing Debugger : https://developers.facebook.com/tools/debug/
Vérifier que la vignette 1200×630 s'affiche correctement (en local : utiliser un tunnel ngrok pour test public).

- [ ] **Step 8 : Commit**

```bash
git add assets/css/print.css assets/img/og-image.svg assets/img/og-image.png assets/icons/apple-touch-icon.png index.html lecture.html
git commit -m "feat: add print stylesheet + OG image + apple-touch-icon

- print.css: light-on-dark inversion, hides UI chrome, expands content
  full width, expands external link URLs after anchor text.
- og-image.svg/png (1200×630): charcoal background with amber halo,
  Λ filigree, French title, confessional subtitle, Coram Deo tagline.
- apple-touch-icon.png (180×180): rasterized favicon for iOS/macOS."
```

---

### Task 15 : SEO meta complet sur le lecteur + JSON-LD enrichi

**Files:**
- Modify: `lecture.html` (head : OG, Twitter, JSON-LD)

- [ ] **Step 1 : Insérer dans `<head>` de `lecture.html`**

Localiser `<title>Lecture intégrale — Analyse théologique Luc-Actes</title>` et insérer juste après :

```html
  <!-- Open Graph -->
  <meta property="og:type" content="article">
  <meta property="og:title" content="Lecture intégrale — Analyse théologique Luc-Actes">
  <meta property="og:description" content="Lecture intégrale en ligne de l'analyse théologique réformée des deux tomes lucaniens (~50 000 mots, 49 péricopes).">
  <meta property="og:image" content="/assets/img/og-image.png">
  <meta property="og:image:width" content="1200">
  <meta property="og:image:height" content="630">
  <meta property="og:url" content="/lecture.html">
  <meta property="og:locale" content="fr_FR">
  <meta property="og:site_name" content="Analyse théologique réformée">
  <meta property="article:author" content="André-Guy Bruneau">
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="Lecture intégrale — Analyse théologique Luc-Actes">
  <meta name="twitter:description" content="Lecture intégrale en ligne de l'analyse réformée Luc-Actes.">
  <meta name="twitter:image" content="/assets/img/og-image.png">
  <!-- JSON-LD : Book + Article -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": "Analyse théologique réformée — Luc-Actes (lecture intégrale)",
    "author": { "@type": "Person", "name": "André-Guy Bruneau" },
    "datePublished": "2026-04-24",
    "inLanguage": "fr",
    "wordCount": 50000,
    "isAccessibleForFree": true,
    "about": ["Théologie réformée", "Évangile selon Luc", "Actes des Apôtres", "Exégèse grammatico-historique", "Westminster Confession of Faith", "Canons of Dort", "Confession baptiste de 1689"],
    "keywords": "Luc, Actes, exégèse, réformée, O.I.A., Sproul, MacArthur, Westminster, Dort, 1689, NEG, NA28"
  }
  </script>
  <link rel="apple-touch-icon" href="/assets/icons/apple-touch-icon.png">
```

- [ ] **Step 2 : Valider JSON-LD**

Coller le JSON-LD dans https://validator.schema.org/ → 0 erreur attendue.

- [ ] **Step 3 : Commit**

```bash
git add lecture.html
git commit -m "feat(reader): add OG, Twitter Card, and JSON-LD Article metadata

Mirrors the SEO setup of the landing, with reader-specific titles
and descriptions. JSON-LD includes wordCount, inLanguage, about,
and keywords fields."
```

---

### Task 16 : Validation HTML + axe + Lighthouse + correctifs

**Files:**
- (Aucun fichier à créer ; tests + correctifs)

- [ ] **Step 1 : Validation HTML W3C des deux pages**

Servir le projet localement :
```bash
python -m http.server 8000
```

Aller sur https://validator.w3.org/nu/ → onglet « Address », entrer `http://localhost:8000/index.html` puis `http://localhost:8000/lecture.html` (ou utiliser ngrok si validator.nu n'accepte pas localhost ; alternative : « By file upload »).

Attendu : **0 erreur** sur chaque page. Si erreurs : corriger inline puis re-valider.

- [ ] **Step 2 : Audit `axe` via DevTools**

Installer l'extension navigateur **axe DevTools** (Deque). Sur chaque page : ouvrir DevTools → onglet axe → Scan ALL of my page.

Attendu : **0 violation critique, 0 violation sérieuse**. Corriger les issues.

Issues fréquentes à anticiper :
- `aria-label` manquant sur un bouton-icône → ajouter
- Contraste insuffisant → vérifier que les textes secondaires respectent 4.5:1
- Heading order skip → corriger la hiérarchie

- [ ] **Step 3 : Lighthouse mobile sur les deux pages**

DevTools → onglet Lighthouse → Mode : Navigation, Device : Mobile, Catégories : Performance + Accessibility + Best Practices + SEO. Generate.

Attendu (cibles PRD §10.3) :
- Landing : Performance ≥ 95, autres ≥ 95
- Lecteur : Performance ≥ 90, autres ≥ 95

Si Performance < cible :
- Vérifier les preload des polices
- Vérifier que `marked.esm.min.js` et `purify.min.js` ne sont pas bloquants
- Vérifier le poids des images (og-image.png ≤ 80 KB)
- Activer la compression Brotli côté serveur (auto sur GH Pages)

- [ ] **Step 4 : Cross-browser visuel rapide**

Ouvrir les deux pages dans Chrome, Firefox, Safari (si dispo). Vérifier :
- Aucun rendu cassé
- Polices chargées (pas de FOUC excessif)
- Animations smooth
- Mobile DevTools : 360, 414, 768, 1024, 1280 px → aucun débordement

- [ ] **Step 5 : Test offline**

DevTools → onglet Network → Offline. Recharger `lecture.html`. Attendu :
- Si visite précédente : contenu hydraté depuis cache, pas d'erreur
- Si jamais visité : bannière d'erreur poli avec CTA téléchargement

- [ ] **Step 6 : Tests Node finaux**

```bash
node --test assets/js/modules/
```
Attendu : 12/12 tests passent.

- [ ] **Step 7 : Commit (si correctifs)**

Si des correctifs ont été appliqués :
```bash
git add -A
git commit -m "fix: address validation findings (HTML W3C + axe + Lighthouse)

[Détailler ici les corrections appliquées : ajout d'aria-label,
ajustement de contraste, correction de hiérarchie heading, etc.]"
```

Sinon, sauter cette étape.

---

## Phase 5 — Déploiement (Tasks 17-18)

### Task 17 : Mise à jour du README + procédure de déploiement

**Files:**
- Create: `README.md`
- Create: `LICENSE` (MIT par défaut, à confirmer en revue PRD Annexe D)

- [ ] **Step 1 : Créer `LICENSE` (MIT par défaut)**

```
MIT License

Copyright (c) 2026 André-Guy Bruneau

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

- [ ] **Step 2 : Créer `README.md`**

```markdown
# Analyse théologique réformée — Luc-Actes

> Site statique de présentation et de lecture en ligne de l'exégèse réformée
> des écrits lucaniens, méthode O.I.A. (Observation, Interprétation, Application).
> Cf. [`prd.md`](./prd.md) pour la spécification complète.

## Structure

- `index.html` — Page-vitrine (hero, méthode, divergences, citations, synthèse)
- `lecture.html` — Lecteur intégral (rendu markdown côté client)
- `AnalyseTheologique.md` — Source du contenu (~295 KB, 49 péricopes)
- `prd.md` — Product Requirements Document v1.1
- `plan.md` — Plan d'implémentation
- `assets/` — CSS, JS, fonts, vendors auto-hébergés

## Développement local

```bash
# Servir localement (n'importe quel serveur statique)
python -m http.server 8000
# Puis ouvrir http://localhost:8000/
```

## Tests

```bash
node --test assets/js/modules/
```

Tests Node natifs sur les helpers JS purs (`slug`, `normalize`).

## Déploiement (GitHub Pages)

1. `Settings → Pages → Source : Deploy from a branch → main → / (root)`
2. Délai de propagation : 1-3 minutes après chaque push sur `main`
3. URL : `https://<github-username>.github.io/<repo>/`

### Mise à jour du contenu

Lorsqu'`AnalyseTheologique.md` change :
1. Le hash de cache est calculé à la volée (cf. `assets/js/modules/render.js`).
2. Aucune action manuelle requise — les visiteurs reçoivent le nouveau hash et
   leur cache localStorage est invalidé automatiquement.

### Mise à jour des assets (CSS, JS)

Les références aux assets dans `index.html` et `lecture.html` portent un suffixe
`?v=v1`. Pour invalider le cache navigateur après une modification :
1. Calculer un nouveau hash court : `shasum -a 256 assets/css/landing.css | cut -c1-8`
2. Remplacer `?v=v1` par `?v=<hash>` dans les `<link>` / `<script>` correspondants.

## Confidentialité

- Aucun cookie déposé
- Aucun tracker tiers
- Aucune requête réseau vers un domaine externe
- `localStorage` utilisé uniquement pour les préférences de lecture personnelles

## Licence

- Code : MIT (voir [`LICENSE`](./LICENSE))
- Contenu (`AnalyseTheologique.md`) : à confirmer (proposition : CC BY-SA 4.0)

*Coram Deo, soli Deo gloria.*
```

- [ ] **Step 3 : Commit**

```bash
git add README.md LICENSE
git commit -m "docs: add README and MIT LICENSE

README documents structure, local dev, tests, deployment via GitHub
Pages, content/asset cache invalidation procedure, and the privacy
posture (no cookies, no trackers, no third-party requests)."
```

---

### Task 18 : Activation GitHub Pages + push final + vérification production

**Files:**
- (Aucun fichier ; opérations git + configuration GitHub)

- [ ] **Step 1 : Vérifier `git status`**

```bash
git status
```
Attendu : working tree clean (tout est committé).

- [ ] **Step 2 : Vérifier que `git log` reflète une histoire propre**

```bash
git log --oneline -25
```
Vérifier que les ~20 commits suivent la convention Conventional Commits et racontent l'implémentation par tâches.

- [ ] **Step 3 : Push sur `main`**

```bash
git push origin main
```

- [ ] **Step 4 : Activer GitHub Pages (si pas déjà fait)**

Aller sur `https://github.com/<user>/<repo>/settings/pages` :
- Source : `Deploy from a branch`
- Branch : `main` / `/ (root)`
- Save

- [ ] **Step 5 : Attendre la propagation (1-3 min)**

Vérifier le statut de déploiement dans `Actions` du dépôt (workflow `pages-build-deployment`).

- [ ] **Step 6 : Vérification post-déploiement**

Ouvrir l'URL en navigation privée (sans cache) :
- `https://<user>.github.io/<repo>/` → Landing s'affiche
- Cliquer sur « Lire l'analyse » → Lecteur charge le markdown
- Vérifier la console : aucune erreur 404 ou CSP
- DevTools → Network : aucune requête vers un domaine ≠ self
- Lancer un Lighthouse sur l'URL publique → scores conformes au PRD §10.3

- [ ] **Step 7 : Mise à jour du `sitemap.xml` et OG si URL différente**

Si l'URL publique réelle diffère de `https://agbruneau.github.io/Exploration/` (ex. domaine personnalisé), modifier :
- `sitemap.xml`
- `robots.txt`
- Les balises `og:url` dans `index.html` et `lecture.html`

Commit + push :
```bash
git add sitemap.xml robots.txt index.html lecture.html
git commit -m "chore: align sitemap/robots/og:url with deployed URL"
git push origin main
```

- [ ] **Step 8 : Tag de version**

```bash
git tag -a v1.0.0 -m "v1.0.0 — première mise en ligne"
git push origin v1.0.0
```

- [ ] **Step 9 : Recettes finales — checklist §14 du PRD**

Exécuter manuellement les 5 sections de critères d'acceptation du PRD §14 :
- §14.1 Landing : 9 critères
- §14.2 Lecteur : 13 critères
- §14.3 Identité visuelle : 7 critères
- §14.4 Cross-browser : 4 critères
- §14.5 Confidentialité : 4 critères

Cocher chaque item. Toute case non cochable = bug à corriger avant clôture.

---

## Self-review (effectué après rédaction)

### 1. Couverture du PRD

| Section PRD | Couverte par | OK |
|---|---|---|
| §6.1 Périmètre MVP | Tasks 4-13 | ✓ |
| §6.4 Stratégie de tests | Task 16 + tests intégrés à chaque tâche | ✓ |
| §7.2 Structure landing 11 sections | Tasks 4, 5, 6 | ✓ |
| §7.3 Structure lecteur | Task 8 | ✓ |
| §7.4 Breakpoints | Task 3 (`tokens.css`) + appliqués dans CSS pages | ✓ |
| §8.1.0 Header sticky | Task 4 (HTML) + Task 7 (scroll-spy JS) | ✓ |
| §8.1.1-8.1.11 Sections landing | Tasks 4-6 | ✓ |
| §8.2.1 Pipeline rendu markdown | Task 9 (`render.js`) | ✓ |
| §8.2.3 TOC + IntersectionObserver | Task 10 (`toc.js`) | ✓ |
| §8.2.4 Recherche plein-texte | Task 11 (`search.js` + `normalize.js`) | ✓ |
| §8.2.5 Mode lecture concentrée | Task 13 (`prefs.js`) | ✓ |
| §8.2.6 Taille de police | Task 13 (`prefs.js`) | ✓ |
| §8.2.7 Ancres copiables | Task 12 (`anchors.js`) | ✓ |
| §8.2.8 Bouton haut de page | Task 12 (`back-to-top.js`) | ✓ |
| §8.2.9 États chargement/erreur | Task 9 (`states.js`) + Task 8 (skeleton CSS) | ✓ |
| §8.2.10 Indicateur progression | Task 12 (`progress.js`) | ✓ |
| §8.2.11 Nav séquentielle | Task 12 (`sequential-nav.js`) | ✓ |
| §9 Identité visuelle | Task 3 (`tokens.css`) + Tasks 4-8 (CSS pages) | ✓ |
| §10.1 Stack vanilla auto-hébergée | Task 2 (vendors + fonts) | ✓ |
| §10.2 Structure de fichiers | Task 1 + tâches suivantes | ✓ |
| §10.3 Budgets performance | Vérifiés en Task 16 | ✓ |
| §10.5 Cache + révision | Task 9 (cache localStorage par hash) | ✓ |
| §10.6 CSP `'self'` | Task 4 + Task 8 (meta CSP dans head) | ✓ |
| §10.7 Cache busting assets | Task 1 (suffixe `?v=v1`) + README Task 17 | ✓ |
| §10.8 Procédure déploiement | Task 18 + README Task 17 | ✓ |
| §11 Accessibilité WCAG AA | Tâches transversales + audit Task 16 | ✓ |
| §11.8 Print stylesheet | Task 14 | ✓ |
| §12 SEO + OG + JSON-LD | Task 7 (landing) + Task 15 (lecteur) | ✓ |
| §13 Confidentialité (no tracker) | Architecture entière + CSP | ✓ |
| §13.4 Pas de Service Worker | Décidé, non implémenté | ✓ |
| §14 Critères d'acceptation | Vérifiés en Task 18 step 9 | ✓ |
| §16 Plan de livraison (M0-M8) | Mapping : M0=PRD, M1=Plan, M2=T1-3, M3=T4-7, M4=T8-10, M5=T11-13, M6=T16, M7=T14-15, M8=T17-18 | ✓ |

**Aucune section du PRD n'est laissée sans tâche correspondante.**

### 2. Scan de placeholders

Aucun « TODO », « TBD », « à compléter », « implement later » dans le plan. Les seuls « à confirmer » apparaissent dans le `LICENSE`/`README` pour les éléments listés en Annexe D du PRD (URL GitHub exacte, licence définitive) — c'est intentionnel et documenté.

### 3. Cohérence des types et signatures

- `slugify(text: string): string` — défini Task 9, utilisé Task 9 (render.js) et indirectement Task 10 (TOC lit `h.id` déjà setté par render).
- `normalize(s: string): string` — défini Task 11, utilisé Task 11 (search.js).
- `fetchAndRender(): Promise<{html, hash, fromCache}>` — défini Task 9, utilisé Task 9 (lecture.js).
- `injectContent(html)`, `showError(reason)`, `showUpdateAvailable()` — définis Task 9 (`states.js`), utilisés Task 9 (`lecture.js`).
- `buildToc()`, `setupSidebarToggle()` — définis Task 10, utilisés Task 10 (`lecture.js`).
- `setupSearch()` — défini Task 11, utilisé Task 11 (`lecture.js`).
- `setupAnchors()`, `setupProgress()`, `setupBackToTop()`, `injectSequentialNav()` — définis Task 12, utilisés Task 12 (`lecture.js`).
- `setupPrefs()` — défini Task 13, utilisé Task 13 (`lecture.js`).

Tous les noms d'export correspondent aux noms d'import. Aucune divergence détectée.

### 4. Correctifs auto-appliqués

Aucun correctif nécessaire à l'issue du self-review.

---

## Récapitulatif

- **18 tâches** réparties sur **5 phases**
- **~20 commits** prévus (1-2 par tâche)
- **2 modules JS testés en TDD** : `slug` (7 tests), `normalize` (5 tests)
- **0 dépendance npm en runtime**
- **Validation triple** : HTML W3C + axe + Lighthouse en Task 16
- **Déploiement direct GitHub Pages** sans build, sans pipeline
- **Tag final** `v1.0.0` à l'issue de Task 18

---

*Fin du plan.*

