`timescale 1ns/1ps

module tb_nbitcomparator;

  reg [7:0] a;
  reg [7:0] b;
  wire a_greater;
  wire a_lesser;
  wire equal;

  // Instantiate the module under test (uut)
  nbitcomparator uut (
    .a(a),
    .b(b),
    .a_greater(a_greater),
    .a_lesser(a_lesser),
    .equal(equal)
  );

  initial begin
    // Test case 1: a = 5, b = 3 (a > b)
    a = 8'd5; b = 8'd3;
    #10;
    if (a_greater !== 1'b1 || a_lesser !== 1'b0 || equal !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a = 3, b = 5 (a < b)
    a = 8'd3; b = 8'd5;
    #10;
    if (a_greater !== 1'b0 || a_lesser !== 1'b1 || equal !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a = 5, b = 5 (a == b)
    a = 8'd5; b = 8'd5;
    #10;
    if (a_greater !== 1'b0 || a_lesser !== 1'b0 || equal !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 0, b = 255 (a < b)
    a = 8'd0; b = 8'd255;
    #10;
    if (a_greater !== 1'b0 || a_lesser !== 1'b1 || equal !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a = 255, b = 0 (a > b)
    a = 8'd255; b = 8'd0;
    #10;
    if (a_greater !== 1'b1 || a_lesser !== 1'b0 || equal !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a = 128, b = 128 (a == b)
    a = 8'd128; b = 8'd128;
    #10;
    if (a_greater !== 1'b0 || a_lesser !== 1'b0 || equal !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule