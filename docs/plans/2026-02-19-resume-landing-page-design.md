# Resume Landing Page "Les 9 Competences" - Design Document

**Date:** 2026-02-19
**Status:** Approved

## Objective

Build a condensed summary landing page (`resume.html`) presenting the 9 key AI competencies from the full guide as a visual card grid. Links back to `index.html` for the complete content.

## Decisions

| Decision | Choice |
|---|---|
| Purpose | Executive summary / teaser linking to full guide |
| File | `resume.html` at project root, fully autonomous |
| Visual style | Same dark/gold palette as `index.html` |
| Layout | Hero + 3x3 card grid + CTA section + footer |
| Approach | Single file, zero dependencies (except Google Fonts) |
| Navigation | No sticky nav (page is short), back-to-top button, progress bar |

## Architecture

Single file `resume.html` containing:
- `<style>`: Same CSS variables and palette as `index.html`
- `<body>`: Hero, card grid, CTA, footer
- `<script>`: Minimal JS for fade-in animations, progress bar, back-to-top

## Color Palette (inherited from index.html)

| Token | Value | Usage |
|---|---|---|
| `--bg-primary` | `#0a0a0a` | Main background |
| `--bg-secondary` | `#111118` | Card backgrounds |
| `--bg-tertiary` | `#1a1a1a` | Footer, elevated elements |
| `--gold` | `#c9a84c` | Accents, titles, borders, CTA |
| `--gold-light` | `#e8d48b` | Hover states |
| `--text-primary` | `#f0ece2` | Main text |
| `--text-secondary` | `#b8b0a0` | Card body text |

## Typography (inherited from index.html)

- **Titles:** Playfair Display (serif)
- **Body:** DM Sans (sans-serif)
- Source: Google Fonts CDN

## Components

### Hero (100vh)
- Full-screen, `--bg-primary` background
- Radial gold glow (same as index.html)
- Title: "Les 9 Competences du Top 1 % des Utilisateurs d'IA"
- Subtitle: short 2-line hook
- Decorative gold line
- CTA button (gold outlined): "Lire le Guide Complet" -> index.html
- Animated scroll-down arrow

### Card Grid (9 cards)
- CSS Grid: 3 cols (>1024px), 2 cols (768-1024px), 1 col (<768px)
- Gap: ~1.5rem
- Max width: 1100px centered
- Each card:
  - Background: `--bg-secondary`
  - Border: 1px solid `rgba(201, 168, 76, 0.1)`
  - Border-radius: 8px
  - Padding: ~2rem
  - Number: large Playfair Display, gold, opacity 0.3
  - Title: Playfair Display, gold
  - Body: 2-3 sentence summary in `--text-secondary`
  - "Lire la suite" link -> `index.html#section-N`
- Hover: box-shadow gold diffuse + border gold more visible
- Fade-in on scroll via IntersectionObserver

### Card Content

| # | Title | Summary |
|---|---|---|
| 01 | Prompt Engineering | Structurez vos requetes comme un cahier des charges: Role, Contexte, Commande, Format. |
| 02 | Curation du Gout | Developpez le discernement pour identifier l'excellence. Le gout est une discipline documentee. |
| 03 | Master Prompt | Creez votre identite numerique permanente. L'IA cesse de vous traiter comme un etranger. |
| 04 | Cycle d'Iteration | Sculptez l'output comme de l'argile. Le top 1% ne se contente jamais du premier jet. |
| 05 | Prompts Systeme | Le langage naturel est le nouveau code. Transformez vos succes en logiciels linguistiques reutilisables. |
| 06 | Critique Strategique | Forcez l'IA a devenir votre avocat du diable. Exposez vos angles morts. |
| 07 | Compression de Contexte | Distillez vos donnees a 10% sans perdre l'essentiel. Maitrisez le flux d'information. |
| 08 | Knowledge Gardening | Structurez votre base de connaissances par projets et departements. |
| 09 | Apprentissage Personnalise | Transformez l'IA en tuteur prive. Consommez du savoir strategique en mobilite. |

### CTA Section
- Centered, after the grid
- Gold decorative line
- Text: "Pret a rejoindre l'elite ?"
- Prominent CTA button -> `index.html`

### Footer
- Same as `index.html`: `--bg-tertiary`, gold line, copyright

## Interactions

- Fade-in on scroll for cards (staggered, via IntersectionObserver)
- Card hover: elevated shadow + gold border highlight
- CTA button hover: gold fill transition
- Progress bar at top
- Back-to-top button (same as index.html)
- Smooth scroll

## Responsive

| Breakpoint | Grid | Hero title | Cards |
|---|---|---|---|
| > 1024px | 3 columns | clamp(2rem, 5vw, 3.5rem) | Standard |
| 768-1024px | 2 columns | Slightly reduced | Full width in 2 cols |
| < 768px | 1 column | 1.8rem | Full width, stacked |
