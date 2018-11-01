module mux4to1by32
(
  output[31:0]      out,
  input[1:0]  address,
  input[31:0]  input0, input1, input2, input3
);
    wire[3:0] mux[31:0]; // Create a 2D array of wires

    assign mux[0] = input0;
    assign mux[1] = input1;
    assign mux[2] = input2;
    assign mux[3] = input3;

    assign out = mux[address]; // Connect the output of the array
endmodule

module mux4to1by5
(
  output[4:0]      out,
  input[1:0]  address,
  input[4:0]  input0, input1, input2, input3
);
    wire[3:0] mux[4:0]; // Create a 2D array of wires

    assign mux[0] = input0;
    assign mux[1] = input1;
    assign mux[2] = input2;
    assign mux[3] = input3;

    assign out = mux[address]; // Connect the output of the array
endmodule

module mux2to1by32
(
  output[31:0]      out,
  input  address,
  input[31:0]  input0, input1
);

    wire[1:0] mux[31:0]; // Create a 2D array of wires

    assign mux[0] = input0;
    assign mux[1] = input1;
    assign out = mux[address];
endmodule
