---
title: PC1144 Homework 2
author: Qi Ji (A0167793L)
date: 17th Feb 2021
...

# (a)

First compute total energy of system, let \(\gamma\) be the Lorentz factor of the positron,
\[ E_{\text{total}} = E + m_e c^2 = (\gamma + 1) m_e c^2. \]
By conservation of energy, and assuming energy of both photons are the same,
\[ E_{\text{photon}} = \frac{\gamma + 1}{2} m_e c^2. \]
Now we can compute the momentum of each photon as
\[ p_{\text{photon}} = \frac{E_{\text{photon}}}{c} = \frac{\gamma + 1}{2} m_e c. \]
As the total momentum of the system is \(\gamma m_e v\) initially,
by conservation of momentum (in the horizontal direction),
\begin{align*}
    \gamma m_e v
    &= 2 \cos\left(\frac{\alpha}{2}\right) p_{\text{photon}} \\
    &= 2 \cos\left(\frac{\alpha}{2}\right) \frac{\gamma + 1}{2} m_e c \\
    \cos\left(\frac{\alpha}{2}\right)
    &= \frac{\gamma}{\gamma+1}\frac{v}{c} \\
    \alpha &= 2\cos^{-1} \left( \frac{\gamma}{\gamma+1}\frac{v}{c} \right) \\
           &= 2\cos^{-1} \left( \frac{v}{c + \sqrt{c^2-v^2}} \right)
\end{align*}

# (b)

The minimum energy is given by
\[ \min_{\Delta p, \Delta x} \left[ \frac{(\Delta p)^2}{2m} + \frac12 k(\Delta x)^2 \right] \]
where \(\Delta p\Delta x \geq \frac{\hbar}2\).
To achieve minimum, we let equality hold in the uncertainty principle, so we substitute \(\Delta p = \frac{\hbar}{2(\Delta x)}\) and compute
\[ \min_{\Delta x} \left[ \frac{\hbar^2}{8m(\Delta x)^2} + \frac12 k(\Delta x)^2 \right]. \]
To minimise, differentiate the expression w.r.t. \(\Delta x\)
\[ -\frac{\hbar^2}{4m(\Delta x)^3} + k(\Delta x) = 0 \]
solving, we find that
\[ \Delta x = \sqrt[4]{\frac{\hbar^2}{4mk}}. \]
To check that this point is minimum we do second derivative test
\[ \frac{3\hbar^2}{4m(\Delta x)^4} + k > 0 \]
as the second derivative is always positive we have a minimum, therefore the minimum energy is
\[
    \frac{\hbar^2}{8m}\sqrt{\frac{4mk}{\hbar^2}} + \frac12 k\sqrt{\frac{\hbar^2}{4mk}}
    = \frac{\hbar}{2}\sqrt{\frac{k}{m}}.
\]

# (c)

Let \(A\) be surface area of filament,
by Stefan-Boltzmann law we have
\[ I = \frac{75}{A} = \sigma T^4 \]
solving, we have
\begin{align*}
    A &= \frac{75}{5.67\times 10^{-8} \cdot (3000)^4} \\
      &= 1.6\times 10^{-5}\ \mathrm{m}^{2}.
\end{align*}

# (d)

The maximum kinetic energy \(K_{\max}\) is given by
\begin{align*}
    K_{\max} &= hf - W \\
             &= \frac{hc}{\lambda} - W \\
             &= \frac{6.626\times 10^{-34} \cdot 2.998\times 10^{8}}{350\times 10^{-9}}\ \mathrm{J} - 2.24\ \mathrm{eV} \\
             &= 5.676\times 10^{-19}\ \mathrm{J} - 2.24\ \mathrm{eV} \\
             &= 3.54\ \mathrm{eV} - 2.24\ \mathrm{eV} \\
             &= 1.30\ \mathrm{eV}
\end{align*}
