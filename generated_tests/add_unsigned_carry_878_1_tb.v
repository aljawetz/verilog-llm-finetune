`timescale 1ns/1ps

module tb_add_unsigned_carry_878;

  reg [7:0] A;
  reg [7:0] B;
  reg CI;
  wire [8:0] Z;

  // Instantiate the module under test
  add_unsigned_carry_878 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0, CI = 0
    A = 8'b00000000; B = 8'b00000000; CI = 0;
    #10;
    if (Z !== 9'b000000000) $display("FAIL: Test case 1 failed, expected Z = 000000000, got Z = %b", Z);

    // Test case 2: A = 1, B = 1, CI = 0
    A = 8'b00000001; B = 8'b00000001; CI = 0;
    #10;
    if (Z !== 9'b000000010) $display("FAIL: Test case 2 failed, expected Z = 000000010, got Z = %b", Z);

    // Test case 3: A = 3, B = 5, CI = 0
    A = 8'b00000011; B = 8'b00000101; CI = 0;
    #10;
    if (Z !== 9'b000000100) $display("FAIL: Test case 3 failed, expected Z = 000000100, got Z = %b", Z);

    // Test case 4: A = 255, B = 1, CI = 0 (check carry)
    A = 8'b11111111; B = 8'b00000001; CI = 0;
    #10;
    if (Z !== 9'b000000000) $display("FAIL: Test case 4 failed, expected Z = 000000000, got Z = %b", Z);

    // Test case 5: A = 128, B = 128, CI = 0 (check carry)
    A = 8'b10000000; B = 8'b10000000; CI = 0;
    #10;
    if (Z !== 9'b000000000) $display("FAIL: Test case 5 failed, expected Z = 000000000, got Z = %b", Z);

    // Test case 6: A = 64, B = 64, CI = 1 (check carry with CI)
    A = 8'b01000000; B = 8'b01000000; CI = 1;
    #10;
    if (Z !== 9'b000000001) $display("FAIL: Test case 6 failed, expected Z = 000000001, got Z = %b", Z);

    // Test case 7: A = 7, B = 1, CI = 1
    A = 8'b00000111; B = 8'b00000001; CI = 1;
    #10;
    if (Z !== 9'b000010000) $display("FAIL: Test case 7 failed, expected Z = 000010000, got Z = %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule