`timescale 1ns/1ps

module tb_add_unsigned_487_2222;

  // Inputs
  reg [9:0] A;
  reg [9:0] B;

  // Outputs
  wire [10:0] Z;

  // Instantiate the Unit Under Test (UUT)
  add_unsigned_487_2222 uut (
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

    // Test case 2: A = 5, B = 3
    A = 10'b0000000101; 
    B = 10'b0000000011; 
    #10;
    if (Z !== 11'b0000001000) $display("FAIL: Test case 2 failed, expected Z = 8, got Z = %b", Z);

    // Test case 3: A = 10, B = 20
    A = 10'b0000001010; 
    B = 10'b0000010100; 
    #10;
    if (Z !== 11'b0000011110) $display("FAIL: Test case 3 failed, expected Z = 30, got Z = %b", Z);

    // Test case 4: A = 255, B = 255
    A = 10'b1111111111; 
    B = 10'b1111111111; 
    #10;
    if (Z !== 11'b11111111110) $display("FAIL: Test case 4 failed, expected Z = 510, got Z = %b", Z);

    // Test case 5: A = 512, B = 512 (out of range for 10-bit inputs)
    A = 10'b1111111111; 
    B = 10'b1111111111; 
    #10;
    if (Z !== 11'b11111111110) $display("FAIL: Test case 5 failed, expected Z = 510, got Z = %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule