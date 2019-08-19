---
title: CS2100 Tutorial 4
author: Qi Ji
date: Week 6
...

\newcommand{\set}[1]{\left\{\, #1 \,\right\}}

# Eyeballing addresses

a.  `op $t1, $t2`

    * NA, NA
    * 15000, 20000

b.  `op $s2, 100($zero)`

    * NA, 100
    * 200, 1000

c.  `op $t4, 40($s2)`

    * NA, 240
    * 30000, 2400

d.  `op $s3, 200($zero)`

    * NA, 200
    * 240, 2000

e.  `op $t3, $zero($t1)`

    * Not a valid instruction.

f.  `op $s1, 140($s1)`

    * NA, 300
    * 160, 3000

# Different ISAs

Translate these 3 C statements

```C
a0 = a1 + a2;
a1 = a0 + a2;
a2 = a0 + a1;
```

## Stack

```
push @a1
push @a2
add
pop @a0

push @a0
push @a2
add
pop @a1

push @a0
push @a1
add
pop @a2
```

## Accumulator

```
load @a1
add @a2
store @a0

load @a0
add @a2
store @a1

load @a0
add @a1
store @a2
```

## Memory-Memory

```
add @a0, @a1, @a2
add @a1, @a0, @a2
add @a2, @a0, @a1
```

## Register-register

```
load $r0, @a0
load $r1, @a1
load $r2, @a2
add $r3, $r1, $r2
store $r3, @a0
add $r3, $r0, $r2
store $r3, @a1
add $r3, $r0, $r1
store $r3, @a2
```

# Follow-up ISA

* Opcode costs 3 bits
* 128 bytes of addressable memory \(\implies\) 128 distinct addresses \(\implies\) need 7 bits to specify memory location.

Stack
:   3 bits for opcode + 7 bits for address gives 10 bits

Accumulator
:   Same as stack

Memory-memory
:   3 bits for opcode + 3 addresses in a single instruction gives 24 bits = 3 bytes

Register-register
:   5 registers available, so need 3 bits to specify register.

    * add costs 3 bits for opcode + 9 bits for 3 registers giving 12 bits
    * load/store costs 3 bits for opcode + 3 bits for register + 7 bits for memory giving 13 bits (3 bytes needed!)

For code size, multiply number of bytes per instruction by number of instructions.
