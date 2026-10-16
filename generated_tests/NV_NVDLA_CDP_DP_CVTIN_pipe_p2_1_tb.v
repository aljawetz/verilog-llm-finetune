`timescale 1ns/1ps

module tb_NV_NVDLA_CDP_DP_CVTIN_pipe_p2;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [22:0] data_info_in_pd_d1;
  reg data_info_in_rdy_d2;
  reg data_info_in_vld_d1;
  wire [22:0] data_info_in_pd_d2;
  wire data_info_in_rdy_d1;
  wire data_info_in_vld_d2;

  // Instantiate the Unit Under Test (UUT)
  NV_NVDLA_CDP_DP_CVTIN_pipe_p2 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .data_info_in_pd_d1(data_info_in_pd_d1),
    .data_info_in_rdy_d2(data_info_in_rdy_d2),
    .data_info_in_vld_d1(data_info_in_vld_d1),
    .data_info_in_pd_d2(data_info_in_pd_d2),
    .data_info_in_rdy_d1(data_info_in_rdy_d1),
    .data_info_in_vld_d2(data_info_in_vld_d2)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    // Initialize signals
    nvdla_core_rstn = 0;
    data_info_in_pd_d1 = 23'b0;
    data_info_in_rdy_d2 = 0;
    data_info_in_vld_d1 = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid data transfer
    #10;
    data_info_in_pd_d1 = 23'b10101010101010101010101; // Example data
    data_info_in_vld_d1 = 1;
    data_info_in_rdy_d2 = 1; // Ready to accept data
    #10;

    if (data_info_in_pd_d2 !== data_info_in_pd_d1 || data_info_in_vld_d2 !== 1) begin
      $display("FAIL: Data transfer failed in test case 1");
      $finish;
    end

    // Test case 2: Valid data not ready
    #10;
    data_info_in_vld_d1 = 1;
    data_info_in_rdy_d2 = 0; // Not ready to accept data
    #10;

    if (data_info_in_vld_d2 !== 1 || data_info_in_pd_d2 !== data_info_in_pd_d1) begin
      $display("FAIL: Data should not transfer when not ready in test case 2");
      $finish;
    end

    // Test case 3: Valid data transfer again
    #10;
    data_info_in_rdy_d2 = 1; // Ready to accept data
    #10;

    if (data_info_in_pd_d2 !== data_info_in_pd_d1 || data_info_in_vld_d2 !== 1) begin
      $display("FAIL: Data transfer failed in test case 3");
      $finish;
    end

    // Test case 4: Reset functionality
    #10;
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    if (data_info_in_vld_d2 !== 0) begin
      $display("FAIL: Output should be invalid after reset in test case 4");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule