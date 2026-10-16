`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg rstn;
  reg t;
  wire q;

  // Instantiate the T flip-flop
  tff uut (
    .clk(clk),
    .rstn(rstn),
    .t(t),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rstn = 0;
    t = 0;

    // Apply reset
    #10;
    rstn = 1; // Release reset

    // Test case 1: Check reset functionality
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Test case 2: Toggle when t is high
    t = 1; // Set t high
    #10; // Wait for a clock edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after toggling");
      $finish;
    end

    #10; // Wait for another clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after toggling again");
      $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0; // Set t low
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: q should remain 0 when t is low");
      $finish;
    end

    #10; // Wait for another clock edge
    if (q !== 0) begin
      $display("FAIL: q should remain 0 when t is low");
      $finish;
    end

    // Test case 4: Toggle when t is high again
    t = 1; // Set t high
    #10; // Wait for a clock edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after toggling again");
      $finish;
    end

    #10; // Wait for another clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after toggling again");
      $finish;
    end

    // Test case 5: Reset functionality
    rstn = 0; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule