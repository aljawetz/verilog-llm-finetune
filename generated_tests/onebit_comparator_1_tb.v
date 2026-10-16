`timescale 1ns/1ps

module tb_onebit_comparator;

  reg a_in;
  reg b_in;
  wire less;
  wire greater;
  wire equal;

  // Instantiate the module under test (uut)
  onebit_comparator uut (
    .a_in(a_in),
    .b_in(b_in),
    .less(less),
    .greater(greater),
    .equal(equal)
  );

  initial begin
    // Test case 1: a_in = 0, b_in = 0
    a_in = 0; b_in = 0;
    #10;
    if (less !== 0 || greater !== 0 || equal !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a_in = 0, b_in = 1
    a_in = 0; b_in = 1;
    #10;
    if (less !== 1 || greater !== 0 || equal !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a_in = 1, b_in = 0
    a_in = 1; b_in = 0;
    #10;
    if (less !== 0 || greater !== 1 || equal !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a_in = 1, b_in = 1
    a_in = 1; b_in = 1;
    #10;
    if (less !== 0 || greater !== 0 || equal !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule