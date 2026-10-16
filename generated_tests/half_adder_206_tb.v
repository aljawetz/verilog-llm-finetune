`timescale 1ns/1ps

module tb_half_adder;

  reg x1;
  reg x2;
  wire c;
  wire s;

  // Instantiate the half_adder module
  half_adder uut (
    .x1(x1),
    .x2(x2),
    .c(c),
    .s(s)
  );

  initial begin
    // Test case 1: x1 = 0, x2 = 0
    x1 = 0; x2 = 0;
    #10;
    if (c !== 0 || s !== 0) begin
      $display("FAIL: Test case 1 failed (x1=0, x2=0)");
      $finish;
    end

    // Test case 2: x1 = 0, x2 = 1
    x1 = 0; x2 = 1;
    #10;
    if (c !== 0 || s !== 1) begin
      $display("FAIL: Test case 2 failed (x1=0, x2=1)");
      $finish;
    end

    // Test case 3: x1 = 1, x2 = 0
    x1 = 1; x2 = 0;
    #10;
    if (c !== 0 || s !== 1) begin
      $display("FAIL: Test case 3 failed (x1=1, x2=0)");
      $finish;
    end

    // Test case 4: x1 = 1, x2 = 1
    x1 = 1; x2 = 1;
    #10;
    if (c !== 1 || s !== 0) begin
      $display("FAIL: Test case 4 failed (x1=1, x2=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule