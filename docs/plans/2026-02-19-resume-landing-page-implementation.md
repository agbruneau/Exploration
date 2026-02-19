# Resume Landing Page Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build `resume.html` — a condensed 9-card grid summary of the AI mastery guide that links back to `index.html`.

**Architecture:** Single autonomous HTML file at project root. Same dark/gold palette, same fonts (Playfair Display + DM Sans via Google Fonts), same CSS variables as `index.html`. No shared files, no build system.

**Tech Stack:** HTML5, CSS3 (Grid, custom properties, clamp), vanilla JS (IntersectionObserver)

**Design doc:** `docs/plans/2026-02-19-resume-landing-page-design.md`

**Reference file:** `index.html` (same palette, same interaction patterns)

---

### Task 1: HTML Skeleton + CSS Foundation

**Files:**
- Create: `resume.html`

**Step 1: Create file with DOCTYPE, head, meta tags, Google Fonts, and CSS variables**

Write `resume.html` with:
- `<!DOCTYPE html>`, `<html lang="fr">`
- `<head>`: charset UTF-8, viewport meta, title "Les 9 Compétences du Top 1% — Résumé", description meta, OG tags, theme-color `#0a0a0a`
- Google Fonts link: Playfair Display (400, 700) + DM Sans (400, 500, 600)
- `<style>` block with:
  - Box-sizing reset (same as index.html lines 14-18)
  - CSS variables (same as index.html lines 20-28):
    ```css
    :root {
        --bg-primary: #0a0a0a;
        --bg-secondary: #111118;
        --bg-tertiary: #1a1a1a;
        --gold: #c9a84c;
        --gold-light: #e8d48b;
        --text-primary: #f0ece2;
        --text-secondary: #b8b0a0;
    }
    ```
  - Base body styles: bg-primary, text-primary, DM Sans, line-height 1.7
  - Noise grain overlay (same as index.html lines 43-56)
  - Progress bar styles (same as index.html lines 59-68)
  - Gold line utility class (same as index.html lines 81-87)
  - `html { scroll-behavior: smooth; }`
- `<body>`: empty with just `<div class="progress-bar" id="progress-bar"></div>` placeholder
- Empty `<script>` block at bottom

**Step 2: Verify**

Open `resume.html` in browser. Expect: black page with subtle grain texture, no content.

**Step 3: Commit**

```bash
git add resume.html
git commit -m "feat: create resume.html skeleton with CSS foundation"
```

---

### Task 2: Hero Section

**Files:**
- Modify: `resume.html`

**Step 1: Add hero HTML after progress bar div**

```html
<section class="hero">
    <h1>Les 9 Compétences Stratégiques du Top 1 % des Utilisateurs d'IA</h1>
    <div class="gold-line"></div>
    <p class="subtitle">Résumé exécutif du guide stratégique complet. Chaque compétence est la clé d'un avantage concurrentiel décisif.</p>
    <a href="index.html" class="cta-btn">Lire le Guide Complet</a>
    <a href="#cards" class="scroll-arrow">
        <span>Découvrir</span>
        <svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg>
    </a>
</section>
```

**Step 2: Add hero CSS**

Match index.html hero patterns (lines 93-167) but add CTA button styles:

```css
.hero {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 2rem;
    position: relative;
    background: var(--bg-primary);
    overflow: hidden;
}

/* Radial gold glow — same as index.html */
.hero::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -55%);
    width: 600px;
    height: 400px;
    background: radial-gradient(ellipse, rgba(201, 168, 76, 0.06) 0%, transparent 70%);
    pointer-events: none;
}

.hero h1 {
    font-size: clamp(2rem, 5vw, 3.5rem);
    color: var(--gold);
    max-width: 900px;
    margin-bottom: 1rem;
    line-height: 1.3;
    text-shadow: 0 0 60px rgba(201, 168, 76, 0.15);
    position: relative;
}

.hero .subtitle {
    color: var(--text-secondary);
    font-size: 1.1rem;
    max-width: 700px;
    font-style: italic;
    line-height: 1.6;
    margin-bottom: 2rem;
}

.cta-btn {
    display: inline-block;
    padding: 0.85rem 2.5rem;
    border: 1px solid var(--gold);
    color: var(--gold);
    text-decoration: none;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.95rem;
    font-weight: 600;
    letter-spacing: 0.05em;
    border-radius: 4px;
    transition: background 0.3s, color 0.3s;
    position: relative;
}

.cta-btn:hover {
    background: var(--gold);
    color: var(--bg-primary);
}

/* Scroll arrow — same as index.html lines 137-168 */
.scroll-arrow {
    position: absolute;
    bottom: 2.5rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    text-decoration: none;
    animation: bounce 2.5s infinite ease-in-out;
}

.scroll-arrow span {
    font-size: 0.7rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--text-secondary);
    font-family: 'DM Sans', sans-serif;
}

.scroll-arrow svg {
    width: 20px;
    height: 20px;
    stroke: var(--gold);
    fill: none;
    stroke-width: 2;
    opacity: 0.7;
}

@keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(8px); }
}
```

**Step 3: Verify**

Open in browser. Expect: full-screen hero with gold title, subtitle, outlined CTA button, bouncing scroll arrow. Button hover fills gold.

**Step 4: Commit**

```bash
git add resume.html
git commit -m "feat: add hero section with CTA button"
```

---

### Task 3: Card Grid (9 Cards)

**Files:**
- Modify: `resume.html`

**Step 1: Add card grid HTML after hero section**

```html
<main>
<section class="cards-section" id="cards">
    <div class="cards-container">
        <div class="card fade-in">
            <span class="card-number">01</span>
            <h2>L'Ingénierie de la Requête</h2>
            <p>Structurez vos requêtes comme un cahier des charges avec les 4 piliers : Rôle, Contexte, Commande, Format. La qualité de l'input définit la rentabilité de l'output.</p>
            <a href="index.html#section-2" class="card-link">Lire la suite →</a>
        </div>
        <div class="card fade-in">
            <span class="card-number">02</span>
            <h2>La Curation du Goût</h2>
            <p>Développez le discernement pour identifier l'excellence parmi les outputs. Le goût n'est pas une intuition mystique, c'est une discipline documentée et un système de contraintes.</p>
            <a href="index.html#section-3" class="card-link">Lire la suite →</a>
        </div>
        <div class="card fade-in">
            <span class="card-number">03</span>
            <h2>Le Master Prompt</h2>
            <p>Créez votre identité numérique permanente. L'IA cesse de vous traiter comme un étranger et chaque interaction est ancrée dans votre réalité opérationnelle.</p>
            <a href="index.html#section-4" class="card-link">Lire la suite →</a>
        </div>
        <div class="card fade-in">
            <span class="card-number">04</span>
            <h2>Le Cycle d'Itération</h2>
            <p>Sculptez l'output comme de l'argile. Le top 1 % ne se contente jamais du premier jet — 70 000 prompts pour une seule publicité Coca-Cola.</p>
            <a href="index.html#section-5" class="card-link">Lire la suite →</a>
        </div>
        <div class="card fade-in">
            <span class="card-number">05</span>
            <h2>Les Prompts Système</h2>
            <p>Le langage naturel est le nouveau code informatique. Transformez vos succès ponctuels en micro-logiciels linguistiques réutilisables à l'infini.</p>
            <a href="index.html#section-6" class="card-link">Lire la suite →</a>
        </div>
        <div class="card fade-in">
            <span class="card-number">06</span>
            <h2>La Critique Stratégique</h2>
            <p>Forcez l'IA à devenir votre avocat du diable. Exposez vos angles morts psychologiques et décisionnels avec une honnêteté brutale.</p>
            <a href="index.html#section-7" class="card-link">Lire la suite →</a>
        </div>
        <div class="card fade-in">
            <span class="card-number">07</span>
            <h2>La Compression de Contexte</h2>
            <p>Distillez vos données à 10 % de leur volume sans perdre l'essentiel. Maîtrisez le flux d'information pour maintenir la pureté de la source de vérité.</p>
            <a href="index.html#section-8" class="card-link">Lire la suite →</a>
        </div>
        <div class="card fade-in">
            <span class="card-number">08</span>
            <h2>Le Knowledge Gardening</h2>
            <p>Structurez votre base de connaissances par projets et départements. Un environnement IA désordonné produit des résultats flous.</p>
            <a href="index.html#section-9" class="card-link">Lire la suite →</a>
        </div>
        <div class="card fade-in">
            <span class="card-number">09</span>
            <h2>L'Apprentissage Personnalisé</h2>
            <p>Transformez l'IA en tuteur privé permanent. Consommez du savoir stratégique pendant vos déplacements et convertissez chaque moment en gain de compétence.</p>
            <a href="index.html#section-10" class="card-link">Lire la suite →</a>
        </div>
    </div>
</section>
</main>
```

