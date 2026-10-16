`timescale 1ns/1ps

module tb_c1_logic;

  reg a;
  reg b;
  reg [7:0] c;
  wire c1;

  // Instantiate the module under test
  c1_logic uut (
    .a(a),
    .b(b),
    .c(c),
    .c1(c1)
  );

  initial begin
    // Test case 1: a = 0, b = 0, c = 8'b00000000
    a = 0; b = 0; c = 8'b00000000;
    #10;
    if (c1 !== 0) $display("FAIL: Test case 1 failed"); 

    // Test case 2: a = 1, b = 0, c = 8'b00000000
    a = 1; b = 0; c = 8'b00000000;
    #10;
    if (c1 !== 1) $display("FAIL: Test case 2 failed"); 

    // Test case 3: a = 0, b = 1, c = 8'b00000000
    a = 0; b = 1; c = 8'b00000000;
    #10;
    if (c1 !== 1) $display("FAIL: Test case 3 failed"); 

    // Test case 4: a = 0, b = 0, c = 8'b11111111
    a = 0; b = 0; c = 8'b11111111;
    #10;
    if (c1 !== 1) $display("FAIL: Test case 4 failed"); 

    // Test case 5: a = 1, b = 1, c = 8'b00000000
    a = 1; b = 1; c = 8'b00000000;
    #10;
    if (c1 !== 1) $display("FAIL: Test case 5 failed"); 

    // Test case 6: a = 0, b = 0, c = 8'b10101010
    a = 0; b = 0; c = 8'b10101010;
    #10;
    if (c1 !== 0) $display("FAIL: Test case 6 failed"); 

    // Test case 7: a = 1, b = 0, c = 8'b11111111
    a = 1; b = 0; c = 8'b11111111;
    #10;
    if (c1 !== 1) $display("FAIL: Test case 7 failed"); 

    // Test case 8: a = 0, b = 1, c = 8'b11111111
    a = 0; b = 1; c = 8'b11111111;
    #10;
    if (c1 !== 1) $display("FAIL: Test case 8 failed"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule