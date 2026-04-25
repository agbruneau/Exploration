/**
 * Génère la table des matières à partir des h2/h3 du contenu rendu,
 * et synchronise l'item actif avec le scroll via IntersectionObserver.
 */

const tocEl = document.getElementById("toc");
const sidebar = document.getElementById("sidebar");
const sidebarToggle = document.querySelector(".topbar__toggle");

export function buildToc() {
  if (!tocEl) return;
  const article = document.getElementById("article-content");
  if (!article) return;
  const headings = article.querySelectorAll("h2, h3");
  if (!headings.length) {
    tocEl.innerHTML = "<p class=\"sidebar__loading\">Aucune section trouvée.</p>";
    return;
  }

  // Construction de l'arbre : h2 = groupe, h3 = item
  const html = [];
  let currentGroup = null;
  headings.forEach((h) => {
    const text = h.firstChild?.textContent || h.textContent.replace(/#$/, "").trim();
    const id = h.id;
    if (h.tagName === "H2") {
      if (currentGroup) html.push("</ul>");
      html.push(`<p class="toc-group">${escapeHtml(text)}</p>`);
      html.push(`<ul>`);
      currentGroup = id;
    } else { // H3
      if (!currentGroup) { html.push("<ul>"); currentGroup = "_root"; }
      html.push(`<li><a class="toc-item" href="#${id}" data-anchor="${id}">${escapeHtml(text)}</a></li>`);
    }
  });
  if (currentGroup) html.push("</ul>");

  tocEl.innerHTML = html.join("");

  // Interception : fermer le drawer mobile au clic
  tocEl.querySelectorAll(".toc-item").forEach((a) => {
    a.addEventListener("click", () => {
      if (window.innerWidth < 1024 && sidebar) {
        sidebar.classList.remove("sidebar--open");
        sidebarToggle?.setAttribute("aria-expanded", "false");
      }
    });
  });

  // Sync scroll → highlight
  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            const id = entry.target.id;
            tocEl.querySelectorAll(".toc-item").forEach((a) => {
              a.classList.toggle("toc-item--active", a.getAttribute("data-anchor") === id);
              if (a.getAttribute("data-anchor") === id) a.setAttribute("aria-current", "location");
              else a.removeAttribute("aria-current");
            });
          }
        });
      },
      { rootMargin: "-30% 0px -60% 0px" }
    );
    headings.forEach((h) => h.id && observer.observe(h));
  }
}

export function setupSidebarToggle() {
  if (!sidebarToggle || !sidebar) return;
  sidebarToggle.addEventListener("click", () => {
    const isOpen = sidebar.classList.toggle("sidebar--open");
    sidebarToggle.setAttribute("aria-expanded", String(isOpen));
  });
  // Fermer sur Esc
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && sidebar.classList.contains("sidebar--open")) {
      sidebar.classList.remove("sidebar--open");
      sidebarToggle.setAttribute("aria-expanded", "false");
    }
  });
}

function escapeHtml(s) {
  return String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
}
