`timescale 1ns/1ps

module tb_T;
  reg T;
  reg CLK;
  reg RST;
  wire Q;

  // Instantiate the T flip-flop module
  T uut (
    .T(T),
    .CLK(CLK),
    .RST(RST),
    .Q(Q)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    T = 0;
    RST = 0;

    // Test 1: Reset functionality
    RST = 1; // Assert reset
    #10; // Wait for a clock edge
    RST = 0; // Deassert reset
    #10; // Wait for a clock edge
    if (Q !== 1'b0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test 2: Toggle functionality
    T = 1; // Set T to toggle
    #10; // Wait for a clock edge
    if (Q !== 1'b1) begin
      $display("FAIL: Q should be 1 after toggle");
      $finish;
    end

    #10; // Wait for a clock edge
    if (Q !== 1'b0) begin
      $display("FAIL: Q should be 0 after second toggle");
      $finish;
    end

    #10; // Wait for a clock edge
    if (Q !== 1'b1) begin
      $display("FAIL: Q should be 1 after third toggle");
      $finish;
    end

    // Test 3: No toggle when T is low
    T = 0; // Set T to not toggle
    #10; // Wait for a clock edge
    if (Q !== 1'b1) begin
      $display("FAIL: Q should remain 1 when T is 0");
      $finish;
    end

    #10; // Wait for a clock edge
    if (Q !== 1'b1) begin
      $display("FAIL: Q should remain 1 when T is 0");
      $finish;
    end

    // Test 4: Reset while toggling
    T = 1; // Set T to toggle
    #10; // Wait for a clock edge
    RST = 1; // Assert reset
    #10; // Wait for a clock edge
    if (Q !== 1'b0) begin
      $display("FAIL: Q should be 0 after reset during toggle");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end
endmodule