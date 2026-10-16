`timescale 1ns/1ps

module tb_add_unsigned_carry_873;
  reg [7:0] A;
  reg [7:0] B;
  reg CI;
  wire [8:0] Z;

  // Instantiate the module under test
  add_unsigned_carry_873 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: Simple addition without carry
    A = 8'd15; // 00001111
    B = 8'd10; // 00001010
    CI = 1'b0;
    #10;
    if (Z !== 9'd25) $display("FAIL: Test case 1 failed, expected Z=25, got Z=%d", Z);

    // Test case 2: Addition with carry
    A = 8'd200; // 11001000
    B = 8'd100; // 01100100
    CI = 1'b0;
    #10;
    if (Z !== 9'd300) $display("FAIL: Test case 2 failed, expected Z=300, got Z=%d", Z);

    // Test case 3: Addition with carry in
    A = 8'd255; // 11111111
    B = 8'd1;   // 00000001
    CI = 1'b0;
    #10;
    if (Z !== 9'd256) $display("FAIL: Test case 3 failed, expected Z=256, got Z=%d", Z);

    // Test case 4: Adding zero
    A = 8'd0;   // 00000000
    B = 8'd0;   // 00000000
    CI = 1'b0;
    #10;
    if (Z !== 9'd0) $display("FAIL: Test case 4 failed, expected Z=0, got Z=%d", Z);

    // Test case 5: Maximum values
    A = 8'd255; // 11111111
    B = 8'd255; // 11111111
    CI = 1'b0;
    #10;
    if (Z !== 9'd510) $display("FAIL: Test case 5 failed, expected Z=510, got Z=%d", Z);

    // Test case 6: Addition with carry in
    A = 8'd127; // 01111111
    B = 8'd128; // 10000000
    CI = 1'b1;
    #10;
    if (Z !== 9'd256) $display("FAIL: Test case 6 failed, expected Z=256, got Z=%d", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule