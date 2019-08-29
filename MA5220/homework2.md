---
title: MA5220 Homework 2
author: Qi Ji
date: 30 August 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\pred}[1]{\operatorname{\mathsf{pred}}\left(#1\right)}
\newcommand{\R}{\mathbb{R}}
\newcommand{\cf}{\operatorname{cf}}

#

> Show that if \(\alpha\cdot\alpha =\beta\cdot\beta\), then \(\alpha = \beta\).

Without loss of generality assume \(\alpha < \beta\), as ordinal multiplication
is weakly monotonic over its left argument we have
\[ \alpha\cdot\beta \leq \beta\cdot\beta \]
ordinal multiplication is strictly increasing over the right operand so we have
\[ \alpha\cdot\alpha < \alpha\cdot\beta \]
compose inequalities to get \(\alpha\cdot\alpha < \beta\cdot\beta\).
\(\square\)

#

> Suppose \(\kappa\) is a infinite cardinal and \(\prec\) is a well ordering on \(\kappa\).
> Show that there exists \(X\subseteq \kappa\) such that \(\abs{X} = \kappa\) and
> for every \(\alpha,\beta\) in \(X\), it follows that \(\alpha < \beta\) iff \(\alpha\prec\beta\).

\newcommand{\tlt}{\triangleleft}

In the case that \(\kappa\) is regular we can basically reuse the argument in Homework 1 Question 3.
Without loss of generality (by only considering initial segments) we can assume \(\operatorname{type}(\kappa,\prec) = \kappa\).
Let \(X\subseteq \kappa\) be any maximal subset
such that \(<\) and \(\prec\) agree and suppose for a contradiction \(\abs{X} < \kappa\),
then both the \(<\) and \(\prec\)-downward closures of \(X\) are of size strictly less than \(\kappa\),
and there exists an element above \(A\) under both \(<\) and \(\prec\), contradicting maximality.

In the case where \(\kappa\) is singular,
Let \(\lambda = \cf(\kappa)\) and
\(f: \lambda\to\kappa\) be a strictly increasing cofinal map, then because \(\kappa\) is singular,
we can define a cofinal map \(g: \lambda\to\kappa\) in a fashion similar to lemma 6.5 as
\[ g(\xi) = \max\paren{ \abs{f(\xi)}^+, \abs{\sup\set{ g(\eta): \eta < \xi }}^+ } \]
then \(\kappa = \bigcup_{\alpha<\lambda} g(\alpha)\)
and note that \(g\) is strictly increasing and only outputs regular cardinals. Proceed to clean up \(g\) by defining \(h: \lambda\to\mathcal{P}(\kappa)\) as
\[ h(\xi) = g(\xi)\setminus\bigcup\set{g(\eta):\eta <\xi} \]
and we still can express \(\kappa\) as the union
\( \kappa = \bigcup_{\alpha<\lambda} h(\alpha) \).
We achieve the following

* \(\alpha<\beta\) implies for every \(\gamma\in h(\alpha), \delta\in h(\beta)\), we have \(\gamma<\delta\),

* \(\abs{h(\alpha)} = g(\alpha)\) for each \(\alpha\).

Again without loss of generality (by considering \(\prec\)-initial segments)
we can assume \(\operatorname{type}(\kappa,\prec) = \kappa\) and
\(\operatorname{type}\paren{h(\alpha),\prec} = g(\alpha)\) at each \(\alpha\).
Define the order \(\tlt\) on \(\lambda\) as
\[ \alpha \tlt \beta \iff \sup_\prec(h(\alpha)) \prec \sup_\prec(h(\beta)) \]
and it can be checked that \(\tlt\) is a well order.
As \(\lambda\) is in fact a regular cardinal, we can use the earlier case
to obtain a cofinal set \(\set{t_\alpha: \alpha<\lambda}\) where \(<\) and \(\tlt\) agree.
Note that at each \(t_\alpha\) there exists \(W_{t_\alpha} \subseteq h(t_\alpha)\)
with size \(\abs{h(t_\alpha)}\) where \(<\) and \(\prec\) agree, and \(W_{t_\alpha}\) is also
\(\prec\)-cofinal due to our assumption on \(\operatorname{type}(h(\alpha),\prec)\).

Now we recursively define \(X_\alpha\) for all \(\alpha<\lambda\) as
\(\set{x\in W_{t_\alpha}: \paren{\forall\beta<\alpha}\paren{\forall w\in X_{\beta}}\paren{w\prec x}}\).
At every \(\alpha\), \(\abs{X_\alpha} = \abs{W_{t_\alpha}}\),
because the number of elements we deleted from \(W_{t_\alpha}\) to get \(X_\alpha\)
is less than \(\abs{W_{t_\alpha}}\), and as a result \(X_\alpha\) is still \(\prec\)-cofinal.
The deletion forces out the property that
\[\alpha<\beta \implies \paren{\forall \gamma\in X_\alpha, \delta\in X_\beta}\paren{\gamma<\delta}.\]
Finally define \[X = \bigcup_{\alpha<\lambda} X_\alpha\]
which has cardinality \(\kappa\) and by construction \(<\) agrees with \(\prec\) on \(X\).
\(\square\)

# Prove Schröder-Bernstein Theorem without AC

\renewcommand{\Im}{\operatorname{Im}}

I shall reproduce Zermelo's proof.

Suppose \(A\subseteq B\subseteq C\) are sets and suppose that \(f:C\to A\) is a bijection.
Define \(Q = B\setminus \Im_f(C)\) and let \(\mathcal{F} = \set{X\subseteq C: Q\cup \Im_f(X)\subseteq X}\).
Define \(T = \bigcap \mathcal{F}\).

### (1) Verify that \(T\in \mathcal{F}\). {-}

Which is to say that \(Q\cup \Im_f(T)\subseteq T\).
Pick \(a\in Q\cup\Im_f(T)\), case \(a\in Q\) then \(a\in T\) as we can see that for all \(X\in \mathcal{F}, Q\subseteq X\).
Case \(a\in \Im_f(T)\), for all \(X\in\mathcal{F}\), \(a\in X\), so \(f(a)\in X\), which means \(a\in T\) too.

### (2) Show that \(T = Q\cup \Im_f(T)\). {-}

Due to part 1 we already know that \(T\supseteq Q\cup \Im_f(T)\).
Suppose for a contradiction the containment is proper, let
\(w\in \paren{T\setminus Q}\cap\paren{T\setminus\Im_f(T)}\)
and we know that all of the below hold

#. \(w\in T\)
#. \(w\notin B \lor w\in \Im_f(C)\)
#. \(w\notin \Im_f(T) \implies \paren{\forall t\in T}\paren{f(t)\ne w}\)

Case \(w\notin B\) for 2, then \(w\) lies outside the range of \(f\),
and for the other case, \(f^{-1}(w) \notin T\) by 3 and \(w\notin Q\) by hypothesis,
so we can delete \(w\) from \(T\) with \(T\setminus\set{w}\) still in \(\mathcal{F}\), that is
\(Q\cup \Im_f(T\setminus\set{w}) \subseteq T\setminus\set{w}\).
This contradicts \(T\) being minimal under set inclusion.


### (3) Show that \(B = T\cup \paren{\Im_f(C)\setminus \Im_f(T)}\) and conclude that \(\abs{C} = \abs{B}\) {-}

Use part (2) to simplify the expression as
\begin{align*}
T\cup \paren{\Im_f(C)\setminus \Im_f(T)}
&= Q\cup\Im_f(T)\cup\paren{\Im_f(C)\setminus \Im_f(T)} \\
&= Q\cup\Im_f(C) \\
&= \paren{B\setminus\Im_f(C)}\cup\Im_f(C) \\
&= B
\end{align*}
because \(\Im_f(T) \subseteq \Im_f(C)\) and \(\Im_f(C)\subseteq A\subseteq B\).

To see that \(\abs{C} = \abs{B}\), define \(g: C\to B\) as
\[ g(c) = \begin{cases}
f(c) &\text{if } c\notin T\\
c &\text{if } c\in T
\end{cases}\]
The two cases do not collide, that is \(\Im_g(T) = T\) and \(\Im_g(C\setminus T) = \Im_f(C)\setminus\Im_f(T)\) are disjoint, since \(x\in \Im_f(C)\) implies \(x\notin Q\) and we also have \(x\notin \Im_f(T)\).
It is trivial to see that \(g\) is injective and the decomposition of \(B\) as a disjoint union \(T\cup \paren{\Im_f(C)\setminus \Im_f(T)}\) helps us see that \(g\) is also surjective which completes the proof.

### (4) Schröder-Bernstein theorem reduces to (3) {-}

Let \(f: X\to Y\) and \(g: Y\to X\) be injective functions, we want to show that \(\abs{X} = \abs{Y}\).
To use propositions above we make the following connections

* identify \(Y\) with \(C\)
* identify \(\operatorname{ran}(f)\) with \(B\)
* identify \(\Im_f\paren{\operatorname{ran}\paren{g}}\) with \(A\)

and we have \(\abs{Y} = \abs{C} = \abs{\operatorname{ran}(f)} = \abs{X}\). $\square$

#

> Assume CH. Show that \(\paren{\omega_n}^\omega = \omega_n\) for every \(1\leq n < \omega\).

By CH \(\paren{\omega_1}^\omega = 2^{\omega^\omega} = 2^\omega = \omega_1\).

Each \(\omega_n\) is regular so \(\omega < \cf(\omega_n) = \omega_n\), let \(n>2\) and assume result holds for \(n-1\), then
\[
{}^\omega \omega_n
= \bigcup\set{{}^\omega \alpha: \alpha < \omega_n}
\]
note that for each \(\alpha\), \(\alpha^\omega \leq \paren{\omega_{n-1}}^\omega = \omega^{n-1}\) by induction hypothesis.
This means \(\paren{\omega_n}^\omega \leq \omega_n\).
\(\square\)

#

> Prove that the following statement is equivalent to CH.
> There exists \(X\subseteq \mathbb{R}^2\) such that
> \(X\) meets every vertical line on a countable set
> and \(\mathbb{R}^2\setminus X\) meets every horizontal line on a countable set.

Assume CH, then \(\abs{\R} = \omega_1\).
Let \(\R = \set{t_{\alpha}: \alpha < \omega_1}\) be a well ordering.
Define
\[ X = \set{\paren{t_\alpha,t_\beta}: \alpha \geq \beta }. \]
To see that \(X\) meets every vertical line on a countable set,
fix \(x\) and let \(\alpha\) such that \(x = t_\alpha\),
then by definition of \(X\) there are exactly \(\abs{\alpha}\) many points with \(x = t_\alpha\),
and since \(\alpha < \omega_1\), it follows that the intersection is countable.
Similarly fix \(y\) and let \(\beta\) such that \(y = t_\beta\),
we observe that \(\paren{t_\alpha, t_\beta}\in \R^2\setminus X\) whenever \(\alpha < \beta\),
so \(\R^2\setminus X\) meets the horizontal line on less than \(\abs{\beta} = \omega\) points too.

Assume \(X\) exists with the property, let \(A\subset \R\) be of size \(\abs{A} = \omega_1\).
We consider the subset of the \(X\) given by
\[ S = \paren{A\times \R}\cap X \]
size of \(S\) is \(\omega_1\cdot\omega_0 = \omega_1\).
Define \(S_Y = \set{y:\paren{\exists x\in\R}\paren{(x,y)\in S}}\), claim is \(S_Y = \R\).
To see this, let \(y\in\R\) and notice that by hypothesis, the set
\[ \set{x: (x,y)\in \R\setminus X} \] is only countable which means
there must exist \(x\in\R\) with \((x,y)\in S\).
Then we have
\[2^{\omega_0} = \abs{\R} = \abs{S_Y} \leq \abs{S} \leq \abs{X} = \omega_1 \]
which shows CH. $\square$
