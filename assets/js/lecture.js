/**
 * Orchestrateur du lecteur. Charge le contenu, puis active progressivement
 * les modules (TOC, search, prefs, etc.) au fur et à mesure de l'implémentation.
 */

import { fetchAndRender } from "/assets/js/modules/render.js";
import { injectContent, showError, showUpdateAvailable } from "/assets/js/modules/states.js";

window.addEventListener("content-updated", showUpdateAvailable);

async function boot() {
  try {
    const { html } = await fetchAndRender();
    injectContent(html);
    const { buildToc, setupSidebarToggle } = await import("/assets/js/modules/toc.js");
    buildToc();
    setupSidebarToggle();
    const { setupSearch } = await import("/assets/js/modules/search.js");
    setupSearch();
    const { setupAnchors } = await import("/assets/js/modules/anchors.js");
    setupAnchors();
    const { setupProgress } = await import("/assets/js/modules/progress.js");
    setupProgress();
    const { setupBackToTop } = await import("/assets/js/modules/back-to-top.js");
    setupBackToTop();
    const { injectSequentialNav } = await import("/assets/js/modules/sequential-nav.js");
    injectSequentialNav();
  } catch (err) {
    console.error(err);
    showError(navigator.onLine ? "error" : "offline");
  }
}

boot();
