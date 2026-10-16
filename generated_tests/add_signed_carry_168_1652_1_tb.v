`timescale 1ns/1ps

module tb_add_signed_carry_168_1652;

  reg [11:0] A;
  reg [11:0] B;
  reg CI;
  wire [11:0] Z;

  // Instantiate the Unit Under Test (UUT)
  add_signed_carry_168_1652 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: Simple addition without carry-in
    A = 12'b000000000001; // 1
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b000000000010) $display("FAIL: Test case 1 failed, expected 2, got %b", Z);

    // Test case 2: Addition with carry-in
    A = 12'b000000000111; // 7
    B = 12'b000000000001; // 1
    CI = 1;
    #10;
    if (Z !== 12'b000000001001) $display("FAIL: Test case 2 failed, expected 9, got %b", Z);

    // Test case 3: Negative number addition
    A = 12'b111111111111; // -1
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b000000000000) $display("FAIL: Test case 3 failed, expected 0, got %b", Z);

    // Test case 4: Overflow case
    A = 12'b011111111111; // 2047
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b100000000000) $display("FAIL: Test case 4 failed, expected -2048, got %b", Z);

    // Test case 5: Adding two negative numbers
    A = 12'b111111111111; // -1
    B = 12'b111111111111; // -1
    CI = 0;
    #10;
    if (Z !== 12'b111111111110) $display("FAIL: Test case 5 failed, expected -2, got %b", Z);

    // Test case 6: Adding positive and negative number
    A = 12'b000000000100; // 4
    B = 12'b111111111100; // -4
    CI = 0;
    #10;
    if (Z !== 12'b000000000000) $display("FAIL: Test case 6 failed, expected 0, got %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule