`timescale 1ns/1ps

module tb_full_subtractor;

  reg a;
  reg b;
  reg b_in;
  wire D;
  wire b_out;

  // Instantiate the full_subtractor module
  full_subtractor uut (
    .a(a),
    .b(b),
    .b_in(b_in),
    .D(D),
    .b_out(b_out)
  );

  initial begin
    // Test case 1: a = 0, b = 0, b_in = 0
    a = 0; b = 0; b_in = 0;
    #10;
    if (D !== 0 || b_out !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 0, b = 0, b_in = 1
    a = 0; b = 0; b_in = 1;
    #10;
    if (D !== 1 || b_out !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 0, b = 1, b_in = 0
    a = 0; b = 1; b_in = 0;
    #10;
    if (D !== 1 || b_out !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 0, b = 1, b_in = 1
    a = 0; b = 1; b_in = 1;
    #10;
    if (D !== 0 || b_out !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: a = 1, b = 0, b_in = 0
    a = 1; b = 0; b_in = 0;
    #10;
    if (D !== 1 || b_out !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a = 1, b = 0, b_in = 1
    a = 1; b = 0; b_in = 1;
    #10;
    if (D !== 0 || b_out !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: a = 1, b = 1, b_in = 0
    a = 1; b = 1; b_in = 0;
    #10;
    if (D !== 0 || b_out !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: a = 1, b = 1, b_in = 1
    a = 1; b = 1; b_in = 1;
    #10;
    if (D !== 1 || b_out !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule