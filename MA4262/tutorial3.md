---
title: MA4262 Tutorial 3
author: Qi Ji
date: 9th September 2020 
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\B}{\mathcal{B}}
\newcommand{\R}{\mathbb{R}}

#

Suppose \(E\in\mathcal{X}\), pullback an open set \(U\subseteq \R\), 4 cases

* if \(U\) contains neither \(0\) nor \(1\) preimage is empty (and measureable),
* similar story for containing both, preimage will be \(X\),
* if \(U\) contains only \(0\), the preimage is \(E^c\),
* likewise if \(U\) contains only \(1\) the preimage is \(E\).

If \(E\notin\mathcal{X}\) we take pre-image of \(\set{1}\) which is just \(E\) which by hypothesis is not \(\mathcal{X}\)-measurable.

#

Idea:
iterate through all (finitely many) nonempty subsets \(S \subseteq \set{E_1,\dots,E_k}\),
define \(F_S\) to be the intersection and let \(c_s = \sum_{E_k\in S} b_k\).

Show that the two functions coincide,
show that disjoint refinement is unique-ish (so if two integrals differ the functions differ),
disjoint refinement and additivity of measure helps here.

#

Finite times finite is finite.

#

a. Easy to see mapping is one-one. Also easy to see that \(c\varphi(x) \leq cf(x)\).

b. Sup both sides.

#

damn technical

#

no time sry
