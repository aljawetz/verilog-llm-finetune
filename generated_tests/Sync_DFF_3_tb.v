`timescale 1ns/1ps

module tb_Sync_DFF;

  reg clk;
  reg D;
  reg reset_n;
  reg clear_n;
  wire Q;

  // Instantiate the module under test (uut)
  Sync_DFF uut (
    .clk(clk),
    .D(D),
    .reset_n(reset_n),
    .clear_n(clear_n),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset_n = 1;
    clear_n = 1;
    D = 0;

    // Test 1: Check reset functionality
    reset_n = 0; // Activate reset
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end

    reset_n = 1; // Deactivate reset
    #10;

    // Test 2: Check clear functionality
    clear_n = 0; // Activate clear
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Clear did not set Q to 1");
      $finish;
    end

    clear_n = 1; // Deactivate clear
    #10;

    // Test 3: Check D input functionality
    D = 1; // Set D to 1
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not follow D when clear_n is high");
      $finish;
    end

    D = 0; // Set D to 0
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not follow D when clear_n is high");
      $finish;
    end

    // Test 4: Check behavior with reset and clear
    reset_n = 0; // Activate reset
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end

    reset_n = 1; // Deactivate reset
    clear_n = 0; // Activate clear
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Clear did not set Q to 1 after reset");
      $finish;
    end

    // Final check
    clear_n = 1; // Deactivate clear
    D = 1; // Set D to 1
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not follow D after clear is deactivated");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule