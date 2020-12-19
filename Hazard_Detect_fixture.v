`include "Hazard_Detect.v"

module Hazard_Detect_fixture;

	reg [3:0] IF_ID_Op1, IF_ID_Op2, ID_EX_Op1, Opcode, FunctionCode;
	reg [1:0] RegWrite;
	reg ID_EX_MemRead, EX_MEM_MemRead, ExcepSig, branch;

	wire [1:0] R15_Sel;
	wire Op1_Sel, IF_ID_Hold, PC_Hold, Delay;

	initial
		 $vcdpluson;

	initial
		$monitor($time, "  R15_Sel = %b Op1_Sel = %b IF_ID_Hold = %b PC_Hold = %b Delay = %b \n", R15_Sel[1:0], Op1_Sel, IF_ID_Hold, PC_Hold, Delay);

	Hazard_Detect dut(.IF_ID_Op1(IF_ID_Op1), .IF_ID_Op2(IF_ID_Op2), .ID_EX_Op1(ID_EX_Op1), .Opcode(Opcode), .FunctionCode(FunctionCode),
			  .RegWrite(RegWrite), .ID_EX_MemRead(ID_EX_MemRead), .EX_MEM_MemRead(EX_MEM_MemRead), .ExcepSig(ExcepSig),
			  .R15_Sel(R15_Sel), .Op1_Sel(Op1_Sel), .IF_ID_Hold(IF_ID_Hold), .PC_Hold(PC_Hold), .Delay(Delay), .branch(branch));

	initial begin
		

		#10 IF_ID_Op1 = 4'b0101; ID_EX_Op1 = 4'b1000; ID_EX_Op1 = 4'b0000; Opcode = 4'b0000; FunctionCode = 4'b0001; RegWrite = 2'b01; 
		    ID_EX_MemRead = 1'b1; EX_MEM_MemRead = 1'b0; ExcepSig = 1'b0;  


		#20;
	end

	initial 
		#80 $finish;








endmodule
