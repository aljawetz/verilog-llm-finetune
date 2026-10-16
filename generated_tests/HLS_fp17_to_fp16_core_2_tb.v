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
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
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

    // Enable core
    core_wen = 1;

    // Check initial state after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Wait for a clock cycle
    #10;

    // Check output in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output in main state is incorrect, got %b", fsm_output);
      $finish;
    end

    // Continue to check the output in main state
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output in main state is incorrect, got %b", fsm_output);
      $finish;
    end

    // Disable core and check output
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain in main state when core_wen is low, got %b", fsm_output);
      $finish;
    end

    // Re-enable core and check output
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output in main state is incorrect after re-enabling, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule