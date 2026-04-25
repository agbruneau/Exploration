import { test } from "node:test";
import assert from "node:assert/strict";
import { slugify } from "./slug.js";

test("slugify lowercases and replaces spaces with dashes", () => {
  assert.equal(slugify("Hello World"), "hello-world");
});

test("slugify preserves French accents (GitHub style)", () => {
  assert.equal(slugify("Luc 2.1-20 — Nativité"), "luc-21-20--nativité");
});

test("slugify strips standalone punctuation but keeps inline accents", () => {
  assert.equal(slugify("Luc 1.26-38 — Annonciation à Marie"), "luc-126-38--annonciation-à-marie");
});

test("slugify handles em-dash and double-dash conversion", () => {
  // L'em-dash devient deux tirets dans la convention GitHub
  assert.equal(slugify("Section — Sous-section"), "section--sous-section");
});

test("slugify handles section roman numerals", () => {
  assert.equal(slugify("I. Théologie propre et trinitaire"), "i-théologie-propre-et-trinitaire");
});

test("slugify removes leading and trailing dashes", () => {
  assert.equal(slugify("  Hello  "), "hello");
});

test("slugify handles empty input", () => {
  assert.equal(slugify(""), "");
  assert.equal(slugify("   "), "");
});
