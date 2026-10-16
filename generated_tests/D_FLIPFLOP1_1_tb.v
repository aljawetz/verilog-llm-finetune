`timescale 1ns/1ps

module tb_D_FLIPFLOP1;

  // Inputs
  reg D;
  reg CLK;
  reg SYNC_RESET;

  // Output
  wire Q;

  // Instantiate the Unit Under Test (UUT)
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

    // Test 1: Check normal operation without reset
    #10; // Wait for a clock edge
    D = 1; // Set D to 1
    #10; // Wait for next clock edge
    if (Q !== 1) begin
      $display("FAIL: Expected Q=1, got Q=%b", Q);
      $finish;
    end

    // Test 2: Check reset functionality
    SYNC_RESET = 1; // Activate reset
    #10; // Wait for next clock edge
    if (Q !== 0) begin
      $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
      $finish;
    end

    // Test 3: Check that D is loaded after reset is deactivated
    SYNC_RESET = 0; // Deactivate reset
    D = 1; // Set D to 1
    #10; // Wait for next clock edge
    if (Q !== 1) begin
      $display("FAIL: Expected Q=1 after reset deactivated, got Q=%b", Q);
      $finish;
    end

    // Test 4: Check that Q follows D
    D = 0; // Set D to 0
    #10; // Wait for next clock edge
    if (Q !== 0) begin
      $display("FAIL: Expected Q=0, got Q=%b", Q);
      $finish;
    end

    // Test 5: Check reset again
    SYNC_RESET = 1; // Activate reset
    #10; // Wait for next clock edge
    if (Q !== 0) begin
      $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule