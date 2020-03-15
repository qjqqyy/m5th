---
title: Homework 3
author: Qi Ji
date: 16th March 2020
---

\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\set}[1]{\left\{#1\right\}}
\let\phi\varphi
\newcommand{\Z}{\mathbb{Z}}

# Question 5

Given \(R = \Z[i]\) and \(N(a+bi) = a^2 + b^2 = \abs{a+bi}^2\) where \(\abs{\cdot}\) denotes complex modulus,
considering the natural inclusion \(\Z[i]\subset \mathbb{C}\).

To show that \(R\) is an Euclidean domain, let \(z, w\in R\) be arbitrary and
we want to know if there exists solution for
\[ z = qw + r \]
where \(q,r\in R\) with \(r = 0\) or \(\abs{r} < \abs{w}\).

Solving in \(\mathbb{C}\), a priori we know that
\[ \frac{z}{w} = q + \frac{r}{w} \]
with \(\abs{\frac{r}{w}} < 1\).
Now treat \(\frac{z}{w}\) as just a complex number and we know that we can choose
\(q\in \Z[i]\) satisfying \(\abs{\frac{z}{w} - q} < 1\) (in fact it can be \(\frac{\sqrt{2}}{2}\)).
Now we choose \(r = z - qw\) and as \(\abs{\frac{r}{w}} < 1\), the condition is satisfied.

# Question 6

For both finding gcd and solving for Bézout's inequality, we do Division algorithm,

\begin{align*}
11 + 7i &= (1 - i)(3 + 7i) + (1 + 3i) \\
3 + 7i &= 2(1 + 3i) + (1 + i) \\
1 + 3i &= (2 + i)(1 + i)
\end{align*}

(a) \(\gcd(11 + 7i, 3 + 7i) = 1 + i\)

(b)
\begin{align*}
1 + i &= (3 + 7i) - 2(1 + 3i) \\
&= (3 + 7i) + 2(1 - i)(3 + 7i) - 2(11 + 7i) \\
&= (3 - 2i)(3 + 7i) - 2(11 + 7i)
\end{align*}
