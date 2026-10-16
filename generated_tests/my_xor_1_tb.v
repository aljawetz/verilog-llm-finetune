`timescale 1ns/1ps

module tb_my_xor;

  reg inA;
  reg inB;
  wire myout;

  // Instantiate the module under test (uut)
  my_xor uut (
    .myout(myout),
    .inA(inA),
    .inB(inB)
  );

  initial begin
    // Test case 1: inA = 0, inB = 0
    inA = 0; inB = 0;
    #10;
    if (myout !== 0) $display("FAIL: Test case 1 failed (inA=0, inB=0)");

    // Test case 2: inA = 0, inB = 1
    inA = 0; inB = 1;
    #10;
    if (myout !== 1) $display("FAIL: Test case 2 failed (inA=0, inB=1)");

    // Test case 3: inA = 1, inB = 0
    inA = 1; inB = 0;
    #10;
    if (myout !== 1) $display("FAIL: Test case 3 failed (inA=1, inB=0)");

    // Test case 4: inA = 1, inB = 1
    inA = 1; inB = 1;
    #10;
    if (myout !== 0) $display("FAIL: Test case 4 failed (inA=1, inB=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule