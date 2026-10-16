`timescale 1ns/1ps

module tb_NV_NVDLA_CDMA_dma_mux;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg dc_dat2mcif_rd_req_valid;
  wire dc_dat2mcif_rd_req_ready;
  reg [78:0] dc_dat2mcif_rd_req_pd;
  reg dc_dat2cvif_rd_req_valid;
  wire dc_dat2cvif_rd_req_ready;
  reg [78:0] dc_dat2cvif_rd_req_pd;
  reg wg_dat2mcif_rd_req_valid;
  wire wg_dat2mcif_rd_req_ready;
  reg [78:0] wg_dat2mcif_rd_req_pd;
  reg wg_dat2cvif_rd_req_valid;
  wire wg_dat2cvif_rd_req_ready;
  reg [78:0] wg_dat2cvif_rd_req_pd;
  reg img_dat2mcif_rd_req_valid;
  wire img_dat2mcif_rd_req_ready;
  reg [78:0] img_dat2mcif_rd_req_pd;
  reg img_dat2cvif_rd_req_valid;
  wire img_dat2cvif_rd_req_ready;
  reg [78:0] img_dat2cvif_rd_req_pd;
  wire cdma_dat2mcif_rd_req_valid;
  reg cdma_dat2mcif_rd_req_ready;
  wire [78:0] cdma_dat2mcif_rd_req_pd;
  wire cdma_dat2cvif_rd_req_valid;
  reg cdma_dat2cvif_rd_req_ready;
  wire [78:0] cdma_dat2cvif_rd_req_pd;
  reg mcif2cdma_dat_rd_rsp_valid;
  wire mcif2cdma_dat_rd_rsp_ready;
  reg [513:0] mcif2cdma_dat_rd_rsp_pd;
  reg cvif2cdma_dat_rd_rsp_valid;
  wire cvif2cdma_dat_rd_rsp_ready;
  reg [513:0] cvif2cdma_dat_rd_rsp_pd;
  wire mcif2dc_dat_rd_rsp_valid;
  reg mcif2dc_dat_rd_rsp_ready;
  wire [513:0] mcif2dc_dat_rd_rsp_pd;
  wire cvif2dc_dat_rd_rsp_valid;
  reg cvif2dc_dat_rd_rsp_ready;
  wire [513:0] cvif2dc_dat_rd_rsp_pd;
  wire mcif2wg_dat_rd_rsp_valid;
  reg mcif2wg_dat_rd_rsp_ready;
  wire [513:0] mcif2wg_dat_rd_rsp_pd;
  wire cvif2wg_dat_rd_rsp_valid;
  reg cvif2wg_dat_rd_rsp_ready;
  wire [513:0] cvif2wg_dat_rd_rsp_pd;
  wire mcif2img_dat_rd_rsp_valid;
  reg mcif2img_dat_rd_rsp_ready;
  wire [513:0] mcif2img_dat_rd_rsp_pd;
  wire cvif2img_dat_rd_rsp_valid;
  reg cvif2img_dat_rd_rsp_ready;
  wire [513:0] cvif2img_dat_rd_rsp_pd;

  NV_NVDLA_CDMA_dma_mux uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .dc_dat2mcif_rd_req_valid(dc_dat2mcif_rd_req_valid),
    .dc_dat2mcif_rd_req_ready(dc_dat2mcif_rd_req_ready),
    .dc_dat2mcif_rd_req_pd(dc_dat2mcif_rd_req_pd),
    .dc_dat2cvif_rd_req_valid(dc_dat2cvif_rd_req_valid),
    .dc_dat2cvif_rd_req_ready(dc_dat2cvif_rd_req_ready),
    .dc_dat2cvif_rd_req_pd(dc_dat2cvif_rd_req_pd),
    .wg_dat2mcif_rd_req_valid(wg_dat2mcif_rd_req_valid),
    .wg_dat2mcif_rd_req_ready(wg_dat2mcif_rd_req_ready),
    .wg_dat2mcif_rd_req_pd(wg_dat2mcif_rd_req_pd),
    .wg_dat2cvif_rd_req_valid(wg_dat2cvif_rd_req_valid),
    .wg_dat2cvif_rd_req_ready(wg_dat2cvif_rd_req_ready),
    .wg_dat2cvif_rd_req_pd(wg_dat2cvif_rd_req_pd),
    .img_dat2mcif_rd_req_valid(img_dat2mcif_rd_req_valid),
    .img_dat2mcif_rd_req_ready(img_dat2mcif_rd_req_ready),
    .img_dat2mcif_rd_req_pd(img_dat2mcif_rd_req_pd),
    .img_dat2cvif_rd_req_valid(img_dat2cvif_rd_req_valid),
    .img_dat2cvif_rd_req_ready(img_dat2cvif_rd_req_ready),
    .img_dat2cvif_rd_req_pd(img_dat2cvif_rd_req_pd),
    .cdma_dat2mcif_rd_req_valid(cdma_dat2mcif_rd_req_valid),
    .cdma_dat2mcif_rd_req_ready(cdma_dat2mcif_rd_req_ready),
    .cdma_dat2mcif_rd_req_pd(cdma_dat2mcif_rd_req_pd),
    .cdma_dat2cvif_rd_req_valid(cdma_dat2cvif_rd_req_valid),
    .cdma_dat2cvif_rd_req_ready(cdma_dat2cvif_rd_req_ready),
    .cdma_dat2cvif_rd_req_pd(cdma_dat2cvif_rd_req_pd),
    .mcif2cdma_dat_rd_rsp_valid(mcif2cdma_dat_rd_rsp_valid),
    .mcif2cdma_dat_rd_rsp_ready(mcif2cdma_dat_rd_rsp_ready),
    .mcif2cdma_dat_rd_rsp_pd(mcif2cdma_dat_rd_rsp_pd),
    .cvif2cdma_dat_rd_rsp_valid(cvif2cdma_dat_rd_rsp_valid),
    .cvif2cdma_dat_rd_rsp_ready(cvif2cdma_dat_rd_rsp_ready),
    .cvif2cdma_dat_rd_rsp_pd(cvif2cdma_dat_rd_rsp_pd),
    .mcif2dc_dat_rd_rsp_valid(mcif2dc_dat_rd_rsp_valid),
    .mcif2dc_dat_rd_rsp_ready(mcif2dc_dat_rd_rsp_ready),
    .mcif2dc_dat_rd_rsp_pd(mcif2dc_dat_rd_rsp_pd),
    .cvif2dc_dat_rd_rsp_valid(cvif2dc_dat_rd_rsp_valid),
    .cvif2dc_dat_rd_rsp_ready(cvif2dc_dat_rd_rsp_ready),
    .cvif2dc_dat_rd_rsp_pd(cvif2dc_dat_rd_rsp_pd),
    .mcif2wg_dat_rd_rsp_valid(mcif2wg_dat_rd_rsp_valid),
    .mcif2wg_dat_rd_rsp_ready(mcif2wg_dat_rd_rsp_ready),
    .mcif2wg_dat_rd_rsp_pd(mcif2wg_dat_rd_rsp_pd),
    .cvif2wg_dat_rd_rsp_valid(cvif2wg_dat_rd_rsp_valid),
    .cvif2wg_dat_rd_rsp_ready(cvif2wg_dat_rd_rsp_ready),
    .cvif2wg_dat_rd_rsp_pd(cvif2wg_dat_rd_rsp_pd),
    .mcif2img_dat_rd_rsp_valid(mcif2img_dat_rd_rsp_valid),
    .mcif2img_dat_rd_rsp_ready(mcif2img_dat_rd_rsp_ready),
    .mcif2img_dat_rd_rsp_pd(mcif2img_dat_rd_rsp_pd),
    .cvif2img_dat_rd_rsp_valid(cvif2img_dat_rd_rsp_valid),
    .cvif2img_dat_rd_rsp_ready(cvif2img_dat_rd_rsp_ready),
    .cvif2img_dat_rd_rsp_pd(cvif2img_dat_rd_rsp_pd)
  );

  initial begin
    nvdla_core_clk = 0;
    nvdla_core_rstn = 0;
    dc_dat2mcif_rd_req_valid = 0;
    dc_dat2cvif_rd_req_valid = 0;
    wg_dat2mcif_rd_req_valid = 0;
    wg_dat2cvif_rd_req_valid = 0;
    img_dat2mcif_rd_req_valid = 0;
    img_dat2cvif_rd_req_valid = 0;
    mcif2cdma_dat_rd_rsp_valid = 0;
    cvif2cdma_dat_rd_rsp_valid = 0;

    #5 nvdla_core_rstn = 1;

    // Test sequence
    // Test DC to MCIF
    dc_dat2mcif_rd_req_valid = 1;
    dc_dat2mcif_rd_req_pd = 79'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5;
    #10;
    if (!dc_dat2mcif_rd_req_ready) begin
      $display("FAIL: DC to MCIF request not ready");
      $finish;
    end

    // Test WG to CVIF
    wg_dat2cvif_rd_req_valid = 1;
    wg_dat2cvif_rd_req_pd = 79'h5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5;
    #10;
    if (!wg_dat2cvif_rd_req_ready) begin
      $display("FAIL: WG to CVIF request not ready");
      $finish;
    end

    // Test IMG to MCIF
    img_dat2mcif_rd_req_valid = 1;
    img_dat2mcif_rd_req_pd = 79'h1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1;
    #10;
    if (!img_dat2mcif_rd_req_ready) begin
      $display("FAIL: IMG to MCIF request not ready");
      $finish;
    end

    // Test responses
    mcif2cdma_dat_rd_rsp_valid = 1;
    mcif2cdma_dat_rd_rsp_pd = 514'hDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF;
    #10;
    if (!mcif2cdma_dat_rd_rsp_ready) begin
      $display("FAIL: MCIF response not ready");
      $finish;
    end

    cvif2cdma_dat_rd_rsp_valid = 1;
    cvif2cdma_dat_rd_rsp_pd = 514'hFEEDBEEFFEEDBEEFFEEDBEEFFEEDBEEFFEEDBEEFFEEDBEEFFEEDBEEFFEEDBEEF;
    #10;
    if (!cvif2cdma_dat_rd_rsp_ready) begin
      $display("FAIL: CVIF response not ready");
      $finish;
    end

    $display("PASS");
    $finish;
  end

  always #5 nvdla_core_clk = ~nvdla_core_clk;

endmodule