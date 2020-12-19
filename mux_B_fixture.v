`include "mux_B.v"

module mux_B_fixture;

	reg [15:0] a, b, c;
	reg [1:0] s;
	wire [15:0] d;

	initial $vcdpluson;

	initial
		$monitor($time, "  a = %h b = %h c = %h s = %b d = %h \n", a[15:0], b[15:0], c[15:0], s[1:0], d[15:0]);

	mux_B dut(.a(a), .b(b), .c(c), .s(s), .d(d));

	initial begin

		a = 16'h1234;
		b = 16'h4321;
		c = 16'hABCD;
		s = 2'b00;

		#10

		s = 2'b01;

		#10

		s = 2'b10;

		#10

		s = 2'b11;

		#10;
	end

	initial
		#60 $finish;

endmodule
