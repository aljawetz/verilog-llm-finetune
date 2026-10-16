`timescale 1ns/1ps

module tb_jboothMultiplier;

  reg [3:0] A;
  reg [3:0] B;
  wire [7:0] PRODUCT;

  // Instantiate the Unit Under Test (UUT)
  jboothMultiplier uut (
    .PRODUCT(PRODUCT),
    .A(A),
    .B(B)
  );

  initial begin
    // Test case 1: 3 * 2
    A = 4'b0011; // 3
    B = 4'b0010; // 2
    #10;
    if (PRODUCT !== 8'b00000010) $display("FAIL: Expected 2 for A=3, B=2, got %b", PRODUCT);

    // Test case 2: 4 * 3
    A = 4'b0100; // 4
    B = 4'b0011; // 3
    #10;
    if (PRODUCT !== 8'b00001100) $display("FAIL: Expected 12 for A=4, B=3, got %b", PRODUCT);

    // Test case 3: 5 * -2
    A = 4'b0101; // 5
    B = 4'b1110; // -2 (two's complement)
    #10;
    if (PRODUCT !== 8'b11111010) $display("FAIL: Expected -10 for A=5, B=-2, got %b", PRODUCT);

    // Test case 4: -3 * 3
    A = 4'b1101; // -3 (two's complement)
    B = 4'b0011; // 3
    #10;
    if (PRODUCT !== 8'b11111101) $display("FAIL: Expected -9 for A=-3, B=3, got %b", PRODUCT);

    // Test case 5: 0 * 5
    A = 4'b0000; // 0
    B = 4'b0101; // 5
    #10;
    if (PRODUCT !== 8'b00000000) $display("FAIL: Expected 0 for A=0, B=5, got %b", PRODUCT);

    // Test case 6: 7 * 1
    A = 4'b0111; // 7
    B = 4'b0001; // 1
    #10;
    if (PRODUCT !== 8'b00000111) $display("FAIL: Expected 7 for A=7, B=1, got %b", PRODUCT);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule