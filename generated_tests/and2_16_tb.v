`timescale 1ns/1ps

module tb_and2;

  // Inputs
  reg x;
  reg y;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  and2 uut (
    .z(z),
    .x(x),
    .y(y)
  );

  initial begin
    // Test case 1: 0 AND 0
    x = 0; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 1 failed (0 AND 0)");
      $finish;
    end

    // Test case 2: 0 AND 1
    x = 0; y = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed (0 AND 1)");
      $finish;
    end

    // Test case 3: 1 AND 0
    x = 1; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 3 failed (1 AND 0)");
      $finish;
    end

    // Test case 4: 1 AND 1
    x = 1; y = 1;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 4 failed (1 AND 1)");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule