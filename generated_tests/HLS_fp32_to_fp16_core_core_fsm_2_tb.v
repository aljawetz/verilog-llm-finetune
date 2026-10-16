`timescale 1ns/1ps

module tb_HLS_fp32_to_fp16_core_core_fsm;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_to_fp16_core_core_fsm uut (
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
    nvdla_core_rstn = 1; // Release reset
    #10;

    // Check initial state after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Enable the FSM
    core_wen = 1;
    #10;

    // Check state after enabling
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after enabling is incorrect, got %b", fsm_output);
      $finish;
    end

    // Keep the FSM enabled and check the output remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain the same when enabled, got %b", fsm_output);
      $finish;
    end

    // Disable the FSM
    core_wen = 0;
    #10;

    // Check state remains the same when disabled
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain the same when disabled, got %b", fsm_output);
      $finish;
    end

    // Re-enable the FSM
    core_wen = 1;
    #10;

    // Check state again
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after re-enabling is incorrect, got %b", fsm_output);
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule