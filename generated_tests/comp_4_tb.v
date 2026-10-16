`timescale 1ns/1ps

module tb_comp;
  reg [1:0] a;
  reg [1:0] b;
  wire e, l, g;

  // Instantiate the module under test (uut)
  comp uut (
    .a(a),
    .b(b),
    .e(e),
    .l(l),
    .g(g)
  );

  initial begin
    // Test case 1: a = 00, b = 00 (equal)
    a = 2'b00; b = 2'b00;
    #10;
    if (e !== 1 || l !== 0 || g !== 0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: a = 01, b = 01 (equal)
    a = 2'b01; b = 2'b01;
    #10;
    if (e !== 1 || l !== 0 || g !== 0) 
      $display("FAIL: Test case 2 failed");

    // Test case 3: a = 10, b = 01 (greater)
    a = 2'b10; b = 2'b01;
    #10;
    if (e !== 0 || l !== 0 || g !== 1) 
      $display("FAIL: Test case 3 failed");

    // Test case 4: a = 01, b = 10 (less)
    a = 2'b01; b = 2'b10;
    #10;
    if (e !== 0 || l !== 1 || g !== 0) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: a = 11, b = 10 (greater)
    a = 2'b11; b = 2'b10;
    #10;
    if (e !== 0 || l !== 0 || g !== 1) 
      $display("FAIL: Test case 5 failed");

    // Test case 6: a = 10, b = 11 (less)
    a = 2'b10; b = 2'b11;
    #10;
    if (e !== 0 || l !== 1 || g !== 0) 
      $display("FAIL: Test case 6 failed");

    // Test case 7: a = 00, b = 01 (less)
    a = 2'b00; b = 2'b01;
    #10;
    if (e !== 0 || l !== 1 || g !== 0) 
      $display("FAIL: Test case 7 failed");

    // Test case 8: a = 01, b = 00 (greater)
    a = 2'b01; b = 2'b00;
    #10;
    if (e !== 0 || l !== 0 || g !== 1) 
      $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule