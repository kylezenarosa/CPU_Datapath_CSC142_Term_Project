`include "zeroExtend.v"

module zeroExtend_fixture;

	reg [15:0] d_in;
	reg enable;
	wire [15:0] d_out;

	initial
		 $vcdpluson;

	initial
		$monitor($time, "  d_in = %h enable = %b d_out = %h \n", d_in[15:0], enable, d_out[15:0]);

	zeroExtend dut(.d_in(d_in), .d_out(d_out), .enable(enable));

	initial begin
		d_in = 16'h4AA2;
		enable= 1'b1;

		#10

		enable = 1'b0;		

		#10;
	end

	initial 
		#30 $finish;

endmodule

	
		
		
