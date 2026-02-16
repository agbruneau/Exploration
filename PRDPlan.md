# PRDPlan — Plan d'exécution pour le retrait de Microsoft HIS

> **Objectif :** Guider pas à pas la rédaction de l'étude d'opportunité de retrait de **Microsoft Host Integration Server (HIS)**, passerelle d'accès au Mainframe d'entreprise.
>
> **Documents :**
>
> | Document | Rôle |
> |----------|------|
> | [`PRD.md`](PRD.md) | Structure et gabarit de l'étude (sections à compléter) |
> | **[`ÉtudeFinalRetrait.md`](ÉtudeFinalRetrait.md)** | **Document final rédigé** — l'étude d'opportunité complète |
> | [`Etude Perplexcity.md`](Etude%20Perplexcity.md) | Étude source #1 — benchmark 6 alternatives, matrice décision, plan migration 26 mois, coûts EUR (22 réf.) |
> | [`Etude Gemini.md`](Etude%20Gemini.md) | Étude source #2 — analyse TI/SNA approfondie, matrice technique, TCO/ROI Forrester, subventions QC (106 réf.) |
> | [`Scenarios.md`](Scenarios.md) | Matrice des scénarios — 5 patterns HIS scorés (P1-P5), 15 scénarios concrets AS-IS/TO-BE, roadmap 3 vagues (0-36 mois), effort 260 pts Fibonacci, dépendances inter-scénarios |
>
> Chaque phase produit une section complète. Les phases sont séquentielles — la sortie de chaque phase alimente la suivante.
> À chaque fin de phase, le contenu validé est reporté dans `ÉtudeFinalRetrait.md`.
>
> **Méthode de rédaction :** Pour chaque phase, l'exécuteur doit :
> 1. Consulter les sections correspondantes des deux études sources (Perplexity + Gemini)
> 2. Consulter les scénarios applicables dans `Scenarios.md` (patterns P1-P5, scoring, architectures AS-IS/TO-BE)
> 3. Identifier les **convergences** (points sur lesquels les sources s'accordent → recommandations fortes)
> 4. Identifier les **divergences** (points de vue différents → analyser et arbitrer)
> 5. Exploiter les **données quantitatives** de Scenarios.md (scores, effort Fibonacci, volumétries, critères de succès)
> 6. Synthétiser dans `ÉtudeFinalRetrait.md` en citant les sources

---

## Phase 0 — Cadrage du retrait de Microsoft HIS

**But :** Confirmer le périmètre du retrait de HIS et établir le cadrage de l'étude.

### Technologie ciblée

| Attribut | Valeur |
|----------|--------|
| **Technologie** | Microsoft Host Integration Server (HIS) |
| **Éditeur** | Microsoft |
| **Rôle** | Passerelle de connectivité entre l'environnement Windows/.NET et le Mainframe IBM (z/OS) |
| **Protocoles / fonctions** | SNA/LU 6.2, TN3270/TN5250, DRDA (DB2), Transaction Integrator (CICS/IMS), Session Integrator, MQ Bridge, Data Integration |
| **Lifecycle** | HIS 2016 : support étendu → fin ~2027 · HIS 2020 : support standard → juillet 2028 |

### Entrées à compléter

L'exécuteur de ce plan doit fournir ou collecter les informations suivantes, spécifiques au déploiement HIS de l'organisation :

| # | Question | Réponse attendue | Section PRD alimentée |
|---|----------|------------------|-----------------------|
| Q-01 | Quelle(s) version(s) de HIS sont en exploitation ? (HIS 2016, HIS 2020, CU appliqués) | Version(s) et CU | §0 — Fiche d'identité |
| Q-02 | Depuis quand HIS est-il en service dans l'organisation ? | Année | §0 — Historique |
| Q-03 | Quelles fonctions HIS sont exploitées ? (TI pour CICS/IMS, DRDA pour DB2, TN3270, SNA LU 6.2, MQ Bridge, Data Integration) | Liste des fonctions | §0 — Protocoles |
| Q-04 | Quels processus métier dépendent du Mainframe via HIS ? | Liste | §0 — Processus métier |
| Q-05 | Quelle est la raison principale motivant le retrait ? (obsolescence, fin de support, coût des compétences SNA, inadéquation cloud-native) | Choix + précisions | §2.2 — Déclencheurs |
| Q-06 | Existe-t-il déjà une solution de remplacement pressentie ? | Oui (laquelle) / Non | §4.2 — Options |
| Q-07 | Quel est l'horizon de décision ? | Date cible | §8.3 — Jalons |
| Q-08 | Qui est le commanditaire (sponsor) de cette étude ? | Nom, rôle | En-tête PRD |
| Q-09 | Quelles parties prenantes doivent être consultées ? (équipe Mainframe, middleware, architectes, sécurité, exploitation) | Liste noms/rôles | Annexe E |

### Actions

1. Compléter le tableau ci-dessus avec les parties prenantes.
2. Reporter les réponses dans la **Fiche d'identité** (section 0 du `PRD.md`).
3. Créer le fichier `ÉtudeFinalRetrait.md` avec l'en-tête et la section 0 complétée.
4. Valider le périmètre avec le commanditaire avant de passer à la Phase 1.

### Critère de validation

> ✅ La fiche d'identité HIS est complétée, les fonctions HIS exploitées sont inventoriées, et le périmètre est validé par le sponsor. Le fichier `ÉtudeFinalRetrait.md` est initialisé.

---

## Phase 1 — Contexte et problématique HIS

**But :** Documenter l'état actuel de HIS et les raisons de son retrait → PRD §2 → `ÉtudeFinalRetrait.md` §2

> **Études sources à exploiter :**
> - Perplexity §1.1 (inventaire 5 domaines HIS), §1.2 (contraintes, dette technique), §1.3 (cycle de vie)
> - Gemini §1.1 (inventaire détaillé TI/SNA/DRDA), §1.2 (cartographie flux TI), §1.3 (contraintes EBCDIC/LU6.2), §1.4 (dette technique architecturale + code, risques capital humain)

### Actions

1. **Inventaire technique HIS** — Documenter l'installation actuelle :
   - Version(s) HIS, cumulative updates, serveurs Windows hébergeant HIS
   - Services HIS actifs (SNA Service, TN3270 Service, TI, Data Provider for DB2, Session Integrator)
   - Cartographier les dépendances :
     - **Amont :** applications .NET, services WCF, traitements batch Windows consommant HIS
     - **Aval :** CICS regions, IMS, DB2 subsystems, VTAM/NCP, MQ Queue Managers
   - Infrastructure réseau SNA (IP-DLC, DLC) ou TCP/IP
   - Positionnement dans l'architecture d'entreprise (couche d'intégration host)

2. **Analyse des déclencheurs** — Pour chaque déclencheur applicable :
   - Dates de fin de support Microsoft (HIS 2016 → ~2027, HIS 2020 → 2028, pas de successeur annoncé)
   - Obsolescence SNA : compétences rares, coût des spécialistes
   - Inadéquation avec l'architecture cible (cloud-native, API-first, event-driven)
   - Coûts chiffrés (licences HIS, Windows Server dédié, prestataires SNA)
   - Incidents récurrents liés à HIS (extraire du registre d'incidents)

3. **Enjeux stratégiques** — Relier le retrait de HIS à la modernisation de l'intégration Mainframe et à la feuille de route cloud/API

### Sources de données

- CMDB / référentiel d'architecture — entrées HIS, serveurs Windows gateway
- Microsoft Lifecycle : [HIS 2020](https://learn.microsoft.com/en-us/lifecycle/products/microsoft-host-integration-server-2020), [HIS 2016](https://learn.microsoft.com/en-us/lifecycle/products/microsoft-host-integration-server-2016)
- Contrats de licences Microsoft (HIS, Windows Server)
- Registre des incidents ITSM — filtrer sur HIS / connectivité Mainframe
- Schéma directeur SI / feuille de route technologique

### Critère de validation

> ✅ L'inventaire des services HIS actifs et des dépendances Mainframe est complet. Les déclencheurs sont factuellement documentés avec sources. Contenu reporté dans `ÉtudeFinalRetrait.md` §2.

---

## Phase 2 — Analyse des besoins de connectivité Mainframe

**But :** Formaliser ce que la solution de remplacement de HIS doit couvrir → PRD §3 → `ÉtudeFinalRetrait.md` §3

> **Études sources à exploiter :**
> - Perplexity §1.1 (tableau des 5 domaines : réseau, données, applicatif, messages, sécurité)
> - Gemini §1.1-1.2 (périmètre TI détaillé, flux de traitement proxy TI, dépendances CICS/IMS/DB2)
> - **Scenarios.md §1-§2** (taxonomie des 5 patterns P1-P5, caractéristiques techniques détaillées, volumétries par scénario, grille de scoring §1.2 — aligner les besoins BF-01 à BF-07 avec les patterns correspondants)

### Actions

1. **Besoins fonctionnels** (§3.1) — Pour chaque fonction HIS exploitée (Q-03) :
   - Accès transactionnel CICS/IMS (via TI) — volume transactionnel, criticité
   - Accès données DB2 z/OS (via DRDA) — datasets, fréquence, mode (lecture/écriture)
   - Émulation terminal 3270 — nombre d'utilisateurs, cas d'usage
   - Transfert fichiers host (VSAM, séquentiels) — volume, fréquence
   - Messaging MQ Bridge — si applicable
   - **Nouveaux besoins** non couverts par HIS : exposition API REST/gRPC, support event-driven
   - Prioriser avec MoSCoW

2. **Besoins non fonctionnels** (§3.2) :
   - Mesurer les baselines HIS actuelles (latence CICS, disponibilité passerelle, sessions concurrentes)
   - Définir les niveaux cibles (observabilité, sécurité TLS 1.3, multi-plateforme)

3. **Contraintes spécifiques** (§3.3) :
   - Protocoles obligatoires côté host (pas de modification des programmes CICS/IMS)
   - Conversion EBCDIC / COBOL copybooks
   - Coexistence HIS / nouvelle solution pendant la transition
   - Compétences Mainframe requises, fenêtre de transfert de connaissances HIS

### Critère de validation

> ✅ Les besoins de connectivité Mainframe sont revus avec l'équipe Mainframe et les consommateurs des services HIS. Contenu reporté dans `ÉtudeFinalRetrait.md` §3.

---

## Phase 3 — Analyse des solutions de remplacement de HIS

**But :** Évaluer les alternatives à HIS pour la connectivité Mainframe → PRD §4 → `ÉtudeFinalRetrait.md` §4

> **Études sources à exploiter :**
> - Perplexity §2.1-2.6 (6 alternatives détaillées) + §3 (matrice 7×6)
> - Gemini §2.1-2.2 (6 alternatives + OpenLegacy) + §3 (matrice technique 6×6)
> - **Scenarios.md §1.5, §2.5, §3.5, §4.5, §5.5** (stratégie de migration recommandée par pattern, technologies cibles par scénario : Azure Logic Apps CICS Connector, MuleSoft CTG, z/OS Connect EE, Kafka Connect MQ Source/Sink, Cobrix/NiFi, Azure Data Factory)
> - **Scenarios.md §4** (matrice de décision Rehost/Refactor/Rewrite/Coexist — chaque approche mappée aux patterns)
> - **Convergence clé :** Azure Logic Apps = successeur naturel HIS. Kafka = complément event-driven.
> - **Divergence à arbitrer :** Perplexity privilégie Azure Logic Apps seul ; Gemini propose aussi Boomi comme alternative forte si stratégie multi-SaaS.

### Actions

1. **Définir les critères d'évaluation** (§4.1) :
   - Critères spécifiques au remplacement de HIS : couverture fonctionnelle Mainframe, maturité, TCO, compatibilité cloud-native, observabilité, facilité de migration depuis HIS, exposition API moderne
   - Pondérer chaque critère (total = 100%)
   - Faire valider la pondération par le comité d'architecture

2. **Évaluer chaque option** (§4.2) — Options pré-identifiées :
   - **Option A — IBM z/OS Connect EE** : exposition API REST native depuis z/OS, suppression du gateway intermédiaire
   - **Option B — Gateway Mainframe tierce** (Software AG, Micro Focus, OpenLegacy, GT Software) : passerelle multi-protocoles
   - **Option C — Custom via IBM CTG + JDBC DB2** : connectivité directe CICS Transaction Gateway + JDBC
   - **Option D — Statu quo amélioré** (maintien HIS 2020) : baseline obligatoire
   - Pour chaque option : couverture des fonctions HIS utilisées, architecture d'intégration, forces/faiblesses

3. **Construire la matrice de comparaison** (§4.3) :
   - Scorer chaque option sur chaque critère (/5)
   - Calculer les scores pondérés
   - Identifier l'option recommandée préliminaire

### Sources de données

- Documentation IBM (z/OS Connect, CTG), éditeurs tiers
- Retours d'expérience : Gartner (Magic Quadrant Application Modernization), Forrester, témoignages pairs
- PoC ou benchmark si disponibles — **recommandation : PoC sur les transactions CICS les plus complexes**
- Web search pour l'état de l'art des solutions de connectivité Mainframe

### Critère de validation

> ✅ La matrice est complétée avec les 4 options, la pondération est validée par le comité d'architecture. Contenu reporté dans `ÉtudeFinalRetrait.md` §4.

---

## Phase 4 — Analyse d'impact du retrait de HIS

**But :** Mesurer les conséquences du remplacement de HIS sur l'écosystème → PRD §5 → `ÉtudeFinalRetrait.md` §5

> **Études sources à exploiter :**
> - Gemini §1.2 (cartographie dépendances, flux proxy TI complet), §1.4 (dette architecturale, couplage 2PC)
> - Gemini §4.2 (modernisation AS400→API REST), §4.3 (refactorisation TI→Saga/Outbox)

### Actions

1. **Impact architecture** (§5.1) :
   - Cartographier tous les systèmes consommant le Mainframe via HIS
   - Lister les flux à migrer : appels TI (CICS/IMS), accès DRDA (DB2), sessions TN3270, batch
   - Impact réseau : retrait potentiel de l'infrastructure SNA (VTAM, NCP, IP-DLC)
   - Vérifier la cohérence avec l'architecture cible (API-first, event-driven, cloud-native)

2. **Impact organisationnel** (§5.2) :
   - Équipes impactées : exploitation Windows (serveurs HIS), équipe Mainframe, développeurs .NET consommateurs
   - Montée en compétences sur la solution cible (profils HIS → profils API/cloud)
   - Impact sur les contrats Microsoft (licences HIS, Windows Server)

3. **Impact sécurité et conformité** (§5.3) :
   - Delta sécurité : authentification/chiffrement HIS vs solution cible
   - Auditabilité des accès Mainframe dans la nouvelle architecture
   - Conformité sectorielle (données transitant par la passerelle)

### Critère de validation

> ✅ Chaque application consommant HIS a un propriétaire confirmant l'impact. Le RSSI a validé l'analyse sécurité. Contenu reporté dans `ÉtudeFinalRetrait.md` §5.

---

## Phase 5 — Analyse coûts-bénéfices

**But :** Chiffrer l'investissement du remplacement de HIS et le retour attendu → PRD §6 → `ÉtudeFinalRetrait.md` §6

> **Études sources à exploiter :**
> - Perplexity §5.1 (coûts statu quo 140-240K€/an détaillés), §5.2 (TCO comparatif 5 ans), §5.3 (bénéfices qualitatifs)
> - Gemini §5.1 (TCO CapEx→OpEx, tarification vCore MuleSoft), §5.2 (ROI Forrester : Azure PaaS 228%, Boomi 347-410%), §5.3 (subventions Québec : ESSOR, PCAN, Offensive Tr@ns Num)

### Actions

1. **Estimer les coûts** (§6.1) — Horizon 0-3 ans :
   - Licences / abonnements de la solution cible (z/OS Connect, gateway tierce, etc.)
   - Infrastructure : nouveau middleware vs libération des serveurs Windows HIS
   - Migration : effort de reprise des configurations TI, mappings COBOL, tests de régression par flux
   - Formation : montée en compétences (profils HIS/SNA → profils API/cloud Mainframe)
   - Double exploitation HIS + nouvelle solution pendant la transition

2. **Quantifier les bénéfices** (§6.2) :
   - Économies : licences HIS, licences Windows Server dédiées, prestataires SNA
   - Gains : réduction des incidents de connectivité host, time-to-market des nouveaux flux Mainframe
   - Qualitatifs : observabilité, conformité cloud-native, réduction de la dette technique

3. **Calculer le ROI** (§6.3) :
   - ROI sur l'horizon défini, break-even, analyse de sensibilité

### Critère de validation

> ✅ Les estimations de coûts sont validées par la direction financière. Contenu reporté dans `ÉtudeFinalRetrait.md` §6.

---

## Phase 6 — Risques et transition de HIS

**But :** Anticiper les risques du retrait de HIS et planifier la migration → PRD §7 + §8 → `ÉtudeFinalRetrait.md` §7 + §8

> **Études sources à exploiter :**
> - Perplexity §6.1 (risques techniques : LU6.2, performance, MQ→Kafka), §6.2 (risques opérationnels), §6.3 (stratégie rollback 4 niveaux)
> - Perplexity §4.1-4.2 (Strangler Fig par vagues Agile, plan 4 phases 26 mois, priorités migration)
> - Gemini §6.1 (EBCDIC/COMP-3, latence APPC→TCP/IP), §6.2 (résistance au changement, spaghetti architecture)
> - Gemini §4.1-4.4 (ACL + Strangler Fig, refactorisation TI→Saga, migration MQ→Kafka, modernisation AS400)
> - **Scenarios.md §1.4, §2.4, §3.4, §4.4, §5.4** (risques par pattern avec probabilité/impact/mitigation), §4 (anti-patterns par approche), §5 (roadmap 3 vagues avec jalons Go/No-Go, critères de bascule Wave 1→Wave 2), §6 (dépendances inter-scénarios et prérequis bloquants)

### Actions

1. **Analyse de risques spécifiques à HIS** (§7) :
   - Perte de connectivité Mainframe lors de la bascule (criticité maximale)
   - Incompatibilité de conversion de données (EBCDIC, packed decimal, COBOL copybooks)
   - Perte de connaissances HIS/SNA avant fin de migration
   - Dépendances non documentées vers HIS découvertes tardivement
   - Indisponibilité des environnements Mainframe de test (LPAR)
   - Évaluer probabilité × impact, définir stratégie d'atténuation

2. **Stratégie de migration** (§8.1) :
   - **Recommandation : strangler fig pattern** — migrer flux par flux (par transaction CICS, dataset DB2, flux batch)
   - Exploiter la **roadmap 3 vagues de Scenarios.md §5** : Wave 1 (5 pilotes, 0-6 mois), Wave 2 (5 scénarios stratégiques, 6-18 mois), Wave 3 (5 scénarios complexes + décommissionnement, 18-36 mois)
   - Appliquer la **matrice de décision par approche** (Scenarios.md §4) pour chaque pattern : Rehost / Refactor / Rewrite / Coexist
   - Respecter les **anti-patterns** identifiés (Scenarios.md §4) : ne pas rehost d'apps couplées hardware, ne pas strangler sans décommissionner, etc.
   - Parallel run : nouveau connecteur et HIS en parallèle avec comparaison des résultats
   - Critères Go/No-Go Wave 1→Wave 2 (Scenarios.md §5) : ≥ 4 scénarios stables, ROI ≥ 70% prévisionnel
   - Intégrer le **diagramme de dépendances inter-scénarios** (Scenarios.md §6) dans le plan de transition

3. **Plan de décommissionnement de HIS** (§8.2) :
   - Exploiter le **plan en 4 phases** de Scenarios.md §5 Wave 3 (Phase A→D, M18-M36)
   - Désactivation séquentielle des services HIS (TI, DRDA, TN3270, SNA)
   - Retrait des serveurs Windows gateway, démantèlement infra SNA
   - Archivage des configurations HIS (TI definitions, SNA configs)
   - Résiliation des licences HIS et Windows Server associées

4. **Jalons** (§8.3) : reporter les jalons Wave 1 de Scenarios.md §5 (S2, S6, S16, S22, S24) et fixer les dates cibles Wave 2-3

### Critère de validation

> ✅ Le plan de transition a été revu en comité d'architecture. Chaque risque « élevé » a un responsable. Contenu reporté dans `ÉtudeFinalRetrait.md` §7 + §8.

---

## Phase 7 — Métriques, recommandation et finalisation

**But :** Conclure l'étude et finaliser `ÉtudeFinalRetrait.md` pour soumission au comité de décision → PRD §9 + §10 + Annexes

> **Études sources à exploiter :**
> - Perplexity §7.3 (7 KPIs cibles : taux migration, disponibilité ≥99.9%, latence ≤1.2x, TCO -30%)
> - Perplexity Annexe (recommandation : Azure Logic Apps + Kafka, 5 facteurs déterminants)
> - Gemini §7.2 (4 catégories KPIs : vélocité, qualité, performance, valeur financière)
> - Gemini Conclusion (recommandation GO, Azure Logic Apps ou Boomi selon stratégie)
> - **Scenarios.md** §1.5-§5.5 (critères de succès par pattern : latence P95 ≤ 500ms, disponibilité ≥ 99.95%, zéro perte de données, réduction coûts ≥ 30%, fenêtre batch réduite ≥ 20%), §7.B (critères de succès programme), §5 Wave 1 jalons Go/No-Go

### Actions

1. **Métriques de succès** (§9) :
   - KPIs spécifiques : latence CICS P95, disponibilité passerelle, incidents/mois, coût annuel, délai de mise en prod d'un flux Mainframe, nombre de flux exposés en API
   - Baseline HIS actuelle → cible post-migration

2. **Recommandation** (§10) :
   - Synthèse décisionnelle : option recommandée pour remplacer HIS, justification
   - Conditions de succès et prochaines étapes

3. **Résumé exécutif** (§1) — Rédiger en dernier :
   - Synthèse d'une page : HIS, raison du retrait, solution recommandée, ROI, risques clés

4. **Annexes** :
   - Glossaire (SNA, LU 6.2, APPC, TN3270, DRDA, TI, CICS, IMS, VTAM, EBCDIC, etc.)
   - Cartographies AS-IS (avec HIS) / TO-BE (avec solution cible) — **inclure les diagrammes des 15 scénarios de Scenarios.md**
   - Inventaire des flux Mainframe passant par HIS — **structurer selon les 5 patterns P1-P5**
   - Matrice de scoring consolidée (Scenarios.md §3) et estimation effort (§7.A — 260 pts Fibonacci)
   - Diagramme de dépendances inter-scénarios (Scenarios.md §6)
   - Références, parties prenantes

5. **Finalisation de `ÉtudeFinalRetrait.md`** :
   - Reporter toutes les sections validées dans le document final
   - Relecture croisée : cohérence, références à HIS correctes, affirmations sourcées
   - Vérifier que le document est auto-porteur (lisible sans PRD.md ni PRDPlan.md)

### Critère de validation

> ✅ Le fichier `ÉtudeFinalRetrait.md` est complet, relu par un pair, validé par le commanditaire, et prêt pour présentation au comité de décision.

---

## Résumé du séquencement

```
Phase 0 ─── Cadrage du retrait de HIS
    │        (inventaire fonctions HIS, cadrage, validation sponsor)
    │        → PRD.md §0 + initialisation ÉtudeFinalRetrait.md
    ▼
Phase 1 ─── Contexte et problématique HIS      → PRD §2 → ÉtudeFinalRetrait.md §2
    ▼
Phase 2 ─── Besoins connectivité Mainframe     → PRD §3 → ÉtudeFinalRetrait.md §3
    ▼
Phase 3 ─── Solutions de remplacement HIS      → PRD §4 → ÉtudeFinalRetrait.md §4
    ▼
Phase 4 ─── Analyse d'impact retrait HIS       → PRD §5 → ÉtudeFinalRetrait.md §5
    ▼
Phase 5 ─── Coûts-bénéfices                    → PRD §6 → ÉtudeFinalRetrait.md §6
    ▼
Phase 6 ─── Risques et transition HIS          → PRD §7+§8 → ÉtudeFinalRetrait.md §7+§8
    ▼
Phase 7 ─── Finalisation ÉtudeFinalRetrait.md  → PRD §1+§9+§10+Annexes → Document final
```

> **Note :** À chaque fin de phase, valider le critère avant de passer à la suivante. Le contenu validé est reporté dans `ÉtudeFinalRetrait.md`. Les retours en arrière sont possibles mais doivent être tracés.
