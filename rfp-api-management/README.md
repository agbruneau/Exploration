# RFP — Plateforme de gestion des API d'entreprise (API Management)

Dépôt consolidant un **appel d'offres (RFP) complet** pour l'acquisition d'une plateforme de gestion des API d'entreprise en **déploiement hybride**, destiné à une grande **institution financière** (profil illustratif : *Groupe Financier Boréal*, banque/assurance). Il comprend le RFP, l'analyse de marché de juin 2026, cinq réponses RFP simulées par solution candidate, et une évaluation comparative notée sur 100.

> **Nature du dépôt.** Exercice d'évaluation rigoureux à partir de capacités produit *réelles et vérifiées* (juin 2026). Les réponses des fournisseurs sont **simulées** et les prix **indicatifs/illustratifs, non contractuels**. Les éléments incertains portent un marqueur « à vérifier ». Voir l'avis en bas de page.

---

## Résultat (synthèse exécutive)

Pour le profil retenu — **services financiers, déploiement hybride**, pondération forte sur sécurité/conformité/souveraineté (42 %) — le classement des cinq Leaders Gartner 2025 évalués est :

| Rang | Solution | Note /100 | Lecture |
|---:|---|---:|---|
| 🥇 1 | **IBM API Connect** | **93,7** | Adéquation FSI/hybride/conformité maximale (DataPower, *Protected B*, FIPS niv. 3); complexité et TCO à maîtriser |
| 🥈 2 | **Kong Konnect** | **88,5** | Meilleure architecture hybride + IA/agentique; conformité Canada à confirmer |
| 🥉 3 | **Google Apigee** | **87,4** | Leader en exécution et IA; événementiel natif faible |
| 4 | **Salesforce MuleSoft** | **86,1** | Intégration + API + *Protected B* Canada; TCO élevé |
| 5 | **Microsoft Azure APIM** | **82,9** | Intégration Azure native; hybride limité au Premium classique |

**Recommandation :** retenir **IBM API Connect** comme finaliste de tête et **Kong Konnect** comme second finaliste pour une épreuve comparative (PoC). Les positions 2 à 4 forment un peloton de 2,4 points (quasi-égalité) : le départage se fait par PoC sur les cas d'usage critiques et par négociation. Le classement de tête est **robuste** à l'analyse de sensibilité (IBM demeure 1er dans les trois scénarios de pondération testés). Détails et nuances : [`04-Evaluation/Rapport-Evaluation-Consolide.md`](04-Evaluation/Rapport-Evaluation-Consolide.md).

---

## Structure du dépôt

```
rfp-api-management/
├── README.md                         ← vous êtes ici
├── 01-RFP/                           Appel d'offres et annexes
│   ├── 00-RFP-Gestion-API-Entreprise.md   RFP principal (contexte, 10 cas d'usage, exigences, critères)
│   ├── A1-Grille-Evaluation-Ponderee.md   Grille de notation /100 (11 critères pondérés)
│   ├── A2-Matrice-Exigences.md            Matrice détaillée des exigences (EF/EA/ES/EC/EN)
│   └── A3-Modalites-Reponse.md            Modalités, structure de réponse, admissibilité
├── 02-Analyse-Marche/
│   └── Analyse-Marche-API-Management-2026.md   Panorama, leaders, justification de la shortlist
├── 03-Reponses-Candidats/           Réponses RFP simulées (1 par solution)
│   ├── 01-Google-Apigee.md
│   ├── 02-Salesforce-MuleSoft.md
│   ├── 03-Kong-Konnect.md
│   ├── 04-IBM-API-Connect.md
│   └── 05-Microsoft-Azure-APIM.md
├── 04-Evaluation/
│   ├── Rapport-Evaluation-Consolide.md    Évaluation comparative, scores, recommandation, sensibilité
│   └── Matrice-Scores.csv                 Données de notation (note/5 par critère + totaux)
└── docs/
    └── methodologie-notation.md           Méthode de notation et limites
```

## Parcours de lecture suggéré

1. **Décideurs** : ce README → [Rapport d'évaluation](04-Evaluation/Rapport-Evaluation-Consolide.md).
2. **Architectes** : [RFP principal](01-RFP/00-RFP-Gestion-API-Entreprise.md) → [Analyse de marché](02-Analyse-Marche/Analyse-Marche-API-Management-2026.md) → réponses candidates.
3. **Équipe achats/conformité** : [Grille A1](01-RFP/A1-Grille-Evaluation-Ponderee.md) → [Matrice des exigences A2](01-RFP/A2-Matrice-Exigences.md) → [Matrice de scores](04-Evaluation/Matrice-Scores.csv).

---

## Méthode (résumé)

- **Présélection** : restriction aux Leaders du *Magic Quadrant* Gartner API Management 2025 (17 fournisseurs évalués, publié le 7 oct. 2025), puis filtre d'adéquation au profil FSI hybride. Cinq candidats retenus; trois Leaders écartés avec justification (voir analyse de marché).
- **Notation** : 11 critères pondérés totalisant 100 %, échelle de maturité 0–5. `Note finale = Σ (note/5 × pondération)`. Calculs vérifiés par programme.
- **Pondération** (premiers principes FSI) : architecture hybride 15 %, sécurité 15 %, conformité/souveraineté 12 %, fonctionnel cœur 15 %, puis performance, observabilité, événementiel, IA/agentique, expérience développeur, TCO, écosystème.

| Critère | Poids | Critère | Poids |
|---|---:|---|---:|
| C1 Fonctionnel cœur | 15 % | C7 Événementiel & GraphQL | 6 % |
| C2 Architecture & hybride | 15 % | C8 IA/LLM & agentique | 7 % |
| C3 Sécurité | 15 % | C9 Exp. dév & gouvernance | 6 % |
| C4 Conformité & souveraineté | 12 % | C10 TCO & commercial | 6 % |
| C5 Performance | 8 % | C11 Écosystème & pérennité | 4 % |
| C6 Observabilité | 6 % | **Total** | **100 %** |

---

## Contexte de marché (juin 2026)

Marché estimé à ~8,2 G$ US (2025), projeté à ~53 G$ US en 2034 (*estimation tierce, à valider*). Cinq forces structurantes : passerelle IA/LLM, protocole MCP et agentique (A2A), gouvernance du trafic non humain (~80 % du trafic d'API en 2026 — *projection*), convergence événementielle, et hybridation/souveraineté. Détails et sources : [analyse de marché](02-Analyse-Marche/Analyse-Marche-API-Management-2026.md).

---

## Avis et limites

Le *Groupe Financier Boréal* est une organisation **fictive**. Les réponses des fournisseurs sont des **simulations** construites à partir de capacités produit publiques et vérifiées (juin 2026), à des fins d'évaluation méthodologique; elles ne constituent pas de véritables soumissions. Les **prix sont indicatifs**, souvent issus de sources tierces, et ne doivent pas servir d'engagement budgétaire. Le rapport Gartner intégral est sous licence et n'a pas été consulté directement; les positions « Leader » proviennent des annonces des éditeurs citant Gartner. Avant toute décision réelle, lever les points marqués « à vérifier » et obtenir des devis fermes.

*Dernière mise à jour : 8 juin 2026.*
