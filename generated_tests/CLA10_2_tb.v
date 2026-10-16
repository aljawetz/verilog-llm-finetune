`timescale 1ns/1ps

module tb_CLA10;
  reg [9:0] in1;
  reg [9:0] in2;
  wire [9:0] sum;
  wire cout;

  // Instantiate the CLA10 module
  CLA10 uut (
    .sum(sum),
    .cout(cout),
    .in1(in1),
    .in2(in2)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    in1 = 10'b0000000000; 
    in2 = 10'b0000000000; 
    #10;
    if (sum !== 10'b0000000000 || cout !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: 1 + 1 = 2
    in1 = 10'b0000000001; 
    in2 = 10'b0000000001; 
    #10;
    if (sum !== 10'b0000000010 || cout !== 1'b0) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: 5 + 3 = 8
    in1 = 10'b0000000101; 
    in2 = 10'b0000000011; 
    #10;
    if (sum !== 10'b0000001000 || cout !== 1'b0) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: 9 + 1 = 10
    in1 = 10'b0000001001; 
    in2 = 10'b0000000001; 
    #10;
    if (sum !== 10'b0000001010 || cout !== 1'b0) 
      $display("FAIL: Test case 4 failed");
    
    // Test case 5: 15 + 15 = 30
    in1 = 10'b0000001111; 
    in2 = 10'b0000001111; 
    #10;
    if (sum !== 10'b0000011110 || cout !== 1'b0) 
      $display("FAIL: Test case 5 failed");
    
    // Test case 6: 511 + 511 = 1022
    in1 = 10'b1111111111; 
    in2 = 10'b1111111111; 
    #10;
    if (sum !== 10'b1111111100 || cout !== 1'b1) 
      $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule