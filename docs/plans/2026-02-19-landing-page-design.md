# Landing Page "Maitriser l'IA" - Design Document

**Date:** 2026-02-19
**Status:** Approved

## Objective

Build an immersive one-page showcase landing page to present the full content of the strategic guide "Maitriser l'IA : Guide Strategique Complet pour l'Elite Professionnelle". Dark theme, gold/luxury palette, elegant with subtle accents.

## Decisions

| Decision | Choice |
|---|---|
| Purpose | Showcase / consultation (read-only) |
| Navigation | Continuous scroll, sticky nav |
| Visual style | Elegant with subtle accents |
| Palette | Gold / luxury (deep blacks, gold, off-white) |
| Content | Exhaustive, faithful to original guide |
| Approach | Single `index.html` file, zero dependencies (except Google Fonts) |

## Architecture

Single file `index.html` containing:
- `<style>`: Custom CSS with CSS variables for the gold/luxury palette
- `<body>`: Semantic HTML5 content
- `<script>`: Minimal JS for smooth scroll, active nav state, scroll animations (IntersectionObserver)

## Color Palette

| Token | Value | Usage |
|---|---|---|
| `--bg-primary` | `#0a0a0a` | Main background |
| `--bg-secondary` | `#141414` | Cards, alternating sections |
| `--bg-tertiary` | `#1a1a1a` | Nav, elevated elements |
| `--gold` | `#c9a84c` | Primary accents, titles, borders |
| `--gold-light` | `#e8d48b` | Hover states, highlights |
| `--text-primary` | `#f0ece2` | Main text (off-white) |
| `--text-secondary` | `#a09a8c` | Secondary text |

## Typography

- **Titles:** Playfair Display (serif, elegant)
- **Body:** Inter (sans-serif, readable)
- Source: Google Fonts CDN

## Components

### Hero (100vh)
- Full-screen, deep black background
- Main title with gold accent
- Subtitle in off-white
- Decorative gold line
- Animated scroll-down arrow

### Sticky Navigation
- Fixed bar after hero (appears on scroll)
- `--bg-tertiary` with backdrop-blur
- Links to all 11 sections
- Active section highlighted in gold
- Hamburger menu on mobile

### Content Sections (x11)
- Alternating `--bg-primary` / `--bg-secondary`
- Each section: number + title in Playfair Display gold, decorative gold line, faithful content
- Blockquotes: gold left border, slightly elevated background, italic
- Tables: dark style, gold headers, subtle borders
- Bullet lists: custom gold bullets (diamonds or circles)
- Expert quotes: decorative gold quotation marks

### Footer
- `--bg-tertiary` background
- Gold separator line
- Minimalist credits/copyright

## Interactions

- Smooth scroll (CSS `scroll-behavior: smooth`)
- Fade-in on scroll (opacity + translateY via IntersectionObserver)
- Active nav state updates on scroll
- Hover transitions on nav links
- No parallax, no heavy animations

## Responsive

- Mobile-first with breakpoints at 768px and 1024px
- Hero: reduced title size on mobile
- Nav: hamburger menu below 768px
- Content: adaptive padding, horizontally scrollable tables
- Max content width: 800px centered
