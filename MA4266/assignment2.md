---
title: MA4266 Assignment 2
author: Qi Ji
date: 14th April 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert #1\right\rvert}
\newcommand{\R}{\mathbb{R}}
\let\epsilon\varepsilon

#

It is easy to check that for any \((a_\alpha)_{\alpha\in J} \ne \mathbf{0}\) and \((b_\alpha)_{\alpha\in J}\)
the maps \((x_\alpha)\mapsto (a_\alpha x_\alpha)\)
and \((x_\alpha)\mapsto (x_\alpha + b_\alpha)\) are continuous in the box topology of \(\R^J\) (just take their pullbacks coordinate-wise).
Therefore \((x_\alpha)\mapsto (a_\alpha x_\alpha + b_\alpha)\) is also continuous, and as its inverse is of similar form,
a homeomorphism.

Therefore without loss of generality we only need to separate \(\mathbf{0}\) from
the complement of \(\prod_{\alpha\in J} (-1, 1)\) using a \([0,1]\) valued continuous function.
Consider \(\overline{\rho}\) the uniform metric in \(R_J\), that is
\[\overline{\rho}(\mathbf{y},\mathbf{z}) = \sup_{\alpha\in J} \min(1,\abs{y_\alpha - z_\alpha}).\]
\(\overline{\rho}(\mathbf{0}, -)\) is a continuous (in the uniform topology) function
which sends \(\mathbf{0}\) to \(0\) and the complement of \(\prod_J (-1,1)\) to \(1\).
Now since the box topology is finer than the uniform topology, \(\overline{\rho}(\mathbf{0}, -)\) is also continuous in the box topology and we are done.

#

Let \(X\) be a regular Lindelöf space that is locally metrizable.
By Urysohn metrization theorem we show that \(X\) has countable basis.

For each \(x\in X\) let \(U_x\) be a neighbourhood that is metrizable.
As \(X\) is regular we have \(x \in V_x\subseteq \overline{V_x}\subseteq U_x\)
where \(V_x\) is a smaller open neighbourhood.
Since \(\overline{V_x}\) is a closed subspace, so it is also Lindelöf and as metrizability is hereditary \(\overline{V_x}\) has countable basis, and so does \(V_x\).
Let \(\mathcal{B}_x\) be a countable basis for \(V_x\).
As \(X\) is Lindelöf and \(\set{V_x}_{x\in X}\) is an open cover,
we have a countable subcover \(V_{x_1}, V_{x_2},\dots\).
To see that \(\mathcal{B} = \mathcal{B}_{x_1}\cup \mathcal{B}_{x_2}\cup\cdots\) is a base of \(X\),
let \(U\subseteq X\) be open.
For each \(x_i\), \(U\cap V_{x_i}\) is open in \(V_{x_i}\)
and there is some subset \(\mathcal{C}_{x_i}\subseteq \mathcal{B}_{x_i}\)
such that \(U\cap V_{x_i} = \bigcup \mathcal{C}_{x_i}\).
Therefore \(U = \bigcup_i (U\cap V_{x_i}) = \bigcup_i \bigcup \mathcal{C}_{x_i}\)
which is a union of sets from \(\mathcal{B}\).
Note that \(\mathcal{B}\) is a countable union of countable sets and is hence countable.

#

Let \((X,d)\) be a complete metric space,
let \(A_1\supset A_2\supset \dots\) be non-empty closed sets,
let \(d_i = \sup_{x,y\in A_i} d(x,y)\) be the diameter of \(A_i\),
and assume that \(\lim_{i\to\infty} d_i = 0\).
Choose a sequence \(\mathbf{x} = (x_1,x_2,\dots) \in \prod_{i=1}^\infty A_i\).
For every \(\epsilon>0\) there is some \(N\) such that \(d_i < \epsilon\) for all \(i\geq N\).
Now as all \(x_N, x_{N+1},\dots \in A_N\) whose diameter is \(d_N < \epsilon\),
it follows that \(d(x_i,x_j) \leq d_N < \epsilon\) for all \(i,j>N\) and hence \(\mathbf{x}\) is Cauchy.
As a result \(x = \lim_{i\to\infty} x_i\) exists.
For each \(i\), \(x\) is a limit of some sequence in \(A_i\), so \(x\in \bigcap_{i=1}^\infty A_i\) as each \(A_i\) is closed.

Conversely suppose every nested sequence of nonempty closed sets with diameter tending to 0 has a nonempty intersection,
we want to show that \(X\) is complete.
Let \((x_i)\) is be a Cauchy sequence and we want it to converge in \(X\).
For each \(i\) let \(r_i = \sup_{j>i} d(x_i,x_j)\) and \(d_i = 2r_i\),
note that diameter of \(\set{x_i,x_{i+1},\dots}\) is at most \(d_i\).
As the sequence is Cauchy \(d_i \to 0\).
Consider the nested sequence of non-empty closed balls
\[\overline{B(x_1,r_1)}\supset \overline{B(x_2,r_2)}\supset\dots \]
with diameter converging to \(0\).
By hypothesis it has a nonempty intersection, let \(x\in \bigcap_{i=1}^\infty \overline{B(x_i,r_i)}\).
We show \(x_i\to x\). Given \(\epsilon>0\) as \((x_i)\) is Cauchy there is \(N\) such that
for all \(j,k\geq N\), \(d(x_j, x_k) < \epsilon\).
In particular \(d(x_N, x_j) < \epsilon\) for all \(j\geq N\) which means \(r_N < \epsilon\).
As \(x\in\overline{B(x_N,r_N)}\), \(d(x_N, x)\leq r_N\) and by triangle inequality for all \(j\geq N\),
\(d(x,x_j) < 2\epsilon\). This shows convergence.

#

## (a) {-}

Let \(\mathscr{F}\) be finite subset of \(\mathscr{C}(X,Y)\).

Induct on size of \(\mathscr{F}\).
Case empty is trivial, case \(\abs{\mathscr{F}}= 1\) is trivial too as its member is continuous.
For the inductive case suppose \(\mathscr{F} = \mathscr{F}' \cup \set{f}\) and \(\mathscr{F}'\) is an equicontinuous family.
Let \(x\in X\) and \(\epsilon>0\),
by induction hypothesis there is a neighbourhood \(U\) of \(x\) such that
for all \(f'\in\mathscr{F}'\), \(f'(U)\subseteq B_\epsilon(f'(x))\).
As \(f\) is continuous, there is a neighbourhood \(V\) of \(x\) such that
\(f(V)\subseteq B_\epsilon(f(x))\).
Now \(U\cap V\) is a neighbourhood of \(x\) satisfying the equicontinuity criterion.

## (b) {-}

Suppose \(f_n\) converges uniformly to \(f\), so \(\sup_{x\in X} d(f_n(x), f(x)) \to 0\).
Let \(x\in X\) and \(\epsilon>0\),
As \(f\) is a uniform limit of continuous functions \(f\) is continuous,
there is some neighbourhood \(U\) of \(x\) such that \(f(U)\subseteq B_{\epsilon/3}(f(x))\).
By the uniform convergence there is also some \(N\) such that for all \(n\geq N\), \(\overline{\rho}(f_n, f) < \epsilon/3\).
Now for each \(n\geq N, y\in U\),
\[d(f_n(y), f_n(x)) \leq d(f_n(y), f(y)) + d(f(y), f(x)) + d(f(x), f_n(x)) < \epsilon \]
Also, \(\set{f_1,\dots,f_{N-1}}\) is an equicontinuous family by part (a) so let \(V\) be a neighbourhood witnessing equicontinuity of this set given \(\epsilon\) and \(x\).
Now for each \(n\), we have \(f_n(U\cap V)\subseteq B_\epsilon(f_n(x))\) and we are done.

## (c) {-}

Fix \(x\in\R, \epsilon>0\) and let \(U\) such that \(x\in U\in\mathscr{U}\).
By hypothesis we know for each \(f\in\mathscr{F}\), \(\abs{f'(x)} \leq M_U\).
Choose \(\delta>0\) such that \(\delta< \frac{\epsilon}{M_U}\) and \(B_\delta(x)\subseteq U\).
It follow from mean value theorem that \(f(B_\delta(x)) \subseteq B_\epsilon(f(x))\).

#

Suppose \(Y\) is Hausdorff, and let \(f\ne g\) in \(\mathscr{C}(X,Y)\).
Let \(x\in X\) such that \(f(x)\ne g(x)\) and \(U,V\) such that \(f(x)\in U\) and \(g(x)\in V\),
then \(S(\set{x},U)\) and \(S(\set{x},V)\) separate \(f\) and \(g\).

Suppose \(Y\) is regular, let \(f\in \mathscr{C}(X,Y)\) and \(S(C,V)\) a neighbourhood of \(f\).
As \(f(C)\subseteq V\), \(\set{f^{-1}(v)}_{v\in V}\) is an open cover of \(C\) 
let \(f^{-1}(v_1),\dots,f^{-1}(v_n)\) be a finite subcover of \(C\).
As \(Y\) is regular for each \(v_i\) let \(U_i\) be a neighbourhood such that \(v_i\in U_i \subseteq \overline{U_i} \subseteq V\).
Set \(U = \bigcup_{i=1}^n U_i\) and \(\overline{U}\subseteq V\), we can see that \(f(C)\subseteq U\) so \(f\in S(C,U)\).
Now we show \(\overline{S(C,U)}\subseteq S(C,V)\).
If \(g\in\overline{S(C,U)}\), any neighbourhood of \(g\) meets \(S(C,U)\).
Suppose for the contrary that \(g(C)\nsubseteq V\), so let \(x\in C\) such that \(g(x)\notin V\).
In particular \(g(x)\notin\overline{U}\).
Now \(S(\set{x}, Y\setminus\overline{U})\) is a neighbourhood of \(g\) that is disjoint from \(S(C,U)\), a contradiction.
This result for sub-basic sets can be extended to all open sets which completes the proof of regularity.

#

To see \(f\) is continuous let \(x\in X, \epsilon>0\).

By equicontinuity we have an open neighbourhood \(U\) of \(x\) such that
for each \(n\), \(f_n(U)\subseteq B_{\epsilon/2}(f_n(x))\).
We want \(f(U)\subseteq B_{\epsilon}(f(x))\).
For \(u\in U\),
use pointwise convergence to choose \(N\) such that for all \(n> N\),
\(d(f_n(x), f(x)) < \epsilon /4\) and \(d(f_n(u), f(u)) < \epsilon/4\), then
\[ d(f(u),f(x)) \leq d(f(u),f_n(u)) + d(f_n(u),f_n(x)) + d(f_n(x), f(x)) < \epsilon \]
so \(f\) is continuous.

To see compact convergence let \(K\subseteq X\) be compact and we show \(\sup_{x\in K} d(f_n(x), f(x)) \to 0\).
Let \(\epsilon > 0\),
we want \(N\) such that \(n\geq N\) implies \(d(f_n(x), f(x)) < \epsilon\) for all \(x\in K\).
As \(f_n\) equicontiuous for each \(x\in K\) there is open neighbourhood \(U\) such that
\(\sup_{y\in U} d(f_n(y),f_n(x)) < \epsilon/6\).
By covering \(K\) with finitely many such neighbourhoods \(U_1,\dots,U_m\) we have for each \(U_i\),
\(\sup_{x,y\in U_i} d(f_n(x), f_n(y)) < \epsilon/3\).
Now use pointwise convergence
to find \(N\) such that \(n\geq N\) implies \(d(f_n(x_i), f(x_i)) < \epsilon/3\)
for some chosen \(x_i\)'s where each \(x_i\in U_i\).
And use continuity of \(f\) at each \(x_i\) such that \(N\) satisfies \(n\geq N\) implies \(d(f(x_i), f(x)) < \epsilon/3\).
Now for any \(x\in K\), \(n\geq N\), let \(x\) be covered by \(U_i\), then
\[ d(f_n(x), f(x)) \leq d(f_n(x), f_n(x_i)) + d(f_n(x_i), f(x_i)) + d(f(x_i), f(x)) < \epsilon. \]
