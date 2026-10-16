`timescale 1ns/1ps

module tb_comparitor_4bit;

  reg [3:0] a;
  reg [3:0] b;
  wire a_less_b;
  wire a_greater_b;
  wire a_equal_b;

  // Instantiate the module under test (uut)
  comparitor_4bit uut (
    .a(a),
    .b(b),
    .a_less_b(a_less_b),
    .a_greater_b(a_greater_b),
    .a_equal_b(a_equal_b)
  );

  initial begin
    // Test case 1: a < b
    a = 4'b0010; // 2
    b = 4'b0100; // 4
    #10;
    if (a_less_b !== 1 || a_greater_b !== 0 || a_equal_b !== 0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: a > b
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    #10;
    if (a_less_b !== 0 || a_greater_b !== 1 || a_equal_b !== 0) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: a == b
    a = 4'b0101; // 5
    b = 4'b0101; // 5
    #10;
    if (a_less_b !== 0 || a_greater_b !== 0 || a_equal_b !== 1) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: a < b (edge case)
    a = 4'b0000; // 0
    b = 4'b0001; // 1
    #10;
    if (a_less_b !== 1 || a_greater_b !== 0 || a_equal_b !== 0) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: a > b (edge case)
    a = 4'b1111; // 15
    b = 4'b1110; // 14
    #10;
    if (a_less_b !== 0 || a_greater_b !== 1 || a_equal_b !== 0) 
      $display("FAIL: Test case 5 failed");

    // Test case 6: a == b (edge case)
    a = 4'b1111; // 15
    b = 4'b1111; // 15
    #10;
    if (a_less_b !== 0 || a_greater_b !== 0 || a_equal_b !== 1) 
      $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule