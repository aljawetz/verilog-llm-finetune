`timescale 1ns/1ps

module tb_add_signed_carry_168_1646;

  reg [11:0] A;
  reg [11:0] B;
  reg CI;
  wire [11:0] Z;

  // Instantiate the module under test
  add_signed_carry_168_1646 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: Simple addition without carry
    A = 12'b000000000001; // 1
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b000000000010) $display("FAIL: Test case 1 failed");

    // Test case 2: Addition with carry
    A = 12'b000000000111; // 7
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b000000001000) $display("FAIL: Test case 2 failed");

    // Test case 3: Addition with carry-in
    A = 12'b000000000111; // 7
    B = 12'b000000000001; // 1
    CI = 1;
    #10;
    if (Z !== 12'b000000001001) $display("FAIL: Test case 3 failed");

    // Test case 4: Negative numbers
    A = 12'b111111111111; // -1
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b000000000000) $display("FAIL: Test case 4 failed");

    // Test case 5: Maximum positive values
    A = 12'b011111111111; // 2047
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b100000000000) $display("FAIL: Test case 5 failed");

    // Test case 6: Overflow case
    A = 12'b011111111111; // 2047
    B = 12'b011111111111; // 2047
    CI = 0;
    #10;
    if (Z !== 12'b111111111110) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule