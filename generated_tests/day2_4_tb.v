`timescale 1ns/1ps

module tb_day2;

  reg clk;
  reg reset;
  reg d_i;
  wire q_norst_o;
  wire q_asyncrst_o;
  wire q_syncrst_o;

  // Instantiate the module under test
  day2 uut (
    .clk(clk),
    .reset(reset),
    .d_i(d_i),
    .q_norst_o(q_norst_o),
    .q_asyncrst_o(q_asyncrst_o),
    .q_syncrst_o(q_syncrst_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d_i = 0;

    // Wait for a clock cycle
    #10;

    // Release reset
    reset = 0;

    // Test case 1: Check no reset register
    d_i = 1; #10;
    if (q_norst_o !== 1) begin
      $display("FAIL: q_norst_o should be 1 after d_i is set to 1");
      $finish;
    end

    // Test case 2: Check synchronous reset
    reset = 1; #10;
    if (q_syncrst_o !== 0) begin
      $display("FAIL: q_syncrst_o should be 0 after synchronous reset");
      $finish;
    end

    // Test case 3: Check asynchronous reset
    reset = 0; d_i = 1; #10;
    if (q_asyncrst_o !== 1) begin
      $display("FAIL: q_asyncrst_o should be 1 after d_i is set to 1");
      $finish;
    end

    // Apply asynchronous reset
    reset = 1; #10;
    if (q_asyncrst_o !== 0) begin
      $display("FAIL: q_asyncrst_o should be 0 after asynchronous reset");
      $finish;
    end

    // Test case 4: Check registers after reset
    reset = 0; d_i = 1; #10;
    if (q_norst_o !== 1 || q_syncrst_o !== 1 || q_asyncrst_o !== 1) begin
      $display("FAIL: All outputs should be 1 after d_i is set to 1");
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end

endmodule