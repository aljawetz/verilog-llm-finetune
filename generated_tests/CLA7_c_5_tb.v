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

    // Test case 3: 63 + 1 + 0
    in1 = 7'b0111111; 
    in2 = 7'b0000001; 
    cin = 1'b0; 
    #10;
    if (sum !== 7'b1000000 || cout !== 1'b1) $display("FAIL: Test case 3 failed");

    // Test case 4: 32 + 32 + 1
    in1 = 7'b0100000; 
    in2 = 7'b0100000; 
    cin = 1'b1; 
    #10;
    if (sum !== 7'b1000000 || cout !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: 15 + 15 + 1
    in1 = 7'b0001111; 
    in2 = 7'b0001111; 
    cin = 1'b1; 
    #10;
    if (sum !== 7'b0011110 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

    // Test case 6: 127 + 1 + 0
    in1 = 7'b0111111; 
    in2 = 7'b0000001; 
    cin = 1'b0; 
    #10;
    if (sum !== 7'b1000000 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule