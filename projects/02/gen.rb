(1..15).each do |i|
	puts <<EOF

    //x[#{i}]+y[#{i}]+c#{i-1}
    Xor(a=snx#{i},b=sny#{i},out=xxy#{i});
    Xor(a=xxy#{i},b=c#{i-1}, out=sum#{i});// sum of x[#{i}]+y[#{i}]
    Not(in=snx#{i}, out=notx#{i});
    Not(in=sny#{i}, out=noty#{i});
    And(a=snx#{i},b=sny#{i}, out=x#{i}y#{i});// and of x[#{i}]+y[#{i}]
    And(a=sny#{i},b=c#{i-1}, out=y#{i}c#{i-1});
    And(a=c#{i-1},b=snx#{i}, out=c#{i-1}x#{i});
    And(a=notx#{i}, b=y#{i}c#{i-1}, out=nx#{i}y#{i}c#{i-1});
    And(a=c#{i-1}x#{i}, b=noty#{i}, out=c#{i-1}x#{i}ny#{i});
    Or(a=nx#{i}y#{i}c#{i-1}, b=c#{i-1}x#{i}ny#{i}, out=x#{i}y#{i}c#{i-1});
    Or(a=x#{i}y#{i}c#{i-1}, b=x#{i}y#{i}, out=c#{i}); // carry of x[#{i}]+y[#{i}]+c#{i-1}
EOF
end
