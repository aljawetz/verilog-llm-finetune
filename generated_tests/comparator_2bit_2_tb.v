`timescale 1ns/1ps

module tb_comparator_2bit;

  reg [1:0] a;
  reg [1:0] b;
  wire a_gt_b;
  wire a_lt_b;
  wire a_eq_b;

  // Instantiate the module under test
  comparator_2bit uut (
    .a(a),
    .b(b),
    .a_gt_b(a_gt_b),
    .a_lt_b(a_lt_b),
    .a_eq_b(a_eq_b)
  );

  initial begin
    // Test case 1: a = 00, b = 00
    a = 2'b00; b = 2'b00;
    #10;
    if (a_gt_b !== 0 || a_lt_b !== 0 || a_eq_b !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a = 01, b = 00
    a = 2'b01; b = 2'b00;
    #10;
    if (a_gt_b !== 1 || a_lt_b !== 0 || a_eq_b !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a = 00, b = 01
    a = 2'b00; b = 2'b01;
    #10;
    if (a_gt_b !== 0 || a_lt_b !== 1 || a_eq_b !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 10, b = 01
    a = 2'b10; b = 2'b01;
    #10;
    if (a_gt_b !== 1 || a_lt_b !== 0 || a_eq_b !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a = 01, b = 10
    a = 2'b01; b = 2'b10;
    #10;
    if (a_gt_b !== 0 || a_lt_b !== 1 || a_eq_b !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a = 11, b = 11
    a = 2'b11; b = 2'b11;
    #10;
    if (a_gt_b !== 0 || a_lt_b !== 0 || a_eq_b !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: a = 10, b = 10
    a = 2'b10; b = 2'b10;
    #10;
    if (a_gt_b !== 0 || a_lt_b !== 0 || a_eq_b !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: a = 11, b = 10
    a = 2'b11; b = 2'b10;
    #10;
    if (a_gt_b !== 1 || a_lt_b !== 0 || a_eq_b !== 0) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // Test case 9: a = 10, b = 11
    a = 2'b10; b = 2'b11;
    #10;
    if (a_gt_b !== 0 || a_lt_b !== 1 || a_eq_b !== 0) begin
      $display("FAIL: Test case 9 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule