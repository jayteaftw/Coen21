module myFullAdder(A, B, Cin, Cout, Sout);
    input A, B, Cin;
    output Sout, Cout;
    wire f, g, h;
 
    and(f, A, B);
    or(Cout, f, g);
    xor(h, A, B);
    and(g, h, Cin);
    xor(Sout, h, Cin);

endmodule