# Installation du skill `analyse-theologique-reformee`

## Contexte et contrainte architecturale

Le répertoire `/mnt/.claude/skills/` exposé à l'agent Cowork est un **montage FUSE en lecture seule** (géré par le composant `skills-plugin`). L'agent ne peut donc pas écrire directement dans l'inventaire des skills — ce verrouillage est intentionnel (sécurité : empêcher un agent d'installer silencieusement du code exécutable actif dans sa propre session).

L'installation doit se faire **côté utilisateur**, sur le poste Windows hôte. Trois méthodes, de la plus simple à la plus robuste.

## Inventaire des livrables

Ce dossier `skills-a-installer/` contient :

- `analyse-theologique-reformee.skill` — Archive zip portable (format d'installation officiel Cowork).
- `analyse-theologique-reformee/` — Dossier décompressé équivalent, contenant `SKILL.md`. Prêt à copier tel quel.
- `INSTALL.md` — Ce fichier.

**Note** : il n'y a qu'un seul skill à installer. Les items déconnectés mentionnés dans les logs de session (`mcp__plugin_pdf-viewer_*`, `mcp__plugin_product-management_*`) sont des **serveurs MCP** temporairement indisponibles, pas des skills — ils se reconnecteront automatiquement.

## Méthode 1 — Installation par le fichier `.skill` (recommandée)

1. Ouvrir l'explorateur Windows à l'emplacement du dossier Exploration :
   `C:\Users\agbru\OneDrive\Documents\GitHub\Exploration\skills-a-installer\`
2. Double-cliquer sur `analyse-theologique-reformee.skill`.
3. Cowork intercepte l'association de fichier et propose l'installation — confirmer.
4. Redémarrer la session Claude (ou ouvrir une nouvelle conversation) pour que le skill apparaisse dans `available_skills`.

Si le double-clic n'associe rien (cas possible si l'association MIME `.skill` n'est pas enregistrée), passer à la méthode 2.

## Méthode 2 — Glisser-déposer dans l'interface Cowork

1. Ouvrir la fenêtre de gestion des skills dans l'application Claude Desktop (menu → Extensions/Skills).
2. Faire glisser `analyse-theologique-reformee.skill` depuis l'explorateur vers la zone de dépôt.
3. Confirmer l'installation dans le dialogue qui s'affiche.

## Méthode 3 — Copie manuelle du dossier décompressé (fallback)

À utiliser si les méthodes 1 et 2 échouent (fréquent en cas de version ancienne de Cowork ou de droits restreints).

1. Repérer le dossier utilisateur des skills sur votre poste. Chemins typiques Windows :
   - `C:\Users\agbru\.claude\skills\` (installation Claude Code)
   - `C:\Users\agbru\AppData\Roaming\Claude\skills\` (Claude Desktop)
   - `C:\Users\agbru\AppData\Local\Packages\Claude_pzs8sxrjxfjjc\LocalCache\Roaming\Claude\skills\` (Claude Store, Windows 11)
2. Copier le dossier complet `analyse-theologique-reformee/` (contenant `SKILL.md`) vers le répertoire cible.
3. Vérifier l'arborescence finale :
   ```
   <répertoire des skills>/
     analyse-theologique-reformee/
       SKILL.md
   ```
4. Redémarrer Claude Desktop complètement (quitter via la barre système, pas juste fermer la fenêtre).

## Vérification post-installation

Après redémarrage, ouvrir une nouvelle conversation et tester avec l'un de ces prompts :

- « Fais une analyse O.I.A. de Romains 8.28 »
- « Exégèse réformée de Éphésiens 2.8-9 »
- « Que dit Sproul sur l'élection en Romains 9 ? »

Si le skill se déclenche, la réponse suit le gabarit : 🏛️ THÈSE → 🔍 OBSERVATION → 📖 INTERPRÉTATION → 🛡️ APPLICATION.

Dans la liste `available_skills` des sessions futures, l'entrée doit apparaître sous la forme :
```
- analyse-theologique-reformee: Analyse théologique réformée rigoureuse via la méthode O.I.A. ...
```

## Dépannage

**Le skill n'apparaît pas dans `available_skills`** :
- Vérifier que `SKILL.md` est bien à la racine du dossier `analyse-theologique-reformee/` (pas dans un sous-dossier).
- Vérifier que le frontmatter YAML du `SKILL.md` commence et se termine par `---` sur des lignes dédiées.
- Consulter le log Claude Desktop (généralement `%APPDATA%\Claude\logs\`) — une erreur de validation de schéma y sera mentionnée.

**Le skill apparaît mais ne se déclenche pas** :
- Le champ `description` est le mécanisme de déclenchement. Reformuler la requête en incluant un mot-clé fort du champ description (« exégèse », « O.I.A. », « Sproul », « théologie réformée »).
- Le skill-creator fournit un optimiseur de description (`run_loop.py`) à relancer si nécessaire.

**Erreur de validation lors du double-clic sur `.skill`** :
- Le fichier peut être bloqué par le SmartScreen Windows. Clic droit → Propriétés → Débloquer → OK, puis réessayer.
