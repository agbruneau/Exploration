---
name: announcement-script
description: Write a 60-90 second spoken announcement script for Sunday morning. Conversational, prioritized, max 3-4 items. Reformed Baptist assembly context.
---

# Script d'annonces du dimanche

**Dire ce qui importe en 90 secondes ou moins.** Sans distraire de l'exposition de la Parole qui suit.

**Requiert :** skill `pastor-foundation`

---

## Ce que ce skill accomplit

La plupart des annonces dominicales sont fastidieuses parce qu'elles tentent de tout couvrir. Ce skill fait l'inverse. Il impose une priorisation sans concession, puis écrit un script parlé mot à mot qui ouvre avec énergie, avance vite, et atterrit chaque élément avec un appel à l'action clair.

Résultat : l'assemblée écoute vraiment, et c'est terminé en moins de 90 secondes. L'attention reste disponible pour la prédication et l'adoration, ce qui est la raison pour laquelle on est là.

---

## Entrée

Fournir la liste d'annonces envisagées. Inclure tout ce qui est à considérer ; le skill triera.

**Requis :**

- Liste d'annonces (événements, échéances, mises à jour, besoins de bénévoles, moment d'offrande, etc.)

**Optionnel :**

- Qui livre les annonces (pasteur, responsable de louange, bénévole, diacre, ancien)
- Ton du culte (célébration, recueillement, énergie, solennité)
- Toute annonce non négociable à livrer impérativement

**Exemple d'entrée :**

```
- Étude biblique des femmes : jeudi 19 h, salle 214
- Inscription bénévoles école biblique d'été
- Dimanche des baptêmes : 20 avril, s'inscrire à l'accueil
- Moment d'offrande
- Nouvelle série de sermons commence la semaine prochaine
- Groupe de jeunes : déplacé de vendredi à samedi cette semaine
- Panier alimentaire : besoin de conserves
```

---

## Flux de travail

### Étape 1 : Triage

Si plus de 4 éléments sont soumis, les classer selon deux critères :

1. **Urgence :** échéance cette semaine ou la prochaine ? Manquer l'annonce coûterait-il une vraie occasion ?
2. **Pertinence pour toute la salle :** concerne-t-elle la majorité de l'assemblée ou seulement un petit segment ?

Seuls les 3-4 premiers éléments entrent dans le script parlé. Le reste est renvoyé au bulletin, aux diapositives ou à la section courriel en bas de la sortie. Être décisif. Charger le script ne sert personne.

Si un élément a été marqué non négociable, il reste dans le script indépendamment du classement.

---

### Étape 2 : Écrire le script

Script parlé complet, mot à mot. Aucun espace réservé. Chaque phrase doit être livrable telle quelle.

**Règles :**

**Accroche d'ouverture.** Ne pas ouvrir par « Nous avons quelques annonces » ou une variante. Ouvrir par quelque chose qui gagne l'attention : une question, une affirmation directe, un bref lien à ce qui vient de se passer dans le culte, ou une entrée directe dans la première annonce.

Exemples :

- « Avant de poursuivre, soixante secondes d'attention : ce qui suit compte. »
- « Trois choses. Une minute. Allons-y. »
- « Frères et sœurs, trois nouvelles brèves avant de revenir à la Parole. »

**Chaque annonce : 2-3 phrases maximum.** Structurer chaque élément de la même façon :

1. Pourquoi cela compte pour la personne assise dans la salle (bénéfice, besoin, occasion d'obéissance, service au corps)
2. Logistique (date, heure, lieu, action)
3. Une seule action claire (s'inscrire, prendre une carte, envoyer un texto, parler à un ancien)

Ne pas inclure numéros de salle, noms de comités ou détails dans le script parlé. Cela appartient au bulletin.

**Transitions.** De brefs ponts naturels entre éléments. Pas « deuxième annonce ». Pas « et aussi ». Quelque chose qui maintient l'énergie sans ressembler à une liste.

**Clôture.** Terminer par une transition chaleureuse et tournée vers la suite du culte. Pas « voilà ! » ni « à toi, pasteur ». Quelque chose qui atterrit et mène à la suite.

Exemples :

- « Voilà ce qui vient. Maintenant, retournons à la Parole. »
- « Voilà ce qu'il y a devant nous. Levons-nous pour l'offrande. »
- « C'est tout. Tournons-nous maintenant vers la prière pastorale. »

**Longueur :** 60 à 90 secondes à rythme naturel. Soit 150 à 225 mots pour le corps du script. Rester dans cette plage.

**Notes de livraison.** Ajouter de brèves indications entre parenthèses quand c'est utile : (pause), (sourire), (montrer la carte), (indiquer l'écran). Minimaliste. Seulement quand cela aide réellement.

---

## Format de sortie

Sortie : **PDF d'une page** aux couleurs de l'église (sans marque commerciale externe), conçu pour être imprimé et remis à la personne qui livre. Le générateur PDF se trouve à `generate-pdf.py` dans ce dossier.

### Mise en page du PDF

1. **En-tête :** « Annonces du dimanche » en bleu marine, centré, gras
2. **Ligne méta :** date | secondes estimées | éléments retenus sur soumis (centré, gris)
3. **Filet doré d'accent**
4. **Notes de livraison / ton** en italique ardoise (si fournies)
5. **Corps du script** en serif lisible. Les indications `[pause]` dans le JSON s'affichent en italique ardoise *(pause)* en ligne.
6. **Séparateur** (mince filet gris)
7. **Section éléments reportés :** « Pour le bulletin / diapositives / courriel » avec liste à puces des éléments non retenus pour le script parlé
8. **Pied de page :** mince filet gris, numéro de page seulement (aucune marque commerciale)

### Schéma JSON

Sauvegarder la sortie structurée en JSON selon ce schéma, puis exécuter `python generate-pdf.py input.json` pour produire le PDF.

```json
{
  "date": "20 avril 2026",
  "estimated_seconds": 75,
  "items_submitted": 7,
  "items_covered": 3,
  "deliverer": "Responsable de louange",
  "tone_notes": "Énergie élevée, célébration. Dimanche des baptêmes.",
  "script_body": "Texte complet du script. Utiliser [indice] pour les indications de livraison. Séparer les paragraphes par double saut de ligne.",
  "bumped_items": [
    {"item": "Horaire du groupe de jeunes", "summary": "Vendredi déplacé à samedi cette semaine seulement."}
  ]
}
```

**Notes sur les champs :**

- `script_body` : utiliser `[crochets]` pour les indications de livraison (`[pause]`, `[sourire]`, `[indiquer l'écran]`). Elles s'affichent en italique coloré. Séparer les paragraphes par `\n\n`.
- `bumped_items` : annonces non retenues au script parlé. Chaque entrée a un `item` (nom) et un `summary` d'une ligne avec la logistique essentielle.
- `deliverer` et `tone_notes` sont optionnels. Si omis, ces lignes sont sautées dans le PDF.
- Le PDF est aux couleurs de l'église locale, sans marque commerciale externe.
- Les clés JSON restent en anglais pour compatibilité avec le générateur. Les valeurs sont en français.

---

## Anti-modèles

Interdictions :

- **Dépasser 90 secondes.** Si trop long, couper un élément. Pas compresser en parlant plus vite.
- **Ouvrir par « Nous avons quelques annonces ».** Ou toute variante. C'est le signal universel pour sortir son téléphone.
- **Inclure de la petite littérature dans le script.** Numéros de salle, noms de comités, lignes budgétaires, consignes de stationnement. Cela appartient au bulletin. Le script oral porte la manchette et l'action, rien d'autre.
- **Appels à l'action vagues.** « Jetez un œil » ou « En savoir plus » ne sont pas des actions. Chaque élément se termine par une chose précise à faire.
- **Clôtures mortes.** « C'est tout ! » « Voilà pour les annonces ! » « À toi pasteur ! » Aucun de ceux-ci.
- **Écrire pour la personne qui livre, non pour l'auditeur.** Chaque phrase doit répondre à : pourquoi cela compte-t-il pour la personne assise là ?
- **Moments d'offrande transformés en appels manipulatoires.** Si une annonce touche aux dons, cadrer bibliquement : l'offrande est un acte d'adoration et de bonne gestion, non un échange transactionnel ni un levier émotionnel. Pas de promesses de retour financier.
- **Promotion de la série « X étapes pour une vie meilleure ».** Si une série est annoncée, la décrire en termes doctrinaux et exégétiques (« Nous reprenons l'exposition de Romains ») plutôt que thérapeutiques.
- **Pré-annonces émotionnelles d'événement futur non livré.** « Vous n'imaginez pas ce qui s'en vient. » Pas de racolage.

---

## Exemples

### Ouverture forte (bon)

« Avant de poursuivre le culte, trois brèves nouvelles. »

### Ouverture faible (mauvais)

« OK, on a quelques petites annonces rapides. »

---

### Élément d'annonce fort (bon)

« Si vous pensez au baptême comme ordonnance d'obéissance publique, le 20 avril est le prochain dimanche prévu. Prenez une carte à l'accueil en sortant et remettez-la à un ancien. »

### Élément d'annonce faible (mauvais)

« On va avoir un dimanche de baptême le 20 avril, coordonné par l'équipe de soins pastoraux, si vous êtes intéressés vous pouvez trouver plus d'infos sur la table du fond ou parler à quelqu'un du comité et il y a des formulaires disponibles à la salle 214. »

---

### Clôture forte (bon)

« Voilà ce qui vient. Maintenant, retournons notre attention à la Parole. »

### Clôture faible (mauvais)

« OK, c'est tout ! À toi, pasteur Dave. »

---

## Notes pour celui qui livre

Si ce n'est pas le pasteur principal qui livre, inclure une brève note en tête avec un ou deux rappels de ton adaptés. Un responsable de louange porte une énergie différente d'un coordonnateur de bénévoles. Le script doit sonner naturel dans sa voix, non emprunté à quelqu'un d'autre.

En cas de doute, écrire plus court. Quatre-vingt-dix secondes paraissent trois minutes quand l'assemblée attend de se consacrer à l'adoration. Respecter cette attention. La gagner vite. Sortir proprement.

---

## Contrôle qualité

- [ ] Aucun tiret cadratin
- [ ] Durée 60-90 secondes (150-225 mots dans `script_body`)
- [ ] 3-4 éléments maximum dans le script parlé
- [ ] Variables `CHURCH_NAME`, `PASTOR_NAME` utilisées, non des placeholders
- [ ] Aucune dérive (prospérité, racolage, moralisme détaché, vocabulaire thérapeutique)
- [ ] Vocabulaire baptiste réformé : « ancien », « diacre », « ordonnance », « assemblée » selon le cas
- [ ] Clé JSON conservée en anglais, valeurs en français
