`timescale 1ns/1ps

module tb_HLS_fp16_to_fp17_core_core_fsm;

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

    // Reset the FSM
    #10;
    nvdla_core_rstn = 1; // Release reset
    #10;

    // Check initial state after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Enable the FSM
    core_wen = 1;
    #10;

    // Check output in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output in main state is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Keep the FSM in main state
    #10;

    // Check output remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 2'b10 in main state, got %b", fsm_output);
      $finish;
    end

    // Disable the FSM
    core_wen = 0;
    #10;

    // Check output remains the same when disabled
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 2'b10 when core_wen is low, got %b", fsm_output);
      $finish;
    end

    // Re-enable the FSM
    core_wen = 1;
    #10;

    // Check output again in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output in main state is incorrect after re-enabling, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule