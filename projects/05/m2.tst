// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/05/Memory.tst

load Memory.hdl,
output-file m2.out,
output-list in%D1.6.1 load%B2.1.2 address%B1.15.1 out%D1.6.1;

// Screen test

set load 1,
set in -1,
set address %X4FCF,
tick,
tock,
output,

set address 20687,
tick,
tock,
output;

set address %X0FCF,		// Did not also write to lower or upper RAM
eval,
output;
set address %X2FCF,
eval,
output;

set load 0,				// Low order address bits connected
set address %X4FCE, eval, output;
set address %X4FCD, eval, output;
set address %X4FCB, eval, output;
set address %X4FC7, eval, output;
set address %X4FDF, eval, output;
set address %X4FEF, eval, output;
set address %X4F8F, eval, output;
set address %X4F4F, eval, output;
set address %X4ECF, eval, output;
set address %X4DCF, eval, output;
set address %X4BCF, eval, output;
set address %X47CF, eval, output;
set address %X5FCF, eval, output;


set load 0,
set address 24576,
echo "Make sure you see ONLY two horizontal lines in the middle of the screen. Hold down 'Y' (uppercase) until you see the next message ...",
// It's important to keep holding the key down since if the system is busy,
// the memory will zero itself before being outputted.

while out <> 89 {
    eval,
}

clear-echo,
output;
