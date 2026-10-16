`timescale 1ns/1ps

module tb_NV_NVDLA_RT_SDP2NOCIF_pipe_p1;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [78:0] sdp2mcif_rd_req_src_pd_d0;
  reg sdp2mcif_rd_req_src_ready_d1;
  reg sdp2mcif_rd_req_src_valid_d0;
  wire [78:0] sdp2mcif_rd_req_src_pd_d1;
  wire sdp2mcif_rd_req_src_ready_d0;
  wire sdp2mcif_rd_req_src_valid_d1;

  // Instantiate the module under test (uut)
  NV_NVDLA_RT_SDP2NOCIF_pipe_p1 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .sdp2mcif_rd_req_src_pd_d0(sdp2mcif_rd_req_src_pd_d0),
    .sdp2mcif_rd_req_src_ready_d1(sdp2mcif_rd_req_src_ready_d1),
    .sdp2mcif_rd_req_src_valid_d0(sdp2mcif_rd_req_src_valid_d0),
    .sdp2mcif_rd_req_src_pd_d1(sdp2mcif_rd_req_src_pd_d1),
    .sdp2mcif_rd_req_src_ready_d0(sdp2mcif_rd_req_src_ready_d0),
    .sdp2mcif_rd_req_src_valid_d1(sdp2mcif_rd_req_src_valid_d1)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    sdp2mcif_rd_req_src_valid_d0 = 0;
    sdp2mcif_rd_req_src_ready_d1 = 0;
    sdp2mcif_rd_req_src_pd_d0 = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid data transfer
    sdp2mcif_rd_req_src_pd_d0 = 79'h1; // Example data
    sdp2mcif_rd_req_src_valid_d0 = 1;
    sdp2mcif_rd_req_src_ready_d1 = 1; // Sink is ready
    #10;

    if (sdp2mcif_rd_req_src_pd_d1 !== sdp2mcif_rd_req_src_pd_d0) begin
      $display("FAIL: Data mismatch on valid transfer");
      $finish;
    end

    // Test case 2: Valid data not ready
    sdp2mcif_rd_req_src_valid_d0 = 1;
    sdp2mcif_rd_req_src_ready_d1 = 0; // Sink is not ready
    #10;

    if (sdp2mcif_rd_req_src_valid_d1 !== 1) begin
      $display("FAIL: Valid signal should remain high when not ready");
      $finish;
    end

    // Test case 3: Reset behavior
    sdp2mcif_rd_req_src_valid_d0 = 0;
    sdp2mcif_rd_req_src_ready_d1 = 1;
    #10;

    if (sdp2mcif_rd_req_src_valid_d1 !== 0) begin
      $display("FAIL: Valid signal should be low after reset");
      $finish;
    end

    // Test case 4: Valid signal propagation
    sdp2mcif_rd_req_src_valid_d0 = 1;
    sdp2mcif_rd_req_src_ready_d1 = 1; // Sink is ready
    #10;

    if (sdp2mcif_rd_req_src_valid_d1 !== 1) begin
      $display("FAIL: Valid signal should propagate when ready");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule