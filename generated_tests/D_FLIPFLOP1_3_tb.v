`timescale 1ns/1ps

module tb_D_FLIPFLOP1;

  reg D;
  reg CLK;
  reg SYNC_RESET;
  wire Q;

  // Instantiate the D flip-flop module
  D_FLIPFLOP1 uut (
    .D(D),
    .CLK(CLK),
    .SYNC_RESET(SYNC_RESET),
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
    SYNC_RESET = 0;

    // Test 1: Check reset functionality
    SYNC_RESET = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test 2: Check D input functionality
    SYNC_RESET = 0; // Deactivate reset
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is 1");
      $finish;
    end

    // Test 3: Change D input
    D = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when D is 0");
      $finish;
    end

    // Test 4: Check reset again
    SYNC_RESET = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test 5: Check D input functionality again
    SYNC_RESET = 0; // Deactivate reset
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is 1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule