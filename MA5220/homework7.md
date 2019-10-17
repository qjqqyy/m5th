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
\newcommand{\P}{\mathbb{P}}

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

<div style="height:50vh"></div>
