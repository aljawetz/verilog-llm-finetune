`timescale 1ns/1ps

module tb_jk_ff;
  reg j, k, clk;
  wire qbar;
  wire q;

  // Instantiate the jk_ff module
  jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .q(q),
    .qbar(qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    j = 0; k = 0;
    #10; // Wait for 10ns

    // Test case 1: j=0, k=0 (no change)
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Initial state incorrect");
      $finish;
    end

    // Test case 2: j=0, k=1 (reset)
    j = 0; k = 1;
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: j=0, k=1 failed");
      $finish;
    end

    // Test case 3: j=1, k=0 (set)
    j = 1; k = 0;
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: j=1, k=0 failed");
      $finish;
    end

    // Test case 4: j=1, k=1 (toggle)
    j = 1; k = 1;
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: j=1, k=1 failed on first toggle");
      $finish;
    end

    // Toggle again
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: j=1, k=1 failed on second toggle");
      $finish;
    end

    // Test case 5: j=0, k=0 (no change)
    j = 0; k = 0;
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: j=0, k=0 failed after toggle");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule