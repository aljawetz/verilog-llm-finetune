`timescale 1ns/1ps

module tb_HLS_fp17_to_fp16_core;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp17_to_fp16_core_core_fsm uut (
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
    nvdla_core_rstn = 1;

    // Wait for a clock cycle
    #10;

    // Check initial state after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;

    // Check output in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output in main state is incorrect");
      $finish;
    end

    // Disable core_wen and check if state remains the same
    core_wen = 0;
    #10;

    // Check output remains in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain in main state when core_wen is low");
      $finish;
    end

    // Re-enable core_wen and check state
    core_wen = 1;
    #10;

    // Check output remains in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain in main state after re-enabling core_wen");
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule