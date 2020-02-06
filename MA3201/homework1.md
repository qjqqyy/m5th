---
title: Homework 1
author: Qi Ji
date: 10th February 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}

# Question 6

## (a)

\newcommand{\abar}{\overline{\alpha}}

Let \(\alpha = a + bi + cj + dk\).
Note that
\begin{align*}
N(\abar) &= a^2 + (-b)^2 + (-c)^2 + (-d)^2 \\
&= a^2 + b^2 + c^2 + d^2 \\
&= N(\alpha)
\end{align*}
and
\begin{align*}
\alpha\abar &= (a + bi + cj + dk)(a - bi - cj - dk) \\
&= a^2 - abi - acj - adk \\ &\quad
+ bia - b^2i^2 - bicj - bidk \\ &\quad
+ cja - cjbi - c^2j^2 - cjdk \\ &\quad
+ dka - dkbi - dkcj - d^2k^2 \\
&= a^2 + b^2 + c^2 + d^2 \\
&= N(\alpha)
\end{align*}
also, as \(\overline{\abar} = \alpha\),
we have \(N(\abar) = \abar\overline{\abar} = \abar\alpha\).

## (b)

Let \(\beta = p + qi + rj + sk\), then
\begin{align*}
\alpha\beta &= (a + bi + cj + dk)(p + qi + rj + sk) \\
&= ap + aqi + arj + ask \\ &\quad
+ pbi - bq + brk - bsj \\ &\quad
+ pcj - cqk - cr + csi \\ &\quad
+ pdk + dqj - dri - ds \\
&= ap - bq - cr - ds \\ &\quad
+ (aq + pb + cs - rd)i \\ &\quad
+ (ar + pc - bs + qd)j \\ &\quad
+ (as + pd + br - qc)k \\
\end{align*}


Define \(h: H_\mathbb{R} \to M_2(\mathbb{C})\) as
\[
a + bi + cj + dk \mapsto \begin{pmatrix}
a + bi & -c - di \\
c - di & a - bi
\end{pmatrix}
\]
Let \(w = a + bi, x = c + di, y = p + qi, z = r + si\) and \(w^*\) denote its complex conjugate, we have
\begin{align*}
\begin{pmatrix}
w & -x \\
x^* & w^*
\end{pmatrix}
\begin{pmatrix}
y & -z \\
z^* & y^*
\end{pmatrix}
&=
\begin{pmatrix}
wy - xz* & -wz - xy^* \\
x^*y + w^*z^* & -x^*z + w^*y^*
\end{pmatrix} \\
&=
\begin{pmatrix}
wy - xz* & -wz - xy^* \\
(wz + xy^*)^* & (wy - xz^*)^*
\end{pmatrix} \\
wy - xz^* &= (a+bi)(p+qi) - (c+di)(r-si) \\
&= ap - bq - cr - ds + (aq + bp + cs - rd)i \\
wz + xy* &= (a+bi)(r+si) + (c+di)(p-qi) \\
&= ar - bs + pc + dq + (as + br + pd - qc)i
\end{align*}
therefore \(h(\alpha\beta) = h(\alpha)h(\beta)\) (\(h\) preserving addition is obvious).

Now observe that \(N(\alpha) = \det(h(\alpha))\) and result follows.

## (c)

Suppose \(\alpha \in H_\mathbb{Z}\) is a unit, let \(\beta\) such that
\(\alpha\beta = 1\), then \(N(\alpha)N(\beta) = 1\)
and since \(N(H_\mathbb{Z}) \subseteq \set{0,1,2,\dots}\) we have \(N(\alpha) = N(\beta) = 1\).
Conversely suppose \(N(\alpha) = 1\), we know that
\[
\alpha^{-1} = \frac{\abar}{N(\alpha)} \in H_\mathbb{Q}
\]
and as \(N(\alpha) = 1\), it turns out that \(\alpha^{-1} = \abar \in H_\mathbb{Z}\), so \(\alpha\) is a unit.
Observe that the only possible elements in \(H_\mathbb{Z}\) with norm 1 are precisely \(\set{\pm1,\pm i,\pm j,\pm k}\), so the set of units is the quaternion group.

# Question 7

## (a)

As addition is defined pointwise the properties easily carry from \(R\).
We still need to check the properties of multiplication.


Cauchy product commutative when \(R\) is
:   it follows from commutativity of \(\cdot\) in \(R\) that
\[ \sum_{i=0}^n a_ib_{n-i} = \sum_{j=0}^n b_ja_{n-j} \]

Cauchy product associative
:   applying commutativity of \(+\) and associativity of \(\cdot\) and distributivity in \(R\) to coefficients, we get

\begin{align*}
\left(\left(\sum a_nx^n\right)\left(\sum b_nx^n\right)\right) \left(\sum c_nx^n\right)
&= \sum_n \left(\sum_{j=0}^n \left(
\sum_{i=0}^j a_ib_{j-i}
\right) c_{n-j}\right) x^n \\
&= \sum_n \left(\sum_{j=0}^n \sum_{i=0}^j a_ib_{j-i}c_{n-j}\right) x^n \\
&= \sum_n \left(\sum_{i=0}^n \sum_{j=i}^n a_ib_{j-i}c_{n-j}\right) x^n \\
% k = j-i
&= \sum_n \left(\sum_{i=0}^n \sum_{k=0}^{n-i} a_ib_{k}c_{n-i-k}\right) x^n \\
&= \sum_n \left(\sum_{i=0}^n a_i \left(\sum_{k=0}^{n-i} b_{k}c_{n-i-k}\right)\right) x^n \\
&= \left(\sum a_nx^n\right)\left(\left(\sum b_nx^n\right) \left(\sum c_nx^n\right)\right)
\end{align*}

Cauchy product distributes
:   By commutativity we just show \((A+B)C = AC + BC\)

\begin{align*}
\left(\sum (a_n+b_n)x^n\right) \sum c_nx^n
&= \sum_n \left(\sum_{i=0}^n (a_i+b_i)c_{n-i} \right) x^n \\
&= \sum_n \left(\sum_{i=0}^n a_ic_{n-i} + b_ic_{n-i} \right) x^n \\
&= \left(\sum a_nx^n\right) \left(\sum c_nx^n\right)
+ \left(\sum b_nx^n\right) \left(\sum c_nx^n\right)
\end{align*}

\(1_R\) is \(1_{R[[x]]}\)
:   easy to check that
\[\left(1 + 0x + 0x^2 + \dots\right) \sum_n a_nx^n
= \sum_n \left(\sum_{i=0}^n \delta_{i0}a_{n-i}\right) x^n = \sum_n a_nx^n
\]
where \(\delta_{ij}\) is \(1\) if \(i=j\) else \(0\)

## (b)

We just multiply out \(1-x\) and \(\sum_{j=0}^\infty x^j\).
\begin{align*}
(1-x)\sum_{j=0}^\infty x^j
&= \sum_{j=0}^\infty x^j - x\sum_{j=0}^\infty x^j \\
&= \sum_{j=0}^\infty x^j - \sum_{j=1}^\infty x^j \\
&= 1
\end{align*}

## (c)

Suppose \(f=\sum a_nx^n\) is a unit in \(R[[x]]\), let \(g=\sum b_nx^n\) such that \(1 = fg\),
\[ 1 = fg = \sum_n \left(\sum_{j=0}^n a_{j}b_{n-j}\right) x^n \]
by comparing coefficients,
\(1 = a_0b_0\) and for all \(n>1\),
\[ \sum_{j=0}^n a_jb_{n-j} = 0 \]
so in particular \(a_0\) is a unit in \(R\).

Conversely suppose \(a_0\) is a unit, let \(a_0b_0 = 1 = b_0a_0\),
recursively define for all \(n>1\)
\[ b_n = -b_0\sum_{j=1}^n a_jb_{n-j}. \]
Now we have \(a_0b_0 = 1\) and for all \(n>1\),
\begin{align*}
a_0b_n &= -\sum_{j=1}^n a_jb_{n-j} \\
0 &= \sum_{j=0}^n a_jb_{n-j}
\end{align*}
which shows that \(fg = 1\).
