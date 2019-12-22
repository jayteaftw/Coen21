module bin_7seg(bi_digit,seg);
input [3:0] bi_digit;
output [6:0] seg;
reg [6:0] seg;
// seg = {g,f,e,d,c,b,a};


always @ (bi_digit)
case (bi_digit)
        4'h0: seg = ~7'b0111111;
        4'h1: seg = ~7'b       ;     		  // ---a----
        4'h2: seg = ~7'b       ;    		  // |      |
        4'h3: seg = ~7'b       ;    		  // f      b
        4'h4: seg = ~7'b       ; 		  	  // |      |
        4'h5: seg = ~7'b       ;   		     // ---g----
        4'h6: seg = ~7'b       ;   		     // |      |
        4'h7: seg = ~7'b       ;   		     // e      c
        4'h8: seg = ~7'b       ;    	     // |      |
        4'h9: seg = ~7'b       ;    		  // ---d----
        4'ha: seg = ~7'b       ;
        4'hb: seg = ~7'b       ;
        4'hc: seg = ~7'b       ;
        4'hd: seg = ~7'b       ;
        4'he: seg = ~7'b       ;
        4'hf: seg = ~7'b       ;
endcase

endmodule		