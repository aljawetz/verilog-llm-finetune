`timescale 1ns/1ps

module tb_BLOCK2A;

  reg PIN2;
  reg GIN1;
  reg GIN2;
  reg PHI;
  wire GOUT;

  // Instantiate the module under test (uut)
  BLOCK2A uut (
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

    // Test case 1: GIN2 = 0, PIN2 = 0, GIN1 = 0
    #10;
    if (GOUT !== 1) $display("FAIL: Test case 1 failed, expected GOUT = 1, got GOUT = %b", GOUT);

    // Test case 2: GIN2 = 0, PIN2 = 1, GIN1 = 0
    PIN2 = 1; #10;
    if (GOUT !== 1) $display("FAIL: Test case 2 failed, expected GOUT = 1, got GOUT = %b", GOUT);

    // Test case 3: GIN2 = 0, PIN2 = 0, GIN1 = 1
    PIN2 = 0; GIN1 = 1; #10;
    if (GOUT !== 1) $display("FAIL: Test case 3 failed, expected GOUT = 1, got GOUT = %b", GOUT);

    // Test case 4: GIN2 = 1, PIN2 = 0, GIN1 = 0
    GIN2 = 1; PIN2 = 0; GIN1 = 0; #10;
    if (GOUT !== 0) $display("FAIL: Test case 4 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // Test case 5: GIN2 = 1, PIN2 = 1, GIN1 = 0
    PIN2 = 1; #10;
    if (GOUT !== 0) $display("FAIL: Test case 5 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // Test case 6: GIN2 = 1, PIN2 = 0, GIN1 = 1
    PIN2 = 0; GIN1 = 1; #10;
    if (GOUT !== 0) $display("FAIL: Test case 6 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // Test case 7: GIN2 = 1, PIN2 = 1, GIN1 = 1
    PIN2 = 1; #10;
    if (GOUT !== 0) $display("FAIL: Test case 7 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule