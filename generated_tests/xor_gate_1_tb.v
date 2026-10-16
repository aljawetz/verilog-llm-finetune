`timescale 1ns/1ps

module tb_xor_gate;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire z;

  // Instantiate the Unit Under Test (UUT)
  xor_gate uut (
    .a(a),
    .b(b),
    .z(z)
  );

  initial begin
    // Test case 1: a = 0, b = 0 => z should be 0
    a = 0; b = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1 => z should be 1
    a = 0; b = 1;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0 => z should be 1
    a = 1; b = 0;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1 => z should be 0
    a = 1; b = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule