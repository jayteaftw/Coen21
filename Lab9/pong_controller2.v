
module pong_controller2(QLEFT, QRIGHT, iRESET, iRSRV, iLSRV, iRPAD, iLPAD, clk1, S, LCT, RCT, LSI, RSI);
	input QLEFT, QRIGHT, iRESET, iRSRV, iLSRV, iRPAD, iLPAD, clk1;
	output reg LCT, RCT, LSI, RSI;
	output reg [1:0] S;
	reg [3:0] PSTATE, NSTATE;
	parameter [3:0] sIDLE = 4'b0000, sRSRV = 4'b0001, sENDL = 4'b0010, sMOVL = 4'b0011, sMISL = 4'b0100, sLSRV = 4'b1001, sENDR = 4'b1010, sMOVR = 4'b1011, sMISR = 4'b1100;
	reg missL, missR;
	always @(PSTATE)
	begin
		case (PSTATE)
			sIDLE :
				begin
				if(iRSRV == 1) NSTATE = sRSRV;
				else if(iLSRV == 1) NSTATE = sLSRV;
				else NSTATE = sIDLE;
				RCT = 0;
				LCT = 0;
				missR = 0;
				missL = 0;
				end
			sRSRV :
				if(iRESET ==1) NSTATE = sIDLE;
				else NSTATE = sMOVL;
			sLSRV :
				if(iRESET ==1) NSTATE = sIDLE;
				else NSTATE = sMOVR;
			sMOVL :
				if(iRESET == 1) NSTATE = sIDLE;
				else if(iLPAD == 1 && QLEFT != 1) begin missL = 1; NSTATE = sMOVL; end
				else if(QLEFT == 1 && iLPAD == 1 && missL == 0) NSTATE = sLSRV;
				else if(QLEFT == 0) NSTATE = sMOVL;
				else NSTATE = sENDL;
			sMOVR :
				if(iRESET == 1) NSTATE = sIDLE;
				else if(iRPAD == 1 && QRIGHT != 1) begin missR = 1; NSTATE = sMOVR; end
				else if(QRIGHT == 1 && iRPAD == 1 && missR == 0) NSTATE = sRSRV;
				else if(QRIGHT == 0) NSTATE = sMOVR;
				else NSTATE = sENDR;
				
			sMISL : 
			begin 
			NSTATE = sMOVR;
			missR = 1;
			end
			sMISR : 
			begin 
			NSTATE = sMOVL;
			missL = 1;
			end
			sENDL :
			begin
				NSTATE = sIDLE;
				RCT = 1;
			end
			sENDR : 
			begin
				NSTATE = sIDLE;
				LCT = 1;
			end
			default :
				begin
				NSTATE = sIDLE;
				missR = 0;
				missL = 0;
				end
		endcase
	end

always @(PSTATE)
	case (PSTATE)
		sIDLE : // S = 2'b11
		begin
			LSI = 0;
			RSI = 0;
			S = 2'b11;
		end
		sRSRV :
		begin
			LSI = 1;
			RSI = 0;
			S = 2'b10;
		end
		sMOVL : // S = 2'b10
		begin
			LSI = 0;
			RSI = 0;
			S = 2'b10;
		end
		sENDL :
		begin
			LSI = 0;
			RSI = 0;
			S = 2'b00;
		end
		sLSRV :
		begin
			LSI = 0;
			RSI = 1;
			S = 2'b01;
		end
		sMOVR : // S = 2'b01
		begin
			LSI = 0;
			RSI = 0;
			S = 2'b01;
		end
		sENDR :
		begin
			LSI = 0;
			RSI = 0;
			S = 2'b00;
		end
	endcase

	always @(posedge clk1)
		PSTATE <= NSTATE;
endmodule
