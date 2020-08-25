---
title: MA4262 Tutorial 1
author: Qi Ji
date: 26th August 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\B}{\mathcal{B}}
\newcommand{\R}{\mathbb{R}}

#

We show the Borel \(\sigma\)-algebra \(\B\) is the smallest \(\sigma\)-algebra containing the family of all half-open intervals
\((a,b] = \set{x\in\R | a<x\leq b}\).

First for any \((a,b]\) we show it's Borel.
Observe that \[(a,b] = (a,b) \cup \left[\frac{a+b}2,b\right]\]
where \(\left[\frac{a+b}2,b\right] = \R \setminus ((-\infty,\frac{a+b}2)\cup(b,+\infty))\).

Since any open set in \(\R\) can be expressed as a countable union of open intervals,
we just need to show that any open interval \((a,b)\) can be generated from the \(\sigma\)-algebra containing all half-open intervals.
Similarly, \[(a,b) = \bigcup_i (a,b_i]\] where \(b_i\) is some monotone increasing rational sequence that converges to \(b\).

#

Follow hint and chase elements, just set theory.

#

\let\phi\varphi

For \(n=1,2,\dots\) define \(\phi_n(x)\) using
\begin{align*}
E_{k,n} &= f^{-1} [k 2^{-n}, (k+1) 2^{-n}] \text{ for } k = 0, 1, 2, \dots, n 2^n -1 \\
E_{n2^n,n} &= f^{-1} [n, +\infty)
\end{align*}
and \[ \phi_n(x) = k 2^{-n} \text{ for } x\in E_{k,n}. \]

## part (a)

Fix \(n\) and we show \(\phi_n^{-1} (\alpha,+\infty)\) is \(\mathcal{X}\)-measurable.
By definition of \(\phi_n\) we can compute the pullback as
\[ \bigcup_{k>\alpha 2^n} E_{k,n} \]
and each \(E_{k,n}\) is \(\mathcal{X}\)-measurable as \(f\) is measurable.

## part (b)

Given \(\epsilon\) let \(N\) such that forall \(n>N\),
\(2^{-n} < \epsilon\) and \(n2^n > K\), then etc etc etc.

#

\(\lambda(\emptyset) = 0\) is trivial.

Enough to show countable additivity for case \(n=2\).
Closure under linear combination follows from same behaviour of convergent real sequences.

#

a. Countable additivity breaks.

b. This is basically some sort of cardinal measure. We know by axiom of choice that countable union of at most countable set is at most countable, no closure problems so this is a measure.
