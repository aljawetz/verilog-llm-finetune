`timescale 1ns/1ps

module tb_NV_NVDLA_RT_SDP2NOCIF_pipe_p5;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [78:0] sdp_b2cvif_rd_req_src_pd_d0;
  reg sdp_b2cvif_rd_req_src_ready_d1;
  reg sdp_b2cvif_rd_req_src_valid_d0;
  wire [78:0] sdp_b2cvif_rd_req_src_pd_d1;
  wire sdp_b2cvif_rd_req_src_ready_d0;
  wire sdp_b2cvif_rd_req_src_valid_d1;

  NV_NVDLA_RT_SDP2NOCIF_pipe_p5 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .sdp_b2cvif_rd_req_src_pd_d0(sdp_b2cvif_rd_req_src_pd_d0),
    .sdp_b2cvif_rd_req_src_ready_d1(sdp_b2cvif_rd_req_src_ready_d1),
    .sdp_b2cvif_rd_req_src_valid_d0(sdp_b2cvif_rd_req_src_valid_d0),
    .sdp_b2cvif_rd_req_src_pd_d1(sdp_b2cvif_rd_req_src_pd_d1),
    .sdp_b2cvif_rd_req_src_ready_d0(sdp_b2cvif_rd_req_src_ready_d0),
    .sdp_b2cvif_rd_req_src_valid_d1(sdp_b2cvif_rd_req_src_valid_d1)
  );

  initial begin
    nvdla_core_clk = 0;
    nvdla_core_rstn = 0;
    sdp_b2cvif_rd_req_src_pd_d0 = 0;
    sdp_b2cvif_rd_req_src_ready_d1 = 0;
    sdp_b2cvif_rd_req_src_valid_d0 = 0;

    #5 nvdla_core_rstn = 1; // Release reset
    #10;

    // Test sequence 1: Valid data transfer
    sdp_b2cvif_rd_req_src_pd_d0 = 79'h1; // Set data
    sdp_b2cvif_rd_req_src_valid_d0 = 1; // Assert valid
    sdp_b2cvif_rd_req_src_ready_d1 = 1; // Assert ready
    #10;

    if (sdp_b2cvif_rd_req_src_pd_d1 !== 79'h1 || sdp_b2cvif_rd_req_src_valid_d1 !== 1) begin
      $display("FAIL: Data transfer failed on first test");
      $finish;
    end

    // Test sequence 2: Valid data transfer with ready deasserted
    sdp_b2cvif_rd_req_src_ready_d1 = 0; // Deassert ready
    #10;

    if (sdp_b2cvif_rd_req_src_valid_d1 !== 1) begin
      $display("FAIL: Valid signal should remain asserted when ready is deasserted");
      $finish;
    end

    // Test sequence 3: Valid data transfer after ready is asserted again
    sdp_b2cvif_rd_req_src_ready_d1 = 1; // Assert ready again
    #10;

    if (sdp_b2cvif_rd_req_src_pd_d1 !== 79'h1 || sdp_b2cvif_rd_req_src_valid_d1 !== 1) begin
      $display("FAIL: Data transfer failed after ready reassertion");
      $finish;
    end

    // Test sequence 4: Reset behavior
    sdp_b2cvif_rd_req_src_valid_d0 = 0; // Deassert valid
    nvdla_core_rstn = 0; // Assert reset
    #5 nvdla_core_rstn = 1; // Release reset
    #10;

    if (sdp_b2cvif_rd_req_src_valid_d1 !== 0) begin
      $display("FAIL: Valid signal should be deasserted after reset");
      $finish;
    end

    $display("PASS");
    $finish;
  end

  always #5 nvdla_core_clk = ~nvdla_core_clk; // Clock generation

endmodule