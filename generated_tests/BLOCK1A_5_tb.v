`timescale 1ns/1ps

module tb_BLOCK1A;

  reg PIN2;
  reg GIN1;
  reg GIN2;
  reg PHI;
  wire GOUT;

  // Instantiate the module under test
  BLOCK1A uut (
    .PIN2(PIN2),
    .GIN1(GIN1),
    .GIN2(GIN2),
    .PHI(PHI),
    .GOUT(GOUT)
  );

  initial begin
    // Initialize inputs
    PIN2 = 0;
    GIN1 = 0;
    GIN2 = 0;
    PHI = 0;

    // Test case 1: All inputs low
    #10;
    if (GOUT !== 1) $display("FAIL: Test case 1 failed (GOUT should be 1 when all inputs are 0)");

    // Test case 2: PIN2 high
    PIN2 = 1;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 2 failed (GOUT should be 0 when PIN2 is 1, GIN1 is 0, GIN2 is 0)");

    // Test case 3: GIN1 high
    GIN1 = 1;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 3 failed (GOUT should be 0 when PIN2 is 1, GIN1 is 1, GIN2 is 0)");

    // Test case 4: GIN2 high
    GIN2 = 1;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 4 failed (GOUT should be 0 when PIN2 is 1, GIN1 is 1, GIN2 is 1)");

    // Test case 5: All inputs high
    PIN2 = 1; GIN1 = 1; GIN2 = 1;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 5 failed (GOUT should be 0 when all inputs are 1)");

    // Test case 6: GIN2 low, GIN1 high
    GIN2 = 0;
    #10;
    if (GOUT !== 1) $display("FAIL: Test case 6 failed (GOUT should be 1 when PIN2 is 1, GIN1 is 1, GIN2 is 0)");

    // Test case 7: GIN1 low, GIN2 high
    GIN1 = 0; GIN2 = 1;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 7 failed (GOUT should be 0 when PIN2 is 1, GIN1 is 0, GIN2 is 1)");

    // Test case 8: All inputs low again
    PIN2 = 0; GIN1 = 0; GIN2 = 0;
    #10;
    if (GOUT !== 1) $display("FAIL: Test case 8 failed (GOUT should be 1 when all inputs are 0)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule