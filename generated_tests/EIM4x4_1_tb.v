`timescale 1ns/1ps

module tb_EIM4x4;

  reg [3:0] A;
  reg [3:0] B;
  wire [7:0] R;

  // Instantiate the module under test
  EIM4x4 uut (
    .A(A),
    .B(B),
    .R(R)
  );

  initial begin
    // Test case 1: 1 * 1 = 1
    A = 4'b0001; B = 4'b0001; #10;
    if (R !== 8'b00000001) $display("FAIL: Test case 1 failed, expected 1, got %b", R);

    // Test case 2: 2 * 2 = 4
    A = 4'b0010; B = 4'b0010; #10;
    if (R !== 8'b00000100) $display("FAIL: Test case 2 failed, expected 4, got %b", R);

    // Test case 3: 3 * 3 = 9
    A = 4'b0011; B = 4'b0011; #10;
    if (R !== 8'b00001001) $display("FAIL: Test case 3 failed, expected 9, got %b", R);

    // Test case 4: 4 * 4 = 16
    A = 4'b0100; B = 4'b0100; #10;
    if (R !== 8'b00010000) $display("FAIL: Test case 4 failed, expected 16, got %b", R);

    // Test case 5: 5 * 5 = 25
    A = 4'b0101; B = 4'b0101; #10;
    if (R !== 8'b00011001) $display("FAIL: Test case 5 failed, expected 25, got %b", R);

    // Test case 6: 6 * 6 = 36
    A = 4'b0110; B = 4'b0110; #10;
    if (R !== 8'b00100100) $display("FAIL: Test case 6 failed, expected 36, got %b", R);

    // Test case 7: 7 * 7 = 49
    A = 4'b0111; B = 4'b0111; #10;
    if (R !== 8'b00110001) $display("FAIL: Test case 7 failed, expected 49, got %b", R);

    // Test case 8: 8 * 8 = 64
    A = 4'b1000; B = 4'b1000; #10;
    if (R !== 8'b01000000) $display("FAIL: Test case 8 failed, expected 64, got %b", R);

    // Test case 9: 9 * 9 = 81
    A = 4'b1001; B = 4'b1001; #10;
    if (R !== 8'b01010001) $display("FAIL: Test case 9 failed, expected 81, got %b", R);

    // Test case 10: 10 * 10 = 100
    A = 4'b1010; B = 4'b1010; #10;
    if (R !== 8'b01100100) $display("FAIL: Test case 10 failed, expected 100, got %b", R);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule