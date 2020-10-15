---
title: MA4262 Homework 2
author: Qi Ji
date: 15th October 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\B}{\mathcal{B}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\pd}[2]{\frac{\partial #1}{\partial #2}}

#

Fix an arbitrary \(t_0 \in [a,b]\) and we show that \(F\) is continuous at \(t_0\).
Let \((t_n)\) be a sequence of numbers in \([a,b]\) that converges to \(t_0\).

Since \(f\) is continuous in its second coordinate, for each \(x\in X\), we have \[\lim_{n\to\infty} f(x,t_n) = f(x,t_0).\]

As for each \(t_n\), we have \(\abs{f(x,t_n)}\leq g(x)\) we can apply dominated convergence to show that
\[ F(t_0) = \lim_{n\to\infty} F(t_n) = \lim_{n\to\infty} \int f(x,t_n)\ d\mu(x). \]

#

Fix \(t\in[a,b]\).

For any sequence \((t_n)\subseteq [a,b]\) with \(t_n\neq t\), we have
\[
\pd{f}{t}(x,t) = \lim_{t_n\to t} \frac{f(x,t_n)-f(x,t)}{t_n-t}
\]
so that \(x\mapsto \pd{f}{t}(x,t)\) is a pointwise limit of measurable functions and therefore measurable.

For any \(x\in X\) we can apply mean value theorem to \(t\mapsto \pd{f}{t}(x,t)\)
to obtain existence of \(s\) between \(t_0\) and \(t\) such that
\[ f(x,t) - f(x,t_0) = (t - t_0)\pd{f}{t}(x,s) \]
then we have
\[ \abs{f(x,t)} \leq \abs{f(x,t_0)} + \abs{t-t_0} g(x) \]
which means that \(x\mapsto f(x,t)\) is integrable for each \(t\), not just \(t_0\).

Now for each \(n\),
\[ \frac{F(t_n) - F(t)}{t_n - t} = \int \frac{f(x,t_n) - f(x,t)}{t_n-t}\ d\mu(x) \]
and the integrated is dominated by \(g\), so by dominated convergence,
\[ \frac{dF}{dt}(t) = \lim_{n\to\infty} \frac{F(t_n) - F(t)}{t_n - t}  = \int \pd{f}{t}(x,t)\ d\mu(x). \]
