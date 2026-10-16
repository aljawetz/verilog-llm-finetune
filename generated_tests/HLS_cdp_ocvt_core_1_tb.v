`timescale 1ns/1ps

module tb_HLS_cdp_ocvt_core;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_cdp_ocvt_core_core_fsm uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .core_wen(core_wen),
    .fsm_output(fsm_output)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Wait for a clock cycle
    #10;

    // Check initial state after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Enable core write
    core_wen = 1;

    // Wait for a clock cycle
    #10;

    // Check output after enabling core_wen
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling core_wen is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Keep core_wen high and check output remains stable
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 2'b10, got %b", fsm_output);
      $finish;
    end

    // Disable core_wen and check output
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after disabling core_wen is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule