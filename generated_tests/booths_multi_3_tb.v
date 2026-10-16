`timescale 1ns/1ps

module tb_booths_multi;

  reg signed [3:0] A;
  reg signed [3:0] B;
  wire signed [7:0] product;

  // Instantiate the module under test
  booths_multi uut (
    .product(product),
    .A(A),
    .B(B)
  );

  initial begin
    // Test case 1: 3 * 2
    A = 4'd3; B = 4'd2; #10;
    if (product !== 8'd6) begin
      $display("FAIL: Expected product of 3 * 2 to be 6, got %d", product);
      $finish;
    end

    // Test case 2: -3 * 2
    A = -4'd3; B = 4'd2; #10;
    if (product !== -8'd6) begin
      $display("FAIL: Expected product of -3 * 2 to be -6, got %d", product);
      $finish;
    end

    // Test case 3: 3 * -2
    A = 4'd3; B = -4'd2; #10;
    if (product !== -8'd6) begin
      $display("FAIL: Expected product of 3 * -2 to be -6, got %d", product);
      $finish;
    end

    // Test case 4: -3 * -2
    A = -4'd3; B = -4'd2; #10;
    if (product !== 8'd6) begin
      $display("FAIL: Expected product of -3 * -2 to be 6, got %d", product);
      $finish;
    end

    // Test case 5: 4 * 4
    A = 4'd4; B = 4'd4; #10;
    if (product !== 8'd16) begin
      $display("FAIL: Expected product of 4 * 4 to be 16, got %d", product);
      $finish;
    end

    // Test case 6: 7 * 1
    A = 4'd7; B = 4'd1; #10;
    if (product !== 8'd7) begin
      $display("FAIL: Expected product of 7 * 1 to be 7, got %d", product);
      $finish;
    end

    // Test case 7: 0 * 5
    A = 4'd0; B = 4'd5; #10;
    if (product !== 8'd0) begin
      $display("FAIL: Expected product of 0 * 5 to be 0, got %d", product);
      $finish;
    end

    // Test case 8: -8 * 1
    A = -4'd8; B = 4'd1; #10;
    if (product !== -8'd8) begin
      $display("FAIL: Expected product of -8 * 1 to be -8, got %d", product);
      $finish;
    end

    // Test case 9: 7 * -1
    A = 4'd7; B = -4'd1; #10;
    if (product !== -8'd7) begin
      $display("FAIL: Expected product of 7 * -1 to be -7, got %d", product);
      $finish;
    end

    // Test case 10: -4 * -4
    A = -4'd4; B = -4'd4; #10;
    if (product !== 8'd16) begin
      $display("FAIL: Expected product of -4 * -4 to be 16, got %d", product);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule