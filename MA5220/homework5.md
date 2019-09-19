---
title: MA5220 Homework 5
author: Qi Ji
date: 20th September 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\pred}[1]{\operatorname{\mathsf{pred}}\left(#1\right)}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\cf}{\operatorname{cf}}
\newcommand{\range}{\operatorname{range}}
\newcommand{\Club}{\operatorname{Club}}
\newcommand{\ex}[2]{\paren{\exists #1}\paren{#2}}
\newcommand{\fa}[2]{\paren{\forall #1}\paren{#2}}

#

> Suppose \(X_1,X_2\) are transitive sets and \(f:X_1\to X_2\) is a bijection that satisfies
> \[\paren{\forall x,y\in X_1}\paren{x\in y \iff f(x)\in f(y)}.\]
> Show that \(X_1 = X_2\) and \(f\) is the identity function on \(X_1\).

induct on rank?

<div style="height:50vh"></div>

#

> Write a \(\Delta_0\)-formula \(\phi(X,R)\) equivalent (over BST) to
> "\((X,R)\) is a linear ordering".

We use the result that \(z = \angle{x,y}\) is equivalent to a \(\Delta_0\) formula over BST (Lemma 11.7).

"\(R\) is a relation on \(X\)" is equivalent to
\[\fa{r\in R}{\exists a\in X}\ex{b\in X}{r = \angle{a,b}} \]
"\((X,R)\) is irreflexive" is equivalent to
\[\paren{\forall x\in X}\paren{\forall z\in R}\paren{\lnot \angle{x,x} = z}\]
"\((X,R)\) is a total ordering" is equivalent to
\[
\paren{\forall x\in X}\paren{\forall y\in X}\paren{\exists z\in R}\paren{x = y \lor z = \angle{x,y} \lor z = \angle{y,x}}
\]
"\((X,R)\) is transitive" is equivalent to
\[
\paren{\forall x\in X}\paren{\forall y\in X}\paren{\forall z\in X}
\paren{
\paren{\exists a\in R}\paren{a = \angle{x,y}} \land
\paren{\exists b\in R}\paren{b = \angle{y,z}}
\to \paren{\exists c\in R}\paren{c = \angle{x,z}}
}
\]
and "\((X,R)\) is a linear ordering" is the conjunction of everything above,
all of which are \(\Delta_0\).

#

\newcommand{\trcl}{\operatorname{trcl}}
\newcommand{\rank}{\operatorname{rank}}

> Let \(H_\kappa = \set{x: \abs{\trcl(x)} <\kappa}\).
>
> a. For every infinite cardinal \(\kappa\), \(H_\kappa\) is transitive.

Let \(x\in H_\kappa\), then \(\abs{\trcl(x)} < \kappa\).
Let \(y\in x\) and we want to show that \(y\in H_\kappa\).
Since \(y\in x \subseteq \trcl(x)\) and \(\trcl(x)\) is transitive \(y\subseteq\trcl(x)\),
then by Lemma 9.6 \(\trcl(y)\subseteq\trcl(x)\)
which gives \(\abs{\trcl(y)} <\kappa\) also.

> b. For every infinite cardinal \(\kappa\), \(H_\kappa\cap\mathbf{ORD} = \kappa\).

Let \(\alpha < \kappa\), then as \(\alpha \in \mathbf{ORD}\) and \(\alpha\) is transitive \(\abs{\trcl(\alpha)} = \abs{\alpha} < \kappa\), so \(\alpha \in H_\kappa\).

Conversely let \(\alpha \in H_\kappa\) be an ordinal, we want to show that \(\alpha < \kappa\). This is also clear as \(\alpha = \trcl(\alpha)\) and \(\kappa\) is a cardinal.

> c. For every infinite cardinal \(\kappa\), \(H_\kappa \subseteq V_\kappa\).

__Observation.__ For all \(\alpha\), \(V_\alpha\) is transitive.

When \(\alpha = 0\), \(V_\alpha = 0\) is trivially transitive.
Suppose \(V_\alpha\) is transitive, let \(x\in V_{\alpha+1}\),
then \(x\subseteq V_\alpha\), so let \(y\in x\subseteq V_\alpha\),
by transitivity of \(V_\alpha\) \(y\subseteq V_\alpha\) therefore \(y\in V_{\alpha+1}\) which completes the proof for successor case.
The limit case trivially follows from definition.

__Observation.__ For all \(\alpha\) for all \(x\), \(x\in V_{\alpha+1}\) iff \(\trcl(x)\in V_{\alpha+1}\).

Let \(x\subseteq V_\alpha\), use transitivity of \(V_\alpha\) and Lemma 9.6 to get
\(\trcl(x) \subseteq V_\alpha\).
Conversely \(x\subseteq \trcl(x) \subseteq V_{\alpha}\).
This result tells us that for all \(x\), \(\rank(x) = \rank(\trcl(x))\).

Now let \(x\in H_\kappa\), it suffices to show \(\rank(\trcl(x)) < \kappa\).
Suppose on the contrary that \(\rank(\trcl(x)) \geq \kappa\),
then there exists a \(\in\)-chain \(C\subseteq \trcl(x)\) with \(\abs{C}\geq \kappa\), which contradicts \(\abs{\trcl(x)} <\kappa\).

> d. For every regular uncountable cardinal \(\kappa\),
>    \(H_\kappa = V_\kappa\) iff \(\kappa\) is strongly inaccessible.

Suppose \(\ex{\lambda<\kappa}{2^\lambda \geq \kappa}\),
Assume for simplicity that \(\lambda\) is an infinite cardinal,
then we know that \(\lambda \subseteq H_\lambda \subseteq V_\lambda\),
then \(\abs{V_{\lambda+1}} \geq 2^{\abs{V_\lambda}} \geq 2^\lambda \geq \kappa\).
Let \(y\subseteq V_{\lambda+1}\) such that \(\abs{y} = \kappa\),
then \(y \in V_{\lambda+2} \subseteq V_\kappa\), but
\(\abs{\trcl(y)} \geq \abs{y} \geq \kappa\) which means \(y\notin H_\kappa\).

Conversely suppose \(\fa{\lambda<\kappa}{2^\lambda < \kappa}\).
First we induct on \(\kappa\) to show that \(\fa{\alpha<\kappa}{\beth_\alpha <\kappa}\).
The case when \(\alpha=0\) trivially holds as we assume \(\kappa>\beth_0=\omega\).
Assume \(\beth_\alpha < \kappa\), then \(\beth_{\alpha+1} = 2^{\beth_\alpha} < \kappa\) by strong inaccessibility.
When \(\alpha\) is a limit and result holds for all \(\beta<\alpha\),
\[\abs{\beth_\alpha} = \abs{\bigcup_{\beta<\alpha} \beth_\beta} <\kappa \]
as each \(\beth_\beta < \kappa\), \(\alpha < \kappa\) and \(\kappa\) is regular.

By part (c) we only need to show that \(V_\kappa\subseteq H_\kappa\).
Let \(x\in V_\kappa\), then \(x\in V_\alpha\) for some \(\alpha < \kappa\).
Since \(V_\alpha\) is transitive, \(x\subseteq \trcl(x)\subseteq V_\alpha\),
then \(\abs{\trcl(x)} \leq \abs{V_\alpha} \leq \beth_\alpha < \kappa\).
The fact used that \(\abs{V_\alpha} = \beth_\alpha\) can be proven easily with induction.
