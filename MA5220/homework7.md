---
title: MA5220 Homework 7
author: Qi Ji
date: 18th October 2019
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

#

> Suppose \(\M\) is a ctm of ZFC and \(\P\) is a poset in \(\M\).
> Assume that every condition in \(\P\) has two incompatible extensions.
> Show that there exists a filter \(G\) on \(\P\) such that
> \(\M[G]\) is not a model of ZFC.

Fix a well-order on \(\P\),
and by recursion on \(2^*\) define a labelling of some elements of \(\P\) as follows,
\(p_{\varepsilon} = 1_\P \)
and when \(w\in 2^*\), let \(q,r\in\P\) with \(q\ne r\), \(q,r\leq p_w\) and \(q\perp r\), then
\(p_{w0} = \min\set{q,r}\) and \(p_{w1} = \max\set{q,r}\),
where \(\varepsilon\) denotes the empty string and \(2^*\) denotes all finite sequences over \(2\).
Let \(R\) denote the set of all labelled elements in \(\P\) and
for each \(\omega\)-sequence \(s\in 2^\omega\),
it is natural to associate \(s\) with a filter in \(\P\), specifically
let \(f(s)\) be the upward closure of  \( \set{p_{s\upharpoonright n}: n\in\omega} \).
Let \(s\in 2^\omega\) be arbitrary and we show that \(f(s)\) is a filter.
We have \(1_\P = p_{s\upharpoonright 0} \in f(s)\).
Given \(n,n'\in\omega\), by our labelling it follows that \(p_{s\upharpoonright \max(n,n')} \in f(s)\) extends both \(p_n, p_{n'}\).
The last condition is free because we took upward closure.

Let \(\gamma = o(\M)\) and let \(X\subseteq \omega^2\) be a well order of \(\omega\) with \(\type(\omega,X) > \gamma\).
Let \(\pi: \omega^2\to\omega\) denote the Cantor pairing function which is primitive recursive.
Let \(g\) be the composition
\[ \mathcal{P}(\omega^2) \xrightarrow{\Im_\pi} \mathcal{P}(\omega) \xrightarrow{\chi} 2^\omega \xrightarrow{f} \mathcal{P}(\P) \]
where \(\chi\) denotes the characteristic function.
Let \(G = g(X)\) which is a filter on \(\P\), then \(G\in \M[G]\).

Suppose for a contradiction \(\M[G]\) is a model of ZFC,
then \(f^{-1}(G) \in \M[G]\) (note that \(f\) is one-one).
This is due to \(\M\subseteq \M[G]\) already containing the labelling map \(w\mapsto p_w\) which is also one-one,
then applying the inverse of labelling to \(G\cap R\) gives us a subset of \(2^*\) where for every pair of strings,
the shorter one is an initial segment of the longer one.
Taking its union will uniquely identify an \(\omega\)-sequence, which can be checked to be \(f^{-1}(G)\).
We can also reverse \(\chi\), given an \(\omega\)-sequence we just look at \(\set{n: (n,1)\in s}\).
Taking image of \(\pi\) is reversible too as \(\pi\) is primitive recursive and hence definable.
This means \(g^{-1}(G) = X \in \M[G]\), then as \(\omega\in\M[G]\) it follows that \(\type(\omega,X) \in \M[G]\)
which contradicts part (b) of question 2.

#

> Suppose \(\M\) is a ctm of ZFC and \(\P\) is a poset in \(\M\).
> Let \(G\) be a filter on \(\P\).
> Prove that \(G\) is \(\P\)-generic over \(\M\) iff for every maximal antichain \(A\subseteq\P\),
> if \(A\in\M\), then \(G\cap A\ne 0\).

Let \(G\) be \(\P\)-generic over \(\M\) and let \(A\in\M\) be a maximal antichain of \(\P\).
Let \(D = \set{p:\ex{a\in A}{p\leq a}}\) and note that \(D\in\M\) and is dense.
As \(G\) is generic \(G\cap D \ne 0\), then by upward closure of \(G\) we have \(G\cap A\ne 0\).

Conversely suppose for every maximal antichain \(A\subseteq\P\), if \(A\in \M\) then \(G\cap A \ne 0\).
Let \(D\subseteq \P\) be dense and assume \(D\in \M\).
By choice let \(A\in \M\) be a maximal antichain of \(D\),
the result will follow if \(A\) is also a maximal antichain of \(\P\).

By being a maximal antichain in \(D\), it holds that
\[\fa{p'\in D}{p'\in A \lor \ex{q\in A,r\in D}{r\leq p'\land r\leq q}}, \]
and we want to show that \(A\) is a maximal antichain in \(\P\), that is
\[\fa{p\in \P}{p\in A \lor \ex{q\in A,r\in \P}{r\leq p\land r\leq q}}. \]
Let \(p\in\P\), if \(p\in A\) we are done.
In the other case as \(D\) is dense let \(p'\in D\) such that \(p' \leq p\).
Case \(p' \in A\), then we satisfy the condition with witnesses \(q,r\) both set to \(p'\).
In the only remaining case there exists \(q\in A, r\in D\) such that \(r\) is a common extension of \(p'\) and \(q\),
then \(r\leq p\) too and the result follows.
