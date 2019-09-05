---
title: MA3110S Homeworks 2 & 3
author: Qi Ji
date: 5th September 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\R}{\mathbb{R}}

# Homework 2

## Q1

### (i)

\newcommand{\barA}{\overline{A}}
\newcommand{\fAbar}{\overline{f(A)}}
Suppose \(f: \R^n \to \R^m\) is continuous and let \(A\subset \R^n\).
Note that \(A\subseteq f^{-1}(\fAbar)\), but preimage of closed map is closed so in fact we have
\(\barA \subseteq f^{-1}(\fAbar)\), this means \(f(\barA) \subseteq \fAbar\).


Now suppose for any \(A\subset \R^n\), we have \(f(\barA) \subseteq \fAbar\).
Fix a closed set \(Y\subseteq \R^m\), we want \(X = f^{-1}(Y)\) to be closed.
By assumption \(f(\overline{X}) \subseteq \overline{f(X)} = \overline{f(f^{-1}(Y))} = \overline{Y} = Y\),
which means that \(\overline{X} \subseteq f^{-1}(Y) = X\), therefore \(X\) is closed.

### (ii)

Consider \(\arctan\) with \(A = \mathbb{R}\).
We know that \(\overline{\mathbb{R}} = \mathbb{R}\) and \(\arctan(\R) = \left(-\dfrac\pi2, \dfrac\pi2\right) \ne \left[-\dfrac\pi2, \dfrac\pi2\right]\).

## Q2

In \(\R^n\) a set is compact iff it is closed and bounded.
Intersection of arbitrarily many closed sets is closed (easy to see that union of arbitrarily many open sets remains open).
The bound for any set also works for the intersection so the intersection is also bounded, therefore it is compact.

## Q3

Fix \(b\in B\), we can for every \(a\in A\) choose open sets \(U_a, V_a\subseteq \R^n\) such that
\(a\in U_a, b\in V_a\) and \(U_a \cap V_a = \emptyset\).
Since \(\set{U_a: a\in A}\) form an open cover of \(A\) we use compactness to choose a finite subcover \(U_{a_1},\dots, U_{a_k}\).
Define \(U_b = \bigcup_{i=1}^k U_{a_i}\) and \(V_b = \bigcap_{i=1}^k V_{a_i}\), note that \(V_b\) is an intersection of only finitely many open sets so \(V_b\) is open.

Now \(\set{V_b: b\in B}\) is an open cover of \(B\), we can proceed similarly.
By compactness of \(B\) we have a finite subcover \(V_{b_1},\dots,V_{b_l}\).
Let \(V = \bigcup_{i=1}^l V_{b_i}\) and \(U = \bigcap_{i=1}^l U_{b_i}\).
Note that \(A\subseteq U\) (as \(A\subseteq U_b\) for each \(b\in B\)) and \(B\subseteq V\) and \(U \cap V = \emptyset\) by construction,
additionally \(U\) is open as it is an intersection of finitely many open sets, while \(V\) is clearly open.

## Q4

Suppose there exists bijective continuous \(f: [0,1] \to U\) where \(U\) is unit circle.
Let \(p,q\) be opposite each other in the unit circle while also being equal to neither \(f(0)\) nor \(f(1)\).
Let \(a,b\in [0,1]\) such that \(f(a) = p\) and \(f(b) = q\) where without loss of generality \(0<a<b<1\),
consider \(f([a,b]) \subseteq U\) which has to be connected, so \(f([a,b])\) has to contain either \(f(0)\) or \(f(1)\).
In both cases \(f\) cannot be injective.

# Homework 3

## Q1

Set \(x=0\) to get the result that \(\abs{c} \leq 1\).

Case \(a = 0\) then \(\abs{f(1)} = \abs{b+c} \leq 1\), observe that
\[\abs{f'(x)} = \abs{b} = \abs{b + c - c} \leq \abs{b + c} + \abs{c} \leq 2.\]

__Useful statement.__ Let \(p,q\) have the same sign, then \(\abs{p+q}\leq 2\implies \abs{2p + q} \leq \abs{p} + \abs{p + q} \leq 4\).

Case \(a\) and \(b\) have the same sign, then
\[ \abs{f'(x)} = \abs{2ax + b} \leq \abs{2a + b} \]
for contradiction, if \(\abs{2a + b} > 4\) then \(\abs{a + b} > 2\) so
\(\abs{a + b +c} \geq \abs{\abs{a + b} - \abs{c}} > 2 - 1 = 1\) which contradicts \(\abs{f(1)} = \abs{a + b + c} \leq 1\).

Case \(a\) and \(b\) have different sign, then similarly
\[ \abs{f'(x)} = \abs{2ax + b} \leq \abs{2a - b} \]
for contradiction, if \(\abs{2a - b} > 4\) then \(\abs{a - b} > 2\) so
\(\abs{a - b +c} \geq \abs{\abs{a - b} - \abs{c}} > 2 - 1 = 1\) which contradicts \(\abs{f(-1)} = \abs{a - b + c} \leq 1\).

## Q2

Without loss of generality we can consider the case that
\(\forall x\in(0,1)\), we have \(f(x)>0\).
Fix \(n\in\mathbb{N}\) and define \(g(x) = f(x)^n f(1-x)\).
Then \(g(0) = 0\) and \(g(1) = 0\), let \(\xi\in (0,1)\) such that
\[g'(\xi) = n f(\xi)^{n-1} f'(\xi)f(1-\xi) - f(\xi)^n f'(1-\xi) = 0 \]
rearranging gives
\begin{align*}
n f(\xi)^{n-1} f'(\xi)f(1-\xi) &= f(\xi)^n f'(1-\xi) \\
n f'(\xi)f(1-\xi) &= f(\xi) f'(1-\xi) \\
\frac{nf'(\xi)}{f(\xi)} &= \frac{f'(1-\xi)}{f(1-\xi)}
\end{align*}

## Q3

Suppose \(f\) has no zero, then we have \(f(x) < 0\) for all \(x\in [a,\infty)\).
For any \(y>a\) by mean value theorem, there exists \(c\in (a,y)\) satisfying
\[ f'(c) = \frac{f(y) - f(a)}{y-a} < \frac{-f(a)}{y-a}. \]
By choosing large enough \(y\), we can make \(f'(c) < k\) which is a contradiction.
Suppose \(f\) has at least two zeroes then Rolle's theorem gives \(c\) with \(f'(c) = 0\) which cannot happen.
Therefore \(f\) has exactly \(1\) zero point.
