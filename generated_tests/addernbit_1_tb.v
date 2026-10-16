`timescale 1ns/1ps

module tb_addernbit;

  reg [7:0] a;
  reg [7:0] b;
  reg cin;
  wire [7:0] sum;
  wire cout;

  // Instantiate the module under test (uut)
  addernbit uut (
    .sum(sum),
    .cout(cout),
    .a(a),
    .b(b),
    .cin(cin)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0
    a = 8'b00000000; b = 8'b00000000; cin = 1'b0;
    #10;
    if (sum !== 8'b00000000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0 = 2
    a = 8'b00000001; b = 8'b00000001; cin = 1'b0;
    #10;
    if (sum !== 8'b00000010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 255 + 1 + 0 = 0 (overflow)
    a = 8'b11111111; b = 8'b00000001; cin = 1'b0;
    #10;
    if (sum !== 8'b00000000 || cout !== 1'b1) $display("FAIL: Test case 3 failed");

    // Test case 4: 100 + 100 + 0 = 200
    a = 8'b01100100; b = 8'b01100100; cin = 1'b0;
    #10;
    if (sum !== 8'b11001000 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 50 + 50 + 1 = 101
    a = 8'b00110010; b = 8'b00110010; cin = 1'b1;
    #10;
    if (sum !== 8'b01100101 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

    // Test case 6: 127 + 127 + 1 = 255
    a = 8'b01111111; b = 8'b01111111; cin = 1'b1;
    #10;
    if (sum !== 8'b11111110 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

    // Test case 7: 0 + 0 + 1 = 1
    a = 8'b00000000; b = 8'b00000000; cin = 1'b1;
    #10;
    if (sum !== 8'b00000001 || cout !== 1'b0) $display("FAIL: Test case 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule