`timescale 1ns/1ps

module tb_dffp;

  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_syncrst;
  wire q_asyncrst;

  // Instantiate the module under test
  dffp uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_syncrst(q_syncrst),
    .q_asyncrst(q_asyncrst)
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
    d = 0;

    // Test 1: Check no reset behavior
    #10;
    d = 1; // Set D to 1
    #10;
    if (q !== 1) begin
      $display("FAIL: No reset behavior failed");
      $finish;
    end

    // Test 2: Check synchronous reset
    #10;
    reset = 1; // Activate synchronous reset
    #10;
    reset = 0; // Deactivate reset
    if (q_syncrst !== 0) begin
      $display("FAIL: Synchronous reset failed");
      $finish;
    end
    d = 1; // Set D to 1
    #10;
    if (q_syncrst !== 1) begin
      $display("FAIL: Synchronous reset behavior failed");
      $finish;
    end

    // Test 3: Check asynchronous reset
    #10;
    reset = 1; // Activate asynchronous reset
    #10;
    if (q_asyncrst !== 0) begin
      $display("FAIL: Asynchronous reset failed");
      $finish;
    end
    reset = 0; // Deactivate reset
    d = 1; // Set D to 1
    #10;
    if (q_asyncrst !== 1) begin
      $display("FAIL: Asynchronous reset behavior failed");
      $finish;
    end

    // Final check
    #10;
    $display("PASS");
    $finish;
  end

endmodule