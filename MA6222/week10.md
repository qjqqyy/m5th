---
title: Week 10 Exercises
author: Qi Ji
date: 1st April 2020
header-includes: |
  \usepackage{turnstile}
  \usepackage{bussproofs}
  \newcommand{\To}{\ \mbox{\Large\(\Rightarrow\)\ }}
---

\let\phi\varphi
\let\epsilon\varepsilon
\newcommand{\set}[1]{\left\{ #1 \right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\sq}[1]{\left[ #1 \right]}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\proves}{\sststile{}{}}


<!--
Using package \href{http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/turnstile/turnstile-en/turnstile_article.pdf}{\texttt{turnstile}}, one can type pretty sequents such as
\[ \sststile{k}{n} \Gamma\To\Delta. \]
-->

When we define \(\lnot A := A\to\bot\),
it is clearer to discard the \(\lnot\mathrm{L}\) and \(\lnot\mathrm{R}\) rules
and only use the arrow ones.
It also turns out that I typed the majority of stuff below while
using a fake "\(\to\mathrm{L}\)" that is more symmetric to \(\to\mathrm{R}\), which is
\begin{prooftree}
    \Axiom$\Gamma \fCenter A\to B$
    \RightLabel{``$\to$ L''} \dottedLine
    \UnaryInf$\Gamma, A \fCenter B$
\end{prooftree}
so let's just show that "$\to$L" rule is admissible using the actual $\to$L rule.
\begin{prooftree}
    \AxiomC{$\vdots$ \scriptsize} \noLine
    \UnaryInf$\Gamma\fCenter A\to B$

    \Axiom$A\fCenter A$
    \Axiom$B\fCenter B$
    \RightLabel{\scriptsize $\to$L}
    \BinaryInf$A\to B,A\fCenter B$

    \LeftLabel{\scriptsize cut}
    \BinaryInf$\Gamma, A\fCenter B$
\end{prooftree}
I don't think we can derive my fake rule using the real one, since
\begin{prooftree}
    \AxiomC{$\vdots$ \scriptsize} \noLine
    \UnaryInf$\Gamma\fCenter A$

    \AxiomC{$\vdots$ \scriptsize need real $\to$L here!} \noLine
    \UnaryInf$A\to B\fCenter A\to B$
    \LeftLabel{\scriptsize ``$\to$L''}
    \UnaryInf$A\to B, A\fCenter B$

    \LeftLabel{\scriptsize cut}
    \BinaryInf$\Gamma, A\to B\fCenter B$

    \AxiomC{$\vdots$ \scriptsize} \noLine
    \UnaryInf$B,\Gamma\fCenter \Delta$

    \LeftLabel{\scriptsize cut}
    \BinaryInf$\Gamma, A\to B\fCenter \Delta$
\end{prooftree}
the axiom pseudo-rule for non-atomic formulas is derived using the real \(\to\)L rule.

In any case for everything below, \(\to\)L refers to the fake one unless otherwise stated.

# Lemma 1 {-}

> \( I \sststile{}{} \lnot\lnot A^N \To A^N \).

Case \(A\) atomic, then we have a special case of
\( I\proves \lnot\lnot\lnot\tau \fCenter \lnot\tau \)
\begin{prooftree}
    \Axiom$\lnot\tau \fCenter \lnot\tau$
    \RightLabel{\scriptsize $\to$L}
    \UnaryInf$\tau, \lnot\tau \fCenter \bot$
    \RightLabel{\scriptsize $\to$R}
    \UnaryInf$\tau \fCenter \lnot\lnot\tau$

    \Axiom$\lnot\lnot\lnot\tau \fCenter \lnot\lnot\tau\to\bot$
    \RightLabel{\scriptsize $\to$L}
    \UnaryInf$\lnot\lnot\lnot\tau,\lnot\lnot\tau \fCenter \bot$
    \RightLabel{\scriptsize cut}
    \BinaryInf$\tau, \lnot\lnot\lnot\tau \fCenter \bot$
    \RightLabel{\scriptsize $\to$R}
    \UnaryInf$\lnot\lnot\lnot\tau \fCenter \lnot\tau$
\end{prooftree}

Case \(A\) is \(B\land C\), then assume we already have
\(I\proves \lnot\lnot B^N\To B^N\) and
\(I\proves \lnot\lnot C^N\To C^N\),
we want \(I\proves \lnot\lnot (B^N\land C^N) \To B^N\land C^N\).
\begin{prooftree}
    \Axiom$B^N\fCenter B^N$
    \RightLabel{\scriptsize $\land$L}
    \UnaryInf$B^N\land C^N\fCenter B^N$
    \dashedLine \RightLabel{\scriptsize cut with $B^N,\lnot B^N\Rightarrow\bot$}
    \UnaryInf$\lnot B^N,B^N\land C^N\fCenter \bot$
    \RightLabel{\scriptsize $\to$ R}
    \UnaryInf$\lnot B^N \fCenter \lnot(B^N\land C^N)$

    \AxiomC{$\vdots$ \scriptsize $\tau,\lnot\tau\Rightarrow\bot$} \noLine
    \UnaryInf$\lnot(B^N\land C^N), \lnot\lnot(B^N\land C^N) \fCenter\bot$

    \LeftLabel{\scriptsize cut}
    \BinaryInf$\lnot B^N, \lnot\lnot(B^N\land C^N)\fCenter \bot$
    \LeftLabel{\scriptsize $\to$R}
    \UnaryInf$\lnot\lnot(B^N\land C^N)\fCenter \lnot\lnot B^N$
    \LeftLabel{\scriptsize cut with IH} \dashedLine
    \UnaryInf$\lnot\lnot(B^N\land C^N)\fCenter B^N$
\end{prooftree}
similar for \(C^N\) then \(\land R\) gives
\(I\proves \lnot\lnot(B^N\land C^N)\To B^N\land C^N\) as desired.

Case \(A\) is \(B\lor C\), assume the same IH and we want
\(I\proves \lnot\lnot \lnot(\lnot B^N \land \lnot C^N)\To\lnot(\lnot B^N \land \lnot C^N)\)
but this is an instance of "triple negation entails single negation".

Case \(A\) is \(B \to C\) is in lecture slides.

Case \(A\) is \(\forall x B(x)\), assume \(I\proves \lnot\lnot B^N(t) \To B^N(t)\) with occurences of \(t\) suitably indicated and we want
\(I\proves \lnot\lnot \forall x B^N(x) \To \forall x B^N(x)\).
\begin{prooftree}
    \Axiom$B^N(t) \fCenter B^N(t)$
    \LeftLabel{\scriptsize $\forall$L}
    \UnaryInf$\forall x B^N(x) \fCenter B^N(t)$
    \AxiomC{$\vdots$ \scriptsize $\tau,\lnot\tau\Rightarrow\bot$} \noLine
    \UnaryInf$B^N(t),\lnot B^N(t) \fCenter \bot$
    \LeftLabel{\scriptsize cut}
    \BinaryInf$\lnot B^N(t),\forall x B^N(x) \fCenter \bot$
    \LeftLabel{\scriptsize $\to$R}
    \UnaryInf$\lnot B^N(t) \fCenter\lnot \forall x B^N(x)$

    \AxiomC{$\vdots$ \scriptsize $\tau,\lnot\tau\Rightarrow\bot$}\noLine
    \UnaryInf$\lnot\lnot\forall x B^N(x), \lnot\forall x B^N(x)\fCenter \bot$

    \RightLabel{\scriptsize cut}
    \BinaryInf$\lnot\lnot\forall x B^N(x), \lnot B^N(t)\fCenter \bot$
    \RightLabel{\scriptsize $\to$R}
    \UnaryInf$\lnot\lnot\forall x B^N(x) \fCenter \lnot\lnot B^N(t)$
    \RightLabel{\scriptsize cut with IH} \dashedLine
    \UnaryInf$\lnot\lnot\forall x B^N(x) \fCenter B^N(t)$
    \RightLabel{\scriptsize $\forall$R}
    \UnaryInf$\lnot\lnot\forall x B^N(x) \fCenter \forall xB^N(x)$
\end{prooftree}
where in the \(\forall\)R application the eigenvariable condition is satisfied.

Case \(A\) is \(\exists x B(x)\), apply "triple negation entails single negation".

# Lemma 2 {-}

> If \(\proves\Gamma\To\Delta\)
> then \(I\proves\Gamma^N,\lnot\Delta^N\To\bot\).

I just interpret \(\Gamma\To\) as \(\Gamma\To\bot\) and add the axiom \(\bot\To B\) for any formula \(B\),
which gives back \emph{ex falso quodlibet}.
The advantage of doing so is all intuitionistic sequents will have \textbf{exactly} 1 formula on the RHS instead of at most 1.

Cases where the last derivation is axiom and $\to$R are in slides.

Case where the last derivation is $\lnot$L,
\begin{prooftree}
    \Axiom$\Gamma_1 \fCenter\Delta,A$
    \RightLabel{$\lnot$L}
    \UnaryInf$\Gamma_1,\lnot A\fCenter \Delta$
\end{prooftree}
I'm interpreting \((\lnot A)^N\) as \(\lnot A^N\).
This is sensible as \((\lnot A)^N\) expands to \((A\to \bot)^N\),
and treating \(\bot\) as atomic \((\lnot A)^N = A^N\to \bot^N\) which is intuitionistically equivalent to \(A^N\to \bot = \lnot A^N\).
So we want \(I\proves \Gamma_1^N,\lnot A^N,\lnot\Delta^N\To\bot\) which is just the IH.

Case where the last derivation is $\lnot$R,
\begin{prooftree}
    \Axiom$\Gamma, A \fCenter\Delta_1$
    \RightLabel{$\lnot$R}
    \UnaryInf$\Gamma \fCenter \Delta_1, \lnot A$
\end{prooftree}
we want \(I\proves \Gamma^N,\lnot\Delta_1^N,\lnot\lnot A^N\To\bot\),
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma^N,A^N,\lnot\Delta_1^N \fCenter \bot$
    \LeftLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot A^N$

    \AxiomC{$\vdots$ \scriptsize $\tau,\lnot\tau\Rightarrow\bot$} \noLine
    \UnaryInf$\lnot A^N, \lnot\lnot A^N \fCenter \bot$

    \RightLabel{\scriptsize cut}
    \BinaryInf$\Gamma^N, \lnot\Delta_1^N, \lnot\lnot A^N \fCenter \bot$
\end{prooftree}

Case where the last derivation is $\to$L (the classical one).
Then for some \(A \to B\) we have
\begin{prooftree}
    \Axiom$\Gamma_1\fCenter\Delta_1,A$
    \Axiom$B,\Gamma_1\fCenter\Delta_2$
    \RightLabel{$\to$L}
    \BinaryInf$A\to B,\Gamma_1\fCenter \Delta_1,\Delta_2$
\end{prooftree}
we want to show \(I\proves A^N\to B^N,\Gamma_1^N,\lnot\Delta_1^N,\lnot\Delta_2^N\To\bot\),
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta_1^N,\lnot A^N\fCenter \bot$
    \LeftLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma_1^N,\lnot\Delta_1^N \fCenter \lnot\lnot A^N$
    \LeftLabel{\scriptsize cut with Lemma 1} \dashedLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta_1^N \fCenter A^N$

    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta_2^N, B^N\fCenter \bot$

    \LeftLabel{\scriptsize weaken, ACTUAL (not fake) $\to$L}
    \BinaryInf$\Gamma_1^N,\lnot\Delta_1^N,\lnot\Delta_2^N,A^N\to B^N\fCenter \bot$
\end{prooftree}

Case last derivation is \(\land\)L1
\begin{prooftree}
    \Axiom$\Gamma_1,B\fCenter \Delta$
    \RightLabel{$\land$L1}
    \UnaryInf$\Gamma_1,B\land C\fCenter\Delta$
\end{prooftree}
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, B^N\fCenter \bot$
    \LeftLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, \fCenter \lnot B^N$

    \AxiomC{$\vdots$\scriptsize Lem 1 case $\land$} \noLine
    \UnaryInf$\lnot B^N\fCenter \lnot(B^N\land C^N)$

    \RightLabel{\scriptsize cut}
    \BinaryInf$\Gamma_1^N,\lnot\Delta^N \fCenter B^N\land C^N\to\bot$
    \RightLabel{\scriptsize $\to$L}
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, B^N\land C^N\fCenter \bot$
\end{prooftree}
and similarly for \(\land\)L2.

Suppose last derivation is \(\land\)R,
\begin{prooftree}
    \Axiom$\Gamma\fCenter \Delta_1,A$
    \Axiom$\Gamma\fCenter \Delta_1,B$
    \RightLabel{$\land$R}
    \BinaryInf$\Gamma\fCenter \Delta_1,A\land B$
\end{prooftree}
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \lnot A^N\fCenter \bot$
    \LeftLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot\lnot A^N$
    \LeftLabel{\scriptsize cut with lemma 1} \dashedLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter A^N$

    \AxiomC{$\vdots$ \scriptsize with the other IH} \noLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter B^N$

    \RightLabel{\scriptsize $\land$R}
    \BinaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter A^N\land B^N$
    \RightLabel{\scriptsize cut with $\tau\Rightarrow \lnot\lnot\tau$} \dashedLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot\lnot(A^N\land B^N)$
    \RightLabel{\scriptsize $\to$L}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \lnot(A^N\land B^N) \fCenter \bot$
\end{prooftree}
as desired, since \((A\land B)^N = A^N\land B^N\).

Suppose last derivation is \(\lor\)L,
\begin{prooftree}
    \Axiom$A, \Gamma_1\fCenter \Delta$
    \Axiom$B, \Gamma_1\fCenter \Delta$
    \RightLabel{$\lor$L}
    \BinaryInf$A\lor B,\Gamma_1\fCenter \Delta$
\end{prooftree}
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, A^N\fCenter \bot$
    \LeftLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N \fCenter \lnot A^N$

    \AxiomC{$\vdots$ \scriptsize the other IH} \noLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N \fCenter \lnot B^N$

    \RightLabel{\scriptsize $\land$R}
    \BinaryInf$\Gamma_1^N,\lnot\Delta^N \fCenter \lnot A^N\land \lnot B^N$
    \RightLabel{\scriptsize cut with $\tau\Rightarrow \lnot\lnot\tau$} \dashedLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N \fCenter \lnot\lnot(\lnot A^N\land \lnot B^N)$
    \RightLabel{\scriptsize $\to$L}
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, \lnot(\lnot A^N\land \lnot B^N) \fCenter \bot$
\end{prooftree}
as desired, note \((A\lor B)^N = \lnot(\lnot A^N \land \lnot B^N)\).

Suppose last derivation is \(\lor\)R1,
\begin{prooftree}
    \Axiom$\Gamma\fCenter \Delta_1,A$
    \RightLabel{$\lor$R1}
    \UnaryInf$\Gamma\fCenter \Delta_1,A\lor B$
\end{prooftree}
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \lnot A^N\fCenter \bot$
    \LeftLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot\lnot A^N$

    \AxiomC{$\vdots$\scriptsize similar to Lem 1 case $\land$} \noLine
    \UnaryInf$\lnot (\lnot A^N)\fCenter \lnot(\lnot A^N\land \lnot B^N)$

    \LeftLabel{\scriptsize cut}
    \BinaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter\lnot(\lnot A^N\land \lnot B^N)$
    \RightLabel{\scriptsize cut with $\tau\Rightarrow \lnot\lnot\tau$} \dashedLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot\lnot\lnot(\lnot A^N\land \lnot B^N)$
    \RightLabel{\scriptsize $\to$L}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \lnot(\lnot A^N\land \lnot B^N) \fCenter \bot$
\end{prooftree}
as desired.
Similar for \(\lor\)R2.

Suppose last derivation is \(\forall\)L,
\begin{prooftree}
    \Axiom$F(t),\Gamma_1\fCenter \Delta$ \RightLabel{$\forall$L}
    \UnaryInf$\forall x F(x), \Gamma_1 \fCenter\Delta$
\end{prooftree}
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, F^N(t) \fCenter \bot$
    \RightLabel{\scriptsize $\forall$L}
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, \forall x F^N(x) \fCenter \bot$
\end{prooftree}

Suppose last derivation is \(\exists\)R,
\begin{prooftree}
    \Axiom$\Gamma\fCenter \Delta_1, F(t)$ \RightLabel{$\exists$R}
    \UnaryInf$\Gamma \fCenter\Delta_1, \exists x F(x)$
\end{prooftree}
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \lnot F^N(t) \fCenter \bot$
    \RightLabel{\scriptsize $\forall$L}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \forall x \lnot F^N(x) \fCenter \bot$
    \RightLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot \forall x \lnot F^N(x)$
    \RightLabel{\scriptsize cut with $\tau\Rightarrow \lnot\lnot\tau$} \dashedLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot\lnot\lnot \forall x \lnot F^N(x)$
    \RightLabel{\scriptsize $\to$L}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \lnot\lnot \forall x \lnot F^N(x) \fCenter \bot$
\end{prooftree}
note \(\lnot \forall \lnot F^N(x) = (\exists x F(x))^N\) as desired.

Suppose last derivation is \(\forall\)R with eigenvariable \(a\),
\begin{prooftree}
    \Axiom$\Gamma\fCenter \Delta_1, F(a)$ \RightLabel{$\forall$R}
    \UnaryInf$\Gamma \fCenter\Delta_1, \forall x F(x)$
\end{prooftree}
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \lnot F^N(a) \fCenter \bot$
    \RightLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot\lnot F^N(a)$
    \LeftLabel{\scriptsize cut with Lemma 1} \dashedLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter F^N(a)$
    \RightLabel{\scriptsize $\forall$R}
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \forall x F^N(x)$
    \LeftLabel{\scriptsize cut with $\tau\Rightarrow \lnot\lnot\tau$} \dashedLine
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N \fCenter \lnot\lnot \forall x F^N(x)$
    \UnaryInf$\Gamma^N,\lnot\Delta_1^N, \lnot \forall x F^N(x) \fCenter \bot$
\end{prooftree}

Suppose last derivation is \(\exists\)L with eigenvariable \(a\),
\begin{prooftree}
    \Axiom$F(a), \Gamma_1\fCenter \Delta$ \RightLabel{$\exists$L}
    \UnaryInf$\exists x F(x), \Gamma_1 \fCenter\Delta$
\end{prooftree}
\begin{prooftree}
    \AxiomC{$\vdots$ IH} \noLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, F^N(a) \fCenter \bot$
    \RightLabel{\scriptsize $\to$R}
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N \fCenter \lnot F^N(a)$
    \RightLabel{\scriptsize $\forall$R}
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N \fCenter \forall x \lnot F^N(x)$
    \LeftLabel{\scriptsize cut with $\tau\Rightarrow \lnot\lnot\tau$} \dashedLine
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N \fCenter \lnot\lnot \forall x \lnot F^N(x)$
    \UnaryInf$\Gamma_1^N,\lnot\Delta^N, \lnot \forall x \lnot F^N(x) \fCenter \bot$
\end{prooftree}
as desired since \((\exists x F(x))^N = \lnot\forall x \lnot F^N(x)\).
