`timescale 1ns/1ps

module tb_and_3;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  and_3 uut (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are low
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: One input high
    a = 1; b = 0; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

    // Test case 3: Two inputs high
    a = 1; b = 1; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);

    // Test case 4: All inputs high
    a = 1; b = 1; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

    // Test case 5: Two inputs high, one low
    a = 1; b = 1; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

    // Test case 6: One input high, two low
    a = 0; b = 1; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);

    // Test case 7: All inputs low again
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 7 failed, expected y=0, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule