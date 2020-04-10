---
title: MA2101S Homework 9
author: Qi Ji (A0167793L)
date: 9th April 2018
...

\let\setminus\smallsetminus
\let\oldphi\phi
\let\phi\varphi
\let\geq\geqslant
\let\leq\leqslant
\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\qed}{\hfill$\square$}
\newcommand{\tagQED}{\tag*{$\square$}}
\newcommand{\M}{\mathbb{M}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\End}{\operatorname{End}}
\newcommand{\GL}{\mathrm{GL}}
\newcommand{\nullity}{\operatorname{nullity}}

__Notation.__ Empty space in matrices denote zero.

Question 1
==========
(a) Compute the characteristic polynomial $\chi_{\Phi}(T) \in K[T]$ of $\Phi$ in terms of $\chi_A$ the characteristic polynomial of $A$.

    *Solution.*
    Note that $V = \M_n(K)$ admits a direct decomposition
$$\M_n(K) = W_1 \oplus W_2 \oplus \dots \oplus W_n$$
where for any $j$, $W_j$ denotes the subspace of $V$ given by
$$W_j := \set{X\in\M_n(K): \forall k, l.~ l\ne j \implies X_{kl} = 0}$$
matrices with all columns $0$ except the $j$-th column.

    Thinking of left-multiplying a matrix column by column,
we can observe that each subspace $W_j$ is $\Phi$-invariant, and moreover, the restriction $\Phi |_{W_j}$ behaves exactly like left-multiplication by $A$.
Hence we deduce that with respect to a certain ordered basis of $W_j$, the restriction $\Phi |_{W_j}$ has matrix representation $A$. Then the matrix representation of $\Phi$ admits the following block form
$$\begin{pmatrix}
A \\
& A \\
& & \ddots \\
& & & A
\end{pmatrix}\leftarrow\text{$A$ repeats $n$ times.}$$
Then to compute the characteristic polynomial, we factor this block-diagonal matrix.
\begin{align*}
    \chi_{\Phi}(t) &= \det(\Phi - t\operatorname{id})    \\
    &= \begin{vmatrix}
        A-tI_n \\
        & A-tI_n \\
        & & \ddots \\
        & & & A-tI_n
    \end{vmatrix} \\
    &= \begin{vmatrix}
        A-tI_n \\
        & I_n \\
        & & \ddots \\
        & & & I_n
    \end{vmatrix}
    \begin{vmatrix}
        I_n \\
        & A-tI_n \\
        & & \ddots \\
        & & & I_n
    \end{vmatrix}
    \cdots
    \begin{vmatrix}
        I_n \\
        & I_n \\
        & & \ddots \\
        & & & A-tI_n
    \end{vmatrix} \\
    &= \det(A-tI_n)^n\\
    &= \chi_A(t)^n  \tagQED
\end{align*}

(b) Compute the minimal polynomial $m_{\Phi}(T) \in K[T]$ of $\Phi$ in terms of $m_A(T) \in K[T]$ the minimal polynomial of $A$.

    *Solution.*
As stated in part (a), the restriction $\Phi |_{W_j}$ is exactly the process of left-multiplying column $j$ by the matrix $A$, and has matrix representation $A$ (with respect to some ordered basis).
Then it is clear that the minimal polynomial for $\Phi |_{W_j}$ is the minimal polynomial for $A$.
As the minimal polynomial for the restriction $\Phi|_{W_j}$ divides the minimal polynomial of $\Phi$, we have
$m_A(T) \mid m_{\Phi}(T)$ in $K[T]$.

    On the other hand,
for any $j$ let $E_j$ denote projection operator on $W_j$.
The direct decomposition into $\Phi$-invariant subspaces entails that
$$\Phi = \Phi|_{W_1} E_1 + \Phi|_{W_2} E_2 + \dots + \Phi|_{W_n} E_n$$
note the properties of projection operators,
for any $j$, $E_j^2 = E_j$ and for any $i,j$ we have $i \ne j \implies E_i E_j = 0$.
So we have
$$\Phi^2 = \Phi|_{W_1}{}^2 E_1 + \dots + \Phi|_{W_n}{}^2 E_n$$
then by induction for any $k\in \N$,
$$\Phi^k = \Phi|_{W_1}{}^k E_1 + \dots + \Phi|_{W_n}{}^k E_n.$$
Let $m_A(T) = \sum_{i=0}^{\deg(m_A)} a_i T^i$, note that
$$E_1 + E_2 + \dots + E_n = I.$$
Then evaluating $m_A(\Phi)$ gives
\begin{align*}
    m_A(\Phi)
    &= \sum_{i=0}^{\deg(m_A)} a_i \Phi^i    \\
    &= \sum_{i=0}^{\deg(m_A)} a_i \left( \Phi|_{W_1} E_1 + \dots + \Phi|_{W_n} E_n \right)^i  \\
    &= \sum_{i=0}^{\deg(m_A)} a_i \left( \sum_{j=1}^n \Phi|_{W_j}{}^i E_j \right)  \\
    &= \sum_{j=1}^n \left( \sum_{i=0}^{\deg(m_A)} a_i \Phi|_{W_j}{}^i \right) E_j  \\
    &= m_A(\Phi|_{W_1}) E_1 + \dots + m_A(\Phi|_{W_n}) E_n
\end{align*}
each restricted operator admits a matrix representation of $A$ with respect to some ordered basis,
hence each $\Phi|_{W_j}$ gets annihilated by $m_A$, so we have $m_A(\Phi) = 0$ as an endomorphism on $\M_n(K)$.
Together with our earlier result that $m_A \mid m_{\Phi}$ in $K[T]$, we conclude that $m_{\Phi} = m_A$.
\qed

Question 2
==========
(a) If there exists $k\in \N_{\geq 1}$ such that $\phi^k = 0$, show that $\phi^n = 0$.

    *Proof.*
Let $m_{\phi} \in K[T]$ be the minimal polynomial of $\phi$, $\chi_{\phi}$ be characteristic polynomial of $\phi$.
As $\phi^k = 0$ in $\End(V)$, we have $m_{\phi}(T) \mid T^k$,
so there exists $l\in\set{1,\dots,k}$ such that $m_{\phi}(T) = T^l$.
As $m_{\phi} \mid \chi_{\phi}$, we have $\deg(m_{\phi}) \leq n$, which means $l \leq n$, so let $l' \in \N$ such that $l + l' = n$.
Then $\phi^n = \phi^{l' + l} = \phi^{l'}\circ 0 = 0$ in $\End_K(V)$.
\qed

(b) Suppose $n>1$ and $\phi^n = 0$ but $\phi^{n-1} \ne 0$ in $\End_K(V)$, show that there does not exist a square root of $\phi$, that is $\psi \in \End_K(V)$ with $\psi^2 = \phi$.

    *Proof.*
Suppose for a contradiction there exists $\psi \in \End_K(V)$ such that $\psi^2 = \phi$.
By our hypothesis, we have $\phi^n = \psi^{2n} = 0$, then by part (a) we have $\psi^n = 0$.
Additionally, we have $\phi^{n-1} = \psi^{2n-2} \ne 0$, but because $n> 1$, $2n-2 \geq n$ always.
Having $\psi^n = 0$ while a higher or equal power of $\psi$ be non-zero in $\End_K(V)$ is absurd.
\qed

Question 3
==========
Show that two nilpotent matrices $A,B \in \M_3(K)$ are $\GL_3(K)$-conjugate iff they have the same minimal polynomial -- $m_A(T) = m_B(T)$ in $K[T]$.

*Proof.*
Suppose $A,B$ are $\GL_3(K)$-conjugate, so let $Q\in \GL_3$ such that $B = QAQ^{-1}$.
$m_A$ annihilates $B$, because
\begin{align*}
    m_A(B) &= m_A(QAQ^{-1}) \\
    &= Q m_A(A) Q^{-1}  \\
    &= 0
\end{align*}
hence $m_B \mid m_A$.
A symmetric argument shows that $m_B$ annihilates $A$, and $m_A \mid m_B$.
As the two monic polynomials divide each other, it is necessary that $m_A = m_B$.

Conversely suppose $A$ and $B$ have the same minimal polynomial $m(T) \in K[T]$.
As they are nilpotent matrices, from 2(a), there exists $r \in \set{1,2,3}$ such that
$$m(T) = T^r \quad\text{in }K[T].$$
Then because minimal and characteristic polynomials have the same prime factors,
the characteristic polynomials can be found to be $\chi_A = \chi_B = -T^3$ in $K[T]$.
In particular, both $A$ and $B$ have Jordan forms.

* Case $r = 1$, then both $A$ and $B$ are the zero matrix which means they are trivially similar.

* Case $r = 2$, $A$ and $B$ have the same Jordan form
$\begin{pmatrix}
    0 & 1 &     \\
      & 0 &     \\
      &   & 0
\end{pmatrix}$.

* Case $r = 3$, then $A$ and $B$ also have the same Jordan form
$\begin{pmatrix}
    0 & 1 & 0   \\
      & 0 & 1   \\
      &   & 0
\end{pmatrix}$.

In any case, $A$ and $B$ are $\GL_3$-conjugate.
\qed

##### Show that the analogous result is false for $4\times 4$ nilpotent matrices.

*Counter-example.*
Consider these matrices $A, B\in \M_4(K)$ defined as
$$
A := \begin{pmatrix}
    0 & 1 &   &     \\
      & 0 &   &     \\
      &   & 0 & 1   \\
      &   &   & 0   \\
\end{pmatrix}   \quad
B := \begin{pmatrix}
    0 & 1 &   &     \\
      & 0 &   &     \\
      &   & 0 &     \\
      &   &   & 0   \\
\end{pmatrix}
$$
both $A$ and $B$ are clearly nilpotent matrices and
a trivial computation reveals that $m_A(T) = m_B(T) = T^2$ in $K[T]$.
But both $A$ and $B$ are already in Jordan form and hence by inspection, these two matrices are not $\GL_3$-conjugate.
\qed

Question 4
==========
*Proof.*
To show that $A$ and $B$ are $GL_n(K)$-conjugate to each other,
it suffices to show that eigenvalue by eigenvalue, $A$ and $B$ have the same Jordan blocks,
because they have the same characteristic polynomial which splits completely.

Let $\lambda \in \set{\lambda_1,\dots,\lambda_k}$ be an eigenvalue of $A$ and $B$, and $d$ be the multiplicity of
$T-\lambda$ in the characteristic polynomial.
By hypothesis, we have $1\leq \dim(K_\lambda) = d \leq 3$.
Let $c$ denote the multiplicity of $T-\lambda$ in the minimal polynomial.

* Case $d = 1$, then the Jordan block of $A$ and $B$ corresponding to eigenvalue $\lambda$ are trivially equal,
in fact it is just a $1\times1$ block $\begin{pmatrix} \lambda \end{pmatrix}$.

* Case $d = 2$,
    - Case $c = 1$, the corresponding Jordan block is forced to be $\begin{pmatrix} \lambda & 0 \\ 0 & \lambda\end{pmatrix}$.
    - Case $c = 2$, the Jordan block can only be $\begin{pmatrix} \lambda & 1 \\ 0 & \lambda \end{pmatrix}$.

* Case $d = 3$, the restrictions $(A - \lambda)|_{K_\lambda}$ and $(B - \lambda)|_{K_\lambda}$ are both $3\times 3$ nilpotent matrices. The restriction operators mentioned will also have the same minimal polynomial $T^c$.
Then by result of question 3, the Jordan block of $A$ and $B$ corresponding to eigenvalue $\lambda$ is again the same.

As $A$ and $B$ have essentially the same Jordan canonical form, they are $\GL_n(K)$-conjugate.
\qed

Question 5
==========
*Proof.*
Suppose $A$ and $B$ are $\GL_6(K)$-conjugate.
The proof produced in Question 3, showing that similar matrices have the same minimal polynomial, does not depend on the size of the matrix, and hence applies here too.
It remains to show that $\dim(\ker(A)) = \dim(\ker(B))$.
There exists $Q\in\GL_6$ such that $A = QBQ^{-1}$.
By treating $Q$ as a change of basis matrix I can choose an ordered basis $\mathcal{C}$ for $K^6$ such that
$[L_B]_{\mathcal{C}} = A$. Hence $\nullity(A) = \nullity(L_B) = \nullity(B)$.

Conversely suppose $A$ and $B$ have the same minimal polynomial -- $m(T) \in K[T]$, and the same nullity.
An earlier discussion in Question 3 shows that nilpotent matrices have Jordan forms, and also that
$m(T)$ is of the form $m(T) = T^r$ where $r \in \set{1,2,3,4,5,6}$.
For each $r$, proceed to list out possible Jordan forms of $A$ and $B$.

1. Case $r = 1$, then $A = B = 0$ trivially implies they are $\GL_6$ conjugate.

2. Case $r = 2$, the biggest Jordan block possible is of size $2\times 2$, leaving the only Jordan forms possible to be
$$
\begin{pmatrix}
    0 & 1 \\
    & 0 \\
    && 0 & 1 \\
    && & 0 \\
    && && 0 & 1 \\
    && && & 0
\end{pmatrix},
\begin{pmatrix}
    0 & 1 \\
    & 0 \\
    && 0 & 1 \\
    && & 0 \\
    && && 0 &   \\
    && && & 0
\end{pmatrix},
\begin{pmatrix}
    0 & 1 \\
    & 0 \\
    && 0 &   \\
    && & 0 \\
    && && 0 &   \\
    && && & 0
\end{pmatrix}.
$$

3. Case $r = 3$, the only possible Jordan forms are
$$
\begin{pmatrix}
    0&1&0 \\
    &0& 1 \\
    & & 0 \\
    &&& 0&1&0 \\
    &&& &0& 1 \\
    &&& & & 0 \\
\end{pmatrix},
\begin{pmatrix}
    0&1&0 \\
    &0& 1 \\
    & & 0 \\
    &&& 0 & 1 \\
    &&& &0&   \\
    &&& & & 0 \\
\end{pmatrix},
\begin{pmatrix}
    0&1&0 \\
    &0& 1 \\
    & & 0 \\
    &&& 0 &   \\
    &&& &0&   \\
    &&& & & 0 \\
\end{pmatrix}.
$$

4. Case $r = 4$,
$$
\begin{pmatrix}
    0&1&0&0 \\
    &0&1&0 \\
    &&0&1 \\
    &&& 0 \\
    &&&&0&1 \\
    &&&&& 0 \\
\end{pmatrix},
\begin{pmatrix}
    0&1&0&0 \\
    &0&1&0 \\
    &&0&1 \\
    &&& 0 \\
    &&&&0&  \\
    &&&&& 0 \\
\end{pmatrix},
$$

5. Case $r = 5$,
$$
\begin{pmatrix}
    0&1&0&0&0 \\
    &0&1&0&0 \\
    &&0&1&0 \\
    &&&0&1 \\
    &&&&0& \\
    &&&&& 0 \\
\end{pmatrix}.
$$

6. Case $r = 6$,
$$
\begin{pmatrix}
    0&1&0&0&0&0 \\
    &0&1&0&0&0 \\
    &&0&1&0&0 \\
    &&&0&1&0 \\
    &&&&0&1 \\
    &&&&& 0 \\
\end{pmatrix}.
$$

From the exhaustive enumeration above, notice that for a nilpotent $6\times 6$ matrix, its minimal polynomial and nullity uniquely determines its Jordan form. Hence $A$ and $B$ are $\GL_6$-conjugate.
\qed

##### Show that the analogous result is false for $7\times 7$ nilpotent matrices.
*Counter-example*.
Consider $A, B\in \M_7(K)$ defined as
$$
A := \begin{pmatrix}
0 & 1 & 0\\
& 0 & 1\\
&& 0\\
&&& 0 & 1\\
&&& & 0\\
&&&&& 0 & 1\\
&&&&& & 0
\end{pmatrix}
B := \begin{pmatrix}
0&1& 0\\
&0& 1 \\
&& 0 \\
&&& 0&1& 0\\
&&& &0& 1 \\
&&& && 0 \\
&&&&&& 0
\end{pmatrix}
$$
$A$ and $B$ can clearly be verified to be nilpotent, and both also have the same minimal polynomial $T^3 \in K[T]$.
They also have the same nullity of $3$,
but both $A$ and $B$ are in Jordan canonical form, and their Jordan forms clearly differ, hence $A$ and $B$ are not $GL_7$-conjugate.
\qed

Question 6
==========
*Proof.*
Similarly to question 4, to show that $A$ and $B$ are $GL_n(K)$-conjugate to each other,
it suffices to show that eigenvalue by eigenvalue, $A$ and $B$ have the same Jordan blocks,
because they have the same characteristic polynomial which splits completely.

Let $\lambda \in \set{\lambda_1,\dots,\lambda_k}$ be an eigenvalue of $A$ and $B$, and $d$ be the multiplicity of
$T-\lambda$ in the characteristic polynomial.
By hypothesis, we have $1\leq \dim(K_\lambda) = d \leq 6$.
Let $c$ denote the multiplicity of $T-\lambda$ in the minimal polynomial.

* Case $d = 1,2,3$. The argument used in Question 4 applies here too, showing that $A$ and $B$ has the same Jordan block corresponding to eigenvalue $\lambda$.

* Case $d = 4$, corresponding Jordan blocks would be
    * for $c = 1$,
$$
\begin{pmatrix}
\lambda \\
&\lambda    \\
&&\lambda   \\
&&&\lambda
\end{pmatrix}
$$
    * for $c = 2$,
$$
\begin{pmatrix}
\lambda & 1\\
&\lambda    \\
&&\lambda   \\
&&&\lambda
\end{pmatrix},
\begin{pmatrix}
\lambda & 1\\
&\lambda    \\
&&\lambda&1 \\
&&&\lambda
\end{pmatrix},
$$
    * for $c = 3$,
$$
\begin{pmatrix}
\lambda &1&0&  \\
&\lambda &1&   \\
&& \lambda &   \\
&&& \lambda
\end{pmatrix}.
$$
    * for $c = 4$,
$$
\begin{pmatrix}
\lambda &1&0&0 \\
&\lambda &1&0  \\
&& \lambda &1  \\
&&& \lambda
\end{pmatrix}.
$$

* for $d = 5$, enumerating again
    * for $c = 1$,
$$
\begin{pmatrix}
\lambda \\
&\lambda \\
&&\lambda \\
&&&\lambda \\
&&&&\lambda
\end{pmatrix}.
$$
    * for $c = 2$,
$$
\begin{pmatrix}
\lambda& 1 \\
&\lambda \\
&&\lambda \\
&&&\lambda \\
&&&&\lambda
\end{pmatrix},
\begin{pmatrix}
\lambda& 1 \\
&\lambda \\
&&\lambda &1 \\
&&&\lambda \\
&&&&\lambda
\end{pmatrix}.
$$
    * for $c = 3$,
$$
\begin{pmatrix}
\lambda&1&0 \\
&\lambda&1 \\
&&\lambda \\
&&&\lambda \\
&&&&\lambda
\end{pmatrix},
\begin{pmatrix}
\lambda&1&0 \\
&\lambda&1 \\
&&\lambda \\
&&&\lambda&1 \\
&&&&\lambda
\end{pmatrix}.
$$
    * for $c = 4$,
$$
\begin{pmatrix}
\lambda&1&0&0 \\
&\lambda&1&0 \\
&&\lambda&1 \\
&&&\lambda \\
&&&&\lambda
\end{pmatrix}
$$
    * for $c = 5$,
$$
\begin{pmatrix}
\lambda&1&0&0&0 \\
&\lambda&1&0&0 \\
&&\lambda&1&0 \\
&&&\lambda&1 \\
&&&&\lambda
\end{pmatrix}
$$

* Case $d = 6$, the restrictions $(A - \lambda)|_{K_\lambda}$ and $(B - \lambda)|_{K_\lambda}$ are both $6\times 6$ nilpotent matrices. The restriction operators mentioned will also have the same minimal polynomial $T^c$.
In addition, with the hypothesis that dimension of the $\lambda$-eigenspace,
$\dim(E_\lambda)$ are the same for both $A$ and $B$, the restriction operators will in turn have the same nullity.
Then from the result of question 5, $A$ and $B$ will have the same Jordan block for eigenvalue $\lambda$.

By examining the exhaustive enumeration, we observe that $A$ and $B$ having the same characteristic polynomial,
the same minimal polynomial, and the same dimension for each $\lambda_i$-eigenspace is enough to uniquely determine the Jordan block for each generalised eigenspace $K_\lambda$.
Therefore as $A$ and $B$ have essentially the same Jordan canonical form, they are $\GL_n(K)$-conjugate.
\qed
