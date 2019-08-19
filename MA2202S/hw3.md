---
title: MA2202S Homework 3
author: Qi Ji (A0167793L)
date: 26th October 2018
...

\let\setminus\smallsetminus
\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}
\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\qed}{\hfill$\square$}
\newcommand{\tagQED}{\tag*{$\square$}}
\newcommand{\Z}{\mathbb{Z}}\newcommand{\Q}{\mathbb{Q}}\newcommand{\N}{\mathbb{N}}\newcommand{\R}{\mathbb{R}}\newcommand{\F}{\mathbb{F}}
\newcommand{\p}[1]{\left( #1 \right)}
\newcommand{\ord}{\operatorname{ord}}
\newcommand{\ang}[1]{\left\langle #1 \right\rangle}
\renewcommand{\bar}{\overline}

As this homework concerns Abelian groups, additive notation will be used throughout.
All subgroups are automatically normal.

#

__Cauchy's Theorem__ (finite Abelian groups)__.__
Let \(A\) be a finite Abelian group of order \(n\).
Suppose \(p \in \N\) is a prime such that \(p \mid n\), then there exists an \(v\in A\), \(v\ne 0\) such that
\(p\cdot v = 0\).

*Proof.*
Case of \(\abs{A} = 1\) is vacuous.
Case where \(\abs{A} = 2\) is trivial.
Suppose result holds for all groups of size less than \(n\),
let \(A\) be a Abelian group of order \(n\) and
let \(p \in \N\) be a prime such that \(p\mid n\).
Let the prime factorisation of \(n\) be
\[ n = p^e q_1 q_2 \cdots q_r \]
where \(q_1, q_2, \dots, q_r\) are possibly repeated primes of which none are equal to \(p\).

Since we are in the case that \(\abs{A} > 1\), take \(a \in A\setminus\set{0}\).
If the order of \(a\) is a multiple of \(p\), then let \(\ord(a) = p q'\).
By setting \(x = q'\cdot a\), we have \(p\cdot x = p \cdot (q' \cdot a) = 0\).

In the other case where \(p \nmid \ord(a)\), \(\ord(a) = \overline{q} \mid q_1 q_2 \cdots q_r\).
We generate the cyclic subgroup of \(a\), denoted \(\ang{a}\).
This subgroup is non-trivial as \(a \ne 0\), then the quotient group \(A / \ang{a}\) has size \(n / \bar{q}\).
Denote that as \(p^e\hat{q}\), where \(p^e\hat{q}\bar{q} = n\).
Since \(p^e \hat{q} < n\), use induction hypothesis to find \(x + \ang{a} \in A/\ang{a}\) such that \(p\cdot \p{x + \ang{a}} = 0 + \ang{a}\) and \(x + \ang{a} \ne 0 + \ang{a}\) or equivalently \(x \notin a\).

Then \(p\cdot x + \ang{a} = p\cdot \p{x + \ang{a}} = 0 + \ang{a}\), which shows that \(px \in \ang{a}\).
Let \(px = b \in \ang{a}\) and \(l = \ord(b) \mid \bar{q}\), so in particular \(\gcd(p, l) = 1\).
Let \(c,d\in \Z\) such that \(cp + dl = 1\), then
\begin{align*}
    px &= b \\
    &= (cp + dl)b \\
    &= cpb + dlb \\
    &= pcb \\
    p(x - cb) &= 0
\end{align*}
Now \(x \ne cb\), because \(cb \in \ang{a}\) but \(x \notin \ang{a}\).
Setting \(v = x - cb\) completes the proof.
\hfill$\square$

## (i) {-}

We proceed via induction on the order of \(A\).
Base case when \(n = 1\) is vacuously true.
Suppose result holds for all finite Abelian groups of order less than \(n\).

Let \(A\) have order \(n\) and
fix a prime divisor \(p_i\) of \(n\).
Let \(p = p_i\) and \(e = e_i\).

Set \(B = \set{a \in A: p^e\cdot a = 0}\).

__Claim 0.__ \(B\) is a subgroup of \(A\).

Suppose \(b_1, b_2\in B\), then
\(p^e b_1 + p^e b_2 = p^e \p{b_1 + b_2} = 0\), so \(b_1 + b_2 \in B\).
We are done because \(B\) is finite.

__Observation 1__ (Characterising property)__.__ If \(p^{e + k} \cdot a = 0\) for some \(k \in \N, a \in A\), then \(a \in B\).

As \(\ord(a) \mid p^{e + k}\), \(\ord(a)\) is a power of \(p\), but \(\ord{a} \mid n\) which entails that the power is at most \(e\), hence \(p^e\cdot a = 0\).

__Claim 2.__ \(B \ne \set{0}\) and \(p \mid \abs{B}\).

By Cauchy's theorem, there exist an element of \(a \in A\) with order \(p\), so \(a \in B\) and \(B\) is not trivial.
Additionally, by theorem of Lagrange, \(\ord(a) = p \mid \abs{B}\).

__Claim 3.__ For any \(j \ne i\), \(p_j \nmid \abs{B}\).

Suppose on the contrary that \(p_j \mid \abs{B}\), by Cauchy theorem there exists \(b \in B\), \(b \ne 0\) such that \(p_j \cdot b = 0\).
Then we have \(\ord(b) \mid p_j\) which implies that \(p_j \mid p\) which is absurd.


Now from claim 0, \(B\) is a subgroup of \(A\) so \(\abs{B}\) divides \(n = p_1^{e_1}\cdots p_r^{e_r}\).
By 2 and 3, \(\abs{B} = p^{e'}\) where \(1 \leq e' \leq e\)
Finally, we claim that \(e' = e\), which will complete the proof.

Suppose on the contrary that \(e' < e\), then we consider the quotient \(A / B\), which has order
\( p^{e' - e} \prod_{j\ne i} p_j^{e_j} < n \).
By Cauchy theorem, there exists \(v + B \in A/B\) such that \(v\notin B\) and \(p\cdot\p{v + B} = 0 + B\).
Then \(p\cdot v \in B\), so by definition of \(B\), there exists \(d \in \Z\) such that \(p^d\cdot (pv) = 0\) in \(A\),
which implies that \(p^{d+1}\cdot v = 0\), shows that \(v\in B\), a contradiction.
\hfill$\square$

## (ii) {-}

Suppose we have a subgroup \(C \subseteq A\) such that \(\abs{C} = p_i^{e_i}\), let \(B_i\) be \(B\) as defined above for \(p_i\).
It suffices to show that \(C \subseteq B_i\) since both subgroups are of the same size.
Let \(x \in C\), then \(p_i^{e_i}\cdot x = 0\) implying that \(\ord(x) \mid p_i^{e_i}\) which shows \(x \in B_i\) by observation 1.
\hfill$\square$

## (iii) {-}

Consider the internal sum \( B_1 + B_2 + \dots + B_r\).
For any \(i\), consider any \(v \in B_i \cap \sum_{j\ne i} B_i\).
Then there exists \(b_i \in B_i\) for all \(i\ne j\) such that
\[ v = b_1 + \dots + b_{i-1} + b_{i+1} + \dots + b_r \]
letting \(\hat{p} = \frac{n}{p_i^{e_i}}\), we see that \(\hat{p}\) kills RHS, so
\( \hat{p} v = 0 \)
which means that \(\ord(v) \mid \hat{p}\).
We also have \(v \in B_i\) and by characterising property \(\ord(v) \mid p_i^{e_i}\).
As \(\gcd(p_i^{e_i}, \hat{p}) = 1\), \(\ord(v) = 1\), so \(v = 0\) and the sum is direct.

Given a direct sum, we see that
\[ B_1 + B_2 + \dots + B_r \simeq B_1 \oplus B_2 \oplus \dots \oplus B_r. \]
The RHS has size \(p_1^{e_1} p_2^{e_2}\cdots p_r^{e_r} = n\), so the LHS also has the same size.
Then as
\[ B_1 + B_2 + \dots + B_r \subseteq A \]
and \(\abs{A} = n\), this cardinality argument shows that equality in fact holds.
\hfill$\square$

## (iv) {-}

By Lagrange theorem, \(p_1^{f_1} \mid n = p_1^{e_1}\cdots p_r^{e_r}\), which implies that \(f_1 \leq e_1\).
Let \(c \in C\) be arbitrary, then \(p_1^{f_1}\cdot c = 0\) which means \(c \in B_1\), hence \(C \subseteq B_1\).
\hfill$\square$

## (v) {-}

Only one because Sylow \(p_i\)-subgroups are unique by (ii).

#

Listing out the invariant factors

- \(3 \mid 3 \cdot 3\cdot 5\cdot 5\),
- \(3 \mid 3 \mid 3\cdot 5\cdot 5\),
- \(3 \mid 3\cdot 5\mid 3\cdot 5\),
- \(5 \mid 3\cdot 3\cdot 3\cdot 5\),
- \(3\cdot 5 \mid 3\cdot 3\cdot 5\),
- \(3\cdot 3\cdot 3\cdot 5\cdot 5\).

Which gives the following isomorphism classes
\begin{gather*}
    \mu_3 \oplus \mu_{225} \\
    \mu_3 \oplus \mu_3 \oplus \mu_{75} \\
    \mu_3 \oplus \mu_{15} \oplus \mu_{15} \\
    \mu_5 \oplus \mu_{135} \\
    \mu_{15} \oplus \mu_{45} \\
    \mu_{675}
\end{gather*}
Let \(A,B\) be two distinct groups from the list above, let \(d_A, d_B\) be the largest invariant factor for \(A,B\) respectively.
As each invariant factor divides the next, we know that elements in \(A\) have order at most \(d_A\), of which one has order exactly \(d_A\), similarly for \(B\).
Without loss of generality assume \(d_A < d_B\), then it is impossible for \(A\) to have an element of order \(d_B\), which shows a structural difference between \(A\) and \(B\).
\hfill$\square$
