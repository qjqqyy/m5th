---
title: MA5220 Homework 7
author: Qi Ji
date: 18th October 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\cf}{\operatorname{cf}}
\newcommand{\Im}{\operatorname{Im}}
\newcommand{\range}{\operatorname{range}}
\newcommand{\trcl}{\operatorname{trcl}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\ex}[2]{\paren{\exists #1}\paren{#2}}
\newcommand{\fa}[2]{\paren{\forall #1}\paren{#2}}
\newcommand{\rank}{\operatorname{rank}}
\newcommand{\P}{{\mathbb{P}}}

#

> Suppose \(\kappa\) is an infinite cardinal.
> Let \(\P = \operatorname{Fn}(\kappa,\omega)\).
> Show that every antichain in \(\P\) is countable.

Let \(A\subseteq \P\) be an uncountable antichain, we derive a contradiction as follows.
Note that for any antichain \(A\) we have, for all \(f,g\in A\),
\[ \ex{\alpha\in\dom(f)\cap\dom(g)}{f(\alpha) \ne g(\alpha)}. \]
Consider the domains of the partial functions \(D = \set{\dom(f): f\in A}\).
Note that \(D\) cannot be countable, otherwise \(A\) will be a countable union of countable sets.
Now without loss of generality refine \(A\) such that \(D\) is a \(\Delta\)-system.
Using choice, we can refine \(A\) again such that for each \(x\in D\), there is exactly one \(f\in A\) with \(\dom(f) = x\).
Note that \(A\) is still an uncountable antichain.

Let \(r\in \left[\kappa\right]^{<\omega}\) be the root of \(D\),
and being the root, every function in \(A\) is total on \(r\).
We claim that \(r \ne 0\) and every function \(f\in A\) is determined completely by its values on \(r\).
Let \(f,g\in A\) with \(f\ne g\) and since \(D\) is a sunflower, \(\dom(f)\cap \dom(g) = r\).
Nonemptiness arises from the existence of a witness from \(\dom(f)\cap\dom(g)\).
Also if \(f\upharpoonright r = g\upharpoonright r\), then they would have a common extension which cannot happen.
This means that \(\abs{A} \leq \omega^\abs{r} = \omega\).

#

\newcommand{\M}{\mathbf{M}}

> Suppose \(\M\) is a ctm of ZFC, \(\P\) is a poset in \(\M\),
> \(G\subseteq \P\) and \(1_\P\in G\).
>
> (a) Show that \(\M[G]\) is transitive and hence it satisfies the axiom of extensionality.

We have \(\M[G] = \set{\tau[G]: \tau\in\M^\P}\).
Let \(\tau\in\M^\P\) such that \(\tau[G]\in \M[G]\),
we want \(\tau[G] \subseteq \M[G]\).
Let \(x\in \tau[G]\) and from the definition
there exists \(p\in \P, \sigma\in\mathbf{V}^\P\) such that \((\sigma, p)\in\tau\) and \(x = \sigma[G]\).
Since \(\tau\in\M\) and \(\M\) is transitive it follows that \(\sigma\in\M\), so
\(\sigma\in\M^\P\) which by definition of \(\M[G]\) means \(x = \sigma[G] \in \M[G]\).

> (b) Show that \(o(\M[G]) = o(\M)\).

As \(\M \subseteq \M[G]\) we only need to show \(o(\M[G]) \leq o(\M)\).
We show that for any \(\tau[G] \in \M[G]\), \(\rank(\tau[G]) \leq \rank(\tau)\),
the height bound will follow from this result.

Let \(\tau\in \M^\P\), then
\(\tau[G] = \set{\sigma[G]: \ex{p\in G}{(\sigma,p)\in\tau}}\)
and by computing rank we have
\[\rank(\tau[G]) = \sup\set{\rank(\sigma[G])+1: \ex{p\in G}{(\sigma,p)\in\tau}} \]
by induction whenever \((\sigma,p)\in\tau\), we have \(\rank(\sigma[G]) \leq \rank(\sigma) < \rank(\tau)\)
and the resultant bound follows.

> (c) Show that \(\M[G]\) satisfies the axioms of pairing, union and foundation.

For pairing, let \(\sigma[G], \tau[G]\in\M[G]\).
Let \(\pi = \set{(\sigma, 1_\P), (\tau, 1_\P)}\) which is clearly a \(\P\)-name.
Note that \(\pi\in\M^\P\) too as pairing holds in \(\M\).
It then follows from definitions and fact that \(1_\P\in G\) that
\(\pi[G] = \set{\sigma[G], \tau[G]}\).

For union, let \(\tau[G]\in\M[G]\). Define
\[ \pi = \bigcup\set{\sigma:\ex{p\in G}{(\sigma,p)\in\tau}} \]
and since Union holds in \(\M\), \(\pi\in\M^\P\).
Evaluating \(\pi[G]\) we have
\[ \pi[G] = \set{\sigma_0[G]: \ex{p_0\in G}{(\sigma_0,p_0)\in\pi}} \]
expanding gives
\[ \pi[G] = \set{\sigma_0[G]: \ex{p_0\in G, p\in G, \sigma}
{(\sigma_0,p_0)\in\sigma \land (\sigma, p)\in\tau}}.\]
We now inspect \(\bigcup\tau[G]\),
\[\bigcup\tau[G] = \set{x:
\ex{y\in\tau[G]}{x\in y}
}\]
unrolling what it means for \(y\in\tau[G]\) we rewrite as
\[\bigcup\tau[G] = \set{x:
\ex{p\in G, \sigma}{(\sigma, p)\in\tau\land x\in \sigma[G]}
}\]
and unfolding the definition of \(x\in \sigma[G]\) will make clear the fact that
\(\bigcup\tau[G] = \pi[G] \in\M[G]\).

Foundation holds in any transitive class.


<div style="height:50vh"></div>
