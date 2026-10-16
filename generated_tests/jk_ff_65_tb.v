`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg reset;
  reg j;
  reg k;
  wire q;

  // Instantiate the module under test (uut)
  jk_ff uut (
    .clk(clk),
    .reset(reset),
    .j(j),
    .k(k),
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
    reset = 1;
    j = 0;
    k = 0;
    #10; // Wait for a clock cycle

    // Release reset
    reset = 0;
    #10; // Wait for a clock cycle

    // Test case 1: J = 0, K = 0 (no change)
    j = 0; k = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Test case 1 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 2: J = 0, K = 1 (reset to 0)
    j = 0; k = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Test case 2 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 3: J = 1, K = 0 (set to 1)
    j = 1; k = 0;
    #10;
    if (q !== 1) begin
      $display("FAIL: Test case 3 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 4: J = 1, K = 1 (toggle)
    j = 1; k = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Test case 4 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 5: J = 1, K = 1 (toggle again)
    #10;
    if (q !== 1) begin
      $display("FAIL: Test case 5 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 6: J = 0, K = 0 (no change)
    j = 0; k = 0;
    #10;
    if (q !== 1) begin
      $display("FAIL: Test case 6 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 7: Reset the flip-flop
    reset = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Test case 7 failed, expected q = 0 after reset, got q = %b", q);
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end

endmodule