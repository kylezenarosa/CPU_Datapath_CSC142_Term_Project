
`include "cpu.v"

module cpu_fixture;

	reg clk, rst;

	initial
		 $vcdpluson;

	always@(negedge clk) begin	

		$display(" \n\nclk = %b rst = %b \n ////////////// IF Stage ////////////// \n\nIF/ID_BufferData: PC = %h Instr = %h Adder = %h \n\n ////////////// ID Stage ////////////// \n\n Main Control Signals: str_byte = %b ALUSrc1 = %b ALUSrc2 = %b MemRead = %b MemWrite = %b MemtoReg = %b UpperByteToZero = %b TargetAddress = %b IF/ID_Flush = %b ExcepSig = %b ALUOp = %b Comparison = %b RegWrite = %b, SignExtend = %b branch = %b \n\n Hazard Detection Signals: PC_Hold = %b IF/ID_Hold = %b Delay = %b Op1_Sel = %b R15_Sel = %b \n\n Comparator Ports: OP1 = %h R15 = %h Branch_Result = %b \n\nID/EX_BufferData: Reg1_Data = %h Reg2_Data = %h Sign Extended Value = %h FunctionCode = %b Op1_RegID = %b Op2_RegID = %b \n\n////////////// EX Stage ////////////// \n\n Hazard Detection Signals: PC_Hold = %b IF/ID_Hold = %b Delay = %b Op1_Sel = %b R15_Sel = %b \n\nALU_OverflowSig = %b\n EX/MEM_BufferData: ALU_Result = %h R15_Result = %h Op1_RegData = %h Op1_RegID = %b str_byte = %b UpperByteToZero = %b MemWrite = %b MemRead = %b MemToReg = %b RegWrite = %b \n\n ////////////// MEM Stage ////////////// \n\nMEM/WB_BufferData:  UpperByteToZero = %b MemToReg = %b RegWrite = %b Mem_Data = %h ALU_Result = %h R15_Result = %h Op1_RegID = %b \n\n //////////WB Stage //////////\n\n WriteData = %h WriteReg = %b ", clk, rst, cpu.d4.pointer[15:0], cpu.d5.q[15:0], cpu.d5.q[31:16], cpu.d6.str_Byte, cpu.d6.ALUSrc1, cpu.d6.ALUSrc2, cpu.d6.MemRead, cpu.d6.MemWrite, cpu.d6.MemtoReg, cpu.d6.UpperByteToZero, cpu.d6.TargetAddress, cpu.d6.IFIDFlush, cpu.d6.Exception, cpu.d6.ALUOp[1:0], cpu.d6.Comparison[1:0], cpu.d6.RegWrite[1:0], cpu.d6.SignExtend[1:0], cpu.d6.branch, cpu.d14.PC_Hold, cpu.d14.IF_ID_Hold, cpu.d14.Delay, cpu.d14.Op1_Sel, cpu.d14.R15_Sel[1:0], cpu.d11.OP1[15:0], cpu.d11.R15[15:0], cpu.d11.branch[1:0], cpu.d15.q[59:44], cpu.d15.q[43:28], cpu.d15.q[27:12], cpu.d15.q[11:8], cpu.d15.q[7:4], cpu.d15.q[3:0], cpu.d14.PC_Hold, cpu.d14.IF_ID_Hold, cpu.d14.Delay, cpu.d14.Op1_Sel, cpu.d14.R15_Sel[1:0], cpu.d20.ovf, cpu.d23.q[51:36], cpu.d23.q[35:20], cpu.d23.q[19:4], cpu.d23.q[3:0], cpu.d23.q[58], cpu.d23.q[57], cpu.d23.q[56], cpu.d23.q[55], cpu.d23.q[54], cpu.d23.q[53:52], cpu.d25.q[55], cpu.d25.q[54], cpu.d25.q[53:52], cpu.d25.q[51:36], cpu.d25.q[35:20], cpu.d25.q[19:4], cpu.d25.q[3:0], cpu.d27.d_out[15:0], cpu.d25.q[3:0]); 	

		if(cpu.d20.ovf)
			$display("\nArithmetic Overflow at time ", $time, ".\n");
		else
			$display("\nNo Exceptions have occurred.\n");

	
	end

	cpu dut(.clk(clk), .rst(rst));

	initial begin

		rst = 1'b0;
		#1 rst = 1'b1;

	//	#10; #10; #10; #10; #50;
	end

	initial begin

		clk = 1'b0;
		forever #10 clk = ~clk;

	end

	initial 
		#750 $finish;


endmodule
