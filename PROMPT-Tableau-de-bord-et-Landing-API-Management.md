# Prompt de génération — Tableau de bord exécutif + Landing page
## Méta-analyse RFP « API Management d'entreprise » (trois simulations, juin 2026)

> **Usage.** Ce document est un *prompt* destiné à un agent de génération d'interface (Claude Code, générateur d'artefacts React/HTML, etc.). Il est auto-suffisant : tout ce qui suit — rôle, données, design, spécifications, garde-fous — doit être respecté à la lettre. **Ne rien inventer hors du jeu de données fourni à la section 2.**

---

## 0. Rôle et mission

Tu es un ingénieur front-end senior doublé d'un designer d'information. Tu produis **deux livrables Web** destinés à un comité exécutif d'institution financière :

- **Livrable A — Tableau de bord Web interactif** : comparaison des solutions d'*API Management* à travers trois exercices d'évaluation distincts.
- **Livrable B — Landing page exécutive** : page de présentation narrative, lisible en 3 minutes, renvoyant vers le tableau de bord.

Les deux livrables partagent le même **thème sombre à accent orange** (section 3) et la même **source unique de vérité** (section 2). Audience : direction, comité d'investissement, dirigeants métier — peu de temps, besoin du *signal*, pas du détail brut.

---

## 1. Contexte et insight directeur (à transmettre, pas à réinventer)

Trois simulations indépendantes d'appel d'offres (RFP) pour une plateforme d'*API Management* en déploiement hybride/souverain ont été conduites avec des outils différents. **Elles désignent trois gagnants différents.** C'est le cœur du message exécutif.

| Simulation | Outil | Profil client (fictif) | Candidats | Gagnant | Score gagnant |
|---|---|---|---|---|---|
| Sim 1 | Claude Cowork Max | Groupe Financier Boréal (GFB) | 5 | **IBM API Connect** | 93,7 / 100 |
| Sim 2 | Claude Code Ultracode | Banque Boréale du Québec (BBQ) | 5 | **Gravitee** | 75,4 / 100 |
| Sim 3 | Gemini Deep Think | Entreprise générique | 3 | **Kong Enterprise** | 94 % |

**Insight directeur à matérialiser visuellement** : le verdict est une fonction du *cadrage*, pas une vérité absolue. Trois leviers expliquent la divergence :

1. **La pondération.** Sim 1 charge le bloc fonctionnel + architecture + sécurité (≈ 45 %) et favorise la maturité FSI d'IBM/DataPower. Sim 2 met conformité/souveraineté au plus haut (C2 = 13) mais laisse TCO et expérience développeur départager → avantage open source (Gravitee, WSO2). Sim 3 charge architecture légère + IA (50 % sur deux critères) → avantage Kong.
2. **La shortlist.** Gravitee et WSO2 n'existent que dans Sim 2 ; Azure que dans Sim 1 ; Sim 3 ne retient que 3 candidats. Le pool conditionne le podium.
3. **La rigueur méthodologique.** Sim 1 et Sim 2 notent 11 critères avec calibrage et analyse de sensibilité ; Sim 3 est un exercice plus léger (5 critères, 3 candidats, scores en points absolus). **Les échelles ne sont pas comparables entre simulations.**

**Constante robuste à mettre en évidence** : Kong n'est jamais sous la 2ᵉ place (2ᵉ en Sim 1, 2ᵉ en Sim 2, 1ᵉʳ en Sim 3). IBM et Gravitee gagnent chacun sous leur profil. Pour un profil FSI souveraineté-d'abord, les prétendants crédibles sont IBM, Gravitee et Kong ; **le départage relève d'une preuve de concept (PoC)**, pas d'un score sur dossier.

---

## 2. Jeu de données — source unique de vérité

**Règle absolue : n'utilise que ces chiffres. Aucune extrapolation, aucune moyenne inter-simulations** (échelles incomparables). Reproduis les libellés tels quels.

### 2.1 Simulation 1 — GFB (pondérations et notes /5)

Pondérations : C1=15, C2=15, C3=15, C4=12, C5=8, C6=6, C7=6, C8=7, C9=6, C10=6, C11=4.

