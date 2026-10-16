`timescale 1ns/1ps

module tb_jboothMultiplier;

  reg signed [3:0] A;
  reg signed [3:0] B;
  wire signed [7:0] PRODUCT;

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
    if (PRODUCT !== 8'b00000011) $display("FAIL: Expected 3, got %d", PRODUCT);
    
    // Test case 2: -3 * 2
    A = 4'b1101; // -3
    B = 4'b0010; // 2
    #10;
    if (PRODUCT !== 8'b11111110) $display("FAIL: Expected -6, got %d", PRODUCT);
    
    // Test case 3: 3 * -2
    A = 4'b0011; // 3
    B = 4'b1101; // -2
    #10;
    if (PRODUCT !== 8'b11111110) $display("FAIL: Expected -6, got %d", PRODUCT);
    
    // Test case 4: -3 * -2
    A = 4'b1101; // -3
    B = 4'b1101; // -2
    #10;
    if (PRODUCT !== 8'b00000110) $display("FAIL: Expected 6, got %d", PRODUCT);
    
    // Test case 5: 0 * 5
    A = 4'b0000; // 0
    B = 4'b0101; // 5
    #10;
    if (PRODUCT !== 8'b00000000) $display("FAIL: Expected 0, got %d", PRODUCT);
    
    // Test case 6: 5 * 0
    A = 4'b0101; // 5
    B = 4'b0000; // 0
    #10;
    if (PRODUCT !== 8'b00000000) $display("FAIL: Expected 0, got %d", PRODUCT);
    
    // Test case 7: 4 * 4
    A = 4'b0100; // 4
    B = 4'b0100; // 4
    #10;
    if (PRODUCT !== 8'b00011000) $display("FAIL: Expected 16, got %d", PRODUCT);
    
    // Test case 8: -4 * -4
    A = 4'b1100; // -4
    B = 4'b1100; // -4
    #10;
    if (PRODUCT !== 8'b00011000) $display("FAIL: Expected 16, got %d", PRODUCT);
    
    // Test case 9: -4 * 4
    A = 4'b1100; // -4
    B = 4'b0100; // 4
    #10;
    if (PRODUCT !== 8'b11110000) $display("FAIL: Expected -16, got %d", PRODUCT);
    
    // Test case 10: 4 * -4
    A = 4'b0100; // 4
    B = 4'b1100; // -4
    #10;
    if (PRODUCT !== 8'b11110000) $display("FAIL: Expected -16, got %d", PRODUCT);
    
    $display("PASS");
    $finish;
  end

endmodule