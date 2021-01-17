---
title: GET1004 Tutorial 2
author: Qi Ji
date: 19th October 2020
---

#

For parts a and b simply press calculator

a. \(7972 \equiv 16 \pmod{17}\)

b. \(-36883 \equiv 126 \pmod{311}\)

c. we can compute each part first
\begin{align*}
231345678 &\equiv 2761 \pmod{3211} \\
121439870 &\equiv 3061 \pmod{3211} \\
231345678 \times 121439870 &\equiv 2761 \times 3061 \pmod{3211} \\
&\equiv 69 \pmod{3211}
\end{align*}

d. note \(24 = 2\cdot2\cdot2\cdot 3\) so we can compute in stages
\begin{align*}
5^2 &\equiv 25 \pmod{91} \\
5^4 &\equiv 25\times 25 \pmod{91} \\
&\equiv 79 \pmod{91} \\
5^8 &\equiv 79\times 79 \pmod{91} \\
&\equiv 53 \pmod{91} \\
5^{24} &\equiv 53\times 53\times 53 \pmod{91} \\
&\equiv 1 \pmod{91}
\end{align*}

e. similar to d we express \(100 = 2\cdot 2\cdot 5\cdot 5\)
\begin{align*}
2^5 &\equiv 32\pmod{119} \\
2^{25} &\equiv 32 \times 32 \times 32 \times 32\times 32\pmod{119} \\
&\equiv 2\pmod{119} \\
2^{100} &\equiv 2^{4} \pmod{119} \\
&\equiv 16\pmod{119}
\end{align*}

f. bruteforce, want to solve
\[ 8x = 49k+3 \]
try \(k=1,2,\dots\) one by one, will get \(x=31, k=3\).

#

Encrypt function is \[ f(x) = 15x + 7\mod{26}. \]
We find its inverse
\begin{align*}
y &= 15x + 7 \mod{26} \\
15x &\equiv y + 19 \pmod{26}
\end{align*}
now the multiplicative inverse of \(15\) is \(7 \pmod{26}\),
and since \(7\times 19\equiv 3\pmod{26}\), the inverse is
\[ g(x) = 7x + 3 \mod{26}. \]

Using \(g\) to decrypt we get plaintext to be `gxhyp`.

#

\newcommand\set[1]{\left\{ #1 \right\}}

\[\mathbb{Z}^*_{18} = \set{n\in\set{1,\dots,17}: \gcd(n,18)=1} \]
as \(18 = 2\cdot 3^2\), we exclude all multiples of \(2\) and \(3\) to get
\[\mathbb{Z}^*_{18} = \set{1,5,7,11,13,17}.\]

#

a. Computing powers of \(2\) mod \(11\) we get \[2,4,8,5,10,9,7,3,6,1\] so \(2\) is a generator.

b. Computing powers of \(3\) mod \(11\) we get \[3,9,5,4,1\] so \(3\) is not a generator.

#

i. To encrypt we compute \(7^{13}\mod{6497}\)
\begin{align*}
7^{4} &\equiv 2401\pmod{6497} \\
7^{5} &\equiv 2401\times 7 \\ &\equiv 703\pmod{6497} \\
7^{8} &\equiv 2401\times 2401 \\ &\equiv 1962\pmod{6497} \\
7^{13} &\equiv 2401\times 703 \\ &\equiv 3059\pmod{6497}
\end{align*}

ii. \(\phi(n) = 88\times 72 = 6336\)
to find multiplicative inverse of \(13\) mod \(6336\) we use extended gcd
\begin{align*}
6336 &= 487\cdot 13 + 5 \\
13 &= 2\cdot 5 + 3 \\
5 &= 3 + 2\\
3 &= 2 + 1\\
1 &= 3 - 2 \\
&= 3 - (5-3)\\
&= 2\cdot3 - 5\\
&= 2\cdot(13-2\cdot5) - 5\\
&= 2\cdot13 -5\cdot5\\
&= 2\cdot13 - 5\cdot(6336-487\cdot13)\\
&= 2437\cdot13 - 5\cdot6336
\end{align*}
to get \(13\cdot2437\equiv 1\pmod{6336}\).

iii.
To decrypt \(9\) we compute \(9^{2437}\mod n\),
which is \(507870\mod 6497 = 1104\).
