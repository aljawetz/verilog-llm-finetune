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
    B = 32'hFFFFFFFF; // All bits set
    #10;
    if (Z !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 1 failed, expected Z = 32'hFFFFFFFF, got Z = %h", Z);
      $finish;
    end

    // Test case 2: One input is zero
    A = 32'hFFFFFFFF; // All bits set
    B = 32'h00000000; // All bits clear
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 2 failed, expected Z = 32'h00000000, got Z = %h", Z);
      $finish;
    end

    // Test case 3: Random values
    A = 32'hA5A5A5A5; // Random pattern
    B = 32'h5A5A5A5A; // Random pattern
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 3 failed, expected Z = 32'h00000000, got Z = %h", Z);
      $finish;
    end

    // Test case 4: Mixed values
    A = 32'hF0F0F0F0; // 1111 0000 1111 0000 1111 0000 1111 0000
    B = 32'h0F0F0F0F; // 0000 1111 0000 1111 0000 1111 0000 1111
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 4 failed, expected Z = 32'h00000000, got Z = %h", Z);
      $finish;
    end

    // Test case 5: All bits set and cleared
    A = 32'hFFFFFFFF; // All bits set
    B = 32'hAAAAAAAA; // Alternating bits
    #10;
    if (Z !== 32'hAAAAAAAA) begin
      $display("FAIL: Test case 5 failed, expected Z = 32'hAAAAAAAA, got Z = %h", Z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule