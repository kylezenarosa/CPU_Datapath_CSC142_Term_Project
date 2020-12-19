module mux_A (input [15:0] a, b, input s, output reg [15:0] c);

	always@(*) begin

		if (s)
			c = a;
		else
			c = b;
	end

endmodule
