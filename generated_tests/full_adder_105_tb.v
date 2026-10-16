`timescale 1ns/1ps

module tb_full_adder;
  reg a, b, c;
  wire s, co;

  // Instantiate the full adder
  full_adder uut (
    .a(a),
    .b(b),
    .c(c),
    .s(s),
    .co(co)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, co = 0
    a = 0; b = 0; c = 0; #10;
    if (s !== 0 || co !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, co = 0
    a = 0; b = 0; c = 1; #10;
    if (s !== 1 || co !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, co = 0
    a = 0; b = 1; c = 0; #10;
    if (s !== 1 || co !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 1 + 0 + 0 = 1, co = 0
    a = 1; b = 0; c = 0; #10;
    if (s !== 1 || co !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 1 + 0 = 0, co = 1
    a = 1; b = 1; c = 0; #10;
    if (s !== 0 || co !== 1) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, co = 1
    a = 1; b = 0; c = 1; #10;
    if (s !== 0 || co !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 0 + 1 + 1 = 0, co = 1
    a = 0; b = 1; c = 1; #10;
    if (s !== 0 || co !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, co = 1
    a = 1; b = 1; c = 1; #10;
    if (s !== 1 || co !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule