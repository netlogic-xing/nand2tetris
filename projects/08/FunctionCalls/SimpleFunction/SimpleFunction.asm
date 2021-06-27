(SimpleFunction.test)
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
@0
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
AM=M+1
@1
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
AM=M+1
@SP
AM=M-1
D=M
A=A-1
M=D+M
@SP
A=M-1
M=!M
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
AM=M+1
@SP
AM=M-1
D=M
A=A-1
M=D+M
@1
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
AM=M+1
@SP
AM=M-1
D=M
A=A-1
M=M-D
@LCL
D=M
@R13
M=D //Frame = LCL, R13 holds *LCL
@5
A=D-A //Frame - 5
D=M  //return address to D
@R14
M=D //R14 holds return address
@SP
AM=M-1
D=M // Pop stack value
@ARG
A=M
M=D //put it on *ARG
@ARG
D=M+1 //ARG+1
@SP
M=D //SP=ARG+1
@R13
AM=M-1//Frame-1
D=M
@THAT
M=D //THAT=*(Frame-1)
@R13
AM=M-1 //Frame-2
D=M
@THIS
M=D //THIS=*(Frame-2)
@R13
AM=M-1 //Frame-3
D=M
@ARG
M=D //ARG=*(Frame-3)
@R13
AM=M-1 //Frame-4
D=M
@LCL
M=D //LCL=*(Frame-4)
@R14 //return address
A=M
0;JMP
