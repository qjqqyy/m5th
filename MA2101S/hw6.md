---
title: MA2101S Homework 6
author: Qi Ji (A0167793L)
date: 19th March 2018
...

<!---
\newcommand{\intertext}[1]{&\text{#1}\\}
-->

\newcommand{\set}[1]{\left\{\, #1 \,\right\}}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\qed}{\hfill$\square$}
\newcommand{\tagQED}{\tag*{$\square$}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\M}{\mathbb{M}}
\newcommand{\chara}{\operatorname{char}}
\newcommand{\adj}{\operatorname{adj}}
\renewcommand{\Im}{\operatorname{Im}}
\newcommand{\rank}{\operatorname{rank}}
\newcommand{\nullity}{\operatorname{nullity}}
\newcommand{\Tr}{\operatorname{Tr}}
\let\leq\leqslant
\let\geq\geqslant
\let\setminus\smallsetminus
\let\tilde\widetilde


Question 1
==========
>Let $K$ be a field with $\chara(K)\ne 2$ (i.e. $1 + 1\ne 0$ in $K$),
>let $n\in \N$ be an __odd__ natural number, and
>let $X,Y \in \M_n(K)$ be two $n\times n$ square matrices over $K$.
>
>(a) Show that if $X^t = -X$, then $X$ is not invertible.
>(b) Show that if $XY = -YX$, then $X$ or $Y$ is not invertible.

(a) *Proof.*
Suppose $X^t = -X$, using the facts that $-X = (-1_n)X$, determinant is multiplicative, and $(-1)^n = -1$ as $n$ is odd,
\begin{align*}
    \det(X) = \det(X^t) &= \det(-X) = \det((-1_n)X) \\
    \det(X) &= \det(-1_n)\,\det(X)    \\
    \det(X) &= (-1)^n\,\det(X)    \\
    \det(X) &= -\det(X)    \\
    \det(X) + \det(X) &= 0    \\
    \det(X)\, (1+1) &= 0
\end{align*}
as $\chara(K)\ne 2$, $\det(X) = 0$, so $X$ is not invertible.
\qed

(b) *Proof.*
Suppose $XY = -YX$, then similarly,
\begin{align*}
    \det(XY) &= \det((-1_n)YX)   \\
    \det(X)\det(Y) &= -\det(Y)\det(X)   \\
    \det(X)\det(Y)(1+1) &= 0
\end{align*}
again as $\chara(K)\ne 2$, $\det(X)\det(Y) = 0$, so $X$ or $Y$ is not invertible.
\qed

\newpage

Question 2
==========
> Let $K$ be a field, and let $a,b,c,d,e,f\in K$ be elements of $K$.
> Consider the $4\times 4$ skew-symmetric matrix
> $$
X := 
\begin{pmatrix}
     0 &  a &  b & c\\
    -a &  0 &  d & e\\
    -b & -d &  0 & f\\
    -c & -e & -f & 0
\end{pmatrix}
\quad \text{in }\M_4(K).
$$
> Show that $\det(X) = \left(af - be + cd\right)^2$.

*Proof.*
As $X$ is only $4\times 4$, expand $\det(X)$,
\begin{align*}
    \det(X) &=
    0
    - a \begin{vmatrix}
        -a &  d & e\\
        -b &  0 & f\\
        -c & -f & 0
    \end{vmatrix}
    + b \begin{vmatrix}
        -a &  0 & e\\
        -b & -d & f\\
        -c & -e & 0
    \end{vmatrix}
    - c \begin{vmatrix}
        -a &  0 & d\\
        -b & -d & 0\\
        -c & -e & -f
    \end{vmatrix}   \\
    &= -a\left(-cdf + bef - af^2 \right) + b\left(be^2 - aef - cde\right) - c\left(-adf + bde - cd^2\right) \\
    &= acdf - abef + a^2f^2 + b^2e^2 - abef - bcde + acdf - bcde + c^2d^2   \\
    &= (af)^2 + (cd)^2 + (be)^2 + 2acdf - 2abef - 2bcde
\end{align*}
On the other hand,
\begin{align*}
    \left(af - be + cd\right)^2 &= af\left(af - be + cd\right) - be\left(af - be + cd\right) + cd\left(af - be + cd\right)  \\
    &= (af)^2 - abef + acdf - abef + (be)^2 - bcde + acdf - bcde + (cd)^2  \\
    &= (af)^2 + (cd)^2 + (be)^2 + 2acdf - 2abef - 2bcde
\end{align*}
Therefore $\det(X) = \left(af - be + cd\right)^2$.
\qed

\newpage

Question 3
==========
> Let $K$ be a field, and let $n\in\N$ be any natural number with $n>1$.
> Consider an $n\times n$ square matrix $A\in \M_n(K)$.
>
> (a) Show that $\det(\adj(A)) = \det(A)^{n-1}$.
> (b) Show that if $A$ is an invertible upper-triangular matrix, then the same is true for $\adj(A)$.

__Claim.__ $A\,\adj(A) = \det(A)\, 1_n$.

*Proof (of Claim).*
Expanding the $(i,j)$ entries of $A\,\adj(A)$, we have
\begin{align*}
    \left(A\,\adj(A)\right)_{ij}
    &= \sum_{k=1}^n A_{ik}\,\adj(A)_{kj}    \\
    &= \sum_{k=1}^n (-1)^{j+k}\, A_{ik}\,\det(\tilde{A}_{jk})
\end{align*}

1. Case $i = j$, we get the co-factor expansion along the $i$-th row, which evaluates to $\det(A)$.
2. Case $i \ne j$,
consider the matrix $B$ obtained by copying $A$, then replacing its $j$-th with the $i$-th row of $A$.
Then for any $k\in \set{1,\dots,n}$, $A_{ik} = B_{ik} = B_{jk}$ and $\tilde{A}_{jk} = \tilde{B}_{jk}$,
then
\begin{align*}
    \left(A\,\adj(A)\right)_{ij}
    &= \sum_{k=1}^n (-1)^{j+k}\, B_{jk}\,\det(\tilde{B}_{jk})   \\
    &= \det(B)
\end{align*}
as $B$ by construction has two equal rows, it has determinant $0$.

Therefore
\begin{align*}
    \left(A\,\adj(A)\right)_{ij} &= \begin{cases}
        \det(A) &\text{if } i = j   \\
        0 & \text{otherwise}
    \end{cases} \\
    A\,\adj(A) &= \det(A)\, 1_n . \tagQED
\end{align*}

(a) *Proof.* Consider the equality proven, taking determinants,
\begin{align*}
    A\,\adj(A) &= \det(A)\, 1_n \\
    \det(A)\,\det(\adj(A)) &= \det(A)^n
\end{align*}
If $A$ is invertible ($\det(A) \ne 0$), we obtain the conclusion.

    As $n > 1$, $0^{n-1} = 0$. It remains to show that when $\det(A) = 0$, $\det(\adj(A)) = 0$.
Suppose $A$ is singular, from claim, $$A\,\adj(A) = 0.$$
Reading this equality in terms of left-multiplication means that $\Im(\adj(A)) \subseteq \ker(A)$,
which means $\rank(\adj(A)) \leq \nullity(A)$.
    * Suppose $\nullity(A) = n$, then $A$ is the zero matrix which trivially implies that $\adj(A)$ is also the zero matrix, in this case $\adj(A)$ will be singular.
    * Now suppose $\nullity(A) < n$, then $\rank(\adj(A)) \leq \nullity(A) < n$, which implies $\adj(A)$ is not full rank, and thus singular too.

    Therefore, the equation $\det(\adj(A)) = \det(A)^{n-1}$ holds too when $A$ is singular. \qed

(b) *Proof.*
Suppose $A$ is an invertible upper-triangular matrix, then by claim, $\adj(A)$ is invertible too and has inverse $\frac{1}{\det(A)} A$.
Since $A$ is upper-triangular, whenever $i > j$, $A_{ij} = 0$.
The $(i,j)$-entries for $\adj(A)$ is given by
$$\adj(A)_{ij} = (-1)^{i+j}\,\det(\tilde{A}_{ji}).$$
Then to show that $\adj(A)$ is upper-triangular, it suffices to show that for any $k,l\in \set{1,\dots,n}$, $l > k \implies \det(\tilde{A}_{kl}) = 0$.

    Take
any $k,l\in\set{1,\dots,n}$ with $k < l$.
Let $d_1,\dots,d_n\in K$ be diagonal entries of $A$, then $\tilde{A}_{kl}$ can be expressed as
$$\tilde{A}_{kl} =
\begin{pmatrix} %{cccccccccc}
    d_1 &        &          &       &       &        &        &         &        & \\
        & \ddots &          &       &       &        &        &         &        & \\
        &        & d_{k-1}  &       &       &        &        &\makebox(0,0){\huge*} &        & \\
        &        &          & 0     & d_{k+1}&       &        &         &        & \\
        &        &          &       & \ddots& \ddots &        &         &        & \\
        &        &          &       &       & \ddots & d_{l-1}&         &        & \\
        &        &          &       &       &        & 0      &         &        & \\
        &        &\makebox(0,0){\huge0}&&&    &        & d_{l+1} &        & \\
        &        &          &       &       &        &        &         & \ddots & \\
        &        &          &       &       &        &        &         &        & d_n
\end{pmatrix} .$$
Hence visually verify that whenever $k < l$, $\tilde{A}_{kl}$ is an upper-triangular matrix with at least one zero on the diagonal, then $\det(\tilde{A}_{kl}) = 0$. This completes the proof that $\adj(A)$ is upper-triangular.
\qed

\newpage

Question 4
==========
>Let $K$ be a field, and let $m,n\in \N_{>0}$ be positive integers, and let $V := \M_{m\times n}(K)$ be the $K$-vector space of $m\times n$ matrices over $K$.
>Fix a $m\times m$ square matrix $A\in \M_{m\times m}(K)$ and a $n\times n$ square matrix $B\in\M_{n\times n}(K)$, and consider the map
>$$\Phi: V\to V\quad\text{given by}\quad X\mapsto AXB.$$

__Note.__ Throughout this question, let 
$\mathcal{H} := \left(e_{11},\dots,e_{1n},\dots,e_{m1},\dots,e_{mn}\right)$ denote the standard basis for $\M_{m\times n}(K)$ ordered this way.
Where for any $(r,s)\in\set{1,\dots,m}\times\set{1,\dots,n}$, $e_{rs} \in \M_{m\times n}(K)$ is characterised by
$$(e_{rs})_{ij} = \delta_{ir}\delta_{js} =
\begin{cases}
    1 &\text{if } (i, j) = (r, s)   \\
    0 &\text{otherwise}
\end{cases}.$$

##### (a) Show that $\Phi$ is a $K$-linear operator on $V$, and compute its trace $\Tr(\Phi)$ in terms of $A$ and $B$.

*Solution.*
First note that $\Phi = (X \mapsto AX)\circ (Y\mapsto YB)$. Then because matrix multiplication is bi-linear, $\Phi$ is a composition of linear maps and is hence a $K$-linear operator on $V$.

In order to compute the trace, first figure out where $\Phi$ sends the standard basis vectors to.
For any $(r,s)\in\set{1,\dots,m}\times\set{1,\dots,n}$,
\begin{align*}
    \Phi(e_{rs}) &= A\, e_{rs}B  \\
    &= A\,\begin{pmatrix} &0 \\ & \vdots \\ B_{s1} & \cdots & B_{sn} \\&  \vdots \\&  0 \end{pmatrix} \leftarrow\text{in $r$-th row}   \\
    &=\begin{pmatrix}
        A_{1r}B_{s1} & A_{1r}B_{s2} & \cdots & A_{1r}B_{sn} \\
        A_{2r}B_{s1} & A_{2r}B_{s2} & \cdots & A_{2r}B_{sn} \\
        \vdots       & \vdots       & \ddots & \vdots   \\
        A_{mr}B_{s1} & A_{mr}B_{s2} & \cdots & A_{mr}B_{sn}
    \end{pmatrix}   \\
    \left(\Phi(e_{rs})\right)_{ij} &= A_{ir}\,B_{sj}
    \intertext{Then the trace can be computed by}
    \Tr(\Phi) &= \sum_{(r,s)} \left(\Phi(e_{rs})\right)_{rs}    \\
    &= \sum_{(r,s)} A_{rr}B_{ss}    \\
    &= \sum_{r=1}^m \sum_{s=1}^n A_{rr}B_{ss}   \\
    &= \Tr(A)\Tr(B) \tag*{$\blacksquare$}
\end{align*}

\newpage

##### (b) Compute the determinant $\det(\Phi)$ of $\Phi$ in terms of $A, B, m$ and $n$.

*Solution.*
Since we established that $\Phi = (X \mapsto AX)\circ (Y\mapsto YB)$, and since determinant is multiplicative, it suffices to compute the determinant for each $L_A, R_B: V\to V$, where $L_A := X \mapsto AX$ and $R_B := Y\mapsto YB$.

__Finding determinant of $L_A$.__
For any $(r,s)\in\set{1,\dots,m}\times\set{1,\dots,n}$, compute $L_A(e_{rs})$,
\begin{align*}
    L_A(e_{rs}) &= A\,e_{rs}    \\
    &= \begin{pmatrix}
        & & A_{1r} & &  \\
        0&\cdots & \vdots &\cdots &0    \\
        & & A_{mr} & &
    \end{pmatrix}   \\
    &\qquad \text{in column $s$}\uparrow    \\
    &= A_{1r}e_{1s} + \dots + A_{mr}e_{ms}
\end{align*}
Then by substituting in different values of $r$ and $s$, we derive the matrix representation of $L_A$ (with respect to ordered basis $\mathcal{H}$) in block form as
\begin{equation*}
    \left[ L_A \right]_{\mathcal{H}} =
    \begin{pmatrix}
        A_{11}\,1_n & A_{12}\,1_n & \cdots & A_{1m}\,1_n   \\
        A_{21}\,1_n & A_{22}\,1_n & \cdots & A_{2m}\,1_n   \\
        \vdots      & \vdots      & \ddots & \vdots        \\
        A_{m1}\,1_n & A_{m2}\,1_n & \cdots & A_{mm}\,1_n
    \end{pmatrix}
    \tag*{(1)}
\end{equation*}

If $A$ is singular, it is clear that the left-multiplication by $A$ operator has no inverse, which implies $\det(L_A) = 0 = \det(A)$.
If $A$ is an invertible matrix, then $A$ is a product of elementary matrices, so there exists elementary matrices $E_1,\dots,E_k\in \M_{m\times m}(K)$ such that $A = E_k\cdots E_1$.
Then $L_A = L_{E_k}\circ \cdots \circ L_{E_1}$. Then we are reduced to finding out the determinant of the left-multiply by elementary matrix operator.

__Claim.__ For any elementary matrix $E\in \M_{m\times m}(K)$, $\det(L_{E}) = \det(E)^n$.

1. Case $E$ is a "row swap" elementary matrix, then by substituting $A = E$ in (1), $[L_{E}]_{\mathcal{H}}$ consists of $n$ row swaps from $1_{mn}$.
Then $\det(L_{E}) = (-1)^n = \det(E)^n$.
2. Case $E$ is of a "multiply a row by $c\in K$" matrix, then examine (1) again, $[L_{E}]_{\mathcal{H}}$ is a diagonal matrix with all ones except $n$ occurrences of $c$. Then $\det(L_E) = c^n = \det(E)^n$.
3. Case $E$ is "add multiple of row to another row" matrix, then from (1), $[L_{E}]_{\mathcal{H}}$ will be triangular with $1$'s on the diagonal, so $\det(L_E) = 1 = \det(E)^n$.

Then from multiplicativity of determinant, recall that $\det(A) = \det(E_k)\cdots\det(E_1)$, then
\begin{align*}
    \det(L_A) &= \det(L_{E_k})\cdots\det(L_{E_1})    \\
    &= \det(E_k)^n\cdots\det(E_1)^n \\
    &= \left(\det(E_k)\cdots\det(E_1)\right)^n  \\
    &= \det(A)^n
\end{align*}

__Finding determinant of $R_B$.__
For any $(r,s)\in\set{1,\dots,m}\times\set{1,\dots,n}$, compute $R_B(e_{rs})$,
\begin{align*}
    R_B(e_{rs}) &= e_{rs}\,B    \\
    &= \begin{pmatrix}&0 \\ & \vdots \\ B_{s1} & \cdots & B_{sn} \\&  \vdots \\&  0
    \end{pmatrix} \leftarrow\text{in $r$-th row}   \\
    &= B_{s1}e_{r1} + \dots + B_{sn}e_{rn}
\end{align*}
This time, obtain the matrix representation of $R_B$ (with respect to ordered basis $\mathcal{H}$) in block form as
$$ \left[R_B\right]_{\mathcal{H}} =
\begin{pmatrix}
    B^t \\
    & B^t \\
    & & \ddots \\
    & & & B^t
\end{pmatrix} \leftarrow\text{repeats $m$ times on diagonal} \tag*{(2)}$$

If $B$ is singular, it is again clear that $R_B$ has no inverse, and $\det(R_B) = 0$.
If $B$ is invertible, exists elementary matrices $E_1,\dots,E_k \in \M_{n\times n}(K)$ such that $B = E_1\cdots E_k$,
then $R_B = R_{E_k}\circ\dots\circ R_{E_1}$.
Now using a similar argument, we can find the determinant of $R_B$.

__Claim.__ For any elementary matrix $E\in \M_{n\times n}(K)$, $\det(R_E) = \det(E)^m$.

1. Case $E$ is a row swap matrix, then from (2), $[R_E]_{\mathcal{H}}$ contains $m$ row swaps from $1_{mn}$, so $\det(R_E) = (-1)^m = \det(E)^m$.
2. Case $E$ is of "multiply a row by $c\in K$" type, then in (2), $[R_E]_{\mathcal{H}}$ is a diagonal matrix with all ones except for $m$ occurrences of $c$. Then $\det(L_E) = c^m = \det(E)^m$.
3. Case $E$ is "add multiple of row to another row" matrix, then from (2), $[R_E]_{\mathcal{H}}$ will be triangular with $1$'s on diagonal, so $\det(R_E) = 1 = \det(E)^m$.

Then from multiplicativity of determinant, we get $\det(R_B) = \det(B)^m$.

Finally, as $\Phi = L_A\circ R_B$, $\det(\Phi) = \det(L_A)\,\det(R_B) = \det(A)^n\det(B)^m$.
\hfill$\blacksquare$

\newpage

Question 5
==========
> Let $K$ be a field, and let $x_1,\dots,x_n\in K$ be $n$ elements of $K$.
> The $n\times n$ *van der Monde determinant* of $x_1,\dots,x_n$ is defined as
> $$V(x_1,x_2, \dots, x_n) := \det
\begin{pmatrix}
1 & 1 & \cdots & 1  \\
x_1 & x_2 & \cdots & x_n  \\
\vdots &\vdots &\ddots &\vdots  \\
x_1^{n-1} & x_2^{n-1} & \cdots & x_n^{n-1}
\end{pmatrix}.$$
> Show that
> $$V(x_1, x_2, \dots, x_n) = \prod_{1\leq i<j\leq n} (x_j - x_i)\quad\text{in }K.$$

*Proof.*
Proceed by induction on $n$.

__Base case.__ For $n = 2$, $x_1, x_2\in K$,
\begin{align*}
    V(x_1, x_2) &= \det\begin{pmatrix}
        1 & 1   \\
        x_1 & x_2
    \end{pmatrix}   \\
    &= x_2 - x_1 = \prod_{1\leq i<j\leq n} (x_j - x_i)
\end{align*}

__Induction hypothesis.__ Suppose for any $n-1$ elements $x_2,\dots,x_n \in K$, we have
$V(x_2,\dots,x_n) = \prod_{2\leq i<j\leq n} (x_j - x_i)$.

Then for $n$ elements $x_1,\dots,x_n\in K$,
\begin{align*}
    V(x_1,x_2,\dots,x_n)
    &= \begin{vmatrix}
        1 & 1 & \cdots & 1  \\
        x_1 & x_2 & \cdots & x_n  \\
        \vdots &\vdots &\ddots &\vdots  \\
        x_1^{n-1} & x_2^{n-1} & \cdots & x_n^{n-1}
    \end{vmatrix}   \\
    \intertext{subtract $x_1$ times of $n-1$-th row from $n$-th row}
    &= \begin{vmatrix}
        1 & 1 & \cdots & 1  \\
        x_1 & x_2 & \cdots & x_n  \\
        \vdots &\vdots &\ddots &\vdots  \\
        0 & x_2^{n-2}(x_2 - x_1) & \cdots & x_n^{n-2}(x_n - x_1)
    \end{vmatrix}   \\
    \intertext{successively subtract $k-1$-th row from $k$-th row as $k$ iterates from $n-1$ to 2, and get}
    &= \begin{vmatrix}
        1 & 1 & \cdots & 1  \\
        0 & x_2-x_1 & \cdots & x_n-x_1  \\
        \vdots &\vdots &\ddots &\vdots  \\
        0 & x_2^{n-2}(x_2 - x_1) & \cdots & x_n^{n-2}(x_n - x_1)
    \end{vmatrix}   \\
    \intertext{co-factor expansion along first column}
    &= \begin{vmatrix}
        x_2-x_1 & x_3 - x_1 & \cdots & x_n-x_1  \\
        x_2(x_2-x_1) & x_3(x_3 - x_1) &\cdots & x_n(x_n-x_1)  \\
        \vdots &\vdots &\ddots &\vdots  \\
        x_2^{n-2}(x_2 - x_1) & x_3^{n-2}(x_3 - x_1) & \cdots & x_n^{n-2}(x_n - x_1)
    \end{vmatrix}   \\
    \intertext{since every column has a scalar I can factor out, take determinant of the transpose then use multi-linearity}
    &= \begin{vmatrix}
        x_2-x_1 & x_2(x_2-x_1) &\cdots & x_2^{n-2}(x_2 - x_1) \\
        x_3-x_1 & x_3(x_3-x_1) &\cdots & x_3^{n-2}(x_3 - x_1) \\
        \vdots &\vdots &\ddots &\vdots  \\
        x_n-x_1 & x_n(x_n-x_1) &\cdots & x_n^{n-2}(x_n - x_1)
    \end{vmatrix}   \\
    &= \prod_{j=2}^n (x_j - x_1)\ 
    \begin{vmatrix}
        1 & x_2 &\cdots & x_2^{n-2} \\
        1 & x_3 &\cdots & x_3^{n-2} \\
        \vdots &\vdots &\ddots &\vdots  \\
        1 & x_n &\cdots & x_n^{n-2}
    \end{vmatrix}   \\
    &= \prod_{j=2}^n (x_j - x_1)\ 
    \begin{vmatrix}
        1 & 1 &\cdots & 1   \\
        x_2 & x_3 &\cdots & x_n \\
        \vdots &\vdots &\ddots &\vdots  \\
        x_2^{n-2} & x_3^{n-2} &\cdots & x_n^{n-2}
    \end{vmatrix}   \\
    &= \prod_{j=2}^n (x_j - x_1)\ V(x_2,\dots,x_n)  \\
    \intertext{now applying induction hypothesis,}
    &= \prod_{j=2}^n (x_j - x_1)\ \prod_{2\leq i<j\leq n} (x_j - x_i)\\
    &= \prod_{1\leq i<j\leq n} (x_j - x_i) \tagQED
\end{align*}

\newpage

Question 6
==========
*Proof.* Proceed by induction on $n$.

__Base case.__ For $n = 2$, let $a_1, a_2 \in K$,
\begin{align*}
    \frac{(a_1, a_2)}{(a_2)} &= \frac{\det\begin{pmatrix}
        a_1 & 1 \\
        -1 & a_2
    \end{pmatrix}}{a_2}   \\
    &= \frac{a_1a_2 + 1}{a_2}   \\
    &= a_1 + \frac{1}{a_2}
\end{align*}

__Induction hypothesis.__ Suppose for any $n-1$ elements $a_2,\dots,a_n\in K$,
$$a_2 + \cfrac{1}{a_3 + \cfrac{\ddots}{\ddots + \cfrac{1}{a_{n-1} + \cfrac{1}{a_n}}}}
= \frac{(a_2,a_3,\dots,a_n)}{(a_3,\dots,a_n)}.$$

Then for any $n$ elements $a_1,\dots,a_n \in K$, compute $(a_1,\dots,a_n)$ by expanding along first row,
\begin{align*}
    (a_1,\dots,a_n) &= a_1
    \begin{vmatrix}
        a_2 & 1     &       &       &     \\
        -1  & a_3   &\ddots &\makebox(0,0){\huge0} &     \\
            &\ddots &\ddots &\ddots &     \\
            &\makebox(0,0){\huge0} &\ddots &a_{n-1}& 1   \\
            &       &       &-1     &a_n
    \end{vmatrix}
    - \begin{vmatrix}
        -1  &   1   \\
        0   & a_3   &\ddots & \makebox(0,0){\huge0} \\
            & -1    &\ddots & \ddots\\
            &\makebox(0,0){\huge0} &\ddots &a_{n-1}& 1     \\
            &       &       & -1     &a_n
    \end{vmatrix}   \\
    \intertext{expand second term along its first column}
    &= a_1(a_2,a_3,\dots,a_n) + 
    \begin{vmatrix}
        a_3   &1      &       &\makebox(0,0){\huge0} \\
        -1    &\ddots & \ddots\\
              &\ddots &\ddots & 1     \\
        \makebox(0,0){\huge0} &       & -1     &a_n   \\
    \end{vmatrix}   \\
    &= a_1(a_2,a_3,\dots,a_n) + (a_3,\dots,a_n)
\end{align*}
then division throughout by $(a_2,\dots,a_n)$ (assuming it makes sense) will allow us to apply the induction hypothesis
\begin{align*}
    \frac{(a_1,a_2,\dots,a_n)}{(a_2,\dots,a_n)} &= a_1 + \frac{(a_3,\dots,a_n)}{(a_2,a_3,\dots,a_n)}    \\
    &= a_1 + \cfrac{1}{\cfrac{(a_2,a_3,\dots,a_n)}{(a_3,\dots,a_n)}}    \\
    &= a_1 + \cfrac{1}{a_2 + \cfrac{1}{a_3 + \cfrac{\ddots}{\ddots + \cfrac{1}{a_{n-1} + \cfrac{1}{a_n}}}}}
    \tagQED
\end{align*}
