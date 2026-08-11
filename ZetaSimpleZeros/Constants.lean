import Mathlib
import ZetaSimpleZeros.Combinatorics

namespace ZetaSimpleZeros

noncomputable def HMT : ℝ :=
  (3 : ℝ) / 2 - (1 / Real.sqrt 2) / Real.tan (1 / Real.sqrt 2)

noncomputable def BStar : ℝ :=
  (252921 : ℝ) / 68000000 +
    2 * Real.sqrt ((68541591 : ℝ) / 68000000) - 1

def CStar : ℝ := (266221 : ℝ) / 136000000

noncomputable def RStar : ℝ :=
  (HMT - CStar) / (1 - BStar / 272)

end ZetaSimpleZeros
