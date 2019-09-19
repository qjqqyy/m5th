---
title: MA5220 Homework 4
author: Qi Ji
date: 20th September 2019
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

Suppose for a contradiction that for all \(\B\subseteq \A\), whenever
\(\B\) is uncountable, \(\bigcup\B\) is stationary subset of \(\omega_1\).

__Claim.__ We can refine \(\A\) into an uncountable sequence \(\B = \angle{B_\alpha: \alpha < \omega_1}\) where each \(B_\alpha\in A\) such that
\[ \alpha < \beta \implies \alpha < \min A_\alpha < \min A_\beta .\]

Let \(\angle{A_\alpha: \alpha < \abs{\A}}\) be a well-ordering of the subsets in \(\A\),
first recursively define an increasing function \(f:\omega_1\to\omega_1\) which we use to obtain a subsequence \(\B\).

\[
f(0) = \begin{cases}
0 &\text{if } \min A_0 > 0 \\
1 &\text{otherwise}
\end{cases}\]
and when \(f(\alpha)\) is defined for all \(\alpha<\beta\),
let \(\mu = \sup\set{\min(A_{f\alpha}): \alpha<\beta}\) and define
\[
f(\beta) = \min\set{\gamma: \beta<\gamma \text{ and } \sup\set{\mu,\beta} < \min A_{\gamma} }
\]
and note that \(f(\beta)\) is well defined as both \(\mu,\beta\) are countable and by pairwise disjointedness of \(A_\alpha\)'s I can always find a suitable \(\gamma\) below \(\omega_1\).
We can now verify that \(\B = \angle{B_\alpha = A_{f(\alpha)}: \alpha<\omega_1}\) is an uncountable subsequence of \(\A\).

Define \(g: \bigcup_{\alpha<\omega_1} B_\alpha \to \omega_1\) as
\[ g(\gamma) = \beta \text{ where } \gamma \in B_\beta \]
which is regressive by construction as \(\beta < \min B_\beta \leq \gamma\).
Then by Fodor's lemma there exists a stationary \(T\subseteq \bigcup_{\alpha<\omega_1} B_\alpha\) where \(g\upharpoonright T\) is constant,
but if the restriction is constant it means that \(T\subseteq B_\beta\) for some \(\beta<\omega_1\), which means \(T\) is non-stationary.



#

\newcommand{\Lim}{\operatorname{Lim}}
> Let \(\Lim(\omega_1)\) denote the set of limit ordinals in \(\omega_1\).
> Suppose \(\angle{A_\alpha:\alpha\in\Lim(\omega_1)}\) satisfies the following
>
> i. For every \(\alpha\in\Lim(\omega_1)\), \(A_\alpha\) is an unbounded subset of \(\alpha\) of order type \(\omega\).
> ii. For every uncountable \(A\subseteq \omega_1\), there exists \(\alpha\in\Lim(\omega_1)\) such that \(A_\alpha\subseteq A\).
>
> Show that for every uncountable \(A\subseteq\omega_1\), the set
> \(\set{\alpha\in\Lim(\omega_1): A_\alpha\subseteq A}\) is stationary in \(\omega_1\).

Let \(A\subseteq \omega_1\) be uncountable,
and let \(C\subseteq\omega_1\) be a club.
We want to show that
\(\paren{\exists\alpha\in C}\paren{\alpha\in \Lim(\omega_1)\land A_\alpha\subseteq A}\).
By considering \(C\cap \Lim(\omega_1)\), which is the intersection of 2 clubs,
we can without loss of generality let \(C\subseteq \Lim(\omega_1)\) and simplify the condition to
\[\paren{\exists\alpha\in C}\paren{A_\alpha\subseteq A}.\]
Recursively define \(f:\omega_1\to A\) as
\[ f(0) = \left(\begin{aligned}
\textbf{let } & \mu = \min\set{\alpha\in\Lim(\omega_1):A_\alpha\subseteq A} \textbf{ in} \\
&\min A_{\mu}
\end{aligned}\right)\]
and when \(f\) is defined for all \(\alpha<\beta\),
\[ f(\beta) = \left(\begin{aligned}
\textbf{let }& \gamma_1 = \sup\set{f(\alpha):\alpha<\beta}\\
&\gamma_2 = \min(C\setminus\gamma) \\
&A' = A\setminus\gamma_2 \\
&\mu = \min\set{\alpha\in\Lim(\omega_1): A_\alpha\subseteq A'} \textbf{ in} \\
&\min A_\mu
\end{aligned}\right)\]
in both cases \(f\) is well-defined as \(\mu\) always exists since \(A'\) remains unbounded.
Now observe that by construction \(f\) has the property
\[ \alpha<\beta \implies \paren{\exists\gamma\in C}\paren{f(\alpha) < \gamma < f(\beta)}. \]
Let \(B = \operatorname{range}(f)\subseteq A\), which is uncountable, let
\(\alpha\in\Lim(\omega_1)\) such that \(A_\alpha\subseteq B\).
As the order type of \(A_\alpha\) is \(\omega\) we enumerate it as an increasing sequence
\(A_\alpha = \set{\beta_0,\beta_1, \dots}\).
Then for each \(n\in\omega\) use property of \(f\) to choose \(\gamma_n \in C\) such that
\(\beta_n < \gamma_n < \beta_{n+1}\).
Then \(\sup\set{\beta_n:n\in\omega} = \sup\set{\gamma_n:n\in\omega} = \alpha\).
As \(C\) is closed \(\alpha \in C\).

#

> Suppose \(\kappa\) is an infinite cardinal.
> For each \(\alpha<\kappa^+\), fix a one-one function \(f_\alpha: \alpha\to\kappa\).
> For each \(\xi<\kappa\) and \(\alpha<\kappa^+\), define \(A_\alpha^\xi = \set{\beta<\kappa^+:\alpha<\beta \text{ and } f_\beta(\alpha) = \xi}\).

#### (a) For every \(\xi<\kappa\), \(\angle{A_\alpha^\xi:\alpha<\kappa^+}\) is a sequence of pairwise disjoint sets. {-}

Fix \(\xi<\kappa\) and compare \(A^\xi_\alpha\) and \(A^\xi_\beta\) where \(\alpha < \beta < \kappa^+\).
If they intersect, then there is a \(\gamma\in (\beta,\kappa^+) \) where \(f_\gamma(\alpha) = \xi\) and \(f_\gamma(\beta) = \xi\).
This cannot happen because \(f_\gamma\) is one-one.

#### (b) For every \(\alpha<\kappa^+\), \(\bigcup\set{A_\alpha^\xi: \xi<\kappa} = \kappa^+\setminus\left(\alpha+1\right)\). {-}

Each \(\A_\alpha^\xi\) is a subset of \(\kappa^+\setminus\left(\alpha+1\right)\) by construction.
Now let \(\beta\in(\alpha, \kappa^+)\), then let \(\xi = f_\beta(\alpha) < \kappa\)
and by definition we see that \(\beta\in A_\alpha^\xi\).

\newcommand{\F}{\mathcal{F}}
\newcommand{\I}{\mathcal{I}}

#### (c) There is a family \(\F\) of pairwise disjoint stationary subsets of \(\kappa^+\) such that \(\abs{\F} = \kappa^+\). {-}

Let \(\I\) be the non-stationary ideal on \(\kappa^+\).
For any \(\alpha<\kappa^+\), we cannot have \(\paren{\forall\xi<\kappa}\paren{A_\alpha^\xi \in \I}\) or else the union would also be in \(\I\) as \(\I\) is \(\kappa^+\)-complete.
Let \(h:\kappa^+\to\kappa\) such that \(A_\alpha^{h(\alpha)} \notin \I\),
and there is a \(\xi\) where \(\abs{h^{-1}\set{\xi}} = \kappa^+\),
otherwise \(\kappa^+\) would be a union of \(\kappa\)-many sets of size at most \(\kappa\).
Now let \(\F = \set{A_\alpha^\xi: h(\alpha) = \xi}\), pairwise disjointedness is due to part (a) and each \(A_\alpha^\xi\) is non-stationary by our choice of \(h\).

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
