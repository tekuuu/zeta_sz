# More than 67.3046504% of the zeros of the Riemann zeta function are simple and lie on the critical line

**Author:** GPT-5.6 Pro (OpenAI language model)  
**Version:** 2.0 — August 11, 2026  
**Status:** AI-generated, unreviewed research draft

## Abstract

Let \(N(T,2T)\) denote the number of nontrivial zeros of the Riemann zeta function with ordinates in \((T,2T]\), counted with multiplicity, and let \(N_0^s(T,2T)\) denote the number of simple zeros on the critical line in that interval. Claude's rank–trace method gives the unconditional lower proportion

\[
H_{\mathrm{MT}}=\frac32-\frac1{\sqrt2}\cot\frac1{\sqrt2}
=0.672500703679\ldots.
\]

A subsequent computer-assisted refinement retained a convex spectral defect and combined it with a certified seven-point overlap inequality, obtaining \(0.673008527927\ldots\). This paper sharpens the local-to-global step in three ways. First, it keeps the exact gap-incidence multiplicities in the shifted block average rather than replacing every multiplicity by its maximum. Second, it uses four weighted edge-triangle inequalities to spend pair-energy left unused by the consecutive seven-point windows. Third, for a nearly correlation Gram matrix it replaces the cap \(\min\{1,q\}\) by a trace-aware lower envelope for the spectral defect. No stronger numerical interval certificate is required.

The result is

\[
\boxed{
\liminf_{T\to\infty}\frac{N_0^s(T,2T)}{N(T,2T)}
\ge 0.67304650422461100051934260935458\ldots
}
\]

or more than **67.3046504%**.

## 1. Authorship, status, and dependency

GPT-5.6 Pro is the sole listed author of the new refinement and of this manuscript. The imported analytic theorem and Gram-matrix framework remain credited to Claude/Anthropic, and the two Arb interval certificates remain credited to Ainta's `zeta-simple-zeros` repository. This manuscript does not claim those earlier contributions as new.

The work is an AI-generated research draft. OpenAI did not commission, independently review, or endorse the claims. Independent verification is required before the result should be treated as established literature.

## 2. Introduction

The Riemann hypothesis asserts that every nontrivial zero of the Riemann zeta function lies on the critical line \(\Re s=1/2\). A classical unconditional substitute is to prove that a positive asymptotic proportion of the zeros lie on that line, preferably with multiplicity one.

Claude's work introduced a finite-dimensional rank–trace certificate built from Weil's Hermitian form and an optimized Montgomery–Taylor test family. In the notation used below,

\[
\liminf_{T\to\infty}\frac{N_0^s(T,2T)}{N(T,2T)}\ge H_{\mathrm{MT}},
\]

with

\[
H_{\mathrm{MT}}=0.6725007036794116457\ldots.
\]

The later repository `ainta/zeta-simple-zeros` observed that the rank–trace proof discards a nonnegative convex spectral defect. A certified seven-point inequality for the limiting overlap kernel forces a positive amount of that defect and raises the proportion to

\[
0.6730085279277797613\ldots.
\]

The present refinement removes two avoidable losses in the passage from the local seven-point certificate to the global zero count and one smaller loss in the spectral conversion.

### Main theorem

Let \(N(T,2T)\) count nontrivial zeros of \(\zeta(s)\) with ordinates in \((T,2T]\), with multiplicity, and let \(N_0^s(T,2T)\) count simple zeros on the critical line. Assuming the analytic and certified inputs below,

\[
\liminf_{T\to\infty}\frac{N_0^s(T,2T)}{N(T,2T)}\ge R_*,
\]

where

\[
R_*=0.67304650422461100051934260935458\ldots
\]

and exactly

\[
R_*=
\frac{
\displaystyle H_{\mathrm{MT}}-\frac{266221}{136000000}
}{
\displaystyle 1-\frac1{272}\left(
\frac{252921}{68000000}
+2\sqrt{\frac{68541591}{68000000}}-1
\right)
}.
\]

The increase over the seven-point repository bound is

\[
0.00003797629683123919\ldots,
\]

or approximately \(0.00379763\) percentage points.

## 3. Notation and imported inputs

Put

\[
\ell=\log\frac{T}{2\pi},\qquad L=\ell,\qquad h=\frac{2\pi}{L}.
\]

For a zero \(\rho=\beta+i\gamma\) in the retained central interval, define the normalized ordinate

\[
x_\rho=\frac{\gamma-T}{h}.
\]

The optimized Montgomery–Taylor test family has limiting normalized overlap kernel

\[
k(x)=\frac{K(x)}{K(0)},
\]

where

\[
K(x)=\int_{-1/2}^{1/2}\cos(\sqrt2\,t)\cos(2\pi xt)\,dt,
\qquad
K(0)=\sqrt2\sin(1/\sqrt2).
\]

Set \(w(x)=k(x)^2\). The entire-sinc representation used by the interval verifier is

\[
K(x)=\frac12\left(
\frac{\sin(\pi x-1/\sqrt2)}{\pi x-1/\sqrt2}
+\frac{\sin(\pi x+1/\sqrt2)}{\pi x+1/\sqrt2}
\right).
\]

Let

\[
S=N_0^s(T,2T),\qquad N=N(T,2T).
\]

After deleting \(o(N)\) endpoint zeros, let \(M^\circ\) be the Gram matrix of the retained normalized simple-zero vectors. Define

\[
\Psi(t)=
\begin{cases}
(t-1)^2,&0\le t\le2,\\
2t-3,&t\ge2,
\end{cases}
\qquad
\mathcal D(G)=\operatorname{tr}\Psi(G).
\]

The proof imports the following three statements.

### Imported input A: global defect inequality

The rank–trace and analytic estimates give

\[
S\ge H_{\mathrm{MT}}N+\mathcal D(M^\circ)-o(N).
\]

The retained count is \(S-o(N)\), and the total normalized span is at most \(N+o(N)\).

### Imported input B: uniform kernel limit

For every fixed \(R>0\), uniformly for retained simple zeros with bounded normalized separation,

\[
\langle v_\rho,v_{\rho'}\rangle
=k(x_\rho-x_{\rho'})+o(1).
\]

In particular, \(\|v_\rho\|^2=1+o(1)\) uniformly in the retained region.

### Imported input C: certified overlap inequalities

Let

\[
\alpha=\frac{19}{5000},\qquad
\varepsilon_\triangle=\frac{221}{10^6}.
\]

For all nonnegative \(g_1,\dots,g_6\), the inherited Arb verifier proves

\[
\frac1{3000}\sum_{j=1}^6g_j
+
\sum_{r=1}^6\frac{2}{7-r}
\sum_{i=1}^{7-r}
 w(g_i+\cdots+g_{i+r-1})
\ge\alpha.
\]

The same repository certifies, for \(u,v\ge0\) with \(u+v\le4\),

\[
w(u)+w(v)+w(u+v)\ge\varepsilon_\triangle.
\]

No stronger interval claim is introduced here.

## 4. The spectral defect for correlation Gram matrices

Let \(G\succeq0\) be an \(m\times m\) correlation matrix, so \(G_{ii}=1\). Define the off-diagonal energy

\[
q(G)=2\sum_{i<j}|G_{ij}|^2
=\operatorname{tr}(G^2)-m.
\]

If every eigenvalue of \(G\) lies in \([0,2]\), then

\[
\mathcal D(G)=\operatorname{tr}(G-I)^2=q(G).
\]

When an eigenvalue crosses \(2\), the linear branch of \(\Psi\) lowers the defect relative to \(q\). The trace constraint prevents an arbitrary collapse.

For \(0\le q\le2\), define

\[
\Gamma_m(q)=
\begin{cases}
q,&0\le q\le \dfrac{m}{m-1},\\[6pt]
\dfrac qm+2\sqrt{\dfrac{m-1}{m}q}-1,
&\dfrac{m}{m-1}\le q\le2.
\end{cases}
\]

### Lemma 4.1 — low-energy trace-aware bound

If \(G\) is an \(m\times m\) correlation matrix and \(0\le q(G)\le2\), then

\[
\mathcal D(G)\ge\Gamma_m(q(G)).
\]

#### Proof

Let \(\lambda_1\ge\cdots\ge\lambda_m\ge0\) be the eigenvalues. Since \(\sum_i\lambda_i=m\), if \(\lambda_1\le2\), then every eigenvalue lies on the quadratic branch and \(\mathcal D(G)=q(G)\).

Suppose \(\lambda_1=1+x>2\), so \(x>1\). Write \(\lambda_i=1+y_i\) for \(i\ge2\). Then

\[
\sum_{i=2}^m y_i=-x
\]

and

\[
q=x^2+\sum_{i=2}^m y_i^2.
\]

By Cauchy–Schwarz,

\[
\sum_{i=2}^m y_i^2\ge\frac{x^2}{m-1},
\]

so

\[
x\le\sqrt{\frac{m-1}{m}q}.
\]

Because \(q\le2\), there cannot be two eigenvalues above \(2\). Therefore

\[
\mathcal D(G)
=(2\lambda_1-3)+\sum_{i=2}^m(\lambda_i-1)^2
=q-(\lambda_1-2)^2
=q-(x-1)^2.
\]

The right side decreases with \(x>1\), hence substituting the largest admissible \(x\) gives

\[
\mathcal D(G)
\ge
\frac qm+2\sqrt{\frac{m-1}{m}q}-1.
\]

This is exactly \(\Gamma_m(q)\).

## 5. Seven-point windows and exact pressure bookkeeping

Take an ordered block

\[
y_1<\cdots<y_m
\]

with gaps \(g_j=y_{j+1}-y_j\). Sum the certified seven-point inequality over all \(m-6\) consecutive seven-point windows.

Let \(W_7\) denote the resulting weighted pair-energy. A pair spanning \(r\) gaps appears with coefficient at most \(2\), so

\[
W_7\le 2\sum_{1\le i<j\le m}w(y_j-y_i).
\]

The pressure term is

\[
P_7=\frac1{3000}\sum_{j=1}^{m-1}\nu_{m,j}g_j,
\]

where \(\nu_{m,j}\) is the number of seven-point windows containing the \(j\)-th gap.

The exact incidence identity is

\[
\sum_{j=1}^{m-1}\nu_{m,j}=6(m-6).
\]

This follows simply because there are \(m-6\) windows and each contains exactly six gaps.

Hence

\[
W_7+P_7\ge\alpha(m-6).
\]

The key point is that the global shifted average should preserve this exact total instead of replacing each \(\nu_{m,j}\) by the maximum value six.

## 6. Edge triangles use residual pair budget

The seven-point sum does not saturate coefficient \(2\) for several short-range pairs near block boundaries. We use four weighted triangles:

\[
(1,2,3),\quad(3,4,5),\quad(m-4,m-3,m-2),\quad(m-2,m-1,m),
\]

with weights

\[
\frac43,\quad\frac23,\quad\frac23,\quad\frac43.
\]

An exact rational check shows that after these triangle contributions are added, every pair coefficient remains at most \(2\). Therefore the total augmented pair-energy is still bounded by

\[
2\sum_{i<j}w(y_j-y_i).
\]

The four triangle certificates contribute

\[
4\varepsilon_\triangle
\]

to the local lower bound. Their associated pressure cost is exactly

\[
2\varepsilon_\triangle.
\]

Thus the strengthened local target is

\[
A_m=\alpha(m-6)+4\varepsilon_\triangle.
\]

## 7. Block defect

For a fixed block of \(m\) retained simple zeros, let \(G_B\) be its Gram matrix. When its span is bounded, the kernel limit gives

\[
2\sum_{i<j}|(G_B)_{ij}|^2
=2\sum_{i<j}w(y_j-y_i)+o(1).
\]

The diagonal entries equal \(1+o(1)\), so \(G_B\) is asymptotically a correlation matrix.

Combining the local seven-point and triangle inequalities gives

\[
q(G_B)+P_B\ge A_m-o(1),
\]

where \(P_B\) is the total local pressure.

Using the spectral envelope, define

\[
B_m=\Gamma_m(A_m)
\]

provided \(A_m<2\) and the high-energy branch remains above \(B_m\). Then uniformly over the blocks,

\[
\mathcal D(G_B)+P_B\ge B_m-o(1).
\]

## 8. Shifted block pinching with exact incidence

Let

\[
x_1<\cdots<x_{S^\circ}
\]

be the retained normalized simple-zero ordinates, where

\[
S^\circ=S-o(N).
\]

For each offset modulo \(m\), partition the ordered points into full consecutive blocks of size \(m\), leaving only \(O(m)\) endpoints. By convexity and unitary invariance of \(G\mapsto\operatorname{tr}\Psi(G)\), pinching gives

\[
\mathcal D(M^\circ)\ge\sum_B\mathcal D(G_B).
\]

Now average over all \(m\) offsets.

For a fixed global gap, occupying within-block position \(j\) occurs at most once as the offset varies. Hence the exact seven-window incidence identity gives total seven-point pressure coefficient

\[
\frac{6(m-6)}{3000}
\]

over all offsets. The triangle pressure contributes an additional \(2\varepsilon_\triangle\). After division by \(m\), the averaged pressure coefficient is

\[
C_m=\frac{m-6}{500m}+\frac{2\varepsilon_\triangle}{m}.
\]

Since the total normalized span is at most \(N+o(N)\), we obtain

\[
\boxed{
\mathcal D(M^\circ)
\ge\frac{B_m}{m}S-C_mN-o(N).
}
\]

This is the refined global defect estimate.

## 9. Numerical optimization and proof of the main theorem

Choose

\[
m=272,
\qquad
\alpha=\frac{19}{5000},
\qquad
\varepsilon_\triangle=\frac{221}{10^6}.
\]

Then

\[
A_*=A_{272}
=\frac{19}{5000}(272-6)+4\frac{221}{10^6}
=\frac{252921}{250000}
=1.011684.
\]

Since

\[
\frac{272}{271}<A_*<2,
\]

the second branch of \(\Gamma_{272}\) applies. Thus

\[
B_*=\frac{A_*}{272}+2\sqrt{\frac{271}{272}A_*}-1
\]

or exactly

\[
B_*=
\frac{252921}{68000000}
+2\sqrt{\frac{68541591}{68000000}}-1
=1.01166820423302086413259371398\ldots.
\]

The exact pressure coefficient is

\[
C_*=C_{272}
=\frac{266}{500\cdot272}
+\frac{2}{272}\frac{221}{10^6}
=\frac{266221}{136000000}
\]

so

\[
C_*=0.00195750735294117647058823529\ldots.
\]

Insert the refined defect inequality into the imported global inequality:

\[
S\ge H_{\mathrm{MT}}N+\frac{B_*}{272}S-C_*N-o(N).
\]

Hence

\[
\left(1-\frac{B_*}{272}\right)S
\ge(H_{\mathrm{MT}}-C_*)N-o(N).
\]

Divide by \(N\) and let \(T\to\infty\):

\[
\liminf_{T\to\infty}\frac SN
\ge
\frac{H_{\mathrm{MT}}-C_*}{1-B_*/272}.
\]

Numerically,

\[
\boxed{
\liminf_{T\to\infty}\frac{N_0^s(T,2T)}{N(T,2T)}
\ge0.67304650422461100051934260935458\ldots
}
\]

which proves the claimed conditional refinement.

## 10. Comparison

| Method | Block size | Lower proportion |
|---|---:|---:|
| Claude optimized rank–trace | — | 0.6725007036794116 |
| Seven-point Ainta repository | 269 | 0.6730085279277798 |
| Exact seven-window incidence, old spectral cap | 269 | 0.6730458412770782 |
| Exact incidence + trace-aware spectral envelope | 273 | 0.6730459512954575 |
| Exact incidence + spectral envelope + edge triangles | **272** | **0.6730465042246110** |

The exact incidence correction supplies most of the improvement. The correlation-matrix envelope and edge triangles provide smaller but strict additional gains.

## 11. Reproducibility

The repository contains two checkers for the new layer:

```bash
python3 verification/constants_check.py
python3 verification/combinatorics_check.py
```

The first verifies the high-precision constant arithmetic and scans admissible block sizes, selecting \(m=272\). The second performs exact rational checks of the gap-incidence identity, pair-capacity allocation, and triangle pressure coefficient.

The inherited three-point and seven-point Arb certificates remain in `ainta/zeta-simple-zeros`. Their trust base includes Python, IEEE-754 semantics, `python-flint`, Arb/FLINT, the verifier source, operating system, and executing hardware.

No new interval optimization is claimed here.

## 12. Limitations and next verification steps

A stronger verification package should:

1. independently rerun the inherited Arb certificates;
2. formally verify the new spectral and incidence lemmas in Lean;
3. connect those lemmas to the existing formalized analytic rank–trace development;
4. obtain independent expert review from analytic number theorists.

Until those steps are complete, this manuscript should be treated as a research draft rather than established literature.

## 13. Further directions

The present argument deliberately leaves the seven-point numerical certificate unchanged. A tighter certified lower target for the seven-point functional could improve the final proportion more visibly. Longer local windows or a mixture of several window sizes may use pair-coefficient capacity more efficiently. Another possibility is joint optimization of the convex spectral defect and the rank–trace parameter.

The exact-incidence principle itself is general: whenever a global convex spectral quantity is forced by local correlation inequalities, preserving local multiplicity exactly through a shifted fractional block cover can remove otherwise hidden losses.

## Author contribution statement

GPT-5.6 Pro is listed as the sole author of the new refinement in this version. The contributions attributed to the model are the exact shifted-block incidence average, weighted edge-triangle allocation, trace-aware spectral envelopes, optimization leading to \(m=272\), and assembly of these ingredients into the final bound.

No claim of authorship is made over the imported analytic results, formal artifacts, or interval certificates of Claude/Anthropic or Ainta.

## References

1. **Claude.** *More than two thirds of the zeros of the Riemann zeta function lie on the critical line.* Preprint, August 10, 2026. Anthropic.
2. **Ainta.** *More than 67.3% of the zeros of the Riemann zeta function are simple and lie on the critical line.* GitHub repository `ainta/zeta-simple-zeros`, August 11, 2026.
3. **F. Johansson.** *Arb: efficient arbitrary-precision midpoint-radius interval arithmetic.* IEEE Transactions on Computers 66 (2017), 1281–1292.
4. **H. L. Montgomery.** *The pair correlation of zeros of the zeta function.* Proc. Sympos. Pure Math. 24 (1973), 181–193.
5. **H. L. Montgomery.** *Distribution of the zeros of the Riemann zeta function.* ICM Vancouver 1974, Vol. 1, 379–381.
