---
title: MA5220 Homework 6
author: Qi Ji
date: dunno
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\cf}{\operatorname{cf}}
\newcommand{\Im}{\operatorname{Im}}
\newcommand{\range}{\operatorname{range}}
\newcommand{\Club}{\operatorname{Club}}
\newcommand{\ex}[2]{\paren{\exists #1}\paren{#2}}
\newcommand{\fa}[2]{\paren{\forall #1}\paren{#2}}
\newcommand{\rank}{\operatorname{rank}}

#

\newcommand{\ybar}{\overline{y}}
Let \(\overline{y}\) abbreviate \(y_1,\dots,y_n\) where how many variables there are doesn't matter.

> Let \(\phi(\overline{y})\) be a formula with free variables as shown.
> Show that
> \[ C_\phi = \set{\alpha<\omega_1: \paren{\forall\overline{y}\in V_\alpha}\left[\phi^{V_\alpha}(\overline{y}) \iff \phi^{V_{\omega_1}}(\overline{y})\right]} \]
> is closed and unbounded in \({\omega_1}\).

<!---
I found a even more general version of reflection theorem [here](http://ozark.hendrix.edu/~yorgey/settheory/15-reflection-principle.pdf)
which asserts that whenever \(\angle{A_\alpha:\alpha \in \mathbf{ORD}}\) is a hierarchy,
the class \(\mathbf{C} \subseteq \mathbf{ORD}\) where every \(\alpha\in \mathbf{C}\) satisfies
\[ \fa{\ybar\in A_\alpha}{\phi^{A_\alpha}(\ybar) \iff \phi^{\mathbf{A}}(\ybar)} \]
is closed unbounded (which is not exactly stateable in ZFC).
This question appears to be the above theorem restricted to \(\omega_1\)
(which makes life a lot easier since everything is a set and has cofinality at most \(\omega\)).
-->

We proceed just like the reflection theorem.
When \(\phi\) is atomic it is absolute, so we can take the set to be \(\omega_1\).
When \(\phi = \lnot \theta\) we just reuse \(C_\theta\).
When \(\phi = \psi \land \theta\) we let \(C_\phi = C_\psi \cap C_\theta\) which is still closed unbounded, and an easy check shows that \(C_\phi\) agrees with the condition.

When \(\phi = \paren{\exists x}\psi(x,\ybar)\) let \(C_\psi\) be the club given by induction hypothesis.
Define \(F:V_{\omega_1}^n \to \omega_1\) as follows.
In the case that \(\paren{\exists x\in V_{\omega_1}} \psi^{V_{\omega_1}}(x,\ybar)\),
define \(F(\ybar)\) to be the least \(\alpha\in\omega_1\) such that \(\paren{\exists x\in V_\alpha} \psi^{V_{\omega_1}}(x,\ybar)\),
and let \(F(\ybar) = 0\) otherwise.
Next define \(G:\omega_1\to \omega_1\) as \(G(\alpha) = \sup_{\ybar\in V_{\alpha}} F(\ybar)\).
Now let \[C_\phi = C_\psi \cap \operatorname{Lim}(\omega_1) \cap \set{\alpha \in \omega_1: \alpha\text{ is closed under }G} \]
which is the intersection of 3 clubs, and therefore a club.

It remains to show that for every \(\alpha \in C_\phi, \ybar\in V_\alpha\)
\[
\paren{\exists x\in V_\alpha} \psi^{V_\alpha}(x,\ybar) \iff
\paren{\exists x\in V_{\omega_1}} \psi^{V_{\omega_1}}(x,\ybar)
\]

Suppose there is \(x\in V_\alpha\) satisfying \(\psi^{V_\alpha}(x,\ybar)\),
then as \(\alpha \in C_\psi\), it follows that \(\psi^{V_{\omega_1}}(x,\ybar)\) holds,
and since \(V_\alpha \subseteq V_{\omega_1}\) we complete the proof.

Conversely suppose there exists \(x\in V_{\omega_1}\) such that \(\psi^{V_{\omega_1}}(x,\ybar)\),
we need to produce an \(x'\in V_\alpha\) such that \(\psi^{V_\alpha}(x',\ybar)\).
First find \(\beta < \alpha\) such that all \(\ybar \in V_\beta\), which we can since \(\ybar\) is finite and \(\alpha\) is limit.
Note that from definition \(0 < F(\ybar) \leq G(\beta)\), and closure gives \(G(\beta) < \alpha\).
So there exists \(x' \in V_{F(\ybar)} \subseteq V_\alpha\) satisfying \(\psi^{V_{\omega_1}}(x',\ybar)\).
Since \(\alpha \in C_\psi\) this means that \(\psi^{V_\alpha}(x',\ybar)\) holds as well.

<div style="height:50vh"></div>
