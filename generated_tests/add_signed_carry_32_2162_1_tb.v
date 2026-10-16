`timescale 1ns/1ps

module tb_add_signed_carry_32_2162;

  reg [11:0] A;
  reg [13:0] B;
  reg CI;
  wire [13:0] Z;

  // Instantiate the module under test (uut)
  add_signed_carry_32_2162 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0, CI = 0
    A = 12'b000000000000; B = 14'b00000000000000; CI = 0;
    #10;
    if (Z !== 14'b00000000000000) $display("FAIL: Test case 1 failed");

    // Test case 2: A = 12'b000000000001 (1), B = 14'b00000000000001 (1), CI = 0
    A = 12'b000000000001; B = 14'b00000000000001; CI = 0;
    #10;
    if (Z !== 14'b00000000000010) $display("FAIL: Test case 2 failed");

    // Test case 3: A = 12'b111111111111 (-1), B = 14'b00000000000001 (1), CI = 0
    A = 12'b111111111111; B = 14'b00000000000001; CI = 0;
    #10;
    if (Z !== 14'b00000000000000) $display("FAIL: Test case 3 failed");

    // Test case 4: A = 12'b000000000010 (2), B = 14'b00000000000001 (1), CI = 1
    A = 12'b000000000010; B = 14'b00000000000001; CI = 1;
    #10;
    if (Z !== 14'b00000000000011) $display("FAIL: Test case 4 failed");

    // Test case 5: A = 12'b111111111110 (-2), B = 14'b00000000000001 (1), CI = 1
    A = 12'b111111111110; B = 14'b00000000000001; CI = 1;
    #10;
    if (Z !== 14'b00000000000000) $display("FAIL: Test case 5 failed");

    // Test case 6: A = 12'b000000000100 (4), B = 14'b00000000000010 (2), CI = 0
    A = 12'b000000000100; B = 14'b00000000000010; CI = 0;
    #10;
    if (Z !== 14'b00000000000110) $display("FAIL: Test case 6 failed");

    // Test case 7: A = 12'b111111111111 (-1), B = 14'b111111111111 (16383), CI = 0
    A = 12'b111111111111; B = 14'b111111111111; CI = 0;
    #10;
    if (Z !== 14'b111111111110) $display("FAIL: Test case 7 failed");

    // Test case 8: A = 12'b000000000000 (0), B = 14'b111111111111 (16383), CI = 1
    A = 12'b000000000000; B = 14'b111111111111; CI = 1;
    #10;
    if (Z !== 14'b000000000000) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule