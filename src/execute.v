`include "mips.h"

module execute(
    //inputs from Execute Register - Control Components
    input wire ALUControlE,
    input wire ALUSrcE,
    input wire RegDstE,
    //inputs from Execute Register - Decode Components
    input wire [31:0] reg1, //00 input of mux3ALUInput1
    input wire [31:0] reg2, //00 input of mux3ALUInput2
    input wire [4:0] RsE,
    input wire [4:0] RtE,
    input wire [4:0] RdE,
    input wire [31:0] SignImmE,
    //inputs from Hazard
    input wire ForwardAE,
    input wire ForwardBE,
    //inputs for forwarding
    input wire [31:0] ForwardMemVal, //01 input of mux3ALUInput 1&2 forward from exec
    input wire [31:0] ForwardExecVal, //10 input of mux3ALUInput 1&2 foward from mem
    //outputs to hazard unit
    output reg RsEHazard, //output RsE value right to hazards
    output reg RtEHazard, //output RtE value right to hazards
    //outputs to memory Register
    output reg [31:0] ALUOutput,
    output reg [31:0] WriteDataE,
    //output to both hazard unit and memory register
    output reg [4:0] WriteRegE
    );

    //declaration of internal wires (output of one module that inputs to another)
    //ALU inputs
    wire [31:0] SrcAE;
    wire [31:0] ForwardHandlingReg2ALU;
    wire [31:0] SrcBE;

    //declaration of modules necessary to the internal workings of execute
    mux MuxWriteRegE(RegDstE, RtE, RdE, WriteRegE);
    mux3 Mux3SrcAE(ForwardAE, reg1, ForwardMemVal, ForwardExecVal, SrcAE);
    mux3 Mux3SrcBe(ForwardBE, reg2, ForwardMemVal, ForwardExecVal, ForwardHandlingReg2ALU);
    mux MuxSrcBE(ALUSrcE, ForwardHandlingReg2ALU, SignImmE, SrcBE);
    alu ALUE(SrcAE, SrcBE, ALUControlE, ALUOutput);

endmodule