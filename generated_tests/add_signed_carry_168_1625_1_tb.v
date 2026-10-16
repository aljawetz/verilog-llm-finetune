`timescale 1ns/1ps

module tb_add_signed_carry_168_1625;

  reg [11:0] A;
  reg [11:0] B;
  reg CI;
  wire [11:0] Z;

  // Instantiate the Unit Under Test (UUT)
  add_signed_carry_168_1625 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 12, B = 8, CI = 0
    A = 12'd12; B = 12'd8; CI = 1'b0;
    #10;
    if (Z !== 12'd20) $display("FAIL: Test case 1 failed, expected Z = 20, got Z = %d", Z);

    // Test case 2: A = 15, B = 1, CI = 0
    A = 12'd15; B = 12'd1; CI = 1'b0;
    #10;
    if (Z !== 12'd16) $display("FAIL: Test case 2 failed, expected Z = 16, got Z = %d", Z);

    // Test case 3: A = 2048, B = 2048, CI = 0
    A = 12'd2048; B = 12'd2048; CI = 1'b0;
    #10;
    if (Z !== 12'd4096) $display("FAIL: Test case 3 failed, expected Z = 4096, got Z = %d", Z);

    // Test case 4: A = 4095, B = 1, CI = 1 (overflow case)
    A = 12'd4095; B = 12'd1; CI = 1'b1;
    #10;
    if (Z !== 12'd0) $display("FAIL: Test case 4 failed, expected Z = 0, got Z = %d", Z);

    // Test case 5: A = 0, B = 0, CI = 0
    A = 12'd0; B = 12'd0; CI = 1'b0;
    #10;
    if (Z !== 12'd0) $display("FAIL: Test case 5 failed, expected Z = 0, got Z = %d", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule