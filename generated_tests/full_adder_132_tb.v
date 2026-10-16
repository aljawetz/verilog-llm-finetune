`timescale 1ns/1ps

module tb_full_adder;

  // Inputs
  reg x;
  reg y;
  reg c_in;

  // Outputs
  wire s;
  wire c_out;

  // Instantiate the Unit Under Test (UUT)
  full_adder uut (
    .x(x),
    .y(y),
    .c_in(c_in),
    .s(s),
    .c_out(c_out)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, carry = 0
    x = 0; y = 0; c_in = 0;
    #10;
    if (s !== 0 || c_out !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 0 + 0 + 1 = 1, carry = 0
    x = 0; y = 0; c_in = 1;
    #10;
    if (s !== 1 || c_out !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 0 + 1 + 0 = 1, carry = 0
    x = 0; y = 1; c_in = 0;
    #10;
    if (s !== 1 || c_out !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 0 + 1 + 1 = 0, carry = 1
    x = 0; y = 1; c_in = 1;
    #10;
    if (s !== 0 || c_out !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 1 + 0 + 0 = 1, carry = 0
    x = 1; y = 0; c_in = 0;
    #10;
    if (s !== 1 || c_out !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 1 + 0 + 1 = 0, carry = 1
    x = 1; y = 0; c_in = 1;
    #10;
    if (s !== 0 || c_out !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 1 + 1 + 0 = 0, carry = 1
    x = 1; y = 1; c_in = 0;
    #10;
    if (s !== 0 || c_out !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: 1 + 1 + 1 = 1, carry = 1
    x = 1; y = 1; c_in = 1;
    #10;
    if (s !== 1 || c_out !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule