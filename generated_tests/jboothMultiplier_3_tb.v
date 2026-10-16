`timescale 1ns/1ps

module tb_jboothMultiplier;

  reg signed [3:0] A;
  reg signed [3:0] B;
  wire signed [7:0] PRODUCT;

  jboothMultiplier uut (
    .PRODUCT(PRODUCT),
    .A(A),
    .B(B)
  );

  initial begin
    // Test case 1: 2 * 3 = 6
    A = 4'd2; B = 4'd3;
    #10;
    if (PRODUCT !== 8'd6) $display("FAIL: Expected 6, got %d", PRODUCT);

    // Test case 2: -2 * 3 = -6
    A = 4'd2; B = -4'd3;
    #10;
    if (PRODUCT !== -8'd6) $display("FAIL: Expected -6, got %d", PRODUCT);

    // Test case 3: 2 * -3 = -6
    A = -4'd2; B = 4'd3;
    #10;
    if (PRODUCT !== -8'd6) $display("FAIL: Expected -6, got %d", PRODUCT);

    // Test case 4: -2 * -3 = 6
    A = -4'd2; B = -4'd3;
    #10;
    if (PRODUCT !== 8'd6) $display("FAIL: Expected 6, got %d", PRODUCT);

    // Test case 5: 0 * 3 = 0
    A = 4'd0; B = 4'd3;
    #10;
    if (PRODUCT !== 8'd0) $display("FAIL: Expected 0, got %d", PRODUCT);

    // Test case 6: 2 * 0 = 0
    A = 4'd2; B = 4'd0;
    #10;
    if (PRODUCT !== 8'd0) $display("FAIL: Expected 0, got %d", PRODUCT);

    // Test case 7: 4 * 4 = 16
    A = 4'd4; B = 4'd4;
    #10;
    if (PRODUCT !== 8'd16) $display("FAIL: Expected 16, got %d", PRODUCT);

    // Test case 8: -4 * 4 = -16
    A = -4'd4; B = 4'd4;
    #10;
    if (PRODUCT !== -8'd16) $display("FAIL: Expected -16, got %d", PRODUCT);

    // Test case 9: 4 * -4 = -16
    A = 4'd4; B = -4'd4;
    #10;
    if (PRODUCT !== -8'd16) $display("FAIL: Expected -16, got %d", PRODUCT);

    // Test case 10: -4 * -4 = 16
    A = -4'd4; B = -4'd4;
    #10;
    if (PRODUCT !== 8'd16) $display("FAIL: Expected 16, got %d", PRODUCT);

    $display("PASS");
    $finish;
  end

endmodule