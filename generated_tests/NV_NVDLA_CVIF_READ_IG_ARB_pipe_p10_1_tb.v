`timescale 1ns/1ps

module tb_NV_NVDLA_CVIF_READ_IG_ARB_pipe_p10;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg arb_src9_rdy;
  reg [74:0] bpt2arb_req9_pd;
  reg bpt2arb_req9_valid;
  wire [74:0] arb_src9_pd;
  wire arb_src9_vld;
  wire bpt2arb_req9_ready;

  // Instantiate the module under test (uut)
  NV_NVDLA_CVIF_READ_IG_ARB_pipe_p10 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .arb_src9_rdy(arb_src9_rdy),
    .bpt2arb_req9_pd(bpt2arb_req9_pd),
    .bpt2arb_req9_valid(bpt2arb_req9_valid),
    .arb_src9_pd(arb_src9_pd),
    .arb_src9_vld(arb_src9_vld),
    .bpt2arb_req9_ready(bpt2arb_req9_ready)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    arb_src9_rdy = 0;
    bpt2arb_req9_valid = 0;
    bpt2arb_req9_pd = 75'h0;

    // Release reset after 20ns
    #20 nvdla_core_rstn = 1;

    // Test sequence
    // Test 1: Valid data transfer
    #10;
    arb_src9_rdy = 1;
    bpt2arb_req9_pd = 75'h5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A; // Example data
    bpt2arb_req9_valid = 1;

    #10;
    if (arb_src9_vld !== 1'b1) begin
      $display("FAIL: arb_src9_vld should be high when valid data is sent");
      $finish;
    end

    if (arb_src9_pd !== bpt2arb_req9_pd) begin
      $display("FAIL: arb_src9_pd does not match bpt2arb_req9_pd");
      $finish;
    end

    // Test 2: Valid data not ready
    #10;
    arb_src9_rdy = 0; // Simulate not ready condition
    #10;
    if (bpt2arb_req9_ready !== 1'b0) begin
      $display("FAIL: bpt2arb_req9_ready should be low when arb_src9_rdy is low");
      $finish;
    end

    // Test 3: Valid data transfer with ready signal
    #10;
    arb_src9_rdy = 1; // Ready again
    #10;
    if (bpt2arb_req9_ready !== 1'b1) begin
      $display("FAIL: bpt2arb_req9_ready should be high when arb_src9_rdy is high");
      $finish;
    end

    // End of test
    #10;
    $display("PASS");
    $finish;
  end

endmodule