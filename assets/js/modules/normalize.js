/**
 * Normalise une chaîne pour la recherche :
 *  - lowercase
 *  - retire les diacritiques latins (Latin Combining Marks U+0300–U+036F)
 *  - collapse les espaces multiples
 *  - trim
 *
 * Ne touche PAS aux diacritiques grecs polytoniques (hors-périmètre v1.0).
 */
export function normalize(s) {
  if (!s) return "";
  return String(s)
    .toLocaleLowerCase("fr")
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "") // Combining Diacritical Marks (Latin)
    .replace(/\s+/g, " ")
    .trim();
}
