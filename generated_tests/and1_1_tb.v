`timescale 1ns/1ps

module tb_and1;

  // Inputs
  reg a;
  reg b;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  and1 uut (
    .a(a),
    .b(b),
    .z(z)
  );

  initial begin
    // Test case 1: 0 AND 0
    a = 0; b = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 1 failed (0 AND 0)");
      $finish;
    end

    // Test case 2: 0 AND 1
    a = 0; b = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed (0 AND 1)");
      $finish;
    end

    // Test case 3: 1 AND 0
    a = 1; b = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 3 failed (1 AND 0)");
      $finish;
    end

    // Test case 4: 1 AND 1
    a = 1; b = 1;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 4 failed (1 AND 1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule