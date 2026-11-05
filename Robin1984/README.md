# Vendored Robin1984 modules (scoped)

This directory contains **three** Lean modules vendored verbatim from
[kimihiro64/Robin1984](https://github.com/kimihiro64/Robin1984) @
`bfa72aec0c25c8ee29cefe4449d778ff30412bee` (Apache-2.0):

- `NicolasLandau/XiDivisorCriticalLine.lean`
- `NicolasLandau/XiZeroConstant.lean`
- `NicolasLandau/XiLogDerivative.lean`

These are the exact transitive closure of the Robin1984 modules that
bombieri-vinogradov's `Solution` imports (via `RiemannXiDivisorStrip` and
`RiemannZetaLogDerivativeUpperBound`).

Robin1984's own `Solution` / full-Robin root (its `NicolasLandau`/`Equivalence`
proof) is **intentionally not vendored**: that proof requires a divergent
`PrimeNumberTheoremAnd` branch and is unrelated to the H1 ≤ 246 result. It is
therefore never built.

Attribution and provenance remain the original authors'; the files are copied
verbatim, with their internal PROVENANCE blocks intact.
