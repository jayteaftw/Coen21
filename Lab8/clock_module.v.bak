
module clock_module(input [1:0] switches,
						  input CLOCK_50,
						  output reg clk1);
	
	reg [19:0] cnt = 20'd0;
	reg [7:0] clk1_counter = 8'hFF;
	
	always @(posedge CLOCK_50)
		cnt <= cnt + 20'd1;
	
	always @(posedge cnt[19]) clk1_counter <= clk1_counter + 1'b1;
					
	always@(*)
		case(switches)
			2'b00: clk1 = clk1_counter[5];
			2'b01: clk1 = clk1_counter[3];
			2'b10: clk1 = clk1_counter[2];
			2'b11: clk1 = clk1_counter[1];
		endcase
endmodule
