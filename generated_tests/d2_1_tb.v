`timescale 1ns/1ps

module tb_d2;
  reg a;
  reg b;
  wire y1, y2, y3, y4;

  // Instantiate the module under test (uut)
  d2 uut (
    .a(a),
    .b(b),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4)
  );

  initial begin
    // Test case 1: a=0, b=0
    a = 0; b = 0; #10;
    if (y1 !== 1 || y2 !== 0 || y3 !== 0 || y4 !== 0) 
      $display("FAIL: Test case 1 failed (a=0, b=0)");
    
    // Test case 2: a=0, b=1
    a = 0; b = 1; #10;
    if (y1 !== 0 || y2 !== 1 || y3 !== 0 || y4 !== 0) 
      $display("FAIL: Test case 2 failed (a=0, b=1)");
    
    // Test case 3: a=1, b=0
    a = 1; b = 0; #10;
    if (y1 !== 0 || y2 !== 0 || y3 !== 1 || y4 !== 0) 
      $display("FAIL: Test case 3 failed (a=1, b=0)");
    
    // Test case 4: a=1, b=1
    a = 1; b = 1; #10;
    if (y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 1) 
      $display("FAIL: Test case 4 failed (a=1, b=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule