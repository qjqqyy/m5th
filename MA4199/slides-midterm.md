---
title: Models of Set Theory without Choice
subtitle: Midterm Progress Talk
author: Qi Ji
institute: NUS Department of Mathematics
date: 19th January 2021
theme: Madrid
fontsize: 12pt
colorlinks: true
linkcolor: White
citecolor: PineGreen
urlcolor: MidnightBlue
header-includes:
- '\newcommand{\textsmall}[1]{{\small #1}}'
- '\usepackage{qrcode}'
- '\graphicspath{{MA4199/}}'
- '\renewcommand{\G}{\mathcal{G}}'
- '\renewcommand{\P}{\mathbb{P}}'
- '\newcommand{\V}{\mathbf{V}}'
- '\newcommand{\set}[1]{\left\{#1\right\}}'
- '\newcommand{\paren}[1]{\left(#1\right)}'
- '\newcommand{\sq}[1]{\left[ #1 \right]}'
- '\newcommand{\abs}[1]{\left\lvert#1\right\rvert}'
- '\newcommand{\dom}{\operatorname{dom}}'
- '\let\epsilon\varepsilon'
---

## Slides

\let\phi\varphi

<https://m5th.b0ss.net/MA4199/slides-midterm.pdf>

\qrcode[height=10em]{https://m5th.b0ss.net/MA4199/slides-midterm.pdf}

# Forcing

## Forcing Crash Course

* Start with \(M\) a transitive model of ZFC, consider \((\mathbb{P}, \leq, 1_\mathbb{P}) \in M\).

* \(\mathbb{P}\)-names \(M^\mathbb{P} = \set{(x,p): x\in M^\mathbb{P}, p\in \mathbb{P}}\) defined recursively.

* \(G\) generic over \(M\) when \(G\) meets every dense set in \(\mathbb{P}\).

  Intuitively \(G\) encodes an object added to \(M\) which does not have any property that is definable in \(M\).


## Symmetric extension

* Consider \(\G\) be a group of automorphisms \(\mathbb{P} \to \mathbb{P}\),

* Each \(\pi\in \G\) can be naturally extended into an automorphism \(\pi_*: M^\mathbb{P} \to M^\mathbb{P}\) by
  \[ \pi_*(x,p) = \set{(\pi_* y , \pi p ): y\in x}. \]

* Given a normal filter (on algebra of subgroups of \(\G\)) \(\mathscr{F}\) we can use it to define the notion of *symmetric*.
  A \(x\in M^\mathbb{P}\) is symmetric if its stabilizer is in the filter.

  Normal filters are also closed under conjugation, if \(\pi\in \G\) and \(H\in\mathscr{F}\) then \(\pi H \pi^{-1} \in\mathscr{F}\).

## Symmetric extension

* \(x\in M^{\mathbb{P}}\) is a hereditarily symmetric name if \(x\) is symmetric and every member in \(\dom(x)\) is hereditarily symmetric.
  Denote them \(\mathbf{HS}\).

* Consider subset of \(M[G]\) formed by using \(G\) to evaluate all the names in \(\mathbf{HS}\)
  \[ N = \set{ x[G]: x\in M^{\mathbb{P}} }. \]

* \(M \subseteq N \subseteq M[G]\)

  Check: \(N \models \textbf{ZF}\).


# Cohen models

## Basic Cohen model

* The first model produced in which choice fails (showing independence).

* Force with \(\mathbb{P}\) finite partial functions \(\omega\times\omega \rightharpoonup 2\),
  ordered by reverse containment \(\leq = \supseteq\).

* Idea: add \(\omega\) many reals satisfying
  \[ x_n = \set{m\in\omega: \left(\exists p\in G\right) p(n,m) = 1}. \]
  \(N\) should contain \( A = \set{x_n:n\in \omega } \) but not know how to well-order it.

* Come up with names for objects we wish to add
  \[ \mathring{x}_n = \set{(\check{m},p): m\in\omega, p\in\P,p(n,m) = 1} \]
  \[ \mathring{A} = \set{(\mathring{x}_n,1_\P): n\in\omega} \]


## Basic Cohen model

* Any permutation \(\pi_0: \omega \to \omega\) induces an automorphism \(\pi: \mathbb{P}\to\mathbb{P}\) as
  \[ \pi p = \set{((\pi_0 n, m), y): ((n,m),y) \in p} .\]

* Let \(\G\) be all such induced permutations on \(\mathbb{P}\), then for any finite \(B\subset \omega\),
  we look at permutations induced by ones in its stabilizer
  \[ \operatorname{fix}(B) = \set{ \pi\in \G: \forall n\in B\left( \pi_0 n = n \right) }. \]

* Use stabilizers of all finite subsets to generate a (normal) filter
  \[ \mathscr{F} = \set{H: \exists \text{ finite } B\subseteq \omega \left(\operatorname{fix}(B) \subseteq H\right) }. \]

* Let \(\G\) and \(\mathscr{F}\) determine \(\mathbf{HS}\) and if we let \(G\) be a generic filter, we yield a symmetric model \(N\).

## Failure of choice in basic Cohen model

* Check: \(\pi_* \mathring{x}_n = \mathring{x}_{\pi n} \)

  \(\mathring{x}_n\) is symmetric as its stabilizer contains \(\operatorname{fix}(\set{n})\).

* Claim: \(N\models x_i\ne x_j\) whenever \(i\ne j\)

  Suppose \(p\in \P\) such that \(p\Vdash \mathring{x}_i = \mathring{x}_j\).
  \(p\) is finite so we can find an extension \(q\leq p\) that forces \(m\in x_i \land m\notin x_j\) for some \(m\in\omega\).

Claim: **There does not exist a bijection \(f:\omega\to A\).**

* Suppose there is, let \(p_0 \in G\) such that \[p_0\Vdash \mathring{f} \text{ is a bijection } \check{\omega}\to\mathring{A}. \]


## Failure of choice in basic Cohen model

* \(f\in N\) so \(\mathring{f}\) is symmetric. Let \(B\subseteq \omega\) be finite such that \(\operatorname{fix}(B)\) is contained in stabilizer of \(\mathring{f}\).

* Let \(n\notin B, i\in\omega, p\leq p_0\) such that \[p\Vdash \mathring{f}(\check{i}) = \mathring{x}_n.\]

* Now we can find \(\pi\in\G\) satisfying
  
  i. \(\pi p\) compatible with \(p\)
  ii. \(\pi \in \operatorname{fix}(B)\)
  iii. \(\pi n\ne n\)

* Then \(\pi p \Vdash (\pi \mathring{f})(\pi \check{i}) = \pi \mathring{x}_{n}\), so
  \[p \cup \pi p \Vdash \mathring{f}(\check{i}) = \mathring{x}_n \land \mathring{f}(\check{i}) = \mathring{x}_{\pi n}. \]






## Second Cohen model

* Countable choice fails (\(N\) knows that our misbehaving set is countable).

* Force with \(\mathbb{P}\) finite partial functions \((\omega\times 2 \times\omega)\times\omega \rightharpoonup 2\),
  ordered by reverse containment \(\leq = \supseteq\).

Define the notions (\(\P\)-names omitted)

* \(x_{n\epsilon i} = \set{j\in\omega: \left(\exists p\in G\right) \left(p(n\epsilon i, j) = 1\right) }\)
* \(X_{n\epsilon} = \set{x_{n\epsilon i}: i\in\omega}\)
* \(P_n = \set{X_{n0}, X_{n1}}\)
* \(A = \set{P_n:n\in\omega}\)


## Second Cohen model

Again we can extend permutations on \((\omega\times2\times\omega)\) to permutations on \(\P\) naturally
\[\pi p = \set{ ((\pi_0(n\epsilon i), j), y): (((n\epsilon i),j), y) \in p }.\]

Restrict our attention to permutations \(\pi_0\) satisfying

i. \(n' = n\)
ii. for each \(n\) either \(\forall i\paren{\epsilon' = \epsilon}\) or \(\forall i\paren{\epsilon' \ne \epsilon}\)

Consider the automorphism group \(\G\) of all such permutations extended to \(\P\) then to \(M^\P\),
for any finite \(B\subset (\omega\times2\times\omega)\),
\[ \operatorname{fix}(B) = \set{ \pi\in \G: \forall n\in B\left( \pi_0 n = n \right) }. \]

Again we can generate a normal filter, and proceed to get symmetric model.


## Second Cohen model

* Check: \(x_{n\epsilon i}, X_{n\epsilon}, P_n, A\) all in \(N\) (their names are symmetric).

* Claim: \(N\models A\text{ is countable}\).

  Define \(\mathring{g} = \set{((\check{n}, \mathring{P}_n), 1_\P): n\in\omega}\), check that \(\mathring{g}\) is \(\mathbf{HS}\).
  Evaluating \(\mathring{g}\) will enumerate \(\left\langle P_n: n\in\omega\right\rangle\).

## Failure of choice in second Cohen model

Suppose \(f\) is a choice function on \(A\), let \(\mathring{f}\in\mathbf{HS}\) be its symmetric name and \(p_0\in G\) force
\[p_0\Vdash \mathring{f}\text{ is a function with domain } \mathring{A} \text{ and } \mathring{f}(\mathring{P}_n) \in \mathring{P}_n\text{ for all }n .\]

Let \(B\subseteq \omega\times2\times\omega\) such that stabiliser of \(\mathring{f}\) contains \(\operatorname{fix}(B)\),
let \(n\in\omega, p\leq p_0, \epsilon_0\) such that (wlog suppose \(\epsilon_0 = 0\))
\[ p\Vdash \mathring{f}(\mathring{P}_n) = \mathring{X}_{n0}. \]

We can find \(\pi\in\G\) satisfying

i. \(\pi p\) compatible with \(p\)
ii. \(\pi \in \operatorname{fix}(B)\)
iii. \(\pi(\mathring{X}_{n0}) = \pi(\mathring{X}_{n1})\)

## Failure of choice in second Cohen model

How? Observe that \(i\)-coordinate is "free",
we are free to shuffle the sequence \(\langle x_{n\epsilon i}:i\in\omega\rangle\).

Let \(\pi\) be extended from
\begin{align*}
\pi_0(n,0,i) &= \begin{cases}
(n,1,i+k) &\text{ when} i < k \\
(n,1,i-k) &\text{ when} k \leq i < 2k \\
(n,1,i) &\text{ otherwise}
\end{cases} \\
\pi_0(n,1,i) &= \text{similar to above} \\
&\text{and identity everywhere else.}
\end{align*}

With \(\pi\) obtained, use similar forcing argument as Cohen basic model to get
\[ N\models f\text{ is not a function}.\]


## Next steps

* Every set of real is Lesbegue measurable (Solovay).

* All uncountable cardinals being singular (Gitik).

# Thank you
