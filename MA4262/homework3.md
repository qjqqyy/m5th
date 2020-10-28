---
title: MA4262 Homework 3
author: Qi Ji
date: 29th October 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\B}{\mathcal{B}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\pd}[2]{\frac{\partial #1}{\partial #2}}
\let\phi\varphi

#

We first use basic Hölder's inequality to show Hölder's inequality for two nonnegative simple functions \(\phi\) and \(\psi\).
Suppose we decompose these simple functions as
\[ \phi = \sum_{i=1}^n x_i \chi_{E_i} \text{ and } \psi = \sum_{i=1}^n y_j \chi_{E_i} \]
with \(E_1,\dots,E_n\) pairwise disjoint measurable subsets,
Then we have
\begin{align*}
\norm{\phi\psi}_1
&= \int \phi\psi\ d\mu \\
&= \sum_{i=1}^n x_i\;y_i\;\mu(E_i) \\
&= \sum_{i=1}^n x_i\;\mu(E_i)^{1/p}\;y_i\;\mu(E_i)^{1/q} \\
&\leq \left(\sum_{i=1}^n {x_i}^p\; \mu(E_i)\right)^{1/p} \left(\sum_{i=1}^n {y_i}^q\;\mu(E_i)\right)^{1/q} \\
&= \left(\int \phi^p\ d\mu\right)^{1/p} \left(\int \phi^q\ d\mu\right)^{1/q} \\
&= \norm{\phi}_p \norm{\psi}_q.
\end{align*}



Following hint,
without loss of generality assume \(f,g\) are nonnegative.

Let \(\phi_n\) and \(\psi_n\) be two monotonically increasing sequences of nonnegative simple functions
converging to \(f\) and \(g\) respectively.
Basic Hölder inequality for simple functions gives us that
\[ \norm{\phi_n\psi_n}_1 \leq \norm{\phi_n}_p\norm{\psi_n}_q \]
for each \(n\).

Now \(\phi_n\psi_n \to fg\) and \(\phi_1\psi_1\leq \phi_2\psi_2\leq \dots\), so by monotone convergence (thrice)
\begin{align*}
\norm{fg}_1
&= \lim_{n\to\infty} \norm{\phi_n\psi_n} \\
&= \lim_{n\to\infty} \norm{\phi_n}_p\norm{\psi_n}_q \\
&= \norm{f}_p\norm{g}_q.
\end{align*}

#

Similarly we use basic Minkowski inequality to show the case for nonnegative simple functions \(\phi\) and \(\phi\).
Decompose them similarly as previous question with \(E_1,\dots,E_n\) measurable satisfying the same disjoint conditions.
Then we have
\begin{align*}
\norm{\phi+\psi}_p
&=
\left(
\int \left(\phi+\psi\right)^p\ d\mu
\right)^{1/p} \\
&=
\left(
\sum_{i=1}^n \left(x_i + y_i\right)^p\;\mu(E_i)
\right)^{1/p} \\
&=
\left(
\sum_{i=1}^n \left(x_i\;\mu(E_i)^{1/p} + y_i\;\mu(E_i)^{1/p}\right)^p
\right)^{1/p} \\
&\leq
\left( \sum_{i=1}^n {x_i}^p\mu(E_i) \right)^{1/p} +
\left( \sum_{i=1}^n {y_i}^p\mu(E_i) \right)^{1/p} \\
&=
\left(
\int \phi^p\ d\mu
\right)^{1/p} +
\left(
\int \psi^p\ d\mu
\right)^{1/p} \\
&= \norm{\phi}_p + \norm{\psi}_p.
\end{align*}

Similarly applying monotone convergence we get the result for the general case.

#

By the definition of \(L^p\) we see that it is closed under scalar multiplication.
From Minkowski inequality we can deduce that \(L^p\) is closed under addition.

We proceed to show that \(\norm{\cdot}_p\) is a norm.
Positivity and definiteness easily arise from the definitions, same for homogeneity.
The triangle inequality for \(\norm{\cdot}_p\) is just Minkowski's inequality.

#

Let \((f_n)\) be a Cauchy sequence in \(L^p\).
Without loss of generality we can assume that it contracts quickly enough in the sense that
\(\norm{f_n - f_m}_p < 2^{-N}\) whenever \(n,m>N\).

By the condition that \(\norm{f_n - f_{n+1}}_p < 2^{1-n}\),
it follows that the set \(E_n := \set{x\in X: \abs{f_n- f_{n+1}>2^{-\frac{n}{2}}}}\) satisfies \(\mu(E_n) < 2^p\cdot 2^{1-\frac{n}{2}}\).
Since \(\sum_{n=1}^\infty \mu(E_n)\) is finite, by Borel-Cantelli lemma \(N = \limsup E_n\) has measure zero.
Define \(f\) to be the pointwise limit of \(f_n\) on \(X\setminus N\) and \(0\) everywhere else.

Next we show the \(\mu\)-a.e. pointwise limit \(f\) is also the limit in \(L^p\), we have
\[
\abs{f(x)} \leq g(x) := \begin{cases}
\abs{f_1(x)} + \sum_{i=1}^\infty \abs{f_{i+1}(x) - f_i(x)} &\text{for } x\notin N, \\
+\infty &\text{for } x\in N.
\end{cases}
\]
which means \(f\in L^p\) because \(\norm{f}_p \leq \norm{g}_p \leq \norm{f_1}_p + 2\).

Now as \(\abs{f_n-f}^p\) is dominated by \(g^p\), by dominated convergence,
\[ \lim_{n\to\infty} {\norm{f_n-f}_p}^p = \lim_{n\to\infty} \int \abs{f_n-f}^p\ d\mu = 0 \]
which shows that \(f\) is also the limit in \(\norm{\cdot}_p\).
