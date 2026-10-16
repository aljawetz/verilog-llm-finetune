`timescale 1ns/1ps

module tb_add_signed_254_1430;

  reg [11:0] A;
  reg [9:0] B;
  wire [11:0] Z;

  // Instantiate the module under test (uut)
  add_signed_254_1430 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 12'd5, B = 10'd3
    A = 12'd5; B = 10'd3;
    #10;
    if (Z !== 12'd8) $display("FAIL: Test case 1 failed, expected Z = 8, got Z = %d", Z);

    // Test case 2: A = 12'd10, B = 10'd20
    A = 12'd10; B = 10'd20;
    #10;
    if (Z !== 12'd30) $display("FAIL: Test case 2 failed, expected Z = 30, got Z = %d", Z);

    // Test case 3: A = 12'd0, B = 10'd0
    A = 12'd0; B = 10'd0;
    #10;
    if (Z !== 12'd0) $display("FAIL: Test case 3 failed, expected Z = 0, got Z = %d", Z);

    // Test case 4: A = 12'd4095 (max), B = 10'd1023 (max)
    A = 12'd4095; B = 10'd1023;
    #10;
    if (Z !== 12'd4095) $display("FAIL: Test case 4 failed, expected Z = 4095, got Z = %d", Z);

    // Test case 5: A = 12'd-1, B = 10'd1
    A = 12'd4095; B = 10'd1; // A is treated as -1 in signed context
    #10;
    if (Z !== 12'd0) $display("FAIL: Test case 5 failed, expected Z = 0, got Z = %d", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule