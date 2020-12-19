`include "forwarding_unit.v"

module forwarding_unit_fixture;

	reg [3:0] registerOP1ID, registerOP2ID, registerOP1EX, registerOP1MEM;
	reg regWriteMEM, regWriteWB;
	wire [1:0] forwardA, forwardB;

	initial
		 $vcdpluson;

	initial
		$monitor($time, "  forwardA = %b  forwardB = %b  \n", forwardA[1:0], forwardB[1:0]);

	forwarding_unit dut(.registerOP1ID(registerOP1ID), .registerOP2ID(registerOP2ID), .registerOP1EX(registerOP1EX), 
			    .registerOP1MEM(registerOP1MEM), .regWriteMEM(regWriteMEM), .regWriteWB(regWriteWB), 
			    .forwardA(forwardA), .forwardB(forwardB));

	initial begin
		#10 registerOP1ID = 4'b0010; registerOP2ID = 4'b0101; registerOP1EX = 4'b0000; registerOP1MEM = 4'b0011;
			regWriteMEM = 1; regWriteWB = 1;
		#10 registerOP1ID = 4'b0010; registerOP2ID = 4'b0101; registerOP1EX = 4'b0010; registerOP1MEM = 4'b0011;
			regWriteMEM = 1; regWriteWB = 1;

		#10 registerOP1ID = 4'b0010; registerOP2ID = 4'b0101; registerOP1EX = 4'b0000; registerOP1MEM = 4'b0101;
			regWriteMEM = 1; regWriteWB = 1;

		#10 registerOP1ID = 4'b0010; registerOP2ID = 4'b0101; registerOP1EX = 4'b0101; registerOP1MEM = 4'b0101;
			regWriteMEM = 1; regWriteWB = 1;

		#10 registerOP1ID = 4'b0010; registerOP2ID = 4'b0101; registerOP1EX = 4'b0000; registerOP1MEM = 4'b0101;
			regWriteMEM = 1; regWriteWB = 0;

		#10 registerOP1ID = 4'b0010; registerOP2ID = 4'b0101; registerOP1EX = 4'b0101; registerOP1MEM = 4'b0011;
			regWriteMEM = 0; regWriteWB = 1;


	
	end

	initial 
		#80 $finish;

endmodule

	
		
		
