`timescale 1ns/1ps

module tb_add_unsigned_carry_880;
  reg [7:0] A;
  reg [7:0] B;
  reg CI;
  wire [8:0] Z;

  // Instantiate the module under test (uut)
  add_unsigned_carry_880 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    A = 8'b00000000; B = 8'b00000000; CI = 1'b0;
    #10;
    if (Z !== 9'b000000000) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0
    A = 8'b00000001; B = 8'b00000001; CI = 1'b0;
    #10;
    if (Z !== 9'b000000010) $display("FAIL: Test case 2 failed");

    // Test case 3: 255 + 1 + 0 (overflow case)
    A = 8'b11111111; B = 8'b00000001; CI = 1'b0;
    #10;
    if (Z !== 9'b000000000) $display("FAIL: Test case 3 failed");

    // Test case 4: 127 + 127 + 0
    A = 8'b01111111; B = 8'b01111111; CI = 1'b0;
    #10;
    if (Z !== 9'b11111110) $display("FAIL: Test case 4 failed");

    // Test case 5: 100 + 100 + 1
    A = 8'b01100100; B = 8'b01100100; CI = 1'b1;
    #10;
    if (Z !== 9'b11001001) $display("FAIL: Test case 5 failed");

    // Test case 6: 0 + 255 + 0
    A = 8'b00000000; B = 8'b11111111; CI = 1'b0;
    #10;
    if (Z !== 9'b011111111) $display("FAIL: Test case 6 failed");

    // Test case 7: 255 + 255 + 1 (overflow case)
    A = 8'b11111111; B = 8'b11111111; CI = 1'b1;
    #10;
    if (Z !== 9'b111111111) $display("FAIL: Test case 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule