---
title: MA3110S Homeworks 12, 13
author: Qi Ji
date: 15th November 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\R}{\mathbb{R}}
\let\epsilon\varepsilon

# Homework 12

Fix \(\epsilon >0\) and
for each \(n\in\mathbb{N}\) we denote
\[ E_n = \set{x\in[a,b]: f_n(x) > f(x) - \epsilon }\]
and observe that each \(E_n\), being the preimage of the continuous function \(f - f_n\) on the open interval\((-\epsilon,\epsilon)\), is open.
By pointwise convergence \(\set{E_n}_{n\in\mathbb{N}}\) forms an open cover of \([a,b]\), which is compact, so let \(E_{n_1}, E_{n_2}, \dots, E_{n_k}\) be a finite subcover.
Then let \(N = \max(n_1, n_2, \dots, n_k)\) and whenever \(n>N\), it follows from covering and \(f_n \leq f_{n+1}\) pointwise that \(f(x) - f_n(x) < \epsilon\).

# Homework 13

## Q1

### Part (i)

If RHS finite then we just use the standard Abel theorem.
If RHS infinite as each \(a_n \geq 0\) it follows that
\[ \sum_{n=1}^\infty a_nR = +\infty. \]
First without loss of generality assume \(R = 1\), the proof for the infinite case resembles that of the finite case.
Let \(S_n = \sum_{k=0}^n a_k\) and we assume that \(S_n \to \infty\).
For any \(M>0\) there exists \(N\) such that
\[n\geq N\implies S_n > M.\]
Summing by parts, whenever \(n>N\) we have
\begin{align*}
\sum_{k=0}^n a_kx^k
&= S_nx^n + \sum_{k=0}^{n-1}S_k(x^k - x^{k+1}) \\
&= S_nx^n + (1-x) \sum_{k=0}^{n-1}S_k x^k \\
&> M x^n + (1-x)\left[ \sum_{k=0}^{N-1}S_k x^k + \sum_{k=N}^n S_k x^k \right] \\
&> M x^n + (1-x)\left[ \sum_{k=0}^{N-1}S_k x^k + M \sum_{k=N}^n x^k \right] \\
&= M x^n + (1-x)\left[ \sum_{k=0}^{N-1}S_k x^k + M \frac{x^N-x^n}{1-x} \right] \\
&= M x^N + (1-x)\sum_{k=0}^{N-1} S_k x^k
\end{align*}
and it follows that
\[ \sum_{n=0}^\infty a_nx^n \geq M x^N + (1-x)\sum_{k=0}^{N-1}S_k x^k. \]
Hence \(\lim_{x\to1^-} \sum_{n=0}^\infty a_nx^n \geq M\),
and since \(M\) was arbitrary the limit is actually \(+\infty\) as desired.

### Part (ii)

To show
\[\sum_{n=1}^\infty \frac1n = +\infty\]
by part (i) we just need to show that
\[\lim_{x\to1^-} \sum_{n=1}^\infty \frac{x^n}{n} = +\infty\]
as this power series has radius of convergence \(R=1\).
Denote the power series as
\[G(x) = \sum_{n=1}^\infty \frac{x^n}{n}\]
and we have
\[G'(x) = \sum_{n=0}^\infty x^n = \frac{1}{1-x}\]
for all \(x\in(-R,R)\).
Therefore
\[\lim_{x\to 1^-} G(x) = \lim_{x\to 1^-} \int_0^x \frac1{1-t}\ dt
= \lim_{x\to 1^-} -\ln(1-x) = +\infty. \]

## Q2

Let \(\epsilon>0\),
as the limit
\[\lim_{x\to 1^-} \sum_{n=1}^\infty a_nx^n = A\]
we can find \(0<c<1\) near enough to \(1\) such that
\[\sum_{n=1}^\infty a_nc^n > A-\frac\epsilon2 \]
then as the finite sum converges we can find \(N\) large enough such that
\[\sum_{n=N+1}^\infty a_nc^n < \frac\epsilon2 \]
and as a result for any \(M>N\),
\[\sum_{n=1}^M a_nc^n > A - \epsilon \]
Now we have
\[ A = \lim \sum a_nx^n \geq \lim \sum_{n=1}^M a_nx^n
= \sum_{n=1}^M a_n \geq \sum_{n=1}^M a_nc^n > A-\epsilon\]
which means \(\sum_{n=1}^\infty a_n = A\) too.

The condition on the coefficients was used a lot and cannot be removed.
For the counter example consider \(a_n = (-1)^n\), then the series
\[\sum_{n=0}^\infty (-x)^n\]
has radius of convergence \(R=1\).
However for all \(-1 < x < 1\) this series converges to \(\frac{1}{1+x}\) and the limit as \(x\to1\) from the left is \(\frac12\), but the sum \(\sum_{n=0}^\infty (-1)^n\) does not converge.

## Q3

As \(a_n\) is strongly dominated by \(\frac1{n^{1+\alpha}}\) where \(\alpha>0\), then
\[\lim_{n\to\infty} n^\alpha n a_n = 0\]
from this it follows that \(\lim_{n\to\infty} n a_n = 0\) too and we can directly apply Tauber's theorem to get the result.
