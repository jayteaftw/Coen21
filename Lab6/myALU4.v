module myALU4( P, A, B, C0, R, C4, V, Z);
	 	 input C0;
	 	 input [3:0] A, B, P;
	 	 output [3:0] R;
	 	 output V, Z, C4;
	 	 wire [3:0] Y;
		
		
	 	mux4to1 oneMux4to1(B[3:0], P[2:1],Y[3:0]);
		myAdder4 oneMyAdder4(A[3:0], Y[3:0], C0, C4, V, R[3:0]);
		nor(Z, R[3], R[2], R[1], R[0]);
		
		
endmodule
