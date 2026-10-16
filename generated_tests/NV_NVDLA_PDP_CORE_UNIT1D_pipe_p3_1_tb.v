`timescale 1ns/1ps

module tb_NV_NVDLA_PDP_CORE_UNIT1D_pipe_p3;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [184:0] pipe_in_pd_d2;
  reg pipe_in_rdy_d3;
  reg pipe_in_vld_d2;
  wire [184:0] pipe_in_pd_d3;
  wire pipe_in_rdy_d2;
  wire pipe_in_vld_d3;

  // Instantiate the module under test
  NV_NVDLA_PDP_CORE_UNIT1D_pipe_p3 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .pipe_in_pd_d2(pipe_in_pd_d2),
    .pipe_in_rdy_d3(pipe_in_rdy_d3),
    .pipe_in_vld_d2(pipe_in_vld_d2),
    .pipe_in_pd_d3(pipe_in_pd_d3),
    .pipe_in_rdy_d2(pipe_in_rdy_d2),
    .pipe_in_vld_d3(pipe_in_vld_d3)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    pipe_in_rdy_d3 = 0;
    pipe_in_vld_d2 = 0;
    pipe_in_pd_d2 = 185'b0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test 1: Valid data transfer
    #10;
    pipe_in_pd_d2 = 185'hABCDE; // Example data
    pipe_in_vld_d2 = 1;
    pipe_in_rdy_d3 = 1; // Ready to accept data

    #10;
    if (pipe_in_pd_d3 !== pipe_in_pd_d2) begin
      $display("FAIL: Output data mismatch on valid transfer");
      $finish;
    end

    // Test 2: Valid data not accepted
    #10;
    pipe_in_vld_d2 = 1;
    pipe_in_rdy_d3 = 0; // Not ready to accept data

    #10;
    if (pipe_in_vld_d3 !== 1) begin
      $display("FAIL: Valid signal should remain high when not ready");
      $finish;
    end

    // Test 3: Reset behavior
    #10;
    nvdla_core_rstn = 0; // Assert reset

    #10;
    if (pipe_in_vld_d3 !== 0) begin
      $display("FAIL: Valid signal should be low after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule