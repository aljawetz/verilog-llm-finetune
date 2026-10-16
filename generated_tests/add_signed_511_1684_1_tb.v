`timescale 1ns/1ps

module tb_add_signed_511_1684;

  reg [11:0] A;
  reg [9:0] B;
  wire [11:0] Z;

  // Instantiate the module under test
  add_signed_511_1684 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: B = 0
    A = 12'b000000000000; // A = 0
    B = 10'b0000000000;   // B = 0
    #10;
    if (Z !== 12'b000000001111) $display("FAIL: Test case 1 failed, expected Z = 12'b000000001111, got Z = %b", Z);

    // Test case 2: B = 511 (max positive value for 10-bit signed)
    A = 12'b000000000000; // A = 0
    B = 10'b0111111111;   // B = 511
    #10;
    if (Z !== 12'b000000010010) $display("FAIL: Test case 2 failed, expected Z = 12'b000000010010, got Z = %b", Z);

    // Test case 3: B = -1 (min negative value for 10-bit signed)
    A = 12'b000000000000; // A = 0
    B = 10'b1111111111;   // B = -1
    #10;
    if (Z !== 12'b000000001110) $display("FAIL: Test case 3 failed, expected Z = 12'b000000001110, got Z = %b", Z);

    // Test case 4: B = 256
    A = 12'b000000000000; // A = 0
    B = 10'b0010000000;   // B = 256
    #10;
    if (Z !== 12'b000000010111) $display("FAIL: Test case 4 failed, expected Z = 12'b000000010111, got Z = %b", Z);

    // Test case 5: B = -256
    A = 12'b000000000000; // A = 0
    B = 10'b1101111111;   // B = -256
    #10;
    if (Z !== 12'b000000001001) $display("FAIL: Test case 5 failed, expected Z = 12'b000000001001, got Z = %b", Z);

    // Test case 6: B = 511 and A = 1
    A = 12'b000000000001; // A = 1
    B = 10'b0111111111;   // B = 511
    #10;
    if (Z !== 12'b000000010011) $display("FAIL: Test case 6 failed, expected Z = 12'b000000010011, got Z = %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule