module adder(input [15:0] a, b, output reg [15:0] c);

	always@(*) begin

		c = a + b;

	end

endmodule
