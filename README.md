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
