`timescale 1ns/1ps

module tb_or_gate;

  // Inputs
  reg m;
  reg n;

  // Output
  wire l;

  // Instantiate the Unit Under Test (UUT)
  or_gate uut (
    .l(l),
    .m(m),
    .n(n)
  );

  initial begin
    // Test case 1: m = 0, n = 0
    m = 0; n = 0;
    #10;
    if (l !== 0) $display("FAIL: Test case 1 failed, expected l = 0, got l = %b", l);

    // Test case 2: m = 0, n = 1
    m = 0; n = 1;
    #10;
    if (l !== 1) $display("FAIL: Test case 2 failed, expected l = 1, got l = %b", l);

    // Test case 3: m = 1, n = 0
    m = 1; n = 0;
    #10;
    if (l !== 1) $display("FAIL: Test case 3 failed, expected l = 1, got l = %b", l);

    // Test case 4: m = 1, n = 1
    m = 1; n = 1;
    #10;
    if (l !== 1) $display("FAIL: Test case 4 failed, expected l = 1, got l = %b", l);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule