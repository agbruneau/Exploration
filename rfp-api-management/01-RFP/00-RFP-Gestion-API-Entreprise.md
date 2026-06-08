# Appel d'offres (RFP) — Plateforme de gestion des API d'entreprise

**Organisation émettrice :** Groupe Financier Boréal (GFB) — *institution financière illustrative (banque/assurance)*
**Référence :** RFP-APIM-2026-001
**Date d'émission :** 8 juin 2026
**Domaine :** Gestion du cycle de vie des API d'entreprise (Full Lifecycle API Management) en mode hybride
**Classification :** Confidentiel — usage restreint aux soumissionnaires

> **Note sur ce document.** Le Groupe Financier Boréal est une institution *fictive* servant de support à un exercice d'évaluation rigoureux. Les exigences, cas d'usage et pondérations reflètent les pratiques réelles d'une grande institution financière canadienne soumise à la surveillance du BSIF (OSFI) et aux obligations de la *Loi sur la protection des renseignements personnels et les documents électroniques* (LPRPDE/PIPEDA). Les noms d'organisation et volumétries sont paramétrables.

---

## Sommaire exécutif

Le GFB sollicite des soumissions pour l'acquisition, le déploiement et l'opération d'une **plateforme de gestion des API d'entreprise** destinée à gouverner l'ensemble de son patrimoine d'interfaces (REST, GraphQL, événementiel, et désormais agentique/IA) selon un **modèle de déploiement hybride** : plan de contrôle infonuagique géré, plans de données auto-gérés au plus près des systèmes de référence (mainframe, données sensibles) sur Kubernetes en centre de données et en nuage privé.

Le besoin découle de trois pressions convergentes : (1) l'ouverture réglementée des services financiers (*open banking*, paiements en temps réel), qui multiplie les API exposées à des tiers; (2) la modernisation du cœur bancaire et assurantiel, qui exige une façade d'API découplant les canaux numériques des systèmes hérités; (3) l'émergence du trafic non humain — agents IA et protocoles comme MCP — qui impose une couche de gouvernance et de sécurité de nouvelle génération. Selon les analyses de marché, près de 80 % du trafic d'API serait généré par des acteurs non humains en 2026 (*source : Nordic APIs, 2026 — projection, à valider*).

La plateforme retenue devra concilier deux impératifs habituellement en tension : la **souveraineté et la conformité** (résidence des données au Canada, PCI-DSS, isolation des données réglementées) et l'**agilité des équipes produit** (libre-service, design-first, gouvernance fédérée). Le présent RFP est **centré sur les cas d'usage** : les soumissionnaires sont évalués sur leur capacité démontrée à répondre aux dix cas d'usage de la section 3, et non sur des inventaires de fonctionnalités.

---

## 1. Contexte et objectifs

### 1.1 Profil de l'organisation

Le GFB est une institution financière de plein exercice (services bancaires de détail et commerciaux, gestion de patrimoine, assurance de dommages et de personnes). Indicateurs illustratifs servant au dimensionnement des soumissions :

| Dimension | Valeur illustrative |
|---|---|
| Actifs sous gestion | > 250 G$ CA |
| Clients particuliers et entreprises | > 5 millions |
| Développeurs internes et partenaires | ~ 2 500 |
| API en production (REST/GraphQL) | ~ 1 200, en croissance de 25 %/an |
| Trafic d'API agrégé (pointe) | ~ 35 000 req/s, cible 24 mois : 60 000 req/s |
| Flux événementiels (Kafka) | ~ 400 sujets, paiements et anti-fraude temps réel |
| Empreinte | 2 centres de données (Québec, Ontario) + nuage public (hybride) |

### 1.2 Situation actuelle

Le patrimoine d'API est aujourd'hui géré par un assemblage hétérogène : une passerelle de première génération en fin de vie, des passerelles applicatives disparates, et une gouvernance largement manuelle. Les conséquences sont une **dette de gouvernance** (catalogue incomplet, politiques de sécurité incohérentes), une **friction d'exploitation** (délais de mise en production, absence de SLO unifiés) et une **exposition au risque** (visibilité limitée sur les API « fantômes » et le trafic IA non gouverné).

### 1.3 Vision cible

Une **plateforme unique de gouvernance** appliquant des politiques cohérentes sur l'ensemble des points d'entrée, quel que soit l'emplacement d'exécution (nuage public, centre de données, périphérie), avec :

- un **plan de contrôle géré** (réduction du fardeau opérationnel) couplé à des **plans de données auto-gérés** souverains;
- une **gouvernance fédérée** : autonomie des équipes de domaine sous garde-fous centraux (sécurité, conformité, normes de conception);
- une **sécurité Zero Trust** native (mTLS de bout en bout, OAuth 2.x/OIDC, protection contre les menaces);
- une **observabilité de bout en bout** alimentant SLO, traçabilité d'audit et refacturation (FinOps);
- une **gouvernance du trafic IA** : quotas de jetons, garde-fous de prompt, exposition contrôlée des API aux agents (MCP/A2A).

### 1.4 Objectifs mesurables (résultats attendus sur 24 mois)

1. Réduire le délai moyen de mise en production d'une nouvelle API de *semaines* à *jours* (libre-service gouverné).
2. Atteindre 100 % de couverture du catalogue d'API (élimination des API non gouvernées).
3. Appliquer un socle de sécurité homogène (mTLS, OAuth, limitation de débit) à 100 % des API exposées.
4. Garantir la résidence canadienne des données sensibles et des charges réglementées.
5. Mettre sous gouvernance 100 % du trafic LLM/agentique d'ici la fin de la période.

---

## 2. Périmètre

### 2.1 Inclus

Plan de contrôle (conception, publication, gouvernance, analytique); plans de données/passerelles (gérées et auto-gérées); portail développeur et catalogue d'API; gestion de la sécurité (authentification, autorisation, protection des menaces); gestion du trafic événementiel et GraphQL; passerelle IA/LLM; observabilité et intégration SIEM/APM; modèle de licence et services d'accompagnement (mise en œuvre, formation, support).

### 2.2 Exclu

Refonte applicative des systèmes de référence (mainframe), fourniture du courtier d'événements (Kafka) lui-même, et acquisition d'un IAM d'entreprise (un fournisseur d'identité OIDC existe; la plateforme doit s'y intégrer, non le remplacer).

### 2.3 Contraintes structurantes

- **Déploiement hybride obligatoire** : capacité à exécuter des passerelles auto-gérées sur Kubernetes en centre de données du GFB, pilotées par un plan de contrôle géré.
- **Résidence des données au Canada** pour les données réglementées (régions canadiennes ou exécution sur site).
- **Résilience au découplage du plan de contrôle** : les passerelles doivent continuer à traiter le trafic en cas de perte temporaire de connectivité avec le plan de contrôle.
- **Intégration à l'écosystème existant** : fournisseur OIDC, HSM/coffre à secrets, Kafka, pile d'observabilité (Datadog et Splunk en place).

---

## 3. Cas d'usage (cœur de l'évaluation)

Chaque soumission doit démontrer, preuves à l'appui (architecture de référence, configuration, démonstration ou PoC), sa réponse aux cas d'usage suivants. Priorité : **P1 = critique**, **P2 = important**, **P3 = souhaitable**.

