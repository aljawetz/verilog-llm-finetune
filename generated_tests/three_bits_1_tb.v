`timescale 1ns/1ps

module tb_three_bits;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg cin;

  // Outputs
  wire sum;
  wire c1;
  wire c2;

  // Instantiate the module under test (uut)
  three_bits uut (
    .sum(sum),
    .c1(c1),
    .c2(c2),
    .a(a),
    .b(b),
    .c(c),
    .cin(cin)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 + 0 = 0
    a = 0; b = 0; c = 0; cin = 0;
    #10;
    if (sum !== 0 || c1 !== 0 || c2 !== 0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: 1 + 0 + 0 + 0 = 1
    a = 1; b = 0; c = 0; cin = 0;
    #10;
    if (sum !== 1 || c1 !== 0 || c2 !== 0) 
      $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 1 + 0 + 0 = 0 with carry
    a = 1; b = 1; c = 0; cin = 0;
    #10;
    if (sum !== 0 || c1 !== 1 || c2 !== 0) 
      $display("FAIL: Test case 3 failed");

    // Test case 4: 1 + 1 + 1 + 0 = 1 with carry
    a = 1; b = 1; c = 1; cin = 0;
    #10;
    if (sum !== 1 || c1 !== 1 || c2 !== 0) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 1 + 1 + 1 = 1 with carry
    a = 1; b = 1; c = 1; cin = 1;
    #10;
    if (sum !== 1 || c1 !== 1 || c2 !== 1) 
      $display("FAIL: Test case 5 failed");

    // Test case 6: 0 + 1 + 1 + 1 = 1 with carry
    a = 0; b = 1; c = 1; cin = 1;
    #10;
    if (sum !== 1 || c1 !== 1 || c2 !== 0) 
      $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule