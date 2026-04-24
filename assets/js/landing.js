/**
 * Landing — comportements interactifs.
 * Zéro dépendance ; aucun appel réseau ; ESM natif.
 */

const repoUrl = "https://github.com/agbruneau/Exploration"; // À ajuster en revue (Annexe D du PRD)

// === 1. Mise à jour des liens GitHub dynamiquement ===
const githubLink = document.getElementById("github-link");
if (githubLink) githubLink.href = repoUrl;
const footerGithub = document.getElementById("footer-github");
if (footerGithub) footerGithub.href = repoUrl;
const footerIssues = document.getElementById("footer-issues");
if (footerIssues) footerIssues.href = `${repoUrl}/issues/new`;
const footerLicense = document.getElementById("footer-license");
if (footerLicense) footerLicense.href = `${repoUrl}/blob/main/LICENSE`;

// === 2. Année dynamique du footer ===
const footerYear = document.getElementById("footer-year");
if (footerYear) footerYear.textContent = new Date().getFullYear();

// === 3. Header sticky : ombrage au scroll ===
const header = document.getElementById("site-header");
const updateHeaderShadow = () => {
  if (!header) return;
  if (window.scrollY > 200) header.classList.add("site-header--scrolled");
  else header.classList.remove("site-header--scrolled");
};
window.addEventListener("scroll", updateHeaderShadow, { passive: true });
updateHeaderShadow();

// === 4. Mobile drawer toggle ===
const menuBtn = document.querySelector(".site-header__menu");
const drawer = document.getElementById("mobile-drawer");
if (menuBtn && drawer) {
  menuBtn.addEventListener("click", () => {
    const isOpen = !drawer.hasAttribute("hidden");
    if (isOpen) {
      drawer.setAttribute("hidden", "");
      menuBtn.setAttribute("aria-expanded", "false");
    } else {
      drawer.removeAttribute("hidden");
      menuBtn.setAttribute("aria-expanded", "true");
    }
  });
  // Fermer au clic sur un lien
  drawer.querySelectorAll("a").forEach((a) => a.addEventListener("click", () => {
    drawer.setAttribute("hidden", "");
    menuBtn.setAttribute("aria-expanded", "false");
  }));
  // Fermer sur Esc
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && !drawer.hasAttribute("hidden")) {
      drawer.setAttribute("hidden", "");
      menuBtn.setAttribute("aria-expanded", "false");
      menuBtn.focus();
    }
  });
}

// === 5. Scroll-spy : mise en évidence du lien actif dans le nav ===
const navLinks = document.querySelectorAll(".site-header__nav a");
const sections = ["methode", "apercu", "divergences", "synthese", "a-propos"]
  .map((id) => document.getElementById(id))
  .filter(Boolean);

if ("IntersectionObserver" in window && sections.length) {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const id = entry.target.id;
          navLinks.forEach((link) => {
            link.classList.toggle("active", link.getAttribute("href") === `#${id}`);
          });
        }
      });
    },
    { rootMargin: "-30% 0px -60% 0px" }
  );
  sections.forEach((s) => observer.observe(s));
}
