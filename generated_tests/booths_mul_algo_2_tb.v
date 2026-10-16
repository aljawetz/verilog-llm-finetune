`timescale 1ns/1ps

module tb_booths_mul_algo;

  reg signed [3:0] X;
  reg signed [3:0] Y;
  wire signed [7:0] Z;

  // Instantiate the module under test (uut)
  booths_mul_algo uut (
    .X(X),
    .Y(Y),
    .Z(Z)
  );

  initial begin
    // Test cases
    // Test case 1: 3 * 2 = 6
    X = 4'd3; Y = 4'd2; #10;
    if (Z !== 8'd6) $display("FAIL: Expected 6, got %d", Z);

    // Test case 2: -3 * 2 = -6
    X = -4'd3; Y = 4'd2; #10;
    if (Z !== -8'd6) $display("FAIL: Expected -6, got %d", Z);

    // Test case 3: 3 * -2 = -6
    X = 4'd3; Y = -4'd2; #10;
    if (Z !== -8'd6) $display("FAIL: Expected -6, got %d", Z);

    // Test case 4: -3 * -2 = 6
    X = -4'd3; Y = -4'd2; #10;
    if (Z !== 8'd6) $display("FAIL: Expected 6, got %d", Z);

    // Test case 5: 4 * 4 = 16
    X = 4'd4; Y = 4'd4; #10;
    if (Z !== 8'd16) $display("FAIL: Expected 16, got %d", Z);

    // Test case 6: 8 * 1 = 8
    X = 4'd8; Y = 4'd1; #10;
    if (Z !== 8'd8) $display("FAIL: Expected 8, got %d", Z);

    // Test case 7: -8 * 1 = -8
    X = -4'd8; Y = 4'd1; #10;
    if (Z !== -8'd8) $display("FAIL: Expected -8, got %d", Z);

    // Test case 8: 0 * 5 = 0
    X = 4'd0; Y = 4'd5; #10;
    if (Z !== 8'd0) $display("FAIL: Expected 0, got %d", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule