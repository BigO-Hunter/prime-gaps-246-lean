import Submission.PrimeGapsStatement
import Submission.PrimeGaps.Bounded246
import Submission.Solution

/-!
# Maintainer smoke fixture: `BigOSpeedrun.PrimeGaps.Bound 246`

Big O Speedrun verifier smoke (task cbea6e9e). The proof is darkhipo's composition
(darkhipo/prime-gaps-246-lean at ac0eb01b6617f5b3bd978037bff937488ad34e73) moved into the
verifier's Submission layout: every module of its roots is under `Submission/` and its imports
name `Submission.*`. Nothing else in the moved files changes. The mathematics is Axiom Math's
PrimeGapsLib (1faa7b1, the 246 theory and certificate) and Jonas Whidden's
bombieri-vinogradov (7a17483, the Bombieri-Vinogradov theorem); see UPSTREAM-NOTICE.md and
README.md. `Submission/PrimeGapsStatement.lean` is a byte copy of the verifier's
`challenges/prime-gaps/Statement.lean`.
-/

theorem Race.bound : BigOSpeedrun.PrimeGaps.Bound 246 := by
  unfold BigOSpeedrun.PrimeGaps.Bound
  exact bombieriVinogradov_implies_frequently_prime_gap_le_246 BombieriVinogradov.bombieriVinogradov
