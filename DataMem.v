module DataMem(input [15:0] Address, WriteData, input clk, rst, MemRead, MemWrite, str_byte, output reg [15:0] d_out);

	reg [7:0] Memory [65535:0];
	integer i;

	always@(posedge clk or negedge rst) begin

		if(!rst) begin

			Memory[0] <= 8'h31;
			Memory[1] <= 8'h42;
			Memory[2] <= 8'h00;
			Memory[3] <= 8'h00;
			Memory[4] <= 8'h56;
			Memory[5] <= 8'h78;
			Memory[6] <= 8'hDE;
			Memory[7] <= 8'hAD;
			Memory[8] <= 8'hBE;
			Memory[9] <= 8'hEF;

			for(i = 10; i <= 65535; i = i + 1) begin
				
				Memory[i] <= 8'h00;				

			end	
		end
		
		else if(MemWrite && !str_byte) begin 

			Memory[Address] <= WriteData[15:8];
			Memory[Address+1] <= WriteData[7:0];
	
		end

		else if(MemWrite && str_byte) begin 
			
			Memory[Address] <= WriteData[7:0];

		end
 		
	end

	always@(*) begin

		if(MemRead) begin

			d_out = {Memory[Address], Memory[Address+1]};			

		end

	end

endmodule
