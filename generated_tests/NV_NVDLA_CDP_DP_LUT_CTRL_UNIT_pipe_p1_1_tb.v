`timescale 1ns/1ps

module tb_NV_NVDLA_CDP_DP_LUT_CTRL_UNIT_pipe_p1;

  reg nvdla_op_gated_clk_int;
  reg nvdla_core_rstn;
  reg [55:0] Y_stage1_in_pd_d0;
  reg Y_stage1_in_rdy_d1;
  reg Y_stage1_in_vld_d0;
  wire [55:0] Y_stage1_in_pd_d1;
  wire Y_stage1_in_rdy_d0;
  wire Y_stage1_in_vld_d1;

  // Instantiate the Unit Under Test (UUT)
  NV_NVDLA_CDP_DP_LUT_CTRL_UNIT_pipe_p1 uut (
    .nvdla_op_gated_clk_int(nvdla_op_gated_clk_int),
    .nvdla_core_rstn(nvdla_core_rstn),
    .Y_stage1_in_pd_d0(Y_stage1_in_pd_d0),
    .Y_stage1_in_rdy_d1(Y_stage1_in_rdy_d1),
    .Y_stage1_in_vld_d0(Y_stage1_in_vld_d0),
    .Y_stage1_in_pd_d1(Y_stage1_in_pd_d1),
    .Y_stage1_in_rdy_d0(Y_stage1_in_rdy_d0),
    .Y_stage1_in_vld_d1(Y_stage1_in_vld_d1)
  );

  initial begin
    // Initialize signals
    nvdla_op_gated_clk_int = 0;
    nvdla_core_rstn = 0;
    Y_stage1_in_pd_d0 = 56'b0;
    Y_stage1_in_rdy_d1 = 0;
    Y_stage1_in_vld_d0 = 0;

    // Apply reset
    #5 nvdla_core_rstn = 1;

    // Test sequence
    #10;
    Y_stage1_in_pd_d0 = 56'hA5A5A5A5A5A5A5A5; // Test data
    Y_stage1_in_vld_d0 = 1; // Valid data
    Y_stage1_in_rdy_d1 = 1; // Ready to receive

    // Clock cycle
    #10 nvdla_op_gated_clk_int = 1;
    #10 nvdla_op_gated_clk_int = 0;

    // Check output
    if (Y_stage1_in_pd_d1 !== Y_stage1_in_pd_d0) begin
      $display("FAIL: Output data mismatch");
      $finish;
    end

    // Check valid and ready signals
    if (Y_stage1_in_vld_d1 !== 1) begin
      $display("FAIL: Output valid signal is not set");
      $finish;
    end

    if (Y_stage1_in_rdy_d0 !== 1) begin
      $display("FAIL: Output ready signal is not set");
      $finish;
    end

    // Test bubble-collapse behavior
    #10;
    Y_stage1_in_vld_d0 = 0; // Remove valid
    #10 nvdla_op_gated_clk_int = 1;
    #10 nvdla_op_gated_clk_int = 0;

    // Check that valid is not set when input is not valid
    if (Y_stage1_in_vld_d1 !== 0) begin
      $display("FAIL: Output valid signal should be cleared");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

  // Clock generation
  always begin
    #5 nvdla_op_gated_clk_int = ~nvdla_op_gated_clk_int;
  end

endmodule