module spec_7seg(bi_digit,seg);
input [3:0] bi_digit;
output [6:0] seg;
reg [6:0] seg;
// seg = {g,f,e,d,c,b,a};


always @ (bi_digit)
case (bi_digit)	      //gfedcba
        4'h0: seg = ~7'b0001000;
        4'h1: seg = ~7'b1000000;     		  // ---a----
        4'h2: seg = ~7'b1001000;    		  // |      |
        4'h3: seg = ~7'b0000001;    		  // f      b
        4'h4: seg = ~7'b1001000; 		      // |      |
        4'h5: seg = ~7'b1000001;   		      // ---g----
        4'h6: seg = ~7'b1001001;   		      // |      |
        4'h7: seg = ~7'b0010000;   		      // e      c
        4'h8: seg = ~7'b0000010;    	      // |      |
        4'h9: seg = ~7'b0010010;    		  // ---d----
        4'ha: seg = ~7'b1010010;
        4'hb: seg = ~7'b0000100;
        4'hc: seg = ~7'b0100000;
        4'hd: seg = ~7'b0100100;
        4'he: seg = ~7'b1100100;
        4'hf: seg = ~7'b1110110;
endcase

endmodule