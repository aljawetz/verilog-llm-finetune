`timescale 1ns/1ps

module tb_Day24_ALU;

  reg [3:0] A;
  reg [3:0] B;
  reg s2;
  reg s1;
  reg s0;
  reg Cin;
  wire [3:0] word_out;
  wire Cout;

  // Instantiate the ALU
  Day24_ALU uut (
    .A(A),
    .B(B),
    .s2(s2),
    .s1(s1),
    .s0(s0),
    .Cin(Cin),
    .word_out(word_out),
    .Cout(Cout)
  );

  initial begin
    // Test Arithmetic Operations
    // Test 0: A + B
    A = 4'b0011; B = 4'b0001; s2 = 0; s1 = 0; s0 = 1; Cin = 0; #10;
    if (word_out !== 4'b0100 || Cout !== 1'b0) $display("FAIL: Test 0 failed");

    // Test 1: A + B + 1
    A = 4'b0011; B = 4'b0001; s2 = 0; s1 = 1; s0 = 1; Cin = 1; #10;
    if (word_out !== 4'b0101 || Cout !== 1'b0) $display("FAIL: Test 1 failed");

    // Test 2: A - B
    A = 4'b0011; B = 4'b0001; s2 = 0; s1 = 1; s0 = 0; Cin = 0; #10;
    if (word_out !== 4'b0010 || Cout !== 1'b0) $display("FAIL: Test 2 failed");

    // Test 3: A + B - 1
    A = 4'b0011; B = 4'b0001; s2 = 0; s1 = 1; s0 = 0; Cin = 1; #10;
    if (word_out !== 4'b0001 || Cout !== 1'b0) $display("FAIL: Test 3 failed");

    // Test 4: A - 1
    A = 4'b0001; B = 4'b0000; s2 = 0; s1 = 1; s0 = 0; Cin = 1; #10;
    if (word_out !== 4'b0000 || Cout !== 1'b0) $display("FAIL: Test 4 failed");

    // Test 5: Overflow case (A + B + 1)
    A = 4'b1111; B = 4'b0001; s2 = 0; s1 = 1; s0 = 0; Cin = 1; #10;
    if (word_out !== 4'b0000 || Cout !== 1'b1) $display("FAIL: Test 5 failed");

    // Test Logical Operations
    // Test 6: A | B
    A = 4'b1010; B = 4'b0101; s2 = 1; s1 = 0; s0 = 0; Cin = 0; #10;
    if (word_out !== 4'b1111) $display("FAIL: Test 6 failed");

    // Test 7: A ~^ B
    A = 4'b1010; B = 4'b0101; s2 = 1; s1 = 0; s0 = 1; Cin = 0; #10;
    if (word_out !== 4'b0000) $display("FAIL: Test 7 failed");

    // Test 8: A ^ B
    A = 4'b1010; B = 4'b0101; s2 = 1; s1 = 1; s0 = 0; Cin = 0; #10;
    if (word_out !== 4'b1111) $display("FAIL: Test 8 failed");

    // Test 9: ~A
    A = 4'b1010; B = 4'b0000; s2 = 1; s1 = 1; s0 = 1; Cin = 0; #10;
    if (word_out !== 4'b0101) $display("FAIL: Test 9 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule