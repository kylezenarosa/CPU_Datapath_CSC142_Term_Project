`include "Main_Control_Unit.v"


module Main_Control_fixture;
reg 	   Delay;
reg [3:0]  OPCode, functionCode;
reg [1:0]  ComparatorInput;

wire       ALUSrc1,
		   ALUSrc2, 
		   MemRead, 
		   MemWrite, 
		   MemtoReg, 
		   UpperByteToZero, 
		   TargetAddress, 
		   IFIDFlush, 
		   str_Byte,
		   branch, 
		   Exception;
		   
wire[1:0]  ALUOp, 
		   Comparison,
		   RegWrite,
		   SignExtend;
		  
initial   
        $vcdpluson;
initial
	$monitor ($time , " OPCode = %b functionCOde = %b ComparatorInput = %b ALUSrc1 = %b ALUSrc2 = %b MemRead = %b MemWrite %b MemtoReg %b UpperByteToZero %b TargetAddress = %b IFIDFlush = %b str_Byte = %b Exception = %b ALUOp = %b Comparison = %b RegWrite = %b SignExtend = %b branch = %b " , OPCode, functionCode, ComparatorInput, ALUSrc1, ALUSrc2, MemRead, MemWrite, MemtoReg, UpperByteToZero, TargetAddress, IFIDFlush, str_Byte, Exception, ALUOp, Comparison, RegWrite, SignExtend, branch);
localparam period = 25; 

Main_Control_Unit c1(.OPCode(OPCode),
		   .functionCode(functionCode),
		   .ComparatorInput(ComparatorInput),
		   .ALUSrc1(ALUSrc1),
                   .ALUSrc2(ALUSrc2),
		   .MemRead(MemRead),
                   .MemWrite(MemWrite),
                   .MemtoReg(MemtoReg),
                   .UpperByteToZero(UpperByteToZero),
                   .TargetAddress(TargetAddress),
                   .IFIDFlush(IFIDFlush),
                   .str_Byte(str_Byte),
                   .Exception(Exception),
                   .ALUOp(ALUOp),
		   .Comparison(Comparison),
		   .RegWrite(RegWrite),
                   .SignExtend(SignExtend),
		   .branch(branch));
				


   initial
        begin
	        functionCode = 4'b0101;
	    	ComparatorInput = 2'b11;
       	        OPCode = 4'b0110;
  		Delay = 1'b0;
                #period; 
		functionCode = 4'b0101;
		ComparatorInput = 2'b10;
                OPCode = 4'b0101;
		Delay = 1'b0;
               #period; 
		functionCode = 4'b0101;
		ComparatorInput = 2'b11;
                OPCode = 4'b0101; 
 		Delay = 1'b0;
               #period;
		    
		functionCode = 4'b0100;
		ComparatorInput = 2'b01;
                OPCode = 4'b0100;
		Delay = 1'b0;
                #period; 
		functionCode = 4'b0100;
		ComparatorInput = 2'b10;
                OPCode = 4'b0100;
		Delay = 1'b0;
                #period; 
		functionCode = 4'b0100;
		ComparatorInput = 2'b11;
                OPCode = 4'b0100;
		Delay = 1'b0;
               #period;

      	        functionCode = 4'b0110;
		ComparatorInput = 2'b01;
                OPCode = 4'b0110;
		Delay = 1'b0;
                #period; 
		functionCode = 4'b0110;
		ComparatorInput = 2'b10;
                OPCode = 4'b0110;
		Delay = 1'b0;
                #period; 
		functionCode = 4'b0110;
		ComparatorInput = 2'b11;
                OPCode = 4'b0110;
		Delay = 1'b0;
                #period;	
//
                functionCode = 4'b0100;
	        ComparatorInput = 2'b10;
                OPCode = 4'b0000;
	        Delay = 1'b1;
                #period; 
	        functionCode = 4'b0100;
      		ComparatorInput = 2'b10;
            	OPCode = 4'b0000;
		Delay = 1'b0;
            	#period; 
		functionCode = 4'b0100;
      		ComparatorInput = 2'b10;
            	OPCode = 4'b0101;
		Delay = 1'b0;
            	#period; 
		functionCode = 4'b0100;
     		ComparatorInput = 2'b10;
            	OPCode = 4'b0100;
		Delay = 1'b0;
            	#period; 
	        functionCode = 4'b0100;
         	ComparatorInput = 2'b10;
            	OPCode = 4'b0110;
		Delay = 1'b0;
            	#period; 
		functionCode = 4'b0100;
      		ComparatorInput = 2'b10;
            	OPCode = 4'b0001;
		Delay = 1'b0;
            	#period; 
		functionCode = 4'b0001;
      		ComparatorInput = 2'b10;
            	OPCode = 4'b0010;
		Delay = 1'b0;
            	#period; 
		functionCode = 4'b0010;
      		ComparatorInput = 2'b10;
            	OPCode = 4'b1010;
		Delay = 1'b0;
            	#period; 
		functionCode = 4'b1010;
      		ComparatorInput = 2'b10;
            	OPCode = 4'b1011;
		Delay = 1'b0;
            	#period;
		functionCode = 4'b1011;
     		 ComparatorInput = 2'b10;
            	OPCode = 4'b1100;
		Delay = 1'b0;
            	#period; 	
		functionCode = 4'b1100;
      		ComparatorInput = 2'b10;
           	OPCode = 4'b1101;
		Delay = 1'b0;
           	#period; 	
      		functionCode = 4'b1101;
         	ComparatorInput = 2'b10;
                OPCode = 4'b0111;
		Delay = 1'b0;
                #period; 
	        functionCode = 4'b1101;
      		ComparatorInput = 2'b10;
            	OPCode = 4'b1111;
		Delay = 1'b0;
            	#period; 
		$finish;
        end

endmodule


