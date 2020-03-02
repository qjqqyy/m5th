---
title: Homework 2
author: Qi Ji
date: 2nd March 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\let\phi\varphi

# Question 6

## (a)

\newcommand{\Z}{\mathbb{Z}}

Consider the composition \(\phi: \Z[x] \to \Z/2\Z\)
\[
\begin{array}{mmmm}
\Z[x] &\to      & \Z    &\to    &\Z/2\Z \\
f(x)  &\mapsto  & f(0)  &\mapsto&\overline{f(0)} = f(0) + 2\Z
\end{array}
\]
Now \(\phi(f(x)) = \overline{0}\) iff \(\overline{f(0)} = \overline{0}\)
iff \(f(0) \in 2\Z\), which means \(f(x)\) is of the form \(g(x)\cdot x + 2k\), so \(f(x) \in (2,x)\), therefore \(\ker(\phi) = (2,x)\).
As \(\Z/2\Z = \Z[x]/(2,x)\) is a field it follows that \((2,x)\) is a maximal ideal.

Suppose for a contradiction that \((2,x)\) is a principal ideal, so let \(g(x)\in\Z[x]\) such that \((2,x) = (g(x))\).
Let \(2 = g(x)a(x)\) and \(x = g(x)b(x)\), then comparing degrees we have \(\deg(g) = \deg(a) = 0\) and \(\deg(b) = 1\).
As \(2\) is prime in \(\Z\) solving we get \(g(x) = 2\), \(a(x) = 1\), and \(x = 2b(x)\) has no solution in \(\Z[x]\), contradiction.

## (b)

As \(1 = 2\frac{1}{2} \in (2,x)\) it follows that \((2,x) = (1) = S\).
Not maximal as \((2,x)\) is exactly the whole ring, but principal \((1)\).

# Question 7

## (a)

Let \(P\subseteq S\) be prime ideal and consider \(\phi^{-1}(P)\).
Suppose we have \(ab \in \phi^{-1}(P)\), then \(\phi(ab) = \phi(a)\phi(b) \in P\) and
as \(P\) is a prime ideal we have \(\phi(a)\in P\) or \(\phi(b)\in P\), and
\(a\in \phi^{-1}(P)\) or \(b\in \phi^{-1}(P)\) as desired.

When \(\phi\) is onto, by basic set theory
\(R = \phi^{-1}(S) = \phi^{-1}(P \sqcup (S\setminus P)) = \phi^{-1}(P) \sqcup \phi^{-1}(S\setminus P)\)
and the second term in the disjoint union is nonempty.

When \(1_R\in R\) and \(\phi(1_R) = 1_S\).
Suppose for contradiction \(\phi^{-1}(P) = R\), then \(1_R \in \phi^{-1}(P)\)
and \(\phi(1_R) = 1_S \in P\) which means \(P = S\).

## (b)

Consider the composition
\[ \begin{array}{mmmm}
R &\to &S &\to &S/M \\
r &\mapsto &\phi(r) &\mapsto &\overline{\phi(r)}
\end{array} \]
which is a surjective composition of surjective maps.
Observe that its kernel is exactly \(\phi^{-1}(M)\) and by first isomorphism theorem we have \(R/\phi^{-1}(M) \cong S/M\).
As \(M\) is a maximal ideal \(S/M\) is a field, and so is \(R/\phi^{-1}(M)\), so \(\phi^{-1}(M)\) is a maximal ideal too.
