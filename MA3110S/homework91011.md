---
title: MA3110S Homeworks 9, 10, 11
author: Qi Ji
date: 1st November 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\R}{\mathbb{R}}
\let\epsilon\varepsilon

# Homework 9

## Q1

As \(\lim_{x\to\infty} f(x) = a\), it follows that \(\int_0^x f(t)\ dt \to\infty\) as \(x\to\infty\).
Then by l'Hopital's rule and FTOC we have
\[
\lim_{x\to\infty}\frac{\int_0^x f(t)\ dt}x = \lim_{x\to\infty} f(x) = a.
\]

## Q2

As \(g(x)\) does not change sign, for all \(x\in[a,b]\)
\[ m\,g(x) \leq f(x)\,g(x) \leq M\,g(x) \]
then
\[ m \int_a^b g(x)\ dx \leq \int_a^b f(x)g(x)\ dx \leq M \int_a^b g(x)\ dx \]
and the result follows.

## Q3

For each \(n\in\mathbb{N}\) we have the following

\begin{align*}
\int_0^\pi f(x)\abs{\sin nx} dx
&= \sum_{k=1}^n \int_{(k-1)\pi/n}^{k\pi/n} f(x)\abs{\sin nx}dx
\end{align*}
and at each \(k\) by result of question 2, there is a \(\mu_k\in[a,b]\) such that
\[ \mu_k\int_a^b \abs{\sin nx}dx = \int_a^b f(x)\abs{\sin nx} dx \]
where \(a = \frac{(k-1)\pi}n, b = \frac{k\pi}n\).
Additionally as \(f\) is continuous we know that \(\mu_k = f(c_k)\) for some \(c_k\in [a,b]\). Then
\begin{align*}
\int_0^\pi f(x)\abs{\sin nx} dx
&= \sum_{k=1}^n f(c_k)\int_{(k-1)\pi/n}^{k\pi/n} \abs{\sin nx}dx \\
&= \sum_{k=1}^n f(c_k) \frac1n \int_{0}^{\pi} \abs{\sin x}dx \\
&= \sum_{k=1}^n \frac2n f(c_k)
\end{align*}
then as we take the limit
\begin{align*}
\lim_{n\to\infty} \int_0^\pi f(x)\abs{\sin nx}dx
&= \frac2\pi \lim_{n\to\infty} \frac\pi{n} \sum_{k=1}^n f(x_k) \\
&= \frac2\pi \int_0^x f(x)\ dx.
\end{align*}

# Homework 10

## Q1

**Part (i).** Integrating by parts,
\begin{align*}
I(m,n) &= \int_0^{\pi/2}\cos^m x\sin^n x\ dx \\
&= \left[
\frac{\cos^{m-1} x\sin^{n+1} x}{n+1}
\right]^{\pi/2}_0 + \int_0^{\pi/2} \frac{m-1}{n+1} \cos^{m-2}x\sin^{n+2}x\ dx \\
&= \frac{m-1}{n+1} \int_0^{\pi/2} \cos^{m-2}x\sin^nx (1-\cos^2 x)\ dx \\
&= \frac{m-1}{n+1} (I(m-2, n) - I(m,n))
\end{align*}
solving for \(I(m,n)\) gives
\[ I(m,n) = \frac{m-1}{n+m} I(m-2,n) \]
as desired. Proceed similarly for the case \(I(m, n-2)\),
\begin{align*}
I(m,n) &= \int_0^{\pi/2}\cos^m x\sin^n x\ dx \\
&= \left[
\frac{-\sin^{n-1} x\cos^{m+1} x}{m+1}
\right]^{\pi/2}_0 + \int_0^{\pi/2} \frac{n-1}{m+1} \cos^{m+2}x\sin^{n-2}x\ dx \\
&= \frac{n-1}{m+1} (I(m, n-2) - I(m,n))
\end{align*}
and solve for \(I(m,n)\) the same way.

**Part (ii).** To find \(I(2m,2n)\) repeatedly apply part (i).
\begin{align*}
I(2m,2n) &= I(0,2n) \prod_{i=1}^m \frac{2i-1}{2i+2n} \\
&= I(0,0) \prod_{i=1}^m \frac{2i-1}{2i+2n} \prod_{j=1}^n \frac{2j-1}{2j} \\
&= \frac\pi2 \frac{\prod_{i=1}^m (2i-1) \prod_{j=1}^n (2j-1)}{2^{m+n}(m+n)!}
\end{align*}
for the product terms observe that
\[ \prod_{i=2}^m (2i-1) = \frac{(2m)!}{2^m m!} \]
so
\[
I(2m,2n) = \frac{(2m)!(2n)!}{2^{2(m+n)}(m+n)!} \frac\pi2
\]

## Q2

Let \(f(x) = \frac{(-1)^{\lfloor x\rfloor}}{\sqrt{\lfloor x\rfloor}}\),
then integrating \(f\) from \(a\) is (more or less) equivalent to adding the series \(\sum_{n=a}^\infty \frac{(-1)^n}{\sqrt{n}}\),
which is convergent by alternating series test.
However integrating \(f^2\) is equivalent to adding the harmonic series \(\frac1n\) which diverges.

## Q3

**Part (i).**
Let \(S_n(x)\) denote the partial sum \(\sum_{m=1}^n u_n(x)\).
Let \(\mu = \inf_{x\in[a,b]} S(x)\) and for each \(n\in\mathbb{N}\),
let \(X_n = \set{x\in[a,b]: S_n(x) \leq \mu}\) which is closed.
Note that \(X_n\) is also nonempty as \(S_n\) achieves its minimum.
Next observe that \(X_1\supseteq X_2\supseteq \dots\), since if \(x\in X_{n+1}\), then
\(S_{n+1}(x) < \mu\), then \(S_n(x) + u_{n+1}(x) \leq \mu\) so \(x\in X_n\) too.
By nested ball theorem \(\bigcap_{n=1}^\infty X_n\) is nonempty, let \(a\) be in the intersection.
As each \(S_n(a) \leq \mu\), \(S(a) = \lim_n S_n(a) \leq \mu\) too which suffices.

**Part (ii).** \(S(x)\) could achieve its minimum on an endpoint, so the conclusion for \((a,b)\) fails.
This can hold in a degenerate example where \(u_1(x) = x\) and \(u_n(x) = 0\) for all \(n>1\).

# Homework 11

## Q1

We show \(f_n(x)\) uniformly converges to \(f'(x)\) on any finite closed interval \([a,b]\), which will imply the result.

Consider the difference
\[ f_n(x) - f'(x) = e^n\left[f(x+e^{-n}) - f(x)\right] - f'(x) \]
by Taylor's theorem there exists \(c\in (x,x+e^{-n})\) such that
\begin{align*}
f(x+e^{-n}) &= f(x) + f'(c)(e^{-n}) \\
f_n(x) - f'(x) &= f'(c) - f'(x)
\end{align*}
Now as \(f'\) is continuous, and thus uniformly continuous on \([a,b]\), by making \(n\) sufficiently large we can
ensure that \(c\) and \(x\) get arbitrarily close.
Specifically fix \(\epsilon> 0\) and let \(\delta\) such that \(\abs{c-x}<\delta\implies \abs{f'(c)-f'(x)}<\epsilon\),
then choose \(N > -\ln\delta\) then whenever \(n\geq N\), \(e^{-n} < \delta\) and \(\abs{c-x}<\delta\), then the result follows.

## Q2

First we show that \(\sum_{n=1}^\infty u'_n(x_0)\) converges.
By Cauchy criterion, we consider \(\abs{\sum_{n=k}^l u'_n(x_0)}\).
Note that for each \(n\in\set{k,k+1,\dots,l}\) there exists \(\delta_n\) such that
\[ \abs{x-x_0}<\delta_n \implies \abs{\frac{u_n(x) - u_n(x_0)}{x-x_0} - u'_n(x_0)} < \frac{\epsilon}{2(l-k+1)} \]
then whenever \(\abs{x-x_0}<\min_n \delta_n\),
\begin{align*}
\abs{\sum_{n=k}^l u'_n(x_0)}
&= \abs{\sum_{n=k}^l \frac{u_n(x) - u_n(x_0)}{x - x_0}} + \frac\epsilon2
\end{align*}
and uniform convergence of \(\sum_{n=1}^\infty \frac{u_n(x) - u_n(x_0)}{x - x_0}\) controls the other term.

Next we show \(f'(x_0) = \sum_{n=1}^\infty u'_n(x_0)\).
Consider
\begin{align*}
\abs{ \frac{\sum_n u_n(x) - \sum_n u_n(x_0)}{x-x_0} - \sum_n u'_n(x_0) }
&=
\abs{ \sum_n \frac{u_n(x) - u_n(x_0)}{x-x_0} - \sum_n u'_n(x_0) }
\end{align*}
By property (2) for all \(x\) near \(x_0\), the tail of \(\sum_{n=N}^\infty \frac{u_n(x) - u_n(x_0)}{x-x_0}\) can be made arbitrarily small,
and the same can be said for \(\sum_{n=N}^\infty u'_n(x_0)\) for some large enough \(N\), therefore
\begin{align*}
\abs{ \frac{\sum_n u_n(x) - \sum_n u_n(x_0)}{x-x_0} - \sum_n u'_n(x_0) }
&\leq \abs{ \sum_{n=1}^N \frac{u_n(x) - u_n(x_0)}{x-x_0} - \sum_{n=1}^N u'_n(x_0) } + o(1) \\
&\leq \abs{ \sum_{n=1}^N \frac{u_n(x) - u_n(x_0)}{x-x_0} - u'_n(x_0) } + o(1)
\end{align*}
and the finite sum can be controlled using an argument similar to the earlier part.

## Q3

We first show that \(\sum_{n=1}^\infty \int_a^\infty u_n(x)\ dx\) converges.
By the Cauchy criterion consider
\begin{align*}
\abs{\sum_{n=k}^l \int_a^\infty u_n(x)\ dx}
&\leq\abs{ \sum_{n=k}^l \int_a^b u_n(x)\ dx }
  +  \sum_{n=k}^l \abs{\int_b^\infty u_n(x)\ dx}
\end{align*}
applying property (3) to \(g(b)\) controls the first term while applying property (1) controls the second summation.

Now it suffices to show that for any \(\epsilon>0\), there exists large enough \(b\)
such that
\[
\abs{
\int_a^b \sum_{n=1}^\infty u_n(x)\ dx -
\sum_{n=1}^\infty \int_a^\infty u_n(x)\ dx
}< \epsilon.
\]

By property (2) we can exchange integral and sum
\[ \int_a^b \sum_{n=1}^\infty u_n(x)\ dx = \sum_{n=1}^\infty \int_a^b u_n(x)\ dx \]
Now 
\begin{align*}
\sum_{n=1}^\infty\int_a^\infty u_n(x)\ dx
&= \sum_{n=1}^K\int_a^\infty u_n(x)\ dx + o(1) \tag*{convergence} \\
&= \sum_{n=1}^K\int_a^b u_n(x)\ dx + o(1) \tag*{property (1)}\\
&= \sum_{n=1}^\infty\int_a^b u_n(x)\ dx + o(1) \tag*{property (3)}
\end{align*}
for sufficiently large \(K\) (chosen to satisfy property (3) in addition) and \(b\),
which suffices.
