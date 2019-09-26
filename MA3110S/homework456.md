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

## Q1

Clearly \(f(0) = 0\) and \(f(s) = 0\) for all \(s<0\).
By wolfram alpha, \(f(1) = 0\), \(f(2) = \frac{e}2\) and \(f(3) = \infty\).
Domain should be \((-\infty, 2]\).
How to eyeball limit?

## Q2

First we note that for all \(n\), as long as \(x \geq 0\), \(P_n(x) > 0\).
Also by Taylor's theorem on \(e^{-x}\) we have for any \(n\), there exists \(c\in (0,x)\) such that
\[ e^{-x} = P_n(-x) + \frac{(-1)^{n+1} e^{-c}}{(n+1)!}x^{n+1}. \]

### (i)

If \(n\) is even, for any \(x > 0\) then there exists \(c\in (0,x)\) such that
\[ P_n(-x) = e^{-x} + \frac{e^{-c}}{(n+1)!}x^{n+1} >0 \]
which completes the proof.

### (ii)

If \(n\) is odd, then we can evaluate the derivative of \(P_n(x)\), which turns out to be \(P_{n-1}(x)\)
(case \(n=1\) is obvious). By our earlier result in part (i) \(P_{n-1} > 0\) so \(P_n(x)\) cannot have two or more zeroes.
\(P_n\) has to have a root though, since it is an odd degree polynomial.

### (iii)

Fix \(n\) and we compare \(P_{2n+1}\) with \(P_{2n-1}\), specifically
\[ P_{2n+1}(x) = P_{2n-1}(x) + \frac{x^{2n}}{(2n)!} + \frac{x^{2n+1}}{(2n+1)!} \]
it suffices to show that
\(P_{2n+1}(x_{n-1}) > 0\), then by earlier result that \(P_{2n+1}\) has strictly positive derivative we can conclude that \(x_n < x_{n-1}\).
To show that \(P_{2n+1}(x_{n-1}) > 0\) we only have to check that
\[ x_{n-1}^{2n}(2n+1) + x_{n-1}^{2n+1} > 0 \]
which can be reduced to just showing that \(-(2n+1) < x_{n-1} < 0\), and note that \(x_{n-1}\) being negative was shown earlier.

Suppose for a contradiction \(x_{n-1} \leq -(2n+1)\), then there exists \(c \in (x_{n-1}, 0)\) such that
\[ P_{2n-1}(x_{n-1}) = e^{x_{n-1}} - \frac{e^c}{(2n)!} x_{n-1}^{2n} \]
but \(e^c \geq e^{x_{n-1}}\) so
\[ P_{2n-1}(x_{n-1}) \leq e^{x_{n-1}}\left[
1 - \frac{x_{n-1}^{2n}}{(2n)!}
\right]\]
and \(x_{n-1}^{2n} \geq (2n+1)^{2n} \geq (2n)^{2n} > (2n)!\) for all \(n>0\), which means \(P_{2n-1}(x_{n-1}) < 0\).

## Q3

By taking Taylor's expansions at \(\frac{a+b}2\), there exists
\(c\in (\frac{a+b}2, b), d\in (a,\frac{a+b}2)\) such that
\begin{align*}
f(b) &= f\left(\frac{a+b}2\right) + \frac{f''(c)}2 \cdot\left(\frac{b-a}2\right)^2 \\
f(a) &= f\left(\frac{a+b}2\right) + \frac{f''(d)}2 \cdot\left(\frac{b-a}2\right)^2
\end{align*}
then
\begin{align*}
f(b) - f(a) &= \frac{f''(d) - f''(c)}8 (b-a)^2 \\
\abs{f''(d) - f''(c)} &= \frac{8}{(b-a)^2}\abs{f(b)-f(a)}
\end{align*}
and since \(\max\left(\abs{f''(c)},\abs{f''(d)}\right) \geq \dfrac12\abs{f''(d)-f''(c)}\),
and by choosing \(\xi\in\set{c,d}\) such that \(\abs{f''(\xi)} = \max\left(\abs{f''(c)},\abs{f''(d)}\right)\) we complete the proof.

<div style="height:50vh"></div>
