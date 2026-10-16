`timescale 1ns/1ps

module tb_and4;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;

  // Output
  wire e;

  // Instantiate the Unit Under Test (UUT)
  and4 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e)
  );

  initial begin
    // Test case 1: All inputs are low
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (e !== 0) $display("FAIL: Test case 1 failed, expected e=0, got e=%b", e);

    // Test case 2: One input high
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (e !== 0) $display("FAIL: Test case 2 failed, expected e=0, got e=%b", e);

    // Test case 3: Two inputs high
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (e !== 0) $display("FAIL: Test case 3 failed, expected e=0, got e=%b", e);

    // Test case 4: Three inputs high
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (e !== 0) $display("FAIL: Test case 4 failed, expected e=0, got e=%b", e);

    // Test case 5: All inputs high
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (e !== 1) $display("FAIL: Test case 5 failed, expected e=1, got e=%b", e);

    // Test case 6: Random inputs
    a = 1; b = 0; c = 1; d = 1;
    #10;
    if (e !== 0) $display("FAIL: Test case 6 failed, expected e=0, got e=%b", e);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule