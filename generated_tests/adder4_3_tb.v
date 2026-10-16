`timescale 1ns/1ps

module tb_adder4;
  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire [3:0] s;
  wire cout;

  // Instantiate the module under test (uut)
  adder4 uut (
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
  );

  initial begin
    // Test case 1: Addition without carry-in
    a = 4'b0011; // 3
    b = 4'b0001; // 1
    cin = 0;     // no carry-in
    #10;
    if (s !== 4'b0100 || cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: Addition with carry-in
    a = 4'b0110; // 6
    b = 4'b0010; // 2
    cin = 1;     // carry-in
    #10;
    if (s !== 4'b1000 || cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: Subtraction without carry-in
    a = 4'b0100; // 4
    b = 4'b0011; // 3
    cin = 1;     // treat b as -3
    #10;
    if (s !== 4'b0001 || cout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: Subtraction with carry-in
    a = 4'b1000; // 8
    b = 4'b0100; // 4
    cin = 1;     // treat b as -4
    #10;
    if (s !== 4'b0011 || cout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: Edge case with overflow
    a = 4'b1111; // 15
    b = 4'b0001; // 1
    cin = 0;     // no carry-in
    #10;
    if (s !== 4'b0000 || cout !== 1) $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule