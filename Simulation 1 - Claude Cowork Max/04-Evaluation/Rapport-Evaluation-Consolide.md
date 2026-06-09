# Rapport d'évaluation consolidé — RFP Gestion des API d'entreprise

**Document de référence :** RFP-APIM-2026-001
**Date :** 8 juin 2026
**Objet :** Évaluation comparative des cinq réponses RFP, notation /100 et recommandation
**Méthode :** Grille pondérée A1 (11 critères, échelle de maturité 0–5, note = Σ (note/5 × pondération))

---

## 1. Conclusion et recommandation

**Recommandation principale : retenir IBM API Connect (93,7/100) comme finaliste de tête, avec Kong Konnect (88,5/100) comme second finaliste obligatoire pour une épreuve comparative (PoC).** Pour le profil retenu — institution financière en déploiement hybride, forte pondération sécurité/conformité/souveraineté (42 %) — IBM API Connect offre l'adéquation la plus complète : héritage DataPower éprouvé dans 400+ institutions financières, la posture de conformité la plus large du panel (incluant *Protected B*, PIPEDA, IBM Cloud for Financial Services, FIPS 140-2 niveau 3 matériel), et une architecture hybride véritable jusqu'à l'appliance physique en DMZ et au fonctionnement air-gap.

Cette tête de classement s'accompagne d'un compromis assumé : **IBM est la solution la plus puissante mais aussi la plus complexe et la moins transparente sur le plan tarifaire** (dépendance OpenShift en auto-géré, licence CP4I en VPC, expérience développeur en rattrapage). C'est pourquoi la recommandation n'est pas mono-fournisseur : les positions 2 à 4 (Kong 88,5; Apigee 87,4; MuleSoft 86,1) forment un peloton resserré de 2,4 points, statistiquement une quasi-égalité au sens de la règle A1 (§4). Le départage doit se faire par PoC sur les cas d'usage P1 et par négociation commerciale.

**Conditions qui renverseraient la recommandation :**

- Si le GFB adopte une stratégie **« cloud-first/sans site »**, le poids de l'hybride et de la souveraineté chute; l'analyse de sensibilité (§5) resserre l'écart et favorise Kong ou Apigee pour leur agilité cloud-native et leur expérience développeur.
- Si l'**écosystème du GFB est déjà fortement Microsoft/Azure**, Azure APIM (82,9) remonte par effet d'intégration native (Entra ID, coûts d'intégration évités) malgré la contrainte du *self-hosted gateway* limité au palier Premium classique.
- Si l'**événementiel temps réel (Kafka)** devient le cas d'usage dominant, Kong (Event Gateway) et IBM (Event Endpoint Management) se détachent nettement d'Apigee.
- Si la **réduction du verrouillage fournisseur** est érigée en principe directeur, le cœur open source de Kong (Apache 2.0) constitue un argument différenciant.

---

## 2. Classement final

| Rang | Solution | Note /100 | Verdict synthétique |
|---:|---|---:|---|
| 1 | **IBM API Connect** | **93,7** | Adéquation FSI/hybride/conformité maximale; complexité et TCO à maîtriser |
| 2 | **Kong Konnect** | **88,5** | Meilleure architecture hybride et IA; lacunes conformité Canada à combler |
| 3 | **Google Apigee** | **87,4** | Leader en exécution et IA; événementiel faible; plan de contrôle hors site |
| 4 | **Salesforce MuleSoft** | **86,1** | Intégration + API + *Protected B* Canada; TCO élevé |
| 5 | **Microsoft Azure APIM** | **82,9** | Excellente intégration Azure; hybride contraint au Premium classique |

*Écart tête–dernier : 10,8 points. Écart positions 2–4 : 2,4 points (quasi-égalité, départage par PoC).*

---

## 3. Matrice comparative des scores (note /5 par critère)

| Critère (pondération) | Apigee | MuleSoft | Kong | IBM | Azure |
|---|:--:|:--:|:--:|:--:|:--:|
| C1 — Fonctionnel cœur (15 %) | 5,0 | 5,0 | 4,0 | 5,0 | 4,0 |
| C2 — Archi & hybride (15 %) | 4,5 | 4,5 | **5,0** | **5,0** | 3,5 |
| C3 — Sécurité (15 %) | 4,5 | 4,0 | 4,5 | **5,0** | 4,5 |
| C4 — Conformité & souveraineté (12 %) | 4,0 | 4,5 | 3,5 | **5,0** | 4,5 |
| C5 — Performance (8 %) | 4,5 | 4,0 | **5,0** | 4,5 | 4,0 |
| C6 — Observabilité (6 %) | 4,5 | 4,0 | 4,5 | 4,0 | 4,5 |
| C7 — Événementiel & GraphQL (6 %) | 3,0 | 4,5 | 4,5 | 4,5 | 4,0 |
| C8 — IA/LLM & agentique (7 %) | **5,0** | 4,0 | **5,0** | 4,5 | 4,5 |
| C9 — Exp. dév & gouvernance (6 %) | 4,0 | 4,5 | 4,5 | 4,0 | 4,0 |
| C10 — TCO & commercial (6 %) | 3,5 | 3,0 | 4,0 | 3,5 | 4,0 |
| C11 — Écosystème & pérennité (4 %) | 4,5 | 4,5 | 4,5 | **5,0** | 4,5 |
| **Note finale /100** | **87,4** | **86,1** | **88,5** | **93,7** | **82,9** |

*(Données brutes : `Matrice-Scores.csv`. Calculs vérifiés par programme.)*

---

## 4. Analyse par candidat

### 4.1 IBM API Connect — 93,7/100 — 1er

**Pourquoi en tête.** IBM rafle la note maximale (5/5) sur les quatre critères les plus lourds pour ce profil — fonctionnel cœur, architecture hybride, sécurité et conformité — soit 57 % de la pondération totale. Le raisonnement causal est direct : la passerelle DataPower est le composant de sécurité d'API le plus éprouvé en services financiers (400+ institutions, 80+ pays), disponible en appliance physique avec HSM FIPS 140-2 niveau 3, et le portefeuille de conformité d'IBM est le seul du panel à couvrir explicitement *Protected B*, PIPEDA, IBM Cloud for Financial Services et DORA. L'architecture hybride est authentique jusqu'au fonctionnement air-gap et au déploiement de passerelles distantes près des systèmes de référence. IBM est par ailleurs #1 dans 5 des 6 cas d'usage des *Critical Capabilities* de Gartner 2025.

**Réserves.** Complexité d'exploitation (quatre composants, dépendance Red Hat OpenShift pour l'auto-géré); licence CP4I en VPC et matériel DataPower facturé séparément — TCO difficile à modéliser (C10 = 3,5); expérience développeur historiquement en retrait malgré API Studio (déc. 2025). Le SaaS est hébergé sur AWS (régions Canada pour Reserved Instance à vérifier).

