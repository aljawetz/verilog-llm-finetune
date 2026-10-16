`timescale 1ns/1ps

module tb_add_unsigned_487_2218;
  reg [9:0] A;
  reg [9:0] B;
  wire [10:0] Z;

  // Instantiate the module under test (uut)
  add_unsigned_487_2218 uut (
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

    // Test case 4: A = 511, B = 511
    A = 10'b1111111111; 
    B = 10'b1111111111; 
    #10;
    if (Z !== 11'b11111111110) $display("FAIL: Test case 4 failed (A=511, B=511)"); 

    // Test case 5: A = 512, B = 512 (overflow case)
    A = 10'b1000000000; 
    B = 10'b1000000000; 
    #10;
    if (Z !== 11'b10000000000) $display("FAIL: Test case 5 failed (A=512, B=512)"); 

    // Test case 6: A = 255, B = 255
    A = 10'b0000111111; 
    B = 10'b0000111111; 
    #10;
    if (Z !== 11'b00011111110) $display("FAIL: Test case 6 failed (A=255, B=255)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule