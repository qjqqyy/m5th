---
title: MA4266 Assignment 1
author: Qi Ji
date: 3rd March 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert #1\right\rvert}

#

As \(A\subset X\) is closed \(X\setminus A\) is open, similarly \(Y\setminus B\) is open.

To see that \(A\times B\) is closed we show that its complement is open, now
\[
(X\times Y) \setminus (A\times B) = (X\setminus A)\times Y \cup X\times (Y\setminus B)
\]
and both \((X\setminus A)\times Y\) and \(X\times (Y\setminus B)\) are open in the box (equivalent in this case to product) topology.

#

Suppose \(X\) is Hausdorff, consider the complement of the diagonal
\[ \Delta^c = \set{(x,y)\in X\times X: x\ne y}. \]
For each \((x,y) \in \Delta^c\), as \(x\ne y\),
let \(U_{x,y}\) and \(V_{x,y}\) be open and disjoint such that
\(x\in U_{x,y}\) and \(y\in V_{x,y}\).
As a result \((x,y) \in U_{x,y}\times V_{x,y}\) which is open in \(X\times X\),
and we can see that
\[ \Delta^c \subseteq \bigcup_{(x,y)\in \Delta^c} U_{x,y}\times V_{x,y}. \]
To see that equality holds, suppose for a contradiction \(\Delta\) intersects with the union at say \((z,z)\),
and let \((x,y)\in \Delta^c\) such that \((z,z) \in U_{x,y}\times V_{x,y}\). This is absurd as \(U_{x,y}\) and \(V_{x,y}\) are disjoint.

Conversely suppose the diagonal is closed, so \(\Delta^c\) is open.
Let \(x,y\in X\) with \(x\ne y\), that is \((x,y)\in \Delta^c\).
By box topology we have \(U,V\) open in \(X\) with \((x,y) \in U\times V \subseteq \Delta^c\).
Now \(U\) and \(V\) are disjoint, otherwise \(U\times V\) would not be contained in \(\Delta^c\), and we are done.

#

## (a) {-}

In the case where \(\Lambda\) is finite, when \(\abs{\Lambda} \leq 1\) it is trivial.
When \(\abs{\Lambda}\geq 2\) we just repeatedly apply pasting lemma.

## (b) {-}

Let \(f:\mathbb{N}\to\mathbb{R}\) be inclusion, where \(\mathbb{N}\) is equipped with the cofinite topology and \(\mathbb{R}\) the natural topology on the real line.
Let \(\Lambda = \mathbb{N}\) with \(A_n = \set{n}\) for each \(n\in\mathbb{N}\).
The restriction \(f\vert_{\set{n}}\) is continuous for each \(n\) but \(f^{-1}((0,10))\) for example is co-infinite and not open.

## (c) {-}

Let \(V\subseteq Y\) be closed.
For each \(\alpha\in\Lambda\) denote
\[ C_\alpha = (f\vert_{A_\alpha})^{-1}(V) \subseteq A_\alpha \]
and note that \(C_\alpha\) is closed in \(A_\alpha\) and hence in \(X\).
As the family \(\set{C_\alpha}_{\alpha\in\Lambda}\) is also locally finite, it preserves closures and
\begin{align*}
f^{-1}(V) &= \bigcup_{\alpha\in\Lambda} C_\alpha \\
&= \bigcup_{\alpha\in\Lambda}\overline{C_\alpha} \\
&= \overline{\bigcup_{\alpha\in\Lambda} C_\alpha} \\
&= \overline{f^{-1}(V)}
\end{align*}
so \(f^{-1}(V)\) is closed.

#

Boundedness of \(d'\) is trivial and positivity, definiteness and symmetry all easily carry over from that of \(d\).
To show triangle inequality consider \(f:[0,+\infty) \to [0,1)\) defined by \[f(t) = \frac{t}{1+t}.\]
Differentiating \(f\) we see that it preserves order (strictly increasing), applying triangle inequality to \(d\),
\begin{align*}
d(x,y) &\leq d(x,z) + d(z,y) \\
d'(x,y) = f(d(x,y)) &\leq f(d(x,z) + d(z,y)) \\
&= \frac{d(x,z)}{1 + d(x,z) + d(z,y)} +\frac{d(z,y)}{1 + d(x,z) + d(z,y)} \\
&\leq \frac{d(x,z)}{1 + d(x,z)} +\frac{d(z,y)}{1 + d(z,y)} \\
&= d'(x,z) + d'(z,y)
\end{align*}

First note that \(f\) has an inverse given by \(f^{-1}(u) = \frac{u}{1-u}\).
Let \(x\in X, r\in\mathbb{R}^+\) and \(B(x,r) = \set{y: d(x,y) < r}\),
as \(d(x,y) < r\) iff \(d'(x,y) < f(r)\), it follows that
\[B(x,r) = B'(x,f(r)) = \set{y:d'(x,y) < f(r)}\]
so the metric topologies agree.

#

later

#

Let \(A\subseteq X\times Y\) be closed,
we want to show that
\[ X\setminus\pi_1(A) = \set{ x\in X: (\forall y\in Y)((x,y)\in A^c) } \]
is open.

Let \(x_0\in X\setminus\pi_1(A)\) and for each \(y\in Y\) we have
\(U_{y}\) open in \(X\) and \(V_{y}\) open in \(Y\) with
\( (x_0,y) \in U_{y}\times V_{y} \subseteq A^c \).
As the family \(\set{V_y}_{y\in Y}\) is an open cover for \(Y\) pick a finite subcover
\(Y = V_{y_1} \cup \dots \cup V_{y_k}\).

Now let \(U = \bigcap_{i=1}^k U_{y_i}\) which is open.
It suffices to show that \(U\subseteq X\setminus \pi_1(A)\), so suppose for a contradiction that \(U\cap \pi_1(A) \ne \emptyset\).
If \(x \in U \cap \pi_1(A)\), then let \(y\) such that \((x, y) \in A\).
But \(y\in V_{y_i}\) for some \(i\) and \(x \in U\subseteq U_{y_i}\) too, so
\((x,y) \in U_{y_i}\times V_{y_i}\subseteq A^c\), a contradiction.

#

Suppose \(f\) is continuous, we show \((X\times Y)\setminus G_f\) is open.
Let \((x,y) \in (X\times Y)\setminus G_f\) and as \(Y\) is Hausdorff let \(U,V\subseteq Y\) disjoint
such that \(f(x)\in U\) and \(y\in V\).
As \(f\) is continuous there is some open \(W\subseteq X\) with \(x\in W\) and \(f(W)\subseteq U\).
Now \(W\times V\) is an open neighbourhood of \((x,y)\) that is still disjoint from \(G_f\), and we are done.

Conversely suppose the graph \(G_f\) is closed.
Let \(V\subseteq Y\) be closed and we want to show that \(f^{-1}(V)\) is closed in \(X\).
Now
\[f^{-1}(V) = \pi_1(G_f \cap (X \times V))\]
and as \(X\times V\) is closed, by previous problem \(f^{-1}(V)\) is closed as desired.

#

cantor later

#

Assume \(X\) is separable and we want to show that \(X\) has countable chain condition.
Let \(D\subseteq X\) be countable with \(\overline{D} = X\).
Let \(\mathcal{F}\) be a family of disjoint open subsets of \(X\).
Without loss of generality assume \(\emptyset \notin \mathcal{F}\).
For each nonempty open \(U\in\mathcal{F}\), as \(D\) is dense in \(X\), \(U\cap D \ne \emptyset\).
We can now define a function \(\phi:\mathcal{F} \to D\) where \(\phi(U) \in U\cap D\).
As \(\mathcal{F}\) contains disjoint sets, \(\phi\) is injective,
hence \(\abs{\mathcal{F}} \leq \abs{D} \leq \aleph_0\) as desired.

#

## (a) {-}

Let \(x,y\in X\) with \(x\ne y\).
As \(\set{y}\) is closed, let \(U,V\) be open and disjoint with \(x\in U\) and \(\set{y}\subseteq V\).
Since \(U\) is a neighbourhood of \(x\) disjoint from \(V\) it witnesses \(x\notin \overline{V}\).
Now we can find \(U', V'\) open and disjoint such that \(x\in U'\) and \(\overline{V}\subseteq V'\).
For any \(v\in\overline{V}\), \(V'\) is an open neighbourhood disjoint from \(U'\) which gives us that \(\overline{V}\cap \overline{U'} = \emptyset\).
So \(x\in U'\) and \(y\in V\) gives us the separation as desired.

## (b) {-}

Let \(A,B\subseteq X\) be disjoint closed sets.
Let \(U,V\) be disjoint and open such that \(A\subseteq U\) and \(B\subseteq V\).
For reasons similar to previous part, \(A\cap \overline{V} = \emptyset\).
Now let \(U', V'\) be disjoint and open such that \(A\subseteq U'\) and \(\overline{V}\subseteq V'\).
Similarly \(\overline{V}\cap \overline{U'} = \emptyset\) and
\(A\subseteq U'\), \(B\subseteq V\) gives us the separation.

<div style="height:50vh"></div>
