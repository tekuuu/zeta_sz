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

## Repository layout

- `paper/gpt56_simple_zeros.pdf` — compiled research paper
- `paper/gpt56_simple_zeros.tex` — complete LaTeX source
- `verification/constants_check.py` — high-precision constants and block-size checks
- `verification/combinatorics_check.py` — exact rational combinatorial checks
- `verification/outputs/` — recorded outputs of the two local checkers
- `PROVENANCE.md` — detailed authorship/dependency statement
- `SHA256SUMS.txt` — checksums for core release artifacts

## Reproduction

The two new finite checks require Python 3:

```bash
python3 verification/constants_check.py
python3 verification/combinatorics_check.py
```

The inherited seven-point and three-point Arb certificates are not duplicated here; see `ainta/zeta-simple-zeros` for their source and trust base.

## Status

**Unreviewed research draft.** The new deductions have not been independently peer reviewed or formalized in Lean. The inherited Arb certificates were inspected but were not independently rerun in the environment used to prepare this version.
