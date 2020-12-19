`include "shift_left.v"

module shift_left_fixture;

reg [15:0] In;
wire [15:0] Out;

initial 
	$monitor ($time , " In = %b Out = %b" , In, Out);
localparam period = 25;

shift_left u1(.In(In), .Out(Out));

initial
	begin
	In = 16'hc526;
	#period;
	In = 16'h0525;
	#period;
	$finish;
end
endmodule
