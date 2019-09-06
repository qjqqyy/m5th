---
title: Exercise 3.23
author: Qi Ji
date: 6th September 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}

> Find a language which needs for Jaffe's Matching Pumping Lemma at least constant \(k = 100\) and
> can be recognised by a deterministic finite automaton with \(100\) states.
> Prove your answer.

Let \(\Sigma = \set{0}\) (doesn't matter much here),
and let \(L = \set{w\in\Sigma^*: \abs{w} \text{ is a multiple of }100}\).
\(L\) can be recognised by a dfa with \(100\) states, specifically one where the state corresponds to
number of characters read modulo 100, and accepts when it is \(0\).

\(L\) satisfies Jaffe's Matching Pumping Lemma with \(k = 100\).
To see why, fix any \(x\in \Sigma^*\) and \(y \in \Sigma^{100}\) and it is easy to see that
for any \(h\in\mathbb{N}\), \(L_{xy} = L_{xy^h} = \set{w\in\Sigma^*: \abs{w} + \abs{x} \text{ is a multiple of }100}\).

Suppose \(L\) satisfies Jaffe's Matching Pumping Lemma with \(k < 100\), then
there exists \(y\in\Sigma^k\) such that
for all \(h\in\mathbb{N}\), \(L_{y^h} = L\)
so in particular \(L_y = L\), but \(\abs{y} < 100\) so \(0^{100-\abs{y}} \in L_y\) but clearly is not in \(L\).
