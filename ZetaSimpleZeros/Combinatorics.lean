import Mathlib

/-!
# Exact finite combinatorics for the 272-point refinement

This file formalizes the finite rational bookkeeping used by the paper:

* the exact total incidence of gaps in consecutive seven-point windows;
* the four weighted edge triangles;
* the fact that the combined coefficient of every pair is at most `2`;
* the exact local-target and pressure constants.

The concrete checks are reduced by the Lean kernel; no floating-point
arithmetic, compiler-trust axiom, or external oracle is used.
-/

namespace ZetaSimpleZeros

/-- The block size selected by the refined argument. -/
def mStar : ℕ := 272

/-- The certified seven-point lower bound. -/
def alphaQ : ℚ := 19 / 5000

/-- The inherited certified three-point lower bound. -/
def epsilonTriangleQ : ℚ := 221 / 1000000

/-- Number of seven-point windows containing the `j`th gap of an `m`-point block. -/
def gapIncidence (m j : ℕ) : ℕ :=
  ((Finset.Icc 1 (m - 6)).filter fun a => a ≤ j ∧ j ≤ a + 5).card

/-- Sum of all within-block gap incidences. -/
def incidenceTotal (m : ℕ) : ℕ :=
  ∑ j ∈ Finset.Icc 1 (m - 1), gapIncidence m j

/-- Exact incidence identity for the concrete block size. -/
set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
theorem incidenceTotal272 : incidenceTotal mStar = 6 * (mStar - 6) := by
  decide

/-- Number of consecutive seven-point windows containing a pair `(i,j)`. -/
def pairOccurrenceCount (m i j : ℕ) : ℕ :=
  if i < j ∧ j - i ≤ 6 then
    let lo := max 1 (j - 6)
    let hi := min i (m - 6)
    if lo ≤ hi then hi - lo + 1 else 0
  else 0

/-- Coefficient of a pair in the sum of all seven-point inequalities. -/
def sevenPairCoefficient (m i j : ℕ) : ℚ :=
  let span := j - i
  if 1 ≤ i ∧ i < j ∧ j ≤ m ∧ span ≤ 6 then
    ((2 : ℚ) * (pairOccurrenceCount m i j : ℚ)) /
      (((7 - span : ℕ) : ℚ))
  else
    0

/-- Contribution of one weighted consecutive triangle to a pair coefficient. -/
def trianglePairContribution (start i j : ℕ) (weight : ℚ) : ℚ :=
  if (i = start ∧ j = start + 1) ∨
      (i = start + 1 ∧ j = start + 2) ∨
      (i = start ∧ j = start + 2) then
    weight
  else
    0

/-- Pair coefficient supplied by the four weighted edge triangles. -/
def addedTriangleCoefficient (m i j : ℕ) : ℚ :=
  trianglePairContribution 1 i j ((4 : ℚ) / 3) +
  trianglePairContribution 3 i j ((2 : ℚ) / 3) +
  trianglePairContribution (m - 4) i j ((2 : ℚ) / 3) +
  trianglePairContribution (m - 2) i j ((4 : ℚ) / 3)

/-- Total pair coefficient after adding the edge triangles. -/
def combinedPairCoefficient (m i j : ℕ) : ℚ :=
  sevenPairCoefficient m i j + addedTriangleCoefficient m i j

/-- Executable exhaustive check of the pair coefficient budget. -/
def pairBudgetCheck (m : ℕ) : Bool :=
  (List.range m).all fun i0 =>
    (List.range m).all fun j0 =>
      let i := i0 + 1
      let j := j0 + 1
      decide (i < j → combinedPairCoefficient m i j ≤ 2)

/-- Every one of the `272 choose 2` pair coefficients respects the budget `≤ 2`. -/
set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
theorem pairBudget272 : pairBudgetCheck mStar = true := by
  decide

/-- The total weight of the four edge triangles. -/
def triangleWeightTotalQ : ℚ :=
  (4 : ℚ) / 3 + 2 / 3 + 2 / 3 + 4 / 3

/-- The total pressure coefficient introduced by the four edge triangles. -/
def trianglePressureTotalQ : ℚ :=
  2 * (epsilonTriangleQ / 4) * triangleWeightTotalQ

/-- Exact triangle weight sum. -/
theorem triangleWeightTotal_exact : triangleWeightTotalQ = 4 := by
  norm_num [triangleWeightTotalQ]

/-- Exact triangle pressure identity. -/
theorem trianglePressureTotal_exact :
    trianglePressureTotalQ = 2 * epsilonTriangleQ := by
  norm_num [trianglePressureTotalQ, triangleWeightTotalQ, epsilonTriangleQ]

/-- Local target produced by the seven-point and edge-triangle inequalities. -/
def localTargetQ (m : ℕ) : ℚ :=
  alphaQ * (((m - 6 : ℕ) : ℚ)) + 4 * epsilonTriangleQ

/-- Exact local target at `m = 272`. -/
theorem localTarget272_exact :
    localTargetQ mStar = 252921 / 250000 := by
  norm_num [localTargetQ, mStar, alphaQ, epsilonTriangleQ]

/-- Exact shifted-average pressure coefficient. -/
def pressureCoefficientQ (m : ℕ) : ℚ :=
  (((m - 6 : ℕ) : ℚ)) / (500 * (m : ℚ)) +
    2 * epsilonTriangleQ / (m : ℚ)

/-- Exact pressure coefficient at `m = 272`. -/
theorem pressureCoefficient272_exact :
    pressureCoefficientQ mStar = 266221 / 136000000 := by
  norm_num [pressureCoefficientQ, mStar, epsilonTriangleQ]

end ZetaSimpleZeros
