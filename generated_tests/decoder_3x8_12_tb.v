`timescale 1ns/1ps

module tb_decoder_3x8;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Outputs
  wire d0;
  wire d1;
  wire d2;
  wire d3;
  wire d4;
  wire d5;
  wire d6;
  wire d7;

  // Instantiate the Unit Under Test (UUT)
  decoder_3x8 uut (
    .a(a), 
    .b(b), 
    .c(c), 
    .d0(d0), 
    .d1(d1), 
    .d2(d2), 
    .d3(d3), 
    .d4(d4), 
    .d5(d5), 
    .d6(d6), 
    .d7(d7)
  );

  initial begin
    // Test all combinations of a, b, c
    {a, b, c} = 3'b000; #10;
    if (d0 !== 1'b1 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
      $display("FAIL: Test case 000 failed");

    {a, b, c} = 3'b001; #10;
    if (d0 !== 1'b0 || d1 !== 1'b1 || d2 !== 1'b0 || d3 !== 1'b0 || d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
      $display("FAIL: Test case 001 failed");

    {a, b, c} = 3'b010; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b1 || d3 !== 1'b0 || d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
      $display("FAIL: Test case 010 failed");

    {a, b, c} = 3'b011; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b1 || d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
      $display("FAIL: Test case 011 failed");

    {a, b, c} = 3'b100; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || d4 !== 1'b1 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
      $display("FAIL: Test case 100 failed");

    {a, b, c} = 3'b101; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || d4 !== 1'b0 || d5 !== 1'b1 || d6 !== 1'b0 || d7 !== 1'b0) 
      $display("FAIL: Test case 101 failed");

    {a, b, c} = 3'b110; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b1 || d7 !== 1'b0) 
      $display("FAIL: Test case 110 failed");

    {a, b, c} = 3'b111; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b1) 
      $display("FAIL: Test case 111 failed");

    $display("PASS");
    $finish;
  end

endmodule