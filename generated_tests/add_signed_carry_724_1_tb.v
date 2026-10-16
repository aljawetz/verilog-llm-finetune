`timescale 1ns/1ps

module tb_add_signed_carry_724;

  reg [11:0] A;
  reg [11:0] B;
  reg CI;
  wire [11:0] Z;

  // Instantiate the module under test
  add_signed_carry_724 uut (
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
    if (Z !== 12'b000000000010) $display("FAIL: Test case 1 failed, expected Z = 2, got Z = %b", Z);

    // Test case 2: Addition with carry
    A = 12'b000000000111; // 7
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b000000001000) $display("FAIL: Test case 2 failed, expected Z = 8, got Z = %b", Z);

    // Test case 3: Addition with carry in
    A = 12'b000000000111; // 7
    B = 12'b000000000111; // 7
    CI = 1;
    #10;
    if (Z !== 12'b000000001101) $display("FAIL: Test case 3 failed, expected Z = 13, got Z = %b", Z);

    // Test case 4: Maximum positive values
    A = 12'b011111111111; // 2047
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b100000000000) $display("FAIL: Test case 4 failed, expected Z = -2048, got Z = %b", Z);

    // Test case 5: Negative and positive addition
    A = 12'b111111111111; // -1
    B = 12'b000000000001; // 1
    CI = 0;
    #10;
    if (Z !== 12'b000000000000) $display("FAIL: Test case 5 failed, expected Z = 0, got Z = %b", Z);

    // Test case 6: Overflow case
    A = 12'b011111111111; // 2047
    B = 12'b011111111111; // 2047
    CI = 0;
    #10;
    if (Z !== 12'b111111111110) $display("FAIL: Test case 6 failed, expected Z = -2, got Z = %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule