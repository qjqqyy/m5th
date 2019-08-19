---
title: MA2101S Homework 5
author: Qi Ji (A0167793L)
date: 12th March 2018
classoption:
- 11pt
...

\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Img}{\operatorname{Im}}
\newcommand{\spn}{\operatorname{span}}
\newcommand{\eval}{\operatorname{eval}}
\newcommand{\qed}{\hfill$\square$}
\let\oldphi\phi
\let\phi\varphi
\let\leq\leqslant
\let\geq\geqslant
\let\setminus\smallsetminus


Question 1
==========
>For any $n\in\N$, $p_n(X) := n X^{n+1} - (n+1)X^n + 1 \in \Q[X]$.
>Show that there exists $q_n \in \Q[X]$ such that $p_n(X) = (X-1)^2 q_n(X)$.

*Proof.*
Consider $q_n(X) := \sum_{i=0}^{n-1} (i+1) X^i \in \Q[X]$. Now compute $(X-1)^2 q_n(X)$,
\begin{align*}
    (X-1)^2 q_n(X) &= (X^2 - 2X +1) q_n(X)  \\
    &= X^2q_n(X) - 2X q_n(X) + q_n(X)   \\
    &= X^2\sum_{i=0}^{n-1} (i+1) X^i - 2X\sum_{i=0}^{n-1} (i+1) X^i + \sum_{i=0}^{n-1} (i+1) X^i    \\
    &= \sum_{i=0}^{n-1} (i+1) X^{i+2} - \sum_{i=0}^{n-1} 2(i+1) X^{i+1} + \sum_{i=0}^{n-1} (i+1) X^i    \\
    &= \sum_{i=2}^{n+1} (i-1) X^i - \sum_{i=1}^{n} 2i X^i + \sum_{i=0}^{n-1} (i+1) X^i    \\
    &= \sum_{i=1}^{n+1} (i-1) X^i - \sum_{i=1}^{n} 2i X^i + \sum_{i=0}^{n-1} (i+1) X^i    \\
%    &= \sum_{i=1}^n (i-1) X^i - \sum_{i=1}^{n} 2i X^i + \sum_{i=0}^{n-1} (i+1) X^i + nX^{n+1}   \\
    &= \sum_{i=1}^{n-1} (i-1) X^i - \sum_{i=1}^{n} 2i X^i + \sum_{i=0}^{n-1} (i+1) X^i + nX^{n+1} +(n-1)X^n  \\
    &= \sum_{i=1}^{n-1} (i-1) X^i - \sum_{i=1}^{n-1} 2i X^i + \sum_{i=0}^{n-1} (i+1) X^i + nX^{n+1} -(n+1)X^n  \\
    &= \sum_{i=1}^{n-1}\left[ (i-1) X^i - 2i X^i + (i+1) X^i \right] + nX^{n+1} -(n+1)X^n +1 \\
    &= \sum_{i=1}^{n-1}0 + nX^{n+1} -(n+1)X^n +1 \\
    &= nX^{n+1} -(n+1)X^n +1 = p_n
\end{align*}
Therefore $p_n(X)$ is divisible by $(X-1)^2$.
\qed

\newpage

Question 2
==========
>Let $K$ be a field, and let $a,b\in K$ with $a\ne 0$.
>Show that $(aX+b)^0,(aX+b)^1,(aX+b)^2,\dots$ form a basis for $K[X]$.

#### Linear independence.
*Proof*.
Consider any finite subset of naturals $S \subseteq \N$.
The claim is that $\set{ (aX+b)^s}_{s \in S}$ -- an arbitrary finite subset of $\set{ (aX+b)^i }_{i\in \N}$, is linearly independent.
To prove linear independence, proceed by induction on $|S|$.

__Base cases.__ If $|S| = 0$ or $|S| = 1$, linear independence is trivial.

__Induction hypothesis.__ Suppose for any $T \subseteq \N$ with $|T| = n-1$, $\set{ (aX+b)^t }_{t \in T}$ is linearly independent.

Now consider $S \subseteq \N$ with $|S| = n$.
Let $\omega \in S$ be the largest element in $S$, that is for any $s\in S$, $s \leq \omega$.
Because $S$ is finite and non-empty, $\omega$ actually exists.
Consider this equation,
\[ \sum_{s\in S} c_s (aX+b)^s = 0 \qquad \text{in } \Q[X]\]
where $(c_s)_{s\in S} \in K$ are coefficients indexed by $S$.
Comparing the coefficient of $X^\omega$, $c_\omega a^\omega = 0$, then because $a^\omega \ne 0$, $c_\omega = 0$.
Then the equation reduces to,
\[ \sum_{s\in S\setminus\set{\omega}} c_s (aX+b)^s = 0 \qquad \text{in } \Q[X]\]
then from induction hypothesis, because $|S\setminus\set{\omega}| = n-1$, using linear independence,
all the coefficients $(c_s)_{s\in S\setminus\set{\omega}}$ are zero, together with our earlier conclusion that $c_\omega = 0$, completes the proof that $\set{ (aX+b)^s }_{s \in S}$ is linearly independent.

Hence any finite subset of $\set{ (aX+b)^0,(aX+b)^1,(aX+b)^2,\dots }$ is linearly independent.
\qed

\newpage

#### Spanning.
*Proof.*
To show that $\set{ (aX+b)^i }_{i\in\N}$ spans $K[X]$, proceed by induction on the degree of the polynomial that lies in $K[X]$.

__Base cases.__ Trivial to see that zero polynomial is spanned. Since $(aX+b)^0 = 1$, all degree $0$ polynomials are spanned too.

__Induction hypothesis.__ Suppose any polynomial of degree strictly less than $n$ is spanned by $\set{ (aX+b)^i }_{i\in\N}$.

Let $f\in K[X]$ with $\deg(f) = n$, so $f = \sum_{i=0}^n f_i X^i$, where $f_0,\dots,f_n \in K$ are coefficients with $f_n \ne 0$. From binomial theorem,
\begin{align*}
    (aX+b)^n &= \sum_{r=0}^n \binom{n}{r} (aX)^rb^{n-r} \\
    &= a^nX^n + \sum_{r=0}^{n-1} \binom{n}{r} (aX)^rb^{n-r}
\end{align*}
as $a^n \ne 0$, proceed to compute $f - \frac{f_n}{a^n}(aX+b)^n$,
\begin{align*}
    f - \frac{f_n}{a^n}(aX+b)^n &= f_nX^n + \sum_{i=0}^{n-1} f_i X^i - \frac{f_n}{a^n} \left( a^nX^n + \sum_{r=0}^{n-1} \binom{n}{r} (aX)^rb^{n-r} \right) \\
    &= f_nX^n + \sum_{i=0}^{n-1} f_i X^i - f_nX^n - \frac{f_n}{a^n} \sum_{r=0}^{n-1} \binom{n}{r} a^rX^rb^{n-r} \\
    &= \sum_{r=0}^{n-1} \left( f_r X^r - \frac{f_n}{a^n} \binom{n}{r} a^rb^{n-r}X^r \right) \\
    &= \sum_{r=0}^{n-1} \left( f_r - \frac{f_n}{a^n} \binom{n}{r} a^rb^{n-r} \right) X^r
\end{align*}
This means $f - \frac{f_n}{a^n}(aX+b)^n$ is a polynomial with degree at most $n-1$, so by induction hypothesis, it is spanned by $\set{ (aX+b)^i }_{i\in\N}$. So there exists a finite subset $S\subseteq \N$, and coefficients $(c_s)_{s\in S} \in K$ indexed by $S$ such that
\[ f - \frac{f_n}{a^n}(aX+b)^n = \sum_{s\in S} c_s (aX+b)^s,\]
which gives
\[ f = \sum_{s\in S} c_s (aX+b)^s + \frac{f_n}{a^n}(aX+b)^n.\]
By strong induction, any polynomial is spanned by $\set{ (aX+b)^i }_{i\in\N}$. Therefore $\set{ (aX+b)^i }_{i\in\N}$ forms a basis for $K[X]$.
\qed

\newpage

Question 3
==========
>Let $K$ be a field, and let $h\in K[X]$ be a polynomial with $\deg(h) \geq 1$.
>Consider the linear endormorphism $\Phi$ of $K[X]$ given by
>\[\Phi: K[X]\to K[X],\qquad f\mapsto f(h).\]
>
>(a)  Show that $\Phi$ is injective.
>(b)  Show that $\Phi$ is an isomorphism if and only if $\deg(h) = 1$.

__Proposition.__ For any nonzero polynomials $f,g\in K[X]$, $\deg\left(f(g)\right) = \deg(f)\deg(g)$.

*Proof.*
Let $f_0,\dots,f_m \in K$ such that $f = \sum_{i=0}^m f_i X^i$
and $g_0,\dots,g_n \in K$ such that $g = \sum_{j=0}^n g_j X^j$, with $f_m\ne 0$ and $g_n \ne 0$, where $m = \deg(f), n = \deg(g), m,m \geq 0$, then
\begin{align*}
    f(g) &= \sum_{i=0}^m f_i g^i    \\
    &= \sum_{i=0}^m f_i \left( \sum_{j=0}^n g_j X^j \right)^i
\end{align*}
As $\deg(g^i) = i\cdot \deg(g)$ for any $i\in \N$, $\deg(f(g)) \leq m\cdot \deg(g)$.
Also note that in $f(g)$, the coefficient of $X^{mn}$ is $f_m g_n^m$, which is nonzero, therefore $\deg(f(g)) = mn = \deg(f)\deg(g)$.
\qed

(a)  *Proof.*
To show injectivity, proceed to show that $\Phi$ has a trivial kernel.
Suppose for a contradiction $\Phi$ has a non-trivial kernel, that is there exists $f \in K[X]$, with $\deg(f) \geq 0$, and $\Phi(f) = 0$.
This means $\deg\left(\Phi(f)\right) = \deg(0) = -\infty$,
but because both $f,h$ are nonzero polynomials, by proposition above, $\deg\left(f(h)\right) = \deg(f)\deg(h) \geq 0$ which is a contradiction.
\qed

(b)  *Proof.*
If $\deg(h) = 1$, from Question 2, since $h = aX+b$ where $a,b \in K$ with $a\ne 0$,
the set $\set{h^i}_{i\in \N}$ forms a basis of $K[X]$.
Evaluating $\Phi$ on the standard basis $\set{X^i}_{i\in \N}$ for $K[X]$ gives that
for any $i\in \N$, $\Phi(X^i) = h^i$.
Since $\Phi$ sends basis to basis, it is an isomorphism.

     Conversely suppose $\deg(h) \geq 2$, the claim is that $X \notin \Img(\Phi)$.
Consider the degree of the polynomial (point) we evaluate $\Phi$ at, for any $f\in K[X]$,

     *  Case $\deg(f) = -\infty$, $\Phi(f) = 0$, and $\deg(\Phi(f)) = -\infty$,
     *  Case $\deg(f) = 0$, $\Phi(f) = f$ is degree $0$,
     *  Case $\deg(f) \geq 1$, $\Phi(f) = f(h)$ has degree $\deg(f)\deg(h) \geq 2$.

     This means that no degree $1$ polynomial lies in $\Img(\Phi)$, therefore $\Phi$ is not an isomorphism.
\qed

\newpage

Question 4
==========
>Let $K$ be a field of characteristic $0$.
>Consider the linear endormorphism $S$ of $K[X]$ given by
>\[ S:K[X]\to K[X],\qquad \sum_{n=0}^d a_nX^n \mapsto \sum_{n=0}^d \frac{a_n}{n+1} X^{n+1}. \]
>Let $V\subseteq K[X]$ be a non-zero subspace which is stable under $S$. Show that $V$ is not finite-dimensional.

*Proof.*
Suppose for a contradiction that $V\subseteq K[X]$ is non-zero, stable under $S$ and is finite-dimensional, then $V$ has a finite basis $\mathcal{B}$.
Note that since $V$ is not the zero subspace, $\mathcal{B}$ is non-empty.
Consider $\deg(\mathcal{B}) \subseteq \N$, a finite and non-empty subset of natural numbers.
Let $\omega \in \deg(\mathcal{B})$ be the largest element, that is, for any $d\in \deg(\mathcal{B})$, $d \leq \omega$.
This means that there exists $z\in \mathcal{B}$ such that $\deg(z) = \omega$, and for any $b\in \mathcal{B}$, $\deg(b) \leq \deg(z)$.

As linear combination of polynomials do not increase the degree, for any $v \in \spn(\mathcal{B}) = V$, $\deg(v) \leq \omega$.
But now, consider $S(z)$. Let $z_0,\dots,z_\omega \in K$ with $z_\omega \ne 0$ such that $z = \sum_{i=0}^\omega z_i X^i$, then
\begin{align*}
    S(z) &= S\left( \sum_{i=0}^\omega z_iX^i \right) \\
    &= \sum_{i=0}^\omega \frac{z_i}{i+1} X^{i+1}
\end{align*}
which has degree $\omega+1$, as $\frac{z_\omega}{\omega+1} \ne 0$.
Then from our earlier conclusion that any $v\in V$ has degree less than or equal to $\omega$,
we have $z\in V$, but $S(z) \notin V$, which contradicts fact that $V$ is stable under $S$.
\qed

\newpage

Question 5
==========
>Let $K$ be a field of characteristic $0$. Consider the linear endomorphism $D$ of $K[X]$ given by
>\[D:K[X]\to K[X],\qquad \sum_{n=0}^d a_nX^n \mapsto \sum_{n=1}^d n a_n X^{n-1}.\]
>Let $V\subseteq K[X]$ be a finite dimensional subspace. Show that $D$ is nilpotent on $V$, i.e. there exists $m\in \N$ such that for any $f\in V$, one has $D^m(f) = 0$.

__Claim.__ For any nonzero $f \in K[X]$, $D^{\deg(f) + 1}(f) = 0$.

*Proof (of claim).*
Proceed by induction on $\deg(f)$, case $\deg(f) = 0$, it is clear that $D^1(0) = 0$. (There are no terms in a sum from 1 to 0.)
Suppose for any $g\in K[X]$ with $\deg(g) = n-1$, $D^n(g) = 0$.

Consider $f\in K[X]$ with $\deg(f) = n$, so $f_0,\dots,f_n \in K$ with $f_n\ne 0$ such that $f = \sum_{i=0}^n f_i X_i$, then by induction hypothesis,
\begin{align*}
    D^{n+1}(f) &= D^n\left( D(f) \right)    \\
    &= D^n\left( D\left( \sum_{i=0}^n f_i X^i \right) \right)    \\
    &= D^n\left( \sum_{i=1}^n if_i X^{i-1} \right)    \\
    &= 0
\end{align*}
Therefore by induction, for any nonzero $f \in K[X]$, $D^{\deg(f)+1}(f) = 0$.
\qed\    
An immediate corollary is that for any $f\in K[X]$, for any $m \in \N$, where $m > \deg(f)$, $D^m(f) = 0$.

*Proof (of Q5).*
$V$ is finite dimensional, so $V$ has a finite basis $\mathcal{B}$.
In the case that $V$ is the zero subspace, $D(0) = 0$ so $D$ is nilpotent.
For cases where $V$ is a non-zero subspace of $K[X]$, $\mathcal{B}$ is non-empty.
Consider $\deg(\mathcal{B})\subseteq \N$, which is a finite and non-empty subset of natural numbers.
It has the largest element $\omega$, where for any $d\in \deg(\mathcal{B})$, $d\leq \omega$.
This means that there exists $z\in \mathcal{B}$ such that $\deg(z) = \omega$, and for any $b\in \mathcal{B}$, $\deg(b) \leq \deg(z)$.

As linear combination of polynomials do not increase the degree, for any $v \in \spn(\mathcal{B}) = V$, $\deg(v) \leq \omega$.
For $0\in V$, $D^{\omega +1}(0) = 0$ is trivial.
For any nonzero $v\in V$, as $\omega + 1 > \deg(v)$, by claim, $D^{\omega + 1}(v) = 0$.
Therefore $D$ is nilpotent.
\qed

\newpage

Question 6
==========
>Let $K$ be a field. For each $t\in K$, "evaluation at $t$" gives a linear functional
>$\eval_t \in K[X]^\vee$ on the $K$-vector space $K[X]$:
>\[\eval_t: K[X] \to K,\qquad f\mapsto f(t),\]
>which has the property that for any $f,g\in K[X]$, one has
>\[\eval(fg) = \eval(f)\eval(g) \qquad \text{ in }K.\]
>Show that for any linear functional $\phi \in K[X]^\vee$ with property that for any $f,g\in K[X]$, one has
>\[\phi(fg) = \phi(f)\phi(g) \qquad \text{ in }K,\]
>then either $\phi = 0$ in $K[X]^\vee$ or there exists $t\in K$ such that $\phi = \eval_t$ in $K[X]^\vee$.

*Proof.*
Let $\phi \in K[X]^\vee$ be any multiplicative linear functional.
By multiplicative property, $\phi(1) = \phi(1) \cdot \phi(1)$, then $\phi(1) = 0$ or $\phi(1) = 1$.

Case $\phi(1) = 0$, then for any $f\in K[X]$, $\phi(f) = \phi(1\cdot f) = \phi(1)\cdot\phi(f) = 0$, so $\phi$ is the zero functional.

Case $\phi$ nonzero and $\phi(1) = 1$, for any $f\in K[X]$, let $f_0,\dots,f_d\in K$ such that $f = \sum_{i=0}^d f_iX^i$, where $d = \deg(f)$, then
by linearity and multiplicative property,
\begin{align*}
    \phi(f) &= \phi \left(\sum_{i=0}^d f_i X^i  \right)  \\
    &= f_0\phi(1) + \sum_{i=1}^d f_i \phi(X^i) \\
    &= f_0 + \sum_{i=1}^d f_i \phi(X)^i
\end{align*}
define $t := \phi(X) \in K$, then
\begin{align*}
    \eval_t(f) &= f(t)  \\
    &= \sum_{i=0}^d f_i t^i \\
    &= f_0 + \sum_{i=1}^d f_i t^i
\end{align*}
Since $f$ was arbitrary, we see that by setting $t = \phi(X)\in K$, $\phi = \eval_t$.
\qed
