`include "adder.v"
`include "ALUControl.v"
`include "ALU.v"
`include "buffer.v"
`include "comparator.v"
`include "DataMem.v"
`include "Exception_Handling.v"
`include "forwarding_unit.v"
`include "Hazard_Detect.v"
`include "Instr_Mem.v"
`include "Main_Control_Unit.v"
`include "mux_A.v"
`include "mux_B.v"
`include "mux_C.v"
`include "PC.v"
`include "RegFile.v"
`include "shift_left.v"
`include "sign_extend.v"
`include "zeroExtend.v"

module cpu(input clk, rst);

	wire h2, h3, h4, h5, c1, c2, c3, c4, c5, c6, c7, c8, c9, 
	     m1, m2, m3, m4, m5, m6, m7, c10, EX_11, ID_11, c15;

	wire [1:0] h1, c11, c12, c13, c14, EX_9, EX_10, ID_10, m8, m9;

	wire [2:0] EX_8;

	wire [15:0] IF_1, IF_2, IF_3, IF_4, ID_2, ID_3, ID_4,
		    ID_5, ID_6, ID_7, ID_8, ID_9, EX_2, EX_3, 
		    EX_4, EX_5, EX_6, EX_7, MEM_2, WB_2, WB_3;
	wire [31:0] ID_1;
	wire [73:0] EX_1;
	wire [58:0] MEM_1;
	wire [55:0] WB_1;


	//IF Stage
	mux_A d1(.a(IF_2), .b(ID_2), .s(c7), .c(IF_3));
	PC d2(.PC_in(IF_3), .halt_sig(h4), .clk(clk), .rst(rst), .PC_out(IF_1));
	adder d3(.a(16'h0002), .b(IF_1), .c(IF_2));
	Instr_Mem d4(.pointer(IF_1), .rst(rst), .clk(clk), .instr_out(IF_4));
	buffer #(.N(32)) d5(.d({IF_2, IF_4}), .q(ID_1), .clk(clk), .rst(rst), .w_enable(h3));

	//ID Stage
	Main_Control_Unit d6(.OPCode(ID_1[15:12]), .functionCode(ID_1[3:0]), .ComparatorInput(ID_10), .ALUSrc1(c1), .ALUSrc2(c2), .MemRead(c3),
			.MemWrite(c4), .MemtoReg(c5), .UpperByteToZero(c6), .TargetAddress(c7), 
			.IFIDFlush(c8), .str_Byte(c9), .Exception(c10), .ALUOp(c11), .Comparison(c12),
			.RegWrite (c13), .SignExtend(c14), .branch(c15)); 
	RegFile d7(.Reg1(ID_1[11:8]), .Reg2(ID_1[7:4]), .WriteReg(WB_1[3:0]), .RegWrite(WB_1[53:52]), .WriteR15(WB_1[19:4]), 
		   .WriteData(WB_3), .clk(clk), .rst(rst), .R_D1(ID_3), .R_D2(ID_4), .R_R15(ID_5));
	adder d8(.a(ID_1[31:16]), .b(ID_7), .c(ID_2));
	sign_extend d9(.SignalIn(c14), .in(ID_1[11:0]), .Out(ID_6));
	shift_left d10(.In(ID_6), .Out(ID_7));
	comparator d11(.OP1(ID_8), .R15(ID_9), .branch(ID_10));
	mux_A d12(.a(MEM_1[51:36]), .b(ID_3), .s(EX_1[72]), .c(ID_8));
	mux_B d13(.a(ID_5), .b(MEM_1[35:20]), .c(MEM_1[51:36]), .s(EX_1[71:70]), .d(ID_9));
	Exception_Handling e1(.ovf(EX_11), .opcode(c10), .exception_output(ID_11));
	Hazard_Detect d14(.IF_ID_Op1(ID_1[11:8]), .IF_ID_Op2(ID_1[7:4]), .ID_EX_Op1(EX_1[7:4]), .Opcode(ID_1[15:12]),
			  .FunctionCode(EX_1[11:8]), .branch(c15), .RegWrite(EX_1[65:64]), .ID_EX_MemRead(EX_1[67]), .EX_MEM_MemRead(MEM_1[55]),
			  .ExcepSig(ID_11), .R15_Sel(h1), .Op1_Sel(h2), .IF_ID_Hold(h3), .PC_Hold(h4),
			  .Delay(h5));
	mux_C e2(.Delay(h5), .str_byte_in(c9), .UpperByteToZero_in(c6), .MemWrite_in(c4), .MemRead_in(c3), .MemtoReg_in(c5), .ALUSrc1_in(c1),
		 .ALUSrc2_in(c2), .RegWrite_in(c13), .ALUOp_in(c11), .str_byte_out(m1), .UpperByteToZero_out(m2), .MemWrite_out(m3),
		 .MemRead_out(m4), .MemtoReg_out(m5), .ALUSrc1_out(m6), .ALUSrc2_out(m7), .RegWrite_out(m8), .ALUOp_out(m9)); 	
	buffer #(.N(74)) d15(.d({m1, h2, h1, m2, m3, m4, m5, m8, m9, m7, m6, ID_3, ID_4, ID_6, ID_1[3:0], ID_1[11:8], ID_1[7:4]}),
			     .q(EX_1), .clk(clk), .rst(rst), .w_enable(1'b1)); 

	//EX Stage
	mux_A d16(.a(EX_2), .b(EX_3), .s(EX_1[60]), .c(EX_4));
	mux_B d17(.a(WB_3), .b(MEM_1[51:36]), .c(EX_1[59:44]), .s(EX_9), .d(EX_2));
	mux_A d18(.a(EX_3), .b(EX_1[27:12]), .s(EX_1[61]), .c(EX_5));
	mux_B d19(.a(MEM_1[51:36]), .b(EX_1[43:28]), .c(WB_3), .s(EX_10), .d(EX_3));
	ALU d20(.a(EX_4), .b(EX_5), .sel(EX_8), .r(EX_6), .R15(EX_7), .ovf(EX_11));
	ALUControl d21(.ALUOp(EX_1[63:62]), .Function(EX_1[11:8]), .ALUControl(EX_8));
	forwarding_unit d22(.registerOP1ID(EX_1[7:4]), .registerOP2ID(EX_1[3:0]), .registerOP1EX(MEM_1[3:0]),
			    .registerOP1MEM(WB_1[3:0]), .regWriteMEM(MEM_1[53:52]), .regWriteWB(WB_1[53:52]), 
			    .forwardA(EX_9), .forwardB(EX_10));
	buffer #(.N(59)) d23(.d({EX_1[73], EX_1[69], EX_1[68], EX_1[67], EX_1[66], EX_1[65:64], EX_6, EX_7, EX_2, EX_1[7:4]}),
			     .q(MEM_1), .clk(clk), .rst(rst), .w_enable(1'b1));	

	//MEM Stage
	DataMem d24(.Address(MEM_1[51:36]), .WriteData(MEM_1[19:4]), .clk(clk), .rst(rst), .MemRead(MEM_1[55]), .MemWrite(MEM_1[56]),
		    .str_byte(MEM_1[58]), .d_out(MEM_2));		
	buffer #(.N(56)) d25(.d({MEM_1[57], MEM_1[54], MEM_1[53:52], MEM_2, MEM_1[51:36], MEM_1[35:20], MEM_1[3:0]}),
		 .q(WB_1), .clk(clk), .rst(rst), .w_enable(1'b1));

	//WB Stage
	mux_A d26(.a(WB_1[51:36]), .b(WB_1[35:20]), .s(WB_1[54]), .c(WB_2));
	zeroExtend d27(.d_in(WB_2), .enable(WB_1[55]), .d_out(WB_3));	



endmodule
