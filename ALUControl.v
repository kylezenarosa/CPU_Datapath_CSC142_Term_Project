module ALUControl(
   input [1:0] ALUOp,  //Control Signal
   input [3:0] Function,
   output reg [2:0] ALUControl
   );

   always @(*) begin

      casex ({ALUOp, Function})
       6'b000000: ALUControl=3'b000; //add
       6'b000001: ALUControl=3'b001; //sub
       6'b000100: ALUControl=3'b010; //mult
       6'b000101: ALUControl=3'b011; //div
       6'b10xxxx: ALUControl=3'b100; //and
       6'b11xxxx: ALUControl=3'b101; //or
       default: ALUControl=3'b000;
      endcase

   end

endmodule
