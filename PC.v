module PC(input [15:0] PC_in, input halt_sig, clk, rst, output reg [15:0] PC_out);

	always@(posedge clk, negedge rst) begin

		if(!rst)
			PC_out <= 0;
		
		else begin
		
			if(!halt_sig)
				PC_out <= PC_in;

		end

	end

/*	always@(*) begin

		if(!halt_sig)
			PC_out = PC_in;

	end*/

endmodule
