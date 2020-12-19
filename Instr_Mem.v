module Instr_Mem(input [15:0] pointer, input rst, clk, output reg [15:0] instr_out);

	reg [7:0] Memory [99:0];
	integer i;

	always@(posedge clk or negedge rst) begin

		if(!rst) begin

			Memory[0] <= 8'h0E; Memory[1] <= 8'h20; Memory[2] <= 8'h0B; Memory[3] <= 8'h21;
			Memory[4] <= 8'h23; Memory[5] <= 8'h88; Memory[6] <= 8'h14; Memory[7] <= 8'h9A;
			Memory[8] <= 8'h05; Memory[9] <= 8'h64; Memory[10] <= 8'h01; Memory[11] <= 8'h65;
			Memory[12] <= 8'hD5; Memory[13] <= 8'h9A; Memory[14] <= 8'h28; Memory[15] <= 8'h02;
			Memory[16] <= 8'hCE; Memory[17] <= 8'h9A; Memory[18] <= 8'h0F; Memory[19] <= 8'hF1;
			Memory[20] <= 8'h01; Memory[21] <= 8'h20; Memory[22] <= 8'h01; Memory[23] <= 8'h21;
			Memory[24] <= 8'h18; Memory[25] <= 8'h02; Memory[26] <= 8'hA6; Memory[27] <= 8'h94;
			Memory[28] <= 8'hB6; Memory[29] <= 8'h96; Memory[30] <= 8'hC6; Memory[31] <= 8'h96;
			Memory[32] <= 8'h07; Memory[33] <= 8'hD1; Memory[34] <= 8'h67; Memory[35] <= 8'h04; 
			Memory[36] <= 8'h0B; Memory[37] <= 8'h10; Memory[38] <= 8'h57; Memory[39] <= 8'h05;
			Memory[40] <= 8'h0B; Memory[41] <= 8'h20; Memory[42] <= 8'h47; Memory[43] <= 8'h02;
			Memory[44] <= 8'h01; Memory[45] <= 8'h10; Memory[46] <= 8'h01; Memory[47] <= 8'h10;
			Memory[48] <= 8'hC8; Memory[49] <= 8'h90; Memory[50] <= 8'h08; Memory[51] <= 8'h80;
			Memory[52] <= 8'hD8; Memory[53] <= 8'h92; Memory[54] <= 8'hCA; Memory[55] <= 8'h92;
			Memory[56] <= 8'h0C; Memory[57] <= 8'hC0; Memory[58] <= 8'h0D; Memory[59] <= 8'hD1;
			Memory[60] <= 8'h0C; Memory[61] <= 8'hD0; Memory[62] <= 8'hF0; Memory[63] <= 8'h00;

			for(i = 64; i <= 99; i = i+1) begin

				Memory[i] <= 8'h00;

			end

		end

	end

	always@(*) begin

		instr_out = {Memory[pointer], Memory[pointer+1]};

	end

endmodule
