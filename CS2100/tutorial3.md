---
title: CS2100 Tutorial 3
author: Qi Ji
date: Week 5
...

\newcommand{\set}[1]{\left\{\, #1 \,\right\}}

# D1 {-}

a. register `$t1` maintains a pointer to current element in array *B*.

b. \(A = \set{3,4,1,2,0,5,9,0}\) and \(B = \set{7,4,5,6,1,0,0,9}\)

c. 2 swaps, so 4 store words.

d. `-9`?

e. `bge  $t4, $t3, skip`

# Palindrome

## using indices

```{.mips .numberLines}
        li      $s0, 0          # low = 0
        sub     $s1, $s5, 1     # high = size - 1
        li      $s3, 1          # matched = 1
loop:   bge     $s1, $s0, end   # if (low >= high) goto end
        beq     $s3, $zero, end # if (!matched) goto end
        sll     $t0, $s0, 2     # low * 4
        add     $t1, $s4, $t0   # &string[low]
        lw      $t2, 0($t1)     # $t2 <- string[low]
        sll     $t3, $s1, 2     # high * 4  ($t4 reused)
        add     $t4, $s4, $t3   # &string[high]
        lw      $t5, 0($t4)     # $t5 <- string[high]
        beq     $t2, $t5, else  # if (string[low] == string[high]) goto else
        li      $s3, 0          # matched = 0
else:   addi    $s0, $s0, 1     # low++
        addi    $s1, $s1, -1    # high--
        j       loop
end:
```

## using pointers (like you should)

```{.mips .numberLines}
        li      $s0, $s4        # low = &string[0]
        addi    $s1, $s5, -1    # size - 1
        sll     $s1, $s1, 2     # (size - 1) * 4
        add     $s1, $s1, $s4   # high = low + (size-1)*4
        li      $s3, 1          # matched = 1
loop:   bge     $s1, $s0, end   # if (low >= high) goto end
        beq     $s3, $zero, end # if (!matched) goto end
        lw      $t0, 0($s0)     # $t0 <- *low
        lw      $t1, 0($s1)     # $t1 <- *high
        beq     $t0, $t1, else  # if (*low == *high) goto else
        li      $s3, 0          # matched = 0
else:   addi    $s0, $s0, 4     # low++
        addi    $s1, $s1, -4    # high--
        j       loop
end:
```

# Coffee spill

- `addi $s1, $zero, 0`
    * opcode is `0x8`
    * rt is `$s1 = $17`
    * rs is `$zero = $0`
    * immediate is `0`
    * the instruction is `001000 00000 10001 0000000000000000`
    * in hex it's `0x20110000`

- `0x11000002`
    * binary is `000100 01000 00000 0000000000000010`
    * opcode is `4` for `beq`
    * rs is `8` for `$t0`
    * rt is `0` for `$zero`
    * immediate is `2` so we're jumping to exit
    * so `beq   $t0, $zero, exit`

- `0x22310001`
    * binary is `001000 10001 10001 0000000000000001`
    * opcode is `0x8` for `addi`
    * rs and rt are both `$s1`
    * immediate has `1`
    * so we have `addi  $s1, $s1, 1`

- `j loop`
    * opcode for `j` is `0x2`
    * jumpaddr is `0x0040002C` ?
    * in binary we have `000010 00000100000000000000001011`
    * in hex it's `0x0810000B`

# Binary search (looking down on CS1020)

## a. Fill in the blanks {-}

__Variable mappings.__

\begin{align*}
    \texttt{array} &\to $s0 \\
    \texttt{target} &\to $s1 \\
    \texttt{low} &\to $s2 \\ 
    \texttt{high} &\to $s3 \\ 
    \texttt{mid} &\to $s4 \\ 
    \texttt{ans} &\to $s5 \\ 
\end{align*}

```{.mips .numberLines}
loop:
    slt $t9, $s3, $s2
    bne $t9, $zero, end     #   while (low <= high) {
    add $s4, $s2, $s3       #       mid = low + high;
    srl $s4, 1              #       mid /= 2;
    sll $t0, $t4, 2         #       t0 = mid * 4;
    add $t0, $s0, $t0       #       t0 = &array[mid];
    lw  $t1, 0($t0)         #       t1 = array[mid];
    slt $t9, $s1, $t1       #       if (target < array[mid])
    beq $t9, $zero, bigger
    addi $s3, $s4, -1       #           high = mid - 1;
    j loopEnd
bigger:
    slt $t9, $t1, $s1       #       else if (target > array[mid])
    beq $t9, $zero, equal
    addi $s2, $s4, 1        #           low = mid + 1;
equal:                      #       else {
    add $s5, $s4, $zero     #           ans = mid;
    j end                   #           break;
                            #       }
loopEnd:
    j loop                  #   }
end:
```

b. lazy

c. lazy
