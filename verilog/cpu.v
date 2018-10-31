`include "alu.v"
`include "datamemory.v"
`include "lshift2.v"
`include "fsm.v"
`include "mux.v"
`include "signextend.v"
`include "regfile.v"
`include "dff.v"
`include "instructionmemory.v"

module cpu(
  input clk,
  input

  );

wire [32:0] pcIn, pcOut, instruction;

memory cpuMemory (
  .clk(clk),
  .dataMemorydataOut(),
  .instructionOut(instruction),
  .InstructionAddress(pcOut),
  .dataMemoryAddress(),
  .dataMemorywriteEnable(),
  .dataMemorydataIn()
  );


programCounter pc (
  .d(pcIn),
  .clk(clk),
  .q(pcOut)
  );

mux4to1 muxPC(
  .address(pcMuxSelect),
  .inputs({,branchAddress}),
  .out(pcIn)
  );



mux4to1 muxRegWriteSelect(
  .address(regWriteSelectControl),
  .inputs({instruction[20:16], 31, instruction[15:11]}),
  .out()
  );

mux4to1 muxB(
    .address(),
    .inputs({signExtended, }),
    .out()
    );


mux2to1 muxA(
  .address(),
  .inputs(),
  .out()
  );

mux2to1 muxWD3(
  .address(),
  .inputs(),
  .out()
  );

wire [32:0] signExtended;

signExtend signExtension(
  .immediate(instruction[15:0]),
  .extended(signExtended)
  );

wire [32:0] branchAddress;
wire [27:0] jumpShifted;

lshift32 shiftSignExt(
  .immediate(signExtended),
  .lshifted(branchAddress)
  );

lshift28 shiftPC(
  .immediate(instruction[25:0]),
  .lshifted(jumpShifted)
  );

ALU OpALU(
  .operandA(),
  .operandB(),
  .command(),
  .overflow(),
  .zero(),
  .carryout(),
  .result()
  );

wire [32:0] readOut1, readOut2;

regfile registerFile(
  .clk(clk),
  .RegWrite(),
  .WriteRegister()
  .ReadRegister1(instruction[25:21]),
  .ReadRegister2(instruction[20:16]),
  .WriteData(),
  .ReadData1(readOut1),
  .ReadData2(readOut2)
  );

  wire [2:0] pcMuxSelect, regWriteSelectControl;

fsm opDecoder(
  .opcode(),
  .functcode(),
  .regWrite(),
  .muxA_en(),
  .dm_we(),
  .muxWD3_en(),
  .branch(),
  .muxB_en(),
  .regWriteAddSelect(regWriteSelectControl),
  .muxPC(pcMuxSelect),
  .ALUop()
  );

ALU pcAddFour(
  .operandA(),
  .operandB(),
  .command(),
  .overflow(),
  .zero(),
  .carryout(),
  .result()
  );

ALU pcBranch(
  .operandA(),
  .operandB(),
  .command(),
  .overflow(),
  .zero(),
  .carryout(),
  .result()
  );
