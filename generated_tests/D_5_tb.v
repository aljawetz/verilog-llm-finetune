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
    // Initialize signals
    D = 0;
    RST = 0;

    // Test 1: Check reset functionality
    RST = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test 2: Check D input functionality
    RST = 0; // Deassert reset
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is 1");
      $finish;
    end

    // Test 3: Check D input functionality with D = 0
    D = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when D is 0");
      $finish;
    end

    // Test 4: Check reset functionality again
    RST = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test 5: Check D input functionality after reset
    RST = 0; // Deassert reset
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is 1");
      $finish;
    end

    // Test 6: Final check with D = 0
    D = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when D is 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule