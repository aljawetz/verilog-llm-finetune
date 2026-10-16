`timescale 1ns/1ps

module tb_xor_gate;

  // Inputs
  reg a;
  reg b;

  // Output
  wire c;

  // Instantiate the Unit Under Test (UUT)
  xor_gate uut (
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: a = 0, b = 0 -> c should be 0
    a = 0; b = 0;
    #10;
    if (c !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1 -> c should be 1
    a = 0; b = 1;
    #10;
    if (c !== 1) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0 -> c should be 1
    a = 1; b = 0;
    #10;
    if (c !== 1) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1 -> c should be 0
    a = 1; b = 1;
    #10;
    if (c !== 0) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule