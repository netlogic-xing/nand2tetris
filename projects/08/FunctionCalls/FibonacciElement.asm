@256
D=A
@SP
M=D
D=0
@LCL
MD=D-1
@ARG
MD=D-1
@THIS
MD=D-1
@THAT
MD=D-1
@Sys.init_return_address$
D=A
@SP
A=M
M=D
@SP
AM=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
AM=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
AM=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
AM=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
AM=M+1
@5
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(Sys.init_return_address$)
(Sys.init)
@4
D=A
@SP
A=M
M=D
@SP
AM=M+1
@Main.fibonacci_return_address$2
D=A
@SP
A=M
M=D
@SP
AM=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
AM=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
AM=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
AM=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
AM=M+1
@6
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacci_return_address$2)
(Sys:WHILE)
@Sys:WHILE
0;JMP
(Main.fibonacci)
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
@2
D=A
@SP
A=M
M=D
@SP
AM=M+1
@SP
AM=M-1
D=M
A=A-1
D=M-D
@TRUE3
D;JLT
@SP
A=M-1
M=0
@END3
0;JMP
(TRUE3)
@SP
A=M-1
M=-1
(END3)
@SP
AM=M-1
D=M
@Main:IF_TRUE
D;JNE
@Main:IF_FALSE
0;JMP
(Main:IF_TRUE)
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
(Main:IF_FALSE)
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
@2
D=A
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
@Main.fibonacci_return_address$13
D=A
@SP
A=M
M=D
@SP
AM=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
AM=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
AM=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
AM=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
AM=M+1
@6
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacci_return_address$13)
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
@1
D=A
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
@Main.fibonacci_return_address$17
D=A
@SP
A=M
M=D
@SP
AM=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
AM=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
AM=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
AM=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
AM=M+1
@6
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacci_return_address$17)
@SP
AM=M-1
D=M
A=A-1
M=D+M
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
