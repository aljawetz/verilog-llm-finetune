`timescale 1ns/1ps

module tb_add_unsigned_carry_877;
  reg [7:0] A;
  reg [7:0] B;
  reg CI;
  wire [8:0] Z;

  // Instantiate the module under test (uut)
  add_unsigned_carry_877 uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: Simple addition without carry-in
    A = 8'b00000001; // 1
    B = 8'b00000001; // 1
    CI = 1'b0;       // No carry-in
    #10;
    if (Z !== 9'b000000010) $display("FAIL: Test case 1 failed, expected 2 but got %b", Z);

    // Test case 2: Addition with carry-in
    A = 8'b00000001; // 1
    B = 8'b00000001; // 1
    CI = 1'b1;       // Carry-in
    #10;
    if (Z !== 9'b000000011) $display("FAIL: Test case 2 failed, expected 3 but got %b", Z);

    // Test case 3: Maximum values without overflow
    A = 8'b11111111; // 255
    B = 8'b00000001; // 1
    CI = 1'b0;       // No carry-in
    #10;
    if (Z !== 9'b000000000) $display("FAIL: Test case 3 failed, expected 0 but got %b", Z);

    // Test case 4: Maximum values with carry-in
    A = 8'b11111111; // 255
    B = 8'b00000001; // 1
    CI = 1'b1;       // Carry-in
    #10;
    if (Z !== 9'b000000001) $display("FAIL: Test case 4 failed, expected 0 but got %b", Z);

    // Test case 5: Random values
    A = 8'b10101010; // 170
    B = 8'b01010101; // 85
    CI = 1'b0;       // No carry-in
    #10;
    if (Z !== 9'b000110111) $display("FAIL: Test case 5 failed, expected 255 but got %b", Z);

    // Test case 6: Random values with carry-in
    A = 8'b10101010; // 170
    B = 8'b01010101; // 85
    CI = 1'b1;       // Carry-in
    #10;
    if (Z !== 9'b000111000) $display("FAIL: Test case 6 failed, expected 256 but got %b", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule