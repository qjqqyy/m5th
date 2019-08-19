---
title: MA2104 Assignment 4
author: Qi Ji (A0167793L) -- T03
date: 12th April 2018
classoption:
- 10pt
...

\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\let\setminus\smallsetminus
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\eval}[1]{\left[ #1 \right]}
\newcommand{\qed}{\hfill$\blacksquare$}
\newcommand{\tagQED}{\tag*{$\blacksquare$}}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}
\newcommand{\pd}[2]{\frac{\partial #1}{\partial #2}}

<!---
Originally typeset in $\LaTeX$ by Tee Ming Hong.
-->

Question 1
==========
Find
$$\iiint_E z(x^2+y^2+z^2)^{- 3/2} \ dV$$ where
$$E := \set{ (x,y,z) : x^2 + y^2 + z^2 \leq 16, z \geq 2 }.$$

Upper bound for $\phi$ happens at $z=2$, $x^2 + y^2 = 12$,
then $\rho = 4$ and
$\phi = \arccos( 2/4 ) = \pi/3$.

Since $z = \rho \cos\phi$ and $2 \leq z$, we have $2\sec\phi \leq \rho$.

Hence, converting to spherical coordinates, we have
$$ E = \set{(\rho\sin\phi\cos\theta,\rho\sin\phi\sin\theta,\rho\cos\theta):
0\leq\theta\leq2\pi, 0\leq\phi\leq\frac\pi3,2\sec\phi\leq\rho\leq4}$$
then computing the integral, we have
\begin{align*}
    \iiint_E z(x^2+y^2+z^2)^{-3/2}\ dV
    &=\int_0^{2 \pi} \int_0^{\pi/3} \int_{2\sec\phi}^4 \rho \cos\phi (\rho^2)^{- 3/2} (\rho^2 \sin\phi) \ d\rho \ d\phi \ d\theta  \\
    &= 2 \pi \int_0^{\pi/3} \int_{2\sec\phi}^4 \cos\phi \sin\phi \ d\rho \ d\phi  \\
    &= 2 \pi \int_0^{\pi/3} ( 4 - 2\sec\phi ) \cos\phi \sin\phi \ d\phi \\
    &= 4\pi \int_0^{\pi/3} 2\sin\phi\cos\phi - \sin\phi \ d\phi \\
    &= 4\pi \int_0^{\pi/3} \sin(2\phi) - \sin\phi \ d\phi \\
    &= 4 \pi \eval{ - \frac{\cos( 2 \phi )}{2} + \cos\phi }_0^{\pi/3}  \\
    &= 4 \pi \left( \frac{1}{4} + \frac{1}{2} + \frac{1}{2} - 1 \right)  
    = \pi
    \tagQED
\end{align*}

Question 2
==========
Find
$$\iint_D x \ dA$$ where
$$D := \set{ (x,y): x^2+(y-1)^2 \leq 1,  x^2 + y^2 \geq 1 }.$$

To convert polar coordinates, we need the ranges of $(r,\theta)$.
To find range of $\theta$, we first need to find points where the two circles intersect.
By inspection, we have $y=\frac12$.
Solving $x^2 + \frac14 = 1$ gives the solution that $x = \pm \frac{\sqrt{3}}{2}$.
Then
\begin{gather*}
    \arctan\left( \frac1{\sqrt{3}} \right)\leq \theta \leq \arctan\left(-\frac1{\sqrt{3}} \right)   \\
    \frac\pi6 \leq \theta \leq \frac{5\pi}6
\end{gather*}

Next find bounds for $r$, it is obvious that $r \geq 1$, it remains to find upper bound.
\begin{gather*}
    x^2 + (y-1)^2 \leq 1    \\
    x^2 + y^2 - 2y \leq 0   \\
    r^2 \leq 2r \sin\theta  \\
    r \leq 2\sin\theta
\end{gather*}
because $r\geq 1$. So
$$D = \set{(r\cos\theta,r\sin\theta): \frac\pi6\leq\theta\leq\frac{5\pi}6, 1\leq r\leq2\sin\theta}$$

Therefore,
\begin{align*}
    \iint_D x\ dA
    &= \int_{{\pi}/{6}}^{{5\pi}/{6}} \int_1^{2 \sin\theta} r \cos\theta\, r \ dr \ d\theta   \\
    &=  \int_{{\pi}/{6}}^{{5\pi}/{6}} \cos\theta \eval{ \frac{r^3}{3} }_1^{2 \sin\theta} \ dr \\
    &= \int_{{\pi}/{6}}^{{5\pi}/{6}}
        \frac83 \sin^3\theta \cos\theta - \frac13 \cos\theta \ d\theta \\
    &= \eval{ \frac{2}{3} \sin^4\theta - \frac{1}{3} \sin\theta }_{{\pi}/{6}}^{{5\pi}/{6}} \\
    &= 0 \quad \because \sin\left(\frac\pi6\right) = \sin\left(\frac{5\pi}6\right)
    \tagQED
\end{align*}

Question 3
==========
Find
$$\iint_D \frac{2x^2 + y^2}{xy} dA$$
where
$$D := \{ (x,y): 1 \leq \frac{y}{\sqrt{x}} \leq 2,
    1 \leq x^2 + y^2 \leq 4 \}.$$

Let $u = x^2 + y^2$ and $v = \frac{y}{\sqrt{x}}$.
Clearly we have $1\leq u\leq4$ and $1\leq v\leq 2$.
We have
\begin{align*}
    \pd{(u,v)}{(x,y)} &= \begin{vmatrix}
        2x & 2y \\
        -\frac12 yx^{-3/2} & x^{-1/2}
    \end{vmatrix}   \\
    &= 2x^{1/2} + x^{-3/2}y^2
\end{align*}

Using the identity that
$$ \pd{(u,v)}{(x,y)} = \cfrac{1}{\cfrac{\partial(x,y)}{\partial(u,v)}} $$
we can compute the change of variable
\begin{align*}
    \iint_D \frac{2x^2+y^2}{xy} \ dA
    &= \int_1^2 \int_1^4 \frac{2x^2+y^2}{xy}\cdot \frac{1}{2x^{1/2} + x^{-3/2}y^2}  \ du\ dv \\
    &= \int_1^2 \int_1^4 \frac{2x^2+y^2}{y \left( 2x^{3/2} + x^{-1/2}y^2\right) }  \ du\ dv \\
    &= \int_1^2 \int_1^4 \cfrac{2x^2+y^2}{\cfrac{y}{\sqrt{x}} \left( 2x^2 + y^2\right) }  \ du\ dv \\
    &= \int_1^2 \int_1^4 \frac1v \ du\ dv   \\
    &= 3\eval{\ln v}_1^2 = 3\ln 2 \tagQED
\end{align*}
