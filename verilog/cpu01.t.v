`include "cpu.v"
module cpuTest ();
  reg clk;
  initial clk=0;
  always #5 clk=~clk;

  cpu dut(clk);

  integer regfAddress;
  task resetRegFile;
    #100
    for(regfAddress=1; regfAddress<=31; regfAddress=regfAddress+1) begin
      dut.muxWD3.out = 32'b0;
      dut.muxRegWriteSelect.out = regfAddress;
      dut.opDecoder.regWrite = 1;
      dut.pc.q = 32'b0;
      #20;
    end
  endtask

initial begin

    $dumpfile("cpu01.vcd");
    $dumpvars();

    $readmemh("test2.text", dut.cpuMemory.memory, 0);
    $readmemh("test2.data", dut.cpuMemory.memory, 16'h1000);
    #5000
    if (dut.registerFile.mainReg[5'd8].register.q == 32'h2000 && dut.registerFile.mainReg[5'd9].register.q == 32'h8 && dut.registerFile.mainReg[5'd10].register.q == 32'h8 && dut.registerFile.mainReg[5'd11].register.q == 32'h2020 && dut.registerFile.mainReg[5'd12].register.q == 32'ha && dut.registerFile.mainReg[5'd13].register.q == 32'h1c && dut.registerFile.mainReg[5'd14].register.q == 32'h0 && dut.registerFile.mainReg[5'd15].register.q == 32'h4) begin
      $display("Test 2 Passed");
    end
    resetRegFile();
    #500

    $finish();

  end

endmodule //
