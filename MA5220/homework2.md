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
> Show that here exists \(X\subseteq \kappa\) such that \(\abs{X} = \kappa\) and
> for every \(\alpha,\beta\) in \(X\), it follows that \(\alpha < \beta\) iff \(\alpha\prec\beta\).

Check stackexchange

# Prove Schröder-Bernstein Theorem without AC

ma3205lecturenotes.pdf has like 5 exercises proving this

#

> Assume CH. Show that \(\paren{\omega_n}^\omega = \omega_n\) for every \(1\leq n < \omega\).

I need a better picture of cofinality to solve this...



<div style="height:100vh"></div>

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
