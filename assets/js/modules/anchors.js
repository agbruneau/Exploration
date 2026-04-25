/**
 * Gère :
 *  - Le clic sur le bouton # à côté de chaque heading (copie l'URL)
 *  - Le scroll smooth vers l'ancre au chargement (location.hash)
 *  - L'affichage d'un toast « Lien copié »
 */

const toast = document.getElementById("toast");

export function setupAnchors() {
  const article = document.getElementById("article-content");
  if (!article) return;

  article.querySelectorAll(".heading-anchor").forEach((btn) => {
    btn.addEventListener("click", async (e) => {
      e.preventDefault();
      const id = btn.getAttribute("data-anchor");
      const url = `${location.origin}${location.pathname}#${id}`;
      try {
        await navigator.clipboard.writeText(url);
        showToast("Lien copié");
      } catch {
        showToast("Impossible de copier le lien");
      }
    });
  });

  // Scroll smooth si arrivée avec hash
  if (location.hash) {
    const target = document.getElementById(decodeURIComponent(location.hash.slice(1)));
    if (target) {
      requestAnimationFrame(() => target.scrollIntoView({ behavior: "smooth", block: "start" }));
    }
  }
}

function showToast(msg) {
  if (!toast) return;
  toast.textContent = msg;
  toast.classList.add("toast--visible");
  setTimeout(() => toast.classList.remove("toast--visible"), 1500);
}
