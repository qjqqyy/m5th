---
title: Homework 4
author: Qi Ji
date: 30th March 2020
---

\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\set}[1]{\left\{#1\right\}}
\let\phi\varphi
\newcommand{\Z}{\mathbb{Z}}

# Question 6

We just need to find \(i \in \set{1,\dots,12}\),
such that \(i^{12} \equiv 1 \pmod{13}\) and \(12\) is the minimal such exponent.
With computer assistance, one such solution is \(2\) with \(o(2) = 12\).

# Question 7

## (a) \(\Z\)

\[ x^8-1 = (x^4-1)(x^4+1) = (x-1)(x+1)(x^2+1)(x^4+1) \]
and
\[ x^6-1 = (x^3-1)(x^3+1) = (x-1)(x^2+x+1)(x+1)(x^2-x+1). \]
the degree \(2\) terms all have no root in \(\mathbb{Q}\) and are as a result irreducible in \(\mathbb{Q}[x]\) and by Gauss criterion also irreducible in \(\Z[x]\).

## (b) \(\Z/(2)\)

In \(\Z/(2)[x]\) as the base field has characteristic \(2\), \(x-1 = x+1\) and by Freshmen's dream
\begin{align*}
x^2 + 1 &= (x + 1)^2 \\
x^4 + 1 &= (x^2 + 1)^2 \\
&= (x + 1)^4
\end{align*}
so
\[ x^8 - 1 = (x+1)(x+1)(x+1)^2(x+1)^4 = (x+1)^8. \]
Also since \(-1 = 1\),
\[ x^2 + x + 1 = x^2 - x - 1 \]
so
\[ x^6 - 1 = (x+1)^2 (x^2+x+1)^2 \]
and we can check (by substituting \(x=0,1\)) that \(x^2+x+1\) is satisfies irreducibility criterion in \(\Z/2\).

## (c) \(\Z/(3)\)

We can also sub \(x=0,1,2\) and check that \(x^2+1\) is irreducible,
by inspection
\[ x^4 + 1 = (x^2 + x + 2)(x^2 + 2x + 2) \]
so we factorise
\[ x^8 - 1 = (x+1)(x+2)(x^2+1)(x^2+x+2)(x^2+2x+2) \]
which we can similarly check to be irreducible in \(\Z/(3)\).

Also
\begin{align*}
x^2 + x + 1 &= (x-1)^2 \\
x^2 - x + 1 &= (x+1)^2
\end{align*}
so we have
\[ x^6 - 1 = (x+1)^3(x-1)^3. \]
