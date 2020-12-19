`include "Exception_Handling.v"
module Exception_Handling_Fixture;
	reg ovf, opcode;
	wire exception_output;

initial
	$monitor($time, "input_ovf = %b input_opcode = %b exception_output = %b \n" , ovf, opcode, exception_output);

localparam period = 25;

Exception_Handling u1(.ovf(ovf), .opcode(opcode), .exception_output(exception_output));

initial
begin
	ovf = 1'b0;
	opcode = 1'b0;
	#period;
	ovf = 1'b0;
	opcode = 1'b1;
	#period;
	ovf = 1'b1;
	opcode = 1'b0;
	#period;
	$finish;
end
endmodule


