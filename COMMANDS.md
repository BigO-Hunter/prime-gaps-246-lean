# Reproducible build — exact commands, commits, logs

All paths below are **relative to the root of this repository**. The integration
tree was flattened at packaging time: this repository root *is* the former
`unified/` working directory, so no path here carries a `unified/` prefix.

## Upstream sources (exact revisions)

The two libraries are already vendored in this repository; these clones are only
needed if you want to diff the vendored trees against their origins.

```bash
git clone https://github.com/AxiomMath/PrimeGapsLib.git
git -C PrimeGapsLib checkout 1faa7b14e82ddebc2772dfb9153922f01b106477

git clone https://github.com/kimihiro64/bombieri-vinogradov.git
git -C bombieri-vinogradov checkout 7a1748306e026825ed6a5555516cc2f28989b2ac
```

## Project (repository root)

`lean-toolchain`: `leanprover/lean4:v4.33.1`

`lakefile.toml` requires (single unified stack, **no Robin1984 git dependency**):
- `mathlib` @ `0df444a360eaa60ab8c11dca51a86af692955474` (v4.33.1)
- `PrimeNumberTheoremAnd` (kimihiro64) @ `0f15a38c619298b5cd786d39a84dd4bb8997324c`

Vendored source roots:
- `PrimeGapsTheory`, `PrimeGapsCert`, `PrimeGaps` (from PrimeGapsLib).
- `BombieriVinogradov`, `Solution.lean`, `BombieriVinogradov.lean` (from bombieri-vinogradov).
- `Robin1984/NicolasLandau/` — **only three modules**, vendored from kimihiro64/Robin1984 @ `bfa72aec`
  (`XiDivisorCriticalLine`, `XiZeroConstant`, `XiLogDerivative`), the exact transitive
  closure that BV's `Solution` imports. Robin1984's own `Solution`/full-Robin root is
  intentionally *not* vendored, so its `NicolasLandau`/`Equivalence` proof (which needs a
  divergent `PrimeNumberTheoremAnd` branch) is never built.

## Collision + packaging edits (3 total)

1. `BombieriVinogradov/Definitions/PrimeCounting.lean`
   — removed `def Real.primeCountingZMod`; added
   `public import PrimeGapsTheory.NumberTheory.PrimeCountingZMod`.
2. `BombieriVinogradov/Definitions/Statement.lean`
   — removed `def BombieriVinogradov`; added
   `public import PrimeGapsTheory.NumberTheory.BombieriVinogradov`.
3. `lakefile.toml`
   — removed the `[[require]] Robin1984` git pin; added
   `[[lean_lib]] name = "Robin1984" globs = ["Robin1984.NicolasLandau.+"]`.

## Build

```bash
lake update            # resolves the two pinned deps and writes lake-manifest.json
                       # (lake-manifest.json is generated, not committed)
lake exe cache get     # optional: fetch prebuilt mathlib oleans for the pinned rev,
                       # shortens the mathlib portion of a from-scratch build
lake build Submission  # build target for the result
```

`Submission` is the target. (`lake build PrimeGaps` is *not* a usable target: the
`PrimeGaps` lean_lib in `lakefile.toml` declares a root module `PrimeGaps.lean`
that does not exist — the theory lives in `PrimeGaps/Bounded246.lean` — so that
aggregate target reports "bad imports". Nothing in the result depends on it.)

The clean build recorded at packaging time (`lake clean`, then `lake build
Submission`) ended with `Build completed successfully (5437 jobs)` and
`BUILD EXIT=0`. The full log is 5,681 lines and is **not** committed; an excerpt
of it, plus a re-verification excerpt from a forced recompile of the two
top-level glue files and the upstream theorem module, is in `BUILD-EXCERPT.txt`.

## Axiom audit

```bash
lake env lean Submission.lean
```

Expected output — the same three lines recorded in `axiom-audit.txt`:
```
'BigOSpeedrun.PrimeGaps.prime_gap_le_246' depends on axioms: [propext, Classical.choice, Quot.sound]
'BigOSpeedrun.PrimeGaps.frequently_prime_gap_le_246' depends on axioms: [propext, Classical.choice, Quot.sound]
'BigOSpeedrun.PrimeGaps.nth_prime_gap_le_246' depends on axioms: [propext, Classical.choice, Quot.sound]
```
Acceptable: only `propext`, `Quot.sound`, `Classical.choice`. No `sorryAx`.

## What is and is not re-run here

- The `(5437 jobs)` figure is from the packaging-time clean build; job totals
  vary between runs because Lake counts the actions it walks, so a warm tree
  reports `(5430 jobs)` for the same sources. The load-bearing evidence is the
  `Build completed successfully` line, exit status 0, and the three axiom lines.
- The re-verification recorded in `BUILD-EXCERPT.txt` used a warm `.lake` tree
  (mathlib, `PrimeNumberTheoremAnd`, and the vendored trees already built from
  these same committed sources) and force-recompiled `PrimeGaps/Bounded246.lean`,
  `Solution.lean`, and `Submission.lean` from source. A full from-scratch rebuild
  of mathlib was **not** re-run at that commit.
