---
title: Exercise 4.7
author: Qi Ji
date: 13th September 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}

> Consider the language \(\set{0,1}^*\cdot 0\cdot\set{0,1}^{n-1}\).

Observe that this language matches all words iff its \(n\)-th last character is \(0\).

> (b) Make an nfa recognising it with at most \(n+1\) states

![nfa with n-1 states](exercise4-7_nfa.png)

Start at state \(S\).

> (c) Make a dfa recognising it with exactly \(2^n\) states

As the dfa is large, I will illustrate the idea when \(n=3\).

![dfa for n=3](exercise4-7_dfa.png)

Start at state \(111\).

Note that the transitions follow the rule that the state labelled \(abc\) on character \(d\) transitions to state \(bcd\) for \(a,b,c,d\in\set{0,1}\).

> (a) Show that a dfa recognising it needs at least \(2^n\) states.

The basic idea is that the dfa must remember the last \(n\)-many characters in order to decide whether a word is in the language or not, this principle is illustrated in my answer for part (c), where the states correspond to \(\set{0,1}^n\).

To formally prove the lower bound we proceed by showing that \(L = \set{0,1}^*\cdot 0\cdot\set{0,1}^{n-1}\) at least has \(2^n\) derivatives, then by theorem of Myhill and Nerode the result follows.
Let \(w, w' \in \set{0,1}^n\), we want to show that \(L_w \ne L_{w'}\).
Without loss of generality let \(u,v,u',v'\) such that
\begin{align*}
w &= u0v  \\
w' &= u'1v'  \\
\abs{u} &= \abs{u'}  \\
\abs{v} &= \abs{v'}
\end{align*}
then we see that \(0^{\abs{u}} \in L_w\) but \(0^{\abs{u}} \notin L_{w'}\).
