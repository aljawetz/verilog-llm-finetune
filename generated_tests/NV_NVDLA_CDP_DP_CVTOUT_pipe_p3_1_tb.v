`timescale 1ns/1ps

module tb_NV_NVDLA_CDP_DP_CVTOUT_pipe_p3;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [14:0] data_info_in_pd_d2;
  reg data_info_in_rdy_d3;
  reg data_info_in_vld_d2;
  wire [14:0] data_info_in_pd_d3;
  wire data_info_in_rdy_d2;
  wire data_info_in_vld_d3;

  // Instantiate the module under test (uut)
  NV_NVDLA_CDP_DP_CVTOUT_pipe_p3 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .data_info_in_pd_d2(data_info_in_pd_d2),
    .data_info_in_rdy_d3(data_info_in_rdy_d3),
    .data_info_in_vld_d2(data_info_in_vld_d2),
    .data_info_in_pd_d3(data_info_in_pd_d3),
    .data_info_in_rdy_d2(data_info_in_rdy_d2),
    .data_info_in_vld_d3(data_info_in_vld_d3)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0; // Assert reset
    data_info_in_pd_d2 = 15'b0;
    data_info_in_rdy_d3 = 0;
    data_info_in_vld_d2 = 0;

    #10;
    nvdla_core_rstn = 1; // Deassert reset

    // Test sequence
    // Test 1: Valid data transfer
    data_info_in_pd_d2 = 15'b101010101010101; // Sample data
    data_info_in_vld_d2 = 1; // Assert valid
    data_info_in_rdy_d3 = 1; // Assert ready
    #10;

    if (data_info_in_pd_d3 !== data_info_in_pd_d2 || data_info_in_vld_d3 !== 1) begin
      $display("FAIL: Data transfer failed on Test 1");
      $finish;
    end

    // Test 2: Valid data not ready
    data_info_in_vld_d2 = 1; // Assert valid
    data_info_in_rdy_d3 = 0; // Deassert ready
    #10;

    if (data_info_in_vld_d3 !== 1 || data_info_in_pd_d3 !== data_info_in_pd_d2) begin
      $display("FAIL: Data should still be valid but not transferred on Test 2");
      $finish;
    end

    // Test 3: Ready signal asserted, valid signal deasserted
    data_info_in_vld_d2 = 0; // Deassert valid
    data_info_in_rdy_d3 = 1; // Assert ready
    #10;

    if (data_info_in_vld_d3 !== 0) begin
      $display("FAIL: Valid should be deasserted on Test 3");
      $finish;
    end

    // Test 4: Reset behavior
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Deassert reset
    #10;

    if (data_info_in_vld_d3 !== 0) begin
      $display("FAIL: Valid should be 0 after reset on Test 4");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule