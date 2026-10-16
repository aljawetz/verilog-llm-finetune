`timescale 1ns/1ps

module tb_D;
  reg D;
  reg CLK;
  reg RST;
  wire Q;

  // Instantiate the D flip-flop module
  D uut (
    .D(D),
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
    // Initialize inputs
    D = 0;
    RST = 0;

    // Test 1: Check reset functionality
    RST = 1; // Assert reset
    #10; // Wait for a clock edge
    if (Q !== 0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end

    RST = 0; // Deassert reset
    #10; // Wait for a clock edge

    // Test 2: Check D input functionality
    D = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (Q !== 1) begin
      $display("FAIL: Q did not update to D when D=1");
      $finish;
    end

    D = 0; // Set D to 0
    #10; // Wait for a clock edge
    if (Q !== 0) begin
      $display("FAIL: Q did not update to D when D=0");
      $finish;
    end

    // Test 3: Check multiple clock edges
    D = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (Q !== 1) begin
      $display("FAIL: Q did not update to D when D=1 on second clock edge");
      $finish;
    end

    D = 0; // Set D to 0
    #10; // Wait for a clock edge
    if (Q !== 0) begin
      $display("FAIL: Q did not update to D when D=0 on second clock edge");
      $finish;
    end

    // Test 4: Check reset during operation
    D = 1; // Set D to 1
    #10; // Wait for a clock edge
    RST = 1; // Assert reset
    #10; // Wait for a clock edge
    if (Q !== 0) begin
      $display("FAIL: Q did not reset to 0 during operation");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule