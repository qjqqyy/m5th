---
title: MA3110S Homeworks 4, 5, 6
author: Qi Ji
date: 27th September 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\R}{\mathbb{R}}

# Homework 4

## Q1

If \(f\) has no zeroes on \([a,+\infty)\), by IVT for all \(x > a\), we have \(f(x) > 0\).
Choose \(y\) large enough (specifically \(y > \frac{-f(a)}{f'(a)} + a\)) such that by mean value theorem,
there exists \(c\in (a,y)\)
\[ \frac{f(y) - f(a)}{y - a} = f'(c) > \frac{-f(a)}{y-a} > f'(a) \]
then by mean value theorem again there exists \(d\in (a,c)\) such that
\[ f''(d) = \frac{f'(c) - f'(a)}{c - a} > 0 \]
contradicting hypothesis.

If \(f\) has two zeroes \(x_1, x_2\in (a,+\infty)\), then by mean value theorem there exists
\(c\in (x_1, x_2)\) with \(f'(c) = 0\), then by mean value theorem there exists \(d\in (a,c)\) with
\[f''(d) = \frac{f'(c) - f'(a)}{c - a} > 0\]
which contradicts hypothesis again.

## Q2

By induction on \(n\) we show for all \(n\in\mathbb{N}\), for all \(f, x_0\) such that
\(f\) is \(n\)-th differentiable at \(x_0\), we have
\[ f^{(n)}(x_0) = \lim_{h\to 0} \frac1{h^n} \sum_{k=0}^n (-1)^{n-k}\binom{n}{k} f(x_0 + kh) \]
if the limit exists.

When \(n = 0\) result trivially holds. Suppose result holds for \(n\), and \(f\) is \(n+1\)-th differentiable at \(x_0\), we want to show that
\[f^{(n+1)}(x_0) = 
\lim_{h\to 0} \frac1{h^{n+1}} \sum_{k=0}^{n+1} (-1)^{n+1-k}\binom{n+1}{k} f(x_0 + kh) \]
provided that the limit exists.
First we rewrite some terms
\begin{align*}
&\quad\ \sum_{k=1}^{n} (-1)^{n+1-k}\binom{n+1}{k} f(x_0 + kh) \\
&= \sum_{k=1}^n (-1)^{n+1-k}\binom{n}{k} f(x_0 + kh) + \sum_{k=1}^n (-1)^{n-(k-1)} \binom{n}{k-1}f(x_0 + (k-1)h + h) \\
&= -\sum_{k=1}^n (-1)^{n-k}\binom{n}{k} f(x_0 + kh) + \sum_{k=0}^{n-1} (-1)^{n-k} \binom{n}{k}f(x_0 + kh + h)
\end{align*}
so that
\begin{align*}
\sum_{k=0}^{n+1} (-1)^{n+1-k}\binom{n+1}{k} f(x_0 + kh)
&=
\sum_{k=0}^{n-1} (-1)^{n-k} \binom{n}{k}f(x_0 + kh + h)
+ f(x_0 + kh + h) \\
&\qquad -(-1)^{n} f(x_0)
-\sum_{k=1}^n (-1)^{n-k}\binom{n}{k} f(x_0 + kh) \\
&=
\sum_{k=0}^{n} (-1)^{n-k} \binom{n}{k}f(x_0 + kh + h) - \sum_{k=0}^n (-1)^{n-k}\binom{n}{k} f(x_0 + kh)
\end{align*}
armed with this we can examine the limit (which is assumed to exist)
\begin{align*}
&\quad\ \lim_{h\to 0} \frac1{h^{n+1}} \sum_{k=0}^{n+1} (-1)^{n+1-k}\binom{n+1}{k} f(x_0 + kh) \\
&= \lim_{h\to 0} \frac1h \frac1{h^n} \left[
\sum_{k=0}^{n} (-1)^{n-k} \binom{n}{k}f(x_0 + kh + h) - \sum_{k=0}^n (-1)^{n-k}\binom{n}{k} f(x_0 + kh)
\right] \\
&= \lim_{(h_1,h_2)\to(0,0)}
\frac1{h_1} \left[
\frac1{h_2^n}
\sum_{k=0}^{n} (-1)^{n-k} \binom{n}{k}f(x_0 + h_1 + kh_2) -
\frac1{h_2^n}\sum_{k=0}^n (-1)^{n-k}\binom{n}{k} f(x_0 + kh_2)
\right] \\
&= \lim_{h_1\to 0} \frac1{h_1} \left[
\lim_{h_2\to 0} \frac1{h_2^n}
\sum_{k=0}^{n} (-1)^{n-k} \binom{n}{k}f(x_0 + h_1 + kh_2) -
\lim_{h_2\to 0} \frac1{h_2^n}\sum_{k=0}^n (-1)^{n-k}\binom{n}{k} f(x_0 + kh_2)
\right] \\
&= \lim_{h_1\to 0} \frac1{h_1} \left(
f^{(n)}(x_0+h_1) - f^{(n)} (x_0)
\right) = f^{(n+1)}(x_0)
\end{align*}

## Q3

Let \(h\) be small and without loss of generality positive such that
\(f\) is continuous at \([x_0-h, x_0+h]\) and twice differentiable at \((x_0-h, x_0+h)\),
define \(g(t) = f(x_0 + t) + f(x_0 - t)\) and it suffices to show that
\[ \frac{g(h) - g(0)}{h^2} = \frac{g''(c)}2 \]
for some \(c\in (-h,h)\).
By Taylor's theorem on \([0,h]\) there exists \(c\in(0,h)\) such that
\[g(h) = g(0) + g'(0)h + \frac{g''(c)}2 h^2 \]
and since \(g'(t) = f'(x_0+t) - f'(x_0 -t)\) is an odd function \(g'(0) = 0\),
then the result follows.

# Homework 5

<div style="height:50vh"></div>
