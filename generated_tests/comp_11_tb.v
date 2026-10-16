`timescale 1ns/1ps

module tb_comp;
  reg [3:0] a;
  reg [3:0] b;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  comp uut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    // Test case 1: a == b
    a = 4'b0000; b = 4'b0000; #10;
    if (y !== 3'b100) $display("FAIL: Test case 1 failed (a == b)"); 

    // Test case 2: a < b
    a = 4'b0010; b = 4'b0011; #10;
    if (y !== 3'b010) $display("FAIL: Test case 2 failed (a < b)"); 

    // Test case 3: a > b
    a = 4'b0110; b = 4'b0011; #10;
    if (y !== 3'b001) $display("FAIL: Test case 3 failed (a > b)"); 

    // Test case 4: a == b (different values)
    a = 4'b1111; b = 4'b1111; #10;
    if (y !== 3'b100) $display("FAIL: Test case 4 failed (a == b)"); 

    // Test case 5: a < b (max values)
    a = 4'b1000; b = 4'b1111; #10;
    if (y !== 3'b010) $display("FAIL: Test case 5 failed (a < b)"); 

    // Test case 6: a > b (min values)
    a = 4'b0001; b = 4'b0000; #10;
    if (y !== 3'b001) $display("FAIL: Test case 6 failed (a > b)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule