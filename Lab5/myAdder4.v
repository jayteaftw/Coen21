module myAdder4(X, Y, C0, C4, V, S);
    input [3:0] X, Y; 
	 input C0;
    output C4, V;
	 output [3:0] S;
    wire z, f, g, Xb, Yb; 
    
    myAdder2 one(X[1], X[0], Y[1], Y[0], C0, z, S[1], S[0]);
    myAdder2 two(X[3], X[2], Y[3], Y[2], z, C4, S[3], S[2]);
	 
	 not(Xb, X[3]);
	 not(Yb, Y[3]);
	 and(f, Xb, Yb, S[3]);
	 and(g, X[3], Y[3], S[3]);
	 or(V, f,g);
endmodule
