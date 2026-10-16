`timescale 1ns/1ps

module tb_half_subtractor;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire difference;
  wire borrow;

  // Instantiate the Unit Under Test (UUT)
  half_subtractor uut (
    .a(a),
    .b(b),
    .difference(difference),
    .borrow(borrow)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (difference !== 0 || borrow !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (difference !== 1 || borrow !== 1) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (difference !== 1 || borrow !== 0) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (difference !== 0 || borrow !== 0) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule