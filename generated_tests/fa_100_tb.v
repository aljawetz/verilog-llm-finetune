`timescale 1ns/1ps

module tb_fa;

  // Inputs
  reg x;
  reg y;
  reg cin;

  // Outputs
  wire s;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  fa uut (
    .x(x),
    .y(y),
    .cin(cin),
    .s(s),
    .cout(cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    x = 0; y = 0; cin = 0;
    #10;
    if (s !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1
    x = 0; y = 0; cin = 1;
    #10;
    if (s !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0
    x = 0; y = 1; cin = 0;
    #10;
    if (s !== 1 || cout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1
    x = 0; y = 1; cin = 1;
    #10;
    if (s !== 0 || cout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0
    x = 1; y = 0; cin = 0;
    #10;
    if (s !== 1 || cout !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1
    x = 1; y = 0; cin = 1;
    #10;
    if (s !== 0 || cout !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0
    x = 1; y = 1; cin = 0;
    #10;
    if (s !== 0 || cout !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1
    x = 1; y = 1; cin = 1;
    #10;
    if (s !== 1 || cout !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule