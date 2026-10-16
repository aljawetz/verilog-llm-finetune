`timescale 1ns/1ps

module tb_sat9;

  reg clk;
  reg rstb;
  reg [12:0] RS4_RND12_i;
  reg [12:0] RS4_RND12_q;
  reg RS4_RND12_en;
  wire [8:0] SAT9_i;
  wire [8:0] SAT9_q;
  wire SAT9_en;

  // Instantiate the Unit Under Test (UUT)
  sat9 uut (
    .clk(clk),
    .rstb(rstb),
    .RS4_RND12_i(RS4_RND12_i),
    .RS4_RND12_q(RS4_RND12_q),
    .RS4_RND12_en(RS4_RND12_en),
    .SAT9_i(SAT9_i),
    .SAT9_q(SAT9_q),
    .SAT9_en(SAT9_en)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Reset the system
    rstb = 0;
    RS4_RND12_i = 0;
    RS4_RND12_q = 0;
    RS4_RND12_en = 0;
    #10;

    rstb = 1; // Release reset
    #10;

    // Test case 1: Positive saturation
    RS4_RND12_i = 13'b0000000000111111; // 63
    RS4_RND12_q = 13'b0000000001111111; // 127
    RS4_RND12_en = 1;
    #10;
    if (SAT9_i !== 9'b011111111) $display("FAIL: Test case 1 - SAT9_i expected 255, got %b", SAT9_i);
    if (SAT9_q !== 9'b011111111) $display("FAIL: Test case 1 - SAT9_q expected 255, got %b", SAT9_q);

    // Test case 2: Negative saturation
    RS4_RND12_i = 13'b1111111111111111; // -1
    RS4_RND12_q = 13'b1111111111111110; // -2
    #10;
    if (SAT9_i !== 9'b100000001) $display("FAIL: Test case 2 - SAT9_i expected -255, got %b", SAT9_i);
    if (SAT9_q !== 9'b100000001) $display("FAIL: Test case 2 - SAT9_q expected -255, got %b", SAT9_q);

    // Test case 3: No saturation
    RS4_RND12_i = 13'b0000000000001000; // 8
    RS4_RND12_q = 13'b0000000000000001; // 1
    #10;
    if (SAT9_i !== 9'b0000001000) $display("FAIL: Test case 3 - SAT9_i expected 8, got %b", SAT9_i);
    if (SAT9_q !== 9'b0000000001) $display("FAIL: Test case 3 - SAT9_q expected 1, got %b", SAT9_q);

    // Test case 4: Enable signal off
    RS4_RND12_en = 0;
    #10;
    if (SAT9_i !== 9'b000000000) $display("FAIL: Test case 4 - SAT9_i expected 0, got %b", SAT9_i);
    if (SAT9_q !== 9'b000000000) $display("FAIL: Test case 4 - SAT9_q expected 0, got %b", SAT9_q);

    // If all tests passed
    $display("PASS");
    $finish;
  end

endmodule