`timescale 1ns/1ps

module tb_mux_2x1;

  reg a;
  reg b;
  reg s;
  wire y;

  // Instantiate the module under test
  mux_2x1 uut (
    .a(a),
    .b(b),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: a=0, b=0, s=0 -> y should be 0
    a = 0; b = 0; s = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: a=0, b=1, s=0 -> y should be 0
    a = 0; b = 1; s = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

    // Test case 3: a=1, b=0, s=0 -> y should be 1
    a = 1; b = 0; s = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: a=1, b=1, s=0 -> y should be 1
    a = 1; b = 1; s = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

    // Test case 5: a=0, b=0, s=1 -> y should be 0
    a = 0; b = 0; s = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

    // Test case 6: a=0, b=1, s=1 -> y should be 1
    a = 0; b = 1; s = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

    // Test case 7: a=1, b=0, s=1 -> y should be 0
    a = 1; b = 0; s = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 7 failed, expected y=0, got y=%b", y);

    // Test case 8: a=1, b=1, s=1 -> y should be 1
    a = 1; b = 1; s = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule