`timescale 1ns/1ps

module tb_adder4;

  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire [3:0] s;
  wire cout;

  // Instantiate the adder4 module
  adder4 uut (
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0
    a = 4'b0000; b = 4'b0000; cin = 1'b0;
    #10;
    if (s !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0 = 2
    a = 4'b0001; b = 4'b0001; cin = 1'b0;
    #10;
    if (s !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 3 + 2 + 0 = 5
    a = 4'b0011; b = 4'b0010; cin = 1'b0;
    #10;
    if (s !== 4'b0101 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 7 + 1 + 0 = 8
    a = 4'b0111; b = 4'b0001; cin = 1'b0;
    #10;
    if (s !== 4'b1000 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 15 + 1 + 0 = 0 (overflow)
    a = 4'b1111; b = 4'b0001; cin = 1'b0;
    #10;
    if (s !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 1 + 1 = 3
    a = 4'b0001; b = 4'b0001; cin = 1'b1;
    #10;
    if (s !== 4'b0011 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

    // Test case 7: 2 + 2 + 1 = 5
    a = 4'b0010; b = 4'b0010; cin = 1'b1;
    #10;
    if (s !== 4'b0101 || cout !== 1'b0) $display("FAIL: Test case 7 failed");

    // Test case 8: 8 + 8 + 0 = 0 (overflow)
    a = 4'b1000; b = 4'b1000; cin = 1'b0;
    #10;
    if (s !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule