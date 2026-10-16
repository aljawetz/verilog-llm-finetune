`timescale 1ns/1ps

module tb_carry_look_ahead_adder;

  reg [3:0] i1;
  reg [3:0] i2;
  reg c_in;
  wire [3:0] sum;
  wire c_out;

  carry_look_ahead_adder uut (
    .sum(sum),
    .c_out(c_out),
    .i1(i1),
    .i2(i2),
    .c_in(c_in)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    i1 = 4'b0000; i2 = 4'b0000; c_in = 1'b0;
    #10;
    if (sum !== 4'b0000 || c_out !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0
    i1 = 4'b0001; i2 = 4'b0001; c_in = 1'b0;
    #10;
    if (sum !== 4'b0010 || c_out !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 1 + 1
    i1 = 4'b0001; i2 = 4'b0001; c_in = 1'b1;
    #10;
    if (sum !== 4'b0011 || c_out !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 3 + 3 + 0
    i1 = 4'b0011; i2 = 4'b0011; c_in = 1'b0;
    #10;
    if (sum !== 4'b0110 || c_out !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 7 + 7 + 0
    i1 = 4'b0111; i2 = 4'b0111; c_in = 1'b0;
    #10;
    if (sum !== 4'b1110 || c_out !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: 15 + 1 + 0
    i1 = 4'b1111; i2 = 4'b0001; c_in = 1'b0;
    #10;
    if (sum !== 4'b0000 || c_out !== 1'b1) $display("FAIL: Test case 6 failed");

    // Test case 7: 5 + 10 + 0
    i1 = 4'b0101; i2 = 4'b1010; c_in = 1'b0;
    #10;
    if (sum !== 4'b1111 || c_out !== 1'b0) $display("FAIL: Test case 7 failed");

    // Test case 8: 8 + 8 + 1
    i1 = 4'b1000; i2 = 4'b1000; c_in = 1'b1;
    #10;
    if (sum !== 4'b0001 || c_out !== 1'b1) $display("FAIL: Test case 8 failed");

    $display("PASS");
    $finish;
  end

endmodule