module pong_controller1(Clock, QLEFT, iRESET, iRSRV, S, LSI, PSTATE);
	input Clock, QLEFT, iRESET, iRSRV;
	output reg[1:0] S;
	output reg LSI;
	output reg [1:0] PSTATE;
	reg[1:0] NSTATE;
	parameter [1:0] sIDLE= 2'b00, sRSRV=2'b01, sMOVL=2'b11, sENDLE = 2'b10;
	
	always @(PSTATE)
		case(PSTATE)
			
			sIDLE: if(iRSRV) begin 
						NSTATE <= sRSRV;
						LSI <= 0;
						S[1] <= 1;
						S[0] <= 1;
						end
					else begin 
						NSTATE <= sIDLE;
						LSI <= 0;
						S[1] <= 1;
						S[0] <= 1;
						end
				
			sRSRV: if(iRESET) begin 
						NSTATE <= sIDLE;
						LSI <= 1;
						S[1] <= 1;
						S[0] <= 0;
						end
					 else begin 
						NSTATE <= sMOVL;
						LSI <= 1;
						S[1] <= 1;
						S[0] <= 0;
						end
				
			sMOVL: if(QLEFT) begin
						NSTATE <= sENDLE;
						LSI <= 0;
						S[1] <= 1;
						S[0] <= 0;
						end
					 else if(iRESET)begin
						NSTATE <= sIDLE;
						LSI <= 0;
						S[1] <= 1;
						S[0] <= 0;
						end
					 else begin
						NSTATE <= sMOVL;
						LSI <= 0;
						S[1] <= 1;
						S[0] <= 0;
						end
				default begin 
					NSTATE <= sIDLE;
					LSI <= 0;
					S[1] <= 0;
					S[0] <= 0;
					end
			endcase
			
			always @(posedge Clock)
				PSTATE <= NSTATE;
				
		
			
			
		endmodule
				
	