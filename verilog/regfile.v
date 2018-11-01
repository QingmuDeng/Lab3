//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register.v"
`include "mux_reg.v"
`include "decoders.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);
wire [31:0] decodedReg;
wire [31:0] dataReg0;
wire[31:0] register0, register1, register2, register3, register4, register5, register6, register7, register8, register9, register10, register11, register12, register13, register14, register15, register16, register17, register18, register19, register20, register21, register22, register23, register24, register25, register26, register27, register28, register29, register30, register31;


decoder1to32 decoder(.out(decodedReg), .enable(RegWrite), .address(WriteRegister));

register32zero reg0(.q(register0), .d(WriteData), .wrenable(decodedReg[0]), .clk(Clk));
register32 reg1(.q(register1), .d(WriteData), .wrenable(decodedReg[1]), .clk(Clk));
register32 reg2(.q(register2), .d(WriteData), .wrenable(decodedReg[2]), .clk(Clk));
register32 reg3(.q(register3), .d(WriteData), .wrenable(decodedReg[3]), .clk(Clk));
register32 reg4(.q(register4), .d(WriteData), .wrenable(decodedReg[4]), .clk(Clk));
register32 reg5(.q(register5), .d(WriteData), .wrenable(decodedReg[5]), .clk(Clk));
register32 reg6(.q(register6), .d(WriteData), .wrenable(decodedReg[6]), .clk(Clk));
register32 reg7(.q(register7), .d(WriteData), .wrenable(decodedReg[7]), .clk(Clk));
register32 reg8(.q(register8), .d(WriteData), .wrenable(decodedReg[8]), .clk(Clk));
register32 reg9(.q(register9), .d(WriteData), .wrenable(decodedReg[9]), .clk(Clk));
register32 reg10(.q(register10), .d(WriteData), .wrenable(decodedReg[10]), .clk(Clk));
register32 reg11(.q(register11), .d(WriteData), .wrenable(decodedReg[11]), .clk(Clk));
register32 reg12(.q(register12), .d(WriteData), .wrenable(decodedReg[12]), .clk(Clk));
register32 reg13(.q(register13), .d(WriteData), .wrenable(decodedReg[13]), .clk(Clk));
register32 reg14(.q(register14), .d(WriteData), .wrenable(decodedReg[14]), .clk(Clk));
register32 reg15(.q(register15), .d(WriteData), .wrenable(decodedReg[15]), .clk(Clk));
register32 reg16(.q(register16), .d(WriteData), .wrenable(decodedReg[16]), .clk(Clk));
register32 reg17(.q(register17), .d(WriteData), .wrenable(decodedReg[17]), .clk(Clk));
register32 reg18(.q(register18), .d(WriteData), .wrenable(decodedReg[18]), .clk(Clk));
register32 reg19(.q(register19), .d(WriteData), .wrenable(decodedReg[19]), .clk(Clk));
register32 reg20(.q(register20), .d(WriteData), .wrenable(decodedReg[20]), .clk(Clk));
register32 reg21(.q(register21), .d(WriteData), .wrenable(decodedReg[21]), .clk(Clk));
register32 reg22(.q(register22), .d(WriteData), .wrenable(decodedReg[22]), .clk(Clk));
register32 reg23(.q(register23), .d(WriteData), .wrenable(decodedReg[23]), .clk(Clk));
register32 reg24(.q(register24), .d(WriteData), .wrenable(decodedReg[24]), .clk(Clk));
register32 reg25(.q(register25), .d(WriteData), .wrenable(decodedReg[25]), .clk(Clk));
register32 reg26(.q(register26), .d(WriteData), .wrenable(decodedReg[26]), .clk(Clk));
register32 reg27(.q(register27), .d(WriteData), .wrenable(decodedReg[27]), .clk(Clk));
register32 reg28(.q(register28), .d(WriteData), .wrenable(decodedReg[28]), .clk(Clk));
register32 reg29(.q(register29), .d(WriteData), .wrenable(decodedReg[29]), .clk(Clk));
register32 reg30(.q(register30), .d(WriteData), .wrenable(decodedReg[30]), .clk(Clk));
register32 reg31(.q(register31), .d(WriteData), .wrenable(decodedReg[31]), .clk(Clk));


mux32to1by32 mux1(.out(ReadData1), .address(ReadRegister1), .input0(register0), .input1(register1), .input2(register2),
                  .input3(register3), .input4(register4), .input5(register5), .input6(register6), .input7(register7),
                  .input8(register8), .input9(register9), .input10(register10), .input11(register11), .input12(register12),
                  .input13(register13), .input14(register14), .input15(register15), .input16(register16), .input17(register17),
                  .input18(register18), .input19(register19), .input20(register20), .input21(register21), .input22(register22),
                  .input23(register23), .input24(register24), .input25(register25), .input26(register26), .input27(register27),
                  .input28(register28), .input29(register29), .input30(register30), .input31(register31));
mux32to1by32 mux2(.out(ReadData2), .address(ReadRegister2), .input0(register0), .input1(register1), .input2(register2),
                  .input3(register3), .input4(register4), .input5(register5), .input6(register6), .input7(register7),
                  .input8(register8), .input9(register9), .input10(register10), .input11(register11), .input12(register12),
                  .input13(register13), .input14(register14), .input15(register15), .input16(register16), .input17(register17),
                  .input18(register18), .input19(register19), .input20(register20), .input21(register21), .input22(register22),
                  .input23(register23), .input24(register24), .input25(register25), .input26(register26), .input27(register27),
                  .input28(register28), .input29(register29), .input30(register30), .input31(register31));

endmodule
