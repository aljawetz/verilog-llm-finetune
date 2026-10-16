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
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    d = 0;

    // Apply reset
    #3 rst = 0; // Release reset
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
    rst = 1; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset, got q = %b", q);
      $finish;
    end

    // Test case 4: Load d = 1 after reset
    rst = 0; // Release reset
    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1 after loading d = 1, got q = %b", q);
      $finish;
    end

    // Test case 5: Load d = 0 again
    d = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after loading d = 0, got q = %b", q);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule