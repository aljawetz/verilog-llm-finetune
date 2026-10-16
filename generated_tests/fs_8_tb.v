`timescale 1ns/1ps

module tb_fs;
  reg a, b, cin;
  wire D, B;

  // Instantiate the full subtractor
  fs uut (
    .a(a),
    .b(b),
    .cin(cin),
    .D(D),
    .B(B)
  );

  initial begin
    // Test cases
    // Test case 1: 0 - 0 - 0
    a = 0; b = 0; cin = 0; #10;
    if (D !== 0 || B !== 0) $display("FAIL: Test case 1 failed (0, 0, 0) -> (D: %b, B: %b)", D, B);

    // Test case 2: 0 - 0 - 1
    a = 0; b = 0; cin = 1; #10;
    if (D !== 1 || B !== 1) $display("FAIL: Test case 2 failed (0, 0, 1) -> (D: %b, B: %b)", D, B);

    // Test case 3: 0 - 1 - 0
    a = 0; b = 1; cin = 0; #10;
    if (D !== 1 || B !== 1) $display("FAIL: Test case 3 failed (0, 1, 0) -> (D: %b, B: %b)", D, B);

    // Test case 4: 0 - 1 - 1
    a = 0; b = 1; cin = 1; #10;
    if (D !== 0 || B !== 1) $display("FAIL: Test case 4 failed (0, 1, 1) -> (D: %b, B: %b)", D, B);

    // Test case 5: 1 - 0 - 0
    a = 1; b = 0; cin = 0; #10;
    if (D !== 1 || B !== 0) $display("FAIL: Test case 5 failed (1, 0, 0) -> (D: %b, B: %b)", D, B);

    // Test case 6: 1 - 0 - 1
    a = 1; b = 0; cin = 1; #10;
    if (D !== 0 || B !== 0) $display("FAIL: Test case 6 failed (1, 0, 1) -> (D: %b, B: %b)", D, B);

    // Test case 7: 1 - 1 - 0
    a = 1; b = 1; cin = 0; #10;
    if (D !== 0 || B !== 1) $display("FAIL: Test case 7 failed (1, 1, 0) -> (D: %b, B: %b)", D, B);

    // Test case 8: 1 - 1 - 1
    a = 1; b = 1; cin = 1; #10;
    if (D !== 1 || B !== 1) $display("FAIL: Test case 8 failed (1, 1, 1) -> (D: %b, B: %b)", D, B);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule