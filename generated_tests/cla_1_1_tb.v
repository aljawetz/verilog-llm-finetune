`timescale 1ns/1ps

module tb_cla_1;
  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire [3:0] s;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  cla_1 uut (
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    a = 4'b0000; b = 4'b0000; cin = 0;
    #10;
    if (s !== 4'b0000 || cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0
    a = 4'b0001; b = 4'b0001; cin = 0;
    #10;
    if (s !== 4'b0010 || cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 1 + 1
    a = 4'b0001; b = 4'b0001; cin = 1;
    #10;
    if (s !== 4'b0011 || cout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 3 + 3 + 0
    a = 4'b0011; b = 4'b0011; cin = 0;
    #10;
    if (s !== 4'b0110 || cout !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: 7 + 7 + 1
    a = 4'b0111; b = 4'b0111; cin = 1;
    #10;
    if (s !== 4'b1110 || cout !== 1) $display("FAIL: Test case 5 failed");

    // Test case 6: 15 + 1 + 0
    a = 4'b1111; b = 4'b0001; cin = 0;
    #10;
    if (s !== 4'b0000 || cout !== 1) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule