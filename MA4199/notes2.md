---
title: Kunen IV Exercise 18 to 24
author: Qi Ji
date: 19th August 2020
---

\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\restrict}{\upharpoonright}
\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\Im}{\operatorname{Im}}
\newcommand{\trcl}{\operatorname{trcl}}

\newcommand{\V}{\mathbf{V}}
\newcommand{\F}{\mathbf{F}}

We follow through exercises 18 to 24 from Chapter IV of Kunen (1980) to show a result of Fraenkel-Mostowski.

# Exercise 18

> Let \(\F: \V \to \V\) be 1-1 and onto.
> Define \(\mathbf{E} \subseteq \V\times\V\) by \(x \mathbf{E} y\) iff \(x \in \F(y)\).
> Show (in ZFC) that \(\mathbf{V},\mathbf{E}\) is a model of \(\text{ZFC}^-\).

*Sketch.*
Think of \(\F\) as a permutation on \(\V\),
then relativising to \(\V,\mathbf{E}\) basically means replacing the membership relation with \(\mathbf{E}\).

We take all the \(\text{ZFC}^-\) axioms, replace all occurrences of \(x\in y\) with \(x\in\F(y)\) and show that they are theorems of \(\text{ZFC}^-\).

* \(\text{extensionality}^{\V,\mathbf{E}}\) is
\[ \forall x~\forall y \paren{
  \forall z \paren{z\in \F(x) \leftrightarrow z\in \F(y)} \rightarrow x = y
},\]
let \(x, y\in \V\), using extensionality, \(\F(x) = \F(y)\), and as \(\F\) is 1-1 we know \(x = y\),

* let \(\phi\) be a formula with free variables \(x,z,\overline{w}\), its instance of \(\text{Comprehension}^{\V,\mathbf{E}}\) is
\[ \forall z~\forall \overline{w}~\exists y~\forall x \paren{
    x \in \F(y) \leftrightarrow x\in \F(z) \land \phi
},\]
let \(z,\overline{w}\in \V\), comprehension gives us existence of \(\F(y)\) and use fact that \(\F\) is a permutation to get existence of \(y\),

* pairing looks easy

* for \(\text{union}^{\V,\mathbf{E}}\) which is
\[
\forall \mathscr{F}~\exists A~\forall Y~\forall x\paren{x\in \F(Y)\land Y\in\F(\mathscr{F}) \rightarrow x\in\F(A)}
\]
let \(\mathscr{F}\in\V\),
apply union to \(\Im_{\F}(\F(\mathscr{F}))\) (appealing to replacement),
then there exists \(B\) satisfying
\[
\forall Z~\forall w\paren{w\in Z\land Z\in \Im_{\F}(\F(\mathscr{F})) \rightarrow w\in B}
\]
Let \(A = \F^{-1}(B)\) and let \(Y,x\in\V\), assume \(x\in \F(Y)\) and \(Y\in\F(\mathscr{F})\),
let \(Z = \F(Y)\) and \(w = x\), apply previous statement to conclude that \(x\in \F(A) = B\).

other axioms should be similar (read: I'm lazy).

maybe do replacement sometime

# Exercise 19

> Use the preceding exercise to show the consistency of \(\text{ZFC}^- + \exists x\paren{x = \set{x}}\),
> assuming consistency of ZFC.

Follow hint, define \(\F\) such that \(\F(0) = 1\), \(\F(1) = 0\) and \(\F\) is identity everywhere else.
Define \(\mathbf{E}\) similarly as previous exercise and we show that \(\exists x\paren{x = \set{x}}\) relativised to \(\V,\mathbf{E}\) holds.

Work in \(\V,\mathbf{E}\), because \(0\in 0\) we can conclude both \(0 \subseteq \set{0}\) and \(\set{0} \subseteq 0\) and therefore \(0 = 1\).

> Likewise show the relative consistency of \(\text{ZFC}^- + \exists x~\exists y\paren{x = \set{y} \land y = \set{x} \land x \ne y}\).

Similarly, define \(\F\) such that \(\F\) swaps \(0\) and \(\set{\set{0}}\).
Now working in \(\V,\mathbf{E}\), \(0 \in \set{0}\) and \(\set{0} \in 0\),
let \(x = \set{0}\) and \(y = 0\).

# Exercise 20

> Assume consistency of ZFC and show the consistency of \(\text{ZFC}^-\) plus the following modified Mostowski Collapsing Theorem:
> If \(R\) is an extensional relation on the set \(A\), then \(\angle{A, R}\) is isomorphic to \(\angle{M, \in}\) for some transitive set \(M\).
> Note \(R\) is *not* assumed to be well-founded.

TODO: Induct at \(V_\alpha\) and force everything out...

# Exercise 21

> Show that there is no finite \(S\subset \text{ZFC}^-\) such that
> one can prove in \(\text{ZFC}^-\) that "\(R\) well-orders \(A\)"
> is absolute for transitive models of \(S\).

Follow hint, we use previous exercise.
Suppose not, then let \(S \subset \text{ZFC}^-\) be finite such that
for all transitive models \(M\vDash S\), "\(R\) well-orders \(A\)" is absolute.

Do model theory.

# Exercise 22

\newcommand{\WF}{\mathbf{WF}}

> For any set \(A\), define \(R(\alpha,A)\) by:
>
>  * \(R(0, A) = A \cup \trcl(A)\),
>  * \(R(\alpha+1, A) = \mathcal{P}(R(\alpha, A))\), and
>  * \(R(\alpha, A) = \bigcup_{\xi<\alpha} R(\xi, A)\) when \(\alpha\) is a limit ordinal.
>
> Let \(\WF(A) = \bigcup_{\alpha\in\mathbf{ON}} R(\alpha, A)\). Show that in \(\text{ZF}^-\) that \(\WF(A)\) is a transitive model of \(\text{ZF}^-\) and that AC implies \(\text{AC}^{\WF(A)}\).

* \(\WF(A)\) being transitive is obvious.
* All transitive models satisfy Extensionality.
* Comprehension follows from \(\WF(A)\) being closed under power set.
* Powerset follows from Lemma 2.9.
* Pairing and Union looks easy.
* Replacement - For any definable class function \(\F\) and any set \(X\in\WF(A)\), take minimum \(\alpha\) such that \(\mathbf{F}\) image of \(X\) is contained in \(R(\alpha, A)\).
* Infinity looks obvious.

Assume choice and \(\text{choice}^{\WF(A)}\) follows from Lemma 3.14 (universal statements relativise down).

# Exercise 23

Use a nice enough \(\F\) to get a \(U\) satisfying \(\forall x\in U.~ x = \set{x}\) (argument in 18 should work in a model of just \(\text{ZF}^-\)),
then plug 22.

# Exercise 24

doable

<div style="height:50vh"></div>
