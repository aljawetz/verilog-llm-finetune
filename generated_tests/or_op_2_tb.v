`timescale 1ns/1ps

module tb_or_op;
  reg [31:0] A;
  reg [31:0] B;
  wire [31:0] Z;

  // Instantiate the module under test
  or_op uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 32'b00000000000000000000000000000000;
    B = 32'b00000000000000000000000000000000;
    #10;
    if (Z !== 32'b00000000000000000000000000000000) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: A = 0, B = 1
    A = 32'b00000000000000000000000000000000;
    B = 32'b00000000000000000000000000000001;
    #10;
    if (Z !== 32'b00000000000000000000000000000001) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: A = 1, B = 0
    A = 32'b00000000000000000000000000000001;
    B = 32'b00000000000000000000000000000000;
    #10;
    if (Z !== 32'b00000000000000000000000000000001) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: A = 1, B = 1
    A = 32'b00000000000000000000000000000001;
    B = 32'b00000000000000000000000000000001;
    #10;
    if (Z !== 32'b00000000000000000000000000000001) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: A = 0xFFFFFFFF, B = 0x00000000
    A = 32'b11111111111111111111111111111111;
    B = 32'b00000000000000000000000000000000;
    #10;
    if (Z !== 32'b11111111111111111111111111111111) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: A = 0xAAAAAAAA, B = 0x55555555
    A = 32'b10101010101010101010101010101010;
    B = 32'b01010101010101010101010101010101;
    #10;
    if (Z !== 32'b11111111111111111111111111111111) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: A = 0x12345678, B = 0x87654321
    A = 32'b00010010001101000101011001111000;
    B = 32'b10000111011001010010001100100001;
    #10;
    if (Z !== 32'b10010111011101010111011101111001) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule