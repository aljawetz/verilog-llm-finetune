`timescale 1ns/1ps

module tb_uni_shift_reg;
  reg clk;
  reg rst_n;
  reg [1:0] select;
  reg [3:0] p_din;
  reg s_left_din;
  reg s_right_din;
  wire [3:0] p_dout;
  wire s_left_dout;
  wire s_right_dout;

  // Instantiate the unit under test (UUT)
  uni_shift_reg uut (
    .clk(clk),
    .rst_n(rst_n),
    .select(select),
    .p_din(p_din),
    .s_left_din(s_left_din),
    .s_right_din(s_right_din),
    .p_dout(p_dout),
    .s_left_dout(s_left_dout),
    .s_right_dout(s_right_dout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    select = 2'b00;
    p_din = 4'b0000;
    s_left_din = 0;
    s_right_din = 0;

    // Release reset
    #10;
    rst_n = 1;

    // Test parallel load
    p_din = 4'b1010; // Load 1010
    select = 2'b11;  // Parallel load
    #10;
    if (p_dout !== 4'b1010) $display("FAIL: Parallel load failed");

    // Test right shift
    select = 2'b01;  // Right shift
    s_right_din = 1; // Insert 1
    #10;
    if (p_dout !== 4'b1101) $display("FAIL: Right shift failed");

    // Test left shift
    select = 2'b10;  // Left shift
    s_left_din = 0;  // Insert 0
    #10;
    if (p_dout !== 4'b1010) $display("FAIL: Left shift failed");

    // Test holding value
    select = 2'b00;  // Hold
    #10;
    if (p_dout !== 4'b1010) $display("FAIL: Hold failed");

    // Test reset
    rst_n = 0;
    #10;
    if (p_dout !== 4'b0000) $display("FAIL: Reset failed");

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule