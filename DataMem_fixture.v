`include "DataMem.v"

module DataMem_fixture;

	reg [15:0] WriteData, Address;
	reg clk, rst, MemRead, MemWrite, str_byte;
	
	wire [15:0] d_out;


	initial
		$vcdpluson;

	
	initial
		$monitor($time, "  Addr = %h  WriteData = %h  MemRead = %b  MemWrite = %b  str_byte = %b  rst = %b  clk = %b  d_out = %h\n",
			 Address[15:0], WriteData[15:0], MemRead, MemWrite, str_byte, rst, clk, d_out[15:0]);  

	DataMem dut(.Address(Address), .WriteData(WriteData), .rst(rst), .clk(clk), .MemRead(MemRead),
		    .MemWrite(MemWrite), .str_byte(str_byte), .d_out(d_out));

	initial begin

		rst = 1'b1; WriteData = 16'hABCD; Address = 16'h0004;
	        MemRead = 1'b0; MemWrite = 1'b0; str_byte = 1'b0;  
		#10 rst = 1'b0; 
		#20 rst = 1'b1; MemRead = 1'b1;
		#10 
		#20 MemRead = 1'b0; MemWrite = 1'b1;
		#20 MemRead = 1'b1; MemWrite = 1'b0;
		#10
		#10 rst = 1'b0;
		#20 rst = 1'b1; str_byte = 1'b1; MemWrite = 1'b0; MemRead = 1'b0;
		#10 MemWrite = 1'b1;
		#20 MemRead = 1'b1; str_byte = 1'b0; MemWrite = 1'b0;
		#20 rst = 1'b0;
		

	end

	initial begin

		clk = 1'b0;
		forever #10 clk = ~clk;

	end

	initial begin

		#200 $finish;

	end

endmodule
