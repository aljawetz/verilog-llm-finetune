`timescale 1ns/1ps

module tb_prime;
  reg [3:0] a;
  wire prime;

  // Instantiate the module under test (uut)
  prime uut (
    .a(a),
    .prime(prime)
  );

  initial begin
    // Test cases for prime checking
    // Test case 1: 0 (not prime)
    a = 4'b0000; #10;
    if (prime !== 0) $display("FAIL: Test case 0 failed");

    // Test case 2: 1 (not prime)
    a = 4'b0001; #10;
    if (prime !== 0) $display("FAIL: Test case 1 failed");

    // Test case 3: 2 (prime)
    a = 4'b0010; #10;
    if (prime !== 1) $display("FAIL: Test case 2 failed");

    // Test case 4: 3 (prime)
    a = 4'b0011; #10;
    if (prime !== 1) $display("FAIL: Test case 3 failed");

    // Test case 5: 4 (not prime)
    a = 4'b0100; #10;
    if (prime !== 0) $display("FAIL: Test case 4 failed");

    // Test case 6: 5 (prime)
    a = 4'b0101; #10;
    if (prime !== 1) $display("FAIL: Test case 5 failed");

    // Test case 7: 6 (not prime)
    a = 4'b0110; #10;
    if (prime !== 0) $display("FAIL: Test case 6 failed");

    // Test case 8: 7 (prime)
    a = 4'b0111; #10;
    if (prime !== 1) $display("FAIL: Test case 7 failed");

    // Test case 9: 8 (not prime)
    a = 4'b1000; #10;
    if (prime !== 0) $display("FAIL: Test case 8 failed");

    // Test case 10: 9 (not prime)
    a = 4'b1001; #10;
    if (prime !== 0) $display("FAIL: Test case 9 failed");

    // Test case 11: 10 (not prime)
    a = 4'b1010; #10;
    if (prime !== 0) $display("FAIL: Test case 10 failed");

    // Test case 12: 11 (prime)
    a = 4'b1011; #10;
    if (prime !== 1) $display("FAIL: Test case 11 failed");

    // Test case 13: 12 (not prime)
    a = 4'b1100; #10;
    if (prime !== 0) $display("FAIL: Test case 12 failed");

    // Test case 14: 13 (prime)
    a = 4'b1101; #10;
    if (prime !== 1) $display("FAIL: Test case 13 failed");

    // Test case 15: 14 (not prime)
    a = 4'b1110; #10;
    if (prime !== 0) $display("FAIL: Test case 14 failed");

    // Test case 16: 15 (not prime)
    a = 4'b1111; #10;
    if (prime !== 0) $display("FAIL: Test case 15 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule