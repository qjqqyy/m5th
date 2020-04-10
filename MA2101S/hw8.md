---
title: MA2101S Homework 8
author: Qi Ji (A0167793L)
date: 1st April 2018
...

---
graphics: true
header-includes:
- '\usepackage{mathdots}'
- '\usepackage{wasysym}'
...

\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\tagQED}{\tag*{$\square$}}
\newcommand{\qed}{\hfill$\square$}
\newcommand{\Ker}{\operatorname{Ker}}
\newcommand{\spn}{\operatorname{span}}
\newcommand{\rank}{\operatorname{rank}}
\newcommand{\nullity}{\operatorname{nullity}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\M}{\mathbb{M}}
\newcommand{\Z}{\mathbb{Z}}
\let\setminus\smallsetminus
\let\geq\geqslant
\let\leq\leqslant

\newcommand{\pmat}[1]{\begin{pmatrix} #1 \end{pmatrix}}
\newcommand\ididots{\mathinner{
  \kern1mu\raise1pt{.}
  \kern2mu\raise4pt{.}
  \kern2mu\raise7pt{\Rule{0pt}{7pt}{0pt}.}
  \kern1mu
}}


Question 1
==========
(a)  Characteristic polynomial of $T$ is
$$-(t-2)^5 (t-3)^2$$

For eigenvalue $\lambda = 2$,

(b)  $\dim(E_2) = 2$ and $\dim(K_2) = 5$
(c)  smallest $p = 3$
(d)  $\dim(\Ker(T|_{K_2}-2)) = 2$, $\dim(\Ker(T|_{K_2}-2)^2) = 4$ and $\dim(\Ker(T|_{K_2}-2)^3) = 5$.

For eigenvalue $\lambda = 3$,

(b)  $\dim(E_3) = 2$ and $\dim(K_3) = 2$
(c)  smallest $p = 1$
(d)  $\dim(\Ker(T|_{K_3}-2)) = 2$, $\dim(\Ker(T|_{K_3}-2)^2) = 2$ and $\dim(\Ker(T|_{K_3}-2)^3) = 2$.
\qed

Question 2
==========
(a) First, find characteristic polynomial of $A$,
\begin{align*}
    \det(A-tI) &= \begin{vmatrix}
        11-t & -4   & -5    \\
        21   & -8-t & -11   \\
        3    & -1   & -t
    \end{vmatrix}   \\
    &= -t^3 + 3t^2 - 4  \\
    &= -(t-2)^2(t+1)
\end{align*}
$A$ has eigenvalues $2$ and $-1$.

    * For eigenvalue $2$,
$$A - 2I = \begin{pmatrix}
    9   & -4    & -5    \\
    21  & -10   & -11   \\
    3   & -1    & -2
\end{pmatrix}$$
has kernel $\spn\set{(1,1,1)^t}$.
The other basis vector for $K_2$ can be found by solving for $x$ such that $(A-2I)x = (1,1,1)^t$.
By Gauss-Jordan elimination
$$
\left(\begin{array}{ccc|c}
    9   & -4    & -5    & 1 \\
    21  & -10   & -11   & 1 \\
    3   & -1    & -2    & 1
\end{array}\right)
\longrightarrow
\left(\begin{array}{ccc|c}
    1 & 0 & -1 & 1  \\
    0 & 1 & -1 & 2  \\
    0 & 0 & 0  & 0
\end{array}\right).
$$
It can be verified that $(A-2I)(1,2,0)^t$ is indeed $(1,1,1)$, so $(A-2I)^2(1,2,0)^t = 0$.
A basis for $K_2$ is $\set{(1,1,1)^t, (1,2,0)^t}$.

    * For eigenvalue $-1$,
$$A + I = \begin{pmatrix}
    12  & -4    & -5    \\
    21  & -7    & -11   \\
    3   & -1    & 1
\end{pmatrix}$$
which has kernel $\spn\set{(1,3,0)^t}$.

    Let $Q$ be given by
$$Q := \begin{pmatrix}
    1 & 1 & 1   \\
    1 & 2 & 3   \\
    1 & 0 & 0
\end{pmatrix}$$
which clearly has linearly independent columns, then from computations above,
\begin{align*}
    AQ &= \left(\begin{array}{c|c|c}
        2 \begin{pmatrix}1\\1\\1\end{pmatrix}&
        \begin{pmatrix}1\\1\\1\end{pmatrix} + 2\begin{pmatrix}1\\2\\0\end{pmatrix}  &
        -1\begin{pmatrix}1\\3\\0\end{pmatrix}
    \end{array}\right)  \\
    &= Q\begin{pmatrix}
        2 & 1 & 0\\
        0 & 2 & 0\\
        0 & 0 & -1
    \end{pmatrix}
\end{align*}
so by setting $J$ as the matrix in Jordan canonical form shown above, we have $Q^{-1}AQ = J$.
\qed

(b) Find the characteristic polynomial of $A$,
\begin{align*}
    \det(A-tI) &= \begin{vmatrix}
        2-t & 1   & 0   & 0 \\
        0   & 2-t & 1   & 0 \\
        0   & 0   & 3-t & 0 \\
        0   & 1   & -1  & 3-t
    \end{vmatrix}   \\
    &= (t-2)^2 (t-3)^2
\end{align*}
$A$ has eigenvalues $2$ and $3$.

    * For eigenvalue $2$,
$$A-2I = \begin{pmatrix}
    0 & 1 & 0 & 0\\
    0 & 0 & 1 & 0\\
    0 & 0 & 1 & 0\\
    0 & 1 & -1 & 1
\end{pmatrix}$$
which has kernel given by $\spn\set{(1,0,0,0)^t}$.
Using the same shortcut, solve for $x$ in $(A-2I)x = (1,0,0,0)^t$,
by Gauss-Jordan elimination,
$$\left(\begin{array}{cccc|c}
    0 & 1 & 0 & 0   & 1\\
    0 & 0 & 1 & 0   & 0\\
    0 & 0 & 1 & 0   & 0\\
    0 & 1 & -1 & 1  & 0
\end{array}\right)
\longrightarrow
\left(\begin{array}{cccc|c}
    0 & 1 & 0 & 0   & 1\\
    0 & 0 & 1 & 0   & 0\\
    0 & 0 & 0 & 1   & -1\\
    0 & 0 & 0 & 0   & 0
\end{array}\right)$$
A trivial verification shows that $(A-2I)(0,1,0,-1)^t = (1,0,0,0)^t$ indeed,
so $\set{(1,0,0,0)^t, (0,1,0,-1)^t}$ forms a basis for $K_2$.

    * For eigenvalue $3$,
$$A-3I = \begin{pmatrix}
    -1 & 1 & 0 & 0\\
    0 & -1 & 1 & 0\\
    0 & 0 & 0 & 0\\
    0 & 1 & -1 & 0
\end{pmatrix}$$
which has a kernel $\spn\set{(0,0,0,1)^t,(1,1,1,0)^t}$.

    Let $Q$ be given by
$$Q := \begin{pmatrix}
    1 & 0 & 0 & 1   \\
    0 & 1 & 0 & 1   \\
    0 & 0 & 0 & 1   \\
    0 & -1& 1 & 0
\end{pmatrix}$$
a trivial computation shows that it has linearly independent columns, then from the computations above
\begin{align*}
    AQ &= \left(\begin{array}{c|c|c|c}
        2 \pmat{1\\0\\0\\0} &
        \pmat{1\\0\\0\\0} + 2\pmat{0\\1\\0\\-1} &
        3\pmat{0\\0\\0\\1} &
        3\pmat{1\\1\\1\\0}
    \end{array}\right)  \\
    &= Q \begin{pmatrix}
        2 & 1 & 0 & 0\\
        0 & 2 & 0 & 0\\
        0 & 0 & 3 & 0\\
        0 & 0 & 0 & 3
    \end{pmatrix}
\end{align*}
so by setting $J$ as the matrix in Jordan canonical form shown above, we have $Q^{-1}AQ = J$.
\qed

Question 3
==========
(a) Let $\mathcal{B} := (e^t, te^t, t^2e^t, t^3e^t, e^{3t}, te^{3t})$, to compute $[T]_{\mathcal{B}}$, first find out where $T$ sends the basis to,
\begin{align*}
    T(e^t) &= e^t \\
    T(te^t) &= e^t + te^t   \\
    T(t^2e^t) &= 2te^t + t^2e^t \\
    T(t^3e^t) &= 3t^2e^t + t^3e^t   \\
    T(e^{3t}) &= 3e^{3t}    \\
    T(te^{3t}) &= e^{3t} + 3te^{3t}
\end{align*}
which is enough information to consolidate the matrix representation of $T$ with respect to $\mathcal{B}$,
$$[T]_{\mathcal{B}} = \begin{pmatrix}
    1 & 1 & 0 & 0 & 0 & 0   \\
    0 & 1 & 2 & 0 & 0 & 0   \\
    0 & 0 & 1 & 3 & 0 & 0   \\
    0 & 0 & 0 & 1 & 0 & 0   \\
    0 & 0 & 0 & 0 & 3 & 1   \\
    0 & 0 & 0 & 0 & 0 & 3
\end{pmatrix}.$$
$[T]_{\mathcal{B}}$ is *almost* in Jordan canonical form, we just need to find
vectors $c,d \in V$ such that $(T-I)c = te^t$ and $(T-I)d = c$, which are as given
\begin{align*}
    T(\frac{1}{2}t^2e^t) &= \frac{1}{2}t^2e^t + te^t \\
    T(\frac{1}{6}t^3e^t) &= \frac{1}{6}t^3e^t + \frac{1}{2}t^2e^t
\end{align*}
then it becomes clear that with respect to a new ordered basis $\mathcal{B}' := (e^t, te^t, \frac{1}{2} t^2e^t, \frac{1}{6} t^3e^t, e^{3t}, te^{3t})$,
$$[T]_{\mathcal{B}'} = \begin{pmatrix}
    1 & 1 & 0 & 0 & 0 & 0   \\
    0 & 1 & 1 & 0 & 0 & 0   \\
    0 & 0 & 1 & 1 & 0 & 0   \\
    0 & 0 & 0 & 1 & 0 & 0   \\
    0 & 0 & 0 & 0 & 3 & 1   \\
    0 & 0 & 0 & 0 & 0 & 3
\end{pmatrix}. \tagQED$$

(b) Let $\mathcal{B} := \left(
\pmat{1 & 0\\0 & 0},
\pmat{0 & 1\\0 & 0},
\pmat{0 & 0\\1 & 0},
\pmat{0 & 0\\0 & 1}
\right)$ be an ordered basis for $V$. First find out where $T$ sends this basis to
\begin{align*}
    T\pmat{1 & 0\\0 & 0} &= \pmat{2&0\\0&0} \\
    T\pmat{0 & 1\\0 & 0} &= \pmat{0&3\\-1&0} \\
    T\pmat{0 & 0\\1 & 0} &= \pmat{1&-1\\3&0}\\
    T\pmat{0 & 0\\0 & 1} &= \pmat{0&1\\0&2}
\end{align*}
this is enough information to find $[T]_{\mathcal{B}}$
$$[T]_{\mathcal{B}} = \begin{pmatrix}
    2 & 0 & 1 & 0 \\
    0 & 3 &-1 & 1 \\
    0 &-1 & 3 & 0 \\
    0 & 0 & 0 & 2
\end{pmatrix}.$$
Proceed to decompose $T$ into Jordan form (if possible), the characteristic polynomial is
\begin{align*}
    \det([T]_{\mathcal{B}} - tI) &= \begin{vmatrix}
        2-t & 0 & 1 & 0 \\
        0 & 3-t &-1 & 1 \\
        0 &-1 & 3-t & 0 \\
        0 & 0 & 0 & 2-t
    \end{vmatrix}   \\
    &= (2-t)^2 \begin{vmatrix}
         3-t &-1 \\
        -1 & 3-t \\
    \end{vmatrix}   \\
    &= (2-t)^2\left[ (3-t)^2 - 1 \right] \\
    &= (t-2)^3 (t-4)
\end{align*}

    For now, take all column vectors with respect to ordered basis $\mathcal{B}$.

    * For eigenvalue $4$,
$$[T]_{\mathcal{B}} - 4I = \begin{pmatrix}
    -2& 0 & 1 & 0 \\
    0 &-1 &-1 & 1 \\
    0 &-1 &-1 & 0 \\
    0 & 0 & 0 &-2
\end{pmatrix}$$
which has kernel given by $\spn\set{(1,-2,2,0)^t}$.

    * For eigenvalue $2$,
$$[T]_{\mathcal{B}} - 2I = \begin{pmatrix}
    0 & 0 & 1 & 0 \\
    0 & 1 &-1 & 1 \\
    0 &-1 & 1 & 0 \\
    0 & 0 & 0 & 0
\end{pmatrix}$$
observe that $\ker([T]_{\mathcal{B}} - 2I) = \spn\set{(1,0,0,0)^t}$.

        Solve for $x \in V$ such that $([T]_{\mathcal{B}} - 2I)[x]_{\mathcal{B}} = (1,0,0,0)^t$, by Gauss-Jordan elimination
$$\left(\begin{array}{cccc|c}
    0 & 0 & 1 & 0 & 1\\
    0 & 1 &-1 & 1 & 0\\
    0 &-1 & 1 & 0 & 0\\
    0 & 0 & 0 & 0 & 0
\end{array}\right)
\longrightarrow
\left(\begin{array}{cccc|c}
    0 & 1 & 0 & 0 & 1\\
    0 & 0 & 1 & 0 & 1\\
    0 & 0 & 0 & 1 & 0\\
    0 & 0 & 0 & 0 & 0
\end{array}\right)$$
we have $([T]_{\mathcal{B}} - 2I)(0,1,1,0)^t = (1,0,0,0)^t$.

        Next, solve for $y \in V$ such that $([T]_{\mathcal{B}} - 2I)[y]_{\mathcal{B}} = (0,1,1,0)^t$, by Gauss-Jordan elimination
$$\left(\begin{array}{cccc|c}
    0 & 0 & 1 & 0 & 0\\
    0 & 1 &-1 & 1 & 1\\
    0 &-1 & 1 & 0 & 1\\
    0 & 0 & 0 & 0 & 0
\end{array}\right)
\longrightarrow
\left(\begin{array}{cccc|c}
    0 & 1 & 0 & 0 &-1\\
    0 & 0 & 1 & 0 & 0\\
    0 & 0 & 0 & 1 & 2\\
    0 & 0 & 0 & 0 & 0
\end{array}\right)$$
so we have $([T]_{\mathcal{B}} - 2I)(0,-1,0,2)^t = (0,1,1,0)^t$.

    Then from the computations above, we see that with respect to the new ordered basis
$\mathcal{B}' := \left( \pmat{1&-2\\2&0},\pmat{1&0\\0&0},\pmat{0&1\\1&0},\pmat{0&-1\\0&2} \right)$,
$$[T]_{\mathcal{B}'} = \begin{pmatrix}
    4 & 0 & 0 & 0 \\
    0 & 2 & 1 & 0 \\
    0 & 0 & 2 & 1 \\
    0 & 0 & 0 & 2
\end{pmatrix}. \tagQED$$

Question 4
==========
For any $r\in \N$, let $P_r \in \M_r(K)$ denote the $r\times r$ matrix
$$P_r := \begin{pmatrix}
    0 & \cdots & 0 & 1  \\
    0 & \cdots & 1 & 0  \\
    \vdots & \iddots & \vdots & \vdots  \\
    1 & \cdots & 0 & 0
\end{pmatrix}.$$
It can easily be verified that $P_r P_r = I_r$.
Observe that post-multiplication by $P_r$ reverses the columns, while pre-multiplication by $P_r$ will reverse the rows,
so $A^t = P_n A P_n$. $A$ and $A^t$ having the same Jordan form would be a simple corollary. \qed

(Did I just defeat the point of this question?)

Question 4 (again)
==================
It is obvious that $A$ and $A^t$ has the same characteristic polynomial, and hence the same eigenvalues.
For any eigenvalue $\lambda$ of $A$ and $A^t$, observe that $(A - \lambda I)^t = A^t - \lambda I$.
For any $r\in \Z_{>0}$, $\left(\left(A-\lambda I\right)^r\right)^t = \left(\left(A-\lambda I\right)^t\right)^r = \left(A^t - \lambda I\right)^r$.
Then because row rank is the same as column rank, $(A - \lambda I)^r$ and $(A^t - \lambda I)^r$ have the same rank.
From this we can conclude that for each eigenvalue $\lambda$, $A$ and $A^t$ have the same associated dot diagrams, hence the same Jordan blocks.
Therefore $A$ and $A^t$ have the same Jordan form.

So we have $\exists Q, R \in \mathrm{GL}_n(K), J\in \M_n(K)$ with $J$ in Jordan form such that $J = QAQ^{-1} = RA^tR^{-1}$.
Then $A = Q^{-1}RA^tR^{-1}Q$, which shows that $A\sim A^t$.
\qed

Question 5
==========
(a) Let $N := A - \lambda I$ in $\M_n(K)$. For any $r\in \N$, computation shows that
$$N^r(i,j) = \delta(i+r, j) = \begin{cases}
    1 & \text{if } i + r = j,   \\
    0 & \text{otherwise.}
\end{cases}$$

(b) Let $D := \lambda I$, then $A = D + N$, note that $DN = ND$.
Since they commute, the binomial theorem applies,
then for any $r\in \N$ with $r\geq n$,
\begin{align*}
    A^r &= (D + N)^r    \\
    &= \sum_{k=0}^r \binom{r}{k} D^{r-k} N^{k}  \\
    &= \sum_{k=0}^{n-1} \binom{r}{k} \lambda^{r-k} N^{k}  \\
    A^r(i,j) &= \sum_{k=0}^{n-1} \binom{r}{k} \lambda^{r-k} N^{k}(i,j)  \\
    &= \sum_{k=0}^{n-1} \binom{r}{k} \lambda^{r-k} \delta(i+k, j)
\end{align*}
the Kronecker delta reduces the sum to a single term if $i\leq j$,
$$A^r(i,j) = \begin{cases}
    \displaystyle\binom{r}{k}\,\lambda^{r-k} &\text{if }\exists k\in \N.~ i+k = j, \\
    0 &\text{otherwise.}
\end{cases} \tagQED$$

Question 6
==========
$$A = \begin{pmatrix}
    1 & 1 & \cdots & 1 \\
    1 & 1 & \cdots & 1 \\
    \vdots &\vdots &\ddots &\vdots \\
    1 & 1 & \cdots & 1
\end{pmatrix} \in \M_n(\mathbb{F}_p)$$

(a) The characteristic polynomial of $A$ is
\begin{align*}
    \det(A-tI)
    &= \begin{vmatrix}
        1-t & 1 & \cdots & 1 \\
        1 & 1-t & \cdots & 1 \\
        \vdots &\vdots &\ddots &\vdots \\
        1 & 1 & \cdots & 1-t
    \end{vmatrix}   \\
    &\qquad  \Bigg\downarrow \text{add row $2,\dots,n$ to row $1$}   \\
    &= \begin{vmatrix}
        n-t & n-t & \cdots & n-t \\
        1 & 1-t & \cdots & 1 \\
        \vdots &\vdots &\ddots &\vdots \\
        1 & 1 & \cdots & 1-t
    \end{vmatrix}   \\
    &= \begin{vmatrix}
        n-t & 1 & \cdots & 1 \\
        n-t & 1-t & \cdots & 1 \\
        \vdots & \vdots & \ddots & \vdots \\
        n-t & 1 & \cdots & 1-t
    \end{vmatrix}   \\
    &\qquad  \Bigg\downarrow \text{subtract row $1$ from row $2,\dots,n$}   \\
    &= \begin{vmatrix}
        n-t & 1 & 1 &\cdots & 1 \\
        0 & -t & 0 & \cdots & 0 \\
        0 & 0 & -t & \cdots & 0 \\
        \vdots & \vdots &\vdots & \ddots & \vdots \\
        0 & 0 & 0 &\cdots & -t
    \end{vmatrix}   \\
    &= (n-t)(-t)^{n-1} \\
    &= (-1)^n (t^n - nt^{n-1})  \tagQED
\end{align*}

(b) From (a), $A$ has characteristic polynomial $(-1)^n t^{n-1} (t-n)$. So $A$ has eigenvalues $0$ and $n$ ($n \ne 0$ as $p\nmid n$).
    * For eigenvalue $n$, by inspection,
\begin{align*}
    A\pmat{1\\1\\\vdots\\1} &= \pmat{n\\n\\\vdots\\n}   \\
    &= n\pmat{1\\1\\\vdots\\1}
\end{align*}
so $K_n = E_n$ has a basis $\spn\set{(1,1,\dots,1)^t}$.
    * For eigenvalue $0$, observe that $\rank(A) = 1$, so $\nullity(A) = n-1$.
So $A$ is in fact diagonalisable.
By further observation, these $n-1$ linearly independent vectors form the basis for $\ker(A)$,
$$\set{-e_1 + e_j: j\in \set{2,\dots,n} }.$$

    Define $Q\in\M_n(\mathbb{F}_p)$ as
$$Q := \begin{pmatrix}
    1 & -1 & -1 & \cdots & -1   \\
    1 &  1 &  0 & \cdots & 0    \\
    1 &  0 &  1 & \cdots & 0    \\
    \vdots&\vdots&\vdots&\ddots&\vdots\\
    1 &  0 &  0 & \cdots & 1
\end{pmatrix}$$
As vectors from different eigen-bases are linearly independent, $Q$ is invertible,
then from computations above,
\begin{align*}
    AQ &= \begin{pmatrix}
        n & 0 & \cdots & 0\\
        n & 0 & \cdots & 0\\
        \vdots & \vdots & \ddots & \vdots\\
        n & 0 & \cdots & 0\\
    \end{pmatrix}   \\
    &= Q \begin{pmatrix}
        n & \\
        & \scalebox{6}{\fullmoon}
    \end{pmatrix}
\end{align*}
so by setting $J$ as the diagonal matrix obtained above, we have $Q^{-1}AQ = J$.
\qed
