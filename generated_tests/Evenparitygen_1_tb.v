`timescale 1ns/1ps

module tb_Evenparitygen;
  reg a, b, c;
  wire out;

  // Instantiate the module under test (uut)
  Evenparitygen uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
  );

  initial begin
    // Test case 1: a=0, b=0, c=0 -> out should be 1 (even parity)
    a = 0; b = 0; c = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 1 failed (0,0,0)"); 

    // Test case 2: a=0, b=0, c=1 -> out should be 0 (odd parity)
    a = 0; b = 0; c = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 2 failed (0,0,1)"); 

    // Test case 3: a=0, b=1, c=0 -> out should be 0 (odd parity)
    a = 0; b = 1; c = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 3 failed (0,1,0)"); 

    // Test case 4: a=0, b=1, c=1 -> out should be 1 (even parity)
    a = 0; b = 1; c = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 4 failed (0,1,1)"); 

    // Test case 5: a=1, b=0, c=0 -> out should be 0 (odd parity)
    a = 1; b = 0; c = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 5 failed (1,0,0)"); 

    // Test case 6: a=1, b=0, c=1 -> out should be 1 (even parity)
    a = 1; b = 0; c = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 6 failed (1,0,1)"); 

    // Test case 7: a=1, b=1, c=0 -> out should be 1 (even parity)
    a = 1; b = 1; c = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 7 failed (1,1,0)"); 

    // Test case 8: a=1, b=1, c=1 -> out should be 0 (odd parity)
    a = 1; b = 1; c = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 8 failed (1,1,1)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule