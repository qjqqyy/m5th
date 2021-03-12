---
title: PC1144 Homework 3
author: Qi Ji (A0167793L)
date: 11th March 2021
...

\newcommand*{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand*{\paren}[1]{\left( #1 \right)}
\newcommand*{\sq}[1]{\left[ #1 \right]}

# (a)

For particle in ground state of infinite square well potential (particle in a box),
we have its wavefunction given by
\[ u(x) = \sqrt{\frac2L}\sin\left(\frac{\pi x}{L}\right) \]
for \(0 \leq x \leq L\).

The probability that the particle will be found in the region \(0 < x < \frac{L}3\) is given by
\begin{align*}
    \int_0^{L/3} \abs{u(x)}^2\ dx
    &= \frac2L \int_0^{L/3} \sin^2 \paren{\frac{\pi x}{L}}\ dx \\
    &= \frac2L \sq{\frac{x}{2} - \frac{L\sin \paren{\frac{2\pi x}{L}}}{4\pi}}_0^{L/3} \\
    &= \frac2L \sq{\frac{L}{6} - \frac{L\sin \paren{\frac{2\pi}{3}}}{4\pi}} \\
    &= \frac{1}{3} - \frac{\sqrt{3}}{4\pi}.
\end{align*}

# (b)

We have
\begin{align*}
    u(x) &= Ae^{-\beta x^2} \\
    u'(x) &= -2A\beta x e^{-\beta x^2} \\
    u''(x) &= 2A\beta (2\beta x - 1) e^{-\beta x^2} \\
           &= 2\beta(2\beta x - 1) u(x)
\end{align*}
solving time-independent Schrödinger equation we have
\begin{align*}
    -\frac{\hbar}{2m} 2\beta(2\beta x - 1)  + V(x) &= E \\
    V(x) - \frac{\hbar}{m}(2\beta^2 x - \beta) &= E
\end{align*}
substituting \(V(0) = 0\) we obtain \(E = \frac{\hbar\beta}{m}\),
then we have expression for \(V(x)\) as
\[ V(x) = \frac{2\hbar\beta^2}{m}x. \]

# (c)

In each region the solution to time-independent Schrödinger equation takes the form
\[
    \psi(x) = \begin{cases}
        Ae^{i k_1 x} + Be^{-i k_1 x} &\text{ in region 1} \\
        Ce^{i k_2 x} + De^{-i k_2 x} &\text{ in region 2} \\
        Fe^{i k_1 x} &\text{ in region 3}
    \end{cases}
\]

where the wave number in region 1 and 3 is \(k_1 = \frac{\sqrt{2mE}}{\hbar}\),
in region two we have \(k_2 = \frac{\sqrt{2m(E + V_0)}}{\hbar} = \frac{2\pi}{\lambda_2} \).
As the beam is incident in the positive \(x\)-direction, there is only right-moving wave in region 3.

As \(\phi(x)\) is continuous and differentiable at \(x =0\) and \(x=L\) we have
\begin{align*}
    A + B &= C + D \\
    i k_1 A - i k_1 B &= i k_2 C - i k_2 D \\
    Ce^{i k_2 L} + D e^{-i k_2 L} &= F e^{i k_1 L} \\
    i k_2 Ce^{i k_2 L} - i k_2 D e^{-i k_2 L} &= i k_1 F e^{i k_1 L}
\end{align*}
transmission coefficient is given by \(T = \abs{F/A}^2\).
Solving these equations then rewriting \(k_1,k_2\) in terms of \(E, V_0, \lambda_2\) we obtain
\[ T = \frac{4E(E+V_0)}{4E(E+V_0) + V_0^2\sin^2\paren{\frac{2\pi L}{\lambda_2}}}. \]
as \(2L = \lambda_2\) it follows that \(T = 1\) and \(R = 0\).
