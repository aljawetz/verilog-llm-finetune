`timescale 1ns/1ps

module tb_NV_NVDLA_SDP_CORE_Y_idx_core_core_fsm;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  NV_NVDLA_SDP_CORE_Y_idx_core_core_fsm uut (
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

    // Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after enabling core_wen is incorrect, got %b", fsm_output);
      $finish;
    end

    // Check that the state remains the same when core_wen is still high
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain the same when core_wen is high, got %b", fsm_output);
      $finish;
    end

    // Disable core_wen and check that the state does not change
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain the same when core_wen is low, got %b", fsm_output);
      $finish;
    end

    // Re-enable core_wen and check state
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after re-enabling core_wen is incorrect, got %b", fsm_output);
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule