`include "ALUControl.v"
module ALUControl_fixture;

	reg [1:0] ALUOp;
	reg [3:0] Function;
	wire [2:0] ALUControl;
	
initial
	$vcdpluson;
initial
	$monitor ($time, " ALUOp = %b Function = %b ALUControl = %b " , ALUOp, Function, ALUControl);
localparam period = 25;

ALUControl a1(.ALUOp(ALUOp), .Function(Function), .ALUControl(ALUControl));
	
initial	
	begin
	ALUOp = 2'b00;
	Function = 4'b0000;
	#period;
	ALUOp = 2'b00;
	Function = 4'b0001;
	#period;
	ALUOp = 2'b00;
	Function = 4'b0100;
	#period;
	ALUOp = 2'b00;
	Function = 4'b0101;
	#period;
	ALUOp = 2'b10;
	Function = 4'bxxxx;
	#period;
    ALUOp = 2'b01;
	Function = 4'bxxxx;
	#period;
	$finish;
	end
endmodule
