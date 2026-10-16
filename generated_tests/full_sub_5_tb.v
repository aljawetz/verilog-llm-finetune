`timescale 1ns/1ps

module tb_full_sub;

  // Inputs
  reg x;
  reg y;
  reg bin;

  // Outputs
  wire diff;
  wire borrow;

  // Instantiate the Unit Under Test (UUT)
  full_sub uut (
    .x(x),
    .y(y),
    .bin(bin),
    .diff(diff),
    .borrow(borrow)
  );

  initial begin
    // Test case 1: x=0, y=0, bin=0
    x = 0; y = 0; bin = 0;
    #10;
    if (diff !== 0 || borrow !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: x=0, y=0, bin=1
    x = 0; y = 0; bin = 1;
    #10;
    if (diff !== 1 || borrow !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: x=0, y=1, bin=0
    x = 0; y = 1; bin = 0;
    #10;
    if (diff !== 1 || borrow !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: x=0, y=1, bin=1
    x = 0; y = 1; bin = 1;
    #10;
    if (diff !== 0 || borrow !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: x=1, y=0, bin=0
    x = 1; y = 0; bin = 0;
    #10;
    if (diff !== 1 || borrow !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: x=1, y=0, bin=1
    x = 1; y = 0; bin = 1;
    #10;
    if (diff !== 0 || borrow !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: x=1, y=1, bin=0
    x = 1; y = 1; bin = 0;
    #10;
    if (diff !== 0 || borrow !== 0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: x=1, y=1, bin=1
    x = 1; y = 1; bin = 1;
    #10;
    if (diff !== 1 || borrow !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule