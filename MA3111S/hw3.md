---
title: MA3111S Homework 3
author: Pek Yu-Xuan Sean, Qi Ji
date: 26th March 2020
---

\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\pd}[2]{\frac{\partial#1}{\partial#2}}
\newcommand{\pdd}[3]{\frac{\partial^2 #1}{\partial#2\partial#3}}
\newcommand{\zbar}{\overline{z}}

# Exercise 2

Substitute \(z = e^{i\theta}\), so \(2\cos\theta = e^{i\theta} + e^{-i\theta} = z + z^{-1}\), now we compute

\(dz = ie^{i\theta}\ d\theta = iz\ d\theta\) so \(d\theta = \frac{1}{iz}\ dz\)
\begin{align*}
\int_0^{2\pi} \frac{1+2\cos\theta}{4-2\cos\theta}\ d\theta
&= \int_{\abs{z} = 1} \frac{1 + z + \frac1z}{4 - z - \frac1z} \frac{1}{iz}\ dz \\
&= \int_{\abs{z} = 1} \frac{z^2 + z + 1}{- z^2 + 4z - 1} \frac{1}{iz}\ dz \\
&= i \int_{\abs{z} = 1} \frac{z^2 + z + 1}{(z^2 - 4z + 1)z} \ dz \\
&= i \int_{\abs{z} = 1} \frac{z^2+z+1}{z(z-(2-\sqrt{3}))(z-(2+\sqrt{3}))} \ dz
\end{align*}
simple pole at \(p = 2-\sqrt{3}\). So residue at \(p\) is
\begin{align*}
\lim_{z\to p} \frac{z^2+z+1}{z(z-(2+\sqrt{3}))}
&= \frac{p^2+p+1}{p(p-(2+\sqrt{3}))} \\
&= -\frac5{2\sqrt{3}}
\end{align*}
another simple pole at \(p_2 = 0\), whose residue is
\begin{align*}
\lim_{z\to 0} \frac{z^2+z+1}{(z-(2-\sqrt{3}))(z-(2+\sqrt{3}))}
&= 1
\end{align*}
so the integral is
\[ i (2\pi i)\left(-\frac5{2\sqrt{3}} + 1\right) = \pi\left(\frac5{\sqrt{3}} - 2\right) \]

# Exercise 4

Let 
\[ f(x) = \frac{2-3x}{(x^2+1)(4x^2-4x+2)} = \frac{2-3x}{(x+i)(x-i)(2x-1-i)(2x-1+i)}. \]
Let \(S(R)\) denote the upper semicircle of radius \(R\)
and \(A(R)\) denote its arc \(S(R) \setminus [-R,R]\).
Now as \(\abs{R}\) gets large we can see that \(f\) on \(A(R)\) is \(o(\frac1{\abs{R}})\),
so the integral on the arc vanishes, so actually
\[ \int_{-\infty}^\infty f(x)\ dx = \lim_{R\to\infty} \int_{S(R)} f(z)\ dz. \]
Now use residues to compute the semicircle integral.
Simple pole at \(i\), residue at \(i\) is
\[ \lim_{z\to i} \frac{2-3z}{(z+i)(2z-1-i)(2z-1+i)} = \frac{7}{20} - \frac{i}{5} \]
another simple pole at \(\frac12 - \frac{i}2\), with its residue being
\[ \lim_{z\to \frac12 - \frac{i}2} \frac12 \frac{2-3z}{(z-i)(z+i)(2z-1-i)} = -\frac7{20} - \frac{i}{20} \]
and the integral is
\[ (2\pi i)(-\frac{i}{5} - \frac{i}{20}) = \frac{3\pi}{10}. \]

# Exercise 6

Let \(u\) also be a harmonic conjugate such that \(f = v + iu\) is holomorphic on some neighbourhood of \(\overline{\Omega}\).
Then \(e^{f(z)}\) is also holomorphic and \(e^{f(z)} \leq 1\) for \(z\) on the boundary of \(\Omega\).
Also for \(z\in\overline{\Omega}\) we have
\[ \abs{e^{f(z)}} = e^{v(z)} \leq e^{\sqrt{\abs{z}}} \]
and tutorial 4 exercise 4 gives \(\abs{e^{f(z)}} \leq 1\) for \(z\in\Omega\) which gives \(v\leq 0\).
