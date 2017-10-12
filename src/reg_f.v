/*
module to act as our clk for the fetch stage

inputs:
  - enable: wire from hazard unit. decides if we should stall or not (passing in not stall)
  - in1: our program counter

output:
  - out1: our program counter, released after rising clk edge
*/

module reg_f(
  input wire clk,
  input wire enable,
  input wire [31:0] in1,
  output reg [31:0] out1);

  //init the value of the first pc
  initial begin
    out1 = 32'h00400020;
  end

  //if negedge clk, pass value through
  always @(posedge clk) begin
    //if(enable)
      out1 <= in1;
    //else
      //out1 <= 0;
  end

endmodule
