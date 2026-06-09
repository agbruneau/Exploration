# Tableau de bord exécutif + Landing page — Méta-analyse RFP « API Management »

Deux livrables Web pour comité exécutif, issus du prompt
[`PROMPT-Tableau-de-bord-et-Landing-API-Management.md`](../PROMPT-Tableau-de-bord-et-Landing-API-Management.md).
Ils comparent des plateformes d'*API Management* à travers **trois simulations d'appel d'offres** (juin 2026)
qui désignent **trois gagnants différents** — IBM API Connect, Gravitee, Kong Enterprise — selon le cadrage.

| Livrable | Fichier | Rôle |
|---|---|---|
| **B — Landing page** | [`index.html`](index.html) | Présentation narrative, lisible en ~3 min, imprimable. Point d'entrée. |
| **A — Tableau de bord** | [`dashboard.html`](dashboard.html) | Comparaison interactive : classement, radar, heatmap, sensibilité, vue méta, réserves/PoC. |

## Ouvrir

- **Le plus simple :** double-cliquer sur `index.html` (puis « Ouvrir le tableau de bord »). Tout fonctionne hors-ligne en `file://`.
- **Via un serveur local** (recommandé si le navigateur restreint `file://`) :
  ```bash
  python -m http.server 4321 --directory Tableau-de-bord-API-Management
  # puis http://localhost:4321/
  ```

## Structure

```
Tableau-de-bord-API-Management/
├─ index.html            # Livrable B — Landing (entrée)
├─ dashboard.html        # Livrable A — Tableau de bord
└─ assets/
   ├─ data.js            # SOURCE UNIQUE DE VÉRITÉ (prompt §2.6, verbatim) + constantes dérivées
   ├─ theme.css          # Jetons de design §3.1, typographie, accessibilité, impression
   ├─ charts.js          # Graphiques SVG faits main : barres, radar, heatmap, pentes, bump chart
   ├─ dashboard.js       # Logique du tableau de bord (état en mémoire)
   └─ landing.js         # Logique de la landing (KPI, podiums, bascule FR/EN)
```

## Choix d'ingénierie (et arbitrages)

- **Pile : HTML/CSS/SVG autonome, zéro dépendance, zéro réseau.** Le prompt suggère React + Recharts (§6),
  mais l'encadre comme un *compromis* avec « condition qui renverse », tandis que **« aucun appel réseau externe »**
  est une contrainte dure (§6/§7). Charger React/Recharts/Inter depuis un CDN la violerait ; un projet Vite
  imposerait `npm install`. Pour une audience exécutive (« ouvrir et voir »), on retient des fichiers statiques
  qui respectent **littéralement** : aucun réseau, aucun stockage navigateur, données en `const`, ouverture par
  double-clic, hors-ligne, imprimable. Les graphiques sont dessinés en SVG (pleine maîtrise du thème et de l'accessibilité).
- **Modules :** chargés en `<script>`/`<link>` classiques (pas de modules ES, bloqués en `file://`).
- **Police :** `Inter` si installée localement, sinon pile système (aucun téléchargement de police).

## Intégrité des données (§7)

- `assets/data.js` reproduit le bloc JSON de la **section 2.6 du prompt, tel quel**. Aucune autre donnée n'est utilisée.
- **Aucune moyenne ni score consolidé inter-simulations** : les échelles sont incomparables (notes /5 pour Sim 1/2,
  points absolus pour Sim 3). La vue méta ne croise que les **rangs**.
- **Vérification automatique :** pour chaque candidat, le total affiché égale Σ(note/5 × poids) (Sim 1/2) ou Σ points (Sim 3).
  Les 13 totaux concordent exactement (écart nul) — `weightedTotal()` dans `data.js`.
- L'avertissement d'intégrité (`meta.avertissement`) est reproduit sur **les deux** livrables : *organisation fictive ·
  réponses simulées · prix indicatifs et non contractuels · éléments « à vérifier »*.

## Système de design (§3)

Thème sombre, accent orange. Corps de texte en `--text` (`#E6E8EC`) ; **orange réservé aux titres, accents, barres,
étiquettes et surbrillances** (compromis WCAG AA : l'orange saturé en petit corps n'atteint pas 4,5:1 sur fond sombre).
Kong est **toujours en orange** dans la data-viz (fil conducteur de la méta-analyse).

## Accessibilité (§3.3)

Navigation clavier complète, `role="img"` + `aria-label` sur chaque graphique et cellule, info-bulles au survol **et au
focus**, anneau de focus orange visible, `prefers-reduced-motion` respecté (animations neutralisées), contraste AA pour le corps.

## Bilinguisme

`fr-CA` par défaut, bascule **FR / EN** (chrome, KPI, titres, raisons des verdicts, leviers, recommandation).
Les libellés de critères restent en français (langue source).

## Impression

Feuille `@media print` : fond clair, texte foncé, navigation et contrôles masqués (landing imprimable proprement / export PDF).

---

*Organisation cliente fictive ; réponses fournisseurs simulées à partir de capacités produit publiques vérifiées
(juin 2026) ; prix indicatifs et non contractuels ; éléments incertains marqués « à vérifier ».*
