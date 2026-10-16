`timescale 1ns/1ps

module tb_HLS_fp16_to_fp17_core;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp16_to_fp17_core_core_fsm uut (
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

    // Wait for reset to take effect
    #10;

    // Check initial state after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Enable the FSM
    core_wen = 1;

    // Check state transition
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State output is incorrect after enabling, got %b", fsm_output);
      $finish;
    end

    // Keep the FSM enabled and check output remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State output changed unexpectedly, got %b", fsm_output);
      $finish;
    end

    // Disable the FSM
    core_wen = 0;

    // Check output remains the same when disabled
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State output changed when disabled, got %b", fsm_output);
      $finish;
    end

    // Re-enable the FSM
    core_wen = 1;

    // Check output remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State output changed unexpectedly after re-enabling, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule