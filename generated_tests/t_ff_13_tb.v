`timescale 1ns/1ps

module tb_t_ff;
  reg clk;
  reg reset;
  reg t;
  wire q;

  // Instantiate the T flip-flop
  t_ff uut (
    .clk(clk),
    .reset(reset),
    .t(t),
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
    t = 0;

    // Apply reset
    #10;
    reset = 0;

    // Test case 1: Check reset functionality
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Toggle q when t is high
    t = 1; // Set T to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not toggle to 1 when t is high");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not toggle to 0 when t is high");
      $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0; // Set T to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q toggled when t is low");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q changed when t is low");
      $finish;
    end

    // Test case 4: Reset functionality during operation
    #10;
    reset = 1; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 during operation");
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end
endmodule