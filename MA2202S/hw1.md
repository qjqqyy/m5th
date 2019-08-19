---
title: MA2202S Homework 1
author: Qi Ji
date: 2nd September 2018
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

# Question 1 {-}

Closure and associativity follows.

Let \(a \in G\), by RG4 there exists \(b\in G\) such that \(ab = e\), then
\begin{align*}
    ab &= e \\
    bab &= be \\
    &= b \tag*{by (RG3)}
\end{align*}
by RG4 we also have \(c \in G\) such that \(bc = e\), then
\begin{align*}
    babc &= bc \\
    ba(bc) &= e \\
    bae &= e \\
    ba &= e \tag*{by (RG3)}
\end{align*}
we now have \(ab = ba = e\) which proves G4.

Now that we have shown that our inverse is double-sided, let \(a\in G\), we have
\begin{align*}
    ea &= a a^{-1} a \\
    &= ae \\
    &= e \tag*{by (RG3)}
\end{align*}
this proves G3, so \((G, *)\) is a group.
\qed

# Question 2 {-}

## Part 0, \(ab = e\) implies \(ba = e\). {-}

Suppose \(ab = e\), then
\begin{align*}
    bab &= b \\
    babb^{-1} &= bb^{-1} \\
    ba &= e  \tagQED
\end{align*}

## Part (i), \(\left(a^{-1}\right)^{-1} = a\). {-}

By part 0, we can just show that \(a^{-1} a = e\), which is clear from definition of \(a^{-1}\).

## Part (ii), \(\p{ab}^{-1} = b^{-1} a^{-1}\). {-}

By part 0, we can just show that \(\p{ab} b^{-1} a^{-1} = e\), which is true because
\[ abb^{-1}a^{-1} = aa^{-1} = e. \]

## Part (iii), cancellation law. {-}

Suppose \(ac = bc\), then \(acc^{-1} = bcc^{-1} \implies a = b\).
Similarly suppose \(ca = cb\) then \(c^{-1}ca = c^{-1}cb \implies a = b\).

## Part (iv), \(ax = b\) has unique solution \(x\) in \(G\). {-}

Suppose \(ax = b\), then \(x = a^{-1}b\), which could be verified to be a solution.
For uniqueness, suppose there exists \(x, x'\in G\) such that
\(ax = ax' = b\), then \(x = x'\) by cancellation law.

## Part (v), {-}
Let \(m,n\in \Z\), \(a \in G\).
Note that conclusion trivially holds if \(m=0\) or \(n=0\).

Suppose \(n < 0, m > 0\), then
\begin{align*}
    a^m a^n
    &= \underbrace{a\cdot a\cdots a}_{m \text{ times}}\cdot
    \underbrace{a^{-1}\cdot a^{-1} \cdots a^{-1}}_{-n \text{ times}} \\
    &= \begin{cases}
        \underbrace{a\cdot a\cdots a}_{m + n \text{ times}} &\text{if } \abs{m} \geq \abs{n} \\
        \underbrace{a^{-1}\cdot a^{-1}\cdots a^{-1}}_{-n - m \text{ times}} &\text{if } \abs{m} < \abs{n}
    \end{cases}
\end{align*}
In both cases, \(a^ma^n = a^{m+n}\).
An analogous argument works for the case where \(n > 0\) and \(m < 0\).

Now suppose \(n > 0, m > 0\), then
\begin{align*}
    a^m a^n &=
    \underbrace{a\cdot a\cdots a}_{m\text{ times}}
    \cdot
    \underbrace{a\cdot a\cdots a}_{n\text{ times}}
    \\ &=
    \underbrace{a\cdot a\cdots a}_{m+n\text{ times}}
    \\ &=
    a^{m+n}
\end{align*}
and the exact same argument also works the case where \(n < 0, m < 0\) (replace \(a\) with \(a^{-1}\)).
\qed

# Question 3 {-}

## Part (i) {-}

From elementary set theory we get the result that \(\phi^{-1}\) is a bijection too.
It remains to show that \(\phi^{-1}\) is also a group homomorphism.

Let \(h, h'\in H\).
\begin{align*}
    h \star h'
    &=
    \phi\p{\phi^{-1}\p{h}}
    \star 
    \phi\p{\phi^{-1}\p{h'}}
    \\
    &=
    \phi\p{\phi^{-1}\p{h}
    *
    \phi^{-1}\p{h'}}
    \\
    \phi^{-1}\p{h\star h'}
    &= \phi^{-1}\p{ \phi\p{\phi^{-1}\p{h} * \phi^{-1}\p{h'}}} \\
    &= \phi^{-1}(h) * \phi^{-1}(h') \tagQED
\end{align*}

## Part (ii) {-}

Again, from elementary set theory, we have the result that \(\psi \circ \phi\) -- a composition of two bijections, is a bijection.
Let \(g_1, g_2 \in G\).
\begin{align*}
    \p{\psi\circ\phi}\p{g_1 * g_2}
    &= \psi \p{\phi\p{g_1 * g_2}} \\
    &= \psi \p{\phi(g_1) \star \phi(g_2)} \\
    &= \psi\p{\phi(g_1)} \bullet \psi\p{\phi(g_2)} \\
    &= \p{\psi\circ\phi}(g_1) \bullet \p{\phi\circ\phi}(g_2)
\end{align*}
Hence \(\psi\circ\phi\) is a group isomorphism.
\qed

