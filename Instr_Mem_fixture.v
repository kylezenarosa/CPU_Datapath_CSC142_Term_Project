`include "Instr_Mem.v"

module Instr_Mem__fixture;

	reg [15:0] pointer;
	reg clk, rst;
	
	wire [15:0] instr_out;


	initial
		$vcdpluson;

	
	initial
		$monitor($time, "  pointer = %d  clk = %b  rst = %b  instr_out = %h\n",
			 pointer[15:0], clk, rst, instr_out[15:0]);  

	Instr_Mem dut(.pointer(pointer), .rst(rst), .clk(clk), .instr_out(instr_out));

	initial begin

		rst = 1'b1; pointer = 0;  
		#10 rst = 1'b0;
		#10 rst = 1'b1;
		#20 pointer = 2;
		#10 pointer = 4;
		#10 pointer = 6;
		#20 pointer = 62;
		

	end

	initial begin

		clk = 1'b0;
		forever #10 clk = ~clk;

	end

	initial begin

		#100 $finish;

	end

endmodule
