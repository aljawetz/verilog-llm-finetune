`timescale 1ns/1ps

module tb_pin_full_parallel;

  reg a_in, b_in, c_in, d_in;
  wire y_out;

  // Instantiate the module under test (uut)
  pin_full_parallel uut (
    .a_in(a_in),
    .b_in(b_in),
    .c_in(c_in),
    .d_in(d_in),
    .y_out(y_out)
  );

  initial begin
    // Test sequence
    // Test case 1: a_in=0, b_in=0, c_in=0, d_in=0 -> y_out should be 0
    a_in = 0; b_in = 0; c_in = 0; d_in = 0;
    #5;
    if (y_out !== 0) $display("FAIL: Test case 1 failed, expected 0, got %b", y_out);

    // Test case 2: a_in=1, b_in=0, c_in=0, d_in=0 -> y_out should be 0
    a_in = 1; b_in = 0; c_in = 0; d_in = 0;
    #5;
    if (y_out !== 0) $display("FAIL: Test case 2 failed, expected 0, got %b", y_out);

    // Test case 3: a_in=0, b_in=1, c_in=0, d_in=0 -> y_out should be 0
    a_in = 0; b_in = 1; c_in = 0; d_in = 0;
    #5;
    if (y_out !== 0) $display("FAIL: Test case 3 failed, expected 0, got %b", y_out);

    // Test case 4: a_in=0, b_in=0, c_in=1, d_in=0 -> y_out should be 0
    a_in = 0; b_in = 0; c_in = 1; d_in = 0;
    #5;
    if (y_out !== 0) $display("FAIL: Test case 4 failed, expected 0, got %b", y_out);

    // Test case 5: a_in=0, b_in=0, c_in=0, d_in=1 -> y_out should be 0
    a_in = 0; b_in = 0; c_in = 0; d_in = 1;
    #5;
    if (y_out !== 0) $display("FAIL: Test case 5 failed, expected 0, got %b", y_out);

    // Test case 6: a_in=1, b_in=1, c_in=0, d_in=0 -> y_out should be 1
    a_in = 1; b_in = 1; c_in = 0; d_in = 0;
    #5;
    if (y_out !== 1) $display("FAIL: Test case 6 failed, expected 1, got %b", y_out);

    // Test case 7: a_in=0, b_in=0, c_in=1, d_in=1 -> y_out should be 1
    a_in = 0; b_in = 0; c_in = 1; d_in = 1;
    #5;
    if (y_out !== 1) $display("FAIL: Test case 7 failed, expected 1, got %b", y_out);

    // Test case 8: a_in=1, b_in=0, c_in=1, d_in=1 -> y_out should be 1
    a_in = 1; b_in = 0; c_in = 1; d_in = 1;
    #5;
    if (y_out !== 1) $display("FAIL: Test case 8 failed, expected 1, got %b", y_out);

    // Test case 9: a_in=1, b_in=1, c_in=1, d_in=1 -> y_out should be 1
    a_in = 1; b_in = 1; c_in = 1; d_in = 1;
    #5;
    if (y_out !== 1) $display("FAIL: Test case 9 failed, expected 1, got %b", y_out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule