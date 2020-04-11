---
title: Week 8 Exercise
author: Qi Ji
date: 31st March 2020
---

\newcommand{\ACA}{\mathbf{ACA}}
\newcommand{\PA}{\mathbf{PA}}
\newcommand{\model}{\vDash}
\newcommand{\models}{\vDash}
\newcommand{\prove}{\vdash}
\newcommand{\proves}{\vdash}
\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\let\phi\varphi

# \(\ACA_0\) is arithmetically conservative over \(\PA^U\)

Let \(M = (|M|,U_M,0_M,1_M,+_M,\cdot_M,\exp_M, <_M) \model \PA^U\).
For each arithmetical formula \(\phi(x)\) in \(\mathcal{L}_2(|M|\cup\{U\})\)
we associate a witness \(X_\phi \subseteq |M|\) satisfying
\(\forall x[\phi(x) \leftrightarrow x\in X_\phi]\).
Now collect all such witnesses
\[\mathcal{S} = \set{X_\phi: \phi(x)\text{ arithmetical}}\]
and we show that
\[ M' = (|M|, \mathcal{S}, 0_M, 1_M, +_M,\cdot_M,\exp_M,<_M)\model \ACA_0. \]
Firstly by our choices of \(X_\phi\) it's easy to see that
\(M'\models \text{arithmetical-}\mathbf{CA}\).
The second order induction axiom
\[ \forall X\left[
0\in X\land \forall x\left(
x\in X\rightarrow x+1\in X
\right)
\rightarrow \forall x\left(x\in X\right)
\right] \]
is also satisfied by \(M'\) as we have only added arithmetical sets to \(\mathcal{S}\) and for any \(X_\phi \in \mathcal{S}\),
\[ \phi(0)\land \forall x \left(\phi(x)\rightarrow \phi(x+1)\right) \rightarrow
\forall x (\phi(x)) \]
is an instance of \(\mathbf{IND}\) in \(\PA^U\).

So suppose \(F\) is an arithmetic formula and \(\ACA_0\prove F\),
let \(M = (|M|,U_M,\dots)\model \PA^U\) and use construction above
to get \(M' = (|M|,\mathcal{S}_M,\dots)\model \ACA_0\).
As \(M'\model F\) and \(F\), being arithmetic, only quantifies over \(|M|\),
\(M\models F\) too.

#

\newcommand{\qrank}{q\operatorname{-rnk}}

Find strength of \(\PA + I\Sigma_n\).

Let \(\PA_n q\prove^{m}_{k} \Gamma\Rightarrow\Delta\) also be like \(\PA_n \prove^m_k \Gamma\Rightarrow\Delta\) where we replace cut rank with \(\qrank\).

## (a)

> If \(\PA_n q\prove^m_{n+2+r+1} \Gamma\Rightarrow\Delta\) then \(\PA_n q\prove^{4^m}_{n+2+r} \Gamma\Rightarrow\Delta\).

Given \(\phi\) is a formula with \(\qrank(\phi) \geq n+1\) and we want to eliminate cuts involving \(\phi\).

Given \(\Sigma_n\) induction, any formula produced by an instance our induction axiom \(I\Sigma_n\) is \(\Pi_{n+1}\),
so if we have \(\phi\) a formula with \(\qrank(\phi) > n+1\),

* \(\phi\) is too complicated (say \(\Pi_{n+2}\)) to ever be involved with an instance of induction axiom,
  then we directly apply reduction lemma.

* We can also directly apply reduction lemma until \(\phi\) itself originated in an instance of induction axiom.

* For cases where \(\phi\) is simple enough (\(\Pi_{n+1}\)) but has an inflated \(\qrank\),
  let's just restrict our induction axiom to not work on \(\phi\) but only its prenex normal form, this should not affect the strength.

## (b)

> If \(\PA_n q\prove^m_{n+2} \Gamma\Rightarrow\Delta\) then \(\PA_\omega q\proves^{\omega + k}_{n+2} \Gamma'\Rightarrow\Delta'\).

I think the stronger bound given by the First Interpretation Theorem still works here
and the weaker bound in Pohler 7.3.19 (\(\omega\cdot(m+1)\)) is due to induction being weakened into a structural *rule* from an *axiom*.

## (c)

> If \(\PA_\omega q\prove^{\alpha}_{1+m+1} \Gamma\Rightarrow\Delta\)
> then \(\PA_\omega q\prove^{4^\alpha}_{1+m} \Gamma\Rightarrow\Delta\).

Proof of cut elimination theorem almost exactly applies here.

## (d)

> If \(\PA_\omega q\prove^{\alpha}_1 \Gamma\Rightarrow\Delta\),
> then \(\PA_\omega \prove^{\omega\cdot \alpha}_1 \Gamma\Rightarrow\Delta\).

I still cannot figure out how to reduce quantifier-free cuts to atomic cuts only introducing a \(\omega\cdot\) factor
so I will just skip and black-box.

## (e)


> Compute \(\lVert \PA_n \rVert\).

In general, this is useful,
\[ 4^{\omega\cdot\alpha} = (4^\omega)^\alpha = \omega^{\alpha}. \]
Whenever \(\PA_n\proves \Gamma\Rightarrow\Delta\), we have
\[\begin{aligned}
\PA_n q&\proves^m_{n+2} \Gamma\Rightarrow\Delta \\
\PA_\omega q&\proves^{\omega+k}_{n+2} \Gamma\Rightarrow\Delta \\
\PA_\omega q&\proves^{4^{\omega+k}}_{n+1} \Gamma\Rightarrow\Delta \\
\PA_\omega q&\proves^{\omega\cdot l}_{n+1} \Gamma\Rightarrow\Delta \text{ where } l = 4^k \\
\PA_\omega q&\proves^{\omega^l}_{n} \Gamma\Rightarrow\Delta \text{ as } 4^{\omega\cdot l} = \omega^l \\
\PA_\omega q&\proves^{\omega^{\omega^{l-1}}}_{n-1} \Gamma\Rightarrow\Delta \text{ as } 4^{\omega^l} = \omega^{\omega^{l-1}}\\
\end{aligned}\]
and so on, so in general we have
\[ \PA_\omega q\proves^\alpha_1 \Gamma\Rightarrow\Delta \]
where
\[ \alpha = \omega^{\omega^{\cdot^{\cdot^{\cdot^{m}}}}} \]
where \(\omega^{-}\) is iterated \(n\) times starting from some finite \(m\).
Now by part (d),
\(\omega\cdot\alpha = \alpha\) when \(n>1\) and \(\omega\cdot\alpha = \omega^{m+1}\) when \(n=1\),
and we have
\[ \PA_\omega \proves^{\alpha}_1 \Gamma\Rightarrow\Delta. \]

We should be able to measure \(\lVert \PA_n \rVert\) with
\[ \left. \omega^{\omega^{\cdot^{\cdot^{\cdot^{\omega}}}}} \right\} \text{\(n\) iterated exponentiations from \(\omega\)} \]
but I still cannot convince myself how allowing atomic cuts are fine (which is Pohler Exercise 7.3.18?).
