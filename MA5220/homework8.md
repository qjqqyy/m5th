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
\newcommand{\cf}{\operatorname{cf}}
\newcommand{\type}{\operatorname{type}}
\newcommand{\trcl}{\operatorname{trcl}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\ex}[2]{\paren{\exists #1}\paren{#2}}
\newcommand{\fa}[2]{\paren{\forall #1}\paren{#2}}
\newcommand{\rank}{\operatorname{rank}}
\newcommand{\Fn}{\operatorname{Fn}}
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

> Suppose \(\M\) is a ctn of ZFC and \(\P\) is a poset in \(\M\) in which every condition has two incompatible extensions.
> Show that there exists \(\angle{\angle{M_n, G_n}: n<\omega}\) such that the following hold.
>
> (a) \(\M_0 = \M\)
> (b) For every \(n<\omega\), \(G_n\) is a \(\P\)-generic filter over \(\M_n\) and \(\M_{n+1} = \M_n[G_n]\).
> (c) There is no ctm \(\mathbf{N}\) of ZFC such that \(o(\mathbf{N}) = o(\M), \M\subseteq\mathbf{N}\) and \(\angle{G_n:n<\omega}\in\mathbf{N}\).

Let \(z\in 2^\omega\) be a real that encodes an ordinal above \(o(\M)\).
The idea is to make \(G_n\) encode the \(n\)-th bit of \(z\), then no ctm \(\mathbf{N}\) that satisfies (c) can exist since from
\(\angle{G_n:n<\omega}\) we can recover \(z\) and the ordinal that \(z\) encodes.

Let \(p_0,p_1\in\P\) be two incompatible extensions of \(1_\P\).
Let \(\M_0 = \M\) and suppose \(\M_n\) has already been defined,
if \(z(n) = 0\), we repeat the construction of Lemma 16.5 but starting from \(p_0\),
this gives us a generic filter \(G_n\) which contains \(p_0\), proceed similarly with \(p_1\) if \(z(n) = 1\).
Define \(\M_{n+1} = \M_n[G_n]\).

#

> Suppose \(\M\) is a ctm of ZFC, \(\P\) a poset in \(\M\)
> and \(G,H\) are \(\P\)-generic filters over \(\M\).
> Show that either \(G = H\) or there exist \(p\in G\) and \(q\in H\)
> such that \(p\perp q\).

Assume \(G\ne H\), without loss of generality let \(p \in G\setminus H\).
By choice in \(\M\) let \(A\in\M\) be a maximal antichain containing \(p\).
Since \(H\) is generic \(H\cap A\) is nonempty, let \(q\in H\cap A\) and note that \(q \ne p\), the result follows.

#

> Suppose \(\M\) is a ctm of ZFC and \(\paren{\kappa\text{ is a cardinal}}^\M\). Show the following
>
> (a) \(\Fn(\omega,\kappa)\in\M\).

As \(\abs{X}<\omega\) is absolute, and
\[\Fn(X,Y) = \set{p:\abs{p}<\omega \land p\text{ is a function} \land \dom(p)\subseteq X\land \range(p)\subseteq Y},\]
then for any \(X,Y\in\M\) (including \(\omega, \kappa\)), \(\Fn(X,Y) = \Fn(X,Y)^\M \in \M\).

> (b) Let \(G\) be a \(\Fn(\omega,\kappa)\)-generic filter over \(\M\).
      Show that \(\paren{\kappa\text{ is countable}}^{\M[G]}\).

Since \(G\in \M[G]\), let \(f = \bigcup G \in \M[G]\).
It is enough to show that \(f:\omega\to\kappa\) is onto.
As \(G\) is a filter, \(f\) is a function with \(\dom(f)\subseteq \omega\) and \(\range(f)\subseteq \kappa\).
To show \(\dom(f) = \omega\) let \(n\in\omega\), consider this set
\[D_n = \set{p\in\Fn(\omega,\kappa):n\in \dom(p)}\]
which is dense. By absoluteness \(D_n\in\M\) also, so \(G\cap D_n \ne 0\) and \(n\in\dom(f)\).

To see that \(\range(f) = \kappa\) let \(\lambda\in\kappa\) and similarly consider
\[E_\lambda = \set{p\in\Fn(\omega,\kappa):\lambda\in\range(p)}\]
which is also dense (as \(\omega\) is infinite) and in \(\M\) by absoluteness, so \(G\cap E_\lambda \ne 0\) and \(\lambda \in \range(f)\).

#

\newcommand{\cc}{{\mathsf{cc}}}
\newcommand{\Pp}{\P_{\leq p}}
\newcommand{\Pq}{\P_{\leq q}}
\newcommand{\Pr}{\P_{\leq r}}
\newcommand{\Ps}{\P_{\leq s}}
> Let \(\P\) be a poset in which every condition has two incompatible extensions.
> Define \(\cc(\P)\) to be the least cardinal \(\kappa\) such that every antichain in \(\P\) has cardinality \(<\kappa\).
> For \(p\in \P\), let \(\P_{\leq p} = \set{q\in \P: q\leq p}\). Prove the following.
>
> (a) \(\fa{p,q\in\P}{p\leq q\implies \cc(\P_{\leq p}) \leq \cc(\P_{\leq q})}\).

Let \(p,q\in\P\) with \(p\leq q\).
Since \(\P_{\leq p} \subseteq \P_{\leq q}\) every antichain in \(\Pp\) is also an antichain in \(\Pq\) and the result follows.


> (b) For every \(p\in\P\), there exists \(q\leq p\) such that
      \[\paren{\forall r,s\in\P}\left[\paren{r\leq p\land s\leq q}\implies \cc(\P_{\leq r}) = \cc(\P_{\leq s})\right]\]

Fix \(p\in\P\) and let \(q_0 = p\).
Suppose \(\fa{r,s\in \P_{\leq q_0}}{\cc(\Pr) = \cc(\Ps)}\), then we are done.
In the other case let \(r,s\leq q_0\) witness \(\cc(\Pr) < \cc(\Ps)\), then define \(q_1 = r\).
We can repeat this construction to get \(q_2, q_3,\dots\) and so on but this construction terminates in finitely many stages.
Otherwise by part (a) we will get an infinite strictly decreasing sequence of ordinals \(\cc(\P_{q_0}) > \cc(\P_{q_1}) > \dots \).
Now define \(q\) to be \(q_n\) where this construction stops and the result follows.

> (c) Show that \(\cc(\P)\) is a regular cardinal.

Suppose not, let \(\kappa = \cc(\P)\) and \(\lambda = \cf(\kappa) < \kappa\).
Let \(a(X)\) denote \(\sup\set{\abs{A}: A\subseteq X \text{ is an antichain}}\).

Fix \(M\) a maximal antichain in \(\P\).
We first claim that for any regular \(\mu < \kappa\), whenever \(\mu > \abs{M}\) there is a \(p\in M\) with \(\cc(\Pp) = \mu\).
By minimality of \(\kappa = \cc(\P)\) let \(A\) be an antichain with \(\abs{A} = \mu\).
Regularity of \(\mu\) gives us a \(p\in M\) that is compatible with \(\mu\) many members of \(A\).
Let \(A_p\) denote everyone in \(A\) compatible with \(p\).
For each \(q\in A_p\) choose \(r_q \in \Pp\cap\Pq\),
then \(\set{r_q:q\in A_p}\subseteq \Pp\) is an antichain with size \(\mu\).
This together with part (a) gives \(\sup\set{a(\Pp):p\in M} = \kappa\).

Now let \(\angle{p_\xi: \xi < \lambda}\) be a sequence in \(M\) such that
\(a(\P_{\leq p_\xi})\) is increasing and
\(\sup_{\xi<\lambda} a(\P_{\leq p_\xi}) = \kappa\).
At each \(\xi < \lambda\) choose \(A_\xi\) an antichain witnessing \(a(\P_{\leq p_\xi})\),
then \(A = \bigcup_{\xi<\lambda} A_\xi\) is still an antichain in \(\P\) but \(\abs{A} = \kappa\) which contradicts \(\cc(\P)\).
