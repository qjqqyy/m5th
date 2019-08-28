---
title: MA3110S Tutorial 3
author: Qi Ji
date: 30th August 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\R}{\mathbb{R}}

#

> Given \(A,B\) two disjoint compact sets in \(\R^n\)
> prove that there exists continuous function from \(\R^n\to\R\) that
> sends \(A\) to \(1\) and \(B\) to \(0\).

Explicitly construct \[f(x) = \frac{d(x,B)}{d(x,A) + d(x,B)}\]
where \(d(x,A) := \inf\set{d(x,a):a\in A}\).
Easy check: \(f\) satisfies \(f\upharpoonright A = 1\) and \(f\upharpoonright B = 0\).
It suffices to show that for any compact set \(A\), the map
\[ x \mapsto d(x,A) = \inf\set{d(x,a):a\in A} \]
is continuous.
Let \(x_n \to x\), want \(\lim d(x_n, A) = d(x, A)\).
Note that for any \(n \in \mathbb{N}, a\in A\),
\begin{align*}
d(x_n,a)\leq d(x_n, x) + d(x, a) \\
d(x_n,A)\leq d(x_n, x) + d(x, A)
\end{align*}
and similarly
\[ d(x,A)\leq d(x_n, x) + d(x_n, A) \]
which gives
\[ \abs{d(x,A) - d(x_n,A)} \leq d(x_n, x). \tag*{$\square$}\]



<div style="height:100vh"></div>
