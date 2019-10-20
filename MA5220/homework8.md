---
title: MA5220 Homework 8
author: Qi Ji
date: 25th October 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\Im}{\operatorname{Im}}
\newcommand{\range}{\operatorname{range}}
\newcommand{\type}{\operatorname{type}}
\newcommand{\trcl}{\operatorname{trcl}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\ex}[2]{\paren{\exists #1}\paren{#2}}
\newcommand{\fa}[2]{\paren{\forall #1}\paren{#2}}
\newcommand{\rank}{\operatorname{rank}}
\newcommand{\P}{{\mathbb{P}}}
\newcommand{\M}{\mathbf{M}}
\newcommand{\forces}{\Vdash}

#

\newcommand{\taubar}{\overline{\tau}}

> Suppose \(\P\) is a poset, \(\phi(\overline{x})\) is a formula with free variables as shown and \(\overline{\tau}\) are \(\P\)-names.
> Show that TFAE
>
> (a) \(p\forces^* \phi(\taubar)\),
> (b) \(\fa{q\leq p}{q\forces^* \phi(\taubar)}\),
> (c) \(\set{q\leq p: q\forces^*\phi(\taubar)}\) is dense below \(p\).

It is immediate that (b) implies (a) and (c). We induct on the complexity of \(\phi\) to show the other implications.

Case \(\phi \equiv x_1 = x_2\).
:   \((a)\Rightarrow(b)\).
    We just need to observe that when a set is dense below \(p\),
    for every \(q\leq p\), it is also dense below \(q\).

    \((c)\Rightarrow(a)\). To show \(p\forces^* \tau_1 = \tau_2\), let
    \((\pi_1, s_1)\in \tau_1\), we want
    \[ \set{r\leq p: r\leq s_1 \implies \ex{(\pi_2, s_2)\in \tau_2}{r\leq s_2 \land r\forces^*\pi_1 = \pi_2}} \]
    to be dense below \(p\).
    Let \(p' \leq p\) and by (c) let \(q \leq p'\) with \(q\forces^* \tau_1 = \tau_2\), then there exists \(r \leq q \leq p' \leq p\) in the set as required.
    The symmetric case is similar.

Case \(\phi \equiv x_1\in x_2\).
:   Same argument as \(\phi \equiv x_1 = x_2\).

Case \(\phi(\overline{x},\overline{y}) \equiv \psi_1(\overline{x}) \land \psi_2(\overline{y})\).
:   Trivially follows from induction hypothesis.

Case \(\phi(\overline{x}) \equiv \lnot\psi(\overline{x})\).
:   \((a)\Rightarrow(c)\). Assume (a),
    then \(\lnot\ex{q\leq p}{q\forces^*\psi(\taubar)}\).
    So for all \(r\leq p\), \(\lnot\ex{q\leq r}{q\forces^*\psi(\taubar)}\) and (c) follows.

    \((c)\Rightarrow(a)\). Assume (a) fails and we show (c) fails, let
    \(q\leq p\) witness \(q\forces^*\psi(\taubar)\), by induction hypothesis
    \(\fa{r\leq q}{r\forces^*\psi(\taubar)}\) so the set 
    \(\set{q'\leq p: q'\forces^*\lnot\psi(\taubar)}\) is empty below \(q\) and (c) fails.

Case \(\phi(\overline{x}) \equiv \ex{y}{\psi(y,\overline{x})}\).
:   Same argument as \(\phi \equiv x_1 = x_2\).

#

TODO: later

#

> Suppose \(\M\) is a ctm of ZFC, \(\P\) a posit in \(\M\)
> and \(G,H\) are \(\P\)-generic filters over \(\M\).
> Show that either \(G = H\) or there exist \(p\in G\) and \(q\in H\)
> such that \(p\perp q\).

Assume \(G\ne H\), without loss of generality let \(p \in G\setminus H\).
By choice in \(\M\) let \(A\in\M\) be a maximal antichain containing \(p\).
Since \(H\) is generic \(H\cap A\) is nonempty, let \(q\in H\cap A\) and note that \(q \ne p\), the result follows.

<div style="height:50vh"></style>
