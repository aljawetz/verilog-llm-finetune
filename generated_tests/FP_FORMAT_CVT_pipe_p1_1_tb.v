`timescale 1ns/1ps

module tb_FP_FORMAT_CVT_pipe_p1;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [5:0] info_pipe_in_pd_d0;
  reg info_pipe_in_rdy_d1;
  reg info_pipe_in_vld_d0;
  wire [5:0] info_pipe_in_pd_d1;
  wire info_pipe_in_rdy_d0;
  wire info_pipe_in_vld_d1;

  // Instantiate the Unit Under Test (UUT)
  FP_FORMAT_CVT_pipe_p1 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .info_pipe_in_pd_d0(info_pipe_in_pd_d0),
    .info_pipe_in_rdy_d1(info_pipe_in_rdy_d1),
    .info_pipe_in_vld_d0(info_pipe_in_vld_d0),
    .info_pipe_in_pd_d1(info_pipe_in_pd_d1),
    .info_pipe_in_rdy_d0(info_pipe_in_rdy_d0),
    .info_pipe_in_vld_d1(info_pipe_in_vld_d1)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0; // Assert reset
    info_pipe_in_pd_d0 = 6'b000000;
    info_pipe_in_rdy_d1 = 0;
    info_pipe_in_vld_d0 = 0;

    #10; // Wait for 10ns
    nvdla_core_rstn = 1; // Deassert reset

    // Test case 1: Valid data transfer
    info_pipe_in_pd_d0 = 6'b101010; // Input data
    info_pipe_in_vld_d0 = 1; // Assert valid
    #10; // Wait for one clock cycle

    // Check if output is valid and matches input
    if (info_pipe_in_vld_d1 !== 1) begin
      $display("FAIL: Output valid signal not asserted");
      $finish;
    end
    if (info_pipe_in_pd_d1 !== info_pipe_in_pd_d0) begin
      $display("FAIL: Output data does not match input data");
      $finish;
    end

    // Test case 2: Ready signal handling
    info_pipe_in_rdy_d1 = 1; // Assert ready
    #10; // Wait for one clock cycle

    // Check if output valid remains asserted
    if (info_pipe_in_vld_d1 !== 1) begin
      $display("FAIL: Output valid signal not asserted after ready");
      $finish;
    end

    // Test case 3: Valid signal deassertion
    info_pipe_in_vld_d0 = 0; // Deassert valid
    #10; // Wait for one clock cycle

    // Check if output valid is deasserted
    if (info_pipe_in_vld_d1 !== 0) begin
      $display("FAIL: Output valid signal not deasserted");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule