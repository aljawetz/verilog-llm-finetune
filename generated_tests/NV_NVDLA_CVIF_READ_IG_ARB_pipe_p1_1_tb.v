`timescale 1ns/1ps

module tb_NV_NVDLA_CVIF_READ_IG_ARB_pipe_p1;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg arb_src0_rdy;
  reg [74:0] bpt2arb_req0_pd;
  reg bpt2arb_req0_valid;
  wire [74:0] arb_src0_pd;
  wire arb_src0_vld;
  wire bpt2arb_req0_ready;

  // Instantiate the module under test (uut)
  NV_NVDLA_CVIF_READ_IG_ARB_pipe_p1 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .arb_src0_rdy(arb_src0_rdy),
    .bpt2arb_req0_pd(bpt2arb_req0_pd),
    .bpt2arb_req0_valid(bpt2arb_req0_valid),
    .arb_src0_pd(arb_src0_pd),
    .arb_src0_vld(arb_src0_vld),
    .bpt2arb_req0_ready(bpt2arb_req0_ready)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0; // Assert reset
    arb_src0_rdy = 0;
    bpt2arb_req0_valid = 0;
    bpt2arb_req0_pd = 75'h0;

    #10;
    nvdla_core_rstn = 1; // Deassert reset

    // Test sequence
    // Test case 1: Valid data transfer
    #10;
    bpt2arb_req0_pd = 75'hA5A5A5A5A5A5A5A5A5A; // Sample data
    bpt2arb_req0_valid = 1;
    arb_src0_rdy = 1; // Ready to receive

    #10;
    if (arb_src0_vld && arb_src0_pd == bpt2arb_req0_pd) begin
      $display("PASS");
    end else begin
      $display("FAIL: Data mismatch or valid not asserted");
      $finish;
    end

    // Test case 2: Valid data not ready
    #10;
    arb_src0_rdy = 0; // Not ready to receive
    #10;
    bpt2arb_req0_pd = 75'h5A5A5A5A5A5A5A5A5A5; // New sample data
    bpt2arb_req0_valid = 1;

    #10;
    if (bpt2arb_req0_ready == 0 && arb_src0_vld == 0) begin
      $display("PASS");
    end else begin
      $display("FAIL: Expected not ready condition");
      $finish;
    end

    // Test case 3: Reset behavior
    #10;
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Deassert reset

    #10;
    if (arb_src0_vld == 0 && bpt2arb_req0_ready == 0) begin
      $display("PASS");
    end else begin
      $display("FAIL: Expected outputs to be low after reset");
      $finish;
    end

    // End simulation
    $finish;
  end

endmodule