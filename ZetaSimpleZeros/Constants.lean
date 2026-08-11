import Mathlib
import ZetaSimpleZeros.Combinatorics

/-!
# Exact constants used by the refinement

The formal layer records exact rational and radical expressions. It does not
claim a machine-checked decimal enclosure for the transcendental baseline.
-/

namespace ZetaSimpleZeros

/-- The optimized Montgomery--Taylor baseline. -/
noncomputable def HMT : ℝ :=
  (3 : ℝ) / 2 - (1 / Real.sqrt 2) / Real.tan (1 / Real.sqrt 2)

/-- Exact local target as a real number. -/
def AStar : ℝ := (252921 : ℝ) / 250000

/-- Exact trace-aware spectral target at block size `272`. -/
noncomputable def BStar : ℝ :=
  (252921 : ℝ) / 68000000 +
    2 * Real.sqrt ((68541591 : ℝ) / 68000000) - 1

/-- Exact global pressure coefficient. -/
def CStar : ℝ := (266221 : ℝ) / 136000000

/-- Exact refined lower-bound expression. -/
noncomputable def RStar : ℝ :=
  (HMT - CStar) / (1 - BStar / 272)

/-- The rational local-target computation agrees with `AStar`. -/
theorem AStar_from_local_target :
    ((localTargetQ mStar : ℚ) : ℝ) = AStar := by
  rw [localTarget272_exact]
  norm_num [AStar]

/-- The rational pressure computation agrees with `CStar`. -/
theorem CStar_from_pressure :
    ((pressureCoefficientQ mStar : ℚ) : ℝ) = CStar := by
  rw [pressureCoefficient272_exact]
  norm_num [CStar]

/-- The radicand in `BStar` is nonnegative. -/
theorem BStar_radicand_nonneg :
    0 ≤ (68541591 : ℝ) / 68000000 := by
  norm_num

end ZetaSimpleZeros
