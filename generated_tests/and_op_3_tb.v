`timescale 1ns/1ps

module tb_and_op;
  reg [31:0] A;
  reg [31:0] B;
  wire [31:0] Z;

  // Instantiate the module under test
  and_op uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: Basic AND operation
    A = 32'hFFFFFFFF; // All bits set
    B = 32'h00000000; // No bits set
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 1 failed. Expected 0x00000000, got 0x%h", Z);
      $finish;
    end

    // Test case 2: Both inputs are zero
    A = 32'h00000000;
    B = 32'h00000000;
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 2 failed. Expected 0x00000000, got 0x%h", Z);
      $finish;
    end

    // Test case 3: All bits set
    A = 32'hFFFFFFFF;
    B = 32'hFFFFFFFF;
    #10;
    if (Z !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 3 failed. Expected 0xFFFFFFFF, got 0x%h", Z);
      $finish;
    end

    // Test case 4: Random values
    A = 32'hA5A5A5A5; // 10100101101001011010010110100101
    B = 32'h5A5A5A5A; // 01011010010110100101101001011010
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 4 failed. Expected 0x00000000, got 0x%h", Z);
      $finish;
    end

    // Test case 5: Mixed values
    A = 32'hF0F0F0F0; // 11110000111100001111000011110000
    B = 32'h0F0F0F0F; // 00001111000011110000111100001111
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 5 failed. Expected 0x00000000, got 0x%h", Z);
      $finish;
    end

    // Test case 6: Alternating bits
    A = 32'hAAAAAAAA; // 10101010101010101010101010101010
    B = 32'h55555555; // 01010101010101010101010101010101
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 6 failed. Expected 0x00000000, got 0x%h", Z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule