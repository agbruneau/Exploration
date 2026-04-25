/**
 * Bouton « Haut de page ».
 */

const btn = document.getElementById("back-to-top");

export function setupBackToTop() {
  if (!btn) return;
  const update = () => {
    if (window.scrollY > 600) btn.removeAttribute("hidden");
    else btn.setAttribute("hidden", "");
  };
  window.addEventListener("scroll", update, { passive: true });
  btn.addEventListener("click", () => window.scrollTo({ top: 0, behavior: "smooth" }));
  update();
}
