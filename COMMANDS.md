# Reproducible build — exact commands, commits, logs

## Clones (exact revisions)

```bash
git clone https://github.com/AxiomMath/PrimeGapsLib.git        # 1faa7b1 (1faa7b14e82ddebc2772dfb9153922f01b106477)
git clone https://github.com/kimihiro64/bombieri-vinogradov.git # 7a17483 (7a1748306e026825ed6a5555516cc2f28989b2ac)
```

## Unified project (`unified/`)

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

1. `unified/BombieriVinogradov/Definitions/PrimeCounting.lean`
   — removed `def Real.primeCountingZMod`; added
   `public import PrimeGapsTheory.NumberTheory.PrimeCountingZMod`.
2. `unified/BombieriVinogradov/Definitions/Statement.lean`
   — removed `def BombieriVinogradov`; added
   `public import PrimeGapsTheory.NumberTheory.BombieriVinogradov`.
3. `unified/lakefile.toml`
   — removed the `[[require]] Robin1984` git pin; added
   `[[lean_lib]] name = "Robin1984" globs = ["Robin1984.NicolasLandau.+"]`.

## Build (clean)

```bash
cd unified
lake update
lake clean            # removes project + dependency build artifacts (full clean)
lake build Submission  # rebuilds mathlib + PNTAnd + vendored Robin1984 + PGL + BV + Submission
```

Log: `../build-vendored.log` (must end `BUILD EXIT=0`).

## Axiom audit

```bash
cd unified && lake env lean Submission.lean
```

Expected (also recorded in `../axiom-audit.txt`):
```
'BigOSpeedrun.PrimeGaps.prime_gap_le_246' depends on axioms: [propext, Classical.choice, Quot.sound]
'BigOSpeedrun.PrimeGaps.frequently_prime_gap_le_246' depends on axioms: [propext, Classical.choice, Quot.sound]
'BigOSpeedrun.PrimeGaps.nth_prime_gap_le_246' depends on axioms: [propext, Classical.choice, Quot.sound]
```
Acceptable: only `propext`, `Quot.sound`, `Classical.choice`. No `sorryAx`.
