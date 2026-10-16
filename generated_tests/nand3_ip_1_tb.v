`timescale 1ns/1ps

module tb_nand3_ip;

  reg a, b, c;
  wire y;

  // Instantiate the module under test (uut)
  nand3_ip uut (
    .y(y),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: a=0, b=0, c=0
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 1 failed (a=0, b=0, c=0)"); 

    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 2 failed (a=0, b=0, c=1)"); 

    // Test case 3: a=0, b=1, c=0
    a = 0; b = 1; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 3 failed (a=0, b=1, c=0)"); 

    // Test case 4: a=0, b=1, c=1
    a = 0; b = 1; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed (a=0, b=1, c=1)"); 

    // Test case 5: a=1, b=0, c=0
    a = 1; b = 0; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 5 failed (a=1, b=0, c=0)"); 

    // Test case 6: a=1, b=0, c=1
    a = 1; b = 0; c = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 6 failed (a=1, b=0, c=1)"); 

    // Test case 7: a=1, b=1, c=0
    a = 1; b = 1; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 7 failed (a=1, b=1, c=0)"); 

    // Test case 8: a=1, b=1, c=1
    a = 1; b = 1; c = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 8 failed (a=1, b=1, c=1)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule