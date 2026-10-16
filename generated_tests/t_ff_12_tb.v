`timescale 1ns/1ps

module tb_t_ff;

  reg clk;
  reg reset;
  reg t;
  wire q;
  wire qbar;

  // Instantiate the module under test (uut)
  t_ff uut (
    .clk(clk),
    .reset(reset),
    .t(t),
    .q(q),
    .qbar(qbar)
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
    t = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10; // Wait for 10ns

    // Test case 1: Toggle when t is high
    t = 1; // Set t high
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: Toggle again
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0; // Set t low
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 4: Toggle when t is high again
    t = 1; // Set t high
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 5: Reset functionality
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Expected q=0 after reset, got q=%b", q);
      $finish;
    end

    // Test case 6: Check qbar output
    reset = 0; // Release reset
    t = 1; // Set t high
    #10; // Wait for 10ns
    if (qbar !== 0) begin
      $display("FAIL: Expected qbar=0, got qbar=%b", qbar);
      $finish;
    end

    // Final check for qbar after toggle
    #10; // Wait for 10ns
    if (qbar !== 1) begin
      $display("FAIL: Expected qbar=1, got qbar=%b", qbar);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule