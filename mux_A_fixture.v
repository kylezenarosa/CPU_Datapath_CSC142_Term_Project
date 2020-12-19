`include "mux_A.v"

module mux_A_fixture;

	reg [15:0] a, b;
	reg s;
	wire [15:0] c;

	initial
		 $vcdpluson;

	initial
		$monitor($time, "  a = %h b = %h s = %b c = %h \n", a[15:0], b[15:0], s, c[15:0]);

	mux_A dut(.a(a), .b(b), .c(c), .s(s));

	initial begin
		a = 16'h4AA2;
		b = 16'hAF9C;
		s = 1'b1;

		#10

		s = 1'b0;

		#10;
	end

	initial 
		#30 $finish;

endmodule

	
		
		
