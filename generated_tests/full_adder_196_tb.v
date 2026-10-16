`timescale 1ns/1ps

module tb_full_adder;

  // Inputs
  reg a;
  reg b;
  reg c_in;

  // Outputs
  wire s0;
  wire c0;

  // Instantiate the Unit Under Test (UUT)
  full_adder uut (
    .s0(s0),
    .c0(c0),
    .a(a),
    .b(b),
    .c_in(c_in)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, carry = 0
    a = 0; b = 0; c_in = 0;
    #10;
    if (s0 !== 0 || c0 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 0 + 0 + 1 = 1, carry = 0
    a = 0; b = 0; c_in = 1;
    #10;
    if (s0 !== 1 || c0 !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 0 + 1 + 0 = 1, carry = 0
    a = 0; b = 1; c_in = 0;
    #10;
    if (s0 !== 1 || c0 !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 0 + 1 + 1 = 0, carry = 1
    a = 0; b = 1; c_in = 1;
    #10;
    if (s0 !== 0 || c0 !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 1 + 0 + 0 = 1, carry = 0
    a = 1; b = 0; c_in = 0;
    #10;
    if (s0 !== 1 || c0 !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 1 + 0 + 1 = 0, carry = 1
    a = 1; b = 0; c_in = 1;
    #10;
    if (s0 !== 0 || c0 !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 1 + 1 + 0 = 0, carry = 1
    a = 1; b = 1; c_in = 0;
    #10;
    if (s0 !== 0 || c0 !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: 1 + 1 + 1 = 1, carry = 1
    a = 1; b = 1; c_in = 1;
    #10;
    if (s0 !== 1 || c0 !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule