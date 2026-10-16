`timescale 1ns/1ps

module tb_NV_NVDLA_RT_SDP2NOCIF_pipe_p2;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [513:0] mcif2sdp_b_rd_rsp_src_pd_d0;
  reg mcif2sdp_b_rd_rsp_src_ready_d1;
  reg mcif2sdp_b_rd_rsp_src_valid_d0;
  wire [513:0] mcif2sdp_b_rd_rsp_src_pd_d1;
  wire mcif2sdp_b_rd_rsp_src_ready_d0;
  wire mcif2sdp_b_rd_rsp_src_valid_d1;

  NV_NVDLA_RT_SDP2NOCIF_pipe_p2 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .mcif2sdp_b_rd_rsp_src_pd_d0(mcif2sdp_b_rd_rsp_src_pd_d0),
    .mcif2sdp_b_rd_rsp_src_ready_d1(mcif2sdp_b_rd_rsp_src_ready_d1),
    .mcif2sdp_b_rd_rsp_src_valid_d0(mcif2sdp_b_rd_rsp_src_valid_d0),
    .mcif2sdp_b_rd_rsp_src_pd_d1(mcif2sdp_b_rd_rsp_src_pd_d1),
    .mcif2sdp_b_rd_rsp_src_ready_d0(mcif2sdp_b_rd_rsp_src_ready_d0),
    .mcif2sdp_b_rd_rsp_src_valid_d1(mcif2sdp_b_rd_rsp_src_valid_d1)
  );

  initial begin
    nvdla_core_clk = 0;
    nvdla_core_rstn = 0;
    mcif2sdp_b_rd_rsp_src_pd_d0 = 0;
    mcif2sdp_b_rd_rsp_src_ready_d1 = 0;
    mcif2sdp_b_rd_rsp_src_valid_d0 = 0;

    // Reset the DUT
    #5 nvdla_core_rstn = 1;
    #5 nvdla_core_rstn = 0;
    #5 nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid data transfer
    mcif2sdp_b_rd_rsp_src_pd_d0 = 514'hDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF;
    mcif2sdp_b_rd_rsp_src_valid_d0 = 1;
    mcif2sdp_b_rd_rsp_src_ready_d1 = 1;

    #10;
    if (mcif2sdp_b_rd_rsp_src_valid_d1 !== 1 || mcif2sdp_b_rd_rsp_src_pd_d1 !== mcif2sdp_b_rd_rsp_src_pd_d0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Valid data not ready
    mcif2sdp_b_rd_rsp_src_valid_d0 = 1;
    mcif2sdp_b_rd_rsp_src_ready_d1 = 0;

    #10;
    if (mcif2sdp_b_rd_rsp_src_valid_d1 !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Ready signal goes high
    mcif2sdp_b_rd_rsp_src_ready_d1 = 1;

    #10;
    if (mcif2sdp_b_rd_rsp_src_valid_d1 !== 1 || mcif2sdp_b_rd_rsp_src_pd_d1 !== mcif2sdp_b_rd_rsp_src_pd_d0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Valid signal goes low
    mcif2sdp_b_rd_rsp_src_valid_d0 = 0;

    #10;
    if (mcif2sdp_b_rd_rsp_src_valid_d1 !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

  always #5 nvdla_core_clk = ~nvdla_core_clk;

endmodule