| ID | Cas d'usage | Description | Priorité |
|---|---|---|---|
| **CU-01** | API partenaires & *open banking* | Exposer des API réglementées à des tiers (agrégateurs, fintechs) avec gestion du consentement, contrats d'API, quotas par partenaire et conformité aux normes d'API financières. | P1 |
| **CU-02** | Façade d'API du cœur bancaire/assurantiel | Découpler les canaux numériques des systèmes de référence (mainframe, polices) via une couche de médiation, transformation et orchestration légère. | P1 |
| **CU-03** | Canaux numériques omnicanaux | Servir applications mobiles, web et agences avec faible latence, mise en cache et limitation de débit par canal et par client. | P1 |
| **CU-04** | Sécurité Zero Trust de bout en bout | mTLS systématique, validation OAuth 2.x/OIDC/JWT, protection contre les menaces (OWASP API Top 10), détection d'abus. | P1 |
| **CU-05** | Souveraineté & déploiement hybride | Exécuter des passerelles auto-gérées au plus près des données sensibles (centre de données, nuage privé), résidence canadienne, résilience au découplage du plan de contrôle. | P1 |
| **CU-06** | Intégration événementielle temps réel | Gouverner les flux Kafka/asynchrones (paiements instantanés, anti-fraude) : découverte via AsyncAPI, contrôle d'accès aux sujets, médiation. | P2 |
| **CU-07** | Gouvernance fédérée & catalogue à l'échelle | Catalogue unifié design-first, autonomie des équipes de domaine sous politiques centrales, découvrabilité, application de normes de conception (linting). | P1 |
| **CU-08** | Passerelle IA/LLM & agentique | Gouverner le trafic LLM (quotas de jetons, cache sémantique, garde-fous de prompt, sécurité du contenu) et exposer des API aux agents via MCP; gouvernance agent-à-agent (A2A). | P2 |
| **CU-09** | Monétisation & produits API | Empaqueter des API en produits/forfaits, mesurer l'usage, appliquer des quotas tarifés et générer la facturation/refacturation. | P3 |
| **CU-10** | Observabilité, SRE & FinOps | Traçabilité distribuée, SLO/alerting, journaux d'audit immuables, export vers Datadog/Splunk, refacturation par consommation. | P2 |

---

## 4. Exigences fonctionnelles (synthèse)

Le détail vérifiable, ligne par ligne, figure à l'**annexe A2 — Matrice des exigences**. Synthèse :

- **Cycle de vie complet** : conception design-first (OpenAPI 3.x, AsyncAPI, GraphQL, gRPC), versionnage et révisions, publication multi-environnement, dépréciation gérée.
- **Passerelle d'exécution** : médiation et transformation de protocole, routage basé sur le contenu, politiques extensibles, déploiement conteneurisé.
- **Portail développeur** : libre-service, console d'essai interactive, inscription d'applications, gestion des clés et des abonnements, personnalisation de marque.
- **Catalogue & gouvernance** : inventaire centralisé multi-passerelles, métadonnées de cycle de vie, conformité et linting, recherche/découvrabilité.
- **Monétisation** : produits, forfaits, mesure d'usage, quotas tarifés, facturation.

## 5. Exigences non fonctionnelles (synthèse)

- **Architecture & déploiement hybride** : séparation stricte plan de contrôle/plan de données; passerelles auto-gérées sur Kubernetes (incl. OpenShift); multi-nuage; mode dégradé/quasi air-gap; mises à niveau maîtrisées.
- **Sécurité** : mTLS bidirectionnel, OAuth 2.x/OIDC/JWT, intégration IdP, protection des menaces, gestion des secrets (coffre/HSM, intégration CyberArk souhaitée), RBAC fin, journaux d'audit.
- **Conformité & souveraineté** : SOC 2 Type II, ISO/IEC 27001, PCI-DSS, résidence canadienne, FIPS 140 (modules cryptographiques), cadres FSI (p. ex. IBM Cloud for Financial Services, PIPEDA, *Protected B*).
- **Performance & scalabilité** : débit cible ≥ 60 000 req/s, latence P99 maîtrisée, multi-région active-active, mise à l'échelle horizontale.
- **Observabilité** : métriques/journaux/traces, OpenTelemetry natif, intégrations Datadog et Splunk, rétention analytique ≥ 12 mois.
- **Capacités événementielles & GraphQL** : médiation Kafka/AsyncAPI, GraphQL (passthrough et/ou synthétique), WebSocket, gRPC.
- **Passerelle IA/LLM** : quotas de jetons, cache sémantique, garde-fous de prompt, sécurité du contenu, routage multi-modèles, support MCP et A2A.
- **Exploitation** : haute disponibilité (SLA ≥ 99,9 %), reprise après sinistre, GitOps/APIOps, automatisation (IaC).

