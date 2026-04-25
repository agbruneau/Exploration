/**
 * Module de rendu du markdown source.
 * Utilise marked + DOMPurify auto-hébergés.
 * Met en cache le HTML rendu dans localStorage avec une clé incluant le hash.
 */

import { marked } from "/assets/vendor/marked.esm.min.js";

// DOMPurify est exposé en global via /assets/vendor/purify.min.js (UMD)
// On le charge dynamiquement.
async function loadPurify() {
  if (window.DOMPurify) return window.DOMPurify;
  await new Promise((resolve, reject) => {
    const s = document.createElement("script");
    s.src = "/assets/vendor/purify.min.js";
    s.onload = resolve;
    s.onerror = reject;
    document.head.appendChild(s);
  });
  return window.DOMPurify;
}

const CACHE_PREFIX = "analyse:html:";
const SOURCE_URL = "/AnalyseTheologique.md";

/**
 * Calcule un hash court SHA-256 (8 chars) du texte source.
 */
async function shortHash(text) {
  const buf = new TextEncoder().encode(text);
  const hashBuf = await crypto.subtle.digest("SHA-256", buf);
  const hashArray = Array.from(new Uint8Array(hashBuf));
  return hashArray.slice(0, 4).map((b) => b.toString(16).padStart(2, "0")).join("");
}

/**
 * Configure marked pour utiliser nos slugs (GitHub-style).
 */
import { slugify } from "./slug.js";

function configureMarked() {
  marked.setOptions({ gfm: true, breaks: false, headerIds: false, mangle: false });
  marked.use({
    renderer: {
      heading(text, level) {
        const id = slugify(text);
        return `<h${level} id="${id}">${text}<button class="heading-anchor" data-anchor="${id}" aria-label="Copier le lien vers cette section">#</button></h${level}>`;
      },
    },
  });
}

/**
 * Récupère et rend le markdown source.
 * Retourne { html, hash, fromCache }.
 */
export async function fetchAndRender() {
  configureMarked();

  // 1. Tenter le cache (sans connaître le hash)
  let cachedEntry = null;
  for (let i = 0; i < localStorage.length; i++) {
    const key = localStorage.key(i);
    if (key && key.startsWith(CACHE_PREFIX)) {
      cachedEntry = { key, html: localStorage.getItem(key) };
      break;
    }
  }
  if (cachedEntry) {
    // Hydratation immédiate ; vérification du hash en background
    queueMicrotask(() => verifyHashInBackground(cachedEntry.key));
    return { html: cachedEntry.html, hash: cachedEntry.key.slice(CACHE_PREFIX.length), fromCache: true };
  }

  // 2. Fetch + render + cache
  const res = await fetch(SOURCE_URL, { cache: "no-cache" });
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  const md = await res.text();
  const hash = await shortHash(md);
  const purify = await loadPurify();
  const rawHtml = marked.parse(md);
  const cleanHtml = purify.sanitize(rawHtml, { ADD_ATTR: ["id", "data-anchor"] });
  try { localStorage.setItem(`${CACHE_PREFIX}${hash}`, cleanHtml); } catch { /* quota dépassé : ignorer */ }
  return { html: cleanHtml, hash, fromCache: false };
}

async function verifyHashInBackground(currentKey) {
  try {
    const res = await fetch(SOURCE_URL, { cache: "no-cache" });
    if (!res.ok) return;
    const md = await res.text();
    const hash = await shortHash(md);
    if (`${CACHE_PREFIX}${hash}` !== currentKey) {
      // Hash a changé : invalider l'ancien et notifier
      localStorage.removeItem(currentKey);
      window.dispatchEvent(new CustomEvent("content-updated", { detail: { hash } }));
    }
  } catch { /* offline : pas de vérification */ }
}
