---
title: Models of Set Theory without Choice
subtitle: Final Presentation
author: Qi Ji
institute: NUS Department of Mathematics
date: 30th March 2021
theme: Madrid
fontsize: 12pt
colorlinks: true
linkcolor: White
citecolor: PineGreen
urlcolor: MidnightBlue
header-includes:
- '\newcommand*{\textsmall}[1]{{\small #1}}'
- '\usepackage{qrcode}'
- '\usepackage{xspace}'
- '\graphicspath{{MA4199/}}'
- '\newcommand*{\set}[1]{\left\{#1\right\}}'
- '\newcommand*{\paren}[1]{\left(#1\right)}'
- '\newcommand*{\sq}[1]{\left[ #1 \right]}'
- '\newcommand*{\abs}[1]{\left\lvert#1\right\rvert}'
- '\newcommand*{\Angle}[1]{\left\langle#1\right\rangle}'
---

## Slides

\let\epsilon\varepsilon
\let\phi\varphi
\let\setminus\smallsetminus
\newcommand*{\Con}{\operatorname{Con}}
\renewcommand*{\G}{\mathcal{G}}
\renewcommand*{\P}{\mathbb{P}}
\newcommand*{\Q}{\mathbb{Q}}
\newcommand*{\V}{\mathbf{V}}
\newcommand*{\dom}{\operatorname{dom}}
\newcommand*{\ZF}{\mbox{\normalfont \textsf{ZF}}\xspace}
\newcommand*{\ZFminus}{\ensuremath{\mbox{\normalfont \textsf{ZF}}^-}\xspace}
\newcommand*{\ZFC}{\mbox{\normalfont \textsf{ZFC}}\xspace}
\newcommand*{\ZFCminus}{\ensuremath{\mbox{\normalfont \textsf{ZFC}}^-}\xspace}
\newcommand*{\forces}{\Vdash}
\newcommand*{\trcl}{\operatorname{trcl}}

\centering
<https://m5th.b0ss.net/MA4199/slides-final.pdf>

\qrcode[height=10em]{https://m5th.b0ss.net/MA4199/slides-final.pdf}

# Recap

## Axiom of Choice

\[ \forall A\ \exists R \paren{R \text{ well-orders } A}. \]

"Useful" consequences of choice

* comparability of cardinalities
* every vector space has a basis
* product of compact space is compact
* \(\dots\)

Less "nice" consequences of choice

* Banach-Tarski paradox
* existence of non-Lebesgue measurable set

## Constructible Universe

Gödel (1938) produced a model of \ZFC from \ZF, showing that

\[ \Con(\ZF) \rightarrow \Con(\ZFC). \]

## Fraenkel-Mostowski Model

Working in \ZF set theory with atoms, Fraenkel (1922) produced a model where choice fails,
the methods were refined by Mostowski (1938).
By permuting the atomic members in the universe, they showed that
\[ \Con(\textsf{ZFA}) \rightarrow \Con(\textsf{ZFA}) + \lnot\textsf{Choice}. \]

## Cohen Model

Cohen (1963) invented forcing and showed that
\[ \Con(\ZF) \Rightarrow \Con(\ZF) + \lnot\textsf{Choice} \]
which completes the independence argument.

In addition, in Cohen second model, there is a countable family of pairs without choice function,
showing that
\[ \Con(\ZF) \Rightarrow \Con(\ZF) + \lnot\textsf{Countable Choice}. \]

# Solovay Model

## Result

**Theorem** (Solovay)**.**
Suppose there is a model of \ZFC with an inaccessible cardinal,
then there is a model of \ZF in which Choice fails, and all subsets of reals are Lebesgue-measurable.

## Overview

* Start with ground model \(M\) where \(M\models \kappa\text{ is inaccessible}\).

* Force with Lévy collapse.

* Look at inner-model of all objects definable from countable sequence of ordinals.

* Random real forcing is related to membership in a null set.

* Any countable-ordinal-definable subset of reals \(A\subseteq \mathbb{R}\) is witnessed by a countable sequence of ordinals \(s\).

* Perform random-real forcing over \(M[s]\) and use the information to produce a Borel set \(X\) such that \(X\triangle A\) is measure zero.





# Lévy Collapse

## Definition

\newcommand*{\Lv}{\operatorname{Lv}}
**Definition.**
For any \(S\subseteq \mathbf{ORD}\), the \emph{Lévy collapsing order} for \(S\) is
\[
    \Lv(S) = \set{
        \begin{split}
            p: &\ p\text{ is a function} \\
               &\land \abs{p} < \omega \\
               &\land \dom(p) \subseteq S\times\omega \\
               &\land \forall (\alpha,n)\in\dom(p)\sq{p(\alpha,n) = 0 \lor p(\alpha,n)\in \alpha}
        \end{split}
    }
\]
ordered by reverse inclusion.

## Properties of Lévy Collapse

#. \(\Lv(S)\) is **almost homogeneous**, for any \(p,q\), there is an automorphism \(\pi\) on \(\Lv(S)\) such that \(\pi(p)\) is compatible with \(q\).

#. If \(p\forces \phi(\check{x}_1,\dots,\check{x}_n)\), then \(1_\P\forces \phi(\check{x}_1,\dots,\check{x}_n)\);  
   thus, either \(1_\P\forces \phi(\check{x}_1,\dots,\check{x}_n)\) or \(1_\P\forces \lnot\phi(\check{x}_1,\dots,\check{x}_n)\).

#. Suppose that \(S = X\cup Y\) is a disjoint union,
   and set \(\P_0 = \Lv(X)\) and \(\P_1 = \Lv(Y)\).
   Then \(G\) is \(\Lv(S)\)-generic iff \(G\) is of the form
   \[G = \set{p\cup q: p\in G_0\land q\in G_1 }\]
   where \(G_0\) is \(\P_0\)-generic, \(\paren{\P_1}^{M[G_0]} = \P_1\),
   and \(G_1\) is \(\P_1\)-generic over \(M[G_0]\).

## Properties of Lévy Collapse

4. When \(\kappa\) is regular and countable, \(\Lv(\kappa)\) has \(\kappa\)-c.c.,
   forcing with it preserves all cardinals \(\geq \kappa\).

#. Suppose \(\kappa\) is regular, \(\Lv(\kappa)\) has the \(\kappa\)-c.c., and
   \(G\) is \(\Lv(\kappa)\)-generic.  
   For any \(s\in M[G]\) with \(s:\gamma \to \mathbf{ORD}\) where \(\gamma < \kappa\),
   there is a \(\delta<\kappa\) such that \(s\in M\sq{G\cap\Lv(\delta)}\).

*Intuition.*
Forcing with \(\Lv(\kappa)\) "gently" collapses all cardinals strictly between \(\omega\) and \(\kappa\),
which causes \(M[G]\models \kappa = \omega_1\).

"Gentle" in the sense that any \(<\kappa\) sequence of ordinals is introduced at some earlier stage of the collapse.

## Properties of Lévy Collapse

6. Suppose \(M\models \abs{\P} \leq \abs{\alpha}\) and
   \[ 1_\P \forces \exists f\paren{f:\omega\to\alpha \text{ is onto}}.\]
   Then there is a dense subset \(D_\alpha\subseteq \Lv(\set{\alpha})\)
   and an injective embedding \(D_\alpha \to \P\) whose image is dense.

*Intuition.*
\(\Lv(\set{\kappa})\) is a way to collapse \(\kappa\) into \(\omega\),
this is a partial converse.
If \(\P\) collapses \(\alpha\) and renders it countable, then forcing with \(\P\) is equivalent to forcing with \(\Lv(\set{\alpha})\).

## An important lemma

Characterisation of \(M[G]\),
it allows us to "enlarge" the ground model to "absorb" any countable sequence of ordinals.
More precisely,

### Lemma.
Suppose \(\kappa>\omega\) is regular and \(G\) is \(\Lv(\kappa)\)-generic.
For any \(s:\omega\to\mathbf{ORD}\), \(s\in M[G]\),
there is a \(\Lv(\kappa)\)-generic filter \(H\) over \(M[s]\)
such that \(M[G] = M[s][H]\).

## Proof of important lemma

* Split \(G\) as follows, where \(\delta\) is given by property 5,
\begin{align*}
    G_0 &= G\cap\Lv(\delta), \\
    G_1 &= G\cap\Lv(\set{\delta}), \\
    G_2 &= G\cap\Lv(\kappa\setminus(\delta+1)).
\end{align*}
and \(s\in M[G_0]\).

* By intermediate model property, \(M[G_0] = M[s][H_0]\) where \(\P\in M[s]\) and \(H_0\) is generic over \(\P\).

* Let \(\Q = \P\times\Lv(\set{\delta}) \in M[s]\),
  by product forcing, \(M[s][H_0][G_1]\) is \(\Q\)-generic over \(M[s]\).
  Now
  \[ \abs{\Q} \leq \abs{\Lv(\delta)\times\Lv(\set{\delta})} = \abs{\Lv(\delta+1)} = \abs{\delta} \]
  and since \(\Q\) contains a copy of \(\Lv(\set{\delta})\),
  \[ 1_\Q \forces \exists f\paren{f:\omega\to\delta \text{ is onto}}. \]

##

* Applying property 6, in \(M[s]\) forcing with \(\Q\) is equivalent to forcing with \(\Lv(\set{\delta})\),
  so there is a \(\Lv(\set{\delta})\)-generic \(H_1\) such that \[ M[s][H_1] = M[s][H_0][G_1].\]

* As \( 1_{\Lv(\delta+1)} \forces \exists f\paren{f:\omega\to\delta \text{ is onto}} \), the same argument gives
  a \(\Lv(\delta+1)\)-generic (over \(M[s]\)) filter \(H_2\) such that \[ M[s][H_2] = M[s][H_1]. \]

* Now we can repeatedly apply property 3 to get
  \[
      \begin{split}
          M[G] &= M[G_0][G_1][G_2] = M[s][H_0][G_1][G_2]\\ 
               &= M[s][H_1][G_2] = M[s][H_2][G_2]
      \end{split}
  \]
  and it happens that \(H_2 \cup G_2\) is of the form in property 3, and thus generic over \(M[s]\).

# Random Real Forcing

## Definitions

\newcommand*{\B}{{\mathcal{B}}}

* "Reals" denote \(2^\omega\) the Cantor space, definitions and results apply to any other standard space (like \(\omega^\omega\) and real line), mutatis mutandis.

* For a binary string \(s \in 2^{<\omega}\), denote \(O(s) = \set{f\in 2^\omega: f\supseteq s}\).  
  \(\set{O(s): s\in 2^{<\omega}}\) is a base for the topology on \(2^\omega\).

* For each \(s\in 2^{<\omega}\), the Lebesgue measure of its corresponding \emph{basic open set} is the coin-flip measure,
  \[ m_L(O(s)) = \frac{1}{2^{\abs{s}}}. \]

* We fix a "nice" enumeration \( \Angle{\mathbf{s}_i : i\in\omega} \).

* Force with \(\B^* = \set{ X: X \text{ is a non-null Borel set}}\), ordered by inclusion.

## Coding Borel Sets

### Definition.
Let each \(c:\omega\to\omega\) can encodes a Borel set
\[ A_c = \begin{cases} \begin{aligned}
    &\bigcup \set{O(\mathbf{s}_i): c(i+1)=1} &\text{if } c(0) = 0, \\
    &2^\omega\setminus \bigcup\set{O(\mathbf{s}_i): c(i+1)=1} &\text{if } c(0) = 1, \\
    &\bigcap_{n\in\omega} \bigcup\set{O(\mathbf{s}_i) : c(2^n3^{i+1})=1} &\text{otherwise}.
\end{aligned} \end{cases} \]

## Properties of Coding scheme

i. If \(c(0) = 0\), \(A_c\) is open;
#. if \(c(0) = 1\), \(A_c\) is closed;
#. if \(c(0) > 1\), \(A_c\) is \(G_\delta\).
#. Each open, closed and \(G_\delta\) set is indexed by some code \(c\).
#. The following notions are absolute for \(M\):
   \[ \begin{matrix}
       A_c &;& A_c = 0 &;& A_c\subseteq A_d &;& A_c\subseteq\paren{2^\omega\setminus A_d} &;& A_c\cap A_d.
   \end{matrix} \]
#. The Lebesgue measure is absolute in the sense that for any code \(c\in M\),
   \[ m_L^M(A_c^M) = m_L(A_c).\]

## Characterizations of \(\B^*\)-forcing

**First characterization.** \(\B^*\)-forcing is akin to adding a single real.

### Theorem.
Suppose \(G\) is \(\B^*\)-generic,
then there is a unique real \(x \in 2^\omega\) such that for any closed code \(c\in M\),
\[ x\in A_c^{M[G]} \text{ iff } A_c^M \in G, \]
and \(M[x] = M[G]\).

## Proof

* Work in \(M[G]\), there is a unique real \(x\in2^\omega\) specified by
  \[ \set{x} = \bigcap\set{A_c^{M[G]}: c\in M \text{ is a closed code and } A_c^M\in G}. \]  
  The intersection is nonempty due to \(G\) being a filter.  
  The result is a singleton because for each \(n\in\omega\), this set is dense
  \[ \set{C\in \B^*: C\text{ is closed} \land \paren{\exists k\in2}\paren{\forall f\in C}\paren{f(n) = k} }. \]

* For closed code \(c\in M\), if \(A_c^M\in G\) then \(x\in A_c^{M[G]}\) follows from definition of \(x\).

## Proof

* Conversely suppose \(x\in A_c^{M[G]}\), need to show \(A_c^M\in G\).
  We just check that \(A_c^M\) meets each closed set in \(G\) as the following set is dense,
  \[ \set{C\in \B^*: C\text{ is closed} \land \paren{C\subseteq A\lor C\cap A = 0} }. \]

* Let \(d\) be a closed code with \(A_d^M\in G\),  
  by definition of \(x\), \(x \in A_c^{M[G]} \cap A_d^{M[G]}\)  
  by absoluteness, \(x \in A_c^M \cap A_d^M\)  
  so \(A_c^M\) meets every closed set in \(G\).

## Proof

We already defined \(x\) from \(G\), to show \(M[x] = M[G]\) we recover \(G\) from \(x\),
\[ G = \set{p\in\B^* : \exists c\paren{c\in M\text{ is closed code} \land x\in A_c^{M[x]} \land A_c^{M} \subseteq p} } \]

## Characterizations of \(\B^*\)-forcing

The \(x\) that was added is known as *random real*.

**Second characterization.** A random real avoids all null sets.

*Intuition.* Think of Cantor space \(2^\omega\) as a universal probability space,
then a random element would be one that avoids all probability zero (null) sets.

### Theorem
A real \(x\) is random over \(M\) iff \(x\notin A_c\) for any \(c\in M\) which encodes a \(G_\delta\) null set.

## Proof (\(\Rightarrow\))

* Let \(x\) be random and \(G\) be \(\B^*\)-generic such that \(M[x] = M[G]\).

* Let \(c\) be a \(G_\delta\) code for a null set, need \(x\notin A_c\).

* Write down the dense set \(D = \set{ C\in\B^*: C\text{ closed} \land C\subseteq \paren{2^\omega\setminus A_c} }\).

* \(G\cap D\ne 0\) so let \(d\in M\) be a closed code such that \(A_d^M \in G\cap D\).

* By definition of \(x\), \(x\in A_d^{M[G]}\) so by absoluteness \(x\in A_d\) and \(x\notin A_c\)

## Proof (\(\Leftarrow\))

* Suppose for all \(G_\delta\) codes for null set \(c\in M\), \(x\notin A_c\).

* Let \(G\) be recovered from \(x\) in manner of previous theorem. We show \(G\) is \(\B^*\)-generic over \(M\)

* Let \(D\in M\) be a dense set, by definition of \(G\) it suffices to show
  there exists \(p\in D\) and a closed code \(c\in M\) satisfying \(x\in A_c\) and \(A_c^M \subseteq p\).

* Let \(\mathcal{A}\subseteq \set{C: C\text{ closed} \land \exists p\in D\paren{C\subseteq p}}\)
  be maximal antichain in \(\B^*\).

* As \(\B^*\) algebra satisfies c.c.c., \(\abs{\mathcal{A}} \leq \omega\),
  let \(\Angle{ c_n:n \in\omega}\) such that
  \[\Angle{ A_{c_n} : n\in \omega }\text{ enumerates }\mathcal{A}. \]

## Proof (\(\Leftarrow\))

* Now define \(c\),
\[ c(2^n3^{i+1}) = 1 \text{ iff } O(\mathbf{s}_i) \cap A_{c_n} = 0. \]

* For each \(n\in\omega\), \(A_c\) includes all basic open sets that avoids \(A_{c_n}\),
  so \[A_c = \bigcap_{n\in\omega} \paren{2^\omega\setminus A_{c_n}} = 2^\omega\setminus\paren{\bigcup_{n\in\omega} A_{c_n}}.\]

* \(A_c\) is null by maximality of \(\mathcal{A}\).

* By hypothesis, \(x\notin A_c\), then \(x\in A_{c_n}\) for some closed code \(c_n\in M\).

# Solovay Model

## Definitions

* Assume \(\kappa\in M\) and \(M\models \kappa \text{ is an inaccessible cardinal}\).

* A set \(X\) is \emph{definable from a countable sequence of ordinals} iff
  for some \(s:\omega\to\mathbf{ORD}\) and some formula \(\phi(x_1,x_2)\),
  \[ y\in X \text{ iff } \phi(s,y). \]
  Denote as \(X\in \mathbf{COD}\).

### Proposition.

The collection of all hereditarily \(\omega\)-ordinal definable sets
\(\mathbf{HCOD} = \set{X: \trcl(X) \subseteq \mathbf{COD}}\)
is an inner model of \(\ZF\).

## Key Lemma

This result is built on the previously-established properties of the Lévy collapse.

### Lemma.

For each formula \(\phi(v)\), there is a \(\tilde{\phi}(v)\) such that
for any \(s:\omega\to\mathbf{ORD}, s\in M[G]\),
\[ M[G]\models \phi(s) \text{ iff } M[s] \models \tilde{\phi}(s). \]

## Proof of Key Lemma

* For any \(s\in \mathbf{ORD}^\omega \cap M[G]\), by "important lemma",
  there is a \(\P = \Lv(\kappa)\)-generic filter \(H\) over \(M[s]\) such that \(M[G] = M[s][H]\).

* Apply property 2 of Lévy collapse (taking ground model to be \(M[s]\)), we have
\[ M[s][H]\models \phi(s) \text{ iff } M[s] \models \left\ulcorner 1_\P \forces \phi(\check{s}) \right\urcorner. \]

* As forcing is definable in the ground model, take \(\tilde{\phi}\) to be the statement that encapsulates the forcing assertion.

## Solovay Theorem

::: {.block}
### Theorem.

Let \(G\) be \(\Lv(\kappa)\)-generic,
then in \(M[G]\), each subset of reals definable from a countable sequence of ordinals is Lebesgue measurable.
:::

In particular, there is a \textbf{Solovay model} \(N\), with \(M \subseteq N \subseteq M[G]\),
containing precisely \(\mathbf{HCOD}^{M[G]}\) where every subset of reals is Lebesgue measurable.

## Proof

Work in \(M[G]\).

* Let \(A\subseteq 2^\omega\) be a \(\omega\)-ordinal definable subset of reals,
  then for some \(s:\omega\to\mathbf{ORD}\) and formula \(\phi(v_1,v_2)\),
  \[ x\in A \text{ iff } \phi(s,x). \]

* By Key Lemma, we have \(\tilde{\phi}(v_1,v_2)\) such that
  \[ x\in A \text{ iff } M[s][x] \models \tilde{\phi}(s,x). \]

## Proof

* By 2nd characterization of \(\B^*\)-forcing over \(M[s]\),
  \[
      \begin{split}
          &\set{x\in2^\omega: x\text{ is not random over } M[s]} \\
          &\quad = \bigcup \set{A_c: c\in M[s] \text{ is a } G_\delta \text{ code for a null set}}.
      \end{split}
  \]

* RHS is countable union of null sets as \(\kappa\) remains inaccessible in \(M[s]\) (due to property 5), and \(\omega^\omega \cap M[s]\) is countable.

* **Objective.** Find Borel set \(X\) such that \(A\triangle X\) only has non-random reals.

## Proof.

* Now for \(\B^*\)-forcing argument over \(M[s]\), let \(\mathring{r}\) denote the canonical name for the random real.

* Let \(\mathcal{Y}\subseteq \set{C: C\text{ closed} \land \paren{C\forces\tilde{\phi}(\check{s},\mathring{r}) \lor C\forces\lnot\tilde{\phi}(\check{s},\mathring{r})}}\)
  be maximal antichain in \((\B^*)^{M[s]}\).

* If \(x\) is random over \(M[s]\),
\(x\in A\) iff \(M[s][x]\models \tilde{\phi}(s,x)\)
iff \(p\forces \tilde{\phi}(\check{s},\mathring{r})\) for some \(p\in H\) and \((\B^*)^{M[s]}\)-generic \(H\).

* \(H\) meets some \(q\in \mathcal{Y}\) which by first characterization gives
\[ x\in A\text{ iff } x\in \bigcup\set{A_c: A_c^{M[s]}\in \mathcal{Y}\land A_c^{M[s]} \forces \tilde{\phi}(\check{s},\mathring{r})}. \]

* By c.c.c. of \(\B^*\), \(\mathcal{Y}\) is countable, so the expression on the right is in fact a Borel set, which witnesses \(X\).

# Thank you
