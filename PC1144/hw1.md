---
title: PC1144 Homework 1
author: Qi Ji (A0167793L)
date: 3rd Feb 2021
...

# (a)

Let event 1 be lamp \(A\) turning on and event 2 for lamp \(B\).
Let frame \(F'\) be the moving along the rod, at velocity \(V\) away from frame \(F\) that is stationary with respect to \(O\).

* To see that lamp \(A\) turns on \(\frac{\gamma L_0V}{c^2}\) seconds before lamp \(B\) in frame \(F\), we compute
  \[ t_2 - t_1 = \gamma\left[(t_2'-t_1') - (x_2'-x_1')\frac{-V}{c^2}\right] = \frac{\gamma L_0V}{c^2} > 0. \]

* Light from lamp \(A\) will reach the observer \(O\) first as it comes on first and the light travels a shorter distance from lamp \(A\).

* To find time delay \(\Delta t\) between the two lamps, first consider an observer \(O_A\) positioned at lamp \(A\) on the moving rod.
  \(O_A\) sees lamp \(B\) come on \(\frac{L_0}c\) seconds after lamp \(A\). We treat it as a pulse with period \(T' = \frac{L_0}{c}\) enamating from end \(A\) of the rod.
  Applying Doppler effect, observer at \(O\) observes that \[ \Delta t = \sqrt{\frac{c+V}{c-V}}T' = \sqrt{\frac{c+V}{c-V}}\frac{L_0}{c}. \]

# (b)

Start from the frame \(F\) where rod 1 is at rest and the other is moving at speed \(V\).
We want to find a frame \(F'\) moving at velocity \(u\) away from rod 1 such that
\[ V' = \frac{V - u}{1 - \frac{u}{c^2}V} \]
and \(V' = u\), this will make both rods have the same length.
Solving for \(u\), we have
\[ u = \frac{c^2}{v}\left(1 - 2\sqrt{1 - \frac{v^2}{c^2}}\right) \]
reject the other quadratic solution since that will make \(u\geq c\).

# (c)

Total energy twice as rest energy, this means
\[ \gamma mc^2 = 2 mc^2 \implies \gamma = 2. \]

Solving
\[ \frac12 = \sqrt{1 - \beta^2} \]
we have
\[ u = \frac{\sqrt{3}}2 c. \]
