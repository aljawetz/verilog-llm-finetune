`timescale 1ns/1ps

module tb_half_sub;

  reg x;
  reg y;
  wire diff;
  wire borrow;

  // Instantiate the half_sub module
  half_sub uut (
    .x(x),
    .y(y),
    .diff(diff),
    .borrow(borrow)
  );

  initial begin
    // Test case 1: x = 0, y = 0
    x = 0; y = 0;
    #10;
    if (diff !== 0 || borrow !== 0) begin
      $display("FAIL: Test case 1 failed (x=0, y=0)");
      $finish;
    end

    // Test case 2: x = 0, y = 1
    x = 0; y = 1;
    #10;
    if (diff !== 1 || borrow !== 1) begin
      $display("FAIL: Test case 2 failed (x=0, y=1)");
      $finish;
    end

    // Test case 3: x = 1, y = 0
    x = 1; y = 0;
    #10;
    if (diff !== 1 || borrow !== 0) begin
      $display("FAIL: Test case 3 failed (x=1, y=0)");
      $finish;
    end

    // Test case 4: x = 1, y = 1
    x = 1; y = 1;
    #10;
    if (diff !== 0 || borrow !== 0) begin
      $display("FAIL: Test case 4 failed (x=1, y=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule