`timescale 1ns/1ps

module tb_carry_lookahead_adder_3_4bits_part1;

  reg [3:0] in1, in2, in3;
  reg cin;
  wire [3:0] sum;
  wire cout_1, cout_2;

  carry_lookahead_adder_3_4bits_part1 uut (
    .sum(sum),
    .cout_1(cout_1),
    .cout_2(cout_2),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .cin(cin)
  );

  initial begin
    // Test case 1
    in1 = 4'b0001; in2 = 4'b0010; in3 = 4'b0100; cin = 0; #10;
    if (sum !== 4'b0111 || cout_1 !== 0 || cout_2 !== 0) 
      $display("FAIL: Test case 1 failed");

    // Test case 2
    in1 = 4'b1111; in2 = 4'b0001; in3 = 4'b0000; cin = 0; #10;
    if (sum !== 4'b0000 || cout_1 !== 1 || cout_2 !== 0) 
      $display("FAIL: Test case 2 failed");

    // Test case 3
    in1 = 4'b1010; in2 = 4'b0101; in3 = 4'b0011; cin = 1; #10;
    if (sum !== 4'b1111 || cout_1 !== 1 || cout_2 !== 0) 
      $display("FAIL: Test case 3 failed");

    // Test case 4
    in1 = 4'b0000; in2 = 4'b0000; in3 = 4'b0000; cin = 0; #10;
    if (sum !== 4'b0000 || cout_1 !== 0 || cout_2 !== 0) 
      $display("FAIL: Test case 4 failed");

    // Test case 5
    in1 = 4'b1111; in2 = 4'b1111; in3 = 4'b1111; cin = 1; #10;
    if (sum !== 4'b1111 || cout_1 !== 1 || cout_2 !== 1) 
      $display("FAIL: Test case 5 failed");

    $display("PASS");
    $finish;
  end

endmodule