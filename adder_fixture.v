`include "adder.v"

module adder_fixture;

	reg [15:0] a, b;
	wire [15:0] c;

	initial
		 $vcdpluson;

	initial
		$monitor($time, "  a = %h b = %h  c = %h \n", a[15:0], b[15:0], c[15:0]);

	adder dut(.a(a), .b(b), .c(c));

	initial begin
		a = 16'h0005;
		b = 16'h0005;

		#10;

		#10;
	end

	initial 
		#50 $finish;

endmodule

	
		
		
