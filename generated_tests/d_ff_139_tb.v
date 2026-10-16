`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg reset;
  reg d;
  wire q;
  wire qbar;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .qbar(qbar)
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
    d = 0;

    // Wait for a clock cycle
    #10;

    // Test 1: Reset functionality
    reset = 0; // Active low reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check D flip-flop behavior
    d = 1; // Set D to 1
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: q did not update to 1 on clock edge");
      $finish;
    end

    // Test 3: Check D flip-flop behavior with reset
    reset = 1; // Activate reset
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0 when active");
      $finish;
    end

    // Test 4: Check D flip-flop behavior after reset
    reset = 0; // Deactivate reset
    d = 0; // Set D to 0
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: q did not update to 0 on clock edge");
      $finish;
    end

    // Test 5: Check D flip-flop behavior with d = 1
    d = 1; // Set D to 1
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: q did not update to 1 on clock edge");
      $finish;
    end

    // Test 6: Check qbar output
    if (qbar !== 0) begin
      $display("FAIL: qbar did not output the complement of q");
      $finish;
    end

    // Final check: Reset again
    reset = 1; // Activate reset
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0 on final check");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule