`timescale 1ns/1ps

module tb_hadd;
  reg l, m;
  wire sum, cry;

  // Instantiate the half-adder module
  hadd uut (
    .sum(sum),
    .cry(cry),
    .l(l),
    .m(m)
  );

  initial begin
    // Test case 1: l = 0, m = 0
    l = 0; m = 0;
    #10;
    if (sum !== 0 || cry !== 0) $display("FAIL: Test case 1 failed (l=0, m=0)");

    // Test case 2: l = 0, m = 1
    l = 0; m = 1;
    #10;
    if (sum !== 1 || cry !== 0) $display("FAIL: Test case 2 failed (l=0, m=1)");

    // Test case 3: l = 1, m = 0
    l = 1; m = 0;
    #10;
    if (sum !== 1 || cry !== 0) $display("FAIL: Test case 3 failed (l=1, m=0)");

    // Test case 4: l = 1, m = 1
    l = 1; m = 1;
    #10;
    if (sum !== 0 || cry !== 1) $display("FAIL: Test case 4 failed (l=1, m=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule