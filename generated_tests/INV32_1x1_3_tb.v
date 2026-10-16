`timescale 1ns/1ps

module tb_INV32_1x1;

  // Inputs
  reg [31:0] A;

  // Outputs
  wire [31:0] Y;

  // Instantiate the Unit Under Test (UUT)
  INV32_1x1 uut (
    .Y(Y),
    .A(A)
  );

  initial begin
    // Test case 1: All bits set to 0
    A = 32'b00000000000000000000000000000000;
    #10;
    if (Y !== 32'b11111111111111111111111111111111) begin
      $display("FAIL: Test case 1 failed. Expected Y = 32'b11111111111111111111111111111111, got Y = %b", Y);
      $finish;
    end

    // Test case 2: All bits set to 1
    A = 32'b11111111111111111111111111111111;
    #10;
    if (Y !== 32'b00000000000000000000000000000000) begin
      $display("FAIL: Test case 2 failed. Expected Y = 32'b00000000000000000000000000000000, got Y = %b", Y);
      $finish;
    end

    // Test case 3: Alternating bits
    A = 32'b10101010101010101010101010101010;
    #10;
    if (Y !== 32'b01010101010101010101010101010101) begin
      $display("FAIL: Test case 3 failed. Expected Y = 32'b01010101010101010101010101010101, got Y = %b", Y);
      $finish;
    end

    // Test case 4: Random bits
    A = 32'b11001100110011001100110011001100;
    #10;
    if (Y !== 32'b00110011001100110011001100110011) begin
      $display("FAIL: Test case 4 failed. Expected Y = 32'b00110011001100110011001100110011, got Y = %b", Y);
      $finish;
    end

    // Test case 5: All bits set to 0xFFFFFFFF
    A = 32'hFFFFFFFF;
    #10;
    if (Y !== 32'h00000000) begin
      $display("FAIL: Test case 5 failed. Expected Y = 32'h00000000, got Y = %h", Y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule