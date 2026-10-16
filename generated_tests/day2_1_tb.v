`timescale 1ns/1ps

module tb_day2;

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

    // Wait for a clock cycle
    #10;

    // Release reset
    reset = 0;
    #10;

    // Test 1: Capture d_i = 1
    d_i = 1;
    #10;
    if (q_norst_o !== 1 || q_syncrst_o !== 1 || q_asyncrst_o !== 1) begin
      $display("FAIL: Test 1 failed");
      $finish;
    end

    // Test 2: Capture d_i = 0
    d_i = 0;
    #10;
    if (q_norst_o !== 0 || q_syncrst_o !== 0 || q_asyncrst_o !== 0) begin
      $display("FAIL: Test 2 failed");
      $finish;
    end

    // Test 3: Synchronous reset
    reset = 1;
    #10;
    if (q_syncrst_o !== 0) begin
      $display("FAIL: Test 3 failed");
      $finish;
    end

    // Release synchronous reset
    reset = 0;
    #10;

    // Test 4: Asynchronous reset
    d_i = 1;
    reset = 1;
    #10;
    if (q_asyncrst_o !== 0) begin
      $display("FAIL: Test 4 failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule