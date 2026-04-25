/**
 * Gère la persistance des préférences utilisateur :
 *  - Mode lecture concentrée (focus mode)
 *  - Taille de police (compact / confort / ample)
 */

const KEY_FOCUS = "analyse:focusMode";
const KEY_SIZE = "analyse:textSize";

const html = document.documentElement;
const btnFocus = document.getElementById("btn-focus");
const btnSize = document.getElementById("btn-text-size");

export function setupPrefs() {
  // Restaurer focus mode
  if (localStorage.getItem(KEY_FOCUS) === "true") setFocus(true);
  btnFocus?.addEventListener("click", () => setFocus(!html.classList.contains("focus-mode")));

  // Restaurer taille de police
  const savedSize = localStorage.getItem(KEY_SIZE) || "confort";
  setTextSize(savedSize);

  // Menu déroulant pour la taille
  if (btnSize) setupSizeMenu();
}

function setFocus(on) {
  html.classList.toggle("focus-mode", on);
  btnFocus?.setAttribute("aria-pressed", String(on));
  try { localStorage.setItem(KEY_FOCUS, String(on)); } catch { /* quota */ }
}

function setTextSize(size) {
  ["compact", "confort", "ample"].forEach((s) => html.classList.remove(`text-size--${s}`));
  if (size !== "confort") html.classList.add(`text-size--${size}`);
  try { localStorage.setItem(KEY_SIZE, size); } catch { /* quota */ }
}

function setupSizeMenu() {
  const menu = document.createElement("div");
  menu.className = "text-size-menu";
  menu.setAttribute("role", "menu");
  ["compact", "confort", "ample"].forEach((size) => {
    const b = document.createElement("button");
    b.type = "button";
    b.setAttribute("role", "menuitemradio");
    b.textContent = { compact: "Compact (17px)", confort: "Confort (19px)", ample: "Ample (22px)" }[size];
    b.addEventListener("click", () => {
      setTextSize(size);
      menu.querySelectorAll("button").forEach((x) => x.setAttribute("aria-checked", "false"));
      b.setAttribute("aria-checked", "true");
      closeMenu();
    });
    menu.appendChild(b);
  });
  document.body.appendChild(menu);

  const positionMenu = () => {
    const rect = btnSize.getBoundingClientRect();
    menu.style.top = `${rect.bottom + 4}px`;
    menu.style.left = `${rect.right - menu.offsetWidth}px`;
  };

  const openMenu = () => {
    positionMenu();
    menu.dataset.open = "true";
    btnSize.setAttribute("aria-expanded", "true");
    // Marquer le courant
    const current = localStorage.getItem(KEY_SIZE) || "confort";
    Array.from(menu.querySelectorAll("button")).forEach((b, i) => {
      b.setAttribute("aria-checked", String(["compact", "confort", "ample"][i] === current));
    });
  };
  const closeMenu = () => {
    delete menu.dataset.open;
    btnSize.setAttribute("aria-expanded", "false");
  };

  btnSize.addEventListener("click", (e) => {
    e.stopPropagation();
    if (menu.dataset.open) closeMenu(); else openMenu();
  });
  document.addEventListener("click", (e) => {
    if (menu.dataset.open && !menu.contains(e.target) && e.target !== btnSize) closeMenu();
  });
  document.addEventListener("keydown", (e) => { if (e.key === "Escape" && menu.dataset.open) closeMenu(); });
  window.addEventListener("resize", () => { if (menu.dataset.open) positionMenu(); });
}
