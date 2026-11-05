# Attribution

This repository is an **integration**, not a re-derivation. The mathematical
work and its Lean formalization belong to the upstream authors:

- **Prime gaps ≤ 246 theory + 50-tuple certificate** — **Axiom Math** (with
  AxiomProver), Apache-2.0. https://github.com/AxiomMath/PrimeGapsLib
  (commit `1faa7b14e82ddebc2772dfb9153922f01b106477`). Source under
  `PrimeGapsTheory/`, `PrimeGapsCert/`, `PrimeGaps/`.

- **Bombieri–Vinogradov theorem** — **Jonas Whidden (kimihiro64)**, Apache-2.0.
  https://github.com/kimihiro64/bombieri-vinogradov
  (commit `7a1748306e026825ed6a5555516cc2f28989b2ac`). Source under
  `BombieriVinogradov/`, `Solution.lean`, `BombieriVinogradov.lean`.

- **Robin1984 (vendored, scoped)** — **kimihiro64**, Apache-2.0.
  https://github.com/kimihiro64/Robin1984
  (commit `bfa72aec0c25c8ee29cefe4449d778ff30412bee`). Only the three Xi modules
  under `Robin1984/NicolasLandau/` are vendored; see `Robin1984/README.md`.

- **PrimeNumberTheoremAnd** — kimihiro64 fork, commit
  `0f15a38c619298b5cd786d39a84dd4bb8997324c`.

- **mathlib** — the Lean mathematical library (leanprover-community),
  commit `0df444a360eaa60ab8c11dca51a86af692955474` (v4.33.1).

The only changes made here are integration glue: two definition-import swaps in
`BombieriVinogradov/Definitions/`, a scoped Robin1984 vendor, and the
`lakefile.toml`/`Submission.lean` that compose the two results. Every upstream
file retains its original license header and provenance block.

License: Apache-2.0 (see `LICENSE`).
