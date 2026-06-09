# Réponse au RFP : Kong Enterprise

*   **Architecture (CU-3)** : *Kong Konnect* (SaaS) gère des Data Planes ultra-légers (Rust/NGINX) de quelques Mo, déployables instantanément sur K8s ou bare-metal. Agnosticisme cloud parfait et latence minimale.
*   **Sécurité & AI Gateway (CU-1, CU-2)** : Leader incontesté sur l'AI Gateway avec des plugins natifs pour le *rate-limiting* par tokens LLM, le fallback de modèles et le cache sémantique. Support natif de Wasm pour des politiques de masquage ultra-rapides (Loi 25).
*   **Monétisation (CU-4)** : Excellent portail développeur. Cependant, la monétisation pure nécessite l'intégration d'outils tiers (via plugins Stripe ou Moesif), moins "clé en main" qu'Apigee.
*   **APIOps & Observabilité (CU-5)** : Approche 100% déclarative via l'outil CLI `decK`. Export natif OpenTelemetry parfait vers Datadog.
*   **TCO** : Tarification au service/transaction. TCO extrêmement compétitif grâce aux économies d'infrastructure (Compute/RAM).