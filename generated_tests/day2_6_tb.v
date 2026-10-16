`timescale 1ns/1ps

module tb_day2;

  // Testbench signals
  reg clk;
  reg reset;
  reg d_i;
  wire q_norst_o;
  wire q_syncrst_o;
  wire q_asyncrst_o;

  // Instantiate the module under test (uut)
  day2 uut (
    .clk(clk),
    .reset(reset),
    .d_i(d_i),
    .q_norst_o(q_norst_o),
    .q_syncrst_o(q_syncrst_o),
    .q_asyncrst_o(q_asyncrst_o)
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
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test without reset
    d_i = 1;
    #10;
    if (q_norst_o !== 1) begin
      $display("FAIL: q_norst_o should be 1 after d_i is set to 1");
      $finish;
    end

    // Test synchronous reset
    reset = 1;
    #10;
    if (q_syncrst_o !== 0) begin
      $display("FAIL: q_syncrst_o should be 0 after synchronous reset");
      $finish;
    end

    reset = 0;
    d_i = 1;
    #10;
    if (q_syncrst_o !== 1) begin
      $display("FAIL: q_syncrst_o should be 1 after d_i is set to 1");
      $finish;
    end

    // Test asynchronous reset
    reset = 1;
    #10;
    if (q_asyncrst_o !== 0) begin
      $display("FAIL: q_asyncrst_o should be 0 after asynchronous reset");
      $finish;
    end

    reset = 0;
    d_i = 1;
    #10;
    if (q_asyncrst_o !== 1) begin
      $display("FAIL: q_asyncrst_o should be 1 after d_i is set to 1");
      $finish;
    end

    // Final checks
    reset = 1;
    #10;
    if (q_norst_o !== 1 || q_syncrst_o !== 0 || q_asyncrst_o !== 0) begin
      $display("FAIL: Outputs should be q_norst_o=1, q_syncrst_o=0, q_asyncrst_o=0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule