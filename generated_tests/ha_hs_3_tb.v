`timescale 1ns/1ps

module tb_ha_hs;

  reg a, b, u;
  wire s, c;

  // Instantiate the module under test (uut)
  ha_hs uut (
    .a(a),
    .b(b),
    .u(u),
    .s(s),
    .c(c)
  );

  initial begin
    // Test case 1: u = 0, a = 0, b = 0
    a = 0; b = 0; u = 0;
    #10;
    if (s !== 0 || c !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: u = 0, a = 0, b = 1
    a = 0; b = 1; u = 0;
    #10;
    if (s !== 1 || c !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: u = 0, a = 1, b = 0
    a = 1; b = 0; u = 0;
    #10;
    if (s !== 1 || c !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: u = 0, a = 1, b = 1
    a = 1; b = 1; u = 0;
    #10;
    if (s !== 0 || c !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: u = 1, a = 0, b = 0
    a = 0; b = 0; u = 1;
    #10;
    if (s !== 0 || c !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: u = 1, a = 0, b = 1
    a = 0; b = 1; u = 1;
    #10;
    if (s !== 1 || c !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: u = 1, a = 1, b = 0
    a = 1; b = 0; u = 1;
    #10;
    if (s !== 1 || c !== 0) $display("FAIL: Test case 7 failed");

    // Test case 8: u = 1, a = 1, b = 1
    a = 1; b = 1; u = 1;
    #10;
    if (s !== 0 || c !== 0) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule