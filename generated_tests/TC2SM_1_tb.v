`timescale 1ns/1ps

module tb_TC2SM;

  reg [10:0] TC;
  wire [10:0] SM;
  wire Overflow;

  // Instantiate the module under test (uut)
  TC2SM uut (
    .TC(TC),
    .SM(SM),
    .Overflow(Overflow)
  );

  initial begin
    // Test cases
    // Test case 1: Positive number
    TC = 11'b00000000001; // +1
    #10;
    if (SM !== 11'b00000000001 || Overflow !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: Negative number
    TC = 11'b11111111111; // -1
    #10;
    if (SM !== 11'b10000000001 || Overflow !== 1'b0) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: Zero
    TC = 11'b00000000000; // 0
    #10;
    if (SM !== 11'b00000000000 || Overflow !== 1'b0) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: Largest positive number
    TC = 11'b01111111111; // +1023
    #10;
    if (SM !== 11'b01111111111 || Overflow !== 1'b0) 
      $display("FAIL: Test case 4 failed");
    
    // Test case 5: Largest negative number
    TC = 11'b10000000000; // -1024
    #10;
    if (SM !== 11'b11000000000 || Overflow !== 1'b1) 
      $display("FAIL: Test case 5 failed");
    
    // Test case 6: Smallest negative number
    TC = 11'b11111111110; // -2
    #10;
    if (SM !== 11'b10000000010 || Overflow !== 1'b0) 
      $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule