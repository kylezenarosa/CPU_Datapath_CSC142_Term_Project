`include "PC.v"

module PC_fixture;

	reg [15:0] PC_in;
	reg halt_sig, clk, rst;
	wire [15:0] PC_out;

	initial
		 $vcdpluson;

	initial
		$monitor($time, "  PC_in = %d  clk = %b  rst = %b  halt_sig = %b  PC_out = %d \n", PC_in[15:0], clk, rst, halt_sig, PC_out[15:0]);

	PC dut(.PC_in(PC_in), .clk(clk), .rst(rst), .halt_sig(halt_sig), .PC_out(PC_out));

	initial begin

		rst = 1'b0;
		PC_in = 16'h0004;
		halt_sig = 1'b0;
		

		#10 rst = 1'b1;
		#20;

		#10 halt_sig = 1'b1;

		#10 PC_in = 16'h000A;
		#20 halt_sig = 1'b0;
		#10 rst = 1'b0;
	end

	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end

	initial 
		#100 $finish;

endmodule

	
		
		
