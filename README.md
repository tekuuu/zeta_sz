# GPT-5.6 Pro research draft: simple critical-line zeros

This repository contains an AI-authored mathematical research draft proving, conditional on the imported analytic and interval-certified inputs, the lower bound

\[
\liminf_{T\to\infty}\frac{N_0^s(T,2T)}{N(T,2T)}
\ge 0.6730465042246110005\ldots.
\]

## Main result

The manuscript refines the earlier `ainta/zeta-simple-zeros` argument, itself based on Claude/Anthropic's *More Than Two Thirds of the Zeros of the Riemann Zeta Function Lie on the Critical Line*.

The previous certified draft obtains approximately **67.3008528%**. This refinement obtains the conditional bound

**67.3046504224611%**.

## Authorship and provenance

The listed author of the **new refinement and manuscript** is **GPT-5.6 Pro**, an OpenAI language model. This records the provenance of this research draft; it does not imply that OpenAI commissioned, reviewed, endorsed, or certified the result.

The imported analytic framework is credited to Claude/Anthropic, and the inherited Arb interval certificates are credited to Ainta's `zeta-simple-zeros` repository. Those prior contributions are not claimed here.

## Lean formalization

The repository includes a Lean 4 formalization of the new refinement's independent finite and algebraic layer:

- the exact 272-point gap-incidence identity;
- an exhaustive exact-rational proof that all combined pair coefficients are at most `2`;
- the exact local-target and pressure constants;
- the scalar low-energy spectral-envelope calculation;
- the pointwise and epsilon-form endgame producing the named refined expression.

The project is pinned to Lean `v4.33.0-rc2` and Mathlib commit `51e6992efd06126df61a496bebf8f49482a4e129`. GitHub CI completed a warning-free **8,702-job** build, replayed the hand-written proof modules with Lean's bundled `leanchecker`, and audited the key theorems. Every audited theorem depends only on Lean's standard axioms `propext`, `Classical.choice`, and `Quot.sound`; there is no `sorryAx`, `Lean.ofReduceBool`, or `Lean.trustCompiler` dependency.

This is **not yet an end-to-end formal proof of the zeta theorem**. The inherited analytic estimate, inherited Arb certificates, full Hermitian-matrix reduction, shifted block-pinching theorem for the actual zeta-zero Gram matrices, and connection to the upstream `Zeta23` development remain explicit dependencies. See `FORMALIZATION.md` for the exact trust boundary.

## Repository layout

- `paper/PAPER.md` — complete GitHub-readable research manuscript
- `ZetaSimpleZeros/` — Lean proof modules
- `ZetaSimpleZeros/Verify.lean` — theorem axiom audit
- `FORMALIZATION.md` — formalization scope and trust boundary
- `.github/workflows/lean.yml` — reproducible Lean verification workflow
- `verification/constants_check.py` — high-precision constants and block-size checks
- `verification/combinatorics_check.py` — exact rational combinatorial checks
- `verification/outputs/` — recorded outputs of the two Python checkers
- `PROVENANCE.md` — detailed authorship/dependency statement
- `CITATION.cff` — citation metadata
- `requirements.txt` — local Python dependency for the new checker layer

The compiled PDF and full LaTeX edition were also generated in the associated ChatGPT research session. The GitHub connector used for the initial upload supports UTF-8 repository writes but not direct arbitrary-binary attachment upload, so the canonical mathematical content is mirrored here in `paper/PAPER.md`; the exact PDF/LaTeX package remains available from the research-session artifact bundle.

## Reproduction

### Lean

```bash
lake build --wfail

for module in \
  ZetaSimpleZeros.Constants \
  ZetaSimpleZeros.SpectralScalar \
  ZetaSimpleZeros.Endgame
do
  lake env leanchecker "$module"
done

lake env lean ZetaSimpleZeros/Verify.lean
```

### Python checks

```bash
python3 -m pip install -r requirements.txt
python3 verification/constants_check.py
python3 verification/combinatorics_check.py
```

The inherited seven-point and three-point Arb certificates are not duplicated here; see `ainta/zeta-simple-zeros` for their source and trust base.

## Status

**AI-generated, unreviewed research draft.** The new finite/algebraic layer is machine-checked in Lean, but the complete analytic theorem is not yet end-to-end formalized or independently peer reviewed. The inherited Arb certificates were inspected but were not independently rerun in the environment used to prepare this version.
