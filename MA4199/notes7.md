---
title: Kunen VII Exercises E
author: Qi Ji
date: 30th September 2020
---

\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\restrict}{\upharpoonright}
\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\Im}{\operatorname{Im}}
\newcommand{\trcl}{\operatorname{trcl}}

\newcommand{\V}{\mathbf{V}}
\newcommand{\L}{\mathbf{L}}
\newcommand{\P}{\mathbb{P}}
\newcommand{\one}{\unicode{x1D7D9}} <!--- \mathbb{1} -->
\newcommand{\forces}{\Vdash}
\newcommand{\Fn}{\operatorname{Fn}}
\newcommand{\dom}{\operatorname{dom}}

# E 1

> If \(\P\) is a poset, an *automorphism* of \(\P\) is a \(1-1\) and onto \(i: \P\to\P\) which preserves \(\leq\) and satisfies \(i(\one) = \one\);
> thus also \(i_*(\check{x}) = \check{x}\) for each \(x\).
> \(\P\) is called *almost homogeneous* iff for all \(p,q\in\P\),
> there is an automorphism \(i\) of \(\P\) such that \(i(p)\) and \(q\) are compatible.
> Suppose that \(\P\in M\) and \(\P\) is almost homogeneous in \(M\).
> Show that if \(p\forces \phi(\check{x}_1,\dots,\check{x}_n)\),
> then \(\one\forces \phi(\check{x}_1,\dots,\check{x}_n)\);
> thus, either \(\one\forces \phi(\check{x}_1,\dots,\check{x}_n)\)
> or \(\one\forces \lnot\phi(\check{x}_1,\dots,\check{x}_n)\).

By 7.13 (c) if \(p\forces\phi(\tau_1,\dots,\tau_n)\),
then \(i(p)\forces\phi(i_*(\tau_1),\dots,i_*(\tau_n))\)
for any automorphism \(i\).

Assume \(p\forces \phi(\check{x}_1,\dots,\check{x}_n)\), want \(\one\forces \phi(\check{x}_1,\dots,\check{x}_n)\).
Let \(G\) be any generic filter,
suppose \(M[G]\) thinks \(\lnot\phi(x_1,\dots,x_n)\),
and let it be forced by \(q\in G\), then there is an automorphism such that \(i(p)\) and \(q\) are compatible,
but \(i(p)\) forces \(\phi(x_1,\dots,x_n)\).


# E 2

> Show that any \(\Fn(I,J,\kappa)\) is almost homogeneous.

Let \(p,q\in \P=\Fn(I,J,\kappa)\),
just define \(i\) such that \(\dom(i(p))\cap \dom(q) = 0\).

# E 3

\newcommand{\Q}{\mathbb{Q}}

> In \(M\), let \(I\) and \(J\) be uncountable,
> \(\P = \Fn(I,2)\) and \(\Q = \Fn(J,2)\). Let \(\phi(x)\) be a formula.
> Show that \[
    \one\forces_\P \phi(\check{\alpha})^{\L(\mathcal{P}(\omega))} \text{ iff }
    \one\forces_\Q \phi(\check{\alpha})^{\L(\mathcal{P}(\omega))}.
\]

Follow hint, if \(M\) thinks \(I\) and \(J\) are equinumerous, directly apply Lemma 7.13 (c) since \(M\) will contain the isomorphism \(i: \P\to\Q\).

More generally say \(M\models \abs{I}\leq \abs{J}\) and let \(H\) be \(\Fn(I,J,\omega_1)^M\)-generic over \(M\);
then \(M[H]\models \abs{I}=\abs{J}\).
Witnessed by \(\bigcup H\) by Lemma 6.2.

If \(G\) if \(\P\)-generic over \(M[H]\), then \(G\) is \(\P\)-generic over \(M\) because being generic relativises down.

\(\mathcal{P}(\omega)\cap M[H][G] = \mathcal{P}(\omega) \cap M[G]\) (why no new subsets of \(\omega\) because \(\Fn(I,J,\omega_1)^M\) is countably closed)

So \(M[H][G]\) and \(M[H]\) see the same \(\L(\mathcal{P}(\omega))\) (need to confirm with definition of \(L(X)\)).

Since \(G\) was arbitrary this shows that if \(\P,M\) forces, \(\P,M[H]\) also forces.

Use E1 and repeat the argument with negation to show the reverse.

Likewise for \(\Q\).

This allows us to reduce to the easy case that directly applied Lemma 7.13 (c).


# E 4

\newcommand{\R}{\mathcal{P}\left(\omega\right)}

Follow hint.
Let \(M\models \abs{I}\geq \omega_1\),
let \(G\) be \(\P=\Fn(I,2)\)-generic over \(M\), and let \(N = (L(\R))^{M[G]}\).
If choice holds in \(N\), let \(N\models \kappa = \abs{\R}\),
by E1 \[ \one\forces_\P \left( \check{\kappa} = \abs{\R} \right)^{\L(\R)}. \]

Take \(J\) such that \(M\models \abs{J}>\kappa\), and let \(\Q=\Fn(J\times\omega,2)\) and by E3,
\[ \one\forces_\Q \left( \check{\kappa} = \abs{\R} \right)^{\L(\R)}. \]
so let \(H\) be \(\Q\)-generic over \(M\), then \(M[H] \models \left(\kappa = \abs{\R}\right)^{L(\R)}\).
The problem here is this forcing notion adds at least \(\abs{J}\) many reals to \(M[H]\),
that is \(M[H]\models \abs{\R} \geq \abs{J}\).
As \(\Q\) is ccc, the forcing preserves cardinals which gives the contradiction.

