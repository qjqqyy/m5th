---
title: MA3111S Homework 4
author: Qi Ji
date: 9th April 2020
---

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\pd}[2]{\frac{\partial#1}{\partial#2}}
\newcommand{\pdd}[3]{\frac{\partial^2 #1}{\partial#2\partial#3}}
\newcommand{\zbar}{\overline{z}}
\newcommand{\C}{\mathbb{C}}

# Exercise 2

Let \(g(z) = f(z)f(-z)f(iz)f(-iz)\).
For any two edges \(e_1, e_2\) along \(\partial\Omega\) it follows from \(g(z) = g(iz)\) that
\[ \sup_{z\in e_1} \abs{g(z)} = \sup_{z\in e_2} \abs{g(z)}.\]
By maximum modulus principle \(g\) attains its maximum on \(\partial\Omega\), so we have
\begin{align*}
\abs{g(0)} &\leq \sup_{z\in\partial\Omega} \abs{g(z)}\\
&= \sup_{z\in e} \abs{g(z)} \\
&= \sup_{z\in e} \abs{f(z)} \abs{f(iz)}\abs{f(-z)}\abs{f(-iz)} \\
&\leq \sup_{z\in e} \abs{f(z)} \left(\sup_{z\in \partial\Omega} \abs{f(z)}\right)^3 \\
&= \sup_{z\in e} \abs{f(z)} \left(\sup_{z\in \overline{\Omega}} \abs{f(z)}\right)^3 \\
&= m M^3
\end{align*}
as \(\abs{g(0)} = \abs{f(0)}^4\) the result follows immediately


# Exercise 4

Suppose there is \(v\) such that \(f = u + iv\) is holomorphic on the punctured plane.
For any open disk \(D\), \(f(D\setminus\set{0})\) the image of the punctured disk is a neighbourhood of \(\infty\),
in particular it contains \(\C\setminus \overline{\mathbb{D}_r}\) for some positive radius \(r\).
As a result \(\Re(f(D\setminus\set{0})) = u(D\setminus\set{0}) = \mathbb{R}\).
Let radius of \(D\) tend to zero and \(u\) sending \((D\setminus\set{0})\) to the entire real line will contradict \(\lim_{z\to 0} u(z) = +\infty\).

An example is \(u(z) = - \log(\abs{z})\).

# Exercise 6

Let \(u\) be harmonic such that \(u^3\) is also harmonic, then
\begin{align*}
0 &= \Delta u^3 \\
\pd{}{x} u^3 &= 3u^2 u_x \\
\pd{^2}{x^2} u^3 &= 3u^2 u_{xx} + 6u_x^2 u \\
\pd{^2}{y^2} u^3 &= 3u^2 u_{yy} + 6u_y^2 u \\
0 &= 3u^2 \underbrace{(u_{xx} + u_{yy})}_{0\text{ as \(u\) is harmonic}} + 6u (u_x^2 + u_y^2)
\end{align*}
we have

* \(u\equiv 0\), or
* \(u_x \equiv u_y \equiv 0\) which means that \(u\) is constant.

# Exercise 8

Easy to check that each coordinate is holomorphic.
To see that \(\tau\) is injective suppose \((t^2,t^3) = (s^2,s^3)\), then
\[ t^2\cdot t = t^3 = s^2 \cdot s = t^2\cdot s \implies t = s. \]
To show \(\tau\) is proper,
as \(\C^2\) is locally compact and \(\C\) is Hausdorff,
we show that the pullback of any point in \(\C^2\) by \(\tau\) is compact.
For \((z_1,z_2)\in \C^2\),
\[ \tau^{-1}(\set{(z_1,z_2)}) = \set{t: t^2=z_1 \text{ and } t^3 = z_2} =
\begin{cases}
\set{\frac{z_2}{z_1}} &\text{if \((z_1,z_2)\) lies in the image} \\
\emptyset &\text{otherwise}
\end{cases}
\]
which in both cases results in a compact subset of \(\C\).
It is easy to see that \(\tau\) restricted to \(\C^*\) does not map anything to \(0\).

\newcommand{\fg}{\begin{pmatrix} f\\g\end{pmatrix}}
Now suppose \(\tau(\C)\) is a submanifold of \(\C^2\),
then by definition of submanifold, near \((0,0)\) \(\tau(\C)\) looks like \(\fg(\mathbb{D})\) where \(f,g\) are holomorphic functions on the unit disk and
\(\fg(0) = \begin{pmatrix}0\\0\end{pmatrix} \)
(without loss of generality assume everything is normalised nicely).
Now for all \(z\in\mathbb{D}\),
\[ \fg(z) = \begin{pmatrix}t^2\\t^3\end{pmatrix} \] for some \(t\).
This implies that \(f^3 = g^2\).
Now express \(f\) and \(g\) as Taylor series and solving for \(f^3 = g^2\) gives us that
both Taylor series have 0 as their linear term.
This implies that \(\begin{pmatrix}f'\\g'\end{pmatrix}(0) = \begin{pmatrix}0\\0\end{pmatrix}\).
We have shown that rank of Jacobian at \(0\) is \(0\),
but earlier we showed that \(\tau(\C^*)\) is a submanifold of \(\C^2\setminus\set{0}\) (with dimension 1) so
\(\tau(\C)\) cannot be a submanifold of \(\C^2\).
