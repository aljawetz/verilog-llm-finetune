`timescale 1ns/1ps

module tb_add_unsigned_carry_886;

  reg [7:0] A;
  reg [7:0] B;
  reg CI;
  wire [8:0] Z;

  // Instantiate the module under test
  add_unsigned_carry_886 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0
    A = 8'b00000000; B = 8'b00000000; CI = 1'b0;
    #10;
    if (Z !== 9'b000000000) $display("FAIL: Test case 1 failed, expected 0, got %b", Z);

    // Test case 2: 1 + 1 + 0 = 2
    A = 8'b00000001; B = 8'b00000001; CI = 1'b0;
    #10;
    if (Z !== 9'b000000010) $display("FAIL: Test case 2 failed, expected 2, got %b", Z);

    // Test case 3: 255 + 1 + 0 = 256
    A = 8'b11111111; B = 8'b00000001; CI = 1'b0;
    #10;
    if (Z !== 9'b000001000) $display("FAIL: Test case 3 failed, expected 256, got %b", Z);

    // Test case 4: 128 + 128 + 0 = 256
    A = 8'b10000000; B = 8'b10000000; CI = 1'b0;
    #10;
    if (Z !== 9'b000001000) $display("FAIL: Test case 4 failed, expected 256, got %b", Z);

    // Test case 5: 255 + 255 + 0 = 510
    A = 8'b11111111; B = 8'b11111111; CI = 1'b0;
    #10;
    if (Z !== 9'b0000111110) $display("FAIL: Test case 5 failed, expected 510, got %b", Z);

    // Test case 6: 255 + 255 + 1 = 511
    A = 8'b11111111; B = 8'b11111111; CI = 1'b1;
    #10;
    if (Z !== 9'b0000111111) $display("FAIL: Test case 6 failed, expected 511, got %b", Z);

    // Test case 7: 0 + 0 + 1 = 1
    A = 8'b00000000; B = 8'b00000000; CI = 1'b1;
    #10;
    if (Z !== 9'b000000001) $display("FAIL: Test case 7 failed, expected 1, got %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule