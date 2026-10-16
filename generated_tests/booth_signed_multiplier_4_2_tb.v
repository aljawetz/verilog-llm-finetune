`timescale 1ns/1ps

module tb_booth_signed_multiplier_4;

  reg [3:0] A;
  reg [3:0] B;
  wire [7:0] product;

  booth_signed_multiplier_4 uut (
    .product(product),
    .A(A),
    .B(B)
  );

  initial begin
    // Test case 1: A = 3, B = 2 (3 * 2 = 6)
    A = 4'd3; B = 4'd2; #10;
    if (product !== 8'd6) begin
      $display("FAIL: Expected product 6, got %d", product);
      $finish;
    end

    // Test case 2: A = -3, B = 2 (-3 * 2 = -6)
    A = 4'd13; B = 4'd2; #10; // -3 in 4-bit signed
    if (product !== 8'd250) begin // -6 in 8-bit signed
      $display("FAIL: Expected product -6, got %d", product);
      $finish;
    end

    // Test case 3: A = 4, B = -2 (4 * -2 = -8)
    A = 4'd4; B = 4'd14; #10; // -2 in 4-bit signed
    if (product !== 8'd248) begin // -8 in 8-bit signed
      $display("FAIL: Expected product -8, got %d", product);
      $finish;
    end

    // Test case 4: A = 2, B = 8 (2 * 8 = 16, should flip sign)
    A = 4'd2; B = 4'd8; #10;
    if (product !== 8'd240) begin // -16 in 8-bit signed
      $display("FAIL: Expected product -16, got %d", product);
      $finish;
    end

    // Test case 5: A = -4, B = -2 (-4 * -2 = 8)
    A = 4'd12; B = 4'd14; #10; // -4 and -2 in 4-bit signed
    if (product !== 8'd8) begin
      $display("FAIL: Expected product 8, got %d", product);
      $finish;
    end

    // Test case 6: A = 0, B = 0 (0 * 0 = 0)
    A = 4'd0; B = 4'd0; #10;
    if (product !== 8'd0) begin
      $display("FAIL: Expected product 0, got %d", product);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule