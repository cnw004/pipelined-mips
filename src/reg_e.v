/*
module to act as our clk for the execute stage

inputs:
  - clk: our clock
  - clr: wire from hazard unit. decides if we should flush
  - in1: syscall
  - in2: reg write
  - in3: memToReg
  - in4: alu ctrl (2:0)
  - in5: aluSrc
  - in6: regDst
  - in7: output from register RD1
  - in8: output from register RD2
  - in9: RsD (25:21)
  - in10: RtD (20:16)
  - in11: RdE (15:11)
  - in12: SignImmD (31:0)
  - in13: memWrite

output:
- out1: syscall
- out2: reg write
- out3: memToReg
- out4: alu ctrl (2:0)
- out5: aluSrc
- out6: regDst
- out7: output from register RD1
- out8: output from register RD2
- out9: RsD (25:21)
- out10: RtD (20:16)
- out11: RdE (15:11)
- out12: SignImmD (31:0)
- out13: memWrite
*/

module reg_e(input wire clk,
  input wire clr,
  input wire in1,
  input wire in2,
  input wire in3,
  input wire in4,
  input wire in5,
  input wire in6,
  input wire [31:0] in7,
  input wire [31:0] in8,
  input wire [25:21] in9,
  input wire [20:16] in10,
  input wire [15:11] in11,
  input wire [31:0] in12,
  input wire in13,
  output reg out1,
  output reg out2,
  output reg out3,
  output reg out4,
  output reg out5,
  output reg out6,
  output reg [31:0] out7,
  output reg [31:0] out8,
  output reg [25:21] out9,
  output reg [20:16] out10,
  output reg [15:11] out11,
  output reg [31:0] out12,
  output reg out13);

  always @(negedge clk) begin
    if(clr) begin
      out1 <= 0;
      out2 <= 0;
      out3 <= 0;
      out4 <= 0;
      out5 <= 0;
      out6 <= 0;
      out7 <= 0;
      out8 <= 0;
      out9 <= 0;
      out10 <= 0;
      out11 <= 0;
      out12 <= 0;
      out13 <= 0;
    end

    else begin
      out1 <= in1;
      out2 <= in2;
      out3 <= in3;
      out4 <= in4;
      out5 <= in5;
      out6 <= in6;
      out7 <= in7;
      out8 <= in8;
      out9 <= in9;
      out10 <= in10;
      out11 <= in11;
      out12 <= in12;
      out13 <= in13;
    end
  end


endmodule