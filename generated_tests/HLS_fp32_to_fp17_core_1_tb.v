`timescale 1ns/1ps

module tb_HLS_fp32_to_fp17_core;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp32_to_fp17_core_core_fsm uut (
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
      $display("FAIL: Initial output after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Enable core write
    core_wen = 1;

    // Wait for a clock cycle
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling core_wen is incorrect, got %b", fsm_output);
      $finish;
    end

    // Check that the output remains constant
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output changed unexpectedly, got %b", fsm_output);
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule