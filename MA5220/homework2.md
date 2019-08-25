---
title: MA5220 Homework 2
author: Qi Ji
date: 30 August 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\pred}[1]{\operatorname{\mathsf{pred}}\left(#1\right)}

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

#

> Prove that the following statement is equivalent to CH.
> There exists \(X\subseteq \mathbb{R}^2\) such that
> \(X\) meets every vertical line on a countable set
> and \(\mathbb{R}^2\setminus X\) meets every horizontal line on a countable set.

<div style="height:100vh"></div>