**Risque résiduel à lever en PoC :** complexité de mise en œuvre réelle et coût total sur 5 ans incluant OpenShift et DataPower.

### 4.2 Kong Konnect — 88,5/100 — 2e

**Forces.** Meilleure séparation plan de contrôle/plan de données du panel (C2 = 5,0), avec une option entièrement auto-gérée supportant l'air-gap; performance de référence (NGINX/LuaJIT, C5 = 5,0); passerelle IA/agentique la plus complète du marché (C8 = 5,0 : MCP Registry, Agent Gateway A2A, garde-fous Lakera/Bedrock, cache sémantique); cœur open source Apache 2.0 réduisant le verrouillage; Event Gateway Kafka natif.

**Réserves décisives pour un FSI canadien.** Absence de plan de contrôle Konnect au Canada (les plans de données peuvent résider au Canada, mais les métadonnées du plan de contrôle non) — point d'attention souveraineté direct (C4 = 3,5); FIPS 140-2 conforme mais **non validé NIST/CMVP**; certifications SOC 2/ISO 27001 revendiquées mais non confirmées en sources primaires publiques (à exiger); pas de WAF natif.

**Risque résiduel à lever en PoC :** obtention des attestations de conformité et traitement contractuel de la résidence des métadonnées du plan de contrôle.

### 4.3 Google Apigee — 87,4/100 — 3e

**Forces.** Leader Gartner positionné le plus haut en *Ability to Execute*; passerelle IA de pointe (C8 = 5,0 : LLMTokenQuota, Model Armor, cache sémantique Vertex, MCP); sécurité avancée par ML (Advanced API Security); hybride mature sur K8s multi-cloud; régions canadiennes (Montréal, Toronto).

