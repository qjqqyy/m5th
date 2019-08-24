---
title: Exercise 1.19
author: Qi Ji
date: 25th August 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}

> Make a regular expression which contains all those decimal natural numbers which start with \(3\) or \(8\)
> and have an even number of digits and end with \(5\) or \(7\).

\[\set{3,8}\cdot \left(\Sigma\cdot\Sigma\right)^* \cdot\set{5,7}\]
where \(\Sigma = \set{0,\dots,9}\).

> Make a further regular expression which contains all odd ternary numbers without leading \(0\)s.

First observe that a ternary number is odd iff the sum of all its digits is odd.
Define
\begin{align*}
\texttt{TWO} &= \set{2}\cdot\set{0,2}^* \\
\texttt{ODD} &= \texttt{TWO}^*\cdot \set{1} \\
\texttt{EVEN} &= \set{0,2}\cup\left(\set{1}\cdot\set{0,2}^*\cdot\set{1}\right)
\end{align*}
and we match all ternary numbers with the expression
\[ \texttt{ODD}\cdot\texttt{EVEN}^*. \]