---

## 6. Critères d'évaluation pondérés

Les soumissions sont notées sur **100 points** selon onze critères pondérés. La grille détaillée (sous-critères, échelle de maturité 0–5, méthode de calcul) figure à l'**annexe A1 — Grille d'évaluation pondérée**.

| # | Critère | Pondération |
|---|---|---:|
| C1 | Capacités fonctionnelles cœur (cycle de vie, passerelle, portail, catalogue) | 15 % |
| C2 | Architecture & déploiement hybride | 15 % |
| C3 | Sécurité | 15 % |
| C4 | Conformité & souveraineté | 12 % |
| C5 | Performance & scalabilité | 8 % |
| C6 | Observabilité & exploitation | 6 % |
| C7 | Capacités événementielles & GraphQL | 6 % |
| C8 | Passerelle IA/LLM & agentique | 7 % |
| C9 | Expérience développeur & gouvernance fédérée | 6 % |
| C10 | Coût total de possession & modèle commercial | 6 % |
| C11 | Écosystème, support & pérennité | 4 % |
| | **Total** | **100 %** |

**Justification de la pondération (premiers principes).** Le profil retenu — institution financière en déploiement hybride — concentre 42 % du poids sur trois critères : architecture hybride (15 %), sécurité (15 %) et conformité/souveraineté (12 %). Ce choix découle directement du risque dominant en services financiers : l'exposition réglementaire et la protection des données priment sur la commodité ou le coût. Les capacités fonctionnelles cœur (15 %) restent au plus haut niveau car elles conditionnent l'adéquation de base. Les critères différenciants émergents (IA/agentique 7 %, événementiel 6 %) sont pondérés à hauteur de leur maturité actuelle et de leur trajectoire stratégique, sans dominer l'évaluation. *Condition qui renverserait la pondération : un mandat « cloud-first/sans site » réduirait C2 et C4 au profit de C9 et C10.*

---

## 7. Modalités de réponse

Le format de réponse imposé, la structure attendue, les pièces justificatives et les règles d'admissibilité figurent à l'**annexe A3 — Modalités de réponse**. En synthèse, chaque réponse doit suivre la structure des sections 3 à 5, fournir une architecture de référence pour le déploiement hybride du GFB, et inclure une grille d'autoévaluation alignée sur l'annexe A1.

## 8. Calendrier (illustratif)

| Jalon | Date cible |
|---|---|
| Émission du RFP | 8 juin 2026 |
| Période de questions des soumissionnaires | 8 – 19 juin 2026 |
| Réponses du GFB aux questions | 26 juin 2026 |
| Date limite de soumission | 17 juillet 2026 |
| Évaluation et présélection | 20 – 31 juillet 2026 |
| Démonstrations / PoC des finalistes | août 2026 |
| Décision et négociation | septembre 2026 |

---

## Annexes

- **A1 — Grille d'évaluation pondérée** (`A1-Grille-Evaluation-Ponderee.md`)
- **A2 — Matrice des exigences** (`A2-Matrice-Exigences.md`)
- **A3 — Modalités de réponse** (`A3-Modalites-Reponse.md`)

## Sources (contexte de marché)

- Nordic APIs — « 10 AI-Driven API Economy Predictions for 2026 » — 2026 — https://nordicapis.com/10-ai-driven-api-economy-predictions-for-2026/ *(projection trafic non humain — à valider)*
- Gartner — « Magic Quadrant for API Management » — 7 octobre 2025 — https://www.gartner.com/en/documents/7020998
