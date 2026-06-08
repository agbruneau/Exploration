# Méthodologie de notation et limites

## 1. Principe

La notation traduit chaque réponse RFP en une note unique sur 100, comparable entre candidats, par agrégation pondérée de onze critères évalués sur une échelle de maturité 0–5.

```
Points du critère = (note sur 5 ÷ 5) × pondération du critère (en %)
Note finale /100  = Σ (points de tous les critères)
```

La somme des pondérations vaut exactement 100 (vérifiée par programme). Les demi-points (4,5) sont admis pour refléter des nuances documentées.

## 2. Source des notes

Chaque note 0–5 est dérivée des capacités produit **réelles et vérifiées** (juin 2026), documentées dans :

- les réponses RFP simulées (`../03-Reponses-Candidats/`), chacune citant ses sources primaires;
- l'analyse de marché (`../02-Analyse-Marche/`).

Les notes sont ancrées sur des faits vérifiables, non sur le marketing des fournisseurs. Les éléments incertains sont marqués « à vérifier » et n'ont pas été crédités comme capacités natives.

## 3. Reproductibilité

Le calcul est reproductible : la matrice des notes brutes figure dans `../04-Evaluation/Matrice-Scores.csv`. La formule ci-dessus appliquée à ces notes reproduit les totaux du classement. Une analyse de sensibilité (trois jeux de pondérations) teste la robustesse du classement.

## 4. Limites et biais à connaître

- **Réponses simulées.** Les soumissions ne sont pas de vraies réponses de fournisseurs; elles modélisent ce qu'un fournisseur pourrait répondre compte tenu de ses capacités publiques. Un PoC réel reste indispensable.
- **Notes = jugement d'expert.** Les notes 0–5 reflètent un jugement d'architecte calibré sur les sources; un autre comité pourrait varier de ±0,5 sur certains critères. C'est pourquoi un écart ≤ 2 points est traité comme une quasi-égalité.
- **Pondération dépendante du profil.** La pondération est calibrée pour un FSI hybride. Un autre profil (cloud-first, secteur public, télécom) modifierait les poids et donc le classement — voir l'analyse de sensibilité.
- **Prix indicatifs.** Le critère TCO (C10) s'appuie sur des structures tarifaires publiques et des estimations tierces, non sur des devis fermes. À confirmer en négociation.
- **Instantané temporel.** Le marché évolue vite (IA/agentique en particulier). L'évaluation est datée de juin 2026 et devrait être rafraîchie avant une décision tardive.

## 5. Échelle de maturité

| Note | Signification |
|---:|---|
| 5 | Référence du marché — natif, mature, éprouvé en FSI |
| 4 | Forte — natif avec réserves mineures |
| 3 | Adéquate — partielle ou nécessitant configuration/modules |
| 2 | Faible — couverture limitée, contournements |
| 1 | Marginale — embryonnaire ou via tiers |
| 0 | Absente |
