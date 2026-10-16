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

  // Instantiate the unit under test (UUT)
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
    // Initialize signals
    rstb = 0;
    RS4_RND12_i = 0;
    RS4_RND12_q = 0;
    RS4_RND12_en = 0;

    // Release reset
    #10;
    rstb = 1;

    // Test case 1: Positive input within range
    RS4_RND12_i = 13'b0000000000001; // 1
    RS4_RND12_q = 13'b0000000000001; // 1
    RS4_RND12_en = 1;
    #10;
    if (SAT9_i !== 9'b000000001 || SAT9_q !== 9'b000000001 || SAT9_en !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Positive input exceeding saturation
    RS4_RND12_i = 13'b000011111111111; // 4095
    RS4_RND12_q = 13'b000011111111111; // 4095
    #10;
    if (SAT9_i !== 9'b011111111 || SAT9_q !== 9'b011111111) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Negative input within range
    RS4_RND12_i = 13'b1111111111110; // -2
    RS4_RND12_q = 13'b1111111111110; // -2
    #10;
    if (SAT9_i !== 9'b111111110 || SAT9_q !== 9'b111111110) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Negative input exceeding saturation
    RS4_RND12_i = 13'b1111111111111; // -1
    RS4_RND12_q = 13'b1111111111111; // -1
    #10;
    if (SAT9_i !== 9'b111111111 || SAT9_q !== 9'b111111111) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Negative input saturating at -256
    RS4_RND12_i = 13'b1111111111111; // -1
    RS4_RND12_q = 13'b1111111111111; // -1
    #10;
    if (SAT9_i !== 9'b111111111 || SAT9_q !== 9'b111111111) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Disable input
    RS4_RND12_en = 0;
    #10;
    if (SAT9_i !== 9'b000000000 || SAT9_q !== 9'b000000000 || SAT9_en !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule