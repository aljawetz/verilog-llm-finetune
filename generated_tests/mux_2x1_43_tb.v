`timescale 1ns/1ps

module tb_mux_2x1;

  // Inputs
  reg x1;
  reg x2;
  reg s;

  // Output
  wire f;

  // Instantiate the Unit Under Test (UUT)
  mux_2x1 uut (
    .x1(x1),
    .x2(x2),
    .s(s),
    .f(f)
  );

  initial begin
    // Initialize Inputs
    x1 = 0;
    x2 = 0;
    s = 0;

    // Test case 1: s = 0, expect f = x1
    x1 = 1; x2 = 0; s = 0; #10;
    if (f !== 1) $display("FAIL: Test case 1 failed, expected f = 1, got f = %b", f);

    // Test case 2: s = 1, expect f = x2
    x1 = 0; x2 = 1; s = 1; #10;
    if (f !== 1) $display("FAIL: Test case 2 failed, expected f = 1, got f = %b", f);

    // Test case 3: s = 0, expect f = x1
    x1 = 1; x2 = 1; s = 0; #10;
    if (f !== 1) $display("FAIL: Test case 3 failed, expected f = 1, got f = %b", f);

    // Test case 4: s = 1, expect f = x2
    x1 = 0; x2 = 0; s = 1; #10;
    if (f !== 0) $display("FAIL: Test case 4 failed, expected f = 0, got f = %b", f);

    // Test case 5: s = 0, expect f = x1
    x1 = 0; x2 = 1; s = 0; #10;
    if (f !== 0) $display("FAIL: Test case 5 failed, expected f = 0, got f = %b", f);

    // Test case 6: s = 1, expect f = x2
    x1 = 1; x2 = 0; s = 1; #10;
    if (f !== 0) $display("FAIL: Test case 6 failed, expected f = 0, got f = %b", f);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule