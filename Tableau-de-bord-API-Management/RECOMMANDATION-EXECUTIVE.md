# Recommandation exécutive — Plateforme d'API Management
### Profil « institution financière (FSI) canadienne, souveraineté d'abord » · juin 2026

> Méta-analyse de trois évaluations indépendantes (GFB · BBQ · Gemini). Document décisionnel pour comité d'investissement. À lire avec le [tableau de bord](dashboard.html) et la [page de présentation](index.html).

---

## 1. Verdict

**Candidat recommandé : Kong** — comme **tête de file d'une preuve de concept (PoC) à deux finalistes**, IBM API Connect étant le challenger désigné. La recommandation est **conditionnelle** : elle ne tient que si le PoC valide la **résidence canadienne du plan de contrôle** (option Kong *self-managed*), la **conformité** (FIPS 140-2 validé CMVP, SOC 2 / ISO 27001 en source primaire) et la **couverture WAF**.

Kong est le **seul candidat jamais classé sous la 2ᵉ place** sur les trois cadrages observés (2ᵉ · 2ᵉ · 1ᵉʳ) : c'est le **choix de moindre regret** avant départage. Ce n'est **pas** un verdict de souveraineté *prouvée* — sur ce critère précis, Kong est le plus faible mesuré — mais un verdict de **robustesse inter-cadrages** dont le talon d'Achille souverain est nommément **mitigeable** et doit être tranché en PoC.

> **Il n'existe pas de « meilleur » absolu.** Les trois simulations désignent trois gagnants (IBM, Gravitee, Kong) parce que le verdict est fonction du cadrage. La question « le meilleur candidat » n'a de réponse qu'au regard d'un profil et d'un budget de PoC donnés — ce que ce document fixe explicitement.

---

## 2. Pourquoi Kong

| Argument | Preuve (chiffres exacts, sans fusion d'échelles) |
|---|---|
| **Meilleur plancher de rang** (croisement permis = rangs uniquement) | Kong 2ᵉ (Sim 1, 88,5) · 2ᵉ (Sim 2, 73,0) · 1ᵉʳ (Sim 3, 94). Pire rang = 2ᵉ. IBM (1ᵉʳ/4ᵉ/—) et Gravitee (—/1ᵉʳ/—) ne gagnent que sous leur propre cadrage. |
| **Stabilité aux sensibilités** | Sim 1 : 88,5 / 88,4 / 88,0. Sim 2 : 73,0 / 72,7 / 72,0. Seule fragilité : sa 2ᵉ place Sim 2 cède à WSO2 sous *Coût & DX+* (WSO2 72,8 > Kong 72,0). |
| **Valeur moderne** (axes récompensés par les 3 cadrages) | Sim 1 C2 Architecture & hybride (poids 15) : Kong **5**, à égalité avec IBM. Sim 1 C8 IA/LLM & agentique : Kong **5**, à égalité de tête avec Apigee. Sim 3 (architecture + IA ≈ 50 %, points absolus, *non comparables aux /5*) : Kong **94** > Apigee 85 > MuleSoft 72. |
| **Nature du risque résiduel** | Les réserves Kong sont **vérifiables en diligence/PoC** (région Konnect Canada, FIPS/CMVP, SOC 2/ISO, WAF, tarif par requête), avec une **mitigation architecturale déjà nommée** (licence Enterprise *self-managed*). Aucune n'est un écart structurel par conception. |

### Tension centrale — assumée, non masquée

Sur le **cas critique du profil — Conformité & souveraineté — ce n'est pas Kong qui mène, c'est IBM** :

- Sim 1 C4 (poids 12) : **IBM 5** vs **Kong 3,5** (le plus bas du panel).
- Sim 2 C2 (poids 13, le plus lourd) : **IBM 4** vs **Kong 3**.
- Sous le sous-scénario **« Souveraineté max » de Sim 1 — exactement le cadrage du client — IBM passe 1ᵉʳ à 94,6 et Kong tombe à 88,0.**

Recommander Kong, c'est donc **parier** que son déficit de souveraineté se comble en *self-managed* plus sûrement que les réserves opérationnelles d'IBM (OpenShift, sur-licenciement CP4I > 50 %, résidence Canada à confirmer) ne se surmontent. **Ce pari ne se gagne qu'en PoC** — d'où la recommandation conditionnelle plutôt qu'un sacre sur dossier.

---

## 3. Finalistes et écartés

### Finalistes
- **IBM API Connect — challenger « souveraineté prouvée ».** Meilleur scoreur souveraineté *mesuré* (C4 = 5 ; C2 = 4), meilleure sécurité (Sim 1 C3 poids 15 : IBM 5), **1ᵉʳ robuste sous les trois sous-scénarios de Sim 1** (93,7 / 91,5 / 94,6). Reste finaliste précisément parce qu'il **domine le cas critique du profil**. Freins : plancher de rang réel (4ᵉ en Sim 2) et réserves commerciales/opérationnelles lourdes.
- **Gravitee — outsider « souveraineté par architecture ».** Seul gagnant du cadrage *souveraineté d'abord* (Sim 2, 1ᵉʳ à 75,4, robuste), meilleur TCO/écosystème (Sim 2 C11 : Gravitee 4) et événementiel (C8 = 5). Mais **un seul cadrage observé** et — décisif pour un FSI — **les réserves de certification les plus lourdes** (SOC 2 Type II / PCI-DSS / Protected B non confirmés ; éditeur intermédiaire, diligence B-10). À diligenter avant toute mise en shortlist ferme, pas en tête de file.

### Écartés (motifs structurels)
- **Apigee** — *écart majeur* : plan de contrôle **non installable on-prem/souverain**, survivabilité hors-ligne partielle. Incompatible par conception avec l'air-gap / la résidence Canada du plan de contrôle. Confirmé par son plancher (5ᵉ en Sim 2, 61,6 ; C2 = 2, le plus bas).
- **Azure APIM** — plan de contrôle **exclusivement Azure**, pas d'air-gap permanent, *self-hosted gateway* limité au Premium classique. Souveraineté impossible par conception (5ᵉ en Sim 1, 82,9 ; absent ailleurs).
- **MuleSoft** — pas d'écart structurel de souveraineté, mais TCO élevé / tarification opaque et surcharge JVM ; rangs sans relief (4ᵉ/—/3ᵉ). Écarté sur la **soutenabilité commerciale**, pas la capacité.
- **WSO2** — masquage PII via tiers **possiblement hors Canada** (touche directement le cas critique IA/MCP), certifications **portées par l'exploitant** en auto-hébergé, forte exigence de maturité d'ingénierie interne. Écarté sauf maturité interne avérée.

---

## 4. Départage par PoC — critères de sortie go/no-go

Sur les cinq cas critiques du profil. **Un « no-go » sur la souveraineté est éliminatoire.** Faire de la souveraineté résidente Canada + FIPS/SOC 2 + WAF + air-gap les critères de sortie **neutralise l'avantage de rang de Kong et teste en parallèle la capacité réelle d'IBM.**

| Cas critique | Test PoC | No-go si… |
|---|---|---|
| **Souveraineté & survivabilité hors-ligne** | Plan de contrôle résident au Canada démontré (Kong : *self-managed*) ; opération en air-gap réel sans dépendance SaaS externe | …le plan de contrôle ne peut résider/survivre au Canada hors-ligne |
| **Conformité certifiée** | FIPS 140-2 validé CMVP ; SOC 2 Type II / ISO 27001 en source primaire ; PCI-DSS / Protected B le cas échéant | …non démontrable en source primaire |
| **Sécurité OWASP** | Couverture WAF (native ou intégration validée) ; protections OWASP API | …pas de couverture WAF démontrable |
| **Paiements temps réel & événementiel** | Débit / latence sous charge ; support événementiel natif | …SLA temps réel non tenu |
| **Audit immuable & IA/MCP** | Journal d'audit immuable ; masquage PII résident au Canada dans le flux IA/MCP | …la PII sort du Canada |

---

## 5. Conditions qui renversent le verdict

- **Bascule vers IBM** si : (a) la souveraineté résidente Canada est érigée en **contrainte dure non négociable** *et* la maturité opérationnelle interne (OpenShift, gestion CP4I) est jugée suffisante ; et/ou (b) **Kong échoue** au go/no-go souveraineté (région Konnect non résidente + *self-managed* non probant) ou sécurité (pas de WAF). Sous « Souveraineté max » mesuré, IBM est déjà 1ᵉʳ (94,6).
- **Bascule vers Gravitee** si : le cadrage *souveraineté d'abord* prime **et** la diligence B-10 **lève** les réserves de certification (SOC 2 Type II, PCI-DSS, Protected B, région cloud souveraine, pérennité éditeur). Tant que ces points restent non confirmés, Gravitee ne peut être tête de file FSI.
- **Bascule défensive vers WSO2** : uniquement si le cadrage **Coût & DX** prime *et* la maturité d'ingénierie interne est avérée (WSO2 72,8 > Kong 72,0 sous *Coût & DX+*).

---

## 6. Réserves à lever en source primaire (par finaliste)

- **Kong (recommandé)** : région du plan de contrôle Konnect SaaS au Canada (+ validation de la mitigation *self-managed*) ; FIPS 140-2 validé CMVP ; SOC 2 / ISO 27001 ; absence de WAF natif (stratégie d'intégration) ; prévisibilité tarifaire de la composante par requête (négociation licence Enterprise).
- **IBM API Connect** : exploitation OpenShift ; TCO / sur-licenciement CP4I (> 50 % observé) ; convergence API Connect/webMethods récente ; région Reserved Instance Canada ; maturité IA/MCP en production. *(Réserves commerciales/opérationnelles — pas de déficit de capacité souveraineté.)*
- **Gravitee** : SOC 2 Type II / PCI-DSS / Protected B ; région cloud souveraine canadienne ; BYOK/HYOK & audit immuable (propriétés d'architecture, non certifiées) ; pérennité et support localisé Canada (diligence B-10).

---

## 7. Avertissement d'intégrité

- Organisation cible **fictive** ; réponses des candidats **simulées** à partir de capacités produit publiques vérifiées (juin 2026) ; tout prix évoqué est **indicatif et non contractuel**.
- **Aucune moyenne, somme ni « score consolidé » entre simulations** : les échelles sont incomparables (Sim 1/2 = notes /5 converties /100 ; Sim 3 = points absolus). Le seul croisement inter-simulations utilisé ici est **ordinal (rangs)**.
- **Sim 3 = exercice plus léger** (3 candidats, 5 critères, architecture + IA ≈ 50 %), explicitement **non comparable** aux Sim 1/2 ; ses points ne sont jamais mêlés aux notes /5.
- Toutes les forces départageantes reposent sur des réserves **« à vérifier »**, non sur des faits acquis — elles se tranchent en **PoC**, pas sur dossier.

---

### Méthode & garde-fous

Recommandation produite par **panel d'analyses indépendantes** (5 lentilles : robustesse inter-cadrages, adéquation souveraineté, risque & diligence, valeur moderne, TCO) **+ vérification adverse** (réfutation du leader, critique de la prémisse, audit d'intégrité). Décompte : **Kong 4 lentilles / 5**, IBM 1 (souveraineté). Les trois agents adverses ont conclu « fragile » — d'où le caractère **conditionnel** et PoC-dépendant de la recommandation, et le maintien d'IBM comme finalist.

> **Note d'audit.** Une preuve invoquée en cours d'analyse — « Sim 1 C10 (TCO & commercial) : Kong 4,0 · IBM 3,5 · … » — était **introuvable dans le jeu de données figé** (aucun critère C10 ni ces valeurs) ; elle a été **écartée**, ainsi que le corollaire « MuleSoft = note la plus basse Sim 1 ». L'analyse TCO ne s'appuie donc, ici, que sur les données vérifiables (Sim 2 C11) et les réserves nommées. Cet incident illustre l'intérêt de l'audit d'intégrité : aucune donnée hors source de vérité ne subsiste dans ce document.
