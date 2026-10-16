`timescale 1ns/1ps

module tb_HLS_fp32_add_core;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp32_add_core_core_fsm uut (
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

    // Activate core_wen to transition to main state
    core_wen = 1;
    #10;
    core_wen = 0; // Deactivate core_wen

    // Check output in main state
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output in main state is incorrect, got %b", fsm_output);
      $finish;
    end

    // Check that state remains the same when core_wen is deactivated
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain in main state, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule