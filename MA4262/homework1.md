---
title: MA4262 Homework 1
author: Qi Ji
date: 14th September 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\B}{\mathcal{B}}
\newcommand{\R}{\mathbb{R}}

#

> Riemann integral of continuous nonnegative \(f: \R\to\R\) agrees with Lebesgue integral.

Following hint, without loss of generality assume \([a,b]=[0,1]\).

Define
\begin{align*}
a_k^{(n)} &= \min\set{f(x)| x\in\left[\frac{k-1}n, \frac{k}n\right]} \\
b_k^{(n)} &= \max\set{f(x)| x\in\left[\frac{k-1}n, \frac{k}n\right]} \\
\underline{f}_n(x) &=
  \begin{cases}
    a_k^{(n)} &\text{if } x\in \left[\frac{k-1}n,\frac{k}n\right) \\
    a_n^{(n)} &\text{if } x\in \left[\frac{n-1}n,1\right] \\
  \end{cases} \\
\overline{f}_n(x) &=
  \begin{cases}
    b_k^{(n)} &\text{if } x\in \left[\frac{k-1}n,\frac{k}n\right) \\
    b_n^{(n)} &\text{if } x\in \left[\frac{n-1}n,1\right] \\
  \end{cases} \\
\underline{I}_n &= \frac1n \sum_{n=1}^N a_k \\
\overline{I}_n &= \frac1n \sum_{n=1}^N b_k \\
\end{align*}

For any \(n\),
we can see that \[\underline{f}_n(x) \leq f(x) \leq \overline{f}_n(x),\]
and therefore \[\underline{I}_n = \int_{[0,1]} \underline{f}_n\ dx \leq \int_{[0,1]} f\ dx \leq \int_{[0,1]}\overline{f}_n\ dx = \overline{I}_n.\]

Let \(\epsilon>0\) be given, as \(f\) is uniformly continuous on the unit interval choose \(N\) large enough such that
for all \(\abs{x-y}<\frac1N\) implies that \(\abs{f(x)-f(y)}<\epsilon\),
then for \(n>N\),
\[\overline{I}_n-\underline{I}_n = \int_{[0,1]} \overline{f}_n - \underline{f}_n\ dx < \epsilon.\]
This shows that both \(\overline{I}_n\) and \(\underline{I}_n\) converge to the Riemann integral of \(f\).

Now any step function \(s\leq f\) satisfies \(\int_{[a,b]} s\ dx = \int_{[a,b]} s\ d\lambda \leq \overline{I}_n\) for all \(n\),
which shows that its Riemann integral coincides with Lebesgue integral.

#

We use definition of Riemann integral from Rudin's Principles of Mathematical Analysis,
so a bounded \(f:[a,b]\to\R\) is integrable if the infimum of all upper sums equal the supremum of all lower sums.

For any partition \(P\) of \([a,b]\) (Rudin did not use tags) we can define the upper and lower step functions
\begin{align*}
\overline{f}_P(x) = f(a)\chi_{\set{a}} + \sum_i M_i \chi_{(x_i, x_{i+1}]} \\
\underline{f}_P(x) = f(a)\chi_{\set{a}} + \sum_i m_i \chi_{(x_i, x_{i+1}]}
\end{align*}
where \(M_i = \sup_{x\in[x_i,x_{i+1}]} f(x)\)
and \(m_i = \inf{x\in[x_i,x_{i+1}]} f(x)\).

It then arises from the definitions that
\begin{align*}
U(P,f) &= \int_a^b \overline{f}_P(x)\ dx \\
L(P,f) &= \int_a^b \underline{f}_P(x)\ dx
\end{align*}
and as \(f\) is Riemann integrable we have \(\sup_P L(P,f) = \inf_P U(P,f) = \int_a^b f\ dx\).

Let \(P_n\) be a sequence of partitions of \([a,b]\) such that each \(P_{k+1}\) is a refinement of \(P_k\) and the mesh goes to \(0\),
and it witnesses the integrability of \(f\), that is
\[ \lim_n L(P_n,f) = \int_a^b f\ dx = \lim_n U(P_n,f). \]
Then we have for all \(x\in[a,b]\),
\[ \underline{f}_{P_1}(x)\leq \underline{f}_{P_2}(x)\leq \dots \leq f(x) \leq \dots \leq \overline{f}_{P_2}(x) \leq \overline{f}_{P_1}(x)\]
by monotone convergence
\[\int \lim_n \underline{f}_{P_n}\ d\lambda = \lim_n \int\underline{f}_{P_n}\ d\lambda = \int_a^b f\ dx \]
and similarly for \(\overline{f}_{P_n}\).
This implies that
\[ \lim_n \underline{f}_{P_n} = f = \lim_n \overline{f}_{P_n} \quad \text{a.e.} \]
which shows that \(f\) is Lebesgue measurable and its Lebesgue integral coincides with the Riemann integral.

