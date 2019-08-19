---
title: MA2104 Reference
author: Qi Ji
date: May 2018
classoption:
- 10pt
...

\newcommand{\comp}{\operatorname{comp}}
\newcommand{\proj}{\operatorname{proj}}
\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}
\renewcommand{\vec}[1]{\mathbf{#1}}
\newcommand{\VEC}[1]{\overrightarrow{#1}}
\newcommand{\braket}[1]{\left\langle #1 \right\rangle}
\newcommand{\R}{\mathbb{R}}
\newcommand{\pd}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\diff}[2]{\frac{d #1}{d #2}}
\let\oldepsilon\epsilon
\let\epsilon\varepsilon

Important notions
-----------------

Functions. $\R^n\to \R$
:   send *points* to *numbers* (scalars)

Curves. $I \to \R^n$
:   send *numbers* to *points* (in space)

Vector fields.  $\R^n \to \R^n$
:   sends *points* to *vectors* (in the __same__ dimension)

Baby linear algebra and geometry
================================

Babby's first vectors
---------------------

Read $\comp_{\vec{a}} \vec{b}, \proj_{\vec{a}} \vec{b}$ leftwards as component/projection of $\vec{b}$ on $\vec{a}$.
\begin{align*}
    \comp_{\vec{a}} \vec{b} &= \frac{\vec{a}\cdot\vec{b}}{\norm{\vec{a}}} \\
    \proj_{\vec{a}} \vec{b} &= \frac{\vec{a}\cdot\vec{b}}{\vec{a}\cdot\vec{a}}  \\
    \vec{a}\cdot\vec{b} &= \norm{\vec{a}}\norm{\vec{b}} \cos \theta \\
    \norm{\vec{a}}^2 &= \vec{a}\cdot\vec{a} \\
    \norm{\vec{a}\times\vec{b}} &= \norm{\vec{a}}\norm{\vec{b}} \sin\theta
\end{align*}

-  Use $\times$ to find area of parallelogram or shortest distance to line from point (divide by $\norm{\vec{a}}$).
-  When doing cross product remember to __minus__ the $\vec{j}$ term!
-  The $\cdot$ and $\times$ operators are bilinear.
-  Triple product = determinant of $3$ vectors.

(Translated) subspaces
----------------------

Any hyperspace can be described by a normal vector $\vec{n}$.
Equation of any hyperspace can be given by $\vec{r}\cdot\vec{n} = 0$, translation gives
$\vec{n}\cdot\vec{r} = \vec{n}\cdot\vec{r}_0$
where $\vec{r}_0$ is the position vector of any given point in the hyperspace.

-  Angle between hyperspaces = angle between their normals.
-  Shortest distance between $Q$ and $\Pi$ = $\comp_{\vec{n}} \VEC{AQ}$ on $\vec{n}$ where $A\in \Pi$.

Vector functions
----------------

-  Differentiate vector $\vec{r}(t)$ component-wise.
-  Product rule generalises to $\cdot$ and $\times$, proof by bloody expansion.
-  Arc length formula. For arc traced by $\vec{r}(t)$, from $a \leq t \leq b$, arc length is $\int_a^b \norm{\vec{r}'(t)} \ dt$.

Surfaces & Multivariable functions
==================================

Cylinder.
:   Exists plane $\Pi$ such that all planes parallel to $\Pi$ intersect $S$ in the same curve. (Common cylinders are those with a free variable.)

----------------------------------------------------------------------------------------------------------------
Quadric surface              Shape                     Properties
--------------------------- -------------------------- ---------------------------------------------------------
$x^2 + y^2 = z$             Elliptic paraboloid        Opens up on the axis of the linear variable

$x^2 - y^2 = z$             Hyperbolic paraboloid      "Saddle" opens up the direction of the linear variable

$x^2 + y^2 + z^2=1$         Ellipsoid                  Nothing special

$x^2 + y^2 - z^2=0$         (Elliptic) cone            Opens up on the axis with negative coefficient

$x^2 + y^2 - z^2=1$         1-sheet hyperboloid        $\uparrow$ same

$x^2 + y^2 - z^2=-1$        2-sheet hyperboloid        $\uparrow$ same
----------------------------------------------------------------------------------------------------------------

Table: Scaling denominators are omitted. If they are negative for linear terms, like $z/-c$, mentally flip everything.

If all else fails, fix $1$ variable and trace the other two.

Limits & Continuity
===================

-  To show limit does not exist at $\vec{a}$, trace along several different paths (*any* line that passes through $\vec{a}$ will do) and get a contradiction (not well-defined).
-  To show limit exist, use limit laws or squeeze.\    
   On limit laws: for $\set{\text{functions of }\vec{x}\text{ with limit at }\vec{a}}$,
   *  $\lim_{\vec{x}\to\vec{a}}$ is **linear**.
   *  $\lim_{\vec{x}\to\vec{a}}$ respects $\cdot$ and $/$ provided $\lim$ denominator is not $0$.
-  $f$ is continuous at $\vec{a}$ iff substitution property
$$ \lim_{\vec{x} \to \vec{a}} f(\vec{x}) = f(\vec{a}) $$
-  Subspace of continuous functions is __closed__ under $\pm,\cdot,/$ and $\circ$.
-  Standard continuous functions are polynomials, trig, exp and rational functions.

Differential Calculus
=====================

Partial derivatives
-------------------

Suppose $f: \R^n \to \R$, let $(e_i)_{i=1,2,\dots,n}$ be standard basis for $\R^n$.
$$D_i f = \pd{f}{e_i} =_{\text{def}} \lim_{h\to 0} \frac{f(\vec{v} + he_i) - f(\vec{v})}{h}.$$
When differentiating normally is too hard use $\uparrow$.

__Clairaut's Theorem.__ 
Partial differentiation operators *commute*.
$\forall i,j.~ D_i D_j = D_j D_i$.

Differentiability and linear approximation
------------------------------------------

$f: \R^n \to \R$ is __differentiable__ at $\vec{a}$ iff

*  *all* the partial derivatives $D_1 f,\dots,D_n f$ (these terms are in fact limits) exist at the point $\vec{a}$, **and**
*  there exists a function $\epsilon: \R^n \to \R^n$ (defined for small $\vec{h}$ such that)
$$\lim_{\vec{h}\to\vec{0}} \epsilon(\vec{h}) = \vec{0},\quad\textbf{and}$$
$$f(\vec{a} + \vec{h}) - f(\vec{a}) = \nabla f(\vec{a})\cdot \vec{h} + \epsilon(\vec{h})\cdot \vec{h}$$
post-composing $\epsilon$ with tuple-selection map will give $n$ functions, and
*  in $2$ variables where $\vec{h} = (\Delta x, \Delta y)$, it simplifies to Stewart's shit-tier definition
$$\Delta z = f_x \Delta x + f_y \Delta y + \epsilon_1(\vec{h}) \Delta x + \epsilon_2(\vec{h}) \Delta y$$

On differentiability, __only__ these implications hold, at a point $\vec{x}\in \R^n$,

1.  all partial derivatives *continuous* at $\vec{x}$ $\implies$ $f$ differentiable at $\vec{x}$,
2.  $f$ differentiable $\implies$ $f$ continuous,
3.  $f$ differentiable $\implies$ all partial derivatives exist.

Suppose $f$ is differentiable at $\vec{a}$, then for a small vector $\vec{h}$,
$$ f(\vec{a} + \vec{h}) \approx f(\vec{a}) + \nabla f(\vec{a}) \cdot \vec{h} $$

Chain rule
----------

$f$ is a differentiable function, $\vec{r}(t)$ is a differentiable curve.
Then $f(\vec{r}(t))$ is differentiable and
$$ \frac{df(\vec{r}(t))}{dt} = \nabla f(\vec{r}(t))\cdot \vec{r}'(t),$$
or in terms of coordinates, if $\vec{r}(t) = \braket{r_1(t),\dots,r_n(t)}$,
$$ \frac{df(\vec{r}(t))}{dt} = \pd{f}{r_1}\diff{r_1}{t} + \dots + \pd{f}{r_n}\diff{r_n}{t}.$$

In general, suppose $f(\vec{x}(\vec{t}))$ is differentiable and $\vec{x}(\vec{t}) = \braket{x_1(\vec{t}),\dots,x_n(\vec{t})}$, then
$$ \pd{f}{t_i} = \pd{f}{x_1}\pd{x_1}{t_i} + \dots + \pd{f}{x_n}\pd{x_n}{t_i}.$$
(remember as adding all paths traced from $f$ to $t_i$.)

Corollary.
:   $\nabla f =_{\text{def}} \braket{ D_1f , \dots , D_nf }$ is *always* normal to the level curve/surface of $f$.

Implicit differentiation.
:   Suppose $F(x,y,z) = 0$ implicitly defines $z = \phi(x)$, then by chain rule (assuming $y$ independent)
$$\pd{F}{x} + \pd{F}{z}\pd{z}{x} = 0.$$

Tangent Plane shortcut.
:   For $f: \R^2\to \R$, vector normal to tangent plane at $(a,b)$ is given by
$$ \braket{1,0,f_x(a,b)} \times \braket{0,1,f_y(a,b)} = \braket{-f_x(a,b),-f_y(a,b), 1}. $$


Directional derivatives
----------------------------

Given a __unit vector__ $\vec{u}$, the derivative of $f$ in the direction of $\vec{u}$ is
$$ D_{\vec{u}} f =_\text{def} \nabla f \cdot \vec{u}.$$

Min/max rate of change of $f$ at a point $P$,

-  max rate of change is in direction $\nabla f$, with magnitude $\norm{\nabla f(P)}$, conversely
-  min rate of change is in direction $-\nabla f$, with magnitude $-\norm{\nabla f(P)}$


Extrema
-------

(Local min/max was not defined rigorously so I assume no1cur.)

Critical point.
:   $P$ is a critical point of $f$ if $\nabla f(P) = \vec{0}$.

Boundary point.
:   $P$ is a boundary point of $S$ if every open ball centered at $P$ contains a point in $S$ and a point not in $S$.

Closed set.
:   $S$ is closed if it contains all boundary points.

Bounded.
:   There exists $b$ such that for any point $X$ in set, we have $\norm{X} \leq b$.

__Extreme Value Theorem.__ For a function $f$ defined on a closed and bounded set $S$, $f$ has global maximum and minimum in $S$.

__Closed Interval Method__ for $f:D\to \R$, where $D$ is closed and bounded.

1.  Find values of $f$ at all critical points in $D$.
2.  Trace values of $f$ at each boundary of $D$.
3.  min/max

### Lagrange Multipliers

Suppose $f,g$ are differentiable functions where $\nabla g \ne \vec{0}$.
Optimisation: find min/max $f$ (objective) given $g(x,y) = k$ (constraint).

1.  solve $\nabla f(x,y) = \lambda \nabla g(x,y)$, where $\lambda$ is Lagrange Multiplier to be determined.
2.  Evaluate $f$ at all points found, proceed to min/max.

Higher-dimensional cases are analogous.

Integral Calculus
=================

Additive property of integrals
------------------------------

<!---
Finite regions.
:   Whenever $D\in \R^2$ is a finite disjoint union of smaller regions, say
$D = \bigsqcup_{i=1}^k D_i$, then
$$\iint_D f(x,y)\ dA = \sum_{i=1}^k \iint_{D_i} f(x,y)\ dA.$$

Sequence of curves.
:   A __path__ $\mathcal{C}$ is a finite sequence of curves $\set{C_1,\dots,C_m}$
where end point of each $C_i$ is start point of $C_{i+1}$.
The path integral is then defined to be
$$\int_{\mathcal{C}} \vec{F} = \int_{C_1} \vec{F} + \dots + \int_{C_m} \vec{F}.$$

Union of surfaces.
:   blabla surface = union of surfaces only touching at boundary $\implies$ integral = sum of integrals
-->

Let $\mathcal{F} = \set{R_i}_{i\in I}$ be a finite family of sets (regions, curves, surfaces) such that $R_i\cap R_j$ is of measure $0$ whenever $i\ne j$, then
$$\int_{\mathcal{F}} = \sum_{i\in I} \int_{R_i}$$
(obvious from Riemann sum definition).


Double Integrals
----------------

If domain of $f$ can be represented as $D = \set{(x,y): a\leq x\leq b, h_1(x)\leq y\leq h_2(x)}$, then
$$ \iint_D f(x,y)\ dA = \int_a^b \int_{h_1(x)}^{h_2(x)} f(x,y)\ dy\ dx.$$

### Polar Regions

If the polar region of integral is given as $D = \set{(r,\theta): 0\leq a\leq r\leq b, h_1(r)\leq \theta\leq h_2(r)}$ (angle depends on radius), then
$$\iint_D f(r,\theta)\ dA = \int_a^b \int_{h_1(r)}^{h_2(r)} f(r, \theta)r \ d\theta\ dr.$$
On the other hand when radius depends on angle, say
$D = \set{(r,\theta): \alpha\leq\theta\leq\beta, h_1(\theta)\leq r\leq h_2(\theta)}$,
$$\iint_D f(r,\theta)\ dA = \int_\alpha^\beta \int_{h_1(\theta)}^{h_2(\theta)} f(r, \theta)r \ dr\ d\theta.$$

Triple Integrals
----------------

*Synopsis.* Reduce the triple integral into a double integral by projecting the domain of integration on a coordinate plane.

Suppose $D\in\R^2$ such that $E = \set{(x,y,z): (x,y)\in D, h_1(x,y) \leq z \leq h_2(x,y)}$,
then an integral over $E$ can be reduced to a double integral by doing
$$\iiint_E f(x,y,z)\ dV = \iint_D\left[ \int_{h_1(x,y)}^{h_2(x,y)} f(x,y,z)\ dz\right]\ dA.$$

### Cylindrical coordinates
Nothing much, use $\uparrow$ to reduce into a double integral over polar region.

### Spherical coordinates
$$(\rho,\theta,\phi)\mapsto (\rho\sin\phi\cos\theta,\rho\sin\phi\sin\theta,\rho\cos\phi)$$

1. This shit simplifies computations involving **spheres** (no shit) and **cones**.
2. the Jacobian is
$$dx\ dy\ dz = \rho^2\sin\phi\ d\rho\ d\theta\ d\phi$$

Interlude on Linear Algebra
===========================

Suppose $T: (u,v)\mapsto (x,y)$, then
$$\iint_{T(R)} f(x,y)\ dx\ dy = \iint_{R} (f\circ T)(u,v)\abs{\det(T')}\ du\ dv$$
where $T' = \displaystyle\pd{(x,y)}{(u,v)}$.
(I need a commutative diagram for this shit.)

Find $R$ by tracing $T^{-1}$ along boundary regions of $T(R)$.
Higher-dimensional cases are analogous.

Vector Calculus
===============

Potential functions
-------------------

Conservative.
:   $\vec{F}$ is a conservative vector field if there exists $\varphi: \R^n\to\R$ such that $\vec{F} = \nabla \varphi$.

Test for conservativeness.
:   Whenever $\vec{F}$ is defined in an *open* and *simply-connected* (no holes) region. Suppose $\vec{F} = \braket{D_1\varphi,D_2\varphi,\dots,D_n\varphi}$ for some $\varphi$, then test if all 2nd-order partial derivatives of $\varphi$ indeed commute.
:   In short, $\nabla\times\vec{F} = \vec{0}$.

Find potential function when $\vec{F}$ is defined on box.
:   If eye power fails, do partial integrations on $\vec{F}$.

Fundamental Theorem for Curve Integrals.
:   If there exists $\varphi: \R^n\to\R$ such that $\vec{F} = \nabla \varphi$,
    let $P,Q$ be start and end of curve $C$ respectively, then
    $$\int_{P,C}^Q \vec{F}\cdot d\vec{r} = \varphi(Q) - \varphi(P).$$
:   __Corollaries.__
:   1. When $\vec{F}$ admits a potential function, integral of $F$ is independent of the path $C$ joining $P$ and $Q$.
    2. If $C$ is a closed path (same start/end point) and $\int_C \vec{F} \ne 0$, then $\vec{F}$ is not conservative. (contrapositive)

Line & Surface integrals
------------------------

__Notation.__ Let everything be as differentiable as needed.

1. $f$ denotes a scalar field.
2. $\vec{F}$ denotes a vector field.
3. $C$ denotes a smooth ($C^1$) curve.
    * Let $\vec{r}(t): I\to\R^n$ be a parametrisation.
4. $S$ denotes a surface.
    * Let $\vec{r}(u,v): D \to\R^3$ be a parametrisation.
    * Then $\vec{n} = \pm \displaystyle\frac{\vec{r}_u \times \vec{r}_v}{\norm{\vec{r}_u \times \vec{r}_v}}$ is a unit normal vector

Formulas will be
\begin{gather*}
    \int_C f \ d\vec{r} = \int_I f(\vec{r}(t)) \norm{\vec{r}'(t)}\ dt 
    \tag*{(1)} \\
    \int_C \vec{F}\cdot d\vec{r} = \int_I \vec{F}(\vec{r}(t))\cdot\vec{r}'(t)\ dt
    \tag*{(2)} \\
    \iint_S f \ dS = \iint_D f(\vec{r}(u,v)) \norm{\vec{r}_u \times \vec{r}_v}\ dA
    \tag*{(3)} \\
    \iint_S \vec{F}\cdot \ d\vec{S} = \iint_D \vec{F}(\vec{r}(u,v))\cdot \left(\vec{r}_u \times \vec{r}_v\right) \ dA
    \tag*{(4)}
\end{gather*}

#### Notes. {-}
(2) Computationally we write (example in $2$-space) as symbolic shorthand
$$\int_C \vec{F}\cdot d\vec{r} = \int_I f_1\ dx + f_2\ dy.$$

(3) Computations can be skipped if $\vec{F}$ is conservative, refer to section above.

(4) Be careful of orientation conventions for $\vec{n}$, possibly switching the cross product.

    When $\vec{r}(x,y) = \braket{x,y,g\left(x,y\right)}$, $\vec{r}_x \times \vec{r}_y = \braket{-g_x, -g_y, 1}$.
Computationally rewrite (4) as
$$\iint_S \vec{F}\cdot \ d\vec{S} = \pm \iint_D -f_1 g_x - f_2 g_y + f_3 \ dy\ dx.$$

Divergence and curl
-------------------

Divergence.
:   $$\nabla\cdot \vec{F} = \pd{f_1}{x} + \pd{f_2}{y} + \pd{f_3}{z}$$

Curl.
:   $$\nabla\times \vec{F} = \begin{vmatrix}
\vec{i}&\vec{j}&\vec{k}\\
\pd{}{x}&\pd{}{y}&\pd{}{z}\\
f_1&f_2&f_3
\end{vmatrix}$$

For any vector field $\vec{F}$, $\nabla\cdot\left(\nabla\times\vec{F}\right) = 0$

Theorems that let you interchange stuff
--------------------------------------

Green's Theorem (2d).
:   Let $C$ be a closed path
and $A$ be region bounded by $C$,
$\vec{F} = \braket{f_1,f_2}$,
$$\oint_C \vec{F} = \oint_C f_1\ dx + f_2\ dy = \iint_A \left(\pd{f_2}{x} - \pd{f_1}{y}\right) \ dy\ dx.$$
Convention: $A$ lies to the left of the curve $C$.

Gauss' Divergence Theorem.
:   Let $S$ be boundary surface of $E$ with outward orientation, then
$$\iint_S \vec{F}\cdot d\vec{S} = \iiint_E \nabla\cdot\vec{F} \ dV.$$

Stokes' Theorem.
:   Let $C$ be boundary curve of surface $S$ with unit normal $\vec{n}$.
Let $C$ be positively oriented ($\vec{r}'(t)\times \vec{n}$ points __out__), then
$$\oint_C \vec{F}\cdot d\vec{r} = \iint_S \nabla\times\vec{F}\cdot d\vec{S}.$$

Trig identities
==============
$$
\begin{pmatrix}
    \cos(\alpha+\beta) &-\sin(\alpha+\beta) \\
    \sin(\alpha+\beta) & \cos(\alpha+\beta)
\end{pmatrix}
=
\begin{pmatrix}
    \cos\alpha & -\sin\alpha \\
    \sin\alpha & \cos\alpha
\end{pmatrix}
\begin{pmatrix}
    \cos\beta & -\sin\beta \\
    \sin\beta & \cos\beta
\end{pmatrix}$$

Pre-computing spherical stuff
-----------------------------

Fix $\rho$, let $\vec{r}$ parametrise something,
\begin{align*}
    \vec{r}(\phi,\theta) &= \rho\begin{pmatrix}
        \sin\phi\cos\theta\\
        \sin\phi\sin\theta\\
        \cos\phi
    \end{pmatrix}; &
    \vec{r}_{\phi} &= \rho\begin{pmatrix}
        \cos\phi\cos\theta \\
        \cos\phi\sin\theta \\
        -\sin\phi
    \end{pmatrix} &
    \vec{r}_{\theta} &= \rho\begin{pmatrix}
        -\sin\phi\sin\theta \\
        \sin\phi\cos\theta \\
        0
    \end{pmatrix}
\end{align*}
then $\vec{r}_{\phi}\times \vec{r}_{\theta}$ points __outwards__, and
\begin{align*}
    \vec{r}_{\phi}\times \vec{r}_{\theta}
    &= \rho^2 \begin{pmatrix}
        -\sin^2\phi \cos\theta \\
        \sin^2\phi\sin\theta \\
        \cos\phi\sin\phi
    \end{pmatrix}
\end{align*}
