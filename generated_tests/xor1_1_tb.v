`timescale 1ns/1ps

module tb_xor1;

  reg a, b, c;
  wire s;

  // Instantiate the module under test (uut)
  xor1 uut (
    .a(a),
    .b(b),
    .c(c),
    .s(s)
  );

  initial begin
    // Test case 1: 0 XOR 0 XOR 0 = 0
    a = 0; b = 0; c = 0;
    #10;
    if (s !== 0) $display("FAIL: Test case 1 failed, expected 0, got %b", s);

    // Test case 2: 0 XOR 0 XOR 1 = 1
    a = 0; b = 0; c = 1;
    #10;
    if (s !== 1) $display("FAIL: Test case 2 failed, expected 1, got %b", s);

    // Test case 3: 0 XOR 1 XOR 0 = 1
    a = 0; b = 1; c = 0;
    #10;
    if (s !== 1) $display("FAIL: Test case 3 failed, expected 1, got %b", s);

    // Test case 4: 0 XOR 1 XOR 1 = 0
    a = 0; b = 1; c = 1;
    #10;
    if (s !== 0) $display("FAIL: Test case 4 failed, expected 0, got %b", s);

    // Test case 5: 1 XOR 0 XOR 0 = 1
    a = 1; b = 0; c = 0;
    #10;
    if (s !== 1) $display("FAIL: Test case 5 failed, expected 1, got %b", s);

    // Test case 6: 1 XOR 0 XOR 1 = 0
    a = 1; b = 0; c = 1;
    #10;
    if (s !== 0) $display("FAIL: Test case 6 failed, expected 0, got %b", s);

    // Test case 7: 1 XOR 1 XOR 0 = 0
    a = 1; b = 1; c = 0;
    #10;
    if (s !== 0) $display("FAIL: Test case 7 failed, expected 0, got %b", s);

    // Test case 8: 1 XOR 1 XOR 1 = 1
    a = 1; b = 1; c = 1;
    #10;
    if (s !== 1) $display("FAIL: Test case 8 failed, expected 1, got %b", s);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule