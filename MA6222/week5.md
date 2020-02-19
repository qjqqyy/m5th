---
title: MA6222 Exercise for Week 5
author: Qi Ji
date: 19th February 2019
---

\let\phi\varphi
\let\epsilon\varepsilon

#

\newcommand{\Cr}{\operatorname{Cr}}

> Prove \(\alpha \mapsto \phi_\alpha(0)\) is continuous.

Let \(f(\alpha) = \phi_\alpha(0)\) and
\(U\subseteq \mathbf{ON}\) be a nonempty set, we want \(f(\sup U) = \sup f[U]\).

In the case where \(\sup U = \max U\) result easily follows as \(f\) preserves order,
so without loss of generality we consider the case where \(\lambda = \sup U\) is a limit.

It suffices to show that
\[ \sup f[U] = \sup_{\xi\in U} \min \Cr(\xi) \stackrel{?}{=} \min\bigcap_{\xi\in U} \Cr(\xi) = \min \bigcap_{\xi<\lambda} \Cr(\xi) = f(\lambda). \]

For any \(\zeta \in U\),
\[ \min \Cr(\zeta) \leq \min\bigcap_{\xi\in U} \Cr(\xi). \]

Conversely we check that for all \(\zeta\in U\),
\[ \sup_{\xi\in U} \min \Cr(\xi) = \sup_{\xi\in U, \xi > \zeta} \min \Cr(\xi) \in \Cr(\zeta) \]
as \(\xi>\zeta\) implies \(\Cr(\xi)\subsetneq \Cr(\zeta)\) and \(\Cr(\zeta)\) is closed,
therefore \(\sup_{\xi\in U}\min\Cr(\xi) \in \bigcap_{\xi\in U} \Cr(\xi)\).
Now if \(\alpha < \sup_{\xi\in U}\min\Cr(\xi)\), then \(\alpha < \min\Cr(\zeta)\) for some \(\zeta\in U\) which means \(\alpha\notin\bigcap_{\xi\in U}\Cr(\xi)\).
This shows the minimality.

#

\newcommand{\SC}{\operatorname{SC}}

> \(\SC := \{\alpha: \phi_\alpha(0) = \alpha\}.\)
> Prove lemma 4.30 which says \(\SC = \{\alpha: \alpha>0 \land \forall \xi,\eta<\alpha, \phi_\xi(\eta) < \alpha\}\).

In general, each \(\beta \in\Cr(\alpha)\),
satisfies for all \(\xi<\alpha\), \(\phi_\xi[\beta] \subseteq \beta\).
To see this let \(\beta = \phi_\alpha(\eta)\) and let \(\gamma<\beta\),
then by Theorem 4.25 (ii) 1
\[\phi_\xi(\gamma) < \beta = \phi_\alpha(\eta).\]

Now when \(\alpha\in\SC\), then as \(\alpha \in \Cr(\alpha)\) the desired closure property follows.

Conversely suppose \(\alpha>0\) satisfies the closure property,
to show \(\alpha\in\SC\) it suffices to show that \(\phi_\alpha(0) \leq \alpha\).
We first immediately observe that for all \(\xi,\eta<\alpha\), \(\xi + \eta \leq \phi_\xi(0) + \eta \leq \phi_\xi(\eta) < \alpha\), so \(\alpha \in \mathbb{AP}\).

By induction on \(\beta\) we show \(\beta<\phi_\alpha(0) \implies \beta<\alpha\).
If \(\beta\notin\mathbb{AP}\) just use induction hypothesis as \(\alpha\in\mathbb{AP}\).
Now for the case that \(\beta\in\mathbb{AP}\),
\(\beta = \phi_\xi(\eta)\) for \(\eta<\beta\).
By \(\phi\)-comparison, the only valid case for
\[ \phi_\xi(\eta) < \phi_\alpha(0) \]
entails that \(\xi < \alpha\), and by induction hypothesis \(\eta < \alpha\) too, so \(\beta = \phi_\xi(\eta) < \alpha\).

#

Define \(\psi:\epsilon_0 \to \mathcal{F}\) recursively as follows,
\[ \psi(0)(x) = 0 \]
and whenever \(\alpha =_{NF} \omega^{\alpha_1} + \dots + \omega^{\alpha_n}\),
\[ \psi(\alpha)(x) = x^{\psi(\alpha_1)(x)} + \dots + x^{\psi(\alpha_n)(x)} \]
we can structurally induct to check that \(f\) is onto.

It remains to show \(\alpha<\beta\implies \psi(\alpha)\prec \psi(\beta)\).
We induct on \(\beta\).
Suppose \(0< \alpha<\beta\) (\(\alpha=0\) case is trivial) and
\begin{align*}
\alpha &=_{NF} \omega^{\alpha_1} + \dots + \omega^{\alpha_m} \\
\beta &=_{NF} \omega^{\beta_1} + \dots + \omega^{\beta_n}
\end{align*}
now compare the normal forms.

Case \(m<n\) and \(\alpha_i = \beta_i\) for all \(i\leq m\), then
\[ \psi(\alpha) + \text{some nonzero function} = \psi(\beta) \]
so \(\psi(\alpha) \prec \psi(\beta)\).

Case there exists \(j\) such that \(\alpha_j < \beta_j\) and
\(\alpha_i = \beta_i\) for all \(1\leq i<j\).
By induction hypothesis as \(\psi(\alpha_j) \prec \psi(\beta_j)\),
so let \(k_0\) such that for all \(x\geq k_0\)
\begin{gather*}
\psi(\alpha_j)(x) + 1 \leq \psi(\beta_j)(x) \\
x\cdot x^{\psi(\alpha_j)(x)} \leq x^{\psi(\beta_j)(x)} \\
\underbrace{x^{\psi(\alpha_j)(x)} + \dots + x^{\psi(\alpha_j)(x)}}_{x\text{ copies}} \leq x^{\psi(\beta_j)(x)}
\end{gather*}

Now choose \(k \geq \max(m-j+1, k_0)\)
that also witnesses \(\psi(\alpha_i) \prec \psi(\alpha_j)\) for all \(j<i\leq m\),
that is whenever \(x\geq k\), \(\psi(\alpha_i)(x) < \psi(\alpha_j)(x)\).

Whenever \(x\geq k\),
\begin{align*}
x^{\psi(\alpha_j)(x)} + \dots + x^{\psi(\alpha_m)(x)}
&\leq \underbrace{x^{\psi(\alpha_j)(x)} + \dots + x^{\psi(\alpha_j)(x)}}_{m-j\text{ copies}} \\
&< \underbrace{x^{\psi(\alpha_j)(x)} + \dots + x^{\psi(\alpha_j)(x)}}_{x\text{ copies}} \\
&\leq x^{\psi(\beta_j)(x)} \\
&\leq x^{\psi(\beta_j)(x)} + \dots + x^{\psi(\beta_n)(x)}
\end{align*}
so it follows that
\[ \psi(\alpha) \prec \psi(\beta). \]

So by induction \(\psi\) witnesses the isomorphism \((\epsilon_0,<)\cong(\mathcal{F}, \prec)\).

The order type of one variable polynomials under \(\prec\) is \(\omega^\omega = \psi^{-1}\{\text{one variable polynomials}\}\).
