`timescale 1ns/1ps

module tb_BLOCK1;

  // Inputs
  reg PIN1;
  reg PIN2;
  reg GIN1;
  reg GIN2;
  reg PHI;

  // Outputs
  wire POUT;
  wire GOUT;

  // Instantiate the module under test (uut)
  BLOCK1 uut (
    .PIN1(PIN1),
    .PIN2(PIN2),
    .GIN1(GIN1),
    .GIN2(GIN2),
    .PHI(PHI),
    .POUT(POUT),
    .GOUT(GOUT)
  );

  // Clock generation
  initial begin
    PHI = 0;
    forever #5 PHI = ~PHI; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    PIN1 = 0; PIN2 = 0; GIN1 = 0; GIN2 = 0;
    #10;

    // Test case 1
    PIN1 = 0; PIN2 = 0; GIN1 = 0; GIN2 = 0; #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) $display("FAIL: Test case 1 failed");

    // Test case 2
    PIN1 = 1; PIN2 = 0; GIN1 = 0; GIN2 = 0; #10;
    if (POUT !== 1'b0 || GOUT !== 1'b1) $display("FAIL: Test case 2 failed");

    // Test case 3
    PIN1 = 0; PIN2 = 1; GIN1 = 0; GIN2 = 0; #10;
    if (POUT !== 1'b0 || GOUT !== 1'b1) $display("FAIL: Test case 3 failed");

    // Test case 4
    PIN1 = 1; PIN2 = 1; GIN1 = 0; GIN2 = 0; #10;
    if (POUT !== 1'b0 || GOUT !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5
    PIN1 = 0; PIN2 = 0; GIN1 = 1; GIN2 = 0; #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6
    PIN1 = 0; PIN2 = 0; GIN1 = 0; GIN2 = 1; #10;
    if (POUT !== 1'b1 || GOUT !== 1'b0) $display("FAIL: Test case 6 failed");

    // Test case 7
    PIN1 = 0; PIN2 = 1; GIN1 = 1; GIN2 = 1; #10;
    if (POUT !== 1'b0 || GOUT !== 1'b0) $display("FAIL: Test case 7 failed");

    // Test case 8
    PIN1 = 1; PIN2 = 1; GIN1 = 1; GIN2 = 1; #10;
    if (POUT !== 1'b0 || GOUT !== 1'b0) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule