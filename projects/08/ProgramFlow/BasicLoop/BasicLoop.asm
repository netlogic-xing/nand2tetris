@0
D=A
@SP
A=M
M=D
@SP
AM=M+1
@0
D=A
@LCL
D=D+M
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(BasicLoop:LOOP_START)
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
@SP
AM=M-1
D=M
A=A-1
M=D+M
@0
D=A
@LCL
D=D+M
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
@0
D=A
@ARG
D=D+M
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
@BasicLoop:LOOP_START
D;JNE
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