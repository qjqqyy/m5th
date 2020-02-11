---
title: MA4211 Homework
author: Qi Ji
date: 12th February 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}

# Problem Sheet 2 Q4

Linearity of \(T\) is obvious.
For \(T\) to be a bounded linear operator from \(\ell_1\) to itself,
it is necessary and sufficient for \(a_n\) to be pointwise bounded,
that is exist \(M\) such that each \(\abs{a_n} < M\).

Suppose exists \(M\) such that for all \(n\), \(\abs{a_n} < M\).
Let \(x\in \ell_1\) and consider \(Tx = (a_nx_n)\).
Now
\[\norm{Tx} = \sum_n \abs{a_nx_n} \leq \sum_n M\abs{x_n} = M \norm{x}.\]

Conversely suppose \(T\) is bounded with \(\norm{T}\leq N\).
For each \(j\in\N\) consider \(e_j = (\delta_{ij})_{i\in\N}\), and we know that \(\norm{e_j} = 1\).
As \(\norm{T} < N\), \[ \norm{Te_j} = \abs{a_j} \leq N \]
and as a result \(N\) also bounds each \(\abs{a_j}\).

# Problem Sheet 3 Q1

Choose a basis \(\set{e_1,\dots,e_n}\) for \(V\).
To show that \(T\) is continuous we just need to show that \(T\) is bounded.
Consider any \(v\in V\)
\begin{align*}
\norm{Tv} &= \norm{ T\left( \sum_i v_i e_i \right) } \\
&\leq \sum_i \abs{v_i} \norm{Te_i}
\end{align*}
now let \(M = \max_i \norm{T e_i}\)
and as any two finite-dimensional norms are equivalent, there exists \(N\) such that
\[ \sum_i \abs{v_i} \leq N\norm{v} \]
and therefore \(\norm{Tv} \leq MN\norm{v}\).
