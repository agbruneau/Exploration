# Annexe A2 — Matrice des exigences

**Document de référence :** RFP-APIM-2026-001
**Instructions au soumissionnaire :** pour chaque exigence, indiquer le niveau de conformité — **N** (native), **C** (par configuration), **M** (module/option payante), **T** (via tiers), **R** (sur la feuille de route), **X** (non couverte) — et fournir une preuve (référence documentaire, capture, démonstration).
**Priorité :** P1 = critique, P2 = important, P3 = souhaitable.

---

## EF — Exigences fonctionnelles

| ID | Exigence | Priorité | Critère |
|---|---|---|---|
| EF-01 | Conception design-first : import/export OpenAPI 3.x | P1 | C1 |
| EF-02 | Support AsyncAPI (événementiel) et GraphQL | P2 | C1/C7 |
| EF-03 | Support gRPC | P3 | C1/C7 |
| EF-04 | Versionnage d'API et révisions non disruptives | P1 | C1 |
| EF-05 | Cycle de dépréciation géré (notification, migration des consommateurs) | P2 | C1 |
| EF-06 | Médiation et transformation de protocole (REST/SOAP, JSON/XML) | P1 | C1 |
| EF-07 | Routage basé sur le contenu et orchestration légère | P2 | C1 |
| EF-08 | Politiques extensibles (scripts, greffons personnalisés) | P2 | C1 |
| EF-09 | Portail développeur en libre-service avec console d'essai | P1 | C1/C9 |
| EF-10 | Inscription d'applications, gestion des clés et abonnements | P1 | C1 |
| EF-11 | Catalogue/inventaire centralisé multi-passerelles | P1 | C1/C9 |
| EF-12 | Modèle produit/forfait et monétisation (mesure, facturation) | P3 | C1 |
| EF-13 | Gestion du consentement et contrats d'API partenaires (open banking) | P1 | C1 |

## EA — Architecture & déploiement hybride

| ID | Exigence | Priorité | Critère |
|---|---|---|---|
| EA-01 | Séparation stricte plan de contrôle / plan de données | P1 | C2 |
| EA-02 | Passerelles auto-gérées sur Kubernetes (distributions multiples) | P1 | C2 |
| EA-03 | Support Red Hat OpenShift | P1 | C2 |
| EA-04 | Déploiement sur site (centre de données) et nuage privé | P1 | C2 |
| EA-05 | Multi-nuage (AWS, Azure, GCP) pour les plans de données | P2 | C2 |
| EA-06 | Résilience au découplage du plan de contrôle (mode dégradé) | P1 | C2 |
| EA-07 | Capacité quasi air-gap / fonctionnement déconnecté du plan de données | P2 | C2 |
| EA-08 | Mises à niveau maîtrisées (fenêtre de support, rétrocompatibilité) | P2 | C2 |
| EA-09 | Gestion déclarative/GitOps (decK, Terraform, Helm, opérateur K8s) | P2 | C2/C9 |
| EA-10 | Multi-région active-active | P1 | C2/C5 |

## ES — Sécurité

| ID | Exigence | Priorité | Critère |
|---|---|---|---|
| ES-01 | mTLS bidirectionnel (client→passerelle, passerelle→service) | P1 | C3 |
| ES-02 | OAuth 2.x / OIDC / validation JWT | P1 | C3 |
| ES-03 | Intégration au fournisseur d'identité d'entreprise (OIDC) | P1 | C3 |
| ES-04 | Protection contre les menaces (OWASP API Top 10, JSON/XML, injection) | P1 | C3 |
| ES-05 | Détection d'abus et de bots (idéalement assistée par ML) | P2 | C3 |
| ES-06 | Gestion des secrets (coffre, HSM); intégration CyberArk souhaitée | P1 | C3 |
| ES-07 | RBAC fin sur le plan de gestion | P1 | C3 |
| ES-08 | Journaux d'audit immuables (gestion et exécution) | P1 | C3/C6 |
| ES-09 | Intégration WAF (native ou architecture de référence) | P2 | C3 |
| ES-10 | Chiffrement avec clés gérées par le client (CMEK) | P2 | C3/C4 |

## EC — Conformité & souveraineté

| ID | Exigence | Priorité | Critère |
|---|---|---|---|
| EC-01 | SOC 2 Type II | P1 | C4 |
| EC-02 | ISO/IEC 27001 | P1 | C4 |
| EC-03 | PCI-DSS (attestation, guide de configuration) | P1 | C4 |
| EC-04 | Résidence des données au Canada (régions ou exécution sur site) | P1 | C4 |
| EC-05 | FIPS 140 (modules cryptographiques validés ou conformes) | P2 | C4 |
| EC-06 | Cadres FSI (PIPEDA, *Protected B*, IBM Cloud for FS, DORA) | P2 | C4 |
| EC-07 | Emplacement documenté et contrôlable du plan de contrôle | P1 | C4 |

## EN — Exigences non fonctionnelles (performance, observabilité, IA, événementiel)

| ID | Exigence | Priorité | Critère |
|---|---|---|---|
| EN-01 | Débit agrégé ≥ 60 000 req/s avec latence P99 maîtrisée | P1 | C5 |
| EN-02 | Limitation de débit / quotas (par client, partenaire, clé) | P1 | C5 |
| EN-03 | Mise en cache, incluant cache externe Redis | P2 | C5 |
| EN-04 | Métriques, journaux et traces; OpenTelemetry natif | P1 | C6 |
| EN-05 | Intégrations Datadog et Splunk | P1 | C6 |
| EN-06 | Rétention analytique ≥ 12 mois | P2 | C6 |
| EN-07 | Médiation Kafka/AsyncAPI et contrôle d'accès aux sujets | P2 | C7 |
| EN-08 | GraphQL (passthrough et/ou synthétique) | P2 | C7 |
| EN-09 | Quotas de jetons LLM et cache sémantique | P2 | C8 |
| EN-10 | Garde-fous de prompt et sécurité du contenu | P2 | C8 |
| EN-11 | Support MCP (exposition d'API aux agents) | P2 | C8 |
| EN-12 | Gouvernance agent-à-agent (A2A) | P3 | C8 |
| EN-13 | Haute disponibilité SLA ≥ 99,9 % et reprise après sinistre | P1 | C2/C5 |
