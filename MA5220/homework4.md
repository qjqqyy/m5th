---
title: MA5220 Homework 4
author: Qi Ji
date: 13th September 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\pred}[1]{\operatorname{\mathsf{pred}}\left(#1\right)}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\cf}{\operatorname{cf}}
\newcommand{\range}{\operatorname{range}}
\newcommand{\Club}{\operatorname{Club}}

#

\newcommand{\A}{\mathcal{A}}
\newcommand{\B}{\mathcal{B}}

> Suppose \(\A\) is an uncountable family of pairwise disjoint non-stationary subsets of \(\omega_1\).
> Show that there exists \(\B\subseteq\A\) such that \(\B\) is uncountable and \(\bigcup\B\) is a non-stationary subset of \(\omega_1\).

Let's try dualing the statement,
Suppose \(\A^* \subseteq \Club(\omega_1)\) uncountable such that every pair unions to get \(\omega_1\).
We want \(\B \subseteq\A^*\) also uncountable such that \(\bigcap\B\) is in \(\Club(\omega_1)\).

Diagonal intersection, or Fodor's lemma.

#

Alternate the sequences.

#

Ulam matrix

#

> Let \((L, \prec)\) be a dense linear ordering without end points.
> Show that \((L, \prec)\) is separable iff \((L, \prec)\) is order isomorphic to
a sub-ordering of the real line \((\R, <)\).

Suppose \((L, \prec)\) is separable, then let \(M\subseteq L\) be countable dense subset, so every nonempty open interval in \(L\) contains an \(m\in M\).
Clear that \((M,\prec)\) is still a linear order, we want to show that \((M,\prec)\) is dense.
Let \(a,b\in M\), then there exists (by density of \((L,\prec)\)) \(c,d\in L\) with \(a \prec c \prec d \prec b\). By \(M\) being dense in \(L\) there exists \(e\in M\) with \(c \prec e \prec d\), this shows \((M, \prec)\) is dense.
Then \((M,\prec)\) is isomorphic to \((\mathbb{Q}, <)\) and let \(f\) witness the isomorphism.
Using continuity, \(f\) can be extended uniquely to get an isomorphism between \((L,\prec)\) and \((\R,<)\).

Conversely suppose \(Y\subseteq \R\) such that \((L,\prec)\) is isomorphic to \((Y, <)\).
If \(Y\) is countable we are done.
If not we first consider the collection of real intervals \(S = \set{\left(x-\frac1n,x+\frac1n\right): x\in\Q, n\in\omega}\),
for each \((a,b)\in S\) we choose \(z\in (a,b)\cap Y\) if the intersection is nonempty.

Let \(Z\) be the set consisting of all the chosen \(z\)'s and we prove that \(Z\) is a countable dense subset of \(Y\).
It is immediate from construction that \(\abs{Z}\leq \abs{S} = \omega\).
Let \(a, b \in Y\) with \(a < b\), then since \((Y,<)\) itself is dense choose
\(c\in Y\) with \(a < c < b\).
Let \(\varepsilon = \min(\abs{b-c},\abs{c-a}) > 0\), and let \(n\in\omega\)
such that \(\frac1n < \frac\varepsilon2\).
Let \(x\in\Q\) such that \(\abs{x-c} < \frac1n\),
then \(c \in \left(x-\frac1n,x+\frac1n\right) \in S\),
so \(\left(x-\frac1n,x+\frac1n\right) \cap Y\) is nonempty.
Let \(z\in\left(x-\frac1n,x+\frac1n\right) \cap Y\) be chosen,
then \(\abs{z-c} < \frac2n < \varepsilon\) so \(z\) is still between \(a\) and \(b\).

Let \(g: L\to Y\) witness the isomorphism, then we can easily check that \(g^{-1}(Z)\) is a countable dense subset in \((L,\prec)\).

#

\newcommand{\F}{\mathcal{F}}
> Let \((\Q, <)\) be the usual ordering of rationals.
> Show that there is a family \(\F\) of subsets of \(\Q\) such that
> \(\abs{\F} = 2^\omega\) and for every \(A,B\in\F\),
> \((A,<)\ncong(B,<)\).

For any \(x\in\Q\) we let \(Z(x)\) denote a \(\mathbb{Z}\)-chain centered around \(x\)
\[ Z(x) = \set{ x\pm \left(1-\frac1{n+1}\right) : n\in\omega }, \]
and when \(k\in\omega\), we let \(C(x,k)\) denote the \(k\)-chain around \(x\)
\[ C(x,k) = \set{ x + \frac{i}{k} : i< k }. \]

Whenever \(X\) is an infinite subset of \(\omega\),
let \(x_0, x_1, \dots\) be an increasing enumeration of elements of \(X\), and 
define a map \(F: [\omega]^\omega \to \mathcal{P}(\Q)\) as
\[ F(X) = \bigcup_{i<\omega} Z(2i)\cup C(2i+1, x_i). \]
\(F\) is clearly injective, so set \(\mathcal{F} = \operatorname{range}(F)\) and we have \(\abs{\mathcal{F}} = 2^\omega\).

Let \(A,B\in\F\), we want to show that \((A,<)\ncong(B,<)\).
Let \(X,Y\subseteq \omega\) be infinite such that \(F(X) = A\) and \(F(Y)=B\).
Since \(A \ne B\), \(X \ne Y\), without loss of generality let \(x\in X\), \(x\notin Y\),
then \(A\) has a finite chain of exactly \(x\) elements while \(B\) does not.
To complete the proof, we just need to observe that when \(x\in\omega\) is fixed,
the statement expressing
"there exists a chain with exactly \(x\) elements where the least member of the chain has no predecessor and the greatest member of the chain has no successor" is first-order definable.
