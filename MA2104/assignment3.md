---
title: MA2104 Assignment 3
author: Qi Ji (A0167793L) [T03]
date: 22nd March 2018
fontfamily: comicneue
mainfont: Comic Neue
classoption:
- 10pt
...

\newcommand{\comp}{\operatorname{comp}}
\newcommand{\proj}{\operatorname{comp}}
\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}
\renewcommand{\vec}[1]{\mathbf{#1}}
\newcommand{\VEC}[1]{\overrightarrow{#1}}
\newcommand{\ANGLE}[1]{\left\langle #1 \right\rangle}
\newcommand{\R}{\mathbb{R}}
\newcommand{\pd}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\diff}[2]{\frac{d #1}{d #2}}
\newcommand{\qed}{\hfill$\blacksquare$}
\newcommand{\tagQED}{\tag*{$\blacksquare$}}

Question 1
==========
>Find the point on the paraboloid $z=\dfrac{x^2}{4} + \dfrac{y^2}{25}$ that is closest to the point $(3,0,0)$.

*Solution.*
For any point $(x,y,z)$, the distance between $(x,y,z)$ and $(3,0,0)$ is given by
$$D(x,y,z) := \sqrt{(x-3)^2 + y^2 + z^2}.$$
By hint, $D$ is minimum if and only if $D^2$ is minimum, so it suffice to find minimum of $D^2$ given the constraint that
$$g(x,y,z) := \frac{x^2}{4} + \frac{y^2}{25} - z = 0.$$

Proceed to use Lagrange Multipliers to find maximum of $D^2$ given $g(x,y,z) = 0$, since $\nabla g \ne \vec{0}$,
\begin{align*}
    \nabla (D^2)(x,y,z) &= \ANGLE{2(x-3), 2y, 2z} \\
    \nabla g(x,y,z) &= \ANGLE{\frac{x}{2}, \frac{2y}{25}, -1}
\end{align*}
Now proceed to solve $\nabla (D^2)(x,y,z) = \lambda \nabla g(x,y,z)$, which gives the following system of equations
$$\left.\begin{aligned}
    2(x-3) &= \lambda \frac{x}{2}\\
    2y &= \lambda \frac{2y}{25}    \\
    2z &= -\lambda  \\
    \frac{x^2}{4} + \frac{y^2}{25} &= z
\end{aligned}\right\}
\implies
\left.\begin{aligned}
    4(x-3) &= \lambda x  \\
    25y &= \lambda y \\
    z &= -\frac{\lambda}{2}  \\
    \frac{x^2}{4} + \frac{y^2}{25} &= z
\end{aligned}\right\}$$
From second equation,
$y = 0$ or $\lambda = 25$.

- Case $\lambda = 25$, then $z= -\frac{25}{2}$, and
\begin{align*}
    4x - 12 &= 25x   \\
    x &= -\frac{4}{7}
\end{align*}
This has no solution in $\R$ as $\frac{y^2}{25} \geq 0 > z - \frac{x^2}{4} = - \frac{25}{2} - \frac{4}{49}$.

- Case $y = 0$, then fourth equation reduces to $x^2 = 4z$,
\begin{align*}
    x^2 &= 4z   \\
    x^2 &= -2\lambda    \\
    \lambda &= -\frac{x^2}{2}
\end{align*}
substituting that into our first equation we get
\begin{align*}
    4x - 12 &= -\frac{x^3}{2}   \\
    x^3 + 8x - 24 &= 0  \\
    x &= 2
\end{align*}
Then we get $z = 1$.
The only critical point is $(2,0,1)$.
\qed

Question 2
==========
>Suppose that the temperature of a metal plate is given by
>$T(x,y) = x^2 + 2x + y^2$ for points $(x,y)$ on the elliptical plate defined by $x^2 + 4y^2 \leq 24$.
>
>Find the maximum and minimum temperatures on the plate.

*Solution.* The gradient vector for $T$ is given by
$$\nabla T(x,y) = \ANGLE{2x + 2, 2y}.$$
The critical points are when $\nabla T = \vec{0}$, so
$$\left. \begin{aligned}
2x + 2 &= 0 \\
2y &= 0
\end{aligned}\right\} $$
The only critical point obtained is $(-1,0)$, which is eyeballed to be inside the elliptical plate.

Next, proceed to use Lagrange multipliers to find critical points on the boundary,
let $g(x,y) := x^2 + 4y^2 = 24$ be our constraint. Then
$$\nabla g(x,y) = \ANGLE{2x, 8y}.$$
Solving $\nabla T(x,y) = \lambda \nabla g(x,y)$, we obtain the system of equations
$$\left.\begin{aligned}
x + 1 &= \lambda x  \\
y &= 4\lambda y \\
x^2 + 4y^2 &= 24
\end{aligned}\right\}$$
From second equation, $\lambda = \frac{1}{4}$ or $y = 0$,

- Case $\lambda = \frac{1}{4}$, then
\begin{align*}
    x + 1&= \frac{x}{4} \\
    x &= -\frac{4}{3}   \\
\end{align*}
Substituting that into our constraint,
\begin{align*}
    \frac{16}{9} + 4y^2 &= 24    \\
    y^2 &= \frac{50}{9} \\
    y &= \pm \frac{5\sqrt{2}}{3}
\end{align*}

- Case $y = 0$, then $x^2 = 24$, so $x = \pm2\sqrt{6}$.

Tabulating the critical points,

--------- ---------- ----------------------------------------- ----------------- ------------------
  $(x,y)$  $(-1,0)$   $(-\frac{4}{3},\pm\frac{5\sqrt{2}}{3})$   $(2\sqrt{6},0)$   $(-2\sqrt{6},0)$ 
 $T(x,y)$  $-1$       $\frac{14}{3}$                            $24+4\sqrt{6}$    $24-4\sqrt{6}$
           min                                                  max
--------- ---------- ----------------------------------------- ----------------- ------------------

\qed

Question 3
==========
>Evaluate the following integral
>$$\int_0^2  \int_{\sqrt{y}}^2 \sqrt{x^2 + y}\ dx\ dy.$$

*Solution.*
Let the region of integration be called $D$, so
$$D = \set{(x,y): 0\leq y\leq 4, \sqrt{y}\leq x\leq 2}.$$
But $D$ can also be expressed as
$$D = \set{(x,y): 0\leq x\leq 2, 0\leq y\leq x^2}.$$
This allows us to rewrite the integral as
\begin{align*}
    \iint_D \sqrt{x^2 + y}\ dA
    &= \int_0^2 \int_0^{x^2} \sqrt{x^2 + y}\ dy\ dx \\
    &= \int_0^2 \left[\frac{2}{3}\left(x^2 + y\right)^{3/2} \right]_0^{x^2}\ dx \\
    &= \frac{2}{3} \int_0^2 \left((2x^2)^{3/2} - (x^2)^{3/2} \right) \ dx \\
    &= \frac{2}{3} \int_0^2 \left(2^{3/2} - 1\right) x^3 \ dx \\
    &= \frac{2}{3} \left(2^{3/2} - 1\right) \left[\frac{x^4}{4}\right]_0^2 \ dx \\
    &= \frac{8}{3} \left(2^{3/2} - 1\right) \tagQED
\end{align*}

Question 4
==========
>Rewrite the following iterated integral in the order $dy\ dx\ dz$:
>$$\int_{-1}^1 \int_0^{\sqrt{1-x^2}} \int_0^{y/2} f(x,y,z)\ dz\ dy\ dx.$$

*Solution.*
Let $D$ denote the region of integration, then it can be given by
$$D = \set{(x,y,z):-1\leq x\leq 1, 0\leq y\leq \sqrt{1-x^2}, 0\leq z\leq \frac{y}{2}}.$$

To integrate in the order $dy\ dx\ dz$, first find absolute bounds for $z$.
$$z\leq \frac{y}{2} \leq \frac{\sqrt{1-x^2}}{2} \leq \frac{1}{2},$$
so $0\leq z\leq 1/2$.

Next up, find bounds for $x$, note that because $x^2 + y^2 \leq 1$, and $y \geq 2z$,
\begin{align*}
    \abs{x} &\leq \sqrt{1-y^2}  \\
    \abs{x} &\leq \sqrt{1-4z^2}
\end{align*}
so $-\sqrt{1-4z^2}\leq x\leq \sqrt{1-4z^2}$.

Lastly, note that because $z\leq y/2$, $y$ is bounded below as $2z\leq y$.
So $2z\leq y\leq \sqrt{1-x^2}$.
Then rewriting the integral, we have
$$\iiint_D f(x,y,z)\ dV = \int_0^{1/2} \int_{-\sqrt{1-4z^2}}^{\sqrt{1-4z^2}} \int_{2z}^{\sqrt{1-x^2}} f(x,y,z)\ dy\ dx\ dz. \tagQED$$
