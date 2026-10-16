`timescale 1ns/1ps

module tb_comparator;

  reg [1:0] A;
  reg [1:0] B;
  wire A_less_B;
  wire A_equal_B;
  wire A_greater_B;

  // Instantiate the comparator module
  comparator uut (
    .A(A),
    .B(B),
    .A_less_B(A_less_B),
    .A_equal_B(A_equal_B),
    .A_greater_B(A_greater_B)
  );

  initial begin
    // Test case 1: A = 00, B = 00
    A = 2'b00; B = 2'b00;
    #10;
    if (A_less_B !== 1'b0 || A_equal_B !== 1'b1 || A_greater_B !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: A = 01, B = 00
    A = 2'b01; B = 2'b00;
    #10;
    if (A_less_B !== 1'b0 || A_equal_B !== 1'b0 || A_greater_B !== 1'b1) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: A = 00, B = 01
    A = 2'b00; B = 2'b01;
    #10;
    if (A_less_B !== 1'b1 || A_equal_B !== 1'b0 || A_greater_B !== 1'b0) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: A = 01, B = 01
    A = 2'b01; B = 2'b01;
    #10;
    if (A_less_B !== 1'b0 || A_equal_B !== 1'b1 || A_greater_B !== 1'b0) 
      $display("FAIL: Test case 4 failed");
    
    // Test case 5: A = 10, B = 01
    A = 2'b10; B = 2'b01;
    #10;
    if (A_less_B !== 1'b0 || A_equal_B !== 1'b0 || A_greater_B !== 1'b1) 
      $display("FAIL: Test case 5 failed");
    
    // Test case 6: A = 01, B = 10
    A = 2'b01; B = 2'b10;
    #10;
    if (A_less_B !== 1'b1 || A_equal_B !== 1'b0 || A_greater_B !== 1'b0) 
      $display("FAIL: Test case 6 failed");
    
    // Test case 7: A = 10, B = 10
    A = 2'b10; B = 2'b10;
    #10;
    if (A_less_B !== 1'b0 || A_equal_B !== 1'b1 || A_greater_B !== 1'b0) 
      $display("FAIL: Test case 7 failed");
    
    // Test case 8: A = 11, B = 10
    A = 2'b11; B = 2'b10;
    #10;
    if (A_less_B !== 1'b0 || A_equal_B !== 1'b0 || A_greater_B !== 1'b1) 
      $display("FAIL: Test case 8 failed");
    
    // Test case 9: A = 10, B = 11
    A = 2'b10; B = 2'b11;
    #10;
    if (A_less_B !== 1'b1 || A_equal_B !== 1'b0 || A_greater_B !== 1'b0) 
      $display("FAIL: Test case 9 failed");
    
    // Test case 10: A = 11, B = 11
    A = 2'b11; B = 2'b11;
    #10;
    if (A_less_B !== 1'b0 || A_equal_B !== 1'b1 || A_greater_B !== 1'b0) 
      $display("FAIL: Test case 10 failed");

    $display("PASS");
    $finish;
  end

endmodule