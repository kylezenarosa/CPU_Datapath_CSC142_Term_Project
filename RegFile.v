module RegFile (input [3:0] Reg1, Reg2, WriteReg, input [1:0] RegWrite,
	        input [15:0] WriteR15, WriteData, input clk, rst, 
		output reg [15:0] R_D1, R_D2, R_R15);

	reg [15:0] Register [15:0];

	
	always@(posedge clk or negedge rst) begin

		if(!rst) begin
		
			Register[0] <= 16'h0000;
			Register[1] <= 16'h7B18;
			Register[2] <= 16'h245B;
			Register[3] <= 16'hFF0F;
			Register[4] <= 16'hF0FF;
			Register[5] <= 16'h0051;
			Register[6] <= 16'h6666;
			Register[7] <= 16'h00FF;
			Register[8] <= 16'hFF88;
			Register[9] <= 16'h0000;
			Register[10] <= 16'h0000;
			Register[11] <= 16'h3099;
			Register[12] <= 16'hCCCC;
			Register[13] <= 16'h0002;
			Register[14] <= 16'h0011;
			Register[15] <= 16'h0000;

		end

		else if(RegWrite == 2'b01)
			Register[WriteReg] = WriteData;

		else if(RegWrite == 2'b10) begin
			Register[WriteReg] = WriteData;
			Register[15] = WriteR15;
		end

	end

	
	always@(*) begin

		R_D1 = Register[Reg1];
		R_D2 = Register[Reg2];
		R_R15 = Register[15]; 

	end

endmodule
