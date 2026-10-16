`timescale 1ns/1ps

module tb_four_bits;

  reg a, b, c, d, cin;
  wire sum, c1, c2;

  // Instantiate the module under test
  four_bits uut (
    .sum(sum),
    .c1(c1),
    .c2(c2),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .cin(cin)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 + 0 + 0 = 0
    a = 0; b = 0; c = 0; d = 0; cin = 0;
    #10;
    if (sum !== 0 || c1 !== 0 || c2 !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 1 + 1 + 0 = 4
    a = 1; b = 1; c = 1; d = 1; cin = 0;
    #10;
    if (sum !== 0 || c1 !== 1 || c2 !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 1 + 1 + 1 + 1 = 5
    a = 1; b = 1; c = 1; d = 1; cin = 1;
    #10;
    if (sum !== 1 || c1 !== 1 || c2 !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1 + 1 + 1 = 4
    a = 0; b = 1; c = 1; d = 1; cin = 1;
    #10;
    if (sum !== 0 || c1 !== 1 || c2 !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0 + 0 + 0 = 1
    a = 1; b = 0; c = 0; d = 0; cin = 0;
    #10;
    if (sum !== 1 || c1 !== 0 || c2 !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 1 + 0 + 0 + 0 = 2
    a = 1; b = 1; c = 0; d = 0; cin = 0;
    #10;
    if (sum !== 0 || c1 !== 1 || c2 !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 1 + 0 + 0 = 3
    a = 1; b = 1; c = 1; d = 0; cin = 0;
    #10;
    if (sum !== 1 || c1 !== 1 || c2 !== 0) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 + 1 + 1 = 5
    a = 1; b = 1; c = 1; d = 1; cin = 1;
    #10;
    if (sum !== 1 || c1 !== 1 || c2 !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule