`timescale 1ns/1ps

module tb_NV_NVDLA_CVIF_READ_IG_ARB_pipe_p8;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg arb_src7_rdy;
  reg [74:0] bpt2arb_req7_pd;
  reg bpt2arb_req7_valid;
  wire [74:0] arb_src7_pd;
  wire arb_src7_vld;
  wire bpt2arb_req7_ready;

  // Instantiate the module under test
  NV_NVDLA_CVIF_READ_IG_ARB_pipe_p8 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .arb_src7_rdy(arb_src7_rdy),
    .bpt2arb_req7_pd(bpt2arb_req7_pd),
    .bpt2arb_req7_valid(bpt2arb_req7_valid),
    .arb_src7_pd(arb_src7_pd),
    .arb_src7_vld(arb_src7_vld),
    .bpt2arb_req7_ready(bpt2arb_req7_ready)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0; // Assert reset
    arb_src7_rdy = 0;
    bpt2arb_req7_valid = 0;
    bpt2arb_req7_pd = 75'h0;

    #10;
    nvdla_core_rstn = 1; // Deassert reset

    // Test sequence
    // Test 1: Valid data transfer
    arb_src7_rdy = 1; // Ready to receive
    bpt2arb_req7_pd = 75'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A; // Sample data
    bpt2arb_req7_valid = 1; // Valid data

    #10; // Wait for a clock cycle
    if (arb_src7_vld !== 1 || arb_src7_pd !== bpt2arb_req7_pd) begin
      $display("FAIL: Data transfer failed in Test 1");
      $finish;
    end

    // Test 2: Valid data transfer with ready not asserted
    arb_src7_rdy = 0; // Not ready to receive
    #10; // Wait for a clock cycle
    bpt2arb_req7_valid = 1; // Keep valid high

    #10; // Wait for a clock cycle
    if (bpt2arb_req7_ready !== 0) begin
      $display("FAIL: Ready signal should be low when arb_src7_rdy is low in Test 2");
      $finish;
    end

    // Test 3: Valid data transfer after ready is asserted again
    arb_src7_rdy = 1; // Ready to receive
    #10; // Wait for a clock cycle
    if (arb_src7_vld !== 1 || arb_src7_pd !== bpt2arb_req7_pd) begin
      $display("FAIL: Data transfer failed in Test 3");
      $finish;
    end

    // Test 4: No valid data
    bpt2arb_req7_valid = 0; // No valid data
    #10; // Wait for a clock cycle
    if (arb_src7_vld !== 0) begin
      $display("FAIL: arb_src7_vld should be low when bpt2arb_req7_valid is low in Test 4");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule