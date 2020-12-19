`include "buffer.v"

module buffer_fixture;

	reg [15:0] d;
	reg w_enable, clk, rst;
	wire [15:0] q;

	initial
		 $vcdpluson;

	initial
		$monitor($time, "  d_in = %h  clk = %b  rst = %b  w_enable = %b  q = %h \n", d[15:0], clk, rst, w_enable, q[15:0]);

	buffer #(.N(16)) dut(.d(d), .clk(clk), .rst(rst), .w_enable(w_enable), .q(q));

	initial begin

		rst = 1'b0;
		d = 16'h0004;
		w_enable = 1'b1;
		

		#10 rst = 1'b1;
		#20;

		#10 w_enable = 1'b0;

		#10 d = 16'h000A;
		#20 w_enable = 1'b1;
		#10 rst = 1'b0;
	end

	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end

	initial 
		#100 $finish;

endmodule

	
		
		
