# VALIDATION — Tâche 16

Statut de la **Tâche 16 — Validation HTML + axe + Lighthouse + correctifs** du plan.

Cette tâche est principalement **manuelle** (validation W3C, axe DevTools, Lighthouse) et nécessite un navigateur réel ainsi que les outils d'audit installés. Le présent document distingue ce qui a été **automatisé en environnement headless** (sans navigateur) de ce qui **reste à exécuter manuellement** avant la mise en production.

Date de l'exécution automatisée : 2026-04-24.

---

## 1. Vérifications automatisées (exécutées)

### 1.1 Tests unitaires Node

Commande :

```
node --test assets/js/modules/slug.test.js assets/js/modules/normalize.test.js
```

Résultat : **12 tests, 12 succès, 0 échec**.

- 6 tests `slugify` (TDD — Tâche 9) : minuscules, accents français préservés, ponctuation, em-dash, chiffres romains de section, entrée vide.
- 6 tests `normalize` (TDD — Tâche 11) : minuscules, dépouillement des diacritiques latins, préservation du grec polytonique, espaces compactés, entrée vide.

L'exécution complète `node --test` (qui pickup automatiquement les fichiers `*.test.js` du dépôt) renvoie également 12/12.

### 1.2 Sanity syntaxique JS (`node --check`)

Tous les modules ont été contrôlés un par un. Aucune erreur de parse :

- `assets/js/landing.js` : OK
- `assets/js/lecture.js` : OK
- `assets/js/modules/anchors.js` : OK
- `assets/js/modules/back-to-top.js` : OK
- `assets/js/modules/normalize.js` : OK
- `assets/js/modules/normalize.test.js` : OK
- `assets/js/modules/prefs.js` : OK
- `assets/js/modules/progress.js` : OK
- `assets/js/modules/render.js` : OK
- `assets/js/modules/search.js` : OK
- `assets/js/modules/sequential-nav.js` : OK
- `assets/js/modules/slug.js` : OK
- `assets/js/modules/slug.test.js` : OK
- `assets/js/modules/states.js` : OK
- `assets/js/modules/toc.js` : OK

### 1.3 Sanity syntaxique CSS (équilibrage des accolades)

Comptage `{` vs `}` dans chaque fichier :

| Fichier                    | `{` | `}` | Statut |
| -------------------------- | --: | --: | :----: |
| `assets/css/base.css`       |  43 |  43 |   OK   |
| `assets/css/components.css` |  25 |  25 |   OK   |
| `assets/css/landing.css`    | 106 | 106 |   OK   |
| `assets/css/lecture.css`    |  80 |  80 |   OK   |
| `assets/css/print.css`      |   8 |   8 |   OK   |
| `assets/css/tokens.css`     |   5 |   5 |   OK   |

### 1.4 Intégrité HTML (sanity)

- `<!DOCTYPE html>` et `<html lang="fr">` présents sur `index.html` et `lecture.html`.
- Aucun **identifiant dupliqué** dans `index.html` ni `lecture.html`.
- Équilibrage des principales balises de contenu (`div`, `section`, `article`, `header`, `footer`, `nav`, `main`, `ul`, `ol`, `li`, `h1–h4`, `p`, `span`, `a`, `button`) : **équilibré** sur les deux pages (compte d'ouverture = compte de fermeture, hors balises auto-fermantes).
- Le balisage exact des éléments imbriqués reste à confirmer par le validateur W3C officiel (cf. §2).

### 1.5 Référentiel des assets

Tous les assets référencés depuis `index.html` et `lecture.html` (via `<link>`, `<script src>` et liens fonctionnels) **existent dans le dépôt** :

- CSS : `tokens.css`, `base.css`, `components.css`, `landing.css`, `lecture.css`, `print.css`
- JS bootstrap : `landing.js`, `lecture.js`
- Modules JS (chargés en lazy via `import()` depuis `lecture.js`) : `render.js`, `states.js`, `toc.js`, `search.js`, `anchors.js`, `progress.js`, `back-to-top.js`, `sequential-nav.js`, `prefs.js`
- Modules JS testés : `slug.js`, `normalize.js`
- Vendors : `marked.esm.min.js`, `purify.min.js`, `purify.es.mjs` (DOMPurify chargé dynamiquement par `render.js`)
- Polices : `inter-400.woff2`, `source-serif-4-regular.woff2` (préchargement) ; les autres fichiers `woff2` du dossier `assets/fonts/` sont chargés via `@font-face` selon `base.css`
- Icônes : `favicon.svg`, `apple-touch-icon.png`
- Source markdown : `AnalyseTheologique.md`

### 1.6 Références CSS — variables (`var(--*)`)

- 49 noms de variables uniques utilisés dans l'ensemble des fichiers CSS.
- 64 variables définies dans `assets/css/tokens.css`.
- **Toutes les `var(--*)` utilisées résolvent vers un token défini dans `tokens.css`** (intersection complète, aucun token manquant).

### 1.7 Hygiène production JS

- Aucune occurrence de `console.log`, `console.debug`, `console.info` ou `console.warn` dans `assets/js/`.
- Un seul `console.error` (`assets/js/lecture.js:31`) conservé dans le bloc `catch` de `boot()` pour le diagnostic d'erreurs réelles en production : comportement attendu et acceptable.

### 1.8 Liens `href="#"` et placeholders

Quatre `href="#"` apparaissent dans `index.html` (lignes 94, 288, 289, 299), tous **résolus dynamiquement** par `assets/js/landing.js` au chargement :

- `#github-link`        → `repoUrl`
- `#footer-github`      → `repoUrl`
- `#footer-issues`      → `${repoUrl}/issues/new`
- `#footer-license`     → `${repoUrl}/blob/main/LICENSE`

`repoUrl` est défini en tête de `landing.js` à `https://github.com/agbruneau/Exploration` avec mention « À ajuster en revue (Annexe D du PRD) ». Le PRD §1 note explicitement : « Licence : Reprise de la licence du dépôt (à confirmer en revue) ». Aucun correctif requis.

### 1.9 Constats globaux

**Aucun défaut détecté** par les contrôles automatisés. Aucune correction de code n'est appliquée dans le commit de cette tâche ; seul le présent document est ajouté.

---

## 2. Vérifications **manuelles** restantes (à exécuter avant la mise en production)

Ces contrôles nécessitent un navigateur ou des outils non disponibles dans l'environnement headless de cette session.

### 2.1 Validateur HTML W3C
- Outil : `https://validator.w3.org/nu/`
- Cible : `index.html` et `lecture.html` (servis localement ou via l'URL de production).
- Critère : **0 erreur, 0 avertissement** ; en cas de remontée, créer un commit `fix:` dédié.

### 2.2 Accessibilité — axe DevTools
- Outil : extension navigateur **axe DevTools** (Chrome/Firefox).
- Cibles : `index.html`, `lecture.html` (état normal **et** focus mode actif).
- Critère : **0 violation** de niveau « serious » ou « critical ». Toute violation « minor/moderate » doit être justifiée ou corrigée.

### 2.3 Lighthouse
- Outil : Lighthouse via DevTools Chrome (modes mobile **et** desktop, navigation privée).
- Cibles **PRD §10 — Performance & qualité** :

  | Score Lighthouse        | Landing (`index.html`) | Lecteur (`lecture.html`) |
  | ----------------------- | :--------------------: | :----------------------: |
  | Performance             |        ≥ 95            |          ≥ 90            |
  | Accessibility           |        ≥ 95            |          ≥ 95            |
  | Best Practices          |        ≥ 95            |          ≥ 95            |
  | SEO                     |        ≥ 95            |          ≥ 95            |

  Le seuil Performance plus permissif sur le lecteur (≥ 90) reflète la charge markdown initiale.

### 2.4 Cross-browser
- Vérifier le rendu et l'interactivité sur : Chrome (dernier), Firefox (dernier), Safari (dernier), Edge (dernier).
- Vérifier également mobile : Safari iOS, Chrome Android.

### 2.5 Test offline / réseau dégradé
- Désactiver le réseau après chargement initial du lecteur : la lecture du contenu déjà rendu doit rester fonctionnelle.
- Tester un premier chargement « offline » : l'état d'erreur défini dans `assets/js/modules/states.js` (`showError("offline")`) doit s'afficher.

### 2.6 Test impression (`print.css`)
- Aperçu d'impression sur les deux pages : pas de rupture intempestive, masquage correct du chrome (header/nav/footer interactifs), conservation des ancres et de la hiérarchie typographique.

---

## 3. Référence — ce qui a été automatisé vs. ce qui reste manuel

| Vérification                          | Automatisée (cette session) | Manuelle (à faire) |
| ------------------------------------- | :-------------------------: | :----------------: |
| `node --test` (slug + normalize)      |             oui             |          —         |
| `node --check` sur tous les modules JS |             oui             |          —         |
| Équilibrage `{` / `}` CSS              |             oui             |          —         |
| Identifiants HTML uniques              |             oui             |          —         |
| Équilibrage des balises HTML majeures  |             oui             |          —         |
| Existence des assets référencés        |             oui             |          —         |
| Variables CSS résolues                 |             oui             |          —         |
| Absence de `console.log` en prod       |             oui             |          —         |
| Validateur HTML W3C                    |              —              |        oui         |
| axe DevTools                           |              —              |        oui         |
| Lighthouse (Perf/A11y/Best/SEO)        |              —              |        oui         |
| Cross-browser (Chrome/FF/Safari/Edge)  |              —              |        oui         |
| Test offline / réseau dégradé          |              —              |        oui         |
| Aperçu impression                      |              —              |        oui         |

---

## 4. Suite

- **Tâche 17** : `README` + procédure de déploiement.
- **Tâche 18** : push GitHub Pages et vérification de production (lors de laquelle les vérifications manuelles §2 doivent être exécutées sur l'URL de prod).
