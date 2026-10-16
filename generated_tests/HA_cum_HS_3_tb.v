`timescale 1ns/1ps

module tb_HA_cum_HS;

  // Inputs
  reg a;
  reg b;
  reg mode;

  // Outputs
  wire sum;
  wire differ;
  wire carry;
  wire barrow;

  // Instantiate the Unit Under Test (UUT)
  HA_cum_HS uut (
    .a(a),
    .b(b),
    .mode(mode),
    .sum(sum),
    .differ(differ),
    .carry(carry),
    .barrow(barrow)
  );

  initial begin
    // Test case 1: Half-Adder mode (mode = 0)
    mode = 0;

    // Test all combinations of a and b
    a = 0; b = 0; #10;
    if (sum !== 0 || carry !== 0) $display("FAIL: Test case 1.1 failed");

    a = 0; b = 1; #10;
    if (sum !== 1 || carry !== 0) $display("FAIL: Test case 1.2 failed");

    a = 1; b = 0; #10;
    if (sum !== 1 || carry !== 0) $display("FAIL: Test case 1.3 failed");

    a = 1; b = 1; #10;
    if (sum !== 0 || carry !== 1) $display("FAIL: Test case 1.4 failed");

    // Test case 2: Half-Subtractor mode (mode = 1)
    mode = 1;

    // Test all combinations of a and b
    a = 0; b = 0; #10;
    if (differ !== 0 || barrow !== 0) $display("FAIL: Test case 2.1 failed");

    a = 0; b = 1; #10;
    if (differ !== 1 || barrow !== 1) $display("FAIL: Test case 2.2 failed");

    a = 1; b = 0; #10;
    if (differ !== 1 || barrow !== 0) $display("FAIL: Test case 2.3 failed");

    a = 1; b = 1; #10;
    if (differ !== 0 || barrow !== 0) $display("FAIL: Test case 2.4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule