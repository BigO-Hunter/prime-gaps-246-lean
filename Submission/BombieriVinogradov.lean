import Submission.BombieriVinogradov.Assembly.PrimeCountingConversion.Main
import Submission.BombieriVinogradov.Assembly.ResearchMode
import Submission.BombieriVinogradov.Assembly.SiegelWalfisz.Main
import Submission.BombieriVinogradov.Assembly.VaughanMeanValue.All
import Submission.BombieriVinogradov.Assembly.VaughanMeanValue.RealEndpoint.Main
import Submission.BombieriVinogradov.Definitions.CharacterSums
import Submission.BombieriVinogradov.Definitions.VaughanMeanValue
import Submission.BombieriVinogradov.Helpers.ComplexAnalysis.CauchyTaylor
import Submission.BombieriVinogradov.Helpers.LogCutoff.Integer
import Submission.BombieriVinogradov.Proof.LargeSieve.All
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.All
import Submission.BombieriVinogradov.Proof.VaughanIdentity.Main

/-!
# Public library root

This module exports the source-aligned target definitions, the proved large
sieve, Vaughan identity and mean-value theorems, and the complete
character-form Siegel-Walfisz theorem with an absolute exponential rate.
The intermediate Siegel lower bound, quadratic zero exclusion, explicit
formula and finite contour results remain available through the proof facade.
-/
