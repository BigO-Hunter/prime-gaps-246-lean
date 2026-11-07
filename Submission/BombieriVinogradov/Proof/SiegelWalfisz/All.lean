import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Contour.Main
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.PerronError.Optimize.Main
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Residue.Meromorphic.Main
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Residue.Origin.KernelDifference
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Residue.Origin.LogDerivativeRemainder
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Residue.Origin.RegularizedSimpleAtZero
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Residue.Origin.RegularizedSimpleOn
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Residue.Poles.Finite
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Residue.Poles.IntegrandSimpleAwayZero
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.ExplicitFormula.Residue.Poles.LogDerivativeSimple
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.Siegel.All
import Submission.BombieriVinogradov.Proof.SiegelWalfisz.SiegelProduct.Positivity.Main

/-!
# Siegel-Walfisz proof exports

This declaration-free facade exports the independent zero-free,
Siegel-product, Perron, contour, and explicit-formula meromorphicity and finite
pole-set branches, including finite L-function order and simple poles for the
logarithmic derivative and the full integrand away from zero, without coupling
their internal proof modules. It also exports the first-order kernel
cancellation and bounded logarithmic-derivative remainder needed to regularize
the origin, together with the proved simple-pole bound for the corrected
integrand globally.
-/
