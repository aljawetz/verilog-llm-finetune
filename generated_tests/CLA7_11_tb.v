`timescale 1ns/1ps

module tb_CLA7;
  reg [6:0] in1;
  reg [6:0] in2;
  wire [6:0] sum;

  CLA7 uut (
    .sum(sum),
    .in1(in1),
    .in2(in2)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    in1 = 7'b0000000; 
    in2 = 7'b0000000; 
    #10;
    if (sum !== 7'b0000000) $display("FAIL: Test case 1 failed, expected sum = 0000000, got sum = %b", sum);

    // Test case 2: 1 + 1 = 2
    in1 = 7'b0000001; 
    in2 = 7'b0000001; 
    #10;
    if (sum !== 7'b0000010) $display("FAIL: Test case 2 failed, expected sum = 0000010, got sum = %b", sum);

    // Test case 3: 3 + 5 = 8
    in1 = 7'b0000011; 
    in2 = 7'b0000101; 
    #10;
    if (sum !== 7'b0001000) $display("FAIL: Test case 3 failed, expected sum = 0001000, got sum = %b", sum);

    // Test case 4: 15 + 1 = 16
    in1 = 7'b0001111; 
    in2 = 7'b0000001; 
    #10;
    if (sum !== 7'b0010000) $display("FAIL: Test case 4 failed, expected sum = 0010000, got sum = %b", sum);

    // Test case 5: 63 + 1 = 64
    in1 = 7'b0111111; 
    in2 = 7'b0000001; 
    #10;
    if (sum !== 7'b1000000) $display("FAIL: Test case 5 failed, expected sum = 1000000, got sum = %b", sum);

    // Test case 6: 32 + 32 = 64
    in1 = 7'b0100000; 
    in2 = 7'b0100000; 
    #10;
    if (sum !== 7'b1000000) $display("FAIL: Test case 6 failed, expected sum = 1000000, got sum = %b", sum);

    // Test case 7: 50 + 13 = 63
    in1 = 7'b0110010; 
    in2 = 7'b0001101; 
    #10;
    if (sum !== 7'b0111111) $display("FAIL: Test case 7 failed, expected sum = 0111111, got sum = %b", sum);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule