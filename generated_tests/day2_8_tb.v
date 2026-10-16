`timescale 1ns/1ps

module tb_day2;

  reg clk;
  reg reset;
  reg d_i;
  wire q_norst_o;
  wire q_syncrst_o;
  wire q_asyncrst_o;

  // Instantiate the module under test
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
    reset = 0;
    d_i = 0;

    // Test 1: No reset behavior
    #10;
    d_i = 1; // Set input
    #10;
    if (q_norst_o !== 1) begin
      $display("FAIL: q_norst_o did not latch d_i correctly");
      $finish;
    end

    // Test 2: Synchronous reset
    #10;
    reset = 1; // Assert reset
    #10;
    reset = 0; // Deassert reset
    d_i = 0; // Change input
    #10;
    if (q_syncrst_o !== 0) begin
      $display("FAIL: q_syncrst_o did not reset to 0 synchronously");
      $finish;
    end
    #10;
    if (q_syncrst_o !== 0) begin
      $display("FAIL: q_syncrst_o did not hold value after reset");
      $finish;
    end
    #10;
    d_i = 1; // Set input
    #10;
    if (q_syncrst_o !== 1) begin
      $display("FAIL: q_syncrst_o did not latch d_i correctly after reset");
      $finish;
    end

    // Test 3: Asynchronous reset
    #10;
    d_i = 0; // Change input
    reset = 1; // Assert reset
    #10;
    if (q_asyncrst_o !== 0) begin
      $display("FAIL: q_asyncrst_o did not reset to 0 asynchronously");
      $finish;
    end
    reset = 0; // Deassert reset
    #10;
    d_i = 1; // Set input
    #10;
    if (q_asyncrst_o !== 1) begin
      $display("FAIL: q_asyncrst_o did not latch d_i correctly after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule