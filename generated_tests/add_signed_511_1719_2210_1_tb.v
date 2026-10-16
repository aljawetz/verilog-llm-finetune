`timescale 1ns/1ps

module tb_add_signed_511_1719_2210;

  reg [11:0] A;
  reg [9:0] B;
  wire [11:0] Z;

  // Instantiate the module under test
  add_signed_511_1719_2210 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 12'd0; B = 10'd0;
    #10;
    if (Z !== 12'd0) $display("FAIL: Test case 1 failed, expected Z = 0, got Z = %d", Z);

    // Test case 2: A = 5, B = 3
    A = 12'd5; B = 10'd3;
    #10;
    if (Z !== 12'd8) $display("FAIL: Test case 2 failed, expected Z = 8, got Z = %d", Z);

    // Test case 3: A = -5 (2's complement), B = 3
    A = 12'd4091; B = 10'd3; // A = -5 in 2's complement
    #10;
    if (Z !== 12'd4094) $display("FAIL: Test case 3 failed, expected Z = 4094, got Z = %d", Z);

    // Test case 4: A = 2048, B = 512
    A = 12'd2048; B = 10'd512;
    #10;
    if (Z !== 12'd2560) $display("FAIL: Test case 4 failed, expected Z = 2560, got Z = %d", Z);

    // Test case 5: A = 2047, B = 511
    A = 12'd2047; B = 10'd511;
    #10;
    if (Z !== 12'd2558) $display("FAIL: Test case 5 failed, expected Z = 2558, got Z = %d", Z);

    // Test case 6: A = 4095 (max positive), B = 0
    A = 12'd4095; B = 10'd0;
    #10;
    if (Z !== 12'd4095) $display("FAIL: Test case 6 failed, expected Z = 4095, got Z = %d", Z);

    // Test case 7: A = 0, B = 1023 (max positive)
    A = 12'd0; B = 10'd1023;
    #10;
    if (Z !== 12'd1023) $display("FAIL: Test case 7 failed, expected Z = 1023, got Z = %d", Z);

    // Test case 8: A = -1 (2's complement), B = -1 (2's complement)
    A = 12'd4095; B = 10'd1023; // A = -1, B = -1
    #10;
    if (Z !== 12'd4094) $display("FAIL: Test case 8 failed, expected Z = 4094, got Z = %d", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule