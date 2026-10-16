`timescale 1ns/1ps

module tb_add_unsigned_487_2227;
  reg [9:0] A;
  reg [9:0] B;
  wire [10:0] Z;

  // Instantiate the module under test (uut)
  add_unsigned_487_2227 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 10'b0000000000; 
    B = 10'b0000000000; 
    #10;
    if (Z !== 11'b00000000000) $display("FAIL: Test case 1 failed, expected Z = 0, got Z = %b", Z);

    // Test case 2: A = 1, B = 1
    A = 10'b0000000001; 
    B = 10'b0000000001; 
    #10;
    if (Z !== 11'b00000000010) $display("FAIL: Test case 2 failed, expected Z = 2, got Z = %b", Z);

    // Test case 3: A = 10, B = 5
    A = 10'b0000001010; 
    B = 10'b0000000101; 
    #10;
    if (Z !== 11'b0000001111) $display("FAIL: Test case 3 failed, expected Z = 15, got Z = %b", Z);

    // Test case 4: A = 255, B = 255
    A = 10'b1111111111; 
    B = 10'b1111111111; 
    #10;
    if (Z !== 11'b11111111110) $display("FAIL: Test case 4 failed, expected Z = 510, got Z = %b", Z);

    // Test case 5: A = 512, B = 512 (out of range for 10-bit inputs)
    A = 10'b1000000000; 
    B = 10'b1000000000; 
    #10;
    if (Z !== 11'b10000000000) $display("FAIL: Test case 5 failed, expected Z = 1024, got Z = %b", Z);

    // Test case 6: A = 511, B = 511 (maximum 10-bit input)
    A = 10'b1111111111; 
    B = 10'b1111111111; 
    #10;
    if (Z !== 11'b11111111110) $display("FAIL: Test case 6 failed, expected Z = 1022, got Z = %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule