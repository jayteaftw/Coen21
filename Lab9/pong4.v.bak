module pong4(RSI, LSI, S, CLK, Q);
	input RSI, LSI, CLK;
	input [1:0] S;
	output [3:0] Q;
	
	reg [3:0] Q;
	
	always @(posedge CLK)
		if( S[1] == 0 & S[0] == 0)
			begin 
			Q[0] <= Q[0];
			Q[1] <= Q[1];
			Q[2] <= Q[2];
			Q[3] <= Q[3];
			end
		else if(S[1] == 0 & S[0] == 1)
			begin 
			Q[0] <= Q[1];
			Q[1] <= Q[2];
			Q[2] <= Q[3];
			Q[3] <= RSI;
			end
		else if(S[1] == 1 & S[0] == 0)
			begin 
			Q[0] <= LSI;
			Q[1] <= Q[0];
			Q[2] <= Q[1];
			Q[3] <= Q[2];
			end
		else
			begin 
			Q[0] <= 0;
			Q[1] <= 0;
			Q[2] <= 0;
			Q[3] <= 0;
			end
			
		endmodule