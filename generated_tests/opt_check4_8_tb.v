`timescale 1ns/1ps

module tb_opt_check4;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  opt_check4 uut (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );

  initial begin
    // Test case 1: a=1, b=1, c=1 -> y should be 1 (1 & 1)
    a = 1; b = 1; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

    // Test case 2: a=1, b=1, c=0 -> y should be 0 (1 & 0)
    a = 1; b = 1; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

    // Test case 3: a=1, b=0, c=1 -> y should be 1 (c)
    a = 1; b = 0; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: a=1, b=0, c=0 -> y should be 0 (c)
    a = 1; b = 0; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

    // Test case 5: a=0, b=1, c=1 -> y should be 0 (!c)
    a = 0; b = 1; c = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

    // Test case 6: a=0, b=1, c=0 -> y should be 1 (!c)
    a = 0; b = 1; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

    // Test case 7: a=0, b=0, c=1 -> y should be 0 (!c)
    a = 0; b = 0; c = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 7 failed, expected y=0, got y=%b", y);

    // Test case 8: a=0, b=0, c=0 -> y should be 1 (!c)
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule