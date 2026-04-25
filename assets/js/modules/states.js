/**
 * Affiche les différents états de l'article (chargement, erreur, contenu).
 */

const article = document.getElementById("article-content");

export function showError(reason = "offline") {
  if (!article) return;
  const banner = document.createElement("div");
  banner.className = "error-banner";
  banner.innerHTML = `
    <h2>${reason === "offline" ? "Lecture hors-ligne indisponible" : "Une erreur est survenue"}</h2>
    <p>${reason === "offline"
      ? "Cette page nécessite une connexion à la première visite. Vous pouvez aussi télécharger directement le markdown source."
      : "Le contenu n'a pas pu être chargé. Essayez de recharger la page ou de télécharger le markdown source."}</p>
    <div class="error-banner__actions">
      <a href="/AnalyseTheologique.md" download class="btn btn-primary">Télécharger le markdown</a>
      <button type="button" class="btn btn-secondary" data-action="reload">Réessayer</button>
    </div>
  `;
  banner.querySelector('[data-action="reload"]')?.addEventListener("click", () => location.reload());
  article.innerHTML = "";
  article.appendChild(banner);
  article.removeAttribute("aria-busy");
}

export function injectContent(html) {
  if (!article) return;
  article.innerHTML = html;
  article.removeAttribute("aria-busy");
}

export function showUpdateAvailable() {
  // Banner non-bloquant : « Le contenu a été mis à jour »
  const existing = document.getElementById("update-banner");
  if (existing) return;
  const banner = document.createElement("div");
  banner.id = "update-banner";
  banner.className = "error-banner";
  banner.innerHTML = `
    <p>Le contenu a été mis à jour. <button type="button" class="btn btn-secondary" data-action="reload">Recharger</button></p>
  `;
  banner.querySelector('[data-action="reload"]')?.addEventListener("click", () => location.reload());
  document.querySelector(".content")?.prepend(banner);
}
