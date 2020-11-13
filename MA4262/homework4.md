---
title: MA4262 Homework 4
author: Qi Ji
date: 12th November 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\B}{\mathcal{B}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\pd}[2]{\frac{\partial #1}{\partial #2}}
\let\phi\varphi
\newcommand\sgn{\operatorname{sgn}}

#

\(G\) is a linear functional due to linearity of integration.
To see that \(G\) is bounded we can check that
\(G(f) = \int fg\ d\mu = \norm{fg}_1 \leq \norm{f}_p\norm{g}_q \)
by Hölder's inequality, which also shows the bound \(\norm{G}\leq\norm{g}_q\).

To finish the proof we choose
\[ f = c\cdot\sgn(g)\cdot\abs{g}^{q-1} \]
where \(c = {\norm{g}_q}^{-q/p}\), note that \(\frac{q}{p} = q-1\).

First we show \(f\) is \(L^p\) and \(\norm{f}_p = 1\),
\begin{align*}
{\norm{f}_p}^p &= \int \abs{f}^p\ d\mu \\
&= c^p \int \abs{g}^{p(q-1)}\ d\mu \\
&= c^p \int \abs{g}^{q}\ d\mu \\
{\norm{f}_p} &= c\cdot{\norm{g}_q}^{q/p} \\
&= 1
\end{align*}
then computing \(G(f)\) we have
\begin{align*}
G(f) &= \int fg\ d\mu \\
&= c \int \abs{g}^p\ d\mu \\
&= {\norm{g}_q}^{1-q}\cdot{\norm{g}_q}^q \\
&= \norm{g}_q
\end{align*}
which shows the equality in \(\norm{G} = \norm{g}_p\).

#

## (a) {-}

\(\nu(\emptyset) = 0\) as \(G\) is bounded.

Let \(E_1,E_2,\dots \in \mathcal{X}\) be disjoint,
as \(X\) is a finite measure space only finitely many sets have nonzero measure, so
additivity of \(\nu\) carries over from linearity of \(G\).

## (b) {-}

Use Hahn decomposition theorem to express \(X = P \sqcup N\) where \(P\) is positive for \(\nu\) and \(N\) negative.
Define \(\nu^+(E) = \nu(E\cap P)\) and \(\nu^-(E) = -\nu(E\cap N)\).
Positivity of each measure comes from the definitions, while definiteness and countable additivity inherits from \(\nu\).

## (c) {-}

Suppose \(\mu(E) = 0\), then \(\nu^{+}(E) = \nu(E\cap P) = G(\chi_{E\cap P}) = 0\) because \(\norm{\chi_{E\cap P}} = 0\),
so \(\nu^+ \ll \mu\), similarly we can show \(\nu^- \ll \mu\).

Applying Radon-Nikodýn theorem, let \(g^+, g^-: X\to [0,\infty)\) such that for any \(A\in\mathcal{X}\),
\begin{align*}
\nu^+(A) &= \int_A g^+\ d\mu, \\
\nu^-(A) &= \int_A g^-\ d\mu.
\end{align*}

## (d) {-}

For \(g^+\) we restrict our attention to measurable subsets of \(P\),
let \(E\in \mathcal{X}, E\subseteq P\), then
\[\nu^+(E) = \nu(E) = G(\chi_E) = \int \chi_E g^+\ d\mu \]
so by linearity for all nonnegative simple functions \(\phi\) with support in \(P\), we have
\[ G(\phi) = \int \phi g^+\ d\mu \]
then by Monotone Convergence we can generalise this equality to apply to all (nonnegative) \(f\in L^p\) with support in \(P\)
\[ G(f) = \int f g^+\ d\mu \]
this can be generalised to all \(f\in L^p\) with support in \(P\) by applying linearity of \(G\),
then we can use a similar trick to Q1 to produce a \(f\) satisfying \(G(f)\geq \norm{g^+}_q\).

Case of \(g^-\) is similar, except that \(G(f) = -\int fg^-\ d\mu\).

## (e) {-}

Let \(g = g^+ - g^-\), then
\begin{align*}
\int fg\ d\mu &= \int fg^+\ d\mu - \int fg^-\ d\mu \\
&= \int (f\cdot\chi_P)g^+\ d\mu - \int (f\cdot\chi_N)g^-\ d\mu \\
&= G(f\cdot\chi_P) + G(f\cdot\chi_N) \\
&= G(f\cdot\chi_P + f\cdot\chi_N) = G(f)
\end{align*}
seeing that \(\norm{g}_q = \norm{G}\) is basically Q1 again.

## (f) {-}

Suppose \(g'\) also represents \(G\),
without loss of generality let
\[ E = \set{x: g(x) > g'(x)} \]
be non-null, let \(E_\epsilon\) denote \(\set{x: g(x) > g'(x) + \epsilon}\) and as
\(E = \bigcup_{n=1}^\infty E_{1/n}\) we have \(E_\epsilon\) non-null for some \(\epsilon\).
As our measure space is finite we can see that \(\chi_{E_\epsilon}\) is in \(L^p\) and
\[ \int \chi_{E_\epsilon} g\ d\mu \ne \int \chi_{E_\epsilon} g'\ d\mu \]
which is a contradiction.

#

## (a) {-}

As \(f = \sgn(f)\abs{f}\) we can just show the case for nonnegative \(\abs{f}\).

## (b) {-}

Let \(\phi_n\) be a sequence of simple functions that converge to \(f\) almost everywhere.

## (c) {-}

Applying Egorov theorem as \(\lambda([a,b])\) is finite, there exists \(E_\delta\subseteq [a,b]\) with
\(\lambda(E_\delta) < \delta/3\) where \(\phi_n\) converges uniformly to \(f\) on \([a,b]\setminus E_\delta\).

## (d) {-}

Fix \(\delta > 0\),
For each \(\phi_n\), express it as
\[ \phi_n(x) = \sum_{j=1}^N a_{n,j} \chi_{E_{n,j}} \]
where \(E_{n,j}\) are disjoint.

As each \(E_{n,j}\) is measurable by approximating it with a closed set then approximating the resulting complement with an open set, we can find \(G_{n,j}\)
where \(\lambda(G_{n,j}) < \frac{2^{-n}\delta/3}{N}\) and \(\phi_n\) is constant on \(E_{n,j}\setminus G_{n,j}\).

As each \(E_{n,j}\setminus G_{n,j}\) is compact their pairwise Hausdorff distance is nonzero,
then \(\phi_n\) is continuous on \([a,b]\setminus G_n\) where \(G_n = \bigcup_{n=1}^N G_{n,j}\) and \(\lambda(G_n) < 2^{-n}\delta/3\).
Then \(\tilde{G}_\delta = \bigcup_{n=1}^\infty G_n\) has measure less than \(\delta/3\).

## (e) {-}

As both \(E_\delta\) and \(\tilde{G}_\delta\) are Lebesgue measurable we approximate their union with an open set to get \(G_\delta\) which contains both and has measure less than \(\delta\).

## (f) {-}

For each \(n\) consider \(\tilde{\phi}_n = \phi_n \cdot \chi_{G_\delta}\).

## (g) {-}

We have now shown that on \([a,b]\setminus G_\delta\), the convergence \(\phi_n \to f\) is uniform,
so \(f\) on \(\chi_{G_\delta}\) is a uniform limit of continuous functions and therefore continuous.

