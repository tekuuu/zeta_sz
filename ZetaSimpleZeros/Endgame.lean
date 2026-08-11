import Mathlib
import ZetaSimpleZeros.Constants

/-!
# Algebraic and epsilon-form endgame

The analytic zeta estimate and the new global defect estimate enter as explicit
hypotheses. From those hypotheses, Lean checks the rearrangement leading to
the refined proportion. A second theorem packages the usual `o(N)` reasoning
in epsilon form.
-/

namespace ZetaSimpleZeros

/-- Pointwise algebraic combination of the baseline and defect inequalities. -/
theorem pointwise_refinement
    {S N D H B C m : ℝ}
    (hN : 0 < N)
    (hm : 0 < m)
    (hB : B < m)
    (hGlobal : H * N + D ≤ S)
    (hDefect : B / m * S - C * N ≤ D) :
    (H - C) / (1 - B / m) ≤ S / N := by
  have hBdiv : B / m < 1 := (div_lt_one hm).2 hB
  have hden : 0 < 1 - B / m := sub_pos.mpr hBdiv
  apply (div_le_iff₀ hden).2
  rw [div_mul_eq_mul_div]
  apply (le_div_iff₀ hN).2
  nlinarith [hGlobal, hDefect]

/-- Pointwise form with two normalized error terms. -/
theorem pointwise_refinement_with_errors
    {S N D H B C m e₁ e₂ : ℝ}
    (hN : 0 < N)
    (hm : 0 < m)
    (hB : B < m)
    (hGlobal : (H - e₁) * N + D ≤ S)
    (hDefect : B / m * S - (C + e₂) * N ≤ D) :
    (H - C - e₁ - e₂) / (1 - B / m) ≤ S / N := by
  have h := pointwise_refinement
    (S := S) (N := N) (D := D)
    (H := H - e₁) (B := B) (C := C + e₂) (m := m)
    hN hm hB hGlobal hDefect
  convert h using 1 <;> ring

/-- Epsilon-form asymptotic assembly, avoiding hidden use of `o` notation. -/
theorem eventual_refinement
    {S N D : ℕ → ℝ}
    {H B C m : ℝ}
    (hm : 0 < m)
    (hB : B < m)
    (hN : ∀ n, 0 < N n)
    (hGlobal : ∀ ε > 0, ∃ n₀, ∀ n ≥ n₀,
      (H - ε) * N n + D n ≤ S n)
    (hDefect : ∀ ε > 0, ∃ n₀, ∀ n ≥ n₀,
      B / m * S n - (C + ε) * N n ≤ D n) :
    ∀ ε > 0, ∃ n₀, ∀ n ≥ n₀,
      ((H - C - 2 * ε) / (1 - B / m)) * N n ≤ S n := by
  intro ε hε
  obtain ⟨n₁, hn₁⟩ := hGlobal ε hε
  obtain ⟨n₂, hn₂⟩ := hDefect ε hε
  refine ⟨max n₁ n₂, ?_⟩
  intro n hn
  have hg := hn₁ n (le_trans (Nat.le_max_left n₁ n₂) hn)
  have hd := hn₂ n (le_trans (Nat.le_max_right n₁ n₂) hn)
  have hr := pointwise_refinement_with_errors
    (S := S n) (N := N n) (D := D n)
    (H := H) (B := B) (C := C) (m := m)
    (e₁ := ε) (e₂ := ε)
    (hN n) hm hB hg hd
  have hr' :
      (H - C - 2 * ε) / (1 - B / m) ≤ S n / N n := by
    convert hr using 1 <;> ring
  exact (le_div_iff₀ (hN n)).1 hr'

/-- The exact refined zeta endgame, conditional on the two asymptotic inputs. -/
theorem refined_zeta_epsilon_form
    {S N D : ℕ → ℝ}
    (hB : BStar < (272 : ℝ))
    (hN : ∀ n, 0 < N n)
    (hGlobal : ∀ ε > 0, ∃ n₀, ∀ n ≥ n₀,
      (HMT - ε) * N n + D n ≤ S n)
    (hDefect : ∀ ε > 0, ∃ n₀, ∀ n ≥ n₀,
      BStar / 272 * S n - (CStar + ε) * N n ≤ D n) :
    ∀ ε > 0, ∃ n₀, ∀ n ≥ n₀,
      ((HMT - CStar - 2 * ε) / (1 - BStar / 272)) * N n ≤ S n := by
  exact eventual_refinement
    (m := (272 : ℝ)) (H := HMT) (B := BStar) (C := CStar)
    (by norm_num) hB hN hGlobal hDefect

/-- Zero-error pointwise specialization written with the named exact bound `RStar`. -/
theorem refined_zeta_pointwise
    {S N D : ℝ}
    (hB : BStar < (272 : ℝ))
    (hN : 0 < N)
    (hGlobal : HMT * N + D ≤ S)
    (hDefect : BStar / 272 * S - CStar * N ≤ D) :
    RStar ≤ S / N := by
  simpa [RStar] using pointwise_refinement
    (S := S) (N := N) (D := D)
    (H := HMT) (B := BStar) (C := CStar) (m := (272 : ℝ))
    hN (by norm_num) hB hGlobal hDefect

end ZetaSimpleZeros
