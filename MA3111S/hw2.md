---
title: MA3111S Homework 2
author: Qi Ji
date: 18th February 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\pd}[2]{\frac{\partial#1}{\partial#2}}
\newcommand{\pdd}[3]{\frac{\partial^2 #1}{\partial#2\partial#3}}
\newcommand{\zbar}{\overline{z}}

# Exercise 2

## 1

Let \(u(z) = x + iy\) be \(\mathscr{C}^2\),
\begin{align*}
\pd{^2u}{z\partial \overline{z}}
&= \pd{}{z}\frac12\left( \pd{u}{x} + i\pd{u}{y} \right) \\
&= \frac12\left( \pd{^2u}{z\partial x} + i\pd{^2u}{z\partial y} \right) \\
\end{align*}
now
\[
\pdd{u}{z}{x} = \frac12\left( \pdd{u}{x}{x} - i\pdd{u}{y}{x} \right)
\text{ and }
\pdd{u}{z}{y} = \frac12\left( \pdd{u}{x}{y} - i\pdd{u}{y}{y} \right)
\]
so
\[
\pdd{u}{z}{\overline{z}} = \frac14\left(\pdd{u}{x}{x} - i\pdd{u}{y}{x} + i \pdd{u}{x}{y} + \pdd{u}{y}{y} \right)
\]
and by Clarinut's theorem we know that \(\pdd{u}{x}{y} = \pdd{u}{y}{x}\) so we have \(\Delta u = 4\pdd{}{z}{\overline{z}} u\) as desired.

\(u\) is harmonic iff \(\Delta u = 0\) iff \(\pdd{u}{z}{\overline{z}} = 0\) iff (by Clarinut's theorem again) \(\pdd{u}{\overline{z}}{z} = \pd{}{\overline{z}} \pd{u}{z} = 0\)
iff (by Exercise 1.4\) \(\pd{u}{z}\) is holomorphic.

## 2

Let \(v = u(f(z))\), then in some open set where \(u(f(z))\) is well-defined
\[ \pd{v}{z} = \pd{u}{f} f'(z) \]
\(\pd{u}{f}\) makes sense and (by part 1) will be holomorphic as \(u\) is harmonic.
And as \(f'\) is also holomorphic \(u(f(z))\) harmonic.

## 3

Let \(f(x + iy) = u(x,y) + iv(x,y)\), so \(\pd{f}{\zbar} = 0\), that is
\[ \pd{f}{x} = -i \pd{f}{y} \]
\[ u_x + i v_x = -i u_y + v_y \]
so \(u_x = v_y\) and \(v_x = -u_y\).
It follows that
\[ u_{xx} = v_{yx} \text{ and } v_{xy} = - u_{yy} \]
and by Clarinut theorem
\[ \Delta \Re(f) = u_{xx} + u_{yy} = v_{yx} - v_{xy} = 0 \]
similarly we can show
\[ \Delta \Im(f) = v_{xx} + v_{yy} = u_{xy} - u_{yx} = 0. \]

## 4

\newcommand{\fbar}{\overline{f}}
Outside the zero set of \(f\), we have
\[
\pd{}{\zbar}\log(f\fbar) = \frac{\pd{f}{\zbar}\fbar + f\pd{\fbar}{\zbar}}{f\fbar} = \frac{1}{\fbar} \pd{\fbar}{\zbar}
\]
so
\[
\pdd{}{z}{\zbar}\log(f\fbar) = \frac{-\pd{\fbar}{z}}{(\fbar)^2}\pd{\fbar}{\zbar} + \frac{1}{\fbar} \pdd{\fbar}{z}{\zbar}
= \frac{1}{\fbar} \pdd{\fbar}{z}{\zbar}
= \frac{1}{\fbar} \pdd{\fbar}{\zbar}{z} = 0
\]
as \(\pd{\fbar}{z} = \pd{f}{\zbar} = 0\).
And therefore
\[\Delta\log\abs{f} = \Delta \frac12 \log\abs{f}^2 = \Delta\frac12\log(f\fbar) = 0\]
and \(\log\abs{f}\) is harmonic.

## 5

Suppose \(\abs{f}^2\) is harmonic.
Let \(f(x+iy) = u(x,y) + iv(x,y)\) and \(\abs{f(x+iy)}^2 = u^2(x,y) + v^2(x,y)\).
\begin{align*}
\Delta \abs{f^2}
&= \pd{^2}{x^2}(u^2 + v^2) + \pd{^2}{y^2}(u^2 + v^2) \\
&= \pd{}{x}(2uu_x + 2vv_x) + \pd{}{y}(2uu_y + 2vv_y) \\
&= 2(u_x)^2 + 2uu_{xx} + 2vv_{xx} + 2(v_x)^2
 + 2(u_y)^2 + 2uu_{yy} + 2vv_{yy} + 2(v_y)^2 \\
&= 2(u_x)^2 + 2(v_x)^2 + 2(u_y)^2 + 2(v_y)^2
+ 2u(u_{xx} + u_{yy}) + 2v(v_{xx} + v_{yy}) \\
&= 2(u_x)^2 + 2(v_x)^2 + 2(u_y)^2 + 2(v_y)^2
\end{align*}
as \(u\) and \(v\) are harmonic by part 3.
This means that \(u_x\), \(u_y\), \(v_x\), and \(v_y\) are all zero, so \(f\) is a constant function.

Conversely it is trivial that \(f\) constant implies \(\abs{f}^2\) harmonic.
Therefore \(\abs{f}^2\) is harmonic iff \(f\) is constant.


# Exercise 4

For \((x,y)\) in unit disc,
\begin{align*}
u(x,y) &= \frac{x+1}{x^2+y^2+2x+1} \\
\pd{u}{x} &= \frac{1}{x^2+y^2+2x+1} - 2\left(\frac{x+1}{x^2+y^2+2x+1}\right)^2 \\
&= \frac{1}{x^2+y^2+2x+1} - 2u^2 \\
\pd{^2u}{x^2} &= - \frac{2x+2}{(x^2+y^2+2x+1)^2} - 4u\pd{u}{x} \\
&= 8u^3 - \frac{6}{x^2+y^2+2x+1}u \\
\pd{u}{y} &= -2\frac{(x+1)y}{(x^2+y^2+2x+1)^2} \\
\pd{^2u}{y^2} &= -2\frac{(x+1)(x^2+y^2+2x+1)^2 - (x+1)y 2g(2y)}{(x^2+y^2+2x+1)^4} \\
&= -2\frac{x+1}{(x^2+y^2+2x+1)^2} + 8 \frac{(x+1)y^2}{(x^2+y^2+2x+1)^3} \\
&= \left(\frac{8y^2 - 2(x^2+y^2+2x+1)}{(x^2+y^2+2x+1)^2}\right)u
\end{align*}
so we have
\begin{align*}
\Delta u &= 8u^3 - u\left( \frac{8y^2 - 8y^2 - 8(x+1)^2}{(x^2+y^2+2x+1)^2} \right) \\
&= 8u^3 - 8u^3 = 0
\end{align*}
and therefore \(u\) is harmonic.

By Exercise 1.3, for \(v\) is a harmonic conjugate of \(u\), iff \(v\) satisfies
\[ \pd{v}{x} = -\pd{u}{y} = \frac{2(x+1)y}{(y^2 + (x+1)^2)^2} \]
and
\[ \pd{v}{y} = \pd{u}{x} = \frac{y^2 - (x+1)^2}{(y^2+(x+1)^2)^2} \]
we can verify that a solution of this differential equation is
\[ v(x,y) = \frac{-y}{y^2 + (x+1)^2}. \]

# Exercise 6

By Liouville's theorem as \(f(z) + e^z - 3z^5 + 5\) is still entire and is also bounded it is constant, therefore
\begin{align*}
f(2) + e^2 - 3(2)^5 + 5 &= f(0) + e^0 + 5 \\
&= 7
\end{align*}
so
\[ f(2) = 29 - e^2. \]

# Exercise 8

* Removable singularity at \(z=1\),

* Poles of order 1 at \(z=e^{2k\pi i/3}\) for \(k = 1,2\),

* Essential singularity at \(z=0\).
