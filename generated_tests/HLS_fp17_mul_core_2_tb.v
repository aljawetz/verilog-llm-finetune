`timescale 1ns/1ps

module tb_HLS_fp17_mul_core;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp17_mul_core_core_fsm uut (
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
    #10;

    // Check initial state
    if (fsm_output !== 2'b1) begin
      $display("FAIL: Initial state output is incorrect, expected 2'b1 but got %b", fsm_output);
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;

    // Check output after enabling core_wen
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after core_wen is incorrect, expected 2'b10 but got %b", fsm_output);
      $finish;
    end

    // Check that the output remains the same after core_wen is asserted
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output changed unexpectedly, expected 2'b10 but got %b", fsm_output);
      $finish;
    end

    // Deassert core_wen and check output
    core_wen = 0;
    #10;

    // Check that output remains the same when core_wen is deasserted
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output changed unexpectedly after deasserting core_wen, expected 2'b10 but got %b", fsm_output);
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule