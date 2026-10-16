`timescale 1ns/1ps

module tb_CLA7_c;
  reg [6:0] in1, in2;
  reg cin;
  wire [6:0] sum;
  wire cout;

  CLA7_c uut (
    .sum(sum),
    .cout(cout),
    .in1(in1),
    .in2(in2),
    .cin(cin)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    in1 = 7'b0000000; 
    in2 = 7'b0000000; 
    cin = 1'b0; 
    #10;
    if (sum !== 7'b0000000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0
    in1 = 7'b0000001; 
    in2 = 7'b0000001; 
    cin = 1'b0; 
    #10;
    if (sum !== 7'b00000010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 1 + 1
    in1 = 7'b0000001; 
    in2 = 7'b0000001; 
    cin = 1'b1; 
    #10;
    if (sum !== 7'b0000011 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 127 + 1 + 0 (overflow)
    in1 = 7'b0111111; 
    in2 = 7'b0000001; 
    cin = 1'b0; 
    #10;
    if (sum !== 7'b1000000 || cout !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: 63 + 64 + 0
    in1 = 7'b0111111; 
    in2 = 7'b1000000; 
    cin = 1'b0; 
    #10;
    if (sum !== 7'b1111111 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

    // Test case 6: 0 + 127 + 1
    in1 = 7'b0000000; 
    in2 = 7'b0111111; 
    cin = 1'b1; 
    #10;
    if (sum !== 7'b1000000 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

    // Test case 7: 64 + 64 + 1
    in1 = 7'b1000000; 
    in2 = 7'b1000000; 
    cin = 1'b1; 
    #10;
    if (sum !== 7'b0000001 || cout !== 1'b1) $display("FAIL: Test case 7 failed");

    $display("PASS");
    $finish;
  end
endmodule