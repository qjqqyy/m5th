---
title: MA2101S Homework 7
author: Qi Ji (A0167793L)
date: 26th March 2018
...

\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\qed}{\hfill$\square$}
\newcommand{\tagQED}{\tag*{$\square$}}
\let\setminus\smallsetminus
\let\oldphi\phi
\let\phi\varphi
\renewcommand{\C}{\mathbb{C}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\N}{\mathbb{N}}
\def \M{\mathbb{M}}
\newcommand{\End}{\operatorname{End}}
\newcommand{\id}{\operatorname{id}}


Question 1
==========
It is trivial that (i) $\implies$ (ii). \qed

For (ii) $\implies$ (i), suppose (ii), let
$\mathcal{B} = \set{v_1,\dots,v_n}$ be a basis for $V$.
Clearly these vectors are non-zero, so they are eigenvectors of $\phi$.
Then there exists eigenvalues $\lambda_1,\dots,\lambda_n \in K$ such that
for any $i\in\set{1,\dots,n}$, $\phi(v_i) = \lambda_i v_i$.
As vectors in $\mathcal{B}$ form a basis, $v_1 + \dots + v_n \ne 0$,
then there exist an eigenvalue $c\in K$ such that
\begin{align*}
    \phi(v_1 + \dots + v_n) &= c(v_1 + \dots + v_n) \\
    &= c\,v_1 + \dots + c\,v_n
\end{align*}
but by linearity,
\begin{align*}
    \phi(v_1 + \dots + v_n) &= \lambda_1\,v_1 + \dots + \lambda_n\,v_n
\end{align*}
Then by uniqueness of basis coefficients, $c = \lambda_1 = \dots = \lambda_n$, then it becomes clear that $\phi = c\cdot \operatorname{id}_V$.  \qed

Question 2
==========
(a) __False.__

    *Counter-example.*
Set $K=\R$, $V = \R^2$, taking all matrices with respect to standard basis, set
$$
B = \begin{pmatrix}0 & 0\\0 & 1\end{pmatrix}    \quad
A = \begin{pmatrix}0 & 1\\1 & 0\end{pmatrix}    \quad
v = \begin{pmatrix}1 \\ 0\end{pmatrix}
$$
We can now compute that $ABv = A0 = 0$, which means $v$ is an eigenvector of $AB$ with eigenvalue $0$,
but $BAv = B\begin{pmatrix}0\\1\end{pmatrix} = \begin{pmatrix}0\\1\end{pmatrix}$ which is not a scalar multiple of $v$.\qed

(b) __True.__

    *Proof.*
Let $\lambda \in K$ be an eigenvalue of $AB$, then $\exists v\in V\setminus\set{0_V}$ such that
$$AB\,v = \lambda\,v.$$
    - Case $\lambda = 0$, then $AB$ is singular $\implies$ $BA$ is not invertible too, which lets us conclude that $\lambda = 0$ is also an eigenvalue of $BA$.
    - Case $\lambda \ne 0$, then $Bv \ne 0_V$, then pre-multiplying by $B$ gives $$BA\,(Bv) = \lambda\,(Bv)$$
    which shows that $\lambda$ is also an eigenvalue of $BA$ with eigenvector $Bv$.\qed

Question 3
==========
(a) __True.__

    __Claim.__ Let $v$ be an eigenvector of $\phi$ corresponding to eigenvalue $\lambda$.
    For any $n\in\N$, $\phi^n\, v = \lambda^n\, v$.

    *Proof (of Claim).* It is given that $\phi\,v = \lambda\,v$. Suppose $\phi^{n-1}\,v = \lambda^{n-1} v$,
    then $\phi^n\, v = \phi^{n-1}(\phi\, v) = \phi^{n-1}(\lambda\, v) = \lambda\,\phi^{n-1}\, v$ by linearity.
    Applying induction hypothesis gives us the conclusion that $\phi^n\,v = \lambda^n\,v$. \qed

    *Proof (of 3a).*
Let $\lambda\in\C$ be an eigenvalue of $\phi$, so $\exists v\in V\setminus\set{0}.~ \phi\,v = \lambda\,v$.
Let $f(T)\in \C[T]$ be given by
$$f(T) = \sum_{i=0}^{\deg(f)} f_i\,T^i.$$
Evaluating $f$ at $\phi$ gives us an endomorphism,
\begin{align*}
    f(\phi) &= \sum_{i=0}^{\deg(f)} f_i\,\phi^i \quad\text{in $\End(V)$}    \\
    f(\phi)\,v &= \sum_{i=0}^{\deg(f)} f_i\,\phi^i\,v \quad\text{in $V$}    \\
    &= \sum_{i=0}^{\deg(f)} f_i\,\lambda^i\,v \quad\text{by Claim}  \\
    &= f(\lambda)\, v
\end{align*}
this shows that $f(\lambda)\in \C$ is an eigenvalue of $f(\phi)$.   \qed

(b) __True.__

    *Proof.*
Let $a$ be an eigenvalue of $f(\phi)$, so
$$\exists v\in V\setminus\set{0}.~ (f(\phi) - aI)\,v = 0.$$
Consider the polynomial $f(T) - a\in \C[T]$, by Fundamental Theorem of Algebra, there exists
$\lambda_1,\dots,\lambda_k,c\in \C$ such that
$$f(T) - a = c\cdot \prod_{i=1}^k (T-\lambda_i) \quad \text{in }\C[T] \tag*{$(\dagger)$}$$
evaluating at $\phi$ gives
$$f(\phi) - aI = c\cdot\prod_{i=1}^k (\phi - \lambda_i I)\quad \text{in }\End_{\C}(V)$$
As it is known that LHS is singular, by multiplicativity of determinant, RHS is necessarily singular, so
(at least) one of $\phi - \lambda_i I$ is singular, so
$$\exists \lambda\in\set{\lambda_1,\dots,\lambda_k}.~ \det(\phi - \lambda I) = 0$$
which implies that $\lambda$ is an eigenvalue of $\phi$, then evaluating $(\dagger)$ at $\lambda$ gives
$$f(\lambda) - a = c\cdot 0 \implies a = f(\lambda). \tagQED$$

Question 4
==========
(a) __True.__

    *Proof.*
Let $f(T)\in \C[T]$ be given by
$$f(T) := T^k - 1.$$
then $f(A) = A^k - 1_n = 0$ in $\M_n(\C)$, so $f$ annihilates $A$.
We see that $f$ has the following factorisation in $\C[T]$
$$T^k - 1 = \prod_{j=0}^{k-1}\left(T - e^{j\cdot 2\pi i/k} \right)$$
Let $m(T)\in \C[T]$ be the minimal polynomial of $A$, then it is necessary that $m(T) \mid f(T)$.
As $f(T)$ splits completely into distinct linear factors, $m(T)$ also has this property.
This means that $A$ is diagonalisable.
\qed

(b) __False.__

    *Counter-example.*
Consider $A:=\begin{pmatrix}0 & 1\\0 & 0\end{pmatrix} \in \M_2(\C)$.
$A^2 = 0$ is certainly diagonalisable, but $A$ is already in Jordan canonical form and is not diagonalisable.
\qed

Question 5
==========
__Definition.__
For any $z\in \C$ that is algebraic over $\Q$, let the __minimal polynomial__ of $z$ refer to the (necessarily unique)
monic generator of the ideal of polynomials over $\Q$ which annihilates $z$.
(ie. The lowest degree monic polynomial with rational coefficients which has $z$ as a root.)

__Lemma.__
Let $f\in \Q[T]$, let $z\in \C$ be algebraic over $\Q$ with $f(z) = 0$, then $m_z$ divides $f$ in $\Q[T]$.

*Proof (Lemma).*
First apply division algorithm in $\Q[T]$, so $\exists q,r\in \Q[T]$ such that
$$f(T) = q(T)\cdot m_z(T) + r(T) \quad\text{in }\Q[T],$$
with $\deg(r) < \deg(m_z)$. Then evaluation at $z$ gives
$$0 = q(z)\cdot 0 + r(z) \quad\text{in }\C.$$
By minimality of $m_z$, $r$ is necessarily the zero polynomial. Hence $m_z\mid f$.
\qed

*Proof (Q5).*
Let $n = \dim_{\Q} V$. When $n = 0$, the conclusion trivially holds, so suppose $n \ne 0$.
Fix any ordered basis, and let $A\in \M_n(\Q)$ be the matrix representation of $\phi$.
Let $f(T)\in \Q[T]$ be the characteristic polynomial of $A$.
We know that $\deg(f) = n$.

The polynomial $T^p - 1$ can also be factorised in $\Q[T]$ like so
$$T^p - 1 = (T-1)\left(T^{p-1} + \dots + T + 1\right)\quad\text{in }\Q[T]$$
Let $m(T)\in\Q[T]$ be given by $m(T) := T^{p-1} + \dots + T + 1$.
Evaluation at $\phi$ gives
$$\phi^p - \id_V = 0 = (\phi-\id_V)\,m(\phi)\quad\text{in }\End(V)$$
as $(\phi - \id_V)v = 0$ implies $v = 0_V$, we have $m(\phi) = 0$ in $\End(V)$. So $m$ annihilates $\phi$, and similarly also annihilates its matrix representation $A$.

Now consider the field of complex numbers, and the corresponding linear map $\C^n\to \C^n$ that $A$ characterises. Because $m$ annihilates $A$, for any of its eigenvalues $\lambda \in \C$, $m(\lambda) = 0$ (corollary of 3a).
As it is given that $m$ is irreducible over $\Q$, $m$ will be the minimal polynomial of $\lambda$.

Lastly, proceed to repeatedly apply lemma to obtain the result that
$$f(T) = m(T)^k\cdot l\quad\text{for some }k\in\N\setminus\set{0}, l\in \Q\setminus\set{0}.$$
Choose any root $\lambda\in \C$ of $f(T)$, then because $\lambda$ is an eigenvalue of $A$, by Lemma we have $m\mid f$ in $\Q[T]$, so $\exists q\in \Q[T].~ f = m\cdot q$.

1. Case $q$ has no roots in $\C$, by our earlier assumption that $f$ nonzero, $q$ is a constant polynomial.
2. Case $q$ has a root, say $z\in \C$, then $f(z) = 0$, which means $z$ is an eigenvalue of $A$.
Using the same argument, we obtain that $z$ is also a root of $m(T)$ and by Lemma, $m\mid q$.
Then $\exists q'(T)\in \Q[T]$ such that $f = m^2\cdot q'$.
Repeat this process until $q_k(T)$ is degree $0$, and we obtain the result stated earlier.

Then taking degrees,
$$\deg(f) = k\,\deg(m) \implies n = k(p-1) \text{ for some }k\in \N\setminus\set{0},$$
which shows $p-1 \mid \dim_{\Q} V$.
\qed

Question 6
==========
*Proof.*
Rewriting the recurrence equation in matrix form gives us that for any $n \geq 1$,
$$
\begin{pmatrix} P_{n+1}\\ P_{n}\end{pmatrix} =
\begin{pmatrix} 2 & 1\\ 1 & 0 \end{pmatrix}
\begin{pmatrix} P_{n}\\ P_{n-1}\end{pmatrix}
$$
recursive expansion gives that for any $n \geq 0$,
\begin{align*}
    \begin{pmatrix} P_{n+1}\\ P_{n}\end{pmatrix} &=
    \begin{pmatrix} 2 & 1\\ 1 & 0 \end{pmatrix}^n
    \begin{pmatrix} P_{1}\\ P_{0}\end{pmatrix}  \\
    &=
    \begin{pmatrix} 2 & 1\\ 1 & 0 \end{pmatrix}^n
    \begin{pmatrix} 1 \\ 0 \end{pmatrix}
\end{align*}
Finding a closed form formula for Pell numbers reduces to diagonalising the matrix
$A := \begin{pmatrix} 2 & 1\\ 1 & 0 \end{pmatrix}$.
Let $f(t) \in \R[t]$ be characteristic polynomial of $A$,
\begin{align*}
    f(t) &= (2-t)(-t) - 1  \\
    &= t^2 - 2t - 1
\end{align*}
Roots of $f$ are $\frac{2 \pm \sqrt{8}}{2} = 1 \pm \sqrt{2}$. Let $\alpha := 1 + \sqrt{2}$ and $\beta := 1 - \sqrt{2}$, note that they can be characterised as solutions of the equation $t^2 = 2t + 1$.
Using this property, it becomes clear that $\begin{pmatrix}\alpha\\ 1\end{pmatrix}$ is an eigenvector (with eigenvalue $\alpha$), because
\begin{align*}
    \begin{pmatrix}2 & 1\\ 1 & 0 \end{pmatrix}
    \begin{pmatrix}\alpha\\ 1\end{pmatrix} &=
    \begin{pmatrix}2\alpha + 1\\ \alpha \end{pmatrix}   \\
    &= \begin{pmatrix}\alpha^2\\ \alpha \end{pmatrix}   \\
    &= \alpha\,\begin{pmatrix}\alpha\\ 1 \end{pmatrix}
\end{align*}
As $\beta$ has the same characterising property, the same computation will also show that $\begin{pmatrix}\beta\\ 1\end{pmatrix}$ is an eigenvector for eigenvalue $\beta$.
Since the eigenspace has enough dimensions, $A$ is diagonalisable, in fact
\begin{align*}
    A &=
    \begin{pmatrix} \alpha & \beta\\ 1 & 1 \end{pmatrix}
    \begin{pmatrix} \alpha & 0\\ 0 & \beta\\ \end{pmatrix}
    \begin{pmatrix} \alpha & \beta  \\ 1 & 1 \end{pmatrix}^{-1}  \\
    A^n &= 
    \begin{pmatrix} \alpha & \beta\\ 1 & 1 \end{pmatrix}
    \begin{pmatrix} \alpha & 0\\ 0 & \beta\\ \end{pmatrix}^n
    \begin{pmatrix} \alpha & \beta  \\ 1 & 1 \end{pmatrix}^{-1}  \\
    &=
    \frac{1}{\alpha-\beta}
    \begin{pmatrix} \alpha & \beta  \\ 1 & 1 \end{pmatrix}
    \begin{pmatrix} \alpha^n & 0\\ 0 & \beta^n\\ \end{pmatrix}
    \begin{pmatrix} 1 & -\beta  \\ -1 & \alpha \end{pmatrix}
\end{align*}
substituting that into our original expression for $\begin{pmatrix}P_{n+1}\\P_n\end{pmatrix}$, we can derive the closed form,
\begin{align*}
    \begin{pmatrix}P_{n+1}\\P_n\end{pmatrix} &=
    A^n \begin{pmatrix} 1 \\ 0 \end{pmatrix}    \\
    &=
    \frac{1}{\alpha-\beta}
    \begin{pmatrix} \alpha & \beta  \\ 1 & 1 \end{pmatrix}
    \begin{pmatrix} \alpha^n & 0\\ 0 & \beta^n\\ \end{pmatrix}
    \begin{pmatrix} 1 & -\beta  \\ -1 & \alpha \end{pmatrix}
    \begin{pmatrix} 1 \\ 0 \end{pmatrix}    \\
    &=
    \frac{1}{\alpha-\beta}
    \begin{pmatrix}
        \alpha^{n+1} & \beta^{n+1}  \\
        \alpha^{n} & \beta^{n}
    \end{pmatrix}
    \begin{pmatrix} 1 \\ -1 \end{pmatrix}    \\
    &=
    \frac{1}{\alpha-\beta}
    \begin{pmatrix}
        \alpha^{n+1} - \beta^{n+1}  \\
        \alpha^{n} - \beta^{n}
    \end{pmatrix}
\end{align*}
then we have
\begin{align*}
    P_n &= \frac{1}{\alpha - \beta} (\alpha^n - \beta^n)    \\
    &= \frac{1}{2\sqrt{2}}\cdot \alpha^n - \frac{1}{2\sqrt{2}}\cdot \beta^n
\end{align*}
and $\alpha = 1 + \sqrt{2}$, $\beta = 1 - \sqrt{2}$, $c = \frac{1}{2\sqrt{2}}$, $d = -\frac{1}{2\sqrt{2}}$ can all be verified to be real numbers.
\qed
