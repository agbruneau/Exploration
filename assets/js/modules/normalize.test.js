import { test } from "node:test";
import assert from "node:assert/strict";
import { normalize } from "./normalize.js";

test("normalize lowercases", () => {
  assert.equal(normalize("HELLO"), "hello");
});

test("normalize strips Latin diacritics", () => {
  assert.equal(normalize("Église"), "eglise");
  assert.equal(normalize("français"), "francais");
  assert.equal(normalize("métanoïa"), "metanoia");
});

test("normalize preserves Greek polytonic (out of scope per PRD)", () => {
  // Les diacritiques grecs polytoniques NE sont PAS normalisés en v1.0
  assert.equal(normalize("ἐκκλησία"), "ἐκκλησία");
});

test("normalize collapses whitespace", () => {
  assert.equal(normalize("hello   world"), "hello world");
  assert.equal(normalize("  hello  "), "hello");
});

test("normalize handles empty input", () => {
  assert.equal(normalize(""), "");
  assert.equal(normalize(null), "");
  assert.equal(normalize(undefined), "");
});
