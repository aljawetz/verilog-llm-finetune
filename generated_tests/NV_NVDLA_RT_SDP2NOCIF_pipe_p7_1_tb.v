`timescale 1ns/1ps

module tb_NV_NVDLA_RT_SDP2NOCIF_pipe_p7;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [513:0] mcif2sdp_rd_rsp_src_pd_d0;
  reg mcif2sdp_rd_rsp_src_ready_d1;
  reg mcif2sdp_rd_rsp_src_valid_d0;
  wire [513:0] mcif2sdp_rd_rsp_src_pd_d1;
  wire mcif2sdp_rd_rsp_src_ready_d0;
  wire mcif2sdp_rd_rsp_src_valid_d1;

  // Instantiate the module under test
  NV_NVDLA_RT_SDP2NOCIF_pipe_p7 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .mcif2sdp_rd_rsp_src_pd_d0(mcif2sdp_rd_rsp_src_pd_d0),
    .mcif2sdp_rd_rsp_src_ready_d1(mcif2sdp_rd_rsp_src_ready_d1),
    .mcif2sdp_rd_rsp_src_valid_d0(mcif2sdp_rd_rsp_src_valid_d0),
    .mcif2sdp_rd_rsp_src_pd_d1(mcif2sdp_rd_rsp_src_pd_d1),
    .mcif2sdp_rd_rsp_src_ready_d0(mcif2sdp_rd_rsp_src_ready_d0),
    .mcif2sdp_rd_rsp_src_valid_d1(mcif2sdp_rd_rsp_src_valid_d1)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    mcif2sdp_rd_rsp_src_ready_d1 = 0;
    mcif2sdp_rd_rsp_src_valid_d0 = 0;
    mcif2sdp_rd_rsp_src_pd_d0 = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid data transfer
    mcif2sdp_rd_rsp_src_pd_d0 = 514'hDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF;
    mcif2sdp_rd_rsp_src_valid_d0 = 1;
    mcif2sdp_rd_rsp_src_ready_d1 = 1; // Simulate ready signal
    #10;

    if (mcif2sdp_rd_rsp_src_pd_d1 !== mcif2sdp_rd_rsp_src_pd_d0) begin
      $display("FAIL: Data mismatch on valid transfer");
      $finish;
    end

    if (mcif2sdp_rd_rsp_src_valid_d1 !== 1) begin
      $display("FAIL: Valid signal not propagated correctly");
      $finish;
    end

    // Test case 2: Valid signal not ready
    mcif2sdp_rd_rsp_src_valid_d0 = 1;
    mcif2sdp_rd_rsp_src_ready_d1 = 0; // Simulate not ready
    #10;

    if (mcif2sdp_rd_rsp_src_valid_d1 !== 1) begin
      $display("FAIL: Valid signal should remain high when not ready");
      $finish;
    end

    // Test case 3: Reset behavior
    mcif2sdp_rd_rsp_src_valid_d0 = 0;
    mcif2sdp_rd_rsp_src_ready_d1 = 1; // Simulate ready
    #10;

    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Release reset
    #10;

    if (mcif2sdp_rd_rsp_src_valid_d1 !== 0) begin
      $display("FAIL: Valid signal should be low after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule