`timescale 1ns/1ps

module tb_add_unsigned_487_2221;

  reg [9:0] A;
  reg [9:0] B;
  wire [10:0] Z;

  // Instantiate the module under test
  add_unsigned_487_2221 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 10'b0000000000; 
    B = 10'b0000000000; 
    #10;
    if (Z !== 11'b00000000000) $display("FAIL: Test case 1 failed, expected 0, got %b", Z);

    // Test case 2: A = 1, B = 1
    A = 10'b0000000001; 
    B = 10'b0000000001; 
    #10;
    if (Z !== 11'b00000000010) $display("FAIL: Test case 2 failed, expected 2, got %b", Z);

    // Test case 3: A = 10, B = 5
    A = 10'b0000001010; 
    B = 10'b0000000101; 
    #10;
    if (Z !== 11'b0000001111) $display("FAIL: Test case 3 failed, expected 15, got %b", Z);

    // Test case 4: A = 255, B = 255
    A = 10'b1111111111; 
    B = 10'b1111111111; 
    #10;
    if (Z !== 11'b11111111110) $display("FAIL: Test case 4 failed, expected 510, got %b", Z);

    // Test case 5: A = 512, B = 512 (overflow case)
    A = 10'b1000000000; 
    B = 10'b1000000000; 
    #10;
    if (Z !== 11'b10000000000) $display("FAIL: Test case 5 failed, expected 1024, got %b", Z);

    // Test case 6: A = 300, B = 200
    A = 10'b0100101100; 
    B = 10'b0011001000; 
    #10;
    if (Z !== 11'b0111110100) $display("FAIL: Test case 6 failed, expected 500, got %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule