# Landing Page "Maitriser l'IA" Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a single `index.html` landing page that presents the full strategic guide content in an immersive dark theme with gold/luxury palette.

**Architecture:** Single file `index.html` with inline `<style>` and `<script>`. CSS variables for theming, semantic HTML5, IntersectionObserver for scroll animations, hamburger nav for mobile. Zero build step.

**Tech Stack:** HTML5, CSS3 (custom properties, flexbox, grid), vanilla JS, Google Fonts (Playfair Display, Inter)

**Design doc:** `docs/plans/2026-02-19-landing-page-design.md`
**Source content:** `Guide Stratégique Complet _ Maîtriser l'IA pour l'Élite Professionnelle.md`

---

### Task 1: HTML skeleton + CSS foundation

**Files:**
- Create: `index.html`

**Step 1: Create the base HTML file with CSS variables and reset**

Create `index.html` with:
- `<!DOCTYPE html>`, lang="fr", UTF-8 meta, viewport meta
- Google Fonts link: Playfair Display (weights 400,700) and Inter (weights 400,500,600)
- `<title>`: "Maîtriser l'IA : Guide Stratégique pour l'Élite Professionnelle"
- `<style>` block containing:
  - CSS reset (box-sizing, margin/padding reset)
  - `:root` variables from design doc palette
  - `html { scroll-behavior: smooth; }`
  - `body` base styles: `--bg-primary` background, `--text-primary` color, Inter font, line-height 1.7
  - `.container` max-width 800px, centered, padding 0 2rem
  - Typography: h1/h2/h3 in Playfair Display, gold color
  - Utility classes: `.gold-line` (decorative hr), `.section` padding
- Empty `<body>` with a placeholder `<h1>` to verify fonts load

**Step 2: Verify in browser**

Open `index.html` in browser. Confirm: dark background, gold h1 in Playfair Display, Inter body text.

**Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add HTML skeleton with CSS foundation and palette"
```

---

### Task 2: Hero section

**Files:**
- Modify: `index.html`

**Step 1: Add hero HTML and CSS**

Add to `<style>`:
- `.hero` styles: min-height 100vh, display flex, flex-direction column, justify-content center, align-items center, text-align center, padding 2rem, position relative
- `.hero h1`: font-size clamp(2rem, 5vw, 3.5rem), gold, max-width 900px, margin-bottom 1rem
- `.hero .subtitle`: text-secondary color, font-size 1.1rem, max-width 700px, font-style italic
- `.hero .gold-line`: width 80px, height 2px, gold background, margin 2rem auto
- `.scroll-arrow`: position absolute, bottom 2rem, animation bounce 2s infinite
- `@keyframes bounce`: translateY(0) -> translateY(10px) -> translateY(0)

Add to `<body>`:
```html
<section class="hero">
  <h1>Maîtriser l'IA : Guide Stratégique Complet pour l'Élite Professionnelle</h1>
  <div class="gold-line"></div>
  <p class="subtitle">Document consolidé regroupant le Cadre Stratégique Opérationnel, le Lexique Conceptuel, le Protocole de Production et les 9 Compétences Stratégiques.</p>
  <div class="scroll-arrow">&#8964;</div>
</section>
```

**Step 2: Verify in browser**

Full-screen hero with centered gold title, gold line, subtitle, bouncing arrow at bottom.

**Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add hero section with title and scroll arrow"
```

---

### Task 3: Sticky navigation

**Files:**
- Modify: `index.html`

**Step 1: Add nav HTML and CSS**

Add to `<style>`:
- `.nav`: position fixed, top 0, width 100%, background `--bg-tertiary` with rgba + backdrop-filter blur(10px), z-index 1000, transform translateY(-100%), transition transform 0.3s
- `.nav.visible`: transform translateY(0)
- `.nav-inner`: max-width 1200px, margin auto, display flex, align-items center, padding 0.75rem 2rem, overflow-x auto
- `.nav a`: color text-secondary, text-decoration none, font-size 0.8rem, padding 0.5rem 0.75rem, white-space nowrap, transition color 0.2s
- `.nav a:hover, .nav a.active`: color gold
- `.hamburger`: display none (shown at mobile breakpoint)

Add to `<body>` before hero:
```html
<nav class="nav" id="navbar">
  <div class="nav-inner">
    <a href="#section-1">1. Introduction</a>
    <a href="#section-2">2. Prompt Engineering</a>
    <a href="#section-3">3. Curation du Goût</a>
    <a href="#section-4">4. Master Prompt</a>
    <a href="#section-5">5. Itération</a>
    <a href="#section-6">6. Prompts Système</a>
    <a href="#section-7">7. Critique Stratégique</a>
    <a href="#section-8">8. Compression</a>
    <a href="#section-9">9. Base de Connaissances</a>
    <a href="#section-10">10. Apprentissage</a>
    <a href="#section-11">11. Conclusion</a>
  </div>
  <button class="hamburger" id="hamburger" aria-label="Menu">&#9776;</button>
</nav>
```

**Step 2: Verify in browser**

Nav bar hidden initially, will appear after JS is added. For now just verify it renders in DOM.

**Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add sticky navigation bar"
```

---

### Task 4: Content sections 1-4

**Files:**
- Modify: `index.html`

**Step 1: Add CSS for content elements**

Add to `<style>`:
- `.section`: padding 5rem 0
- `.section:nth-child(odd)`: background `--bg-primary`; even: `--bg-secondary`
- `.section-header`: display flex, align-items baseline, gap 1rem, margin-bottom 2rem
- `.section-number`: font-size 3rem, gold, opacity 0.3, Playfair Display, font-weight 700
- `.section h2`: font-size clamp(1.5rem, 3vw, 2.2rem), gold, margin-bottom 1rem
- `.section h3`: font-size 1.3rem, gold-light, margin-top 2.5rem, margin-bottom 1rem
- `.section p`: margin-bottom 1.25rem, line-height 1.8
- `.section ul`: list-style none, padding-left 1.5rem; `ul li::before`: content "◆", gold, margin-right 0.75rem, font-size 0.6rem
- `blockquote`: border-left 3px solid gold, padding 1rem 1.5rem, margin 1.5rem 0, background `--bg-tertiary`, border-radius 0 4px 4px 0, font-style italic
- `table`: width 100%, border-collapse collapse, margin 1.5rem 0, overflow-x auto wrapper
- `th`: background gold with 0.15 opacity, color gold, text-align left, padding 0.75rem
- `td`: padding 0.75rem, border-bottom 1px solid rgba(201,168,76,0.15)
- `.quote-decorative`: position relative, with ::before gold large quotation mark
- `.fade-in`: opacity 0, transform translateY(30px), transition opacity 0.6s, transform 0.6s
- `.fade-in.visible`: opacity 1, transform translateY(0)

**Step 2: Add sections 1 through 4 HTML**

Add after hero, inside `<main>`:
- **Section 1 (Introduction):** id="section-1", full content from guide lines 23-33. Paragraphs with bold spans for key terms. Class `section` + `fade-in`.
- **Section 2 (Prompt Engineering):** id="section-2", full content from guide lines 37-61. Include the 4 piliers as an unordered list with bold terms. Include the "Cheat Code" subsection.
- **Section 3 (Curation du Goût):** id="section-3", full content from guide lines 65-97. Include the "Bibliothèque de Goût" list, the 3-step guide, and the "Règles Universelles" list.
- **Section 4 (Master Prompt):** id="section-4", full content from guide lines 101-143. Include the process description, the 4 components list, and the Master Prompt vs System Prompt comparison table.

Each section follows the pattern:
```html
<section class="section fade-in" id="section-N">
  <div class="container">
    <div class="section-header">
      <span class="section-number">0N</span>
      <h2>Section Title</h2>
    </div>
    <!-- content: p, ul, blockquote, h3, table as needed -->
  </div>
</section>
```

**Step 3: Verify in browser**

Sections render with alternating backgrounds, gold titles with large faded numbers, styled lists and blockquotes. Table in section 4 renders with gold headers.

**Step 4: Commit**

```bash
git add index.html
git commit -m "feat: add content sections 1-4 with styled elements"
```

---

### Task 5: Content sections 5-8

**Files:**
- Modify: `index.html`

**Step 1: Add sections 5 through 8 HTML**

Following the same pattern as Task 4:
- **Section 5 (Cycle d'Itération):** id="section-5", full content from guide lines 147-168. Include tactiques list, Canvas subsection, the "effet multiplicateur" blockquote.
- **Section 6 (Prompts Système):** id="section-6", full content from guide lines 171-191. Include the "Inversion de Prompt" blockquote, Custom GPTs subsection, Portabilité PDF subsection.
- **Section 7 (Critique Stratégique):** id="section-7", full content from guide lines 195-226. Include the 3 protocol blockquotes (Avocat du Diable, Premiers Principes, Vérité Psychologique), the "Boucle de Réintégration" subsection.
- **Section 8 (Compression de Contexte):** id="section-8", full content from guide lines 229-246. Include the 4-step checklist as a numbered list with blockquotes for each command example.

**Step 2: Verify in browser**

Sections 5-8 render correctly with all blockquotes, lists, and subsections styled consistently.

**Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add content sections 5-8"
```

---

### Task 6: Content sections 9-11 + footer

**Files:**
- Modify: `index.html`

**Step 1: Add sections 9 through 11 and footer HTML**

- **Section 9 (Base de Connaissances):** id="section-9", full content from guide lines 249-277. Include the 2-type folder list, centralisation subsection, maintenance checklist, future-proofing subsection.
- **Section 10 (Apprentissage Personnalisé):** id="section-10", full content from guide lines 280-297. Include the protocol blockquotes with example commands.
- **Section 11 (Conclusion):** id="section-11", full content from guide lines 300-318. Include the "Trois Piliers" list with bold terms. Style as a distinct closing section (slightly different treatment — centered text, larger gold line).

Add footer:
```html
<footer class="footer">
  <div class="container">
    <div class="gold-line"></div>
    <p>&copy; 2026 — Maîtriser l'IA : Guide Stratégique pour l'Élite Professionnelle</p>
  </div>
</footer>
```

Add footer CSS: padding 3rem 0, text-align center, text-secondary color, bg-tertiary.

**Step 2: Verify in browser**

All 11 sections render. Footer at bottom. Full guide content present and readable.

**Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add content sections 9-11 and footer"
```

---

### Task 7: JavaScript — scroll animations, active nav, hamburger

**Files:**
- Modify: `index.html`

**Step 1: Add script block**

Add `<script>` at end of body with three features:

**Feature A: Show/hide nav on scroll past hero**
```javascript
const navbar = document.getElementById('navbar');
const hero = document.querySelector('.hero');
const heroObserver = new IntersectionObserver(([entry]) => {
  navbar.classList.toggle('visible', !entry.isIntersecting);
}, { threshold: 0.1 });
heroObserver.observe(hero);
```

**Feature B: Fade-in sections on scroll**
```javascript
const fadeEls = document.querySelectorAll('.fade-in');
const fadeObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.1 });
fadeEls.forEach(el => fadeObserver.observe(el));
```

**Feature C: Active nav link on scroll**
```javascript
const sections = document.querySelectorAll('.section[id]');
const navLinks = document.querySelectorAll('.nav a');
const sectionObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      navLinks.forEach(link => link.classList.remove('active'));
      const activeLink = document.querySelector(`.nav a[href="#${entry.target.id}"]`);
      if (activeLink) activeLink.classList.add('active');
    }
  });
}, { threshold: 0.3 });
sections.forEach(s => sectionObserver.observe(s));
```

**Feature D: Hamburger menu toggle (mobile)**
```javascript
const hamburger = document.getElementById('hamburger');
const navInner = document.querySelector('.nav-inner');
hamburger.addEventListener('click', () => {
  navInner.classList.toggle('open');
});
```

**Step 2: Verify in browser**

- Scroll past hero: nav appears
- Scroll through sections: nav links highlight
- Sections fade in as they enter viewport
- On mobile viewport: hamburger toggles nav

**Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add JS for scroll animations, active nav, hamburger menu"
```

---

### Task 8: Responsive CSS

**Files:**
- Modify: `index.html`

**Step 1: Add media queries**

Add to `<style>`:

```css
/* Mobile nav */
@media (max-width: 768px) {
  .nav-inner {
    display: none;
    flex-direction: column;
    padding: 1rem;
  }
  .nav-inner.open {
    display: flex;
  }
  .hamburger {
    display: block;
    background: none;
    border: none;
    color: var(--gold);
    font-size: 1.5rem;
    cursor: pointer;
    padding: 0.75rem 2rem;
  }
  .hero h1 {
    font-size: 1.8rem;
  }
  .section-number {
    font-size: 2rem;
  }
  .container {
    padding: 0 1.25rem;
  }
  .section {
    padding: 3rem 0;
  }
  /* Scrollable tables */
  .table-wrap {
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
  }
}

@media (min-width: 769px) {
  .hamburger {
    display: none;
  }
}
```

**Step 2: Verify in browser**

Resize to mobile width. Hamburger visible, nav toggles, title smaller, tables scroll horizontally.

**Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add responsive CSS for mobile"
```

---

### Task 9: Final polish and review

**Files:**
- Modify: `index.html`

**Step 1: Visual polish**

- Verify all 11 sections have correct, complete content matching the guide
- Verify all blockquotes, tables, lists render properly
- Check that gold accents are consistent
- Ensure no broken anchor links in nav
- Add `<meta name="description">` for SEO
- Add `<meta property="og:title">` and `og:description` for social sharing

**Step 2: Verify full page**

Scroll through entire page top to bottom. Check: hero, nav behavior, all 11 sections, footer. Test mobile and desktop.

**Step 3: Final commit**

```bash
git add index.html
git commit -m "feat: final polish and meta tags for landing page"
```
