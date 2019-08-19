---
title: CS2100 Tutorial 2
author: Qi Ji
date: Week 4
...

\newcommand{\F}{\mathbb{F}}
\newcommand{\Z}{\mathbb{Z}}

# Bitwise ops

trivial.

# Swapping

Let \(\otimes\) denote coordinate-wise XOR in \(\F_2^n\).
Notice that \((\F_2^n, \otimes)\) forms an Abelian group, where
for any vector \(p\), \(p\otimes p = 0\), that is every element is its own inverse.
Additionally, \(0\) is the identity element.
Therefore, to swap two bits, first note that for any \(a,b \in \F_2^n\)
\begin{align*}
    a &= a \otimes 0 = a \otimes b \otimes b \\
    b &= 0 \otimes b = a \otimes a \otimes b
\end{align*}
so in code
```c
void swap(int *a, int *b) {
    *a ^= *b;   // *a = a ^ b
    *b ^= *a;   // *b = a ^ b ^ b = a ^ 0 = a
    *a ^= *b;   // *a = a ^ b ^ a = b ^ 0 = b
}
```
an alternative is using \(+\) since machines do addition modulo \(\Z/2^w\Z\).

# Bit masks

(a) `b = a % 16;`

    Note that \(16 = 2^4\), so we mask it with the bit sequence \(1111 = 15 = (F)_{16}\), obtaining
```mips
andi   $s1, $s0, 0xF
```

(b) `b = (a / 8) * 8;`

    This effectively zeroes the lowest \(3\) bits. I could either

    *   And-mask the lowest 3 bits then bitwise xor;
```mips
andi    $t0, $s0, 0x7       # lowest 3 bits go to $t0
xor     $s1, $s0, $t0
```
    *   Shift right, then shift left.
```mips
srl     $s1, $s0, 3
sll     $s1, $s1, 3
```
    Which is better?

# Bit twiddling

(a)
    i.  `$s0 = 0x8000001F`
    ii. `$s0 = 0x0AAAAAAA`

(b) For every \(1\) in the sequence `$s0` \(\in \F_2^{32}\), it toggles the MSB of `$s0`.

# Loop through array

(a) Tracing. In iterations...

    1. First iteration.
\begin{align*}
    t_1 &\leftarrow M[112] = 108 \\
    s_1 &\leftarrow 0 + 108 = 108 \\
    t_0 &\leftarrow M[4 + 112] = M[116] = 124
\end{align*}
    2. Second iteration.
\begin{align*}
    t_1 &\leftarrow M[124] = 104 \\
    s_1 &\leftarrow 108 + 104 = 212 \\
    t_0 &\leftarrow M[4 + 124] = M[128] = 100
\end{align*}
    3. Third iteration.
\begin{align*}
    t_1 &\leftarrow M[100] = 120 \\
    s_1 &\leftarrow 212 + 120 = 332 \\
    t_0 &\leftarrow M[4 + 100] = M[104] = 132
\end{align*}

(b) Set \(M[104] \leftarrow 0\) will cause it to terminate.

(c) "High-level" code
```c
int t0 = 112, t1, s1 = 0;
while (t0 != 0) {
    t1 = M[t0];
    s1 += t1;
    t0 = M[t0+1];
}
```
or in pointer notation,
```c
int *t0 = 112, t1, s1 = 0;
while (t0 != 0) {
    t1 = *t0;
    s1 += t1;
    t0 = *(t0+1);
}
```
