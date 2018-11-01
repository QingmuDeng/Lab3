`include "alu.v"
`include "memory.v"
`include "lshift2.v"
`include "fsm.v"
`include "mux.v"
`include "signextend.v"
`include "regfile.v"
`include "dff.v"

module cpu(
  input clk
    );

wire [31:0] pcIn, pcOut, instruction, dataOut;

memory cpuMemory (
  .clk(clk),
  .dataMemorydataOut(dataOut),
  .instructionOut(instruction),
  .InstructionAddress(pcOut),
  .dataMemoryAddress(aluResult),
  .dataMemorywriteEnable(dm_we),
  .dataMemorydataIn(readOut2)
  );


programCounter pc (
  .d(pcIn),
  .clk(clk),
  .q(pcOut)
  );

mux4to1 muxPC(
  .address(pcMuxSelect),
  .inputs({pcPlusFour,{jumpShifted, pcPlusFour},readOut1,branchAddress}),
  .out(pcIn)
  );

wire [4:0] regWrAddress;

mux4to1 muxRegWriteSelect(
  .address(regWriteSelectControl),
  .inputs({instruction[20:16], 5'd31, instruction[15:11]}),
  .out(regWrAddress)
  );

mux4to1 muxB(
    .address(muxB_en),
    .inputs({signExtended, readOut2, 32'd4}),
    .out(opB)
    );

wire [31:0] opA, opB;

mux2to1 muxA(
  .address(muxAselect),
  .inputs({readOut1, pcOut}),
  .out(opA)
  );

wire [31:0] writeData;

mux2to1 muxWD3(
  .address(muxWd3_en),
  .inputs({dataOut, aluResult}),
  .out(writeData)
  );

wire [31:0] signExtended;

signExtend signExtension(
  .immediate(instruction[15:0]),
  .extended(signExtended)
  );

wire [31:0] branchALUin;
wire [27:0] jumpShifted;

lshift32 shiftSignExt(
  .immediate(signExtended),
  .lshifted(branchALUin)
  );

lshift28 shiftPC(
  .immediate(instruction[25:0]),
  .lshifted(jumpShifted)
  );

wire [31:0] aluResult;
wire zeroFlag;

ALU OpALU(
  .operandA(opA),
  .operandB(opB),
  .command(ALUop),
  .overflow(),
  .zero(zeroFlag),
  .carryout(),
  .result(aluResult)
  );

wire [31:0] readOut1, readOut2;

regfile registerFile(
  .clk(clk),
  .RegWrite(regWr_en),
  .WriteRegister(regWrAddress),
  .ReadRegister1(instruction[25:21]),
  .ReadRegister2(instruction[20:16]),
  .WriteData(writeData),
  .ReadData1(readOut1),
  .ReadData2(readOut2)
  );

  wire [1:0] pcMuxSelect, regWriteSelectControl, muxB_en;
  wire dm_we, regWr_en, muxAselect, muxWd3_en;

fsm opDecoder(
  .opcode(instruction[31:26]),
  .functcode(instruction[5:0]),
  .regWrite(regWr_en),
  .muxA_en(muxAselect),
  .zero(zero_Flag),
  .dm_we(dm_we),
  .muxWD3_en(muxWd3_en),
  .muxB_en(muxB_en),
  .regWriteAddSelect(regWriteSelectControl),
  .muxPC(pcMuxSelect),
  .ALUop(ALUop)
  );

wire [31:0] pcPlusFour;

ALU pcAddFour(
  .operandA(32'd4),
  .operandB(pcOut),
  .command(3'd0), // Add Command
  .overflow(),
  .zero(),
  .carryout(),
  .result(pcPlusFour)
  );

wire [31:0] branchAddress;

ALU pcBranch(
  .operandA(branchALUin),
  .operandB(pcPlusFour),
  .command(3'd0), // Add Command
  .overflow(),
  .zero(),
  .carryout(),
  .result(branchAddress)
  );

endmodule