| Critère | Poids | Apigee | MuleSoft | Kong | IBM | Azure |
|---|---:|:--:|:--:|:--:|:--:|:--:|
| C1 Fonctionnel cœur | 15 | 5,0 | 5,0 | 4,0 | 5,0 | 4,0 |
| C2 Architecture & hybride | 15 | 4,5 | 4,5 | 5,0 | 5,0 | 3,5 |
| C3 Sécurité | 15 | 4,5 | 4,0 | 4,5 | 5,0 | 4,5 |
| C4 Conformité & souveraineté | 12 | 4,0 | 4,5 | 3,5 | 5,0 | 4,5 |
| C5 Performance | 8 | 4,5 | 4,0 | 5,0 | 4,5 | 4,0 |
| C6 Observabilité | 6 | 4,5 | 4,0 | 4,5 | 4,0 | 4,5 |
| C7 Événementiel & GraphQL | 6 | 3,0 | 4,5 | 4,5 | 4,5 | 4,0 |
| C8 IA/LLM & agentique | 7 | 5,0 | 4,0 | 5,0 | 4,5 | 4,5 |
| C9 Exp. dév & gouvernance | 6 | 4,0 | 4,5 | 4,5 | 4,0 | 4,0 |
| C10 TCO & commercial | 6 | 3,5 | 3,0 | 4,0 | 3,5 | 4,0 |
| C11 Écosystème & pérennité | 4 | 4,5 | 4,5 | 4,5 | 5,0 | 4,5 |
| **Total /100** | 100 | **87,4** | **86,1** | **88,5** | **93,7** | **82,9** |
| Rang | | 3 | 4 | 2 | 1 | 5 |

Analyse de sensibilité (Sim 1) :

| Solution | Base | Cloud-first | Souveraineté max |
|---|:--:|:--:|:--:|
| IBM API Connect | 93,7 | 91,5 | 94,6 |
| Kong Konnect | 88,5 | 88,4 | 88,0 |
| Google Apigee | 87,4 | 86,5 | 87,2 |
| Salesforce MuleSoft | 86,1 | 84,9 | 87,0 |
| Microsoft Azure APIM | 82,9 | 83,0 | 82,7 |

IBM reste 1ᵉʳ dans les trois scénarios → classement de tête **robuste**.

### 2.2 Simulation 2 — BBQ (pondérations et notes /5)

Pondérations : C1=12, C2=13, C3=12, C4=11, C5=9, C6=7, C7=7, C8=6, C9=7, C10=8, C11=8.

| Critère | Poids | Kong | IBM | Apigee | Gravitee | WSO2 |
|---|---:|:--:|:--:|:--:|:--:|:--:|
| C1 Sécurité | 12 | 4 | 4 | 4 | 4 | 3 |
| C2 Conformité & souveraineté | 13 | 3 | 4 | 2 | 3 | 4 |
| C3 Architecture hybride | 12 | 4 | 4 | 2 | 4 | 4 |
| C4 Fonctionnel cœur | 11 | 4 | 4 | 4 | 4 | 4 |
| C5 Gouvernance & catalogue | 9 | 4 | 4 | 4 | 3 | 4 |
| C6 Performance | 7 | 4 | 3 | 3 | 3 | 3 |
| C7 Observabilité | 7 | 4 | 3 | 3 | 4 | 3 |
| C8 Événementiel | 6 | 3 | 4 | 2 | 5 | 3 |
| C9 IA/agentique | 7 | 4 | 3 | 4 | 4 | 3 |
| C10 Expérience dév | 8 | 3 | 3 | 4 | 4 | 4 |
| C11 TCO & écosystème | 8 | 3 | 2 | 2 | 4 | 4 |
| **Total /100** | 100 | **73,0** | **71,0** | **61,6** | **75,4** | **72,2** |
| Rang | | 2 | 4 | 5 | 1 | 3 |

Analyse de sensibilité (Sim 2) :

| Solution | Base | Souveraineté+ (×1,4 C1+C2) | Coût & DX+ (×1,5 C10+C11) |
|---|:--:|:--:|:--:|
| Gravitee | 75,4 | 74,9 | 75,7 |
| Kong | 73,0 | 72,7 | 72,0 |
| WSO2 | 72,2 | 72,0 | 72,8 |
| IBM | 71,0 | 71,8 | 69,4 |
| Apigee | 61,6 | 61,4 | 61,5 |

Gravitee reste 1ᵉʳ partout ; la 2ᵉ place (Kong vs WSO2) **est sensible** au profil coût/DX.

### 2.3 Simulation 3 — Gemini Deep Think (points absolus dans chaque poids)

Pondérations : Architecture/multi-cloud 25 ; Sécurité+conformité+AI Gateway 25 ; Monétisation & portail 20 ; APIOps & observabilité 15 ; TCO 15.

| Critère (poids) | Apigee | Kong | MuleSoft |
|---|:--:|:--:|:--:|
| Architecture & multi-cloud (25) | 18 | 25 | 16 |
| Sécurité, conformité & AI Gateway (25) | 23 | 25 | 19 |
| Monétisation & portail (20) | 20 | 16 | 15 |
| APIOps & observabilité (15) | 14 | 14 | 13 |
| TCO & modèle économique (15) | 10 | 14 | 9 |
| **Score global /100** | **85** | **94** | **72** |
| Rang | 2 | 1 | 3 |

> **Avertissement à afficher** : Sim 3 est un exercice plus léger (3 candidats, 5 critères, scores en points absolus) — à ne **jamais** mélanger aux notes /5 des Sim 1 et 2.

### 2.4 Cohérence inter-simulations (méta — uniquement sur les rangs)

| Candidat | Sim 1 (GFB) | Sim 2 (BBQ) | Sim 3 (Gemini) |
|---|:--:|:--:|:--:|
| Kong | 2ᵉ (88,5) | 2ᵉ (73,0) | **1ᵉʳ (94)** |
| IBM | **1ᵉʳ (93,7)** | 4ᵉ (71,0) | — |
| Apigee | 3ᵉ (87,4) | 5ᵉ (61,6) | 2ᵉ (85) |
| MuleSoft | 4ᵉ (86,1) | — | 3ᵉ (72) |
| Gravitee | — | **1ᵉʳ (75,4)** | — |
| WSO2 | — | 3ᵉ (72,2) | — |
| Azure APIM | 5ᵉ (82,9) | — | — |

### 2.5 Réserves « à vérifier » (panneau de diligence)

À afficher comme points de PoC/diligence, par candidat :

- **IBM** : complexité d'exploitation (OpenShift), TCO/sur-licenciement CP4I (>50 % observé), convergence API Connect/webMethods récente, région Reserved Instance Canada à confirmer, maturité IA/MCP en production.
- **Kong** : région du plan de contrôle Konnect SaaS au Canada non confirmée (option self-managed recommandée), FIPS 140-2 non validé CMVP, SOC 2/ISO 27001 à confirmer en source primaire, pas de WAF natif, prévisibilité tarifaire (composante par requête).
- **Gravitee** : SOC 2 Type II / PCI-DSS / Protected B non confirmés publiquement, région cloud souveraine canadienne non confirmée, BYOK/HYOK et audit immuable = propriétés d'architecture, taille d'éditeur intermédiaire (diligence B-10).
- **Apigee** : plan de contrôle non installable on-prem/souverain (écart majeur), survivabilité hors-ligne partielle, résidence Canada du plan de contrôle à vérifier, événementiel natif faible.
- **MuleSoft** : TCO élevé / tarification opaque (Flows+Messages), surcharge JVM, FIPS 140-2 on-prem à confirmer.
- **WSO2** : certifications portées par l'exploitant (pas l'éditeur) en auto-hébergé, sécurité API avancée partielle, masquage PII via tiers potentiellement hors Canada, forte exigence de maturité d'ingénierie interne.
- **Azure APIM** : self-hosted gateway limité au palier Premium classique, plan de contrôle exclusivement Azure, pas d'air-gap permanent, lacunes des *workspaces*.

### 2.6 JEU DE DONNÉES canonique (à intégrer tel quel dans le code)

```json
{
  "meta": {
    "titre": "Sélection d'une plateforme d'API Management — méta-analyse de trois évaluations",
    "date": "juin 2026",
    "constat": "Trois cadrages, trois verdicts. Kong jamais sous la 2e place.",
    "avertissement": "Organisation cliente fictive ; réponses fournisseurs simulées à partir de capacités produit publiques vérifiées (juin 2026) ; prix indicatifs et non contractuels ; éléments incertains marqués « à vérifier »."
  },
  "simulations": [
    {
      "id": "sim1", "outil": "Claude Cowork Max", "client": "Groupe Financier Boréal (GFB)",
      "echelle": "notes /5, total /100", "gagnant": "IBM API Connect",
      "criteres": [
        {"code":"C1","libelle":"Fonctionnel cœur","poids":15},
        {"code":"C2","libelle":"Architecture & hybride","poids":15},
        {"code":"C3","libelle":"Sécurité","poids":15},
        {"code":"C4","libelle":"Conformité & souveraineté","poids":12},
        {"code":"C5","libelle":"Performance","poids":8},
        {"code":"C6","libelle":"Observabilité","poids":6},
        {"code":"C7","libelle":"Événementiel & GraphQL","poids":6},
        {"code":"C8","libelle":"IA/LLM & agentique","poids":7},
        {"code":"C9","libelle":"Exp. dév & gouvernance","poids":6},
        {"code":"C10","libelle":"TCO & commercial","poids":6},
        {"code":"C11","libelle":"Écosystème & pérennité","poids":4}
      ],
      "candidats": [
        {"nom":"IBM API Connect","total":93.7,"rang":1,"notes":{"C1":5,"C2":5,"C3":5,"C4":5,"C5":4.5,"C6":4,"C7":4.5,"C8":4.5,"C9":4,"C10":3.5,"C11":5}},
        {"nom":"Kong Konnect","total":88.5,"rang":2,"notes":{"C1":4,"C2":5,"C3":4.5,"C4":3.5,"C5":5,"C6":4.5,"C7":4.5,"C8":5,"C9":4.5,"C10":4,"C11":4.5}},
        {"nom":"Google Apigee","total":87.4,"rang":3,"notes":{"C1":5,"C2":4.5,"C3":4.5,"C4":4,"C5":4.5,"C6":4.5,"C7":3,"C8":5,"C9":4,"C10":3.5,"C11":4.5}},
        {"nom":"Salesforce MuleSoft","total":86.1,"rang":4,"notes":{"C1":5,"C2":4.5,"C3":4,"C4":4.5,"C5":4,"C6":4,"C7":4.5,"C8":4,"C9":4.5,"C10":3,"C11":4.5}},
        {"nom":"Microsoft Azure APIM","total":82.9,"rang":5,"notes":{"C1":4,"C2":3.5,"C3":4.5,"C4":4.5,"C5":4,"C6":4.5,"C7":4,"C8":4.5,"C9":4,"C10":4,"C11":4.5}}
      ],
      "sensibilite": {
        "scenarios": ["Base","Cloud-first","Souveraineté max"],
        "valeurs": {
          "IBM API Connect":[93.7,91.5,94.6],
          "Kong Konnect":[88.5,88.4,88.0],
          "Google Apigee":[87.4,86.5,87.2],
          "Salesforce MuleSoft":[86.1,84.9,87.0],
          "Microsoft Azure APIM":[82.9,83.0,82.7]
        }
      }
    },
    {
      "id": "sim2", "outil": "Claude Code Ultracode", "client": "Banque Boréale du Québec (BBQ)",
      "echelle": "notes /5, total /100", "gagnant": "Gravitee",
      "criteres": [
        {"code":"C1","libelle":"Sécurité","poids":12},
        {"code":"C2","libelle":"Conformité & souveraineté","poids":13},
        {"code":"C3","libelle":"Architecture hybride","poids":12},
        {"code":"C4","libelle":"Fonctionnel cœur","poids":11},
        {"code":"C5","libelle":"Gouvernance & catalogue","poids":9},
        {"code":"C6","libelle":"Performance","poids":7},
        {"code":"C7","libelle":"Observabilité","poids":7},
        {"code":"C8","libelle":"Événementiel","poids":6},
        {"code":"C9","libelle":"IA/agentique","poids":7},
        {"code":"C10","libelle":"Expérience dév","poids":8},
        {"code":"C11","libelle":"TCO & écosystème","poids":8}
      ],
      "candidats": [
        {"nom":"Gravitee","total":75.4,"rang":1,"notes":{"C1":4,"C2":3,"C3":4,"C4":4,"C5":3,"C6":3,"C7":4,"C8":5,"C9":4,"C10":4,"C11":4}},
        {"nom":"Kong","total":73.0,"rang":2,"notes":{"C1":4,"C2":3,"C3":4,"C4":4,"C5":4,"C6":4,"C7":4,"C8":3,"C9":4,"C10":3,"C11":3}},
        {"nom":"WSO2","total":72.2,"rang":3,"notes":{"C1":3,"C2":4,"C3":4,"C4":4,"C5":4,"C6":3,"C7":3,"C8":3,"C9":3,"C10":4,"C11":4}},
        {"nom":"IBM","total":71.0,"rang":4,"notes":{"C1":4,"C2":4,"C3":4,"C4":4,"C5":4,"C6":3,"C7":3,"C8":4,"C9":3,"C10":3,"C11":2}},
        {"nom":"Google Cloud Apigee","total":61.6,"rang":5,"notes":{"C1":4,"C2":2,"C3":2,"C4":4,"C5":4,"C6":3,"C7":3,"C8":2,"C9":4,"C10":4,"C11":2}}
      ],
      "sensibilite": {
        "scenarios": ["Base","Souveraineté+","Coût & DX+"],
        "valeurs": {
          "Gravitee":[75.4,74.9,75.7],
          "Kong":[73.0,72.7,72.0],
          "WSO2":[72.2,72.0,72.8],
          "IBM":[71.0,71.8,69.4],
          "Google Cloud Apigee":[61.6,61.4,61.5]
        }
      }
    },
    {
      "id": "sim3", "outil": "Gemini Deep Think", "client": "Entreprise générique",
      "echelle": "points absolus par poids, total /100 — exercice plus léger, NON comparable aux Sim 1/2",
      "gagnant": "Kong Enterprise",
      "criteres": [
        {"code":"G1","libelle":"Architecture & multi-cloud","poids":25},
        {"code":"G2","libelle":"Sécurité, conformité & AI Gateway","poids":25},
        {"code":"G3","libelle":"Monétisation & portail","poids":20},
        {"code":"G4","libelle":"APIOps & observabilité","poids":15},
        {"code":"G5","libelle":"TCO & modèle économique","poids":15}
      ],
      "candidats": [
        {"nom":"Kong Enterprise","total":94,"rang":1,"points":{"G1":25,"G2":25,"G3":16,"G4":14,"G5":14}},
        {"nom":"Apigee (Google)","total":85,"rang":2,"points":{"G1":18,"G2":23,"G3":20,"G4":14,"G5":10}},
        {"nom":"MuleSoft","total":72,"rang":3,"points":{"G1":16,"G2":19,"G3":15,"G4":13,"G5":9}}
      ]
    }
  ]
}
```

---

## 3. Système de design (thème sombre, accent orange)

### 3.1 Jetons de couleur (CSS variables)

```css
:root{
  --bg:          #0B0D12;  /* fond de base, noir cool */
  --surface:     #14171D;  /* sections */
  --card:        #1A1E26;  /* cartes / panneaux */
  --border:      #262B35;  /* filets */
  --text:        #E6E8EC;  /* corps de texte (blanc chaud) */
  --text-muted:  #9AA0AB;  /* secondaire */
  --orange:      #F97316;  /* accent fort : barres, fills, surbrillances */
  --orange-bright:#FB923C; /* texte orange portant une charge de lecture (titres, liens) */
  --orange-soft: #FFB37A;  /* corps orange si exigé (≥16px uniquement) */
  --positive:    #34D399;  /* gagnant / signal positif, parcimonieux */
  --warning:     #FBBF24;  /* réserves / à vérifier */
}
```

### 3.2 Typographie

- Police : `Inter`, sinon pile système (`system-ui, -apple-system, "Segoe UI", Roboto, sans-serif`). Tabulaire pour les chiffres (`font-variant-numeric: tabular-nums`).
- Hiérarchie : H1 44–56 px / 700 ; H2 28–32 px / 600 ; H3 20–22 px / 600 ; corps 16–18 px / 400 ; légendes 13–14 px.
- Titres et chiffres-clés en `--orange-bright` ; corps en `--text`.

### 3.3 Accessibilité — compromis « écriture orange » (à appliquer)

- **Compromis principal** : l'orange saturé (`--orange`) en corps de texte sur fond sombre n'atteint pas le ratio WCAG AA 4,5:1 en petite taille. → **Orange réservé aux titres, accents, étiquettes de données, barres et surbrillances** ; **corps en `--text` (`#E6E8EC`)**.
- **Alternative** (si la direction exige un corps orange) : utiliser `--orange-soft` (`#FFB37A`) à ≥ 16 px et vérifier ≥ 4,5:1 contre `--bg`. Ne jamais descendre l'orange de corps sous 16 px.
- **Condition qui renverse** : si le livrable est projeté en salle (gros texte, lecture courte), l'orange saturé en corps redevient acceptable (cible AA « large text » ≥ 3:1).
- Navigation clavier complète, `aria-label` sur graphiques, états `:focus-visible` visibles (anneau orange), respect de `prefers-reduced-motion`.

### 3.4 Palette data-viz (5 candidats max + Kong fil rouge)

Couleurs distinctes et lisibles sur sombre, **Kong toujours en orange** (`--orange`) pour incarner le fil conducteur de la méta-analyse :

| Candidat | Couleur |
|---|---|
| Kong | `#F97316` (orange) |
| IBM | `#60A5FA` (bleu) |
| Gravitee | `#34D399` (vert) |
| Apigee | `#FBBF24` (ambre) |
| MuleSoft | `#A78BFA` (violet) |
| WSO2 | `#FB7185` (rose) |
| Azure APIM | `#22D3EE` (cyan) |

---

## 4. Livrable A — Tableau de bord Web

Disposition : barre supérieure (titre + sélecteurs globaux) ; bandeau de KPI ; corps en grille de panneaux ; pied avec avertissement d'intégrité. Mobile-first, montée en grille ≥ 1024 px.

**Sélecteurs globaux** : (a) simulation active — `Sim 1 · GFB` / `Sim 2 · BBQ` / `Sim 3 · Gemini` / `Vue méta` ; (b) scénario de pondération (visible en Sim 1 et Sim 2) ; (c) jusqu'à 3 candidats mis en focus.

**Bandeau de KPI** (4 tuiles) : « 3 simulations » · « 3 gagnants distincts » · « Kong jamais < 2ᵉ » · « PoC = arbitre final ». Chiffre en `--orange-bright`, libellé en `--text-muted`.

**Panneaux par simulation** :

1. **Classement** — barres horizontales triées du total ; gagnant souligné par un liseré/halo orange ; étiquette de valeur. Bouton « voir les 11 critères ».
2. **Radar des critères** — un axe par critère, polygones des candidats en focus ; échelle 0–5 (Sim 1/2) ou points (Sim 3). Légende cliquable pour isoler.
3. **Carte de chaleur (heatmap)** critère × candidat — cellule colorée du clair-neutre à l'orange saturé selon la note ; survol = valeur + libellé du critère. Met visuellement en évidence où IBM verrouille Sim 1 (5/5/5/5) et où Apigee décroche en Sim 2 (C2/C3 = 2).
4. **Analyse de sensibilité** — graphique en pentes (slope/bump chart) montrant le déplacement des scores entre scénarios (Sim 1 : Base/Cloud-first/Souveraineté max ; Sim 2 : Base/Souveraineté+/Coût & DX+). Annoter « classement de tête robuste » (Sim 1) et « 2ᵉ place sensible » (Sim 2).

**Vue méta** (panneau distinct, l'écran le plus important pour les exécutifs) :

- **Bump chart inter-simulations** sur les rangs (section 2.4), Kong en orange. Texte d'accompagnement : *le gagnant dépend du cadrage*.
- **Encadré « Pourquoi les verdicts diffèrent »** : pondération, shortlist, rigueur méthodologique (section 1).
- **Avertissement de non-comparabilité** : Sim 3 = exercice léger, échelles non fusionnables.

**Panneau « Réserves & PoC »** (transversal, filtrable par candidat) : liste des points « à vérifier » (section 2.5), badge `--warning`.

Interactions : transitions douces (≤ 250 ms, désactivées si `prefers-reduced-motion`) ; aucune donnée hors section 2 ; aucune persistance navigateur (état en mémoire seulement).

---

## 5. Livrable B — Landing page exécutive

Page narrative défilante, lisible en ~3 minutes, imprimable/exportable PDF proprement.

1. **Hero** — fond `--bg`, titre H1 en `--orange-bright` : « Sélection d'une plateforme d'API Management ». Sous-titre `--text` : « Méta-analyse de trois évaluations indépendantes — juin 2026 ». Phrase-constat en exergue : « Trois cadrages, trois verdicts. » Bouton CTA orange → tableau de bord.
2. **Bandeau KPI** — mêmes 4 tuiles que la section 4.
3. **Le constat directeur** — 2–3 paragraphes : pourquoi trois gagnants ; le verdict est fonction du cadrage ; la constante Kong.
4. **Trois cadrages, trois verdicts** — 3 cartes (une par simulation) : outil, profil client, gagnant, score, et la *raison* du verdict (pondération/shortlist/méthodo). Mini-podium par carte.
5. **Les prétendants constants** — IBM (gagne souveraineté/FSI lourde), Gravitee (gagne open source/événementiel/TCO), Kong (jamais < 2ᵉ). Forces et la principale réserve de chacun.
6. **Ce qui fait basculer le verdict** — trois leviers de la section 1, en prose dense.
7. **Recommandation** — pour un profil FSI souveraineté-d'abord : shortlist crédible (IBM, Gravitee, Kong) ; départage par PoC sur les cas critiques (souveraineté/survivabilité, paiements temps réel, sécurité OWASP, audit immuable, IA/MCP avec masquage PII résident au Canada) ; lever les « à vérifier » et négocier des devis fermes.
8. **Avertissement d'intégrité** — reproduire `meta.avertissement`.
9. **Pied de page** — date, lien tableau de bord.

Ton : exécutif, factuel, sans jargon inutile, fr-CA. Pas de superlatif marketing.

---

## 6. Contraintes techniques

- **Pile** : tableau de bord en React mono-fichier (`.jsx`) avec **Recharts** pour les graphiques ; landing page en React ou HTML/CSS autonome. *Compromis* : Recharts couvre barres/radar/lignes sans dépendance lourde. *Alternative* : Chart.js si des annotations fines sont requises. *Condition qui renverse* : si tu cibles un export statique simple sans interactivité, HTML/CSS + SVG suffit pour la landing.
- **Aucune** API `localStorage`/`sessionStorage` ni stockage navigateur — état en mémoire (`useState`).
- **Aucun** appel réseau externe ; données = bloc JSON de la section 2.6 intégré en `const`.
- Responsive (mobile → desktop), `prefers-reduced-motion` respecté, contraste WCAG AA (section 3.3).
- Bilinguisme : **fr-CA par défaut** ; bascule FR/EN *souhaitable* (non bloquante).
- Landing imprimable : feuille `@media print` (fond clair, texte foncé, masquer la navigation).

---

## 7. Garde-fous d'intégrité et ton

- **Zéro fabrication** : uniquement les chiffres de la section 2. Pas de moyenne ni de « score consolidé » inter-simulations (échelles incomparables).
- Reproduire systématiquement : *organisation fictive · réponses simulées · prix indicatifs et non contractuels · éléments « à vérifier »*.
- Signaler explicitement l'asymétrie de Sim 3 (exercice plus léger).
- Registre : pair d'architecte senior ; concis ; pyramide inversée (constat d'abord) ; français canadien.

---

## 8. Critères d'acceptation (définition du « terminé »)

- [ ] Les deux livrables partagent les jetons de couleur et la typographie de la section 3.
- [ ] Tous les chiffres affichés correspondent exactement à la section 2 (vérifiable cellule par cellule).
- [ ] La vue méta affiche le bump chart des rangs et l'encadré « pourquoi les verdicts diffèrent ».
- [ ] L'analyse de sensibilité distingue « tête robuste » (Sim 1) et « 2ᵉ place sensible » (Sim 2).
- [ ] Corps de texte en `--text` ; orange réservé aux accents (sauf dérogation documentée section 3.3).
- [ ] Contraste AA vérifié ; navigation clavier ; aucun stockage navigateur.
- [ ] Avertissement d'intégrité présent sur les deux livrables.
- [ ] Landing imprimable proprement.

---

## 9. Amorce de structure (facultatif, pour démarrer)

```
/
├─ data.js              // export const DATA = { ...section 2.6 }
├─ Dashboard.jsx        // Livrable A : barre, KPI, panneaux, vue méta
├─ Landing.jsx          // Livrable B : hero → recommandation → avertissement
└─ theme.css            // jetons de la section 3.1 + utilitaires
```

```jsx
// theme — extrait
const C = {
  Kong:"#F97316", IBM:"#60A5FA", Gravitee:"#34D399",
  Apigee:"#FBBF24", MuleSoft:"#A78BFA", WSO2:"#FB7185", Azure:"#22D3EE"
};
// total attendu vérifiable : Σ (note/5 × poids) pour Sim 1/2 ; somme des points pour Sim 3.
```

---

*Fin du prompt. Respecter intégralement les sections 2 (données), 3 (design) et 7 (intégrité). En cas d'ambiguïté, privilégier la lisibilité exécutive et la fidélité aux chiffres.*
