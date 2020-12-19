module comparator (
    input signed [15:0] OP1,
    input signed [15:0] R15,
    output reg [1:0] branch
    );

    always @(*) begin
         if (OP1 < R15)
            branch = 2'b01;
         else if (OP1 > R15)
            branch = 2'b10;
	 else 
	    branch = 2'b11;
	
    end

endmodule
