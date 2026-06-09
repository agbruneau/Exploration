/* =============================================================================
   charts.js — Graphiques SVG faits main (zéro dépendance, hors-ligne).
   Barres · Radar · Heatmap · Pentes (sensibilité) · Bump chart (rangs).
   Chargé en <script> classique. Tout est accessible (role=img, aria-label,
   focus clavier, info-bulles au survol ET au focus).
============================================================================= */
const SVGNS = "http://www.w3.org/2000/svg";
let _uid = 0;
const uid = (p) => (p || "id") + "-" + (++_uid);

/* ---- Fabriques SVG ------------------------------------------------------- */
function S(tag, attrs, kids){
  const el = document.createElementNS(SVGNS, tag);
  if (attrs) for (const k in attrs){ if (attrs[k] == null) continue; el.setAttribute(k, attrs[k]); }
  if (kids) [].concat(kids).forEach(c => c && el.appendChild(c));
  return el;
}
function svgRoot(w, h, label){
  const s = S("svg", { viewBox:`0 0 ${w} ${h}`, role:"img", "aria-label":label, width:"100%", preserveAspectRatio:"xMidYMid meet" });
  s.style.display = "block"; s.style.maxWidth = "100%"; s.style.height = "auto";
  return s;
}
function txt(x, y, str, attrs){ const t = S("text", Object.assign({ x, y }, attrs || {})); t.textContent = str; return t; }

/* ---- Formats / couleurs -------------------------------------------------- */
const frNum  = (n, d) => Number(n).toFixed(d).replace(".", ",");
const fmtCell = (v) => Number.isInteger(v) ? String(v) : String(v).replace(".", ",");
const ordinal = (r) => r === 1 ? "1ᵉʳ" : `${r}ᵉ`;
function shortName(nom){
  const n = (nom || "").toLowerCase();
  const map = [["kong","Kong"],["ibm","IBM"],["gravitee","Gravitee"],["apigee","Apigee"],["mulesoft","MuleSoft"],["wso2","WSO2"],["azure","Azure"]];
  for (const [k, v] of map) if (n.includes(k)) return v;
  return nom;
}
function hexToRgb(h){ h = h.replace("#",""); return [parseInt(h.slice(0,2),16), parseInt(h.slice(2,4),16), parseInt(h.slice(4,6),16)]; }
function lerpColor(a, b, t){
  const A = hexToRgb(a), B = hexToRgb(b);
  const m = (i) => Math.round(A[i] + (B[i] - A[i]) * t);
  return `rgb(${m(0)},${m(1)},${m(2)})`;
}

/* ---- Info-bulle partagée ------------------------------------------------- */
function ensureTip(){
  let t = document.querySelector(".tip");
  if (!t){ t = document.createElement("div"); t.className = "tip"; t.setAttribute("role","status"); document.body.appendChild(t); }
  return t;
}
function positionTip(t, x, y){
  const pad = 14, r = t.getBoundingClientRect();
  let left = x + pad, top = y + pad;
  if (left + r.width > window.innerWidth - 8) left = x - r.width - pad;
  if (top + r.height > window.innerHeight - 8) top = y - r.height - pad;
  t.style.left = Math.max(8, left) + "px"; t.style.top = Math.max(8, top) + "px";
}
function showTip(html, x, y){ const t = ensureTip(); t.innerHTML = html; t.classList.add("show"); positionTip(t, x, y); }
function moveTip(x, y){ const t = document.querySelector(".tip"); if (t && t.classList.contains("show")) positionTip(t, x, y); }
function hideTip(){ const t = document.querySelector(".tip"); if (t) t.classList.remove("show"); }
function wireTip(el, html){
  el.style.cursor = "pointer";
  el.addEventListener("mouseenter", e => showTip(html, e.clientX, e.clientY));
  el.addEventListener("mousemove",  e => moveTip(e.clientX, e.clientY));
  el.addEventListener("mouseleave", hideTip);
  el.addEventListener("focus", () => { const b = el.getBoundingClientRect(); showTip(html, b.left + b.width / 2, b.top); });
  el.addEventListener("blur", hideTip);
}

/* =============================================================================
   1. Classement — barres horizontales triées (gagnant : halo orange)
============================================================================= */
function barChart(opts){
  const items = opts.items, max = opts.max || 100, dec = opts.decimals ?? 1;
  const W = 800, rowH = 46, padT = 12, padB = 8;
  const H = padT + padB + items.length * rowH;
  const rankX = 13, nameX = 38, barX = 196, barW = W - barX - 70;
  const svg = svgRoot(W, H, opts.aria || "Classement des candidats");
  const defs = S("defs"); const gid = uid("glow");
  const f = S("filter", { id: gid, x:"-30%", y:"-80%", width:"160%", height:"260%" });
  f.appendChild(S("feDropShadow", { dx:0, dy:0, stdDeviation:6, "flood-color":"#F97316", "flood-opacity":.6 }));
  defs.appendChild(f); svg.appendChild(defs);

  items.forEach((it, i) => {
    const cy = padT + i * rowH + rowH / 2;
    const w = Math.max(3, (it.value / max) * barW);
    const col = colorFor(it.name);
    svg.appendChild(S("circle", { cx:rankX, cy, r:11, fill:"none", stroke:"#3a414f" }));
    svg.appendChild(txt(rankX, cy + 4, String(it.rang), { "text-anchor":"middle", "font-size":12, fill:"#9AA0AB" }));
    svg.appendChild(txt(nameX, cy + 4, shortName(it.name), { "font-size":14.5, fill:"#E6E8EC", "font-weight": it.winner ? 600 : 500 }));
    svg.appendChild(S("rect", { x:barX, y:cy - 11, width:barW, height:22, rx:6, fill:"rgba(255,255,255,.04)" }));
    const bar = S("rect", { x:barX, y:cy - 11, width:w, height:22, rx:6, fill:col, opacity: it.winner ? 1 : .82 });
    if (it.winner){ bar.setAttribute("filter", `url(#${gid})`); bar.setAttribute("stroke", "#FFD8B0"); bar.setAttribute("stroke-width", 1.3); }
    const html = `<b>${shortName(it.name)}</b><br>${opts.label || "Total"} : ${frNum(it.value, dec)}${opts.suffix || " / 100"}`;
    bar.setAttribute("tabindex", 0); bar.setAttribute("role", "img");
    bar.setAttribute("aria-label", `${shortName(it.name)}, rang ${it.rang}, ${frNum(it.value, dec)} sur 100`);
    wireTip(bar, html);
    svg.appendChild(bar);
    svg.appendChild(txt(barX + w + 9, cy + 4, frNum(it.value, dec), { "font-size":13.5, fill: it.winner ? "#FB923C" : "#E6E8EC", "font-weight": it.winner ? 700 : 500 }));
  });
  return svg;
}

/* =============================================================================
   2. Radar — un axe par critère, polygones des candidats en focus
============================================================================= */
function radarChart(opts){
  const axes = opts.axes, n = axes.length;
  const W = 540, H = 470, cx = W / 2, cy = H / 2 - 4, R = 148;
  const svg = svgRoot(W, H, opts.aria || "Radar des critères");
  const ang = (i) => (-90 + i * 360 / n) * Math.PI / 180;
  const pt = (i, r) => [cx + Math.cos(ang(i)) * r, cy + Math.sin(ang(i)) * r];

  [0.25, 0.5, 0.75, 1].forEach(g => {
    const pts = axes.map((_, i) => pt(i, R * g).join(",")).join(" ");
    svg.appendChild(S("polygon", { points:pts, fill:"none", stroke:"#262B35", "stroke-width": g === 1 ? 1.4 : 1, opacity: g === 1 ? .9 : .45 }));
  });
  axes.forEach((ax, i) => {
    const [x, y] = pt(i, R);
    svg.appendChild(S("line", { x1:cx, y1:cy, x2:x, y2:y, stroke:"#262B35", opacity:.5 }));
    const [lx, ly] = pt(i, R + 19);
    const anchor = Math.abs(lx - cx) < 6 ? "middle" : (lx > cx ? "start" : "end");
    const t = txt(lx, ly + 4, ax.code, { "font-size":12, fill:"#9AA0AB", "text-anchor":anchor });
    const ti = S("title"); ti.textContent = `${ax.code} — ${ax.label}`; t.appendChild(ti);
    svg.appendChild(t);
  });
  opts.series.forEach(se => {
    const clamp = (v) => Math.max(0, Math.min(1, v));
    const pts = se.norm.map((v, i) => pt(i, R * clamp(v)).join(",")).join(" ");
    svg.appendChild(S("polygon", { points:pts, fill:se.color, "fill-opacity":.13, stroke:se.color, "stroke-width":2.2, "stroke-linejoin":"round" }));
    se.norm.forEach((v, i) => {
      const [x, y] = pt(i, R * clamp(v));
      const c = S("circle", { cx:x, cy:y, r:3.2, fill:se.color, tabindex:0, role:"img" });
      const html = `<b>${se.name}</b> — ${axes[i].code} ${axes[i].label}<br>${se.display[i]}`;
      c.setAttribute("aria-label", `${se.name}, ${axes[i].label} : ${se.display[i]}`);
      wireTip(c, html);
      svg.appendChild(c);
    });
  });
  return svg;
}

/* =============================================================================
   3. Heatmap — critère × candidat, clair-neutre → orange saturé
============================================================================= */
function heatmap(opts){
  const rows = opts.rows, cols = opts.cols;
  const labelW = 232, headerH = 30, gap = 4;
  const cellW = Math.min(122, Math.max(64, (800 - labelW) / cols.length)), cellH = 30;
  const W = labelW + cols.length * (cellW + gap), H = headerH + rows.length * (cellH + gap) + 6;
  const svg = svgRoot(W, H, opts.aria || "Carte de chaleur critère par candidat");

  cols.forEach((c, j) => {
    const x = labelW + j * (cellW + gap) + cellW / 2;
    svg.appendChild(txt(x, headerH - 10, shortName(c.name), { "font-size":12.5, fill:"#9AA0AB", "text-anchor":"middle", "font-weight":600 }));
  });
  rows.forEach((r, i) => {
    const y = headerH + i * (cellH + gap);
    svg.appendChild(txt(0, y + cellH / 2 + 4, r.label, { "font-size":11.5, fill:"#E6E8EC" }));
    cols.forEach((c, j) => {
      const x = labelW + j * (cellW + gap);
      const inten = Math.max(0, Math.min(1, opts.intensity(r.code, c.name)));
      const val = opts.value(r.code, c.name);
      const fill = lerpColor("#1B2029", "#F97316", Math.pow(inten, 0.85));
      const dark = inten > 0.6;
      const cell = S("rect", { x, y, width:cellW, height:cellH, rx:6, fill, stroke:"rgba(0,0,0,.28)", "stroke-width":1, tabindex:0, role:"img" });
      const html = `<b>${shortName(c.name)}</b> — ${r.label}<br>${opts.display(r.code, c.name)}`;
      cell.setAttribute("aria-label", `${r.label}, ${shortName(c.name)} : ${opts.display(r.code, c.name)}`);
      wireTip(cell, html);
      svg.appendChild(cell);
      svg.appendChild(txt(x + cellW / 2, y + cellH / 2 + 4, fmtCell(val), { "font-size":12.5, "text-anchor":"middle", fill: dark ? "#1a1003" : "#E6E8EC", "font-weight":600, "pointer-events":"none" }));
    });
  });
  return svg;
}

/* =============================================================================
   4. Pentes — analyse de sensibilité entre scénarios
============================================================================= */
function slopeChart(opts){
  const sc = opts.scenarios, ns = sc.length;
  const W = 820, H = 380, padL = 46, padR = 172, padT = 26, padB = 46;
  const plotW = W - padL - padR, plotH = H - padT - padB;
  const all = opts.series.flatMap(s => s.values);
  let mn = Math.min(...all), mx = Math.max(...all); const span = (mx - mn) || 1; mn -= span * 0.14; mx += span * 0.14;
  const X = (j) => padL + (ns === 1 ? plotW / 2 : (j / (ns - 1)) * plotW);
  const Y = (v) => padT + plotH - ((v - mn) / (mx - mn)) * plotH;
  const svg = svgRoot(W, H, opts.aria || "Analyse de sensibilité");

  for (let k = 0; k <= 4; k++){
    const v = mn + (mx - mn) * k / 4, y = Y(v);
    svg.appendChild(S("line", { x1:padL, y1:y, x2:padL + plotW, y2:y, stroke:"#262B35", opacity:.35 }));
    svg.appendChild(txt(padL - 8, y + 4, frNum(v, 0), { "font-size":11, fill:"#9AA0AB", "text-anchor":"end" }));
  }
  sc.forEach((s, j) => {
    const x = X(j);
    svg.appendChild(S("line", { x1:x, y1:padT, x2:x, y2:padT + plotH, stroke:"#262B35", opacity:.5 }));
    svg.appendChild(txt(x, H - 16, s, { "font-size":12, fill:"#9AA0AB", "text-anchor":"middle" }));
  });

  const labels = [];
  opts.series.forEach(se => {
    const emph = se.emphasize;
    const d = se.values.map((v, j) => `${j ? "L" : "M"}${X(j)},${Y(v)}`).join(" ");
    svg.appendChild(S("path", { d, fill:"none", stroke:se.color, "stroke-width": emph ? 3.4 : 2, "stroke-linejoin":"round", "stroke-linecap":"round", opacity: emph ? 1 : .85 }));
    se.values.forEach((v, j) => {
      const cx = X(j), cy = Y(v);
      const c = S("circle", { cx, cy, r: emph ? 5 : 4, fill:se.color, tabindex:0, role:"img" });
      const html = `<b>${shortName(se.name)}</b> — ${sc[j]}<br>score ${frNum(v, 1)}`;
      c.setAttribute("aria-label", `${shortName(se.name)}, ${sc[j]} : ${frNum(v, 1)}`);
      wireTip(c, html);
      svg.appendChild(c);
    });
    const lv = se.values[se.values.length - 1];
    labels.push({ y: Y(lv), text: `${shortName(se.name)} ${frNum(lv, 1)}`, color: se.color, weight: emph ? 700 : 500 });
  });
  // dé-collision verticale des étiquettes de droite
  labels.sort((a, b) => a.y - b.y);
  for (let i = 1; i < labels.length; i++) if (labels[i].y - labels[i - 1].y < 15) labels[i].y = labels[i - 1].y + 15;
  labels.forEach(l => svg.appendChild(txt(X(ns - 1) + 12, l.y + 4, l.text, { "font-size":12.5, fill:l.color, "font-weight":l.weight })));
  return svg;
}

/* =============================================================================
   5. Bump chart — rangs inter-simulations (Kong en fil rouge orange)
============================================================================= */
function bumpChart(opts){
  const cols = opts.cols, nc = cols.length, maxRank = opts.maxRank || 5;
  const W = 860, H = 420, padL = 60, padR = 150, padT = 32, padB = 38;
  const plotW = W - padL - padR, plotH = H - padT - padB;
  const X = (j) => padL + (j / (nc - 1)) * plotW;
  const Y = (r) => padT + ((r - 1) / (maxRank - 1)) * plotH;
  const svg = svgRoot(W, H, opts.aria || "Bump chart des rangs entre simulations");

  for (let r = 1; r <= maxRank; r++){
    const y = Y(r);
    svg.appendChild(S("line", { x1:padL, y1:y, x2:padL + plotW, y2:y, stroke:"#262B35", opacity:.3 }));
    svg.appendChild(txt(padL - 14, y + 4, ordinal(r), { "font-size":11.5, fill:"#9AA0AB", "text-anchor":"end" }));
  }
  cols.forEach((c, j) => {
    const x = X(j);
    svg.appendChild(txt(x, padT - 14, c, { "font-size":12.5, fill:"#9AA0AB", "text-anchor": j === 0 ? "start" : (j === nc - 1 ? "end" : "middle"), "font-weight":600 }));
  });
  const ordered = [...opts.series].sort((a, b) => (a.emphasize ? 1 : 0) - (b.emphasize ? 1 : 0));
  ordered.forEach(se => {
    const present = se.ranks.map((r, j) => r == null ? null : { j, r }).filter(Boolean);
    for (let k = 1; k < present.length; k++){
      const a = present[k - 1], b = present[k], gap = b.j - a.j > 1;
      svg.appendChild(S("path", { d:`M${X(a.j)},${Y(a.r)} L${X(b.j)},${Y(b.r)}`, fill:"none", stroke:se.color, "stroke-width": se.emphasize ? 3.6 : 2, opacity: se.emphasize ? 1 : .5, "stroke-dasharray": gap ? "4 5" : null, "stroke-linecap":"round" }));
    }
    present.forEach(p => {
      const cx = X(p.j), cy = Y(p.r), sco = se.scores[p.j];
      const c = S("circle", { cx, cy, r: se.emphasize ? 6 : 4.5, fill:se.color, stroke:"#0B0D12", "stroke-width":1.5, tabindex:0, role:"img" });
      const html = `<b>${se.name}</b> — ${cols[p.j]}<br>${ordinal(p.r)}${sco ? ` · score ${sco}` : ""}`;
      c.setAttribute("aria-label", `${se.name}, ${cols[p.j]} : ${ordinal(p.r)}${sco ? `, score ${sco}` : ""}`);
      wireTip(c, html);
      svg.appendChild(c);
    });
    const last = present[present.length - 1];
    svg.appendChild(txt(X(last.j) + 12, Y(last.r) + 4, se.name, { "font-size":12.5, fill:se.color, "font-weight": se.emphasize ? 700 : 500 }));
  });
  return svg;
}
