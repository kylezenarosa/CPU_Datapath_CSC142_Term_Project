module Hazard_Detect(input [3:0] IF_ID_Op1, IF_ID_Op2, ID_EX_Op1, Opcode,
		     FunctionCode, input [1:0] RegWrite, input ID_EX_MemRead, EX_MEM_MemRead, ExcepSig, branch, 
		     output reg [1:0] R15_Sel, output reg Op1_Sel, IF_ID_Hold, PC_Hold, Delay);

/* input ExcepSig tells the Hazard detection unit whether to hold the IF/ID
 * buffer and program counter. Since we were not required to stop the program
 * but only display a message when an exception occurred, this functionality
 * is not implemented here */

	always@(*) begin

		if(Opcode == 4'b0101 || Opcode == 4'b0100 || Opcode == 4'b0110) begin
	
			if((IF_ID_Op1 == ID_EX_Op1 || ID_EX_Op1 == 4'b1111) && ID_EX_MemRead) begin
			
				Delay = 1;
				Op1_Sel = 0;
				R15_Sel = 2'b00;
				IF_ID_Hold = 0;
				PC_Hold = 1;	
	
			end	

			else if(!ID_EX_MemRead && EX_MEM_MemRead) begin

				Delay = 1;
				Op1_Sel = 0;
				R15_Sel = 2'b00;
				IF_ID_Hold = 0;
				PC_Hold = 1;	

			end
			
			else if(IF_ID_Op1 == ID_EX_Op1 && RegWrite != 2'b00 && IF_ID_Op1 != 4'b1111 && ID_EX_Op1 != 4'b1111 && (FunctionCode == 4'b0000 || FunctionCode == 4'b0001)) begin
			
				Delay = 1;
				Op1_Sel = 1;
				R15_Sel = 2'b00;
				IF_ID_Hold = 0;
				PC_Hold = 1;
		
			end

			else if(RegWrite != 2'b00 && IF_ID_Op1 == 4'b1111 && ID_EX_Op1 == 4'b1111) begin

				Delay = 1;
				Op1_Sel = 1;
				R15_Sel = 2'b10;
				IF_ID_Hold = 0;
				PC_Hold = 1;
	
			end

			else if(RegWrite != 2'b00 && ID_EX_Op1 == 4'b1111 && IF_ID_Op1 != 4'b1111 && (FunctionCode == 4'b0000 || FunctionCode == 4'b0001)) begin

				Delay = 1;
				Op1_Sel = 0;
				R15_Sel = 2'b01;
				IF_ID_Hold = 0;
				PC_Hold = 1;
	
			end

			else if(RegWrite != 2'b00 && ID_EX_Op1 == IF_ID_Op1 && ID_EX_Op1 != 4'b1111 && IF_ID_Op1 != 4'b1111 && (FunctionCode == 4'b0100 || FunctionCode == 4'b0101)) begin

				Delay = 1;
				Op1_Sel = 1;
				R15_Sel = 2'b01;
				IF_ID_Hold = 0;
				PC_Hold = 1;
	
			end

			else if(RegWrite != 2'b00 && ID_EX_Op1 != IF_ID_Op1 && (FunctionCode == 4'b0100 || FunctionCode == 4'b0101)) begin

				Delay = 1;
				Op1_Sel = 0;
				R15_Sel = 2'b01;
				IF_ID_Hold = 0;
				PC_Hold = 1;	

			end


			else if(branch == 1'b1) begin
		
				IF_ID_Hold = 1;
				PC_Hold = 0;
				Delay = 1;	
				Op1_Sel = 0;
				R15_Sel = 2'b00;		

			end

	
			else begin

				Delay = 0;
				Op1_Sel = 0;
				R15_Sel = 2'b00;
				PC_Hold = 0;
				IF_ID_Hold = 1;

			end

		end	

		else if(Opcode == 4'b1111) begin
		
				IF_ID_Hold = 0;
				PC_Hold = 1;
				Delay = 1;	
				Op1_Sel = 0;
				R15_Sel = 2'b00;	

		end

		else if(((IF_ID_Op1 == ID_EX_Op1) || (IF_ID_Op2 == ID_EX_Op1)) && ID_EX_MemRead) begin

				IF_ID_Hold = 0;
				PC_Hold = 1;
				Delay = 1;	
				Op1_Sel = 0;
				R15_Sel = 2'b00;		

	        end

		else begin

			IF_ID_Hold = 1;
			PC_Hold = 0;
			Delay = 0;
			Op1_Sel = 0;
			R15_Sel = 2'b00;


		end

	end

endmodule
