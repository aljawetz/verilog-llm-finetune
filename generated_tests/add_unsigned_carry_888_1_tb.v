`timescale 1ns/1ps

module tb_add_unsigned_carry_888;
  reg [7:0] A;
  reg [7:0] B;
  reg CI;
  wire [8:0] Z;

  // Instantiate the module under test (uut)
  add_unsigned_carry_888 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0
    A = 8'b00000000; B = 8'b00000000; CI = 1'b0;
    #10;
    if (Z !== 9'b000000000) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0 = 2
    A = 8'b00000001; B = 8'b00000001; CI = 1'b0;
    #10;
    if (Z !== 9'b000000010) $display("FAIL: Test case 2 failed");

    // Test case 3: 255 + 1 + 0 = 256
    A = 8'b11111111; B = 8'b00000001; CI = 1'b0;
    #10;
    if (Z !== 9'b000000100) $display("FAIL: Test case 3 failed");

    // Test case 4: 128 + 128 + 0 = 256
    A = 8'b10000000; B = 8'b10000000; CI = 1'b0;
    #10;
    if (Z !== 9'b000000100) $display("FAIL: Test case 4 failed");

    // Test case 5: 100 + 100 + 1 = 202
    A = 8'b01100100; B = 8'b01100100; CI = 1'b1;
    #10;
    if (Z !== 9'b000110010) $display("FAIL: Test case 5 failed");

    // Test case 6: 50 + 50 + 0 = 100
    A = 8'b00110010; B = 8'b00110010; CI = 1'b0;
    #10;
    if (Z !== 9'b000001100) $display("FAIL: Test case 6 failed");

    // Test case 7: 200 + 55 + 0 = 255
    A = 8'b11001000; B = 8'b00110111; CI = 1'b0;
    #10;
    if (Z !== 9'b000011111) $display("FAIL: Test case 7 failed");

    // Test case 8: 200 + 56 + 1 = 256
    A = 8'b11001000; B = 8'b00111000; CI = 1'b1;
    #10;
    if (Z !== 9'b000000100) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule