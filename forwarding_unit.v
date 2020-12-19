module forwarding_unit(
      input       [3:0]   registerOP1ID,
                          registerOP2ID,
                          registerOP1EX,
                          registerOP1MEM,
      input [1:0]         regWriteMEM,
                          regWriteWB,
      output reg  [1:0]   forwardA,
                          forwardB
  );
  
      always@(*) begin
        
            if (regWriteMEM != 2'b00 && (registerOP1EX != 0) && (registerOP1EX == registerOP1ID))
                forwardA = 2'b01;
            else if (regWriteWB != 2'b00 && (registerOP1MEM != 0) && (registerOP1MEM == registerOP1ID))
                forwardA = 2'b00;
            else
                forwardA = 2'b10;

      end

      always@(*) begin
           
            if (regWriteMEM != 2'b00 && (registerOP1EX != 0) && (registerOP1EX == registerOP2ID))
                forwardB = 2'b00;
            else if (regWriteWB != 2'b00 && (registerOP1MEM != 0) && (registerOP1MEM == registerOP2ID))
                forwardB = 2'b10;
            else
                forwardB = 2'b01;
      end
  
endmodule 
