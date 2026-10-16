`timescale 1ns/1ps

module tb_add_6bit;

  reg [5:0] a;
  reg [5:0] b;
  wire [5:0] sum;

  // Instantiate the module under test (uut)
  add_6bit uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    a = 6'b000000; b = 6'b000000;
    #10;
    if (sum !== 6'b000000) $display("FAIL: Test case 1 failed (0 + 0)");

    // Test case 2: 1 + 1 = 2
    a = 6'b000001; b = 6'b000001;
    #10;
    if (sum !== 6'b000010) $display("FAIL: Test case 2 failed (1 + 1)");

    // Test case 3: 15 + 1 = 16 (check for overflow)
    a = 6'b001111; b = 6'b000001;
    #10;
    if (sum !== 6'b010000) $display("FAIL: Test case 3 failed (15 + 1)");

    // Test case 4: 32 + 32 = 64 (check for overflow)
    a = 6'b100000; b = 6'b100000;
    #10;
    if (sum !== 6'b000000) $display("FAIL: Test case 4 failed (32 + 32)");

    // Test case 5: 20 + 10 = 30
    a = 6'b010100; b = 6'b001010;
    #10;
    if (sum !== 6'b011110) $display("FAIL: Test case 5 failed (20 + 10)");

    // Test case 6: 5 + 5 = 10
    a = 6'b000101; b = 6'b000101;
    #10;
    if (sum !== 6'b001010) $display("FAIL: Test case 6 failed (5 + 5)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule