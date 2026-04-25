/**
 * Insère un bloc de navigation « précédente / suivante » entre chaque péricope (h3).
 */

export function injectSequentialNav() {
  const article = document.getElementById("article-content");
  if (!article) return;
  const headings = Array.from(article.querySelectorAll("h3"));
  if (!headings.length) return;

  headings.forEach((h, i) => {
    const prev = headings[i - 1];
    const next = headings[i + 1];

    // Trouver le dernier élément avant le prochain h3 (ou la fin de l'article)
    let lastEl = h;
    let cursor = h.nextElementSibling;
    while (cursor && cursor.tagName !== "H3" && cursor.tagName !== "H2") {
      lastEl = cursor;
      cursor = cursor.nextElementSibling;
    }

    const nav = document.createElement("nav");
    nav.className = "sequential-nav";
    nav.setAttribute("aria-label", "Navigation entre péricopes");

    const prevHtml = prev
      ? `<a href="#${prev.id}"><span class="sequential-nav__label">← Précédente</span><span class="sequential-nav__title">${textOnly(prev)}</span></a>`
      : `<span class="sequential-nav__none"></span>`;
    const nextHtml = next
      ? `<a href="#${next.id}" class="sequential-nav__next"><span class="sequential-nav__label">Suivante →</span><span class="sequential-nav__title">${textOnly(next)}</span></a>`
      : `<span class="sequential-nav__none"></span>`;

    nav.innerHTML = prevHtml + nextHtml;
    lastEl.after(nav);
  });
}

function textOnly(h) {
  return h.firstChild?.textContent?.trim() || h.textContent.replace(/#$/, "").trim();
}
