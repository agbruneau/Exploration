---
title: "Annexe C — AgentOps Maturity Model"
annexe: "C"
status: "rédigé"
length_target_words: 1500
reading_time_min: 6
last_updated: "2026-05-05"
---

> **Annexe C · AgentOps Maturity Model · ~1 500 mots · lecture ≈ 6 min**

## Cadrage

Ce modèle de maturité permet à une équipe ou à une organisation d'évaluer sa capacité opérationnelle réelle à exploiter des agents en production — non pas sa capacité à en déployer, mais à les opérer de façon contrôlée, résiliente et économiquement viable. Il repose sur les quatre composantes AgentOps définies au [glossaire](glossaire.md) et développées en profondeur au [Ch. 7](ch07-agentops.md) : (1) observabilité multi-étapes, (2) évaluation continue, (3) cycle de vie de l'artefact composite, (4) plan de contrôle.

L'auto-évaluation est conduite par l'architecte de solution ou le directeur de programme responsable du portefeuille agentique, idéalement en début de programme (base de référence) et à chaque montée en charge significative (nouveau périmètre, nouveau cas d'usage, ou incident en production). Le résultat n'est pas un score unique — c'est un profil par composante, dont les déséquilibres sont plus informatifs que la moyenne.

---

## Les 5 niveaux de maturité AgentOps

### N1 — Ad hoc : déploiement sans infrastructure opérationnelle

**Caractéristiques observables**

1. Aucune instrumentation de spans : les seules traces disponibles sont les logs applicatifs bruts ou les sorties finales de l'agent.
2. Évaluations ponctuelles ou absentes : les tests sont exécutés manuellement avant le déploiement initial et ne se répètent pas.
3. Versionnage partiel ou inexistant : le prompt système est versionné dans le dépôt ; les outils, la configuration mémoire et les permissions ne le sont pas.
4. Aucun plan de contrôle formalisé : pas de *retry budget*, pas de *rate limit*, pas de *kill switch* connu de l'équipe.
5. Coûts mesurés en tokens uniquement : le CPST (*Cost per Successful Task*) n'est pas calculé.

**Anti-patrons typiques de ce niveau**

L'équipe sait que l'agent opère parce qu'il produit des sorties visibles — e-mails envoyés, enregistrements créés. Elle ne sait pas comment il y arrive. Un changement de comportement n'est détecté que par un utilisateur final qui signale un problème. L'incident Replit de juillet 2025 — 1 206 enregistrements supprimés malgré une instruction de gel explicite — est l'illustration documentée de ce niveau (*confirmé* — Fortune, 23 juillet 2025 ; [Ch. 7 §7.8](ch07-agentops.md)).

**Critères de bascule vers N2**

- Au moins les *tool spans* sont instrumentés et stockés de façon interrogeable.
- Un artefact composite est défini comme unité versionnée (même si le pipeline de déploiement n'en dépend pas encore).

**Renvoi Ch. 7** : §7.1 (delta AgentOps vs MLOps), §7.8 (anti-patrons).

---

### N2 — Reproductible : observabilité de base et versionnage atomique

**Caractéristiques observables**

1. *Tool spans* et *LLM spans* instrumentés et centralisés dans une plateforme (Arize Phoenix, Langfuse, Datadog LLM Observability ou équivalent).
2. Artefact composite versionné comme unité atomique : tuple (prompt système, outils avec versions, configuration mémoire, périmètres de permission, seuils d'escalade) — un changement sur l'un des cinq éléments produit une nouvelle version.
3. *Retry budget* configuré sur les outils critiques (pas nécessairement sur tous les agents).
4. *Task success rate* mesuré sur les sessions récentes, même sans gate CI/CD automatisé.
5. *Kill switch* défini et documenté — pas nécessairement automatisé, mais l'équipe sait comment arrêter un agent en production.

**Anti-patrons typiques de ce niveau**

Les métriques existent mais ne déclenchent rien. Le dashboard montre que le *retry rate* dépasse le P95 ; personne n'a défini le seuil qui déclenche une action. Les évaluations sont lancées manuellement avant les déploiements majeurs mais pas à chaque *pull request*. Les *memory spans* et *orchestration spans* ne sont pas instrumentés — la dérive mémoire est invisible.

**Critères de bascule vers N3**

- Les quatre catégories de spans sont instrumentées (*LLM spans*, *tool spans*, *memory spans*, *orchestration spans*).
- Un CI/CD gate bloque le merge si le *task success rate* descend sous un seuil défini.

**Renvoi Ch. 7** : §7.2 (quatre catégories de spans), §7.3 (plateformes), §7.7 (versionnage de l'artefact composite).

---

### N3 — Instrumenté : quatre spans actifs et gate CI/CD

**Caractéristiques observables**

1. Les quatre catégories de spans sont opérationnelles et interrogeables : *LLM spans*, *tool spans*, *memory spans*, *orchestration spans*.
2. CI/CD gate actif sur *task success rate* — chaque *pull request* déclenche une évaluation sur le dataset canonique ; un score dégradé bloque le merge.
3. Dashboard opérationnel temps réel (métriques court terme : *retry rate*, taux d'erreur par outil, latence P50/P95/P99) distinct du dashboard qualité asynchrone (fenêtres 24h et 7 jours).
4. *Permission boundaries* déclarées explicitement pour chaque agent — liste des outils disponibles, périmètre de données, séparation dev/prod.
5. Les cinq métriques canoniques sont mesurées depuis leurs spans respectifs : *task success*, *tool correctness*, *retry budget*, *escalation quality*, *policy compliance* ([Ch. 7 §7.4](ch07-agentops.md)).

**Anti-patrons typiques de ce niveau**

Le *task success rate* est mesuré sur 3 à 5 tours de conversation — précisément la fenêtre qui ne détecte pas la dérive longitudinale. Les évaluations courtes sont suffisantes pour un déploiement initial, mais aveuglent sur la dégradation qui commence typiquement après 50+ interactions ([Ch. 12 §12.2](ch12-lessons-failed.md)). Le *shadow run* n'est pas budgété : l'équipe veut valider les nouvelles versions avant promotion mais supprime l'étape faute de provision FinOps.

**Critères de bascule vers N4**

- Le *replay* déterministe sur *golden files* est opérationnel (scénarios issus de traces de production annotées).
- Les *shadow runs* sont budgétés et exécutés sur au moins une promotion par trimestre.
- La règle de dérive comportementale est active : alerte si le *task success rate* baisse de X % sur 7 jours glissants (pas seulement les alertes de seuil aigu).

**Renvoi Ch. 7** : §7.4 (cinq métriques), §7.5 (régression continue, replay, shadow runs).

---

### N4 — Évalué : évaluation longitudinale et plan de contrôle actif

**Caractéristiques observables**

1. *Replay* déterministe sur corpus de *golden files* maintenu à jour : tout changement d'outil s'accompagne d'une mise à jour du corpus.
2. *Shadow runs* systématiques pour chaque promotion vers la production — budget d'inférence provisionné explicitement.
3. Règle de dérive comportementale active : détection des dégradations lentes (pas seulement des pics aigus) sur des fenêtres glissantes de 7 jours minimum.
4. Plan de contrôle complet et appliqué : *permission boundaries*, *rate limits* sur tous les outils exposés, *retry budgets* par agent et par session, *kill switch* automatisé (arrêt en < 2 minutes sans cycle de déploiement).
5. Boucle de feedback production → dataset opérationnelle : les traces sous le seuil alimentent automatiquement le dataset de tests de développement.

**Anti-patrons typiques de ce niveau**

Le *kill switch* existe mais n'est pas testé régulièrement — il est découvert défaillant lors de l'incident qui devait le déclencher. La gouvernance des *golden files* est informelle : un ingénieur maintient le corpus sans processus documenté ; lors de son départ, le corpus se périme sans que l'équipe s'en aperçoive pendant plusieurs semaines. Les agents sont promus via le pipeline CI/CD sans critères formels de promotion (*task success rate* ≥ version précédente ± marge de bruit statistique, *retry rate* ≤ seuil, zéro violation *policy compliance*).

**Critères de bascule vers N5**

- La promotion vers la production est entièrement automatisée sur critères formels (pas de validation manuelle dans la boucle critique).
- Le *kill switch* est testé en production sur une cadence formalisée (mensuel ou à chaque déploiement majeur).
- Les données de coût (CPST complet incluant l'*infrastructure tax*) informent les décisions de portefeuille agentique.

**Renvoi Ch. 7** : §7.5 (évaluation en production), §7.6 (plan de contrôle), §7.7 (promote/deprecate/roll back).

---

### N5 — Optimisé : cycle de vie automatisé et gouvernance de portefeuille

**Caractéristiques observables**

1. Promotion automatisée sur critères formels : canary → production sans validation manuelle, avec auto-revert si le taux d'erreur dépasse le seuil dans la fenêtre post-déploiement.
2. *Kill switch* testé à cadence formalisée ; auto-revert déclenché automatiquement en cas d'incident de *policy compliance* répété.
3. CPST complet (inférence + orchestration + outils + *retries* + escalade + *infrastructure tax*) calculé par agent, intégré aux décisions de portefeuille (*kill/pivot/scale* — [Ch. 12 §12.7](ch12-lessons-failed.md)).
4. Sunset (*deprecate*) des agents géré comme une API : délai d'annonce aux consommateurs (y compris aux agents consommateurs dans les systèmes multi-agents), archivage de la version retirée comme cible de rollback d'urgence pendant une période définie.
5. Le modèle de maturité lui-même est réévalué : les seuils des cinq métriques canoniques sont recalibrés sur les données de production réelles, pas sur les estimations initiales.

**Anti-patrons typiques de ce niveau**

Le risque de ce niveau est l'automatisation sans supervision humaine sur les décisions à fort impact. Un auto-revert sur un incident de sécurité est correct ; un auto-revert sur une fausse alarme statistique pendant un pic de trafic légitime génère une interruption de service injustifiée. La règle de gouvernance : les décisions automatisées sont bornées aux actions réversibles ; les actions irréversibles (suppression de données, transactions financières, communications externes) maintiennent un HITL (*human-in-the-loop*) même à N5.

**Renvoi Ch. 7** : §7.7, §7.9 (recommandation et question d'auto-évaluation en 5 minutes).

---

## Tableau synthétique — 5 niveaux × 4 composantes AgentOps

| Niveau | Observabilité multi-étapes | Évaluation continue | Cycle de vie artefact composite | Plan de contrôle |
|---|---|---|---|---|
| **N1 Ad hoc** | Logs bruts ou sorties finales seulement | Absente ou ponctuelle manuelle | Prompt versionné, outils non | Aucun (*retry budget*, *kill switch* inexistants) |
| **N2 Reproductible** | *Tool spans* + *LLM spans* centralisés | Manuelle pré-déploiement | Artefact composite défini comme unité atomique | *Retry budget* sur outils critiques ; *kill switch* documenté non automatisé |
| **N3 Instrumenté** | 4 catégories de spans actives | CI/CD gate sur *task success* ; datasets canoniques | Pipeline de déploiement fondé sur l'artefact versionné | *Permission boundaries* + *rate limits* + seuils actifs |
| **N4 Évalué** | Dérive comportementale détectée (fenêtres glissantes) | *Replay* déterministe + *shadow runs* budgétés ; boucle feedback production | Promote/deprecate/roll back formalisés | Plan de contrôle complet ; *kill switch* automatisé |
| **N5 Optimisé** | Alerting multicouche : seuil aigu + dérive lente + anomalie statistique | Seuils recalibrés sur données réelles ; évaluation longitudinale | Auto-revert sur critères ; sunset comme API | CPST complet intégré aux décisions de portefeuille |

---

## Mode d'emploi

**Étape 1 — Auto-évaluation par composante.** Pour chacune des quatre composantes (observabilité, évaluation, cycle de vie, plan de contrôle), identifier le niveau le plus élevé dont *toutes* les caractéristiques observables sont satisfaites. Ne pas moyenner : un profil N3/N2/N4/N1 est plus informatif qu'un « N2,5 moyen ». Cette évaluation prend 30 à 45 minutes avec les responsables techniques et opérationnels du programme.

**Étape 2 — Identifier le goulot.** La composante au niveau le plus bas détermine le risque opérationnel réel. Un plan de contrôle à N1 avec une observabilité à N4 reste un programme à risque critique : on voit le problème sans pouvoir l'arrêter. Prioriser la montée en niveau de la composante la plus basse avant d'investir dans les composantes avancées.

**Étape 3 — Définir les critères de bascule au niveau suivant.** Pour la composante goulot, les critères de bascule listés ci-dessus sont les critères de succès du prochain cycle de travail. Les transformer en *user stories* ou en tâches d'infrastructure avec un responsable nommé et une date.

**Étape 4 — Intégrer les signaux faibles.** Les 12 signaux d'alerte précoce de la checklist [Ch. 12 §12.6](ch12-lessons-failed.md) sont les indicateurs opérationnels de régression de maturité — un programme à N3 qui accumule trois signaux de la famille technique est en régression vers N2. Relier les signaux au profil de maturité dans les revues de programme.

**Étape 5 — Fréquence de réévaluation.** Base de référence en début de programme. Réévaluation à chaque montée en charge significative (nouveau périmètre, nouveau cas d'usage, incident en production, ou doublement du volume de sessions actives). Pour les programmes en scale actif : réévaluation trimestrielle. La stabilité du profil sur deux cycles consécutifs est le signal que la maturité est effectivement ancrée — pas que l'auto-évaluation s'est dégradée.

---

## Renvois croisés

- [Ch. 7 — AgentOps : opérer des agents longue durée](ch07-agentops.md) — source de toutes les définitions opérationnelles des quatre composantes et des cinq métriques canoniques ; §7.9 formule la question d'auto-évaluation à 5 minutes.
- [Ch. 12 — Leçons tirées des 60 % ayant échoué](ch12-lessons-failed.md) — §12.6 (checklist des 12 signaux faibles), §12.7 (critères *kill/pivot/scale*) ; les niveaux N1 et N2 correspondent aux profils de programmes en trajectoire d'échec documentés dans ce chapitre.
- [Annexe A — Architecture Review Checklist](annexe-A-architecture-review.md) — la checklist d'architecture AgentOps couvrant sécurité, observabilité et FinOps ; à utiliser en complément du modèle de maturité pour qualifier un déploiement spécifique.
