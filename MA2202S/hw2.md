---
title: MA2202S Homework 2
author: Qi Ji (A0167793L)
date: 25th September 2018
...

\let\setminus\smallsetminus
\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}
\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\qed}{\hfill$\square$}
\newcommand{\tagQED}{\tag*{$\square$}}
\newcommand{\Z}{\mathbb{Z}}\newcommand{\Q}{\mathbb{Q}}\newcommand{\N}{\mathbb{N}}\newcommand{\R}{\mathbb{R}}\newcommand{\F}{\mathbb{F}}
\newcommand{\p}[1]{\left( #1 \right)}
\newcommand{\ang}[1]{\left\langle #1 \right\rangle}

# 

Claim that \(\p{\mu_n,\times} \simeq \p{\Z/n\Z, +}\).
Define \(\phi : \mu_n \to \Z/n\Z\), with the knowledge that
\[ \mu_n = \set{e^{2\pi i k /n} : k \in \set{0,\dots,n-1} } \]
so we can define
\[ \phi(z) = \frac{n \log z}{2\pi i} \]
such that \(\phi\) satisfies
\[ \phi(e^{2\pi ik/n}) = k. \]
Then we can observe that \(\phi^{-1} : \Z/n\Z \to \mu_n\) is given by
\[ \phi^{-1}(k) = e^{2\pi ik/n}. \]

Let \(H\) be a subgroup of \(\p{\mu_n, \times}\).
If \(H\) is a trivial subgroup, we are done, so suppose it's not trivial.

Consider \(H' = \phi(H)\) the subgroup of \(\Z/n\Z\).
Let \(d\) denote the smallest number in \(H' \setminus\set{0}\).

__Claim.__ \(d \mid n\) and \( H' = \set{0, d, 2d, \dots, n-d} \) exactly.
:   Suppose on the contrary that \(d\nmid n\), then there exists \(q \in\Z^+_0, r\in\set{1,\dots,d-1}\) such that
\begin{align*}
    n &= qd + r \\
    n - \underbrace{d - d - \dots - d}_{q\text{ times}} &= r
\end{align*}
which implies that \(r \in H'\), contradicting minimality of \(d\).
So \(d\mid n\) which shows that \(\set{0,d,2d,\dots, n-d} \subseteq H'\).

:   For second part of claim, suppose on the contrary we have \( H' \supsetneq D = \set{0, d, 2d, \dots, n-d} \).
We take \(k \in H'\setminus D\), then divide \(k\) by \(d\), because \(k\notin D\), we have \(q\in\Z^+_0, r\in\set{1,\dots,d-1}\) such that
\[ k = qd + r \]
then by a similar argument as just now, \(r\in H'\) which contradicts minimality of \(d\).

Letting \(r\in\Z^+\) such that \(dr = n\),
we have \(H' = \set{0, d, 2d, \dots, (r-1)d}\),
unravel \(\phi\) to get
\[ H = \set{1, e^{2\pi id/n}, e^{2\pi i2d/n},\dots, e^{2\pi i(r-1)d/n} } \]
as \(r = n/d \),
\[ H = \set{1, e^{2\pi i/r}, e^{2\pi i2/r},\dots, e^{2\pi i(e-1)/r} } \]
then it can be observed that \(H = \mu_r\) with \(r\mid n\).

Conversely suppose \(H = \mu_r\) where \(r\mid n\), let \(d\in\N\), \(rd = n\).
Elements of \(\mu_r\) can be enumerated as
\[ \mu_r = \set{1, e^{2\pi i/r}, e^{2\pi i 2/r},\dots, e^{2\pi i (r-1)/r} } \]
as \(r = n/d\),
\[ \mu_r = \set{1, e^{2\pi id/n}, e^{2\pi i 2d/n},\dots, e^{2\pi i (r-1)d/n} } \subseteq \mu_n \]
take \(e^{2\pi iad/n}, e^{2\pi ibd/n} \in \mu_r\) where \(a,b\in\set{0,\dots,r-1}\), then
\begin{align*}
    e^{2\pi iad/n} e^{2\pi ibd/n} &= e^{2\pi i (a+b)d/n} \\
    &= e^{2\pi i (a+b-r)d/n} \\
\end{align*}
as \(e^{2\pi i rd/n} = e^{2\pi i} = 1\), so in both cases \(a+b \geq r\) and \(a + b < r\), we have
\(e^{2\pi iad/n} e^{2\pi ibd/n} \in \mu_r\), so \(\mu_r\) is a subgroup.

#

Factors of \(15\) are \(1, 3, 5, 15\). Using question 1,
we have trivial subgroups \(\set{0}\) and \(\ang{1} = \Z/15\Z\), we also have
the non-trivial subgroups \(\ang{3}\) and \(\ang{5}\).

#

\newcommand{\Stab}{\operatorname{Stab}}

## i. \(H=\Stab_G\p{s_0}\) is a subgroup of \(G\). {-}

Take \(h_1, h_2 \in H\), then
\begin{align*}
    \pi\p{h_1h_2, s_0}
    &= \pi\p{h_1, \pi\p{h_2, s_0}} \\
    &= \pi\p{h_1, s_0} \\
    &= s_0
\end{align*}
so \(h_1h_2 \in H\).

Also let \(h\in H\),
\begin{align*}
    s_0 &= \pi\p{e, s_0} \\
    &= \pi\p{h^{-1}h, s_0} \\
    &= \pi\p{h^{-1}, \pi\p{h, s_0}} \\
    &= \pi\p{h^{-1}, s_0} \\
\end{align*}
then \(h^{-1} \in H\).
Therefore \(H\) is a subgroup.

## ii. {-}
> \(\pi\p{g_1, s_0} = \pi\p{g_2, s_0}\) if and only if \(g_1 \in g_2 H \).

Suppose \(\pi\p{g_1, s_0} = \pi\p{g_2, s_0}\), then
\begin{align*}
    \pi\p{g_2^{-1},\pi\p{g_1, s_0}} &= \pi\p{g_2^{-1},\pi\p{g_2, s_0}} \\
    \pi\p{g_2^{-1}g_1, s_0} &= \pi\p{g_2^{-1}g_2, s_0} \\
    &= \pi\p{e, s_0} \\
    &= s_0
\end{align*}
so \(g_2^{-1}g_1 \in H\) which implies \(g_1 \in g_2 H\).

Conversely suppose \(g_1 \in g_2 H\), then \(g_2^{-1} g_1 \in H\),
\begin{align*}
    \pi\p{g_1, s_0}
    &= \pi\p{g_1, \pi\p{g_1^{-1}g_2, s_0}} \\
    &= \pi\p{g_1, \pi\p{g_1^{-1}, \pi\p{g_2, s_0}}} \\
    &= \pi\p{g_1g_1^{-1}, \pi\p{g_2, s_0}} \\
    &= \pi\p{e, \pi\p{g_2, s_0}} \\
    &= \pi\p{g_2, s_0} \\
\end{align*}

## iii. Show \(f\) is well-defined and injective {-}

>where \(f\) is defined as
\begin{align*}
f: G/H &\to S \\
gH &\mapsto \pi\p{g, s_0}.
\end{align*}

Let \(g, g'\in G\),
\begin{align*}
    & gH = g'H \\
    \iff& g\in g'H \tag*{by tutorial 3A Q1} \\
    \iff& \pi\p{g, s_0} = \pi\p{g', s_0} \tag*{by part ii} \\
    \iff& f(gH) = f(g'H)    \tag*{by definition of $f$}
\end{align*}

the \(\Rightarrow\) argument gives well-definedness and the \(\Leftarrow\) argument gives injectivity.

## iv. \(\abs{G} = \abs{O}\abs{H}\). {-}

Since \(G\) is finite, by theorem 38 we have
\[\abs{G/H} = \frac{\abs{G}}{\abs{H}}.\]

Consider \(f' : G/H \to O\) defined by \(f'(gH) = f(gH)\), which is just \(f\) contracted to its image.
As \(f\) is already an injection, restricting it to its image will make \(f'\) a bijection,
then we have
\begin{gather*}
    \frac{\abs{G}}{\abs{H}} = \abs{G/H} = \abs{O} \\
    \abs{G} = \abs{H}\abs{O}.
\end{gather*}


