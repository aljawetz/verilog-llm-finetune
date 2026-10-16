`timescale 1ns/1ps

module tb_NV_NVDLA_PDP_CORE_CAL2D_pipe_p3;

  // Parameters
  reg nvdla_op_gated_clk_fp16;
  reg nvdla_core_rstn;
  reg [254:0] din_pd_d2;
  reg din_rdy_d3;
  reg din_vld_d2;
  wire [254:0] din_pd_d3;
  wire din_rdy_d2;
  wire din_vld_d3;

  // Instantiate the Unit Under Test (UUT)
  NV_NVDLA_PDP_CORE_CAL2D_pipe_p3 uut (
    .nvdla_op_gated_clk_fp16(nvdla_op_gated_clk_fp16),
    .nvdla_core_rstn(nvdla_core_rstn),
    .din_pd_d2(din_pd_d2),
    .din_rdy_d3(din_rdy_d3),
    .din_vld_d2(din_vld_d2),
    .din_pd_d3(din_pd_d3),
    .din_rdy_d2(din_rdy_d2),
    .din_vld_d3(din_vld_d3)
  );

  // Clock generation
  initial begin
    nvdla_op_gated_clk_fp16 = 0;
    forever #5 nvdla_op_gated_clk_fp16 = ~nvdla_op_gated_clk_fp16; // 100MHz clock
  end

  // Reset and stimulus
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    din_pd_d2 = 0;
    din_rdy_d3 = 0;
    din_vld_d2 = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid data transfer
    din_pd_d2 = 255; // some data
    din_vld_d2 = 1;
    din_rdy_d3 = 1; // ready to receive
    #10;

    if (din_pd_d3 !== din_pd_d2 || din_vld_d3 !== din_vld_d2) begin
      $display("FAIL: Test case 1 failed - Output data or valid signal mismatch");
      $finish;
    end

    // Test case 2: Valid data not ready
    din_vld_d2 = 1;
    din_rdy_d3 = 0; // not ready to receive
    #10;

    if (din_pd_d3 !== din_pd_d2 || din_vld_d3 !== 1) begin
      $display("FAIL: Test case 2 failed - Output valid signal should remain high");
      $finish;
    end

    // Test case 3: Reset behavior
    din_vld_d2 = 0;
    #10;
    nvdla_core_rstn = 0; // assert reset
    #10;
    nvdla_core_rstn = 1; // deassert reset

    if (din_vld_d3 !== 0) begin
      $display("FAIL: Test case 3 failed - Output valid signal should be low after reset");
      $finish;
    end

    // Test case 4: Valid data transfer after reset
    din_pd_d2 = 128; // new data
    din_vld_d2 = 1;
    din_rdy_d3 = 1; // ready to receive
    #10;

    if (din_pd_d3 !== din_pd_d2 || din_vld_d3 !== din_vld_d2) begin
      $display("FAIL: Test case 4 failed - Output data or valid signal mismatch after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule