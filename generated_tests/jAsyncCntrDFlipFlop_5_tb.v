`timescale 1ns/1ps

module tb_jAsyncCntrDFlipFlop;

  // Testbench signals
  reg clk;
  reg rst;
  reg d;
  wire q;
  wire qbar;

  // Instantiate the module under test (uut)
  jAsyncCntrDFlipFlop uut (
    .q(q),
    .qbar(qbar),
    .clk(clk),
    .rst(rst),
    .d(d)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    d = 0;

    // Apply reset
    #3;
    rst = 0; // Release reset
    #10;

    // Test case 1: Load d = 1
    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 2: Load d = 0
    d = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 3: Assert reset
    rst = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset, got q = %b", q);
      $finish;
    end

    // Test case 4: Load d = 1 again
    rst = 0; // Release reset
    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 5: Check qbar
    if (qbar !== 0) begin
      $display("FAIL: Expected qbar = 0, got qbar = %b", qbar);
      $finish;
    end

    // Test case 6: Load d = 0 and check qbar
    d = 0;
    #10;
    if (qbar !== 1) begin
      $display("FAIL: Expected qbar = 1, got qbar = %b", qbar);
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end

endmodule