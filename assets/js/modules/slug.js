/**
 * Génère un slug GitHub-compatible à partir d'un texte de heading.
 *
 * Règles (alignées sur l'algorithme GitHub utilisé dans le TOC d'AnalyseTheologique.md) :
 *  1. Lowercase
 *  2. Trim espaces
 *  3. Supprimer la ponctuation standalone (`.`, `,`, `:`, `;`, `(`, `)`, etc.)
 *     mais conserver les accents et le tiret
 *  4. Remplacer les espaces par des tirets
 *  5. Conserver les doubles tirets résultant des em-dashes ` — `
 *  6. Trim tirets en début/fin
 */
export function slugify(text) {
  if (!text || typeof text !== "string") return "";
  return text
    .toLowerCase()
    .trim()
    // Conserver l'em-dash en tant que double tiret après split par espaces
    .replace(/—/g, "--")
    // Supprimer la ponctuation standalone (mais pas le tiret simple, le tiret bas, ni les accents)
    .replace(/[.,:;()\[\]{}!?'"`«»]/g, "")
    // Remplacer les espaces (et tabs) par un tiret simple
    .replace(/[\s\t]+/g, "-")
    // Coalescer les triples tirets ou plus en double tiret
    .replace(/-{3,}/g, "--")
    // Trim tirets en début/fin
    .replace(/^-+|-+$/g, "");
}
