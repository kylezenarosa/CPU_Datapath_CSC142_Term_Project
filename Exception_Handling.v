module Exception_Handling(

		input ovf, opcode,
		output reg exception_output

		);

always @(*) begin

	if (ovf || opcode)
		exception_output = 1;
	else
		exception_output = 0;
	end

endmodule

