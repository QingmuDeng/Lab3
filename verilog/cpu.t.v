`include "cpu.v"
module cpuTest ();
  reg clk;

  initial clk=0;
  always #5 clk=~clk;

  cpu dut(clk);
  // initial dut.pcIn=0;
  // dut.registerFile.register29=16'h3ffc;

  initial begin
    $dumpfile("cpu.vcd");
    $dumpvars();

    #1000;
    // assign dut.registerFile.register29=16'h3ffc;
    $finish();



  end

endmodule //
