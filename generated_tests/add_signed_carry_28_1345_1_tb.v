`timescale 1ns/1ps

module tb_add_signed_carry_28_1345;

  // Inputs
  reg [12:0] A;
  reg [13:0] B;
  reg CI;

  // Outputs
  wire [13:0] Z;

  // Instantiate the Unit Under Test (UUT)
  add_signed_carry_28_1345 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0, CI = 0
    A = 12'b000000000000; 
    B = 14'b00000000000000; 
    CI = 0;
    #10;
    if (Z !== 14'b00000000000000) $display("FAIL: Test case 1 failed");

    // Test case 2: A = 1, B = 1, CI = 0
    A = 12'b000000000001; 
    B = 14'b00000000000001; 
    CI = 0;
    #10;
    if (Z !== 14'b00000000000010) $display("FAIL: Test case 2 failed");

    // Test case 3: A = 4095 (max 12-bit), B = 8191 (max 13-bit), CI = 0
    A = 12'b111111111111; 
    B = 14'b00111111111111; 
    CI = 0;
    #10;
    if (Z !== 14'b01011111111110) $display("FAIL: Test case 3 failed");

    // Test case 4: A = 0, B = 8191 (max 13-bit), CI = 1
    A = 12'b000000000000; 
    B = 14'b00111111111111; 
    CI = 1;
    #10;
    if (Z !== 14'b00111111111111) $display("FAIL: Test case 4 failed");

    // Test case 5: A = -1 (two's complement), B = 1, CI = 0
    A = 12'b111111111111; 
    B = 14'b00000000000001; 
    CI = 0;
    #10;
    if (Z !== 14'b00000000000000) $display("FAIL: Test case 5 failed");

    // Test case 6: A = 1, B = -1 (two's complement), CI = 0
    A = 12'b000000000001; 
    B = 14'b11111111111111; 
    CI = 0;
    #10;
    if (Z !== 14'b00000000000000) $display("FAIL: Test case 6 failed");

    // Test case 7: A = 2048, B = 2048, CI = 1
    A = 12'b100000000000; 
    B = 14'b00000000001000; 
    CI = 1;
    #10;
    if (Z !== 14'b10000000001000) $display("FAIL: Test case 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule