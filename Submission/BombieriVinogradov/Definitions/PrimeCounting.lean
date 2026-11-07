module

public import Mathlib.Analysis.SpecialFunctions.Pow.Real
public import Mathlib.NumberTheory.PrimeCounting
public import PrimeNumberTheoremAnd.Defs
-- Integration: reuse PrimeGapsLib's identical definition rather than redefining
-- `Real.primeCountingZMod` (would otherwise collide as a duplicate constant).
public import Submission.PrimeGapsTheory.NumberTheory.PrimeCountingZMod

/-!
# Prime counts in arithmetic progressions

This module defines the inclusive prime-counting functions used in Maynard's
equation (1.3) and in the downstream `PrimeGapsLib` challenge surface.
-/

set_option autoImplicit false

@[expose] public section

namespace BombieriVinogradov

/-- The number of primes at most the real cutoff `x`, coerced to `Real`. -/
noncomputable def primeCounting (x : ℝ) : ℝ :=
  pi x

end BombieriVinogradov
