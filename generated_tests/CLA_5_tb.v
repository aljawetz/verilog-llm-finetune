`timescale 1ns/1ps

module tb_CLA;
  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  // Instantiate the CLA module
  CLA uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0
    a = 4'b0000; b = 4'b0000; cin = 1'b0;
    #10;
    if (sum !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0 = 2
    a = 4'b0001; b = 4'b0001; cin = 1'b0;
    #10;
    if (sum !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 1 + 1 = 3
    a = 4'b0001; b = 4'b0001; cin = 1'b1;
    #10;
    if (sum !== 4'b0011 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 2 + 3 + 0 = 5
    a = 4'b0010; b = 4'b0011; cin = 1'b0;
    #10;
    if (sum !== 4'b0101 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 7 + 1 + 0 = 8
    a = 4'b0111; b = 4'b0001; cin = 1'b0;
    #10;
    if (sum !== 4'b1000 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

    // Test case 6: 7 + 1 + 1 = 9
    a = 4'b0111; b = 4'b0001; cin = 1'b1;
    #10;
    if (sum !== 4'b1001 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

    // Test case 7: 15 + 1 + 0 = 0 (overflow)
    a = 4'b1111; b = 4'b0001; cin = 1'b0;
    #10;
    if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 7 failed");

    // Test case 8: 15 + 15 + 1 = 1 (overflow)
    a = 4'b1111; b = 4'b1111; cin = 1'b1;
    #10;
    if (sum !== 4'b1110 || cout !== 1'b1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule