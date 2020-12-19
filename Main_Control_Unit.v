module Main_Control_Unit(
         input [3:0] OPCode, functionCode,
	 input [1:0] ComparatorInput,
         output reg ALUSrc1, ALUSrc2, MemRead, MemWrite, MemtoReg, UpperByteToZero, TargetAddress, IFIDFlush, str_Byte, Exception, branch,
         output reg [1:0] ALUOp, Comparison, RegWrite, SignExtend
   );

	always @(*) begin

	
		casex (OPCode)
		  //R type instructions
  		 4'b0000 : begin

		     if(functionCode == 4'b0100 || functionCode == 4'b0101) begin 
     			RegWrite = 2'b10;
     			ALUSrc1 = 1'b1;
     			ALUSrc2 = 1'b1;
     			ALUOp = 2'b00;
     			SignExtend = 2'b00;
     			MemRead = 1'b0;
     			MemWrite = 1'b0;
     			MemtoReg = 1'b0;
     			UpperByteToZero = 1'b0;
     			TargetAddress = 1'b1;
     			IFIDFlush = 1'b1;
     			str_Byte = 1'b0;
     			Comparison = 2'bxx;
     			Exception = 1'b0;
			branch = 1'b0;

    		     end

    		     else begin

			RegWrite = 2'b01;
     			ALUSrc1 = 1'b1;
     			ALUSrc2 = 1'b1;
     			ALUOp = 2'b00;
     			SignExtend = 2'b00;
     			MemRead = 1'b0;
     			MemWrite = 1'b0;
     			MemtoReg = 1'b0;
     			UpperByteToZero = 1'b0;
     			TargetAddress = 1'b1;
     			IFIDFlush = 1'b1;
     			str_Byte = 1'b0;
     			Comparison = 2'bxx;
     			Exception = 1'b0;
			branch = 1'b0;
	
		     end
  		 end
   //AND instruction*/
   4'b0001 : begin 
     RegWrite = 2'b01;
     ALUSrc1 = 1'b1;
     ALUSrc2 = 1'b0;
     ALUOp = 2'b10;
     SignExtend = 2'b11;
     MemRead = 1'b0;
     MemWrite = 1'b0;
     MemtoReg = 1'b0;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b1;
     IFIDFlush = 1'b1;
     str_Byte = 1'b0;
     Comparison = 2'bxx;
     Exception = 1'b0;
     branch = 1'b0;

   end
   //OR 
   4'b0010 : begin 
     RegWrite = 2'b01;
     ALUSrc1 = 1'b1;
     ALUSrc2 = 1'b0;
     ALUOp = 2'b11;
     SignExtend = 2'b11;
     MemRead = 1'b0;
     MemWrite = 1'b0;
     MemtoReg = 1'b0;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b1;
     IFIDFlush = 1'b1;
     str_Byte = 1'b0;
     Comparison = 2'bxx;
     Exception = 1'b0;
	branch = 1'b0;

   end
   //LBU
   4'b1010 : begin 
     RegWrite = 2'b01;
     ALUSrc1 = 1'b0;
     ALUSrc2 = 1'b0;
     ALUOp = 2'b01;
     SignExtend = 2'b10;
     MemRead = 1'b1;
     MemWrite = 1'b0;
     MemtoReg = 1'b1;
     UpperByteToZero = 1'b1;
     TargetAddress = 1'b1;
     IFIDFlush = 1'b1;
     str_Byte = 1'b0;
     Comparison = 2'bxx;
     Exception = 1'b0;
	branch = 1'b0;

   end
   //SB
   4'b1011 : begin
     RegWrite = 2'b00;
     ALUSrc1 = 1'b0;
     ALUSrc2 = 1'b0;
     ALUOp = 2'b01;
     SignExtend = 2'b10;
     MemRead = 1'b0;
     MemWrite = 1'b1;
     MemtoReg = 1'b0;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b1;
     IFIDFlush = 1'b1;
     str_Byte = 1'b1;
     Comparison = 2'bxx;
     Exception = 1'b0;
	branch = 1'b0;

   end
   //LW
   4'b1100 : begin 
     RegWrite = 2'b01;
     ALUSrc1 = 1'b0;
     ALUSrc2 = 1'b0;
     ALUOp = 2'b01;
     SignExtend = 2'b10;
     MemRead = 1'b1;
     MemWrite = 1'b0;
     MemtoReg = 1'b1;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b1;
     IFIDFlush = 1'b1;
     str_Byte = 1'b0;
     Comparison = 2'bxx;
     Exception = 1'b0;
	branch = 1'b0;

   end
   //SW
   4'b1101 : begin 
     RegWrite = 2'b00;
     ALUSrc1 = 1'b0;
     ALUSrc2 = 1'b0;
     ALUOp = 2'b01;
     SignExtend = 2'b10;
     MemRead = 1'b0;
     MemWrite = 1'b1;
     MemtoReg = 1'b0;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b1;
     IFIDFlush = 1'b1;
     str_Byte = 1'b0;
     Comparison = 2'bxx;
     Exception = 1'b0;
	branch = 1'b0;

   end
   //BLT
   4'b0101 : begin
     if (ComparatorInput == 2'b01) begin 
		 RegWrite = 2'b00;
		 ALUSrc1 = 1'b0;
		 ALUSrc2 = 1'b0;
		 ALUOp = 2'bxx;
		 SignExtend = 2'b01;
		 MemRead = 1'b0;
		 MemWrite = 1'b0;
		 MemtoReg = 1'b0;
		 UpperByteToZero = 1'b0;
		 TargetAddress = 1'b0;
		 IFIDFlush = 1'b0;
		 str_Byte = 1'b0;
		 Comparison = 2'b00;
		 Exception = 1'b0;
                 branch = 1'b1;

     end
	 else begin	
		 RegWrite = 2'b00;
		 ALUSrc1 = 1'b0;
		 ALUSrc2 = 1'b0;
		 ALUOp = 2'bxx;
		 SignExtend = 2'b00;
		 MemRead = 1'b0;
		 MemWrite = 1'b0;
		 MemtoReg = 1'b0;
		 UpperByteToZero = 1'b0;
		 TargetAddress = 1'b1;
		 IFIDFlush = 1'b1;
		 str_Byte = 1'b0;
		 Comparison = 2'b00;
		 Exception = 1'b0;
		 branch = 1'b0;
	 end
   end
   //BGT
   4'b0100 : begin 
     if (ComparatorInput == 2'b10) begin
       RegWrite = 2'b00;
       ALUSrc1 = 1'b0;
       ALUSrc2 = 1'b0;
       ALUOp = 2'bxx;
       SignExtend = 2'b01;
       MemRead = 1'b0;
       MemWrite = 1'b0;
       MemtoReg = 1'b0;
       UpperByteToZero = 1'b0;
       TargetAddress = 1'b0;
       IFIDFlush = 1'b0;
       str_Byte = 1'b0;
       Comparison = 2'b01;
       Exception = 1'b0;
       branch = 1'b1;
     end
	 else begin	
		 RegWrite = 2'b00;
		 ALUSrc1 = 1'b0;
		 ALUSrc2 = 1'b0;
		 ALUOp = 2'bxx;
		 SignExtend = 2'b00;
		 MemRead = 1'b0;
		 MemWrite = 1'b0;
		 MemtoReg = 1'b0;
		 UpperByteToZero = 1'b0;
		 TargetAddress = 1'b1;
		 IFIDFlush = 1'b1;
		 str_Byte = 1'b0;
		 Comparison = 2'b00;
		 Exception = 1'b0;
		 branch = 1'b0;
	 end
   end
   //BEQ
   4'b0110 : begin 
     if (ComparatorInput == 2'b11) begin
     RegWrite = 2'b00;
     ALUSrc1 = 1'b0;
     ALUSrc2 = 1'b0;
     ALUOp = 2'bxx;
     SignExtend = 2'b01;
     MemRead = 1'b0;
     MemWrite = 1'b0;
     MemtoReg = 1'b0;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b0;
     IFIDFlush = 1'b0;
     str_Byte = 1'b0;
     Comparison = 2'b10;
     Exception = 1'b0;
     branch = 1'b1;
     end
	 else begin	
		 RegWrite = 2'b00;
		 ALUSrc1 = 1'b0;
		 ALUSrc2 = 1'b0;
		 ALUOp = 2'bxx;
		 SignExtend = 2'b00;
		 MemRead = 1'b0;
		 MemWrite = 1'b0;
		 MemtoReg = 1'b0;
		 UpperByteToZero = 1'b0;
		 TargetAddress = 1'b1;
		 IFIDFlush = 1'b1;
		 str_Byte = 1'b0;
		 Comparison = 2'b00;
		 Exception = 1'b0;
		 branch = 1'b0;
	 end
  end
  //JUMP
   4'b0111 : begin 
     RegWrite = 2'b00;
     ALUSrc1 = 1'b0;
     ALUSrc2 = 1'b0;
     ALUOp = 2'bxx;
     SignExtend = 2'b00;
     MemRead = 1'b0;
     MemWrite = 1'b0;
     MemtoReg = 1'b0;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b0;
     IFIDFlush = 1'b0;
     str_Byte = 1'b0;
     Comparison = 2'bxx;
     Exception = 1'b0;
     branch = 1'b1;
   end
   //HALT
   4'b1111 : begin 
     RegWrite = 2'b00;
     ALUSrc1 = 1'b0;
     ALUSrc2 = 1'b0;
     ALUOp = 2'bxx;
     SignExtend = 2'bxx;
     MemRead = 1'b0;
     MemWrite = 1'b0;
     MemtoReg = 1'b0;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b0;
     IFIDFlush = 1'b0;
     str_Byte = 1'b0;
     Comparison = 2'bxx;
     Exception = 1'b0;
     branch = 1'b0;
   end
   default : begin 
     RegWrite = 2'b00;
     ALUSrc1 = 1'b0;
     ALUSrc2 = 1'b0;
     ALUOp = 2'b00;
     SignExtend = 2'b00;
     MemRead = 1'b0;
     MemWrite = 1'b0;
     MemtoReg = 1'b0;
     UpperByteToZero = 1'b0;
     TargetAddress = 1'b1;
     IFIDFlush = 1'b1;
     str_Byte = 1'b0;
     Comparison = 2'bxx;
     Exception = 1'b0;
     branch = 1'b0;
    end
 
endcase
end

endmodule


