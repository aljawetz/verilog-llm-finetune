`timescale 1ns/1ps

module tb_add_signed_carry_28_1339;

  // Inputs
  reg [12:0] A;
  reg [13:0] B;
  reg CI;

  // Outputs
  wire [13:0] Z;

  // Instantiate the Unit Under Test (UUT)
  add_signed_carry_28_1339 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  // Test procedure
  initial begin
    // Test case 1: Simple addition without carry
    A = 12'b000000000001; // 1
    B = 14'b00000000000100; // 4
    CI = 0; // No carry in
    #10;
    if (Z !== 14'b000000000101) $display("FAIL: Test case 1 failed, expected Z = 5, got Z = %b", Z);

    // Test case 2: Addition with carry
    A = 12'b000000011111; // 15
    B = 14'b00000000000100; // 4
    CI = 0; // No carry in
    #10;
    if (Z !== 14'b00000000010011) $display("FAIL: Test case 2 failed, expected Z = 19, got Z = %b", Z);

    // Test case 3: Negative result
    A = 12'b111111111111; // -1 (in 2's complement)
    B = 14'b00000000000001; // 1
    CI = 0; // No carry in
    #10;
    if (Z !== 14'b11111111111100) $display("FAIL: Test case 3 failed, expected Z = -1, got Z = %b", Z);

    // Test case 4: Maximum positive values
    A = 12'b011111111111; // 2047
    B = 14'b00000000000001; // 1
    CI = 0; // No carry in
    #10;
    if (Z !== 14'b01111111111110) $display("FAIL: Test case 4 failed, expected Z = 2048, got Z = %b", Z);

    // Test case 5: Overflow case
    A = 12'b011111111111; // 2047
    B = 14'b01111111111111; // 8191
    CI = 0; // No carry in
    #10;
    if (Z !== 14'b11111111111110) $display("FAIL: Test case 5 failed, expected Z = -2 (overflow), got Z = %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule