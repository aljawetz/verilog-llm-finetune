`timescale 1ns/1ps

module tb_xor3;

  reg in1, in2, in3;
  wire out;

  // Instantiate the module under test (uut)
  xor3 uut (
    .out(out),
    .in1(in1),
    .in2(in2),
    .in3(in3)
  );

  initial begin
    // Test case 1: 0 ^ 0 ^ 0 = 0
    in1 = 0; in2 = 0; in3 = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 1 failed, expected 0, got %b", out);

    // Test case 2: 0 ^ 0 ^ 1 = 1
    in1 = 0; in2 = 0; in3 = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 2 failed, expected 1, got %b", out);

    // Test case 3: 0 ^ 1 ^ 0 = 1
    in1 = 0; in2 = 1; in3 = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 3 failed, expected 1, got %b", out);

    // Test case 4: 0 ^ 1 ^ 1 = 0
    in1 = 0; in2 = 1; in3 = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 4 failed, expected 0, got %b", out);

    // Test case 5: 1 ^ 0 ^ 0 = 1
    in1 = 1; in2 = 0; in3 = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 5 failed, expected 1, got %b", out);

    // Test case 6: 1 ^ 0 ^ 1 = 0
    in1 = 1; in2 = 0; in3 = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 6 failed, expected 0, got %b", out);

    // Test case 7: 1 ^ 1 ^ 0 = 0
    in1 = 1; in2 = 1; in3 = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 7 failed, expected 0, got %b", out);

    // Test case 8: 1 ^ 1 ^ 1 = 1
    in1 = 1; in2 = 1; in3 = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 8 failed, expected 1, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule