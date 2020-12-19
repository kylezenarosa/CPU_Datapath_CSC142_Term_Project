`include "sign_extend.v"

module sign_extend_fixture;

	reg [1:0] SignalIn;
	reg [11:0] in;
	wire [15:0] Out;

initial
	$monitor ($time , " SignalIn = %b in = %b Out = %b " , SignalIn, in, Out);
localparam period = 25;

sign_extend u1(.SignalIn(SignalIn), .in(in), .Out(Out));

initial
	begin
	SignalIn = 2'b00;
	in = 12'b000111110000;
	#period;
	SignalIn = 2'b01;
	in = 12'b000111110000;
	#period;
	SignalIn = 2'b10;
	in = 12'b000111110000;
	#period;
	SignalIn = 2'b11;
	in = 12'b000111110000;
	#period;
	$finish;
end
endmodule
