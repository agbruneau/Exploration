#!/usr/bin/env python3
"""Contrôles de publication du TOC du compendium (Vol. IV).

Couvre les défauts qu'une relecture à l'œil ne rattrape pas sur un plan à
54 chapitres : renumérotation incomplète, renvoi interne pendant, décompte
annoncé périmé, budget qui ne tombe pas dans sa propre fourchette.

    python check-toc.py     # sortie 0 si tout passe, 1 sinon

⚠ Ce script est du contenu : il se vérifie comme le reste. Avant de publier
une modification, la valider par mutation — introduire chacune des fautes
dans une copie, vérifier que le script échoue, après avoir constaté qu'il
passe sur le document intact.

Faux positifs déjà neutralisés (ne pas « simplifier » ces motifs) :
  - « Vol. I ch. 4 », « Vol. II ch. 19 », « Vol. III Annexe B » désignent les
    volumes SOURCES, pas le compendium : leurs numéros tombent dans la plage
    des chapitres du compendium et passeraient inaperçus. D'où le retrait
    préalable de toute référence préfixée par un volume.
  - « Livre VI » dans une ligne « Fusion » peut désigner une partie d'un
    volume source ; seules les formes non préfixées sont contrôlées.
"""

import re
import sys
from pathlib import Path

DOC = Path(__file__).with_name("TOC.md")
ROMAINS = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII",
           "XIII", "XIV", "XV"]

# Toute référence préfixée par un volume source est retirée avant le contrôle
# des renvois internes (voir en-tête).
REF_SOURCE = re.compile(
    r"Vol\.\s*I{1,3}\s*(?:\*?(?:Monographie|Synthèse|PRD)\*?\s*)?"
    r"(?:ch\.\s*[\d]+(?:\s*[-–]\s*\d+)?|Annexe\s+[A-Z]|Partie[s]?\s+[IVX]+(?:\s*[-–]\s*[IVX]+)?)"
    r"(?:\s*\(ch\.\s*\d+(?:\s*[-–]\s*\d+)?\))?"  # « Vol. II Partie VII (ch. 22-23) »
)


def erreurs(txt):
    err = []

    chapitres = [(int(n), t) for n, t in
                 re.findall(r"^### Chapitre (\d+) — (.+)$", txt, re.M)]
    livres = re.findall(r"^# LIVRE ([IVX]+) — (.+)$", txt, re.M)
    annexes = re.findall(r"^- \*\*Annexe ([A-Z]) — ", txt, re.M)

    # 1. Numérotation des chapitres : continue à partir de 1, sans doublon.
    nums = [n for n, _ in chapitres]
    if nums != list(range(1, len(nums) + 1)):
        err.append(f"chapitres non continus : {nums}")

    # 2. Livres : numérotation romaine dans l'ordre, sans trou.
    if [l for l, _ in livres] != ROMAINS[:len(livres)]:
        err.append(f"livres non continus : {[l for l, _ in livres]}")

    # 3. Chaque livre contient au moins deux chapitres (un livre d'un seul
    #    chapitre est une anomalie de structure, pas une organisation).
    bornes = [(m.group(1), m.start()) for m in re.finditer(r"^# LIVRE ([IVX]+) — ", txt, re.M)]
    pos_ch = [(n, m.start()) for (n, _), m in
              zip(chapitres, re.finditer(r"^### Chapitre \d+ — ", txt, re.M))]
    for i, (rom, deb) in enumerate(bornes):
        fin = bornes[i + 1][1] if i + 1 < len(bornes) else len(txt)
        dedans = [n for n, p in pos_ch if deb < p < fin]
        if len(dedans) < 2:
            err.append(f"Livre {rom} : {len(dedans)} chapitre(s) — livre d'un seul chapitre")
        if dedans != list(range(min(dedans), max(dedans) + 1)) if dedans else False:
            err.append(f"Livre {rom} : chapitres non contigus {dedans}")

    # Renvois internes : on retire d'abord les références aux volumes sources.
    interne = REF_SOURCE.sub("", txt)

    # 4. Renvois « ch. N » et « ch. N-M » vers un chapitre existant.
    for m in re.finditer(r"ch\.\s*(\d+)(?:\s*[-–]\s*(\d+))?", interne):
        for g in (m.group(1), m.group(2)):
            if g and int(g) not in nums:
                err.append(f"renvoi vers un chapitre inexistant : ch. {g}")

    # 4bis. Numéro de chapitre nu en queue de liste (« ch. 17 et 16 ») : il
    #    survit intact à une renumérotation et devient faux sans rien signaler.
    #    Chaque numéro porte son propre « ch. ». Les plages « ch. N-M » restent
    #    licites : leurs deux bornes sont contrôlées ci-dessus.
    for m in re.finditer(r"ch\.\s*\d+\s*(?:,|et)\s*(\d+)", interne):
        err.append(f"numéro de chapitre nu en queue de liste : « {m.group()} » "
                   "— écrire « ch. N et ch. M »")

    # 5. Renvois « Livre X » / « Livres X-Y » vers un livre existant.
    romains_doc = {l for l, _ in livres}
    # « Livres IX-X » comme « Livres II et XII » : les deux formes se contrôlent.
    for m in re.finditer(r"Livres?\s+([IVX]+)(?:\s*(?:[-–]|et)\s*([IVX]+))?", interne):
        for g in (m.group(1), m.group(2)):
            if g and g not in romains_doc:
                err.append(f"renvoi vers un livre inexistant : Livre {g}")

    # 6. Renvois « Annexe X » vers une annexe déclarée.
    for m in re.finditer(r"Annexe\s+([A-Z])\b", interne):
        if m.group(1) not in annexes:
            err.append(f"renvoi vers une annexe inexistante : Annexe {m.group(1)}")

    # 7. Décomptes annoncés dans la volumétrie.
    m = re.search(r"(\d+)\s*chapitres en (\d+) livres[^.]*?(\d+) annexes", txt)
    if not m:
        err.append("bloc de volumétrie introuvable (décomptes chapitres/livres/annexes)")
    else:
        annonce = (int(m.group(1)), int(m.group(2)), int(m.group(3)))
        reel = (len(chapitres), len(livres), len(annexes))
        if annonce != reel:
            err.append(f"décomptes annoncés {annonce} != réels {reel} "
                       "(chapitres, livres, annexes)")

    # 8. Budget : la somme des enveloppes doit tomber dans la fourchette annoncée.
    # Les milliers sont séparés par des espaces de largeurs variables selon la
    # saisie (U+0020, U+00A0, U+202F) : on ne garde que les chiffres.
    entier = lambda s: int(re.sub(r'\D', '', s))
    parts = [entier(x) for x in re.findall(r'~([\d\s]+)000 mots', txt)]
    fourchette = re.search(r'≈\s*([\d\s]+000)\s*[–-]\s*([\d\s]+000) mots', txt)
    if not parts:
        err.append("aucune enveloppe « ~N 000 mots » trouvée")
    elif not fourchette:
        err.append("fourchette de projection « N 000-M 000 mots » introuvable")
    else:
        somme = sum(parts) * 1000  # les enveloppes sont libellées en milliers
        bas, haut = (entier(g) for g in fourchette.groups())
        if not bas <= somme <= haut:
            err.append(f'somme des enveloppes = {somme} mots, hors fourchette '
                       f'annoncée {bas}-{haut}')

    # 9. Chapitres consommateurs du corpus d'appui : la mention doit figurer
    #    dans le chapitre (parade du risque « corpus hérité sans re-déclaration »).
    m = re.search(r"Chapitres consommateurs\s*:\s*([^.]+)\.", txt)
    if not m:
        err.append("liste des chapitres consommateurs du corpus d'appui introuvable")
    else:
        # Les annotations entre parenthèses (« 15 (grille × maturité) ») sont
        # retirées : seuls les numéros de la liste comptent.
        declares = [int(x) for x in
                    re.findall(r"\d+", re.sub(r"\([^)]*\)", "", m.group(1)))]
        corps = re.split(r"^### Chapitre ", txt, flags=re.M)[1:]
        par_num = {int(re.match(r"(\d+)", c).group(1)): c for c in corps}
        for n in declares:
            if n not in par_num:
                err.append(f"chapitre consommateur {n} inexistant")
            elif "corpus d'appui" not in par_num[n]:
                err.append(f"chapitre {n} déclaré consommateur du corpus d'appui "
                           "sans porter la mention")

    # 10. Chaque chapitre trace sa provenance : ligne « Fusion » ou « Chapitre neuf ».
    for n, c in par_num.items() if m else []:
        if "*Fusion :" not in c and "*Chapitre neuf" not in c:
            err.append(f"chapitre {n} sans ligne « Fusion » ni « Chapitre neuf »")

    # 11. Garde-fous nommés dans les chapitres touchant le Vol. III (décision 7) :
    #     la série R-1…R-8 (un chiffre) appartient au Vol. II, la série
    #     R-01…R-14 (deux chiffres) au Vol. III. Dans un chapitre qui consomme
    #     le Vol. III, un « R-N » à un chiffre sans « Vol. II » à portée de
    #     phrase résout contre les deux séries.
    #     Le dernier chapitre n'a pas de « ### Chapitre » suivant : la zone des
    #     chapitres est bornée aux annexes, sinon le journal et les risques —
    #     qui parlent légitimement de garde-fous nus — entrent dans son corps.
    zone_ch = txt.split("\n## Annexes")[0]
    for c in re.split(r"^### Chapitre ", zone_ch, flags=re.M)[1:]:
        num = re.match(r"(\d+)", c).group(1)
        if "Vol. III" not in c:
            continue
        for mm in re.finditer(r"\bR-\d\b", c):
            # « Vol. II » est une sous-chaîne de « Vol. III » : l'anticipation
            # négative est obligatoire, sinon un « Vol. III » voisin valide à tort.
            if not re.search(r"Vol\.\s*II(?!I)", c[mm.start():mm.start() + 100]):
                err.append(f"chapitre {num} : garde-fou « {mm.group()} » sans volume "
                           "nommé dans un chapitre consommant le Vol. III (décision 7)")

    # 12. Renvois de section au Vol. III (décision 7, volet ajouté en v0.5) :
    #     ce volume vit en numérotation multiple — son TOC.md, son PRD et son
    #     PRDPlan portent tous des §N.x, et ce fichier cite les trois. Un
    #     « Vol. III §7.4 » nu est donc indécidable exactement comme l'était un
    #     « R-7 » nu. Les formes licites nomment leur document et ne sont pas
    #     capturées par le motif : « Vol. III *TOC* § » interpose « *TOC* ».
    #     Faux positif neutralisé : les occurrences entre guillemets « … » sont
    #     des citations du défaut (en-tête, décision 7, journal), pas des
    #     renvois — les compter rendrait le contrôle ininstallable sur le
    #     fichier même qui le documente.
    for mm in re.finditer(r"Vol\.\s*III\s*§", txt):
        amont = txt[max(0, mm.start() - 60):mm.start()]
        if "PRD du " in amont[-15:] or "PRDPlan" in amont[-15:]:
            continue
        if "«" in amont and amont.rfind("«") > amont.rfind("»"):
            continue
        err.append("renvoi « Vol. III §… » sans document nommé (décision 7) — "
                   "écrire « Vol. III *TOC* §N.x » ou « PRD du Vol. III §N »")

    # 13. Registre des dix lacunes héritées du PRD Vol. II (Annexe C) : la table
    #     doit porter les dix identifiants §10.1 à §10.10, un par ligne. Les
    #     v0.1-v0.4 en perdaient deux entièrement (§10.7, §10.10) et en gardaient
    #     trois sans identifiant — or une lacune qui perd son identifiant en
    #     changeant d'ouvrage est une lacune qui se referme sans preuve.
    #     ⚠ Le contrôle porte sur les LIGNES DE LA TABLE, non sur la présence des
    #     identifiants dans le document : la plupart sont aussi cités au ch. 53 et
    #     au journal, si bien qu'une ligne retirée du registre resterait invisible
    #     à un contrôle global — c'est exactement le défaut à attraper, et la
    #     première rédaction de ce contrôle y échouait (constaté par mutation).
    #     ⚠ « §10.1 » est le PRÉFIXE de « §10.10 » : capturer le numéro entier
    #     (\d+) est obligatoire. Un motif « §10\.1 » suivi de \b matcherait à
    #     l'intérieur de « §10.10 » — le point qui suit est un non-mot et
    #     validerait la frontière à tort.
    lignes = {int(x) for x in re.findall(r"^\s*\|\s*§10\.(\d+)\s*\|", txt, re.M)}
    if not lignes:
        err.append("registre des lacunes héritées du PRD Vol. II introuvable "
                   "(Annexe C)")
    for i in sorted(set(range(1, 11)) - lignes):
        err.append(f"lacune héritée du PRD Vol. II §10.{i} absente du registre "
                   "(Annexe C) — une lacune sans identifiant se referme sans preuve")

    # 14. Cardinal annoncé des renvois nommés au Vol. III : le fichier déclare en
    #     toutes lettres combien il en porte (décision 7 et journal). Un cardinal
    #     en toutes lettres ne se met pas à jour tout seul — ajouter ou retirer un
    #     renvoi le périme en silence. Défaut commis à la rédaction même de la
    #     v0.5, d'où ce contrôle.
    #     ⚠ Le motif exige un CHIFFRE après « § » : le fichier énonce aussi la
    #     convention elle-même (« `Vol. III *TOC* §N.x` pour le plan »), qui n'est
    #     pas un renvoi. Sans cette frontière, le contrôle compte deux énoncés de
    #     convention comme deux renvois et déclare faux un cardinal juste
    #     (constaté à la rédaction : 13 comptés pour 11 réels).
    CARDINAUX = {"onze": 11, "douze": 12, "treize": 13, "quatorze": 14,
                 "quinze": 15, "seize": 16}
    reels = len(re.findall(r"Vol\. III \*TOC\* §\d", txt))
    for mm in re.finditer(r"[Ll]es \*{0,2}(\w+)\*{0,2} renvois de section au Vol\. III",
                          txt):
        mot = mm.group(1).lower()
        if mot not in CARDINAUX:
            err.append(f"cardinal des renvois au Vol. III illisible : « {mot} »")
        elif CARDINAUX[mot] != reels:
            err.append(f"cardinal annoncé des renvois nommés au Vol. III "
                       f"« {mot} » ({CARDINAUX[mot]}) != {reels} réels")

    # 15. Portage effectif des lacunes héritées : le chapitre porteur principal
    #     désigné par le registre (Annexe C) doit nommer l'identifiant dans son
    #     corps. Un registre qui pointe vers un chapitre muet est un registre
    #     CREUX — il déclare une couverture qu'aucun chapitre n'assure. Défaut
    #     commis à la rédaction de la v0.5 : huit lignes sur dix pointaient à
    #     vide, et le contrôle 13 (complétude de la table) ne pouvait pas le voir.
    #     Même piège de préfixe qu'au contrôle 13 : « §10.1 » ⊂ « §10.10 ».
    #     Zone bornée aux chapitres, sinon le registre et le journal — qui citent
    #     légitimement tous les identifiants — entreraient dans le corps du
    #     dernier chapitre et valideraient tout à tort.
    ch_bornes = {int(re.match(r"(\d+)", c).group(1)): c
                 for c in re.split(r"^### Chapitre ", zone_ch, flags=re.M)[1:]}
    for mm in re.finditer(r"^\s*\|\s*§10\.(\d+)\s*\|[^|]*\|\s*([^|]+)\|", txt, re.M):
        lac, dest = mm.group(1), mm.group(2)
        prem = re.search(r"ch\.\s*(\d+)", dest)
        if not prem:
            err.append(f"registre (Annexe C) : lacune §10.{lac} sans chapitre porteur")
            continue
        n = int(prem.group(1))
        if not re.search(rf"§10\.{lac}(?!\d)", ch_bornes.get(n, "")):
            err.append(f"lacune héritée §10.{lac} : le ch. {n} est désigné porteur "
                       "au registre (Annexe C) mais ne la nomme pas — registre creux")

    # 16. Double revendication d'une Partie d'un volume source entre deux livres
    #     (décision 6 : couverture totale tracée, sans double affectation
    #     silencieuse). Trois cas trouvés à la relecture de la v0.5 : le Livre III
    #     revendiquait « Vol. III Parties I-IV » alors que le Livre IV prend la
    #     Partie IV ; le Livre VI « Vol. II Partie II » alors que le ch. 8 part au
    #     Livre III ; le Livre XI « Partie VI + ch. 21-22 » alors que le ch. 21 va
    #     au Livre XII. Une Partie légitimement partagée porte « hors … » : c'est
    #     la déclaration de scission qui rend le partage vérifiable.
    #     ⚠ Seul l'en-tête de chaque livre est lu — les lignes « Fusion » des
    #     chapitres citent aussi des Parties, à bon droit.
    #     ⚠ PORTÉE LIMITÉE, ET IL FAUT LE DIRE : ce contrôle n'attrape que le
    #     recouvrement Partie contre Partie (Livre III contre Livre IV). Les deux
    #     autres cas trouvés en v0.5 — une Partie entière revendiquée alors qu'un
    #     AUTRE livre en prend un chapitre nommé (Livre VI et le ch. 8 du Vol. II ;
    #     Livre XI et le ch. 21 du Vol. II) — supposeraient d'encoder ici la carte
    #     Partie -> chapitres des volumes sources. Elle n'est délibérément PAS
    #     encodée : le Vol. III est une proposition explicitement volatile, et une
    #     carte périmée ferait « détecter » des fautes inexistantes ou tairait les
    #     vraies — un script cassé « détecte » tout. Ce recouvrement-là reste une
    #     collation manuelle, à refaire à chaque révision d'un en-tête de livre.
    claims = {}
    for m_liv in re.finditer(r"^# LIVRE ([IVX]+) — .*\n+(\*\(.+?\)\*)", txt, re.M):
        rom, entete = m_liv.group(1), m_liv.group(2)
        for mc in re.finditer(
                r"Vol\.\s*(I{1,3})\s+Parties?\s+([IVX]+)(?:\s*[-–]\s*([IVX]+))?", entete):
            vol, deb, fin = mc.group(1), mc.group(2), mc.group(3)
            i, j = ROMAINS.index(deb), ROMAINS.index(fin or deb)
            scinde = "hors" in entete[mc.end():mc.end() + 40]
            for k in range(i, j + 1):
                claims.setdefault((vol, ROMAINS[k]), []).append((rom, scinde))
    for (vol, part), porteurs in sorted(claims.items()):
        if len(porteurs) > 1 and not any(s for _, s in porteurs):
            livres_ = ", ".join(r for r, _ in porteurs)
            err.append(f"Vol. {vol} Partie {part} revendiquée par les Livres "
                       f"{livres_} sans mention « hors … » (décision 6)")

    return err


def main():
    txt = DOC.read_text(encoding="utf-8")
    err = erreurs(txt)
    for e in err:
        print(f"ÉCHEC : {e}")
    if err:
        print(f"\n{len(err)} contrôle(s) en échec.")
        return 1
    print("Tous les contrôles passent.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
