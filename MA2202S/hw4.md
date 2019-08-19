---
title: MA2202S Homework 4
author: Qi Ji (A0167793L)
date: 1st Nov 2018
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
\newcommand{\ord}{\operatorname{ord}}
\newcommand{\ang}[1]{\left\langle #1 \right\rangle}

#

i. We already have \(\abs{S} = m\), just need to show \(\abs{gS} = m\).
From definition of \(gS\), we see that it is the image of \((g*)(S)\) the left-multiply by \(g\) map under \(S\).
Since the left-multiply map \((g*)\) is injective we have \(\abs{gS} = \abs{S} = m\).
\qed

ii. Let \(S \in X\), we can verify that \(\pi'(e, S) = eS = S\).
Now let \(g, h \in G\), \(\pi'(g, \pi'(h,S)) = \pi'(g, hS) = ghS\).
On the other hand \(\pi'(gh, S) = ghS\).
\qed

#

i. Since \(x_i\) and \(x_j\) are in the same orbit, we have a \(g\in G\) such that
\[ x_i = \pi(g)x_j. \]
Suppose \(z \in G_{x_i}\) such that \(\pi(z)x_i = x_i\), then we see that
\[ \pi(g^{-1} z g) x_j = \pi(g^{-1} z) x_i = \pi(g^{-1}) x_i = x_j \]
so \(g^{-1}zg \in G_{x_j}\).
We see that \(z \mapsto g^{-1}zg\) defines a map \(G_{x_i} \to G_{x_j}\).
This map of conjugation is bijective, as a symmetric argument shows that
\(z' \mapsto gz'g^{-1}\) defines a map \(G_{x_j} \to G_{x_i}\), which is its inverse.
\qed

ii. By part (i) and proposition 79,
\[ \sum_{i=1}^r \abs{G_{x_i}} = r \abs{G_{x_1}} = \abs{G{x_1}} \abs{G_{x_1}} = \abs{G}. \tagQED \]

#

i. From definition of the matrix \(A\), we have
\[ \sum_{i=1}^n a_{ij} = \abs{\set{g_i \in G: \pi(g_i)x_j = x_j}} = \abs{G_{x_j}}. \tagQED \]

ii. Also from definition of matrix \(A\), we have
\[ \sum_{j=1}^m a_{ij} = \abs{\set{x_j \in X: \pi(g_i)x_j = x_j}} = \abs{F(g_i)}. \tagQED \]

iii. By parts (i) and (ii),
\begin{align*}
    \sum_{j=1}^m \abs{G_{x_j}}
    &= \sum_{j=1}^m \sum_{i=1}^n a_{ij} \\
    &= \sum_{i=1}^n \sum_{j=1}^m a_{ij} \\
    &= \sum_{i=1}^n \abs{F(g_i)}. \tagQED
\end{align*}

iv. By part (ii) of previous question,
\[ \sum_{j=1}^m \abs{G_{x_j}} = \abs{G} \cdot \abs{\set{Gx : x \in X}}. \]
By part (iii) we have the number of \(G\)-orbits being
\[ \frac{1}{\abs{G}} \sum_{j=1}^m \abs{G_{x_j}} = \frac{1}{\abs{G}} \sum_{i=1}^n \abs{F(g_i)}. \tagQED \]
