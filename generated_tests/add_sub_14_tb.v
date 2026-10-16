`timescale 1ns/1ps

module tb_add_sub;

  reg a;
  reg b;
  reg mode;
  wire s_d;
  wire cout;

  // Instantiate the module under test (uut)
  add_sub uut (
    .a(a),
    .b(b),
    .mode(mode),
    .s_d(s_d),
    .cout(cout)
  );

  initial begin
    // Test case 1: a = 0, b = 0, mode = 0 (0 + 0)
    a = 0; b = 0; mode = 0;
    #10;
    if (s_d !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 0, b = 1, mode = 0 (0 + 1)
    a = 0; b = 1; mode = 0;
    #10;
    if (s_d !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 1, b = 0, mode = 0 (1 + 0)
    a = 1; b = 0; mode = 0;
    #10;
    if (s_d !== 1 || cout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 1, b = 1, mode = 0 (1 + 1)
    a = 1; b = 1; mode = 0;
    #10;
    if (s_d !== 0 || cout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: a = 0, b = 0, mode = 1 (0 - 0)
    a = 0; b = 0; mode = 1;
    #10;
    if (s_d !== 0 || cout !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a = 0, b = 1, mode = 1 (0 - 1)
    a = 0; b = 1; mode = 1;
    #10;
    if (s_d !== 1 || cout !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: a = 1, b = 0, mode = 1 (1 - 0)
    a = 1; b = 0; mode = 1;
    #10;
    if (s_d !== 1 || cout !== 0) $display("FAIL: Test case 7 failed");

    // Test case 8: a = 1, b = 1, mode = 1 (1 - 1)
    a = 1; b = 1; mode = 1;
    #10;
    if (s_d !== 0 || cout !== 0) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule