module shift_left(
  	 output [15:0] Out,
  	 input [15:0] In
	);

   assign Out = {In[14:0],1'b0};

endmodule
