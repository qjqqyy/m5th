---
title: CS2106 tutorial 1
author: Qi Ji
date: 28th August 2019
---

#

a. junk
b.

```mips
lw   $2, -16($fp)   # put 16 in $2
add  $sp, $sp, $2   # add 16 to $sp
                    # $sp is now pointing at -24
lw   $1, 0($sp)     # put *(-24)=7 in $1
call print
```
c. whatever junk was in address `16`

#

## part a {-}

```{.mips .numberLines}
iFact:
      # irrelevant stuff...
      addi  $11, $0, 1      # put 1 somewhere
      sw    $11, -24($fp)   ## (a) result = 1

      addi  $12, $0, 2      # put 2 somewhere
      sw    $12, -20($fp)   ## (a) i = 2

      lw    $13, -16($fp)   ## (a) Get N
loop: bgt   $12, $13, end

      mul   $11, $11, $12
      sw    $11, -24($fp)

      addi  $12, $12, 1
      sw    $12, -20($fp)
```

## part b {-}

```{.mips .numberLines}
main:
      ....      # irrelevant crap

      addi  $13, $0, 10     # put 10 in $13
      sw    $13, -28($sp)
      call  iFact, 0($sp)
```

## part c {-}

```{.mips .numberLines}
iFact:
      # Callee enter function
      sw    $11, -20($sp)   # save registers
      sw    $12, -16($sp)
      sw    $13, -12($sp)

      sw    $sp, -8($sp)    # save $fp, $sp
      sw    $fp, -4($sp)

      addi  $fp, $sp, -12
      addi  $sp, $sp, -40   # move $fp, $sp to new position
      # Callee enter function done
```

## part d {-}

```{.mips .numberLines}
end:
      # Callee exit function
      sw    $11, 16($sp)    # save return result

      lw    $11, -8($fp)    # restore registers
      lw    $12, -4($fp)
      lw    $13, 0($fp)

      lw    $sp, 4($sp)
      lw    $fp, 8($fp)

      return -40($sp)
```
actually this doesn't really make sense idk

## part e (optional recursion) {-}

I too sian to do.

#

The 5 states are

* New
* Ready
* Running
* Blocked
* Exit

and it is obvious.
