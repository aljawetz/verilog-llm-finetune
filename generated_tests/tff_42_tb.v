`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg rstn;
  reg t;
  wire q;
  wire qbar;

  // Instantiate the T flip-flop
  tff uut (
    .clk(clk),
    .rstn(rstn),
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
    rstn = 0;
    t = 0;

    // Apply reset
    #10;
    rstn = 1; // Release reset

    // Test case 1: Check reset behavior
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset behavior failed");
      $finish;
    end

    // Test case 2: Toggle q when t = 1
    t = 1;
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Toggle failed on first toggle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Toggle failed on second toggle");
      $finish;
    end

    // Test case 3: No toggle when t = 0
    t = 0;
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: No toggle failed when t = 0");
      $finish;
    end

    // Test case 4: Toggle again with t = 1
    t = 1;
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Toggle failed on third toggle");
      $finish;
    end

    // Test case 5: Reset during operation
    rstn = 0;
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset during operation failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule