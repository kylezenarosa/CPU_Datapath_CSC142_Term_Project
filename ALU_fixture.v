`include "ALU.v"

module ALU_fixture;

	reg [15:0] a, b;
	reg [2:0] sel;
	wire [15:0] r, R15;
	wire ovf;

	initial
		 $vcdpluson;

	initial
		$monitor($time, "  a = %h b = %h sel = %b r = %h R15 = %h ovf = %b \n", a[15:0], b[15:0], sel[2:0], r[15:0], R15[15:0], ovf);

	ALU dut(.a(a), .b(b), .r(r), .sel(sel), .R15(R15), .ovf(ovf));

	initial begin
		a = 16'hCCCC;
		b = 16'hCCCC;
		sel = 3'b000;

		#10 sel = 3'b001;

		#10 sel = 3'b010;

		#10 sel = 3'b011;

		#10 sel = 3'b100;
	
		#10 sel = 3'b101;
	end

	initial 
		#80 $finish;

endmodule

	
		
		
