`timescale 1ns/1ps

module tb_two_bit;

  reg a;
  reg b;
  reg cin;
  wire sum;
  wire c1;

  // Instantiate the module under test (uut)
  two_bit uut (
    .sum(sum),
    .c1(c1),
    .a(a),
    .b(b),
    .cin(cin)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, carry = 0
    a = 0; b = 0; cin = 0;
    #10;
    if (sum !== 0 || c1 !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, carry = 0
    a = 0; b = 0; cin = 1;
    #10;
    if (sum !== 1 || c1 !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, carry = 0
    a = 0; b = 1; cin = 0;
    #10;
    if (sum !== 1 || c1 !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1 = 0, carry = 1
    a = 0; b = 1; cin = 1;
    #10;
    if (sum !== 0 || c1 !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0 = 1, carry = 0
    a = 1; b = 0; cin = 0;
    #10;
    if (sum !== 1 || c1 !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, carry = 1
    a = 1; b = 0; cin = 1;
    #10;
    if (sum !== 0 || c1 !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0 = 0, carry = 1
    a = 1; b = 1; cin = 0;
    #10;
    if (sum !== 0 || c1 !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, carry = 1
    a = 1; b = 1; cin = 1;
    #10;
    if (sum !== 1 || c1 !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule