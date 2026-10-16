`timescale 1ns/1ps

module tb_full_adder;

  reg a;
  reg b;
  reg cin;
  wire s0;
  wire c0;

  // Instantiate the full_adder module
  full_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .s0(s0),
    .c0(c0)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    a = 0; b = 0; cin = 0;
    #10;
    if (s0 !== 0 || c0 !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1
    a = 0; b = 0; cin = 1;
    #10;
    if (s0 !== 1 || c0 !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0
    a = 0; b = 1; cin = 0;
    #10;
    if (s0 !== 1 || c0 !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1
    a = 0; b = 1; cin = 1;
    #10;
    if (s0 !== 0 || c0 !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0
    a = 1; b = 0; cin = 0;
    #10;
    if (s0 !== 1 || c0 !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1
    a = 1; b = 0; cin = 1;
    #10;
    if (s0 !== 0 || c0 !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0
    a = 1; b = 1; cin = 0;
    #10;
    if (s0 !== 0 || c0 !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1
    a = 1; b = 1; cin = 1;
    #10;
    if (s0 !== 1 || c0 !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule