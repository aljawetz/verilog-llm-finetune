`timescale 1ns/1ps

module tb_NV_NVDLA_RT_SDP2NOCIF_pipe_p4;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [78:0] sdp_b2mcif_rd_req_src_pd_d0;
  reg sdp_b2mcif_rd_req_src_ready_d1;
  reg sdp_b2mcif_rd_req_src_valid_d0;
  wire [78:0] sdp_b2mcif_rd_req_src_pd_d1;
  wire sdp_b2mcif_rd_req_src_ready_d0;
  wire sdp_b2mcif_rd_req_src_valid_d1;

  // Instantiate the module under test (uut)
  NV_NVDLA_RT_SDP2NOCIF_pipe_p4 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .sdp_b2mcif_rd_req_src_pd_d0(sdp_b2mcif_rd_req_src_pd_d0),
    .sdp_b2mcif_rd_req_src_ready_d1(sdp_b2mcif_rd_req_src_ready_d1),
    .sdp_b2mcif_rd_req_src_valid_d0(sdp_b2mcif_rd_req_src_valid_d0),
    .sdp_b2mcif_rd_req_src_pd_d1(sdp_b2mcif_rd_req_src_pd_d1),
    .sdp_b2mcif_rd_req_src_ready_d0(sdp_b2mcif_rd_req_src_ready_d0),
    .sdp_b2mcif_rd_req_src_valid_d1(sdp_b2mcif_rd_req_src_valid_d1)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    sdp_b2mcif_rd_req_src_pd_d0 = 0;
    sdp_b2mcif_rd_req_src_ready_d1 = 0;
    sdp_b2mcif_rd_req_src_valid_d0 = 0;

    // Release reset after 20ns
    #20 nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid data is sent and ready is high
    #10;
    sdp_b2mcif_rd_req_src_pd_d0 = 79'h1; // Sending some data
    sdp_b2mcif_rd_req_src_valid_d0 = 1;
    sdp_b2mcif_rd_req_src_ready_d1 = 1; // Ready to receive
    #10;

    // Check output
    if (sdp_b2mcif_rd_req_src_pd_d1 !== 79'h1) begin
      $display("FAIL: Output data mismatch on first valid transfer");
      $finish;
    end

    // Test case 2: Valid data is sent but ready is low
    #10;
    sdp_b2mcif_rd_req_src_ready_d1 = 0; // Not ready
    #10;

    // Check output
    if (sdp_b2mcif_rd_req_src_valid_d1 !== 1) begin
      $display("FAIL: Valid signal should remain high when ready is low");
      $finish;
    end

    // Test case 3: Ready goes high again
    #10;
    sdp_b2mcif_rd_req_src_ready_d1 = 1; // Ready again
    #10;

    // Check output
    if (sdp_b2mcif_rd_req_src_pd_d1 !== 79'h1) begin
      $display("FAIL: Output data mismatch after ready goes high");
      $finish;
    end

    // Test case 4: Reset the module
    #10;
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Check outputs after reset
    if (sdp_b2mcif_rd_req_src_valid_d1 !== 0) begin
      $display("FAIL: Valid signal should be low after reset");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule