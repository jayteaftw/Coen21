module pb_clock(pulsen,
				CLOCK_50,
				MCLK);
				
	//though process - when the button gets pressed
	//the clock should pulse once at the rate of CLOCK_50
	//once the button is pressed, there will be a period
	//of disabling ()- done via a counter
	
	input pulsen;
	input CLOCK_50;
	output reg MCLK = 1'b0;
	
	reg outen_flag = 1'b0;
	reg cnt_flag = 1'b0;
	reg [23:0] counter = 1'd0; //the disable counter
	
	
	
	always@(posedge CLOCK_50)
		if(pulsen & !cnt_flag) //set the output pulse when enable is set and counter isnt going
		begin
			MCLK <= 1'b1;
			outen_flag <= 1'b1;
			cnt_flag <= 1'b1;
			counter <= 0;
		end
		
		else if(outen_flag) //set the output back low after one cyle has passed
		begin
			MCLK <= 1'b0;
			outen_flag <= 1'b0;
		end
		
		
		else if(cnt_flag) //if the counter flag is on, do the counter operation
		begin
			counter = counter + 1;
			if(counter == 0) //if it rolls over re-enable the 
			begin
				cnt_flag <= 0;
			end
		end
		


endmodule