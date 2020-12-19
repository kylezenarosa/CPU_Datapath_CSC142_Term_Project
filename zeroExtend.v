module zeroExtend(input [15:0] d_in, input enable, output reg [15:0] d_out);

	always@(*) begin

		if(enable)
			d_out = {8'b00000000, d_in[7:0]};
		else
			d_out = d_in; 

	end

endmodule
