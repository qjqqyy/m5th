---
title: CS2100 Tutorial 5
author: Qi Ji
date: Week 6 also
...

# D1 {-}

do later

# Tracing data & control

## `0x8df80000: lw $24, 0($15)`

In binary, get `100011 01111 11000 0000000000000000`.

 RR1      RR2    WR     WD
------  ------- ------ -----------
`$15`    `$24`  `$24`   `M([$15])`

Table: Register File

 Opr1   Opr2
------ ------
`[$15]`  `0`

Table: ALU

 Address   Write Data 
--------- ------------
 `[$15]`    `[$24]`   

Table: Data Memory

 RegDst   RegWr   AluSrc   MemRead   MemWrite   MemToReg   Branch   ALUop   ALUctrl
-------- ------- -------- --------- ---------- ---------- -------- ------- ---------
    0       1       1         1         0          1         0        00     0010

Table: Control

\[PC = PC + 4\]

## `0x1023000c: beq $1, $3, 12`

Converting to binary, get
`000100 00001 00011 0000000000001100`.

 RR1      RR2    WR     WD
------  ------- ------ -----------
 `$1`    `$3`    X      X

Table: Register File

 Opr1   Opr2
------ --------
`[$1]`  `[$3]`

Table: ALU

 Address         Write Data 
--------------- ------------
 `[$1] - [$3]`    `[$3]`   

Table: Data Memory

 RegDst   RegWr   AluSrc   MemRead   MemWrite   MemToReg   Branch   ALUop   ALUctrl
-------- ------- -------- --------- ---------- ---------- -------- ------- ---------
    X       0       0         0         0          X         1        01     0110

Table: Control

\[ PC = \begin{cases}
PC + 4 &\text{if branch not taken} \\
PC + 4 + 4\cdot 12 &\text{if branch taken}
\end{cases}\]

## `0x0285c822: sub $25, $20, $5`

Convert to binary, get `000000 10100 00101 11001 00000 100010`.

 RR1      RR2    WR     WD
------  ------- ------ -----------------
`$20`    `$5`   `$25`   `[$20] - [$25]`

Table: Register File

 Opr1     Opr2
-------- ----------
`[$20]`   `[$5]`

Table: ALU

 Address           Write Data 
----------------- --------------
 `[$20] - [$25]`    `[$5]`   

Table: Data Memory

 RegDst   RegWr   AluSrc   MemRead   MemWrite   MemToReg   Branch   ALUop   ALUctrl
-------- ------- -------- --------- ---------- ---------- -------- ------- ---------
   1        1       0        0          0           0        0        10     0110

Table: Control

\[ PC = PC + 4 \]

# Estimating times

## SUB instruction

Relevant paths

* Inst-mem $\to$ Control $\to$ ALUControl \(\to\) ALU \(\to\) Mux(MemToReg) \(\to\) Registers.
* Inst-mem \(\to\) Regs \(\to\) Mux(ALUSrc) \(\to\) ALU \(\to\) Mux(MemToReg) \(\to\) Registers. (critical)
* Inst-mem $\to$ Control $\to$ Mux(PCSrc)

\[\text{time} = 400 + 200 + 30 + 120 + 30 + 200 = 980ps. \]

## LW Instruction

Critical path is Inst-mem $\to$ Regs $\to$ ALU $\to$ Data Memory $\to$ Mux(MemToReg) $\to$ Regs.

Note: the paths

*   Inst-mem $\to$ Sign Extend $\to$ Mux(ALUSrc) $\to$ ALU is faster.
*   Inst-mem $\to$ Control $\to$ ALUSrc

are both faster, so not critical.

\[\text{time} = 400 + 200 + 120 + 350 + 30 + 200 = 1300ps.\]

## BEQ instruction

Critical path is Inst-mem $\to$ Regs $\to$ Mux(ALUSrc) $\to$ ALU $\to$ And(Branch, is0?) $\to$ Mux(PCSrc).

\[\text{time} = 400 + 200 + 30 + 120 + 20 + 30 = 800ps.\]

Cycle time should be longer than \(1300ps\).

# Mistake!
RegDst mux inputs are swapped.

## `add` instruction

* `add $3, $4, $3` will still produce correct result
* `add $1, $4, $3` will place `[$4] + [$3]` in `$3` instead of `$1` which is wrong.

## `lw` instruction

* Cancerously come up with the instruction such that the first 5 bits of immediate field and `rt` hold the same value, then it's correct.
* Literally anythng else like `lw $3, 9999($0)` will be wrong.

## `beq` instruction

`beq` does not write so any `beq` instruction will be correct