**Step 2: Add card grid CSS**

```css
.cards-section {
    padding: 5rem 0;
    background: var(--bg-primary);
}

.cards-container {
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 2rem;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
}

.card {
    background: var(--bg-secondary);
    border: 1px solid rgba(201, 168, 76, 0.1);
    border-radius: 8px;
    padding: 2rem;
    transition: transform 0.3s, box-shadow 0.3s, border-color 0.3s;
}

.card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 30px rgba(201, 168, 76, 0.08);
    border-color: rgba(201, 168, 76, 0.3);
}

.card-number {
    font-family: 'Playfair Display', serif;
    font-size: 2.5rem;
    font-weight: 700;
    color: var(--gold);
    opacity: 0.3;
    line-height: 1;
    display: block;
    margin-bottom: 0.75rem;
}

.card h2 {
    font-family: 'Playfair Display', serif;
    font-size: 1.25rem;
    color: var(--gold);
    margin-bottom: 0.75rem;
    line-height: 1.3;
}

.card p {
    color: var(--text-secondary);
    font-size: 0.95rem;
    line-height: 1.7;
    margin-bottom: 1rem;
}

.card-link {
    color: var(--gold);
    text-decoration: none;
    font-size: 0.85rem;
    font-weight: 600;
    letter-spacing: 0.03em;
    transition: color 0.2s;
}

.card-link:hover {
    color: var(--gold-light);
}

/* Fade-in animation — same pattern as index.html */
.fade-in {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 0.6s ease, transform 0.6s ease;
}

.fade-in.visible {
    opacity: 1;
    transform: translateY(0);
}
```

**Step 3: Verify**

Open in browser. Expect: 3-column grid of 9 cards below hero. Each card has number, gold title, summary text, "Lire la suite" link. Hover lifts card with gold shadow.

**Step 4: Commit**

```bash
git add resume.html
git commit -m "feat: add 9-card grid with content and hover effects"
```

---

### Task 4: CTA Section + Footer

**Files:**
- Modify: `resume.html`

**Step 1: Add CTA section HTML after `</main>`**

```html
<section class="cta-section">
    <div class="cta-container">
        <div class="gold-line"></div>
        <h2>Prêt à rejoindre l'élite ?</h2>
        <p>Découvrez le guide stratégique complet avec les 9 compétences détaillées pour maîtriser l'intelligence artificielle.</p>
        <a href="index.html" class="cta-btn cta-btn-large">Accéder au Guide Complet</a>
    </div>
</section>
```

**Step 2: Add footer HTML**

```html
<button class="back-to-top" id="back-to-top" aria-label="Retour en haut">
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="18 15 12 9 6 15"/></svg>
</button>

<footer class="footer">
    <div class="container">
        <div class="gold-line"></div>
        <p>&copy; 2026 — Maîtriser l'IA : Guide Stratégique pour l'Élite Professionnelle</p>
    </div>
</footer>
```

**Step 3: Add CTA section + footer + back-to-top CSS**

```css
.cta-section {
    padding: 5rem 0;
    text-align: center;
    background: var(--bg-secondary);
    border-top: 1px solid rgba(201, 168, 76, 0.08);
}

.cta-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 0 2rem;
}

.cta-section h2 {
    font-family: 'Playfair Display', serif;
    font-size: clamp(1.5rem, 3vw, 2.2rem);
    color: var(--gold);
    margin-bottom: 1rem;
}

.cta-section p {
    color: var(--text-secondary);
    margin-bottom: 2rem;
    line-height: 1.7;
}

.cta-btn-large {
    font-size: 1.05rem;
    padding: 1rem 3rem;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 0 2rem;
}

/* Footer — same as index.html lines 407-413 */
.footer {
    padding: 3rem 0;
    text-align: center;
    color: var(--text-secondary);
    background: var(--bg-tertiary);
    font-size: 0.9rem;
}

/* Back to top — same as index.html lines 370-401 */
.back-to-top {
    position: fixed;
    bottom: 2rem;
    right: 2rem;
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: var(--bg-tertiary);
    border: 1px solid rgba(201, 168, 76, 0.2);
    color: var(--gold);
    font-size: 1.2rem;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.3s, transform 0.3s, background 0.2s, border-color 0.2s;
    pointer-events: none;
    z-index: 100;
}

.back-to-top.visible {
    opacity: 1;
    transform: translateY(0);
    pointer-events: auto;
}

.back-to-top:hover {
    background: rgba(201, 168, 76, 0.15);
    border-color: rgba(201, 168, 76, 0.4);
}
```

**Step 4: Verify**

Open in browser. Scroll past cards. Expect: CTA section with gold line, title, description, prominent button. Footer at bottom. Back-to-top button appears when scrolled.

**Step 5: Commit**

```bash
git add resume.html
git commit -m "feat: add CTA section, footer, and back-to-top button"
```

---

### Task 5: JavaScript (Animations + Interactions)

**Files:**
- Modify: `resume.html` (the `<script>` block)

**Step 1: Add JavaScript for all interactions**

```javascript
// Fade-in cards on scroll
const fadeEls = document.querySelectorAll('.fade-in');
const fadeObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
        }
    });
}, { threshold: 0.1 });
fadeEls.forEach(el => fadeObserver.observe(el));

// Reading progress bar
const progressBar = document.getElementById('progress-bar');
window.addEventListener('scroll', () => {
    const scrollTop = window.scrollY;
    const docHeight = document.documentElement.scrollHeight - window.innerHeight;
    const progress = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;
    progressBar.style.width = progress + '%';
}, { passive: true });

// Back to top button
const hero = document.querySelector('.hero');
const backToTop = document.getElementById('back-to-top');
const backToTopObserver = new IntersectionObserver(([entry]) => {
    backToTop.classList.toggle('visible', !entry.isIntersecting);
}, { threshold: 0 });
backToTopObserver.observe(hero);
backToTop.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
});
```

**Step 2: Verify**

Open in browser:
- Scroll down: cards fade in one by one, progress bar fills, back-to-top appears
- Click back-to-top: smooth scroll to top
- Progress bar reaches 100% at bottom

**Step 3: Commit**

```bash
git add resume.html
git commit -m "feat: add scroll animations, progress bar, and back-to-top JS"
```

---

### Task 6: Responsive CSS

**Files:**
- Modify: `resume.html` (add media queries in `<style>`)

**Step 1: Add responsive breakpoints**

```css
/* Tablet: 2 columns */
@media (max-width: 1024px) {
    .cards-container {
        grid-template-columns: repeat(2, 1fr);
    }
}

/* Mobile */
@media (max-width: 768px) {
    .cards-container {
        grid-template-columns: 1fr;
        padding: 0 1.25rem;
    }

    .cards-section {
        padding: 3rem 0;
    }

    .hero h1 {
        font-size: 1.8rem;
    }

    .hero .subtitle {
        font-size: 0.95rem;
    }

    .cta-section {
        padding: 3rem 0;
    }

    .cta-container {
        padding: 0 1.25rem;
    }

    .container {
        padding: 0 1.25rem;
    }

    .back-to-top {
        bottom: 1rem;
        right: 1rem;
        width: 40px;
        height: 40px;
    }
}
```

**Step 2: Verify**

Open in browser. Use devtools responsive mode:
- 1200px wide: 3-column grid
- 900px wide: 2-column grid
- 375px wide: 1-column stack, reduced hero title, full-width cards

**Step 3: Commit**

```bash
git add resume.html
git commit -m "feat: add responsive CSS for tablet and mobile"
```

---

### Task 7: Final Polish + Cross-Link

**Files:**
- Modify: `resume.html` (minor tweaks)
- Modify: `index.html` (add link to resume.html)

**Step 1: Add a link from index.html hero to resume.html**

In `index.html`, add a subtle link in the hero subtitle area or footer pointing to `resume.html` for discoverability. Add after the existing subtitle `<p>`:

```html
<a href="resume.html" style="color: var(--text-secondary); font-size: 0.85rem; text-decoration: none; margin-top: 1rem; display: inline-block; border-bottom: 1px solid rgba(201,168,76,0.3);">Voir le résumé en 9 points</a>
```

**Step 2: Verify both pages**

- Open `resume.html`: full page works, all links to `index.html#section-N` work
- Open `index.html`: link to `resume.html` is visible and works
- Test on mobile viewport

**Step 3: Commit**

```bash
git add resume.html index.html
git commit -m "feat: final polish and cross-link between pages"
```
