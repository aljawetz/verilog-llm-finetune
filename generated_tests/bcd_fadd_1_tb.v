`timescale 1ns/1ps

module tb_bcd_fadd;

  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire cout;
  wire [3:0] sum;

  // Instantiate the module under test (uut)
  bcd_fadd uut (
    .a(a),
    .b(b),
    .cin(cin),
    .cout(cout),
    .sum(sum)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0
    a = 4'b0000; b = 4'b0000; cin = 1'b0;
    #10;
    if (sum !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 5 + 3 + 0 = 8
    a = 4'b0101; b = 4'b0011; cin = 1'b0;
    #10;
    if (sum !== 4'b1000 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 7 + 2 + 0 = 9
    a = 4'b0111; b = 4'b0010; cin = 1'b0;
    #10;
    if (sum !== 4'b1001 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 9 + 1 + 0 = 10 (overflow)
    a = 4'b1001; b = 4'b0001; cin = 1'b0;
    #10;
    if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: 9 + 9 + 1 = 19 (overflow)
    a = 4'b1001; b = 4'b1001; cin = 1'b1;
    #10;
    if (sum !== 4'b0011 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: 3 + 5 + 1 = 9
    a = 4'b0011; b = 4'b0101; cin = 1'b1;
    #10;
    if (sum !== 4'b1001 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule