---
title: CS2100 Tutorial 1
author: Qi Ji
date: Week 3
...

# Sign-extend

Copy the first bit leftwards.

* \(0101\) extended is \(00000101\).
* \(1001\) extended is \(11111001\).

# \(r-1\)'s complement (radix diminished complement)

(a) \(0101.11 - 010.0101\)

    After sign extension,
\[ \begin{array}{rr}
    &0101.1100 \\
   -&0010.0101 \\ \hline
    &0101.1100 \\
   +&1101.1010 \\ \hline
    &1\,0011.0110 \\\hline
    &0011.0111
\end{array}\]
remember the wrap-around carry property of one's complement.

(b) \(010111.101 - 0111010.11\)

    Similarly after sign extension, compute,
\[\begin{array}{rrcl}
    &0010111.101 \\
   -&0111010.110 \\ \hline
    &0010111.101 \\
   +&1000101.001 \\ \hline
    &1011100.110
\end{array}\]

# IEEE 754

* Sign is negative, sign bit is \(1\).

* \(0.078125\) in binary is, by iterated multiplication
\[0.000101 = 1.01 \times 2^{-4}\]
so exponent is \(-4\) and mantissa is \(01\).

* Store \((1, 123, 01\underline{0})\). \(123 = 1111011\), which is
\[1\ 01111011\ 01000000000000000000000\]

In hex, it's `0xbda00000`.

# CS1010

```{.c .numberLines}
#include <stdio.h>
#define MAX 10

int  readArray(int[], int);
void printArray(int[], int);
void reverseArray(int[], int);

int
main(void)
{
    int a[MAX], n;

    n = readArray(a, MAX);
    reverseArray(a, n);
    printArray(a, n);
}

int
readArray(int a[], int l)
{
    int x, *p;

    printf("Enter up to %d integers, terminating with a negative integer.\n", l);

    p = a;
    while (scanf("%d", p), *p > 0)
        p++;

    return p - a;
}

void
reverseArray(int a[], int n)
{
    int *p, *q, tmp;

    for (p = a, q = a + n - 1; p < q; ++p, --q) {
        tmp = *p;
        *p = *q;
        *q = tmp;
    }
}

void
printArray(int a[], int n)
{
    int i;

    for (i = 0; i < n; ++i)
        printf("%d ", a[i]);
    printf("\n");
}
```

# Tracing

| Code | `a` | `b` | `c` | `d` | `e` | `f` |
|-|-|-|-|-|-|-|
| `a = 3`       | 3 | | | | | |
| `b = &a`      | 3 | `a` | | | | |
| `*b = 5`      | 5 | `a` | | | | |
| `c = *b * 3`  | 5 | `a` | 15 | | | |
| `d = b`       | 5 | `a` | 15 | `a` | | |
| `e = *b + c`  | 5 | `a` | 15 | `a` | 20 | |
| `*d = c + e`  | 35 | `a` | 15 | `a` | 20 | |
| `f = &e`      | 35 | `a` | 15 | `a` | 20 | `e` |
| `a = *f + *b` | 55 | `a` | 15 | `a` | 20 | `e` |
| `*f = *d - *b`| 55 | `a` | 15 | `a` | 0 | `e` |

Expected output:
```
a = 55, c = 15, e = 0
*b = 55, *d = 55, *f = 0
```
