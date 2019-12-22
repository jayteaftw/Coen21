
module counter(clk, RESET, incc, out);
	input clk, RESET, incc;
	output reg [3:0] out;
	
	always @(posedge clk)
		begin
			if(RESET == 1) out = 4'b0000;
			else if(incc == 1) out = out + 4'b0001;
		end
endmodule
