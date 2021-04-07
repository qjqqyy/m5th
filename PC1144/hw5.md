---
title: PC1144 Homework 5
author: Qi Ji (A0167793L)
date: 7th April 2021
...

# (a)

\newcommand*{\atom}[3]{{}^{#2}_{#3}\mathsf{#1}}

By conservation of energy-mass, the total energy released is
\begin{align*}
    E &= \left[M(\atom{Po}{210}{\phantom{2}84}) - M(\atom{Pb}{206}{\phantom{2}82}) - M(\atom{He}{4}{2})\right]c^2 \\
    &= (209.9828736 - 205.9744653 - 4.002603254)uc^2 \\
    &= 0.005805046 uc^2 \\
    &= 5.407 \ \mathrm{MeV}
\end{align*}

For recoil, let \(M = M(\atom{Pb}{206}{\phantom{2}82})\) and \(m = M(\atom{He}{4}{2})\),
\begin{align*}
    \frac{M(\atom{Pb}{206}{\phantom{2}82})) V^2}2 &= \frac{M(\atom{He}{4}{2}) E}{M(\atom{Pb}{206}{\phantom{2}82}) + M(\atom{He}{4}{2})} \\
    V^2 &= \frac{2 m E}{M(M + m)} \\
        &= 2 \frac{4.002603254}{205.9744653} \frac{0.005805046 c^2}{205.9744653 + 4.002603254} \\
    V &= 3.108 \times 10^5\ \mathrm{m}\,\mathrm{s}^{-1} 
\end{align*}
the fraction of total energy is given by
\[ \frac{m}{M + m} = 0.019062097.\]


# (b)

For \(\atom{Th}{232}{\phantom{2}90}\) to decay into \(\atom{Pb}{208}{\phantom{2}82}\),
it loses \(24\) nucleons,
so there are \(6\) \(\alpha\)-decays.

If \(\atom{Th}{232}{\phantom{2}90}\) undergoes six \(\alpha\)-decays,
its atomic number would have been \(78\),
so there are \(4\) \(\beta\)-decays.

# (c)

Let \(N_1(t)\) denote number of \(\atom{Bi}{210}{\phantom{2}83}\) atoms at time \(t\).
Assuming one month is 30 days, we have \(2592000\) seconds in a month.

Initially, there are
\[ N_0 = N_1(0) = \frac{10^{-6}}{209.9841204 u} = 2.86790294 \times 10^{18} \]
many \(\atom{Bi}{210}{\phantom{2}83}\) atoms.

So the number of \(\atom{Bi}{210}{\phantom{2}83}\) **beta decays per second** after one month is given by
\begin{align*}
    N_1(t) &= N_0 e^{-\lambda_1 t} \\
    A_1(t) &= \lambda N_1(t) \\
           &= \lambda N_0 e^{-\lambda_1 t} \\
    A_1(2592000) &= \lambda_1 N_0 e^{-\lambda_1 2592000} \\
                 &= 7.25\times 10^{10} \ \mathrm{Bq}.
\end{align*}

Let \(N_2(t)\) denote number of \(\atom{Po}{210}{\phantom{2}84}\) atoms at time \(t\).
\(N_2(t)\) is governed by the differential equation
\[ \frac{dN_2(t)}{dt} = \lambda_1 N_1(t) - \lambda_2 N_2(t) \]
and we know that \(N_2(0) = 0\).

Solving the DE,
\begin{align*}
    \frac{dN_2(t)}{dt} &= \lambda_1 N_0 e^{-\lambda_1 t} - \lambda_2 N_2(t) \\
    e^{\lambda_2 t} \frac{dN_2(t)}{dt} + e^{\lambda_2 t} \lambda_2 N_2(t) &= \lambda_1 N_0 e^{(\lambda_2-\lambda_1) t} \\
    \frac{d}{dt}\left[ e^{\lambda_2 t} N_2(t) \right] &= \lambda_1 N_0 e^{(\lambda_2-\lambda_1) t} \\
    e^{\lambda_2 t} N_2(t) &= \frac{\lambda_1 N_0}{\lambda_2 - \lambda_1} e^{(\lambda_2-\lambda_1) t} + C
\end{align*}
substituting \(N_2(0) = 0\) to find \(C\), we have
\[ C = -\frac{\lambda_1 N_0}{\lambda_2 - \lambda_1} \]
and we have the expression
\begin{align*}
    e^{\lambda_2 t} N_2(t) &= \frac{\lambda_1 N_0}{\lambda_2 - \lambda_1} \left( e^{(\lambda_2-\lambda_1) t} - 1 \right) \\
    N_2(t) &= \frac{\lambda_1 N_0}{\lambda_2 - \lambda_1} \left( e^{-\lambda_1 t} - e^{-\lambda_2 t} \right)
\end{align*}
now we can find the number of \(\atom{Po}{210}{\phantom{2}84}\) **alpha decays per second** after one month,
\begin{align*}
    A_2(t) &= \lambda_2 N_2(t) \\
           &= \frac{\lambda_2 \lambda_1 N_0}{\lambda_2 - \lambda_1} \left( e^{-\lambda_1 t} - e^{-\lambda_2 t} \right) \\
    A_2(2592000) &= 1.46 \times 10^{11}\ \mathrm{Bq}.
\end{align*}
