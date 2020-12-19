`include "RegFile.v"

module RegFile_fixture;

	reg [15:0] WriteData, WriteR15;
	reg [3:0] Reg1, Reg2, WriteReg;
	reg rst, clk;
	reg [1:0] RegWrite;
	
	wire [15:0] R_D1, R_D2, R_R15;


	initial
		$vcdpluson;

	
	initial
		$monitor($time, "  Reg1 = %b  Reg2 = %b  WriteData = %h  WriteR15 = %h  WriteReg = %b  RegWrite = %b  rst = %b  clk = %b  R_D1 = %h  R_D2 = %h  R_R15 = %h \n\n",
			 Reg1[3:0], Reg2[3:0], WriteData[15:0], WriteR15[15:0],
			 WriteReg[3:0], RegWrite[1:0], rst, clk, R_D1[15:0], R_D2[15:0], R_R15[15:0]);  

	RegFile dut(.Reg1(Reg1), .Reg2(Reg2), .WriteReg(WriteReg), .WriteData(WriteData), 
		    .WriteR15(WriteR15), .RegWrite(RegWrite), .rst(rst), .clk(clk),
		    .R_D1(R_D1), .R_D2(R_D2), .R_R15(R_R15));

	initial begin

		rst = 1'b1; Reg1 = 4'b0001; Reg2 = 4'b0010; 
		WriteData = 0; WriteR15 = 0; RegWrite = 0; WriteReg = 4'b0001;
		#10 rst = 1'b0;
		#20 rst = 1'b1;
		WriteData = 16'hABCD; WriteR15 = 16'hB45C;
		#10 RegWrite = 2'b01;
		#20 RegWrite = 2'b00; WriteData = 16'h0000;
		#10 RegWrite = 2'b10;
		#10 RegWrite = 2'b00;
		#10 rst = 1'b0;

	end

	initial begin

		clk = 1'b0;
		forever #10 clk = ~clk;

	end

	initial begin

		#120 $finish;

	end

endmodule
