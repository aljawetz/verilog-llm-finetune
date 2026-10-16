`timescale 1ns/1ps

module tb_xgate_bypass_reg;

  // Testbench signals
  reg jtag_tdi;
  reg capture_clk;
  reg jtag_reset_n;
  wire bypass_so;

  // Instantiate the module under test (uut)
  xgate_bypass_reg uut (
    .bypass_so(bypass_so),
    .jtag_tdi(jtag_tdi),
    .capture_clk(capture_clk),
    .jtag_reset_n(jtag_reset_n)
  );

  // Clock generation
  initial begin
    capture_clk = 0;
    forever #5 capture_clk = ~capture_clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    jtag_tdi = 0;
    jtag_reset_n = 0; // Assert reset

    // Wait for a few clock cycles
    #10;

    // Release reset
    jtag_reset_n = 1;

    // Test case 1: Capture jtag_tdi when jtag_reset_n is high
    jtag_tdi = 1; // Set jtag_tdi to 1
    #10; // Wait for one clock cycle
    if (bypass_so !== 1) begin
      $display("FAIL: Expected bypass_so to be 1, got %b", bypass_so);
      $finish;
    end

    // Test case 2: Change jtag_tdi and capture new value
    jtag_tdi = 0; // Change jtag_tdi to 0
    #10; // Wait for one clock cycle
    if (bypass_so !== 0) begin
      $display("FAIL: Expected bypass_so to be 0, got %b", bypass_so);
      $finish;
    end

    // Test case 3: Assert reset and check bypass_so
    jtag_reset_n = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (bypass_so !== 0) begin
      $display("FAIL: Expected bypass_so to be 0 after reset, got %b", bypass_so);
      $finish;
    end

    // Test case 4: Release reset and capture new jtag_tdi
    jtag_reset_n = 1; // Release reset
    jtag_tdi = 1; // Set jtag_tdi to 1
    #10; // Wait for one clock cycle
    if (bypass_so !== 1) begin
      $display("FAIL: Expected bypass_so to be 1, got %b", bypass_so);
      $finish;
    end

    // Test case 5: Final check with jtag_tdi = 0
    jtag_tdi = 0; // Change jtag_tdi to 0
    #10; // Wait for one clock cycle
    if (bypass_so !== 0) begin
      $display("FAIL: Expected bypass_so to be 0, got %b", bypass_so);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule