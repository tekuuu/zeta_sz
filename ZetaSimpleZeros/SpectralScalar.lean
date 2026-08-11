import Mathlib

/-!
# Scalar core of the low-energy spectral refinement

The matrix theorem reduces, after diagonalization, to the following scalar
calculation. The hypotheses explicitly encode the exceptional eigenvalue
and its quadratic-energy bound.
-/

namespace ZetaSimpleZeros

/-- Scalar algebra behind the second branch of the low-energy envelope. -/
theorem lowEnergyEnvelope_scalar
    {a q M D : ℝ}
    (ha : 0 ≤ a)
    (hq : 0 ≤ q)
    (hM : 1 ≤ M)
    (hMbound : M ^ 2 ≤ a * q)
    (hD : D = q - (M - 1) ^ 2) :
    (1 - a) * q + 2 * Real.sqrt (a * q) - 1 ≤ D := by
  have haq : 0 ≤ a * q := mul_nonneg ha hq
  have hsquare := Real.sq_sqrt haq
  have hsnonneg := Real.sqrt_nonneg (a * q)
  have hMnonneg : 0 ≤ M := le_trans (by norm_num) hM
  have hMsqrt : M ≤ Real.sqrt (a * q) := by
    nlinarith
  have hsqrtOne : 1 ≤ Real.sqrt (a * q) := le_trans hM hMsqrt
  rw [hD]
  nlinarith

/-- Concrete specialization of the scalar envelope to the `272`-point block. -/
theorem lowEnergyEnvelope_272
    {q M D : ℝ}
    (hq : 0 ≤ q)
    (hM : 1 ≤ M)
    (hMbound : M ^ 2 ≤ ((271 : ℝ) / 272) * q)
    (hD : D = q - (M - 1) ^ 2) :
    q / 272 + 2 * Real.sqrt (((271 : ℝ) / 272) * q) - 1 ≤ D := by
  have h := lowEnergyEnvelope_scalar
    (a := (271 : ℝ) / 272) (q := q) (M := M) (D := D)
    (by norm_num) hq hM hMbound hD
  convert h using 1 <;> ring

end ZetaSimpleZeros
