# Évaluation, Scoring et Décision Finale (Juin 2026)

Le comité d'évaluation (Architecture, Cybersécurité et Achats) a compilé les résultats suite aux analyses techniques et aux démonstrations.

## 1. Matrice de Notation (sur 100 %)

| Critères d'Évaluation (Pondération) | Apigee (Google) | Kong Enterprise | MuleSoft |
| :--- | :---: | :---: | :---: |
| **1. Architecture & Multi-Cloud (25%)** | 18 | **25** | 16 |
| **2. Sécurité, Conformité & AI Gateway (25%)** | 23 | **25** | 19 |
| **3. Monétisation & Portail (20%)** | **20** | 16 | 15 |
| **4. APIOps & Observabilité (15%)** | **14** | **14** | 13 |
| **5. TCO et Modèle Économique (15%)** | 10 | **14** | 9 |
| **SCORE GLOBAL (/ 100%)** | **85 %** | **94 %** | **72 %** |

## 2. Analyse et Synthèse

*   🔴 **MuleSoft (72 %)** : Écarté. Bien que ce soit le meilleur outil d'intégration logicielle (iPaaS), son architecture est trop lourde et son TCO est inadapté à notre besoin strict de passerelles distribuées et légères.
*   🟡 **Google Apigee (85 %)** : Le grand favori sur la partie monétisation et analytique. Cependant, l'empreinte infrastructurelle d'Apigee Hybrid pour nos environnements sur site au Québec et son coût de licence réduisent sa note globale.
*   🟢 **Kong Enterprise (94 %) - GAGNANT** : Kong remporte ce RFP avec brio. En juin 2026, l'agilité Multi-Cloud et la gouvernance des LLM sont critiques : Kong excelle sur ces points grâce à son architecture ultra-légère et ses plugins *AI Gateway* très matures. Bien qu'il nécessite un petit effort d'intégration pour la facturation, son approche orientée développeur (GitOps) et son TCO imbattable en font le choix stratégique parfait.

## 🏆 Recommandation Finale et Prochaines Étapes
Le comité recommande formellement l'acquisition de **Kong Enterprise**.

**Actions immédiates :**
1. Lancement d'un Proof of Concept (PoC) de 4 semaines avec Kong pour valider :
    * Les performances de latence sur nos serveurs locaux.
    * L'application de la politique de masquage de données via WebAssembly (validation Loi 25).
2. Début des négociations contractuelles (Procurement) avec Kong Inc. pour un déploiement au T3 2026.