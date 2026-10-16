`timescale 1ns/1ps

module tb_tff;

  reg t;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the T flip-flop
  tff uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; // Start with reset active
    t = 0;

    // Wait for a clock edge
    #10;
    
    // Release reset
    rst = 0;
    #10;

    // Test case 1: t = 0, q should remain unchanged
    t = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 2: t = 1, q should toggle
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 3: t = 1, q should toggle again
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 4: t = 0, q should remain unchanged
    t = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 5: t = 1, q should toggle
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 6: Reset the flip-flop
    rst = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset, got q = %b", q);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule