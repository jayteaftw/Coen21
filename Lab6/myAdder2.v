module myAdder2(A1, A0, B1, B0, C1, C2, S1, S0);
    input A1, A0, B1, B0, C1;
    output C2, S1, S0;
    wire h; 
    
    myFullAdder one(A0, B0, C1, h, S0);
    myFullAdder two(A1, B1, h, C2, S1);
 
endmodule
