`timescale 1ns/1ps

module tb_HLS_fp16_to_fp32_core;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp16_to_fp32_core_core_fsm uut (
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
    // Initialize inputs
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Wait for a clock cycle
    #10;

    // Check initial state after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Enable core
    core_wen = 1;
    #10;

    // Check state after enabling
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after enabling is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Keep core enabled and check state remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain 2'b10, got %b", fsm_output);
      $finish;
    end

    // Disable core
    core_wen = 0;
    #10;

    // Check state should remain the same when disabled
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain 2'b10 when disabled, got %b", fsm_output);
      $finish;
    end

    // Re-enable core
    core_wen = 1;
    #10;

    // Check state after re-enabling
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after re-enabling is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule