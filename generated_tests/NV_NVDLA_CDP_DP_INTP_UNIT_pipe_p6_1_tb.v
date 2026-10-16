`timescale 1ns/1ps

module tb_NV_NVDLA_CDP_DP_INTP_UNIT_pipe_p6;

  reg nvdla_op_gated_clk_fp16;
  reg nvdla_core_rstn;
  reg [33:0] fp_sub_sync_in_pd_d5;
  reg fp_sub_sync_in_rdy_d6;
  reg fp_sub_sync_in_vld_d5;
  
  wire [33:0] fp_sub_sync_in_pd_d6;
  wire fp_sub_sync_in_rdy_d5;
  wire fp_sub_sync_in_vld_d6;

  // Instantiate the module under test
  NV_NVDLA_CDP_DP_INTP_UNIT_pipe_p6 uut (
    .nvdla_op_gated_clk_fp16(nvdla_op_gated_clk_fp16),
    .nvdla_core_rstn(nvdla_core_rstn),
    .fp_sub_sync_in_pd_d5(fp_sub_sync_in_pd_d5),
    .fp_sub_sync_in_rdy_d6(fp_sub_sync_in_rdy_d6),
    .fp_sub_sync_in_vld_d5(fp_sub_sync_in_vld_d5),
    .fp_sub_sync_in_pd_d6(fp_sub_sync_in_pd_d6),
    .fp_sub_sync_in_rdy_d5(fp_sub_sync_in_rdy_d5),
    .fp_sub_sync_in_vld_d6(fp_sub_sync_in_vld_d6)
  );

  // Clock generation
  initial begin
    nvdla_op_gated_clk_fp16 = 0;
    forever #5 nvdla_op_gated_clk_fp16 = ~nvdla_op_gated_clk_fp16;
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    fp_sub_sync_in_pd_d5 = 34'h0;
    fp_sub_sync_in_rdy_d6 = 0;
    fp_sub_sync_in_vld_d5 = 0;

    // Release reset
    #10 nvdla_core_rstn = 1;

    // Test case 1: Valid data transfer
    #10;
    fp_sub_sync_in_pd_d5 = 34'hA5A5A5A5; // Example data
    fp_sub_sync_in_vld_d5 = 1;
    fp_sub_sync_in_rdy_d6 = 1; // Ready to receive data

    #10;
    if (fp_sub_sync_in_pd_d6 !== 34'hA5A5A5A5) begin
      $display("FAIL: Data mismatch on valid transfer");
      $finish;
    end

    if (fp_sub_sync_in_vld_d6 !== 1) begin
      $display("FAIL: Output valid signal not set correctly");
      $finish;
    end

    // Test case 2: No valid data transfer
    #10;
    fp_sub_sync_in_vld_d5 = 0; // No valid data
    fp_sub_sync_in_rdy_d6 = 1; // Still ready

    #10;
    if (fp_sub_sync_in_pd_d6 !== 34'hA5A5A5A5) begin
      $display("FAIL: Data should not change when valid is low");
      $finish;
    end

    if (fp_sub_sync_in_vld_d6 !== 0) begin
      $display("FAIL: Output valid signal should be low when input valid is low");
      $finish;
    end

    // Test case 3: Reset behavior
    #10;
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    #10;
    if (fp_sub_sync_in_vld_d6 !== 0) begin
      $display("FAIL: Output valid signal should be low after reset");
      $finish;
    end

    // Test case 4: Check ready signal
    #10;
    fp_sub_sync_in_vld_d5 = 1;
    fp_sub_sync_in_rdy_d6 = 0; // Not ready

    #10;
    if (fp_sub_sync_in_rdy_d5 !== 0) begin
      $display("FAIL: Ready signal should be low when downstream is not ready");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule