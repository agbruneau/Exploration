# Méthodologie de notation — Évaluation des soumissions

**Note méthodologique du comité d'évaluation**

| Champ | Valeur |
|---|---|
| Organisation cliente | Banque Boréale du Québec (BBQ) — *organisation fictive* |
| Dossier de référence | RFP-BBQ-APIM-2026 |
| Objet de la note | Méthodologie de présélection, de notation, de pondération et de calibrage des soumissions |
| Périmètre | Plateforme d'API Management d'entreprise en déploiement hybride strict |
| Candidats évalués (simulés) | Kong, IBM, Google Cloud (Apigee), Gravitee, WSO2 |
| Date | Juin 2026 *(indicative)* |
| Statut | Note méthodologique — encadre l'évaluation produite dans `04-Evaluation/` |
| Langue | Français |

---

## Avis d'intégrité et cadre de simulation

> **À lire avant toute exploitation de ce document.**
>
> - L'organisation cliente **Banque Boréale du Québec (BBQ)** est **entièrement fictive**. Tout nom, chiffre, profil ou contexte la concernant est construit à des fins de simulation et ne désigne aucune institution réelle.
> - Les **réponses fournisseurs** notées selon cette méthodologie sont **simulées**, reconstituées à partir de **capacités produit publiques et vérifiées en date de juin 2026** (documentation éditeur, communiqués, analyses sectorielles). Elles n'engagent aucun éditeur et ne constituent pas de déclaration officielle.
> - Les éléments de **prix, de TCO et de licence** mobilisés par le critère C11 sont **indicatifs et non contractuels**. Ils servent uniquement à la comparaison méthodologique et reposent sur des hypothèses explicitées dans chaque réponse.
> - Le **Magic Quadrant Gartner 2025 pour l'API Management** est utilisé ici comme **filtre de présélection cité de seconde main** : le rapport intégral **n'a pas été consulté directement** par le comité (voir §8, Limites). La liste des Leaders retenue est à confirmer sur la source primaire.
> - Tout élément incertain, prospectif ou postérieur à l'horizon de connaissance retenu est explicitement marqué **« à vérifier »**. Les soumissionnaires doivent confirmer ou infirmer ces éléments, preuves à l'appui.
> - Cette note ne crée **aucune obligation juridique**. Elle décrit une **trame méthodologique reproductible**, non un verdict contractuel.

---

## Table des matières

1. [Présélection : Leaders Gartner 2025 puis filtre d'adéquation FSI hybride](#1-présélection)
2. [Échelle de maturité 0–5](#2-échelle-de-maturité-05)
3. [Pondération et sa justification (premiers principes FSI)](#3-pondération-et-sa-justification)
4. [Formule de calcul de la note finale](#4-formule-de-calcul-de-la-note-finale)
5. [Calibrage inter-candidats par le président du comité](#5-calibrage-inter-candidats)
6. [Analyse de sensibilité](#6-analyse-de-sensibilité)
7. [Synthèse du procédé](#7-synthèse-du-procédé)
8. [Limites de la méthodologie](#8-limites-de-la-méthodologie)

---

## 1. Présélection

La présélection réduit l'univers des fournisseurs en **deux passes successives** avant toute notation détaillée. L'objectif est d'éviter de noter finement des plateformes structurellement inadéquates et de concentrer l'effort d'analyse sur un nombre restreint de candidats crédibles.

### 1.1 Première passe — restriction aux Leaders du Magic Quadrant Gartner 2025

Seuls les éditeurs positionnés comme **Leaders** dans le *Magic Quadrant Gartner 2025 pour l'API Management* franchissent la première passe. Ce filtre tient lieu de **garantie minimale de viabilité** : un Leader Gartner combine, par construction du quadrant, une **complétude de vision** et une **capacité d'exécution** élevées, ce qui réduit le risque de pérennité de l'éditeur (critère sous-jacent au C11) et le risque d'écosystème immature.

- **Nature du filtre :** binaire (Leader / non-Leader). Aucune nuance de notation n'intervient à ce stade.
- **Justification du choix :** pour une institution financière (FSI), le **risque fournisseur** prime à l'entrée. Écarter d'emblée les Challengers, Visionnaires et Niche Players évite de bâtir une infrastructure critique réglementée sur un socle à la trajectoire incertaine.
- **Réserve d'intégrité :** la liste des Leaders 2025 retenue par le comité provient de mentions de **seconde main** (analyses sectorielles, communiqués). Le **rapport Gartner intégral n'a pas été consulté directement**. Le positionnement exact de chaque éditeur est donc marqué **« à vérifier »** sur la source primaire avant toute décision réelle. Si un éditeur jugé pertinent n'était finalement pas Leader, ou inversement, la liste de présélection devrait être révisée.

### 1.2 Seconde passe — filtre d'adéquation au profil FSI hybride

Parmi les Leaders, le comité applique un **filtre d'adéquation** (fit/no-fit) au profil spécifique de BBQ. Ce filtre est **éliminatoire** et porte sur des contraintes non négociables (« killer requirements ») :

| Contrainte d'adéquation | Justification FSI hybride |
|---|---|
| **Déploiement hybride strict** : plan de contrôle souverain/on-prem et plans de données multi-environnements | Cœur du besoin ; un produit purement SaaS sans gateway auto-hébergeable est éliminé. |
| **Résidence des données au Canada** et garanties contre l'accès extraterritorial | Exigence réglementaire BSIF / Loi 25 ; sans option crédible, no-fit. |
| **Survivabilité du plan de données en mode déconnecté** du plan de contrôle | Continuité d'activité bancaire ; une dépendance permanente au control plane distant est rédhibitoire. |
| **Maturité sécurité de niveau bancaire** (mTLS, FAPI, OAuth2/OIDC, gestion des secrets) | Socle minimal d'exposition d'API financières. |

Un Leader Gartner qui échoue sur l'une de ces contraintes est **écarté de la notation détaillée**, même si sa note pondérée potentielle serait élevée : la méthodologie refuse de compenser une contrainte FSI non négociable par l'excellence sur d'autres critères. Les éditeurs ayant franchi les deux passes constituent la **liste courte** notée aux sections suivantes (dans le présent exercice : Kong, IBM, Apigee, Gravitee, WSO2 — *adéquation par candidat à confirmer dans chaque fiche d'évaluation*).

---

## 2. Échelle de maturité 0–5

Chaque critère est noté sur une **échelle de maturité ordinale unique, de 0 à 5**. La même échelle s'applique aux onze critères, ce qui garantit la comparabilité des notes avant pondération.

| Note | Niveau de maturité | Définition opérationnelle |
|---|---|---|
| **0** | Absent | Capacité inexistante ou non démontrée. Aucune réponse exploitable. |
| **1** | Embryonnaire | Capacité partielle, expérimentale ou sur feuille de route. Non utilisable en production FSI. |
| **2** | Basique | Capacité présente mais limitée, avec lacunes significatives pour un usage bancaire réglementé. |
| **3** | Conforme | Capacité standard du marché, couvrant l'exigence sans la dépasser. Acceptable mais sans marge. |
| **4** | Avancé | Capacité robuste, éprouvée en production, couvrant l'exigence avec marge et preuves. |
| **5** | Différenciant | Capacité de référence, démontrée à l'échelle, apportant un avantage net en contexte FSI hybride. |

**Règles d'attribution :**

- La note **3 = « conforme au marché »** sert d'ancre. Un produit qui « coche la case » sans se distinguer obtient 3, non 5.
- Une note **≥ 4 exige des preuves** (architecture documentée, certifications, références, résultats de tests). En l'absence de preuve, la note est plafonnée à 3 et l'écart marqué **« à vérifier »**.
- Une note **0 ou 1 sur un critère de thème `securite` ou `conformite`** déclenche une revue d'éligibilité (lien avec les contraintes éliminatoires du §1.2).
- L'échelle étant **ordinale**, l'écart entre 4 et 5 n'est pas présumé égal à l'écart entre 1 et 2 ; la pondération (§3) opère sur les notes normalisées, pas sur les rangs.

---

## 3. Pondération et sa justification

### 3.1 Tableau des poids

Les onze critères se répartissent **100 points** de pondération. Les poids reflètent l'importance relative de chaque critère **pour le profil FSI hybride de BBQ**, et non une importance générique « API Management ».

| Code | Critère | Thème | Poids |
|---|---|---|---:|
| C1 | Sécurité des API et protection contre les menaces | securite | 12 |
| C2 | Conformité réglementaire et souveraineté des données | conformite | 13 |
| C3 | Architecture hybride, portabilité et résilience | archi | 12 |
| C4 | Capacités fonctionnelles cœur de gestion des API | fonctionnel | 11 |
| C5 | Gouvernance du cycle de vie et catalogue d'entreprise | fonctionnel | 9 |
| C6 | Performance, scalabilité et faible latence | perf | 7 |
| C7 | Observabilité, monitoring et auditabilité opérationnelle | observabilite | 7 |
| C8 | Support de l'API événementielle et du streaming | event | 6 |
| C9 | Capacités IA, agentique et passerelle LLM | ia | 7 |
| C10 | Expérience développeur et portail self-service | dx | 8 |
| C11 | Coût total de possession, modèle de licence et écosystème | cout | 8 |
| | **Total** | | **100** |

### 3.2 Justification par premiers principes FSI

La pondération est dérivée de **trois premiers principes** propres à une institution financière sous régime hybride et souverain, et non d'une moyenne sectorielle :

1. **Le risque réglementaire et de souveraineté est non substituable.** Une non-conformité BSIF / Loi 25 ou une perte de résidence des données est un **risque existentiel** (sanction, retrait d'agrément, perte de confiance), là où une lacune fonctionnelle est un risque opérationnel contournable. D'où le **poids maximal à C2 (13)**, suivi du couple sécurité/architecture.

2. **L'architecture hybride et la sécurité conditionnent la faisabilité même du projet.** En déploiement hybride strict, la séparation control plane / data plane, la survivabilité déconnectée (C3, 12) et la maturité d'authentification/menaces (C1, 12) ne sont pas des « plus » : elles déterminent si la plateforme peut exister chez BBQ. Ces trois critères (**C1+C2+C3 = 37 points**, soit plus du tiers du total) forment le **socle de viabilité**.

3. **Le cœur de métier prime sur les capacités émergentes.** Les capacités fonctionnelles de gestion et de gouvernance du cycle de vie (**C4+C5 = 20 points**) pèsent davantage que les domaines émergents ou différenciants (C8 événementiel 6, C9 IA/LLM 7), parce que la valeur immédiate pour BBQ réside dans l'exposition gouvernée d'API existantes, mainframe et legacy compris. Les capacités IA et événementielles sont valorisées (au total 13 points) mais ne doivent pas écraser le socle.

Les critères de second rang — performance (C6, 7), observabilité (C7, 7), expérience développeur (C10, 8), coût et écosystème (C11, 8) — reçoivent des poids modérés mais non négligeables : ils départagent des candidats par ailleurs conformes sur le socle. Le **coût (C11) est délibérément plafonné à 8** : en contexte FSI, il départage à conformité égale mais ne doit jamais compenser une faiblesse de conformité ou de sécurité.

> **Note d'intégrité.** La répartition exacte des 100 points relève d'un **jugement de comité** propre à cet exercice simulé. Une institution réelle l'ajusterait à ses propres contraintes ; les poids sont donc **paramétrables** et leur sensibilité est testée au §6.

---

## 4. Formule de calcul de la note finale

### 4.1 Définition

La note finale d'un candidat est la **somme, sur les onze critères, de la note normalisée multipliée par le poids du critère** :

```
Note_finale = Σ ( (note_i / 5) × poids_i )      pour i = C1 … C11
avec        Σ poids_i = 100
```

- `note_i` ∈ {0,1,2,3,4,5} est la note de maturité du critère i (§2).
- `note_i / 5` **normalise** la note sur l'intervalle [0 ; 1].
- `poids_i` est le poids du critère i (§3), la somme des poids valant exactement **100**.
- La note finale s'exprime donc **sur 100**, directement lisible comme un pourcentage d'atteinte de l'idéal pondéré.

### 4.2 Propriétés

- **Borne supérieure :** un candidat notant 5 partout obtient `Σ (5/5 × poids_i) = Σ poids_i = 100`.
- **Borne inférieure :** un candidat notant 0 partout obtient 0.
- **Lisibilité :** la note finale étant sur 100, l'écart entre deux candidats se lit en points directement comparables aux poids.

### 4.3 Calcul par programme (non manuel)

Le calcul est effectué **par programme**, et non à la main, pour trois raisons : reproductibilité, traçabilité de l'audit, et exécution immédiate des analyses de sensibilité (§6). Un calcul de référence minimal :

```python
# criteres : liste de dicts {code, poids}  (poids sommant à 100)
# notes    : dict {code: note}  avec note dans 0..5

def note_finale(criteres, notes):
    total = 0.0
    for c in criteres:
        n = notes[c["code"]]
        assert 0 <= n <= 5, f"note hors echelle pour {c['code']}"
        total += (n / 5) * c["poids"]
    return round(total, 2)   # note sur 100

assert sum(c["poids"] for c in criteres) == 100, "les poids doivent sommer a 100"
```

Le même script produit, pour chaque candidat, la note finale **et** la contribution de chaque critère (`(note_i/5) × poids_i`), ce qui alimente les tableaux de l'évaluation et l'analyse de sensibilité. Les jeux de notes par candidat sont conservés dans `04-Evaluation/` pour rejouabilité.

---

## 5. Calibrage inter-candidats

La note brute d'un évaluateur isolé souffre de deux biais : la **dérive d'échelle** (un évaluateur indulgent met systématiquement plus haut) et l'**incohérence inter-critères** (la même preuve vaut 4 chez un candidat et 3 chez un autre). Le **président du comité** procède donc à un **calibrage inter-candidats** après la notation initiale et avant la note finale.

**Procédé :**

1. **Lecture transversale par critère.** Pour chaque critère, le président aligne les cinq candidats côte à côte et vérifie que la **même note traduit le même niveau de preuve** d'un candidat à l'autre. Une note 4 doit reposer sur des preuves d'ampleur comparable partout.
2. **Résolution des écarts.** Lorsqu'un même fait justifierait des notes différentes, le président **harmonise** ou **documente la raison de l'écart** (ex. preuve plus solide chez l'un). La correction est tracée.
3. **Ancrage sur la note 3.** Le président revérifie que « conforme au marché » = 3 est appliqué uniformément, pour éviter l'inflation des notes.
4. **Arbitrage des « à vérifier ».** Les points marqués « à vérifier » sont traités de façon **identique pour tous** : plafonnement à 3 tant que la preuve manque, afin de ne pas avantager un candidat plus disert mais non prouvé.
5. **Validation finale.** Le président valide le jeu de notes calibré, qui devient l'entrée du calcul du §4. Toute modification post-calibrage est journalisée.

Le calibrage **ne réécrit pas les poids** (fixés au §3) : il n'agit que sur la **cohérence des notes de maturité** entre candidats. Il garantit que la comparaison finale mesure des différences réelles de capacité, non des différences de sévérité d'évaluateur.

---

## 6. Analyse de sensibilité

Une note finale n'a de valeur décisionnelle que si l'on connaît sa **robustesse** aux hypothèses de pondération et de notation. Le comité conduit une **analyse de sensibilité** sur le classement, pas seulement sur les notes.

**Volets de l'analyse :**

1. **Sensibilité aux poids.** Chaque poids critique est augmenté puis diminué (ex. ±25 % et ±50 %, renormalisé à 100), et l'on observe si le **classement** change. Un classement qui résiste à de fortes variations de poids est **robuste** ; un classement qui s'inverse sous une petite variation est **fragile** et doit être signalé au décideur.
2. **Scénarios de priorité.** Le comité rejoue le classement sous des **scénarios de pondération alternatifs** explicites — par exemple : « priorité souveraineté » (C2/C3 renforcés), « priorité time-to-value développeur » (C10/C5 renforcés), « priorité coût » (C11 renforcé). Si un candidat domine sous tous les scénarios FSI raisonnables, la recommandation est solide.
3. **Sensibilité aux notes incertaines.** Les critères comportant le plus de mentions « à vérifier » sont testés en **borne basse / borne haute** (la note passe du plafond prudent à la note revendiquée). On mesure l'impact sur le classement : cela identifie **quelles vérifications sont décisionnelles** et doivent être priorisées lors de la due diligence.
4. **Marge de départage.** L'écart de note finale entre candidats successifs est comparé à l'amplitude des variations ci-dessus. Un écart inférieur à la sensibilité typique signifie que les candidats sont **statistiquement indistincts** et qu'aucune préférence ne doit être affirmée sur la seule note.

L'analyse de sensibilité étant rejouée par le même script que le §4, elle est **reproductible** et livrée avec l'évaluation. Sa conclusion attendue n'est pas « le candidat X gagne », mais « le classement est robuste / fragile, et voici les hypothèses qui le font basculer ».

---

## 7. Synthèse du procédé

```
Univers fournisseurs
   │  Passe 1 — filtre binaire : Leader Gartner 2025 ?            (§1.1, à vérifier)
   ▼
Leaders
   │  Passe 2 — filtre éliminatoire d'adéquation FSI hybride      (§1.2)
   ▼
Liste courte (Kong, IBM, Apigee, Gravitee, WSO2)
   │  Notation 0–5 par critère, preuves exigées pour ≥4           (§2)
   │  Calibrage inter-candidats par le président                 (§5)
   ▼
Notes calibrées
   │  Note_finale = Σ (note_i/5 × poids_i), Σ poids = 100, /100   (§4, par programme)
   ▼
Classement
   │  Analyse de sensibilité (poids, scénarios, incertitudes)     (§6)
   ▼
Recommandation assortie de sa robustesse
```

---

## 8. Limites de la méthodologie

Les limites suivantes sont rappelées explicitement et conditionnent toute lecture des résultats :

1. **Réponses simulées.** Les soumissions notées sont **reconstituées** à partir de capacités produit publiques (juin 2026), non remises par les éditeurs dans le cadre d'un appel d'offres réel. Elles peuvent sous-représenter ou sur-représenter une capacité selon la qualité de la documentation publique disponible.
2. **Prix indicatifs.** Les éléments mobilisés par le C11 (TCO, licence) sont **indicatifs et non contractuels**, fondés sur des hypothèses de volumétrie et de déploiement propres à l'exercice. Aucun devis réel n'a été obtenu ; les ordres de grandeur sont **à vérifier** auprès des éditeurs.
3. **Rapport Gartner non consulté directement.** Le filtre de présélection (§1.1) s'appuie sur le *Magic Quadrant Gartner 2025* tel que **cité de seconde main**. Le **rapport intégral n'a pas été consulté** par le comité. Le statut « Leader » de chaque éditeur, et donc la composition même de la liste courte, sont **à vérifier** sur la source primaire.
4. **Points « à vérifier ».** Tout élément incertain, prospectif ou postérieur à l'horizon de connaissance (juin 2026) est marqué **« à vérifier »** et **plafonné à la note 3** tant que la preuve manque. Les éléments les plus sensibles — résidence des données au Canada, certifications applicables au périmètre exact, garanties anti-extraterritorialité, disponibilité de régions souveraines — doivent être confirmés formellement avec preuves avant toute décision.
5. **Subjectivité résiduelle des poids et des notes.** Malgré le calibrage (§5), la pondération (§3) et l'attribution des notes de maturité relèvent d'un **jugement de comité**. L'analyse de sensibilité (§6) borne cette subjectivité mais ne l'élimine pas.
6. **Absence de valeur contractuelle.** Cette note et l'évaluation qui en découle constituent une **trame méthodologique de comparaison**. Elles ne créent aucune obligation et ne sauraient se substituer à une due diligence formelle (preuves de concept, audits de sécurité, vérification juridique de la souveraineté).

---

*Note méthodologique du dossier RFP-BBQ-APIM-2026 — organisation fictive, réponses simulées, prix indicatifs. Tout élément marqué « à vérifier » doit être confirmé sur source primaire avant exploitation réelle.*
