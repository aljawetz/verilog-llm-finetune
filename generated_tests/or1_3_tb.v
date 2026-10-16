`timescale 1ns/1ps

module tb_or1;

  // Inputs
  reg a, b, c, d, e, f, g, h;
  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  or1 uut (
    .a(a), 
    .b(b), 
    .c(c), 
    .d(d), 
    .e(e), 
    .f(f), 
    .g(g), 
    .h(h), 
    .y(y)
  );

  initial begin
    // Test case 1: All inputs low
    a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: One input high
    a = 1; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Multiple inputs high
    a = 1; b = 1; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: All inputs high
    a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; h = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

    // Test case 5: Random inputs
    a = 0; b = 1; c = 0; d = 1; e = 0; f = 0; g = 0; h = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

    // Test case 6: All inputs low again
    a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule