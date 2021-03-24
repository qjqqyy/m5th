---
title: PC1144 Homework 4
author: Qi Ji (A0167793L)
date: 24th March 2021
...

\newcommand*{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand*{\paren}[1]{\left( #1 \right)}
\newcommand*{\sq}[1]{\left[ #1 \right]}

# (a)

As initial radius was \(a_0 = 0.529\times 10^{-10}\ \mathrm{m}\),
the total energy of the atom is given by
\[ E = -\frac{e^2}{8\pi\epsilon_0 r(t)} \]
by conservation of energy, \(\frac{dE}{dt} = -P\), we can compute
\[ \frac{dE}{dt} = \frac{e^2}{8\pi\epsilon_0 r(t)^2} r'(t) \]
note that in the expression for radiated power,
\[ \abs{\vec{w}} = r''(t) \]
so we can combine our equations
\begin{align*}
    \frac{e^2}{8\pi\epsilon_0 r(t)^2} r'(t) &= -\frac{e^2}{6\pi\epsilon_0 c^3} r''(t)^2 \\
    \frac{1}{4 r(t)^2} r'(t) &= -\frac{1}{3 c^3} r''(t)^2
\end{align*}
rearranging,
\[ r'(t) = -\frac43 \frac{r(t)^2 r''(t)^2}{c^3}. \]
Classically we can express \(r''(t)\) in terms of \(r\) by Coulomb's law as
\[ r''(t) = \frac{F}{m} = \frac{e^2}{4\pi\epsilon_0 m r^2} \]
and rewrite our equation as
\[ r'(t) = -\frac{e^4}{12 \pi^2 \epsilon_0^2 m^2 c^3} r(t)^{-2}. \]
Now the time is given by
\begin{align*}
    t &= \int_{a_0}^0 \frac{dt}{dr}\ dr \\
      &= -\frac{12 \pi^2 \epsilon_0^2 m^2 c^3}{e^4} \int_{a_0}^0 r^2\ dr \\
      &= -\frac{4 \pi^2 \epsilon_0^2 m^2 c^3}{e^4} \sq{r^3}^0_{a_0} \\
      &= \frac{4 \pi^2 \epsilon_0^2 m^2 c^3}{e^4} a_0^3 \\
      &= 1.55\times 10^{-11}\ \mathrm{s}.
\end{align*}


# (b)

Assume that the mean value of kinetic energy is quantised as
\[ K = \frac{nh f_{\text{orb}}}2. \]
\(K\) is related to \(L_z\) by the relation
\[ L_z = rmv; K = \frac12 mv^2 \implies L_z = \frac{2Kr}{v}. \]
Combining expressions we obtain
\[ L_z = \frac{2r}{v} \frac{nh f_{\text{orb}}}2 = \frac{rnh}{v} f_{\text{orb}} \]
but as \( f_{\text{orb}} = \frac1T\) and the period \(T = \frac{2\pi r}{v}\), we have
\[ f_{\text{orb}} = \frac{v}{2\pi r} \]
and substituting into expression for \(L_z\) gives us
\[ L_z = \frac{rnh}{v} \frac{v}{2\pi r} = \frac{nh}{2\pi} = n\hbar. \]


# (c)

The energy difference is given by
\[ \Delta E = 2 \mu_B B = 1.41\times 10^{-23}\ \mathrm{J}. \]

# (d)

\[ f = \frac{c}{\lambda} = \frac{3Rc}{4} \paren{Z - 1}^2 \]
computing, we have \(Z - 1 = 25\), so \(Z = 26\) and the element is **iron**.
