load EQ3.hdl,
output-file EQ3.out,
compare-to EQ3.cmp,
output-list a%B0.3.0  b%B0.3.0 out%D0.3.0;
set a %B000, set b %B000, eval, output;
set a %B111, set b %B111, eval, output;
set a %B111, set b %B000, eval, output;
set a %B000, set b %B111, eval, output;
set a %B001, set b %B000, eval, output;
