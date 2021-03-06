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
  integer regfAddress;
  task resetRegFile;
    for(regfAddress=1; regfAddress<=31; regfAddress=regfAddress+1) begin
      dut.muxWD3.out = 32'b0;
      dut.muxRegWriteSelect.out = regfAddress;
      dut.opDecoder.regWrite = 1;
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

    $readmemh("test1.text", dut.cpuMemory.memory, 0);
    #250; // Run Program

    // $display(dut.registerFile.mainReg[5'd29].register.q);

    if (dut.registerFile.mainReg[5'd12].register.q == 6'h38) begin
      $display(dut.registerFile.mainReg[5'd12].register.q);
      $display("Test 1 Passed");
    end
    #50


    for(index=0;index <=15;index = index + 1) begin
      ReadRegister1 = index;
      ReadRegister2 = index + 16;
      #5 Clk=1; #5 Clk=0;

    // The value in register 2 should not have changed from the last test, and should still read 15
      if((ReadData1 !== 0) || (ReadData2 !== 0)) begin
        dutpassed = 0;
        $display("Test Case 3 Failed");
      end
    end


    // $readmemh("test2.text", dut.cpuMemory.memory, 0);
    // $readmemh("test2.data", dut.cpuMemory.memory, 16'h1000);
    // #500

    // if (dut.cpuMemory.memory.)


    $finish();



  end

endmodule //
