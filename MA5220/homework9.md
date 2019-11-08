---
title: MA5220 Homework 9
author: Qi Ji
date: 8th November 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\Im}{\operatorname{Im}}
\newcommand{\range}{\operatorname{range}}
\newcommand{\cf}{\operatorname{cf}}
\newcommand{\type}{\operatorname{type}}
\newcommand{\trcl}{\operatorname{trcl}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\ex}[2]{\paren{\exists #1}\paren{#2}}
\newcommand{\fa}[2]{\paren{\forall #1}\paren{#2}}
\newcommand{\rank}{\operatorname{rank}}
\newcommand{\Fn}{\operatorname{Fn}}
\newcommand{\P}{{\mathbb{P}}}
\newcommand{\Q}{{\mathbb{Q}}}
\newcommand{\M}{\mathbf{M}}

#

> Let \(\M\) be a ctm of ZFC and \(f:\omega\to2\).
> Suppose \(f\) is a Cohen real over \(\M\), \(g:\omega\to2\) and \(g\in\M\).
> Prove that \(f+g\) is a Cohen real over \(\M\).

Let \(f\) be a Cohen real over \(\M\) and fix \(g:\omega\to2\) in \(\M\).
For any \(p\in\Fn(\omega,2)\) we denote
\[p' = g\upharpoonright(\dom(p)) + p\]
which is the pointwise xor of \(p\) with \(g\) at all points in which \(p\) is defined.
Then naturally for any set \(D\subseteq \Fn(\omega,2)\) we denote
\[D' = \set{p': p\in D}\]
and since xor'ing twice does nothing we see that \(p'' = p\) and as a result \(D'' = D\).

**Observation.** Whenever \(D\subseteq \P\) is dense, \(D'\) is dense too.
Let \(p\in\Fn(\omega,2)\), by density of \(D\) let \(q\in D\) such that \(q\leq p'\),
then \(q' \leq p'' = p\) and \(q' \in D'\).

To see that \(f+g\) is a Cohen real, let \(D\in \M\) be a dense subset of \(\P\),
we want to show that \(D\) meets \(G_{f+g}\).
It is shown that \(D'\) is dense, and by replacement \(D'\in\M\) too, so as \(G_f\) is generic over \(\M\), \(G_f\) meets \(D'\).
Let \(p\in G_f \cap D'\), then \(p' \in D'' = D\), and it follows from the definition of \(p'\) and fact that \(p\in G_f\) that \(p' \in G_{f+g}\).

#

> Let \(\M\) be a ctm of ZFC and suppose \(f:\omega\to2\) is a Cohen real over \(\M\).
> Suppose \(Y\in\M\) is an infinite subset of \(\omega\).
> Show that both \(Y\cap X_f\) and \(Y\setminus X_f\) are infinite.

Suppose \(Y\cap X_f\) is finite, we show that \(f\) is not a Cohen real over \(\M\).
The case where \(Y\setminus X_f\) is finite is similar.

Suppose \(Y\cap X_f\) is finite then \(Y\) (and hence \(\M\)) knows about infinitely many \(n\) where \(f(n) = 0\).
Let \(\abs{Y \cap X_f} = l\), use this rather large formula to define the following dense set
\[ D = \set{p: \ex{n_0,n_1,\dots,n_l<\omega}{\overline{n}\in\dom(p) \land \bigwedge_{i\ne j} n_i\ne n_j \land \bigwedge_{i=0}^l p(n_i) = 1 \iff n_i\in Y}}. \]
The density of \(D\) follows from \(Y\) being infinite, and \(D\in\M\) too.
Now \(G_f\) cannot meet \(D\) as \(f\) is \(1\) in \(Y\) at at most \(l\) points.


#

> Assume \(\textsf{MA}_{\omega_1}\).
> Let \((\P,\leq_\P, 1_\P)\) be a c.c.c. poset and let \(\kappa\) be an infinite cardinal.
> Define \(\Q\) to be the set of all \(f: \kappa\to\P\) such that \(\set{\alpha<\kappa: f(\alpha) \ne 1_\P}\) is finite.
> For \(f,g\in\Q\), define \(f\leq_\Q g\) iff \(\fa{\alpha<\kappa}{f(\alpha)\leq_\P g(\alpha)}\).
> Show that \(\Q\) satisfies c.c.c..

Let \(A\subseteq\Q\) be an uncountable antichain.
For each \(f\in A\) we consider its support all \(\alpha<\kappa\) such that \(f(\alpha) \ne 1_\P\).
\[ \set{\set{\alpha<\kappa: f(\alpha)\ne 1_\P}: f\in A} \]
If the family of all supports is countable then uncountably many points in \(A\) have the same (finite) support, call it \(r\),
we restrict \(A\) to these points and get a trivial sunflower with no petals.

In the other case we can restrict \(A\) such that the family of supports forms a \(\Delta\)-system with some root \(r\).
The root \(r\) cannot be empty, or else some \(f,g\in A\) would have a common extension (that being their pointwise minimum).
Then we can project \(A\) faithfully into the poset \({}^r\P\) equipped with the same pointwise ordering.
Note that \({}^r\P\) is the finite product of \(\P\) with itself \(\abs{r}\) many times,
and by \(\textsf{MA}_{\omega_1}\) and Theorem 22.9 already has ccc,
but the projection of \(A\) is an uncountable antichain in \({}^r\P\).

#

> Assume \(\textsf{MA}_{\omega_1}\).
> Let \(\P\) be a c.c.c. poset and suppose \(A\in [\P]^{\omega_1}\).
> Show that there exists \(\angle{G_n:n<\omega}\) such that each \(G_n\) is a filter on \(\P\) and \(A\subseteq \bigcup_{n<\omega} G_n\).

Following hint,
let \(\Q\) denote the finite support \(\omega\)-product of \(\P\).
By past question \(\Q\) is ccc.
For each \(p\in A\), let
\[D_p = \set{f: \ex{n<\omega}{f(n) = p}}\]
as the support of every sequence is finite \(D_p\) is dense in \(\Q\).
Invoke \(\textsf{MA}_{\omega_1}\) to get a filter \(G\) on \(\Q\) such that
\(G\) meets \(D_p\) for every \(p\in A\).
By meeting every single \(D_p\), we can cover \(A\) using \(\bigcup_{g\in G} \range(g)\).
Now define for each \(n<\omega\)
\[ G_n = \set{g(n): g\in G} \]
and \(\bigcup_{n<\omega} G_n = \bigcup_{g\in G} \range(g) \supseteq A\) as desired.
As the conditions required to be a filter distributes pointwise,
each \(G_n\) is a filter.

#

> Let \(\P\) be a countably closed poset in which every condition has two incompatible extensions.
> Show that \(\P\) is not ccc.

Using the same construction as two previous homeworks we can embed the set of all binary strings \(2^*\) in \(\P\)
such that for all \(s\in 2^*\), \(p_{s0} \perp p_{s1}\) and both \(p_{s0}, p_{s1} \leq p_s\).
For every \(x\in 2^\omega\) we look at the sequence \( \angle{p_{x\upharpoonright n}: n<\omega} \)
and as \(\P\) is countably closed there is a \(p_x\) below the entire sequence.
Now for \(x,y\in 2^\omega\), if \(x\ne y\) then \(p_x\perp p_y\),
consider the least \(n<\omega\) where \(x(n) \ne y(n)\),
if \(p_x\) and \(p_y\) were to have a common extension,
then \(p_{s\,x(n)}\) and \(p_{s\,y(n)}\) where \(s = x\upharpoonright n = y\upharpoonright n\) would have a common extension too,
which cannot happen.
