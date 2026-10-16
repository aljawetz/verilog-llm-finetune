`timescale 1ns/1ps

module tb_day2;

  // Inputs
  reg p1a, p1b, p1c, p1d;
  reg p2a, p2b, p2c, p2d;

  // Outputs
  wire p1y, p2y;

  // Instantiate the Unit Under Test (UUT)
  day2 uut (
    .p1a(p1a), 
    .p1b(p1b), 
    .p1c(p1c), 
    .p1d(p1d), 
    .p2a(p2a), 
    .p2b(p2b), 
    .p2c(p2c), 
    .p2d(p2d), 
    .p1y(p1y), 
    .p2y(p2y)
  );

  initial begin
    // Test case 1: All inputs low
    p1a = 0; p1b = 0; p1c = 0; p1d = 0;
    p2a = 0; p2b = 0; p2c = 0; p2d = 0;
    #10;
    if (p1y !== 1'b1) $display("FAIL: Test case 1 failed for p1y");
    if (p2y !== 1'b1) $display("FAIL: Test case 1 failed for p2y");

    // Test case 2: One input high for group 1
    p1a = 1; p1b = 0; p1c = 0; p1d = 0;
    #10;
    if (p1y !== 1'b1) $display("FAIL: Test case 2 failed for p1y");

    // Test case 3: All inputs high for group 1
    p1a = 1; p1b = 1; p1c = 1; p1d = 1;
    #10;
    if (p1y !== 1'b0) $display("FAIL: Test case 3 failed for p1y");

    // Test case 4: All inputs low for group 2
    p2a = 0; p2b = 0; p2c = 0; p2d = 0;
    #10;
    if (p2y !== 1'b1) $display("FAIL: Test case 4 failed for p2y");

    // Test case 5: One input high for group 2
    p2a = 1; p2b = 0; p2c = 0; p2d = 0;
    #10;
    if (p2y !== 1'b1) $display("FAIL: Test case 5 failed for p2y");

    // Test case 6: All inputs high for group 2
    p2a = 1; p2b = 1; p2c = 1; p2d = 1;
    #10;
    if (p2y !== 1'b0) $display("FAIL: Test case 6 failed for p2y");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule