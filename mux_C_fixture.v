`include "mux_C.v"

module mux_C_fixture;


	reg str_byte_in, UpperByteToZero_in, MemWrite_in, MemRead_in, MemtoReg_in, ALUSrc1_in, ALUSrc2_in, Delay;
	reg [1:0] RegWrite_in, ALUOp_in; 
	wire str_byte_out, UpperByteToZero_out, MemWrite_out, MemRead_out, MemtoReg_out, ALUSrc1_out, ALUSrc2_out; 
	wire [1:0] RegWrite_out, ALUOp_out;

	initial
		 $vcdpluson;

	initial begin
		$display($time, "  str_byte_in = %b UpperByteToZero_in = %b MemWrite_in = %b MemRead_in = %b \n", str_byte_in, UpperByteToZero_in, MemWrite_in, MemRead_in);
		$display( "  MemtoReg_in = %b ALUSrc1_in = %b ALUSrc2_in = %b Delay = %b \n", MemtoReg_in, ALUSrc1_in, ALUSrc2_in, Delay);
		$display( "  RegWrite_in = %b ALUOp_in = %b str_byte_out = %b UpperByteToZero_out = %b \n", RegWrite_in[1:0], ALUOp_in[1:0], str_byte_out, UpperByteToZero_out);
		$display("  MemWrite_out = %b MemRead_out = %b MemtoReg_out = %b ALUSrc1_out = %b \n", MemWrite_out, MemRead_out, MemtoReg_out, ALUSrc1_out);
		$display("  ALUSrc2_out = %b RegWrite_out = %b ALUOp_out = %b \n", ALUSrc2_out, RegWrite_out[1:0], ALUOp_out[1:0]);

	end


	mux_C dut(.str_byte_in(str_byte_in), .UpperByteToZero_in(UpperByteToZero_in), .MemWrite_in(MemWrite_in),
		  .MemRead_in(MemRead_in), .MemtoReg_in(MemtoReg_in), .ALUSrc1_in(ALUSrc1_in), .ALUSrc2_in(ALUSrc2_in), 
		  .Delay(Delay), .RegWrite_in(RegWrite_in), .ALUOp_in(ALUOp_in), .str_byte_out(str_byte_out), .UpperByteToZero_out(UpperByteToZero_out), .MemWrite_out(MemWrite_out),
		  .MemRead_out(MemRead_out), .MemtoReg_out(MemtoReg_out), .ALUSrc1_out(ALUSrc1_out), .ALUSrc2_out(ALUSrc2_out), .RegWrite_out(RegWrite_out), .ALUOp_out(ALUOp_out));

	initial begin

		 str_byte_in = 1'b1; UpperByteToZero_in = 1'b1; MemWrite_in = 1'b1; MemRead_in = 1'b1; MemtoReg_in = 1'b1; ALUSrc1_in = 1'b1; ALUSrc2_in = 1'b1; Delay = 1'b1;
		 RegWrite_in = 2'b01; ALUOp_in = 2'b10; 
		

		#10

		Delay = 1'b0;

		#10;
	end

	initial 
		#30 $finish;


endmodule

