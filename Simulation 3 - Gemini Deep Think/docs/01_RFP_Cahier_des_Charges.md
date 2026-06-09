# Cahier des Charges (RFP) : Enterprise API Management

## 1. Cas d'Usage Principaux (Use Cases - CU)
Les solutions candidates seront évaluées sur leur capacité à couvrir les cinq cas d'usage suivants :

*   **CU-1 : Sécurité Avancée et Conformité (Loi 25)**
    *   Protection contre le Top 10 OWASP API 2026 (WAF intégré).
    *   Authentification forte (OAuth 2.1, OIDC, mTLS automatisé).
    *   Masquage et anonymisation des données sensibles (PII) en temps réel dans les payloads pour garantir la conformité à la Loi 25.
*   **CU-2 : AI Gateway et Gouvernance des LLM**
    *   Capacité à router les requêtes vers différents fournisseurs de LLM (OpenAI, Gemini, Mistral).
    *   Gestion des quotas par *tokens* d'IA (et non par requêtes HTTP).
    *   Mise en cache sémantique pour réduire les coûts d'inférence.
*   **CU-3 : Architecture Hybride et Edge (Universal APIM)**
    *   Plan de contrôle (Control Plane) centralisé en mode SaaS.
    *   Passerelles d'exécution (Data Planes) ultra-légères déployables sur nos clusters Kubernetes (EKS/AKS) et sur nos serveurs bare-metal au Québec avec une latence sub-milliseconde.
*   **CU-4 : Portail Développeur et Monétisation**
    *   Portail B2B en libre-service avec génération de documentation interactive.
    *   Moteur de facturation complexe (freemium, pay-per-call, partage de revenus) pour monétiser nos données.
*   **CU-5 : APIOps et Observabilité**
    *   Gestion déclarative (Configuration as Code / GitOps) pour nos pipelines CI/CD.
    *   Support natif d'OpenTelemetry et intégration avec notre stack de monitoring (Datadog/Splunk).

## 2. Grille d'Évaluation (Pondération)
Le score final sera calculé sur **100 % (100 points)** :

| Catégorie | Poids |
| :--- | :---: |
| **1. Architecture, Légèreté et Multi-Cloud (CU-3)** | **25 %** |
| **2. AI Gateway & Sécurité / Conformité (CU-1, CU-2)** | **25 %** |
| **3. Monétisation & Portail Développeur (CU-4)** | **20 %** |
| **4. APIOps & Observabilité (CU-5)** | **15 %** |
| **5. Coût Total de Possession (TCO) et Modèle Économique** | **15 %** |