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

#

i.  Suppose the graph is closed, we take the preimage of the function
\(\operatorname{id}\times f\) (which is continuous and injective by the way, so a homeomorphism) to get
\(E\times E\) being closed.

ii. image of \(f\) is compact and we express \(G(f)\) as \(E\times \operatorname{range}(f)\).

iii. If \(G(f)\) compact then both \(E\) and image \(f(E)\) are compact.
Suppose for contradiction \(f\) is not continuous, then
there exists a sequence \(x_n \to x\) where \(\lim f(x_n) \ne f(x)\).
Now we look at the sequence \(\left(x_n, f\left(x_n\right)\right)\)
of elements in \(G(f)\), observe that its limit is not in the graph of \(f\).

iv. Counterexample shouldn't be hard

# Orthogonal matrix path-connected

hard, do later

# Riemann function is nowhere differentiable

\begin{align*}
R&: \R\to\R \\
R(x) &= \begin{cases}
\frac1q &\text{if }x=\frac{p}q, (p,q)=1, p>0 \\
0 &\text{if }x\notin \mathbb{Q}
\end{cases}
\end{align*}

# Construct stuff

i.  continuous function \(\R\to\R\) differentiable at almost all points in \(\R\) except
\(a_1,a_2,\dots,a_n\)

    just make it bendy at each \(a_i\)

ii. function \(\R\to\R\) (not necessarily continuous) only differentiable at \(a_1,\dots,a_n\)
