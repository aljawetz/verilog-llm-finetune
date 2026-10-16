`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg reset;
  reg t;
  wire q;

  // Instantiate the T flip-flop
  tff uut (
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
    t = 1;
    #10; // Falling edge of clk
    if (q !== 1'b1) begin
      $display("FAIL: q did not toggle to 1 when t is high");
      $finish;
    end

    #10; // Falling edge of clk
    if (q !== 1'b0) begin
      $display("FAIL: q did not toggle to 0 when t is high");
      $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0;
    #10; // Falling edge of clk
    if (q !== 1'b0) begin
      $display("FAIL: q toggled when t is low");
      $finish;
    end

    #10; // Falling edge of clk
    if (q !== 1'b0) begin
      $display("FAIL: q toggled when t is low");
      $finish;
    end

    // Test case 4: Check reset functionality again
    reset = 1;
    #10;
    reset = 0;

    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 after second reset");
      $finish;
    end

    // Test case 5: Toggle q again with t high
    t = 1;
    #10; // Falling edge of clk
    if (q !== 1'b1) begin
      $display("FAIL: q did not toggle to 1 after reset when t is high");
      $finish;
    end

    #10; // Falling edge of clk
    if (q !== 1'b0) begin
      $display("FAIL: q did not toggle to 0 after reset when t is high");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule