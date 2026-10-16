`timescale 1ns/1ps

module tb_NV_NVDLA_CDP_DP_INTP_UNIT_pipe_p10;

  reg nvdla_op_gated_clk_fp16;
  reg nvdla_core_rstn;
  reg [16:0] fp_mul_sync_in_pd_d2;
  reg fp_mul_sync_in_rdy_d3;
  reg fp_mul_sync_in_vld_d2;
  wire [16:0] fp_mul_sync_in_pd_d3;
  wire fp_mul_sync_in_rdy_d2;
  wire fp_mul_sync_in_vld_d3;

  // Instantiate the module under test
  NV_NVDLA_CDP_DP_INTP_UNIT_pipe_p10 uut (
    .nvdla_op_gated_clk_fp16(nvdla_op_gated_clk_fp16),
    .nvdla_core_rstn(nvdla_core_rstn),
    .fp_mul_sync_in_pd_d2(fp_mul_sync_in_pd_d2),
    .fp_mul_sync_in_rdy_d3(fp_mul_sync_in_rdy_d3),
    .fp_mul_sync_in_vld_d2(fp_mul_sync_in_vld_d2),
    .fp_mul_sync_in_pd_d3(fp_mul_sync_in_pd_d3),
    .fp_mul_sync_in_rdy_d2(fp_mul_sync_in_rdy_d2),
    .fp_mul_sync_in_vld_d3(fp_mul_sync_in_vld_d3)
  );

  // Clock generation
  initial begin
    nvdla_op_gated_clk_fp16 = 0;
    forever #5 nvdla_op_gated_clk_fp16 = ~nvdla_op_gated_clk_fp16;
  end

  // Test sequence
  initial begin
    // Initialize signals
    nvdla_core_rstn = 0;
    fp_mul_sync_in_pd_d2 = 17'b0;
    fp_mul_sync_in_rdy_d3 = 0;
    fp_mul_sync_in_vld_d2 = 0;

    // Release reset
    #10 nvdla_core_rstn = 1;

    // Test case 1: Valid data transfer
    fp_mul_sync_in_pd_d2 = 17'b10101010101010101; // Example data
    fp_mul_sync_in_vld_d2 = 1;
    fp_mul_sync_in_rdy_d3 = 1; // Ready to receive data
    #10;

    if (fp_mul_sync_in_pd_d3 !== fp_mul_sync_in_pd_d2 || fp_mul_sync_in_vld_d3 !== 1) begin
      $display("FAIL: Data transfer failed in test case 1");
      $finish;
    end

    // Test case 2: Valid data not ready
    fp_mul_sync_in_pd_d2 = 17'b11001100110011001; // New example data
    fp_mul_sync_in_vld_d2 = 1;
    fp_mul_sync_in_rdy_d3 = 0; // Not ready to receive data
    #10;

    if (fp_mul_sync_in_pd_d3 !== 17'b10101010101010101 || fp_mul_sync_in_vld_d3 !== 1) begin
      $display("FAIL: Data should not change when not ready in test case 2");
      $finish;
    end

    // Test case 3: Reset functionality
    #10 nvdla_core_rstn = 0; // Assert reset
    #10 nvdla_core_rstn = 1; // Release reset

    if (fp_mul_sync_in_vld_d3 !== 0) begin
      $display("FAIL: Output valid should be 0 after reset in test case 3");
      $finish;
    end

    // Test case 4: Valid data transfer after reset
    fp_mul_sync_in_pd_d2 = 17'b1111000011110000; // Another example data
    fp_mul_sync_in_vld_d2 = 1;
    fp_mul_sync_in_rdy_d3 = 1; // Ready to receive data
    #10;

    if (fp_mul_sync_in_pd_d3 !== fp_mul_sync_in_pd_d2 || fp_mul_sync_in_vld_d3 !== 1) begin
      $display("FAIL: Data transfer failed after reset in test case 4");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule