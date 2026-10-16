`timescale 1ns/1ps

module tb_ticker;

  // Testbench signals
  reg clk;
  reg reset;
  wire tick;

  // Instantiate the module under test (uut)
  ticker uut (
    .clk(clk),
    .reset(reset),
    .tick(tick)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1; // Start with reset active
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Test counting and tick assertion
    #10; // Wait for 10ns
    if (uut.count !== 2'b00) $display("FAIL: Count should be 0 after reset");

    #10; // Wait for 10ns
    if (uut.count !== 2'b01) $display("FAIL: Count should be 1");

    #10; // Wait for 10ns
    if (uut.count !== 2'b10) $display("FAIL: Count should be 2");

    #10; // Wait for 10ns
    if (uut.count !== 2'b11) $display("FAIL: Count should be 3");
    if (tick !== 1'b1) $display("FAIL: Tick should be high when count is 3");

    #10; // Wait for 10ns
    if (uut.count !== 2'b00) $display("FAIL: Count should reset to 0 after tick");
    if (tick !== 1'b0) $display("FAIL: Tick should be low after reset");

    // Test reset functionality
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    reset = 0; // Release reset

    #10; // Wait for 10ns
    if (uut.count !== 2'b01) $display("FAIL: Count should be 1 after reset is released");

    // Final check
    #10; // Wait for 10ns
    if (uut.count !== 2'b10) $display("FAIL: Count should be 2");

    #10; // Wait for 10ns
    if (uut.count !== 2'b11) $display("FAIL: Count should be 3");
    if (tick !== 1'b1) $display("FAIL: Tick should be high when count is 3");

    // End of test
    $display("PASS");
    $finish;
  end

endmodule