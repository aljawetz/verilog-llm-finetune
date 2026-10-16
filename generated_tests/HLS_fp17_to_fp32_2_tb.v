`timescale 1ns/1ps

module tb_HLS_fp17_to_fp32;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp17_to_fp32_core_core_fsm uut (
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

    // Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Enable core write
    core_wen = 1;
    #10;

    // Check output in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output in main state is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Keep core write enabled and check output remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 2'b10 while core_wen is high, got %b", fsm_output);
      $finish;
    end

    // Disable core write
    core_wen = 0;
    #10;

    // Check output remains the same when core_wen is low
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 2'b10 when core_wen is low, got %b", fsm_output);
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule