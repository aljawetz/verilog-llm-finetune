`timescale 1ns/1ps

module tb_full_adder;

  reg x;
  reg y;
  reg c_in;
  wire sum_f;
  wire carry_f;

  // Instantiate the full adder module
  full_adder uut (
    .x(x),
    .y(y),
    .c_in(c_in),
    .sum_f(sum_f),
    .carry_f(carry_f)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, carry = 0
    x = 0; y = 0; c_in = 0;
    #10;
    if (sum_f !== 0 || carry_f !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, carry = 0
    x = 0; y = 0; c_in = 1;
    #10;
    if (sum_f !== 1 || carry_f !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, carry = 0
    x = 0; y = 1; c_in = 0;
    #10;
    if (sum_f !== 1 || carry_f !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1 = 0, carry = 1
    x = 0; y = 1; c_in = 1;
    #10;
    if (sum_f !== 0 || carry_f !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0 = 1, carry = 0
    x = 1; y = 0; c_in = 0;
    #10;
    if (sum_f !== 1 || carry_f !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, carry = 1
    x = 1; y = 0; c_in = 1;
    #10;
    if (sum_f !== 0 || carry_f !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0 = 0, carry = 1
    x = 1; y = 1; c_in = 0;
    #10;
    if (sum_f !== 0 || carry_f !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, carry = 1
    x = 1; y = 1; c_in = 1;
    #10;
    if (sum_f !== 1 || carry_f !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule