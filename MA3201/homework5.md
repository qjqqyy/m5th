---
title: Homework 5
author: Qi Ji
date: 13th April 2020
---

\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\set}[1]{\left\{#1\right\}}
\let\phi\varphi
\newcommand{\Z}{\mathbb{Z}}

# Question 6

Let \(a_1+N, a_2+N,\dots,a_k+N\) be set of generators for \(M/N\) and
\(b_1, b_2, \dots, b_l\) be generators for \(N\).
Let \(v\in M\), then \(v+N = c_1\overline{a_1} + \dots + c_k\overline{a_k}\) for some \(c_1,\dots,c_k\in R\).
This means \(v = c_1a_1 + \dots + c_ka_k + w\) where \(w\in N\).
Express \(w = d_1b_1 + \dots + d_lb_l\) and as \(v\) is arbitrary we obtain the result that
\(R\set{a_1,\dots,a_k,b_1,\dots,b_l} = M\).

# Question 7

Let \(v_1+N,\dots,v_s+N\in M/N\) such that
\(\overline{v_1},\dots,\overline{v_s}\) are linearly independent in \(M/N\).
Also let \(v_{s+1},\dots,v_{s+r}\) be linearly independent in \(N\).
To see that \(v_1,\dots,v_s,v_{s+1},\dots,v_{s+r}\) are linearly independent, suppose
\[ c_1v_1 + \dots + c_sv_s + c_{s+1}v_{s+1} + \dots + c_{s+r}v_{s+r} = 0 \]
then
\[ \sum_{i=1}^{s+r} c_iv_i + N = \sum_{i=1}^s c_iv_i + N = 0 + N \]
and working in \(M/N\) gives us \(c_1 = \dots = c_s = 0\).
Now work in \(N\) and linear independence of \(v_{s+1},\dots,v_{s+r}\) lets us further conclude that
\(c_1 = \dots = c_s = c_{s+1} = \dots = c_{s+r} = 0\).

Let \(u\in M\) and we want to show that some scalar multiple of \(u\) lies in \(R\set{v_1,\dots,v_{s+r}}\).
Case \(u\in N\), then \(du = c_1v_{s+1} + \dots + c_rv_{s+r}\) for some nonzero \(d\in R\) as rank of \(N\) is \(r\).
Case \(u\notin N\), then \(u+N \ne 0+N\), work in \(M/N\) and as its rank is \(s\), we have
\[d_0u + N = c_1\overline{v_1}+\dots+c_s\overline{v_s}\]
for some nonzero \(d_0\in R\), which means
\[d_0u = c_1v_1 + \dots + c_sv_s + w\]
for \(w\in N\), with similar argument as above we have
\[d_1w = c_{s+1}v_{s+1} + \dots + c_{s+r}v_{s+r}\]
for nonzero \(d_1\in R\), so
\[d_0d_1u = c_1d_1v_1 + \dots + c_sd_1v_s + c_{s+1}v_{s+1} + \dots + c_{s+r}v_{s+r}.\]
This shows rank is \(r+s\).
