---
title: Exercise 6.25
author: Qi Ji
date: 4th October 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\let\epsilon\varepsilon

__Lemma.__ Let \(h\) be a generalised homomorphism, then
\(h(\set{\epsilon}) = \set{\epsilon}\).

*Proof.* Note that \(\emptyset^* = \set{\epsilon}\), and
\( \emptyset^* = h(\emptyset)^* = h(\emptyset^*) = h(\set{\epsilon}) \).

> Let \(h\) be any given generalised homomorphism.
> Show by structural induction that \(h(L) = \bigcup_{u\in L} h(\set{u})\)
> for all regular languages \(L\).

In the case that \(L\) is finite, then \(h(L) = \bigcup_{u\in L} h(\set{u})\)
follows from finite applications of \(h(\set{u,v}) = h(\set{u})\cup h(\set{v})\).

Suppose \(h(L) = \bigcup_{u\in L} h(\set{u})\) and \(h(H) = \bigcup_{v\in H} h(\set{v})\).

 * We first want \(h(L\cup H) = \bigcup_{w\in L\cup H} h(\set{w})\).
   As \(h\) is a generalised homomorphism we have
\[h(L\cup H) = h(L)\cup h(H) = \bigcup_{u\in L}h(\set{u}) \cup \bigcup_{v\in H} h(\set{v}) \]
   and the result follows by set theory.

 * Next we want to show \(h(L\cdot H) = \bigcup_{w\in L\cdot H} h(\set{w})\).
   Again as \(h\) is a generalised homomorphism we have
\[h(L\cdot H) = h(L)\cdot h(H) = \bigcup_{u\in L}h(\set{u}) \cdot \bigcup_{v\in H} h(\set{v}) \]
   and it suffices to show that for all \(u\in L, v\in H\),
   we have \(h(\set{uv}) = h(\set{u})\cdot h(\set{v})\),
   this holds because \(h\) is a generalised homomorphism and \(\set{uv} = \set{u}\cdot\set{v}\).

 * We still need to show that \(h(L^*) = \bigcup_{v\in L^*} h(\set{v})\).
   As \(h\) is a generalised homomorphism we have
\[h(L^*) = h(L)^* = \left(\bigcup_{u\in L} h(\set{u})\right)^*. \]
   Now we show \[\bigcup_{v\in L^*} h(\set{v}) = \left(\bigcup_{u\in L} h(\set{u})\right)^*.\]
   Let \(v\in L^*\), if \(v = \epsilon\) then \(h(\set{\epsilon}) = \set{\epsilon} \subseteq \left(\bigcup_{u\in L} h(\set{u})\right)^*\).
   In the other case let \(l_1,l_2,\dots,l_n\in L\) such that
   \(v = l_1l_2\cdots l_n\), then \(h(\set{v}) = h(\set{l_1})\cdot h(\set{l_2})\cdots h(\set{l_n}) \subseteq \left(\bigcup_{u\in L} h(\set{u})\right)^*\) too.

   The argument for the other side of containment is similar, just chase elements.

> Furthermore, show that every mapping \(h\) satisfying \(h(\set{\epsilon}) = \set{\epsilon}\), \(h(L) = \bigcup_{u\in L} h(\set{u})\) and
> \(h(L\cdot H) = h(L)\cdot h(H)\) for all regular subsets \(L, H\subseteq \Sigma^*\) is a generalised homomorphism.

To show \(h(L\cup H) = h(L)\cup h(H)\), we mostly reuse the equations earlier
\[ h(L)\cup h(H) = \bigcup_{u\in L}h(\set{u}) \cup \bigcup_{v\in H} h(\set{v})
= \bigcup_{w\in L\cup H} h(\set{w}) = h(L\cup H). \]

To show \(h(\emptyset) = \emptyset\) consider
\(h(\emptyset) = \bigcup_{u\in \emptyset} h(\set{u}) = \emptyset\).

To show \(h(L^*) = h(L)^*\) it suffices to show that
\[\bigcup_{v\in L^*} h(\set{v}) = \left(\bigcup_{u\in L} h(\set{u})\right)^*\]
and we can reuse the argument from earlier part.

> Is the same true if one weakens the condition \(h(\set{\epsilon}) = \set{\epsilon}\) to \(\epsilon \in h(\set{\epsilon})\)?

No. Let \(h\) send \(\set{\epsilon}\) to \(\set{\epsilon, 0}\).
Then \(h\) cannot be a generalised homomorphism because
\[ \set{\epsilon, 0} \ne h(\set{\epsilon}) = h(\set{\epsilon}^*) = \set{\epsilon, 0}^* = 0^*. \]
