# Lean formalization scope

This Lean 4 project verifies the new refinement's **independent finite and algebraic layer**:

1. Exact seven-window gap-incidence count for `m = 272`.
2. Exhaustive exact-rational verification that all pair coefficients, after adding the four edge triangles, are at most `2`.
3. Exact identities for the local target and global pressure constants.
4. The scalar algebra underlying the low-energy spectral envelope.
5. The pointwise and epsilon-form algebra that converts the analytic baseline and global defect estimate into the exact refined lower-bound expression.

## Explicit trust boundary

The theorem `refined_zeta_epsilon_form` is conditional on two asymptotic inputs:

- the inherited analytic/global-defect estimate;
- the refined global block-defect estimate.

The current project does **not** yet formalize:

- the inherited Arb three-point and seven-point interval certificates;
- the full Hermitian-matrix spectral theorem from diagonalization;
- the shifted block-pinching argument over the actual zeta-zero Gram matrices;
- the connection to the complete upstream `Zeta23` analytic development.

Accordingly, a green build verifies the formalized layer without `sorry`, but it is not yet an end-to-end Lean proof of the zeta theorem.

## Verification

```bash
lake build --wfail
lake env leanchecker
lake env lean ZetaSimpleZeros/Verify.lean
```

GitHub CI pins Lean and Mathlib, performs the full kernel build, runs Lean 4.33's environment checker, and rejects `sorryAx`, `Lean.ofReduceBool`, or `Lean.trustCompiler` in the audited theorem dependencies. The two exhaustive concrete checks use `decide +kernel`, not `native_decide`.
