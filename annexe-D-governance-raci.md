---
title: "Governance RACI Agentique"
annexe: "D"
status: "rédigé"
length_target_words: 1500
reading_time_min: 6
last_updated: "2026-05-05"
---

> **Annexe D — Governance RACI agentique**
> **Artefact opérationnel · ~1 500 mots · lecture ≈ 6 min**

La matrice RACI présentée ici est l'artefact de gouvernance qui traduit les exigences du [Ch. 8](ch08-trustworthy-systems.md) et les rôles organisationnels du [Ch. 11](ch11-redesigning-work.md) en responsabilités nominatives par activité. Elle répond à la question que l'architecture technique ne peut pas résoudre seule : qui décide, qui exécute, qui valide, qui est informé — pour chaque acte de gouvernance d'un agent en production. Sans cette précision, les questions critiques (qui autorise le *kill switch*, qui signe l'inventaire OSFI E-23, qui traite l'escalade Loi 25) restent flottantes jusqu'à ce qu'une crise les rende urgentes.

Ce document s'adresse aux architectes d'entreprise, aux *AI ops managers*, aux responsables conformité et aux responsables de la sécurité qui mettent en place ou révisent un programme de gouvernance agentique. Il est conçu pour être adapté à l'organisation cible : les neuf rôles colonnes correspondent aux fonctions distinctes les plus courantes dans une organisation de taille intermédiaire à grande ; les douze activités lignes couvrent le cycle de vie complet d'un agent, de la qualification du cas d'usage à la formation continue des équipes. L'Annexe A ([Architecture Review Checklist](annexe-A-architecture-review.md)) et l'Annexe C ([AgentOps Maturity Model](annexe-C-agentops-maturity.md)) alimentent plusieurs de ces activités avec leurs propres artefacts.

---

## Matrice RACI

**Légende.** R = Responsable (exécute) · A = Approbateur (rend compte, signe) · C = Consulté (apporte un avis avant la décision) · I = Informé (reçoit le résultat). Chaque ligne comporte exactement un A.

**Abréviations de colonnes.** CIO = Chief Information Officer · AE = Architecte d'entreprise · AIOM = *AI ops manager* (Ch. 11) · QS = *Quality steward* (Ch. 11) · HAID = *Human-AI interaction designer* (Ch. 11) · PO = Product owner · RO/DPO = Risk officer / Délégué à la protection des données personnelles (Loi 25) · SEC = Sécurité (RSSI ou équipe sécurité) · AUD = Audit interne.

| Activité | CIO | AE | AIOM | QS | HAID | PO | RO/DPO | SEC | AUD |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **1. Qualification du cas d'usage** (matrice autonomie × réversibilité × tolérance-erreur, Ch. 3) | A | R | C | C | C | R | C | I | I |
| **2. Conception de l'architecture agentique** (niveaux N1–N4, *agent policy*, flux HITL, Ch. 8 §8.1–8.2) | I | A | C | C | R | C | C | C | I |
| **3. Décision build/buy/borrow** (évaluation ROI, portabilité, Ch. 4 §4.4, Ch. 10) | A | R | C | I | I | R | C | I | I |
| **4. Déploiement en production** (instrumentation OTel, gates HITL, *permission boundaries*, Ch. 7) | I | C | R | C | C | I | I | C | I |
| **5. Observabilité et plan de contrôle** (*dashboards*, *retry budgets*, alertes dérive, Ch. 7 §7.2) | I | I | A | R | I | I | I | C | I |
| **6. Évaluation continue en production** (*task success*, *tool correctness*, *policy compliance*, Ch. 7 §7.3) | I | I | C | A | I | C | I | I | C |
| **7. Activation du *kill switch*** (arrêt d'urgence d'un agent ou d'une flotte d'agents) | C | I | R | C | I | I | C | C | I |
| **8. Audit de la gouvernance agentique** (journaux de décision, *agent policy*, Ch. 8 §8.3–8.4) | I | C | C | I | I | I | C | C | A |
| **9. Traitement des incidents** (actions hors périmètre, violations de politique, escalades non résolues) | I | C | R | C | I | I | C | C | I |
| **10. Conformité réglementaire** (EU AI Act, OSFI E-23 inventaire, Loi 25 Art. 12.1, ISO/IEC 42001, Ch. 8 §8.4) | C | C | C | I | I | I | A | C | C |
| **11. Évolution du niveau d'autonomie** (passage N1→N2→N3→N4 ou rétrogradation, *agent policy* versionnée) | C | R | C | C | I | C | C | C | I |
| **12. Formation continue des équipes** (nouveaux rôles, pratiques HITL, mises à jour réglementaires) | A | I | C | C | C | I | C | I | I |

---

## Notes d'application

**Le A reste humain, quel que soit le niveau d'autonomie de l'agent.** Le modèle RACI est construit sur le principe que l'approbation (*Accountability*) n'est jamais déléguée à un agent, même en N4 (*Autonome*). Un agent N4 exécute sans gate préalable dans son périmètre, mais la responsabilité de définir ce périmètre, de le versionner et de le signer reste nominativement humaine. Cette règle n'est pas une contrainte légale spécifique — c'est la condition structurelle sans laquelle la gouvernance devient fictive : si l'agent peut lui-même approuver ses propres périmètres d'action, le A de la *agent policy* n'a plus de contenu. L'[Annexe A](annexe-A-architecture-review.md) inclut cette vérification dans sa checklist de revue d'architecture.

**Loi 25 Art. 12.1 — risque de *compliance washing*.** L'activité 10 (Conformité réglementaire) assigne le A au RO/DPO, qui est la personne légalement responsable de la satisfaction de l'Art. 12.1 de la Loi modernisant des dispositions législatives en matière de protection des renseignements personnels (Québec, LQ 2021, c 25). L'obligation est claire : pour toute décision prise exclusivement par traitement automatisé produisant des effets significatifs sur une personne, l'organisation doit informer l'intéressé, lui expliquer la logique employée, et lui permettre de demander une révision par une personne physique. L'anti-patron est de positionner un humain nominal dans la boucle — un approbateur qui valide des centaines de décisions par heure sans examen réel — pour cocher la case légale sans satisfaire l'obligation. Ce *compliance washing* est identifiable par le taux de refus humain sur les escalades : si ce taux est inférieur à 1 % sur un volume élevé, l'humain n'est pas effectif. Le RO/DPO qui signe l'activité 10 a la responsabilité de mesurer et de documenter ce taux — pas seulement de désigner un approbateur nominal. Ce point est développé au [Ch. 8 §8.2](ch08-trustworthy-systems.md).

**OSFI E-23 — inventaire AI/ML par l'*AI ops manager*.** La Ligne directrice E-23 du Bureau du surintendant des institutions financières (en vigueur 1ᵉʳ mai 2027) exige des institutions financières fédérales canadiennes un inventaire de tous les modèles AI/ML à risque non négligeable, avec les métadonnées obligatoires : identifiant, propriétaire, version, date de déploiement, cote de risque, usages approuvés, limitations, dépendances, modèles et données tiers (Ligne directrice B-10). Dans la matrice ci-dessus, l'*AI ops manager* est le rôle R de l'activité 10 pour la production et la tenue à jour de cet inventaire — il détient la connaissance opérationnelle de l'état exact de chaque agent en production. Le RO/DPO (A sur l'activité 10) valide que l'inventaire est complet, à jour et conforme aux métadonnées exigées par E-23 avant soumission au régulateur. L'audit interne (C sur l'activité 10) vérifie indépendamment la complétude de l'inventaire lors de ses cycles annuels. Cette tripartition R/A/C prévient le scénario où l'inventaire est délégué entièrement à la conformité sans que l'opérationnel n'y contribue — ce qui produit des inventaires exacts sur la forme mais obsolètes sur le contenu.

---

## Mode d'emploi

**Étape 1 — Identifier les rôles dans l'organisation cible.** Mapper les neuf colonnes de la matrice aux fonctions existantes. Dans une organisation sans *AI ops manager* formellement créé, le rôle est typiquement absorbé par le responsable des opérations IT ou l'équipe SRE ; sans *quality steward*, par l'assurance qualité ou l'équipe data. Les colonnes sans titulaire identifié sont des lacunes de gouvernance à combler avant déploiement à l'échelle — l'[Annexe C](annexe-C-agentops-maturity.md) fournit les critères de maturité pour évaluer si les rôles sont suffisamment définis.

**Étape 2 — Adapter les activités au contexte.** Les douze lignes couvrent le cycle de vie complet, mais toutes ne sont pas pertinentes à chaque déploiement. Un agent N1 (assistance, lecture seule) n'expose pas le même profil que N4 (autonome, écriture libre) : supprimer les lignes hors périmètre ou les marquer comme non applicables. Ne pas supprimer les activités 7 (*kill switch*), 9 (traitement des incidents) et 10 (conformité) — elles s'appliquent à tout agent en production, quelle que soit son autonomie.

**Étape 3 — Valider avec chaque titulaire de A.** Chaque approbateur de la matrice doit explicitement accepter sa responsabilité avant le déploiement. Un A non validé est un A fictif. Pour les activités à fort enjeu réglementaire (10, conformité) et opérationnel (7, *kill switch*), obtenir une validation écrite — courriel ou document signé — qui vaut engagement organisationnel, pas simple connaissance du rôle.

**Étape 4 — Versionner la matrice avec la *agent policy*.** La matrice RACI est un artefact de gouvernance soumis au même régime de versionnement que la *agent policy* ([Ch. 8 §8.2](ch08-trustworthy-systems.md)). Toute modification des rôles ou des responsabilités déclenche une mise à jour versionnée, horodatée, avec l'identité des validateurs. Cette exigence n'est pas bureaucratique : elle est la condition pour qu'un auditeur puisse reconstituer qui était responsable de quoi au moment d'un incident.

**Étape 5 — Réviser à chaque cycle AIMS PDCA.** La révision annuelle imposée par ISO/IEC 42001 (phase *Check*) est le moment naturel de révision de la matrice RACI. Vérifier : les rôles ont-ils changé, les activités sont-elles encore pertinentes, les titulaires de A ont-ils les moyens effectifs d'exercer leur responsabilité ? Une matrice RACI non révisée depuis plus de 12 mois dans un environnement agentique actif est probablement déjà décalée par rapport à la réalité opérationnelle.

---

## Renvois croisés

- [Ch. 8 — Bâtir des systèmes dignes de confiance](ch08-trustworthy-systems.md) : fondements de la *agent policy*, niveaux d'autonomie N1–N4, HITL opérationnel, auditabilité, corpus réglementaire. La matrice RACI opérationnalise les exigences de ce chapitre en assignant des responsabilités nominatives.
- [Ch. 11 — Redesigning Work, Not Augmenting It](ch11-redesigning-work.md) : définition des rôles *AI ops manager*, *quality steward*, *human-AI interaction designer*. Les colonnes AIOM, QS et HAID de la matrice correspondent directement aux rôles définis en §11.2.
- [Annexe A — Architecture Review Checklist](annexe-A-architecture-review.md) : checklist de revue d'architecture qui précède le déploiement (activité 4) et vérifie que les conditions de gouvernance sont satisfaites avant mise en production.
- [Annexe C — AgentOps Maturity Model](annexe-C-agentops-maturity.md) : les cinq niveaux de maturité AgentOps fournissent les critères d'évaluation de la capacité organisationnelle à exercer les responsabilités R de la matrice — notamment les activités 5 (observabilité), 6 (évaluation continue) et 9 (traitement des incidents).
