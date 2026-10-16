`timescale 1ns/1ps

module tb_top;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire c;

  // Instantiate the Unit Under Test (UUT)
  top uut (
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (c !== 0) $display("FAIL: Test case 1 failed (a=0, b=0, c=%b)", c);

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (c !== 0) $display("FAIL: Test case 2 failed (a=0, b=1, c=%b)", c);

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (c !== 0) $display("FAIL: Test case 3 failed (a=1, b=0, c=%b)", c);

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (c !== 1) $display("FAIL: Test case 4 failed (a=1, b=1, c=%b)", c);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule