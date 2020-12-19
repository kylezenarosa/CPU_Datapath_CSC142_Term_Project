module mux_C(input str_byte_in, UpperByteToZero_in, MemWrite_in, MemRead_in,
	     MemtoReg_in, ALUSrc1_in, ALUSrc2_in, Delay,
	     input [1:0] RegWrite_in, ALUOp_in, output reg str_byte_out, 
	     UpperByteToZero_out, MemWrite_out, MemRead_out, MemtoReg_out, 
	     ALUSrc1_out, ALUSrc2_out, output reg [1:0] RegWrite_out, ALUOp_out);

	always@(*) begin

		if(!Delay) begin

			str_byte_out = str_byte_in;
			UpperByteToZero_out = UpperByteToZero_in;
			MemWrite_out = MemWrite_in;
			MemRead_out = MemRead_in;
			MemtoReg_out = MemtoReg_in;
			ALUSrc1_out = ALUSrc1_in;
			ALUSrc2_out = ALUSrc2_in;
			RegWrite_out = RegWrite_in;
			ALUOp_out = ALUOp_in;

		end
	
		else begin
		
			str_byte_out = 1'b0;
			UpperByteToZero_out = 1'b0;
			MemWrite_out = 1'b0;
			MemRead_out = 1'b0;
			MemtoReg_out = 1'b0;
			ALUSrc1_out = 1'b0;
			ALUSrc2_out = 1'b0;
			RegWrite_out = 2'b0;
			ALUOp_out = 2'b0;


		end

	end

endmodule 

