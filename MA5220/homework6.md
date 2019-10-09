---
title: MA5220 Homework 6
author: Qi Ji
date: 11th October 2019
...

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\angle}[1]{\left\langle#1\right\rangle}
\newcommand{\cf}{\operatorname{cf}}
\newcommand{\Im}{\operatorname{Im}}
\newcommand{\range}{\operatorname{range}}
\newcommand{\trcl}{\operatorname{trcl}}
\newcommand{\Club}{\operatorname{Club}}
\newcommand{\ex}[2]{\paren{\exists #1}\paren{#2}}
\newcommand{\fa}[2]{\paren{\forall #1}\paren{#2}}
\newcommand{\rank}{\operatorname{rank}}

#

\newcommand{\ybar}{\overline{y}}
Let \(\overline{y}\) abbreviate \(y_1,\dots,y_n\) where how many variables there are doesn't matter.

> Let \(\phi(\overline{y})\) be a formula with free variables as shown.
> Show that
> \[ C_\phi = \set{\alpha<\omega_1: \paren{\forall\overline{y}\in L_\alpha}\left[\phi^{L_\alpha}(\overline{y}) \iff \phi^{L_{\omega_1}}(\overline{y})\right]} \]
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
Define \(F:L_{\omega_1}^n \to \omega_1\) as follows.
In the case that \(\paren{\exists x\in L_{\omega_1}} \psi^{L_{\omega_1}}(x,\ybar)\),
define \(F(\ybar)\) to be the least \(\alpha\in\omega_1\) such that \(\paren{\exists x\in L_\alpha} \psi^{L_{\omega_1}}(x,\ybar)\),
and let \(F(\ybar) = 0\) otherwise.
Next define \(G:\omega_1\to \omega_1\) as \(G(\alpha) = \sup_{\ybar\in L_{\alpha}} F(\ybar)\),
note that \(G(\alpha)\) exists as \(\abs{L_\alpha} = \abs{\alpha} < \omega_1\).
Now let \[C_\phi = C_\psi \cap \operatorname{Lim}(\omega_1) \cap \set{\alpha \in \omega_1: \alpha\text{ is closed under }G} \]
which is the intersection of 3 clubs, and therefore a club.

It remains to show that for every \(\alpha \in C_\phi, \ybar\in L_\alpha\)
\[
\paren{\exists x\in L_\alpha} \psi^{L_\alpha}(x,\ybar) \iff
\paren{\exists x\in L_{\omega_1}} \psi^{L_{\omega_1}}(x,\ybar)
\]

Suppose there is \(x\in L_\alpha\) satisfying \(\psi^{L_\alpha}(x,\ybar)\),
then as \(\alpha \in C_\psi\), it follows that \(\psi^{L_{\omega_1}}(x,\ybar)\) holds,
and since \(L_\alpha \subseteq L_{\omega_1}\) we complete the proof.

Conversely suppose there exists \(x\in L_{\omega_1}\) such that \(\psi^{L_{\omega_1}}(x,\ybar)\),
we need to produce an \(x'\in L_\alpha\) such that \(\psi^{L_\alpha}(x',\ybar)\).
First find \(\beta < \alpha\) such that all \(\ybar \in L_\beta\), which we can since \(\ybar\) is finite and \(\alpha\) is limit.
Note that from definition \(0 < F(\ybar) \leq G(\beta)\), and closure gives \(G(\beta) < \alpha\).
So there exists \(x' \in L_{F(\ybar)} \subseteq L_\alpha\) satisfying \(\psi^{L_{\omega_1}}(x',\ybar)\).
Since \(\alpha \in C_\psi\) this means that \(\psi^{L_\alpha}(x',\ybar)\) holds as well.

#

> Find a sentence \(\psi\) such that \(\psi^{V_{\omega_1}}\) holds
> but at every \(\alpha < \omega_1\), \(\psi^{V_\alpha}\) fails.

This sentence holds in \(V_{\omega_1}\) but fails when relativised to \(V_\alpha\) whenever \(\alpha < \omega_1\) is a successor,
\[ \psi_1 \equiv \fa{x}{\exists y}\paren{x\in y}. \]
Also, the axiom of infinity holds in \(V_{\omega_1}\) but fails for all \(\alpha \leq \omega\).
It remains to produce a sentence which fails for all stages \(\alpha \in (\omega,\omega_1) \cap \operatorname{Lim}(\omega_1)\) but holds at stage \(\omega_1\).
We claim that this sentence works
\[
\psi_2 \equiv
\paren{\forall X,R}
\paren{\exists \gamma, g} \paren{
\begin{aligned}
&\abs{X} \leq \omega \land R \text{ well-orders } X \\&\qquad
\implies
\gamma\in\mathbf{ORD} \land
g \text{ witnesses }
(X,R) \cong (\gamma, \in)
\end{aligned}
}.
\]

__Claim.__ \(\abs{X} \leq \omega\) is absolute between \(V_\alpha\) and \(\mathbf{V}\)
whenever \(\alpha > \omega\) is a limit ordinal.

First note that \(\omega\) is absolute for \(V_\alpha\), and
\(\abs{X} \leq \omega\) is \(\Sigma_1\).
So by the Tarski-Vaught criterion we just have to show that for any \(X\in V_{\alpha}\),
\[
\ex{f}{f: X \to \omega \text{ is injective}}
\implies
\ex{f\in V_\alpha}{f: X \to \omega \text{ is injective}}
\]
and this holds because all functions \(f: X\to \omega\) are enumerated finitely many stages after \(X\),
that is if \(X\in V_\beta\) for some \(\beta < \alpha\),
the witness \(f\) still remains in \(V_\alpha\).

__Claim.__ "\(R\) well-orders \(X\)" is absolute between \(V_\alpha\) and \(\mathbf{V}\)
whenever \(\alpha > \omega\) is a limit ordinal.

"\(R\) well-orders \(X\)" is \(\Pi_1\), so we only need to show that
for any \(X,R\in V_\alpha\),
\begin{align*}
&\fa{Y\in V_\alpha}{Y\subseteq X \implies Y \text{ has an } R\text{-minimal element}}
\\
&\qquad\implies
\fa{Y}{Y\subseteq X \implies Y \text{ has an } R\text{-minimal element}}.
\end{align*}
as the other clauses that form "\(R\) well-orders \(X\)" are all \(\Delta_0\).
This statement also holds since \(\alpha\) is limit, and when \(X\in V_\alpha\),
all \(Y\) satisfying \(Y\subseteq X\) are also in \(V_\alpha\).

Also note that \(\gamma \in \mathbf{ORD}\) and
"\(g\) witnesses \((X,R) \cong (\gamma, \in)\)" are \(\Delta_0\).

__\(\psi_2^{V_{\omega_1}}\) holds.__

Let \(X,R\in V_{\omega_1}\) with \(\abs{X} \leq \omega\) and \(R\) a well ordering on \(X\),
then let \(\gamma = \operatorname{type}(X,R) < \omega_1\) so \(\gamma \in V_{\omega_1}\).
In addition the (unique) witness \(g: X\to \gamma\) has rank below \(\max(\rank(X),\gamma) + \omega < \omega_1\),
as similar to argument above all functions \(X\to\gamma\) are enumerated in finitely many stages after \(\beta < \omega_1\) where both \(\gamma, X \in V_\beta\).

__Let \(\alpha<\omega_1\) be a limit ordinal greater than \(\omega\),
then \(\psi_2^{V_\alpha}\) fails.__

Fix \(X\in V_\alpha\) a countably infinite set (\(\omega\) will do),
all possible relations on \(X\) are enumerated in finitely many stages after \(X\).
Since all well orderings of \(X\) are in \(V_\alpha\), let \(R \in V_\alpha\)
well order \(X\) such that \(\gamma = \operatorname{type}(X,R) > \alpha\),
then we can see that \(\gamma \notin V_\alpha\), and it follows from the uniqueness of \(\operatorname{type}\) that no \(\gamma, g\) can exist in \(V_\alpha\).

Finally, let \(\psi = \psi_1 \land \psi_2 \land \text{Inf}\) and \(\psi^{V_\alpha}\) will fail for all \(\alpha < \omega_1\) but \(\psi^{V_{\omega_1}}\) will hold.

<div style="height:50vh"></div>
