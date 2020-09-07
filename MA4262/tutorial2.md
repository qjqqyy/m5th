---
title: MA4262 Tutorial 2
author: Qi Ji
date: 8th September 2020 (LATE)
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\B}{\mathcal{B}}
\newcommand{\R}{\mathbb{R}}

#

## (a)

\(f:\R\to\R\) is continuous, for any open subset \(U\subseteq \R\), \(f^{-1}(U)\) is open and therefore Borel.

## (b)

\(g:\R\to\R\) is continuous everywhere except at \(0\), for any open \(U\subseteq \R\),
let \(V = U\setminus\set{g(0)}\) which is open.
Suppose \(U = V\sqcup\set{g(0)}\) (other case \(U=V\) is trivial),
\[g^{-1}(U) = g^{-1}(V)\cup g^{-1}(\set{g(0)}),\]
\(g^{-1}(V)\) is open because \(g\) is continuous on \(V\), while \(g^{-1}(\set{g(0)}\) is the union of \(\set{0}\) and a closed set.

#

Basically use definition of continuous (pullback of open is open), so taking \(f^{-1}\) of a Borel set keeps it Borel.

#

It's 1.

#

a. Any finite covering of \(E\) with closed intervals also covers \(\overline{E}\).

b. \([0,1]\cap\mathbb{Q}\) should do the trick. If I use finitely many intervals their length must add up to 1.

#

Let \(\epsilon>0\), then do analysis.
