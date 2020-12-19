`include "comparator.v"
module main_alu_fixture;
  
   reg [15:0] OP1, R15;
   wire [1:0] branch;

initial   
        $vcdpluson; 
initial
	$monitor ($time, " OP1 = %b R15 = %b branch = %b \n ", OP1, R15, branch);

comparator a1(OP1, R15, branch);

initial
   begin
      OP1 = 16'b0000000000000101;
      R15 = 16'b0000000000000111;
      #100;
      OP1 = 16'b0000000000000111;
      R15 = 16'b0000000000000101;
      #100;
      OP1 = 16'b0000000000000111;
      R15 = 16'b0000000000000111;
      #100;
      OP1 = 16'b0000000000000000;
      R15 = 16'b0000000000000000;
      #100;
   end
endmodule
