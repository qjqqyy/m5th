---
title: MA5220 Homework 1
author: Qi Ji
date: 23rd August 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\pred}[1]{\operatorname{\mathsf{pred}}\left(#1\right)}

# Prove Fact 3.3

## (a) {-}

> If \(x\) is an ordinal and \(y\in x\),
> then \(y\) is an ordinal and \(y = \pred{x,\in,y}\).


By definition of an ordinal, \(x\) is transitive and \((x,\in)\) is a well ordering.
First observe \(y\subseteq x\) because \(y\in x\) and \(x\) is transitive.

\(y\) is transitive
: Let \(z\in y\subseteq x\).
Since \(z\in x\) and \(x\) is transitive \(z\subseteq x\).
Let \(w\in z\subseteq x\), by \(\in\) being a linear order on \(x\) and transitivity \(w\in y\).
Therefore \(z\subseteq y\).

\((y,\in)\) is a well ordering
: Let \(z\subseteq y\), \(z\ne 0\), then \(z\) is also a nonempty subset of \(x\),
and since \((x,\in)\) is well ordered \(z\) contains a \(\in\)-least element.

\(y = \pred{x,\in,y}\).
: Let \(z \in y \subseteq x\), we can see that \(y\subseteq \pred{x,\in,y}\).
Let \(z \in \pred{x,\in,y}\), that is \(z\in x, z\in y\), we are also done.$\square$

## (b) {-}

> If \(x,y\) are ordinals and \((x,\in)\cong (y,\in)\), then \(x = y\).

Let \(f: x\to y\) witness the isomorphism.
It suffices to show that \(z = f(z)\) for all \(z\in x\).
Suppose the result fails, then we collect the set
\[ S = \set{z\in x: f(z) \ne z } \]
which is not empty by our assumption.
Let \(z\) be the \(\in\)-least member of \(S\).

By part (a), \(z = \pred{x,\in,z}\), and because \(z\) is minimal in \(S\), for all \(w\in z\), \(f(w) = w\).
So the \(f\)-image of \(z\) is just \(z\).
On the other hand \(f(z) = \pred{y,\in,f(z)}\) is also the image of \(z\), so \(z = f(z)\) which is a contradiction. $\square$


## (c) {-}

> If \(x,y\) are ordinals, then exactly one of the following holds: \(x=y, x\in y, y\in x\).

By Theorem 2.11 exactly one of the following holds.

#. \((x,\in)\cong (y,\in)\)

    * Apply (b) to get \(x = y\).

#. for some \(z\in y\), \((\pred{y,\in,z},\in) \cong (x,\in)\)

    * Apply (a) to see that \((z,\in)\cong (x,\in)\), applying (b) \(x = z\), and \(x\in y\) follows.

#. for some \(z\in x\), \((\pred{x,\in,z},\in) \cong (y,\in)\)

    * Similar to 2. $\square$

## (d) {-}

> If \(C\) is a non empty set of ordinals, then there exists \(x\in C\) such that
> \(\forall y\in C\paren{ y=x \lor x\in y }\).

Suppose for a contradiction
\[ \forall x\in C\exists y\in C \paren{y\ne x \land x\notin y}. \]
Then applying the trichotomy in part (c) we have for all \(x\in C\), there exists \(y\in C\) such that \(y\in x\),
this allows us to find an infinite descending chain of members of \(x\), which contradicts \(x\) being an ordinal.

#

> Suppose \((L,\prec)\) is a linear ordering such that for every \(X\subseteq L\),
> \((X,\prec)\) is isomorphic to an initial segment of \((L,\prec)\).
> Show that \((L, \prec)\) is a well ordering.

First consider \(0\subseteq L\), let \(m\in L\) such that \((0,\prec) \cong \pred{L,\prec,m}\).
We can see that \(m\) is the \(\prec\)-least member of \(L\).

Let \(X\subseteq L\), since \((X,\prec)\) is isomorphic to an initial segment of \((L,\prec)\) which necessarily contains \(m\),
\(X\) also has a \(\prec\)-least element and this shows \((L,\prec)\) is a well ordering.
$\square$


#

> Suppose \(X\) is an uncountable set and \(\prec_1, \prec_2\) are two well orderings on \(X\).
> Show that there is an uncountable \(Y\subseteq X\) such that \(\prec_1,\prec_2\) agree on \(Y\).


<div style="height:50vh"></div>
