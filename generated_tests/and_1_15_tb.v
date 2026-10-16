`timescale 1ns/1ps

module tb_and_1;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire c;

  // Instantiate the Unit Under Test (UUT)
  and_1 uut (
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test Case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (c !== 0) begin
      $display("FAIL: Test Case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test Case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (c !== 0) begin
      $display("FAIL: Test Case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test Case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (c !== 0) begin
      $display("FAIL: Test Case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test Case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (c !== 1) begin
      $display("FAIL: Test Case 4 failed (a=1, b=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule