
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
    output [width-1:0]   dataMemorydataOut,
    output [width-1:0]   instructionOut,
    input [addresswidth-1:0] InstructionAddress,
    input [addresswidth-1:0] dataMemoryAddress,
    input                    dataMemorywriteEnable,
    input [width-1:0]        dataMemorydataIn
    );


   reg [width-1:0]           memory [depth-1:0];

   always @(posedge clk) begin
      if(dataMemorywriteEnable)
        memory[dataMemoryAddress] <= dataMemorydataIn;
   end

   initial $readmemh("test1.text", memory, 0);
   initial $readmemh("test1.data", memory, 16'h1000);

   assign dataMemorydataOut = memory[dataMemoryAddress>>2];
   assign instructionOut = memory[InstructionAddress>>2];

endmodule
