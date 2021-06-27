// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/05/Memory.tst

load Memory.hdl,

echo "Before you run this script, select the 'Screen' option from the 'View' menu";

set in -1,				// Set RAM[0] = -1
set load 1,
set address 0,
tick,
tock;

set in -1,
set load 1,
set address 16483
,tick,
tock;

set in -1,
set load 1,
set address 16484
,tick,
tock;

set in -1,
set load 1,
set address 16485
,tick,
tock;

set in -1,
set load 1,
set address 16486
,tick,
tock;

set in -1,
set load 1,
set address 20431
,tick,
tock;


set in -1,
set load 1,
set address 20481
,tick,
tock;

set in -1,
set load 1,
set address 20482
,tick,
tock;

set in -1,
set load 1,
set address 20483
,tick,
tock;

set in -1,
set load 1,
set address 20484
,tick,
tock;

set in -1,
set load 1,
set address 20485
,tick,
tock;

set in -1,
set load 1,
set address 20559
,tick,
tock;
