---
title: Exercise 7.30
author: Qi Ji
date: 11th October 2019
...

\newcommand{\set}[1]{\left\{ #1\right\}}
\let\epsilon\varepsilon

> Construct Greibach Normal Form for the intersection of
> \(0^*1^*0^*1^*\) with \(L\),
> where \(L\) is the language of all non-empty palindromes given in Example 7.29.

First observe that a non-empty palindrome matching \(0^*1^*0^*1^*\) must match one of these four expressions,

* \(0^+1^+0^+\) and \(1^+0^+1^+\),
* \(1^+\) and \(0^+\).

Now we construct a grammar \((\set{S,T,U,V,W}, \set{0,1}, P, S)\) with the rules given by
\begin{align*}
S&\to 0T0 | 1U1 | 0V | 1W \\
T&\to 0T0 | 1W \\
U&\to 1U1 | 0V \\
V&\to 0V | \epsilon \\
W&\to 1W | \epsilon
\end{align*}
and we normalise it by adding two more non-terminals \(\set{\overline{0}, \overline{1}}\) and changing the rules to
\begin{align*}
S&\to 0T\overline{0} | 1U\overline{1} | 0V | 1W \\
T&\to 0T\overline{0} | 1W \\
U&\to 1U\overline{1} | 0V \\
V&\to 0V | \epsilon \\
W&\to 1W | \epsilon \\
\overline{0}&\to 0 \\
\overline{1}&\to 1
\end{align*}
