`timescale 1ns/1ps

module tb_xor_op;
  reg [31:0] A;
  reg [31:0] B;
  wire [31:0] Z;

  // Instantiate the module under test
  xor_op uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 32'h00000000; 
    B = 32'h00000000; 
    #10;
    if (Z !== 32'h00000000) $display("FAIL: Test case 1 failed");

    // Test case 2: A = 0, B = 1
    A = 32'h00000000; 
    B = 32'hFFFFFFFF; 
    #10;
    if (Z !== 32'hFFFFFFFF) $display("FAIL: Test case 2 failed");

    // Test case 3: A = 1, B = 1
    A = 32'hFFFFFFFF; 
    B = 32'hFFFFFFFF; 
    #10;
    if (Z !== 32'h00000000) $display("FAIL: Test case 3 failed");

    // Test case 4: A = 0xAAAAAAAA, B = 0x55555555
    A = 32'hAAAAAAAA; 
    B = 32'h55555555; 
    #10;
    if (Z !== 32'hFFFFFFFF) $display("FAIL: Test case 4 failed");

    // Test case 5: A = 0xFFFFFFFF, B = 0x00000000
    A = 32'hFFFFFFFF; 
    B = 32'h00000000; 
    #10;
    if (Z !== 32'hFFFFFFFF) $display("FAIL: Test case 5 failed");

    // Test case 6: A = 0x12345678, B = 0x87654321
    A = 32'h12345678; 
    B = 32'h87654321; 
    #10;
    if (Z !== 32'h955A1D59) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule