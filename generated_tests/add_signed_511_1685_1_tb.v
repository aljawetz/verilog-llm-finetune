`timescale 1ns/1ps

module tb_add_signed_511_1685;

  reg [11:0] A;
  reg [9:0] B;
  wire [11:0] Z;

  // Instantiate the module under test
  add_signed_511_1685 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 12'd0; B = 10'd0;
    #10;
    if (Z !== 12'd0) $display("FAIL: Test case 1 failed, expected Z = 0, got Z = %d", Z);

    // Test case 2: A = 511, B = 0
    A = 12'd511; B = 10'd0;
    #10;
    if (Z !== 12'd511) $display("FAIL: Test case 2 failed, expected Z = 511, got Z = %d", Z);

    // Test case 3: A = 0, B = 1023 (max for 10 bits)
    A = 12'd0; B = 10'd1023;
    #10;
    if (Z !== 12'd1023) $display("FAIL: Test case 3 failed, expected Z = 1023, got Z = %d", Z);

    // Test case 4: A = 511, B = 511
    A = 12'd511; B = 10'd511;
    #10;
    if (Z !== 12'd1022) $display("FAIL: Test case 4 failed, expected Z = 1022, got Z = %d", Z);

    // Test case 5: A = -1 (12'b111111111111), B = 1
    A = 12'b111111111111; B = 10'd1;
    #10;
    if (Z !== 12'b000000000000) $display("FAIL: Test case 5 failed, expected Z = 0, got Z = %d", Z);

    // Test case 6: A = 1, B = -1 (10'b1111111111)
    A = 12'd1; B = 10'b1111111111;
    #10;
    if (Z !== 12'b000000000000) $display("FAIL: Test case 6 failed, expected Z = 0, got Z = %d", Z);

    // Test case 7: A = 2048, B = 512
    A = 12'd2048; B = 10'd512; // This should be clamped to 12 bits
    #10;
    if (Z !== 12'd2048) $display("FAIL: Test case 7 failed, expected Z = 2048, got Z = %d", Z);

    // Test case 8: A = 1000, B = 500
    A = 12'd1000; B = 10'd500;
    #10;
    if (Z !== 12'd1500) $display("FAIL: Test case 8 failed, expected Z = 1500, got Z = %d", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule