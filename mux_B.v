module mux_B (input [15:0] a, b, c, input [1:0] s, output reg [15:0] d);
	
	always@(*) begin

		if (s == 2'b00)
			d = a;
		else if (s == 2'b01)
			d = b;
		else if (s == 2'b10)
			d = c;
		else
			d = 16'h0000;
	end
	
endmodule