**Réserves.** Support événementiel natif faible (C7 = 3,0 — pas de passerelle Kafka native, médiation via Pub/Sub/REST), pénalisant pour les cas d'usage paiements/anti-fraude du GFB; plan de contrôle toujours sur Google Cloud (air-gap véritable non supporté); l'hybride exige un abonnement (indisponible en paiement à l'usage); frais d'egress impactant le TCO (C10 = 3,5).

**Risque résiduel à lever en PoC :** adéquation aux flux événementiels et confirmation de la résidence canadienne (table DRZ Apigee).

### 4.4 Salesforce MuleSoft — 86,1/100 — 4e

**Forces.** Seule plateforme combinant intégration (iPaaS) et gestion d'API, atout pour la façade du cœur bancaire (CU-02); passerelle Omni/Flex (Envoy) auto-gérée avec mode Local quasi air-gap; **certification *Protected B* d'Hyperforce Canada (mars 2026)**, différenciateur de souveraineté (C4 = 4,5); GraphQL fédéré (DataGraph), Anypoint MQ, AI Gateway GA (mars 2026).

**Réserves.** TCO réputé le plus élevé du panel et tarification opaque (usage Flows + Messages) — C10 = 3,0, la note la plus basse de tous les candidats sur ce critère; runtime Mule plus lourd que les passerelles natives légères; statut FIPS 140-2 à vérifier.

**Note de sensibilité :** dans le scénario « souveraineté maximale » (§5), MuleSoft remonte quasi à égalité avec Apigee, grâce à l'avantage *Protected B*.

### 4.5 Microsoft Azure APIM — 82,9/100 — 5e

**Forces.** Intégration native inégalée pour un GFB déjà sous Azure (Entra ID, identités managées, Key Vault, Monitor, Defender); conformité Azure large (FedRAMP High, PCI-DSS); régions Canada Central/Est; passerelle GenAI complète (quotas de jetons, cache sémantique, Content Safety, MCP).

**Réserves structurantes.** Le *self-hosted gateway* — pivot du déploiement hybride — n'est disponible **qu'au palier Premium classique** (exclu des paliers v2), forçant un choix de palier contraignant (C2 = 3,5, la note la plus basse du panel sur l'architecture hybride); plan de contrôle exclusivement Azure (pas de souveraineté du plan de contrôle); air-gap permanent non supporté; nombreuses lacunes des *workspaces* (ni Defender, ni MCP, ni cache externe, ni *private endpoint*); le SHG n'émet pas nativement ses journaux de requêtes vers Azure Monitor.

**Lecture nuancée :** la 5ᵉ place reflète l'inadéquation relative au critère hybride *souverain*, non une faiblesse intrinsèque. Pour une organisation Azure-centrée acceptant le plan de contrôle infonuagique, Azure APIM resterait un choix de premier plan.

---

## 5. Analyse de sensibilité

Pour tester la robustesse du classement, trois jeux de pondérations ont été appliqués (calculs vérifiés par programme) :

| Solution | Base (RFP) | « Cloud-first » ¹ | « Souveraineté max » ² |
|---|:--:|:--:|:--:|
| IBM API Connect | **93,7** | **91,5** | **94,6** |
| Kong Konnect | 88,5 | 88,4 | 88,0 |
| Google Apigee | 87,4 | 86,5 | 87,2 |
| Salesforce MuleSoft | 86,1 | 84,9 | 87,0 |
| Microsoft Azure APIM | 82,9 | 83,0 | 82,7 |

¹ *Cloud-first* : C2 −5, C4 −4, C9 +5, C10 +4 (priorité agilité/coût plutôt que souveraineté).
² *Souveraineté max* : C4 +3, C2 +2, C8 −3, C10 −2 (priorité conformité/résidence).

**Lecture.** IBM demeure premier dans les trois scénarios; Kong demeure deuxième. Le classement de tête est robuste. Le seul mouvement notable concerne les positions 3–4 : en scénario souveraineté, MuleSoft (*Protected B*) rejoint quasiment Apigee. La décision de tête (IBM, sous réserve de PoC) ne dépend donc pas d'un réglage fin des pondérations.

---

## 6. Recommandations opérationnelles

1. **Présélectionner deux finalistes pour PoC** : IBM API Connect et Kong Konnect — deux archétypes opposés (suite régulée intégrée vs cloud-native open source) maximisant la valeur d'apprentissage de l'épreuve.
2. **Inclure conditionnellement Apigee** comme troisième finaliste si l'IA/LLM est jugée prioritaire à court terme.
3. **Critères de départage du PoC** : adéquation réelle aux cas d'usage P1 (CU-01, CU-02, CU-04, CU-05, CU-07), TCO sur 5 ans modélisé, et complexité opérationnelle mesurée (temps de mise en production d'une API de référence).
4. **Lever les points « à vérifier »** par fournisseur avant décision finale : résidence canadienne (Apigee DRZ, IBM Reserved Instance, Kong métadonnées CP), attestations de conformité (Kong SOC 2/ISO), statut FIPS (MuleSoft, Kong), périmètre d'audit APIM (Azure).
5. **Négocier la transparence tarifaire** : exiger des devis fermes incluant tous les modules (sécurité avancée, IA, matériel, egress) et des plafonds contractuels.

---

## Sources

Les sources factuelles par fournisseur sont consolidées dans chaque réponse RFP (`03-Reponses-Candidats/`) et dans l'analyse de marché (`02-Analyse-Marche/`). Références transversales :

- Gartner — « Magic Quadrant for API Management » — 7 octobre 2025 — https://www.gartner.com/en/documents/7020998
- IBM — « Critical Capabilities / Leader 2025 » — oct. 2025 — https://www.ibm.com/new/announcements/ibm-named-a-leader-in-the-2025-gartner-magic-quadrant-for-api-management
- Kong — « Gartner MQ 2025 Leader » — 10 oct. 2025 — https://konghq.com/blog/news/gartner-magic-quadrant-lifecycle-api-management-leader
- Méthode et données de notation : `../01-RFP/A1-Grille-Evaluation-Ponderee.md`, `Matrice-Scores.csv`
