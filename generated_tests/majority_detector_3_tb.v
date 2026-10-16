`timescale 1ns/1ps

module tb_majority_detector;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;

  // Output
  wire f;

  // Instantiate the Unit Under Test (UUT)
  majority_detector uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .f(f)
  );

  initial begin
    // Test case 1: a=1, b=1, c=1, d=1 -> f should be 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (f !== 1) $display("FAIL: Test case 1 failed, expected f=1, got f=%b", f);

    // Test case 2: a=1, b=1, c=0, d=1 -> f should be 1
    a = 1; b = 1; c = 0; d = 1;
    #10;
    if (f !== 1) $display("FAIL: Test case 2 failed, expected f=1, got f=%b", f);

    // Test case 3: a=1, b=0, c=1, d=1 -> f should be 1
    a = 1; b = 0; c = 1; d = 1;
    #10;
    if (f !== 1) $display("FAIL: Test case 3 failed, expected f=1, got f=%b", f);

    // Test case 4: a=0, b=1, c=1, d=1 -> f should be 1
    a = 0; b = 1; c = 1; d = 1;
    #10;
    if (f !== 1) $display("FAIL: Test case 4 failed, expected f=1, got f=%b", f);

    // Test case 5: a=0, b=0, c=0, d=0 -> f should be 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (f !== 0) $display("FAIL: Test case 5 failed, expected f=0, got f=%b", f);

    // Test case 6: a=1, b=0, c=0, d=0 -> f should be 0
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (f !== 0) $display("FAIL: Test case 6 failed, expected f=0, got f=%b", f);

    // Test case 7: a=0, b=1, c=0, d=0 -> f should be 0
    a = 0; b = 1; c = 0; d = 0;
    #10;
    if (f !== 0) $display("FAIL: Test case 7 failed, expected f=0, got f=%b", f);

    // Test case 8: a=0, b=0, c=1, d=0 -> f should be 0
    a = 0; b = 0; c = 1; d = 0;
    #10;
    if (f !== 0) $display("FAIL: Test case 8 failed, expected f=0, got f=%b", f);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule