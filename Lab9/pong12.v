module pong12(RSI, LSI, S, CLK, Q);
	input RSI, LSI, CLK;
	input [1:0] S;
	output [11:0] Q;
	
	reg [11:0] Q;
	
	always @(posedge CLK)//No change
		if( S[1] == 0 & S[0] == 0)
			begin 
			Q[0] <= Q[0];
			Q[1] <= Q[1];
			Q[2] <= Q[2];
			Q[3] <= Q[3];
			Q[4] <= Q[4];
			Q[5] <= Q[5];
			Q[6] <= Q[6];
			Q[7] <= Q[7];
			Q[8] <= Q[8];
			Q[9] <= Q[9];
			Q[10] <= Q[10];
			Q[11] <= Q[11];
			end
		else if(S[1] == 0 & S[0] == 1)//Shift Right
			begin 
			Q[0] <= Q[1];
			Q[1] <= Q[2];
			Q[2] <= Q[3];
			Q[3] <= Q[4];
			Q[4] <= Q[5];
			Q[5] <= Q[6];
			Q[6] <= Q[7];
			Q[7] <= Q[8];
			Q[8] <= Q[9];
			Q[9] <= Q[10];
			Q[10] <= Q[11];
			Q[11] <= RSI;
			end
		else if(S[1] == 1 & S[0] == 0)//Shift Left
			begin 
			Q[0] <= LSI;
			Q[1] <= Q[0];
			Q[2] <= Q[1];
			Q[3] <= Q[2];
			Q[4] <= Q[3];
			Q[5] <= Q[4];
			Q[6] <= Q[5];
			Q[7] <= Q[6];
			Q[8] <= Q[7];
			Q[9] <= Q[8];
			Q[10] <= Q[9];
			Q[11] <= Q[10];
			end
		else //Set 0
			begin 
			Q[0] <= 0;
			Q[1] <= 0;
			Q[2] <= 0;
			Q[3] <= 0;
			Q[4] <= 0;
			Q[5] <= 0;
			Q[6] <= 0;
			Q[7] <= 0;
			Q[8] <= 0;
			Q[9] <= 0;
			Q[10] <= 0;
			Q[11] <= 0;
			end
			
		endmodule