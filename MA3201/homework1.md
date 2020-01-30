---
title: Homework 1
author: Qi Ji
date: 3rd February 2020
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
