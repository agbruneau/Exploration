# ANNEXE A3 — MODALITÉS DE RÉPONSE

**Appel d'offres : Plateforme de gestion d'API d'entreprise (API Management)**
**Organisme acquéreur : Banque Boréale du Québec (BBQ)**
**Référence du dossier : RFP-BBQ-APIM-2026**
**Version : 1.0 — juin 2026**
**Classification : Confidentiel — diffusion restreinte aux soumissionnaires inscrits**

---

## CADRE D'INTÉGRITÉ ET AVERTISSEMENT (à lire en premier)

Le présent document s'inscrit dans un exercice de simulation. Les mentions ci-dessous priment sur toute autre interprétation et doivent être conservées dans toute reproduction de l'annexe.

- **Organisation cliente fictive.** La « Banque Boréale du Québec (BBQ) » est une institution **fictive**. Elle est construite à des fins méthodologiques pour illustrer les exigences typiques d'une grande institution financière fédérale canadienne exerçant aussi des activités d'assurance. Toute ressemblance avec une institution réelle serait fortuite.
- **Réponses fournisseurs simulées.** Les réponses attendues et toute caractérisation de produit éventuellement citée sont **simulées à partir de capacités produit publiques** (documentation éditeur, communiqués, analyses sectorielles) **vérifiées à la date de juin 2026**. Elles ne constituent pas des réponses formelles des éditeurs et n'engagent pas ces derniers.
- **Prix indicatifs et non contractuels.** Toute donnée tarifaire produite dans le cadre de cet appel d'offres est **indicative**, fournie à titre d'estimation méthodologique, et **n'a aucune valeur contractuelle**.
- **Mention « à vérifier ».** Tout élément incertain, dépendant d'une source non confirmée ou postérieur à l'horizon de connaissance (juin 2026) est marqué **« à vérifier »**. Le soumissionnaire est tenu d'appliquer la même rigueur dans sa réponse.

> En cas de contradiction entre le présent avertissement et le corps du document, l'avertissement prévaut.

---

## 1. OBJET ET PORTÉE DE L'ANNEXE A3

L'annexe A3 définit **les règles de forme et de fond** que tout soumissionnaire doit respecter pour produire une réponse **recevable, comparable et évaluable**. Elle précise :

1. les **critères d'admissibilité** des soumissionnaires (section 2) ;
2. la **structure imposée** de la réponse, alignée sur les familles d'exigences **EF / EA / ES / EC / EN** et sur les cas d'usage (section 3) ;
3. le **format des preuves** : architecture de référence, références clients FSI, démonstrations / PoC (section 4) ;
4. les **exigences de tarification** : modèle de prix, hypothèses, TCO 3 ans — indicatif (section 5) ;
5. le **calendrier de soumission** (section 6) ;
6. les **règles de communication et de confidentialité** (section 7) ;
7. le **barème de recevabilité** et la procédure de rejet (section 8).

L'annexe A3 est **complémentaire** des autres pièces du dossier (cahier des exigences EF/EA/ES/EC/EN, grille d'évaluation, modèle de contrat). En cas de divergence sur le **fond** des exigences, le cahier des exigences prévaut ; sur la **forme** de la réponse, l'annexe A3 prévaut.

---

## 2. CRITÈRES D'ADMISSIBILITÉ DES SOUMISSIONNAIRES

L'admissibilité est une **condition préalable éliminatoire**. Un soumissionnaire qui ne satisfait pas à **l'ensemble** des critères obligatoires (CA) est déclaré **non admissible** et sa réponse n'est pas évaluée au fond. Les critères souhaités (CS) ne sont pas éliminatoires mais sont valorisés.

### 2.1 Critères d'admissibilité obligatoires (CA — éliminatoires)

| Réf. | Critère | Preuve attendue |
|------|---------|-----------------|
| **CA-1** | **Personnalité juridique et capacité de contracter** au Canada (entité ou mandataire dûment habilité à signer et facturer en dollars canadiens). | Extrait d'immatriculation / certificat de constitution ; nom du signataire autorisé. |
| **CA-2** | **Éditeur de la plateforme ou intégrateur certifié** disposant d'un mandat écrit de l'éditeur pour proposer, déployer et soutenir le produit au périmètre demandé. | Lettre de l'éditeur ou statut de partenaire certifié (à vérifier auprès de l'éditeur). |
| **CA-3** | **Solution disponible en mode hybride strict** : plan de contrôle déployable en cloud souverain canadien (régions Canada Central/Est) **ou** on-prem, et plans de données (gateways) déployables sur infrastructure privée au Canada. | Déclaration de conformité + schéma de déploiement (voir §4.1). |
| **CA-4** | **Résidence des données au Canada** garantie pour les charges réglementées et **gestion des clés par le client (BYOK/HYOK)** prise en charge. | Attestation de résidence + description du modèle de gestion des clés. |
| **CA-5** | **Attestations de sécurité en vigueur** : **SOC 2 Type II** pour les composantes opérées par le fournisseur et conformité **PCI-DSS v4.0** applicable au périmètre des données de cartes. | Rapports/attestations en cours de validité (sous NDA si nécessaire). |
| **CA-6** | **Capacité de support 24×7** en français et en anglais, avec présence ou couverture de service au Canada et engagements de niveau de service (SLA) documentés. | Description du modèle de support + exemples de SLA. |
| **CA-7** | **Solidité financière** suffisante pour soutenir un engagement pluriannuel à l'échelle pancanadienne. | États financiers vérifiés (3 derniers exercices) ou équivalent (à vérifier). |
| **CA-8** | **Au moins deux (2) références clients** dans le secteur des services financiers (FSI), dont **au moins une (1) institution réglementée** de taille comparable, sur un déploiement d'API Management de portée équivalente. | Fiches de référence conformes à §4.2. |
| **CA-9** | **Acceptation sans réserve substantielle** du cadre d'intégrité, des règles de confidentialité (§7) et des clauses obligatoires du modèle de contrat (souveraineté, auditabilité, sortie/réversibilité). | Formulaire d'engagement signé. |
| **CA-10** | **Conformité au cadre réglementaire applicable** : capacité démontrée à soutenir les attentes **BSIF/OSFI B-13** (cyberrisque/TI), **B-10** (risque lié aux tiers) et **B-2/E-21** (résilience opérationnelle), ainsi que **Loi 25 (Québec)** et **LPRPDE/PIPEDA**. | Note de positionnement réglementaire (2 pages max). |

### 2.2 Critères souhaités (CS — valorisés, non éliminatoires)

| Réf. | Critère souhaité |
|------|------------------|
| **CS-1** | Conformité **FAPI** (Financial-grade API) démontrée et compatibilité avec le **cadre canadien du système bancaire ouvert** (Open Banking) et les normes **Paiements Canada (RTR / ISO 20022)**. |
| **CS-2** | Modèle **HYOK** (Hold Your Own Key) avec garanties contractuelles renforcées contre l'accès extraterritorial (risque *Cloud Act*). |
| **CS-3** | **Survivabilité des gateways** en mode dégradé/déconnecté du plan de contrôle, documentée et testée. |
| **CS-4** | **Portabilité multi-cloud** et réversibilité (formats ouverts, absence de verrouillage), idéalement adossées à des standards ouverts. |
| **CS-5** | Expérience de référence avec **l'AMF (Autorité des marchés financiers du Québec)** ou un assureur réglementé. |
| **CS-6** | Présence d'un **portail développeur** gouverné avec parcours self-service pour API internes, partenaires (B2B) et publiques. |

### 2.3 Motifs d'exclusion

Est **exclu** tout soumissionnaire qui : (a) a fourni des renseignements faux ou trompeurs ; (b) se trouve en situation de **conflit d'intérêts** non déclaré vis-à-vis de BBQ ou de son conseil ; (c) fait l'objet d'une procédure d'insolvabilité ouverte ; (d) figure sur une liste de sanctions applicable au Canada (à vérifier au moment du dépôt) ; ou (e) a tenté de communiquer hors des canaux autorisés (§7) afin d'influencer le processus.

---

## 3. STRUCTURE IMPOSÉE DE LA RÉPONSE

