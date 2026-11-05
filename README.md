# prime-gaps-246-lean

A Lean 4 formalization proving **H1 ≤ 246** (bounded gaps between primes), by
composing two independently developed libraries:

- **[AxiomMath/PrimeGapsLib](https://github.com/AxiomMath/PrimeGapsLib)** (Apache-2.0)
  proves `bombieriVinogradov_implies_prime_gap_le_246` — the Bombieri–Vinogradov
  theorem implies prime gaps are bounded by 246 — with a Lean-checked 50-tuple
  certificate.
- **[kimihiro64/bombieri-vinogradov](https://github.com/kimihiro64/bombieri-vinogradov)**
  (Jonas Whidden, Apache-2.0) proves `bombieriVinogradov` — the full
  Bombieri–Vinogradov theorem — from only `propext`, `Quot.sound`, and
  `Classical.choice`.

`Submission.lean` feeds BV's theorem into PrimeGapsLib's implication, yielding
three hypothesis-free statements (see `REPORT.md`):

```lean
theorem prime_gap_le_246 :
    ∀ n₀, ∃ p q, n₀ ≤ p ∧ p < q ∧ p.Prime ∧ q.Prime ∧ q ≤ p + 246
theorem frequently_prime_gap_le_246 :  -- liminf form
    ∃ᶠ m in atTop, Nat.nth Nat.Prime (m + 1) - Nat.nth Nat.Prime m ≤ 246
theorem nth_prime_gap_le_246 :
    ∀ n₀, ∃ n ≥ n₀, Nat.nth Nat.Prime (n + 1) ≤ Nat.nth Nat.Prime n + 246
```

## Build & axiom audit

```bash
lake update
lake build Submission          # exit 0, "Build completed successfully (5437 jobs)"
lake env lean Submission.lean  # prints only propext / Classical.choice / Quot.sound
```

Full reproduction in `COMMANDS.md`; result in `BUILD-EXCERPT.txt` and
`axiom-audit.txt`.

## Key integration decisions

- **Definitional unification** — both libraries define `_root_.BombieriVinogradov`
  and `Real.primeCountingZMod` identically; the duplicate definitions are removed
  from the BV side so it imports PrimeGapsLib's canonical versions.
- **Scoped Robin1984 vendor** — only the three Xi modules BV's `Solution` imports
  are vendored under `Robin1984/`; Robin1984's own `Solution`/full-Robin root is
  intentionally not vendored (it needs a divergent `PrimeNumberTheoremAnd` branch
  and is unrelated to H1 ≤ 246).

Pins: Lean `v4.33.1`, mathlib `0df444a360eaa60ab8c11dca51a86af692955474`,
PrimeNumberTheoremAnd `0f15a38c619298b5cd786d39a84dd4bb8997324c` (kimihiro64).

See `NOTICE.md` for full attribution.
