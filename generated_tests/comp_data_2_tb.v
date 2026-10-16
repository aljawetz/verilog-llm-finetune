`timescale 1ns/1ps

module tb_comp_data;

  reg [3:0] a;
  reg [3:0] b;
  wire equal;
  wire greater;
  wire less;

  // Instantiate the module under test (uut)
  comp_data uut (
    .a(a),
    .b(b),
    .equal(equal),
    .greater(greater),
    .less(less)
  );

  initial begin
    // Test case 1: a = 4'b0000, b = 4'b0000 (equal)
    a = 4'b0000; b = 4'b0000;
    #10;
    if (equal !== 1'b1 || greater !== 1'b0 || less !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: a = 4'b0001, b = 4'b0000 (greater)
    a = 4'b0001; b = 4'b0000;
    #10;
    if (equal !== 1'b0 || greater !== 1'b1 || less !== 1'b0) 
      $display("FAIL: Test case 2 failed");

    // Test case 3: a = 4'b0000, b = 4'b0001 (less)
    a = 4'b0000; b = 4'b0001;
    #10;
    if (equal !== 1'b0 || greater !== 1'b0 || less !== 1'b1) 
      $display("FAIL: Test case 3 failed");

    // Test case 4: a = 4'b0010, b = 4'b0001 (greater)
    a = 4'b0010; b = 4'b0001;
    #10;
    if (equal !== 1'b0 || greater !== 1'b1 || less !== 1'b0) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: a = 4'b0001, b = 4'b0010 (less)
    a = 4'b0001; b = 4'b0010;
    #10;
    if (equal !== 1'b0 || greater !== 1'b0 || less !== 1'b1) 
      $display("FAIL: Test case 5 failed");

    // Test case 6: a = 4'b1100, b = 4'b1010 (greater)
    a = 4'b1100; b = 4'b1010;
    #10;
    if (equal !== 1'b0 || greater !== 1'b1 || less !== 1'b0) 
      $display("FAIL: Test case 6 failed");

    // Test case 7: a = 4'b1010, b = 4'b1100 (less)
    a = 4'b1010; b = 4'b1100;
    #10;
    if (equal !== 1'b0 || greater !== 1'b0 || less !== 1'b1) 
      $display("FAIL: Test case 7 failed");

    // Test case 8: a = 4'b1111, b = 4'b1111 (equal)
    a = 4'b1111; b = 4'b1111;
    #10;
    if (equal !== 1'b1 || greater !== 1'b0 || less !== 1'b0) 
      $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule