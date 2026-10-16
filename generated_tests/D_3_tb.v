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
    #10; // Wait for a clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when RST is high");
      $finish;
    end

    RST = 0; // Deassert reset
    #10; // Wait for a clock cycle

    // Test 2: Check D input functionality
    D = 1; // Set D to 1
    #10; // Wait for a clock cycle
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is 1 and RST is low");
      $finish;
    end

    D = 0; // Set D to 0
    #10; // Wait for a clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when D is 0 and RST is low");
      $finish;
    end

    // Test 3: Check multiple clock cycles
    D = 1; // Set D to 1
    #10; // Wait for a clock cycle
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 after D is set to 1");
      $finish;
    end

    D = 0; // Set D to 0
    #10; // Wait for a clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after D is set to 0");
      $finish;
    end

    // Test 4: Check reset during operation
    D = 1; // Set D to 1
    #10; // Wait for a clock cycle
    RST = 1; // Assert reset
    #10; // Wait for a clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after RST is asserted");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule