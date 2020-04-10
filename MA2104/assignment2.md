---
author: Qi Ji - A0167793L - T03
title: MA2104 Assignment 2
date: 18th February 2018
classoption:
- 10pt
---

\newcommand{\qed}{\hfill$\blacksquare$}
\renewcommand{\QED}{\tag*{$\blacksquare$}}
\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\renewcommand{\C}[1]{\left\langle #1 \right\rangle}
\newcommand{\pd}[2]{\frac{\partial #1}{\partial #2}}

# Question 1
(a)  $\lim\limits_{(x,y)\to(0,0)} \dfrac{2xy^3}{x^2+8y^6}$.

     _Solution._ First take limit along the line $y = 0$,
\begin{align*}
    \lim_{(x,0)\to(0,0)} \frac{2x(0)^3}{x^2+8(0)^6}
    &= \lim_{x\to 0} \frac{0}{x^2}\\
    &= 0
\end{align*}
Next, take the limit along the curve $x = y^3$,
\begin{align*}
    \lim_{(y^3,y)\to(0,0)} \frac{2(y^3)y^3}{(y^3)^2+8y^6}
    &= \lim_{y\to 0} \frac{2y^6}{9y^6}  \\
    &= \frac{2}{9}
\end{align*}
Hence the limit does not exist. \qed

(b)  $\lim\limits_{(x,y)\to(0,0)} \dfrac{x^3+4x^2+2y^2}{2x^2+y^2}$.

     _Solution._
\begin{align*}
    \lim_{(x,y)\to(0,0)} \frac{x^3+4x^2+2y^2}{2x^2+y^2}
    &= \lim_{(x,y)\to(0,0)} \frac{x^3}{2x^2+y^2} + 2
\end{align*}
Now it remains to compute $\lim\limits_{(x,y)\to(0,0)} \dfrac{x^3}{2x^2+y^2}$,
note that
\begin{align*}
    y^2 &\geq 0\\
    2x^2 + y^2 &\geq 2x^2 \geq 0\\
    \frac{x^3}{2x^2+y^2} \leq \abs{\frac{x^3}{2x^2+y^2}}&\leq \frac{\abs{x^3}}{2x^2}=\frac{\abs{x}}{2}
\end{align*}
and similarly $$-\frac{\abs{x}}{2} \leq -\abs{\frac{x^3}{2x^2+y^2}} \leq \frac{x^3}{2x^2+y^2}$$
Since $\lim_{(x,y)\to(0,0)} -\frac{\abs{x}}{2} = \lim_{(x,y)\to(0,0)} \frac{\abs{x}}{2} = 0$,
by Squeeze theorem,
$$\lim\limits_{(x,y)\to(0,0)} \dfrac{x^3}{2x^2+y^2} = 0,$$
then we have
$$\lim\limits_{(x,y)\to(0,0)} \dfrac{x^3+4x^2+2y^2}{2x^2+y^2} = 2.\QED$$

# Question 2
(i)   \begin{align*}
    \pd{z}{x} &= \pd{z}{u}\pd{u}{x} + \pd{z}{v}\pd{v}{x}\\
    &= f_u(u,v)(2xy) + f_v(u,v)(0)\\
    &= 2xy f_u(u,v) \QED
\end{align*}

(ii)  \begin{align*}
    \pd{}{y} \left( \pd{z}{x} \right) &= \pd{}{y} \left( 2xy f_u(u,v) \right)\\
    &= 2x\left(y\pd{}{y}(f_u(u,v)) + f_u(u,v) \right)
\end{align*}
Note that
\begin{align*}
    \pd{}{y}(f_u(u,v)) &= f_{uu}(u,v)\pd{u}{y} + f_{uv}(u,v)\pd{v}{y}   \\
    &= x^2 f_{uu}(u,v) + 2y f_{uv}(u,v)
\end{align*}
So
\begin{align*}
    \pd{}{y} \left( \pd{z}{x} \right)
    &= 2x\left(x^2y f_{uu}(u,v) + 2y^2 f_{uv}(u,v) + f_u(u,v) \right)   \\
    &= 2x^3y f_{uu}(u,v) + 4xy^2 f_{uv}(u,v) + 2xf_u(u,v) \QED
\end{align*}

# Question 3
*Solution.*
Let $f(x,y) = 2x^2 + y^2$ be the ellipse the insect moves on, then
\begin{align*}
    \nabla f(x,y) &= \C{4x, 2y}  \\
    \nabla f(1,1) &= \C{4,2}
\end{align*}
By inspection, a unit tangent vector to $f$ at $(1,1)$ will be
$$ \mathbf{u} := \frac{1}{2\sqrt{5}}\C{2,-4} = \C{\frac{1}{\sqrt{5}},\frac{-2}{\sqrt{5}}}. $$
Now compute $\nabla T(1,1)$,
\begin{align*}
    \nabla T(x,y) &= \C{6x-2y, -2x}\\
    \nabla T(1,1) &= \C{4, -2}
\end{align*}
Taking the directional derivative
\begin{align*}
    D_\mathbf{u} T(1,1) &= \nabla T(1,1)\cdot \mathbf{u}\\
    &= \C{4,-2} \cdot \C{\frac{1}{\sqrt{5}},\frac{-2}{\sqrt{5}}}    \\
    &= \frac{8}{\sqrt{5}}\ {}^\circ\text{C cm}^{-1}
\end{align*}
Then by chain rule, rate of change of temperature will be
$$\frac{24}{\sqrt{5}}\ {}^\circ\text{C s}^{-1}.\QED$$


\renewcommand{\r}{\mathbf{r}}
# Question 4
If $\mathbf{r}(t) \ne \mathbf{0}$, show that $\frac{d}{dt}\abs{\mathbf{r}(t)}
= \frac{1}{\abs{\mathbf{r}(t)}} \mathbf{r}(t)\cdot \mathbf{r}'(t)$.

*Proof.*
Suppose $\mathbf{r}(t) \ne \mathbf{0}$,
\begin{align*}
    \frac{d}{dt}\abs{\r(t)} &=
    \frac{d}{dt}\left( \sqrt{\r(t)\cdot\r(t)} \right)\\
    \intertext{by chain rule outside and product rule inside,}
    &= \frac{1}{2\sqrt{\r(t)\cdot\r(t)}} \cdot \left( \r(t)\r'(t) + \r'(t)\r(t) \right) \\
    &= \frac{2\r(t)\r'(t)}{2\sqrt{\abs{\r(t)}^2}}   \\
    &= \frac{1}{\abs{\mathbf{r}(t)}} \mathbf{r}(t)\cdot \mathbf{r}'(t)
    \tag*{$\square$}
\end{align*}

