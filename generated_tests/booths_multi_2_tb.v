`timescale 1ns/1ps

module tb_booths_multi;

  reg signed [3:0] A;
  reg signed [3:0] B;
  wire signed [7:0] product;

  // Instantiate the module under test (uut)
  booths_multi uut (
    .product(product),
    .A(A),
    .B(B)
  );

  initial begin
    // Test case 1: A = 3, B = 2 (Expected product = 6)
    A = 4'd3; B = 4'd2;
    #10;
    if (product !== 8'd6) begin
      $display("FAIL: Test case 1 failed. Expected 6, got %d", product);
      $finish;
    end

    // Test case 2: A = -3, B = 2 (Expected product = -6)
    A = -4'd3; B = 4'd2;
    #10;
    if (product !== -8'd6) begin
      $display("FAIL: Test case 2 failed. Expected -6, got %d", product);
      $finish;
    end

    // Test case 3: A = 4, B = -2 (Expected product = -8)
    A = 4'd4; B = -4'd2;
    #10;
    if (product !== -8'd8) begin
      $display("FAIL: Test case 3 failed. Expected -8, got %d", product);
      $finish;
    end

    // Test case 4: A = -4, B = -2 (Expected product = 8)
    A = -4'd4; B = -4'd2;
    #10;
    if (product !== 8'd8) begin
      $display("FAIL: Test case 4 failed. Expected 8, got %d", product);
      $finish;
    end

    // Test case 5: A = 0, B = 5 (Expected product = 0)
    A = 4'd0; B = 4'd5;
    #10;
    if (product !== 8'd0) begin
      $display("FAIL: Test case 5 failed. Expected 0, got %d", product);
      $finish;
    end

    // Test case 6: A = 7, B = 1 (Expected product = 7)
    A = 4'd7; B = 4'd1;
    #10;
    if (product !== 8'd7) begin
      $display("FAIL: Test case 6 failed. Expected 7, got %d", product);
      $finish;
    end

    // Test case 7: A = -8, B = 1 (Expected product = -8)
    A = -4'd8; B = 4'd1;
    #10;
    if (product !== -8'd8) begin
      $display("FAIL: Test case 7 failed. Expected -8, got %d", product);
      $finish;
    end

    // Test case 8: A = 4, B = 4 (Expected product = 16)
    A = 4'd4; B = 4'd4;
    #10;
    if (product !== 8'd16) begin
      $display("FAIL: Test case 8 failed. Expected 16, got %d", product);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule