`include "cpu.v"
module cpuTest ();
  reg clk;

  initial clk=0;

  cpu dut(clk);
  // dut.registerFile.register29=16'h3ffc;

  initial begin
    $dumpfile("cpu.vcd");
    $dumpvars();
    assign dut.registerFile.register29=16'h3ffc;

  end

endmodule //
