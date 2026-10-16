`timescale 1ns/1ps

module tb_or_3;
  reg a, b, c;
  wire y;

  // Instantiate the module under test
  or_3 uut (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: All inputs are 1
    a = 1; b = 1; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

    // Test case 5: Two inputs are 1, one is 0
    a = 0; b = 1; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

    // Test case 6: One input is 1, two are 0
    a = 0; b = 0; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule