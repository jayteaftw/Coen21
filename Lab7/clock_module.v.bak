module clock_module(input [1:0] switches, 
					input CLOCK_50,
					output reg clk1,
					output reg clk2);
	
	//instantiate the clock counter to give us 2 clocks
	//one pulses 76 times per sec
	//one pulses 35 times per sec
	
	wire cc_out1;
	wire cc_out2;
	clock_counter cc(.CLOCK_50(CLOCK_50),
					.CLOCK_1(cc_out1),
					.CLOCK_2(cc_out2));
					
	//implementing the counter logic from Counter_Test.v
	reg [7:0] clk1_counter = 8'hFF;
	reg [7:0] clk2_counter = 8'hFF;
	
	always @(posedge cc_out1) 
	begin
	     clk1_counter <= clk1_counter + 1'b1;
	end
	 
	always @(posedge cc_out2) 
	begin
	     clk2_counter <= clk2_counter + 1'b1;
	end	 
	
					
	//with the counters, we can do the bit selcts based on dr wood's lab
	always@(*)
	begin
		if(switches == 2'b00)
		begin
			clk1 <= clk1_counter[0];
			clk2 <= clk2_counter[1];
		end
		
		else if(switches == 2'b01)
		begin
			clk1 <= clk1_counter[3];
			clk2 <= clk2_counter[4];
		end
		
		else if(switches == 2'b10)
		begin
			clk1 <= clk1_counter[4];
			clk2 <= clk2_counter[5];
		end
		
		else if(switches == 2'b11)
		begin
			clk1 <= clk1_counter[6];
			clk2 <= clk2_counter[7];
		end
	end
	
endmodule