### 3.1 Principe directeur

La réponse est **structurée à l'identique** de la présente section. Le soumissionnaire **conserve la numérotation et les intitulés** ci-dessous, afin de garantir la comparabilité des offres. Chaque sous-section répond **point par point** aux exigences du cahier, en reprenant **les codes d'exigence** (EF-xx, EA-xx, ES-xx, EC-xx, EN-xx) et les **codes de cas d'usage** (UC-xx).

> **Règle de traçabilité.** Toute affirmation de conformité doit être **traçable** : code d'exigence → réponse → preuve (référence à un document, une capture, une clause produit publique, ou un élément de la démonstration). Les affirmations non étayées ne sont pas créditées.

### 3.2 Familles d'exigences (rappel du cadre)

Les exigences du dossier sont regroupées en **cinq familles**. La réponse traite **obligatoirement** chacune d'elles.

| Famille | Intitulé | Portée (résumé) |
|---------|----------|-----------------|
| **EF** | **Exigences Fonctionnelles** | Cycle de vie des API (conception, publication, versionnement, dépréciation), passerelle (routage, transformation, médiation REST/SOAP), catalogue/registre, portail développeur, gestion des consommateurs et des abonnements, monétisation, analytique d'usage. |
| **EA** | **Exigences d'Architecture et de déploiement** | Hybride strict (control plane vs data planes), multi-environnements (DC privés QC/ON, cloud canadien, périphérie/DMZ/succursales), survivabilité/mode déconnecté, portabilité multi-cloud, intégration mainframe et systèmes de paiement cœur, modèle d'extensibilité (plugins), gestion des gateways événementielles (Kafka/MQTT/WebSocket — *à vérifier selon produit*). |
| **ES** | **Exigences de Sécurité** | Authentification forte (OAuth2/OIDC/mTLS/**FAPI**), Zero Trust, protection contre les menaces API (**OWASP API Security Top 10**), gestion des secrets, chiffrement et **BYOK/HYOK**, gestion fine des autorisations, isolation des locataires (multi-tenancy). |
| **EC** | **Exigences de Conformité et de gouvernance** | Auditabilité (pistes d'audit **immuables**), rapports prêts pour le **BSIF**, alignement **B-13/B-10/B-2-E-21**, **Loi 25**, **LPRPDE/PIPEDA**, **PCI-DSS v4.0**, **SOC 2 Type II**, souveraineté/résidence des données, contrôle d'accès extraterritorial, gouvernance des politiques (policy-as-code), séparation des tâches. |
| **EN** | **Exigences Non-fonctionnelles et opérationnelles** | Performance et capacité à l'échelle (débit, latence), disponibilité et résilience (**RTO/RPO**), observabilité (journaux, métriques, traçage), exploitation (CI/CD, automatisation, mises à niveau sans interruption), modèle de support et de maintenance, **TCO** et soutenabilité. |

> Les **codes d'exigence détaillés** (EF-01, EA-07, …) figurent au **cahier des exigences** du dossier. Si une numérotation détaillée n'est pas encore communiquée au soumissionnaire, ce dernier **reproduit la structure par famille** et indique explicitement les correspondances **(à confirmer lors de la phase de questions — §6).**

### 3.3 Plan obligatoire de la réponse

La réponse comporte **les sections suivantes, dans cet ordre** :

**Tome 1 — Recevabilité et synthèse**
- **R0. Formulaires d'admissibilité** (preuves CA-1 à CA-10, engagement §2.1/§2.3).
- **R1. Sommaire exécutif** (5 pages max) — compréhension du besoin, proposition de valeur, points saillants de souveraineté et de conformité.
- **R2. Tableau de conformité global** — synthèse par famille (EF/EA/ES/EC/EN) avec niveau de conformité par exigence (voir §3.4).

**Tome 2 — Réponse technique (par famille)**
- **R3. EF — Réponse fonctionnelle.**
- **R4. EA — Réponse architecture et déploiement** (inclut l'architecture de référence, §4.1).
- **R5. ES — Réponse sécurité.**
- **R6. EC — Réponse conformité et gouvernance.**
- **R7. EN — Réponse non-fonctionnelle et opérations.**

**Tome 3 — Cas d'usage**
- **R8. Réponse par cas d'usage** (§3.5), chaque cas traité de bout en bout.

**Tome 4 — Preuves, références et démonstration**
- **R9. Architecture de référence** (schémas + descriptif, §4.1).
- **R10. Références clients FSI** (fiches, §4.2).
- **R11. Plan de démonstration / PoC** (§4.3).

**Tome 5 — Commercial**
- **R12. Tarification et TCO 3 ans — indicatif** (§5).
- **R13. Hypothèses, exclusions et réserves** (y compris liste des éléments marqués « à vérifier »).

**Tome 6 — Annexes**
- **R14. Annexes libres** (documentation produit publique, certifications, glossaire).

### 3.4 Échelle de conformité (obligatoire dans R2 et chaque réponse de famille)

Chaque exigence reçoit **un seul** niveau, avec justification :

| Code | Niveau | Définition |
|------|--------|------------|
| **C** | Conforme nativement | Capacité standard, disponible sans développement spécifique. |
| **CP** | Conforme par paramétrage | Disponible par configuration/extension supportée (plugin, policy). |
| **CR** | Conforme avec développement (roadmap/sur mesure) | Nécessite un développement ; préciser effort et échéance **(à vérifier)**. |
| **PC** | Partiellement conforme | Couverture partielle ; décrire la limite et le contournement. |
| **NC** | Non conforme | Non couvert. |

> Toute mention **C / CP** doit renvoyer à une **preuve** (documentation publique, élément de démonstration). Les niveaux **CR / PC** doivent indiquer un **plan** et un **horizon**. L'absence de niveau pour une exigence vaut **NC**.

### 3.5 Cas d'usage à traiter (UC)

Le soumissionnaire traite **l'ensemble** des cas d'usage suivants en **bout en bout** (acteurs, flux, politiques appliquées, lieu d'exécution des données, contrôles de sécurité et de conformité, observabilité, comportement en mode dégradé). Chaque cas est **rattaché** aux familles concernées.

| Réf. | Cas d'usage | Familles dominantes |
|------|-------------|---------------------|
| **UC-1** | **API publiques Open Banking** exposées à des agrégateurs/développeurs tiers, avec consentement, **FAPI**, quotas et portail self-service gouverné. | ES, EC, EF |
| **UC-2** | **Paiements en temps réel** (RTR / ISO 20022) — médiation, faible latence, idempotence, résilience, gateway proche des données de paiement. | EA, EN, ES |
| **UC-3** | **Partenariats fintech B2B** — onboarding partenaire, mTLS, contrats d'API, monétisation, cloisonnement. | EF, ES, EC |
| **UC-4** | **Exposition de systèmes hérités** (mainframe, SOAP) vers des microservices/omnicanal, sans réécriture du cœur. | EA, EF |
| **UC-5** | **Données d'assurance (filiale)** soumises à l'**AMF** — résidence, segmentation, contrôles d'accès, pistes d'audit. | EC, ES, EA |
| **UC-6** | **Survivabilité** — fonctionnement des gateways en **mode déconnecté** du plan de contrôle (panne/segmentation réseau), puis re-synchronisation. | EA, EN |
| **UC-7** | **Gouvernance et audit BSIF** — production de pistes d'audit immuables et de rapports prêts pour l'examen réglementaire. | EC, EN |

> Si BBQ communique une numérotation UC détaillée dans le cahier, elle prévaut ; à défaut, la présente liste fait foi.

### 3.6 Règles de forme

- **Langue.** Français (réponses commerciales et synthèses). La documentation technique de référence peut être fournie en anglais ; **les engagements contractuels et le sommaire exécutif sont en français**.
- **Format de fichier.** PDF **non protégé** pour le corps de réponse ; **classeur tarifaire** en format tableur (modèle fourni à la section 5). Schémas en PDF vectoriel ou PNG haute résolution.
- **Pagination indicative.** Sommaire exécutif ≤ 5 pages ; chaque réponse de famille ≤ 25 pages ; fiches de référence ≤ 2 pages chacune. Les annexes ne sont pas plafonnées mais ne se substituent pas aux réponses.
- **Nommage.** `BBQ-APIM-2026_[NomSoumissionnaire]_[Tome]_v[x].pdf`.
- **Traçabilité.** Chaque réponse de famille débute par le **tableau de conformité** correspondant (§3.4).

---

## 4. FORMAT DES PREUVES

Les affirmations doivent être **prouvées**. Trois catégories de preuves sont **obligatoires**.

### 4.1 Architecture de référence (R9)

Le soumissionnaire fournit **une architecture de référence** spécifique au contexte BBQ (et non un schéma générique), comprenant **au minimum** :

1. **Vue de déploiement hybride** distinguant clairement :
   - le **plan de contrôle** (control plane), le **portail développeur** et l'**analytique** — localisation (cloud souverain canadien Canada Central/Est **ou** on-prem) ;
   - les **plans de données** (data planes / gateways) selon la sensibilité : **DC privés QC/ON** pour PII, données de paiement et d'assurance ; **cloud canadien** pour charges publiques/partenaires ; **périphérie** (succursales, DMZ).
2. **Flux de données** par cas d'usage (§3.5) indiquant **où circulent et résident** les données réglementées.
3. **Plan de chiffrement et de gestion des clés** (BYOK/HYOK) : où sont stockées et gérées les clés, et comment l'accès extraterritorial est contré (à vérifier selon produit).
4. **Mécanisme de survivabilité** : comportement des gateways en mode déconnecté, durée de fonctionnement autonome, re-synchronisation (UC-6).
5. **Intégration au patrimoine** : mainframe, systèmes de paiement cœur, passerelles héritées REST/SOAP, IAM d'entreprise.
6. **Vue de sécurité** (Zero Trust, mTLS, points d'application des politiques) et **vue d'exploitation** (CI/CD, observabilité, mises à niveau).
7. **Plan de résilience** : topologie multi-sites, bascule, **RTO/RPO** cibles alignés sur les attentes **BSIF B-2/E-21**.

> Chaque schéma est accompagné d'un **descriptif** (hypothèses, composants, frontières de confiance, points de souveraineté). Toute capacité non encore disponible est marquée **« à vérifier »** avec l'échéance prévue.

### 4.2 Références clients FSI (R10)

- **Minimum requis** : conforme à **CA-8** (≥ 2 références FSI, dont ≥ 1 institution réglementée de taille comparable).
- **Fiche de référence** (≤ 2 pages) comprenant : secteur et profil (taille, périmètre réglementaire), **portée du déploiement** (familles couvertes, hybride/on-prem, volumétrie d'API/trafic), **enjeux de souveraineté/conformité** adressés, **résultats** mesurables, et **personne-ressource** joignable pour vérification (avec consentement).
- **Anonymisation** admise si une clause de confidentialité l'exige ; dans ce cas, fournir un profil suffisamment précis pour être évalué et offrir une **vérification sous NDA**.
- Les références sont **vérifiables** ; BBQ se réserve le droit de contacter les répondants. Toute référence invérifiable est réputée **« à vérifier »** et **non créditée** tant qu'elle n'est pas confirmée.

### 4.3 Démonstration / Preuve de concept (R11)

- Le soumissionnaire **présélectionné** présente une **démonstration encadrée** (scénarisée par BBQ) et, le cas échéant, un **PoC** ciblé.
- **Scénarios imposés** (sous réserve d'ajustement) : **UC-1** (Open Banking/FAPI), **UC-2** (paiements temps réel), **UC-6** (survivabilité en mode déconnecté).
- **Environnement** : le PoC s'exécute dans un environnement **respectant la résidence des données au Canada** ; **aucune donnée réelle de production** n'est utilisée (jeux de données synthétiques fournis par BBQ).
- **Livrables de PoC** : script de démonstration, critères de succès mesurables, résultats, et **journal des limites** (éléments « à vérifier »).
- Les coûts de la démonstration/PoC sont **à la charge du soumissionnaire**, sauf disposition contraire convenue par écrit.

---

## 5. EXIGENCES DE TARIFICATION (INDICATIF — NON CONTRACTUEL)

> **Rappel.** Toute donnée tarifaire est **indicative** et **non contractuelle** (cadre d'intégrité). Elle sert uniquement à la **comparaison méthodologique** des offres.

### 5.1 Principes

- La tarification est fournie dans le **classeur tarifaire** (modèle BBQ) et **séparée** du corps technique pour préserver l'objectivité de l'évaluation.
- **Toutes les composantes de coût** sont déclarées ; les coûts omis sont réputés **inclus** (au bénéfice de BBQ pour la comparaison).
- Devise : **dollars canadiens (CAD)**, hors taxes, prix fermes pour la durée de validité de l'offre (§6).

### 5.2 Modèle de prix attendu

Le soumissionnaire présente son **modèle de licence** (au moins un, idéalement comparé) et le **rend explicite** :

| Élément | Détail attendu |
|---------|----------------|
| **Unité de tarification** | Par gateway/nœud, par cœur/vCPU, par appel d'API, par environnement, par développeur, ou abonnement de plateforme — **préciser et justifier**. |
| **Édition / niveaux** | Composants inclus par édition (control plane, data planes, portail, analytique, sécurité avancée, AI/MCP gateway le cas échéant — *à vérifier selon produit*). |
| **Modèle hybride** | Traitement tarifaire des **data planes auto-gérés** (on-prem/cloud canadien/périphérie) vs control plane. |
| **Mise à l'échelle** | Comportement du prix à l'échelle **pancanadienne** (paliers, dégressivité, plafonds). |
| **Support et SLA** | Coût du support **24×7** bilingue et des niveaux de SLA. |
| **Services** | Implémentation, migration des passerelles héritées, formation, transfert de compétences. |
| **Sortie / réversibilité** | Coûts éventuels de sortie, d'export et de réversibilité (anti-verrouillage). |

### 5.3 TCO 3 ans (indicatif)

Le soumissionnaire fournit une **estimation du coût total de possession sur 36 mois**, ventilée par année et par catégorie :

1. **Licences / abonnements** (par édition et par environnement).
2. **Infrastructure** estimée (sous les hypothèses §5.4 ; à distinguer si fournie par BBQ).
3. **Mise en œuvre et migration** (services professionnels).
4. **Support et maintenance** (24×7 bilingue, mises à niveau).
5. **Exploitation** (administration, observabilité).
6. **Sortie / réversibilité** (provision).

> Le TCO inclut un **scénario de référence** (dimensionnement fourni par BBQ en §5.4) **et** une **sensibilité** (±50 % de volume) afin d'apprécier la prévisibilité du coût et le risque de **verrouillage fournisseur**.

### 5.4 Hypothèses de dimensionnement (à confirmer)

Le scénario de référence repose sur des hypothèses **indicatives** que le soumissionnaire **reprend et complète** (et marque **« à vérifier »** s'il les modifie) :

- Périmètre : API **internes**, **partenaires (B2B)** et **publiques** ; ordre de grandeur de **plusieurs centaines** d'API exposées (volumétrie précise à confirmer par BBQ).
- Environnements : production + non-production multiples ; **DC privés QC/ON**, **cloud canadien**, **périphérie**.
- Charge : profil de trafic à fournir par BBQ (à vérifier) ; exigences de **faible latence** pour UC-2.
- Sécurité/conformité : BYOK/HYOK, FAPI pour UC-1, pistes d'audit immuables.

> **Toute hypothèse non confirmée par BBQ est marquée « à vérifier ».** Les écarts d'hypothèses entre soumissionnaires seront **normalisés** par BBQ pour la comparaison.

### 5.5 Validité des prix

Les prix sont **valides 120 jours** à compter de la date limite de dépôt (§6), sauf prorogation acceptée par écrit. Cette validité est **indicative** dans le cadre du présent exercice simulé.

---

## 6. CALENDRIER DE SOUMISSION

> Dates **indicatives** (exercice simulé). Toute date réelle serait fixée par l'avis officiel ; **à confirmer**.

| Jalon | Délai (indicatif) |
|-------|-------------------|
| **Publication du RFP** | T0 |
| **Confirmation d'intention de soumissionner** | T0 + 5 jours ouvrables |
| **Période de questions des soumissionnaires** | T0 + 5 à T0 + 15 jours ouvrables |
| **Publication des réponses aux questions (addenda)** | T0 + 20 jours ouvrables |
| **Date et heure limites de dépôt** | **T0 + 35 jours ouvrables, 14 h 00 (heure de l'Est)** |
| **Évaluation de la recevabilité** | T0 + 36 à T0 + 40 jours ouvrables |
| **Évaluation au fond et présélection** | T0 + 41 à T0 + 60 jours ouvrables |
| **Démonstrations / PoC des présélectionnés** | T0 + 61 à T0 + 80 jours ouvrables |
| **Décision et avis aux soumissionnaires** | T0 + 90 jours ouvrables |

**Règles de délai.** Toute réponse **reçue après** la date et l'heure limites est **rejetée** sans ouverture. Le soumissionnaire est seul responsable de la transmission complète et lisible dans les délais. Les addenda publiés font **partie intégrante** du dossier et priment sur les versions antérieures.

---

## 7. RÈGLES DE COMMUNICATION ET DE CONFIDENTIALITÉ

### 7.1 Canal unique de communication

- **Toute communication** relative au RFP passe **exclusivement** par le **point de contact unique** désigné par BBQ (le « Responsable de l'approvisionnement »), via le **portail d'approvisionnement** ou l'adresse officielle indiquée dans l'avis.
- **Aucun contact** avec d'autres employés, dirigeants, membres du conseil ou conseillers de BBQ au sujet du RFP n'est autorisé. Toute tentative de **contournement** ou de **lobbying** constitue un motif d'**exclusion** (§2.3).
- **Questions** : soumises par écrit pendant la période prévue (§6). Les réponses sont **anonymisées** et **diffusées à tous** les soumissionnaires inscrits sous forme d'addenda.

### 7.2 Confidentialité

- Le présent dossier et toutes les pièces associées sont **confidentiels**. Ils ne peuvent être ni reproduits, ni diffusés hors de l'équipe de réponse du soumissionnaire, ni utilisés à d'autres fins que la préparation de l'offre.
- Les informations sensibles échangées (par ex. rapports SOC 2/PCI, références) le sont **sous accord de non-divulgation (NDA)** lorsque requis.
- BBQ traite les réponses comme **confidentielles** et ne les divulgue qu'aux personnes participant à l'évaluation, sous réserve des obligations légales applicables.
- Le soumissionnaire **identifie clairement** les éléments qu'il considère comme **secrets commerciaux** ; à défaut de marquage, BBQ applique son régime de confidentialité standard sans engagement spécifique.

### 7.3 Propriété, frais et indépendance

- Les réponses **deviennent la propriété** de BBQ aux fins d'évaluation et d'archivage ; les **droits de propriété intellectuelle** du soumissionnaire sur son contenu sont préservés.
- **Frais à la charge du soumissionnaire** : la préparation de la réponse, les démonstrations et le PoC ne donnent lieu à **aucun remboursement**.
- **Indépendance / collusion** : chaque soumissionnaire atteste avoir préparé son offre de manière **indépendante**, sans entente prohibée avec un concurrent.

### 7.4 Réserves de BBQ

BBQ se réserve le droit, à sa seule discrétion et sans engager sa responsabilité : d'annuler, de suspendre ou de relancer le processus ; de ne retenir **aucune** offre ; de demander des **clarifications** ; de vérifier toute information ; de négocier avec un ou plusieurs soumissionnaires ; et d'attribuer **par tranches**. *(Réserves énoncées dans le cadre de l'exercice simulé.)*

---

## 8. BARÈME DE RECEVABILITÉ

La recevabilité est évaluée **avant** l'analyse au fond. Elle est **binaire** (Conforme / Non conforme) pour chaque critère ; un seul **manquement bloquant** rend la réponse **irrecevable**.

### 8.1 Grille de recevabilité

| # | Contrôle de recevabilité | Type | Effet si non satisfait |
|---|--------------------------|------|------------------------|
| **B-1** | Réponse **reçue dans les délais** (date/heure limites, §6). | Bloquant | Rejet sans ouverture. |
| **B-2** | **Complétude des tomes** R0 à R13 (présence de toutes les sections imposées, §3.3). | Bloquant | Irrecevable. |
| **B-3** | **Formulaires d'admissibilité CA-1 à CA-10** présents et signés (§2.1). | Bloquant | Irrecevable. |
| **B-4** | **Engagement** sur le cadre d'intégrité, la confidentialité et les clauses obligatoires (CA-9). | Bloquant | Irrecevable. |
| **B-5** | **Tableau de conformité global R2** fourni avec un niveau (§3.4) pour **chaque** exigence. | Bloquant | Irrecevable. |
| **B-6** | **Architecture de référence R9** présente et spécifique à BBQ (§4.1). | Bloquant | Irrecevable. |
| **B-7** | **Références FSI** conformes à CA-8/§4.2 (≥ 2, dont ≥ 1 régulée comparable). | Bloquant | Irrecevable. |
| **B-8** | **Classeur tarifaire R12** complet au format imposé (§5). | Bloquant | Irrecevable. |
| **B-9** | **Respect des règles de communication** (§7.1) durant tout le processus. | Bloquant | Exclusion. |
| **B-10** | **Langue et format** conformes (§3.6) ; fichiers lisibles et non protégés. | Mineur corrigible | Demande de régularisation sous 2 jours ouvrables ; à défaut, irrecevable. |
| **B-11** | **Marquage « à vérifier »** appliqué aux éléments incertains ; **séparation prix/technique**. | Mineur corrigible | Demande de clarification ; à défaut, élément non crédité. |

### 8.2 Traitement des écarts mineurs

Pour les écarts **mineurs corrigibles** (B-10, B-11), BBQ **peut** — sans y être tenue — inviter le soumissionnaire à **régulariser** dans un délai bref (2 jours ouvrables), **sans modifier le fond** de l'offre ni le prix. Une régularisation qui altérerait le fond ou le prix est **refusée**.

### 8.3 Notification

Les soumissionnaires déclarés **irrecevables** sont **notifiés** avec le **motif** (référence au contrôle B-x correspondant). Les réponses recevables passent à l'**évaluation au fond** selon la **grille d'évaluation** du dossier (pièce distincte).

---

## 9. CHECKLIST DE DÉPÔT (à inclure en tête de R0)

- [ ] Tomes **R0 à R14** présents et nommés selon §3.6.
- [ ] Formulaires **CA-1 à CA-10** signés ; engagement **CA-9** joint.
- [ ] **Tableau de conformité global (R2)** : un niveau (§3.4) par exigence EF/EA/ES/EC/EN.
- [ ] Réponses **par famille (R3–R7)** avec tableau de conformité en tête de chacune.
- [ ] **Cas d'usage (R8)** UC-1 à UC-7 traités de bout en bout.
- [ ] **Architecture de référence (R9)** spécifique à BBQ + descriptifs.
- [ ] **Références FSI (R10)** ≥ 2, dont ≥ 1 régulée comparable, vérifiables.
- [ ] **Plan de démonstration/PoC (R11)** couvrant UC-1, UC-2, UC-6.
- [ ] **Classeur tarifaire (R12)** + **TCO 3 ans indicatif** (scénario + sensibilité).
- [ ] **Hypothèses et réserves (R13)** avec **liste des éléments « à vérifier »**.
- [ ] **Séparation** stricte prix / technique respectée.
- [ ] Mentions du **cadre d'intégrité** reproduites (fictif / simulé / indicatif / « à vérifier »).

---

*Document préparé pour la phase de soumission du RFP **RFP-BBQ-APIM-2026**. Organisation cliente **fictive** ; réponses fournisseurs **simulées** à partir de capacités produit publiques vérifiées en **juin 2026** ; prix **indicatifs et non contractuels** ; éléments marqués **« à vérifier »** à confirmer en phase de diligence et de PoC.*
