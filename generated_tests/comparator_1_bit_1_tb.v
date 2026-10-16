`timescale 1ns/1ps

module tb_comparator_1_bit;

  // Inputs
  reg A;
  reg B;

  // Outputs
  wire A_eq_B;
  wire A_lt_B;
  wire A_gt_B;

  // Instantiate the Unit Under Test (UUT)
  comparator_1_bit uut (
    .A(A),
    .B(B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B),
    .A_gt_B(A_gt_B)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (A_eq_B !== 1'b1 || A_lt_B !== 1'b0 || A_gt_B !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (A_eq_B !== 1'b0 || A_lt_B !== 1'b1 || A_gt_B !== 1'b0) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (A_eq_B !== 1'b0 || A_lt_B !== 1'b0 || A_gt_B !== 1'b1) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (A_eq_B !== 1'b1 || A_lt_B !== 1'b0 || A_gt_B !== 1'b0) 
      $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule