`timescale 1ns/1ps

module tb_ad_adl5904_rst;

  // Testbench signals
  reg sys_cpu_clk;
  reg rf_peak_det_n;
  wire rf_peak_rst;

  // Instantiate the module under test (uut)
  ad_adl5904_rst uut (
    .sys_cpu_clk(sys_cpu_clk),
    .rf_peak_det_n(rf_peak_det_n),
    .rf_peak_rst(rf_peak_rst)
  );

  // Clock generation
  initial begin
    sys_cpu_clk = 0;
    forever #5 sys_cpu_clk = ~sys_cpu_clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rf_peak_det_n = 1; // Start with rf_peak_det_n high

    // Wait for a few clock cycles
    #10;

    // Test case 1: Assert reset when rf_peak_det_n goes low
    rf_peak_det_n = 0; // Trigger the detector
    #10; // Wait for a few clock cycles
    if (rf_peak_rst !== 1) begin
      $display("FAIL: Expected rf_peak_rst to be 1 when rf_peak_det_n goes low");
      $finish;
    end

    // Test case 2: Deassert reset when rf_peak_det_n goes high
    rf_peak_det_n = 1; // Release the detector
    #10; // Wait for a few clock cycles
    if (rf_peak_rst !== 0) begin
      $display("FAIL: Expected rf_peak_rst to be 0 when rf_peak_det_n goes high");
      $finish;
    end

    // Test case 3: Check for stable state
    rf_peak_det_n = 0; // Trigger the detector again
    #10; // Wait for a few clock cycles
    if (rf_peak_rst !== 1) begin
      $display("FAIL: Expected rf_peak_rst to be 1 when rf_peak_det_n is low");
      $finish;
    end

    // Test case 4: Check reset deassertion
    rf_peak_det_n = 1; // Release the detector
    #10; // Wait for a few clock cycles
    if (rf_peak_rst !== 0) begin
      $display("FAIL: Expected rf_peak_rst to be 0 when rf_peak_det_n is high");
      $finish;
    end

    // Final check for stability
    rf_peak_det_n = 0; // Trigger the detector
    #10; // Wait for a few clock cycles
    if (rf_peak_rst !== 1) begin
      $display("FAIL: Expected rf_peak_rst to be 1 when rf_peak_det_n is low");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule