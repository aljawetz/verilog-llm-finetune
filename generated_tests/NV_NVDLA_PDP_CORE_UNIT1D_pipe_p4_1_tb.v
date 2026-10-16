`timescale 1ns/1ps

module tb_NV_NVDLA_PDP_CORE_UNIT1D_pipe_p4;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [184:0] pipe_in_pd_d3;
  reg pipe_in_rdy_d4;
  reg pipe_in_vld_d3;
  wire [184:0] pipe_in_pd_d4;
  wire pipe_in_rdy_d3;
  wire pipe_in_vld_d4;

  // Instantiate the module under test
  NV_NVDLA_PDP_CORE_UNIT1D_pipe_p4 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .pipe_in_pd_d3(pipe_in_pd_d3),
    .pipe_in_rdy_d4(pipe_in_rdy_d4),
    .pipe_in_vld_d3(pipe_in_vld_d3),
    .pipe_in_pd_d4(pipe_in_pd_d4),
    .pipe_in_rdy_d3(pipe_in_rdy_d3),
    .pipe_in_vld_d4(pipe_in_vld_d4)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    pipe_in_rdy_d4 = 0;
    pipe_in_vld_d3 = 0;
    pipe_in_pd_d3 = 185'b0;

    // Release reset after 10 time units
    #10 nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid data transfer
    #10;
    pipe_in_pd_d3 = 185'hABCDE; // Example data
    pipe_in_vld_d3 = 1;
    pipe_in_rdy_d4 = 1; // Ready to receive data
    #10;

    if (pipe_in_pd_d4 !== pipe_in_pd_d3) begin
      $display("FAIL: Data mismatch on valid transfer");
      $finish;
    end

    // Test case 2: Valid data not ready
    #10;
    pipe_in_vld_d3 = 1;
    pipe_in_rdy_d4 = 0; // Not ready to receive data
    #10;

    if (pipe_in_pd_d4 !== 185'hABCDE) begin
      $display("FAIL: Data should not change when not ready");
      $finish;
    end

    // Test case 3: Reset functionality
    #10;
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    if (pipe_in_vld_d4 !== 0) begin
      $display("FAIL: Output valid should be 0 after reset");
      $finish;
    end

    // Test case 4: Check ready signal
    #10;
    pipe_in_vld_d3 = 1;
    pipe_in_rdy_d4 = 1; // Ready to receive data
    #10;

    if (pipe_in_rdy_d3 !== 1) begin
      $display("FAIL: Ready signal should be asserted");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule