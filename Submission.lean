import PrimeGaps.Bounded246
import Solution

/-!
# H1 ≤ 246 — bounded prime gaps, verified.

Composition of two independently-developed Lean libraries:

* **AxiomMath/PrimeGapsLib** (commit `1faa7b1`) proves
  `bombieriVinogradov_implies_prime_gap_le_246` — the Bombieri–Vinogradov
  theorem implies that gaps between primes are bounded by 246 — using a
  Lean-checked 50-tuple certificate (`PrimeGaps.existsEpsCert50`).
* **kimihiro64/bombieri-vinogradov** (commit `7a17483`) proves
  `BombieriVinogradov.bombieriVinogradov` — the full Bombieri–Vinogradov
  theorem — from only `propext`, `Quot.sound`, and `Classical.choice`.

The two libraries define `BombieriVinogradov` (and `Real.primeCountingZMod`)
definitionally identically; the integration reuses PrimeGapsLib's definition so
that the BV theorem can be fed directly into PrimeGapsLib's implication. The
result is a statement with no remaining hypotheses.
-/

namespace BigOSpeedrun.PrimeGaps

/-- Infinitely often, consecutive primes differ by at most 246 (`H1 ≤ 246`,
liminf form). -/
theorem frequently_prime_gap_le_246 :
    ∃ᶠ m in Filter.atTop, Nat.nth Nat.Prime (m + 1) - Nat.nth Nat.Prime m ≤ 246 :=
  bombieriVinogradov_implies_frequently_prime_gap_le_246 BombieriVinogradov.bombieriVinogradov

/-- For every threshold `n₀` there are primes `p < q ≤ p + 246` with `p ≥ n₀`. -/
theorem prime_gap_le_246 :
    ∀ n₀ : ℕ, ∃ p q : ℕ, n₀ ≤ p ∧ p < q ∧ p.Prime ∧ q.Prime ∧ q ≤ p + 246 :=
  bombieriVinogradov_implies_prime_gap_le_246 BombieriVinogradov.bombieriVinogradov

/-- For every threshold `n₀` there is `n ≥ n₀` with the next prime within 246. -/
theorem nth_prime_gap_le_246 :
    ∀ n₀ : ℕ, ∃ n ≥ n₀, Nat.nth Nat.Prime (n + 1) ≤ Nat.nth Nat.Prime n + 246 :=
  bombieriVinogradov_implies_nth_prime_gap_le_246 BombieriVinogradov.bombieriVinogradov

end BigOSpeedrun.PrimeGaps

#print axioms BigOSpeedrun.PrimeGaps.prime_gap_le_246
#print axioms BigOSpeedrun.PrimeGaps.frequently_prime_gap_le_246
#print axioms BigOSpeedrun.PrimeGaps.nth_prime_gap_le_246
