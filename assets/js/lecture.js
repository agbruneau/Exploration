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
    // Les autres modules (TOC, search, prefs, anchors, progress, sequential-nav)
    // seront branchés ici dans les tâches suivantes.
  } catch (err) {
    console.error(err);
    showError(navigator.onLine ? "error" : "offline");
  }
}

boot();
