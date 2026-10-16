`timescale 1ns/1ps

module tb_cmm_errman_cpl;

  // Parameters
  reg clk;
  reg rst;
  reg cmm_err_tlp_posted;
  reg decr_cpl;
  wire [2:0] cpl_num;
  wire inc_dec_b;

  // Instantiate the Unit Under Test (UUT)
  cmm_errman_cpl uut (
    .cpl_num(cpl_num),
    .inc_dec_b(inc_dec_b),
    .cmm_err_tlp_posted(cmm_err_tlp_posted),
    .decr_cpl(decr_cpl),
    .rst(rst),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    cmm_err_tlp_posted = 0;
    decr_cpl = 0;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: No error, should increment
    #10;
    cmm_err_tlp_posted = 0; decr_cpl = 0; // Expect cpl_num = 3'b000, inc_dec_b = 1
    #10;
    if (cpl_num !== 3'b000 || inc_dec_b !== 1) $display("FAIL: Test case 1 failed");

    // Test case 2: Decrement, should decrement
    #10;
    cmm_err_tlp_posted = 0; decr_cpl = 1; // Expect cpl_num = 3'b001, inc_dec_b = 0
    #10;
    if (cpl_num !== 3'b001 || inc_dec_b !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: Error posted, should increment
    #10;
    cmm_err_tlp_posted = 1; decr_cpl = 0; // Expect cpl_num = 3'b001, inc_dec_b = 1
    #10;
    if (cpl_num !== 3'b001 || inc_dec_b !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: Error posted and decrement, should not change
    #10;
    cmm_err_tlp_posted = 1; decr_cpl = 1; // Expect cpl_num = 3'b000, inc_dec_b = 1
    #10;
    if (cpl_num !== 3'b000 || inc_dec_b !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: No error, should increment again
    #10;
    cmm_err_tlp_posted = 0; decr_cpl = 0; // Expect cpl_num = 3'b000, inc_dec_b = 1
    #10;
    if (cpl_num !== 3'b000 || inc_dec_b !== 1) $display("FAIL: Test case 5 failed");

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule