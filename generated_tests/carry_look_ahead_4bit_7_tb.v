`timescale 1ns/1ps

module tb_carry_look_ahead_4bit;
  reg [3:0] a, b;
  reg c_in;
  wire [3:0] sum;
  wire c_out;

  carry_look_ahead_4bit uut (
    .a(a),
    .b(b),
    .c_in(c_in),
    .sum(sum),
    .c_out(c_out)
  );

  initial begin
    // Test case 1: 0 + 0 with carry in 0
    a = 4'b0000; b = 4'b0000; c_in = 1'b0;
    #10;
    if (sum !== 4'b0000 || c_out !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 with carry in 0
    a = 4'b0001; b = 4'b0001; c_in = 1'b0;
    #10;
    if (sum !== 4'b0010 || c_out !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 3 + 3 with carry in 0
    a = 4'b0011; b = 4'b0011; c_in = 1'b0;
    #10;
    if (sum !== 4'b0110 || c_out !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 7 + 8 with carry in 0
    a = 4'b0111; b = 4'b1000; c_in = 1'b0;
    #10;
    if (sum !== 4'b1111 || c_out !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: 15 + 1 with carry in 0
    a = 4'b1111; b = 4'b0001; c_in = 1'b0;
    #10;
    if (sum !== 4'b0000 || c_out !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 1 with carry in 1
    a = 4'b0001; b = 4'b0001; c_in = 1'b1;
    #10;
    if (sum !== 4'b0011 || c_out !== 1'b0) $display("FAIL: Test case 6 failed");

    // Test case 7: 2 + 2 with carry in 1
    a = 4'b0010; b = 4'b0010; c_in = 1'b1;
    #10;
    if (sum !== 4'b0101 || c_out !== 1'b0) $display("FAIL: Test case 7 failed");

    // Test case 8: 3 + 3 with carry in 1
    a = 4'b0011; b = 4'b0011; c_in = 1'b1;
    #10;
    if (sum !== 4'b0111 || c_out !== 1'b0) $display("FAIL: Test case 8 failed");

    // Test case 9: 7 + 9 with carry in 1
    a = 4'b0111; b = 4'b1001; c_in = 1'b1;
    #10;
    if (sum !== 4'b0001 || c_out !== 1'b1) $display("FAIL: Test case 9 failed");

    // Test case 10: 15 + 15 with carry in 1
    a = 4'b1111; b = 4'b1111; c_in = 1'b1;
    #10;
    if (sum !== 4'b1111 || c_out !== 1'b1) $display("FAIL: Test case 10 failed");

    $display("PASS");
    $finish;
  end
endmodule