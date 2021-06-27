// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R0
D=M
@a
M=D
@R1
D=M
@b
M=D
@c
M=0
(LOOP)
@a
D=M
@END
D;JEQ
@b
D=M
@c
M=M+D
@a
M=M-1
@LOOP
0;JMP
(END)
@c
D=M
@R2
M=D
(RET)
@RET
0;JMP
