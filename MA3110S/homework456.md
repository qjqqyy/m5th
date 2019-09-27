---
title: MA3110S Homeworks 4, 5, 6
author: Qi Ji
date: 27th September 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\R}{\mathbb{R}}
\let\epsilon\varepsilon

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

By Taylor expansion on \(\ln(1+x)\) for any \(x\) there exists \(c\in(0,x)\) such that
\[ \ln(1+x) = x - \frac{x^2}{2(1+c)^2}. \]
Then for any \(n\), there exists \(c_1\in(0,\frac1{n+1}), c_2\in(0,\frac1n)\) such that
\begin{align*}
n^s\left(
\left( 1 + \frac1{n+1}\right)^{n+1} -
\left( 1 + \frac1{n}\right)^{n}
\right)
&= n^s\left(
e^{(n+1)\ln(1+\frac1{n+1})} -
e^{n\ln(1+\frac1{n})}
\right) \\
&= n^s e \left(
\exp\left(- \frac{1}{2(1+c_1)^2(n+1)}\right)-
\exp\left(- \frac{1}{2(1+c_1)^2n}\right)
\right) \\
\end{align*}
then there exists
\(d_1\in \left(- \frac{1}{2(1+c_1)^2(n+1)},0\right), d_2\in \left(- \frac{1}{2(1+c_1)^2n)},0\right)\) such that
\begin{align*}
n^s\left(
\left( 1 + \frac1{n+1}\right)^{n+1} -
\left( 1 + \frac1{n}\right)^{n}
\right)
&= n^s e \left(
1 - \frac{e^{d_1}}{2(1+c_1)^2(n+1)}
- 1 + \frac{e^{d_2}}{2(1+c_2)^2n}
\right) \\
&= n^s \frac{e}2 \left(
\frac{e^{d_2}}{n(1+c_2)^2}
- \frac{e^{d_1}}{(n+1)(1+c_1)^2}
\right) \\
&= \frac{n^s}{n(n+1)} \frac{e}2 \left(
\frac{e^{d_2}(n+1)}{(1+c_2)^2}
- \frac{e^{d_1}n}{(1+c_1)^2}
\right) \\
&= \frac{n^s}{n(n+1)} \frac{e}2 \left(
n\left(\frac{e^{d_2}}{(1+c_2)^2}
- \frac{e^{d_1}}{(1+c_1)^2}\right)
+ \frac{e^{d_2}}{(1+c_2)^2}
\right)
\end{align*}
as \(n\to\infty\), each \(c_i, d_i\to 0\) and \(\frac{e^{d_i}}{(1+c_i)^2} \to 1\),
so \(f(2) = \frac{e}2\) and \(f(s) = 0\) for all \(s < 2\), while the limit diverges for all \(s > 2\),
and the domain is \((-\infty, 2]\) and range \(\set{0,\frac{e}2}\).

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

# Homework 6

## Q1

Let \(P\) be any partition \(a = x_0 < x_1 < \dots < x_{p-1} < x_p = b\),
then for all \(j\), by mean value theorem there exists \(d_j \in [x_{j-1}, x_j]\) such that
\begin{align*}
x_j^{m+1} - x_{j-1}^{m+1} &= (m+1) d_j^m (x_j - x_{j-1}) \\
d_j^m &= \frac1{m+1}(x_j^{m+1} - x_{j-1}^{m+1})
\end{align*}
and when we let \(\mathbf{d}\) denote \((d_1,d_2,\dots,d_p)\) this sum will telescope as follows
\begin{align*}
R(x^m, x, P, \mathbf{d})
&= \sum_{j=1}^p d_j^m (x_j - x_{j-1}) \\
&= \frac1{m+1} \sum_{j=1}^p (x_j^{m+1} - x_{j-1}^{m+1}) \\
&= \frac1{m+1} \left(b^{m+1} - a^{m+1}\right)
\end{align*}
This reduces our problem to showing that for any \(\epsilon>0\),
there exists \(\delta>0\) such that when \(\abs{P} \leq \delta\) and
\(\mathbf{t} = (t_1, t_2, \dots, t_p)\) such that each \(t_j \in [x_{j-1}, x_j]\)
\[ \abs{R(x^m, x, P, \mathbf{t}) - R(x^m, x, P, \mathbf{d})} < \epsilon. \]

First observe that \(x^m\) is continuous on \([a,b]\), and is hence uniformly continuous.
Fix \(\epsilon > 0\) and use uniform continuity of \(x^m\) to get a \(\delta_1\) such that
whenever \(a \leq x < y \leq b\),
\[ \abs{x-y} < \delta_1 \implies \abs{x^m - y^m} < \frac{\epsilon}{2(b-a)} \]
choose \(\delta = \delta_1\) and consider any partition \(\abs{P} \leq \delta\)
that is uniform enough, in the sense that \(p < \frac{2(b-a)}{\delta}\).
Let \(\mathbf{t}\) be any set of tags, then
\begin{align*}
\abs{R(x^m,x,P,\mathbf{t}) - R(x^m,x,P,\mathbf{d})}
&= \abs{\sum_{j=1}^p\left(t_j^m - d_j^m\right)(x_j-x_{j-1})} \\
&\leq p\delta\frac{\epsilon}{2(b-a)} < \epsilon
\end{align*}
then reusing the fact proven in Proposition 3.3 (regarding refinements) we get the general case for arbitrary partitions.
In greater detail, when \(P^* \supset P\) is a refinement and \(\mathbf{t}^*\) is a set of tags for \(P^*\),
we can check that there are tag assignments \(\mathbf{t}_1, \mathbf{t}_2\) satisfying
\[ R(x^m,x,P,\mathbf{t}_1) \leq R(x^m,x,P^*,\mathbf{t}^*) \leq R(x^m,x,P,\mathbf{t}_2). \]

## Q2

Suppose \(f\) is continuous at \(x\) but \(f(x) \ne 0\), then by continuity there exists \(\delta_0>0\) such that
for all \(y \in (x-\delta_0, x+\delta_0)\), we have \(f(y) \in (\frac{f(x)}2, \frac{3f(x)}2)\),
so in particular \(f(y) > \frac{f(x)}2\).

We now show that the integral \(\int_a^b f\ dx\) cannot be \(0\).
Let \(\epsilon = \frac{\delta_0 f(x)}2\) and for any \(\delta>0\), we can produce a mesh \(P\) with \(\abs{P} < \delta\)
such that \(\abs{R(f,x,P)} > \epsilon\).
Specifically let \(P\) be \(a = x_0 < x_1 < \dots < x_i = x - \delta_0 < \dots < x_j = x + \delta_0 < \dots < x_p = b\)
and \(P\) just have to be fine enough, then
\begin{align*}
\abs{R(f,x,P)}
&= \sum_{k=1}^p f(t_k)(x_k-x_{k-1}) \\
&\geq \sum_{k=i}^j f(t_k)(x_k-x_{k-1}) \\
&\geq \frac{f(x)}2 \sum_{k=i}^j (x_k-x_{k-1}) \\
&\geq \frac{f(x)}2 (x_j - x_i) > \epsilon
\end{align*}

## Q3

Let \(c_1, c_2, \dots, c_r \in [a,b]\) enumerate all points which \(f\) and \(g\) differ
and let \(d = \max\abs{g(c_i) - f(c_i)}\).

Suppose \(f\) is Riemann integrable on \([a,b]\) and let \(\epsilon> 0\)
let
\[ L = \int_a^b f(x)\ dx \]
then by integrability of \(f\) there exists \(\delta_0>0\) such that for all partitions \(P\) with \(\abs{P} < \delta_0\)
\[ \abs{R(f,x,P) - L} < \frac\epsilon2 \]
choose \(\delta = \min(\delta_0, \frac{\epsilon}{2rd})\) and let \(P\) be a partition such that \(\abs{P} < \delta\),
let \(\mathbf{t} = \set{t_1, t_2, \dots, t_p}\) be any tag set
\begin{align*}
R(g,x,P,\mathbf{t})
&= \sum_{k=1}^p g(t_k) (x_k - x_{k-1}) \\
&= \sum_{k=1}^p \left(f(t_k) + g(t_k) - f(t_k) \right) (x_k - x_{k-1}) \\
&= R(f,x,P,\mathbf{t}) + \sum_{k=1}^p \left(g(t_k) - f(t_k) \right) (x_k - x_{k-1}) \\
\abs{R(g,x,P,\mathbf{t}) - L}
&\leq \abs{R(f,x,P,\mathbf{t}) - L} + \sum_{k=1}^p \abs{g(t_k) - f(t_k)} (x_k - x_{k-1}) \\
\end{align*}
note that in the worst case \(\{t_k\}_{k\in\set{1,\dots,p}}\) covers \(\{c_l\}_{l\in\set{1,\dots,r}}\), but we still have the bound
\[
\sum_{k=1}^p \abs{g(t_k) - f(t_k)}(x_k-x_{k-1})
\leq \delta \sum_{l=1}^r \abs{g(c_l) - f(c_l)}
\leq \delta r d
\]
which substituted back gives
\[ \abs{R(g,x,P,\mathbf{t}) -L} < \frac{\epsilon}2 + \delta rd \leq \epsilon. \]
