`include "cpu.v"
module cpuTest ();
  reg clk;

  initial clk=0;
  always #5 clk=~clk;

  cpu dut(clk);
  // initial dut.pcIn=0;
  // dut.registerFile.register29=16'h3ffc;

  // assign dut.registerFile.mainReg[5'd29].register.d=16'h3ffc;


  // reg regfreset=0;
  integer index;
  reg[4:0] regfAddress;
  // task reset_dut;
  //   // dut.pc.d = 32'b0;
  //   for(regfAddress=0; regfAddress<=31; regfAddress=regfAddress+1) begin
  //     dut.registerFile.mainReg[5'd4].register.d = 32'b0;
  //     dut.registerFile.mainReg[5'd6].register.wrenable = 1'b1;
  //     #20;regfreset = 1;
  //   end
  // endtask

initial begin

    $readmemh("test1.text", dut.cpuMemory.memory, 0);
    #250; // Run Program

    // $display(dut.registerFile.mainReg[5'd29].register.q);

    if (dut.registerFile.mainReg[5'd12].register.q == 6'h38) begin
      $display(dut.registerFile.mainReg[5'd12].register.q);
      $display("Test 1 Passed");
    end
    #50

    // for(regfAddress=0; regfAddress<=31; regfAddress=regfAddress+1) begin
    //   dut.registerFile.mainReg[regfAddress].register.d = 32'b0;
    //   dut.opDecoder.regWrite = 1;
    //   // dut.registerFile.mainReg[5'd6].register.wrenable = 1'b1;
    //   #20;
    // end

    dut.registerFile.WriteData = 32'b4;
    for(regfAddress=0; regfAddress<=31; regfAddress=regfAddress+1) begin
      dut.registerFile.WriteData = 32'b1;
      // dut.registerFile.WriteRegister = 5'd3;
      dut.opDecoder.regWrite = 1;
      // dut.registerFile.mainReg[5'd6].register.wrenable = 1'b1;
      #20;
    end

    // for(index=0;index <=15;index = index + 1) begin
    //   ReadRegister1 = index;
    //   ReadRegister2 = index + 16;
    //   #5 Clk=1; #5 Clk=0;
    //
    //   // The value in register 2 should not have changed from the last test, and should still read 15
    //   if((ReadData1 !== 0) || (ReadData2 !== 0)) begin
    //     dutpassed = 0;
    //     $display("Test Case 3 Failed");
    //   end
    // end


    $readmemh("test2.text", dut.cpuMemory.memory, 0);
    $readmemh("test2.data", dut.cpuMemory.memory, 16'h1000);
    #500

    // if (dut.cpuMemory.memory.)


    $finish();



  end

endmodule //
