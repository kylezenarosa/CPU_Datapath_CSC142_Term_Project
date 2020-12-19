module ALU(input signed [15:0] a, b, input [2:0] sel, output reg signed [15:0] R15, r, output reg ovf);

	always @ (*) begin
		casex (sel)
  			 3'b000: begin
     			 ovf = 0;
     			 {ovf, r} = a + b;
  			 end

	  		 3'b001: begin
     			 ovf = 0;     
     			 {ovf, r} = a - b;
		         end

			 3'b010: begin
     			 ovf = 0;
      			 {R15, r} = a * b;
  			 end

		         3'b011: begin
     			 ovf = 0;
     			 r = a / b;
      			 R15 = a % b;
  			 end

			 3'b100: begin
			 ovf = 0;
     			 r = a & b;
   			 end

	  		 3'b101: begin
      			 ovf = 0;
    		 	 r = a | b;
                         end

		endcase
	end

endmodule
