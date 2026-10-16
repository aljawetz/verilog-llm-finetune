`timescale 1ns/1ps

module tb_dff;
  reg D;
  reg clk;
  reg RST;
  wire Q;
  wire Qb;

  // Instantiate the D flip-flop
  dff uut (
    .D(D),
    .clk(clk),
    .RST(RST),
    .Q(Q),
    .Qb(Qb)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    D = 0;
    RST = 1; // Assert reset
    #10;     // Wait for 10ns
    RST = 0; // Deassert reset

    // Test 1: Check initial state after reset
    if (Q !== 0 || Qb !== 1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test 2: Set D to 1 and clock
    D = 1;
    #10; // Wait for one clock cycle
    if (Q !== 1 || Qb !== 0) begin
      $display("FAIL: Q and Qb are incorrect after setting D to 1");
      $finish;
    end

    // Test 3: Set D to 0 and clock
    D = 0;
    #10; // Wait for one clock cycle
    if (Q !== 0 || Qb !== 1) begin
      $display("FAIL: Q and Qb are incorrect after setting D to 0");
      $finish;
    end

    // Test 4: Assert reset again
    RST = 1; 
    #10; // Wait for reset to take effect
    if (Q !== 0 || Qb !== 1) begin
      $display("FAIL: Q and Qb are incorrect after asserting reset");
      $finish;
    end

    // Test 5: Deassert reset and set D to 1
    RST = 0;
    D = 1;
    #10; // Wait for one clock cycle
    if (Q !== 1 || Qb !== 0) begin
      $display("FAIL: Q and Qb are incorrect after deasserting reset and setting D to 1");
      $finish;
    end

    // Test 6: Deassert reset and set D to 0
    D = 0;
    #10; // Wait for one clock cycle
    if (Q !== 0 || Qb !== 1) begin
      $display("FAIL: Q and Qb are incorrect after deasserting reset and setting D to 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule