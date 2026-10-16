`timescale 1ns/1ps

module tb_carry_look_ahead_adder;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  // Instantiate the carry look-ahead adder
  carry_look_ahead_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    a = 4'b0000; b = 4'b0000; cin = 1'b0;
    #10;
    if (sum !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0
    a = 4'b0001; b = 4'b0001; cin = 1'b0;
    #10;
    if (sum !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 1 + 1
    a = 4'b0001; b = 4'b0001; cin = 1'b1;
    #10;
    if (sum !== 4'b0011 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 15 + 1 + 0 (Overflow)
    a = 4'b1111; b = 4'b0001; cin = 1'b0;
    #10;
    if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: 5 + 10 + 0
    a = 4'b0101; b = 4'b1010; cin = 1'b0;
    #10;
    if (sum !== 4'b1111 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

    // Test case 6: 7 + 8 + 1
    a = 4'b0111; b = 4'b1000; cin = 1'b1;
    #10;
    if (sum !== 4'b1000 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule