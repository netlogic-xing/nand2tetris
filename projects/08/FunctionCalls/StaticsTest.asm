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
@6
D=A
@SP
A=M
M=D
@SP
AM=M+1
@8
D=A
@SP
A=M
M=D
@SP
AM=M+1
@Class1.set_return_address$3
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
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.set
0;JMP
(Class1.set_return_address$3)
@SP
AM=M-1
D=M
@5
M=D
@23
D=A
@SP
A=M
M=D
@SP
AM=M+1
@15
D=A
@SP
A=M
M=D
@SP
AM=M+1
@Class2.set_return_address$7
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
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.set
0;JMP
(Class2.set_return_address$7)
@SP
AM=M-1
D=M
@5
M=D
@Class1.get_return_address$9
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
@Class1.get
0;JMP
(Class1.get_return_address$9)
@Class2.get_return_address$10
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
@Class2.get
0;JMP
(Class2.get_return_address$10)
(Sys:WHILE)
@Sys:WHILE
0;JMP
(Class1.set)
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
@Class1.0
M=D
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
@Class1.1
M=D
@0
D=A
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
(Class1.get)
@Class1.0
D=M
@SP
A=M
M=D
@SP
AM=M+1
@Class1.1
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
(Class2.set)
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
@Class2.0
M=D
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
@Class2.1
M=D
@0
D=A
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
(Class2.get)
@Class2.0
D=M
@SP
A=M
M=D
@SP
AM=M+1
@Class2.1
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
