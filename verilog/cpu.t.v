`include "cpu.v"
module cpuTest ();
  reg clk;
  reg[1:0] test;

  initial clk=0;
  always #5 clk=~clk;

  cpu dut(clk);
  // initial dut.pcIn=0;
  // dut.registerFile.register29=16'h3ffc;

  // assign dut.registerFile.mainReg[5'd29].register.d=16'h3ffc;


  // reg regfreset=0;
  integer index;
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
    // $display(dut.registerFile.register.q);
    // $display(dut.registerFile.mainReg[5'd1].register.q);
    // $display(dut.registerFile.mainReg[5'd2].register.q);
    // $display(dut.registerFile.mainReg[5'd3].register.q);
    // $display(dut.registerFile.mainReg[5'd4].register.q);
    // $display(dut.registerFile.mainReg[5'd5].register.q);
    // $display(dut.registerFile.mainReg[5'd6].register.q);
    // $display(dut.registerFile.mainReg[5'd7].register.q);
    // $display(dut.registerFile.mainReg[5'd8].register.q);
    // $display(dut.registerFile.mainReg[5'd9].register.q);
    // $display(dut.registerFile.mainReg[5'd10].register.q);
    // $display(dut.registerFile.mainReg[5'd11].register.q);
    // $display(dut.registerFile.mainReg[5'd12].register.q);
    // $display(dut.registerFile.mainReg[5'd13].register.q);
    // $display(dut.registerFile.mainReg[5'd14].register.q);
    // $display(dut.registerFile.mainReg[5'd15].register.q);
    // $display(dut.registerFile.mainReg[5'd16].register.q);
    // $display(dut.registerFile.mainReg[5'd17].register.q);
    // $display(dut.registerFile.mainReg[5'd18].register.q);
    // $display(dut.registerFile.mainReg[5'd19].register.q);
    // $display(dut.registerFile.mainReg[5'd20].register.q);
    // $display(dut.registerFile.mainReg[5'd21].register.q);
    // $display(dut.registerFile.mainReg[5'd22].register.q);
    // $display(dut.registerFile.mainReg[5'd23].register.q);
    // $display(dut.registerFile.mainReg[5'd24].register.q);
    // $display(dut.registerFile.mainReg[5'd25].register.q);
    // $display(dut.registerFile.mainReg[5'd26].register.q);
    // $display(dut.registerFile.mainReg[5'd27].register.q);
    // $display(dut.registerFile.mainReg[5'd28].register.q);
    // $display(dut.registerFile.mainReg[5'd29].register.q);
    // $display(dut.registerFile.mainReg[5'd30].register.q);
    // $display(dut.registerFile.mainReg[5'd31].register.q);

initial begin

    $dumpfile("cpu.vcd");
    $dumpvars();

    test=0;
    // $readmemh("test1.text", dut.cpuMemory.memory, 0);
    // #250; // Run Program
    //
    // // $display(dut.registerFile.mainReg[5'd29].register.q);
    // if (dut.registerFile.mainReg[5'd12].register.q == 32'h38 && dut.registerFile.mainReg[5'd9].register.q == 32'h47 && dut.registerFile.mainReg[5'd8].register.q == 32'hf && dut.registerFile.mainReg[5'd2].register.q == 32'hf && dut.registerFile.mainReg[5'd11].register.q == 32'h1) begin
    //   $display(dut.registerFile.mainReg[5'd12].register.q);
    //   $display("Test 1 Passed");
    // end
    // resetRegFile();
    // #5000
    // for(index=0;index <=15;index = index + 1) begin
    //   ReadRegister1 = index;
    //   ReadRegister2 = index + 16;
    //   #5 Clk=1; #5 Clk=0;

    // The value in register 2 should not have changed from the last test, and should still read 15
    //   if((ReadData1 !== 0) || (ReadData2 !== 0)) begin
    //     dutpassed = 0;
    //     $display("Test Case 3 Failed");
    //   end
    // end

    test=1;
    // $readmemh("test2.text", dut.cpuMemory.memory, 0);
    // $readmemh("test2.data", dut.cpuMemory.memory, 16'h1000);
    // #500
    // if (dut.registerFile.mainReg[5'd8].register.q == 32'h2000 && dut.registerFile.mainReg[5'd9].register.q == 32'h8 && dut.registerFile.mainReg[5'd10].register.q == 32'h8 && dut.registerFile.mainReg[5'd11].register.q == 32'h2020 && dut.registerFile.mainReg[5'd12].register.q == 32'ha && dut.registerFile.mainReg[5'd13].register.q == 32'h1c && dut.registerFile.mainReg[5'd14].register.q == 32'h0 && dut.registerFile.mainReg[5'd15].register.q == 32'h4) begin
    //   $display("Test 2 Passed");
    // end
    // resetRegFile();
    // #5000
    //
    // test=2;
    // $readmemh("test3.text", dut.cpuMemory.memory, 0);
    // #500
    // if (dut.registerFile.mainReg[5'd8].register.q == 32'h65 && dut.registerFile.mainReg[5'd9].register.q == 32'ha && dut.registerFile.mainReg[5'd10].register.q == 32'h65 && dut.registerFile.mainReg[5'd11].register.q == 32'h2a) begin
    //   $display("Test 3 Passed");
    // end
    // resetRegFile();
    // #5000


    test=3;
    $readmemh("hanoi.text", dut.cpuMemory.memory, 0);
    #500
    if (dut.registerFile.mainReg[5'd1].register.q == 32'h1 && dut.registerFile.mainReg[5'd2].register.q == 32'h10e && dut.registerFile.mainReg[5'd4].register.q == 32'h1 && dut.registerFile.mainReg[5'd5].register.q == 32'h8) begin
      $display("Test 4 Passed");
    end
    resetRegFile();
    #5000


    $finish();

  end

endmodule //
