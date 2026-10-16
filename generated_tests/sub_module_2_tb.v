`timescale 1ns/1ps

module tb_sub_module;

  reg a;
  reg b;
  wire y;

  // Instantiate the module under test (uut)
  sub_module uut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed (a=0, b=0)"); 

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 2 failed (a=0, b=1)"); 

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 3 failed (a=1, b=0)"); 

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed (a=1, b=1)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule