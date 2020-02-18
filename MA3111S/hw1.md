---
title: MA3111S Homework 1
author: Qi Ji
date: 4th February 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}

# Exercise 1

## (1)

Suppose \(f\) is continuous and let \(x_n \to x\) be a sequence.
For any \(\epsilon>0\),
\(B_Y(f(x), \epsilon)\) the \(\epsilon\)-ball around \(f(x_n)\) in \(Y\) is a neighbourhood and
as \(f\) is continuous there is a \(\delta\) such that \(f(B_X(x,\delta)) \subseteq B_Y(f(x), \epsilon)\).
As \(x_n\to x\) there is some \(N\) such that \(n\geq N \implies d(x_n, x) < \delta\), therefore \(f(x_n) \to f(x)\).

Conversely suppose that \(f\) fails to be continuous at \(x\in X\),
then there exists a neighbourhood \(M\) of \(f(x)\) such that
for all neighbourhoods of \(x\) \(N\) we have \(f(N) \nsubseteq M\).
Fix \(x, M\) as above and for each \(n\),
we choose a point \(x_n \in B(x, \frac1n)\)
such that \(f(x_n) \notin M\).
Then this sequence \(x_n \to x\) but each \(f(x_n) \notin M\)
so \(f(x_n) \to f(x)\) is impossible.

## (2)

For any \(U\subseteq Z\) we have \((g\circ f)^{-1}(U) = g^{-1}(f^{-1}(U))\).
So in particular, when \(U\) is open \((g\circ f)^{-1}(U)\) is also open by continuity of \(f\) and \(g\).

# Exercise 2

## (1)

Positivity, definiteness and symmetry easily carry from the fact that \(X_1, X_2\) are metric spaces.
Triangle inequality also carries over,
consider any \(x_1,y_1,z_1\in X_1\) and \(x_2,y_2,z_2\in X_2\),
\begin{align*}
d((x_1, x_2), (z_1, z_2))
&= d_1(x_1, z_1) + d_2(x_2, z_2) \\
&\leq d_1(x_1, y_1) + d_1(y_1,z_1) + d_2(x_2, y_2) + d_2(x_2,z_2) \\
&= d((x_1, x_2), (y_1,y_2)) + d((y_1,y_2), (z_1,z_2))
\end{align*}

## (2)

Let \((X,\tau)\) denote the product topology and \((X,\sigma)\) denote the one induced by the metric \((X,d)\).
We know that \[
\mathcal{B} = \set{ B(x_1,r_1)\times B(x_2,r_2): x_1\in X_1, x_2\in X_2, r_1,r_2>0 }
\]
is a base for \((X,\tau)\).
Fix \(B(x_1,r_1)\times B(x_2,r_2)\in\mathcal{B}\)
and it suffices to show that this set is open in \((X,\sigma)\).
Let \((y_1,y_2) \in B(x_1,r_1)\times B(x_2,r_2)\)
choose \(0 < \delta < \min\set{r_1 - d(x_1,y_1), r_2 - d(x_2, y_2)}\)
and we can see that \(B\left((y_1,y_2), \delta\right) \subseteq B(x_1,r_1)\times B(x_2,r_2)\) which shows that \(B(x_1,r_1)\times B(x_2,r_2)\) is open in \((X,\sigma)\).

Conversely fix \((x_1,x_2)\in X, r>0\) and we want to show that
\(B((x_1,x_2), r)\) is open in the product topology.
Let \((y_1,y_2)\in B((x_1,x_2), r)\), and let
\[m = r - d_1(x_1,y_1) - d_2(x_2,y_2) > 0\]
choose \(\delta < \frac{m}2\) and we can see that
\(B(y_1,\delta)\times B(y_2,\delta) \subseteq B((x_1,x_2),r)\),
so \(B((x_1,x_2),r)\) is also open in \(\tau\).

# Exercise 3

## (1)

To show that \(\phi\) is Lipschitz we want to find an upper bound for
\[
\frac{\norm{\phi\lambda - \phi\mu}}{\abs{\lambda -\mu}}
= \frac{\max_{x\in[0,1]}\abs{\lambda - \mu}x^2}{\abs{\lambda -\mu}}
= 1
\]

## (2)

The closed unit ball is not compact. We just need to see that \(\mathscr{C}^0\)
is an infinite-dimensional vector space.
We consider the set \(\set{x\mapsto1,x\mapsto x,x\mapsto x^2,\dots}\)
which is an infinite set that is linearly independent.

## (3)

Let \(g\in\overline{\mathscr{F}}\setminus\mathscr{F}\), then every neighbourhood of \(g\) contains some \(f\in\mathscr{F}\).
In particular for all strictly positive integer \(n\) choose
\(f_n \in \mathscr{F}\) such that \(\norm{g-f_n} < \frac1n\).
Now for any \(x,y\in[0,1]\), by triangle inequality for all \(n\)
\begin{align*}
\abs{g(y)-g(x)} &\leq \abs{g(y)-f_n(y)} + \abs{f_n(y)-f_n(x)} + \abs{f_n(x)-g(x)} \\
&< \frac2n + \abs{f_n(y)-f_n(x)} \\
&\leq \frac2n + \abs{y-x}
\end{align*}
so it turns out that \(g\in\mathscr{F}\).
Hence \(\mathscr{F}\) is closed.

## (4)

Choose any sequence \(f_n\) in \(\mathscr{F}_1\),
we see that the sequence \((f_n)\) is uniformly bounded as \(\norm{f_n}_0 \leq 1\).
The sequence is also uniformly equicontinuous as each \(f_n\) is 1-Lipschitz.
By Arzelà–Ascoli theorem \((f_n)\) has a convergent (wrt \(\norm{\cdot}\)) subsequence, hence \(\mathscr{F}_1\) is sequentially compact, and therefore compact
(in the metric space \(\mathscr{C}^0\)).

**FIXUP: also state that the convergent subsequence converges to some function in \(\mathscr{F}_1\).**

## (5)

Choose any \(f\in\mathscr{F}_2\), if \(f\not\equiv 0\) since \(f\) is continuous,
intermediate value property gives us \(c\in[0,1]\) with \(f(c) = 0\).
Then as \(f\) is 1-Lipschitz we still have a uniform bound \(\norm{f}_0\leq 1\).
Now repeat the argument in (4).

## (6)

For any \(f\in\mathscr{F}_3\) by mean value theorem for any \(x,y\in[0,1]\), we have
\[ \abs{f(y) - f(x)}\leq\abs{y-x} \]
due to the uniform bound on \(f'\). Repeat the argument in (4).

**FIXUP: this is wrong**

# Exercise 4

Let \(U^c\) denote \(X\setminus U\), note that \(U^c\) is closed and disjoint from \(K\) as assumed.
Choose \(\delta>0\) such that \(d(x,U^c) \geq\delta\) for all \(x\in K\).
Define \(f\) as
\[ f(x) = \frac{\max\set{d(x,U^c),\delta}}\delta \]
and it follows from our choice of \(\delta\) that \(f=0\) on \(X\setminus U\) and \(f=1\) on \(K\).

We first show that \(d(-,U^c)\) is Lipschitz.
Let \(x,y\in X\) and for all \(z\in U^c\),
\begin{align*}
d(x,U^c) &\leq d(x,z) \\
&\leq d(x,y) + d(y,z) \\
d(x,U^c) - d(x,y) &\leq d(y,z)
\end{align*}
therefore \(d(x,U^c) - d(y,U^c) \leq d(x,y)\).
Symmetric argument shows \(d(y,U^c) - d(x,U^c) \leq d(x,y)\).

To see that \(f\) is Lipschitz fix \(x,y\in X\) and consider the following cases,

Both \(d(x,U^c)\) and \(d(y,U^c)\) bounded below by \(\delta\)
:   then \(\abs{f(y) - f(x)} = 0 \leq d(x,y)\).

Both \(d(x,U^c)\) and \(d(y,U^c)\) less than \(\delta\)
:   by earlier result
\[\abs{f(y) - f(x)} = \frac1\delta\abs{d(y,U^c) - d(x,U^c)} \leq \frac{d(x,y)}{\delta}.\]

WLOG \(d(x,U^c)\geq\delta\) and \(d(y,U^c)<\delta\)
:   \[
\abs{f(y)-f(x)} = \frac1\delta\abs{d(y,U^c)-\delta} \leq \frac1\delta\abs{d(y,U^c)-d(x,U^c)}\leq \frac{d(x,y)}\delta.
\]

Hence \(f\) is \(\frac1\delta\)-Lipschitz as desired.
