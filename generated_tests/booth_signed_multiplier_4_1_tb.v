`timescale 1ns/1ps

module tb_booth_signed_multiplier_4;
  reg signed [3:0] A;
  reg signed [3:0] B;
  wire signed [7:0] product;

  // Instantiate the Unit Under Test (UUT)
  booth_signed_multiplier_4 uut (
    .product(product),
    .A(A),
    .B(B)
  );

  initial begin
    // Test case 1: A = 3, B = 2
    A = 4'd3; B = 4'd2;
    #10;
    if (product !== 8'd6) $display("FAIL: Test case 1 failed, expected 6 but got %d", product);

    // Test case 2: A = -3, B = 2
    A = -4'd3; B = 4'd2;
    #10;
    if (product !== -8'd6) $display("FAIL: Test case 2 failed, expected -6 but got %d", product);

    // Test case 3: A = 3, B = -2
    A = 4'd3; B = -4'd2;
    #10;
    if (product !== -8'd6) $display("FAIL: Test case 3 failed, expected -6 but got %d", product);

    // Test case 4: A = -3, B = -2
    A = -4'd3; B = -4'd2;
    #10;
    if (product !== 8'd6) $display("FAIL: Test case 4 failed, expected 6 but got %d", product);

    // Test case 5: A = 4, B = 4
    A = 4'd4; B = 4'd4;
    #10;
    if (product !== 8'd16) $display("FAIL: Test case 5 failed, expected 16 but got %d", product);

    // Test case 6: A = 8, B = 1
    A = 4'd8; B = 4'd1;
    #10;
    if (product !== -8'd8) $display("FAIL: Test case 6 failed, expected -8 but got %d", product);

    // Test case 7: A = -8, B = 1
    A = -4'd8; B = 4'd1;
    #10;
    if (product !== 8'd8) $display("FAIL: Test case 7 failed, expected 8 but got %d", product);

    // Test case 8: A = 0, B = 0
    A = 4'd0; B = 4'd0;
    #10;
    if (product !== 8'd0) $display("FAIL: Test case 8 failed, expected 0 but got %d", product);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule