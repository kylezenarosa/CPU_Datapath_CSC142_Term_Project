module buffer #(parameter N = 32) (input [N-1:0] d, input clk, rst, w_enable, output reg [N-1:0] q);

	always@(posedge clk, negedge rst) begin

		if(!rst) 
			q <= 0;

		else begin
 
			if(w_enable) 
				q <= d;
		end
	end

endmodule

	
