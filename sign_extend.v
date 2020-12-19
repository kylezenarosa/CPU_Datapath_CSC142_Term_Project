module sign_extend(
   input [1:0] SignalIn,
   input [11:0] in,
   output reg [15:0] Out
   );

   always @(*) begin

      casex (SignalIn)
       2'b00: Out = {{4{in[11]}}, in[11:0]}; //4 Extend
       2'b01: Out = {{8{in[7]}}, in[7:0]}; //8 Extend
       2'b10: Out = {{12{in[3]}}, in[3:0]}; //12 Extend
       2'b11: Out = {8'b00000000, in[7:0]}; //0 extend
      endcase

   end

endmodule
