`timescale 1ns/1ps

module tb_add_unsigned_487_2232;

  reg [9:0] A;
  reg [9:0] B;
  wire [10:0] Z;

  // Instantiate the module under test (uut)
  add_unsigned_487_2232 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 10'b0000000000; 
    B = 10'b0000000000; 
    #10;
    if (Z !== 11'b00000000000) $display("FAIL: Test case 1 failed (A=0, B=0)");

    // Test case 2: A = 1, B = 1
    A = 10'b0000000001; 
    B = 10'b0000000001; 
    #10;
    if (Z !== 11'b00000000010) $display("FAIL: Test case 2 failed (A=1, B=1)");

    // Test case 3: A = 10, B = 20
    A = 10'b0000001010; 
    B = 10'b0000010100; 
    #10;
    if (Z !== 11'b0000011110) $display("FAIL: Test case 3 failed (A=10, B=20)");

    // Test case 4: A = 511, B = 511 (max unsigned 10-bit values)
    A = 10'b1111111111; 
    B = 10'b1111111111; 
    #10;
    if (Z !== 11'b11111111110) $display("FAIL: Test case 4 failed (A=511, B=511)");

    // Test case 5: A = 256, B = 256
    A = 10'b0100000000; 
    B = 10'b0100000000; 
    #10;
    if (Z !== 11'b10000000000) $display("FAIL: Test case 5 failed (A=256, B=256)");

    // Test case 6: A = 300, B = 200
    A = 10'b0100101100; 
    B = 10'b0011001000; 
    #10;
    if (Z !== 11'b01111101000) $display("FAIL: Test case 6 failed (A=300, B=200)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule