`timescale 1ns/1ps

module tb_add_signed_511_1681;

  // Inputs
  reg [11:0] A;
  reg [9:0] B;

  // Outputs
  wire [11:0] Z;

  // Instantiate the Unit Under Test (UUT)
  add_signed_511_1681 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 511 (0x1FF), B = 511 (0x1FF)
    A = 12'h1FF; B = 10'h1FF; #10;
    if (Z !== 12'h1FF + 12'h1FF) $display("FAIL: Test case 1 failed, expected %h, got %h", 12'h1FF + 12'h1FF, Z);

    // Test case 2: A = -1 (0xFFF), B = 1 (0x001)
    A = 12'hFFF; B = 10'h001; #10;
    if (Z !== 12'hFFF + 12'h001) $display("FAIL: Test case 2 failed, expected %h, got %h", 12'hFFF + 12'h001, Z);

    // Test case 3: A = 0 (0x000), B = -1 (0x3FF)
    A = 12'h000; B = 10'h3FF; #10;
    if (Z !== 12'h000 + 12'hFFC) $display("FAIL: Test case 3 failed, expected %h, got %h", 12'h000 + 12'hFFC, Z);

    // Test case 4: A = 1000 (0x3E8), B = 1000 (0x3E8)
    A = 12'h3E8; B = 10'h3E8; #10;
    if (Z !== 12'h3E8 + 12'h3E8) $display("FAIL: Test case 4 failed, expected %h, got %h", 12'h3E8 + 12'h3E8, Z);

    // Test case 5: A = -512 (0x000), B = 512 (0x200)
    A = 12'h000; B = 10'h200; #10;
    if (Z !== 12'h000 + 12'h200) $display("FAIL: Test case 5 failed, expected %h, got %h", 12'h000 + 12'h200, Z);

    // Test case 6: A = 2047 (0x7FF), B = 1024 (0x400)
    A = 12'h7FF; B = 10'h400; #10;
    if (Z !== 12'h7FF + 12'h400) $display("FAIL: Test case 6 failed, expected %h, got %h", 12'h7FF + 12'h400, Z);

    // Test case 7: A = -2048 (0x800), B = -512 (0x200)
    A = 12'h800; B = 10'h200; #10;
    if (Z !== 12'h800 + 12'hFFC) $display("FAIL: Test case 7 failed, expected %h, got %h", 12'h800 + 12'hFFC, Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule