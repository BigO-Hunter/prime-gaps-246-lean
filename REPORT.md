# H1 ≤ 246 — PrimeGapsIntegration

**Result: `Submission.lean` proves H1 ≤ 246 with a passing axiom audit
(only `propext`, `Classical.choice`, `Quot.sound`).** See `axiom-audit.txt`.

## What was composed

`unified/Submission.lean` applies PrimeGapsLib's implication to
bombieri-vinogradov's proof of the hypothesis:

```
bombieriVinogradov_implies_prime_gap_le_246  BombieriVinogradov.bombieriVinogradov
```

Three theorem forms, all with **no remaining hypotheses**:

- `∀ n₀, ∃ p q, n₀ ≤ p ∧ p < q ∧ p.Prime ∧ q.Prime ∧ q ≤ p + 246`
- `∃ᶠ m in atTop, nth_prime (m+1) − nth_prime m ≤ 246`  (liminf form)
- `∀ n₀, ∃ n ≥ n₀, nth_prime (n+1) ≤ nth_prime n + 246`

## Sources (exact revisions)

| Component | Author | Revision |
|---|---|---|
| PrimeGapsLib | **AxiomMath** (Apache-2.0) | `1faa7b14e82ddebc2772dfb9153922f01b106477` |
| bombieri-vinogradov | **kimihiro64** / Jonas Whidden (Apache-2.0) | `7a1748306e026825ed6a5555516cc2f28989b2ac` |
| mathlib | leanprover-community | `0df444a360eaa60ab8c11dca51a86af692955474` (v4.33.1) |
| PrimeNumberTheoremAnd | kimihiro64 | `0f15a38c619298b5cd786d39a84dd4bb8997324c` |
| Robin1984 (3 modules vendored) | kimihiro64 | `bfa72aec0c25c8ee29cefe4449d778ff30412bee` |

## Integration approach

1. **Definitional unification** — both libraries define `_root_.BombieriVinogradov`
   and `Real.primeCountingZMod` *identically*. The two duplicate definitions are
   removed from the BV side so it imports PrimeGapsLib's canonical versions.
2. **Packaging fix** — Robin1984's git dependency is dropped. Only the three Xi
   modules that BV's `Solution` actually imports (`XiDivisorCriticalLine`,
   `XiZeroConstant`, `XiLogDerivative`) are vendored under `unified/Robin1984/`,
   exposed via `[[lean_lib]] Robin1984 globs = ["Robin1984.NicolasLandau.+"]`.
   Robin1984's own `Solution`/full-Robin root — which needs a divergent
   `PrimeNumberTheoremAnd` branch and was what broke `lake build` — is never built.

## Axiom audit

`#print axioms` on the final theorems shows only `propext`, `Classical.choice`,
`Quot.sound` — no `sorryAx`, no project-specific axiom. Both upstream proofs are
complete and axiom-clean.

## Attribution & licensing

Prime gaps 246 theory + 50-tuple certificate: **Axiom Math** (AxiomProver), Apache-2.0,
https://github.com/AxiomMath/PrimeGapsLib — Bombieri–Vinogradov: **Jonas Whidden
(kimihiro64)**, Apache-2.0, https://github.com/kimihiro64/bombieri-vinogradov.
Vendored Robin1984 modules are kimihiro64's, Apache-2.0.

Not submitted to BigO (per verifier policy: routes are maintainer-owned, ASK FIRST).
