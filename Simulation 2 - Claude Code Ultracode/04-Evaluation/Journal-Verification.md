# Journal de vérification adversariale

**Dossier :** RFP-BBQ-APIM-2026 — Plateforme unifiée de gestion des API d'entreprise
**Objet :** consigner la passe de **vérification adversariale** appliquée aux cinq réponses simulées et au dossier consolidé, ses constats et leur traitement.

---

## 1. Méthode

Après production des réponses et de la notation, **six vérificateurs indépendants** ont été lancés avec une consigne adversariale (chercher l'erreur, non la confirmer) :

- **5 vérificateurs « faits »** — un par réponse candidate — confrontant chaque affirmation de capacité (hybride, certifications/conformité, IA/MCP, performance, prix) à la réalité produit de juin 2026, recherche web à l'appui ; consigne : *par défaut, considérer douteuse toute certification spécifique non standard*.
- **1 vérificateur « cohérence »** — confrontant le rapport consolidé et le README aux **données chiffrées de référence** (calculées par programme), à la recherche de toute contradiction de notes, de classement, de totaux ou de recommandation.

---

## 2. Verdicts

| Réponse | Verdict | Constats de sévérité haute |
|---|---|---|
| Kong | **Fiable** (corrections à la marge) | Aucun |
| IBM | **Fiable** | Aucun |
| Google Cloud Apigee | **Fiable** (corrections mineures recommandées) | Aucun |
| Gravitee | **Fiable** | Aucun |
| WSO2 | **Fiable** (corrections mineures) | Aucun |
| Cohérence globale (rapport ↔ README ↔ référence) | **Cohérent sur le fond chiffré** | Aucun |

**Constat d'ensemble :** les cinq réponses sont jugées exceptionnellement honnêtes pour des soumissions — elles auto-signalent « à vérifier » la quasi-totalité des éléments sensibles au temps (régions, certifications par périmètre/version, capacités IA, prix) et tiennent des registres de risques transparents. **Aucune sur-évaluation matérielle** de capacité, de conformité ou de performance n'a été détectée.

---

## 3. Constats notables et traitement

Les écarts relevés sont **mineurs** et, fait notable, **plusieurs jouent contre le candidat** (sous-évaluation). Ils sont consignés ci-dessous comme **points à lever en PoC / diligence**, sans modification des réponses ni des notes (voir §5).

| # | Réponse | Sévérité | Constat | Traitement |
|---|---|---|---|---|
| 1 | Kong | Moyenne | La réponse marque la région canadienne « non confirmée ». En réalité, **Kong Dedicated Cloud Gateway** offre une région Canada (AWS Montréal `ca-central-1`) pour le plan de données géré — distincte des géos du plan de contrôle SaaS (sans Canada). Erreur **défavorable** à Kong (sous-évaluation de la souveraineté). | À clarifier en PoC-A ; sans incidence sur la note C2 (déjà prudente). |
| 2 | Google Cloud Apigee | Moyenne | **Model Armor** (garde-fous IA) est en *preview* publique (mi-2025), non GA confirmé à juin 2026 ; à ne pas coter comme capacité native acquise. **Protected B** est au niveau plateforme Google Cloud — l'inclusion d'Apigee dans le périmètre n'est pas établie. | Confirme la note C9 = 4 (capacité réelle mais à maturité à valider) et C2 = 2 (souveraineté faible) ; à lever en PoC-A/PoC-G. |
| 3 | Google Cloud Apigee | Moyenne | Résidence **du plan de contrôle au Canada** non confirmée (liste fermée de juridictions). Si absente, EC-01 (volet control plane) passe de partiel à non conforme — aggrave l'écart souveraineté déjà sanctionné (C2/C3 = 2). | Priorité absolue en PoC-A ; cohérent avec le rang 5 d'Apigee. |
| 4 | WSO2 | Moyenne | La réponse présente le masquage PII comme « par tiers hors Canada ». En réalité, WSO2 AI Gateway offre un **masquage PII natif (regex sur la gateway)**, résident au Canada en auto-hébergé. Erreur **défavorable** à WSO2 (sous-évaluation de souveraineté). | À valider en PoC-G ; sans incidence baissière sur les notes. |
| 5 | Plusieurs | Basse | Citations Gartner « 10e année consécutive » (IBM, Apigee) : exactes mais **non différenciantes** (plusieurs Leaders le revendiquent) ; à attribuer à la communication de l'éditeur, non présentées comme constat neutre. | Sans incidence sur la notation. |
| 6 | Kong / Gravitee / WSO2 | Basse | Quelques chiffres non sourcés (PII « 9 vs 12 langues », « 50+ politiques », « 75 pays de partenaires », fourchettes de prix) ; à sourcer ou à formuler en ordre de grandeur. | Déjà marqués indicatifs/« à vérifier » dans les réponses. |

> **Lecture du calibrage.** La majorité des constats de sévérité moyenne sont des **sous-évaluations** : les corriger ne ferait pas baisser les notes des candidats concernés. Aucun constat ne remet en cause le sens du classement.

---

## 4. Cohérence chiffrée (vérifiée)

Le vérificateur de cohérence confirme une concordance **cellule par cellule, sans une seule divergence**, entre le rapport consolidé, le README et les données de référence calculées par programme :

- tableau de classement identique partout : Gravitee **75,4** / Kong **73,0** / WSO2 **72,2** / IBM **71,0** / Apigee **61,6** ;
- matrice des 11 notes par critère reproduite à l'identique ; les 5 totaux recalculés par `Σ(note/5 × poids)` concordent ;
- écarts cités exacts (têtes en 4,4 pts ; Gravitee − Kong = 2,4 pts) ;
- scénarios de sensibilité reproductibles à l'arrondi près (re-normalisation des poids à 100) ;
- effet du calibrage (Gravitee C2 2→3 et C3 5→4) mathématiquement correct.

**Recommandation et finalistes identiques** entre le rapport et le README.

---

## 5. Incohérence documentaire détectée — corrigée

Le vérificateur de cohérence a relevé une **incohérence d'état** dans le README (sans incidence sur les notes) : le rapport consolidé et la méthodologie y étaient marqués *(à venir)* alors qu'ils existaient (artefact de génération parallèle). **Corrigé** : tous les marqueurs *(à venir)* périmés ont été retirés après ajout des deux pièces déterministes restantes (grille A1, matrice CSV) ; l'arborescence du README reflète désormais l'état réel et complet du dépôt.

---

## 6. Décision de traitement

Les réponses candidates **ne sont pas modifiées** au cas par cas : leurs notes sont verrouillées et la cohérence chiffrée docs ↔ notes est vérifiée parfaite (§4) ; éditer les réponses après notation la romprait. Les constats ci-dessus sont donc traités comme des **points de diligence à lever en preuve de concept (PoC)** — ce que les réponses elles-mêmes prévoient déjà via leurs mentions « à vérifier » et leurs registres de risques.

**Conclusion :** dossier **fiable**, classement **inchangé** et **robuste** à l'analyse de sensibilité ; aucune correction bloquante.

---

*Vérification conduite dans le cadre d'un exercice méthodologique — juin 2026 (à vérifier). Les réponses fournisseurs sont simulées et n'engagent pas les éditeurs.*
