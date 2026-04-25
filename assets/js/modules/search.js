/**
 * Recherche plein-texte sur le DOM rendu.
 * Surligne les occurrences avec <mark class="search-hit">,
 * navigation entre occurrences via boutons ↑↓.
 */

import { normalize } from "./normalize.js";

const MAX_HITS = 1000;

const panel = document.getElementById("search-panel");
const input = document.getElementById("search-input");
const status = document.getElementById("search-status");
const btnPrev = document.getElementById("search-prev");
const btnNext = document.getElementById("search-next");
const btnClose = document.getElementById("search-close");
const btnOpen = document.getElementById("btn-search");
const article = document.getElementById("article-content");

let hits = [];
let activeIndex = -1;

export function setupSearch() {
  if (!panel || !input || !article) return;

  btnOpen?.addEventListener("click", openPanel);
  btnClose?.addEventListener("click", closePanel);
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && !panel.hasAttribute("hidden")) closePanel();
    if ((e.key === "/" || (e.ctrlKey && e.key === "f")) && panel.hasAttribute("hidden")) {
      e.preventDefault();
      openPanel();
    }
  });

  let timer;
  input.addEventListener("input", () => {
    clearTimeout(timer);
    timer = setTimeout(() => runSearch(input.value), 200);
  });

  btnPrev?.addEventListener("click", () => navigate(-1));
  btnNext?.addEventListener("click", () => navigate(1));
}

function openPanel() {
  panel.removeAttribute("hidden");
  input.focus();
}
function closePanel() {
  clearHits();
  panel.setAttribute("hidden", "");
  input.value = "";
  status.textContent = "";
}

function clearHits() {
  article.querySelectorAll("mark.search-hit").forEach((m) => {
    const text = document.createTextNode(m.textContent);
    m.replaceWith(text);
  });
  article.normalize();
  hits = [];
  activeIndex = -1;
  btnPrev.disabled = true;
  btnNext.disabled = true;
}

function runSearch(term) {
  clearHits();
  const q = normalize(term);
  if (q.length < 2) { status.textContent = ""; return; }

  // Parcours TextNode → wrap matches dans <mark>
  const walker = document.createTreeWalker(article, NodeFilter.SHOW_TEXT, {
    acceptNode: (node) => {
      if (!node.textContent.trim()) return NodeFilter.FILTER_REJECT;
      if (node.parentElement?.closest("script,style")) return NodeFilter.FILTER_REJECT;
      return normalize(node.textContent).includes(q)
        ? NodeFilter.FILTER_ACCEPT
        : NodeFilter.FILTER_REJECT;
    },
  });

  const nodesToProcess = [];
  let n;
  while ((n = walker.nextNode())) nodesToProcess.push(n);

  for (const node of nodesToProcess) {
    if (hits.length >= MAX_HITS) break;
    wrapMatches(node, term, q);
  }

  if (hits.length === 0) {
    status.textContent = `Aucun résultat pour « ${term} ». Essayez avec moins de caractères ou sans accents.`;
    return;
  }
  if (hits.length >= MAX_HITS) {
    status.textContent = `${MAX_HITS}+ occurrences trouvées. Affinez votre recherche.`;
  } else {
    status.textContent = `${hits.length} résultat${hits.length > 1 ? "s" : ""}`;
  }
  btnPrev.disabled = false;
  btnNext.disabled = false;
  navigate(1);
}

function wrapMatches(textNode, originalTerm, normalizedTerm) {
  const text = textNode.textContent;
  const normalizedText = normalize(text);
  const indices = [];
  let from = 0;
  while (true) {
    const idx = normalizedText.indexOf(normalizedTerm, from);
    if (idx === -1) break;
    indices.push(idx);
    from = idx + normalizedTerm.length;
  }
  if (!indices.length) return;

  // Reconstruire le node en wrappant chaque occurrence
  const fragment = document.createDocumentFragment();
  let cursor = 0;
  // Note : indices opèrent sur le texte normalisé qui peut différer en longueur
  // (rare en pratique : NFD ne change pas la longueur de la plupart des Latin chars).
  // On utilise une recherche linéaire sur le texte original, qui partage les mêmes positions
  // tant que la normalisation n'altère pas les longueurs (cas commun).
  for (const idx of indices) {
    if (hits.length >= MAX_HITS) break;
    fragment.appendChild(document.createTextNode(text.slice(cursor, idx)));
    const mark = document.createElement("mark");
    mark.className = "search-hit";
    mark.textContent = text.slice(idx, idx + normalizedTerm.length);
    fragment.appendChild(mark);
    hits.push(mark);
    cursor = idx + normalizedTerm.length;
  }
  fragment.appendChild(document.createTextNode(text.slice(cursor)));
  textNode.replaceWith(fragment);
}

function navigate(delta) {
  if (!hits.length) return;
  // Désactiver l'ancien actif
  if (activeIndex >= 0 && hits[activeIndex]) hits[activeIndex].classList.remove("search-hit--active");
  activeIndex = (activeIndex + delta + hits.length) % hits.length;
  const target = hits[activeIndex];
  target.classList.add("search-hit--active");
  target.scrollIntoView({ behavior: "smooth", block: "center" });
  status.textContent = `${activeIndex + 1} / ${hits.length}`;
}
