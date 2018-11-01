
//------------------------------------------------------------------------
// Memory
//   Outputs both instruction and data memroy
//   Positive edge triggered
//   dataOut always has the value mem[address]
//   If writeEnable is true, writes dataIn to mem[address]
//------------------------------------------------------------------------

module memory
  #(
    parameter addresswidth  = 15,
    parameter depth         = 2**addresswidth,
    parameter width         = 32
    )
   (
    input                    clk,
    output reg [width-1:0]   dataMemorydataOut,
    output reg [width-1:0]   instructionOut,
    input [addresswidth-1:0] InstructionAddress,
    input [addresswidth-1:0] dataMemoryAddress,
    input                    dataMemorywriteEnable,
    input [width-1:0]        dataMemorydataIn
    );


   reg [width-1:0]           memory [depth-1:0];

   always @(posedge clk) begin
      instructionOut <= memory[InstructionAddress];
      if(dataMemorywriteEnable)
        memory[dataMemoryAddress] <= dataMemorydataIn;
      dataMemorydataOut <= memory[dataMemoryAddress];
   end

endmodule
