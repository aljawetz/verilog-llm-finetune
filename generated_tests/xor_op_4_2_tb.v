`timescale 1ns/1ps

module tb_xor_op_4;
  reg [31:0] A;
  reg [31:0] B;
  wire [31:0] Z;

  // Instantiate the module under test
  xor_op_4 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: Simple XOR
    A = 32'hFFFFFFFF; // All bits set
    B = 32'h00000000; // All bits clear
    #10;
    if (Z !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Alternating bits
    A = 32'hAAAAAAAA; // 10101010...
    B = 32'h55555555; // 01010101...
    #10;
    if (Z !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: All bits clear
    A = 32'h00000000; // All bits clear
    B = 32'h00000000; // All bits clear
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Random values
    A = 32'h12345678; // Random value
    B = 32'h87654321; // Random value
    #10;
    if (Z !== (A ^ B)) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Edge case with single bits
    A = 32'h00000001; // Only LSB set
    B = 32'h00000001; // Only LSB set
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Edge case with different single bits
    A = 32'h00000001; // Only LSB set
    B = 32'h00000000; // LSB clear
    #10;
    if (Z !== 32'h00000001) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule