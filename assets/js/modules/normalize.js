/**
 * Normalise une chaîne pour la recherche :
 *  - lowercase
 *  - retire les diacritiques latins (Latin Combining Marks U+0300–U+036F)
 *  - collapse les espaces multiples
 *  - trim
 *
 * Ne touche PAS aux diacritiques grecs polytoniques (hors-périmètre v1.0).
 * Les caractères grecs précomposés (U+0370–U+03FF, U+1F00–U+1FFF) sont
 * traités tels quels : pas de décomposition NFD pour préserver l'esprit
 * doux/rude, l'iota souscrit, le périspomène, etc.
 */
export function normalize(s) {
  if (!s) return "";
  let out = "";
  for (const ch of String(s).toLocaleLowerCase("fr")) {
    const code = ch.codePointAt(0);
    const isGreek =
      (code >= 0x0370 && code <= 0x03FF) ||
      (code >= 0x1F00 && code <= 0x1FFF);
    if (isGreek) {
      out += ch;
    } else {
      out += ch.normalize("NFD").replace(/[̀-ͯ]/g, "");
    }
  }
  return out.replace(/\s+/g, " ").trim();
}
